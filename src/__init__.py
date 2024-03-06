#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 10:32
# @Author  : yilifeng
# @File    : __init__.py
# @Software: PyCharm
import subprocess
import time
import os
import asyncio
import traceback
from starlette.middleware.cors import CORSMiddleware
from fastapi import FastAPI, Request, Depends
from fastapi.responses import JSONResponse, FileResponse
from fastapi.staticfiles import StaticFiles
from fastapi.exception_handlers import http_exception_handler

from src.routers import api_router
from src.config.setting import settings
from src.utils.authentication import verify_token
from src.utils.logger import logger
from src.utils.ftp_util import FTPError
from src.utils.udp_service import UDPService

from src.utils.udp_service import u_s


def create_application() -> FastAPI:
    # 等待其他组件启动完成
    # time.sleep(3)
    application = FastAPI(
        title="飞训训练系统",
        # dependencies=[Depends(verify_token)]
    )
    application.include_router(api_router, prefix="/api")
    register_middleware(application)
    register_static(application)
    register_exception_handler(application)
    register_event(application)
    return application


def register_middleware(application):
    if settings.BACKEND_CORS_ORIGINS:
        application.add_middleware(
            CORSMiddleware,
            allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
            allow_credentials=True,
            allow_methods=["*"],
            allow_headers=["*"],
        )

    @application.middleware("http")
    async def add_process_time_header(request: Request, call_next):
        start_time = time.time()
        response = await call_next(request)
        process_time = time.time() - start_time
        response.headers["X-Process-Time"] = str(process_time)
        return response

    @application.middleware("http")
    async def log_request(request: Request, call_next):
        response = await call_next(request)
        logger.debug(
            f"{request.client.host} - [{request.method} {request.url.path} {request.query_params}] {response.status_code}"
        )
        return response


def register_static(app):
    # 挂载静态文件
    backend = os.path.dirname(os.path.abspath(__file__))
    app.mount("/static", StaticFiles(directory=os.path.join(backend, "static")))

    @app.get("/")
    async def read_index():
        return FileResponse(os.path.join(backend, "static", "index.html"))

    @app.exception_handler(404)
    async def not_found(request: Request, exc):
        accept = request.headers.get("accept")
        if not accept:
            return await http_exception_handler(request, exc)
        if exc.status_code == 404 and "text/html" in accept:
            return FileResponse(os.path.join(backend, "static", "index.html"))
        else:
            return await http_exception_handler(request, exc)


def register_exception_handler(app):
    @app.exception_handler(500)
    async def log_internal_error(request: Request, exc):
        logger.error(
            f"{request.client.host} - [{request.method} {request.url.path} {request.query_params}]"
        )
        logger.error(exc)
        logger.error(traceback.format_exc())

    @app.exception_handler(FTPError)
    async def ftp_error(request: Request, exc):
        return JSONResponse(content={"detail": "Not Found"}, status_code=404)


def register_event(app):
    @app.on_event("startup")
    async def startup_event():
        print("startup UDP service.")
        loop = asyncio.get_running_loop()
        asyncio.create_task(u_s.start(loop))
        asyncio.create_task(u_s.connect_to_remote_server(loop))

    @app.on_event("shutdown")
    async def shutdown_event():
        await u_s.stop()
