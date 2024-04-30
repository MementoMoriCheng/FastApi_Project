#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : examination.py
# @Software: PyCharm
from src.db.config import Base
from src.utils import generate_uuid
from sqlalchemy.orm import relationship
from sqlalchemy import (Column, String, DateTime, func,
                        Integer, Text, CheckConstraint, text, ForeignKey, Float)


class ExamResult(Base):
    """
    考试成绩管理
    """
    __tablename__ = 'exam_result'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    student_id = Column(String(36), comment="学生ID")
    exam_id = Column(
        String(36),
        ForeignKey("examination.id", ondelete="CASCADE"),
        nullable=False,
        comment="考试ID", )
    total_score = Column(Integer, CheckConstraint("total_score >= 0"), comment="学生考试得分", default=0)
    start_time = Column(DateTime, comment="学生开始考试的时间")
    end_time = Column(DateTime, comment="学生结束考试的时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    examination = relationship("Examination", back_populates="exam_result", lazy="select")
    exam_result_detail = relationship("ExamResultDetail", back_populates="exam_result", lazy="select")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}


class ExamResultDetail(Base):
    """
    成绩详情管理
    """
    __tablename__ = 'exam_result_detail'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    exam_result_id = Column(
        String(36),
        ForeignKey("exam_result.id", ondelete="CASCADE"),
        nullable=False,
        comment="考试结果ID", )

    question_id = Column(String(36), comment="试题ID")
    solution = Column(Text(), comment="学生作答结果")
    mark = Column(Integer, CheckConstraint("mark >= 0"), comment="试题得分", default=0)

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    exam_result = relationship("ExamResult", back_populates="exam_result_detail", lazy="select")

    __mapper_args__ = {"eager_defaults": True}


class ScoreStatistics(Base):
    """
    考试成绩统计表
    """

    __tablename__ = 'score_statistics'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(64), comment="期班名称")
    major = Column(String(32), comment="专业课/课程")

    student_num = Column(Integer, nullable=False, comment="学生人数")

    highest_score = Column(Float, nullable=False, comment="最高分")
    lowest_score = Column(Float, nullable=False, comment="最低分")
    average_score = Column(Float, nullable=False, comment="平均分")

    ideal_percentage = Column(Float, nullable=False, comment="优秀的比例")
    good_percentage = Column(Float, nullable=False, comment="良好的比例")
    pass_percentage = Column(Float, nullable=False, comment="及格的比例")
    flunk_percentage = Column(Float, nullable=False, comment="不及格的比例")
    remarks = Column(String(255), comment="备注")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
