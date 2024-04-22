#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : Flying_manage.py
# @Software: PyCharm


from datetime import datetime, date
from pydantic import BaseModel
from typing import Union, Text, List


# -----------考试信息
class SearchExaminationSchema(BaseModel):
    name: str = None
    exam_date: Union[date, None]


class ExaminationSchema(BaseModel):
    name: str = None
    paper_id: str = None
    description: str = None
    exam_date: Union[date, None]
    start_time: Union[datetime, None]
    end_time: Union[datetime, None]
    major: str = None
    tips: str = None
    is_published: int = 0
    total_time: int = 0

    class Config:
        orm_mode = True


# -----------考试结果信息
class ExamResultSchema(BaseModel):
    student_id: str
    exam_id: str
    total_score: int
    start_time: Union[datetime, None]
    end_time: Union[datetime, None]

    class Config:
        orm_mode = True


class EditExamResultSchema(BaseModel):
    exam_id: str
    student_id: List[str]


class QueryExamResultSchema(BaseModel):
    student_id: str = None
    exam_id: str = None


class UpdateExamResultSchema(BaseModel):
    total_score: int


class CalQuestion(BaseModel):
    id: str
    answer: Text = None
    score: int = 1
    type: int = 1

    class Config:
        orm_mode = True


class StudentAnswer(BaseModel):
    id: str
    question_id: str
    solution: Text = None

    class Config:
        orm_mode = True


class StudentExamResult(BaseModel):
    id: str
    student_id: str

    class Config:
        orm_mode = True


class StudentIn(BaseModel):
    exam_id: str
    student_id: List[str]
    # -----自动阅卷部分
    single_choice: int = 1
    multiple_choice: int = 1
    fill: int = 1
    judge: int = 1
    short_answer: int = 1


# -----------考试结果详情信息
class ExamResultDetailSchema(BaseModel):
    exam_result_id: str = None
    question_id: str = None
    mark: int = 0
    solution: Text = None

    class Config:
        orm_mode = True


class EditExamResultDetailSchema(BaseModel):
    exam_result_id: str = None
    question_id: str = None
    solution: Text = None


# -----------试卷信息
class SearchPaperSchema(BaseModel):
    name: str


class PaperSchema(BaseModel):
    id: str = None
    name: str = None
    description: str = None
    score: int = 100
    duration_minutes: int = 60
    publish_date: Union[datetime, None]

    class Config:
        orm_mode = True


class EditPaperSchema(BaseModel):
    name: str = None
    description: str = None
    score: int = 100
    duration_minutes: int = 60
    publish_date: Union[datetime, None]


# -----------试卷试题信息
class SearchQuestionSchema(BaseModel):
    course_chapter_id: str = None
    question: str = None
    type: int = None


class PaperQuestionSchema(BaseModel):
    paper_id: str = None
    question_id: str = None
    sequence_number: int = 1
    mark: int = 0
    module: str = None

    class Config:
        orm_mode = True


class CreatePaperQuestionSchema(BaseModel):
    # --------题型部分试题数量
    single_choice: int = 10
    multiple_choice: int = 5
    fill: int = 5
    judge: int = 5
    short_answer: int = 5
    # --------基本信息
    paper_id: str = None
    question_id: str = None
    sequence_number: int = 1
    mark: int = 0
    module: str = None


# -----------试题信息
class QuestionSchema(BaseModel):
    id: str
    course_chapter_id: str
    question: Text = None
    type: int = 1
    options: Text = None
    answer: Text = None
    analysis: Text = None
    level_choices: int = 1
    score: int = 1
    status: int = 0

    class Config:
        orm_mode = True


class EditQuestionSchema(BaseModel):
    course_chapter_id: str
    question: Text = None
    type: int = 1
    options: Text = None
    answer: Text = None
    analysis: Text = None
    level_choices: int = 1
    score: int = 1
    status: int = 0


# -----------课程表信息

class ScheduleSchema(BaseModel):
    id: str = None
    course_date: Union[date, None]
    course_sequence: int = 1
    course_start: Union[datetime, None]
    course_end: Union[datetime, None]
    classroom: str = None
    course_name: str = None
    teacher: str = None
    classes: str = None
    students_num: int = 0

    status: int = 0
    notes: Text = None

    class Config:
        orm_mode = True


class EditScheduleSchema(BaseModel):
    course_date: Union[date, None]
    course_sequence: int = 1
    course_start: Union[datetime, None]
    course_end: Union[datetime, None]
    classroom: str = None
    course_name: str = None
    teacher: str = None
    classes: str = None
    students_num: int = 0

    status: int = 0
    notes: Text = None


# -----------教学日志信息

class TeachingJournalSchema(BaseModel):
    id: str = None
    course_date: Union[date, None]
    course_sequence: int = 1
    course_start: Union[datetime, None]
    course_end: Union[datetime, None]
    classroom: str = None
    course_name: str = None
    teacher: str = None
    course_content: Text = None
    students_num: int = 0

    status: int = 0
    notes: Text = None

    class Config:
        orm_mode = True


class EditTeachingJournalSchema(BaseModel):
    course_date: Union[datetime, None]
    course_sequence: int = 1
    course_start: Union[datetime, None]
    course_end: Union[datetime, None]
    classroom: str = None
    course_name: str = None
    teacher: str = None
    course_content: Text = None
    students_num: int = 0

    status: int = 0
    notes: Text = None


# -----------课程章节信息
class SearchCourseChapterSchema(BaseModel):
    key_word: Text


class CourseChapterSchema(BaseModel):
    id: str = None
    parent_id: str = None
    type: int = 1
    course_name: Text = None
    course_chapter: Text = None
    serial_number: str = None
    knowledge_points: Text = None
    learning_hours: int = 0

    class Config:
        orm_mode = True


class CourseChapterID(BaseModel):
    id: str = None

    class Config:
        orm_mode = True


class EditCourseChapterSchema(BaseModel):
    parent_id: str = None
    type: int = 1
    course_name: Text = None
    course_chapter: Text = None
    serial_number: str = None
    knowledge_points: Text = None
    learning_hours: int = 0


# -----------课程资源信息
class CourseSourceSchema(BaseModel):
    course_chapter_id: str = None
    status: int = 1
    file_id: Union[str, None]
    description: Text = None

    class Config:
        orm_mode = True


class CourseSourceFile(CourseSourceSchema):
    file_name: str = None

    class Config:
        orm_mode = True
