#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    :
# @Author  : MementoMori
# @File    : document.py
# @Software: PyCharm
from src.db.config import Base
from sqlalchemy import Column, String, DateTime, func, Integer
from src.utils import generate_uuid


class Document(Base):
    __tablename__ = 'document'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(255), comment="文档名称")
    url = Column(String(255), comment="文档存放路径")
    document_type = Column(String(32), comment="文档类型")
    publish = Column(Integer, default=0, comment="是否公开，0：非密、1：内部、2：秘密")
    confidential_business = Column(Integer, default=0, comment="商密值，0：公开、1：受控商密、2：普通商密、3：核心商密")
    user_id = Column(String(64), comment="文档上传人")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
