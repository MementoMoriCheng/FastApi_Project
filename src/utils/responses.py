#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 11:19
# @Author  : yilifeng
# @File    : responses.py
# @Software: PyCharm
import datetime

import jwt
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from fastapi import status
import httpx

from src.config.setting import settings


class BusinessStatusCode:
    """业务状态码"""

    SUCCESS = 0
    FAIL = -1

    OTHER_ERR = 9999

    INSERT_DB_ERR = 9994
    QUERY_DB_ERR = 9993
    DELETE_DB_ERR = 9992
    UPDATE_DB_ERR = 9991
    OTHER_DB_ERR = 9990

    REQUEST_SUCCESS = 200
    REQUEST_PARAMETER_ERROR = 406


def resp_200(*, code=BusinessStatusCode.SUCCESS, data=None, msg="OK"):
    return JSONResponse(
        content={"code": code, "data": jsonable_encoder(data), "msg": msg},
        status_code=status.HTTP_200_OK,
    )


def resp_404(msg="Not Found"):
    return JSONResponse(
        content={"detail": msg},
        status_code=status.HTTP_404_NOT_FOUND,
    )


def resp_400(msg="Bad Request"):
    return JSONResponse(
        content={"detail": msg}, status_code=status.HTTP_400_BAD_REQUEST
    )


def resp_422(msg="Unprocessable Entity"):
    return JSONResponse(
        content={"detail": msg},
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
    )


def resp_403(msg="Forbidden"):
    return JSONResponse(
        content={"detail": msg},
        status_code=status.HTTP_403_FORBIDDEN,
    )


def resp_406(msg="Request parameter error"):
    """
    业务定义错误状态，非HTTP状态
    """
    return JSONResponse(
        content={"code": BusinessStatusCode.REQUEST_PARAMETER_ERROR, "detail": msg},
        status_code=status.HTTP_400_BAD_REQUEST,
    )


def resp_500(msg="INTERNAL SERVER ERROR"):
    return JSONResponse(
        content={"detail": msg},
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
    )


def generate_service_token():
    """
    生成用于服务调用的 token
    Returns:

    """
    now = datetime.datetime.utcnow()
    exp_dt = now + datetime.timedelta(minutes=3)
    payload = {
        "exp": exp_dt,
        "iat": now,  # 签发时间
        "iss": "mvt",  # 签名
        "app": settings.APP_NAME,
    }
    token = jwt.encode(payload, key=settings.SECRET_KEY, algorithm="HS256")
    return token


async def fetch_external_data(url: str, data):
    async with httpx.AsyncClient() as client:
        json_data = [item if isinstance(item, str) else item.dict() for item in data]
        response = await client.post(url, headers={"Authorization": f"Bearer {generate_service_token()}"},
                                     json=json_data)
        if response.status_code == 200:
            return response.json()
        else:
            return {"error": "Failed to fetch external data"}


async def fetch_external_upload_file(url: str, file_path, user_id=None, extra_data=None):
    async with httpx.AsyncClient() as client:
        with open(file_path, 'rb') as f:
            files = {'file': f}
            url = f"{url}?user_id={user_id}&extra_data={extra_data}"
            response = await client.post(
                headers={"Authorization": f"Bearer {generate_service_token()}"},
                url=url, files=files, data={}, timeout=None
            )
            if response.status_code == 200:
                return response.json()
            else:
                return {"error": "Failed to fetch external data"}
