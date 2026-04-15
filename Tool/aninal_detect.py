import base64
import json
import logging
import os
import re
import uuid
from datetime import datetime
from pathlib import Path
import threading
from typing import Any, Dict, List, Optional, Tuple, Union

import httpx
from fastapi import FastAPI, File, UploadFile
from fastapi.responses import JSONResponse

from fastapi.middleware.cors import CORSMiddleware

def _configure_logging() -> None:
    root = logging.getLogger()
    if root.handlers:
        return
    level_name = os.getenv("LOG_LEVEL", "INFO").upper()
    level = getattr(logging, level_name, logging.INFO)
    logging.basicConfig(
        level=level,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )


_configure_logging()
log = logging.getLogger("zov.vision")


def _pictures_dir() -> Path:
    """上传审计图片目录：与 main.py 同级的 pictures/。"""
    d = Path(__file__).resolve().parent / "pictures"
    d.mkdir(parents=True, exist_ok=True)
    return d


def _save_upload_for_audit(
    kind: str,
    image_bytes: bytes,
    upload_filename: Optional[str],
    content_type: Optional[str],
) -> Optional[str]:
    """
    将本次请求图片落盘，便于追溯/复现。
    返回相对于 backend 目录的路径，例如 pictures/animal_20260204_153045_a1b2c3d4.jpg；失败则 None。
    """
    try:
        ext = ".jpg"
        if upload_filename:
            suf = Path(upload_filename).suffix.lower()
            if suf in {".jpg", ".jpeg", ".png", ".webp", ".bmp", ".gif"}:
                ext = ".jpg" if suf == ".jpeg" else suf
        elif content_type:
            ct = content_type.split(";")[0].strip().lower()
            ext = {
                "image/jpeg": ".jpg",
                "image/png": ".png",
                "image/webp": ".webp",
                "image/bmp": ".bmp",
                "image/gif": ".gif",
            }.get(ct, ".jpg")
        ts = datetime.now().strftime("%Y%m%d_%H%M%S")
        short = uuid.uuid4().hex[:8]
        safe_kind = "animal" if kind.strip().lower() == "animal" else "plant"
        name = f"{safe_kind}_{ts}_{short}{ext}"
        out = _pictures_dir() / name
        out.write_bytes(image_bytes)
        backend_base = Path(__file__).resolve().parent
        return str(out.resolve().relative_to(backend_base))
    except Exception as e:
        log.warning("[%s] saved_upload failed: %s", kind, e)
        return None


app = FastAPI(title="ZOV AI Vision API", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173",
        "http://127.0.0.1:5173",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

DASCOPE_URL = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions"
TEMPERATURE = 0.1


def _vision_vlm_model_id() -> str:
    """动植物视觉识别仅走多模态；默认 qwen3-vl-max，可用环境变量 VISION_VLM_MODEL 覆盖。"""
    return (os.getenv("VISION_VLM_MODEL", "qwen-vl-max").strip() or "qwen-vl-max")

# ------------------------------
# 视觉 RAG（CLIP 检索增强生成）
# ------------------------------

_clip_lock = threading.Lock()  # protect lazy init
_clip_ready = False  # clip model ready
_clip_animal_ready = False
_clip_plant_ready = False
_clip_model: Any = None
_clip_preprocess: Any = None
_clip_animal_index: Any = None
_clip_animal_metas: Optional[List[Dict]] = None  # 修改为 Python 3.6 兼容格式
_clip_plant_index: Any = None
_clip_plant_metas: Optional[List[Dict]] = None  # 修改为 Python 3.6 兼容格式


def _rag_clip_index_paths(kind: str) -> Tuple[Path, Path]:
    """
    解析 CLIP 向量索引路径。
    默认优先使用与 main.py 同级的子目录：
      - backend/animal/（动物）
      - backend/plant/（植物）
    每个子目录内支持：
      - animal_clip_index.faiss + animal_clip_index_meta.json（或 plant_*）
      - clip_index.faiss + clip_index_meta.json（与 build_clip_index 默认命名一致）
    仍可通过环境变量显式指定路径。
    """
    base = Path(__file__).resolve().parent
    k = kind.strip().lower()

    def _from_env(index_key: str, meta_key: str) -> Optional[Tuple[Path, Path]]:
        pi = os.getenv(index_key, "").strip()
        pm = os.getenv(meta_key, "").strip()
        if not pi or not pm:
            return None
        ip = Path(pi).expanduser().resolve()
        mp = Path(pm).expanduser().resolve()
        if ip.is_file() and mp.is_file():
            return ip, mp
        return None

    if k == "animal":
        found = _from_env("CLIP_ANIMAL_INDEX_PATH", "CLIP_ANIMAL_META_PATH")
        if found:
            return found
        d = base / "animal"
        candidates: List[Tuple[Path, Path]] = [
            (d / "animal_clip_index.faiss", d / "animal_clip_index_meta.json"),
            (d / "clip_index.faiss", d / "clip_index_meta.json"),
            (base / "animal_clip_index.faiss", base / "animal_clip_index_meta.json"),
            (base / "clip_index.faiss", base / "clip_index_meta.json"),
        ]
    else:
        found = _from_env("CLIP_PLANT_INDEX_PATH", "CLIP_PLANT_META_PATH")
        if found:
            return found
        d = base / "plant"
        candidates = [
            (d / "plant_clip_index.faiss", d / "plant_clip_index_meta.json"),
            (d / "clip_index.faiss", d / "clip_index_meta.json"),
            (base / "plant_clip_index.faiss", base / "plant_clip_index_meta.json"),
            (base / "clip_index.faiss", base / "clip_index_meta.json"),
        ]

    for ip, mp in candidates:
        if ip.is_file() and mp.is_file():
            return ip.resolve(), mp.resolve()

    if k == "animal":
        d = base / "animal"
        return (d / "animal_clip_index.faiss").resolve(), (d / "animal_clip_index_meta.json").resolve()
    d = base / "plant"
    return (d / "plant_clip_index.faiss").resolve(), (d / "plant_clip_index_meta.json").resolve()


def _to_data_url(image_bytes: bytes, content_type: Optional[str]) -> str:
    mime = content_type or "image/jpeg"
    b64 = base64.b64encode(image_bytes).decode("ascii")
    return f"data:{mime};base64,{b64}"


def _extract_first_json_object(text: str) -> Optional[Dict[str, Any]]:
    if not text:
        return None

    # Prefer code-fenced JSON.
    fence = re.search(r"```(?:json)?\s*({.*?})\s*```", text, flags=re.S | re.I)
    candidate = fence.group(1) if fence else None

    if candidate is None:
        # Fallback: first {...} block.
        m = re.search(r"({.*})", text, flags=re.S)
        candidate = m.group(1) if m else None

    if not candidate:
        return None

    candidate = candidate.strip()

    # Best-effort cleanup: remove trailing commas that sometimes appear.
    candidate = re.sub(r",\s*}", "}", candidate)
    candidate = re.sub(r",\s*]", "]", candidate)

    try:
        obj = json.loads(candidate)
        if isinstance(obj, dict):
            return obj
    except Exception:
        return None

    return None


def _empty_animal() -> Dict[str, Any]:
    return {"results": _pad_results([], "animal")}


def _empty_plant() -> Dict[str, Any]:
    return {"results": _pad_results([], "plant")}


def _get_api_key() -> Optional[str]:
    return os.getenv("API_KEY") or os.getenv("QWEN_API_KEY") or "sk-8e145407223f4293947343203f94b7bf"


async def _call_qwen3_vl_vision(image_data_url: str, mode: str) -> Optional[Dict[str, Any]]:
    """仅调用 DashScope 多模态（默认 qwen3-vl-max）；返回模型 JSON，不做白名单过滤。"""
    api_key = _get_api_key()
    if not api_key:
        return None

    if mode == "ANIMAL":
        system_prompt = (
            "你是一位专业的动物学家和野生生物学家。请根据图片识别其中最可能的动物，并给出候选结果。\n"
            "只输出一个 ```json``` 代码块，其中的 JSON 对象必须且只能包含以下一个键：\n"
            "{\n"
            '  "候选": [\n'
            "    {\n"
            '      "动物名称": "识别得到的中文名称或主要类群",\n'
            '      "识别分数": 0.92,\n'
            '      "分析": "对可见形态特征、行为、生境线索、辨识依据的详细中文说明，不少于两句。"\n'
            "    }\n"
            "  ]\n"
            "}\n"
            "约束：候选数组必须且只能包含 5 个结果，按可能性从高到低排序；识别分数必须是 0 到 1 之间的小数，表示你根据图像证据给出的置信程度；"
            "若不确定具体物种，也要给出最可能的上级类群或相近候选；键名与上述完全一致；除该 JSON 代码块外不要输出任何其他文字；字符串内容使用中文。"
        )
    else:
        system_prompt = (
            "你是一位专业的植物学家。请根据图片识别其中最可能的植物（含花卉、树木、草本等），并给出候选结果。\n"
            "只输出一个 ```json``` 代码块，其中的 JSON 对象必须且只能包含以下一个键：\n"
            "{\n"
            '  "候选": [\n'
            "    {\n"
            '      "植物名称": "识别得到的中文名称或主要类群",\n'
            '      "识别分数": 0.92,\n'
            '      "分析": "对叶、花、果、茎干、整体形态等可见特征及辨识依据的详细中文说明，不少于两句。"\n'
            "    }\n"
            "  ]\n"
            "}\n"
            "约束：候选数组必须且只能包含 5 个结果，按可能性从高到低排序；识别分数必须是 0 到 1 之间的小数，表示你根据图像证据给出的置信程度；"
            "若不确定具体物种，也要给出最可能的上级类群或相近候选；键名与上述完全一致；除该 JSON 代码块外不要输出任何其他文字；字符串内容使用中文。"
        )

    payload: Dict[str, Any] = {
        "model": _vision_vlm_model_id(),
        "messages": [
            {"role": "system", "content": system_prompt},
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": "请分析这张图片。"},
                    {"type": "image_url", "image_url": {"url": image_data_url}},
                ],
            },
        ],
        "temperature": TEMPERATURE,
    }

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {api_key}",
    }

    try:
        async with httpx.AsyncClient(timeout=120) as client:
            resp = await client.post(DASCOPE_URL, headers=headers, json=payload)
        if resp.status_code != 200:
            log.info(
                "[vision][vlm] http_status=%s body_preview=%r",
                resp.status_code,
                (resp.text or "")[:500],
            )
            return None
        data = resp.json()
        content = (
            data.get("choices", [{}])[0]
            .get("message", {})
            .get("content", "")
        )
        parsed = _extract_first_json_object(content)
        if not parsed:
            return None
        return parsed
    except Exception:
        return None


def _coerce_score(value: Any) -> float:
    try:
        score = float(value)
    except (TypeError, ValueError):
        return 0.0
    return max(0.0, min(1.0, score))


def _candidate_items(parsed: Dict[str, Any]) -> List[Dict[str, Any]]:
    raw = parsed.get("候选", parsed.get("candidates", parsed.get("results", [])))
    if isinstance(raw, list):
        return [item for item in raw if isinstance(item, dict)]
    return []


def _pad_results(results: List[Dict[str, Any]], key: str) -> List[Dict[str, Any]]:
    padded = list(results[:5])
    while len(padded) < 5:
        padded.append({
            key: "无法判断",
            "score": 0.0,
            "analysis": "模型未能给出足够明确的候选结果。",
        })
    return padded


def _vlm_body_animal(parsed: Dict[str, Any]) -> Dict[str, Any]:
    results: List[Dict[str, Any]] = []
    for item in _candidate_items(parsed):
        name = str(item.get("动物名称", item.get("animal", item.get("通俗名称", ""))) or "").strip()
        if not name:
            continue
        analysis = str(item.get("分析", item.get("analysis", "")) or "").strip()
        score = _coerce_score(item.get("识别分数", item.get("score", item.get("置信度", 0.0))))
        results.append({
            "animal": name,
            "score": score,
            "analysis": analysis,
        })
    results.sort(key=lambda x: x["score"], reverse=True)
    return {
        "results": _pad_results(results, "animal"),
    }


def _vlm_body_plant(parsed: Dict[str, Any]) -> Dict[str, Any]:
    results: List[Dict[str, Any]] = []
    for item in _candidate_items(parsed):
        name = str(item.get("植物名称", item.get("plant", item.get("中文名称", item.get("chinese_name", "")))) or "").strip()
        if not name:
            continue
        analysis = str(item.get("分析", item.get("analysis", "")) or "").strip()
        score = _coerce_score(item.get("识别分数", item.get("score", item.get("置信度", 0.0))))
        results.append({
            "plant": name,
            "score": score,
            "analysis": analysis,
        })
    results.sort(key=lambda x: x["score"], reverse=True)
    return {
        "results": _pad_results(results, "plant"),
    }


async def _vision_animal_impl(
    image: Optional[UploadFile],
    file: Optional[UploadFile],
) -> JSONResponse:
    try:
        img = image or file
        if not img:
            return JSONResponse(_empty_animal())

        image_bytes = await img.read()
        if not image_bytes:
            return JSONResponse(_empty_animal())

        saved_path = _save_upload_for_audit("animal", image_bytes, img.filename, img.content_type)
        if saved_path:
            log.info(
                "[animal] saved_upload path=%s original_filename=%r bytes=%s",
                saved_path,
                img.filename,
                len(image_bytes),
            )

        image_data_url = _to_data_url(image_bytes, img.content_type)
        log.info(
            "[animal] vlm-only model=%s saved_upload=%s bytes=%s",
            _vision_vlm_model_id(),
            saved_path or "-",
            len(image_bytes),
        )
        parsed = await _call_qwen3_vl_vision(image_data_url, "ANIMAL")
        if not parsed:
            log.info(
                "[animal] vlm empty_reason=no_parse_or_api_fail saved_upload=%s",
                saved_path or "-",
            )
            return JSONResponse(_empty_animal())

        body = _vlm_body_animal(parsed)
        top = body["results"][0]["animal"] if body["results"] else ""
        log.info(
            "[animal] response vlm top=%r candidates=%s saved_upload=%s bytes=%s",
            top,
            len(body["results"]),
            saved_path or "-",
            len(image_bytes),
        )
        return JSONResponse(body)
    except Exception:
        log.exception("[animal] unhandled error -> empty json")
        return JSONResponse(_empty_animal())


@app.post("/v1/vision/animal")
async def vision_animal(
    image: Optional[UploadFile] = File(default=None),
    file: Optional[UploadFile] = File(default=None),
) -> JSONResponse:
    return await _vision_animal_impl(image, file)


async def _vision_plant_impl(
    image: Optional[UploadFile],
    file: Optional[UploadFile],
) -> JSONResponse:
    try:
        img = image or file
        if not img:
            return JSONResponse(_empty_plant())

        image_bytes = await img.read()
        if not image_bytes:
            return JSONResponse(_empty_plant())

        saved_path = _save_upload_for_audit("plant", image_bytes, img.filename, img.content_type)
        if saved_path:
            log.info(
                "[plant] saved_upload path=%s original_filename=%r bytes=%s",
                saved_path,
                img.filename,
                len(image_bytes),
            )

        image_data_url = _to_data_url(image_bytes, img.content_type)
        log.info(
            "[plant] vlm-only model=%s saved_upload=%s bytes=%s",
            _vision_vlm_model_id(),
            saved_path or "-",
            len(image_bytes),
        )
        parsed = await _call_qwen3_vl_vision(image_data_url, "PLANT")
        if not parsed:
            log.info(
                "[plant] vlm empty_reason=no_parse_or_api_fail saved_upload=%s",
                saved_path or "-",
            )
            return JSONResponse(_empty_plant())

        body = _vlm_body_plant(parsed)
        top = body["results"][0]["plant"] if body["results"] else ""
        log.info(
            "[plant] response vlm top=%r candidates=%s saved_upload=%s bytes=%s",
            top,
            len(body["results"]),
            saved_path or "-",
            len(image_bytes),
        )
        return JSONResponse(body)
    except Exception:
        log.exception("[plant] unhandled error -> empty json")
        return JSONResponse(_empty_plant())


@app.post("/v1/vision/plant")
async def vision_plant(
    image: Optional[UploadFile] = File(default=None),
    file: Optional[UploadFile] = File(default=None),
) -> JSONResponse:
    return await _vision_plant_impl(image, file)


@app.get("/healthz")
async def healthz() -> Dict[str, str]:
    return {"status": "ok"}
