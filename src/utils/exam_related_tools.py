#!/usr/bin/python
# -*- coding: utf-8 -*-
# @Time    : 2024/05/15
# @Author  : MementoMori
# @File    : tools.py
# @Software: PyCharm
# @desc    : 考试相关工具类
import json
import jieba
import random
from nltk.corpus import stopwords
from src.config.setting import settings
from src.utils.constant import QuestionTypeIndex
from src.utils.sql_config import sql_handle


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


class QuestionType:
    """题型类型"""

    def __init__(self):
        self.SingleChoice = None
        self.MultipleChoice = None
        self.Fill = None
        self.Judge = None
        self.ShortAnswer = None
        self.need_col = None
        self.question_type = None
        self.question_type_dict = None

    async def get_col(self):
        """
        获取列
        Returns:

        """
        table_name = settings.QUESTION_TYPE_TABLE
        self.question_type = settings.QUESTION_TYPE.split(',')
        self.question_type_dict = await sql_handle.select(table_name)
        col_dict = await sql_handle.get_table_columns(table_name)
        for col in col_dict:
            if self.question_type_dict[0].get(col) in self.question_type:
                self.need_col = col

    async def get_question_type_dictionary(self):
        """
        获取题目类型字典
        Returns:

        """
        for con in self.question_type_dict:
            if con.get(self.need_col) == self.question_type[QuestionTypeIndex.SingleChoice]:
                self.SingleChoice = con.get("id")
            if con.get(self.need_col) == self.question_type[QuestionTypeIndex.MultipleChoice]:
                self.MultipleChoice = con.get("id")
            if con.get(self.need_col) == self.question_type[QuestionTypeIndex.Fill]:
                self.Fill = con.get("id")
            if con.get(self.need_col) == self.question_type[QuestionTypeIndex.Judge]:
                self.Judge = con.get("id")
            if con.get(self.need_col) == self.question_type[QuestionTypeIndex.ShortAnswer]:
                self.ShortAnswer = con.get("id")

    async def get_question_type(self, id_):
        """
        获取题目类型
        Args:
            id_:

        Returns:

        """
        for col in self.question_type_dict:
            if id_ == col.get("id"):
                return self.question_type.index(col.get(self.need_col))


class CalculateGrade:
    def __init__(self):
        self.qt = QuestionType()
        self.q_bank = "auto_question_bank"

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
        if not student_answer:
            return False

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
        if not student_answer:
            return False

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
        if not student_answer:
            return False
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
        if not student_answer:
            return False

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
        if not student_answer:
            return 0

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
        """
        处理文本
        Args:
            text:

        Returns:

        """
        text = text.strip()  # 去除首尾空白字符
        words = jieba.lcut(text)  # 分词
        words = [word.lower() for word in words if word.lower() not in stopwords.words('chinese')]  # 去除停用词并转为小写
        return words

    async def cal_grade(self, question_info, student_exam_result, auto_cal, q_score_dict):
        """
        计算考试成绩
        Args:
            question_info: 试卷标准答案
            student_exam_result: 学生作答信息
            auto_cal: 自动判卷部分
            q_score_dict: 题类型分数
        Returns:
            总得分，题目得分
        """
        # 计算考试成绩
        fun2num = {
            'single_choice': 0,
            'multiple_choice': 1,
            'fill': 2,
            'judge': 3,
            'short': 4
        }
        fun_dict_map, q_score = {}, []

        def add_to_dict(field_name: str, func_name: str):
            if isinstance(auto_cal, dict):
                field_value = auto_cal.get(field_name)
            else:
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
                if stu_ans.get("question_id") == q.get("QID"):
                    await self.qt.get_col()
                    q_type = await self.qt.get_question_type(q.get("type"))
                    q_s = q_score_dict.get(q_type)
                    calling = fun_dict_map.get(q_type)
                    res = calling(q.get("evaluate_answers"), stu_ans.get("solution"), q_s)
                    if res and isinstance(res, bool):
                        stu_grade += q_s
                        q_score.append({"QID": q.get("QID"), "mark": q_s, "reviewed": True})
                    elif not res and isinstance(res, bool):
                        q_score.append({"QID": q.get("QID"), "mark": 0, "reviewed": True})
                    else:
                        stu_grade += res
                        q_score.append({"QID": q.get("QID"), "mark": res, "reviewed": True})

                    # 记录得分次数
                    if res:
                        updated_data = {}
                        update_conditions = {"QID": q.get("QID")}
                        updated_data.update(
                            {'scored_times': (q.get("scored_times") + 1) if q.get("scored_times") else 1})
                        await sql_handle.update(self.q_bank, update_conditions, updated_data)

        return stu_grade, q_score


class Question:
    def __init__(self, qid):
        self.QID = qid


class ExamPaperGenerator:
    def __init__(self, table_name):
        self.table_name = table_name
        self.course = None
        self.qt = QuestionType()

    async def load_single_choice_bank(self):
        """
        单选题
        Returns:

        """
        single_choices = await self.load_question_bank(self.qt.SingleChoice)
        question_bank = []
        for row in single_choices:
            question_id = row.get('QID')
            question = Question(question_id)
            question_bank.append(question)
        return question_bank

    async def load_multiple_choice_bank(self):
        """
        多选题
        Returns:

        """
        multiple_choices = await self.load_question_bank(self.qt.MultipleChoice)
        question_bank = []
        for row in multiple_choices:
            question_id = row.get('QID')
            question = Question(question_id)
            question_bank.append(question)
        return question_bank

    async def load_fill_bank(self):
        """
        填空题
        Returns:

        """
        fills = await self.load_question_bank(self.qt.Fill)
        question_bank = []
        for row in fills:
            question_id = row.get('QID')
            question = Question(question_id)
            question_bank.append(question)
        return question_bank

    async def load_judge_bank(self):
        """
        判断题
        Returns:

        """
        judges = await self.load_question_bank(self.qt.Judge)
        question_bank = []
        for row in judges:
            question_id = row.get('QID')
            question = Question(question_id)
            question_bank.append(question)
        return question_bank

    async def load_short_answer_bank(self):
        """
        简答题
        Returns:

        """
        short_answers = await self.load_question_bank(self.qt.ShortAnswer)
        question_bank = []
        for row in short_answers:
            question_id = row.get('QID')
            question = Question(question_id)
            question_bank.append(question)
        return question_bank

    async def load_question_bank(self, question_type, limit=100, is_desc=True):
        """
        题库选题
        Args:
            question_type:
            limit:
            is_desc:

        Returns:

        """
        conditions = {"type": question_type}
        # 试题范围
        if self.course:
            conditions.update(course={"value": self.course, "operator": "equal"})
        # desc 降序
        question_bank = await sql_handle.select(self.table_name, conditions=conditions,
                                                order_by={"update_time": is_desc}, limit=limit)
        return question_bank

    async def generate_exam(self, question_type_counts, course):
        """
        生成试卷
        Args:
            question_type_counts:
            course:

        Returns:

        """
        self.course = course
        await self.qt.get_col()
        await self.qt.get_question_type_dictionary()
        exam_questions = ["" for _ in range(sum(question_type_counts.values()))]
        for question_type, question_num in question_type_counts.items():
            if question_type == "single_choice_num":
                single_choice_bank = await self.load_single_choice_bank()
                random.shuffle(single_choice_bank)
                exam_questions[0: question_type_counts["single_choice_num"]] = single_choice_bank[:question_num]
            if question_type == "multiple_choice_num":
                multiple_choice_bank = await self.load_multiple_choice_bank()
                random.shuffle(multiple_choice_bank)
                exam_questions[question_type_counts["single_choice_num"]:
                               question_type_counts["single_choice_num"] + question_type_counts[
                                   "multiple_choice_num"]] = multiple_choice_bank[:question_num]
            if question_type == "fill_num":
                fill_bank = await self.load_fill_bank()
                random.shuffle(fill_bank)
                exam_questions[question_type_counts["single_choice_num"] + question_type_counts["multiple_choice_num"]:
                               question_type_counts["single_choice_num"] + question_type_counts["multiple_choice_num"] +
                               question_type_counts["fill_num"]] = fill_bank[:question_num]
            if question_type == "judge_num":
                judge_bank = await self.load_judge_bank()
                random.shuffle(judge_bank)
                exam_questions[question_type_counts["single_choice_num"] + question_type_counts["multiple_choice_num"] +
                               question_type_counts["fill_num"]:
                               question_type_counts["single_choice_num"] + question_type_counts["multiple_choice_num"] +
                               question_type_counts["fill_num"] +
                               question_type_counts["judge_num"]] = judge_bank[:question_num]
            if question_type == "short_answer_num":
                short_answer_bank = await self.load_short_answer_bank()
                random.shuffle(short_answer_bank)
                exam_questions[question_type_counts["single_choice_num"] + question_type_counts["multiple_choice_num"] +
                               question_type_counts["fill_num"] +
                               question_type_counts["judge_num"]:] = short_answer_bank[:question_num]

        return exam_questions

    def check_total_score(self, scores):
        """
        验证分数列表的总和是否为100分。

        Args:
            scores: 一个包含各个单项分数的列表。

        Returns:
                bool: 如果总和为100，返回True；否则，返回False。
        """
        total = sum(scores)
        return total == 100


if __name__ == "__main__":
    import asyncio

    eg = ExamPaperGenerator("auto_question_bank")
    qt = QuestionType()
    # aa = asyncio.run(eg.load_question_bank("be375a95-7dd5-4e77-a85b-9ce076afaab7", 5))
    asyncio.run(qt.get_col())
    # asyncio.run(qt.get_question_type_dictionary())
    aa = asyncio.run(qt.get_question_type("df95a06a-4fe6-4637-9412-85af4b1fee97"))
    print(aa)

    # question_type = {'fill': 5, 'judge': 5, 'multiple_choice': 5, 'short_answer': 5, 'single_choice': 10}
    #
    # exam_paper_info = asyncio.run(eg.generate_exam(question_type, "8ff32d08-3d3e-4cdd-bee0-2c1556e12c7f"))
    # print(exam_paper_info)
