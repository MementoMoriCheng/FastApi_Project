#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 17:25
# @Author  : MementoMori
# @File    : sql_handle.py
# @Software: PyCharm
import asyncio
from src.config.setting import settings
from sqlalchemy.exc import SQLAlchemyError
from src.db.config import session
from src.utils.logger import logger
from src.static import column_type, update_column_type
from sqlalchemy import (Column, Integer, MetaData, Table, text,
                        PrimaryKeyConstraint, create_engine, and_, select)
from sqlalchemy.orm import sessionmaker
from src.utils.constant import LOG_RECORDS, GNSS_RECORDS

database_uri = f"{settings.DATABASE_URI}/{settings.DB_NAME}"


class SqlHandle(object):
    def __init__(self):
        self.async_session_factory = session
        self.engine = create_engine(database_uri)
        self.Session = sessionmaker(bind=self.engine, expire_on_commit=True)

        try:
            self.metadata = MetaData()
            self.metadata.reflect(bind=self.engine)
        except:
            pass

    def get_sync_session(self):
        return self.Session()

    def _get_table(self, table_name):
        return Table(table_name, self.metadata, autoload_with=self.engine)

    def _process_condition(self, column, operator, operand):
        """
        处理过滤条件
        Args:
            column:
            operator:
            operand:

        Returns:

        """
        if operator == "includes":
            return column.ilike(f'%{operand}%')
        elif operator == "not_includes":
            return ~column.ilike(f'%{operand}%')
        elif operator == "equal":
            return column == operand
        elif operator == "not_equal":
            return column != operand
        elif operator == "between":
            assert isinstance(operand, tuple) and len(
                operand) == 2, "Between operator requires a tuple with two elements"
            lower_bound, upper_bound = operand
            return column.between(lower_bound, upper_bound)
        elif operator == "gt":
            return column > operand
        elif operator == "lt":
            return column < operand
        elif operator == "startWith":
            return column.startswith(operand)
        elif operator == "not_startWith":
            return ~column.startswith(operand)
        elif operator == "endWidth":  # typo: should be endWith
            return column.endswith(operand)
        elif operator == "not_endWith":
            return ~column.endswith(operand)
        elif operator == "isEmpty":
            return column.is_(None)
        elif operator == "not_isEmpty":
            return column.isnot(None)
        else:
            logger.error(f"Unsupported operator: {operator}")
            raise ValueError(f"Unsupported operator: {operator}")

    async def get_col_type(self, table_name):
        get_col_sql = f"""SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE,
                            COLUMN_KEY, EXTRA FROM information_schema.columns WHERE 
                            TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '{table_name}'; """
        async with self.async_session_factory() as session_exc:
            result = await session_exc.execute(get_col_sql)
            rows = result.fetchall()
            return rows

    async def get_table_info(self, table_name="column_manage"):
        create_table_sql = f'select * from {table_name};'
        async with self.async_session_factory() as session_exc:
            result = await session_exc.execute(create_table_sql)
            rows = result.fetchall()
            return rows

    async def insert(self, table_name, data):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                insert_statement = table.insert().values(**data)
                session.execute(insert_statement)
                session.commit()
        except SQLAlchemyError as e:
            logger.error(f"Insertion error for table {table_name}: {e}")
            session.rollback()
            return

    async def update(self, table_name, conditions, updated_data):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                update_statement = (
                    table.update()
                    .where(and_(*[getattr(table.c, k) == v for k, v in conditions.items()]))
                    .values(**updated_data)
                )
                result = session.execute(update_statement)
                if result.rowcount > 0:
                    session.commit()
        except SQLAlchemyError as e:
            logger.error(f"Update error for table {table_name}: {e}")
            session.rollback()
            return

    async def delete(self, table_name, conditions):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                delete_statement = table.delete().where(
                    and_(*[getattr(table.c, k) == v for k, v in conditions.items()]))
                result = session.execute(delete_statement)
                if result.rowcount > 0:
                    session.commit()
        except SQLAlchemyError as e:
            logger.error(f"Deletion error for table {table_name}: {e}")
            session.rollback()
            return

    async def select(self, table_name, conditions=None, fields=None, order_by=None, limit=None, offset=None):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                columns = []
                if fields:
                    columns = [getattr(table.c, field.code if hasattr(field, 'code') else field) for field in fields]
                    fields = columns
                else:
                    fields = table.columns
                stmt = select(fields)

                if conditions:
                    condition_clauses = []
                    for k, v in conditions.items():
                        if isinstance(v, dict):  # 处理包含操作符的对象
                            value = v["value"]
                            operator = v.get("operator")
                            condition_clauses.append(self._process_condition(getattr(table.c, k), operator, value))
                        else:  # 默认为等于操作
                            condition_clauses.append(getattr(table.c, k) == v)

                    stmt = stmt.where(and_(*condition_clauses))

                if order_by:
                    for field, direction in order_by.items():
                        column = getattr(table.c, field)
                        stmt = stmt.order_by(column.desc() if direction == 'desc' else column)

                if limit is not None and offset is not None:
                    stmt = stmt.limit(limit).offset(offset)

                results = session.execute(stmt)
                column_names = results.keys()
                data = [dict(zip(column_names, row)) for row in results.fetchall()]
                return data
        except Exception as e:
            logger.error(f"Selection error for table {table_name}: {e}")

    @staticmethod
    def create_column(column_name, column_type, primary_key=False):
        """
        定义一个方法用于动态创建列
        Args:
            column_name:
            column_type:
            primary_key:

        Returns:

        """
        if primary_key:
            return Column(column_name, column_type, primary_key=True)
        else:
            return Column(column_name, column_type)

    def create_dynamic_table_core(self, table_name, columns_config, primary_key_column=None):
        """
        创建表
        Args:
            table_name:
            columns_config:
            primary_key_column:

        Returns:

        """
        try:
            columns = [self.create_column(name, type_, name == primary_key_column) for name, type_ in
                       columns_config.items()]
            if primary_key_column:
                pk_constraint = PrimaryKeyConstraint(primary_key_column)
            else:
                id_col = Column('id', Integer, primary_key=True)
                columns.append(id_col)
                pk_constraint = PrimaryKeyConstraint('id')

            dynamic_table = Table(table_name, self.metadata, *columns, extend_existing=True)

            dynamic_table.append_constraint(pk_constraint)

            try:
                self.metadata.create_all(self.engine)
            except SQLAlchemyError as e:
                logger.error(f"An error:{str(e)} occurred while creating the table:{table_name}")
                return
        except Exception as e:
            logger.error(f"An error: {str(e)} occurred while processing the table structure")
            return

    @staticmethod
    def gen_columns_type(columns, types):
        new_column_statements = ', \n'.join(
            [f'ADD COLUMN {column} {column_type.get(type)}' for column, type in zip([columns], [types])])
        return new_column_statements

    def upgrade_columns(self, table_name, columns, types, field_length):
        """
        增加列
        Args:
            table_name:
            columns:
            types:
            field_length:

        Returns:

        """
        update_column_type(field_length)
        new_column_statements = self.gen_columns_type(columns, types)
        alter_table_ddl = f"ALTER TABLE {table_name} {new_column_statements};"
        if_columns_exist_ddl = f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table_name}' AND COLUMN_NAME = '{columns}';"
        alter_table_stmt = text(alter_table_ddl)
        if_columns_exist = text(if_columns_exist_ddl)
        session = self.Session()
        try:
            res = session.execute(if_columns_exist)
            if res.rowcount == 0:
                session.execute(alter_table_stmt)
                session.commit()
        except Exception as e:
            session.rollback()
            logger.error(f"Error occurred while upgrading columns: {str(e)}")
            return
        finally:
            session.close()

    def change_columns(self, table_name, old_column_name, obj_in):
        """
        修改列
        Args:
            table_name:
            old_column_name:
            obj_in:

        Returns:

        """
        update_data = obj_in.dict(exclude_none=True)
        new_column_name = update_data.get("name")
        new_column_type = update_data.get("type")
        is_pk = update_data.get("primary")
        is_empty = update_data.get("empty")
        is_unique = update_data.get("unique")

        column_name = new_column_name if new_column_name else old_column_name

        is_empty_sql = f"ALTER TABLE {table_name} MODIFY {column_name} NOT NULL;"
        unique_sql = f"ALTER TABLE {table_name} ADD UNIQUE ({column_name});"
        pk_sql = f"ALTER TABLE {table_name} ADD PRIMARY KEY ({column_name});"
        rename_sql = f"ALTER TABLE {table_name} RENAME COLUMN {old_column_name} TO {new_column_name};"
        modify_sql = f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type};"

        if new_column_type:
            self.execute_stmt(modify_sql)
        if new_column_name:
            self.execute_stmt(rename_sql)
        if is_pk:
            self.execute_stmt(pk_sql)
        if is_empty:
            self.execute_stmt(is_empty_sql)
        if is_unique:
            self.execute_stmt(unique_sql)

    def add_foreign_key(self, main_table_name, main_column, association):
        relative_column = "id"
        for relative_table_name in association:
            add_foreign_key_sql = f"ALTER TABLE {main_table_name} ADD FOREIGN KEY ({main_column}) REFERENCES {relative_table_name} ({relative_column});"
            self.execute_stmt(add_foreign_key_sql)

    def execute_stmt(self, sql_stmt):
        modify_sql_stmt = text(sql_stmt)
        session = self.Session()
        try:
            session.execute(modify_sql_stmt)
            session.commit()
        except Exception as e:
            session.rollback()
            logger.error(f"Error occurred while execute : {sql_stmt}"
                         f"Error : {str(e)}")
            return
        finally:
            session.close()

    def refresh_metadata(self):
        """
        刷新所有映射到数据库的元数据
        """
        self.metadata.clear()  # 清除原有元数据缓存
        self.metadata.reflect(bind=self.engine)  # 重新反射数据库结构

    async def add_records(self, table_name, records):
        """
        录入数据库
        Args:
            table_name:
            records:
        Returns:

        """
        if table_name == "log_manage":
            LOG_RECORDS.update(records)
            res = await self.insert(table_name, LOG_RECORDS)
        else:
            GNSS_RECORDS.update(records)
            res = await self.insert(table_name, GNSS_RECORDS)
        if not res:
            return False
        return True


sql_handle = SqlHandle()

