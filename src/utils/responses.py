#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 11:19
# @Author  : yilifeng
# @File    : responses.py
# @Software: PyCharm

from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from fastapi import status


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

    # 试验数据
    NO_MATCH_TABLE_TEMPLATE = 1001  # 追加上传数据时，表头不匹配

    # 搜索词
    DUPLICATE_WORD = 4001  # 重复的搜索词

    MCQ_RESULT_DIRECTORY_NOT_EXISTS = 4002  # 材料没有对应的 MCQ 计算结果文件夹，无法导出


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


def resp_500(msg="INTERNAL SERVER ERROR"):
    return JSONResponse(
        content={"detail": msg},
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
    )
