#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 22:55
# @Author  : yilifeng
# @File    : sql_handle.py
# @Software: PyCharm
import json
from datetime import datetime
from typing import List
from src.db.dals import ExecDAL
from src.config.setting import settings
from src.db.schemas.ground_teach import CreatePaperSchema, CalculatePayload
from src.utils.exam_related_tools import CalculateGrade
from src.utils.middle_level_management import create_fun_dict, get_fun_dict, create_paper_question_info, \
    get_paper_question_info
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from fastapi import APIRouter, Depends, Query
from sqlalchemy.exc import SQLAlchemyError
from src.utils import generate_uuid
from src.db.models import TableManage, ColumnManage, IntermediateTable
from src.db.schemas.table_manage import UserSyncIn
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.generate_file import generate_pdf, generate_excel
from src.utils.responses import resp_200, resp_404, fetch_external_data, resp_400, resp_500
from src.utils.constant import RESERVE, SON, RecordsStatusCode, QuestionTypeIndex
from src.utils.tools import filter_dict

router = APIRouter()


@router.get('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名和数据id获取数据详细信息")
async def get_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                   column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, id_: str):
    dal.setDb(TableManage)
    logger.debug(f"通过表名和数据id获取数据详细信息:{code}:{id_}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[], msg="未能获取到表信息")

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE)
    if not column_res:
        return resp_200(data=column_res)
    fields_data = [con.code for con in column_res]
    if "id" not in fields_data:
        fields_data.append("id")
    select_conditions = {"id": id_}
    table_name = f"auto_{res.code}"
    data_info = await sql_handle.select(table_name, fields=fields_data, conditions=select_conditions)
    if not data_info:
        return resp_200(data=[], msg="未能获取到表信息")

    return resp_200(data=data_info)


@router.get('/{code}', tags=['SqlHandle'], summary="通过表名获取所有数据")
async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
                    limit: int = Query(None),
                    offset: int = Query(None), code: str):
    dal.setDb(TableManage)
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE, is_parent=[SON, None])
    if not column_res:
        return resp_200(data=column_res)
    fields_data = [con.code for con in column_res]
    if "id" not in fields_data:
        fields_data.append('id')
    table_name = f"auto_{res.code}"
    table_list = await sql_handle.select(table_name, fields=fields_data, limit=limit, offset=offset)
    if not table_list:
        table_list = []

    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/condition/{code}', tags=['SqlHandle'], summary="通过表名获取过滤之后的数据")
async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)), middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                    column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, column_info: dict):
    def gen_select_conditions(column_list, value, operator):
        select_conditions = dict()
        for column in column_list:
            select_conditions[column] = {'value': value, 'operator': operator}
        return select_conditions

    dal.setDb(TableManage)
    logger.debug(f"通过表名获取过滤之后的数据:{code}:{column_info}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[])

    column_dal.setDb(ColumnManage)
    column_res = await column_dal.get_by_all(table_id=res.id, is_delete=RESERVE, is_parent=[SON, None])
    if not column_res:
        return resp_200(data=column_res)

    multiple_col = []
    for col in column_res:
        if col.association:
            if col.association[0].get("multiple"):
                multiple_col.append(col.code)

    select_conditions = dict()
    columns_list = list()
    column_list_info = column_info.get("query")

    if column_list_info is not None and len(column_list_info) > 0:
        for column_info in column_list_info:
            column_list = column_info.get("key")
            value = column_info.get("value")
            operator = column_info.get("operator")
            conditions = gen_select_conditions(column_list, value, operator)
            select_conditions.update(conditions)
            columns_list.extend(column_list)

    limit = column_info.get("limit")
    offset = column_info.get("offset")
    fields_data = column_res  # [con.code for con in column_res if con.code in columns_list]
    if "id" not in fields_data:
        fields_data.append('id')
    fields_data.extend(['create_time', 'update_time'])
    table_name = f"auto_{res.code}"
    # 地面教学相关单独处理
    if table_name in [settings.EXAMINATION, settings.PAPER] and column_info.get("id"):
        calling = get_fun_dict.get(table_name)
        table_list = await calling(code, column_info)
    else:
        table_list = await sql_handle.select(table_name, conditions=select_conditions, fields=fields_data, limit=limit,
                                             offset=offset)
    if not table_list:
        table_list = []

    middle_dal.setDb(IntermediateTable)
    for table_info in table_list:
        data_ids = []
        for con in multiple_col:
            middle_dal_res = await middle_dal.get_by_all(correlation_id=table_info.get(con))
            if middle_dal_res is not None:
                for middle_res in middle_dal_res:
                    data_ids.append(middle_res.data_id)
            table_info[con] = json.dumps(data_ids)

    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/{code}', tags=['SqlHandle'], summary="通过表名创建一条数据")
async def create_table_by_table_name(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     *, code: str, obj_in: dict):
    dal.setDb(TableManage)
    logger.info(f"通过表名创建一条数据:{code}:{obj_in}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[], msg="未能获取到表信息")
    table_id = res.id
    col_dal.setDb(ColumnManage)
    col_res = await col_dal.get_by_all(table_id=table_id, is_delete=RESERVE)
    multiple_col = {}
    for col in col_res:
        if col.association:
            if col.association[0].get("multiple"):
                multiple_col[col.code] = json.loads(obj_in.get(col.code))

    middle_data = []
    middle_dal.setDb(IntermediateTable)
    for key, vals in multiple_col.items():
        if vals:
            correlation_id = generate_uuid()
            obj_in.update({key: correlation_id})
            for val in vals:
                middle_data.append({"correlation_id": correlation_id, "data_id": val})
        else:
            obj_in.update({key: ""})
    try:
        await middle_dal.create_all(middle_data)
    except SQLAlchemyError:
        return resp_400()

    table_name = f"auto_{res.code}"
    obj_in = filter_dict(obj_in)
    obj_in.update({"id": generate_uuid(),
                   'is_delete': RESERVE,
                   'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                   'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})

    # 地面教学相关单独处理
    if table_name in [settings.EXAMINATION, settings.PAPER, settings.ONLINE_LEARNING]:
        calling = create_fun_dict.get(table_name)
        obj_in = await calling(table_name, obj_in)
        if table_name == settings.EXAMINATION:
            total_score = obj_in.pop("total_exam_score")

    try:
        inserted_data_id = await sql_handle.insert(table_name, obj_in)
    except SQLAlchemyError as e:
        logger.error(e)
        return resp_400(msg=f"{e}")

    inserted_id = inserted_data_id[0].get("id") if inserted_data_id else obj_in.get("id")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params=obj_in,
                                             entity_id=obj_in.get("id"), handle_reason='通过表名创建一条数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=inserted_id)


@router.patch('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名修改数据")
async def get_column_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              middle_delete_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              *, code: str, id_: str, obj_in: dict):
    dal.setDb(TableManage)
    logger.info(f"通过表名修改数据:{code}:{id_}:{obj_in}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")

    table_name = f"auto_{res.code}"
    condition = {"id": id_}
    table_info = await sql_handle.select(table_name, conditions=condition)
    if not table_info:
        return resp_404("未能获取到信息")

    table_id = res.id
    col_dal.setDb(ColumnManage)
    col_res = await col_dal.get_by_all(table_id=table_id, is_delete=RESERVE)
    multiple_col = {}
    for col in col_res:
        if col.association:
            if col.association[0].get("multiple"):
                multiple_col[col.code] = json.loads(obj_in.get(col.code)) if obj_in.get(col.code) else None

    middle_data = []
    middle_dal.setDb(IntermediateTable)
    for key, vals in multiple_col.items():
        correlation_id = generate_uuid()
        obj_in.update({key: correlation_id})
        if vals:
            for val in vals:
                if val:
                    middle_data.append({"correlation_id": correlation_id, "data_id": val})
        else:
            middle_data.append({"correlation_id": correlation_id, "data_id": ""})

    try:
        await middle_dal.create_all(middle_data)
    except SQLAlchemyError:
        return resp_400()

    middle_delete_dal.setDb(IntermediateTable)
    update_conditions = {"id": id_}
    updated_data = filter_dict(obj_in)
    updated_data.update({'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
    if updated_data.get("keep_time"):
        updated_data.update({'keep_time': updated_data.get("keep_time") + table_info[0].get("keep_time", 0)})
    try:
        await sql_handle.update(table_name, update_conditions, updated_data)
    except SQLAlchemyError as e:
        return resp_400(msg=f"{e}")

    for info in table_info:
        for k, _ in multiple_col.items():
            await middle_delete_dal.delete_by(correlation_id=info[k])

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params=obj_in,
                                             entity_id=id_, handle_reason='通过表名修改数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.delete('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名删除表中id的数据")
async def get_column_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              *, code: str, id_: str):
    dal.setDb(TableManage)
    logger.info(f"通过表名修改数据:{code}:{id_}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")

    table_name = f"auto_{res.code}"
    condition = {"id": id_}
    table_info = await sql_handle.select(table_name, conditions=condition)
    if not table_info:
        return resp_404("未能获取到表信息")

    table_id = res.id
    col_dal.setDb(ColumnManage)
    col_res = await col_dal.get_by_all(table_id=table_id, is_delete=RESERVE)
    multiple_col, correlation_ids = [], []
    for col in col_res:
        if col.association:
            if col.association[0].get("multiple"):
                multiple_col.append(col.code)

    for table in table_info:
        for col in multiple_col:
            correlation_ids.append(table[col])

    delete_conditions = {"id": id_}
    table_name = f"auto_{res.code}"
    await sql_handle.delete(table_name, delete_conditions)

    middle_dal.setDb(IntermediateTable)
    for correlation_id in correlation_ids:
        await middle_dal.delete_by(correlation_id=correlation_id)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params={"table_code": code, "id": id_},
                                             entity_id=id_, handle_reason='通过表名删除表中id的数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


# @router.get('export_data/{code}', tags=['SqlHandle'], summary="导出指定表数据")
# async def list_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
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


@router.post('/sync_user/', tags=['SqlHandle'], summary="同步用户到管理系统")
async def sync_user(*, payload: List[UserSyncIn]):
    url = settings.SYNC_USER_URL
    response_result = await fetch_external_data(url, payload)
    logger.info(f"同步用户到管理系统:{payload}")
    return response_result


@router.post('/unsync_user/', tags=['SqlHandle'], summary="取消同步用户到管理系统")
async def unsync_user(*, usernames: List[str]):
    url = settings.UNSYNC_USER_URL
    response_result = await fetch_external_data(url, usernames)
    logger.info(f"取消同步用户到管理系统:{usernames}")
    return response_result


@router.post("/create_paper/", tags=["SqlHandle"], summary="创建试卷")
async def create_paper(create_paper_question: CreatePaperSchema):
    # 获取试卷信息
    paper_condition = {"id": create_paper_question.paper_id}
    pi_res = await sql_handle.select("auto_paper_info", paper_condition, fields=["PIID", "EID"])
    if not pi_res:
        return resp_200(data=[])
    pid, eid = pi_res[0].get("PIID"), pi_res[0].get("EID")
    # 获取考试信息
    exam_condition = {"EID": eid}
    e_res = await sql_handle.select("auto_examination", exam_condition)
    if not e_res:
        return resp_200(data=[])

    e_related_course = e_res[0]
    res, create_paper_dict = await create_paper_question_info("auto_exam_result_detail", pid, e_related_course)
    if not res:
        return resp_400(msg='创建失败')
    paper_question_res = await get_paper_question_info("auto_exam_result_detail", pid)
    if not paper_question_res:
        return resp_400(msg='创建失败')
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='auto_exam_result_detail',
                                             handle_user='', handle_params=create_paper_dict,
                                             entity_id='', handle_reason='创建试卷-试题信息')
    await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200(data=paper_question_res)


@router.post("/cal_grade/", tags=["SqlHandle"], summary="计算考试结果")
async def cal_grade(payload: CalculatePayload):
    # 获取试卷信息
    paper_condition = {"id": payload.paper_id}
    pi_res = await sql_handle.select("auto_paper_info", paper_condition, fields=["PIID", "EID", "UID"])
    if not pi_res:
        return resp_200(data=[])
    pid, eid = pi_res[0].get("PIID"), pi_res[0].get("EID")

    # 获取考试信息
    exam_condition = {"EID": eid}
    e_res = await sql_handle.select("auto_examination", exam_condition)
    if not e_res:
        resp_200(data=[])
    q_score = {
        QuestionTypeIndex.SingleChoice: e_res[0].get("single_choice_score"),
        QuestionTypeIndex.MultipleChoice: e_res[0].get("multiple_choice_score"),
        QuestionTypeIndex.Fill: e_res[0].get("fill_score"),
        QuestionTypeIndex.Judge: e_res[0].get("judge_score"),
        QuestionTypeIndex.ShortAnswer: e_res[0].get("short_score")
    }
    # 学生作答信息
    uid = pi_res[0].get("UID")
    er_condition = {"PID": pid}
    er_res = await sql_handle.select("auto_exam_result_detail", er_condition, fields=["QID", "solution", "ERID"])
    if not er_res:
        return resp_200(data=[])
    er_id = [er.get("ERID") for er in er_res]

    exam_detail_result_list, qid_list = [], []
    for stu_solution in er_res:
        qid_list.append(stu_solution.get("QID"))
        exam_detail_result_list.append(
            {"uid": uid, "question_id": stu_solution["QID"], "solution": stu_solution["solution"]})

    if len(exam_detail_result_list) == 0:
        return resp_404(msg='未获取到学生考试结果相关信息')

    # 获取考题信息
    question_condition = {"QID": {"value": qid_list, "operator": "in"}}
    cal_question_info = await sql_handle.select("auto_question_bank", conditions=question_condition)

    if len(cal_question_info) == 0:
        return resp_404(msg='未获取到试卷-考题相关信息')

    # cal_question_info考卷信息，答案及每道题的得分
    # student_exam：{QID: student_answer}学生的id及其答题情况
    c_q = CalculateGrade()
    stu_score, stu_score_detail = await c_q.cal_grade(cal_question_info, exam_detail_result_list, payload, q_score)

    await sql_handle.update("auto_paper_info", exam_condition, {"total_score": stu_score})

    for idx, exam_detail_result in enumerate(stu_score_detail):
        update_conditions = {"ERID": er_id[idx]}
        exam_detail_result.update({'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
        await sql_handle.update("auto_exam_result_detail", update_conditions, exam_detail_result)
    return resp_200(data=stu_score_detail)
