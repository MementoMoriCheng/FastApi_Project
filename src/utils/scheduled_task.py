import asyncio
import os.path
from dateutil import tz
from src import settings
from datetime import datetime, timedelta, timezone
from src.utils.sql_config import sql_handle
from src.utils.constant import PLAN_STUDENT, GRADUATION_DATE
from src.utils.tools import get_current_server_ip, export_server_datas
from src.utils.responses import fetch_external_data, fetch_external_upload_file, fetch_do_restore_file


async def read_future_time():
    graduation_info, graduation_dict = [], {}
    stu_res = await sql_handle.select(PLAN_STUDENT)
    for stu in stu_res:
        if not stu[GRADUATION_DATE]:
            continue
        graduation_info.append((stu['username'], stu[GRADUATION_DATE]))
        graduation_dict[stu['username']] = stu[GRADUATION_DATE].strftime('%Y-%m-%d')
    return graduation_info, graduation_dict


# 执行的任务
async def perform_task(usernames):
    print(f"Task executed at:{datetime.now()}, usernames:{usernames}")
    url = settings.UNSYNC_USER_URL
    await fetch_external_data(url, usernames)


async def set_scheduled_tasks():
    username_list = []
    future_times, graduation = await read_future_time()
    print(f"Student graduation information: {graduation}")
    for task_id, future_time in future_times:
        scheduled_time = future_time.strftime("%Y-%m-%d %H:%M:%S")

        scheduled_datetime = datetime.strptime(scheduled_time, "%Y-%m-%d %H:%M:%S")
        current_datetime = datetime.now()

        after_day = scheduled_datetime + timedelta(days=1)

        if current_datetime.date() == after_day.date():
            username_list.append(task_id)

    if username_list:
        await perform_task(username_list)


async def sync_datas():
    dir_name = str(datetime.now().strftime("%Y%m%d%H%M%S"))
    print(f"sync_datas:{dir_name}")
    local_path, ftp_path = await export_server_datas(dir_name, True)
    host = settings.SYNC_DATAS
    url = f"{host}api/sys_info/sync_backup_file"
    extra_data = f"from: {get_current_server_ip()}"

    response_result = await fetch_external_upload_file(url, local_path, "auto_sync_datas", extra_data)
    print(response_result)
    os.remove(local_path)

    if not response_result["code"]:
        url = f"{host}api/sys_info/restore_datas/"
        response_result = await fetch_do_restore_file(url, "auto_sync_datas", response_result["data"], extra_data)
        print(response_result)


async def scheduled_task_main():
    while True:
        now = datetime.now(tz=tz.tzlocal())
        target_time = now.replace(hour=settings.DEFAULT_TIME_HOUR, minute=settings.DEFAULT_TIME_MINUTE,
                                  second=settings.DEFAULT_TIME_SECOND, microsecond=settings.DEFAULT_TIME_MICROSECOND)

        # If the current time is past the target time, we need to set the target for the next day.
        if now.time() > target_time.time():
            target_time += timedelta(days=1)
        sleep_time = (target_time - now).total_seconds()
        await asyncio.sleep(sleep_time)
        await set_scheduled_tasks()


async def scheduled_sync_datas():
    while True:
        month, day, weekday, hour, minute, second, microsecond = (settings.DEFAULT_TIME_MONTH,
                                                                  settings.DEFAULT_TIME_DAY,
                                                                  settings.DEFAULT_TIME_WEEK,
                                                                  settings.DEFAULT_TIME_HOUR,
                                                                  settings.DEFAULT_TIME_MINUTE,
                                                                  settings.DEFAULT_TIME_SECOND,
                                                                  settings.DEFAULT_TIME_MICROSECOND)

        now = datetime.now(tz=tz.tzlocal()).astimezone()
        target_time = datetime(now.year,
                               month=month if month != 0 else now.month,
                               day=day if day != 0 else now.day,
                               hour=hour, minute=minute, second=second,
                               microsecond=microsecond, tzinfo=tz.tzlocal())
        # If the current time is past the target time, we need to set the target for the next occurrence.
        if now > target_time:
            # Calculate the next occurrence based on the provided year, month, and day values.
            if month == 0 and day != 0:
                # 每月执行
                if now.day > day:
                    target_time = target_time.replace(month=now.month + 1, day=day)
            elif month == 0 and day == 0 and weekday != 0:
                # 每周执行
                days_ahead = (weekday - (now.weekday() + 1)) % 7
                target_time = now + timedelta(days=days_ahead)
                target_time = target_time.replace(hour=hour, minute=minute, second=second, microsecond=microsecond)
            else:
                # 指定日期执行
                target_time += timedelta(days=1)

        sleep_time = (target_time - now).total_seconds()
        await asyncio.sleep(sleep_time)
        await sync_datas()


async def run_scheduled_tasks():
    asyncio.create_task(scheduled_task_main())
    asyncio.create_task(scheduled_sync_datas())


if __name__ == "__main__":
    asyncio.run(run_scheduled_tasks())
