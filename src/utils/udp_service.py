#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/2/2 17:55
# @Author  : yilifeng, MementoMori
# @File    : udp_service.py
# @Software: PyCharm

import asyncio
import os
import shutil
import traceback
from src.config.setting import settings
from src.utils.analyzing_gnss import split_gnss_data, parse_gnss_data, generate_mysql_gnss_data
from src.utils.ftp_util import RemoteFTPService
from .logger import logger
from src.utils.sql_config import sql_handle


class UDPProtocol(asyncio.DatagramProtocol):
    """
    定义了一个UDPProtocol类，它继承自asyncio.DatagramProtocol，并在接收到数据报文时调用do_something方法处理
    数据。然后在UDPService的create方法中通过create_datagram_endpoint创建一个异步UDP端点，并在接收到数据时调
    用回调方法,新增了一个 handle_datagram 异步方法，并在 datagram_received 回调中创建一个任务来执行这个异步
    方法。同时，在 connection_made 方法中获取当前事件循环并赋值给类变量 self.loop，这样在 datagram_received
     中就可以使用它来创建任务
    """

    def __init__(self, udp_service):
        self.udp_service = udp_service
        self.loop = None

    def connection_made(self, transport):
        self.udp_service.transport = transport
        self.loop = asyncio.get_event_loop()

    async def handle_datagram(self, data, addr):
        await self.udp_service.do_something(data, addr)

    def datagram_received(self, data, addr):
        if not self.udp_service.kill:
            self.loop.create_task(self.handle_datagram(data, addr))
            self.udp_service.transport.sendto(b'Thanks for connecting.', addr)


class UDPService:
    """
    使用asyncio库实现一个基于回调的异步UDP服务器,避免阻塞FastAPI应用的主事件循环
    """

    def __init__(self):
        self.udp_socket = None
        self.kill = False
        self.loop = None
        self.transport = None
        self.udp_protocol = UDPProtocol(self)
        self.tasks = []

    async def create(self, loop):
        try:
            server_address = (settings.UDP_ADDRESS, settings.UDP_PORT)
            self.loop = loop
            transport, _ = await self.loop.create_datagram_endpoint(lambda: self.udp_protocol,
                                                                    local_addr=server_address)
            print(f'UDP service init successfully, address is: {server_address}')
        except:
            logger.error(traceback.print_exc())

    async def start(self, loop):
        self.loop = loop
        await self.create(loop)

        print('UDP Service start successfully, Waiting for clients...')

    async def stop(self):
        self.kill = True
        for task in self.tasks:
            task.cancel()
        await asyncio.gather(*self.tasks, return_exceptions=True)  # 等待所有任务结束
        if self.transport is not None:
            self.transport.close()
        self.tasks.clear()

    async def do_something(self, data, client_address):
        # 创建一个Task（子任务）来执行异步操作
        task = asyncio.create_task(self._async_do_something(data, client_address))
        await task

    async def connect_to_remote_server(self, loop):
        self.loop = loop
        remote_address = (settings.UDP_REMOTE_ADDRESS, settings.UDP_REMOTE_PORT)
        print(f"remote_address:{remote_address}")
        # 创建一个任务来处理与远程服务器的连接
        remote_connection_task = asyncio.create_task(self._async_connect_to_remote_server(remote_address))
        self.tasks.append(remote_connection_task)  # 将新创建的任务添加到任务列表

    async def _async_connect_to_remote_server(self, remote_address):
        receiver_transport, _ = await self.loop.create_datagram_endpoint(
            lambda: self.udp_protocol,
            remote_addr=remote_address
        )
        self.transport.sendto(b'Some request message', remote_address)

    @staticmethod
    async def _async_do_something(data, client_address):
        """
        调用解析算法读取内容，并存进数据库
        Args:
            data:
            client_address:

        Returns:

        """

        print(f'UDP Server Received Data From Client, Address: {client_address}, Data:{data}')
        try:
            split_strings = split_gnss_data(data)
            first_byte = split_strings[0]
            base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
            local_path = os.path.join(base_dir, 'tmp')
            if not os.path.exists(local_path):
                os.makedirs(local_path)
            parsed_gnss_data, time_str, identify_code = parse_gnss_data(first_byte)

            gnss_data = generate_mysql_gnss_data(parsed_gnss_data)
            await sql_handle.add_records("gnss_data", gnss_data)

            # TODO 文件名要按指定格式？
            from datetime import datetime
            time_ = datetime.now().strftime('%Y%m%d%H%M%S')
            file_name = f'{time_}-{identify_code}-{time_str}'
            local_file_path = os.path.join(local_path, f"{file_name}")
            with open(local_file_path, 'wb') as file:
                file.write(data)
            logger.warning(f'UDP Server Received Data,{file_name}')
            ftp_util = RemoteFTPService()
            if ftp_util and ftp_util.login:
                try:
                    encrypted_data = await ftp_util.encrypt_file(local_file_path)
                    with open(local_file_path, "wb") as f:
                        f.write(encrypted_data)
                    remote_file_path = os.path.join(settings.FTP_REMOTE_PATH, file_name)
                    ftp_file = open(local_file_path, "rb")
                    await ftp_util.upload_encrypted_data_to_ftp(ftp_file, remote_file_path)
                    ftp_file.close()
                except IOError as ftp_err:
                    logger.error(ftp_err)
                    raise ftp_err
                finally:
                    ftp_util.remote_ftp_close()
            shutil.rmtree(local_path)
        except Exception as error:
            logger.error(error)
            return


u_s = UDPService()
