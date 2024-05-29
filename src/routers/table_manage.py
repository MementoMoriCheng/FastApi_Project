#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/11/28 11:05
# @Author  : yilifeng
# @File    : column_manage.py
# @Software: PyCharm

from fastapi import APIRouter, Depends, Query
from src.db.dals import ExecDAL
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.responses import resp_200, resp_404, resp_500, resp_403
from src.utils.dependencies import DALGetter
from src.db.models import TableManage
from src.db.schemas.table_manage import CreateTableManage, UpdateTableManage, TableManageSchema
from src.utils.sql_config import sql_handle
from src.static import table_schema
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode

router = APIRouter()


@router.get('/{id_}', tags=['TableManage'], summary="通过id获取表的信息")
async def get_table_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(TableManage)
    res = await dal.get(id_)
    logger.debug(f"通过id:{id_}获取表的信息")
    if not res:
        return resp_404()

    return resp_200(data=TableManageSchema.from_orm(res))


@router.get('/code/{code}', tags=['TableManage'], summary="通过code获取表的信息")
async def get_table_info_by_code(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str):
    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    logger.debug(f"通过code:{code}获取表的信息")
    if not res:
        return resp_404()

    return resp_200(data=TableManageSchema.from_orm(res))


@router.get('', tags=['TableManage'], summary="获取所有表的信息")
async def list_table_info(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
        limit: int = Query(None),
        offset: int = Query(None)):
    dal.setDb(TableManage)
    res = await dal.get_by_all(limit=limit, offset=offset, is_delete=RESERVE)
    data = [TableManageSchema.from_orm(ms) for ms in res]
    sorted_data = sorted(data, key=lambda x: x.create_time, reverse=True)

    return resp_200(data={"data": sorted_data, "total": len(res)})


@router.post('', tags=['TableManage'], summary="创建数据库表")
async def create_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: CreateTableManage):
    dal.setDb(TableManage)
    obj_in.code = obj_in.code.lower()
    logger.info(f"创建数据库表:{obj_in.dict()}")
    exist_res = await dal.get_by(code=obj_in.code)
    if exist_res:
        return resp_403(msg=f"{obj_in.name} is existed!")

    table_name = f"auto_{obj_in.code}"
    columns_config = {key: table_schema[key] for key in obj_in.dict() if key in table_schema}
    sql_handle.create_dynamic_table_core(table_name, columns_config)

    res = await dal.create(obj_in)
    if not res:
        return resp_404()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=obj_in.code,
                                             handle_user=obj_in.create_user, handle_params=obj_in.dict(),
                                             entity_id=res.id, handle_reason='创建数据库表')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)


@router.delete('/{id_}', tags=['TableManage'], summary="删除数据库表")
async def delete_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(TableManage)
    logger.info(f"删除数据库表:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    update_data = UpdateTableManage(is_delete=DELETE)
    res = await dal.update(id_, update_data)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=ms.code,
                                             handle_user="", handle_params=id_,
                                             entity_id=id_, handle_reason='删除数据库表')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch('/{id_}', tags=['TableManage'], summary="编辑数据库表")
async def update_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateTableManage):
    dal.setDb(TableManage)
    ms = await dal.get(id_)
    logger.info(f"编辑数据库表:{obj_in.dict()}")
    if not ms:
        return resp_404()
    if not obj_in.dict(exclude_none=True):
        return resp_200()
    res = await dal.update(id_, obj_in)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=obj_in.code,
                                             handle_user=obj_in.update_user, handle_params=obj_in.dict(),
                                             entity_id=id_, handle_reason='编辑数据库表')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)
