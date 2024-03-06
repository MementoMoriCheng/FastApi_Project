# !/usr/bin/python
# -*- coding: utf-8 -*-

# 默认最大次数
MOST_PLY = 100

# 默认间隔
FLIGHT_INTERVAL = 30

# 逻辑删除标识
DELETE = 1
RESERVE = 0

# 是否是父列
FATHER = 1
SON = 0


class RecordsStatusCode:
    """数据库记录日志状态码"""

    DEBUG = 0
    INFO = 1
    WARNING = 2
    ERROR = 3


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
    'positioning_status_satellite_count': '定位状态/卫星数量',
    'solution_satellite_count': '解决方案卫星数量',
    'differential_age': '差分龄期',
    'azimuth': '方位角',
    'pitch': '俯仰角',
    'checksum': '校验和',
    'create_time': "时间",
    'is_delete': "是否删除, 1：删除、0：保留，默认值：0"
}
