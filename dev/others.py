import copy
import re
import struct
from pprint import pprint

src_path = "D:\\File\\dzm9b"

with open(src_path, "rb") as f:
    binary_content = f.read()

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
total_substrings = len(binary_content) // 66

# 分割出所有子串
split_strings = [binary_content[i * 66:(i + 1) * 66] for i in range(total_substrings)]


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


list_a = ['xiaohua', 'haha', 'dada', 'aa', 'a']
list_b = ['xiaohua', 'haha', 'dada', 'aa']

# 转换为集合以找到差集
diff_set = set(list_a) - set(list_b)
# print(diff_set)
if diff_set:
    print(f"Differential:{diff_set}")
else:
    print("No Differential")
# 将差集转换回列表形式
# diff_list = list(diff_set)
# print(diff_list)