#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/29 15:21
# @Author  : yilifeng
# @File    : flying_service.py
# @Software: PyCharm

from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy import Column, String, DateTime, func, Text, JSON, Integer


class LogManage(Base):
    __tablename__ = 'log_manage'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    level = Column(Integer, nullable=False, comment="0: debug, 1: info, 2: warning, 3: error")

    handle_user = Column(String(36), comment="操作人")
    handle_reason = Column(Text().with_variant(JSON, "mysql"), comment="操作原因")
    handle_params = Column(Text().with_variant(JSON, "mysql"), comment="操作参数")

    entity_type = Column(String(128), comment="操作数据库表的名字")
    entity_id = Column(String(36), comment="操作的实体id")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
