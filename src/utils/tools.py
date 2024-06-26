#!/usr/bin/python
# -*- coding: utf-8 -*-
# @Time    : 2024/03/15
# @Author  : MementoMori
# @File    : tools.py
# @Software: PyCharm
# @desc    : 工具类
import base64
import os
import random
import re
import shutil
import string
import socket
import ipaddress
import subprocess
import time
import traceback
from typing import List, Union

import psutil
import pymysql

from src.config.setting import settings
from src.db.init_db import drop_all_table
from src.utils.ftp_util import RemoteFTPService

from src.utils.constant import NETWORK_CARD_NAME
from src.utils.logger import logger
from src.utils.responses import resp_500


def filter_dict(dict_data):
    """
    从字典中剔除值为空（包括None、空字符串、空列表等被认为是“空”的值）的键值对, 但不剔除布尔值False
    Args:
        dict_data:

    Returns:

    """
    return {k: v for k, v in dict_data.items() if v or v is False}


def filter_list(list_data):
    """
    从列表中剔除值为空（包括None、空字符串、空列表等被认为是“空”的值）值
    Args:
        list_data:

    Returns:

    """
    return [v for v in list_data if v]


def test_password(password: str) -> Union[str, bool]:
    """
    检测密码强度
    """
    if len(password) < 8 or len(password) > 16:
        return '长度需为8-16个字符,请重新输入。'
    else:
        for i in password:
            if 0x4e00 <= ord(i) <= 0x9fa5 or ord(i) == 0x20:  # Ox4e00等十六进制数分别为中文字符和空格的Unicode编码
                return '不能使用空格、中文，请重新输入。'
        else:
            key = 0
            key += 1 if bool(re.search(r'\d', password)) else 0
            key += 1 if bool(re.search(r'[A-Za-z]', password)) else 0
            key += 1 if bool(re.search(r"\W", password)) else 0
            if key >= 2:
                return True
            else:
                return '至少含数字/字母/字符2种组合，请重新输入。'


def is_file_larger_than_200mb(file_path):
    """

    Args:
        file_path:

    Returns:

    """
    file_size_in_bytes = os.path.getsize(file_path)
    file_size_in_mb = file_size_in_bytes / (1024 * 1024)

    if file_size_in_mb > 200:
        return True
    else:
        return False


def list_dict_find(options: List[dict], key: str, value: any) -> Union[dict, None]:
    """
    字典列表查找
    """
    return next((item for item in options if item.get(key) == value), None)


def generate_string(length: int = 8) -> str:
    """

    Args:
        length:

    Returns:

    """
    return ''.join(random.sample(string.ascii_letters + string.digits, length))


def get_current_server_ip():
    """
    获取当前服务器的ip
    Returns:

    """
    # 获取主机名
    hostname = socket.gethostname()

    # 获取所有IP地址
    try:
        all_ips = socket.gethostbyname_ex(hostname)[-1]
    except socket.gaierror:
        logger.error("Failed to resolve hostname to IP.")
        return False

    real_net_ips = []
    for item in all_ips:
        name = find_adapter_by_ip(item)
        if name.lower() in NETWORK_CARD_NAME:
            continue
        real_net_ips.append(item)

    # 筛选出IPv4地址，并尝试找到第一个非私有的IP地址
    public_ips = [ip for ip in real_net_ips if ipaddress.ip_address(ip).version == 4]
    non_private_ips = [ip for ip in public_ips if not ipaddress.ip_address(ip).is_private]

    # 如果有非私有IP地址，则返回第一个；否则返回任意一个IPv4地址
    return non_private_ips[0] if non_private_ips else public_ips[0]


def find_adapter_by_ip(ip):
    for adapter_name, addrs in psutil.net_if_addrs().items():
        for addr in addrs:
            if hasattr(addr, "address") and hasattr(addr, "netmask"):
                if addr.family == socket.AF_INET and addr.address == ip:
                    return adapter_name


def encrypt_file(file_path, output_path):
    with open(file_path, 'rb') as file:
        content = file.read()
        encrypted_content = base64.b64encode(content)
    with open(output_path, 'wb') as output_file:
        output_file.write(encrypted_content)


def decrypt_file(file_path, output_path):
    with open(file_path, 'rb') as file:
        content = file.read()
        decrypted_content = base64.b64decode(content)
    with open(output_path, 'wb') as output_file:
        output_file.write(decrypted_content)


def import_databases_data(file_path):
    sql_structures = []
    sql_lists = []
    new_contents = []
    with open(file_path, mode="r+", encoding="utf-8") as r:
        for sql in r.readlines():
            if not sql.strip() or sql[: 2] in ["--", "/*"] or "LOCK TABLES" in sql or "UNLOCK TABLES" in sql:
                continue
            new_contents.append(sql)
    sql = ""
    for line in new_contents:
        if line.strip()[-1] != ';':
            sql = sql + line
        else:
            sql = sql + line
            if "INSERT INTO" in sql:
                sql_arr = sql.split("VALUES (")
                sql_began = sql_arr[0].replace("INTO ", "INTO ")
                sql_datas = sql_arr[1].split('),(')
                for item in sql_datas:
                    if item.strip()[-1] == ";":
                        new_sql = sql_began + "VALUES (" + item
                    else:
                        new_sql = sql_began + "VALUES (" + item + ");"
                    sql_lists.append(new_sql)
            else:
                sql_structures.append(sql)
            sql = ""

    failed_list = []
    for i in range(len(sql_structures)):
        if len(failed_list):
            sql_structures = failed_list
            failed_list = []
        connection = pymysql.connect(
            host=settings.DB_HOST, port=int(settings.DB_PORT), user=settings.DB_USER,
            password=settings.DB_PASSWORD, database=settings.DB_NAME, charset='utf8'
        )
        with connection:
            with connection.cursor() as cursor:
                for x in sql_structures:
                    if "data_handle" in x:
                        continue
                    try:
                        cursor.execute(x)
                        connection.commit()
                    except:
                        error_info = traceback.format_exc().split("\n")
                        cleaned_data = [item for item in error_info if item]
                        if "already exists" in cleaned_data[-1]:
                            pass
                        else:
                            failed_list.append(x)
                        continue

        if not len(failed_list):
            print("sql全部语句执行成功 ！")
            break
        else:
            print(len(failed_list), "------")

    failed_list = []
    for i in range(len(sql_lists)):
        if len(failed_list):
            sql_lists = failed_list
            failed_list = []
        connection = pymysql.connect(
            host=settings.DB_HOST, port=int(settings.DB_PORT), user=settings.DB_USER,
            password=settings.DB_PASSWORD, database=settings.DB_NAME, charset='utf8'
        )
        with connection:
            with connection.cursor() as cursor:
                for x in sql_lists:
                    if "data_handle" in x:
                        continue
                    try:
                        cursor.execute(x)
                        connection.commit()
                    except:
                        error_info = traceback.format_exc().split("\n")
                        cleaned_data = [item for item in error_info if item]
                        if "Duplicate entry" in cleaned_data[-1]:
                            pass
                        else:
                            failed_list.append(x)
                        continue
        if not len(failed_list):
            print("sql全部语句执行成功 ！")
            break
        else:
            print(len(failed_list), "===")


async def export_server_datas(dir_name, upload_ftp=True):
    sql_file_name = dir_name[: 8] + ".db"
    backup_path = os.path.join(settings.BACKUP_PATH, dir_name)
    if not os.path.exists(backup_path):
        os.makedirs(backup_path)

    sql_format = "mysqldump --column-statistics=0 -h%s -u%s -p%s -P%s %s > %s"
    sql = (sql_format % (settings.DB_HOST, settings.DB_USER, settings.DB_PASSWORD, settings.DB_PORT, settings.DB_NAME,
                         os.path.join(backup_path, sql_file_name)))
    cmd_res = subprocess.Popen(sql, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    if cmd_res.stderr:
        print(cmd_res.stderr)

    while cmd_res.poll() is None:
        line = cmd_res.stdout.readline()
        line = line.strip()
        if line:
            print(line)
    if cmd_res.returncode == 0:
        cmd_res.kill()
    else:
        cmd_res.kill()
    try:
        encrypt_file(os.path.join(backup_path, sql_file_name), os.path.join(backup_path, sql_file_name))
        ftp_util = RemoteFTPService()
        ftp_path = await ftp_util.ftp_copy_dir(settings.FTP_REMOTE_PATH, backup_path, upload_ftp, delete_source=False)

        local_path = backup_path + ".zip"
        return local_path, ftp_path
    except:
        print(traceback.format_exc())
        return False


async def restore_server_datas(curr_data, local_path=None):
    try:
        if not local_path:
            ftp_util = RemoteFTPService()
            save_path = await ftp_util.download_ftp_backup_file(
                filename=os.path.basename(curr_data.url),
                remote_filename=curr_data.url,
                download=False
            )
            file_path = save_path[:-4]
            handle_time = curr_data.handle_time
            file_path = os.path.join(settings.RESTORE_PATH, os.path.basename(file_path))
        else:
            save_path = local_path
            handle_time = curr_data
            file_path = local_path[:-4]

        if os.path.exists(file_path):
            shutil.rmtree(file_path)
        os.mkdir(file_path)
        shutil.unpack_archive(save_path, file_path)
        os.remove(save_path)

        local_init_file = os.path.join(file_path, handle_time[: 8] + ".db")
        local_dest_file = os.path.join(file_path, handle_time[: 8] + ".sql")
        decrypt_file(local_init_file, local_dest_file)
        os.remove(local_init_file)

        # 回复数据，drop所有表，并重建
        await drop_all_table()
        import_databases_data(local_dest_file)
        os.remove(local_dest_file)
        #
        # 恢复ftp文件，清空ftp目录，并重建
        ftp_util = RemoteFTPService()
        res = await ftp_util.delete_all_record()
        if not res:
            return resp_500()

        ftp_util = RemoteFTPService()
        await ftp_util.ftp_upload_dirs(file_path)

        shutil.rmtree(file_path)

        if local_path:
            ftp_util = RemoteFTPService()
            ftp_path = await ftp_util.ftp_copy_dir(settings.FTP_REMOTE_PATH, local_path)
            return ftp_path

        return True
    except:
        return False


if __name__ == "__main__":
    import_databases_data(r"D:\ftp\tmp\restore\20240606105552\20240606105551.sql")
