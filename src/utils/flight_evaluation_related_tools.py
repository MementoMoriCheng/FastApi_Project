#!/usr/bin/python
# -*- coding: utf-8 -*-
# @Time    : 2024/05/15
# @Author  : MementoMori
# @File    :
# @Software: PyCharm
# @desc    : 飞行数据工具类
from astral.sun import sun
from astral import LocationInfo
from datetime import date
import pytz


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
            "daybreak": dawn.strftime('%H:%M'),
            "sunrise": sunrise.strftime('%H:%M'),
            "sunset": sunset.strftime('%H:%M'),
            "dark": dusk.strftime('%H:%M')
        }


if __name__ == "__main__":
    import asyncio

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
