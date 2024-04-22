#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : examination.py
# @Software: PyCharm
from sqlalchemy.orm import relationship

from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy import Column, String, DateTime, func, Integer, CheckConstraint, text, ForeignKey


class Paper(Base):
    """
    试卷管理
    """
    __tablename__ = 'paper'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(32), comment="试卷名称")
    description = Column(String(32), comment="试卷描述")
    score = Column(Integer, CheckConstraint("score >= 0"), comment="总分", default=100)
    duration_minutes = Column(Integer, CheckConstraint("duration_minutes >= 0"), comment="考试时长", default=60)

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    is_published = Column(Integer, comment="是否发布, 1：发布、0：保留，默认值：0", default=0)
    publish_date = Column(DateTime, comment="发布时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    paper_questions = relationship("PaperQuestions", back_populates="paper", lazy="select")
    __mapper_args__ = {"eager_defaults": True}


class PaperQuestions(Base):
    """
    试卷题目（内容）管理
    """
    __tablename__ = 'paper_questions'

    id = Column(String(36), primary_key=True)
    paper_id = Column(
        String(36),
        ForeignKey("paper.id", ondelete="CASCADE"),
        nullable=False,
        comment="试卷ID", )
    question_id = Column(
        String(36),
        ForeignKey("questions.id", ondelete="CASCADE"),
        nullable=False,
        comment="试题ID", )
    sequence_number = Column(Integer, CheckConstraint("sequence_number >= 0"), comment="试题顺序", default=1)
    mark = Column(Integer, CheckConstraint("mark >= 0"), comment="试题得分")
    module = Column(String(32), comment="所属模块")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    paper = relationship("Paper", back_populates="paper_questions", lazy="select")
    questions = relationship("Questions", back_populates="paper_questions", lazy="select")
    __mapper_args__ = {"eager_defaults": True}
