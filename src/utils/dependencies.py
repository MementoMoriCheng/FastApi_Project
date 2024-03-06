#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 11:22
# @Author  : yilifeng
# @File    : dependencies.py
# @Software: PyCharm

from src.db.config import session


class DALGetter:
    def __init__(self, dal_cls):
        self.dal_cls = dal_cls

    async def __call__(self):
        async with session() as a_session:
            async with a_session.begin():
                yield self.dal_cls(a_session)
