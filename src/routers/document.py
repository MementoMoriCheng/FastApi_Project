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
from src.utils.sql_config import sql_handle
from fastapi import APIRouter, Depends, Form, UploadFile, Query
from src.db.dals import ExecDAL
from src.db.models import Document
from src.utils.responses import resp_200, resp_404, resp_422, resp_500
from src.utils.dependencies import DALGetter
from src.utils.ftp_util import RemoteFTPService
from src.db.schemas.document import DocumentSchemas, CreateDocument, UpdateDocument, DeleteDocument, BuckCreateDocument
from src.config.setting import settings

router = APIRouter()


@router.get('/{id_}', tags=['Document'], summary="获取文档详情", response_model=DocumentSchemas)
async def get_document_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Document)
    res = await dal.get(id_)
    if not res:
        return resp_404()
    return resp_200(data=DocumentSchemas.from_orm(res))


@router.get("", tags=['Document'], summary="获取所有文档信息", response_model=DocumentSchemas)
async def list_document(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        limit: int = Query(None),
        offset: int = Query(None)
):
    dal.setDb(Document)
    res = await dal.get_by_all(limit=limit, offset=offset)
    data = [DocumentSchemas.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(data)})


@router.post("", tags=["Document"], summary="创建文档", response_model=CreateDocument)
async def create_document(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, schema: CreateDocument):
    dal.setDb(Document)
    res = await dal.create(schema)
    return resp_200(data=res)


@router.put("/{id_}", tags=["Document"], summary="文档更新", response_model=UpdateDocument)
async def update_document(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, schema: UpdateDocument):
    dal.setDb(Document)
    ms = await dal.get(id_)
    if not ms:
        return resp_404()

    if not schema.dict(exclude_none=True):
        return resp_200()

    res = await dal.update(id_, schema)
    return resp_200(data=res)


@router.delete("/{id_}", tags=["Document"], summary="删掉文档", response_model=DeleteDocument)
async def delete_document(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, table_code: str, col_name: str):
    dal.setDb(Document)
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    table_name = f"auto_{table_code}"

    conditions = {"id": id_}
    file_object = await sql_handle.select(table_name, conditions=conditions, fields=[col_name])
    file_object.remove(id_)
    updated_data = {col_name: file_object}
    await sql_handle.update(table_name, conditions, updated_data)

    await dal.delete(id_)
    return resp_200(data={'id': id_})


@router.post("/upload_files", tags=["Document"], summary="上传关联文档")
async def upload_files_to_ftp(
        document_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        doc_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
        *,
        files: List[UploadFile],
        user_id: str,
        publish: int,
        confidential_business: int,
        table_code, id_, col_name):
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
                # TODO ftp路径
                # remote_dir = os.path.join(settings.FTP_REMOTE_PATH, "gnss_data")
                # await service.create_ftp_directory([remote_dir])
                # remote_file_path = remote_dir + "/" + file_name

                remote_file_path = settings.FTP_REMOTE_PATH + "profile" + "/" + new_file_name + f".{extension}"
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
                            **{"id": new_file_name, "name": filename, "user_id": user_id, "url": remote_file_path,
                               "document_type": extension})
                    )
                else:
                    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
                    ext = filename.split(".")[-1]
                    basename = filename.split(".")[0]
                    document_objs.append(
                        BuckCreateDocument(**{
                            "id": new_file_name,
                            "name": f"{basename}-{timestamp}.{ext}",
                            "user_id": user_id,
                            "url": remote_file_path,
                            "document_type": extension,
                            "publish": publish,
                            "confidential_business": confidential_business
                        })
                    )
                os.remove(local_file_path)
            except Exception as e:
                return resp_422(msg=f"{e}")
        else:
            return resp_500(msg=f"FTP service exception.")
    document_dal.setDb(Document)
    document_infos = await document_dal.buck_create(document_objs)
    document_ids = [con.id for con in document_infos]

    update_conditions = {"id": id_}
    table_name = f"auto_{table_code}"
    updated_data = {col_name: ",".join(document_ids)}
    await sql_handle.update(table_name, update_conditions, updated_data)

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

# @router.post("/upload_thumbnail", tags=["Document"], summary="上传缩略图")
# async def upload_files_to_ftp(
#         dal: ExecDAL = Depends(DALGetter(ExecDAL)),
#         document_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
#         *,
#         thumbnail_files: List[UploadFile] = Form(...),
#         user_id: str = Form(...),
#         data_id: str = Form(...),
#         publish: int = Form(...),
#         confidential_business: int = Form(...),
#         relation_upload: bool = Form(...)
# ):
#     # 存储新文件名的列表
#     new_file_names = []
#     document_objs = []
#     for file in thumbnail_files:
#         if not file.filename.endswith(("jpg", "jpeg", "png", "gif")):
#             return resp_422(msg="Unsupported file format")
#         filename = file.filename
#         extension = filename.split(".")[-1]
#         new_file_name = str(uuid.uuid4())
#         new_file_names.append(new_file_name)
#         base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
#         path_ = base_dir + "/" + "tmp"
#         if not os.path.exists(path_):
#             os.makedirs(path_)
#         local_file_path = os.path.join(base_dir, "tmp", f"{new_file_name}"+f".{extension}")
#         with open(local_file_path, "wb") as f:
#             contents = await file.read()
#             f.write(contents)
#         service = RemoteFTPService()
#         if service.connect and service.login:
#             try:
#                 encrypted_data = await service.encrypt_file(local_file_path)
#                 remote_file_path = settings.FTP_REMOTE_THUMBNAIL_PATH + f"{new_file_name}.{extension}"
#                 with open(local_file_path, "wb") as f:
#                     f.write(encrypted_data)
#                 f = open(local_file_path, "rb")
#                 await service.upload_encrypted_data_to_ftp(f, remote_file_path)
#                 document_objs.append(
#                     BuckCreateDocument(**{
#                         "id": new_file_name,
#                         "name": filename,
#                         "user_id": user_id,
#                         "url": remote_file_path,
#                         "document_type": "image",
#                         "publish": publish,
#                         "confidential_business": confidential_business
#                     })
#                 )
#             except Exception as e:
#                 return resp_423(msg=f"{e}")
#         else:
#             return resp_500(msg="FTP service exception.")
#     document_dal.setDb(Document)
#     await document_dal.buck_create(document_objs)
#     try:
#         dal.setDb(Project)
#         project_in = await dal.get(data_id)
#         gid = project_in.gid
#         if relation_upload:
#             project_batch = await dal.get_by({"gid": gid}, True)
#         else:
#             project_batch = [project_in]
#         success_list = []
#         failed_list = []
#         for project_object in project_batch:
#             if project_object:
#                 thumbnail_list = project_object.thumbnail
#                 if thumbnail_list:
#                     new_file_names = new_file_names + json.loads(thumbnail_list)
#                     new_file_names = list(set(new_file_names))
#             project_obj = UpdateProjectThumbnail(thumbnail=json.dumps(new_file_names))
#             res = await dal.update(project_object.id, project_obj)
#             if res:
#                 success_list.append(project_object.id)
#             else:
#                 failed_list.append(project_object.id)
#
#         return resp_200(
#             data={"success": success_list, "failed": failed_list},
#             msg="Thumbnail files have been uploaded successfully."
#         )
#     except:
#         return resp_422(msg="Thumbnail files have been uploaded wrong.")
#
#
# @router.get("/download_thumbnail_file/{id_}", tags=["Document"], summary="下载缩略图文档")
# async def download_file(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
#     dal.setDb(Document)
#     res = await dal.get(id_)
#     if res:
#         remote_filename = res.url
#         db_name = res.name
#         filename = remote_filename.split("/")[-1]
#         try:
#             service = RemoteFTPService()
#             response = await service.download_ftp_thumbnail_file(filename, db_name)
#             return response
#         except Exception as e:
#             return resp_422(msg=f"FTP service exception.")
#     return resp_422(msg="No documentation data is available")
#
#
# @router.get("/download_thumbnail_file_encode/{id_}", tags=["Document"], summary="缩略图文档进行编码")
# async def download_file_encode(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
#     dal.setDb(Document)
#     res = await dal.get(id_)
#     if res:
#         remote_filename = res.url
#         filename = remote_filename.split("/")[-1]
#         try:
#             service = RemoteFTPService()
#             response = await service.download_ftp_thumbnail_file_encode(filename)
#             return resp_200(data={"file_content": response.decode("utf-8")})
#         except Exception as e:
#             return resp_422(msg=f"FTP service exception.")
#     return resp_422(msg="No documentation data is available")
#
#
# @router.get("/download_file_encode/{id_}", tags=["Document"], summary="关联文档编码")
# async def download_file_encode(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
#     dal.setDb(Document)
#     res = await dal.get(id_)
#     if res:
#         remote_filename = res.url
#         filename = remote_filename.split("/")[-1]
#         try:
#             service = RemoteFTPService()
#             response = await service.download_ftp_file_encode(filename, remote_filename)
#             return resp_200(data={"file_content": response.decode("utf-8")})
#         except Exception as e:
#             return resp_422(msg=f"FTP service exception. ")
#     return resp_422(msg="No documentation data is available")
