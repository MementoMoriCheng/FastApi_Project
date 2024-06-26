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


async def drop_all_table():
    db_engine = create_engine(settings.DATABASE_URI + "/" + settings.DB_NAME)
    sql_cmd = 'SHOW TABLES;'
    tables = db_engine.execute(sql_cmd)
    all_tables = tables.fetchall()

    for i in range(len(all_tables)):
        for item in all_tables:
            table_name = item[0]
            if table_name == "data_handle":
                continue
            sql = f'DROP TABLE IF EXISTS {table_name};'
            # print(sql)
            try:
                db_engine.execute(sql)
            except:
                continue


async def init_table(drop=""):
    async with engine.begin() as conn:
        if drop == "drop":
            await conn.run_sync(Base.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)


async def create_tables(tables=[], drop=""):
    table_dict = dict(Base.metadata.tables)
    table_list = []
    for key in table_dict.keys():
        if key not in tables:
            continue
        table_list.append(table_dict[key])

    async with engine.begin() as conn:
        if drop == "drop":
            await conn.run_sync(Base.metadata.drop_all, tables=table_list)
        await conn.run_sync(Base.metadata.create_all, tables=table_list)


def init_db(drop=""):
    init_database()
    loop = asyncio.get_event_loop()
    loop.run_until_complete(init_table(drop))
    # loop.run_until_complete(create_tables(["data_handle"]))


if __name__ == '__main__':
    drop = "drop"
    if len(sys.argv) > 1:
        drop = sys.argv[1]

    init_db(drop)
