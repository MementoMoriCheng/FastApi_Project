#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : course.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, text, Text
from src.utils import generate_uuid


class Course(Base):
    __tablename__ = 'course'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_name = Column(Text(), comment="课程")
    course_chapter = Column(Text(), comment="章节")
    knowledge_points = Column(Text(), comment="知识点")
    learning_hours = Column(Integer, default=1, comment="学时")
    serial_number = Column(String(32), comment="编号")

    teacher = Column(String(32), comment="讲师")
    degree = Column(Integer, default=1, comment="课程难度 (0, '初级'), (1, '中级'), (2, '高级')")
    students = Column(Integer, comment="学习人数")
    category = Column(Integer, comment="课程类别")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="状态")
    section_type = Column(Integer,
                          comment="资源文件内容(0, '文档HTML、PDF等'), (1, '图片JPG、PNG、GIF'), (2, '视频MP4、WMV等')")
    section_url = Column(String(255), unique=True, comment="资源链接")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class CourseChapter(Base):
    __tablename__ = 'course_chapter'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_id = Column(String(36), comment="课程ID")

    course_name = Column(Text(), comment="课程")
    course_chapter = Column(Text(), comment="章节")
    sub_course_chapter = Column(Text(), comment="子章节")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class CourseSchedule(Base):
    __tablename__ = 'course_schedule'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_date = Column(DateTime, comment="日期")
    time_periods = Column(DateTime, comment="节次")

    classroom = Column(String(32), comment="教室")
    course_name = Column(String(32), comment="课程")
    teacher = Column(String(32), comment="讲师")
    classes = Column(String(32), comment="班级")
    students_num = Column(Integer, comment="学习人数")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="状态")

    notes = Column(Text(), comment="备注")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class TeachingJournal(Base):
    __tablename__ = 'teaching_journal'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_date = Column(DateTime, comment="日期")
    time_periods = Column(DateTime, comment="节次")

    classroom = Column(String(32), comment="教室")
    course_name = Column(String(32), comment="课程")
    teacher = Column(String(32), comment="讲师")
    course_content = Column(Text(), comment="课程内容")
    students_num = Column(Integer, comment="学习人数")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="状态")

    notes = Column(Text(), comment="备注")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}
