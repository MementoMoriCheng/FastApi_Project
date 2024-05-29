#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 10:47
# @Author  : yilifeng
# @File    : __init__.py
# @Software: PyCharm

import datetime
import uuid
import string
import time
import random
import os
import io
import codecs
import base64

from flask import jsonify
from werkzeug.http import HTTP_STATUS_CODES


class ResponseCode:
    SUCCESS = 0
    FAIL = -1


class ResponseMessage:
    SUCCESS = "成功"
    FAIL = "失败"


def api_success(
        status=200,
        code=ResponseCode.SUCCESS,
        msg=ResponseMessage.SUCCESS,
        data=None,
        **kwargs
):
    response = jsonify(code=code, data=data, msg=msg, **kwargs)
    response.status_code = status
    return response


def api_abort(status, code=ResponseCode.FAIL, msg=ResponseMessage.FAIL, **kwargs):
    if msg is None:
        msg = HTTP_STATUS_CODES.get(status, "")
    # if code is None:
    #     code = status
    response = jsonify(status=status, code=code, msg=msg, **kwargs)
    response.status_code = status
    return response


def api_abort_404():
    return api_abort(status=404)


def strftime_(dt):
    return datetime.datetime.strftime(dt, "%Y-%m-%d %H:%M:%S")


def datetime_local():
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")


def generate_uuid():
    return str(uuid.uuid4())


def generate_bigint_id():
    timestamp = int(time.time() * 1000)
    random_part = random.randint(0, 999999)
    bigint_id = (timestamp << 20) + random_part
    return bigint_id


def generate_filename():
    dt_str = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    random_str = "".join(random.choice(string.ascii_letters) for i in range(10))
    return dt_str + "-" + random_str


def mk_dir(directory):
    try:
        os.makedirs(directory, exist_ok=True)
    except FileExistsError:
        pass


def bytesio2stringio(bio):
    stream_reader = codecs.getreader("utf-8")
    wrapper_file = stream_reader(bio)
    return wrapper_file


def bytes_to_base64(image_bytes):
    encoded_string = base64.b64encode(image_bytes)
    return encoded_string.decode("utf-8")


def base64_to_stream(base64_string):
    bytes_data = base64.b64decode(base64_string)
    stream = io.BytesIO(bytes_data)
    return stream
