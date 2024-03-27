#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/29 15:21
# @Author  : yilifeng
# @File    : gnss_data.py
# @Software: PyCharm

from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy import Column, String, DateTime, func, Float, Integer


class GNSSData(Base):
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
    positioning_status_satellite_count = Column(Integer, nullable=False, comment="定位状态/卫星数量")
    solution_satellite_count = Column(Integer, nullable=False, comment="解决方案卫星数量")

    # 其他导航数据
    differential_age = Column(Float, nullable=False, comment="差分龄期")
    azimuth = Column(Float, nullable=False, comment="方位角")
    pitch = Column(Float, nullable=False, comment="俯仰角")

    # 校验和
    checksum = Column(Integer, nullable=False, comment="校验和")
    create_time = Column(DateTime, server_default=func.now())

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}
