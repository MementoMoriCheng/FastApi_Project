#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 17:25
# @Author  : MementoMori
# @File    : sql_handle.py
# @Software: PyCharm
import asyncio
import random
import traceback
# from src.config.setting import settings
from sqlalchemy.exc import SQLAlchemyError
from src.db.config import session
from src.utils.logger import logger
from src.static import column_type
from sqlalchemy import (Column, Integer, String, Date, MetaData, Table, text,
                        PrimaryKeyConstraint, create_engine, and_, select)
from sqlalchemy.orm import sessionmaker

# database_uri = f"{settings.DATABASE_URI}/{settings.DB_NAME}"
# database_uri = "mysql+pymysql://root:123456@localhost:3306/flyingTrainingDB"
database_uri = "mysql+pymysql://root:123456@localhost:3306/flight_test"
metadata = MetaData()


class SqlHandle(object):

    def __init__(self):
        self.async_session_factory = session
        self.engine = create_engine(database_uri)
        self.Session = sessionmaker(bind=self.engine)
        metadata.bind = self.engine

    def get_sync_session(self):
        return self.Session()

    def _get_table(self, table_name):
        return Table(table_name, metadata, autoload_with=self.engine)

    def _process_condition(self, column, operator, operand):
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
            print(traceback.print_exc())
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
            print(traceback.print_exc())
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
            print(traceback.print_exc())
            return

    async def select(self, table_name, conditions=None, fields=None, order_by=None, limit=None, offset=None):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                fields = [getattr(table.c, field) for field in fields] if fields else table.columns
                stmt = select(fields)

                if conditions:
                    condition_clauses = []
                    for k, v in conditions.items():
                        if isinstance(v, dict):  # 处理包含操作符的对象
                            operator = v["value"]
                            operand = v.get("operand")
                            condition_clauses.append(self._process_condition(getattr(table.c, k), operator, operand))
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
        except SQLAlchemyError as e:
            logger.error(f"Selection error for table {table_name}: {e}")
            return []

    @staticmethod
    def create_column(column_name, column_type, primary_key=False):
        """
        定义一个方法用于动态创建列
        """
        if primary_key:
            return Column(column_name, column_type, primary_key=True)
        else:
            return Column(column_name, column_type)

    def create_dynamic_table_core(self, table_name, columns_config, primary_key_column=None):
        try:
            columns = [self.create_column(name, type_, name == primary_key_column) for name, type_ in
                       columns_config.items()]
            if primary_key_column:
                pk_constraint = PrimaryKeyConstraint(primary_key_column)
            else:
                # 假设没有指定主键，则默认添加一个名为'id'的Integer类型主键列
                id_col = Column('id', Integer, primary_key=True)
                columns.append(id_col)
                pk_constraint = PrimaryKeyConstraint('id')

            dynamic_table = Table(table_name, metadata, *columns, extend_existing=True)

            dynamic_table.append_constraint(pk_constraint)

            try:
                metadata.create_all(self.engine)
            except SQLAlchemyError as e:
                logger.error(f"创建表 {table_name} 时发生错误: {str(e)}")
                print(traceback.print_exc())
                return
        except Exception as e:
            logger.error(f"处理表结构配置时发生错误: {str(e)}")
            print(traceback.print_exc())
            return

    @staticmethod
    def gen_columns_type(columns, types):
        new_column_statements = ', \n'.join(
            [f'ADD COLUMN {column} {column_type.get(type)}' for column, type in zip([columns], [types])])
        return new_column_statements

    def upgrade_columns(self, table_name, columns, types):
        """
        增加列
        """
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
            print(traceback.print_exc())
            return
        finally:
            session.close()

    def downgrade_columns(self, table_name, columns):
        """
        删除列
        """
        exclude_columns = tuple(columns) if len(columns) > 1 else tuple(columns) + ('',)

        columns_query = f"""
                SELECT COLUMN_NAME
                FROM information_schema.columns
                WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '{table_name}' AND COLUMN_NAME NOT IN {exclude_columns}
            """
        columns_result = session.execute(columns_query)
        select_columns = ', '.join(row[0] for row in columns_result)
        query = f"SELECT {select_columns} FROM {table_name}"

        result = session.execute(query)
        for row in result:
            print(row)

    def change_columns(self, table_name, old_column_name, obj_in):
        """
        修改列
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
            print(traceback.print_exc())
            return
        finally:
            session.close()


sql_handle = SqlHandle()

if __name__ == "__main__":
    sql_handle = SqlHandle()
    # asyncio.run(sql_handle.get_table_info("table_test"))
    # asyncio.run(sql_handle.get_col_type("table_manage"))
    # sql_handle.get_tables()
    # sql_handle.upgrade_columns('airforce', 'worker2', "str 64")
    # association = [
    #     {
    #         "mainTableCode": "courses",
    #         "mainColumnCode": "student_id",
    #         "relativeTableId": "students",
    #         "relativeColumnCode": "id"
    #     },
    # {
    #     "mainTableCode": "myplane",
    #     "mainColumnCode": "planecode",
    #     "relativeTableId": "myairforce",
    #     "relativeColumnCode": "id"
    # }
    # ]
    # sql_handle.add_foreign_key(association)

    # 示例使用
    # table_name = "airforce"
    # columns_config = {
    #     'item': String(255),
    #     'date': Date,
    #     'id': Integer,
    #     'description': String(1000)
    # }
    # sql_handle.create_dynamic_table_core(table_name, columns_config)

    # sql_handle.get_col_type('table_test')
    # sql_handle.downgrade_columns('table_test', ['salary2', 'salary3'])
    # update_data = {
    #     "name": "actor",
    #     "parent": "0f525cf1-510e-4c74-a80c-d2325844072a",
    #     "type": "text",
    #     "primary": True,
    #     "unique": True,
    #     "empty": True,
    #     "description": "test",
    #     "association": [
    #         {
    #             "sourceTableId": "0bca29b5-0e12-43fb-b40b-a80fd79af378",
    #             "sourceColumnId": "0f525cf1-510e-4c74-a80c-d2325844072a",
    #             "targetTableId": "1809518b-4149-4cb5-9091-57c9fadd6fc4",
    #             "targetColumnId": "fa06d068-38d7-44f2-b1b7-64474d752d32"
    #         }
    #     ],
    #     "update_user": "sysadmin"
    # }
    # sql_handle.change_columns('airforce', 'worker2', update_data,
    #                           )
    # 查询 "airforce" 表中的记录
    # select_conditions = {"id": 1}
    # # selected_records = sql_handle.select("table_manage")
    # selected_records = asyncio.run(sql_handle.select("table_manage"))
    # print(selected_records)

    # insert_data = {"item": "newuser1", "id": 2, "worker1": "tom"}
    # asyncio.run(sql_handle.insert("airforce", insert_data))

    # 更新 "airforce" 表中的记录
    # update_conditions = {"item": "newuser"}
    # updated_data = {"worker2": "newuser_new@example.com"}
    # asyncio.run(sql_handle.update("airforce", update_conditions, updated_data))

    # 删除 "users" 表中的记录
    # delete_conditions = {"item": "newuser"}
    # asyncio.run(sql_handle.delete("airforce", delete_conditions))
    from pprint import pprint
    #
    # conditions = {
    #     "username": "李狗蛋111",
    #     "password": "123456111",
    #     "role_id": "aef8ea2d-c768-48d5-905e-2997de8ec35f",
    #     "system_id": [
    #         "admin-sys111"
    #     ]
    # }
    # conditions = {"id": "1c9d2da3-6ca0-464d-a8fe-affae6473c3e"}
    # data = asyncio.run(sql_handle.insert("users", conditions))
    # pprint(data)
    from src.utils import generate_uuid
    from datetime import datetime
    import json

    # conditions = {
    #     "id": "",
    #     "lesson_name": "软考",
    #     "lesson_chapter": "软考",
    #     "knowledge_points": "string",
    #     "question": "string",
    #     "analysis": "string",
    #     "level_choices": random.randint(1, 5),
    #     "options": "string",
    #     "right_answer": "string",
    #     "score": random.choice([2, 5, 10]),
    #     "type": random.randint(1, 5),
    #     "is_delete": 0,
    #     "status": 0,
    #     "created_user": "sysadmin",
    #     "created_at": datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
    # }
    # src_path = "D:\\File\\questions.txt"
    # q_list = []
    # with open(src_path, "r", encoding='utf-8') as f:
    #     binary_content = f.read().split('\n')
    #     for con in binary_content:
    #         if con:
    #             q = con.split('##')
    #             conditions.update(id=generate_uuid(), question=q[0], analysis=q[3], options=q[1], right_answer=q[2])
    #             asyncio.run(sql_handle.insert("questions", conditions))
    #             q_list.append(copy.copy(conditions))
    # pprint(q_list)

    src_path = "D:\\File\\Variflight_CZ3655_20240409.json"
    with open(src_path, "r") as file:
        data = json.load(file)

    gnss_data = {
        'id': '',
        'sync_code1': [0],
        'sync_code2': [1],
        'sync_code3': [2],
        'identify_code': [3],
        'gps_week': [4],
        'gps_milliseconds': [5],
        'latitude': [6],
        'longitude': [7],
        'altitude': [8],
        'latitude_stddev': [9],
        'longitude_stddev': [10],
        'altitude_stddev': [11],
        'horizon_speed': [12],
        'upward_speed': [13],
        'track_direction': [14],
        'positioning_status_satellite_count': [15],
        'solution_satellite_count': [16],
        'differential_age': [17],
        'azimuth': [18],
        'pitch': [19],
        'checksum': [20],
        'is_delete': 0,
        'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }

    for con in data:
        gnss_data.update(id=generate_uuid(), identify_code=int(con['fnum']), latitude=con['latitude'], longitude=con['longitude'],
                         azimuth=con['angle'], altitude=con['height'], horizon_speed=con['speed'])
        # print(con)
        # print(gnss_data)
        asyncio.run(sql_handle.insert("gnss_data", gnss_data))