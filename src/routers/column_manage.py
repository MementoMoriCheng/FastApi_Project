#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/11/28 11:05
# @Author  : yilifeng
# @File    : column_manage.py
# @Software: PyCharm

from src.db.dals import ExecDAL
from src.db.models import MenuManage
from fastapi import APIRouter, Depends
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.db.models import ColumnManage, TableManage
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.responses import resp_200, resp_404, resp_500, resp_406, resp_400
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode, COLUMN_LENGTH
from src.db.schemas.column_manage import (
    CreateColumnManage, ColumnManageSchema, UpdateColumnManage, ColumnListSchema, SortColumnManage
)

router = APIRouter()


@router.get("/", tags=["ColumnManage"], summary="获取所有列信息")
async def list_columns(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                       table_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str):
    table_dal.setDb(TableManage)
    table_res = await table_dal.get_by(code=code)
    if not table_res:
        return resp_200(data=[])

    dal.setDb(ColumnManage)
    res = await dal.get_by_all(table_id=table_res.id, is_delete=RESERVE)
    if not res:
        return resp_200(data=[])
    data = [ColumnListSchema.from_orm(ms) for ms in res]

    return resp_200(data=data)


@router.get("/table/{table_id}", tags=["ColumnManage"], summary="通过table_id获取列信息")
async def get_column_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, table_id: str):
    dal.setDb(ColumnManage)
    logger.debug(f"通过table_id获取列信息:{table_id}")
    res = await dal.get_by_all(table_id=table_id, is_delete=RESERVE)
    if not res:
        return resp_200(data=res)
    data = [ColumnManageSchema.from_orm(ms) for ms in res]
    return resp_200(data=data)


@router.get("/{id}", tags=["ColumnManage"], summary="通过id获取表一列信息")
async def get_column_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id: str):
    dal.setDb(ColumnManage)
    logger.debug(f"通过id获取表一列信息:{id}")
    res = await dal.get(id)
    if not res:
        return resp_404()

    return resp_200(data=ColumnManageSchema.from_orm(res))


@router.post("/", tags=["ColumnManage"], summary="创建数据库表的列")
async def create_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                        table_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: CreateColumnManage):
    table_dal.setDb(TableManage)
    dal.setDb(ColumnManage)
    logger.info(f"创建数据库表的列:{obj_in.dict()}")
    table_res = await table_dal.get(obj_in.table_id)
    if not table_res:
        return resp_404()

    table_code = f"auto_{table_res.code}"
    if not obj_in.is_parent:
        try:
            obj_in.save_length = obj_in.field_length
            if obj_in.association:
                obj_in.field_length = COLUMN_LENGTH
                try:
                    col_infos = await dal.get_by(code=obj_in.association[0].get("tableCol"))
                    obj_in.save_length = col_infos.field_length
                except Exception as e:
                    logger.error(e)
            sql_handle.upgrade_columns(table_code, obj_in.code, obj_in.type, obj_in.field_length)
            await sql_handle.change_columns(table_code, obj_in.code, obj_in)
            sql_handle.add_foreign_key(table_code, obj_in.code, obj_in.association)
            sql_handle.refresh_metadata()
        except Exception as e:
            # 删除列
            sql_handle.downgrade_columns(table_code, [obj_in.code])
            return resp_400(msg=str(e))

    res = await dal.create(obj_in)
    if not res:
        return resp_404()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
                                             handle_user=obj_in.create_user, handle_params=obj_in.dict(),
                                             entity_id=res.id, handle_reason='创建数据库表的列')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)


@router.delete("/{id_}", tags=["ColumnManage"], summary="删除数据库表的列")
async def delete_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                        table_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                        *, id_: str):
    dal.setDb(ColumnManage)
    logger.info(f"删除数据库表的列:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    table_dal.setDb(TableManage)
    ts = await table_dal.get(ms.table_id)
    if not ms:
        return resp_404()

    table_name = f"auto_{ts.code}"
    sql_handle.downgrade_columns(table_name, [ms.code])

    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="column_manage",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除数据库表的列')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/{id_}", tags=["ColumnManage"], summary="修改数据库表的列")
async def update_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                        table_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateColumnManage):
    if not obj_in.dict(exclude_none=True):
        return resp_200()
    dal.setDb(ColumnManage)
    logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404()

    table_dal.setDb(TableManage)
    table_res = await table_dal.get(ms.table_id)
    if not table_res:
        return resp_404()

    res = await dal.update(id_, obj_in)
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
                                             handle_user=obj_in.update_user, handle_params=obj_in.dict(),
                                             entity_id=id_, handle_reason='修改数据库表的列')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)


@router.post("/sort", tags=["ColumnManage"], summary="数据库列：排序")
async def sort_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: SortColumnManage):
    if obj_in is not None and len(obj_in.columns) > 0:
        table_code = obj_in.table_code
        if table_code == 'column_manage':
            dal.setDb(ColumnManage)
        elif table_code == 'menu_manage':
            dal.setDb(MenuManage)

        for item in obj_in.columns:
            await dal.update(item.id, {"sort": item.sort})
        return resp_200(data='200')
    else:
        return resp_406(msg='请求参数错误')
