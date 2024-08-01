#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/29 15:36
# @Author  : yilifeng
# @File    : flying_service.py
# @Software: PyCharm
import copy
from datetime import datetime

from src.db.dals import ExecDAL
from fastapi import APIRouter, Depends
from src.config.setting import settings
from src.db.models import FlyingService
from sqlalchemy.exc import SQLAlchemyError
from src.utils.sql_config import sql_handle
from src.utils.dependencies import DALGetter
from src.utils.logger import logger, generate_mysql_log_data
from src.utils.constant import DELETE, RESERVE, RecordsStatusCode
from src.utils.responses import resp_200, resp_404, resp_500, resp_400
from src.utils.flight_planning_design import gen_schedule, flight_design
from src.utils.middle_level_management import create_flight_plan_info, create_batch_flying_service, \
    create_single_flying_service
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
        input_data: SearchFlyingPlan):
    dal.setDb(FlyingService)

    res = await dal.search(query=input_data)
    data = [FlyingPlanSchema.from_orm(ms) for ms in res]

    return resp_200(data={"data": data, "total": len(res)})


@router.post('', tags=['FlyingService'], summary="创建一条飞行计划")
async def create_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, input_data: CreateFlyingPlan):
    dal.setDb(FlyingService)
    logger.info(f"创建一条飞行计划:{input_data.dict()}")

    plan_info, course_source_dict = await create_single_flying_service(dal, input_data)
    if not isinstance(plan_info, list):
        return plan_info
    try:
        await dal.buck_create(plan_info)
        insert_id = await sql_handle.insert(settings.FLIGHT_PLAN_CONTENT, course_source_dict)
    except SQLAlchemyError as e:
        logger.error(e)
        return resp_400(msg=f"{e}")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="auto_flight_plan_content",
                                             handle_user=input_data.handle_user, handle_params=input_data.dict(),
                                             entity_id="",
                                             handle_reason=input_data.description if input_data.description else '创建一条飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=insert_id)


@router.post('/auto_batch', tags=['FlyingService'], summary="根据信息自动创建飞行计划")
async def create_flying_service(dal: ExecDAL = Depends(DALGetter(ExecDAL)), *, input_data: CreateFlyingPlan):
    dal.setDb(FlyingService)
    logger.info(f"根据信息自动创建飞行计划:{input_data.dict()}")
    plan_content_list, end_list, pid_dict = [], [], {"success": [], "failure": []}
    obj_in = input_data.dict()
    for pid in input_data.PID:
        plan_param_condition = {"id": pid}
        try:
            plan_parameter, plan_content, plane_info, stu_info = await flight_design.plan_parameter_setting_collect(
                plan_param_condition)
        except Exception as e:
            logger.error(e)
            continue
        if input_data.start_time and input_data.end_time:
            plan_parameter.update(start_time=datetime.strptime(input_data.start_time, "%Y-%m-%d %H:%M:%S"),
                                  end_time=datetime.strptime(input_data.end_time, "%Y-%m-%d %H:%M:%S"))
        ends = await create_batch_flying_service(dal, plan_parameter, obj_in)
        if not isinstance(ends, list):
            pid_dict["failure"].append(pid)
            continue
        for idx, end in enumerate(ends):
            try:
                end["PID"] = pid
                plane_con = plane_info[idx].get(pid)
                stu_con = stu_info[idx].get(pid)
                plan_content["aircraft_id"], plan_content["aircraft_type"] = plane_con["id"], plane_con["plane_type"]
                plan_content.update(student_name=stu_con["student_name"],
                                    student_code_name=stu_con["student_code_name"])
                course_source_dict = await create_flight_plan_info(end, plan_content)
                if input_data.flight_interval:
                    course_source_dict["launch_interval"] = input_data.flight_interval
                plan_content_list.append(course_source_dict)
            except IndexError:
                continue
        end_list.extend(ends)
        pid_dict["success"].append(pid)
    try:
        await dal.create_all(end_list)
        # 写入数据表auto_flight_plan_content
        await sql_handle.batch_insert(settings.FLIGHT_PLAN_CONTENT, plan_content_list)
    except SQLAlchemyError as e:
        logger.error(e)
        return resp_400(msg=f"{e}")

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="auto_flight_plan_content",
                                             handle_user=input_data.handle_user, handle_params=input_data.dict(),
                                             entity_id="",
                                             handle_reason=input_data.description if input_data.description else '根据信息自动创建飞行计划')
    await sql_handle.add_records("log_manage", mysql_log_data)

    return resp_200(data=pid_dict, msg="飞行计划已自动创建")


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

    mysql_log_data = generate_mysql_log_data(level=RecordsStatusCode.DEBUG, entity_type="auto_flight_plan_content",
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
