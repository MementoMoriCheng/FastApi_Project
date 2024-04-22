#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : examination.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy.orm import relationship
from sqlalchemy import Column, String, DateTime, func, Integer, text, ForeignKey, Date
from src.utils import generate_uuid


#  考试管理
class Examination(Base):
    """
    考试管理
    """
    __tablename__ = 'examination'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    parent_id = Column(String(36), ForeignKey("examination.id"), comment="父级id, 自关联")

    name = Column(String(64), comment="期班名称")
    paper_id = Column(String(36), comment="试卷ID")
    description = Column(String(32), comment="考试描述")
    exam_date = Column(Date, comment="考试日期")
    total_time = Column(Integer, comment="考试时长(分钟)", default=120)
    start_time = Column(DateTime, comment="考试开始时间")
    end_time = Column(DateTime, comment="考试结束时间")
    major = Column(String(32), comment="专业课")
    tips = Column(String(32), comment="考生须知")

    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    is_published = Column(Integer, comment="是否发布, 1：发布、0：保留，默认值：0", default=0)
    publish_date = Column(DateTime, comment="发布时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    exam_result = relationship("ExamResult", back_populates="examination", lazy="select")
    parent = relationship("Examination", remote_side=[id], backref='examination')

    __mapper_args__ = {"eager_defaults": True}
