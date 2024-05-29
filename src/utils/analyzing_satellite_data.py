import struct
import datetime

from src.utils import generate_uuid


def generate_mysql_flight_alarm(parsed_flight_data, time_str):
    """
    Generate a mysql flight data
    Args:
        parsed_flight_data:
        time_str: 北斗数据包解析的数据

    Returns:

    """
    flight_data = {
        'id': generate_uuid(),
        'plane_code': parsed_flight_data[3],
        'low_altitude': False,
        'altitude': parsed_flight_data[8],
        'low_speed': False,
        'speed': parsed_flight_data[12],
        'lost_speed': False,
        'over_temperature': False,
        'temperature': None,
        'shutdown': False,
        'engine_speed': None,
        'note_1': None,
        'note_2': None,
        'note_3': None,
        'time': time_str,
        'is_delete': 0,
        'update_time': datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }
    return flight_data


def generate_mysql_flight_data(parsed_flight_data, time_str):
    """
    Generate a mysql flight data
    Args:
        parsed_flight_data:
        time_str: 北斗数据包解析的数据

    Returns:

    """
    flight_data = {
        'id': generate_uuid(),
        'time': time_str,
        'plane_code': parsed_flight_data[3],
        'beidou_height': parsed_flight_data[8],
        'ground_speed': parsed_flight_data[12],
        'heading': parsed_flight_data[21],
        'longitude': parsed_flight_data[7],
        'latitude': parsed_flight_data[6],
        'pitch_angle': parsed_flight_data[21],
        'bank_angle': None,
        'longitudinal_load_factor': None,
        'lateral_load_factor': None,
        'normal_load_factor': None,
        'mach_number': calculate_mach_number(parsed_flight_data[12]),
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
        'is_delete': 0,
        'update_time': datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }
    return flight_data


def calculate_mach_number(flight_speed):
    """
    calculate mach number
    Args:
        flight_speed:

    Returns:

    """
    return flight_speed / 341


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
        'positioning_status': parsed_gnss_data[15],
        'observation_satellite': parsed_gnss_data[16],
        'calculate_satellite': parsed_gnss_data[17],
        'rtk_satellite': parsed_gnss_data[18],
        'differential_age': parsed_gnss_data[19],
        'azimuth': parsed_gnss_data[21],
        'pitch': parsed_gnss_data[21],
        'checksum': parsed_gnss_data[22],
        'is_delete': 0,
        'update_time': datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
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
     data_to_be_parsed_1, data_to_be_parsed_2, differential_age, azimuth, pitch, checksum) = (
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
    # 解析卫星信息
    observation_satellite = int(bin(data_to_be_parsed_1)[2:6], 2)
    positioning_status = int(bin(data_to_be_parsed_1)[6:], 2)  # 低四位
    rtk_satellite = int(bin(data_to_be_parsed_2)[2:6], 2)
    calculate_satellite = int(bin(data_to_be_parsed_2)[6:], 2)  # 低四位

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
    print("Differential Age: ", differential_age)
    print("Azimuth: ", azimuth)
    print("Pitch: ", pitch)
    print("Checksum: ", checksum)
    print("Positioning Status: ", positioning_status)
    print("Observation Satellite: ", observation_satellite)
    print("Calculate Satellite: ", calculate_satellite)
    print("RTK Satellite: ", rtk_satellite)

    return ((sync_code1, sync_code2, sync_code3, identify_code, gps_week, gps_milliseconds, latitude, longitude,
             altitude, latitude_stddev, longitude_stddev, altitude_stddev, horizon_speed, upward_speed, track_direction,
             positioning_status, observation_satellite, calculate_satellite, rtk_satellite, differential_age,
             azimuth, pitch, checksum),
            utc_date_time.strftime('%Y%m%d%H%M%S'), identify_code)


if __name__ == '__main__':
    src_path = "D:\\File\\dzm9b"
    with open(src_path, "rb") as f:
        binary_content = f.read()
    split_strings = split_gnss_data(binary_content)
    # print(split_strings)
    target_byte = split_strings[300]
    # print(target_byte)
    a, b, c = parse_gnss_data(target_byte)
    print(a, b, c)
