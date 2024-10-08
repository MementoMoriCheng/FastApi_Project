#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 11:25
# @Author  : yilifeng
# @File    : setting.py
# @Software: PyCharm
import os
from typing import List

from dotenv import dotenv_values
from pydantic import BaseSettings

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
    FTP_REMOTE_BACKUPS_PATH: str = dotenv_config.get("FTP_REMOTE_BACKUPS_PATH")
    FTP_COMPOSITE_EXPERIMENT: str = dotenv_config.get("FTP_COMPOSITE_EXPERIMENT")
    FTP_SECRET_KEY: str = dotenv_config.get("FTP_SECRET_KEY")

    LOCAL_DOWNLOAD_FILE_PATH: str = dotenv_config.get("LOCAL_DOWNLOAD_FILE_PATH")

    UDP_ADDRESS: str = dotenv_config.get("UDP_ADDRESS")
    UDP_PORT: int = dotenv_config.get("UDP_PORT")
    UDP_REMOTE_ADDRESS: str = dotenv_config.get("UDP_REMOTE_ADDRESS")
    UDP_REMOTE_PORT: int = dotenv_config.get("UDP_REMOTE_PORT")

    WEBSOCKET_ADDRESS: str = dotenv_config.get("WEBSOCKET_ADDRESS")
    WEBSOCKET_PORT: int = dotenv_config.get("WEBSOCKET_PORT")
    WS_CONFIG: str = dotenv_config.get("WS_CONFIG")

    GNSS_FIELDS: str = dotenv_config.get("GNSS_FIELDS")
    REAL_TIME_GNSS_FIELDS: str = dotenv_config.get("REAL_TIME_GNSS_FIELDS")
    ALARM_FIELDS: str = dotenv_config.get("ALARM_FIELDS")

    LOG_PATH: str = dotenv_config.get("LOG_PATH")
    LOG_NAME: str = dotenv_config.get("LOG_NAME")

    SYNC_USER_URL: str = dotenv_config.get("SYNC_USER_URL")
    UNSYNC_USER_URL: str = dotenv_config.get("UNSYNC_USER_URL")

    QUESTION_TYPE_TABLE: str = dotenv_config.get("QUESTION_TYPE_TABLE")
    QUESTION_MAJOR: str = dotenv_config.get("QUESTION_MAJOR")
    QUESTION_COURSE: str = dotenv_config.get("QUESTION_COURSE")
    QUESTION_TYPE: str = dotenv_config.get("QUESTION_TYPE")

    EXAMINATION: str = dotenv_config.get("EXAMINATION")
    EXAM_RESULT_DETAIL: str = dotenv_config.get("EXAM_RESULT_DETAIL")
    PAPER: str = dotenv_config.get("PAPER")
    ONLINE_LEARNING: str = dotenv_config.get("ONLINE_LEARNING")
    QUESTION_BANK: str = dotenv_config.get("QUESTION_BANK")
    TEACHING_RESOURCE: str = dotenv_config.get("TEACHING_RESOURCE")

    FLIGHT_PLAN_CONTENT: str = dotenv_config.get("FLIGHT_PLAN_CONTENT")
    FLIGHT_PLAN_BASE: str = dotenv_config.get("FLIGHT_PLAN_BASE")
    FLIGHT_PLAN_PILOT: str = dotenv_config.get("FLIGHT_PLAN_PILOT")
    FLIGHT_PLAN_PLANE: str = dotenv_config.get("FLIGHT_PLAN_PLANE")
    FLIGHT_PLAN_SUBJECT: str = dotenv_config.get("FLIGHT_PLAN_SUBJECT")
    FLIGHT_SUBJECT_DETAILS: str = dotenv_config.get("FLIGHT_SUBJECT_DETAILS")
    STUDENT_TABLE: str = dotenv_config.get("STUDENT_TABLE")
    PLANE_TABLE: str = dotenv_config.get("PLANE_TABLE")
    FLIGHT_ROUTE: str = dotenv_config.get("FLIGHT_ROUTE")
    FLIGHT_WAYPOINT: str = dotenv_config.get("FLIGHT_WAYPOINT")
    WAYPOINT: str = dotenv_config.get("WAYPOINT")

    STATION_ID_2_PLANE_ID: str = dotenv_config.get("STATION_ID_2_PLANE_ID")

    CITY_NAME: str = dotenv_config.get("CITY_NAME")
    COUNTRY: str = dotenv_config.get("COUNTRY")
    REGION: str = dotenv_config.get("REGION")
    LATITUDE: str = dotenv_config.get("LATITUDE")
    LONGITUDE: str = dotenv_config.get("LONGITUDE")
    TIMEZONE_STR: str = dotenv_config.get("TIMEZONE_STR")

    # 数据备份与还原路径
    BACKUP_PATH: str = dotenv_config.get("BACKUP_PATH")
    RESTORE_PATH: str = dotenv_config.get("RESTORE_PATH")

    SYNC_DATAS: str = dotenv_config.get("SYNC_DATAS")

    MAP_INTERFACE_JIANGXI: str = dotenv_config.get("MAP_INTERFACE_JIANGXI")
    MAP_INTERFACE_CHINA: str = dotenv_config.get("MAP_INTERFACE_CHINA")

    DEFAULT_PASSWORD: str = dotenv_config.get("DEFAULT_PASSWORD")
    DEFAULT_ROLE_ID: str = dotenv_config.get("DEFAULT_ROLE_ID")
    DEFAULT_SYSTEM_ID: str = dotenv_config.get("DEFAULT_SYSTEM_ID")

    DEFAULT_TIME_HOUR: int = dotenv_config.get("DEFAULT_TIME_HOUR")
    DEFAULT_TIME_MINUTE: int = dotenv_config.get("DEFAULT_TIME_MINUTE")
    DEFAULT_TIME_SECOND: int = dotenv_config.get("DEFAULT_TIME_SECOND")
    DEFAULT_TIME_MICROSECOND: int = dotenv_config.get("DEFAULT_TIME_MICROSECOND")

    DEFAULT_TIME_DAY: int = dotenv_config.get("DEFAULT_TIME_DAY")
    DEFAULT_TIME_MONTH: int = dotenv_config.get("DEFAULT_TIME_MONTH")
    DEFAULT_TIME_WEEK: int = dotenv_config.get("DEFAULT_TIME_WEEK")

    LOW_FLIGHT_ALTITUDE: float = dotenv_config.get("LOW_FLIGHT_ALTITUDE")
    LOW_FLIGHT_SPEED: float = dotenv_config.get("LOW_FLIGHT_SPEED")
    LOST_SPEED: float = dotenv_config.get("LOST_SPEED")

    ANALOG: int = dotenv_config.get("ANALOG")


settings = Settings()
