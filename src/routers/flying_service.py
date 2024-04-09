#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/29 15:36
# @Author  : yilifeng
# @File    : flying_service.py
# @Software: PyCharm
import copy
import itertools
import random
from datetime import datetime, timedelta
from src.db.dals import ExecDAL
from src.utils.logger import logger, generate_mysql_log_data
from src.db.models import FlyingService
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from fastapi import APIRouter, Depends, Query
from src.utils.lesson_scheduling import gen_schedule, check_time
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode
from src.utils.responses import resp_200, resp_404, resp_500
from src.db.schemas.flying_manage import FlyingPlanSchema, CreateFlyingPlan, UpdateFlyingPlan, SearchFlyingPlan

router = APIRouter()


@router.get('/{id_}', tags=['FlyingService'], summary="通过id获取飞行计划的信息")
async def get_flying_service_info(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(FlyingService)
    logger.debug(f"通过id获取飞行计划的信息:{id_}")
    res = await dal.get_by(id=id_, is_delete=RESERVE)
    if not res:
        return resp_404()
    data = FlyingPlanSchema.from_orm(res)

    return resp_200(data=data)


@router.post('/search', tags=['FlyingService'], summary="获取所有飞行计划的信息")
async def list_flying_service_info(
        dal: ExecDAL = Depends(DALGetter(ExecDAL)), *,
        input_data: SearchFlyingPlan
):
    dal.setDb(FlyingService)

    res = await dal.search(query=input_data)
    data = [FlyingPlanSchema.from_orm(ms) for ms in res]

    return resp_200(data={"data": data, "total": len(res)})


@router.post('', tags=['FlyingService'], summary="创建一条飞行计划")
async def create_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, input_data: CreateFlyingPlan):
    dal.setDb(FlyingService)
    logger.info(f"创建一条飞行计划:{input_data.dict()}")
    plane_id = input_data.plane.get("id")
    coach_id = input_data.coach.get("id")
    student_id = input_data.student.get("id")
    route_id = input_data.fly_route.get("id")

    start_time_str = input_data.start_time
    start_date = datetime.strptime(start_time_str, '%Y-%m-%d %H:%M:%S')
    plane_exist_plan = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(plane_exist_plan, input_data.start_time, input_data.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="飞机安排存在冲突")
    plane_latest_time = max([plan.real_time_end for plan in plane_exist_plan]) if plane_exist_plan else start_date

    coach_exist_plan = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(coach_exist_plan, input_data.start_time, input_data.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="教练安排存在冲突")
    coach_latest_time = max([coach.real_time_end for coach in coach_exist_plan]) if coach_exist_plan else start_date

    student_exist_plan = await dal.get_by_all(student_id=student_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(student_exist_plan, input_data.start_time, input_data.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="学生安排存在冲突")
    student_latest_time = max(
        [student.real_time_end for student in student_exist_plan]) if student_exist_plan else start_date

    route_exist_plan = await dal.get_by_all(route_id=route_id, is_delete=RESERVE, plan_time_start__gte=start_date)
    conflict_flag = check_time(route_exist_plan, input_data.start_time, input_data.end_time)
    if conflict_flag:
        return resp_200(data=[], msg="航线安排存在冲突")
    route_latest_time = max([route.real_time_end for route in route_exist_plan]) if route_exist_plan else start_date

    latest_time = max(plane_latest_time, coach_latest_time, student_latest_time, route_latest_time)

    available_plane = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE)
    available_coach = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE)
    available_fly_route = await dal.get_by_all(route_id=route_id, is_delete=RESERVE)
    available_student = await dal.get_by_all(student_id=student_id, is_delete=RESERVE)
    obj_in = input_data.dict()

    expand_data = copy.deepcopy(obj_in)

    flight_duration = obj_in.get("flight_duration")
    if flight_duration:
        obj_in["plan_duration"] = flight_duration
    else:
        name = input_data.fly_route.get('table')
        table_name = f"auto_{name}"
        select_conditions = {"id": route_id}
        flight_duration = await sql_handle.select(table_name, conditions=select_conditions, fields=["flight_duration"])
        if not flight_duration:
            return resp_404(msg=f"未能获取到航线:{route_id}信息")
        obj_in["plan_duration"] = flight_duration[0]["flight_duration"]

    flight_interval = obj_in.get("flight_interval")
    if not flight_interval:
        name = input_data.plane.get('table')
        table_name = f"auto_{name}"
        select_conditions = {"id": plane_id}
        flight_interval = await sql_handle.select(table_name, conditions=select_conditions, fields=["flight_interval"])
        if not flight_interval:
            return resp_404(msg=f"未能获取到飞机:{plane_id}信息")
        obj_in["flight_interval"] = flight_interval[0]["flight_interval"]
    break_time_length = timedelta(minutes=flight_interval)
    if latest_time and (latest_time + break_time_length) >= datetime.strptime(obj_in.get("start_time"),
                                                                              '%Y-%m-%d %H:%M:%S'):
        obj_in["start_time"] = (latest_time + break_time_length).strftime("%Y-%m-%d %H:%M:%S")
    plan_info = gen_schedule(obj_in, expand_data, available_plane, available_coach, available_fly_route,
                             available_student)

    await dal.create_all(plan_info)

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
                                             handle_user=input_data.handle_user, handle_params=input_data.dict(),
                                             entity_id="",
                                             handle_reason=input_data.description if input_data.description else '创建一条飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=plan_info)


@router.post('/auto_batch', tags=['FlyingService'], summary="根据信息自动创建飞行计划")
async def create_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, input_data: CreateFlyingPlan):
    dal.setDb(FlyingService)
    logger.info(f"根据信息自动创建飞行计划:{input_data.dict()}")
    plane_id = input_data.plane.get("id")
    coach_id = input_data.coach.get("id")
    student_id = input_data.student.get("id")
    route_id = input_data.fly_route.get("id")
    plan_info_list = []
    route_time_dict = dict()
    obj_in = input_data.dict()
    expand_data = copy.deepcopy(obj_in)
    duration_list = []
    flight_duration = obj_in.get("flight_duration")
    if flight_duration:
        obj_in["plan_duration"] = flight_duration
        duration_list.extend([flight_duration for _ in range(len(route_id))])
    else:
        name = input_data.fly_route.get('table')
        table_name = f"auto_{name}"
        for id in route_id:
            select_conditions = {"id": id}
            flight_duration = await sql_handle.select(table_name, conditions=select_conditions,
                                                      fields=["flight_duration"])
            if not flight_duration:
                return resp_404(msg=f"未能获取到航线:{id}信息")
            duration_list.append(flight_duration[0]["flight_duration"])

    interval_list = []
    flight_interval = obj_in.get("flight_interval")
    if flight_interval:
        interval_list.extend([flight_interval for _ in range(len(route_id))])
    else:
        name = input_data.plane.get('table')
        table_name = f"auto_{name}"
        select_conditions = {"id": plane_id[0]}
        flight_interval = await sql_handle.select(table_name, conditions=select_conditions,
                                                  fields=["flight_interval"])
        if not flight_interval:
            return resp_404(msg=f"未能获取到飞机:{plane_id[0]}信息")
        interval_list.extend([flight_interval[0]["flight_interval"] for _ in range(len(route_id))])

    start_time_str = input_data.start_time
    start_date = datetime.strptime(start_time_str, '%Y-%m-%d %H:%M:%S')
    end_date = datetime.strptime(input_data.end_time, '%Y-%m-%d %H:%M:%S')
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


@router.delete('/{id_}', tags=['FlyingService'], summary="删除一条飞行计划")
async def delete_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str):
    dal.setDb(FlyingService)
    logger.info(f"删除一条飞行计划:{id_}")
    res = await dal.get(id_)
    if not res:
        return resp_404()
    res = await dal.update(id_, {'is_delete': DELETE})
    if not res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
                                             handle_user="", handle_params={"id": id_},
                                             entity_id=id_, handle_reason='删除一条飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data={'id': id_})


@router.patch('/{id_}', tags=['FlyingService'], summary="编辑一条飞行计划")
async def update_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)),
                                update_dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str,
                                input_data: UpdateFlyingPlan):
    dal.setDb(FlyingService)
    logger.info(f"编辑一条飞行计划:{id_}:{input_data.dict()}")
    ms = await dal.get_by(id=id_, is_delete=RESERVE)
    if not ms:
        return resp_404()

    await dal.update(id_, {'is_delete': DELETE})

    plane_id = input_data.plane.get("id")
    coach_id = input_data.coach.get("id")
    student_id = input_data.student.get("id")
    route_id = input_data.fly_route.get("id")

    available_plane = await dal.get_by_all(plane_id=plane_id, is_delete=RESERVE)
    available_coach = await dal.get_by_all(coach_id=coach_id, is_delete=RESERVE)
    available_fly_route = await dal.get_by_all(route_id=route_id, is_delete=RESERVE)
    available_student = await dal.get_by_all(student_id=student_id, is_delete=RESERVE)
    obj_in = input_data.dict()
    expand_data = copy.deepcopy(obj_in)

    flight_duration = obj_in.get("flight_duration")
    if flight_duration:
        obj_in["plan_duration"] = flight_duration
    else:
        name = input_data.fly_route.get('table')
        table_name = f"auto_{name}"
        select_conditions = {"id": route_id}
        flight_duration = await sql_handle.select(table_name, conditions=select_conditions, fields=["flight_duration"])
        if not flight_duration:
            return resp_404(msg=f"未能获取到航线:{route_id}信息")
        obj_in["plan_duration"] = flight_duration[0]["flight_duration"]

    flight_interval = obj_in.get("flight_interval")
    if not flight_interval:
        name = input_data.plane.get('table')
        table_name = f"auto_{name}"
        select_conditions = {"id": plane_id}
        flight_interval = await sql_handle.select(table_name, conditions=select_conditions, fields=["flight_interval"])
        if not flight_interval:
            return resp_404(msg=f"未能获取到飞机:{plane_id}信息")
        obj_in["flight_interval"] = flight_interval[0]["flight_interval"]
    plan_info = gen_schedule(obj_in, expand_data, available_plane, available_coach, available_fly_route,
                             available_student)
    if not plan_info:
        await dal.update(id_, {'is_delete': RESERVE})
        return resp_200(data=plan_info, msg="无法修改")
    list_data = []  # 修改后，返回id的list
    for single_plane_info in plan_info:
        res = await dal.create(single_plane_info)
        if not res:
            return resp_404()
        else:
            if hasattr(res, 'id'):
                list_data.append(res.id)

    update_dal.setDb(FlyingService)
    del_res = await update_dal.update(id_, {'is_delete': DELETE, "handle_reason": obj_in.get("handle_reason")})
    if not del_res:
        return resp_500()

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
                                             handle_user=input_data.handle_user, handle_params=input_data.dict(),
                                             entity_id=id_,
                                             handle_reason=input_data.description if input_data.description else '编辑一条飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=list_data)


@router.patch('/status/{id_}', tags=['FlyingService'],
              summary="更新飞行计划状态(计划中 1，正在进行 2，按计划完成 3，补签完成 4，过时未进行 5，已调整 6，已取消 7)")
async def update_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, id_: str, status: int):
    dal.setDb(FlyingService)
    logger.info(f"更新飞行计划状态:{id_}:{status}")
    ms = await dal.get(id_)
    if not ms:
        return resp_404()
    res = await dal.update(id_, {"status": status})

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="flying_service",
                                             handle_user="", handle_params={"id": id_, "status": status},
                                             entity_id=id_, handle_reason="更新飞行计划状态")
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=res)
