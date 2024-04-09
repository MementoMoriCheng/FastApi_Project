#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/02/26 11:22
# @Author  : yilifeng
# @File    : menu_manage.py
# @Software: PyCharm


from fastapi import APIRouter, Depends, Query
from src.db.dals import ExecDAL, SortBy
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.responses import resp_200, resp_404, resp_500, resp_403
from src.utils.dependencies import DALGetter
from src.db.models import MenuManage
from src.db.schemas.menu_manage import CreateMenuManage, UpdateMenuManage, MenuManageSchema
from src.utils.sql_config import sql_handle
from src.static import table_schema
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode

router = APIRouter()


@router.get('/{id_}', tags=['MenuManage'], summary="通过id获取菜单的信息")
async def get_menu_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(MenuManage)
    logger.debug(f"通过id获取菜单的信息:{id_}")
    res = await dal.get(id_)
    if not res:
        return resp_404()

    return resp_200(data=MenuManageSchema.from_orm(res))


@router.get('', tags=['MenuManage'], summary="获取所有菜单的信息")
async def list_menu_info(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
        limit: int = Query(None),
        offset: int = Query(None)
):
    dal.setDb(MenuManage)

    res = await dal.get_by_all(limit=limit, offset=offset,
                               order_by_list=[SortBy('sort', False), SortBy('create_time', False)],
                               is_delete=RESERVE)
    data = [MenuManageSchema.from_orm(ms) for ms in res]

    return resp_200(data={"data": data, "total": len(res)})


@router.post('', tags=['MenuManage'], summary="创建菜单")
async def create_menu_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: CreateMenuManage):
    dal.setDb(MenuManage)
    logger.info(f"创建菜单:{obj_in.dict()}")
    exist_res = await dal.get_by(code=obj_in.code)
    if exist_res:
        return resp_403(msg=f"{obj_in.name} is existed!")
    res = await dal.create(obj_in)
    if not res:
        return resp_404()
    table_name = f"auto_{obj_in.code}"
    columns_config = {key: table_schema[key] for key in obj_in.dict() if key in table_schema}
    sql_handle.create_dynamic_table_core(table_name, columns_config)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="menu_manage",
                                             handle_user=obj_in.create_user, handle_params=obj_in.dict(),
                                             entity_id=res.id,
                                             handle_reason=obj_in.description if obj_in.description else '创建菜单')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)


@router.delete('/{id_}', tags=['MenuManage'], summary="删除菜单")
async def delete_menu_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(MenuManage)
    logger.info(f"删除菜单:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    update_data = UpdateMenuManage(is_delete=DELETE)
    res = await dal.update(id_, update_data)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="menu_manage",
                                             handle_user="", handle_params=id_,
                                             entity_id=id_, handle_reason='删除菜单')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch('/{id_}', tags=['MenuManage'], summary="编辑菜单")
async def update_menu_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateMenuManage):
    dal.setDb(MenuManage)
    logger.info(f"编辑菜单:{id_}:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    if not obj_in.dict(exclude_none=True):
        return resp_200()
    res = await dal.update(id_, obj_in)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="menu_manage",
                                             handle_user=obj_in.update_user, handle_params=obj_in.dict(),
                                             entity_id=id_,
                                             handle_reason=obj_in.description if obj_in.description else '编辑菜单')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)
