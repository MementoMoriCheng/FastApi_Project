# !/usr/bin/python
# -*- coding: utf-8 -*-

# 默认次数
DEFAULT_PLY = 1

# 默认间隔
FLIGHT_INTERVAL = 30

# 逻辑删除标识
DELETE = 1
RESERVE = 0

# 是否发布
PUBLISHED = 1

# 是否是父列
FATHER = 1
SON = 0

# 关联表列指定长度
COLUMN_LENGTH = 36

# 开关
ENABLE = 1  # 角色已启用

# 飞行数据表名
FLIGHT_DATA_TABLE = "gnss_data"

# 中间表
INTERMEDIATE_TABLE = "intermediate_table"

# 课程、专业、题型
COURSE_NAME = "full_name"
MAJOR_NAME = "n_r__iRnX"
TYPE_NAME = "n_r__zNrr"

# 飞机信息登记表机号列名
AIRCRAFT_ID = "j_h__bGYP"
SHORT_AIRCRAFT_ID = "j_h__fFmZ"
AIRCRAFT_TYPE = "j_x__CchN"
# 机型
AIRCRAFT_TYPE_TABLE = "auto_j_x_d_j_b__ddkz"
# 飞机信息登记表内容
FLYABLE_ITEM = "k_f_k_m__JHba"
NO_FLY_ITEM = "j_f_k_m__Sdzb"
PLANE_STATUS = "f_j_zh_t__sbwY"
# 已飞时间
AIRFRAME_TIME = "j_sh_sh_j__dZMc"
ENGINE_TIME = "f_d_j_sh_j__tSRE"
PROPELLER_TIME = "l_x_j_sh_j__BEM_"

# 飞机状态字典
AIRCRAFT_STATUS = "auto_f_j_zh_t_z_d__zfmb"
STATUS_NUMBER = "x_h__at_T"
STATUS_CONTENT = "n_r__krXX"
# 空域
AIRSPACE_TABLE = "auto_k_y_x_x_d_j_b__rxsr"
AIRSPACE_AIRPORT = "j_ch__jRHK"
AIRSPACE_NUMBER = "x_h__nDCQ"
AIRSPACE = "k_y__KNS_"
ADJACENT_AIRSPACE = "x_l_k_y__XXxA"

# 教员表
PLAN_COACH = "auto_j_y_x_x_b__etdf"
COACH_NAME_COL = "x_m__QYBH"
# 航线表
PLAN_ROUTE = "auto_h_x_g_l__gfxb"
# 学员表
PLAN_STUDENT = "auto_x_y_x_x_b__dxtc"
STUDENT_CODE_NAME = "d_h__PDxr"
# 飞机表
PLAN_PLANE = "auto_f_j_x_x_d_j_b__hrwm"

# 网卡名字
NETWORK_CARD_NAME = ["virtual", "vmware", "vmnet", "vethernet (wsl)"]

# 导出文件信息
# 题库信息
COLUMNS_TO_KEEP = ['QID', 'department', 'major', 'course', 'chapter', 'section', 'type', 'option_number', 'question',
                   'evaluate_answers', 'answer']

# 机载站号对应飞机简号
station_id_2_plane_id = {"2": "20", "3": "19", "4": "18", "5": "21"}


class RecordsStatusCode:
    """数据库记录日志状态码"""

    DEBUG = 0
    INFO = 1
    WARNING = 2
    ERROR = 3


class SubjectSchedulingPriority:
    """课目编排优先级"""

    Highest = 0
    Middle = 1
    Lowest = 2


class SchedulingCondition:
    """课目编排影响因素"""
    # 天气因素
    good_visibility = 50
    bad_visibility = 50
    good_cloud = 50
    bad_cloud = 50
    good_wind_speed = 50
    bad_wind_speed = 50
    # 飞机状况和数量
    plane_status = 0  # 状态码
    plane_number_many = 50
    plane_number_few = 10
    # 可用空域数量
    airspace_number_many = 50
    airspace_number_few = 10
    # 教员、学员数量比
    ratio_coach_and_student_many = 10
    ratio_coach_and_student_few = 5


class QuestionTypeIndex:
    """题型类型"""
    SingleChoice = 0
    MultipleChoice = 1
    Fill = 2
    Judge = 3
    ShortAnswer = 4


QUESTION_TYPE_LIST = ['single_choice_num', 'multiple_choice_num', 'fill_num', 'judge_num', 'short_answer_num']
DEFAULT_EXAMINATION = {
    "course_1": None,
    "course_2": None,
    "course_3": None,
    "course_4": None,
    "course_5": None,
    "course_6": None,
    "course_7": None,
    "course_8": None,
    "course_9": None,
    "course_10": None,
    "ratio_1": None,
    "ratio_2": None,
    "ratio_3": None,
    "ratio_4": None,
    "ratio_5": None,
    "ratio_6": None,
    "ratio_7": None,
    "ratio_8": None,
    "ratio_9": None,
    "ratio_10": None,
    "single_choice_num": None,
    "multiple_choice_num": None,
    "fill_num": None,
    "judge_num": None,
    "short_answer_num": None,
    "single_choice_score": None,
    "multiple_choice_score": None,
    "fill_score": None,
    "judge_score": None,
    "short_answer_score": None
}

# 数据库记录日志格式
LOG_RECORDS = {
    'id': "主键，一般为uuid",
    'level': "0: debug, 1: info, 2: warning, 3: error",
    'is_delete': "是否删除, 1：删除、0：保留，默认值：0",
    'handle_user': "操作人",
    'handle_reason': "操作原因",
    'handle_params': "操作参数",
    'entity_type': "操作数据库表的名字",
    'entity_id': "操作的实体id",
    'create_time': "时间"
}

# 数据库记录GNSS数据格式
GNSS_RECORDS = {
    'id': "主键，一般为uuid",
    'sync_code1': '同步码1',
    'sync_code2': '同步码2',
    'sync_code3': '同步码3',
    'identify_code': '识别码',
    'gps_week': 'GPS周数',
    'gps_milliseconds': 'GPS毫秒数',
    'latitude': '纬度',
    'longitude': '经度',
    'altitude': '海拔高度',
    'latitude_stddev': '纬度标准偏差',
    'longitude_stddev': '经度标准偏差',
    'altitude_stddev': '海拔高度标准偏差',
    'horizon_speed': '水平速度',
    'upward_speed': '垂直速度',
    'track_direction': '航迹方向',
    'positioning_status': '定位状态',
    'observation_satellite': '卫星数量',
    'calculate_satellite': '解算卫星数',
    'rtk_satellite': '双频RTK 卫星数',
    'differential_age': '差分龄期',
    'azimuth': '方位角',
    'pitch': '俯仰角',
    'checksum': '校验和',
    'update_time': "时间",
    'flight_time': "飞机飞行时间",
    'is_delete': "是否删除, 1：删除、0：保留，默认值：0"
}

# 数据库记录FLIGHT_DATA格式
FLIGHT_DATA = {
    'id': None,
    'time': None,
    'update_time': None,
    'plane_code': None,
    'beidou_height': None,
    'ground_speed': None,
    'heading': None,
    'longitude': None,
    'latitude': None,
    'pitch_angle': None,
    'bank_angle': None,
    'longitudinal_load_factor': None,
    'lateral_load_factor': None,
    'normal_load_factor': None,
    'mach_number': None,
    'vertical_rate': None,
    'angle_of_attack': None,
    'side_slip_angle': None,
    'pressure_altitude': None,
    'radio_altitude': None,
    'indicated_airspeed': None,
    'true_airspeed': None,
    'engine_rpm': None,
    'engine_temperature': None,
    'oil_temperature': None,
    'remaining_fuel': None,
    'landing_gear_position': None,
    'throttle_position': None,
    'aileron_position': None,
    'elevator_position': None,
    'rudder_position': None,
    'is_delete': None
}

# 数据库记录FLIGHT_ALARM格式
FLIGHT_ALARM = {
    'id': None,
    'plane_code': None,
    'low_altitude': None,
    'altitude': None,
    'low_speed': None,
    'speed': None,
    'lost_speed': None,
    'over_temperature': None,
    'temperature': None,
    'shutdown': None,
    'engine_speed': None,
    'note_1': None,
    'note_2': None,
    'note_3': None,
    'time': None,
    'update_time': None,
    'is_delete': None
}

# 制定飞行计划参数字典
FLIGHT_PLAN_PARAMETER = {
    "PID": "",
    "route_ids": "",
    "plane_ids": "",
    "coach_ids": "",
    "student_ids": "",
    "start_time": "",
    "end_time": "",
    "name": "",
    "flight_duration": "",
    "flight_interval": "",
    "status": 1
}

FLIGHT_PLAN_CONTENT = {
    'code': None,
    'description': None,
    'create_user': None,
    'update_user': None,
    'is_delete': None,
    'create_time': None,
    'update_time': None,
    'id': None,
    'PID': None,
    'BID': None,
    'aircraft_type': None,
    'aircraft_id': None,
    'longitudinal_position': None,
    'scheduled_takeoff': None,
    'initiate_takeoff': None,
    'engine_start': None,
    'landing': None,
    'parking': None,
    'trainee_subject': None,
    'practice_combination': None,
    'launch_interval': None,
    'preparation_time': None,
    'number_of_practices': None,
    'number_of_flyers': None,
    'crew_combination': None,
    'current_status': None,
    'front_cabin_name': None,
    'front_cabin_code': None,
    'rear_cabin_name': None,
    'rear_cabin_code': None,
    'other_info': None
}
