#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/12/9 10:53
# @Author  : yilifeng
# @File    : __init__.py
# @Software: PyCharm
from src.db.models.column_manage import ColumnManage
from src.db.models.table_manage import TableManage
from src.db.models.flying_service import FlyingService
from src.db.models.menu_manage import MenuManage
from src.db.models.log_manage import LogManage
from src.db.models.document import Document
from src.db.models.course import Course
from src.db.models.gnss_data import GNSSData
from src.db.models.examination import Examination
from src.db.models.exam_result import ExamResult, ExamResultDetail
from src.db.models.exam_paper import Paper, PaperModule, PaperQuestions
from src.db.models.exam_question import Questions, ExamResultDetail, ErrorArchive

