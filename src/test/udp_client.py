#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/2/2 18:12
# @Author  : yilifeng
# @File    : udp_client.py
# @Software: PyCharm

import socket
import time

from src.config.setting import settings


class UDPClient:
    def __init__(self):
        self.server_address = (settings.UDP_ADDRESS, settings.UDP_PORT)
        self.udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    def sendToUDPSever(self, data):
        self.udp_socket.sendto(data, self.server_address)
        data, server_address = self.udp_socket.recvfrom(1024)
        print('UDP Client Received Data From Server: ', data)


if __name__ == "__main__":
    u_c = UDPClient()
    data = b'Hello, UDP Server!'
    for i in range(20):
        u_c.sendToUDPSever(data + str(i).encode())
        time.sleep(1)
