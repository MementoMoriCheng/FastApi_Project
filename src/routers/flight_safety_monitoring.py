#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 
# @Author  : MementoMori
# @File    : flight_safety_monitoring.py
# @Software: PyCharm

from src.db.dals import ExecDAL
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.responses import resp_200, resp_404, resp_500, resp_406
from fastapi import APIRouter, Depends
from src.utils.dependencies import DALGetter
from src.utils.sql_config import sql_handle
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode
from src.db.models import MenuManage

router = APIRouter()


@router.get("/", tags=["FlightSafetyMonitoring"], summary="获取飞行信息数据")
async def list_columns(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                       table_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str):
    table_dal.setDb(TableManage)
    table_res = await table_dal.get_by(code=code)
    if not table_res:
        return resp_200(data=[])

    dal.setDb(FlightSafetyMonitoring)
    res = await dal.get_by_all(table_id=table_res.id, is_delete=RESERVE)
    if not res:
        return resp_200(data=[])
    data = [ColumnListSchema.from_orm(ms) for ms in res]

    return resp_200(data=data)


# @router.get("/table/{table_id}", tags=["FlightSafetyMonitoring"], summary="通过table_id获取列信息")
# async def get_column_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, table_id: str):
#     dal.setDb(FlightSafetyMonitoring)
#     logger.debug(f"通过table_id获取列信息:{table_id}")
#     res = await dal.get_by_all(table_id=table_id, is_delete=RESERVE)
#     if not res:
#         return resp_200(data=res)
#     data = [FlightSafetyMonitoringSchema.from_orm(ms) for ms in res]
#
#     return resp_200(data=data)
#
#
# @router.get("/{id}", tags=["FlightSafetyMonitoring"], summary="通过id获取表一列信息")
# async def get_column_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id: str):
#     dal.setDb(FlightSafetyMonitoring)
#     logger.debug(f"通过id获取表一列信息:{id}")
#     res = await dal.get(id)
#     if not res:
#         return resp_404()
#
#     return resp_200(data=FlightSafetyMonitoringSchema.from_orm(res))
#
#
# @router.post("/", tags=["FlightSafetyMonitoring"], summary="创建数据库表的列")
# async def create_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
#                         table_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: CreateFlightSafetyMonitoring):
#     table_dal.setDb(TableManage)
#     logger.info(f"创建数据库表的列:{obj_in.dict()}")
#     table_res = await table_dal.get(obj_in.table_id)
#     if not table_res:
#         return resp_404()
#     table_code = f"auto_{table_res.code}"
#     dal.setDb(FlightSafetyMonitoring)
#     res = await dal.create(obj_in)
#     if not res:
#         return resp_404()
#     if not obj_in.is_parent:
#         sql_handle.upgrade_columns(table_code, obj_in.code, obj_in.type, obj_in.field_length)
#         sql_handle.add_foreign_key(table_code, obj_in.code, obj_in.association)
#         sql_handle.refresh_metadata()
#
#     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
#                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
#                                              entity_id=res.id, handle_reason='创建数据库表的列')
#     await sql_handle.add_records("log_manage", mysql_log_data)
#
#     return resp_200(data=res)
#
#
# @router.delete("/{id_}", tags=["FlightSafetyMonitoring"], summary="删除数据库表的列")
# async def delete_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
#     dal.setDb(FlightSafetyMonitoring)
#     logger.info(f"删除数据库表的列:{id_}")
#     ms = await dal.get(id_)
#     if not ms:
#         return resp_404()
#     res = await dal.update(id_, {'is_delete': DELETE})
#     if not res:
#         return resp_500()
#
#     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="column_manage",
#                                              handle_user='', handle_params=id_,
#                                              entity_id=id_, handle_reason='删除数据库表的列')
#     await sql_handle.add_records("log_manage", mysql_log_data)
#
#     return resp_200(data={'id': id_})
#
#
# @router.patch("/{id_}", tags=["FlightSafetyMonitoring"], summary="修改数据库表的列")
# async def update_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
#                         table_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateFlightSafetyMonitoring):
#     if not obj_in.dict(exclude_none=True):
#         return resp_200()
#     dal.setDb(FlightSafetyMonitoring)
#     logger.info(f"修改数据库表的列:{obj_in.dict()}")
#     ms = await dal.get(id_)
#     if not ms:
#         return resp_404()
#
#     old_column_name = ms.code
#
#     table_dal.setDb(TableManage)
#     table_res = await table_dal.get(ms.table_id)
#     if not table_res:
#         return resp_404()
#
#     res = await dal.update(id_, obj_in)
#     table_code = f"auto_{table_res.code}"
#     sql_handle.change_columns(table_code, old_column_name, obj_in)
#     sql_handle.add_foreign_key(table_code, ms.code, obj_in.association)
#     sql_handle.refresh_metadata()
#     if not res:
#         return resp_500()
#
#     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
#                                              handle_user=obj_in.update_user, handle_params=obj_in.dict(),
#                                              entity_id=id_, handle_reason='修改数据库表的列')
#     await sql_handle.add_records("log_manage", mysql_log_data)
#
#     return resp_200(data=res)
#
#
# @router.post("/sort", tags=["FlightSafetyMonitoring"], summary="数据库列：排序")
# async def sort_column(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: SortFlightSafetyMonitoring):
#     if obj_in is not None and len(obj_in.columns) > 0:
#         table_code = obj_in.table_code
#         if table_code == 'column_manage':
#             dal.setDb(FlightSafetyMonitoring)
#         elif table_code == 'menu_manage':
#             dal.setDb(MenuManage)
#
#         for item in obj_in.columns:
#             await dal.update(item.id, {"sort": item.sort})
#         return resp_200(data='200')
#     else:
#         return resp_406(msg='请求参数错误')
