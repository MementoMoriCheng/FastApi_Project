#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : examination.py
# @Software: PyCharm
from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy import Column, String, DateTime, func, Integer, CheckConstraint, text


class Paper(Base):
    __tablename__ = 'paper'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(32), comment="试卷名称")
    description = Column(String(32), comment="试卷描述")
    score = Column(Integer, CheckConstraint("score >= 0"), comment="总分", default=100)
    duration_minutes = Column(Integer, CheckConstraint("duration_minutes >= 0"), comment="考试时长", default=60)

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


class PaperQuestions(Base):
    __tablename__ = 'paper_questions'

    id = Column(String(36), primary_key=True)
    paper_id = Column(String(36), comment="试卷ID")
    question_id = Column(String(32), comment="试题ID")
    sequence_number = Column(Integer, CheckConstraint("sequence_number >= 0"), comment="试题顺序", default=1)
    mark = Column(Integer, CheckConstraint("mark >= 0"), comment="试题得分")

    module = Column(String(32), comment="所属模块")
    created_at = Column(DateTime, comment="创建时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class PaperModule(Base):
    __tablename__ = 'paper_module'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    paper_id = Column(String(36), comment="试卷ID")
    title = Column(String(32), comment="模块名称")
    description = Column(String(32), comment="模块描述")

    score = Column(Integer, CheckConstraint("score >= 0"), comment="总分", default=100)
    sequence_number = Column(Integer, CheckConstraint("sequence_number >= 0"), comment="模块顺序", default=1)

    created_user = Column(String(32), comment="创建人")
    created_at = Column(DateTime, comment="创建时间")
    updated_user = Column(String(32), comment="更新人")
    updated_at = Column(DateTime, comment="更新时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}
