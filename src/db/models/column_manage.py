#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 10:56
# @Author  : yilifeng
# @File    : column_manage.py
# @Software: PyCharm

from sqlalchemy import Column, String, DateTime, func, text, Boolean, Text, ForeignKey, JSON, Integer, Float
from sqlalchemy.orm import relationship

from src.db.config import Base
from src.utils import generate_uuid


# association 的格式如下：
# [
#     {
#         "source_table": "${table_name}",
#         "source_col": "${table_key}",
#         "target_table": "${table_name}",
#         "target_col": "${table_key}"
#     }
# ]
class ColumnManage(Base):
    __tablename__ = 'column_manage'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    table_id = Column(String(36), ForeignKey("table_manage.id", ondelete="CASCADE"), nullable=False,
                      comment="属于哪个表")

    merge_name = Column(String(64), comment="多列合并使用同一个merge_name(仅前端可用到)")
    parent = Column(String(36), comment="父级字段")
    is_parent = Column(Boolean, comment="表明父级字段")
    name = Column(String(64), nullable=False, comment="字段名（中文，用于前端显示）")
    sort = Column(Float, comment="列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序", default=0)
    status = Column(Integer, comment="列状态：1：显示，2：隐藏", default=1)
    field_length = Column(Integer, nullable=True, comment="varchar列的长度")
    save_length = Column(Integer, nullable=True, comment="存储列的长度")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)

    code = Column(String(32), nullable=False, unique=False, comment="字段名（英文，用于建表）")
    type = Column(String(32), nullable=True, default="text", comment="字段类型：int、str 32、datetime、text、bool等")
    empty = Column(Boolean, nullable=True, comment="是否可为空")
    primary = Column(Boolean, nullable=True, comment="是否为主键")
    unique = Column(Boolean, nullable=True, comment="是否唯一")
    is_encrypt = Column(Boolean, nullable=True, comment="是否加密")
    auto_generate = Column(Boolean, nullable=True, comment="自动生成，仅限于int类型")

    association = Column(Text().with_variant(JSON, "mysql"), comment="定义关联字段，可定义多个，数组表示")
    rules = Column(Text().with_variant(JSON, "mysql"), nullable=True, comment="校验规则")

    description = Column(Text().with_variant(JSON, "mysql"), comment="字段描述")
    create_user = Column(String(32), comment="创建人")
    update_user = Column(String(32), comment="修改人")
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    table_manage = relationship("TableManage", back_populates="column_manage")

    __mapper_args__ = {"eager_defaults": True}


class IntermediateTable(Base):
    """中间表"""
    __tablename__ = 'intermediate_table'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    data_id = Column(String(36), comment="数据 id")
    correlation_id = Column(String(36), comment="关联 id")
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
