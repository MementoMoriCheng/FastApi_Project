#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    : teaching_resources_manage.py
# @Software: PyCharm
from typing import List
from src.db.dals import ExecDAL, SortBy
from fastapi import APIRouter, Depends
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import PUBLISHED, DELETE, RESERVE, RecordsStatusCode
from src.utils.responses import resp_200, resp_404, resp_500, resp_400
from src.db.models import (
    Examination, ExamResult, ExamResultDetail, Paper, PaperModule, PaperQuestions
)
from src.db.schemas.lesson_examination import (
    ExaminationSchema, SearchExaminationSchema, UpdateExaminationSchema, ExamResultSchema, UpdateExamResultSchema,
    ExamResultDetailSchema, CreateExamResultSchema, QueryExamResultSchema, SearchPaperSchema, PaperSchema,
    UpdatePaperSchema, PaperModuleSchema, UpdatePaperModuleSchema, UpdatePaperQuestionSchema, PaperQuestionSchema
)

router = APIRouter()


# -----------------------------------------------考试信息

@router.post("/exam_info/filter_exam", tags=["ExaminationManage"], summary="查询考试信息")
async def list_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, exam_info: SearchExaminationSchema):
    dal.setDb(Examination)
    query_params_mapping = exam_info.dict(exclude_none=True)
    if exam_info.name is not None:
        query_params_mapping['name__contains'] = query_params_mapping.pop('name')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [ExaminationSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/exam_info/{id_}', tags=['ExaminationManage'], summary="通过id获取考试信息")
async def get_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Examination)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by(id=id_, is_delete=RESERVE, is_published=PUBLISHED)
    if not res:
        return resp_404(msg='没有找到该考试的详情信息！')
    data = ExaminationSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/exam_info", tags=["ExaminationManage"], summary="创建考试信息")
async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: ExaminationSchema):
    dal.setDb(Examination)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    res = await dal.create(obj_in)
    if not res:
        return resp_400(msg='创建失败')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data=res)


@router.delete("/exam_info/{id_}", tags=["ExaminationManage"], summary="删除考试信息")
async def delete_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Examination)
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


@router.patch("/exam_info/{id_}", tags=["ExaminationManage"], summary="编辑考试信息")
async def update_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateExaminationSchema):
    dal.setDb(Examination)
    # logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！考试不存在，无法进行编辑！')
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                          handle_user=obj_in.update_user, handle_params=obj_in.dict(),
    #                                          entity_id=id_, handle_reason='编辑考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------考试结果信息

@router.post("/exam_result/filter_exam", tags=["ExaminationManage"], summary="查询考试结果列表信息")
async def list_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, exam_info: QueryExamResultSchema):
    dal.setDb(ExamResult)
    query_params_mapping = exam_info.dict(exclude_none=True)
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [ExamResultSchema.from_orm(ms) for ms in res]
    #
    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type=code,
    #                                          handle_user='', handle_params=code,
    #                                          entity_id=table_res.id, handle_reason='查询考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/exam_result/{id_}', tags=['ExaminationManage'], summary="通过id获取考试结果信息")
async def get_exam_result_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResult)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by(id=id_)
    if not res:
        return resp_404(msg='没有找到该考试的详情信息！')
    data = ExamResultSchema.from_orm(res)

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
    #                                          handle_user="", handle_params=id_,
    #                                          entity_id=id_, handle_reason='通过id获取飞行计划的信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=data)


@router.post("/exam_result", tags=["ExaminationManage"], summary="创建考试结果信息")
async def create_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: CreateExamResultSchema):
    dal.setDb(ExamResult)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    exam_result_list = []
    student_id = obj_in.student_id
    if len(student_id) == 0:
        return resp_200(msg='考试关联的学生为空！')
    else:
        for s_id in student_id:
            exam_result_list.append({
                'exam_id': obj_in.exam_id,
                'student_id': s_id
            })
    await dal.create_all(exam_result_list)
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200()


@router.delete("/exam_result/{id_}", tags=["ExaminationManage"], summary="删除考试结果信息")
async def delete_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResult)
    # logger.info(f"删除考试信息:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='考试不存在，删除失败！')
    if ms.start_time is not None:
        return resp_400(msg='该学生已经参加考试，无法删除！')
    else:
        res = await dal.delete(id_)
        if not res:
            return resp_500()
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="column_manage",
    #                                              handle_user='', handle_params=id_,
    #                                              entity_id=id_, handle_reason='删除考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data={'id': id_})


@router.patch("/exam_result/{id_}", tags=["ExaminationManage"], summary="编辑考试信息")
async def update_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateExamResultSchema):
    dal.setDb(ExamResult)
    # logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！考试结果不存在，无法进行编辑！')
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                          handle_user=obj_in.update_user, handle_params=obj_in.dict(),
    #                                          entity_id=id_, handle_reason='编辑考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------考试结果详情

@router.get('/exam_info_detail/{id_}', tags=['ExaminationManage'], summary="通过考试结果ID获取详情信息")
async def get_exam_info_detail(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResultDetail)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by_all(exam_result_id=id_)
    if not res:
        return resp_404(msg='没有找到该考试结果的详情信息！')

    data = [ExamResultDetailSchema.from_orm(ms) for ms in res]

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
    #                                          handle_user="", handle_params=id_,
    #                                          entity_id=id_, handle_reason='通过id获取飞行计划的信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=data)


@router.post("/exam_info_detail", tags=["ExaminationManage"], summary="创建考试结果详情信息")
async def create_exam_info_detail(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, obj_in: ExamResultDetailSchema):
    dal.setDb(ExamResultDetail)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    res = await dal.create(obj_in)
    if not res:
        return resp_400(msg='创建失败')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data=res)


# -----------------------------------------------试卷信息

@router.post("/paper/filter_paper", tags=["ExaminationManage"], summary="查询试卷列表信息")
async def list_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, paper_info: SearchPaperSchema):
    dal.setDb(Paper)
    query_params_mapping = paper_info.dict(exclude_none=True)
    if paper_info.name is not None:
        query_params_mapping['name__contains'] = query_params_mapping.pop('name')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [PaperSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/paper/{id_}', tags=['ExaminationManage'], summary="通过id获取试卷信息")
async def get_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Paper)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='没有找到该试卷的详情信息！')
    data = PaperSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/paper", tags=["ExaminationManage"], summary="创建试卷信息")
async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, paper_info: PaperSchema):
    dal.setDb(Paper)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    res = await dal.create(paper_info)
    if not res:
        return resp_400(msg='创建试卷失败！')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data=res)


@router.delete("/paper/{id_}", tags=["ExaminationManage"], summary="删除试卷信息")
async def delete_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Paper)
    # logger.info(f"删除考试信息:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='试卷不存在，删除失败！')
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


@router.patch("/paper/{id_}", tags=["ExaminationManage"], summary="编辑试卷信息")
async def update_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdatePaperSchema):
    dal.setDb(Paper)
    # logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！试卷不存在，无法进行编辑！')
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                          handle_user=obj_in.update_user, handle_params=obj_in.dict(),
    #                                          entity_id=id_, handle_reason='编辑考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------试卷-模块信息

@router.get('/paper_module/{id_}', tags=['ExaminationManage'], summary="通过试卷ID获取模块信息")
async def get_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(PaperModule)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by_all(paper_id=id_)
    if not res:
        return resp_404(msg='没有找到该试卷的详情信息！')
    data = [PaperModuleSchema.from_orm(ms) for ms in res]
    return resp_200(data=data)


@router.post("/paper_module", tags=["ExaminationManage"], summary="创建试卷-模块信息")
async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, paper_info: PaperModuleSchema):
    dal.setDb(PaperModule)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    res = await dal.create(paper_info)
    if not res:
        return resp_400(msg='创建失败')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data=res)


@router.delete("/paper_module/{id_}", tags=["ExaminationManage"], summary="删除试卷-模块信息")
async def delete_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, paper_id: str):
    dal.setDb(PaperModule)
    # logger.info(f"删除考试信息:{id_}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='模块不存在，删除失败！')
    res = await dal.get_by(id=id_, paper_id=paper_id)
    if len(res) > 0:
        return resp_400(msg='该模块存在绑定的试题，无法删除！')
    else:
        delete_res = await dal.delete(id_)
        if not delete_res:
            return resp_500()
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="column_manage",
    #                                              handle_user='', handle_params=id_,
    #                                              entity_id=id_, handle_reason='删除考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #
    return resp_200(data={'id': id_})


@router.patch("/paper_module/{id_}", tags=["ExaminationManage"], summary="编辑试卷-模块信息")
async def update_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdatePaperModuleSchema):
    dal.setDb(PaperModule)
    # logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！模块不存在，无法进行编辑！')
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                          handle_user=obj_in.update_user, handle_params=obj_in.dict(),
    #                                          entity_id=id_, handle_reason='编辑考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------试卷-试题信息

@router.get('/paper_question/{id_}', tags=['ExaminationManage'], summary="通过试卷ID获取试题信息")
async def get_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(PaperQuestions)
    # logger.debug(f"通过id获取考试信息:{id_}")
    res = await dal.get_by_all(paper_id=id_,
                               order_by_list=[SortBy('sort', False), SortBy('sequence_number', False)])
    if not res:
        return resp_404(msg='没有找到该试卷关联的试题信息！')
    data = [PaperModuleSchema.from_orm(ms) for ms in res]
    return resp_200(data=data)


@router.post("/paper_question", tags=["ExaminationManage"], summary="创建试卷-试题信息")
async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, paper_info: PaperQuestionSchema):
    dal.setDb(PaperQuestions)
    # logger.info(f"创建数据库表的列:{obj_in.dict()}")
    res = await dal.create(paper_info)
    if not res:
        return resp_400(msg='创建失败')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                              handle_user=obj_in.create_user, handle_params=obj_in.dict(),
    #                                              entity_id=res.id, handle_reason='创建考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    # TODO 增加自动创建试卷
    return resp_200(data=res)


@router.delete("/paper_question/{id_}", tags=["ExaminationManage"], summary="删除试卷-试题信息")
async def delete_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, ids_: List[str]):
    dal.setDb(PaperQuestions)
    # logger.info(f"删除考试信息:{id_}")
    # 存放即将删除的试题IDs
    to_delete_ids = []
    # 存放不存在的试题IDs
    not_exists_ids = []
    for q_id in ids_:
        ms = await dal.get(q_id)
        if ms:
            to_delete_ids.append(q_id)
        else:
            not_exists_ids.append(q_id)

    if len(to_delete_ids) == 0:
        return resp_200(data={'notExistsQuestions': not_exists_ids}, msg='没有可以删除试题！')
    else:
        await dal.delete_batch(to_delete_ids)
        if len(not_exists_ids) > 0:
            return resp_200(msg='删除试题成功！但有不存在的试题ID', data={'notExistsQuestions': not_exists_ids})
        else:
            return resp_200(msg='删除试题成功!')
    #
    #     mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="column_manage",
    #                                              handle_user='', handle_params=id_,
    #                                              entity_id=id_, handle_reason='删除考试信息')
    #     await sql_handle.add_records("log_manage", mysql_log_data)
    #


@router.patch("/paper_question/{id_}", tags=["ExaminationManage"], summary="编辑试卷-试题信息")
async def update_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdatePaperQuestionSchema):
    dal.setDb(PaperQuestions)
    # logger.info(f"修改数据库表的列:{obj_in.dict()}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！试题绑定信息不存在，无法进行编辑！')
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    # mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=table_res.code,
    #                                          handle_user=obj_in.update_user, handle_params=obj_in.dict(),
    #                                          entity_id=id_, handle_reason='编辑考试信息')
    # await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')
