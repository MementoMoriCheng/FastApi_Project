import base64
import argparse
import re
import sys
import uuid
import csv
import pymysql
from datetime import datetime
from werkzeug.security import generate_password_hash


def generate_uuid():
    return str(uuid.uuid4()).replace("-", "")


def encrypt_password(raw_password: str) -> str:
    base64_password = base64.b64encode(raw_password.encode()).decode()
    return generate_password_hash(base64_password)


class MySQLManager:
    def __init__(self, host, port, user, password, database):
        self.connection = pymysql.connect(
            host=host,
            port=port,
            user=user,
            password=password,
            database=database,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        self.user_id = None
        self.create_time = None
        self.current_date = None
        self.username = None

    def insert_user_info(self, username, email, pwd):
        """插入用户数据"""
        self.user_id = generate_uuid()
        # 加密密码
        encrypted_password = encrypt_password(pwd)
        now = datetime.now()
        self.create_time = int(now.timestamp() * 1000)  # 本地时间的时间戳（毫秒）
        self.current_date = now.strftime("%Y-%m-%d %H:%M:%S")  # 本地时间格式化

        # 插入用户表
        user_insert_query = """
                            INSERT INTO user (id, create_time, create_date, update_time, update_date, access_token,
                                              nickname, password, email, avatar, language, color_schema, timezone,
                                              last_login_time, is_authenticated, is_active, is_anonymous, login_channel,
                                              status, is_superuser)
                            VALUES (%s, %s, %s, %s, %s, %s,
                                    %s, %s, %s, %s, %s, %s, %s,
                                    %s, %s, %s, %s, %s,
                                    %s, %s) \
                            """
        user_data_tuple = (
            self.user_id, self.create_time, self.current_date, self.create_time, self.current_date, None,  # 使用修改后的时间
            username, encrypted_password, email, None, "Chinese", "Bright", "UTC+8 Asia/Shanghai",
            self.current_date, 1, 1, 0, "password",  # last_login_time 也使用 UTC+8 时间
            1, 0
        )

        with self.connection.cursor() as cursor:
            cursor.execute(user_insert_query, user_data_tuple)
        self.connection.commit()
        print(f"用户数据插入成功: {username}")

    def insert_tenant_info(self, user_count, earliest_tenant=None):
        """插入租户数据"""
        tenant_insert_query = """
                              INSERT INTO tenant (id, create_time, create_date, update_time, update_date, name,
                                                  public_key, llm_id, embd_id, asr_id, img2txt_id, rerank_id, tts_id,
                                                  parser_ids, credit, status)
                              VALUES (%s, %s, %s, %s, %s, %s,
                                      %s, %s, %s, %s, %s, %s, %s,
                                      %s, %s, %s) \
                              """
        if user_count > 0:
            tenant_data = (
                self.user_id, self.create_time, self.current_date, self.create_time, self.current_date,
                self.username + "'s Kingdom",  # 使用修改后的时间
                None, str(earliest_tenant['llm_id']), str(earliest_tenant['embd_id']),
                str(earliest_tenant['asr_id']), str(earliest_tenant['img2txt_id']),
                str(earliest_tenant['rerank_id']), str(earliest_tenant['tts_id']),
                str(earliest_tenant['parser_ids']), str(earliest_tenant['credit']), 1
            )
        else:
            tenant_data = (
                self.user_id, self.create_time, self.current_date, self.create_time, self.current_date,
                self.username + "'s Kingdom",  # 使用修改后的时间
                None, '', '', '', '', '', '',
                '', "1000", 1
            )
        with self.connection.cursor() as cursor:
            cursor.execute(tenant_insert_query, tenant_data)
        self.connection.commit()
        print(f"租户数据插入成功: {self.username}")

    def insert_user_tenant_info(self, user_count, earliest_tenant=None):
        """插入用户租户关系数据"""
        user_tenant_insert_owner_query = """
                                         INSERT INTO user_tenant (id, create_time, create_date, update_time,
                                                                  update_date, user_id,
                                                                  tenant_id, role, invited_by, status)
                                         VALUES (%s, %s, %s, %s, %s, %s,
                                                 %s, %s, %s, %s) \
                                         """
        user_tenant_data_owner = (
            generate_uuid(), self.create_time, self.current_date, self.create_time, self.current_date, self.user_id,
            # 使用修改后的时间
            self.user_id, "owner", self.user_id, 1
        )

        with self.connection.cursor() as cursor:
            cursor.execute(user_tenant_insert_owner_query, user_tenant_data_owner)
            if user_count > 0:
                # 插入用户租户关系表（normal角色）
                user_tenant_insert_normal_query = """
                                                  INSERT INTO user_tenant (id, create_time, create_date, update_time,
                                                                           update_date, user_id,
                                                                           tenant_id, role, invited_by, status)
                                                  VALUES (%s, %s, %s, %s, %s, %s,
                                                          %s, %s, %s, %s) \
                                                  """
                user_tenant_data_normal = (
                    generate_uuid(), self.create_time, self.current_date, self.create_time, self.current_date,
                    self.user_id,  # 使用修改后的时间
                    earliest_tenant['id'], "normal", earliest_tenant['id'], 1
                )
                cursor.execute(user_tenant_insert_normal_query, user_tenant_data_normal)
        self.connection.commit()
        print(f"用户租户关系数据插入成功: {self.username}")

    def insert_tenant_llm_info(self, earliest_user_tenant_llms=None):
        """插入最早用户的所有tenant_llm配置数据"""
        tenant_llm_insert_query = """
                                  INSERT INTO tenant_llm (create_time, create_date, update_time, update_date, tenant_id,
                                                          llm_factory, model_type, llm_name, api_key, api_base,
                                                          max_tokens, used_tokens)
                                  VALUES (%s, %s, %s, %s, %s,
                                          %s, %s, %s, %s, %s, %s, %s) \
                                  """

        # 遍历最早用户的所有tenant_llm配置并复制给新用户
        for tenant_llm in earliest_user_tenant_llms:
            tenant_llm_data = (
                self.create_time, self.current_date, self.create_time, self.current_date, self.user_id,  # 使用修改后的时间
                str(tenant_llm['llm_factory']), str(tenant_llm['model_type']), str(tenant_llm['llm_name']),
                str(tenant_llm['api_key']), str(tenant_llm['api_base']), str(tenant_llm['max_tokens']), 0
            )

            with self.connection.cursor() as cursor:
                cursor.execute(tenant_llm_insert_query, tenant_llm_data)
        self.connection.commit()
        print(f"租户大模型配置数据插入成功: {self.username}")

    def insert_dialog_info(self, earliest_user_dialogs):
        """插入对话应用数据"""
        dialog_insert_query = """
                              INSERT INTO dialog (id, create_time, create_date, update_time, update_date, tenant_id,
                                                  name, description, icon, language, llm_id, llm_setting, prompt_type,
                                                  prompt_config, similarity_threshold, vector_similarity_weight, top_n,
                                                  top_k, do_refer,
                                                  rerank_id, kb_ids, status)
                              VALUES (%s, %s, %s, %s, %s,
                                      %s, %s, %s, %s, %s,
                                      %s, %s, %s, %s, %s,
                                      %s, %s, %s, %s, %s, %s, %s) \
                              """
        # 获取最早用户的dialog配置并复制给新用户
        for earliest_user_dialog in earliest_user_dialogs:
            dialog_id = generate_uuid()
            dialog_data = (
                dialog_id, self.create_time, self.current_date, self.create_time, self.current_date, self.user_id,
                # 使用修改后的时间
                str(earliest_user_dialog['name']), str(earliest_user_dialog['description']),
                str(earliest_user_dialog['icon']),
                str(earliest_user_dialog['language']), str(earliest_user_dialog['llm_id']),
                str(earliest_user_dialog['llm_setting']),
                str(earliest_user_dialog['prompt_type']), str(earliest_user_dialog['prompt_config']),
                str(earliest_user_dialog['similarity_threshold']),
                str(earliest_user_dialog['vector_similarity_weight']), str(earliest_user_dialog['top_n']),
                str(earliest_user_dialog['top_k']),
                str(earliest_user_dialog['do_refer']), str(earliest_user_dialog['rerank_id']),
                str(earliest_user_dialog['kb_ids']),
                str(earliest_user_dialog['status'])
            )

            with self.connection.cursor() as cursor:
                cursor.execute(dialog_insert_query, dialog_data)
        self.connection.commit()
        print(f"对话应用数据插入成功: {self.username}")

    def get_infos(self, table_name, col_name=None, col_value=None):
        """查询表数据"""
        if not re.match(r'^[a-zA-Z0-9_]+$', table_name):
            raise ValueError("Invalid table name")

        with self.connection.cursor() as cursor:
            # 使用反引号包裹表名避免关键字冲突
            if col_name:
                sql = f"SELECT id FROM `{table_name}` WHERE {col_name} = %s"
                cursor.execute(sql, col_value)
            else:
                sql = f"SELECT * FROM `{table_name}`"
                cursor.execute(sql)
            result = cursor.fetchone()
            return result

    def get_users_by_email(self, email):
        """查询已存在的用户"""
        with self.connection.cursor() as cursor:
            sql = "SELECT nickname, email FROM user WHERE email = %s"
            cursor.execute(sql, email)
            result = cursor.fetchall()
            return result

    def get_dialog_settings(self, filter_ids):
        """查询dialog表的id和tenant_id字段"""
        with self.connection.cursor() as cursor:
            query_dialog = " SELECT id, tenant_id FROM dialog "
            cursor.execute(query_dialog)
            dialog_infos = cursor.fetchall()
        dialog_ids, tenant_ids = set(), set()
        for term in dialog_infos:
            if term["tenant_id"] in filter_ids:
                continue
            dialog_ids.add(term["id"])
            tenant_ids.add(term["tenant_id"])
        return dialog_ids, tenant_ids

    def get_first_user(self):
        """查询第一个用户"""
        with self.connection.cursor() as cursor:
            check_users_query = "SELECT COUNT(*) as user_count FROM user"
            cursor.execute(check_users_query)
            user_count = cursor.fetchone()['user_count']
            if user_count > 0:
                # 查询最早创建的tenant配置
                query_earliest_tenant = """
                                        SELECT id,
                                               llm_id,
                                               embd_id,
                                               asr_id,
                                               img2txt_id,
                                               rerank_id,
                                               tts_id,
                                               parser_ids,
                                               credit
                                        FROM tenant
                                        WHERE create_time = (SELECT MIN(create_time) FROM tenant) LIMIT 1 \
                                        """
                cursor.execute(query_earliest_tenant)
                earliest_tenant = cursor.fetchone()

                # 查询最早创建的用户ID
                query_earliest_user = """
                                      SELECT id
                                      FROM user
                                      WHERE create_time = (SELECT MIN(create_time) FROM user) LIMIT 1 \
                                      """
                cursor.execute(query_earliest_user)
                earliest_user = cursor.fetchone()

                # 查询最早用户的所有tenant_llm配置
                query_earliest_user_tenant_llms = """
                                                  SELECT llm_factory,
                                                         model_type,
                                                         llm_name,
                                                         api_key,
                                                         api_base,
                                                         max_tokens,
                                                         used_tokens
                                                  FROM tenant_llm
                                                  WHERE tenant_id = %s \
                                                  """
                cursor.execute(query_earliest_user_tenant_llms, (earliest_user['id'],))
                earliest_user_tenant_llms = cursor.fetchall()

                # 查询最早用户的dialog配置
                query_earliest_user_dialog = """
                                             SELECT name,
                                                    description,
                                                    icon, language, llm_id, llm_setting, prompt_type, prompt_config, similarity_threshold, vector_similarity_weight, top_n, top_k, do_refer, rerank_id, kb_ids, status, create_time, create_date, update_time, update_date
                                             FROM dialog
                                             WHERE tenant_id = %s \
                                             """
                cursor.execute(query_earliest_user_dialog, (earliest_user['id'],))
                earliest_user_dialog = cursor.fetchall()

            return user_count, earliest_tenant, earliest_user_tenant_llms, earliest_user_dialog

    def insert_data_according_process(self, username, email, pwd):
        self.username = username
        user_count, earliest_tenant, earliest_user_tenant_llms, earliest_user_dialog = self.get_first_user()

        self.insert_user_info(username, email, pwd)

        self.insert_tenant_info(user_count, earliest_tenant)

        self.insert_user_tenant_info(user_count, earliest_tenant)

        if user_count > 0:
            self.insert_tenant_llm_info(earliest_user_tenant_llms)
            self.insert_dialog_info(earliest_user_dialog)

    def delete_infos(self, table_name, column, ids):
        """
        批量删除
        """
        if not ids:
            print("警告：没有提供要删除的信息")
            return

        try:
            with self.connection.cursor() as cursor:
                # 创建占位符字符串：%s, %s, %s...
                placeholders = ', '.join(['%s'] * len(ids))

                # 构建SQL语句
                sql = f"DELETE FROM `{table_name}` WHERE {column} IN ({placeholders})"

                # 执行删除
                cursor.execute(sql, tuple(ids))
                deleted_count = cursor.rowcount

                self.connection.commit()
                print(f"成功删除 {deleted_count} : {ids}")
                return deleted_count

        except pymysql.Error as e:
            print(f"删除时出错: {e}")
            self.connection.rollback()
            return 0

    def init_tables(self, nickname):
        """恢复user等表初始状态"""
        try:
            admin_id = self.get_infos("user", col_name="nickname", col_value=nickname)[0].get("id")
            filter_ids = set()
            filter_ids.add(admin_id)
            dialog_ids, tenant_ids = self.get_dialog_settings(filter_ids)
            self.delete_infos("user", "id", tenant_ids)
            self.delete_infos("tenant", "id", tenant_ids)
            self.delete_infos("user_tenant", "user_id", tenant_ids)
            self.delete_infos("tenant_llm", "tenant_id", tenant_ids)

            self.delete_infos("dialog", "tenant_id", tenant_ids)
            self.delete_infos("conversation", "dialog_id", dialog_ids)
            print(f"恢复user等表初始状成功")
        except pymysql.Error as e:
            print(f"恢复user等表初始状态时出错: {e}")
            self.connection.rollback()
            return 0

    def update_dialog_settings(self):
        """更新dialog配置"""
        _, earliest_tenant, _, earliest_user_dialogs = self.get_first_user()
        # 查询dialog
        filter_ids = set()
        filter_ids.add(earliest_tenant["id"])
        dialog_ids, tenant_ids = self.get_dialog_settings(filter_ids)
        self.delete_infos("dialog", "tenant_id", tenant_ids)
        self.delete_infos("conversation", "dialog_id", dialog_ids)
        for tenant_id in tenant_ids:
            dialog_insert_query = """
                                  INSERT INTO dialog (id, create_time, create_date, update_time, update_date, tenant_id,
                                                      name, description, icon, language, llm_id, llm_setting,
                                                      prompt_type,
                                                      prompt_config, similarity_threshold, vector_similarity_weight,
                                                      top_n, top_k, do_refer,
                                                      rerank_id, kb_ids, status)
                                  VALUES (%s, %s, %s, %s, %s,
                                          %s, %s, %s, %s, %s,
                                          %s, %s, %s, %s, %s,
                                          %s, %s, %s, %s, %s, %s, %s) \
                                  """
            # 获取最早用户的dialog配置并复制给新用户
            for earliest_user_dialog in earliest_user_dialogs:
                dialog_id = generate_uuid()
                now = datetime.now()
                update_time = int(now.timestamp() * 1000)  # 本地时间的时间戳（毫秒）
                update_date = now.strftime("%Y-%m-%d %H:%M:%S")  # 本地时间格式化
                dialog_data = (
                    dialog_id, earliest_user_dialog['create_time'], earliest_user_dialog['create_date'],
                    update_time, update_date, tenant_id,
                    # 使用修改后的时间
                    str(earliest_user_dialog['name']), str(earliest_user_dialog['description']),
                    str(earliest_user_dialog['icon']),
                    str(earliest_user_dialog['language']), str(earliest_user_dialog['llm_id']),
                    str(earliest_user_dialog['llm_setting']),
                    str(earliest_user_dialog['prompt_type']), str(earliest_user_dialog['prompt_config']),
                    str(earliest_user_dialog['similarity_threshold']),
                    str(earliest_user_dialog['vector_similarity_weight']), str(earliest_user_dialog['top_n']),
                    str(earliest_user_dialog['top_k']),
                    str(earliest_user_dialog['do_refer']), str(earliest_user_dialog['rerank_id']),
                    str(earliest_user_dialog['kb_ids']),
                    str(earliest_user_dialog['status'])
                )

                with self.connection.cursor() as cursor:
                    cursor.execute(dialog_insert_query, dialog_data)
        self.connection.commit()

    def close(self):
        """关闭数据库连接"""
        self.connection.close()
        print("数据库连接已关闭")


def read_csv_content(file_path, as_dict=False):
    """
    读取CSV文件内容，跳过表头，返回每一行的数据。
    """
    try:
        with open(file_path, mode='r', encoding='utf-8') as csvfile:
            if as_dict:
                reader = csv.DictReader(csvfile)
            else:
                reader = csv.reader(csvfile)
                next(reader)  # 跳过表头

            for row in reader:
                yield row

    except FileNotFoundError:
        print(f"错误：文件未找到 - {file_path}")
    except Exception as e:
        print(f"读取文件时发生错误：{e}")


def add_users(manager, file_path=None, only_user=False):
    try:
        for row in read_csv_content(file_path, as_dict=True):
            print(row)
            user = manager.get_users_by_email(row["email"])
            if len(user) > 0:
                continue
            if only_user:
                manager.insert_user_info(row["name"], row["email"], row["pwd"])
            else:
                manager.insert_data_according_process(row["name"], row["email"], row["pwd"])
    finally:
        # 关闭连接
        manager.close()


def update_dialog(manager):
    try:
        manager.update_dialog_settings()
    finally:
        # 关闭连接
        manager.close()


if __name__ == "__main__":
    config = {
        # 'host': 'localhost',
        # 'port': 3306,
        # 'password': '123456',
        # 'database': 'ragflow-plus',

        'host': '10.200.16.1',
        'port': 5455,
        'password': 'sinexcel_2025',
        'database': 'rag_flow',

        'user': 'root',

    }
    manager = MySQLManager(**config)
    # 测试连接
    # res = manager.get_infos("user")
    # print(res)
    #
    # # 恢复初始（只保留管理员配置）
    # # manager.init_tables("孙晴")
    #
    # 批量添加成员账号
    # add_users(manager, file_path='./RAGflow_member.csv')

    # 批量添加用户
    # add_users(manager, file_path='./RAGflow_member.csv', only_user=True)
    #
    # # 更新对话配置
    # # update_dialog(manager)
    #
    # 设置命令行参数解析
    parser = argparse.ArgumentParser(
        description='数据库管理工具',
        formatter_class=argparse.RawTextHelpFormatter
    )

    # 子命令设置
    subparsers = parser.add_subparsers(dest='command', title='可用命令', required=True)

    # test_connection 命令
    test_parser = subparsers.add_parser('test', help='测试数据库连接')

    # init_tables 命令
    init_parser = subparsers.add_parser('init', help='初始化数据库表')
    init_parser.add_argument('admin', help='管理员名称')

    # add_users 命令
    adduser_parser = subparsers.add_parser('add-users', help='批量添加用户')
    adduser_parser.add_argument('file', help='CSV文件路径')
    # adduser_parser.add_argument('only_user', help='只增加用户user')

    # update_dialog 命令
    update_parser = subparsers.add_parser('update-dialog', help='更新对话配置')

    # 解析参数
    args = parser.parse_args()
    try:

        # 根据命令执行操作
        if args.command == 'test':
            res = manager.get_infos("user")
            print(res)

        elif args.command == 'init':
            manager.init_tables(args.admin)

        elif args.command == 'add-users':
            add_users(manager, args.file)

        elif args.command == 'update-dialog':
            update_dialog(manager)

    except Exception as e:
        print(f"操作失败: {str(e)}")
        sys.exit(1)
