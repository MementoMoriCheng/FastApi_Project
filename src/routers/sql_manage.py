#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 22:36
# @Author  : yilifeng
# @File    : sql_manage.py
# @Software: PyCharm


from fastapi import APIRouter, Depends

from src.db.dals import ExecDAL
from src.utils.responses import resp_200
from src.utils.dependencies import DALGetter

router = APIRouter()


@router.post('/check', tags=['SqlManage'], summary="检查定义的数据库表及表关系是否正确")
async def check_tables(dal: ExecDAL = Depends(DALGetter(ExecDAL))):
    # 检查当前设置的数据库表及表关系是否正确
    return resp_200()


@router.post('/', tags=['SqlManage'], summary="修改了数据库表字段后重新同步修改表")
async def auto_create_tables(dal: ExecDAL = Depends(DALGetter(ExecDAL))):
    # 根据当前设置的参数建数据库所有表，注意已存在的数据库表应当使用update，且不能破坏已有数据
    return resp_200()


@router.post('/{table_name}', tags=['SqlManage'], summary="创建数据库表")
async def create_table_by_table_name(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, table_name: str):
    # 根据当前设置的参数建数据库一个表，注意已存在的数据库表应当使用update，且不能破坏已有数据
    return resp_200()


@router.get('/{table_name}', tags=['SqlManage'], summary="通过表名获取表格包含的所有字段")
async def get_column_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, table_name: str):
    # 根据数据库表名获取表包含的字段
    return resp_200()
