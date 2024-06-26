#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/8 17:11
# @Author  : yilifeng
# @File    : data_handle.py
# @Software: PyCharm
from src.db.dals import ExecDAL
from fastapi import APIRouter, Depends, Query
from src.db.models.data_handle import DataHandle
from src.db.schemas.data_hanle import DataHandleSchemas
from src.utils.ftp_util import RemoteFTPService
from src.utils.responses import resp_200, resp_404
from src.utils.dependencies import DALGetter

router = APIRouter()


@router.get('', tags=['DataHandle'], summary="获取操作列表数据")
async def get_handle_datas(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, limit: int = Query(None),
                           offset: int = Query(None)):
    dal.setDb(DataHandle)
    res = await dal.get_by_all(limit=limit, offset=offset)
    datas = []
    for ms in res:
        data = DataHandleSchemas.from_orm(ms)
        datas.append(data)
    return resp_200(data={"data": datas, "total": len(datas)})


@router.delete('', tags=['DataHandle'], summary="删除操作数据")
async def delete_handle_datas(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(DataHandle)
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    await dal.delete(id_)

    if str(ms.handle_type) != "4":
        ftp_util = RemoteFTPService()
        ftp_util.ftp_remove_file(ms.url)

    return resp_200(data={'id': id_})
