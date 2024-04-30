#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : course.py
# @Software: PyCharm
from sqlalchemy.orm import relationship

from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, text, Text, ForeignKey, Date
from src.utils import generate_uuid


class CourseChapter(Base):
    """
    教学章节管理表
    """
    __tablename__ = 'course_chapter'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    parent_id = Column(String(36), ForeignKey("course_chapter.id"), comment="父章节, 自关联")

    type = Column(Integer, comment="1课程、2资源")
    course_name = Column(Text(), comment="课程名称/教学资源名称")
    course_chapter = Column(Text(), comment="章节名称/教学资源名称")
    serial_number = Column(String(32), comment="章节编号")
    knowledge_points = Column(Text(), comment="知识点")
    learning_hours = Column(Integer, default=1, comment="学时")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    course_source = relationship("CourseSource", back_populates="course_chapter", lazy="select")
    questions = relationship("Questions", back_populates="course_chapter", lazy="select")
    online_learning_record = relationship("OnlineLearningRecord", back_populates="course_chapter", lazy="select")

    parent = relationship("CourseChapter", remote_side=[id], backref='children')
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}


class CourseSource(Base):
    """
    教学资源管理表
    """
    __tablename__ = 'course_source'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_chapter_id = Column(
        String(36),
        ForeignKey("course_chapter.id", ondelete="CASCADE"),
        nullable=False, comment="课程名称/教学资源id")
    file_id = Column(String(36), comment="文档id", default=" ")
    description = Column(Text(), comment="资源描述信息")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="状态", default=1)
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    course_chapter = relationship("CourseChapter", back_populates="course_source", lazy="select")

    __mapper_args__ = {"eager_defaults": True}


class CourseSchedule(Base):
    """
    课程表
    """
    __tablename__ = 'course_schedule'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_date = Column(Date, comment="日期")
    course_sequence = Column(Integer, comment="节次")

    classroom = Column(String(32), comment="教室")
    course_name = Column(String(32), comment="课程")
    teacher = Column(String(32), comment="讲师")
    classes = Column(String(32), comment="期班")
    students_num = Column(Integer, comment="学习人数")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="状态")

    course_start = Column(DateTime, nullable=False, comment="课程开始时间")
    course_end = Column(DateTime, nullable=False, comment="课程结束时间")

    notes = Column(Text(), comment="备注")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class TeachingJournal(Base):
    """
    教学日志表
    """
    __tablename__ = 'teaching_journal'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    course_date = Column(Date, comment="日期")
    course_sequence = Column(Integer, comment="节次")

    classroom = Column(String(32), comment="教室")
    course_name = Column(String(32), comment="课程")
    teacher = Column(String(32), comment="讲师")
    course_content = Column(Text(), comment="课程内容")
    students_num = Column(Integer, comment="学习人数")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="状态")

    notes = Column(Text(), comment="备注")

    course_start = Column(DateTime, nullable=False, comment="课程开始时间")
    course_end = Column(DateTime, nullable=False, comment="课程结束时间")

    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    __mapper_args__ = {"eager_defaults": True}


class OnlineLearningRecord(Base):
    """
    在线学习记录表
    """
    __tablename__ = 'online_learning_record'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    student_id = Column(String(36), comment="学生ID")
    course_chapter_id = Column(
        String(36),
        ForeignKey("course_chapter.id", ondelete="CASCADE"),
        nullable=False, comment="课程名称/教学资源id")

    start_time = Column(DateTime, comment="学生开始学习的时间")
    end_time = Column(DateTime, comment="学生结束学习的时间")
    keep_time = Column(Integer, comment="学习时长，单位秒")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    course_chapter = relationship("CourseChapter", back_populates="online_learning_record", lazy="select")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    __mapper_args__ = {"eager_defaults": True}
