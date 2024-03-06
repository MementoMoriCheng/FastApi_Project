#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 11:25
# @Author  : yilifeng
# @File    : setting.py
# @Software: PyCharm
import os
from typing import List

from pydantic import BaseSettings
from dotenv import dotenv_values

backend = os.path.dirname(os.path.abspath(__file__))
rootp = backend[:backend.find("flight-training-server") + len("flight-training-server")]
dotenv_config = dotenv_values(os.path.join(rootp, "src", 'static', '.config'))


class Settings(BaseSettings):
    BASEDIR: str = os.path.abspath(os.path.dirname(__file__))
    BACKEND_CORS_ORIGINS: List = ['*']

    ROOT_PATH = rootp

    # 默认管理员账号密码等信息
    ADMIN_USERNAME: str = dotenv_config.get('ADMIN_USERNAME')
    ADMIN_PASSWORD: str = dotenv_config.get('ADMIN_PASSWORD')
    ADMIN_NICKNAME: str = dotenv_config.get('ADMIN_NICKNAME')
    ADMIN_EMAIL: str = dotenv_config.get('ADMIN_EMAIL')

    # 数据库账号密码
    DB_HOST: str = dotenv_config.get('DB_HOST')
    DB_PORT: str = dotenv_config.get('DB_PORT')
    DB_USER: str = dotenv_config.get('DB_USER')
    DB_PASSWORD: str = dotenv_config.get('DB_PASSWORD')
    DB_NAME: str = dotenv_config.get('DB_NAME')

    DATABASE_URI: str = f'mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}'
    SQLALCHEMY_DATABASE_URI: str = f'mysql+aiomysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

    # 12 hours
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 60 * 12
    SECRET_KEY: str = dotenv_config.get("SECRET_KEY")
    APP_NAME: str = dotenv_config.get("APP_NAME", "flying-Training")
    USER_SYSTEM_URL: str = dotenv_config.get("USER_SYSTEM_URL")
    # 不设置该环境变量则默认进行身份验证，设置为 0 关闭身份验证
    AUTH: int = os.getenv("AUTH", 1)

    FTP_HOST: str = dotenv_config.get("FTP_HOST")
    FTP_PORT: int = dotenv_config.get("FTP_PORT")
    FTP_USER: str = dotenv_config.get("FTP_USER")
    FTP_PASSWORD: str = dotenv_config.get("FTP_PASSWORD")
    FTP_ROOT_PATH: str = dotenv_config.get("FTP_ROOT_PATH")
    FTP_REMOTE_BASE: str = dotenv_config.get("FTP_REMOTE_BASE")
    FTP_REMOTE_PATH: str = dotenv_config.get("FTP_REMOTE_PATH")
    FTP_COMPOSITE_EXPERIMENT: str = dotenv_config.get("FTP_COMPOSITE_EXPERIMENT")
    FTP_SECRET_KEY: str = dotenv_config.get("FTP_SECRET_KEY")

    UDP_ADDRESS: str = dotenv_config.get("UDP_ADDRESS")
    UDP_PORT: int = dotenv_config.get("UDP_PORT")
    UDP_REMOTE_ADDRESS: str = dotenv_config.get("UDP_REMOTE_ADDRESS")
    UDP_REMOTE_PORT: int = dotenv_config.get("UDP_REMOTE_PORT")

    LOG_PATH: str = dotenv_config.get("LOG_PATH")
    LOG_NAME: str = dotenv_config.get("LOG_NAME")


settings = Settings()
