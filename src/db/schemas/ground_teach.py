#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    :
# @Software: PyCharm


from pydantic import BaseModel


class CreatePaperSchema(BaseModel):
    # --------基本信息
    exam_id: str = None
    UID: str = None
    username: str = None
    course_1: str = None
    course_2: str = None
    course_3: str = None
    course_4: str = None
    course_5: str = None
    course_6: str = None
    course_7: str = None
    course_8: str = None
    course_9: str = None
    course_10: str = None
    ratio_1: float = None
    ratio_2: float = None
    ratio_3: float = None
    ratio_4: float = None
    ratio_5: float = None
    ratio_6: float = None
    ratio_7: float = None
    ratio_8: float = None
    ratio_9: float = None
    ratio_10: float = None
    single_choice_num: int = None
    multiple_choice_num: int = None
    fill_num: int = None
    judge_num: int = None
    short_answer_num: int = None
    single_choice_score: float = None
    multiple_choice_score: float = None
    fill_score: float = None
    judge_score: float = None
    short_answer_score: float = None


class StartExaminationSchema(BaseModel):
    # --------基本信息
    exam_id: str = None
    UID: str = None
    username: str = None


class RevisePaperSchema(BaseModel):
    paper_id: str = None
    QID: str = None
    new_QID: str = None


class SubmitAnswerSchema(BaseModel):
    paper_id: str = None
    UID: str = None
    QID: str = None
    solution: str = None


class CalculatePayload(BaseModel):
    paper_id: str
    UID: str = None
    # -----自动阅卷部分
    single_choice: int = 1
    multiple_choice: int = 1
    fill: int = 1
    judge: int = 1
    short: int = 1
