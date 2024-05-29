import copy
from pprint import pprint
import asyncio
from dev.constant import code_dict
from src.utils import generate_uuid
from src.utils.sql_config import sql_handle
from src.static import column_type, table_schema
from sqlalchemy import Text, Integer, String, Boolean, DateTime, Date

# src_path = "D:\\File\\text.txt"
#
# table_id = "4a19af0a-065f-430c-b616-af0cc7bd7e50"
#
# col_list = []

# with open(src_path, "r", encoding='utf-8') as f:
#     binary_content = f.readlines()
#     for i, con in enumerate(binary_content):
#         col_dict = {'table_id': table_id, 'name': '', 'code': '', 'type': '',
#                     'parent': '',
#                     'status': 1, 'field_length': None, 'is_parent': False, 'association': [], 'create_user': 'sysadmin',
#                     'primary': None,
#                     'unique': None, 'empty': True, 'is_encrypt': None}
#         col_name = con.split(' ')[0]
#         col_type = column_type.get(con.split(' ')[1])
#         if con.split(' ')[1] in ["varchar", "nvarchar"]:
#             col_length = con.split(' ')[2]
#             col_type = String(int(col_length))
#             col_dict['field_length'] = col_length
# if col_type == "Date":
#     col_type = Date
# if col_type == "DateTime":
#     col_type = DateTime
# if col_type == "Integer":
#     col_type = Integer
# if col_type == "Boolean":
#     col_type = Boolean
# col_dict['name'] = col_name
# col_dict['code'] = code_dict.get(col_name)
# col_dict['type'] = col_type
# col_list.append(col_dict)
#     table_schema[code_dict.get(col_name)] = col_type
# print(table_schema)
# pprint(col_list)
# sql_handle.create_dynamic_table_core("tools_table", table_schema)
# for content in col_list:
#     content.update(id=generate_uuid())
#     print(content)
#     asyncio.run(sql_handle.insert_only("column_manage", content))
# col_dict = {'name': '', 'code': '', 'type': '',
#             'parent': '',
#             'status': 1, 'field_length': None, 'is_parent': False, 'association': [], 'create_user': 'sysadmin',
#             'primary': None,
#             'unique': None, 'empty': True, 'is_encrypt': None}
#
# for con in range(len(col_dict)):
#     print(con)


from astral.sun import sun
from astral import LocationInfo
from datetime import date
import pytz


class AstralTimeCalculator:
    def __init__(self, city_name, country, region, latitude, longitude, timezone_str):
        """"""
        self.location = LocationInfo(city_name, country, region, latitude, longitude)
        self.timezone = pytz.timezone(timezone_str)

    def get_astral_times(self, named_date=date.today()):
        """
        获取指定日期的天亮、日出、日没、天黑时刻。

        :param named_date: 查询的日期，默认为今天
        :return: 包含各个时刻的字典
        """
        # 创建Sun实例，并设置时区
        s = sun(self.location.observer, date=named_date, tzinfo=self.timezone)

        # 直接从sun实例中获取已转换为当地时区的时间
        dawn = s["dawn"]
        sunrise = s["sunrise"]
        sunset = s["sunset"]
        dusk = s["dusk"]

        return {
            "天亮时刻": dawn.strftime('%H:%M'),
            "日出时刻": sunrise.strftime('%H:%M'),
            "日没时刻": sunset.strftime('%H:%M'),
            "天黑时刻": dusk.strftime('%H:%M')
        }


# 使用示例
calculator = AstralTimeCalculator(
    city_name="Beijing",
    country="China",
    region="Asia/Shanghai",
    latitude=39.9042,
    longitude=116.4074,
    timezone_str="Asia/Shanghai"
)

# 获取今天在北京的天文时间
times_today = calculator.get_astral_times()
for time_name, time_str in times_today.items():
    print(f"{time_name}: {time_str}")
