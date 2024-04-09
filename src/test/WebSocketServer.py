import asyncio
import websockets
import time
import json
import threading
# 功能模块
class OutputHandler():
    async def run(self,message,send_ms,websocket):
        # 用户发信息
        await send_ms(message, websocket)
        # 单发消息
        # await send_ms(message, websocket)
        # 群发消息
        #await s('hi起来')


# 存储所有的客户端
Clients = {}

# 服务端
class WS_Server():
    def __init__(self):
        self.ip = "127.0.0.1"
        self.port = 9090

    # 回调函数(发消息给客户端)
    async def callback_send(self, msg, websocket=None):
        await self.sendMsg(msg, websocket)

    # 发送消息
    async def sendMsg(self, msg, websocket):
        print('sendMsg:', msg)
        # websocket不为空，单发，为空，群发消息
        if websocket != None:
            await websocket.send(msg)
        else:
            # 群发消息
            await self.broadcastMsg(msg)
        # 避免被卡线程
        await asyncio.sleep(0.2)

    # 群发消息
    async def broadcastMsg(self, msg):
        for user in Clients:
            await user.send(msg)


    # 针对不同的信息进行请求，可以考虑json文本
    async def runCaseX(self,jsonMsg,websocket):
        print('runCase')
        op = OutputHandler()
        # 参数：消息、方法、socket
        await op.run(jsonMsg,self.callback_send,websocket)

    # 连接一个客户端，起一个循环监听
    async def echo(self,websocket, path):
        # 添加到客户端列表
        # Clients.append(websocket)
        # 握手
        await websocket.send(json.dumps({"type": "handshake"}))
        # 循环监听
        while True:
            # 接受信息
            try:
                # 接受文本
                recv_text = await websocket.recv()
                message = "Get message: {}".format(recv_text)
                # 返回客户端信息
                await websocket.send(message)
                # 转json
                data = json.loads(recv_text)

                # 用户发信息
                if data["type"] == 'send':
                    name = '404'
                    for k, v in Clients.items():
                        if v == websocket:
                            name = k
                    data["from"] = name
                    if len(Clients) != 0:  # asyncio.wait doesn't accept an empty list
                        message = json.dumps({"type": "send", "content": data["content"], "from": name})
                        await self.runCaseX(jsonMsg=message, websocket=websocket)

                # 用户注册
                elif data["type"] == 'register':
                    try:
                        Clients[data["uuid"]] = websocket
                        if len(Clients) != 0:  # asyncio.wait doesn't accept an empty list
                            message = json.dumps({"type": "register", "content": data["content"], "user_list": list(Clients.keys())})
                            await self.runCaseX(jsonMsg=message, websocket=websocket)
                    except Exception as exp:
                        print(exp)

                # 用户注销
                elif data["type"] == 'unregister':
                    del Clients[data["uuid"]]

                # 对message进行解析，跳进不同功能区
                # await self.runCaseX(jsonMsg=data,websocket=websocket)
            # 链接断开
            except websockets.ConnectionClosed:
                print("ConnectionClosed...", path)
                # del Clients
                break
            # 无效状态
            except websockets.InvalidState:
                print("InvalidState...")
                # del Clients
                break
            # 报错
            except Exception as e:
                print("ws连接报错",e)
                # del Clients
                break



    # 启动服务器
    async def runServer(self):
        async with websockets.serve(self.echo, self.ip, self.port):
            await asyncio.Future()  # run forever

	# 多协程模式，防止阻塞主线程无法做其他事情
    def WebSocketServer(self):
        asyncio.run(self.runServer())

    # 多线程启动
    def startServer(self):
        # 多线程启动，否则会堵塞
        thread = threading.Thread(target=self.WebSocketServer)
        thread.start()
        # thread.join()


if __name__=='__main__':
    print("server")
    s = WS_Server()
    s.startServer()
