import copy
import random
import itertools
from src.utils.constant import MOST_PLY
from datetime import timedelta, time, datetime


def parse_input(obj_in):
    """
    解析输入
    Args:
        obj_in: 输入

    Returns:

    """
    fly_route_ids = obj_in.get("fly_route", {}).get("id", [])
    plane_ids = obj_in.get("plane", {}).get("id", [])
    coach_ids = obj_in.get("coach", {}).get("id", [])
    student_ids = obj_in.get("student", {}).get("id", [])
    plan_duration = obj_in.get("plan_duration")

    start_time_str = obj_in.get("start_time")
    end_time_str = obj_in.get("end_time")
    exclude_time_strs = obj_in.get("exclude_time")
    flight_interval = obj_in.get("flight_interval")
    status = obj_in.get("status")
    name = obj_in.get("name")
    handle_user = obj_in.get("handle_user")
    handle_reason = obj_in.get("handle_reason")
    description = obj_in.get("description")

    plane_most_ply = obj_in.get("plane_most_ply") if obj_in.get("plane_most_ply") else MOST_PLY
    coach_most_ply = obj_in.get("coach_most_ply") if obj_in.get("coach_most_ply") else MOST_PLY
    student_most_ply = obj_in.get("student_most_ply") if obj_in.get("student_most_ply") else MOST_PLY

    exclude_time = [tuple(exclude_time_str) for exclude_time_str in exclude_time_strs]

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

    return (start1 < end2 and end1 > start2) or (start2 < end1 and end2 > start1)


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
        exclusions:
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


def gen_cartesian_product(routes, students, teachers, planes):
    """
    资源全排列
    Args:
        routes:
        students:
        teachers:
        planes:

    Returns:

    """
    from collections import defaultdict
    cartesian = defaultdict(lambda: [])
    combinations = list(itertools.product(routes, students, teachers, planes))
    for combo in combinations:
        cartesian[combo[0]].append(combo[1:])
    return cartesian


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


obj_in = {
    "fly_route": {
        "table": "fly_route",
        "id": [
            "1",
            "2",
            "3"
        ]
    },
    "plane": {
        "table": "plane",
        "id": [
            "fire1"

        ]
    },
    "coach": {
        "table": "coach",
        "id": [
            "laoli1",
            "laoli2",
            "laoli3",

        ]
    },
    "student": {
        "table": "student",
        "id": [
            "zhangsan1",
            "zhangsan2",
            "zhangsan3",
            "zhangsan4",
            "zhangsan5",
            "zhangsan6",
            "zhangsan7",
            "zhangsan8",
            "zhangsan9",

        ]
    },
    "start_time": "2024-02-05 06:00:00",
    "end_time": "2024-02-05 20:00:00",
    "flight_interval": 30,
    "exclude_time": [
        [
            "2024-02-05 12:00:00",
            "2024-02-05 13:00:00"
        ],
        [
            "2024-02-05 16:00:00",
            "2024-02-05 17:00:00"
        ]
    ],
}
obj_in2 = {'fly_route': {'table': 'fly_route', 'id': '1', 'value': 60},
           'plane': {'table': 'plane', 'id': ['fire1', 'fire2', 'fire3', 'fire4']},
           'coach': {'table': 'coach', 'id': ['laoli1', 'laoli2', 'laoli3', 'laoli4']},
           'student': {'table': 'student',
                       'id': [
                           "zhangsan1",
                           "zhangsan2",
                           "zhangsan3",
                           "zhangsan4",
                           "zhangsan5",
                           "zhangsan6",
                           "zhangsan7",
                           "zhangsan8",
                           "zhangsan9",

                       ]}, 'start_time': '2024-02-06 08:00:00',
           'end_time': '2024-02-06 18:00:00',
           "flight_interval": 30,
           "plan_duration": 30,
           "plane_most_ply": 2,
           "coach_most_ply": 3,
           "student_most_ply": 1,
           'exclude_time': [['2024-02-06 12:00:00', '2024-02-06 14:00:00']]}
obj_in3 = {'fly_route': {'table': 'fly_route', 'id': '1', 'value': 60},
           'plane': {'table': 'plane', 'id': 'fire4'},
           'coach': {'table': 'coach', 'id': 'laoli4'},
           'student': {'table': 'student', 'id': "zhangsan9"},
           'start_time': '2024-02-06 08:00:00',
           'end_time': '2024-02-06 18:00:00',
           "flight_interval": 30,
           "plan_duration": 30,
           "plane_most_ply": 2,
           "coach_most_ply": 3,
           "student_most_ply": 5,
           'exclude_time': [['2024-02-06 12:00:00', '2024-02-06 14:00:00']]}

# print(parse_input(obj_in))
# gen_schedule(obj_in)
# print(allocate_available_source(obj_in))
# aa = gen_schedule(obj_in2, [], [], [], [], True)
aa = allocate_source(obj_in2)
print("aa_plan: ", aa)
# start1 = '2022-01-01 10:00:00'
# end1 = '2022-01-01 12:00:00'
# start2 = '2022-01-01 12:30:00'
# end2 = '2022-01-01 13:00:00'
# # plan =
# # print(is_overlapping(start1, end1, start2, end2))  # 输出：True
# # print(check_time(, start2, end2))  # 输出：True
# dt_obj = datetime.strptime(start1, '%Y-%m-%d')
# print(type(dt_obj))
# print(dt_obj)
