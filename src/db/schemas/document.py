#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : Flying_manage.py
# @Software: PyCharm
from datetime import datetime
from pydantic import BaseModel, constr


class CreateDocument(BaseModel):
    id: str
    url: str
    name: str
    user_id: str
    document_type: str
    publish: int = None
    confidential_business: int = None


class BuckCreateDocument(BaseModel):
    id: str
    name: str
    user_id: str
    url: str
    document_type: str
    publish: int = None
    confidential_business: int = None


class UpdateDocument(BaseModel):
    name: str = None
    url: str = None
    user_id: str = None
    document_type: str = None
    publish: int = None
    confidential_business: int = None


class DeleteDocument(BaseModel):
    id: constr(min_length=32, max_length=36)


class DocumentSchemas(CreateDocument):
    id: str
    create_time: datetime
    update_time: datetime

    class Config:
        orm_mode = True
