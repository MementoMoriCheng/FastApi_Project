import itertools
import random
from collections import defaultdict
from datetime import datetime

# 四个列表
students = ['student1', 'student2', 'student3', 'student4', 'student5']
teachers = ['teacher1', 'teacher2', 'teacher3', 'teacher4']
planes = ['plane1', 'plane2', "plane3"]
routes = ['route1', 'route2', "route3", "route4"]


# 合并所有列表
# all_elements = students + teachers + planes + routes

# 进行全排列
# permutations_result = list(itertools.permutations(all_elements))
#
# # 输出结果
# for p in permutations_result:
#     print(p)

def gen_cartesian_product(students, teachers, planes):
    """
    资源全排列
    Args:
        students:
        teachers:
        planes:

    Returns:

    """

    return list(itertools.product(students, teachers, planes))


# dd_list = gen_cartesian_product( students, teachers, planes)
# print(dd_list)


def find_unique_elements(list1, list2):
    unique_elements = []

    for element2 in list2:
        is_unique = True

        for element1 in list1:
            if element2[0] == element1[0] or element2[1] == element1[1] or element2[2] == element1[2]:
                is_unique = False
                break

        if is_unique:
            unique_elements.append(element2)

    return unique_elements


list1 = [(6, 6, 4), (7, 7, 4), (5, 5, 5), (7, 7, 6)]
list2 = [(5, 5, 4), (5, 5, 5), (5, 5, 6), (5, 6, 4), (5, 6, 5), (5, 6, 6), (5, 7, 4), (5, 7, 5), (5, 7, 6), (5, 8, 4),
         (5, 8, 5), (5, 8, 6), (6, 5, 4), (6, 5, 5), (6, 5, 6), (6, 6, 4), (6, 6, 5), (6, 6, 6), (6, 7, 4), (6, 7, 5),
         (6, 7, 6), (6, 8, 4), (6, 8, 5), (6, 8, 6), (7, 5, 4), (7, 5, 5), (7, 5, 6), (7, 6, 4), (7, 6, 5), (7, 6, 6),
         (7, 7, 4), (7, 7, 5), (7, 7, 6), (7, 8, 4), (7, 8, 5), (7, 8, 6), (8, 5, 4), (8, 5, 5), (8, 5, 6), (8, 6, 4),
         (8, 6, 5), (8, 6, 6), (8, 7, 4), (8, 7, 5), (8, 7, 6), (8, 8, 4), (8, 8, 5), (8, 8, 6)]
# unique_elements = find_unique_elements(list1, list2)
# print(unique_elements)

random.shuffle(list1)
print(list1)


def generate_mysql_log_data(**log_data):
    """
    数据库数据格式
    Args:
        log_data:

    Returns:

    """
    log_records = {
        'id': 1,
        'level': 1,
        'is_delete': 0,
        'handle_user': log_data['handle_user'],
        'handle_reason': log_data['handle_reason'],
        'handle_params': 'Hello, UDP Server!',
        'entity_type': 'Hello, UDP Server!',
        'entity_id': 'Hello, UDP Server!',
        'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
    }
    return log_records


# a = generate_mysql_log_data(handle_user="李狗蛋", handle_reason="李狗蛋擦做")
# print(a)

d_ct = {'student_id': 5, 'route_id': 4, 'coach_id': 5, 'plane_id': 5, 'plan_duration': 120,
        'plan_time_start': '2024-03-06 13:00:00', 'plan_time_end': '2024-03-06 15:00:00',
        'real_time_start': '2024-03-06 13:00:00', 'real_time_end': '2024-03-06 15:00:00', 'handle_user': 'sysadmin',
        'handle_reason': None, 'status': 1, 'name': 'bbb', 'description': None,
        'expand_data': {'name': 'bbb', 'fly_route': {'table': 'fly_route', 'id': [4, 5, 6]}, 'status': 1,
                        'plane': {'table': 'plane', 'id': [4, 5, 6]}, 'coach': {'table': 'coach', 'id': [5, 6, 7, 8]},
                        'student': {'table': 'student', 'id': [5, 6, 7, 8]}, 'handle_user': 'sysadmin',
                        'description': None, 'plane_most_ply': 2, 'coach_most_ply': 5, 'student_most_ply': 10,
                        'flight_interval': 30, 'flight_duration': 120, 'start_time': '2024-03-06 08:00:00',
                        'end_time': '2024-03-06 18:00:00', 'exclude_time': []}}


class PlanObject:
    def __init__(self, data_dict):
        for key, value in data_dict.items():
            setattr(self, key, value)

# plan_obj = PlanObject(d_ct)
# print(plan_obj.student_id)
