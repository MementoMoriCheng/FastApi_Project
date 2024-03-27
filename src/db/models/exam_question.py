#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : exam_question.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, Text, text
from src.utils import generate_uuid


class Questions(Base):
    __tablename__ = 'questions'
    id = Column(String(36), primary_key=True, default=generate_uuid)
    lesson_name = Column(Text(), comment="课程")
    lesson_chapter = Column(Text(), comment="章节")
    knowledge_points = Column(Text(), comment="知识点")
    serial_number = Column(Text(), comment="编号")

    question = Column(Text(), comment="题目")
    level_choices = Column(Integer,
                           comment="题目难度:('1', '入门'),('2', '简单'),('3', '普通'),('4', '较难'),('5', '困难')",
                           default=1)
    options = Column(Text(), comment="试题选项")
    right_answer = Column(Text(), comment="正确答案")
    analysis = Column(Text(), comment="题目解析")
    score = Column(Text(), comment="分值")
    type = Column(Integer, comment="试题类型 1:单选 2:多选 3:判断 4:填空 5:简答")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="试题状态")

    created_user = Column(String(32), comment="创建人")
    created_at = Column(DateTime, comment="创建时间")
    updated_user = Column(String(32), comment="更新人")
    updated_at = Column(DateTime, comment="更新时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class ExamResultDetail(Base):
    __tablename__ = 'questions_favorite'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    question_id = Column(String(32), comment="试题ID")
    collector = Column(String(32), comment="收藏者ID")

    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}


class ErrorArchive(Base):
    __tablename__ = 'error_archive'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    question_id = Column(String(32), comment="试题ID")
    collector = Column(String(32), comment="收藏者ID")
    explanation = Column(Text(), comment="错题解析")
    difficulty = Column(Integer, default=1,
                        comment="错题难度,('1', '入门'),('2', '简单'),('3', '普通'),('4', '较难'),('5', '困难')")
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
