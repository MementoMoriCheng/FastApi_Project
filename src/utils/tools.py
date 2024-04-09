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
    file_size_in_MB = file_size_in_bytes / (1024 * 1024)

    if file_size_in_MB > 200:
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


# 计算由exam.html模版传过来的数据计算成绩
def calGrade(request):
    if request.method == 'POST':
        # 得到学号和科目
        sid = request.POST.get('sid')
        subject1 = request.POST.get('subject')
        paperid = request.POST.get('paperid')
        print(paperid)
        # 重新生成Student实例，Paper实例，Grade实例，名字和index中for的一致，可重复渲染
        student = models.Student.objects.get(id=sid)
        paper = models.Paper.objects.filter(major=student.major)
        grade = models.Grade.objects.filter(sid=student.id)

        # 计算该门考试的学生成绩
        question = models.Paper.objects.filter(subject=subject1).values("pid").values('pid__id', 'pid__answer',
                                                                                      'pid__score', 'pid__kp')

        mygrade = 0  # 初始化一个成绩为0
        for p in question:
            qId = str(p['pid__id'])  # int 转 string,通过pid找到题号
            myans = request.POST.get(qId)  # 通过 qid 得到学生关于该题的作答
            # print(myans)
            okans = p['pid__answer']  # 得到正确答案
            # print(okans)
            if myans == okans:  # 判断学生作答与正确答案是否一致
                mygrade += 10  # 若一致,得到该题的分数,累加mygrade变量
            else:
                models.Knowledge.objects.create(sid_id=sid, pid_id=paperid, kp=p['pid__kp'])

        # 向Grade表中插入数据
        models.Grade.objects.create(sid_id=sid, subject=subject1, grade=mygrade)
        # print(mygrade)
        # 重新渲染index.html模板
        return render(request, 'index.html', {'student': student, 'paper': paper, 'grade': grade})


# 计算考试成绩
def calculateGrade(request):
    if request.method == 'POST':
        sid = request.POST.get('sid')
        subject1 = request.POST.get('subject')
        student = Student.objects.get(sid=sid)
        paper = models.TestPaper.objects.filter(major=student.major)
        grade = models.Record.objects.filter(sid=student.sid)
        course = models.Course.objects.filter(course_name=subject1).first()
        from django.utils.datetime_safe import datetime
        now = datetime.now()
        # 计算考试成绩
        questions = models.TestPaper.objects.filter(course__course_name=subject1). \
            values('pid').values('pid__id', 'pid__answer', 'pid__score')

        stu_grade = 0  # 初始化一个成绩
        for p in questions:
            qid = str(p['pid__id'])
            stu_ans = request.POST.get(qid)
            cor_ans = p['pid__answer']
            if stu_ans == cor_ans:
                stu_grade += p['pid__score']
        models.Record.objects.create(sid_id=sid, course_id=course.id, grade=stu_grade, rtime=now)
        context = {
            'student': student,
            'paper': paper,
            'grade': grade
        }
        return render(request, 'index.html', context=context)


def check_single_choice_answer(expected_answer: str, student_answer: str) -> bool:
    """
    检查单选题答案是否正确。

    Args:
        expected_answer (str): 正确答案。
        student_answer (str): 学生提交的答案。

    Returns:
        bool: 如果学生答案与正确答案一致，则返回True；否则返回False。
    """
    return student_answer.lower() == expected_answer.lower()


def check_multiple_choice_answer(expected_answers: List[str], student_answer: str) -> bool:
    """
    检查多选题答案是否正确。

    Args:
        expected_answers (List[str]): 正确答案列表，例如 ['a', 'b', 'c']。
        student_answer (str): 学生提交的答案，例如 'a,b,c'，答案间用逗号分隔。

    Returns:
        bool: 如果学生答案包含了所有正确的选项并且没有其他选项，则返回True；否则返回False。
    """
    student_answer_list = set(student_answer.lower().split(','))
    return student_answer_list == set(expected_answers)


def check_true_or_false_answer(expected_answer: str, student_answer: str) -> bool:
    """
    检查判断题答案是否正确。

    Args:
        expected_answer (str): 正确答案，取值为 'true' 或 'false'。
        student_answer (str): 学生提交的答案。

    Returns:
        bool: 如果学生答案与正确答案一致，则返回True；否则返回False。
    """
    return student_answer.lower() == expected_answer.lower()


def check_fill_in_blank_answer(expected_answer: str, student_answer: str) -> bool:
    """
    检查填空题答案是否正确。

    Args:
        expected_answer (str): 正确答案。
        student_answer (str): 学生提交的答案。

    Returns:
        bool: 如果学生答案与正确答案一致（不区分大小写），则返回True；否则返回False。
    """
    return student_answer.lower() == expected_answer.lower()


def check_short_answer(expected_answer: str, student_answer: str) -> bool:
    """
    检查简答题答案是否正确。

    注意：此实现仅检查学生答案与标准答案的完全匹配，实际场景中可能需要更复杂的评估逻辑。

    Args:
        expected_answer (str): 正确答案。
        student_answer (str): 学生提交的答案。

    Returns:
        bool: 如果学生答案与正确答案完全相同（不区分大小写），则返回True；否则返回False。
    """
    return student_answer.lower() == expected_answer.lower()
