#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : flight_evaluation.py
# @Software: PyCharm

from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy import Column, String, DateTime, func, Float, Integer, Enum, text


class BaseAction(Base):
    __tablename__ = 'base_actions'
    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_id = Column(String(36), nullable=False, comment="关联课程ID")
    name = Column(String(64), nullable=False, comment="动作名称")
    action_stage = Column(Enum('进入段', '保持段', '改出段'), comment="动作阶段类型")

    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}


class EvaluationCriteria(Base):
    __tablename__ = 'evaluation_criteria'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    action_id = Column(String(36), nullable=False, comment='关联基础动作')
    flight_phase = Column(Enum('起飞段', '任务段', '着陆段'), comment='飞行阶段')

    parameter = Column(String(36), nullable=False, comment="参数名（比如：高度、速度）")
    standard_value = Column(Float, nullable=False, comment="标准值")
    rating_ideal_upper = Column(Float, nullable=False, comment="优秀等级上限值")
    rating_ideal_lower = Column(Float, nullable=False, comment="优秀等级下限值")
    rating_good_upper = Column(Float, nullable=False, comment="良好等级上限值")
    rating_good_lower = Column(Float, nullable=False, comment="良好等级下限值")
    rating_average_upper = Column(Float, nullable=False, comment="普通等级上限值")
    rating_average_lower = Column(Float, nullable=False, comment="普通等级下限值")
    remarks = Column(String(255), comment="备注")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}


class FlightEvaluationBase(Base):
    __tablename__ = 'flight_evaluation_base'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    aircraft_id = Column(String(36), nullable=False, comment='飞机编号')

    pilot_id = Column(String(36), nullable=False, comment='飞行员（学员）标识符')
    instructor_id = Column(String(36), nullable=False, comment='教员标识符')

    date = Column(DateTime, comment='飞行日期')
    start_time = Column(DateTime, comment='飞行开始时间')
    end_time = Column(DateTime, comment='飞行结束时间')

    total_duration = Column(Integer, nullable=False, comment="飞行总时长")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}


class FlightParameter(Base):
    __tablename__ = 'flight_parameter'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    flight_id = Column(String(36), nullable=False, comment='关联飞行架次ID')
    flight_phase = Column(Enum('起飞段', '任务段', '着陆段'), comment='飞行阶段')

    altitude = Column(Float, nullable=False, comment="海拔高度")
    horizon_speed = Column(Float, nullable=False, comment="水平速度")
    upward_speed = Column(Float, nullable=False, comment="垂直速度")
    pitch = Column(Float, nullable=False, comment="俯仰角")
    track_direction = Column(Float, nullable=False, comment="航迹方向")
    bank_angle = Column(Float, nullable=False, comment="坡度")
    # TODO 其他飞行参数

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}


class FlightEvaluationResult(Base):
    __tablename__ = 'flight_evaluation_result'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    flight_id = Column(String(36), nullable=False, comment='关联飞行架次ID')
    flight_phase = Column(Enum('起飞段', '任务段', '着陆段'), comment='飞行阶段')

    action_name = Column(String(64), nullable=False, comment="动作名称")
    action_stage = Column(Enum('进入段', '保持段', '改出段'), comment="动作阶段类型")

    score = Column(Float, nullable=False, comment="动作得分")
    instructor_id = Column(String(36), nullable=False, comment='执行评估的教员ID')
    remarks = Column(String(255), comment="备注")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
