#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/11/28 11:05
# @Author  : yilifeng
# @File    : sys_info.py
# @Software: PyCharm
import os.path
import datetime
from src.db.dals import ExecDAL
from src.config.setting import settings
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.constant import RecordsStatusCode
from src.db.models import DataHandle, TableManage
from fastapi import APIRouter, Depends, UploadFile
from src.utils.logger import generate_mysql_log_data
from src.utils.processing_file import generate_file
from src.db.schemas.data_hanle import CreateDataHandle, RestoreBackup, SyncDatas
from src.utils.tools import get_current_server_ip, export_server_datas, restore_server_datas
from src.utils.responses import resp_200, resp_404, resp_500, resp_400, fetch_external_upload_file

router = APIRouter()


@router.get("/get_server_ip/", tags=["SysInfo"], summary="获取当前服务器IP")
async def get_server_ip():
    server_ip = get_current_server_ip()
    if server_ip:
        return resp_200(data=server_ip)
    else:
        return resp_400(msg="无法解析主机名，请检查网络设置")


@router.post("/backup_datas/", tags=["SysInfo"], summary="备份数据")
async def backup_datas(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: CreateDataHandle):
    dir_name = str(datetime.datetime.now().strftime("%Y%m%d%H%M%S"))
    local_path, ftp_path = await export_server_datas(dir_name)

    if ftp_path:
        obj_in.handle_time = dir_name
        obj_in.url = ftp_path
        dal.setDb(DataHandle)
        await dal.create(obj_in)
    else:
        return resp_500()

    return resp_200()


@router.post("/restore_datas/", tags=["SysInfo"], summary="还原备份")
async def restore_datas(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: RestoreBackup):
    dal.setDb(DataHandle)
    curr_data = await dal.get(obj_in.id)
    if not curr_data:
        return resp_404()

    res = await restore_server_datas(curr_data)
    if not res:
        return resp_500()

    current_time = datetime.datetime.now().strftime("%Y%m%d%H%M%S")

    obj_ = CreateDataHandle(
        name=curr_data.name,
        user_id=obj_in.user_id,
        url=curr_data.url,
        handle_type=2,
        handle_time=current_time,
        description=obj_in.description
    )
    await dal.create(obj_)

    return resp_200()


@router.post("/sync_datas/", tags=["SysInfo"], summary="同步数据")
async def sync_datas(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: SyncDatas):
    dir_name = str(datetime.datetime.now().strftime("%Y%m%d%H%M%S"))
    local_path, ftp_path = await export_server_datas(dir_name, True)
    print(local_path)
    if not local_path:
        return resp_500()

    remote_host = obj_in.remote_host
    remote_port = obj_in.remote_port
    if not remote_host or not remote_port:
        host = settings.SYNC_DATAS
    else:
        host = f"http://{remote_host}:{remote_port}/"
    url = f"{host}api/sys_info/sync_backup_file"
    extra_data = f"from: {get_current_server_ip()}"

    response_result = await fetch_external_upload_file(url, local_path, obj_in.user_id, extra_data)
    print(response_result)
    os.remove(local_path)

    current_time = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    dal.setDb(DataHandle)
    obj_ = CreateDataHandle(
        name=f"to: {host}",
        user_id=obj_in.user_id,
        url=ftp_path,
        handle_type=3,
        handle_time=current_time,
        description=extra_data
    )
    await dal.create(obj_)

    return resp_200()


@router.post("/sync_backup_file", tags=["SysInfo"], summary="上传备份文件并还原备份")
async def upload_files_to_ftp(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
        file: UploadFile, user_id: str = None, extra_data: str = None
):
    local_file_path = os.path.join(settings.RESTORE_PATH, "from_remote")
    if not os.path.exists(local_file_path):
        os.makedirs(local_file_path)
    print(local_file_path)
    with open(os.path.join(local_file_path, file.filename), "wb") as f:
        contents = await file.read()
        f.write(contents)

    res = await restore_server_datas(file.filename[: -4], os.path.join(local_file_path, file.filename))
    if not res:
        return resp_500()

    current_time = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    dal.setDb(DataHandle)
    obj_ = CreateDataHandle(
        name=extra_data,
        user_id=user_id,
        url=res,
        handle_type=4,
        handle_time=current_time,
        description=extra_data
    )
    await dal.create(obj_)

    return resp_200()


@router.get('/export_data/', tags=['SysInfo'], summary="导出指定表数据")
async def export_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      *, code: str, export_format: str = None, user_path: str = None):
    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name)
    file_name = f"{table_name}.{export_format}"
    if user_path is None:
        local_file_path = settings.LOCAL_DOWNLOAD_FILE_PATH
    else:
        local_file_path = user_path
    if not table_list:
        table_list = []

    if export_format:
        if export_format.lower() in ['xls', 'xlsx', 'csv']:
            generate_file.generate_excel(table_list, local_file_path, file_name)
            return resp_200(msg="excel成功导出")
        elif export_format.lower() == 'pdf':
            generate_file.generate_pdf(table_list, local_file_path, file_name)
            return resp_200(msg="pdf成功导出")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
                                             handle_user="", handle_params={"table_code": code},
                                             entity_id=res.id, handle_reason='导出指定表所有数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    # 未选择导出格式或者格式不支持时返回JSON数据
    return resp_200(data={"data": table_list, "total": len(table_list)})

# @router.get('/import_data/', tags=['SysInfo'], summary="导入指定表数据")
# async def import_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
#                     *, code: str, export_format: str = None):
#     dal.setDb(TableManage)
#     res = await dal.get_by(code=code)
#     if not res:
#         return resp_200(data=[])
#     table_name = f"auto_{res.code}"
#     table_list = await sql_handle.select(table_name)
#     if not table_list:
#         table_list = []
#
#     if export_format:
#         if export_format.lower() in ['xls', 'xlsx']:
#             file_name = f"{code}.{export_format}"
#             generate_excel(table_list, settings.LOCAL_DOWNLOAD_FILE_PATH, file_name)
#             return resp_200(msg="excel成功导出")
#         elif export_format.lower() == 'pdf':
#             file_name = f"{code}.{export_format}"
#             generate_pdf(table_list, settings.LOCAL_DOWNLOAD_FILE_PATH, file_name)
#             return resp_200(msg="pdf成功导出")
#
#     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
#                                              handle_user="", handle_params={"table_code": code},
#                                              entity_id=res.id, handle_reason='导出指定表所有数据')
#     await sql_handle.add_records("log_manage", mysql_log_data)
#
#     # 未选择导出格式或者格式不支持时返回JSON数据
#     return resp_200(data={"data": table_list, "total": len(table_list)})
