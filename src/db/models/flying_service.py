#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/29 15:21
# @Author  : yilifeng
# @File    : flying_service.py
# @Software: PyCharm

from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy.orm import relationship
from sqlalchemy import Column, String, DateTime, func, text, Text, JSON, Integer, ForeignKey


class FlyingService(Base):
    __tablename__ = 'flying_service'

    id = Column(String(36), primary_key=True, default=generate_uuid)

    name = Column(String(64), comment="安排的计划名")
    route_id = Column(String(36), nullable=False, comment="航线id")
    plane_id = Column(String(36), nullable=False, comment="飞机id")
    coach_id = Column(String(36), nullable=False, comment="教员id")
    student_id = Column(String(36), nullable=False, comment="学员id")
    plan_duration = Column(Integer, nullable=False, comment="计划飞行时长")

    plan_time_start = Column(DateTime, nullable=False, comment="计划飞行开始时间")
    plan_time_end = Column(DateTime, nullable=False, comment="计划飞行结束时间")
    status = Column(Integer, nullable=False, comment="计划中，正在进行，按计划完成，补签完成，过时未进行，已调整，已取消")

    real_duration = Column(Integer, comment="实际飞行时长")
    real_time_start = Column(DateTime, comment="实际飞行开始时间")
    real_time_end = Column(DateTime, comment="实际飞行开始时间")

    handle_time = Column(DateTime, comment="操作时间", server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
    handle_user = Column(String(36), comment="操作人")
    handle_reason = Column(Text().with_variant(JSON, "mysql"), comment="操作原因")
    adjust_id = Column(String(36), ForeignKey("flying_service.id"), comment="调整到其他飞行计划的id, 自关联")

    description = Column(Text().with_variant(JSON, "mysql"), comment="描述")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    adjust = relationship("FlyingService", remote_side=[id], backref='flying_service')

    expand_data = Column(Text().with_variant(JSON, "mysql"), comment="依据")
    __mapper_args__ = {"eager_defaults": True}


