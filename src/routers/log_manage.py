#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    : log_manage.py
# @Software: PyCharm
from datetime import datetime
from typing import List
from fastapi import APIRouter, Depends, Query

from src.db.dals import ExecDAL, SortBy
from src.db.models import LogManage
from src.utils.responses import resp_200, resp_404, resp_400
from src.utils.dependencies import DALGetter

router = APIRouter()


@router.get("", tags=['LogManage'], summary="获取操作日志列表")
async def list_do_log(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        limit: int = Query(default=30), offset: int = Query(default=0), desc: bool = Query(default=True),
        start_datetime: datetime = Query(None), end_datetime: datetime = Query(None)):
    dal.setDb(LogManage)
    conditions = {"limit": limit, "offset": offset, "order_by_list": [SortBy('create_time', desc)]}
    if start_datetime and end_datetime:
        conditions.update({"create_time__gte": start_datetime, "create_time__lte": end_datetime})
    list_ms = await dal.get_by_all(**conditions)
    return resp_200(data=list_ms)


@router.delete("", tags=["LogManage"], summary="删除操作日志")
async def delete_do_log(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, ids: List[str]):
    if not ids:
        return resp_400()
    dal.setDb(LogManage)
    count = await dal.delete_batch(ids)
    if not count:
        return resp_404(msg='日志信息不存在！')
    return resp_200(data=count)
