import os
import colorlog
import logging
import datetime
import asyncio
from pathlib import Path
from threading import Lock
from logging.handlers import TimedRotatingFileHandler
from logging.handlers import RotatingFileHandler
from src.config.setting import settings
from src.utils.sql_config import sql_handle
from src.utils.constant import LOG_RECORDS


# 在类的导入部分添加：
class ColoredFormatter(colorlog.ColoredFormatter):
    log_colors = {
        "DEBUG": "reset",
        "INFO": "reset",
        "WARNING": "bold_yellow",
        "ERROR": "bold_red",
        "CRITICAL": "bold_red",
    }

    def __init__(self, *args):
        super().__init__(*args, log_colors=self.log_colors, datefmt=None, reset=True, style='%',
                         fmt="%(asctime)s %(levelname)8s %(name)s [%(filename)s:%(lineno)d]: %(message)s")


class Logger:
    """
    Logger类，用于创建和管理日志记录
    """

    def __init__(self, console=True):
        self.mutex = Lock()
        self.console = console
        log_dir = settings.LOG_PATH if settings.LOG_PATH else os.path.join(
            Path(__file__).absolute().parent.parent.parent, "log")
        log_path = Path(log_dir)
        if not log_path.is_dir():
            log_path.mkdir(parents=True)

        self.log_name = os.path.join(log_path, settings.LOG_NAME)
        self.log_format = logging.Formatter(
            "%(asctime)s %(levelname)8s %(name)s [%(filename)s:%(lineno)d]: %(message)s")

    @staticmethod
    def _create_logger():
        """
        创建一个新的日志器实例
        Returns:

        """
        _logger = logging.getLogger(__name__)
        _logger.setLevel(level=logging.INFO)
        return _logger

    def _console_handler(self):
        """
        创建一个控制台日志处理器，当console=True时将输出到标准输出流（如终端）。设置该处理器的日志格式
        与全局一致。
        Returns:

        """
        console_handler = colorlog.StreamHandler()
        console_handler.setFormatter(ColoredFormatter())
        console_handler.setLevel(level=logging.ERROR if self.console else logging.NOTSET)

        return console_handler

    def _time_rotate_handler(self):
        """
        创建一个定时轮转文件日志处理器，每天凌晨（MIDNIGHT）进行日志文件轮转，保留最近30天的日志备份，
        文件编码为UTF-8，且具有一定的延迟写入特性
        Returns:

        """
        time_rotate_handler = TimedRotatingFileHandler(
            filename=self.log_name, when='MIDNIGHT', interval=1, backupCount=30,
            encoding="UTF-8", delay=True, utc=False, atTime=datetime.time())
        time_rotate_handler.setFormatter(self.log_format)

        return time_rotate_handler

    def _rotate_handler(self):
        """
        创建一个基于文件大小轮转的日志处理器，当日志文件大小达到200MB时进行轮转，最多保留10个备份文件
        Returns:

        """
        rotate_handler = RotatingFileHandler(
            filename=self.log_name, maxBytes=200 * 1024 * 1024, backupCount=10)
        rotate_handler.setFormatter(self.log_format)

        return rotate_handler

    def get_logger(self):
        """
        返回已配置好的日志器。在获取日志器时，会根据console参数决定是否添加控制台日志处理器，
        并总是添加基于文件大小轮转的日志处理器
        Returns:

        """
        logger = self._create_logger()
        with self.mutex:
            if self.console:
                logger.addHandler(self._console_handler())
            logger.addHandler(self._rotate_handler())

        return logger


logger = Logger().get_logger()


def add_log_records(log_records):
    """
    {
        'id': "主键，一般为uuid",
        'level': "0: debug, 1: info, 2: warning, 3: error",
        'is_delete': "是否删除, 1：删除、0：保留，默认值：0",
        'handle_user': "操作人",
        'handle_reason': "操作原因",
        'handle_params': "操作参数",
        'entity_type': "操作数据库表的名字",
        'entity_id': "操作的实体id",
    }
    Args:
        log_records:

    Returns:

    """
    LOG_RECORDS.update(id=5, level=3, is_delete=1)
    res = asyncio.run(sql_handle.insert("log_manage", LOG_RECORDS))
    if not res:
        return False
    return True


if __name__ == '__main__':
    add_log_records("haha")

# LOG_RECORDS.update(id="id", level="level")
#
# print(LOG_RECORDS)
