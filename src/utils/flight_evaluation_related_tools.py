#!/usr/bin/python
# -*- coding: utf-8 -*-
# @Time    : 2024/05/15
# @Author  : MementoMori
# @File    :
# @Software: PyCharm
# @desc    : 飞行数据工具类
import pytz
import pandas as pd
from datetime import date
from astral.sun import sun
from astral import LocationInfo
from src.config.setting import settings


class AstralTimeCalculator:
    """
    获取指定日期的天亮、日出、日没、天黑四个时间点
    """

    def __init__(self, city_name, country, region, latitude, longitude, timezone_str):
        """
        初始化天文时间计算器。
        Args:
            city_name:
            country:
            region:地区
            latitude:
            longitude:
            timezone_str:时区
        """
        self.location = LocationInfo(city_name, country, region, latitude, longitude)
        self.timezone = pytz.timezone(timezone_str)

    def get_astral_times(self, named_date=date.today()):
        """
        获取指定日期的天亮、日出、日没、天黑时刻。

        Args:
            named_date: 查询的日期，默认为今天

        Returns:
                包含各个时刻的字典
        """
        # 创建Sun实例，并设置时区
        s = sun(self.location.observer, date=named_date, tzinfo=self.timezone)

        # 直接从sun实例中获取已转换为当地时区的时间
        dawn = s["dawn"]
        sunrise = s["sunrise"]
        sunset = s["sunset"]
        dusk = s["dusk"]

        return {
            "daybreak": dawn.strftime('%Y-%m-%d %H:%M:%S'),
            "sunrise": sunrise.strftime('%Y-%m-%d %H:%M:%S'),
            "sunset": sunset.strftime('%Y-%m-%d %H:%M:%S'),
            "dark": dusk.strftime('%Y-%m-%d %H:%M:%S')
        }


class RecognitionAndEvaluationAlgorithm:
    """
    飞行动作识别与评估算法
    """

    def __init__(self):
        pass

    def load_flight_data(self, file_path):
        """
        飞行数据中读取并解析关键的飞行参数
        Args:
            file_path:

        Returns:

        """
        # 假设数据存储在CSV文件中
        return pd.read_csv(file_path)

    def recognition_phase(self, data):
        """
        根据速度、高度和时间拆分为三个阶段（起飞、任务、着陆段）
        Args:
            data:

        Returns:

        """

        def recognition_takeoff():
            rollout, rotate, lift_off, retract_landing_gear, climb_out = False, False, False, False, False

        def recognition_landing():
            retract_landing_gear, flare, touchdown, rollout = False, False, False, False

        # 这里需要定义具体的条件来分割飞行阶段，例如基于时间或高度的变化
        takeoff, mission, landing = None, None, None
        # 实现逻辑来确定每个阶段的数据范围
        for con in enumerate(data):
            pass
        return takeoff, mission, landing

    def recognition_action(self, data):
        """
        进行动作识别
        Args:
            data:

        Returns:

        """
        actions = []
        for index, row in data.iterrows():
            # 根据滑跑、抬前轮、离地等条件判断并添加动作到actions列表
            pass
        return actions

    def landing_and_takeoff_exercises(self, single_data):
        """
        起落课目
        Returns:

        """
        pass

    def roll_maneuver(self, single_data):
        """
        横滚动作
        Returns:

        """
        pass

    def barrel_roll_maneuver(self, single_data):
        """
        桶滚动作
        Returns:

        """
        pass

    def loop_maneuver(self, single_data):
        """
        斤斗动作
        Returns:

        """
        pass

    def turn_or_spiral_maneuver(self, single_data):
        """
        盘旋动作
        Returns:

        """
        pass

    def dive_maneuver(self, single_data):
        """
        俯冲动作
        Returns:

        """
        pass

    def pitch_up_or_climbing_maneuver(self, single_data):
        """
        跃升动作
        Returns:

        """
        pass

    def tailslide_or_astern_slide(self, single_data):
        """
        尾冲
        Returns:

        """
        pass

    def recognition_action_phase(self, action_data):
        """
        动作识别的三个阶段（分进入、保持和改出阶段）
        Args:
            action_data:

        Returns:

        """
        enter_phase, hold_phase, exit_phase = [], [], []
        # 根据坡度、俯仰角等变化来划分动作阶段
        return enter_phase, hold_phase, exit_phase

    def evaluate_action_phase(self, phase_data, standards):
        """
        根据评估标准库对各阶段进行打分
        Args:
            phase_data:
            standards:

        Returns:

        """
        score = 0
        # 根据实际飞行数据和标准库中的阈值比较来打分
        return score

    def calculate_total_score(self, scores):
        """
        计算所有打分的平均分作为该架次的总分
        Args:
            scores:

        Returns:

        """
        if scores:
            return sum(scores) / len(scores)
        return 0


calculator = AstralTimeCalculator(
    city_name=settings.CITY_NAME,
    country=settings.COUNTRY,
    region=settings.REGION,
    latitude=float(settings.LATITUDE),
    longitude=float(settings.LONGITUDE),
    timezone_str=settings.TIMEZONE_STR
)

if __name__ == "__main__":
    import asyncio

    # 使用示例
    calculator = AstralTimeCalculator(
        city_name=settings.CITY_NAME,
        country=settings.COUNTRY,
        region=settings.REGION,
        latitude=float(settings.LATITUDE),
        longitude=float(settings.LONGITUDE),
        timezone_str=settings.TIMEZONE_STR
    )

    # 获取今天在北京的天文时间
    times_today = calculator.get_astral_times()
    for time_name, time_str in times_today.items():
        print(f"{time_name}: {time_str}")
