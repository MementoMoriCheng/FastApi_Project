#!/usr/bin/python
# -*- coding: utf-8 -*-
# @Time    : 2024/03/15
# @Author  : MementoMori
# @File    : tools.py
# @Software: PyCharm
# @desc    : 工具类
import json
import os
import random
import re
import string
import jieba
from typing import List, Union
from nltk.corpus import stopwords


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


def cal_grade_percentage(grade_list):
    """
    成绩百分率：优秀：>=85，良好：70~85,及格：60~70，不及格：<60
    Args:
        grade_list:

    Returns:

    """
    ideal_num, good_num, pass_num, flunk_num, total = 0, 0, 0, 0, len(grade_list)
    for grade in grade_list:
        if grade.total_score >= 85:
            ideal_num += 1
        elif 70 <= grade.total_score < 85:
            good_num += 1
        elif 60 <= grade.total_score < 70:
            pass_num += 1
        else:
            flunk_num += 1
    return (round(ideal_num / total, 3), round(good_num / total, 3), round(pass_num / total, 3),
            round(flunk_num / total, 3))


class CalculateGrade:
    @staticmethod
    def check_single_choice_answer(expected_answer: str, student_answer: str, score=None) -> bool:
        """
        检查单选题答案是否正确。

        Args:
            expected_answer (str): 正确答案。
            student_answer (str): 学生提交的答案。
            score: 总分。

        Returns:
            bool: 如果学生答案与正确答案一致，则返回True；否则返回False。
        """
        return student_answer.lower() == expected_answer.lower()

    @staticmethod
    def check_multiple_choice_answer(expected_answers: str, student_answer: str, score=None) -> bool:
        """
        检查多选题答案是否正确。错答、多答、少答均得0分

        Args:
            expected_answers (str): 正确答案列表，例如 a,b,c。
            student_answer (str): 学生提交的答案，例如 'a,b,c'，答案间用逗号分隔。
            score: 总分。

        Returns:
            bool: 如果学生答案包含了所有正确的选项并且没有其他选项，则返回True；否则返回False。
        """
        student_answer_list = set(student_answer.lower().split(','))
        expected_answers_list = set(expected_answers.lower().split(','))
        return student_answer_list == expected_answers_list

    @staticmethod
    def check_judge_answer(expected_answer: str, student_answer: str, score=None) -> bool:
        """
        检查判断题答案是否正确。

        Args:
            expected_answer (str): 正确答案，取值为 'true' 或 'false'。
            student_answer (str): 学生提交的答案。
            score: 总分。

        Returns:
            bool: 如果学生答案与正确答案一致，则返回True；否则返回False。
        """
        s_a, e_a = None, None
        if student_answer.lower() in ['true', 't', 'y', 'yes']:
            s_a = True
        if expected_answer.lower() in ['true', 't', 'y', 'yes']:
            e_a = True
        if student_answer.lower() in ['false', 'f', 'n', 'no']:
            s_a = False
        if expected_answer.lower() in ['false', 'f', 'n', 'no']:
            e_a = False
        return s_a == e_a

    def check_fill_answer(self, expected_answer: str, student_answer: str, max_error_rate=0.1, score=None) -> bool:
        """
        检查填空题答案是否正确。

        Args:
            expected_answer (str): 正确答案。
            student_answer (str): 学生提交的答案。
            max_error_rate: 错误率，允许一定的容错率
            score: 总分。

        Returns:
            bool: 如果学生答案与正确答案一致（不区分大小写），则返回True；否则返回False。
        """
        preprocessed_student_answer = self.preprocess_text(student_answer)
        preprocessed_expected_answer = self.preprocess_text(expected_answer)

        correct_answers = sum(1 for a, b in zip(preprocessed_expected_answer, preprocessed_student_answer) if a == b)
        total_answers = len(expected_answer)
        error_rate = (total_answers - correct_answers) / total_answers

        if error_rate <= float(max_error_rate):
            return True
        else:
            return False

    def check_short_answer(self, expected_answer: str, student_answer: str, total_score=None):
        """
        检查简答题答案是否正确。

        注意：此实现仅检查学生答案与标准答案的完全匹配，实际场景中可能需要更复杂的评估逻辑。

        Args:
            expected_answer (str): 正确答案。结构：得分点：分值 {"知识重用": 3,"方法和标准重": 4,"软件成分重用": 3}
            student_answer (str): 学生提交的答案。
            total_score: 总分。

        Returns:
            bool: 如果学生答案与正确答案完全相同（不区分大小写），则返回True；否则返回False。
        """
        expected_answer = json.loads(expected_answer)
        answer_key_words = [(self.preprocess_text(sentence), score) for sentence, score in expected_answer.items()]
        keyword_scores = {}
        for words, score in answer_key_words:
            for word in words:
                if word in keyword_scores:
                    keyword_scores[word] += score / len(words)
                else:
                    keyword_scores[word] = score / len(words)

        preprocessed_student_answer = self.preprocess_text(student_answer)
        total_mark = 0
        for word, score in keyword_scores.items():
            if word in preprocessed_student_answer:
                total_mark += score

        # 确保总分不超过总分
        return min(total_mark, total_score)

    @staticmethod
    def preprocess_text(text):
        text = text.strip()  # 去除首尾空白字符
        words = jieba.lcut(text)  # 分词
        words = [word.lower() for word in words if word.lower() not in stopwords.words('chinese')]  # 去除停用词并转为小写
        return words

    def cal_grade(self, question_info, student_exam_result, auto_cal):
        """
        计算考试成绩
        Args:
            question_info: 试卷标准答案
            student_exam_result: 学生作答信息
            auto_cal: 自动判卷部分

        Returns:
            总得分，题目得分
        """
        # 计算考试成绩
        fun2num = {
            'single_choice': 1,
            'multiple_choice': 2,
            'fill': 3,
            'judge': 4,
            'short': 5
        }

        fun_dict_map, q_score = {}, []

        def add_to_dict(field_name: str, func_name: str):
            field_value = getattr(auto_cal, field_name)
            if field_value == 1:
                fun_dict_map[fun2num[field_name]] = getattr(self, f"check_{func_name}_answer")

        add_to_dict('single_choice', 'single_choice')
        add_to_dict('multiple_choice', 'multiple_choice')
        add_to_dict('fill', 'fill')
        add_to_dict('judge', 'judge')
        add_to_dict('short', 'short')

        stu_grade = 0  # 初始化一个成绩
        for stu_ans in student_exam_result:
            for q in question_info:
                if stu_ans.question_id == q.id:
                    calling = fun_dict_map.get(q.type)
                    res = calling(q.answer, stu_ans.solution, q.score)
                    if res and isinstance(res, bool):
                        stu_grade += q.score
                        q_score.append({"id": stu_ans.id, "mark": q.score})
                    else:
                        stu_grade += res
                        q_score.append({"id": stu_ans.id, "mark": res})
        return stu_grade, q_score
