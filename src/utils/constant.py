# !/usr/bin/python
# -*- coding: utf-8 -*-

# 默认最大次数
MOST_PLY = 100

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


class RecordsStatusCode:
    """数据库记录日志状态码"""

    DEBUG = 0
    INFO = 1
    WARNING = 2
    ERROR = 3


class QuestionTypeIndex:
    """题型类型"""
    SingleChoice = 0
    MultipleChoice = 1
    Fill = 2
    Judge = 3
    ShortAnswer = 4


QUESTION_TYPE_LIST = ['single_choice_num', 'multiple_choice_num', 'fill_num', 'judge_num', 'short_answer_num']

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
