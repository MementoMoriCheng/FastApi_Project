#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    : teaching_resources_manage.py
# @Software: PyCharm
from datetime import date
from typing import List
from src.db.dals import ExecDAL
from fastapi import APIRouter, Depends, Query
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode
from src.utils.responses import resp_200, resp_404, resp_500, resp_400
from src.db.models import CourseSource, CourseChapter, Questions, CourseSchedule, TeachingJournal, Document, \
    OnlineLearningRecord
from src.db.schemas.lesson_examination import (
    QuestionSchema, SearchQuestionSchema, ScheduleSchema, EditScheduleSchema,
    TeachingJournalSchema, EditTeachingJournalSchema,
    CourseChapterSchema, SearchCourseChapterSchema, CourseSourceSchema, EditCourseChapterSchema, CourseChapterID,
    EditQuestionSchema, CourseSourceFile, OnlineLearningRecordSchema, EditOnlineLearningRecordSchema,
    ShowOnlineLearningRecord
)

router = APIRouter()


# -----------------------------------------------题库资源信息
@router.post("/question/filter_question", tags=["Questions"], summary="查询试题信息")
async def list_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, question_info: SearchQuestionSchema):
    dal.setDb(Questions)
    query_params_mapping = question_info.dict(exclude_none=True)
    query_params_mapping.update(is_delete=RESERVE)
    if question_info.question is not None:
        query_params_mapping['question__contains'] = query_params_mapping.pop('question')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [QuestionSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/question/{id_}', tags=['Questions'], summary="通过id获取试题信息")
async def get_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Questions)
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='试题不存在！')
    data = QuestionSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/question", tags=["Questions"], summary="创建试题信息")
async def create_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, question_info: List[EditQuestionSchema]):
    dal.setDb(Questions)
    questions_info = await dal.buck_create(question_info)
    if not questions_info:
        return resp_400(msg='创建失败！')
    for idx, con in enumerate(questions_info):
        mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="questions",
                                                 handle_params=question_info[idx].dict(), handle_user='',
                                                 entity_id=con.id, handle_reason='创建试题信息')
        await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200(data=questions_info)


@router.delete("/question/{id_}", tags=["Questions"], summary="删除试题信息")
async def delete_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(Questions)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='试题不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="questions",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除试题信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/question/{id_}", tags=["Questions"], summary="编辑试题信息")
async def update_question_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                               question_info: EditQuestionSchema):
    dal.setDb(Questions)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='编辑失败！试题不存在，无法进行编辑！')
    res = await dal.update(id_, question_info)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="questions",
                                             handle_user='', handle_params=question_info.dict(),
                                             entity_id=id_, handle_reason='编辑考试信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


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
        query_params_mapping['course_name__contains'] = query_params_mapping.pop('course_name')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [ScheduleSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/course_schedule/{id_}', tags=['CourseSchedule'], summary="通过id获取课程表信息")
async def get_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseSchedule)
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='试题不存在！')
    data = ScheduleSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/course_schedule", tags=["CourseSchedule"], summary="创建课程表信息")
async def create_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, schedule_info: EditScheduleSchema):
    dal.setDb(CourseSchedule)
    res = await dal.create(schedule_info)
    if not res:
        return resp_400(msg='创建失败！')
    schedule_data = schedule_info.dict()
    if schedule_info.course_date:
        schedule_data.update({'course_date': schedule_info.course_date.strftime('%Y-%m-%d')})
    if schedule_info.course_start:
        schedule_data.update({'course_start': schedule_info.course_start.strftime('%Y-%m-%d %H:%M:%S')})
    if schedule_info.course_end:
        schedule_data.update({'course_end': schedule_info.course_end.strftime('%Y-%m-%d %H:%M:%S')})
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='course_schedule',
                                             handle_user='', handle_params=schedule_data,
                                             entity_id=res.id, handle_reason='创建课程表信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/course_schedule/{id_}", tags=["CourseSchedule"], summary="删除课程表信息")
async def delete_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseSchedule)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='课程表不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_schedule",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除课程表信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/course_schedule/{id_}", tags=["CourseSchedule"], summary="编辑课程表信息")
async def update_course_schedule_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                      schedule_info: EditScheduleSchema):
    dal.setDb(CourseSchedule)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='编辑失败！课程表不存在，无法进行编辑！')
    res = await dal.update(id_, schedule_info)
    if not res:
        return resp_500()
    schedule_data = schedule_info.dict()

    if schedule_info.course_date:
        schedule_data.update({'course_date': schedule_info.course_date.strftime('%Y-%m-%d')})
    if schedule_info.course_start:
        schedule_data.update({'course_start': schedule_info.course_start.strftime('%Y-%m-%d %H:%M:%S')})
    if schedule_info.course_end:
        schedule_data.update({'course_end': schedule_info.course_end.strftime('%Y-%m-%d %H:%M:%S')})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='course_schedule',
                                             handle_user='', handle_params=schedule_data,
                                             entity_id=id_, handle_reason='编辑课程表信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


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
        query_params_mapping['course_name__contains'] = query_params_mapping.pop('course_name')
    if course_content is not None:
        query_params_mapping['course_content__contains'] = query_params_mapping.pop('course_content')
    res = await dal.get_by_all(**query_params_mapping)
    if not res:
        return resp_200(data=[])
    data = [TeachingJournalSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/teaching_journal/{id_}', tags=['TeachingJournal'], summary="通过id获取教学日志信息")
async def get_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(TeachingJournal)
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='教学日志信息不存在！')
    data = TeachingJournalSchema.from_orm(res)
    return resp_200(data=data)


@router.post("/teaching_journal", tags=["TeachingJournal"], summary="创建教学日志信息")
async def create_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                       teaching_journal_info: EditTeachingJournalSchema):
    dal.setDb(TeachingJournal)
    res = await dal.create(teaching_journal_info)
    if not res:
        return resp_400(msg='创建失败！')

    teaching_journal_data = teaching_journal_info.dict()
    if teaching_journal_info.course_date:
        teaching_journal_data.update({'course_date': teaching_journal_info.course_date.strftime('%Y-%m-%d')})
    if teaching_journal_info.course_start:
        teaching_journal_data.update(
            {'course_start': teaching_journal_info.course_start.strftime('%Y-%m-%d %H:%M:%SZ')})
    if teaching_journal_info.course_end:
        teaching_journal_data.update({'course_end': teaching_journal_info.course_end.strftime('%Y-%m-%d %H:%M:%SZ')})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='teaching_journal',
                                             handle_user='', handle_params=teaching_journal_data,
                                             entity_id=res.id, handle_reason='创建教学日志信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/teaching_journal/{id_}", tags=["TeachingJournal"], summary="删除教学日志信息")
async def delete_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(TeachingJournal)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='教学日志信息不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="teaching_journal",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除教学日志信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/teaching_journal/{id_}", tags=["TeachingJournal"], summary="编辑教学日志信息")
async def update_teaching_journal_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                       teaching_journal_info: EditTeachingJournalSchema):
    dal.setDb(TeachingJournal)
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404(msg='编辑失败！教学日志信息不存在，无法进行编辑！')
    res = await dal.update(id_, teaching_journal_info)
    if not res:
        return resp_500()

    teaching_journal_data = teaching_journal_info.dict()
    if teaching_journal_info.course_date:
        teaching_journal_data.update({'course_date': teaching_journal_info.course_date.strftime('%Y-%m-%d')})
    if teaching_journal_info.course_start:
        teaching_journal_data.update(
            {'course_start': teaching_journal_info.course_start.strftime('%Y-%m-%d %H:%M:%SZ')})
    if teaching_journal_info.course_end:
        teaching_journal_data.update({'course_end': teaching_journal_info.course_end.strftime('%Y-%m-%d %H:%M:%SZ')})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='teaching_journal',
                                             handle_user='', handle_params=teaching_journal_data,
                                             entity_id=id_, handle_reason='编辑教学日志信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------教学章节信息
@router.post("/course_chapter/filter_course_chapter", tags=["CourseChapter"], summary="查询课程章节信息")
async def list_course_chapter_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                   chapter_info: SearchCourseChapterSchema):
    dal.setDb(CourseChapter)
    query_params_mapping, res = dict(), []
    query_params_mapping.update(is_delete=RESERVE)
    if not chapter_info.key_word:
        res = await dal.get_by_all(**query_params_mapping)
    else:
        query_params_mapping['course_name__contains'] = chapter_info.key_word.strip()
        course_name_res = await dal.get_by_all(**query_params_mapping)
        res.extend(course_name_res)
        query_params_mapping.clear()
        query_params_mapping['knowledge_points__contains'] = chapter_info.key_word.strip()
        knowledge_points_res = await dal.get_by_all(**query_params_mapping)
        res.extend(knowledge_points_res)
    if not res:
        return resp_200(data=[])
    data = [CourseChapterSchema.from_orm(ms) for ms in res]
    return resp_200(data={"data": data, "total": len(res)})


@router.get('/course_chapter/{id_}', tags=['CourseChapter'], summary="通过id获取课程章节信息")
async def get_course_chapter_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseChapter)
    res = await dal.get_by_all(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404(msg='章节信息为空！')
    data = [CourseChapterSchema.from_orm(ms) for ms in res]
    return resp_200(data=data)


@router.post("/course_chapter", tags=["CourseChapter"], summary="创建课程章节信息")
async def create_course_chapter_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                     chapter_info: List[EditCourseChapterSchema]):
    dal.setDb(CourseChapter)
    res = await dal.buck_create(chapter_info)
    if not res:
        return resp_400(msg='创建失败！')
    for idx, con in enumerate(res):
        mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_chapter",
                                                 handle_params=chapter_info[idx].dict(), handle_user='',
                                                 entity_id=con.id, handle_reason='创建课程章节信息')
        await sql_handle.add_records("log_manage", mysql_log_data)
    data = [CourseChapterID.from_orm(ms) for ms in res]
    return resp_200(data=data)


@router.delete("/course_chapter/{id_}", tags=["CourseChapter"], summary="删除课程章节信息")
async def delete_course_chapter_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseChapter)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='章节信息不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_chapter",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除课程章节信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch("/course_chapter/{id_}", tags=["CourseChapter"], summary="编辑课程章节信息")
async def update_course_chapter_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                     chapter_info: EditCourseChapterSchema):
    dal.setDb(CourseChapter)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！章节信息不存在，无法进行编辑！')
    res = await dal.update(id_, chapter_info)
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_chapter",
                                             handle_user='', handle_params=chapter_info.dict(),
                                             entity_id=id_, handle_reason='编辑课程章节信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res, msg='编辑成功')


# -----------------------------------------------课程资源信息

@router.get('/course_source/{course_chapter_id}', tags=['CourseSource'], summary="通过id获取课程资源信息")
async def get_course_source_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, course_chapter_id: str):
    dal.setDb(CourseSource)
    res = await dal.get_by_all(course_chapter_id=course_chapter_id, is_delete=RESERVE)
    if not res:
        return resp_200(data=[])
    data = []
    for rs in res:
        if not rs.file_id:
            continue
        dal.setDb(Document)
        doc_res = await dal.get(rs.file_id)
        if not doc_res:
            continue
        course_source_info = CourseSourceFile.from_orm(rs)
        course_source_info.file_name = doc_res.name
        data.append(course_source_info)
    return resp_200(data=data)


@router.post("/course_source", tags=["CourseSource"], summary="创建课程资源信息")
async def create_course_source_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                    source_info: CourseSourceSchema):
    dal.setDb(CourseSource)
    res = await dal.create(source_info)
    if not res:
        return resp_400(msg='创建失败！')
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_source",
                                             handle_params=source_info.dict(), handle_user='',
                                             entity_id=res.id, handle_reason='创建课程资源信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res.id)


@router.delete("/course_source/{id_}", tags=["CourseSource"], summary="删除课程资源信息")
async def delete_course_source_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(CourseSource)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='课程资源不存在，删除失败！')
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type="course_source",
                                             handle_user='', handle_params=id_,
                                             entity_id=id_, handle_reason='删除课程资源信息')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


# -----------------------------------------------在线学习信息

@router.get('/online_learning_record/{student_id}/{course_chapter_id}', tags=['OnlineLearningRecord'],
            summary="获取在线学习信息")
async def get_online_learning_record_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, student_id: str,
                                          course_chapter_id: str):
    dal.setDb(OnlineLearningRecord)
    res = await dal.get_by(student_id=student_id, course_chapter_id=course_chapter_id, is_delete=RESERVE)
    if not res:
        return resp_200(data=[], msg='在线学习信息不存在！')
    data = ShowOnlineLearningRecord.from_orm(res)
    return resp_200(data=data)


@router.post("/online_learning_record", tags=["OnlineLearningRecord"], summary="创建在线学习信息")
async def create_online_learning_record_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                                             source_info: OnlineLearningRecordSchema):
    dal.setDb(OnlineLearningRecord)
    repeat_res = await dal.get_by(student_id=source_info.student_id, course_chapter_id=source_info.course_chapter_id)
    if repeat_res:
        source_info.keep_time = repeat_res.keep_time + source_info.keep_time
        res = await dal.update(repeat_res.id, source_info)
        if not res:
            return resp_500()
        record_id = repeat_res.id
    else:
        res = await dal.create(source_info)
        if not res:
            return resp_400(msg='创建失败！')
        record_id = res.id

    return resp_200(data=record_id)


@router.patch("/online_learning_record/{id_}", tags=["OnlineLearningRecord"], summary="编辑在线学习信息")
async def update_online_learning_record_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                             chapter_info: EditOnlineLearningRecordSchema):
    dal.setDb(OnlineLearningRecord)
    ms = await dal.get(id_)
    if not ms:
        return resp_404(msg='编辑失败！在线学习信息不存在，无法进行编辑！')
    chapter_info.keep_time = ms.keep_time + chapter_info.keep_time
    res = await dal.update(id_, chapter_info)
    if not res:
        return resp_500()

    return resp_200(data=res, msg='编辑成功')
