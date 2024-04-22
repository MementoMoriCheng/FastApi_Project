#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : document.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer, Text
from src.utils import generate_uuid


class Document(Base):
    __tablename__ = 'document'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(255), comment="文档名称")
    url = Column(String(255), comment="文档存放路径ftp")
    document_type = Column(String(32), comment="文档类型")
    record = Column(Text, comment="记录")
    user_id = Column(String(64), comment="文档上传人")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
