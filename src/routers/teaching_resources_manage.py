#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    : teaching_resources_manage.py
# @Software: PyCharm

from typing import List
from src.db.dals import ExecDAL
from fastapi import APIRouter, Depends
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.responses import BusinessStatusCode
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode
from src.utils.responses import resp_200, resp_404, resp_500, resp_400
from src.db.models import Course, Questions, ExamResultDetail, ErrorArchive
from src.db.schemas.lesson_examination import (
    QuestionSchema, UpdateQuestionSchema, SearchQuestionSchema

)

router = APIRouter()


# -----------------------------------------------题库资源信息

@router.post("/question/filter_question", tags=["TeachingResourcesManage"], summary="查询试题信息")
async def list_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, question_info: SearchQuestionSchema):
    dal.setDb(Questions)
    query_params_mapping = question_info.dict(exclude_none=True)
    if question_info.question is not None:
        query_params_mapping['question__contains'] = query_params_mapping.pop('question')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [QuestionSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/question/{id_}', tags=['TeachingResourcesManage'], summary="通过id获取试题信息")
async def get_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Questions)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='试题不存在！')
    data = QuestionSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/question", tags=["TeachingResourcesManage"], summary="创建试题信息")
# async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, question_info: List[QuestionSchema]):
async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, question_info: QuestionSchema):
    dal.setDb(Questions)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    res = await dal.create(question_info)
    if not res:
        return resp_400(msg='创建失败！')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data=res)


@router.delete("/question/{id_}", tags=["TeachingResourcesManage"], summary="删除试题信息")
async def delete_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Questions)
    # logger.info(f"删除考试信息:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='考试不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="column_manage",
    #                                              handle_user='', handle_params=id_,
    #                                              entity_id=id_, handle_reason='删除考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data={'id': id_})


@router.patch("/question/{id_}", tags=["TeachingResourcesManage"], summary="编辑试题信息")
async def update_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, question_info: UpdateQuestionSchema):
    dal.setDb(Questions)
    # logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！考试不存在，无法进行编辑！')
    res = await dal.update(id_, question_info)
    if not res:
        return resp_500()

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                          handle_user=obj_in.update_user, handle_params=obj_in.dict(),
    #                                          entity_id=id_, handle_reason='编辑考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------课程资源信息

# -----------------------------------------------课程表资源信息
# -----------------------------------------------教学日志信息