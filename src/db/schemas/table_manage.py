#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 11:01
# @Author  : yilifeng
# @File    : column_manage.py
# @Software: PyCharm


from typing import Union, List
from datetime import datetime
from pydantic import BaseModel, fields, constr, validator

ALLOWED_CHARACTERS = r'^[a-zA-Z0-9_]*$'


class CreateTableManage(BaseModel):
    code: constr(regex=ALLOWED_CHARACTERS)
    name: str
    description: str = None
    create_user: str
    update_user: str = None
    menu_id: str = None
    is_delete: bool = False

    @validator('name')
    def validate_name(cls, value):
        filtered_value = ''.join(e for e in value if e.isalnum() or e == '_')
        if value != filtered_value:
            raise ValueError(
                "The 'name' field contains invalid characters. Only alphanumeric and underscore are allowed.")
        return filtered_value


class UpdateTableManage(BaseModel):
    name: str = None
    code: str = None
    menu_id: str = None
    description: str = None
    update_user: str = None
    is_delete: bool = False


class DeleteProject(BaseModel):
    id: int = fields.Field(...)


class TableManageSchema(BaseModel):
    id: str
    name: str
    code: str
    menu_id: str = None
    description: str = None
    update_user: str = None
    create_user: str = None
    sync_flag: int = None
    create_time: Union[datetime, None]
    update_time: Union[datetime, None]

    class Config:
        orm_mode = True


class UserSyncIn(BaseModel):
    """同步用户"""
    username: str
    password: str
    role_id: str
    system_id: List[str]
