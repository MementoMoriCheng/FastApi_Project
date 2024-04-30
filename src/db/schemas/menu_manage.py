#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 11:01
# @Author  : yilifeng
# @File    : column_manage.py
# @Software: PyCharm
from typing import Union
from datetime import datetime

from pydantic import BaseModel, fields, constr

ALLOWED_CHARACTERS = r'^[a-zA-Z0-9_]*$'


class CreateMenuManage(BaseModel):
    code: constr(regex=ALLOWED_CHARACTERS)
    name: str
    parent: str = None
    type: int = 0
    description: str = None
    status: int = 1
    icon: str = None
    create_user: str = None
    table_code: str = None
    sort: int = 999
    use_type: int = None
    tree_mode: bool = False


class UpdateMenuManage(BaseModel):
    code: str = None
    name: str = None
    parent: str = None
    type: int = None
    description: str = None
    is_delete: bool = False
    status: int = 1
    icon: str = None
    update_user: str = None
    sort: int = 999
    table_code: str = None
    use_type: int = None
    tree_mode: bool = None


class DeleteMenu(BaseModel):
    id: int = fields.Field(...)


class MenuManageSchema(BaseModel):
    id: str
    code: str
    name: str
    parent: str = None
    type: int
    description: str
    status: int = 2
    icon: str = 'star-icon'
    sort: float = 999
    use_type: int = None
    create_time: Union[datetime, None]
    update_time: Union[datetime, None]
    update_user: str = None
    create_user: str = None
    table_code: str = None
    tree_mode: bool = False

    class Config:
        orm_mode = True
