import asyncio
import json
from json import JSONDecodeError

import websockets
import threading

from src.utils.constant import FLIGHT_DATA_TABLE, RESERVE
from src.utils.logger import logger
from src.config.setting import settings
from src.utils.sql_config import sql_handle

# 存储所有的客户端
Clients = set()
# 增加一个事件标志，用于控制服务器线程的退出
server_stop_event = threading.Event()


# 服务端
class WebSocketService:
    def __init__(self):
        self.ip = settings.WEBSOCKET_ADDRESS
        self.port = settings.WEBSOCKET_PORT
        self.server_thread = None

    async def callback_send(self, msg, websocket=None):
        """
         回调函数(发消息给客户端)
        Args:
            msg:
            websocket:

        Returns:

        """
        await self.send_msg(msg, websocket)

    async def send_msg(self, msg, websocket):
        """
        发送消息
        Args:
            msg:
            websocket:

        Returns:

        """
        if websocket:
            await websocket.send(msg)
        else:
            await self.broadcast_msg(msg)

        await asyncio.sleep(0.2)

    @staticmethod
    async def broadcast_msg(msg):
        """
        群发消息
        Args:
            msg:

        Returns:

        """
        for user in Clients:
            await user.send(msg)

    async def echo(self, websocket):
        """
        连接一个客户端，起一个循环监听
        Args:
            websocket:

        Returns:

        """
        while True:
            try:
                recv_text = await websocket.recv()
                if isinstance(recv_text, str) and len(recv_text) > 0:
                    Clients.add(websocket)
                # 鉴别回放数据/实时数据
                recv_data = json.loads(recv_text)
                print(f"Received Data From Client:{recv_text}")
                gnss_fields = settings.GNSS_FIELDS.split(',')
                select_condition = {"identify_code": recv_data.get("code"), "is_delete": RESERVE}

                if recv_data["playback"]:
                    select_condition["flight_time"] = {"value": recv_data.get("flight_time"), "operator": "includes"}
                    way_point = recv_data["way_point"] if recv_data.get("way_point") else 10
                    data_info = await sql_handle.select(FLIGHT_DATA_TABLE, conditions=select_condition,
                                                        fields=gnss_fields,
                                                        order_by={"gps_milliseconds": True})
                    data_length = len(data_info)
                    if data_length == 0:
                        message = json.dumps({"type": "send", "content": ""})
                        await self.callback_send(message, websocket=websocket)
                        break
                    for data in range(1, data_length, data_length // way_point):
                        message = json.dumps({"type": "send", "content": data_info[data] if data else " "})
                        await self.callback_send(message, websocket=websocket)
                else:
                    data_info = await sql_handle.select(FLIGHT_DATA_TABLE, conditions=select_condition, limit=1,
                                                        fields=gnss_fields,
                                                        order_by={"gps_milliseconds": False})
                    message = json.dumps({"type": "send", "content": data_info[0] if data_info else " "})
                    update_condition = {"id": data_info[0]["id"]}
                    data_info[0]["is_delete"] = 1
                    await sql_handle.update(FLIGHT_DATA_TABLE, update_condition, data_info[0])
                    await self.callback_send(message, websocket=websocket)

            # 链接断开
            except websockets.ConnectionClosed:
                logger.info("ConnectionClosed...")
                if websocket in Clients:  # 先检查连接是否存在
                    Clients.remove(websocket)
                break
            # 无效状态
            except websockets.InvalidState:
                logger.warning("InvalidState...")
                if websocket in Clients:  # 先检查连接是否存在
                    Clients.remove(websocket)
                break
            # 报错
            except (Exception, JSONDecodeError, ValueError, TypeError, KeyError) as e:
                logger.error("WSlinkError ", e)
                if websocket in Clients:  # 先检查连接是否存在
                    Clients.remove(websocket)
                break

    async def run_server(self):
        try:
            async with websockets.serve(self.echo, self.ip, self.port):
                await asyncio.Future()  # run forever
        except Exception as err:
            logger.error(err)

    def websocket_server(self):
        asyncio.run(self.run_server())

    def start_server(self):
        """
        启动WebSocket服务
        """

        self.server_thread = threading.Thread(target=self.websocket_server)
        self.server_thread.start()
        logger.info(f'WebSocket service init successfully, address is: {self.ip}:{self.port}')

    def stop_server(self):
        """
        停止WebSocket服务
        """
        server_stop_event.set()  # 设置停止事件
        logger.info('Initiating WebSocket service shutdown...')

        # 清理客户端集合
        global Clients
        Clients.clear()

        # 强制关闭所有连接（可选，根据需求决定是否执行）
        for client in Clients.copy():
            try:
                client.close()
            except Exception as e:
                logger.warning(f'Error closing client connection: {e}')

        # 等待服务线程退出（可选，根据实际情况调整超时时间）
        self.server_thread.join(timeout=5)
        if self.server_thread.is_alive():
            logger.warning('WebSocket service thread did not terminate within the expected time.')
        else:
            logger.info('WebSocket service stopped successfully.')


w_s = WebSocketService()
