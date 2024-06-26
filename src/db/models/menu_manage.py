#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 10:57
# @Author  : yilifeng
# @File    : table_manage.py
# @Software: PyCharm

from sqlalchemy import Column, String, DateTime, func, text, Text, JSON, Integer, ForeignKey, Float, Boolean
from sqlalchemy.orm import relationship

from src.db.config import Base
from src.utils import generate_uuid


class MenuManage(Base):
    __tablename__ = 'menu_manage'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(64), nullable=False, comment="数据表中文名称")
    parent = Column(String(36), ForeignKey('menu_manage.code', ondelete='CASCADE'), nullable=True, comment="父级菜单")
    code = Column(String(36), nullable=False, unique=True, comment="编码，预留字段")
    description = Column(Text().with_variant(JSON, "mysql"), nullable=True, comment="描述")
    is_delete = Column(Integer, comment="是否删除, 1：删除、0：保留，默认值：0", default=0)
    type = Column(Integer, comment="类型：1：主菜单，2：分菜单", default=0)
    create_time = Column(DateTime, server_default=func.now())
    update_time = Column(DateTime, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
    status = Column(Integer, comment="列状态：1：显示，2：隐藏", default=1)
    sort = Column(Float, comment="列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序", default=0)
    icon = Column(String(36), nullable=True, comment="菜单图标", default="star-icon")
    create_user = Column(String(64), comment="创建者")
    update_user = Column(String(64), comment="修改人")
    table_code = Column(String(32), nullable=True, comment="菜单对应数据库表，后续一系列的增删改查")
    use_type = Column(Integer,
                      comment="使用类型：0：录入，1：查询，2：统计，3：到期提醒，"
                              "4：航点规划，5：航线规划，6：飞行监控，7：飞行回放"
                              "8：飞行规划， 9：教学资源， 10: 题库管理， 11：教学日志"
                              "12：课程管理，13：在线学习，14：考试管理，15：在线考试"
                              "16：成绩管理", default=0)
    tree_mode = Column(Boolean, comment="是否可按树结构显示：ture：可以，false：不可以", default=False)

    parent_id = relationship("MenuManage", remote_side=[code], backref='menu_manage')  # 自关联
    # table_manage = relationship("TableManage", back_populates="menu_manage", lazy="select")
    __mapper_args__ = {"eager_defaults": True}
