#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 22:55
# @Author  : yilifeng
# @File    : sql_handle.py
# @Software: PyCharm
from src.db.dals import ExecDAL
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.responses import resp_200, resp_404
from src.db.models import TableManage, ColumnManage
from fastapi import APIRouter, Depends, Query
from src.utils.constant import RESERVE, SON, RecordsStatusCode
from src.utils.logger import logger, generate_mysql_log_data

router = APIRouter()


@router.get('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名和数据id获取数据详细信息")
async def get_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                   column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, id_: str):
    dal.setDb(TableManage)
    logger.debug(f"通过表名和数据id获取数据详细信息:{code}:{id_}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE)
    if not column_res:
        return resp_200(data=column_res)
    fields_data = [con.code for con in column_res]
    if "id" not in fields_data:
        fields_data.append("id")
    select_conditions = {"id": id_}
    table_name = f"auto_{res.code}"
    data_info = await sql_handle.select(table_name, fields=fields_data, conditions=select_conditions)
    if not data_info:
        return resp_404(msg="未能获取到表信息")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
                                             handle_user="", handle_params={"id": id_, "table_code": code},
                                             entity_id=id_, handle_reason='通过表名和数据id获取数据详细信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=data_info)


@router.get('/{code}', tags=['SqlHandle'], summary="通过表名获取所有数据")
async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                    limit: int = Query(None),
                    offset: int = Query(None), code: str):
    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE, is_parent=SON)
    if not column_res:
        return resp_200(data=column_res)
    fields_data = [con.code for con in column_res]
    if "id" not in fields_data:
        fields_data.append('id')
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name, fields=fields_data, limit=limit, offset=offset)
    if not table_list:
        table_list = []

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
                                             handle_user="", handle_params={"table_code": code},
                                             entity_id=res.id, handle_reason='通过表名获取所有数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/condition/{code}', tags=['SqlHandle'], summary="通过表名获取过滤之后的数据")
async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, column_info: dict):
    def gen_select_conditions(column_list, value, operator):
        select_conditions = dict()
        for column in column_list:
            select_conditions[column] = {"value": operator, "operand": value}
        return select_conditions

    dal.setDb(TableManage)
    logger.debug(f"通过表名获取过滤之后的数据:{code}:{column_info}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE, is_parent=SON)
    if not column_res:
        return resp_200(data=column_res)
    select_conditions = dict()
    columns_list = list()
    column_list_info = column_info.get("query")

    if column_list_info is not None and len(column_list_info) > 0:
        for column_info in column_list_info:
            column_list = column_info.get("key")
            value = column_info.get("value")
            operator = column_info.get("operator")
            conditions = gen_select_conditions(column_list, value, operator)
            select_conditions.update(conditions)
            columns_list.extend(column_list)

    limit = column_info.get("limit")
    offset = column_info.get("offset")
    fields_data = [con.code for con in column_res if con.code in columns_list]
    if "id" not in fields_data:
        fields_data.append('id')
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name, conditions=select_conditions, fields=fields_data, limit=limit,
                                         offset=offset)
    if not table_list:
        table_list = []

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
                                             handle_user="", handle_params=column_info,
                                             entity_id=res.id, handle_reason='通过表名获取所有数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/{code}', tags=['SqlHandle'], summary="通过表名创建一条数据")
async def create_table_by_table_name(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, obj_in: dict):
    dal.setDb(TableManage)
    logger.info(f"通过表名创建一条数据:{code}:{obj_in}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")
    insert_data = obj_in
    table_name = f"auto_{res.code}"
    await sql_handle.insert(table_name, insert_data)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params=obj_in,
                                             entity_id=res.id, handle_reason='通过表名创建一条数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200()


@router.patch('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名修改数据")
async def get_column_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, id_: str, obj_in: dict):
    dal.setDb(TableManage)
    logger.info(f"通过表名修改数据:{code}:{id_}:{obj_in}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")
    update_conditions = {"id": id_}
    updated_data = obj_in
    table_name = f"auto_{res.code}"
    await sql_handle.update(table_name, update_conditions, updated_data)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params=obj_in,
                                             entity_id=id_, handle_reason='通过表名修改数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.delete('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名删除表中id的数据")
async def get_column_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, id_: str):
    dal.setDb(TableManage)
    logger.info(f"通过表名修改数据:{code}:{id_}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")
    delete_conditions = {"id": id_}
    table_name = f"auto_{res.code}"
    await sql_handle.delete(table_name, delete_conditions)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params={"table_code": code, "id": id_},
                                             entity_id=id_, handle_reason='通过表名删除表中id的数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})
