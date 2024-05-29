#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/29 15:21
# @Author  : MementoMori
# @File    : aircraft_data.py
# @Software: PyCharm

from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy import Column, String, DateTime, func, Float, Integer, Boolean


class GNSSData(Base):
    """
    GNSS数据
    """
    __tablename__ = 'gnss_data'
    id = Column(String(36), primary_key=True, default=generate_uuid)
    sync_code1 = Column(Integer, nullable=False, comment="同步码1")
    sync_code2 = Column(Integer, nullable=False, comment="同步码2")
    sync_code3 = Column(Integer, nullable=False, comment="同步码3")
    identify_code = Column(Integer, nullable=False, comment="识别码")

    # GPS相关信息
    gps_week = Column(Integer, nullable=False, comment="GPS周数")
    gps_milliseconds = Column(Integer, nullable=False, comment="GPS毫秒数")

    # 地理位置信息
    latitude = Column(Float, nullable=False, comment="纬度")
    longitude = Column(Float, nullable=False, comment="经度")
    altitude = Column(Float, nullable=False, comment="海拔高度")

    # 精度误差信息
    latitude_stddev = Column(Float, nullable=False, comment="纬度标准偏差")
    longitude_stddev = Column(Float, nullable=False, comment="经度标准偏差")
    altitude_stddev = Column(Float, nullable=False, comment="海拔高度标准偏差")

    # 速度信息
    horizon_speed = Column(Float, nullable=False, comment="水平速度")
    upward_speed = Column(Float, nullable=False, comment="垂直速度")

    # 方向信息
    track_direction = Column(Float, nullable=False, comment="航迹方向")

    # 定位状态与卫星数量
    positioning_status = Column(Integer, nullable=False, comment="定位状态")
    observation_satellite = Column(Integer, nullable=False, comment="观测卫星数")
    calculate_satellite = Column(Integer, nullable=False, comment="解算卫星数")
    rtk_satellite = Column(Integer, nullable=False, comment="双频RTK卫星数")

    # 其他导航数据
    differential_age = Column(Float, nullable=False, comment="差分龄期")
    azimuth = Column(Float, nullable=False, comment="方位角")
    pitch = Column(Float, nullable=False, comment="俯仰角")

    # 校验和
    checksum = Column(Integer, nullable=False, comment="校验和")
    create_time = Column(DateTime, server_default=func.now())

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}


class FlightData(Base):
    """
    飞行数据
    """
    __tablename__ = 'flight_data'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    time = Column(DateTime, nullable=False, server_default=func.now())
    update_time = Column(DateTime, nullable=False, server_default=func.now())
    # 北斗数据包解析
    plane_code = Column(String(12), nullable=False, comment="机号")
    beidou_height = Column(Float, comment="北斗高度")
    ground_speed = Column(Float, comment="地速")
    heading = Column(Float, comment="航向")
    longitude = Column(Float, comment="经度")
    latitude = Column(Float, comment="纬度")
    pitch_angle = Column(Float, comment="俯仰")
    bank_angle = Column(Float, comment="坡度")
    longitudinal_load_factor = Column(Float, comment="纵向过载")
    lateral_load_factor = Column(Float, comment="侧向过载")
    normal_load_factor = Column(Float, comment="法向过载")
    # 计算得出
    mach_number = Column(Float, comment="马赫数")
    vertical_rate = Column(Float, comment="升级速度")
    angle_of_attack = Column(Float, comment="攻角")
    side_slip_angle = Column(Float, comment="侧滑角")
    # 以下预留
    pressure_altitude = Column(Float, comment="气压高度")
    radio_altitude = Column(Float, comment="无线电高度")
    indicated_airspeed = Column(Float, comment="指示空速")
    true_airspeed = Column(Float, comment="真空速")
    engine_rpm = Column(Float, comment="发动机转速")
    engine_temperature = Column(Float, comment="发动机温度")
    oil_temperature = Column(Float, comment="滑油温度")
    remaining_fuel = Column(Float, comment="剩余油量")
    landing_gear_position = Column(Float, comment="起落架位置")
    throttle_position = Column(Float, comment="油门位置")
    aileron_position = Column(Float, comment="驾驶杆横向")
    elevator_position = Column(Float, comment="驾驶杆纵向")
    rudder_position = Column(Float, comment="脚蹬位置")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}


class FlightAlarm(Base):
    """
    安全告警数据
    """
    __tablename__ = 'flight_alarm'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    plane_code = Column(String(12), nullable=False, comment="机号")

    low_altitude = Column(Boolean, comment="低高度")
    altitude = Column(Float, comment="高度")

    low_speed = Column(Boolean, comment="低速度")
    speed = Column(Float, comment="速度")
    lost_speed = Column(Boolean, comment="失速")

    over_temperature = Column(Boolean, comment="超温")
    temperature = Column(Float, comment="温度")

    shutdown = Column(Boolean, comment="停车")
    engine_speed = Column(Float, comment="发动机转速")

    # 预留
    note_1 = Column(Float, comment="预留")
    note_2 = Column(Float, comment="预留")
    note_3 = Column(Float, comment="预留")

    time = Column(DateTime, nullable=False, server_default=func.now())
    update_time = Column(DateTime, nullable=False, server_default=func.now())

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}
