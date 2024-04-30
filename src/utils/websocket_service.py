import asyncio
import json
import websockets
import threading
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

                # TODO 鉴别用户并发信息
                # if data["type"] == 'send':
                #     name = '404'
                #     for k, v in Clients.items():
                #         if v == websocket:
                #             name = k
                #     data["from"] = name
                #     if len(Clients) != 0:  # asyncio.wait doesn't accept an empty list
                #         message = json.dumps({"type": "send", "content": data["content"], "from": name})
                #         await self.runCaseX(jsonMsg=message, websocket=websocket)

                gnss_fields = settings.GNSS_FIELDS.split(',')
                data_info = await sql_handle.select("gnss_data", limit=1, fields=gnss_fields,
                                                    order_by={"create_time": True})

                message = json.dumps({"type": "send", "content": data_info[0] if data_info else " "})
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
            except Exception as e:
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
