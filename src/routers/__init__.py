#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 10:53
# @Author  : yilifeng
# @File    : __init__.py
# @Software: PyCharm
from fastapi import APIRouter

from . import column_manage
from . import table_manage
from . import sql_handle
from . import flying_service
from . import menu_manage
from . import document
from . import teaching_resources_manage
from . import exam_manage
from . import log_manage
from . import flight_safety_monitoring

api_router = APIRouter()
api_router.include_router(column_manage.router, tags=['ColumnManage'], prefix='/column_manage')
api_router.include_router(table_manage.router, tags=['TableManage'], prefix='/table_manage')
api_router.include_router(sql_handle.router, tags=['SqlHandle'], prefix='/sql_handle')
api_router.include_router(flying_service.router, tags=['FlyingService'], prefix='/flying_service')
api_router.include_router(menu_manage.router, tags=['MenuManage'], prefix='/menu_manage')
api_router.include_router(document.router, tags=['Document'], prefix='/document')
api_router.include_router(log_manage.router, tags=['LogManage'], prefix='/log_manage')
api_router.include_router(flight_safety_monitoring.router, tags=['FlightSafetyMonitoring'],
                          prefix='/flight_safety_monitoring')
api_router.include_router(teaching_resources_manage.router)
api_router.include_router(exam_manage.router)
