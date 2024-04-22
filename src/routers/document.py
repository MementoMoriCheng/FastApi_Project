#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/03/12
# @Author  : MementoMori
# @File    : document.py
# @Software: PyCharm
import os
import uuid
import json
from typing import List
from datetime import datetime

from src.db.dals import ExecDAL
from src.db.models import Document
from src.db.models import CourseSource
from src.utils.constant import DELETE
from sqlalchemy.exc import SQLAlchemyError
from src.utils.sql_config import sql_handle
from fastapi import APIRouter, Depends, Form, UploadFile, Query
from src.utils.responses import resp_200, resp_404, resp_422, resp_500, resp_400
from src.utils.dependencies import DALGetter
from src.utils.ftp_util import RemoteFTPService
from src.db.schemas.document import DocumentSchemas, CreateDocument, UpdateDocument, DeleteDocument, BuckCreateDocument
from src.config.setting import settings

router = APIRouter()


@router.get('/{id_}', tags=['Document'], summary="获取文档详情")
async def get_document_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Document)
    res = await dal.get(id_)
    if not res:
        return resp_404()
    data = DocumentSchemas.from_orm(res)
    if res.record:
        record = json.loads(res.record)
        data.col_name = record.get("col_name")
        data.table_code = record.get("table_code")
    return resp_200(data=data)


@router.get("", tags=['Document'], summary="获取所有文档信息")
async def list_document(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        limit: int = Query(None),
        offset: int = Query(None)):
    dal.setDb(Document)
    res = await dal.get_by_all(limit=limit, offset=offset)
    datas = []
    for ms in res:
        data = DocumentSchemas.from_orm(ms)
        if ms.record:
            record = json.loads(ms.record)
            data.col_name = record.get("col_name")
            data.table_code = record.get("table_code")
        datas.append(data)
    return resp_200(data={"data": datas, "total": len(datas)})


@router.post("", tags=["Document"], summary="创建文档")
async def create_document(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, schema: CreateDocument):
    dal.setDb(Document)
    res = await dal.create(schema)
    return resp_200(data=res)


@router.put("/{id_}", tags=["Document"], summary="文档更新")
async def update_document(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, schema: UpdateDocument):
    dal.setDb(Document)
    ms = await dal.get(id_)
    if not ms:
        return resp_404()

    if not schema.dict(exclude_none=True):
        return resp_200()

    res = await dal.update(id_, schema)
    return resp_200(data=res)


@router.delete("/{id_}", tags=["Document"], summary="删掉文档")
async def delete_document(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                          course_source_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                          *, id_: str, table_code: str, col_name: str):
    dal.setDb(Document)
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    if table_code == "course_source":
        course_source_dal.setDb(CourseSource)
        file_res = await course_source_dal.get_by(file_id=id_)
        if not file_res:
            return resp_404()
        await course_source_dal.update(file_res.id, {"is_delete": DELETE})
    else:
        table_name = f"auto_{table_code}"
        conditions = {col_name: {"value": id_, "operator": "includes"}}
        file_object = await sql_handle.select(table_name, conditions=conditions, fields=["id", col_name])
        if not file_object:
            return resp_404()
        data = file_object[0]
        con = json.loads(data[col_name])
        con.remove(id_)
        updated_condition = {"id": data["id"]}
        updated_data = {col_name: json.dumps(con)}
        try:
            await sql_handle.update(table_name, updated_condition, updated_data)
        except SQLAlchemyError as e:
            return resp_400(msg=f"{e}")
    await dal.delete(id_)
    return resp_200(data={'id': id_})


@router.post("/upload_files", tags=["Document"], summary="上传关联文档")
async def upload_files_to_ftp(
        document_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        doc_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
        files: List[UploadFile],
        table_code: str = Form(...), id_: str = Form(...), col_name=Form(...), user_id: str = None):
    # 存储新文件名的列表
    new_file_names = []
    document_objs = []
    for file in files:
        filename = file.filename
        extension = filename.split(".")[-1]
        # 为此文件生成UUID作为新文件名
        new_file_name = str(uuid.uuid4())
        new_file_names.append(new_file_name)
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        path_ = base_dir + "/" + "tmp"
        if not os.path.exists(path_):
            os.makedirs(path_)
        local_file_path = os.path.join(base_dir, "tmp", f"{new_file_name}" + f".{extension}")
        # 将文件保存到暂存目录
        with open(local_file_path, "wb") as f:
            contents = await file.read()
            f.write(contents)
        service = RemoteFTPService()
        if service.connect and service.login:
            try:
                encrypted_data = await service.encrypt_file(local_file_path)
                remote_file_path = settings.FTP_REMOTE_PATH + "source" + "/" + new_file_name + f".{extension}"
                with open(local_file_path, "wb") as f:
                    f.write(encrypted_data)
                f = open(local_file_path, "rb")
                await service.upload_encrypted_data_to_ftp(f, remote_file_path)
                f.close()
                doc_dal.setDb(Document)
                doc_object = await doc_dal.get_by(name=filename)
                if not doc_object:
                    document_objs.append(
                        BuckCreateDocument(
                            **{"id": new_file_name,
                               "name": filename,
                               "url": remote_file_path,
                               "user_id": user_id if user_id else '',
                               "document_type": extension,
                               "record": json.dumps({"table_code": table_code, "col_name": col_name})
                               }))
                else:
                    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
                    ext = filename.split(".")[-1]
                    basename = filename.split(".")[0]
                    document_objs.append(
                        BuckCreateDocument(**{
                            "id": new_file_name,
                            "name": f"{basename}-{timestamp}.{ext}",
                            "url": remote_file_path,
                            "user_id": user_id if user_id else '',
                            "document_type": extension,
                            "record": json.dumps({"table_code": table_code, "col_name": col_name})
                        }))
                os.remove(local_file_path)
            except Exception as e:
                return resp_422(msg=f"{e}")
        else:
            return resp_500(msg=f"FTP service exception.")
    document_dal.setDb(Document)
    document_infos = await document_dal.buck_create(document_objs)
    document_ids = [con.id for con in document_infos]
    if table_code != "course_source":
        table_name = f"auto_{table_code}"
        conditions = {"id": id_}
        file_object = await sql_handle.select(table_name, conditions=conditions, fields=[col_name])
        if not file_object:
            return resp_404()
        data = file_object[0]
        con = json.loads(data[col_name]) if data[col_name] else []
        document_ids.extend(con)

        updated_data = {col_name: json.dumps(document_ids)}
        try:
            await sql_handle.update(table_name, conditions, updated_data)
        except SQLAlchemyError as e:
            return resp_400(msg=f"{e}")
    return resp_200(data=document_ids, msg="Files have been uploaded successfully.")


@router.get("/download_file/{id_}", tags=["Document"], summary="下载文档")
async def download_file(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    """
    关联多个文档也是一个个的去下载  下载单个文件  就是数据信息表返回信息应该返回关联表所有信息
    """
    dal.setDb(Document)
    res = await dal.get(id_)
    if res:
        remote_filename = res.url
        db_name = res.name
        filename = remote_filename.split("/")[-1]
        try:
            service = RemoteFTPService()
            response = await service.download_ftp_file(filename, db_name, remote_filename)
            return response
        except Exception as e:
            return resp_422(msg=f"FTP service exception {e}")
    return resp_422(msg="No documentation data is available")
