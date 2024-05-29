import copy
import datetime
import re
import struct
import uuid
from pprint import pprint


# src_path = "D:\\File\\dzm9b"
#
# with open(src_path, "rb") as f:
#     binary_content = f.read()

# hex_representation = binary_content.hex()
# print(binary_content)
# print(hex_representation)
# print(type(binary_content))
# target_bytes = []
# start_index = binary_content.find(b'U\xbb\xed')
# print(start_index)
# 如果找到了指定的开头，则进行截取
# if start_index != -1:
#     target_byte = binary_content[start_index:start_index + 66]
# else:
#     print("无法找到以 'U\\xbb\\xed' 开头的子串")

# print(target_byte)

# 计算总共有多少个66字节的子串
# total_substrings = len(binary_content) // 66

# 分割出所有子串
# split_strings = [binary_content[i * 66:(i + 1) * 66] for i in range(total_substrings)]


# pprint(split_strings)


def parse_gnss_data(data):
    (sync_code1, sync_code2, sync_code3, identify_code, gps_week, gps_milliseconds, latitude, longitude,
     altitude, latitude_stddev, longitude_stddev, altitude_stddev, horizon_speed, upward_speed, track_direction,
     positioning_status_satellite_count, solution_satellite_count, differential_age, azimuth, pitch, checksum) = (
        struct.unpack('<bbbbhlddfffffffbbbffb', data))

    print("Sync Codes: ", sync_code1, sync_code2, sync_code3)
    print("Identify Code: ", identify_code)
    print("GPS Week: ", gps_week)
    print("GPS Milliseconds: ", gps_milliseconds)
    print("Latitude: ", latitude)
    print("Longitude: ", longitude)
    print("Altitude: ", altitude)
    print("Latitude Standard Deviation: ", latitude_stddev)
    print("Longitude Standard Deviation: ", longitude_stddev)
    print("Altitude Standard Deviation: ", altitude_stddev)
    print("Horizon Speed: ", horizon_speed)
    print("Upward Speed: ", upward_speed)
    print("Track Direction: ", track_direction)
    print("Positioning Status/Satellite Count: ", positioning_status_satellite_count)
    print("Solution Satellite Count: ", solution_satellite_count)
    print("Differential Age: ", differential_age)
    print("Azimuth: ", azimuth)
    print("Pitch: ", pitch)
    print("Checksum: ", checksum)


# print(total_substrings)
# target_byte = split_strings[301]
# parse_gnss_data(target_byte)
# for target_byte in target_bytes:
#     parse_gnss_data(target_byte)

# a = [90 for _ in range(5)]
# print(a)
# from src.utils.constant import ROLE_INFO
# table_list = [
#     {"name": "Flight1"},
#     {"name": "Flight2"},
#     {"name": "Flight3"}
# ]
# role_list = []
# for role in table_list:
#     # print(ROLE_INFO.update(slug="", name=role.get("name"), status=1))
#     ROLE_INFO.update(slug="", name=role.get("name"), status=1)
#     role_list.append(copy.copy(ROLE_INFO))
#
# print(role_list)

#
# list_a = ['xiaohua', 'haha', 'dada', 'aa', 'a']
# list_b = ['xiaohua', 'haha', 'dada', 'aa']
#
# # 转换为集合以找到差集
# diff_set = set(list_a) - set(list_b)
# # print(diff_set)
# if diff_set:
#     print(f"Differential:{diff_set}")
# else:
#     print("No Differential")

# 将差集转换回列表形式
# diff_list = list(diff_set)
# print(diff_list)

# def generate_uuid():
#     return str(uuid.uuid4())
#
#
# for i in range(200):
#     print(generate_uuid())
import jieba  # 使用jieba进行分词
from nltk.corpus import stopwords  # 使用nltk的停用词列表


def preprocess_text(text):
    text = text.strip()  # 去除首尾空白字符
    words = jieba.lcut(text)  # 分词
    words = [word.lower() for word in words if word.lower() not in stopwords.words('chinese')]  # 去除停用词并转为小写
    return words


def check_fill_answer(expected_answer: str, student_answer: str, max_error_rate=0.1) -> bool:
    """
    检查填空题答案是否正确。

    Args:
        expected_answer (str): 正确答案。
        student_answer (str): 学生提交的答案。
        max_error_rate: 错误率，允许一定的容错率

    Returns:
        bool: 如果学生答案与正确答案一致（不区分大小写），则返回True；否则返回False。
    """
    preprocessed_student_answer = preprocess_text(student_answer)
    preprocessed_expected_answer = preprocess_text(expected_answer)

    correct_answers = sum(1 for a, b in zip(preprocessed_expected_answer, preprocessed_student_answer) if a == b)
    total_answers = len(expected_answer)
    error_rate = (total_answers - correct_answers) / total_answers

    if error_rate <= float(max_error_rate):
        return True
    else:
        return False


# 示例
question = "简述《呐喊》这部作品的主题思想。"
student_answer = "《呐喊》是鲁迅先生的一部短篇小说集，主题思想深刻，反映了当时社会的黑暗面，揭露了封建礼教吃人的本质"

answer_key_sentences = [
    ("鲁迅", 1),
    ("短篇小说", 1),
    ("主题思想深刻", 2),
    ("反映社会的黑暗面", 2),
    ("揭露了封建礼教吃人的本质", 4)
]


# 将answer_key_sentences中的句子预处理为单词列表，并构建新的keyword_scores字典
# answer_key_words = [(preprocess_text(sentence), score) for sentence, score in answer_key_sentences]
# keyword_scores = {}
# for words, score in answer_key_words:
#     for word in words:
#         if word in keyword_scores:
#             keyword_scores[word] += score/len(words)
#         else:
#             keyword_scores[word] = score/len(words)

# preprocessed_student_answer = preprocess_text(student_answer)


def grade_short_answer(student_answer_words, keyword_scores):
    total_score = 0
    for word, score in keyword_scores.items():
        if word in student_answer_words:
            total_score += score

    # 确保总分不超过10分
    total_score = min(total_score, 10)

    return total_score


# score = grade_short_answer(preprocessed_student_answer, keyword_scores)
# print("Score:", score)

# from src.utils import generate_uuid
#
# for i in range(245):
#     print(generate_uuid())

date = datetime.datetime.now().strftime('%Y-%m-%d')
print(date)
