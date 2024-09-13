#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    :
# @Software: PyCharm
import copy
import random
import asyncio
import itertools
import pandas as pd
from src.utils.logger import logger
from src.config.setting import settings
from datetime import timedelta, datetime
from src.utils.responses import resp_200
from sqlalchemy.exc import SQLAlchemyError
from src.utils.sql_config import sql_handle
from src.utils.analyzing_data_tools import ExcelParser
from src.utils import generate_uuid, generate_bigint_id
from src.db.models import FlyingService, IntermediateTable
from src.utils.flight_evaluation_related_tools import calculator
from src.utils.exam_related_tools import ExamPaperGenerator, cal_grade_percentage
from src.utils.flight_planning_design import gen_schedule, flight_design, check_time, get_remaining_time
from src.utils.tools import list2dict_2, jaccard_similarity, calculate_time_difference, filter_dict, filter_list, \
    list2dict
from src.utils.constant import (RESERVE, QUESTION_TYPE_LIST, AIRCRAFT_TYPE, AIRCRAFT_TYPE_TABLE, AIRFRAME_TIME,
                                ENGINE_TIME, PROPELLER_TIME, CERTIFICATES_TABLE, BIOGRAPHICAL_TABLE, AIRCRAFT_ID,
                                QuestionTypeIndex)


# -----------------------------------------------导入\导出模板信息
def export_table_template(source_info):
    """
    生成表模板信息
    Args:
        source_info:

    Returns:

    """
    table_col_list, association_list = [], []
    for source in source_info:
        if source.association:
            association_list.append({source.code: source.association[0]})
        table_col_list.append(source.name)
    return table_col_list, association_list


async def convert_id2content(associations):
    """
    id转换为具体内容
    Args:
        association:

    Returns:

    """
    associations_list = []
    for association in associations:
        col_code, col_infos = list(association.keys())[0], list(association.values())[0]
        multiple_flag, table_code, table_col = (col_infos.get("multiple"), col_infos.get("tableCode"),
                                                col_infos.get("tableCol"))
        table_name = f"auto_{table_code}"
        col_info = await sql_handle.select(table_name, fields=["id", table_col])
        col_dict = list2dict(col_info)
        if multiple_flag:
            associations_list.append({f"multiple_{col_code}": col_dict})
        else:
            associations_list.append({col_code: col_dict})
    return associations_list


async def import_waypoint_route(table_name, data_info, middle_dal):
    """
    导入航线信息
    Args:
        table_name:
        data_info:
        middle_dal:

    Returns:

    """
    route_dict, middle_data = {}, []
    exist_route = await sql_handle.select(table_name)
    route_length = len(exist_route)
    try:
        sorted_data = sorted(data_info, key=lambda x: x['sequence_number'])
        route_dict["airport"] = sorted_data[0].get("airport")
        route_dict["start_point"] = sorted_data[0].get("id")
        route_dict["end_point"] = sorted_data[-1].get("id")
        route_dict["sequence_number"] = route_length + 1
        route_dict["air_route"] = f"航线_{route_length + 1}"
        route_dict["id"] = generate_uuid()
        route_dict["update_time"] = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        correlation_id = generate_uuid()
        route_dict["all_point"] = correlation_id
        for idx, data_dict in enumerate(sorted_data):
            if idx == 0 or idx == len(sorted_data) - 1:
                continue

            middle_data.append(
                {"correlation_id": correlation_id, "data_id": sorted_data[idx].get("id"), "id": generate_uuid()})
        middle_dal.setDb(IntermediateTable)
        await middle_dal.create_all(middle_data)
        insert_id = await sql_handle.insert(table_name, route_dict)
    except (KeyError, ValueError, SQLAlchemyError) as e:
        logger.error(e)
        return None
    return insert_id


async def import_table_template(table_name, full_file_path, col_items, associations, middle_dal):
    """
    通过excel导入模板信息
    Args:
        table_name:
        full_file_path:
        col_items:
        associations: 关联关系
        middle_dal:

    Returns:

    """

    parser = ExcelParser(full_file_path)
    parser.load_data()
    df = parser.get_dataframe('Sheet1')
    df = df.rename(columns=col_items)
    q_list, middle_data = [], []
    try:
        for index, row in df.iterrows():
            q_dict = {k: (v if pd.notnull(v) else None) for k, v in row.items()}
            if not filter_dict(q_dict):
                continue

            for association in associations:
                for key, value in association.items():
                    association_table_name, col = f"auto_{value['tableCode']}", value['tableCol']
                    col_info = await sql_handle.select(association_table_name, fields=["id", col])
                    col_dict = list2dict_2(col_info)
                    found_similar = False
                    if value.get("multiple"):
                        content_list = q_dict[key].split(",") if q_dict[key] else []
                        if not content_list:
                            q_dict[key] = None
                        else:
                            correlation_id = generate_uuid()
                            for content in content_list:
                                for idx, val in col_dict.items():
                                    similarity = jaccard_similarity(content, idx)
                                    if similarity > 0.8:
                                        middle_data.append(
                                            {"correlation_id": correlation_id, "data_id": val, "id": generate_uuid(),
                                             "create_time": datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
                                        q_dict.update({key: correlation_id})
                                        found_similar = True
                                        break
                                if not found_similar:
                                    q_dict[key] = None
                    else:
                        for idx, val in col_dict.items():
                            if not q_dict[key]:
                                continue
                            similarity = jaccard_similarity(q_dict[key], idx)
                            if similarity > 0.8:
                                q_dict[key] = val
                                found_similar = True
                                break  # 如果找到了相似度大于0.8的项，提前结束循环
                        if not found_similar:
                            q_dict[key] = None
            if table_name == settings.QUESTION_BANK:
                obj_in = await create_question_info(table_name, q_dict)
            else:
                q_dict["id"] = generate_uuid()
                obj_in = q_dict
            q_list.append(copy.deepcopy(obj_in))

        middle_dal.setDb(IntermediateTable)
        await middle_dal.create_all(middle_data)
    except (KeyError, ValueError, SQLAlchemyError) as e:
        logger.error(e)
        return q_list

    return q_list


# -----------------------------------------------飞机信息
async def automatically_calculate_flight_time(table_name, source_info):
    """
    根据飞参等数据自动计算已飞时间
    Args:
        table_name:
        source_info:
    Returns:

    """
    plane_condition = {"aircraft_id": source_info.get("id")}
    plan_res = await sql_handle.select(settings.FLIGHT_PLAN_CONTENT, conditions=plane_condition)
    plan_info = plan_res[0]
    start_datetime, end_datetime = plan_info.get("engine_start"), plan_info.get("parking")
    seconds, hours, minutes = calculate_time_difference(start_datetime, end_datetime)


async def allowed_flight_time(table_name, source_info):
    """
    “已飞时间”列为只允许录入一次,关联三证信息表，飞机履历信息表
    Args:
        table_name:
        source_info:

    Returns:

    """
    plane_dict = await sql_handle.get_table_columns(table_name)
    plane_dict.update(**source_info)

    condition = {"id": source_info.get("id")}
    plane_res = await sql_handle.select(table_name, conditions=condition)
    if plane_res:
        plane_info = plane_res[0]
        airframe_time, engine_time, propeller_time = plane_info.get(AIRFRAME_TIME), plane_info.get(
            ENGINE_TIME), plane_info.get(PROPELLER_TIME)
        if airframe_time:
            plane_dict[AIRFRAME_TIME] = airframe_time
        if engine_time:
            plane_dict[ENGINE_TIME] = engine_time
        if propeller_time:
            plane_dict[PROPELLER_TIME] = propeller_time
        return plane_dict

    # 关联三证信息表
    certificates_dict = await sql_handle.get_table_columns(CERTIFICATES_TABLE)
    common_keys = set(source_info).intersection(set(certificates_dict))
    intersection_certificates_dict = {key: source_info[key] for key in common_keys}
    certificates_dict.update(**intersection_certificates_dict)
    certificates_dict[AIRCRAFT_ID] = source_info.get("id")
    await sql_handle.insert(CERTIFICATES_TABLE, certificates_dict)
    # 飞机履历信息表
    biographical_dict = await sql_handle.get_table_columns(BIOGRAPHICAL_TABLE)
    common_keys = set(source_info).intersection(set(biographical_dict))
    intersection_biographical_dict = {key: source_info[key] for key in common_keys}
    biographical_dict.update(**intersection_biographical_dict)
    biographical_dict[AIRCRAFT_ID] = source_info.get("id")
    await sql_handle.insert(BIOGRAPHICAL_TABLE, biographical_dict)

    return plane_dict


# -----------------------------------------------课程/教学资源信息
async def create_course_source_info(table_name, source_info):
    """
    课程资源内容
    Args:
        table_name:
        source_info:

    Returns:

    """
    course_source_dict = await sql_handle.get_table_columns(table_name)
    course_source_dict.update(RID=generate_bigint_id())
    course_source_dict.update(**source_info)
    if source_info.get("section"):
        course_source_dict.update(course_name=source_info.get("section"))
    else:
        course_source_dict.update(course_name=source_info.get("chapter"))
    return course_source_dict


# -----------------------------------------------题库信息管理
async def create_question_info(table_name, question_info):
    """
    题库资源内容
    Args:
        table_name:
        question_info:

    Returns:

    """
    question_dict = await sql_handle.get_table_columns(table_name)
    question_dict.update(**question_info)
    question_dict.update(QID=generate_bigint_id())
    question_dict.update(id=generate_uuid())
    question_dict.update(is_delete=RESERVE)
    question_dict.update(update_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    question_dict.update(create_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return question_dict


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
    online_learning_dict.update(date=datetime.now().strftime("%Y-%m-%d"))
    online_learning_dict.update(create_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    online_learning_dict.update(update_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

    return online_learning_dict


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
        return exam_dict
    except ValueError as err:
        logger.error(err)
        return []


async def get_exam_question_info(code, conditions):
    """

    Args:
        code:
        conditions: {"id":auto_examination.id}

    Returns:

    """
    try:
        uid = None
        table_name = f"auto_{code}"
        if conditions.get("UID"):
            uid = conditions["UID"]
            e_conditions = {"id": conditions.get("id")}
        else:
            e_conditions = conditions
        # 获取考试信息
        e_res = await sql_handle.select(table_name, e_conditions)
        if not conditions:
            return e_res

        if not e_res:
            return []
        e_info = e_res[0]
        eid = e_info.get("EID")
        # 获取题型分数
        q_score = {
            QuestionTypeIndex.SingleChoice: e_res[0].get("single_choice_score"),
            QuestionTypeIndex.MultipleChoice: e_res[0].get("multiple_choice_score"),
            QuestionTypeIndex.Fill: e_res[0].get("fill_score"),
            QuestionTypeIndex.Judge: e_res[0].get("judge_score"),
            QuestionTypeIndex.ShortAnswer: e_res[0].get("short_answer_score")
        }
        exam_paper = ExamPaperGenerator(settings.QUESTION_BANK)
        await exam_paper.qt.get_col()
        await exam_paper.qt.get_question_type_dictionary()
        q_type_score = {
            exam_paper.qt.SingleChoice: q_score.get(QuestionTypeIndex.SingleChoice),
            exam_paper.qt.MultipleChoice: q_score.get(QuestionTypeIndex.MultipleChoice),
            exam_paper.qt.Fill: q_score.get(QuestionTypeIndex.Fill),
            exam_paper.qt.Judge: q_score.get(QuestionTypeIndex.Judge),
            exam_paper.qt.ShortAnswer: q_score.get(QuestionTypeIndex.ShortAnswer),
        }

        # 获取试卷信息
        paper_condition = {"EID": eid}
        if uid:
            paper_condition["UID"] = uid
        pi_res = await sql_handle.select(settings.PAPER, paper_condition, fields=["PIID"])
        if not pi_res:
            pi_res = await sql_handle.select(settings.PAPER, {"EID": eid}, fields=["PIID"],
                                             order_by={"update_time": True})
            if not pi_res:
                return []

        pid = pi_res[0].get("PIID")

        paper_question_res = await get_paper_question_info("auto_exam_result_detail", pid, q_type_score)
        if not paper_question_res:
            return []
        return paper_question_res
    except ValueError as err:
        logger.error(err)
        return []


# -----------------------------------------------在线考试

# 试卷总体信息
async def create_paper_info(table_name, paper_info, examinees=False):
    """
    试卷总体信息
    Args:
        table_name: auto_paper_info
        paper_info:
        examinees:

    Returns:

    """
    try:
        paper_dict = await sql_handle.get_table_columns(table_name)
        exam_condition = {"id": paper_info.exam_id}
        examinees_res = await sql_handle.select(settings.EXAMINATION, exam_condition)
        if not examinees_res:
            return []
        exam_res = examinees_res[0]
        # paper_info
        eid, exam_name, start_time, end_time, paper_serial, allow_times = (exam_res.get("EID"), exam_res.get(
            "exam_name"), exam_res.get("start_time"), exam_res.get("end_time"), exam_res.get("paper_num"),
                                                                           exam_res.get("allow_times"))
        if not start_time:
            now = datetime.now()
            current_seconds = now.second
            if current_seconds != 0:
                next_minute = now + timedelta(seconds=(60 - current_seconds))
            else:
                next_minute = now
            start_time = next_minute.strftime("%Y-%m-%d %H:%M:%S")

        uid_res = await sql_handle.select(settings.PAPER, {"UID": paper_info.UID, "EID": eid})
        if not uid_res:
            paper_dict.update(id=generate_uuid(), EID=eid, UID=paper_info.UID, PID=generate_bigint_id(),
                              PIID=generate_bigint_id(), start_time=start_time, end_time=end_time,
                              paper_serial=paper_serial, date=datetime.now().strftime("%Y-%m-%d"),
                              user_name=paper_info.username if paper_info.username else "sysadmin", exam_name=exam_name,
                              update_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            await sql_handle.insert(settings.PAPER, paper_dict)
            examinees = True
        if examinees:
            # examination
            exam_dict = paper_info.dict()
            exam_dict.pop("exam_id")
            exam_dict.pop("UID")
            exam_dict.pop("username")
            update_data = filter_dict(exam_dict)
            examinees_num = examinees_res[0].get("examinees_num") if examinees_res[0].get("examinees_num") else 0
            update_data.update(examinees_num=examinees_num + 1)
            await sql_handle.update(settings.EXAMINATION, exam_condition, update_data)
        return paper_dict
    except ValueError as err:
        logger.error(err)
        return []


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
        ratio_value /= 100
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
async def create_paper_question_info(table_name, pid, course_info):
    """
    生成试卷
    Args:
        table_name: auto_exam_result_detail
        pid: 试卷 ID
        course_info: 试卷组成内容及数量，eg:{"fill": 5, "judge": 5, "multiple_choice": 5, "short_answer": 5, "single_choice": 10}
        course_info: 课程信息

    Returns:

    """
    paper_question_dict = await sql_handle.get_table_columns(table_name)
    paper_question_dict.update(PID=pid)
    paper_question_dict.update(reviewed=False)
    paper_question_dict.update(update_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

    paper_info_list = []
    question_type_counts = {k: v for k, v in course_info.items() if
                            k in QUESTION_TYPE_LIST}

    course_ratio = distribute_course_ratio(course_info, question_type_counts)

    exam_paper = ExamPaperGenerator("auto_question_bank")
    for course_id, question_type in course_ratio.items():
        exam_paper_info = await exam_paper.generate_exam(question_type, course_id)
        exam_paper_info = filter_list(exam_paper_info)
        for idx, question in enumerate(exam_paper_info):
            try:
                paper_question_dict.update(id=generate_uuid())
                paper_question_dict.update(ERID=generate_bigint_id())
                paper_question_dict["serial_number"] = idx + 1
                paper_question_dict["QID"] = question.QID
                paper_info_list.append(copy.copy(paper_question_dict))
            except AttributeError as err:
                logger.error(f"{err}:INFO:{exam_paper_info}:Index:{idx}:Content:{question}")
                return None, None
    await sql_handle.batch_insert(table_name, paper_info_list)
    return paper_info_list, question_type_counts


async def get_paper_question_info(table_name, pid, type_score=None):
    """
    获取试卷-题目详细内容
    Args:
        table_name: auto_exam_result_detail
        pid: 试卷 ID
        type_score: 试卷 ID

    Returns:

    """
    condition = {"PID": pid}
    table_info = await sql_handle.select(table_name, conditions=condition)
    if not table_info:
        return
    qid_list, q_a_list, exam_info = [], [], []
    for info in table_info:
        qid_list.append(info["QID"])
        q_a_list.append({"QID": info["QID"], "solution": info["solution"]})
        used_time = await sql_handle.select("auto_question_bank", {"QID": info["QID"]}, fields=["used_times"])
        try:
            used_times = used_time[0]["used_times"] if used_time[0]["used_times"] else 0
        except IndexError:
            used_times = 0
        await sql_handle.update("auto_question_bank", {"QID": info["QID"]},
                                {"used_times": used_times + 1})
    question_condition = {"QID": {"value": qid_list, "operator": "in"}}
    question_info_list = await sql_handle.select("auto_question_bank", conditions=question_condition)
    for question_con in question_info_list:
        for q_a in q_a_list:
            if question_con["QID"] == q_a["QID"]:
                question_con.update(solution=q_a["solution"])
                if type_score:
                    question_con.update(score=type_score.get(question_con["type"]))
                exam_info.append(question_con)
    return exam_info


# 试卷总体信息
async def create_exam_result_info(table_name, exam_result_condition):
    """
    统计考试成绩信息
    Args:
        table_name: auto_exam_result
        exam_result_condition: {"id":auto_examination.id}

    Returns:

    """
    try:
        # 获取考试信息
        e_res = await sql_handle.select(settings.EXAMINATION, exam_result_condition)
        if not exam_result_condition:
            return e_res

        if not e_res:
            return []
        exam_info = e_res[0]
        eid, reference_unit, examinees_num, exam_name = (exam_info.get("EID"), exam_info.get("reference_unit"),
                                                         exam_info.get("examinees_num"), exam_info.get("id"))
        # 获取试卷信息
        paper_condition = {"EID": eid}
        pi_res = await sql_handle.select(settings.PAPER, paper_condition, fields=["total_score"])
        score_list = [con.get("total_score") if con.get("total_score") else 0 for con in pi_res]
        score_list.sort(reverse=True)
        average_score, highest_score, lowest_score = sum(score_list) // len(score_list), score_list[0], score_list[-1]

        ideal_percent, good_percent, pass_percent, flunk_percent = cal_grade_percentage(score_list)
        exam_result_dict = await sql_handle.get_table_columns(table_name)
        exam_result_dict.update(id=generate_uuid(), class_name=reference_unit, major=exam_name,
                                student_num=examinees_num, average_score=average_score, highest_score=highest_score,
                                lowest_score=lowest_score, ideal_percentage=ideal_percent, good_percentage=good_percent,
                                pass_percentage=pass_percent, flunk_percentage=flunk_percent)
        exam_result_condition = {"major": exam_info.get("id")}
        exam_result_res = await sql_handle.select(table_name, exam_result_condition)
        if exam_result_res:
            await sql_handle.update(table_name, conditions=exam_result_condition, updated_data=exam_result_dict)
        else:
            await sql_handle.insert(table_name, exam_result_dict)
    except ValueError as err:
        logger.error(err)
        return []


# -----------------------------------------------飞行计划制定
async def import_flight_route(table_name, full_file_path):
    """
    导入已有经纬度数据，直接生成航线轨迹
    Args:
        table_name:
        full_file_path:

    Returns:

    """
    pass


async def create_flight_plan_base(table_name, plan_base_info):
    """
    完善飞行计划信息
    Args:
        table_name:
        plan_base_info:

    Returns:

    """
    try:
        plan_base_dict = await sql_handle.get_table_columns(table_name)
        plan_base_dict.update(**plan_base_info)
        times_today = calculator.get_astral_times()
        plan_base_dict.update(**times_today)
        plan_base_dict.update(PID=generate_bigint_id())
        return plan_base_dict
    except ValueError as err:
        logger.error(err)
        return []


async def refine_flight_plane_info(table_name, plane_info):
    """
    完善飞行计划中的飞机信息：机型-机号
    Args:
        table_name:
        plane_info:

    Returns:

    """
    try:
        plane_info_dict = await sql_handle.get_table_columns(table_name)
        plane_info_dict.update(**plane_info)
        air_id_condition = {"id": plane_info["aircraft_id"]}
        air_id_res = await sql_handle.select(settings.PLANE_TABLE, conditions=air_id_condition)
        if not air_id_res:
            return []

        air_type_id = air_id_res[0][AIRCRAFT_TYPE]
        air_type_condition = {"id": air_type_id}
        air_type_res = await sql_handle.select(AIRCRAFT_TYPE_TABLE, conditions=air_type_condition)
        if not air_id_res:
            return []
        air_type = air_type_res[0]["id"]
        plane_info_dict.update(aircraft_type=air_type)
        return plane_info_dict
    except ValueError as err:
        logger.error(err)
        return []


async def get_flight_plan_content_info(code, conditions):
    """
    获取飞行计划内容信息
    Args:
        code:
        conditions:

    Returns:

    """
    try:
        table_name = f"auto_{code}"
        # 获取auto_flight_plan_content信息
        plan_parameter = await sql_handle.select(table_name, conditions)
        if not conditions:
            return plan_parameter
        if not plan_parameter:
            return []
        pid = plan_parameter[0].get("PID")
        # 获取auto_flight_plan_base信息
        plan_base_condition = {"PID": pid}
        plan_base_res = await sql_handle.select("auto_flight_plan_base", plan_base_condition)
        if not plan_base_res:
            return []
        return {"base": plan_base_res, "content": plan_parameter}

    except ValueError as err:
        logger.error(err)
        return []


def gen_params_ids(cons, selected_info=None):
    ids_list = []
    if not selected_info:
        ids_list.extend([con.get("id") for con in cons])
    else:
        for con in cons:
            if con.get("id") in selected_info:
                ids_list.append(con.get("id"))
    return ids_list


async def create_single_flying_service(dal, input_data):
    """
    创建一条飞行计划
    Args:
        dal:
        input_data: {"id":auto_flight_plan_base.id}

    Returns:

    """
    pid = input_data.PID[0]
    plan_param_condition = {"id": pid}
    # 收集信息
    plan_parameter, plan_content, plane_info, stu_info = await flight_design.plan_parameter_setting_collect(
        plan_param_condition)
    input_data.name = plan_parameter["name"]
    if not plan_parameter:
        return []
    try:
        plane_id = input_data.plane.get("id")
        coach_id = input_data.coach.get("id")
        student_id = input_data.student.get("id")
        route_id = input_data.fly_route.get("id")
    except IndexError as err:
        logger.error(err)
        return []

    obj_in = input_data.dict()
    expand_data = copy.deepcopy(obj_in)
    flight_duration = obj_in.get("flight_duration")
    if flight_duration:
        obj_in["flight_duration"] = flight_duration
    else:
        obj_in["flight_duration"] = list(plan_parameter["flight_duration"].values())[0]

    flight_interval = obj_in.get("flight_interval")
    if not flight_interval:
        flight_interval = plan_parameter["flight_interval"]
        obj_in["flight_interval"] = plan_parameter["flight_interval"]
    break_time_length = timedelta(minutes=flight_interval)

    start_time_str = input_data.start_time
    start_date = datetime.strptime(start_time_str, '%Y-%m-%d %H:%M:%S')
    plane_exist_plan = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE, plan_time_end__gte=start_date)
    plane_latest_time = max([plan.real_time_end for plan in plane_exist_plan]) if plane_exist_plan else start_date
    remaining_flag = get_remaining_time(plane_latest_time, break_time_length, input_data.start_time,
                                        input_data.end_time)
    if remaining_flag:
        return resp_200(data=[], msg="飞机安排存在冲突"), None

    coach_exist_plan = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE, plan_time_end__gte=start_date)
    coach_latest_time = max([coach.real_time_end for coach in coach_exist_plan]) if coach_exist_plan else start_date
    remaining_flag = get_remaining_time(coach_latest_time, break_time_length, input_data.start_time,
                                        input_data.end_time)
    if remaining_flag:
        return resp_200(data=[], msg="教练安排存在冲突"), None

    student_exist_plan = await dal.get_by_all(student_id=student_id, is_delete=RESERVE, plan_time_end__gte=start_date)
    student_latest_time = max(
        [student.real_time_end for student in student_exist_plan]) if student_exist_plan else start_date
    remaining_flag = get_remaining_time(student_latest_time, break_time_length, input_data.start_time,
                                        input_data.end_time)
    if remaining_flag:
        return resp_200(data=[], msg="学生安排存在冲突"), None

    route_exist_plan = await dal.get_by_all(route_id=route_id, is_delete=RESERVE, plan_time_end__gte=start_date)
    route_latest_time = max([route.real_time_end for route in route_exist_plan]) if route_exist_plan else start_date
    remaining_flag = get_remaining_time(route_latest_time, break_time_length, input_data.start_time,
                                        input_data.end_time)
    if remaining_flag:
        return resp_200(data=[], msg="航线安排存在冲突"), None

    latest_time = max(plane_latest_time, coach_latest_time, student_latest_time, route_latest_time)

    available_plane = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE)
    available_coach = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE)
    available_fly_route = await dal.get_by_all(route_id=route_id, is_delete=RESERVE)
    available_student = await dal.get_by_all(student_id=student_id, is_delete=RESERVE)

    if latest_time and (latest_time + break_time_length) >= datetime.strptime(obj_in.get("start_time"),
                                                                              '%Y-%m-%d %H:%M:%S'):
        obj_in["start_time"] = (latest_time + break_time_length).strftime("%Y-%m-%d %H:%M:%S")
    plan_info = gen_schedule(obj_in, expand_data, available_plane, available_coach, available_fly_route,
                             available_student)
    if plan_info:
        plan_content["aircraft_id"] = plane_id
        for plane_con in plane_info:
            if plane_con[pid].get("id") == plane_id:
                plan_content["aircraft_type"] = plane_con[pid].get("plane_type")
                break
        for stu_con in stu_info:
            if stu_con[pid].get("id") == student_id:
                plan_content.update(student_name=stu_con[pid]["student_name"],
                                    student_code_name=stu_con[pid]["student_code_name"])
                break
        course_source_dict = await create_flight_plan_info(plan_info[0], plan_content)
    else:
        course_source_dict = {}
    return plan_info, course_source_dict


async def create_batch_flying_service(dal, input_data, obj_in):
    """
    批量创建飞行计划
    Args:
        dal:
        input_data:
        obj_in:
    Returns:

    """
    selected_plane, selected_coach, selected_student, selected_route = (
        obj_in.get("plane").get("id"), obj_in.get("coach").get("id"),
        obj_in.get("student").get("id"), obj_in.get("fly_route").get("id"))
    # 收集信息
    dal.setDb(FlyingService)
    plane_id = gen_params_ids(input_data.get("plane_ids"), selected_plane)
    coach_id = gen_params_ids(input_data.get("coach_ids"), selected_coach)
    student_id = gen_params_ids(input_data.get("student_ids"), selected_student)
    route_id = gen_params_ids(input_data.get("route_ids"), selected_route)

    plan_info_list = []
    route_time_dict = dict()
    expand_data = copy.deepcopy(obj_in)

    duration_list = []
    flight_duration = obj_in.get("flight_duration")
    if flight_duration:
        obj_in["plan_duration"] = flight_duration
        duration_list.extend([flight_duration for _ in range(len(route_id))])
    else:
        duration_list.extend(input_data["flight_duration"].values())
    interval_list = []
    flight_interval = obj_in.get("flight_interval")
    if flight_interval:
        interval_list.extend([flight_interval for _ in range(len(route_id))])
    else:
        interval_list.extend([input_data["flight_interval"] for _ in range(len(route_id))])

    start_date = input_data.get("start_time")
    end_date = input_data.get("end_time")

    # 查询当天存在的航线安排
    for id in route_id:
        date_times = []
        route_exist_plan = await dal.get_by_all(route_id=id, is_delete=RESERVE, plan_time_start__gte=start_date)
        date_times.extend([plan.real_time_end for plan in route_exist_plan])
        if date_times:
            max_date_time = max(date_times)
            if max_date_time + timedelta(minutes=duration_list[0]) <= end_date:
                route_time_dict[id] = max_date_time
            else:
                continue
        else:
            route_time_dict[id] = start_date

    # 查询到当天存在的安排
    latest_plan_list = []
    for plane in plane_id:
        plane_exist_plan = await dal.get_by_all(route_id=plane, is_delete=RESERVE, plan_time_start__gte=start_date)
        latest_plan_list.extend(plane_exist_plan)

    def allocate_available_source():
        """
        分派资源
        Returns:

        """
        from operator import itemgetter
        copies = []
        # 升序排列
        sorted_tuples = sorted(route_time_dict.items(), key=itemgetter(1), reverse=True)
        sorted_route_lst = [t[0] for t in sorted_tuples]
        n = len(sorted_route_lst)
        plane_distributions = distribute_elements(plane_id, n)
        sorted_plane_lst = sorted(plane_distributions, key=len)
        coach_distributions = distribute_elements(coach_id, n)
        sorted_coach_lst = sorted(coach_distributions, key=len)
        student_distributions = distribute_elements(student_id, n)
        sorted_student_lst = sorted(student_distributions, key=len)
        for i in range(n):
            copied_dict = copy.deepcopy(obj_in)
            copied_dict["fly_route"]["id"] = sorted_route_lst[i]
            copied_dict["flight_duration"] = duration_list[i]
            copied_dict["flight_interval"] = interval_list[i]
            copied_dict["plane"]["id"] = sorted_plane_lst[i]
            copied_dict["coach"]["id"] = sorted_coach_lst[i]
            copied_dict["student"]["id"] = sorted_student_lst[i]
            if route_time_dict[sorted_route_lst[i]] != start_date:
                break_time_length = timedelta(minutes=interval_list[i])
                copied_dict["start_time"] = (route_time_dict[sorted_route_lst[i]] + break_time_length).strftime(
                    "%Y-%m-%d %H:%M:%S")
            copies.append(copied_dict)
        return copies

    def distribute_elements(elements, groups):
        """
        分派二级资源
        Args:
            elements:
            groups:

        Returns:

        """
        n = len(elements)
        even_distribution = n // groups
        remainder = n % groups
        distributions = [[] for _ in range(groups)]
        for i in range(groups):
            distributions[i].extend(elements[i * even_distribution:(i + 1) * even_distribution])  # 这里用数字i+1代替实际元素，以示区分
        for i in range(remainder):
            distributions[i].append(elements[groups * even_distribution + remainder - 1 - i])
        return distributions

    def find_unique_elements(list1):
        unique_elements = []
        cartesian = list(itertools.product(student_id, coach_id, plane_id))
        for element2 in cartesian:
            is_unique = True
            for element1 in list(set(list1)):
                if element2[0] == element1[0] or element2[1] == element1[1] or element2[2] == element1[2]:
                    is_unique = False
                    break
            if is_unique:
                unique_elements.append(element2)
        return unique_elements

    def check_plan(plan_info_list):
        checked_conflict_plan, all_plan, planed_list = [], [], []
        for plan_info in plan_info_list:
            plan_time_start, plan_time_end = plan_info["plan_time_start"], plan_info["plan_time_end"]

            for latest_plan in latest_plan_list:
                if check_time([latest_plan], plan_time_start, plan_time_end):
                    all_plan.append(
                        (int(latest_plan.student_id), int(latest_plan.coach_id), int(latest_plan.plane_id)))
                    if (latest_plan.student_id == str(plan_info["student_id"])
                            or latest_plan.coach_id == str(plan_info["coach_id"])
                            or latest_plan.plane_id == str(plan_info["plane_id"])):
                        checked_conflict_plan.append(
                            (plan_info["student_id"], plan_info["coach_id"], plan_info["plane_id"]))

                    plan_obj = PlanObject(plan_info)
                    planed_list.append(plan_obj)

        return list(set(checked_conflict_plan)), list(set(all_plan)), planed_list

    def conflict_resolution(plan_info_list, checked_info, unique_elements):
        for idx, check_info in enumerate(checked_info):
            for plan_info in plan_info_list:
                try:
                    if check_info[0] == plan_info["student_id"] and check_info[1] == plan_info["coach_id"] and \
                            check_info[
                                2] == plan_info["plane_id"]:
                        plan_info["student_id"] = unique_elements[idx][0]
                        plan_info["coach_id"] = unique_elements[idx][1]
                        plan_info["plane_id"] = unique_elements[idx][2]
                        checked_info_list.append(unique_elements[idx])
                except IndexError:
                    continue

    class PlanObject:
        def __init__(self, data_dict):
            for key, value in data_dict.items():
                setattr(self, key, value)

    try:
        allocate_datas = allocate_available_source()
    except Exception as e:
        logger.warning(e)
        return resp_200(data=[])
    for allocate_data in allocate_datas:
        plan_info = gen_schedule(allocate_data, expand_data, [], [], [], [], auto_gen=True)
        plan_info_list.extend(plan_info)
    dal.setDb(FlyingService)
    end_list = []
    for con in plan_info_list:
        checked_info_list = []
        checked_info, all_info, planed = check_plan([con])
        latest_plan_list.extend(planed)
        checked_info_list.extend(checked_info)
        all_info.extend(checked_info_list)
        unique_elements = find_unique_elements(all_info)
        if not unique_elements and not checked_info:
            end_list.append(con)
            continue
        if not unique_elements and checked_info:
            continue
        random.shuffle(unique_elements)
        conflict_resolution([con], checked_info, unique_elements)
        end_list.append(con)
    return end_list


async def create_flight_plan_info(plan_info, plan_content):
    """
    生成计划数据
    Args:
        plan_info:
        plan_content: 写入表auto_flight_plan_content的内容

    Returns:
        flight_plan_dict
    """
    flight_plan_dict = await sql_handle.get_table_columns(settings.FLIGHT_PLAN_CONTENT)
    flight_plan_dict.update(id=generate_uuid())
    flight_plan_dict.update(PID=plan_content.get("PID"))
    flight_plan_dict.update(BID=generate_bigint_id())
    flight_plan_dict.update(is_delete=RESERVE)
    flight_plan_dict.update(create_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    flight_plan_dict.update(update_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    flight_plan_dict.update(aircraft_id=plan_content.get("aircraft_id"))
    flight_plan_dict.update(aircraft_type=plan_content.get("aircraft_type"))
    flight_plan_dict.update(longitudinal_position=1)
    flight_plan_dict.update(scheduled_takeoff=plan_info.get("plan_time_start"))
    # flight_plan_dict.update(initiate_takeoff=)
    # flight_plan_dict.update(engine_start=)
    # flight_plan_dict.update(landing=)
    flight_plan_dict.update(parking=plan_info.get("plan_time_end"))
    flight_plan_dict.update(trainee_subject=True)
    flight_plan_dict.update(practice_combination="101x6")
    flight_plan_dict.update(launch_interval=plan_content.get("launch_interval"))
    flight_plan_dict.update(preparation_time=30)
    flight_plan_dict.update(number_of_practices=1)
    flight_plan_dict.update(number_of_flyers=1)
    flight_plan_dict.update(crew_combination="701+901")
    flight_plan_dict.update(current_status=plan_content.get("current_status"))
    flight_plan_dict.update(front_cabin_name=plan_content.get("student_name"))
    flight_plan_dict.update(front_cabin_code=plan_content.get("student_code_name"))
    flight_plan_dict.update(rear_cabin_name=plan_content.get("student_name"))
    flight_plan_dict.update(rear_cabin_code=plan_content.get("student_code_name"))
    return flight_plan_dict


create_fun_dict = {settings.EXAMINATION: create_exam_info, settings.FLIGHT_PLAN_BASE: create_flight_plan_base,
                   settings.ONLINE_LEARNING: create_online_learning_record_info, settings.PAPER: create_paper_info,
                   settings.TEACHING_RESOURCE: create_course_source_info, settings.QUESTION_BANK: create_question_info,
                   settings.FLIGHT_PLAN_PLANE: refine_flight_plane_info, settings.PLANE_TABLE: allowed_flight_time}
get_fun_dict = {settings.EXAMINATION: get_exam_question_info,
                settings.FLIGHT_PLAN_CONTENT: get_flight_plan_content_info}

if __name__ == '__main__':
    # print(asyncio.run(sql_handle.get_table_columns("auto_question_bank")))
    # question_type = {"fill": 4, "judge": 4, "multiple_choice": 4, "short_answer": 5, "single_choice": 12}
    # exam_paper_info = asyncio.run(create_paper_question_info("auto_exam_result_detail", question_type))
    # print(exam_paper_info)
    # source_info = {"course_id": "47981834-c597-4d22-8b5b-0f1ae6b75b58", "keep_time": 50, "user_id": 47981834597}
    # asyncio.run(create_online_learning_record_info("auto_online_learning_record", source_info))
    # source_info = {"id": "88b63ec4-d50a-41cb-a2f2-07d216b4ff76", "keep_time": 50, "user_id": 47981834597}
    # asyncio.run(allowed_flight_time(settings.PLANE_TABLE, source_info))
    exam_result_condition = {"id": "28ac278b-a962-460c-91f8-d03d56880c76"}
    asyncio.run(create_exam_result_info("auto_exam_result", exam_result_condition))
