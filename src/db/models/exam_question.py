#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : exam_question.py
# @Software: PyCharm
from sqlalchemy.orm import relationship

from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, Text, text, ForeignKey
from src.utils import generate_uuid


class Questions(Base):
    """
    试题管理
    """
    __tablename__ = 'questions'
    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_chapter_id = Column(
        String(36),
        ForeignKey("course_chapter.id", ondelete="CASCADE"),
        nullable=False,
        comment="课程名称/教学资源id",
    )

    question = Column(Text(), comment="题目")
    type = Column(Integer, comment="试题类型 1:单选 2:多选 3:判断 4:填空 5:简答")
    options = Column(Text(), comment="试题选项")
    answer = Column(Text(), comment="正确答案")
    analysis = Column(Text(), comment="题目解析")
    score = Column(Text(), comment="分值")
    level_choices = Column(Integer, comment="题目难度:1入门,2简单,3普通,4较难,5困难", default=1)
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="试题状态")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    course_chapter = relationship("CourseChapter", back_populates="questions", lazy="select")
    paper_questions = relationship("PaperQuestions", back_populates="questions", lazy="select")
    __mapper_args__ = {"eager_defaults": True}


class QuestionsFavorite(Base):
    """
    试题收藏
    """
    __tablename__ = 'questions_favorite'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    question_id = Column(String(36), comment="试题ID")
    collector = Column(String(32), comment="收藏者ID")

    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}


class ErrorArchive(Base):
    """
    错题收藏
    """
    __tablename__ = 'error_archive'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    question_id = Column(String(36), comment="试题ID")
    collector = Column(String(36), comment="收藏者ID")
    explanation = Column(Text(), comment="错题解析")
    difficulty = Column(Integer, default=1,
                        comment="错题难度,('1', '入门'),('2', '简单'),('3', '普通'),('4', '较难'),('5', '困难')")
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
