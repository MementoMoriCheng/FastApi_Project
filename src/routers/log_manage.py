#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    : log_manage.py
# @Software: PyCharm
from datetime import datetime

from fastapi import APIRouter, Depends, Query

from src.db.dals import ExecDAL, SortBy
from src.db.models import LogManage
from src.utils.responses import resp_200, resp_404
from src.utils.dependencies import DALGetter

router = APIRouter()


@router.get("", tags=['LogManage'], summary="获取操作日志列表")
async def list_do_log(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        limit: int = Query(default=30),
        offset: int = Query(default=0),
        start_datetime: datetime = Query(None),
        end_datetime: datetime = Query(None)
):
    dal.setDb(LogManage)
    list_ms = await dal.get_by_all(limit=limit, offset=offset, create_time__gte=start_datetime,
                                   order_by_list=[SortBy('sort', False), SortBy('create_time', False)],
                                   create_time__lte=end_datetime)
    return resp_200(data=list_ms)


@router.delete("/{id_}", tags=["LogManage"], summary="删除操作日志")
async def delete_do_log(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(LogManage)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='日志信息不存在！')
    await dal.delete(id_)
    return resp_200(data={'id': id_})
