#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 10:33
# @Author  : yilifeng
# @File    : __init__.py
# @Software: PyCharm
import random

from sqlalchemy import Text, Integer, String, Boolean, DateTime, VARCHAR

table_schema = {
    'id': String(36),
    'code': String(32),
    'description': Text,
    'create_user': String(64),
    'update_user': String(64),
    'is_delete': Integer
}

column_schema = {
    "table_id": String(36),
    "name": String(64),
    "code": String(32),
    "type": String(32),
    "parent": String(32),
    "create_user": String(32),
    "primary": Boolean,
    "unique": Boolean,
    "empty": Boolean
}

column_type = {
    "int": "Integer",
    "datetime": "DateTime",
    "date": "Date",
    "text": "Text",
    "bool": "Boolean",
    "varchar": "Varchar(32)",
    "float": "Float",
    "file": "Text"
}


def update_column_type(length):
    if length:
        column_type["varchar"] = f"Varchar({length})"
    return column_type
