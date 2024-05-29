#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    :
# @Software: PyCharm


from pydantic import BaseModel


class CreatePaperSchema(BaseModel):
    # --------题型部分试题数量
    # single_choice_num: int = 0
    # multiple_choice_num: int = 0
    # fill_num: int = 0
    # judge_num: int = 0
    # short_answer_num: int = 0
    # --------基本信息
    paper_id: str = None


class CalculatePayload(BaseModel):
    paper_id: str
    # -----自动阅卷部分
    single_choice: int = 0
    multiple_choice: int = 0
    fill: int = 0
    judge: int = 0
    short: int = 0
