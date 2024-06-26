#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    :
# @Software: PyCharm


from pydantic import BaseModel


class CreatePaperSchema(BaseModel):
    # --------基本信息
    paper_id: str = None


class SubmitAnswerSchema(BaseModel):
    paper_id: str = None
    QID: str = None
    solution: str = None


class CalculatePayload(BaseModel):
    paper_id: str
    # -----自动阅卷部分
    single_choice: int = 1
    multiple_choice: int = 1
    fill: int = 1
    judge: int = 1
    short: int = 1
