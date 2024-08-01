#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/1/16 17:25
# @Author  : MementoMori
# @File    : sql_handle.py
# @Software: PyCharm
from src.db.config import session
from src.utils.logger import logger
from src.config.setting import settings
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError
from src.static import column_type, update_column_type
from sqlalchemy import (Column, MetaData, Table, text, String,
                        PrimaryKeyConstraint, create_engine, and_, select, inspect)
from src.utils.constant import LOG_RECORDS, GNSS_RECORDS, FLIGHT_DATA, FLIGHT_ALARM

database_uri = f"{settings.DATABASE_URI}/{settings.DB_NAME}"


class SqlHandle(object):
    def __init__(self):
        self.async_session_factory = session
        self.engine = create_engine(database_uri)
        self.Session = sessionmaker(bind=self.engine, expire_on_commit=True)

        try:
            self.metadata = MetaData()
            self.metadata.reflect(bind=self.engine)
        except Exception as err:
            logger.error(err)

    def get_sync_session(self):
        return self.Session()

    def _get_table(self, table_name):
        return Table(table_name, self.metadata, autoload_with=self.engine)

    @staticmethod
    def _process_condition(column, operator, operand):
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
        elif operator == "gte":
            return column >= operand
        elif operator == "lte":
            return column <= operand
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
        elif operator == "in":
            if isinstance(operand, list) or isinstance(operand, tuple):
                return column.in_(operand)
            else:
                logger.error(f"In operator requires a list or tuple operand, but got {type(operand)}")
                raise ValueError(f"In operator requires a list or tuple operand, but got {type(operand)}")
        else:
            logger.error(f"Unsupported operator: {operator}")
            raise ValueError(f"Unsupported operator: {operator}")

    async def get_primary_key(self, table_name):
        get_col_sql = f"""SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE,
                            COLUMN_KEY, EXTRA FROM information_schema.columns WHERE 
                            TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '{table_name}' AND COLUMN_KEY = 'PRI'; """
        async with self.async_session_factory() as session_exc:
            result = await session_exc.execute(get_col_sql)
            primary_key_columns = result.fetchall()
            return primary_key_columns

    async def get_unique_dates(self, table_name):
        get_unique_dates_sql = f"""SELECT DISTINCT DATE(flight_time) FROM '{table_name}';"""
        async with self.async_session_factory() as session_exc:
            result = await session_exc.execute(get_unique_dates_sql)
            unique_dates = result.fetchall()
            return unique_dates

    async def get_table_columns(self, table_name):
        result = {}
        table = self._get_table(table_name)
        columns = [column.name for column in table.columns]
        for column in columns:
            result[column] = None
        return result

    async def batch_insert(self, table_name, data_list):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                for data in data_list:
                    insert_statement = table.insert().values(**data)
                    session.execute(insert_statement)
                session.commit()

        except SQLAlchemyError as e:
            logger.error(f"Batch Insertion error for table {table_name}: {e}")
            session.rollback()
            raise e

    async def insert_only(self, table_name, data):
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                insert_statement = table.insert().values(**data)
                session.execute(insert_statement)
                session.commit()

        except SQLAlchemyError as e:
            logger.error(f"Insertion error for table {table_name}: {e}")
            session.rollback()
            raise e

    async def insert(self, table_name, data):
        try:
            await self.insert_only(table_name, data)
            inserted_data_id = await self.select(table_name, conditions=data, fields=['id'])
            return inserted_data_id
        except SQLAlchemyError as e:
            raise e

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
            raise e

    async def batch_update(self, table_name, conditions_list, updated_data_list):
        """
        批量更新表中的数据
        Args:
            table_name: 表名
            conditions_list: 条件列表，每个元素是一个字典，表示一个更新条件
            updated_data_list: 更新数据列表，每个元素是一个字典，表示要更新的字段及其新值

        Returns:

        """
        try:
            with self.get_sync_session() as session:
                table = self._get_table(table_name)
                # 遍历条件和更新数据的列表，执行逐个更新
                for conditions, update_values in zip(conditions_list, updated_data_list):
                    condition_clause = and_(*[getattr(table.c, k) == v for k, v in conditions.items()])
                    # 构造针对当前条件的更新值
                    session.query(table).filter(condition_clause).update(update_values, synchronize_session=False)
                session.commit()
                logger.info(f"Successfully batch updated rows in table {table_name}.")
        except SQLAlchemyError as e:
            logger.error(f"Batch update error for table {table_name}: {e}")
            session.rollback()
            raise e
        except Exception as e:
            logger.error(f"An unexpected error occurred during batch update: {e}")
            session.rollback()
            raise e

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
                if fields:
                    try:
                        columns = []
                        for field in fields:
                            try:
                                column = getattr(table.c, field)
                                columns.append(column)
                            except AttributeError as err:
                                logger.warning(f"Invalid column '{field}' for table {table_name}: {err}")
                                continue
                        fields = columns
                    except TypeError as err:
                        logger.warning(f"Invalid fields type for table {table_name}: {err}. Defaulting to all columns.")
                        fields = table.columns
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
                        stmt = stmt.order_by(column.desc() if direction else column)

                if offset:
                    stmt = stmt.offset(offset)
                if limit:
                    stmt = stmt.limit(limit)

                results = session.execute(stmt)
                column_names = results.keys()
                data = [dict(zip(column_names, row)) for row in results.fetchall()]
                return data
        except Exception as e:
            logger.error(f"Selection error for table {table_name}: {e}")

    @staticmethod
    def create_column(column_name, column_type, primary_key=False, nullable=True, unique=False):
        """
        定义一个方法用于动态创建列
        Args:
            column_name: 列名
            column_type: 列类型
            primary_key: 是否为主键，默认为False
            nullable: 是否允许为空，默认为True
            unique: 是否唯一，默认为False

        Returns:

        """
        kwargs = {'primary_key': primary_key,
                  'nullable': nullable,
                  'unique': unique}

        return Column(column_name, column_type, **kwargs)

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
            columns = [self.create_column(name, type_, name == primary_key_column) for
                       name, type_ in columns_config.items()]
            if primary_key_column:
                pk_constraint = PrimaryKeyConstraint(primary_key_column)
            else:
                id_col = Column('id', String(36), primary_key=True)
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

    def drop_table(self, table_name):
        """
        删除表
        Args:
            table_name:

        Returns:

        """
        try:
            # Get the table object
            table = Table(table_name, self.metadata, autoload_with=self.engine)

            # Check if the table exists before attempting to drop it
            inspector = inspect(self.engine)
            if not inspector.has_table(table_name):
                logger.warning(f"Table '{table_name}' does not exist.")
                return False

            table.drop(self.engine)
            logger.info(f"Table '{table_name}' dropped successfully.")
            return True
        except SQLAlchemyError as e:
            logger.error(f"Failed to drop table '{table_name}': {str(e)}")
            return False

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
            raise e
        finally:
            session.close()

    def downgrade_columns(self, table_name, columns):
        """
        删除列
        Args:
            table_name:
            columns:

        Returns:

        """
        inspector = inspect(self.engine)
        table_columns = inspector.get_columns(table_name)
        existing_columns = {col['name'] for col in table_columns}
        foreign_keys = inspector.get_foreign_keys(table_name)

        for column_name in columns:
            if column_name in existing_columns:

                fk_to_drop = [fk for fk in foreign_keys if fk['constrained_columns'][0] == column_name]
                for fk in fk_to_drop:
                    fk_name = fk['name']
                    fk_drop_sql = f"ALTER TABLE {table_name} DROP FOREIGN KEY {fk_name};"
                    self.execute_stmt(fk_drop_sql)
                    logger.warning(f"foreign key'{fk_name}'is removed from'{table_name}'")

                drop_column_sql = f"ALTER TABLE {table_name} DROP COLUMN {column_name};"
                self.execute_stmt(drop_column_sql)
                logger.warning(f"column'{column_name}'is removed from'{table_name}'")
                existing_columns.remove(column_name)
            else:
                logger.error(f"column'{column_name}'is not in '{table_name}'")

    async def change_columns(self, table_name, old_column_name, obj_in):
        """
        修改列
        Args:
            table_name:
            old_column_name:
            obj_in:
        Returns:

        """
        update_data = obj_in.dict(exclude_none=True)
        new_column_name = update_data.get("code")
        if obj_in.type == "file":
            new_column_type = column_type.get(obj_in.type)
        else:
            new_column_type = update_data.get("type")
        is_pk = update_data.get("primary")
        is_empty = update_data.get("empty")
        is_unique = update_data.get("unique")
        varchar_len = update_data.get("field_length")

        column_name = new_column_name if new_column_name else old_column_name

        if new_column_type:
            modify_sql = f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type}({varchar_len});" if varchar_len \
                else f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type};"
            self.execute_stmt(modify_sql)
        if new_column_name:
            rename_sql = f"ALTER TABLE {table_name} RENAME COLUMN {old_column_name} TO {new_column_name};"
            self.execute_stmt(rename_sql)
        if is_pk:
            pk_info = await self.get_primary_key(table_name)
            if pk_info:
                pk_name, pk_type, pk_length = pk_info[0][0], pk_info[0][1], pk_info[0][2]
                drop_pk_sql = f"ALTER TABLE {table_name} DROP PRIMARY KEY;"
                drop_pk_increment_sql = f"ALTER TABLE {table_name} MODIFY COLUMN {pk_name} {pk_type} ({pk_length});" \
                    if pk_length else f"ALTER TABLE {table_name} MODIFY COLUMN {pk_name} {pk_type};"
                self.execute_stmt(drop_pk_increment_sql)
                self.execute_stmt(drop_pk_sql)

            pk_sql = f"ALTER TABLE {table_name} ADD PRIMARY KEY ({column_name});"
            self.execute_stmt(pk_sql)

        if not is_empty:
            is_empty_sql = f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type}({varchar_len}) NOT NULL;" \
                if varchar_len else f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type} NOT NULL;"
            self.execute_stmt(is_empty_sql)
        if is_empty:
            empty_sql = f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type}({varchar_len}) NULL;" \
                if varchar_len else f"ALTER TABLE {table_name} MODIFY {column_name} {new_column_type} NULL;"
            self.execute_stmt(empty_sql)
        if is_unique:
            unique_sql = f"ALTER TABLE {table_name} ADD UNIQUE ({column_name});"
            self.execute_stmt(unique_sql)

    def add_foreign_key(self, main_table_name, main_column, association):
        for relative_table_info in association:
            multiple = relative_table_info.get("multiple")  # 是否支持多选
            if multiple:
                relative_intermediate_table_name = "intermediate_table"
                correlation_id = "correlation_id"
                add_correlation_index_sql = f"ALTER TABLE {relative_intermediate_table_name} ADD INDEX ({correlation_id});"
                self.execute_stmt(add_correlation_index_sql)
                add_correlation_foreign_key_sql = f"ALTER TABLE {main_table_name} ADD FOREIGN KEY ({main_column}) REFERENCES {relative_intermediate_table_name} ({correlation_id});"
                self.execute_stmt(add_correlation_foreign_key_sql)
            else:
                relative_table_name = "auto_" + relative_table_info.get("tableCode")
                relative_column = 'id'
                add_index_sql = f"ALTER TABLE {relative_table_name} ADD INDEX ({relative_column});"
                self.execute_stmt(add_index_sql)
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
            raise e
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
        try:
            if table_name == "log_manage":
                LOG_RECORDS.update(records)
                await self.insert_only(table_name, LOG_RECORDS)
            elif table_name == "gnss_data":
                GNSS_RECORDS.update(records)
                await self.insert_only(table_name, GNSS_RECORDS)
            elif table_name == "flight_data":
                FLIGHT_DATA.update(records)
                await self.insert_only(table_name, FLIGHT_DATA)
            elif table_name == "flight_alarm":
                FLIGHT_ALARM.update(records)
                await self.insert_only(table_name, FLIGHT_ALARM)
        except Exception as e:
            logger.error(f"{e}")


sql_handle = SqlHandle()
