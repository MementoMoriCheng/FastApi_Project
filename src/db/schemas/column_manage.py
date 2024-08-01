#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 11:01
# @Author  : yilifeng
# @File    : column_manage.py
# @Software: PyCharm

# fields.Field(...) 表示此项为必填项
# None 表示可填可不填，不填则为None

from typing import Union, List, Optional
from datetime import datetime
from pydantic import BaseModel, fields


class CreateColumnManage(BaseModel):
    table_id: str = fields.Field(...)
    name: str = fields.Field(...)
    code: str = fields.Field(...)
    type: str = fields.Field(...)
    parent: str = None
    status: int = 1
    field_length: int = None
    save_length: int = None
    is_parent: bool = False  # 该字段是否是父级字段
    auto_generate: bool = False
    read_only: bool = False
    repeatable: bool = True
    association: List = []
    rules: str = None
    create_user: str = None
    description: str = None
    primary: bool = None
    unique: bool = None
    empty: bool = None
    is_encrypt: bool = None


class UpdateColumnManage(BaseModel):
    name: str = None
    code: str = None
    type: str = None
    parent: str = None
    status: int = None
    primary: bool = None
    unique: bool = None
    empty: bool = None
    is_encrypt: bool = None
    auto_generate: bool = False
    read_only: bool = False
    repeatable: bool = True
    rules: str = None
    association: List = []
    update_user: str = None
    field_length: int = None
    description: str = None


class DeleteColumnManage(BaseModel):
    id: str


class ColumnManageSchema(BaseModel):
    id: str
    table_id: str
    name: str
    code: str
    type: str = None
    sort: float = 0
    empty: bool = None
    primary: bool = None
    unique: bool = None
    is_encrypt: bool = None
    is_parent: bool = False
    parent: str = None
    status: int = None
    association: List = None
    create_user: str = None
    field_length: int = None
    save_length: int = None
    auto_generate: bool = False
    read_only: bool = False
    repeatable: bool = True
    rules: str = None
    description: str = None
    create_time: Union[datetime, None]
    update_time: Union[datetime, None]

    class Config:
        orm_mode = True


class ColumnListSchema(BaseModel):
    name: str
    code: str
    sort: float = 0
    type: str
    parent: str = None
    status: int = None
    empty: bool = None
    save_length: int = None
    auto_generate: bool = False
    read_only: bool = False
    repeatable: bool = True
    rules: str = None
    is_parent: bool = None
    is_encrypt: bool = None
    primary: bool = None
    association: Optional[List] = None

    class Config:
        orm_mode = True


class SortColumn(BaseModel):
    id: str
    sort: float


class SortColumnManage(BaseModel):
    columns: List[SortColumn]  # Union[List[SortColumn], None] = None  # List[SortColumn]
    table_code: str = 'column_manage'
