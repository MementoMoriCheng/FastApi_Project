import json
import struct
import datetime
from src.utils import generate_uuid


def generate_mysql_gnss_data(parsed_gnss_data):
    """
    数据库数据格式
    Args:
        parsed_gnss_data:

    Returns:

    """
    gnss_data = {
        'id': generate_uuid(),
        'sync_code1': parsed_gnss_data[0],
        'sync_code2': parsed_gnss_data[1],
        'sync_code3': parsed_gnss_data[2],
        'identify_code': parsed_gnss_data[3],
        'gps_week': parsed_gnss_data[4],
        'gps_milliseconds': parsed_gnss_data[5],
        'latitude': parsed_gnss_data[6],
        'longitude': parsed_gnss_data[7],
        'altitude': parsed_gnss_data[8],
        'latitude_stddev': parsed_gnss_data[9],
        'longitude_stddev': parsed_gnss_data[10],
        'altitude_stddev': parsed_gnss_data[11],
        'horizon_speed': parsed_gnss_data[12],
        'upward_speed': parsed_gnss_data[13],
        'track_direction': parsed_gnss_data[14],
        'positioning_status_satellite_count': parsed_gnss_data[15],
        'solution_satellite_count': parsed_gnss_data[16],
        'differential_age': parsed_gnss_data[17],
        'azimuth': parsed_gnss_data[18],
        'pitch': parsed_gnss_data[19],
        'checksum': parsed_gnss_data[20],
        'is_delete': 0,
        'create_time': datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }
    return gnss_data


def split_gnss_data(binary_content):
    """
    分割数据
    Args:
        binary_content:

    Returns:

    """
    total_substrings = len(binary_content) // 66
    return [binary_content[i * 66:(i + 1) * 66] for i in range(total_substrings)]


def parse_gnss_data(data):
    """
    解析gnss内容
    Args:
        data:

    Returns:

    """
    (sync_code1, sync_code2, sync_code3, identify_code, gps_week, gps_milliseconds, latitude, longitude,
     altitude, latitude_stddev, longitude_stddev, altitude_stddev, horizon_speed, upward_speed, track_direction,
     positioning_status_satellite_count, solution_satellite_count, differential_age, azimuth, pitch, checksum) = (
        struct.unpack('<BBBBHlddfffffffBBBffB', data))

    gps_epoch = datetime.datetime(1980, 1, 6)
    first_gps_week = 1024
    total_days = ((gps_week - first_gps_week) * 7) + (gps_milliseconds / (1000 * 60 * 60 * 24))
    remaining_ms = gps_milliseconds % (1000 * 60 * 60 * 24)
    hours, remainder = divmod(remaining_ms, 1000 * 60 * 60)
    minutes, seconds = divmod(remainder, 1000 * 60)
    seconds, milliseconds = divmod(seconds, 1000)
    # 合并日期和时间
    utc_date_time = gps_epoch + datetime.timedelta(days=total_days, hours=hours, minutes=minutes, seconds=seconds)

    print(utc_date_time)

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

    return struct.unpack("<BBBBHlddfffffffBBBffB", data), utc_date_time.strftime('%Y%m%d%H%M%S'), identify_code


if __name__ == '__main__':
    # src_path = "D:\\File\\dzm9b"
    src_path = "D:\\File\\Variflight_CZ3655_20240409.json"
    with open(src_path, "r") as file:
        data = json.load(file)

    gnss_data = {
        'id': generate_uuid(),
        'sync_code1': [0],
        'sync_code2': [1],
        'sync_code3': [2],
        'identify_code': [3],
        'gps_week': [4],
        'gps_milliseconds': [5],
        'latitude': [6],
        'longitude': [7],
        'altitude': [8],
        'latitude_stddev': [9],
        'longitude_stddev': [10],
        'altitude_stddev': [11],
        'horizon_speed': [12],
        'upward_speed': [13],
        'track_direction': [14],
        'positioning_status_satellite_count': [15],
        'solution_satellite_count': [16],
        'differential_age': [17],
        'azimuth': [18],
        'pitch': [19],
        'checksum': [20],
        'is_delete': 0,
        'create_time': datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }

    for con in data:
        gnss_data.update(identify_code=con['fnum'], latitude=con['latitude'], longitude=con['longitude'],
                         azimuth=con['angle'], altitude=con['height'], horizon_speed=con['speed'])
        print(con)
        print(gnss_data)
        asyncio.run(sql_handle.insert("questions", conditions))
    # split_strings = split_gnss_data(binary_content)
    # print(split_strings)
    # target_byte = split_strings[300]
    # print(target_byte)
    # a, _, _ = parse_gnss_data(target_byte)
    # print(a)
