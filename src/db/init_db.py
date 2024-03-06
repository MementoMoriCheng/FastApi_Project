#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 11:02
# @Author  : yilifeng
# @File    : init_db.py
# @Software: PyCharm
import asyncio
import sys
import os
from sqlalchemy import create_engine
from pathlib import Path

sys.path.append(str(Path(__file__).absolute().parent.parent.parent))

from src.db.config import engine
from src.db.config import Base
from src.config.setting import settings

backend = os.path.dirname(os.path.abspath(__file__))
rootp = settings.ROOT_PATH


def init_database():
    db_engine = create_engine(settings.DATABASE_URI)
    sql_cmd = '''
        CREATE DATABASE IF NOT EXISTS {}
        DEFAULT CHARACTER SET utf8mb4
        DEFAULT COLLATE utf8mb4_general_ci;
    '''.format(settings.DB_NAME)
    db_engine.execute(sql_cmd)


async def init_table(drop=""):
    async with engine.begin() as conn:
        if drop == "drop":
            await conn.run_sync(Base.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)


def init_db(drop=""):
    init_database()
    loop = asyncio.get_event_loop()
    loop.run_until_complete(init_table(drop))


if __name__ == '__main__':
    drop = "drop"
    if len(sys.argv) > 1:
        drop = sys.argv[1]

    init_db(drop)
