import socket
import time

# 定义服务器的IP地址和端口号
SERVER_IP = '127.0.0.1'  # 本地回环地址，用于测试
SERVER_PORT = 12345  # 任意选择的端口号

# 创建一个UDP套接字
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# 绑定套接字到服务器地址
server_socket.bind((SERVER_IP, SERVER_PORT))

print(f"服务器正在监听 {SERVER_IP}:{SERVER_PORT}...")

# 无限循环，等待接收数据
while True:
    # 接收数据 (数据和客户端地址)
    time.sleep(5)
    try:
        data, client_address = server_socket.recvfrom(1024)
    except ConnectionResetError as e:
        # 记录错误日志
        print(f"Connection with client at address {client_address} was reset by peer: {e}")

    print(f"收到数据来自 {client_address}: {data.decode('utf-8')}")
    src_path = "D:\\File\\dzm9b"
    with open(src_path, "rb") as f:
        binary_content = f.read()
    # 回显数据给客户端
    server_socket.sendto(binary_content, client_address)
    # server_socket.sendto(b"3q!!!", client_address)
