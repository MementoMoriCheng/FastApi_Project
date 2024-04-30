import os
import colorlog
import logging
from pathlib import Path
from threading import Lock
from logging import NullHandler
from logging.handlers import RotatingFileHandler
from src.config.setting import settings
from src.utils import generate_uuid
from datetime import datetime


def generate_mysql_log_data(**log_data):
    """
    数据库数据格式
    Args:
        log_data:

    Returns:

    """
    log_records = {
        'id': generate_uuid(),
        'level': log_data['level'],
        'is_delete': 0,
        'handle_user': log_data['handle_user'],
        'handle_reason': log_data['handle_reason'],
        'handle_params': log_data['handle_params'],
        'entity_type': log_data['entity_type'],
        'entity_id': log_data['entity_id'],
        'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
    }
    return log_records


def singleton(cls):
    instances = {}

    def _singleton(*args, **kwargs):
        if cls not in instances:
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]

    return _singleton


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


@singleton
class Logger:
    """
    Logger类，用于创建和管理日志记录
    """

    def __init__(self, console=True):
        self.mutex = Lock()
        self.console = console
        self._logger_instance = None
        log_dir = settings.LOG_PATH if settings.LOG_PATH else os.path.join(settings.ROOT_PATH, "log")
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

    def _configure_handlers(self, logger):
        """
        配置日志处理器并添加到日志器
        Args:
            logger (logging.Logger): 日志器实例
        """
        console_handler = colorlog.StreamHandler()
        console_handler.setFormatter(ColoredFormatter())
        console_handler.setLevel(logging.ERROR if self.console else logging.NOTSET)

        rotate_handler = RotatingFileHandler(
            filename=self.log_name, maxBytes=200 * 1024 * 1024, backupCount=10)
        rotate_handler.setFormatter(self.log_format)

        logger.addHandler(console_handler if self.console else NullHandler())
        logger.addHandler(rotate_handler)

    def get_logger(self):
        """
        返回已配置好的日志器。在获取日志器时，会根据console参数决定是否添加控制台日志处理器，
        并总是添加基于文件大小轮转的日志处理器
        Returns:

        """
        with self.mutex:
            if self._logger_instance is None:
                logger = self._create_logger()
                self._configure_handlers(logger)
                self._logger_instance = logger

        return self._logger_instance


logger = Logger().get_logger()
