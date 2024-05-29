#!/usr/bin/python
# -*- coding: utf-8 -*-
# @Time    : 2024/03/15
# @Author  : MementoMori
# @File    : tools.py
# @Software: PyCharm
# @desc    : 工具类
import os
import random
import re
import string
from typing import List, Union


def filter_dict(dict_data):
    """
    从字典中剔除值为空（包括None、空字符串、空列表等被认为是“空”的值）的键值对, 但不剔除布尔值False
    Args:
        dict_data:

    Returns:

    """
    return {k: v for k, v in dict_data.items() if v or v is False}


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
