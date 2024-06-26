#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    :
# @Software: PyCharm
import asyncio
import copy
import datetime
from datetime import timedelta
from src.config.setting import settings
from src.db.models import FlyingService
from src.utils.responses import resp_200
from src.utils.sql_config import sql_handle
from src.utils import generate_uuid, generate_bigint_id
from src.db.schemas.flying_manage import CreateFlyingPlan
from src.utils.exam_related_tools import ExamPaperGenerator
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import RESERVE, QUESTION_TYPE_LIST, RecordsStatusCode
from src.utils.flight_planning_design import gen_schedule, flight_design, check_time


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
    # TODO UID用户id
    course_source_dict.update(UID="")
    course_source_dict.update(**source_info)
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
    question_dict.update(QID=generate_bigint_id())
    question_dict.update(**question_info)
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
    online_learning_dict.update(date=datetime.datetime.now().strftime("%Y-%m-%d"))
    online_learning_dict.update(create_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    online_learning_dict.update(update_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

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
        # random.shuffle(e_res) # 随机打乱
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
    qid_list, q_a_list, exam_info = [], [], []
    for info in table_info:
        qid_list.append(info["QID"])
        q_a_list.append({"QID": info["QID"], "solution": info["solution"]})
        used_time = await sql_handle.select("auto_question_bank", {"QID": info["QID"]}, fields=["used_times"])
        await sql_handle.update("auto_question_bank", {"QID": info["QID"]},
                                {"used_times": used_time[0]["used_times"] + 1})
    question_condition = {"QID": {"value": qid_list, "operator": "in"}}
    question_info_list = await sql_handle.select("auto_question_bank", conditions=question_condition)
    for question_con in question_info_list:
        for q_a in q_a_list:
            if question_con["QID"] == q_a["QID"]:
                question_con.update(solution=q_a["solution"])
                exam_info.append(question_con)
    return exam_info


# -----------------------------------------------飞行计划制定
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


async def create_single_flying_service(dal, input_data):
    """
    创建一条飞行计划
    Args:
        dal:
        input_data: {"id":auto_flight_plan_base.id}

    Returns:

    """

    # 收集信息
    plan_parameter, plan_content = await flight_design.plan_parameter_setting_collect(input_data)
    if not plan_parameter:
        return []
    # logger.info(f"创建一条飞行计划:{plan_parameter}")
    try:
        plane_id = plan_parameter.get("plane_ids")[0]
        coach_id = plan_parameter.get("coach_ids")[0]
        student_id = plan_parameter.get("student_ids")[0]
        route_id = plan_parameter.get("route_ids")[0]
    except IndexError as err:
        logger.error(err)
        return []
    start_date = plan_parameter.get("start_time")

    create_plan = CreateFlyingPlan
    create_plan.name = plan_parameter.get("name")
    create_plan.description = plan_parameter.get("description")
    create_plan.start_time = plan_parameter.get("start_time")
    create_plan.end_time = plan_parameter.get("end_time")

    dal.setDb(FlyingService)
    plane_exist_plan = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(plane_exist_plan, create_plan.start_time, create_plan.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="飞机安排存在冲突")
    plane_latest_time = max([plan.real_time_end for plan in plane_exist_plan]) if plane_exist_plan else start_date

    coach_exist_plan = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(coach_exist_plan, create_plan.start_time, create_plan.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="教练安排存在冲突")
    coach_latest_time = max([coach.real_time_end for coach in coach_exist_plan]) if coach_exist_plan else start_date

    student_exist_plan = await dal.get_by_all(student_id=student_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(student_exist_plan, create_plan.start_time, create_plan.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="学生安排存在冲突")
    student_latest_time = max(
        [student.real_time_end for student in student_exist_plan]) if student_exist_plan else start_date

    route_exist_plan = await dal.get_by_all(route_id=route_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(route_exist_plan, create_plan.start_time, create_plan.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="航线安排存在冲突")
    route_latest_time = max([route.real_time_end for route in route_exist_plan]) if route_exist_plan else start_date

    latest_time = max(plane_latest_time, coach_latest_time, student_latest_time, route_latest_time)

    available_plane = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE)
    available_coach = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE)
    available_fly_route = await dal.get_by_all(route_id=route_id, is_delete=RESERVE)
    available_student = await dal.get_by_all(student_id=student_id, is_delete=RESERVE)

    # 飞行计划时长
    # if flight_duration:
    #     obj_in["plan_duration"] = flight_duration
    # else:
    #     name = input_data.fly_route.get('table')
    #     table_name = f"auto_{name}"
    #     select_conditions = {"id": route_id}
    #     flight_duration = await sql_handle.select(table_name, conditions=select_conditions, fields=["flight_duration"])
    #     if not flight_duration:
    #         return resp_404(msg=f"未能获取到航线:{route_id}信息")
    #     obj_in["plan_duration"] = flight_duration[0]["flight_duration"]

    # flight_interval = plan_parameter.get("flight_interval")
    # select_conditions = {"id": plane_id}
    # flight_interval = await sql_handle.select(table_name, conditions=select_conditions, fields=["flight_interval"])
    # if not flight_interval:
    #     return resp_404(msg=f"未能获取到飞机:{plane_id}信息")
    # plan_parameter["flight_interval"] = flight_interval[0]["flight_interval"]
    # TODO 两架飞机间的放飞间隔时间放飞间隔
    flight_interval = 15

    plan_parameter["flight_interval"] = flight_interval
    break_time_length = timedelta(minutes=flight_interval)
    if latest_time and (latest_time + break_time_length) >= start_date:
        plan_parameter["start_time"] = (latest_time + break_time_length).strftime("%Y-%m-%d %H:%M:%S")
    plan_parameter["end_time"] = (plan_parameter.get("end_time")).strftime("%Y-%m-%d %H:%M:%S")
    expand_data = copy.deepcopy(plan_parameter)
    plan_info = gen_schedule(plan_parameter, expand_data, available_plane, available_coach, available_fly_route,
                             available_student)

    await dal.create_all(plan_info)
    # 写入数据表auto_flight_plan_content
    plan_content["launch_interval"] = 15
    course_source_dict = await create_flight_plan_info(plan_info[0], plan_content)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
                                             handle_user="", handle_params=plan_parameter,
                                             entity_id="",
                                             handle_reason=create_plan.description if create_plan.description else '创建一条飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return course_source_dict


async def create_batch_flying_service(dal, input_data):
    """
    批量创建飞行计划
    Args:
        dal:
        input_data: {"id":auto_flight_plan_base.id}

    Returns:

    """
    # 收集信息
    plan_parameter, plan_content = await flight_design.plan_parameter_setting_collect(input_data)
    if not plan_parameter:
        return []

    plane_id = plan_parameter.get("plane_ids")
    coach_id = plan_parameter.get("coach_ids")
    student_id = plan_parameter.get("student_ids")
    route_id = plan_parameter.get("route_ids")

    dal.setDb(FlyingService)
    # logger.info(f"根据信息自动创建飞行计划:{input_data.dict()}")
    # plane_id = input_data.plane.get("id")
    # coach_id = input_data.coach.get("id")
    # student_id = input_data.student.get("id")
    # route_id = input_data.fly_route.get("id")

    plan_info_list = []
    route_time_dict = dict()
    # obj_in = input_data.dict()
    # expand_data = copy.deepcopy(obj_in)

    # TODO 飞行计划时长
    duration_list = []
    # flight_duration = obj_in.get("flight_duration")
    # if flight_duration:
    #     obj_in["plan_duration"] = flight_duration
    #     duration_list.extend([flight_duration for _ in range(len(route_id))])
    # else:
    #     name = input_data.fly_route.get('table')
    #     table_name = f"auto_{name}"
    #     for id in route_id:
    #         select_conditions = {"id": id}
    #         flight_duration = await sql_handle.select(table_name, conditions=select_conditions,
    #                                                   fields=["flight_duration"])
    #         if not flight_duration:
    #             return resp_404(msg=f"未能获取到航线:{id}信息")
    #         duration_list.append(flight_duration[0]["flight_duration"])
    # TODO 两架飞机间的放飞间隔时间放飞间隔
    interval_list = []
    # flight_interval = obj_in.get("flight_interval")
    # if flight_interval:
    #     interval_list.extend([flight_interval for _ in range(len(route_id))])
    # else:
    #     name = input_data.plane.get('table')
    #     table_name = f"auto_{name}"
    #     select_conditions = {"id": plane_id[0]}
    #     flight_interval = await sql_handle.select(table_name, conditions=select_conditions,
    #                                               fields=["flight_interval"])
    #     if not flight_interval:
    #         return resp_404(msg=f"未能获取到飞机:{plane_id[0]}信息")
    #     interval_list.extend([flight_interval[0]["flight_interval"] for _ in range(len(route_id))])

    start_date = plan_parameter.get("start_time")
    end_date = plan_parameter.get("end_time")

    create_plan = CreateFlyingPlan
    create_plan.name = plan_parameter.get("name")
    create_plan.description = plan_parameter.get("description")
    create_plan.start_time = plan_parameter.get("start_time")
    create_plan.end_time = plan_parameter.get("end_time")

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
            copied_dict["plan_duration"] = duration_list[i]
            copied_dict["flight_interval"] = interval_list[i]
            copied_dict["plane"]["id"] = sorted_plane_lst[i]
            copied_dict["coach"]["id"] = sorted_coach_lst[i]
            copied_dict["student"]["id"] = sorted_student_lst[i]
            if route_time_dict[sorted_route_lst[i]] != start_date:
                break_time_length = timedelta(minutes=flight_interval)
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
    await dal.create_all(end_list)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
                                             handle_user=input_data.handle_user, handle_params=input_data.dict(),
                                             entity_id="",
                                             handle_reason=input_data.description if input_data.description else '根据信息自动创建飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=end_list, msg="飞行计划已自动创建")


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
    flight_plan_dict.update(create_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    flight_plan_dict.update(update_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
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
    flight_plan_dict.update(front_cabin_name="法外狂徒张三")
    flight_plan_dict.update(front_cabin_code="006")
    flight_plan_dict.update(rear_cabin_name="见血封喉李四")
    flight_plan_dict.update(rear_cabin_code="009")
    return flight_plan_dict


create_fun_dict = {settings.EXAMINATION: create_exam_info, settings.PAPER: create_paper_info,
                   settings.ONLINE_LEARNING: create_online_learning_record_info,
                   settings.TEACHING_RESOURCE: create_course_source_info, settings.QUESTION_BANK: create_question_info}
get_fun_dict = {settings.EXAMINATION: get_exam_question_info,
                settings.FLIGHT_PLAN_CONTENT: get_flight_plan_content_info}

if __name__ == '__main__':
    print(asyncio.run(sql_handle.get_table_columns("auto_question_bank")))
#     asyncio.run(create_flight_plan_info())
# question_type = {"fill": 4, "judge": 4, "multiple_choice": 4, "short_answer": 5, "single_choice": 12}
# exam_paper_info = asyncio.run(create_paper_question_info("auto_exam_result_detail", question_type))
# print(exam_paper_info)
# source_info = {"course_id": "47981834-c597-4d22-8b5b-0f1ae6b75b58", "keep_time": 50, "user_id": 47981834597}
# asyncio.run(create_online_learning_record_info("auto_online_learning_record", source_info))
