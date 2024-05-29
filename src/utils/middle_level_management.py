#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    :
# @Software: PyCharm
import asyncio
import datetime
from datetime import date

from src.config.setting import settings
from src.utils import generate_uuid, generate_bigint_id
from src.db.models import CourseSource, CourseChapter, Questions, CourseSchedule, TeachingJournal, Document, \
    OnlineLearningRecord
from src.db.schemas.lesson_examination import (
    QuestionSchema, SearchQuestionSchema, ScheduleSchema, EditScheduleSchema,
    TeachingJournalSchema, EditTeachingJournalSchema,
    CourseChapterSchema, SearchCourseChapterSchema, CourseSourceSchema, EditCourseChapterSchema, CourseChapterID,
    EditQuestionSchema, CourseSourceFile, OnlineLearningRecordSchema, EditOnlineLearningRecordSchema,
    ShowOnlineLearningRecord
)
import copy
from typing import List
from src.db.dals import ExecDAL, SortBy
from fastapi import APIRouter, Depends, Query
from sqlalchemy.exc import SQLAlchemyError

from src.db.models.exam_result import ScoreStatistics
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import PUBLISHED, DELETE, RESERVE, RecordsStatusCode, QUESTION_TYPE_LIST
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


# -----------------------------------------------课程/教学资源信息
async def create_course_source_info(table_name, source_info):
    course_source_dict = await sql_handle.get_table_columns(table_name)


# -----------------------------------------------题库信息管理

async def create_question_info(table_name, question_info):
    question_dict = await sql_handle.get_table_columns(table_name)


# -----------------------------------------------在线学习信息
async def create_online_learning_record_info(table_name, source_info):
    """
    在线学习信息
    Args:
        table_name: auto_online_learning_record
        source_info:

    Returns:

    """
    teaching_resource_id = source_info.get("course_id")
    teaching_resource_res = await sql_handle.select("auto_teaching_resource_management", {"id": teaching_resource_id})
    teaching_resource_info = teaching_resource_res[0]
    online_learning_dict = await sql_handle.get_table_columns(table_name)
    online_learning_dict.update(id=teaching_resource_id)
    online_learning_dict.update(UID=source_info.get("user_id"))
    online_learning_dict.update(keep_time=source_info.get("keep_time"))
    online_learning_dict.update(LID=generate_bigint_id())
    online_learning_dict.update(learning_content=teaching_resource_info.get("course_name"))
    online_learning_dict.update(RID=teaching_resource_info.get("RID"))
    online_learning_dict.update(is_delete=RESERVE)
    online_learning_dict.update(date=datetime.datetime.now().strftime("%Y-%m-%d"))
    online_learning_dict.update(create_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    online_learning_dict.update(update_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

    return online_learning_dict


# source_info = {"course_id": "47981834-c597-4d22-8b5b-0f1ae6b75b58", "keep_time": 50, "user_id": 47981834597}
# asyncio.run(create_online_learning_record_info("auto_online_learning_record", source_info))


# -----------------------------------------------考试管理

async def create_exam_info(table_name, exam_info):
    """
    考试信息
    Args:
        table_name: auto_examination
        exam_info:

    Returns:

    """
    try:
        exam_dict = await sql_handle.get_table_columns(table_name)
        exam_dict.update(EID=generate_bigint_id())
        exam_dict.update(**exam_info)
        single_choice_num = int(exam_info.get("single_choice_num", 0))
        single_choice_score = int(exam_info.get("single_choice_score", 0))
        total_single_choice_score = single_choice_score * single_choice_num

        multiple_choice_num = int(exam_info.get("multiple_choice_num", 0))
        multiple_choice_score = int(exam_info.get("multiple_choice_score", 0))
        total_multiple_choice_score = multiple_choice_score * multiple_choice_num

        judge_num = int(exam_info.get("judge_num", 0))
        judge_score = int(exam_info.get("judge_score", 0))
        total_judge_score = judge_score * judge_num

        fill_num = int(exam_info.get("fill_num", 0))
        fill_score = int(exam_info.get("fill_score", 0))
        total_fill_score = fill_score * fill_num

        short_answer_num = int(exam_info.get("short_answer_num", 0))
        short_answer_score = int(exam_info.get("short_answer_score", 0))
        total_short_answer_score = short_answer_score * short_answer_num

        total_exam_score = total_single_choice_score + total_multiple_choice_score + total_judge_score + total_fill_score + total_short_answer_score
        exam_dict.update(total_exam_score=total_exam_score)
        return exam_dict
    except ValueError as err:
        logger.error(err)
        return []


async def get_exam_question_info(code, conditions):
    """

    Args:
        code:
        conditions:

    Returns:

    """
    try:
        table_name = f"auto_{code}"
        # 获取考试信息
        e_res = await sql_handle.select(table_name, conditions)
        if not conditions:
            return e_res

        if not e_res:
            return []
        eid = e_res[0].get("EID")

        # 获取试卷信息
        paper_condition = {"EID": eid}
        pi_res = await sql_handle.select("auto_paper_info", paper_condition, fields=["PIID"])
        if not pi_res:
            return []

        pid = pi_res[0].get("PIID")

        paper_question_res = await get_paper_question_info("auto_exam_result_detail", pid)
        if not paper_question_res:
            return []
        return paper_question_res
    except ValueError as err:
        logger.error(err)
        return []


# asyncio.run(create_exam_info("auto_examination"))


# -----------------------------------------------在线考试

# 试卷总体信息
async def create_paper_info(table_name, paper_info):
    """
    试卷总体信息
    Args:
        table_name: auto_paper_info
        paper_info:

    Returns:

    """
    try:
        paper_dict = await sql_handle.get_table_columns(table_name)
        paper_dict.update(UID=generate_bigint_id())
        paper_dict.update(PID=generate_bigint_id())
        paper_dict.update(PIID=generate_bigint_id())
        paper_dict.update(**paper_info)
        return paper_dict
    except ValueError as err:
        logger.error(err)
        return []


# asyncio.run(create_paper_info("auto_paper_info", {}))


def distribute_course_ratio(course_info, question_type_counts):
    """
    获取课程及其比例,按比例分派题目数量
    Args:
        course_info:
        question_type_counts:
    Returns:

    """
    course_ratio_dict, ratio_counts, last_ratio_count = {}, {}, {}
    for i in range(1, 11):
        if not course_info[f"ratio_{i}"]:
            continue
        course_ratio_dict[f"course_{i}"] = course_info[f"ratio_{i}"]
    length, counter = len(course_ratio_dict), 0
    for ratio_key, ratio_value in course_ratio_dict.items():
        counter += 1
        if counter < length:
            ratio_counts[course_info[ratio_key]] = {key: int(value * ratio_value) for key, value
                                                    in question_type_counts.items()}
        else:
            continue
    keys = list(course_ratio_dict.keys())
    if not keys:
        return ratio_counts
    last_key = keys[-1]

    single_choice, multiple_choice, fill, judge, short_answer = 0, 0, 0, 0, 0
    for k, v in ratio_counts.items():
        single_choice += v.get("single_choice_num")
        multiple_choice += v.get("multiple_choice_num")
        fill += v.get("fill_num")
        judge += v.get("judge_num")
        short_answer += v.get("short_answer_num")
    for key, value in question_type_counts.items():
        if key == "single_choice_num":
            last_ratio_count["single_choice_num"] = value - single_choice
        if key == "multiple_choice_num":
            last_ratio_count["multiple_choice_num"] = value - multiple_choice
        if key == "fill_num":
            last_ratio_count["fill_num"] = value - fill
        if key == "judge_num":
            last_ratio_count["judge_num"] = value - judge
        if key == "short_answer_num":
            last_ratio_count["short_answer_num"] = value - short_answer
    ratio_counts[course_info[last_key]] = last_ratio_count
    return ratio_counts


# 试题答题和得分等信息
# async def create_paper_question_info(table_name, create_paper_question, pid, course_info):
async def create_paper_question_info(table_name, pid, course_info):
    """
    生成试卷
    Args:
        table_name: auto_exam_result_detail
        pid: 试卷 ID
        create_paper_question: 试卷组成内容及数量，eg:{"fill": 5, "judge": 5, "multiple_choice": 5, "short_answer": 5, "single_choice": 10}
        course_info: 课程信息

    Returns:

    """
    paper_question_dict = await sql_handle.get_table_columns(table_name)
    paper_question_dict.update(PID=pid)
    paper_question_dict.update(reviewed=False)
    paper_question_dict.update(update_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

    paper_info_list = []
    question_type_counts = {k: v for k, v in course_info.items() if
                            k in QUESTION_TYPE_LIST}

    course_ratio = distribute_course_ratio(course_info, question_type_counts)

    exam_paper = ExamPaperGenerator("auto_question_bank")
    for course_id, question_type in course_ratio.items():
        exam_paper_info = await exam_paper.generate_exam(question_type, course_id)
        for idx, question in enumerate(exam_paper_info):
            try:
                paper_question_dict.update(id=generate_uuid())
                paper_question_dict.update(ERID=generate_bigint_id())
                paper_question_dict["serial_number"] = idx + 1
                paper_question_dict["QID"] = question.QID
                paper_info_list.append(copy.copy(paper_question_dict))
            except AttributeError as err:
                logger.error(f"{err}:INFO:{exam_paper_info}:Index:{idx}:Content:{question}")
                return False
    await sql_handle.batch_insert(table_name, paper_info_list)
    return paper_info_list, question_type_counts


# question_type = {"fill": 4, "judge": 4, "multiple_choice": 4, "short_answer": 5, "single_choice": 12}
# exam_paper_info = asyncio.run(create_paper_question_info("auto_exam_result_detail", question_type))
# print(exam_paper_info)


async def get_paper_question_info(table_name, pid):
    """
    获取试卷-题目详细内容
    Args:
        table_name: auto_exam_result_detail
        pid: 试卷 ID

    Returns:

    """
    condition = {"PID": pid}
    table_info = await sql_handle.select(table_name, conditions=condition)
    if not table_info:
        return
    qid_list = []
    for info in table_info:
        qid_list.append(info["QID"])
        used_time = await sql_handle.select("auto_question_bank", {"QID": info["QID"]}, fields=["used_times"])
        await sql_handle.update("auto_question_bank", {"QID": info["QID"]},
                                {"used_times": used_time[0]["used_times"] + 1})
    question_condition = {"QID": {"value": qid_list, "operator": "in"}}
    question_info_list = await sql_handle.select("auto_question_bank", conditions=question_condition)
    return question_info_list


# exam_paper_info = asyncio.run(get_paper_question_info("auto_exam_result_detail", 1799812686502956124))
# print(exam_paper_info)


create_fun_dict = {settings.EXAMINATION: create_exam_info, settings.PAPER: create_paper_info,
                   settings.ONLINE_LEARNING: create_online_learning_record_info}
get_fun_dict = {settings.EXAMINATION: get_exam_question_info}


# -----------------------------------------------飞行计划制定

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
        res = await dal.get_by_all(exam_id=exam.id, order_by_list=[SortBy("total_score", True)])
        for idx, ms in enumerate(res):
            ms_data = ExamResultSchema.from_orm(ms)
            ms_dict = ms_data.dict()
            ms_dict.update(name=exam.name)
            ms_dict.update(major=exam.major)
            ms_dict.update(rank=idx + 1)
            exam_res_list.append(ms_dict)

    return resp_200(data={"data": exam_res_list})


@router.get("/exam_result/{id_}", tags=["ExamResult"], summary="通过id获取考试结果信息")
async def get_exam_result_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResult)
    res = await dal.get_by(id=id_)
    if not res:
        return resp_404(msg="没有找到该考试的详情信息！")
    data = ExamResultSchema.from_orm(res)

    return resp_200(data=data)


@router.post("/exam_result", tags=["ExamResult"], summary="创建考试结果信息")
async def create_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                             *, exam_result: EditExamResultSchema):
    dal.setDb(ExamResult)
    student_id = exam_result.student_id
    if not student_id:
        return resp_200(msg="考试关联的学生为空！")
    else:
        res = await dal.create(exam_result)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="exam_info",
                                             handle_user="", handle_params=exam_result.dict(),
                                             entity_id="", handle_reason="创建考试结果信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/exam_result/{id_}", tags=["ExamResult"], summary="删除考试结果信息")
async def delete_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(ExamResult)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg="考试不存在，删除失败！")
    if ms.start_time is not None:
        return resp_400(msg="该学生已经参加考试，无法删除！")
    else:
        res = await dal.delete(id_)
        if not res:
            return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="exam_info",
                                             handle_user="", handle_params=id_,
                                             entity_id=id_, handle_reason="删除考试结果信息")
    await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200(data={"id": id_})


@router.patch("/exam_result/{id_}", tags=["ExamResult"], summary="编辑考试结果信息")
async def update_exam_result(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, obj_in: UpdateExamResultSchema):
    dal.setDb(ExamResult)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg="编辑失败！考试结果不存在，无法进行编辑！")
    res = await dal.update(id_, obj_in)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="exam_info",
                                             handle_user="", handle_params=obj_in.dict(),
                                             entity_id=id_, handle_reason="编辑考试结果信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg="编辑成功")


# -----------------------------------------------课程表资源信息
@router.get("/course_schedule/filter_course_schedule", tags=["CourseSchedule"], summary="查询课程表信息")
async def list_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                    limit: int = Query(default=30), offset: int = Query(default=0),
                                    course_name: str = Query(None), classroom: str = Query(None),
                                    teacher: str = Query(None), classes: str = Query(None), status: int = Query(None),
                                    course_date: date = Query(None)):
    dal.setDb(CourseSchedule)
    variables = {"limit": limit, "offset": offset,
                 "course_name": course_name,
                 "course_date": course_date,
                 "classroom": classroom,
                 "teacher": teacher,
                 "classes": classes,
                 "status": status,
                 "is_delete": RESERVE
                 }
    query_params_mapping = {k: v for k, v in filter(lambda item: item[1] is not None, variables.items())}
    if course_name is not None:
        query_params_mapping["course_name__contains"] = query_params_mapping.pop("course_name")
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [ScheduleSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get("/course_schedule/{id_}", tags=["CourseSchedule"], summary="通过id获取课程表信息")
async def get_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseSchedule)
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg="试题不存在！")
    data = ScheduleSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/course_schedule", tags=["CourseSchedule"], summary="创建课程表信息")
async def create_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, schedule_info: EditScheduleSchema):
    dal.setDb(CourseSchedule)
    res = await dal.create(schedule_info)
    if not res:
        return resp_400(msg="创建失败！")
    schedule_data = schedule_info.dict()
    if schedule_info.course_date:
        schedule_data.update({"course_date": schedule_info.course_date.strftime("%Y-%m-%d")})
    if schedule_info.course_start:
        schedule_data.update({"course_start": schedule_info.course_start.strftime("%Y-%m-%d %H:%M:%S")})
    if schedule_info.course_end:
        schedule_data.update({"course_end": schedule_info.course_end.strftime("%Y-%m-%d %H:%M:%S")})
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_schedule",
                                             handle_user="", handle_params=schedule_data,
                                             entity_id=res.id, handle_reason="创建课程表信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/course_schedule/{id_}", tags=["CourseSchedule"], summary="删除课程表信息")
async def delete_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseSchedule)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg="课程表不存在，删除失败！")
    res = await dal.update(id_, {"is_delete": DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_schedule",
                                             handle_user="", handle_params=id_,
                                             entity_id=id_, handle_reason="删除课程表信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={"id": id_})


@router.patch("/course_schedule/{id_}", tags=["CourseSchedule"], summary="编辑课程表信息")
async def update_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                      schedule_info: EditScheduleSchema):
    dal.setDb(CourseSchedule)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg="编辑失败！课程表不存在，无法进行编辑！")
    res = await dal.update(id_, schedule_info)
    if not res:
        return resp_500()
    schedule_data = schedule_info.dict()

    if schedule_info.course_date:
        schedule_data.update({"course_date": schedule_info.course_date.strftime("%Y-%m-%d")})
    if schedule_info.course_start:
        schedule_data.update({"course_start": schedule_info.course_start.strftime("%Y-%m-%d %H:%M:%S")})
    if schedule_info.course_end:
        schedule_data.update({"course_end": schedule_info.course_end.strftime("%Y-%m-%d %H:%M:%S")})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_schedule",
                                             handle_user="", handle_params=schedule_data,
                                             entity_id=id_, handle_reason="编辑课程表信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg="编辑成功")


# -----------------------------------------------教学日志信息
@router.get("/teaching_journal/filter_teaching_journal", tags=["TeachingJournal"], summary="查询教学日志信息")
async def list_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     limit: int = Query(default=30), offset: int = Query(default=0),
                                     course_name: str = Query(None), classroom: str = Query(None),
                                     teacher: str = Query(None), course_content: str = Query(None),
                                     status: int = Query(None), course_date: date = Query(None)):
    dal.setDb(TeachingJournal)
    variables = {"limit": limit, "offset": offset,
                 "course_name": course_name,
                 "course_date": course_date,
                 "classroom": classroom,
                 "teacher": teacher,
                 "course_content": course_content,
                 "status": status,
                 "is_delete": RESERVE
                 }
    query_params_mapping = {k: v for k, v in filter(lambda item: item[1] is not None, variables.items())}
    if course_name is not None:
        query_params_mapping["course_name__contains"] = query_params_mapping.pop("course_name")
    if course_content is not None:
        query_params_mapping["course_content__contains"] = query_params_mapping.pop("course_content")
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [TeachingJournalSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get("/teaching_journal/{id_}", tags=["TeachingJournal"], summary="通过id获取教学日志信息")
async def get_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(TeachingJournal)
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg="教学日志信息不存在！")
    data = TeachingJournalSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/teaching_journal", tags=["TeachingJournal"], summary="创建教学日志信息")
async def create_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                       teaching_journal_info: EditTeachingJournalSchema):
    dal.setDb(TeachingJournal)
    res = await dal.create(teaching_journal_info)
    if not res:
        return resp_400(msg="创建失败！")

    teaching_journal_data = teaching_journal_info.dict()
    if teaching_journal_info.course_date:
        teaching_journal_data.update({"course_date": teaching_journal_info.course_date.strftime("%Y-%m-%d")})
    if teaching_journal_info.course_start:
        teaching_journal_data.update(
            {"course_start": teaching_journal_info.course_start.strftime("%Y-%m-%d %H:%M:%SZ")})
    if teaching_journal_info.course_end:
        teaching_journal_data.update({"course_end": teaching_journal_info.course_end.strftime("%Y-%m-%d %H:%M:%SZ")})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="teaching_journal",
                                             handle_user="", handle_params=teaching_journal_data,
                                             entity_id=res.id, handle_reason="创建教学日志信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/teaching_journal/{id_}", tags=["TeachingJournal"], summary="删除教学日志信息")
async def delete_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(TeachingJournal)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg="教学日志信息不存在，删除失败！")
    res = await dal.update(id_, {"is_delete": DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="teaching_journal",
                                             handle_user="", handle_params=id_,
                                             entity_id=id_, handle_reason="删除教学日志信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={"id": id_})


@router.patch("/teaching_journal/{id_}", tags=["TeachingJournal"], summary="编辑教学日志信息")
async def update_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                       teaching_journal_info: EditTeachingJournalSchema):
    dal.setDb(TeachingJournal)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg="编辑失败！教学日志信息不存在，无法进行编辑！")
    res = await dal.update(id_, teaching_journal_info)
    if not res:
        return resp_500()

    teaching_journal_data = teaching_journal_info.dict()
    if teaching_journal_info.course_date:
        teaching_journal_data.update({"course_date": teaching_journal_info.course_date.strftime("%Y-%m-%d")})
    if teaching_journal_info.course_start:
        teaching_journal_data.update(
            {"course_start": teaching_journal_info.course_start.strftime("%Y-%m-%d %H:%M:%SZ")})
    if teaching_journal_info.course_end:
        teaching_journal_data.update({"course_end": teaching_journal_info.course_end.strftime("%Y-%m-%d %H:%M:%SZ")})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="teaching_journal",
                                             handle_user="", handle_params=teaching_journal_data,
                                             entity_id=id_, handle_reason="编辑教学日志信息")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg="编辑成功")


# -----------------------------------------------考试结果详情

@router.get("/exam_info_detail/{id_}", tags=["ExamResultDetail"], summary="通过考试结果ID获取详情信息")
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
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="exam_result_detail",
                                             handle_user="", handle_params=[result.dict() for result in result_detail],
                                             entity_id="", handle_reason="创建考试结果详情信息")
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
        query_params_mapping["name__contains"] = query_params_mapping.pop("name")
    if major is not None:
        query_params_mapping["major__contains"] = query_params_mapping.pop("major")
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
                                                           order_by_list=[SortBy("total_score", True)])
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
