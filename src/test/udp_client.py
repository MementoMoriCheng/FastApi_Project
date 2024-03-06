#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/2/2 18:12
# @Author  : yilifeng
# @File    : udp_client.py
# @Software: PyCharm

import socket
from datetime import datetime
from src.config.setting import settings
from src.utils.logger import logger
from src.utils.sql_config import sql_handle
from src.utils import generate_uuid


class UDPClient:
    def __init__(self):
        self.server_address = (settings.UDP_ADDRESS, settings.UDP_PORT)
        self.udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    def sendToUDPSever(self, data):
        self.udp_socket.sendto(data, self.server_address)
        data, server_address = self.udp_socket.recvfrom(1024)
        print('UDP Client Received Data From Server: ', data)


if __name__ == "__main__":
    # u_c = UDPClient()
    # src_path = "D:\\File\\dzm9b"
    # with open(src_path, "rb") as f:
    #     binary_content = f.read()
    # total_substrings = len(binary_content) // 66
    # split_strings = [binary_content[i * 66:(i + 1) * 66] for i in range(total_substrings)]
    # for data in split_strings:
    #     u_c.sendToUDPSever(data)
    #     time.sleep(1)
    # u_c.sendToUDPSever(binary_content)
    logger.info('Hello, UDP Server!')
    logger.warning('Hello, UDP Server!')
    logger.error('Hello, UDP Server!')
    log_records = {
        'id': generate_uuid(),
        'level': 3,
        'is_delete': 0,
        'handle_user': 'Hello, UDP Server!',
        'handle_reason': 'Hello, hahaha UDP Server!',
        'handle_params': 'Hello, UDP Server!',
        'entity_type': 'Hello, UDP Server!',
        'entity_id': 'Hello, UDP Server!',
        'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
    }
    sql_handle.add_records("log_manage", log_records)
    # data = b'Hello, UDP Server!'
    # for i in range(20):
    #     u_c.sendToUDPSever(data + str(i).encode())
    #     time.sleep(1)
