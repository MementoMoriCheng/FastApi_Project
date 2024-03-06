#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 10:33
# @Author  : yilifeng
# @File    : sql_config.py
# @Software: PyCharm
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import declarative_base, sessionmaker

from src.config.setting import settings

DATABASE_URL = settings.SQLALCHEMY_DATABASE_URI
engine = create_async_engine(
    DATABASE_URL,
    pool_size=10,  # 加上连接池吧
    future=True,
    pool_pre_ping=True,
    pool_recycle=3600,
    max_overflow=20  # 连接池最大溢出量, 默认为 10, 连接满时, 会横向扩展
)
session = sessionmaker(bind=engine, expire_on_commit=False, class_=AsyncSession)
Base = declarative_base()
