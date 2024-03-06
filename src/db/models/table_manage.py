#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 10:57
# @Author  : yilifeng
# @File    : table_manage.py
# @Software: PyCharm

from sqlalchemy import Column, String, DateTime, func, text, Text, JSON, Integer, ForeignKey
from sqlalchemy.orm import relationship

from src.db.config import Base
from src.utils import generate_uuid


class TableManage(Base):
    __tablename__ = 'table_manage'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(64), nullable=False, comment="数据表中文名称")
    # menu_code = Column(String(36), ForeignKey('menu_manage.code', ondelete='CASCADE'), nullable=True, comment="所属菜单")
    code = Column(String(32), nullable=False, unique=True, comment="数据表名称（英文，用于表名）")
    description = Column(Text().with_variant(JSON, "mysql"), nullable=True, comment="描述")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
    create_user = Column(String(64), comment="创建者")
    update_user = Column(String(64), comment="修改人")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    status = Column(Integer, comment="表状态：0：设计中，1：使用中", default=0)

    column_manage = relationship("ColumnManage", back_populates="table_manage", lazy="select")
    # menu_manage = relationship("MenuManage", back_populates="table_manage")
    __mapper_args__ = {"eager_defaults": True}
