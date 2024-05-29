#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    : teaching_resources_manage.py
# @Software: PyCharm
import copy
from typing import List
from src.db.dals import ExecDAL, SortBy
from fastapi import APIRouter, Depends, Query
from sqlalchemy.exc import SQLAlchemyError

from src.db.models.exam_result import ScoreStatistics
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import PUBLISHED, DELETE, RESERVE, RecordsStatusCode
from src.utils.responses import resp_200, resp_404, resp_500, resp_400
from src.utils.exam_related_tools import ExamPaperGenerator
from src.utils.exam_related_tools import CalculateGrade, cal_grade_percentage
from src.db.models import (
    Examination, ExamResult, ExamResultDetail, Paper, PaperQuestions, Questions
)
from src.db.schemas.lesson_examination import (
    ExaminationSchema, SearchExaminationSchema, ExamResultSchema, UpdateExamResultSchema,
    ExamResultDetailSchema, QueryExamResultSchema, SearchPaperSchema, PaperSchema, PaperQuestionSchema,
    CreatePaperQuestionSchema, EditPaperSchema, QuestionSchema, EditExamResultSchema, EditExamResultDetailSchema,
    CalQuestion, StudentAnswer, StudentExamResult, StudentIn, EditExaminationSchema, EditScoreStatisticsSchema,
    ScoreStatisticsSchema
)

router = APIRouter()


# -----------------------------------------------考试信息

@router.post("/exam_info/filter_exam", tags=["Examination"], summary="查询考试信息")
async def list_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, exam_info: SearchExaminationSchema):
    dal.setDb(Examination)
    query_params_mapping = exam_info.dict(exclude_none=True)
    query_params_mapping.update(is_delete=RESERVE)
    if exam_info.name is not None:
        query_params_mapping['name__contains'] = query_params_mapping.pop('name')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [ExaminationSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/exam_info/{id_}', tags=['Examination'], summary="通过id获取考试信息")
async def get_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Examination)
    res = await dal.get_by(id=id_, is_delete=RESERVE, is_published=PUBLISHED)
    if not res:
        return resp_404(msg='没有找到该考试的详情信息！')
    data = ExaminationSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/exam_info", tags=["Examination"], summary="创建考试信息")
async def create_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, exam_info: EditExaminationSchema):
    dal.setDb(Examination)
    res = await dal.create(exam_info)
    if not res:
        return resp_400(msg='创建失败')

    exam_data = exam_info.dict()
    if exam_info.exam_date:
        exam_data.update({'exam_date': exam_info.exam_date.strftime('%Y-%m-%d')})
    if exam_info.start_time:
        exam_data.update({'start_time': exam_info.start_time.strftime('%Y-%m-%d %H:%M:%S')})
    if exam_info.end_time:
        exam_data.update({'end_time': exam_info.end_time.strftime('%Y-%m-%d %H:%M:%S')})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='examination',
                                             handle_user='', handle_params=exam_data,
                                             entity_id=res.id, handle_reason='创建考试信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/exam_info/{id_}", tags=["Examination"], summary="删除考试信息")
async def delete_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Examination)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='考试不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="examination",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除考试信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/exam_info/{id_}", tags=["Examination"], summary="编辑考试信息")
async def update_exam_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, exam_info: EditExaminationSchema):
    dal.setDb(Examination)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！考试不存在，无法进行编辑！')
    res = await dal.update(id_, exam_info)
    if not res:
        return resp_500()

    exam_data = exam_info.dict()
    if exam_info.exam_date:
        exam_data.update({'exam_date': exam_info.exam_date.strftime('%Y-%m-%d')})
    if exam_info.start_time:
        exam_data.update({'start_time': exam_info.start_time.strftime('%Y-%m-%d %H:%M:%S')})
    if exam_info.end_time:
        exam_data.update({'end_time': exam_info.end_time.strftime('%Y-%m-%d %H:%M:%S')})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='examination',
                                             handle_user='', handle_params=exam_data,
                                             entity_id=id_, handle_reason='编辑考试信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------试卷信息

@router.post("/paper/filter_paper", tags=["Paper"], summary="查询试卷列表信息")
async def list_paper_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, paper_info: SearchPaperSchema):
    dal.setDb(Paper)
    query_params_mapping = paper_info.dict(exclude_none=True)
    query_params_mapping.update(is_delete=RESERVE)
    if paper_info.name is not None:
        query_params_mapping['name__contains'] = query_params_mapping.pop('name')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [PaperSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/paper/{id_}', tags=['Paper'], summary="通过id获取试卷信息")
async def get_paper_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Paper)
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='没有找到该试卷的详情信息！')
    data = PaperSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/paper", tags=["Paper"], summary="创建试卷信息")
async def create_paper_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                            exam_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                            *, paper_info: EditPaperSchema):
    exam_dal.setDb(Examination)
    exam_res = await exam_dal.get_by(name=paper_info.name)
    if not exam_res:
        return resp_400(msg=f'考试信息错误：{paper_info.name}')
    dal.setDb(Paper)
    res = await dal.create(paper_info)
    if not res:
        return resp_400(msg='创建试卷失败！')
    await exam_dal.update(exam_res.id, {"paper_id": res.id})
    paper_data = paper_info.dict()
    if paper_info.publish_date:
        paper_data.update({'publish_date': paper_info.publish_date.strftime('%Y-%m-%d %H:%M:%S')})
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='paper',
                                             handle_user='', handle_params=paper_data,
                                             entity_id=res.id, handle_reason='创建考试信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/paper/{id_}", tags=["Paper"], summary="删除试卷信息")
async def delete_paper_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Paper)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='试卷不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="paper",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除考试信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/paper/{id_}", tags=["Paper"], summary="编辑试卷信息")
async def update_paper_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, paper_info: EditPaperSchema):
    dal.setDb(Paper)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='编辑失败！试卷不存在，无法进行编辑！')
    res = await dal.update(id_, paper_info)
    if not res:
        return resp_500()
    paper_data = paper_info.dict()
    if paper_info.publish_date:
        paper_data.update({'publish_date': paper_info.publish_date.strftime('%Y-%m-%d %H:%M:%S')})
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='paper',
                                             handle_user='', handle_params=paper_data,
                                             entity_id=id_, handle_reason='编辑试卷信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------试卷-试题信息

@router.get('/paper_question/{id_}', tags=['PaperQuestions'], summary="通过试卷ID获取试题信息")
async def get_paper_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                  question_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(PaperQuestions)
    res = await dal.get_by_all(paper_id=id_,
                               order_by_list=[SortBy('sort', False), SortBy('sequence_number', False)])
    if not res:
        return resp_200(data=[])
    paper_question_info = []
    question_dal.setDb(Questions)
    for ms in res:
        id_ = ms.question_id
        question = await question_dal.get_by(id=id_)
        question_info = QuestionSchema.from_orm(question)
        paper_question_info.append(question_info)
    return resp_200(data=paper_question_info)


@router.post("/paper_question", tags=["PaperQuestions"], summary="创建试卷-试题信息")
# @router.post("/create_paper", tags=["SqlHandle"], summary="创建试卷")
async def create_paper_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                     create_paper_question: CreatePaperQuestionSchema):
    paper_info_list = []
    create_paper_dict = create_paper_question.dict()
    question_type_counts = {k: v for k, v in create_paper_dict.items() if
                            k in ['single_choice', 'multiple_choice', 'fill', 'judge', 'short_answer']}
    exam_paper = ExamPaperGenerator("questions")
    exam_paper_info = await exam_paper.generate_exam(question_type_counts, create_paper_question.course_chapter_id)
    for idx, question in enumerate(exam_paper_info):
        paper_info = PaperQuestionSchema()
        paper_info.paper_id = create_paper_question.paper_id
        paper_info.question_id = question.question_id
        paper_info.sequence_number = idx + 1
        paper_info.module = question.question_type
        paper_info_list.append(paper_info)
    dal.setDb(PaperQuestions)
    res = await dal.buck_create(paper_info_list)
    if not res:
        return resp_400(msg='创建失败')

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='paper_questions',
                                             handle_user='', handle_params=create_paper_dict,
                                             entity_id='', handle_reason='创建试卷-试题信息')
    await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200(data=res)


@router.delete("/paper_question", tags=["PaperQuestions"], summary="删除试卷-试题信息")
async def delete_paper_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, ids_: List[str]):
    dal.setDb(PaperQuestions)
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

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="paper_questions",
                                             handle_user='', handle_params=ids_,
                                             entity_id='', handle_reason='删除试卷-试题信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    if len(to_delete_ids) == 0:
        return resp_200(data={'notExistsQuestions': not_exists_ids}, msg='没有可以删除试题！')
    else:
        await dal.delete_batch(to_delete_ids)
        if len(not_exists_ids) > 0:
            return resp_200(msg='删除试题成功！但有不存在的试题ID', data={'notExistsQuestions': not_exists_ids})
        else:
            return resp_200(msg='删除试题成功!')


@router.patch("/paper_question/{id_}", tags=["PaperQuestions"], summary="编辑试卷-试题信息")
async def update_paper_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                     paper_question: PaperQuestionSchema):
    dal.setDb(PaperQuestions)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！试题绑定信息不存在，无法进行编辑！')
    res = await dal.update(id_, paper_question)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='paper_questions',
                                             handle_user='', handle_params=paper_question.dict(),
                                             entity_id=id_, handle_reason='编辑试卷-试题信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------考试结果信息

@router.post("/exam_result/filter_exam_result", tags=["ExamResult"], summary="查询考试结果列表信息")
async def list_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                           exam_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                           *, exam_info: QueryExamResultSchema):
    query_params_mapping = exam_info.dict(exclude_none=True)
    query_params_mapping.update(is_delete=RESERVE)
    exam_dal.setDb(Examination)
    exam_res = await exam_dal.get_by_all(**query_params_mapping)
    if not exam_res:
        return resp_200(data=[])
    exam_res_list = []
    dal.setDb(ExamResult)
    for exam in exam_res:
        res = await dal.get_by_all(exam_id=exam.id, order_by_list=[SortBy('total_score', True)])
        for idx, ms in enumerate(res):
            ms_data = ExamResultSchema.from_orm(ms)
            ms_dict = ms_data.dict()
            ms_dict.update(name=exam.name)
            ms_dict.update(major=exam.major)
            ms_dict.update(rank=idx + 1)
            exam_res_list.append(ms_dict)

    return resp_200(data={"data": exam_res_list})


@router.get('/exam_result/{id_}', tags=['ExamResult'], summary="通过id获取考试结果信息")
async def get_exam_result_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResult)
    res = await dal.get_by(id=id_)
    if not res:
        return resp_404(msg='没有找到该考试的详情信息！')
    data = ExamResultSchema.from_orm(res)

    return resp_200(data=data)


@router.post("/exam_result/cal_grade", tags=["ExamResult"], summary="计算考试结果")
# @router.post("/cal_grade", tags=["SqlHandle"], summary="计算考试结果")
async def cal_grade(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    exam_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    question_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    paper_question_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    result_detail_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    *, payload: StudentIn):
    if len(payload.student_id) == 0:
        return resp_200(msg='考试关联的学生为空')
    # 获取考试信息
    exam_dal.setDb(Examination)
    exam_res = await exam_dal.get(payload.exam_id)
    if not exam_res:
        return resp_404(msg='未获取到考试相关信息')
    # 获取试卷信息
    paper_question_dal.setDb(PaperQuestions)
    paper_question_res = await paper_question_dal.get_by_all(paper_id=exam_res.paper_id)
    if not paper_question_res:
        return resp_404(msg='未获取到试卷相关信息')
    # 获取考题信息
    cal_question_info = []
    question_dal.setDb(Questions)
    for ms in paper_question_res:
        question = await question_dal.get_by(id=ms.question_id)
        question_info = CalQuestion.from_orm(question)
        cal_question_info.append(question_info)
    if len(cal_question_info) == 0:
        return resp_404(msg='未获取到试卷-考题相关信息')
    # 学生考试结果信息
    student_exam = []
    dal.setDb(ExamResult)
    result_detail_dal.setDb(ExamResultDetail)
    res = await dal.get_by_all(exam_id=payload.exam_id)
    for rs in res:
        for s_id in payload.student_id:
            if rs.student_id == s_id:
                student_er = StudentExamResult.from_orm(rs)
                student_exam.append(student_er)
    if len(student_exam) == 0:
        return resp_404(msg='未获取到学生考试结果相关信息')

    # 学生作答信息
    student_exam_result = dict()
    for student in student_exam:
        student_answer = []
        result_detail_res = await result_detail_dal.get_by_all(exam_result_id=student.id, is_delete=RESERVE)
        for s_a in result_detail_res:
            question_info = StudentAnswer.from_orm(s_a)
            student_answer.append(question_info)
            student_exam_result.update({student.id: student_answer})
    # cal_question_info考卷信息，答案及每道题的得分
    # student_exam_result：{student.id: student_answer}学生的id及其答题情况
    exam_result_list, exam_detail_result_list = [], []
    c_q = CalculateGrade()
    for s_id, s_answers in student_exam_result.items():
        stu_score, stu_score_detail = c_q.cal_grade(cal_question_info, s_answers, payload)
        exam_detail_result_list.extend(stu_score_detail)
        exam_result_res = await dal.update(s_id, {
            'total_score': stu_score,
            'start_time': exam_res.start_time,
            'end_time': exam_res.end_time})
        exam_result_list.append(exam_result_res)
    for exam_detail_result in exam_detail_result_list:
        await result_detail_dal.update(exam_detail_result["id"], exam_detail_result)
    return resp_200(data=exam_result_list)


@router.post("/exam_result", tags=["ExamResult"], summary="创建考试结果信息")
async def create_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                             *, exam_result: EditExamResultSchema):
    dal.setDb(ExamResult)
    student_id = exam_result.student_id
    if not student_id:
        return resp_200(msg='考试关联的学生为空！')
    else:
        res = await dal.create(exam_result)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='exam_info',
                                             handle_user='', handle_params=exam_result.dict(),
                                             entity_id='', handle_reason='创建考试结果信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/exam_result/{id_}", tags=["ExamResult"], summary="删除考试结果信息")
async def delete_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResult)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='考试不存在，删除失败！')
    if ms.start_time is not None:
        return resp_400(msg='该学生已经参加考试，无法删除！')
    else:
        res = await dal.delete(id_)
        if not res:
            return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="exam_info",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除考试结果信息')
    await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200(data={'id': id_})


@router.patch("/exam_result/{id_}", tags=["ExamResult"], summary="编辑考试结果信息")
async def update_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateExamResultSchema):
    dal.setDb(ExamResult)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！考试结果不存在，无法进行编辑！')
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='exam_info',
                                             handle_user='', handle_params=obj_in.dict(),
                                             entity_id=id_, handle_reason='编辑考试结果信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------考试结果详情

@router.get('/exam_info_detail/{id_}', tags=['ExamResultDetail'], summary="通过考试结果ID获取详情信息")
async def get_exam_info_detail(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResultDetail)
    res = await dal.get_by_all(exam_result_id=id_)
    if not res:
        return resp_200(data=[])

    data = [ExamResultDetailSchema.from_orm(ms) for ms in res]

    return resp_200(data=data)


@router.post("/exam_info_detail", tags=["ExamResultDetail"], summary="创建考试结果详情信息")
async def create_exam_info_detail(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                  result_detail: List[EditExamResultDetailSchema]):
    dal.setDb(ExamResultDetail)
    try:
        await dal.create_all(result_detail)
    except SQLAlchemyError:
        return resp_400()
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='exam_result_detail',
                                             handle_user='', handle_params=[result.dict() for result in result_detail],
                                             entity_id='', handle_reason='创建考试结果详情信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200()


# -----------------------------------------------考试成绩统计
@router.get("/score_statistics/filter_score_statistics", tags=["ScoreStatistics"], summary="查询考试成绩统计信息")
async def list_score_statistics_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     limit: int = Query(default=30), offset: int = Query(default=0),
                                     name: str = Query(None), major: str = Query(None)):
    dal.setDb(ScoreStatistics)
    variables = {"limit": limit, "offset": offset,
                 "name": name,
                 "major": major,
                 "is_delete": RESERVE}
    query_params_mapping = {k: v for k, v in filter(lambda item: item[1] is not None, variables.items())}
    if name is not None:
        query_params_mapping['name__contains'] = query_params_mapping.pop('name')
    if major is not None:
        query_params_mapping['major__contains'] = query_params_mapping.pop('major')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [ScoreStatisticsSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.post("/score_statistics", tags=["ScoreStatistics"], summary="创建考试成绩统计信息")
async def create_score_statistics_detail(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                         exam_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                         exam_result_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                         *, name: str):
    dal.setDb(ScoreStatistics)
    exam_dal.setDb(Examination)
    exam_result_dal.setDb(ExamResult)
    score_statistics_list, score_statistics = [], {}
    exam_res = await exam_dal.get_by_all(name=name)
    for exam_info in exam_res:
        score_statistics.update(name=name)
        score_statistics.update(major=exam_info.major)
        exam_result_res = await exam_result_dal.get_by_all(exam_id=exam_info.id,
                                                           order_by_list=[SortBy('total_score', True)])
        score_statistics.update(student_num=len(exam_result_res))
        score_statistics.update(highest_score=exam_result_res[0].total_score)
        score_statistics.update(lowest_score=exam_result_res[-1].total_score)
        score_statistics.update(average_score=
                                round(sum([con.total_score for con in exam_result_res]) / len(exam_result_res), 2))
        ideal_percentage, good_percentage, pass_percentage, flunk_percentage = cal_grade_percentage(exam_result_res)
        score_statistics.update(ideal_percentage=ideal_percentage)
        score_statistics.update(good_percentage=good_percentage)
        score_statistics.update(pass_percentage=pass_percentage)
        score_statistics.update(flunk_percentage=flunk_percentage)
        score_statistics_list.append(copy.copy(score_statistics))

    try:
        await dal.create_all(score_statistics_list)
    except SQLAlchemyError:
        return resp_400()

    return resp_200()
