import asyncio
import json
import logging
import os
import pathlib
import shutil
import subprocess
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from typing import List, Optional, Tuple
from fastapi import BackgroundTasks, FastAPI, HTTPException
from minio import Minio
from pydantic import BaseModel
from starlette.concurrency import run_in_threadpool

app = FastAPI()
logger = logging.getLogger(__name__)

DEFAULT_FFMPEG_DIR = os.getenv("FFMPEG_DIR", "")
MAX_CONCURRENT_DOWNLOADS = 8
NORMALIZED_SAMPLE_RATE = 16000
NORMALIZED_CHANNELS = 1


class MinioConfig(BaseModel):
    endpoint: str
    accessKey: str
    secretKey: str
    bucket: str


class MergeAudioRequest(BaseModel):
    interviewInstId: str
    minio: MinioConfig
    callback_url: str
    audio_urls: List[str]


def _resolve_tool(env_name: str, executable: str) -> Optional[str]:
    configured_path = os.getenv(env_name)
    if configured_path:
        return configured_path if os.path.exists(configured_path) else None

    if DEFAULT_FFMPEG_DIR:
        executable_name = executable + (".exe" if os.name == "nt" else "")
        bundled_path = os.path.join(DEFAULT_FFMPEG_DIR, executable_name)
        if os.path.exists(bundled_path):
            return bundled_path

    return shutil.which(executable)


def _check_audio_tools() -> str:
    ffmpeg_path = _resolve_tool("FFMPEG_BINARY", "ffmpeg")
    ffprobe_path = _resolve_tool("FFPROBE_BINARY", "ffprobe")

    missing = []
    if not ffmpeg_path:
        missing.append("ffmpeg")
    if not ffprobe_path:
        missing.append("ffprobe")
    if missing:
        raise HTTPException(
            status_code=500,
            detail=(
                "处理失败: 缺少音频处理工具 "
                + ", ".join(missing)
                + "。请安装 FFmpeg，并确认 ffmpeg.exe/ffprobe.exe 已加入 PATH；"
                  "或设置 FFMPEG_BINARY、FFPROBE_BINARY 为对应 exe 的完整路径。"
            ),
        )

    ffmpeg_dir = os.path.dirname(ffmpeg_path)
    if ffmpeg_dir and ffmpeg_dir not in os.environ.get("PATH", ""):
        os.environ["PATH"] = ffmpeg_dir + os.pathsep + os.environ.get("PATH", "")

    return ffmpeg_path


def _get_audio_format(audio_url: str) -> str:
    path = urllib.parse.urlparse(audio_url).path
    file_format = path.rsplit(".", 1)[-1].lower()
    if file_format not in {"mp3", "wav", "ogg", "m4a"}:
        raise HTTPException(status_code=400, detail=f"不支持的音频格式: {audio_url}")
    return file_format


def _download_audio_to_file(audio_url: str, target_path: str) -> None:
    parsed_url = urllib.parse.urlparse(audio_url)
    if parsed_url.scheme not in {"http", "https"} or not parsed_url.netloc:
        raise HTTPException(status_code=400, detail=f"无效的音频地址: {audio_url}")

    try:
        request = urllib.request.Request(audio_url, headers={"User-Agent": "voice-merge/1.0"})
        with urllib.request.urlopen(request, timeout=30) as response:
            with open(target_path, "wb") as audio_file:
                shutil.copyfileobj(response, audio_file)
    except urllib.error.HTTPError as e:
        raise HTTPException(status_code=400, detail=f"获取音频失败: {audio_url}，HTTP {e.code}") from e
    except urllib.error.URLError as e:
        raise HTTPException(status_code=400, detail=f"获取音频失败: {audio_url}，{e.reason}") from e


def _run_ffmpeg(command: List[str]) -> None:
    result = subprocess.run(command, capture_output=True, text=True)
    if result.returncode != 0:
        error = result.stderr.strip() or result.stdout.strip() or "未知错误"
        raise RuntimeError(error)


def _normalize_audio(ffmpeg_path: str, source_path: str, target_path: str) -> None:
    _run_ffmpeg(
        [
            ffmpeg_path,
            "-y",
            "-i",
            source_path,
            "-ac",
            str(NORMALIZED_CHANNELS),
            "-ar",
            str(NORMALIZED_SAMPLE_RATE),
            "-c:a",
            "pcm_s16le",
            target_path,
        ]
    )


def _write_concat_file(concat_file_path: str, audio_paths: List[str]) -> None:
    with open(concat_file_path, "w", encoding="utf-8") as concat_file:
        for audio_path in audio_paths:
            safe_path = pathlib.Path(audio_path).as_posix().replace("'", "\\'")
            concat_file.write(f"file '{safe_path}'\n")


def _merge_audio_files(ffmpeg_path: str, concat_file_path: str, output_path: str) -> None:
    _run_ffmpeg(
        [
            ffmpeg_path,
            "-y",
            "-f",
            "concat",
            "-safe",
            "0",
            "-i",
            concat_file_path,
            "-c:a",
            "pcm_s16le",
            output_path,
        ]
    )


def _create_minio_client(config: MinioConfig) -> Tuple[Minio, str]:
    parsed_endpoint = urllib.parse.urlparse(config.endpoint)
    if parsed_endpoint.scheme:
        if parsed_endpoint.scheme not in {"http", "https"}:
            raise HTTPException(status_code=400, detail=f"不支持的 MinIO endpoint 协议: {config.endpoint}")
        endpoint = parsed_endpoint.netloc
        secure = parsed_endpoint.scheme == "https"
    else:
        endpoint = config.endpoint
        secure = False

    if not endpoint:
        raise HTTPException(status_code=400, detail="MinIO endpoint 不能为空")

    client = Minio(
        endpoint,
        access_key=config.accessKey,
        secret_key=config.secretKey,
        secure=secure,
    )
    public_endpoint = config.endpoint.rstrip("/")
    return client, public_endpoint


def _upload_audio_to_minio(config: MinioConfig, file_path: str, object_name: str) -> dict:
    client, public_endpoint = _create_minio_client(config)
    result = client.fput_object(
        bucket_name=config.bucket,
        object_name=object_name,
        file_path=file_path,
        content_type="audio/wav",
    )
    url = f"{public_endpoint}/{config.bucket}/{object_name}"
    return {
        "bucket": config.bucket,
        "object_name": object_name,
        "url": url,
        "etag": getattr(result, "etag", None),
        "version_id": getattr(result, "version_id", None),
        "content_type": "audio/wav",
    }


def _post_callback(callback_url: str, body: dict) -> dict:
    request = urllib.request.Request(
        callback_url,
        data=json.dumps(body).encode("utf-8"),
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            response_body = response.read().decode("utf-8", errors="replace")
            return {
                "status_code": response.status,
                "body": response_body,
            }
    except urllib.error.HTTPError as e:
        error_body = e.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"回调失败: HTTP {e.code}, {error_body}") from e
    except urllib.error.URLError as e:
        raise RuntimeError(f"回调失败: {e.reason}") from e


async def _prepare_audio_file(
    index: int,
    audio_url: str,
    temp_dir: str,
    ffmpeg_path: str,
    semaphore,
) -> Tuple[int, str]:
    async with semaphore:
        file_format = _get_audio_format(audio_url)
        source_path = os.path.join(temp_dir, f"{index:06d}.source.{file_format}")
        normalized_path = os.path.join(temp_dir, f"{index:06d}.normalized.wav")

        await run_in_threadpool(_download_audio_to_file, audio_url, source_path)
        await run_in_threadpool(_normalize_audio, ffmpeg_path, source_path, normalized_path)
        return index, normalized_path


async def _run_merge_audio_job(request: MergeAudioRequest) -> None:
    """
    接收多个音频 URL，按顺序合并，上传到 MinIO，并回调业务接口。
    """
    temp_dir = tempfile.mkdtemp(prefix="voice_merge_")

    try:
        ffmpeg_path = _check_audio_tools()
        semaphore = asyncio.Semaphore(MAX_CONCURRENT_DOWNLOADS)
        prepared_files = await asyncio.gather(
            *[
                _prepare_audio_file(index, audio_url, temp_dir, ffmpeg_path, semaphore)
                for index, audio_url in enumerate(request.audio_urls)
            ]
        )

        ordered_audio_paths = [
            audio_path for _, audio_path in sorted(prepared_files, key=lambda item: item[0])
        ]
        concat_file_path = os.path.join(temp_dir, "concat.txt")
        output_path = os.path.join(temp_dir, "merged_audio.wav")

        _write_concat_file(concat_file_path, ordered_audio_paths)
        await run_in_threadpool(_merge_audio_files, ffmpeg_path, concat_file_path, output_path)

        object_name = f"voice_merge/{request.interviewInstId}.wav"
        minio_result = await run_in_threadpool(
            _upload_audio_to_minio,
            request.minio,
            output_path,
            object_name,
        )
        callback_body = {
            "interviewInstId": request.interviewInstId,
            "url": minio_result["url"],
        }
        callback_result = await run_in_threadpool(
            _post_callback,
            request.callback_url,
            callback_body,
        )
        logger.info(
            "merge audio job completed: interviewInstId=%s, url=%s, callback_status=%s",
            request.interviewInstId,
            minio_result["url"],
            callback_result["status_code"],
        )
    except Exception as e:
        logger.exception(
            "merge audio job failed: interviewInstId=%s, error=%s",
            request.interviewInstId,
            e,
        )
    finally:
        shutil.rmtree(temp_dir, ignore_errors=True)

@app.post("/merge-audios")
async def merge_audios_api(request: MergeAudioRequest, background_tasks: BackgroundTasks):
    """
    接收多个音频 URL 后立即返回，后台按顺序合并、上传到 MinIO，并回调业务接口。
    """
    if not request.audio_urls:
        raise HTTPException(status_code=400, detail="没有提供音频地址")

    background_tasks.add_task(_run_merge_audio_job, request)
    return {
        "success": True,
        "interviewInstId": request.interviewInstId,
        "message": "任务已提交",
    }


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)
