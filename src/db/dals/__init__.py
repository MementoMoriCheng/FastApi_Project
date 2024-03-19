#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 13:47
# @Author  : yilifeng
# @File    : __init__.py
# @Software: PyCharm
import traceback
from src.utils import generate_uuid
from typing import Iterable, Mapping, Union

from sqlalchemy import delete, update, or_
from sqlalchemy.future import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import selectinload
from sqlalchemy.exc import SQLAlchemyError
from pydantic import BaseModel

from src.utils.logger import logger
from typing import List


class SortBy:
    sort_by: str
    is_desc: bool = False

    def __init__(self, sort: str, desc: bool):
        self.sort_by = sort
        self.desc = desc


class DAL:
    def __init__(self, db, db_session: AsyncSession):
        self.db = db
        self.db_session = db_session

    def __add_order_by(self, stmt: object, db: object, order_by_list: List[SortBy] = None) -> object:
        if order_by_list and len(order_by_list):
            for sort in order_by_list:
                is_desc = sort.is_desc
                key = sort.sort_by
                if hasattr(db, key):
                    order_by = getattr(db, sort.sort_by)
                    if order_by:
                        if is_desc:
                            stmt = stmt.order_by(order_by.desc())
                        else:
                            stmt = stmt.order_by(order_by.asc())
        return stmt

    async def get(self, id_=None):
        stmt = select(self.db)
        if id_ is not None:
            stmt = select(self.db).where(self.db.id == id_)
        try:
            r = await self.db_session.execute(stmt)
            return r.scalars().first()
        except SQLAlchemyError:
            logger.error(traceback.format_exc())
            return

    async def create(self, obj_in):
        if hasattr(obj_in, "dict"):
            obj_in = obj_in.dict(exclude_none=True)
        db_obj = self.db(**obj_in)
        try:
            self.db_session.add(db_obj)
            await self.db_session.commit()
            await self.db_session.flush()
        except SQLAlchemyError:
            raise
        return db_obj

    async def create_all(self, obj_in_list: Iterable[Union[BaseModel, Mapping]]):
        def generate_db_object(val):
            return self.db(**val)

        def parse_obj(obj):
            if hasattr(obj, "dict"):
                return obj.dict(exclude_none=True)
            return obj

        dict_list = map(parse_obj, obj_in_list)
        try:
            self.db_session.add_all(map(generate_db_object, dict_list))
            await self.db_session.commit()
        except SQLAlchemyError as e:
            logger.error(e)
            raise

    async def buck_create(self, obj_list):
        all_db_list = []
        for obj_in in obj_list:
            data = obj_in.dict(exclude_none=True)
            if not data.get("id"):
                data["id"] = generate_uuid()
            db_obj = self.db(**data)
            self.db_session.add(db_obj)
            all_db_list.append(db_obj)
        await self.db_session.commit()
        await self.db_session.flush()
        return all_db_list

    async def delete(self, id_):
        try:
            cursor_result = await self.db_session.execute(delete(self.db).where(self.db.id == id_))
            return cursor_result.rowcount
        except SQLAlchemyError as e:
            logger.error(e)
            raise

    async def delete_by(self, **kwargs):
        if not kwargs:
            return
        stmt = delete(self.db)
        execute_flag = False
        for k, v in kwargs.items():
            attr = getattr(self.db, k, None)
            if attr:
                execute_flag = True
                stmt = stmt.where(attr == v)
        if execute_flag:
            try:
                r = await self.db_session.execute(stmt)
            except SQLAlchemyError:
                raise

    async def delete_batch(self, ids):
        stmt = delete(self.db).where(self.db.id.in_(ids))
        try:
            cursor_result = await self.db_session.execute(stmt)
            return cursor_result.rowcount
        except SQLAlchemyError as e:
            logger.error(e)
            raise

    async def update(self, id_, obj_in):
        update_data = obj_in
        if hasattr(obj_in, "dict"):
            update_data = obj_in.dict(exclude_none=True)
        if not update_data:
            return update_data
        stmt = update(self.db).where(self.db.id == id_).values(**update_data)
        await self.db_session.execute(stmt)
        return update_data

    async def update_all(self, obj_in):
        update_data = obj_in
        if hasattr(obj_in, "dict"):
            update_data = obj_in.dict(exclude_none=True)
        if not update_data:
            return update_data
        stmt = update(self.db).values(**update_data)
        await self.db_session.execute(stmt)
        return update_data

    async def list(self, limit=None, offset=None, order_by=None, desc=False):
        stmt = select(self.db)
        if offset:
            stmt = stmt.offset(offset)
        if limit:
            stmt = stmt.limit(limit)
        if order_by and getattr(self.db, order_by):
            if desc:
                stmt = stmt.order_by(getattr(self.db, order_by).desc())
            else:
                stmt = stmt.order_by(getattr(self.db, order_by).asc())
        try:
            r = await self.db_session.execute(stmt)
            return r.scalars().all()
        except SQLAlchemyError:
            logger.error(traceback.format_exc())
            return []

    async def get_with_relationship(self, id_, relationship):
        """
        Control over how related objects get loaded when querying.
        This function uses lazy='selectin' or the selectinload() option, this form of loading emits a second (or more)
        SELECT statement which assembles the primary key identifiers of the parent objects into an IN clause, so that
        all members of related collections / scalar references are loaded at once by primary key.
        """
        stmt = select(self.db).where(self.db.id == id_).options(selectinload(getattr(self.db, relationship)))
        r = await self.db_session.execute(stmt)
        return r.scalars().first()

    async def get_by(self, **conditions):
        stmt = select(self.db)
        for k, v in conditions.items():
            attr = getattr(self.db, k, None)
            if not attr:
                continue
            stmt = stmt.where(attr == v)
        r = await self.db_session.execute(stmt)
        return r.scalars().first()

    async def get_by_all(self, limit_=None, offset_=None, order_by_list: List[SortBy] = None, **conditions):
        stmt = select(self.db)
        if offset_:
            stmt = stmt.offset(offset_)
        if limit_:
            stmt = stmt.limit(limit_)
        for k, v in conditions.items():
            attr = getattr(self.db, k, None)
            if not attr:
                # 增加处理日期条件查询，例如 'created_at__gte' 表示 created_at >= v
                # 可以根据需要添加其他操作符，如 'gt', 'lt', 'eq', 'ne' 等
                if '__' in k:
                    field_name, operator = k.split('__')
                    real_attr = getattr(self.db, field_name, None)
                    if not real_attr:
                        continue
                    if operator == 'gte':  # greater than or equal to
                        stmt = stmt.where(real_attr >= v)
                    elif operator == 'lte':  # less than or equal to
                        stmt = stmt.where(real_attr <= v)
                else:
                    continue
            else:
                if type(v) == list and len(v) > 1:
                    clauses = []
                    for u in v:
                        # if u and hasattr(self.db, u):
                        clauses.append(attr == u)
                    if clauses and len(clauses) > 0:
                        stmt = stmt.where(or_(*clauses))
                else:
                    stmt = stmt.where(attr == v)

        if order_by_list and len(order_by_list):
            stmt = self.__add_order_by(stmt, self.db, order_by_list)
        r = await self.db_session.execute(stmt)
        return r.scalars().all()

    async def search(self, **conditions):
        query = conditions.get('query')
        real_time_start = getattr(self.db, 'real_time_start')
        real_time_end = getattr(self.db, 'real_time_end')
        is_delete = getattr(self.db, 'is_delete')
        stmt = select(self.db).where(
            real_time_start.between(query.real_time_start, query.real_time_end),
            real_time_end.between(query.real_time_start, query.real_time_end),
            is_delete != 1
        ).limit(query.limit).offset(query.offset).order_by(getattr(self.db, 'real_time_start').asc())
        r = await self.db_session.execute(stmt)
        return r.scalars().all()


class ExecDAL:
    def __init__(self, db_session):
        self.db_session = db_session
        self.db_exec = None

    def setDb(self, db):
        self.db_exec = DAL(db, self.db_session)

    def get(self, id=None):
        if self.db_exec:
            return self.db_exec.get(id)

    def create(self, obj_in):
        if self.db_exec:
            return self.db_exec.create(obj_in)

    def create_all(self, obj_in_list):
        if self.db_exec:
            return self.db_exec.create_all(obj_in_list)

    def delete(self, id_):
        if self.db_exec:
            return self.db_exec.delete(id_)

    def delete_by(self, **kwargs):
        if self.db_exec:
            return self.db_exec.delete_by(**kwargs)

    def delete_batch(self, ids):
        if self.db_exec:
            return self.db_exec.delete_batch(ids)

    def update(self, id_, obj_in):
        if self.db_exec:
            return self.db_exec.update(id_, obj_in)

    def update_all(self, obj_in):
        if self.db_exec:
            return self.db_exec.update_all(obj_in)

    def list(self, limit=None, offset=None, order_by=None, desc=False):
        if self.db_exec:
            return self.db_exec.list(limit, offset, order_by, desc)

    def get_with_relationship(self, id_, relationship):
        if self.db_exec:
            return self.db_exec.get_with_relationship(id_, relationship)

    def get_by(self, **conditions):
        if self.db_exec:
            return self.db_exec.get_by(**conditions)

    def get_by_all(self, **conditions):
        if self.db_exec:
            return self.db_exec.get_by_all(**conditions)

    def search(self, **conditions):
        if self.db_exec:
            return self.db_exec.search(**conditions)

    def buck_create(self, obj_list):
        if self.db_exec:
            return self.db_exec.buck_create(obj_list)
