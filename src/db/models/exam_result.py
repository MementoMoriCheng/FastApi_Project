#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : examination.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, JSON, Integer, Text, CheckConstraint, text
from src.utils import generate_uuid


class ExamResult(Base):
    __tablename__ = 'exam_result'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    student_id = Column(String(32), comment="学生ID")
    exam_id = Column(String(36), comment="考试ID")

    result_mark = Column(Integer, CheckConstraint("result_mark >= 0"), comment="学生考试得分", default=0)
    start_time = Column(DateTime,  comment="学生开始考试的时间")
    end_time = Column(DateTime,  comment="学生结束考试的时间")
    created_at = Column(DateTime, comment="创建时间")
    updated_at = Column(DateTime, comment="更新时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class ExamResultDetail(Base):
    __tablename__ = 'exam_result_detail'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    exam_result_id = Column(String(36), comment="考试结果ID")
    question_id = Column(String(32), comment="试题ID")
    mark = Column(Integer, CheckConstraint("mark >= 0"), comment="试题得分")
    solution = Column(Text().with_variant(JSON, "mysql"), comment="学生作答结果")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}
