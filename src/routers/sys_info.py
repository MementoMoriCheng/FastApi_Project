#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/11/28 11:05
# @Author  : yilifeng
# @File    : sys_info.py
# @Software: PyCharm
import json
import os.path
import datetime
import traceback

from src.db.dals import ExecDAL
from src.config.setting import settings
from fastapi.responses import FileResponse
from sqlalchemy.exc import SQLAlchemyError

from src.utils.ftp_util import RemoteFTPService
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from fastapi import APIRouter, Depends, UploadFile
from src.utils.processing_file import generate_file
from src.utils.logger import generate_mysql_log_data
from src.db.schemas.column_manage import ColumnListSchema
from src.utils.constant import RecordsStatusCode, RESERVE
from src.db.models import DataHandle, TableManage, ColumnManage, IntermediateTable
from src.db.schemas.data_hanle import CreateDataHandle, RestoreBackup, SyncDatas
from src.utils.middle_level_management import export_table_template, convert_id2content, import_table_template, \
    import_waypoint_route
from src.utils.responses import resp_200, resp_404, resp_500, resp_400, fetch_external_upload_file, \
    fetch_do_restore_file
from src.utils.tools import get_current_server_ip, export_server_datas, restore_server_datas, is_valid_websocket_url, \
    filter_list, format_sql_statement, is_valid_uuid, insert_sql_statements, is_valid_url, convert_datetime_to_string

router = APIRouter()


@router.get("/get_server_ip/", tags=["SysInfo"], summary="获取当前服务器IP")
async def get_server_ip():
    server_ip = get_current_server_ip()
    if server_ip:
        return resp_200(data=server_ip)
    else:
        return resp_400(msg="无法解析主机名，请检查网络设置")


@router.get("/get_map_interface/", tags=["SysInfo"], summary="获取地图接口")
async def get_map_interface():
    map_interface_china = settings.MAP_INTERFACE_CHINA
    map_interface_jiangxi = settings.MAP_INTERFACE_JIANGXI
    if is_valid_url(map_interface_china) and is_valid_url(map_interface_jiangxi):
        return resp_200(data=[map_interface_china, map_interface_jiangxi])
    else:
        return resp_400(msg="格式错误，请检查配置文件")


@router.get("/get_ws_config/", tags=["SysInfo"], summary="获取WebSocket")
async def get_server_ip():
    ws_config = settings.WS_CONFIG
    if is_valid_websocket_url(ws_config):
        return resp_200(data=ws_config)
    else:
        return resp_400(msg="WebSocket格式错误，请检查配置文件")


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

    if not response_result["code"]:
        url = f"{host}api/sys_info/restore_datas/"
        response_result = await fetch_do_restore_file(url, obj_in.user_id, response_result["data"], extra_data)
        print(response_result)
        if response_result["code"]:
            return resp_500(msg="restore_datas failed!")
    else:
        return resp_500(msg="sync_backup_file failed!")

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


@router.post("/sync_backup_file", tags=["SysInfo"], summary="上传备份文件")
async def upload_files_to_ftp(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
        file: UploadFile, user_id: str = None, extra_data: str = None):
    local_file_path = os.path.join(settings.RESTORE_PATH, "from_remote")
    if not os.path.exists(local_file_path):
        os.makedirs(local_file_path)
    print(local_file_path)
    full_file_path = os.path.join(local_file_path, file.filename)
    with open(full_file_path, "wb") as f:
        contents = await file.read()
        f.write(contents)

    f = open(full_file_path, "rb")
    ftp_util = RemoteFTPService()
    await ftp_util.upload_encrypted_data_to_ftp(f, settings.FTP_REMOTE_BACKUPS_PATH + file.filename)
    f.close()

    current_time = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    dal.setDb(DataHandle)
    obj_ = CreateDataHandle(
        name=extra_data,
        user_id=user_id,
        url=settings.FTP_REMOTE_BACKUPS_PATH + file.filename,
        handle_type=4,
        handle_time=current_time,
        description=extra_data
    )
    res = await dal.create(obj_)
    return resp_200(msg="文件上传成功", data=res.id)


@router.get('/export_data/', tags=['SysInfo'], summary="生成指定表数据文件")
async def export_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      *, code: str, export_format: str = None, template: bool = None, column_info: str = None) -> dict:
    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    table_name, zh_name = f"auto_{res.code}", f"{res.name}"

    col_dal.setDb(ColumnManage)
    table_id = res.id
    col_res = await col_dal.get_by_all(table_id=table_id, is_delete=RESERVE, is_parent=RESERVE)
    if not col_res:
        return resp_200(data=[])
    col_data = [ColumnListSchema.from_orm(ms) for ms in col_res]
    sorted_fields_data = sorted(col_data, key=lambda x: x.sort)
    fields_data = [con.code for con in sorted_fields_data]
    table_list = await sql_handle.select(table_name, fields=fields_data)
    col_name, association_ = export_table_template(sorted_fields_data)
    association_list = await convert_id2content(association_)
    if template and table_name != settings.QUESTION_BANK:
        table_list = col_name
    else:
        for table_info in table_list:
            for association in association_list:
                for key, value in association.items():
                    if "multiple_" in key:
                        middle_dal.setDb(IntermediateTable)
                        key = key.replace("multiple_", "")
                        multiple_res = await middle_dal.get_by_all(correlation_id=table_info[key])
                        content_list = filter_list([value.get(con.data_id) for con in multiple_res])
                        content_str = ",".join(content_list) if content_list else None
                        table_info[key] = content_str
                    else:
                        table_info[key] = value.get(table_info[key])

    file_name, zh_file_name = f"{table_name}.{export_format}", f"{zh_name}.{export_format}"
    local_file_path = settings.LOCAL_DOWNLOAD_FILE_PATH
    if not table_list:
        table_list = []
    if export_format:
        if export_format.lower() in ['xls', 'xlsx', 'csv']:
            output_filename = generate_file.generate_excel(table_list, zh_file_name, col_name, local_file_path,
                                                           file_name)
        elif export_format.lower() == 'pdf':
            output_filename = generate_file.generate_pdf(table_list, zh_file_name, local_file_path, file_name)
        elif export_format.lower() == 'xml':
            output_filename = generate_file.generate_xml(table_list, zh_file_name, local_file_path, file_name)
        return FileResponse(output_filename,
                            filename=zh_file_name,
                            media_type="application/octet-stream",
                            )

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
                                             handle_user="", handle_params={"table_code": code},
                                             entity_id=res.id, handle_reason='导出指定表所有数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    # 未选择导出格式或者格式不支持时返回JSON数据
    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/import_data/', tags=['SysInfo'], summary="导入指定表数据")
async def import_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      bak_middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      *, code: str, file: UploadFile):
    # 航线比较特殊
    table_name = f"auto_{code.lower()}"
    if table_name in [settings.FLIGHT_ROUTE, settings.FLIGHT_WAYPOINT]:
        code = settings.WAYPOINT
        table_name = settings.FLIGHT_WAYPOINT

    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    col_dal.setDb(ColumnManage)
    table_id = res.id
    col_res = await col_dal.get_by_all(table_id=table_id, is_delete=RESERVE, is_parent=RESERVE)
    if not col_res:
        return resp_200(data=[])
    col_data = [ColumnListSchema.from_orm(ms) for ms in col_res]
    # 表列名中英文对照
    items = {}
    for item in col_data:
        items[item.name] = item.code

    # 表中关联关系
    col_name, association_ = export_table_template(col_data)
    local_file_path = os.path.join(settings.RESTORE_PATH, "import_data")
    if not os.path.exists(local_file_path):
        os.makedirs(local_file_path)
    full_file_path = os.path.join(local_file_path, file.filename)
    with open(full_file_path, "wb") as f:
        contents = await file.read()
        f.write(contents)

    q_list = await import_table_template(table_name, full_file_path, items, association_, middle_dal)
    try:
        await sql_handle.batch_insert(table_name, q_list)

        if table_name in [settings.FLIGHT_ROUTE, settings.FLIGHT_WAYPOINT]:
            insert_id = await import_waypoint_route(settings.FLIGHT_ROUTE, q_list, bak_middle_dal)
            if insert_id:
                return resp_200(data=insert_id)

    except SQLAlchemyError as err:
        return resp_400(msg=f"{err}")

    return resp_200()


@router.post("/backup_table_data/{table_code}", tags=["SysInfo"], summary="通过表code备份数据")
async def backup_table_datas(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                             column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, table_code: str):
    dal.setDb(TableManage)
    column_dal.setDb(ColumnManage)

    map_table_data = {}
    extra_tables = ["intermediate_table"]
    for item in [table_code] + extra_tables:
        if item not in extra_tables:
            res = await dal.get_by(code=item)
            if not res:
                return resp_200(data=[])

            column_res = await column_dal.get_by_all(table_id=res.id)
            if not column_res:
                return resp_200(data=column_res)
            table_name = f"auto_{res.code}"
        else:
            table_name = item

        table_list = await sql_handle.select(table_name)
        if not table_list:
            table_list = []
        table_list = [convert_datetime_to_string(table_) for table_ in table_list]
        map_table_data[item] = table_list

    list_uuids = []
    for key in map_table_data:
        if key not in extra_tables:
            for item in map_table_data[key]:
                for key_in in item:
                    data_value = item[key_in]
                    if not data_value:
                        continue
                    if len(str(data_value)) < 35:
                        continue
                    try:
                        data_value = json.loads(data_value)
                    except:
                        pass
                    if isinstance(data_value, str):
                        if is_valid_uuid(data_value):
                            list_uuids.append(data_value)
                    elif isinstance(data_value, list):
                        list_uuids = list_uuids + data_value

    list_uuids = list(set(list_uuids))

    intermediate_table_data = []
    for table_name in extra_tables:
        for item in map_table_data[table_name]:
            for a_id in list_uuids:
                if a_id in json.dumps(item):
                    intermediate_table_data.append(item)

        map_table_data[table_name] = intermediate_table_data
        contents = ""
        for key in map_table_data:
            tmp_code = f"auto_{key}" if key not in [table_name] else key
            for item in map_table_data[key]:
                sql_cmd = format_sql_statement(tmp_code, item)
                contents += sql_cmd + "\n"

    dir_name = str(datetime.datetime.now().strftime("%Y%m%d%H%M%S"))
    sql_file_name = table_code + "_datetime_" + dir_name + ".db"
    backup_path = os.path.join(settings.BACKUP_PATH, dir_name)
    if not os.path.exists(backup_path):
        os.makedirs(backup_path)

    with open(os.path.join(backup_path, sql_file_name), "w") as f:
        f.write(contents)

    try:
        # encrypt_file(os.path.join(backup_path, sql_file_name), os.path.join(backup_path, sql_file_name))
        ftp_util = RemoteFTPService()
        f = open(os.path.join(backup_path, sql_file_name), "rb")
        await ftp_util.upload_encrypted_data_to_ftp(f, settings.FTP_REMOTE_BACKUPS_PATH + sql_file_name)
        f.close()
        return resp_200()
    except:
        print(traceback.format_exc())
        return resp_500()


@router.post("/get_backups_by_table_code/{table_code}", tags=["SysInfo"], summary="获取表code备份的所有数据")
async def get_backups_by_table_code(*, table_code: str):
    ftp_util = RemoteFTPService()
    file_list = await ftp_util.list_file(settings.FTP_REMOTE_BACKUPS_PATH)

    if not file_list:
        return resp_404()

    res = []
    for item in file_list:
        if table_code == item[0: len(table_code)]:
            res.append(item)

    return resp_200(data=res)


@router.post("/restore_table_by_file/{file_name}", tags=["SysInfo"], summary="通过文件还原数据")
async def get_backups_by_table_code(*, file_name: str):
    ftp_util = RemoteFTPService()
    await ftp_util.download_ftp_file_origin(file_name, settings.FTP_REMOTE_BACKUPS_PATH + file_name)

    base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    local_file_path = os.path.join(base_dir, "tmp", file_name)
    # clear_table_data(f'auto_{file_name.split("_datetime_")[0]}')
    insert_sql_statements(local_file_path)
    return resp_200()


@router.post("/delete_backups_by_file_name/{file_name}", tags=["SysInfo"], summary="通过文件名删除备份数据")
async def delete_backups_by_file_name(*, file_name: str):
    try:
        ftp_util = RemoteFTPService()
        ftp_util.ftp.set_pasv(True)
        res = ftp_util.ftp_remove_file(settings.FTP_REMOTE_BACKUPS_PATH + file_name)
        if res:
            return resp_200()
        return resp_500()
    except:
        return resp_500()
