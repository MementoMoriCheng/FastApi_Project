#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 22:55
# @Author  : yilifeng
# @File    : sql_handle.py
# @Software: PyCharm
import copy
import json
from typing import List
from datetime import datetime
from src.db.dals import ExecDAL
from src.config.setting import settings
from sqlalchemy.exc import SQLAlchemyError

from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from fastapi import APIRouter, Depends, Query
from src.db.schemas.table_manage import UserSyncIn
from src.utils import generate_uuid, generate_bigint_id
from src.utils.flight_planning_design import flight_design
from src.utils.logger import logger, generate_mysql_log_data
from src.db.schemas.flying_manage import SearchFightReplayData
from src.utils.tools import filter_dict, parse_select_conditions, filter_list
from src.db.models import TableManage, ColumnManage, IntermediateTable
from src.utils.exam_related_tools import CalculateGrade, ExamPaperGenerator
from src.utils.constant import RESERVE, SON, RecordsStatusCode, QuestionTypeIndex, DEFAULT_EXAMINATION, AIRCRAFT_ID, \
    FLIGHT_DATA_TABLE, PLAN_COACH, PLAN_STUDENT
from src.db.schemas.ground_teach import CreatePaperSchema, CalculatePayload, SubmitAnswerSchema
from src.utils.middle_level_management import create_fun_dict, get_fun_dict, create_paper_question_info, \
    get_paper_question_info
from src.utils.responses import resp_200, resp_404, fetch_external_data, resp_400, resp_500

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
    # 记录访问次数
    if table_name == settings.TEACHING_RESOURCE:
        updated_data = {}
        update_conditions = {"id": id_}
        updated_data.update({'visition': (data_info[0].get("visition") + 1) if data_info[0].get("visition") else 1})
        await sql_handle.update(table_name, update_conditions, updated_data)

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
async def list_condition_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                              column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, column_info: dict):
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
    select_conditions, limit, offset = parse_select_conditions(column_info)

    fields_data = column_res  # [con.code for con in column_res if con.code in columns_list]
    if "id" not in fields_data:
        fields_data.append('id')
    fields_data.extend(['create_time', 'update_time'])
    table_name = f"auto_{res.code}"
    # 地面教学相关单独处理
    if table_name in [settings.EXAMINATION, settings.PAPER] and column_info.get("id"):
        calling = get_fun_dict.get(table_name)
        table_list = await calling(code, column_info)
    # 飞行规划相关单独处理
    elif table_name == settings.FLIGHT_PLAN_CONTENT:
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
async def create_data_by_table_name(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
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
    multiple_col, bigint_list = {}, []
    try:
        for col in col_res:
            if "ID" in col.code:
                bigint_list.append(col.code)
            if col.association:
                if col.association[0].get("multiple") and obj_in.get(col.code):
                    multiple_col[col.code] = json.loads(obj_in.get(col.code))
    except TypeError as err:
        logger.error(err)
        return resp_500(err)

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
    except SQLAlchemyError as e:
        return resp_400(msg=f"{e}")

    table_name = f"auto_{res.code}"
    obj_in = filter_dict(obj_in)
    obj_in.update({"id": generate_uuid(),
                   'is_delete': RESERVE,
                   'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                   'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
    for bigint_id in bigint_list:
        if not obj_in.get(bigint_id):
            obj_in.update({bigint_id: generate_bigint_id()})
    # 地面教学,飞行规划相关单独处理
    if table_name in [settings.EXAMINATION, settings.PAPER, settings.ONLINE_LEARNING, settings.TEACHING_RESOURCE,
                      settings.QUESTION_BANK, settings.FLIGHT_PLAN_BASE, settings.FLIGHT_PLAN_PLANE]:
        calling = create_fun_dict.get(table_name)
        obj_in = await calling(table_name, obj_in)

    try:
        inserted_data_id = await sql_handle.insert(table_name, obj_in)
    except SQLAlchemyError as e:
        logger.error(e)
        return resp_400(msg=f"{e}")

    inserted_id = inserted_data_id[0].get("id") if inserted_data_id else obj_in.get("id")

    # 教员、学员自动成为本系统的可登录用户，可使用默认密码登录系统
    if table_name in [PLAN_COACH, PLAN_STUDENT]:
        username = obj_in.get("username")
        password = obj_in.get("login_password") if obj_in.get("login_password") else settings.DEFAULT_PASSWORD
        role_id = settings.DEFAULT_ROLE_ID
        system_id = settings.DEFAULT_SYSTEM_ID
        payload = [{"username": username, "password": password, "role_id": role_id, "system_id": [system_id]}]
        url = settings.SYNC_USER_URL
        response_result = await fetch_external_data(url, payload)
        flag = response_result.get("error")
        if flag:
            logger.info(f"同步用户到管理系统失败!:{payload}")
        else:
            logger.info(f"同步用户到管理系统成功!:{payload}")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                             handle_user="", handle_params=obj_in,
                                             entity_id=obj_in.get("id"), handle_reason='通过表名创建一条数据')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=inserted_id)


@router.patch('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名修改数据")
async def modify_data_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
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
    except SQLAlchemyError as e:
        return resp_400(msg=f"{e}")

    if table_name in [settings.FLIGHT_PLAN_PLANE, settings.PLANE_TABLE]:
        calling = create_fun_dict.get(table_name)
        obj_in = await calling(table_name, obj_in)

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


@router.post('/batch_modify_data/', tags=['SqlHandle'], summary="通过表名批量修改数据")
async def batch_modify_data_by_table(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     middle_delete_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                     *, code: str, payload: List[dict]):
    dal.setDb(TableManage)
    logger.info(f"通过表名批量修改数据:{code}:{payload}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_404("未能获取到表信息")

    table_name = f"auto_{res.code}"
    conditions_list, updated_data_list, middle_data, delete_middle_data = [], [], [], []
    for obj_in in payload:
        id_ = obj_in.get("id")
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
        for key, vals in multiple_col.items():
            correlation_id = generate_uuid()
            obj_in.update({key: correlation_id})
            if vals:
                for val in vals:
                    if val:
                        middle_data.append({"correlation_id": correlation_id, "data_id": val, "id": generate_uuid()})
            else:
                middle_data.append({"correlation_id": correlation_id, "data_id": "", "id": generate_uuid()})

        if table_name in [settings.FLIGHT_PLAN_PLANE, settings.PLANE_TABLE]:
            calling = create_fun_dict.get(table_name)
            obj_in = await calling(table_name, obj_in)

        middle_delete_dal.setDb(IntermediateTable)
        update_conditions = {"id": id_}
        updated_data = filter_dict(obj_in)
        updated_data.update({'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
        if updated_data.get("keep_time"):
            updated_data.update({'keep_time': updated_data.get("keep_time") + table_info[0].get("keep_time", 0)})
        conditions_list.append(update_conditions)
        updated_data_list.append(updated_data)

        for info in table_info:
            for k, _ in multiple_col.items():
                if not info[k]:
                    continue
                delete_middle_data.append(info[k])

        mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                                 handle_user="", handle_params=obj_in,
                                                 entity_id=id_, handle_reason='通过表名修改数据')
        await sql_handle.add_records("log_manage", mysql_log_data)
    middle_dal.setDb(IntermediateTable)
    try:
        await middle_dal.create_all(middle_data)
        await sql_handle.batch_update(table_name, conditions_list, updated_data_list)
    except SQLAlchemyError as e:
        return resp_400(msg=f"{e}")
    for delete_id in delete_middle_data:
        await middle_delete_dal.delete_by(correlation_id=delete_id)
    return resp_200()


@router.post('/batch_create_data/', tags=['SqlHandle'], summary="通过表名批量创建数据")
async def batch_create_data_by_table_name(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                          col_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                          middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                          *, code: str, payload: List[dict]):
    dal.setDb(TableManage)
    logger.info(f"通过表名批量创建数据:{code}:{payload}")
    res = await dal.get_by(code=code)
    if not res:
        return resp_200(data=[], msg="未能获取到表信息")
    table_id = res.id
    col_dal.setDb(ColumnManage)
    col_res = await col_dal.get_by_all(table_id=table_id, is_delete=RESERVE)
    table_name = f"auto_{res.code}"
    create_data_list, middle_data, sync_user_payload = [], [], []
    for obj_in in payload:
        multiple_col, bigint_list = {}, []
        try:
            for col in col_res:
                if "ID" in col.code:
                    bigint_list.append(col.code)
                if col.association:
                    if col.association[0].get("multiple") and obj_in.get(col.code):
                        multiple_col[col.code] = json.loads(obj_in.get(col.code))
        except TypeError as err:
            logger.error(err)
            return resp_500(err)

        middle_dal.setDb(IntermediateTable)
        for key, vals in multiple_col.items():
            if vals:
                correlation_id = generate_uuid()
                obj_in.update({key: correlation_id})
                for val in vals:
                    middle_data.append({"correlation_id": correlation_id, "data_id": val})
            else:
                obj_in.update({key: ""})

        obj_in = filter_dict(obj_in)
        obj_in.update({"id": generate_uuid(),
                       'is_delete': RESERVE,
                       'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                       'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
        for bigint_id in bigint_list:
            if not obj_in.get(bigint_id):
                obj_in.update({bigint_id: generate_bigint_id()})
        # 地面教学,飞行规划相关单独处理
        if table_name in [settings.EXAMINATION, settings.PAPER, settings.ONLINE_LEARNING, settings.TEACHING_RESOURCE,
                          settings.QUESTION_BANK]:
            calling = create_fun_dict.get(table_name)
            obj_in = await calling(table_name, obj_in)

        create_data_list.append(obj_in)
        mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type=code,
                                                 handle_user="", handle_params=obj_in,
                                                 entity_id=obj_in.get("id"), handle_reason='通过表名创建一条数据')
        await sql_handle.add_records("log_manage", mysql_log_data)

        # 教员、学员自动成为本系统的可登录用户，可使用默认密码登录系统
        if table_name in [PLAN_COACH, PLAN_STUDENT]:
            username = obj_in.get("username")
            password = obj_in.get("login_password") if obj_in.get("login_password") else settings.DEFAULT_PASSWORD
            role_id = settings.DEFAULT_ROLE_ID
            system_id = settings.DEFAULT_SYSTEM_ID
            sync_user_payload.append(
                {"username": username, "password": password, "role_id": role_id, "system_id": [system_id]})

    try:
        await middle_dal.create_all(middle_data)
        await sql_handle.batch_insert(table_name, create_data_list)

        url = settings.SYNC_USER_URL
        response_result = await fetch_external_data(url, sync_user_payload)
        flag = response_result.get("error")
        if flag:
            logger.info(f"同步用户到管理系统失败!:{payload}")
        else:
            logger.info(f"同步用户到管理系统成功!:{payload}")
    except SQLAlchemyError as err:
        return resp_400(msg=f"{err}")
    return resp_200()


@router.delete('/{code}/{id_}', tags=['SqlHandle'], summary="通过表名删除表中id的数据")
async def delete_data_by_id(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
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


@router.get('/number_of_questions_available/', tags=['SqlHandle'], summary="获取课程/题目类型可用题数")
async def unsync_user(course: str = None):
    exam_paper = ExamPaperGenerator(settings.QUESTION_BANK)
    detail_count = await exam_paper.number_of_questions_available(course)
    return resp_200(data=detail_count)


@router.post("/create_paper/", tags=["SqlHandle"], summary="创建试卷")
async def create_paper(create_paper_question: CreatePaperSchema):
    # 获取试卷信息
    calling = create_fun_dict.get(settings.PAPER)
    obj_in = await calling(settings.PAPER, create_paper_question)

    pid, eid = obj_in.get("PIID"), obj_in.get("EID")
    # 获取考试信息
    exam_condition = {"EID": eid}
    e_res = await sql_handle.select("auto_examination", exam_condition)
    if not e_res:
        return resp_200(data=[])

    e_related_course, bak_data = e_res[0], copy.deepcopy(e_res[0])
    res, create_paper_dict = await create_paper_question_info("auto_exam_result_detail", pid, e_related_course)
    if not res:
        await sql_handle.delete(settings.PAPER, {"PIID": pid})
        bak_data.update(**DEFAULT_EXAMINATION)
        await sql_handle.update(settings.EXAMINATION, {"EID": eid}, bak_data)
        return resp_400(msg='创建失败')
    paper_question_res = await get_paper_question_info("auto_exam_result_detail", pid)
    if not paper_question_res:
        return resp_400(msg='创建失败')
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='auto_exam_result_detail',
                                             handle_user='', handle_params=create_paper_dict,
                                             entity_id='', handle_reason='创建试卷-试题信息')
    await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200(data=paper_question_res)


@router.post("/submit_answer/", tags=["SqlHandle"], summary="交卷")
async def submit_answer(submit_answer_info: SubmitAnswerSchema):
    # 获取考试信息
    exam_condition = {"id": submit_answer_info.paper_id}
    e_res = await sql_handle.select("auto_examination", exam_condition)
    if not e_res:
        return resp_200(data=[])
    exam_info = e_res[0]
    eid = exam_info.get("EID")
    # 试卷信息
    paper_condition = {"EID": eid}
    pi_res = await sql_handle.select("auto_paper_info", paper_condition)
    if not pi_res:
        return resp_200(data=[])
    paper_dict = copy.deepcopy(pi_res[0])
    paper_dict.update(id=generate_uuid(), EID=eid, UID=submit_answer_info.UID, PID=generate_bigint_id(),
                      PIID=generate_bigint_id())
    await sql_handle.insert("auto_paper_info", paper_dict)

    pid, new_pid = pi_res[0].get("PIID"), paper_dict.get("PIID")
    # 获取试卷详情信息
    er_condition = {"PID": pid, "QID": submit_answer_info.QID}
    er_res = await sql_handle.select("auto_exam_result_detail", er_condition)
    if not er_res:
        return resp_200(data=[])

    e_related_course = er_res[0]
    e_related_course["solution"] = submit_answer_info.solution
    e_related_course.update(ERID=generate_bigint_id(), PID=new_pid, id=generate_bigint_id())
    await sql_handle.insert("auto_exam_result_detail", e_related_course)
    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.INFO, entity_type='auto_exam_result_detail',
                                             handle_user='', handle_params=submit_answer_info.dict(),
                                             entity_id='', handle_reason='交卷')
    await sql_handle.add_records("log_manage", mysql_log_data)
    return resp_200()


@router.post("/cal_grade/", tags=["SqlHandle"], summary="计算考试结果")
async def cal_grade(payload: CalculatePayload):
    # 获取考试信息
    exam_condition = {"id": payload.paper_id}
    e_res = await sql_handle.select("auto_examination", exam_condition)
    if not e_res:
        return resp_200(data=[])
    exam_info = e_res[0]
    eid = exam_info.get("EID")
    # 获取试卷信息
    paper_condition = {"EID": eid}
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
    er_res = await sql_handle.select("auto_exam_result_detail", er_condition,
                                     fields=["QID", "solution", "ERID", "serial_number"])
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
        for er in er_res:
            if er["QID"] == exam_detail_result["QID"]:
                exam_detail_result.update(serial_number=er["serial_number"])
    sorted_detail = sorted(stu_score_detail, key=lambda x: x["serial_number"])
    exam_score = {"total_score": stu_score, "detail_result": sorted_detail}
    return resp_200(data=exam_score)


@router.post('/search/{code}', tags=['SqlHandle'], summary="搜索表中的数据")
async def search_data(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      middle_dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                      column_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, code: str, payload: dict):
    key_word = payload.get('key_word')
    dal.setDb(TableManage)
    logger.debug(f"搜索表中的数据:{code}:{key_word}")
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

    table_name = f"auto_{res.code}"
    if not key_word and table_name in [settings.TEACHING_RESOURCE, settings.QUESTION_BANK]:
        search_condition, resource_chapter, resource_section, resource_dict = {}, set(), set(), {}
        for key, value in payload.items():
            search_condition[key] = {'operator': 'includes', 'value': value}
        data = await sql_handle.select(table_name, conditions=search_condition, fields=column_res)
        for con in data:
            resource_chapter.add(con.get("chapter"))
            resource_section.add(con.get("section"))
        resource_dict.update(chapter=filter_list(resource_chapter), section=filter_list(resource_section))
        return resp_200(data=resource_dict)
    elif not key_word and table_name in [settings.PLANE_TABLE]:
        plane_set, plane_date, plane_dict, unique = set(), set(), {}, True
        data = await sql_handle.select(table_name, conditions=payload, fields=column_res)
        if data and len(data) > 0:
            unique = False
        plane_dict.update(unique=unique)
        for con in data:
            plane_set.add(con.get(AIRCRAFT_ID))
        for plane in plane_set:
            gnss_date = await sql_handle.select("gnss_data", conditions={"identify_code": plane},
                                                fields=["flight_time"])
            for date_data in gnss_date:
                time_con = date_data.get("flight_time")
                if not time_con:
                    continue
                plane_date.add(time_con.date())
            plane_dict[plane] = plane_date
        return resp_200(data=plane_dict)
    elif not key_word:
        unique = True
        data = await sql_handle.select(table_name, conditions=payload, fields=column_res)
        if data and len(data) > 0:
            unique = False
        return resp_200(data={"unique": unique})
    table_list, hash_id, association_list, association_cols = [], set(), [], []
    for column_info in column_res:
        if column_info.association:
            association_list.extend(column_info.association)
            association_cols.append(column_info.code)
        conditions = {column_info.code: {"value": key_word, "operator": "includes"}}
        condition_res = await sql_handle.select(table_name, conditions=conditions, fields=column_res)
        for condition_info in condition_res:
            if condition_info.get("id") in hash_id:
                continue
            else:
                hash_id.add(condition_info.get("id"))
                table_list.append(condition_info)
    middle_dal.setDb(IntermediateTable)
    association_res_list = []
    for association in association_list:
        association_conditions = {association["tableCol"]: {"value": key_word, "operator": "includes"}}
        association_res = await sql_handle.select(f"auto_{association['tableCode']}", conditions=association_conditions)
        if association_res:
            middle_dal_res = await middle_dal.get_by_all(data_id=association_res[0].get("id"))
            association_res_list.extend([con.correlation_id for con in middle_dal_res])
            association_res_list.append(association_res[0].get("id"))
    for association_id in association_res_list:
        for association_col in association_cols:
            conditions = {association_col: {"value": association_id, "operator": "includes"}}
            condition_res = await sql_handle.select(table_name, conditions=conditions, fields=column_res)
            for condition_info in condition_res:
                if condition_info.get("id") in hash_id:
                    continue
                else:
                    hash_id.add(condition_info.get("id"))
                    table_list.append(condition_info)
    for table_info in table_list:
        data_ids = []
        for con in multiple_col:
            middle_dal_res = await middle_dal.get_by_all(correlation_id=table_info.get(con))
            if middle_dal_res is not None:
                for middle_res in middle_dal_res:
                    data_ids.append(middle_res.data_id)
            table_info[con] = json.dumps(data_ids)
    return resp_200(data={"data": table_list, "total": len(table_list)})


@router.post('/search_fight_replay_data/', tags=['SqlHandle'], summary="搜索飞行表中的数据")
async def search_fight_replay_data(*, payload: SearchFightReplayData):
    select_condition = {"is_delete": RESERVE}
    gnss_fields = settings.GNSS_FIELDS.split(',')
    plane_set, plane_dict = set(), {}

    if payload.identify_code:
        for id_ in payload.identify_code:
            select_condition["identify_code"] = id_
            select_condition["flight_time"] = {"value": (payload.time_start, payload.time_end), "operator": "between"}
            data_info = await sql_handle.select(FLIGHT_DATA_TABLE, conditions=select_condition,
                                                fields=gnss_fields,
                                                order_by={"gps_milliseconds": False})
            plane_dict[id_] = data_info
        return resp_200(data=plane_dict)

    if payload.time_start and payload.time_end:
        select_condition["flight_time"] = {"value": (payload.time_start, payload.time_end), "operator": "between"}
        data_info = await sql_handle.select(FLIGHT_DATA_TABLE, conditions=select_condition,
                                            fields=gnss_fields,
                                            order_by={"gps_milliseconds": False})
        for plane in data_info:
            plane_set.add(plane.get("identify_code"))
        return resp_200(data=plane_set)


@router.post('/search_flight_params/', tags=['SqlHandle'], summary="教员,学员,飞机,航线信息")
async def search_flight_params(input_data: List[dict]):
    plan_parameters = []
    for param in input_data:
        if not input_data:
            plan_parameters.append({})
        plan_parameter, _, _, _ = await flight_design.plan_parameter_setting_collect(param)
        if not plan_parameter:
            return resp_200(data=[])
        plan_parameters.append(copy.deepcopy(plan_parameter))
    return resp_200(data=plan_parameters)
