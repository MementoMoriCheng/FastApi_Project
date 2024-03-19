#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : Flying_manage.py
# @Software: PyCharm


from typing import Union
from datetime import datetime
from pydantic import BaseModel


class FlyingPlanSchema(BaseModel):
    id: str
    name: str = None
    description: str = None
    route_id: str
    plane_id: str
    coach_id: str
    student_id: str
    handle_user: str = None
    status: int = 1
    plan_duration: int
    plan_time_start: Union[datetime, None]
    plan_time_end: Union[datetime, None]
    real_time_start: Union[datetime, None]
    real_time_end: Union[datetime, None]
    expand_data: dict = None

    class Config:
        orm_mode = True


class CreateFlyingPlan(BaseModel):
    name: str = None
    fly_route: dict
    status: int = 1
    plane: dict
    coach: dict
    student: dict
    handle_user: str = None
    description: str = None
    plane_most_ply: int = None
    coach_most_ply: int = None
    student_most_ply: int = None
    flight_interval: int = None
    flight_duration: int = None
    start_time: str
    end_time: str
    exclude_time: list


class UpdateFlyingPlan(BaseModel):
    name: str = None
    status: int = 3
    fly_route: dict
    plane: dict
    coach: dict
    student: dict
    handle_user: str = None
    handle_reason: str = None
    description: str = None
    plane_most_ply: int = None
    coach_most_ply: int = None
    student_most_ply: int = None
    flight_interval: int = None
    flight_duration: int = None
    start_time: str
    end_time: str
    exclude_time: list


class UpdateStatus(BaseModel):
    status: int = 2


class SearchFlyingPlan(BaseModel):
    real_time_start: Union[datetime, None]
    real_time_end: Union[datetime, None]
    limit: int = 10
    offset: int = 0
