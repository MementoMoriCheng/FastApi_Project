#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : course.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, text
from src.utils import generate_uuid


class Course(Base):
    __tablename__ = 'course'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_name = Column(String(32), comment="课程")
    course_chapter = Column(String(32), comment="章节")
    knowledge_points = Column(String(32), comment="知识点")
    learning_hours = Column(Integer, default=1, comment="学时")
    serial_number = Column(String(32), comment="编号")

    teacher = Column(String(32), comment="讲师")
    degree = Column(Integer, default=1, comment="课程难度 (0, '初级'), (1, '中级'), (2, '高级')")
    students = Column(Integer, comment="学习人数")
    category = Column(Integer, comment="课程类别")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


# class CourseSchedule(Base):
#     __tablename__ = 'course_schedule'
#
#     id = Column(String(36), primary_key=True, default=generate_uuid)
#     course_date = Column(DateTime, comment="日期")
#     degree = Column(Integer, default=1, comment="节次")
#
#
#     course_name = Column(String(32), comment="课程")
#     course_chapter = Column(String(32), comment="章节")
#     knowledge_points = Column(String(32), comment="知识点")
#     learning_hours = Column(Integer, default=1, comment="学时")
#     serial_number = Column(String(32), comment="编号")
#
#     teacher = Column(String(32), comment="讲师")
#     degree = Column(Integer, default=1, comment="课程难度 (0, '初级'), (1, '中级'), (2, '高级')")
#     students = Column(Integer, comment="学习人数")
#     category = Column(Integer, comment="课程类别")
#
#     create_time = Column(DateTime, server_default=func.now())
#     update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
#
#     __mapper_args__ = {"eager_defaults": True}
#
#
# class TeachingJournal(Base):
#     __tablename__ = 'teaching_journal'
#
#     id = Column(String(36), primary_key=True, default=generate_uuid)
#     course_name = Column(String(32), comment="课程")
#     course_chapter = Column(String(32), comment="章节")
#     knowledge_points = Column(String(32), comment="知识点")
#     learning_hours = Column(Integer, default=1, comment="学时")
#     serial_number = Column(String(32), comment="编号")
#
#     teacher = Column(String(32), comment="讲师")
#     degree = Column(Integer, default=1, comment="课程难度 (0, '初级'), (1, '中级'), (2, '高级')")
#     students = Column(Integer, comment="学习人数")
#     category = Column(Integer, comment="课程类别")
#
#     create_time = Column(DateTime, server_default=func.now())
#     update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
#
#     __mapper_args__ = {"eager_defaults": True}