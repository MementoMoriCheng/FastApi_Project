import random
import time
import socket
import struct
from math import radians, sin, cos
from datetime import datetime, timedelta

# 定义服务器的IP地址和端口号
SERVER_IP = '127.0.0.1'  # 本地回环地址，用于测试
SERVER_PORT = 12345  # 任意选择的端口号

# 地球平均半径，单位：千米
earth_radius_km = 6371
# 北京的经纬度
center_lat = 28.693373
center_lon = 116.064618

# 半径（单位：千米）
radius_km_1 = 50
radius_km_2 = 51

# 每隔多少度计算一个点
angle_step_degrees = 1

# 伪数据
sync_code1 = 85
sync_code2 = 187
sync_code3 = 237

gps_epoch = datetime(1980, 1, 6)

latitude_stddev = 0
longitude_stddev = 0
altitude_stddev = 0
horizon_speed = 0
upward_speed = 0
track_direction = 0
data_to_be_parsed_1 = 28
data_to_be_parsed_2 = 36
differential_age = 0
azimuth = 0
pitch = 0
checksum = 0

# 创建一个UDP套接字
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# 绑定套接字到服务器地址
server_socket.bind((SERVER_IP, SERVER_PORT))

print(f"服务器正在监听 {SERVER_IP}:{SERVER_PORT}...")


def calculate_points(center_lat, center_lon, radius_km, angle_step_degrees):
    points = []
    for angle in range(0, 360, angle_step_degrees):
        angle_radians = radians(angle)

        delta_lat = radius_km * sin(angle_radians) / earth_radius_km
        delta_lon = (radius_km * cos(angle_radians) / earth_radius_km) / cos(radians(center_lat))

        new_lat = center_lat + delta_lat
        new_lon = center_lon + delta_lon

        points.append((new_lat, new_lon))

    return points


def main():
    altitude = 100
    while True:
        try:
            data, client_address = server_socket.recvfrom(1024)
        except ConnectionResetError as e:
            # 记录错误日志
            print(f"Connection with client at address {client_address} was reset by peer: {e}")
        altitude += 100
        # 输出圆周上的点
        boundary_points_1 = calculate_points(center_lat, center_lon, radius_km_1, angle_step_degrees)
        boundary_points_2 = calculate_points(center_lat, center_lon, radius_km_2, angle_step_degrees)

        for i, point in enumerate(boundary_points_1):
            identify_code_1 = 4
            identify_code_2 = 5
            # 当前时间
            current_time = datetime.utcnow()
            time_difference = current_time - gps_epoch
            gps_time_seconds = time_difference.total_seconds()
            # 计算GPS周数
            gps_week = int(gps_time_seconds // 604800)
            # 计算周内秒数
            gps_milliseconds = int(gps_time_seconds % 604800) * 1000
            packed_data_1 = struct.pack('<BBBBHlddfffffffBBBffB', sync_code1, sync_code2, sync_code3,
                                        identify_code_1, gps_week, gps_milliseconds, point[0], point[1],
                                        altitude, latitude_stddev, longitude_stddev, altitude_stddev, horizon_speed,
                                        upward_speed, track_direction, data_to_be_parsed_1, data_to_be_parsed_2,
                                        differential_age, azimuth, pitch, checksum)

            packed_data_2 = struct.pack('<BBBBHlddfffffffBBBffB', sync_code1, sync_code2, sync_code3,
                                        identify_code_2, gps_week, gps_milliseconds, boundary_points_2[i][0],
                                        boundary_points_2[i][1], altitude, latitude_stddev, longitude_stddev,
                                        altitude_stddev, horizon_speed, upward_speed, track_direction,
                                        data_to_be_parsed_1, data_to_be_parsed_2,
                                        differential_age, azimuth, pitch, checksum)
            print(f"packed_data_1: {packed_data_1}")
            print(f"packed_data_2: {packed_data_2}")
            print(f"Point {i + 1}: Latitude = {point[0]:.6f}, Longitude = {point[1]:.6f}")
            print(f"Point {i + 1}: Latitude = {boundary_points_2[i][0]:.6f}, Longitude = {boundary_points_2[i][1]:.6f}")
            time.sleep(1)
            # # 回显数据给客户端
            server_socket.sendto(packed_data_1, client_address)
            server_socket.sendto(packed_data_2, client_address)
        print("**********************************************************************")


main()
