#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 22:55
# @Author  : yilifeng
# @File    : sql_handle.py
# @Software: PyCharm
from typing import List
from src.db.dals import ExecDAL
from src.config.setting import settings
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from fastapi import APIRouter, Depends, Query
from sqlalchemy.exc import SQLAlchemyError
from src.utils import generate_uuid
from src.db.models import TableManage, ColumnManage
from src.db.schemas.table_manage import UserSyncIn
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.generate_file import generate_pdf, generate_excel
from src.utils.responses import resp_200, resp_404, fetch_external_data, resp_400
from src.utils.constant import RESERVE, SON, RecordsStatusCode

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
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE, is_parent=[SON, None])
    if not column_res:
        return resp_200(data=column_res)
    fields_data = [con.code for con in column_res]
    if "id" not in fields_data:
        fields_data.append('id')
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name, fields=fields_data, limit=limit, offset=offset)
    if not table_list:
        table_list = []

    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/condition/{code}', tags=['SqlHandle'], summary="通过表名获取过滤之后的数据")
async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, column_info: dict):
    def gen_select_conditions(column_list, value, operator):
        select_conditions = dict()
        for column in column_list:
            select_conditions[column] = {'value': value, 'operator': operator}
        return select_conditions

    dal.setDb(TableManage)
    logger.debug(f"通过表名获取过滤之后的数据:{code}:{column_info}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE, is_parent=[SON, None])
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
    fields_data = column_res  # [con.code for con in column_res if con.code in columns_list]
    if "id" not in fields_data:
        fields_data.append('id')
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name, conditions=select_conditions, fields=fields_data, limit=limit,
                                         offset=offset)
    if not table_list:
        table_list = []

    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/{code}', tags=['SqlHandle'], summary="通过表名创建一条数据")
async def create_table_by_table_name(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, obj_in: dict):
    dal.setDb(TableManage)
    logger.info(f"通过表名创建一条数据:{code}:{obj_in}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")
    table_name = f"auto_{res.code}"
    obj_in.update({"id": generate_uuid()})
    try:
        inserted_data_id = await sql_handle.insert(table_name, obj_in)
    except SQLAlchemyError as e:
        return resp_400(msg=f"{e}")
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params=obj_in,
                                             entity_id=res.id, handle_reason='通过表名创建一条数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=inserted_data_id[0])


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
    try:
        await sql_handle.update(table_name, update_conditions, updated_data)
    except SQLAlchemyError as e:
        return resp_400(msg=f"{e}")

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


@router.get('export_data/{code}', tags=['SqlHandle'], summary="导出指定表数据")
async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    *, code: str, export_format: str = None):
    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name)
    if not table_list:
        table_list = []

    if export_format:
        if export_format.lower() in ['xls', 'xlsx']:
            file_name = f"{code}.{export_format}"
            generate_excel(table_list, settings.LOCAL_DOWNLOAD_FILE_PATH, file_name)
            return resp_200(msg="excel成功导出")
        elif export_format.lower() == 'pdf':
            file_name = f"{code}.{export_format}"
            generate_pdf(table_list, settings.LOCAL_DOWNLOAD_FILE_PATH, file_name)
            return resp_200(msg="pdf成功导出")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
                                             handle_user="", handle_params={"table_code": code},
                                             entity_id=res.id, handle_reason='导出指定表所有数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    # 未选择导出格式或者格式不支持时返回JSON数据
    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/sync_user/', tags=['SqlHandle'], summary="同步用户到管理系统")
async def sync_user(*, payload: List[UserSyncIn]):
    url = settings.SYNC_USER_URL
    response_result = await fetch_external_data(url, payload)
    logger.info(f"同步用户到管理系统:{payload}")
    return response_result


@router.post('/unsync_user/', tags=['SqlHandle'], summary="取消同步用户到管理系统")
async def unsync_user(*, usernames: List[str]):
    url = settings.UNSYNC_USER_URL
    response_result = await fetch_external_data(url, usernames)
    logger.info(f"取消同步用户到管理系统:{usernames}")
    return response_result
