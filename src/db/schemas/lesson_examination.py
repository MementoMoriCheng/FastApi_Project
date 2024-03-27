#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : Flying_manage.py
# @Software: PyCharm


from datetime import datetime
from pydantic import BaseModel
from typing import Union, Text, List


# -----------考试信息
class SearchExaminationSchema(BaseModel):
    name: str = None
    exam_date: Union[datetime, None]
    is_delete: int = None
    is_published: int = None


class ExaminationSchema(BaseModel):
    id: str
    name: str = None
    paper_id: str = None
    description: str = None
    exam_date: Union[datetime, None]
    total_time: int = 120
    start_time: Union[datetime, None]
    end_time: Union[datetime, None]
    major: str = None
    tips: str = None
    is_delete: int = 0
    is_published: int = 0
    publish_date: Union[datetime, None]
    created_user: str = None
    created_at: Union[datetime, None]
    updated_user: str = None
    updated_at: Union[datetime, None]

    class Config:
        orm_mode = True


class UpdateExaminationSchema(BaseModel):
    name: str = None
    paper_id: str = None
    description: str = None
    exam_date: Union[datetime, None]
    total_time: int = 120
    start_time: Union[datetime, None]
    end_time: Union[datetime, None]
    major: str = None
    tips: str = None
    is_delete: int = 0
    is_published: int = 0
    publish_date: Union[datetime, None]
    updated_user: str = None
    updated_at: Union[datetime, None]


# -----------考试结果信息
class ExamResultSchema(BaseModel):
    id: str
    student_id: str = None
    exam_id: str = None
    result_mark: int = 0
    start_time: Union[datetime, None]
    end_time: Union[datetime, None]

    class Config:
        orm_mode = True


class QueryExamResultSchema(BaseModel):
    student_id: str = None
    exam_id: str = None


class CreateExamResultSchema(BaseModel):
    id: str
    student_id: List = []
    exam_id: str = None
    result_mark: int = 0
    start_time: Union[datetime, None]
    end_time: Union[datetime, None]


class UpdateExamResultSchema(BaseModel):
    result_mark: int = 0


# -----------考试结果详情信息
class ExamResultDetailSchema(BaseModel):
    id: str
    exam_result_id: str = None
    question_id: str = None
    mark: int = 0
    solution: Text = None

    class Config:
        orm_mode = True


# -----------试卷信息
class SearchPaperSchema(BaseModel):
    name: str = None
    duration_minutes: int = None
    is_delete: int = None
    is_published: int = None


class PaperSchema(BaseModel):
    id: str
    name: str = None
    description: str = None
    score: int = 100
    duration_minutes: int = 60
    is_delete: int = 0
    is_published: int = 0
    created_user: str = None
    created_at: Union[datetime, None]
    updated_user: str = None
    updated_at: Union[datetime, None]

    class Config:
        orm_mode = True


class UpdatePaperSchema(BaseModel):
    name: str = None
    description: str = None
    score: int = 100
    duration_minutes: int = 60
    is_delete: int = 0
    is_published: int = 0
    updated_user: str = None
    updated_at: Union[datetime, None]


# -----------试卷模块信息
class PaperModuleSchema(BaseModel):
    id: str
    paper_id: str = None
    title: str = None
    description: str = None
    score: int = 100
    sequence_number: int = 1
    created_user: str = None
    created_at: Union[datetime, None]
    updated_user: str = None
    updated_at: Union[datetime, None]

    class Config:
        orm_mode = True


class UpdatePaperModuleSchema(BaseModel):
    paper_id: str = None
    title: str = None
    description: str = None
    score: int = 100
    sequence_number: int = 1
    updated_user: str = None
    updated_at: Union[datetime, None]


# -----------试卷试题信息
class PaperQuestionSchema(BaseModel):
    id: str
    paper_id: str = None
    question_id: str = None
    module: str = None
    sequence_number: int = 1
    mark: int = 0
    created_at: Union[datetime, None]

    class Config:
        orm_mode = True


class UpdatePaperQuestionSchema(BaseModel):
    paper_id: str = None
    question_id: str = None
    module: str = None
    sequence_number: int = 1
    mark: int = 0


# -----------试题信息
class SearchQuestionSchema(BaseModel):
    question: str = None
    created_user: str = None
    type: int = None
    is_delete: int = None
    status: int = None


class QuestionSchema(BaseModel):
    id: str
    lesson_name: Text = None
    lesson_chapter: Text = None
    knowledge_points: Text = None
    serial_number: str = None

    question: Text = None
    analysis: Text = None
    level_choices: int = 1
    options: Text = None
    right_answer: Text = None
    score: int = 1
    type: int = 1
    is_delete: int = 0
    status: int = 0
    created_user: str = None
    created_at: Union[datetime, None]
    updated_user: str = None
    updated_at: Union[datetime, None]

    class Config:
        orm_mode = True


class UpdateQuestionSchema(BaseModel):
    lesson_name: Text = None
    lesson_chapter: Text = None
    knowledge_points: Text = None
    serial_number: str = None
    question: Text = None
    analysis: Text = None
    level_choices: int = 1
    options: Text = None
    right_answer: Text = None
    score: int = 1
    type: int = 1
    is_delete: int = 0
    status: int = 0
    updated_user: str = None
    updated_at: Union[datetime, None]
