import socket
import time

# 定义服务器的IP地址和端口号
SERVER_IP = '127.0.0.1'
SERVER_PORT = 9988
# SERVER_PORT = 12345

# 创建一个UDP套接字
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

for i in range(20):
    # 发送数据到服务器
    message = "hello, server!!! hahahahaha"
    client_socket.sendto(message.encode('utf-8'), (SERVER_IP, SERVER_PORT))
    time.sleep(2)
    # 接收服务器的回显数据
    data, server_address = client_socket.recvfrom(1024)
    print(f"收到来自 {server_address}: {data.decode('utf-8')}")

# 关闭套接字
client_socket.close()
