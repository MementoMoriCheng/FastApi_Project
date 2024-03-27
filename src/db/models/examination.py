#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : examination.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, text
from src.utils import generate_uuid


class Examination(Base):
    __tablename__ = 'examination'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(32), comment="考试名称")
    paper_id = Column(String(36), comment="试卷ID")
    description = Column(String(32), comment="考试描述")
    exam_date = Column(DateTime, comment="考试日期")
    total_time = Column(Integer, comment="考试时长(分钟)", default=120)
    start_time = Column(DateTime, comment="考试开始时间")
    end_time = Column(DateTime, comment="考试结束时间")
    major = Column(String(32), comment="专业课")
    tips = Column(String(32), comment="考生须知")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    is_published = Column(Integer, comment="是否发布, 1：发布、0：保留，默认值：0", default=0)
    publish_date = Column(DateTime, comment="发布时间")

    created_user = Column(String(32), comment="创建人")
    created_at = Column(DateTime, comment="创建时间")
    updated_user = Column(String(32), comment="更新人")
    updated_at = Column(DateTime, comment="更新时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}
