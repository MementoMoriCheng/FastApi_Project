#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  :
# @File    :
# @Software: PyCharm
import copy
import random
import itertools
from src.utils.sql_config import sql_handle
from datetime import timedelta, time, datetime
from src.config.setting import settings
from .constant import DEFAULT_PLY, SubjectSchedulingPriority, SchedulingCondition, AIRCRAFT_ID, FLIGHT_PLAN_PARAMETER, \
    FLIGHT_PLAN_CONTENT, AIRCRAFT_TYPE
from .tools import filter_list


def parse_input(obj_in):
    """
    解析输入
    Args:
        obj_in: 输入

    Returns:

    """
    fly_route_ids = obj_in.get("route_ids", [])
    plane_ids = obj_in.get("plane_ids", [])
    coach_ids = obj_in.get("coach_ids", [])
    student_ids = obj_in.get("student_ids", [])
    plan_duration = obj_in.get("flight_duration")

    start_time_str = obj_in.get("start_time")
    end_time_str = obj_in.get("end_time")
    exclude_time_strs = obj_in.get("exclude_time")
    flight_interval = obj_in.get("flight_interval")
    status = obj_in.get("status")
    name = obj_in.get("name")
    handle_user = obj_in.get("handle_user")
    handle_reason = obj_in.get("handle_reason")
    description = obj_in.get("description")

    plane_most_ply = obj_in.get("plane_most_ply") if obj_in.get("plane_most_ply") else DEFAULT_PLY
    coach_most_ply = obj_in.get("coach_most_ply") if obj_in.get("coach_most_ply") else DEFAULT_PLY
    student_most_ply = obj_in.get("student_most_ply") if obj_in.get("student_most_ply") else DEFAULT_PLY
    if exclude_time_strs:
        exclude_time = [tuple(exclude_time_str) for exclude_time_str in exclude_time_strs]
    else:
        exclude_time = []
    return {
        "fly_route_infos": fly_route_ids if isinstance(fly_route_ids, list) else fly_route_ids,
        "plane_ids": plane_ids if isinstance(plane_ids, list) else [plane_ids],
        "coach_ids": coach_ids if isinstance(coach_ids, list) else [coach_ids],
        "student_ids": student_ids if isinstance(student_ids, list) else [student_ids],
        "start_time": start_time_str,
        "end_time": end_time_str,
        "exclude_time": exclude_time,
        "status": status,
        "name": name,
        "handle_user": handle_user,
        "handle_reason": handle_reason,
        "description": description,
        "plane_most_ply": int(plane_most_ply),
        "coach_most_ply": int(coach_most_ply),
        "student_most_ply": int(student_most_ply),
        "plan_duration": int(plan_duration),
        "flight_interval": int(flight_interval)
    }


def split_time_segments(start, end, step):
    """
    分割时间
    Args:
        start: 起始时间段
        end: 结束时间段
        step: 每个时间段的时长例如，60分钟）
    Returns:
        切分后的时间段列表
    """
    start_time = datetime.strptime(start, "%Y-%m-%d %H:%M:%S")
    end_time = datetime.strptime(end, "%Y-%m-%d %H:%M:%S")
    split_segments = []

    current_segment_start = start_time
    while current_segment_start + timedelta(minutes=step) <= end_time:
        segment_end = min(current_segment_start + timedelta(minutes=step), end_time)
        split_segments.append(
            (current_segment_start.strftime("%Y-%m-%d %H:%M:%S"), segment_end.strftime("%Y-%m-%d %H:%M:%S")))
        current_segment_start = segment_end
    return split_segments


def split_day_into_time_segments(start, end, exclusions):
    """
    分割时间
    Args:
        start: 一天的起始时间段
        end: 一天的结束时间段
        exclusions: 排除的时间段列表，每个元素为 ("HH:MM", "HH:MM") 格式

    Returns:
        切分后的时间段列表，每个元素为 ("HH:MM", "HH:MM") 格式
    """
    start_time = datetime.strptime(start, "%Y-%m-%d %H:%M:%S")
    end_time = datetime.strptime(end, "%Y-%m-%d %H:%M:%S")
    split_segments = []

    current_segment_start = start_time
    while current_segment_start < end_time:
        next_exclusion_start = None
        for exclusion in exclusions:
            exclusion_start = datetime.strptime(exclusion[0], "%Y-%m-%d %H:%M:%S")
            if exclusion_start >= current_segment_start:
                next_exclusion_start = exclusion_start
                break

        if next_exclusion_start is not None:
            segment_end = min(next_exclusion_start, end_time)
        else:
            segment_end = end_time

        if segment_end > current_segment_start:
            split_segments.append(
                (current_segment_start.strftime("%Y-%m-%d %H:%M:%S"), segment_end.strftime("%Y-%m-%d %H:%M:%S")))

        if next_exclusion_start and next_exclusion_start < end_time:
            current_segment_start = datetime.strptime(exclusion[1], "%Y-%m-%d %H:%M:%S")
        else:
            current_segment_start = segment_end

    return split_segments


def str_to_datetime(time_str):
    return datetime.strptime(time_str, '%Y-%m-%d %H:%M:%S')


def check_time(is_exist_plan, start_time, end_time):
    conflict = False
    for plan in is_exist_plan:
        conflict = is_overlapping(plan.real_time_start, plan.real_time_end, start_time, end_time)
    return conflict


def is_overlapping(start1, end1, start2, end2):
    """
    判断两个时间段是否有交集
    Args:
        start1: 第一段的开始时间
        end1: 第一段的结束时间
        start2: 第二段的开始时间
        end2: 第二段的结束时间

    Returns:
        如果有交集返回True，否则返回False
    """
    if isinstance(start1, str):
        start1 = datetime.strptime(start1, '%Y-%m-%d %H:%M:%S')
    if isinstance(end1, str):
        end1 = datetime.strptime(end1, '%Y-%m-%d %H:%M:%S')
    if isinstance(start2, str):
        start2 = datetime.strptime(start2, '%Y-%m-%d %H:%M:%S')
    if isinstance(end2, str):
        end2 = datetime.strptime(end2, '%Y-%m-%d %H:%M:%S')

    return (start1 <= end2 and end1 >= start2) or (start2 <= end1 and end2 >= start1)


def merge_overlapping_segments(segments):
    if len(segments) == 0:
        return segments
    # 按照开始时间排序
    segments.sort(key=lambda x: x[0])
    merged_segments = []
    current_segment = segments[0]
    for segment in segments[1:]:
        if segment[0] <= current_segment[1]:  # 如果当前段与前一段有重叠
            current_segment = (current_segment[0], max(current_segment[1], segment[1]))  # 取并集
        else:
            merged_segments.append(current_segment)
            current_segment = segment
    merged_segments.append(current_segment)
    return merged_segments


def filter_by_exclusions(time_segments, all_exclusions):
    """
    根据所有不可用时间段（包括飞机检修、教练和航线）过滤可用时间段。

    Args:
        time_segments:
        all_exclusions:

    Returns:

    """
    # 结果列表
    result = []
    intervals = time_segments.copy()
    for start2, end2 in all_exclusions:
        new_intervals = []
        for start1, end1 in intervals:
            if end1 <= start2 or start1 >= end2:
                new_intervals.append((start1, end1))
            else:
                if start1 < start2:
                    new_intervals.append((start1, start2))
                if end1 > end2:
                    new_intervals.append((end2, end1))
        intervals = new_intervals
    result.extend(intervals)
    return result


def gen_aircraft_available_periods(start, end, exclusions, maintenance_period, coach_time, route_time, student_time):
    """
    生成一天每条航线的可用时间段
    Args:
        start:
        end:
        exclusions:
        maintenance_period: 飞机检修时间
        coach_time: 教练不可用时间
        route_time: 航线不可用时间
        student_time: 航线不可用时间
    Returns:

    """
    all_exclusions = exclusions + maintenance_period + coach_time + route_time + student_time
    segments = [(str_to_datetime(start), str_to_datetime(end)) for start, end in all_exclusions]
    merged_segments = merge_overlapping_segments(segments)
    merged_segments_str = [(segment[0].strftime('%Y-%m-%d %H:%M:%S'), segment[1].strftime('%Y-%m-%d %H:%M:%S')) for
                           segment in merged_segments]

    init_time_periods = split_day_into_time_segments(start, end, exclusions)
    split_maintenance = [split_day_into_time_segments(init_time_period[0], init_time_period[1], maintenance_period) for
                         init_time_period in init_time_periods]
    # 合并所有细分后的时间段，并进行最终过滤
    merged_time_segments = [period for sublist in split_maintenance for period in sublist]
    final_periods = filter_by_exclusions(merged_time_segments, merged_segments_str)
    return final_periods


def add_maintenance_period(start_time, end_time, maintenance_duration=0):
    """
    一个辅助函数计算维护周期后的时间点
    Args:
        start_time:
        end_time:
        maintenance_duration: 维护持续时间（单位：分钟）

    Returns:

    """
    maintenance_duration_timedelta = timedelta(minutes=maintenance_duration)
    new_time = end_time + maintenance_duration_timedelta
    return start_time.strftime('%Y-%m-%d %H:%M:%S'), new_time.strftime('%Y-%m-%d %H:%M:%S')


def allocate_source(input_data):
    """
    分配资源
    Args:
        input_data:

    Returns:

    """
    input_info = parse_input(input_data)
    plane_most_ply = input_info.get("plane_most_ply")
    coach_most_ply = input_info.get("coach_most_ply")
    student_most_ply = input_info.get("student_most_ply")
    students = input_info.get("student_ids")
    coaches = input_info.get("coach_ids")
    aircrafts = input_info.get("plane_ids")

    available_coaches = coaches * coach_most_ply
    available_aircrafts = aircrafts * plane_most_ply
    available_students = students * student_most_ply

    coach_usage_count = {coach: 0 for coach in coaches}
    aircraft_usage_count = {aircraft: 0 for aircraft in aircrafts}
    student_usage_count = {student: 0 for student in students}

    assignments = []
    unassigned_students = available_students.copy()

    for idx, student in enumerate(available_students):
        if student_usage_count[student] == student_most_ply:
            continue
        try:
            coach, aircraft = available_coaches[idx], available_aircrafts[idx]

            if coach_usage_count[coach] < coach_most_ply and aircraft_usage_count[aircraft] < plane_most_ply:
                assignments.append((student, coach, aircraft))
                # 更新使用次数统计
                coach_usage_count[coach] += 1
                aircraft_usage_count[aircraft] += 1
                student_usage_count[student] += 1
                unassigned_students.remove(student)
            else:
                continue
        except IndexError:
            break
    return assignments


def gen_auto_maintenance_period(start_time, end_time, plan_duration, exclusions, break_time=30):
    """
    汇总检休息时间
    Args:
        start_time:
        end_time:
        plan_duration:
        exclusions: 排除时间
        break_time:

    Returns:

    """
    maintenance_period = []
    available_period = split_day_into_time_segments(start_time, end_time, exclusions)
    for period in available_period:
        time_list = gen_maintenance_period(period[0], period[1], plan_duration, break_time)
        maintenance_period.extend(time_list)
    return maintenance_period


def gen_maintenance_period(start_time, end_time, plan_duration, break_time):
    """
    分配休息时间
    Args:
        start_time:
        end_time:
        plan_duration:
        break_time:

    Returns:

    """
    work_start_time = datetime.strptime(start_time, "%Y-%m-%d %H:%M:%S")
    work_end_time = datetime.strptime(end_time, "%Y-%m-%d %H:%M:%S")

    work_time_step = timedelta(minutes=plan_duration)
    break_time_length = timedelta(minutes=break_time)

    break_time_slots = []

    current_time = work_start_time
    while current_time < work_end_time:
        current_time += work_time_step
        if current_time + break_time_length > work_end_time:
            break
        break_time_slots.append((current_time.strftime("%Y-%m-%d %H:%M:%S"),
                                 (current_time + break_time_length).strftime("%Y-%m-%d %H:%M:%S")))
        current_time += break_time_length
    return break_time_slots


def gen_schedule(input_data, expand_data, maintenance_period, coach_time, route_time, student_time, auto_gen=False):
    """
    生成计划
    Args:
        input_data:
        expand_data:
        maintenance_period:
        coach_time:
        route_time:
        student_time:
        auto_gen:
    Returns:

    """
    schedule_info_list = []
    input_info = parse_input(input_data)
    flight_interval = input_data.get("flight_interval")
    exclusions = input_info.get("exclude_time")
    start_time = input_info.get("start_time")
    end_time = input_info.get("end_time")
    plan_duration = input_info.get("plan_duration")
    status = input_info.get("status")
    name = input_info.get("name")
    description = input_info.get("description")
    handle_user = input_info.get("handle_user")
    handle_reason = input_info.get("handle_reason")
    flight_route = input_info.get("fly_route_infos")

    def gen_time_period(available_src, flight_interval=0):
        time_period = []
        for src in available_src:
            if datetime.strptime(start_time, "%Y-%m-%d %H:%M:%S") <= src.real_time_start:
                time_period.append(add_maintenance_period(src.real_time_start, src.real_time_end, flight_interval))
        return time_period

    maintenance_period = gen_time_period(maintenance_period, flight_interval)
    coach_time = gen_time_period(coach_time)
    route_time = gen_time_period(route_time)
    student_time = gen_time_period(student_time)

    assignments = allocate_source(input_data)
    if auto_gen:
        auto_maintenance_period = gen_auto_maintenance_period(start_time, end_time, plan_duration, exclusions,
                                                              break_time=flight_interval)
        maintenance_period.extend(auto_maintenance_period)
    day_available_periods = gen_aircraft_available_periods(start_time, end_time, exclusions,
                                                           maintenance_period, coach_time, route_time,
                                                           student_time)
    final_times = []
    for con in day_available_periods:
        final_time = split_time_segments(con[0], con[1], plan_duration)
        final_times.extend(final_time)

    for idx, assignment in enumerate(assignments):
        if not final_times:
            print("无法安排")
            continue
        if idx + 1 > len(final_times):
            break
        schedule_info = {"student_id": assignment[0],
                         "route_id": flight_route,
                         "coach_id": assignment[1],
                         "plane_id": assignment[2],
                         "plan_duration": plan_duration,
                         "plan_time_start": "",
                         "plan_time_end": "",
                         "real_time_start": "",
                         "real_time_end": "",
                         "handle_user": handle_user,
                         "handle_reason": handle_reason,
                         "status": status,
                         "name": name if name else f"auto_plan_{assignment[0]}",
                         "description": description,
                         "expand_data": {}
                         }
        schedule_info.update(plan_time_start=final_times[idx][0], plan_time_end=final_times[idx][1],
                             real_time_start=final_times[idx][0], real_time_end=final_times[idx][1],
                             expand_data=expand_data)
        schedule_info_list.append(schedule_info)
    return schedule_info_list


class FlightAlgorithDesign:
    """
    飞行计划制定功能与算法设计
    """

    def __init__(self, ):
        self.plan_parameter = FLIGHT_PLAN_PARAMETER
        self.plan_content = FLIGHT_PLAN_CONTENT

    async def plan_parameter_setting_collect(self, conditions):
        """
        信息收集阶段，主要进行气象信息、飞机信息、人员信息、课目信息、训练进度信息和安全信息的收集
        具体的参数有：组训单位、计划类型、开飞时刻、占场时间、参训飞机、计划批次、参训教员与学员、参训课目、
        空域使用、指定练习次数与搭配、任务机指定人员、指挥员和其他限定信息

        """
        # 获取计划信息
        pid, _ = await self.get_plan_base_information(conditions)

        # 收集参训人员信息
        await self.get_plan_pilot_information(pid)

        # 收集参训飞机信息
        await self.get_plan_plane_information(pid)

        # 查看训练进度
        await self.get_plan_subject_information(pid)
        # TODO 暂时不考虑下述条件
        # 查看课目信息
        # 查看天气信息
        # 收集安全等信息
        return self.plan_parameter, self.plan_content

    async def get_plan_base_information(self, conditions):
        """
        获取auto_flight_plan_base表内容
        Args:
            conditions: conditions

        Returns:

        """
        # 获取计划信息
        fpb_res = await sql_handle.select(settings.FLIGHT_PLAN_BASE, conditions)
        if not fpb_res:
            return
        plan_info = fpb_res[0]
        pid = plan_info.get("id")
        display = plan_info.get("display")

        # start_date = plan_info.get("takeoff")  # 开飞
        takeoff_time = plan_info.get("takeoff")  # 开飞
        end_time = plan_info.get("end")  # 结束
        status = plan_info.get("status")  # 结束
        coach_ids = [plan_info.get("chief_director_1"), plan_info.get("chief_director_2"),
                     plan_info.get("deputy_director_1"), plan_info.get("deputy_director_2"),
                     plan_info.get("trainee_director_1"), plan_info.get("trainee_director_2")]
        # 航线信息
        route_ids = [plan_info.get("route_1"), plan_info.get("route_2")]
        # 收集参训飞机信息
        # mission_aircraft = plan_info.get("mission_aircraft")  # 任务机
        # standby_aircraft = plan_info.get("standby_aircraft")  # 备份机
        # 处理空数据
        coach_ids = filter_list(coach_ids)
        route_ids = filter_list(route_ids)
        self.plan_parameter.update(start_time=takeoff_time, end_time=end_time, coach_ids=coach_ids, route_ids=route_ids,
                                   name=display)
        self.plan_content.update(PID=pid, current_status=status)
        return pid, plan_info

    async def get_plan_pilot_information(self, pid):
        """
        参训人员
        Args:
            pid:flight_plan_base表id

        Returns:

        """
        condition = {"PID": pid}
        fpp_res = await sql_handle.select(settings.FLIGHT_PLAN_PILOT, conditions=condition)
        if not fpp_res:
            return
        fpp_info = fpp_res[0]
        flight_duration = fpp_info.get("time")
        uid = fpp_info.get("UID")
        uid_condition = {"id": uid}
        uid_res = await sql_handle.select(settings.STUDENT_TABLE, conditions=uid_condition)
        # TODO 姓名，代号
        u_id = []
        for stu_uid in uid_res:
            u_id.append(stu_uid.get("UID"))
        self.plan_parameter.update(student_ids=u_id, flight_duration=flight_duration)

    async def get_plan_plane_information(self, pid):
        """
        飞机
        Args:
            pid:flight_plan_base表id

        Returns:

        """
        condition = {"PID": pid}
        fpp_res = await sql_handle.select(settings.FLIGHT_PLAN_PLANE, conditions=condition)
        if not fpp_res:
            return
        fpp_info = fpp_res[0]
        aircraft_id = fpp_info.get("aircraft_id")
        aircraft_id_condition = {"id": aircraft_id}
        aircraft_id_res = await sql_handle.select(settings.PLANE_TABLE, conditions=aircraft_id_condition)
        a_id = []
        for stu_uid in aircraft_id_res:
            a_id.append(stu_uid.get(AIRCRAFT_ID))
        self.plan_parameter.update(plane_ids=a_id)
        self.plan_content.update(aircraft_id=aircraft_id_res[0].get("id"),
                                 aircraft_type=aircraft_id_res[0].get(AIRCRAFT_TYPE))

    async def get_plan_subject_information(self, pid):
        """
        训练进度
        Args:
            pid:flight_plan_base表id

        Returns:

        """
        condition = {"PID": pid}
        fps_res = await sql_handle.select(settings.FLIGHT_PLAN_SUBJECT, conditions=condition)
        if not fps_res:
            return
        fps_info = fps_res[0]
        sid = fps_info.get("SID")

        fps_d_condition = {"SID": sid}
        fps_d_res = await sql_handle.select(settings.FLIGHT_SUBJECT_DETAILS, conditions=fps_d_condition)
        if not fps_d_res:
            return
        fps_d_info = fps_res[0]
        # flight_interval = fps_d_info.get("launch_interval")
        flight_interval = 15
        self.plan_parameter.update(flight_interval=flight_interval)
        self.plan_content.update(launch_interval=flight_interval)

    def computation_orchestration_phase(self):

        """
        计算编排阶段，主要是确定出动飞机数和参训课目，计算开飞时刻和占场时间，计算课目安排顺序、架次和位置，计算人员安排顺序、架次
        """
        pass

    def adjustment_output_phase(self):
        """
        调整输出阶段，主要是对个别计划进行人工调整，查找整版计划中的错误并纠正，保存计划并打印计划
        """
        pass

    def subject_scheduling_algorithm(self):
        """
        课目编排算法: 用于计算参训课目的编排顺序、架次和位置

        Returns:

        """
        pass

    def arrangement_of_subject(self, student, course_students=1, training=0):
        """
        参训课目的编排架次,根据当天飞行训练的性质（学员飞行和教员飞行两种）来决定
        Args:
            student:学员数量
            training:训练的性质, 0（单飞）为学员飞行,1（带飞）为教员飞行两种
            course_students:课目学员数比,单飞课目的课目学员数比为 1,带飞课目的课目学员数比为 0.5。

        Returns:

        """
        if training == 0:
            return student / course_students
        else:
            course_students = 0.5
            return student / course_students

    def position_of_subject(self, student, course_students=1, training=0):
        """
        算参训课目的编排位置
        Args:
            student:学员数量
            training:训练的性质, 0（单飞）为学员飞行,1（带飞）为教员飞行两种
            course_students:课目学员数比,单飞课目的课目学员数比为 1,带飞课目的课目学员数比为 0.5。

        Returns:

        """
        pass

    def staffing_algorithm(self):
        """
        人员安排算法: 主要用于计算教学员的安排顺序、架次和位置,是以学员（学员场次）或教员（教员场次）为中心来进行计算的
        """
        # （1）计算人员应飞架次
        # 飞行日总架次＝（出动飞机数－备份机数）×批次
        # total_sortie=
        # 学员应飞架次＝总架次÷学员人数，商为应飞架次，余数即为（商+1）次的计划架次；总人数—余数=应飞架次（商）的人数

        # （2）进行学员筛选
        # 好学员少飞，差学员多飞

        # 进度落后者进行标记、排序

        # （3）安排带飞教员

    @staticmethod
    def calculate_course_progress(course_time, people_number):
        """
        课目进度（课目人均飞行时间）=课目总时间÷人数
        Args:
            course_time:课目总时间
            people_number:人数

        Returns:

        """
        return course_time / people_number

    def comparison_training_program(self, course_progress, training_program_time):
        """
        课目进度与训练大纲中规定的课目大纲时间进行比对
        Args:
            course_progress: 课目进度
            training_program_time: 课目大纲时间

        Returns:
            课目优先级 0>1>2
        """
        completion = course_progress - training_program_time
        if completion >= 0:
            return SubjectSchedulingPriority.Lowest
        elif -0.1 <= completion / training_program_time < 0:
            return SubjectSchedulingPriority.Highest
        else:
            return SubjectSchedulingPriority.Middle

    def meteorological_condition(self, visibility, cloud, wind_speed):
        """
        气象条件对课目的编排的影响
        Args:
            visibility:能见度
            cloud:云量
            wind_speed:风速

        Returns:

        """
        if (visibility > SchedulingCondition.good_visibility and cloud < SchedulingCondition.good_cloud
                and wind_speed < SchedulingCondition.good_wind_speed):
            return SubjectSchedulingPriority.Highest
        elif (SchedulingCondition.bad_visibility < visibility < SchedulingCondition.good_visibility
              and SchedulingCondition.good_cloud < cloud < SchedulingCondition.bad_cloud
              and SchedulingCondition.good_wind_speed < wind_speed < SchedulingCondition.bad_wind_speed):
            return SubjectSchedulingPriority.Middle
        else:
            return SubjectSchedulingPriority.Lowest

    def plane_condition(self, status, number):
        """
        飞机的状况和数量对课目编排的影响,例如：刚完成大修的飞机需要试飞，因此，这些飞机将首先编排“试飞”课目；刚换发动机的飞机需
        要磨发，因此，这些飞机将首先编排“磨发”课目
        Args:
            status:
            number:

        Returns:

        """
        pass

    def airspace_condition(self, status, number):
        """
        空域占用情况和可用空域数量对课目编排的影响
        Args:
            status:
            number:

        Returns:

        """
        pass

    def ratio_of_coach_and_student(self, coach, student):
        """
        教、学员数量比
        Args:
            coach:
            student:

        Returns:

        """
        ratio = coach / student

    def is_outline_subject(self):
        """

        Returns:

        """
        pass

    def is_special_mission(self):
        """
        特殊飞行任务是指专机飞行、侦天、转场等任务，这些任务课目应当优先编排，且优先级最高。
        Returns:

        """
        pass


flight_design = FlightAlgorithDesign()
