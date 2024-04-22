import asyncio
import json
import websockets
import threading
from src.utils.logger import logger
from src.config.setting import settings
from src.utils.sql_config import sql_handle

# 存储所有的客户端
Clients = set()


# 服务端
class WebSocketService:
    def __init__(self):
        self.ip = settings.WEBSOCKET_ADDRESS
        self.port = settings.WEBSOCKET_PORT

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
                logger.error("ConnectionClosed...")
                Clients.remove(websocket)
                break
            # 无效状态
            except websockets.InvalidState:
                logger.error("InvalidState...")
                Clients.remove(websocket)
                break
            # 报错
            except Exception as e:
                logger.error("WSlinkError ", e)
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
        thread = threading.Thread(target=self.websocket_server)
        thread.start()
        logger.info(f'WebSocket service init successfully, address is: {self.ip}:{self.port}')


w_s = WebSocketService()
