#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : Flying_manage.py
# @Software: PyCharm
from datetime import datetime
from pydantic import BaseModel, constr
from typing import Text


class CreateDocument(BaseModel):
    url: str
    name: str
    document_type: str
    user_id: str = None
    record: Text = None


class BuckCreateDocument(BaseModel):
    id: str
    name: str
    user_id: str = None
    url: str
    document_type: str
    record: Text = None


class UpdateDocument(BaseModel):
    name: str = None
    url: str = None
    user_id: str = None
    document_type: str = None


class DeleteDocument(BaseModel):
    id: constr(min_length=32, max_length=36)


class DocumentSchemas(BaseModel):
    id: str
    url: str
    name: str
    document_type: str
    user_id: str = None
    table_code: str = None
    col_name: str = None
    create_time: datetime
    update_time: datetime

    class Config:
        orm_mode = True
