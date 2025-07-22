from pprint import pprint

import requests


def list_chats(api_key, base_url, page=1, page_size=20, orderby=None, desc=False, chat_name=None, chat_id=None):
    """
    调用 /api/v1/chats 接口列出聊天助手。

    :param api_key: API 认证密钥 (Bearer Token)
    :param base_url: 接口的基础 URL，例如 "https://example.com/api/v1/chats"
    :param page: 当前页码
    :param page_size: 每页数量
    :param orderby: 排序字段
    :param desc: 是否降序排序 (True/False)
    :param chat_name: 根据聊天名称过滤
    :param chat_id: 根据聊天 ID 过滤
    :return: 响应 JSON 数据或错误信息
    """
    headers = {
        'Authorization': f'Bearer {api_key}'
    }

    # 构造请求参数
    params = {
        'page': page,
        'page_size': page_size
    }

    if orderby:
        params['orderby'] = orderby
    if desc is not None:
        params['desc'] = str(desc).lower()
    if chat_name:
        params['name'] = chat_name
    if chat_id:
        params['id'] = chat_id

    try:
        response = requests.get(base_url, headers=headers, params=params)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"请求失败: {e}")
        if e.response is not None:
            print("响应内容:", e.response.text)
        return None


def list_chat_sessions(api_key, base_url, chat_id, page=1, page_size=20,
                       orderby=None, desc=False, session_name=None,
                       session_id=None, user_id=None):
    """
    调用 /api/v1/chats/{chat_id}/sessions 接口列出指定聊天助手的会话。

    :param api_key: API 认证密钥 (Bearer Token)
    :param base_url: 接口的基础 URL，例如 "https://example.com/api/v1/chats"
    :param chat_id: 聊天助手的唯一标识符
    :param page: 当前页码
    :param page_size: 每页数量
    :param orderby: 排序字段
    :param desc: 是否降序排序 (True/False)
    :param session_name: 根据会话名称过滤
    :param session_id: 根据会话 ID 过滤
    :param user_id: 根据用户 ID 过滤
    :return: 响应 JSON 数据或错误信息
    """
    headers = {
        'Authorization': f'Bearer {api_key}'
    }

    # 构造完整 URL
    url = f"{base_url}/{chat_id}/sessions"

    # 构造请求参数
    params = {
        'page': page,
        'page_size': page_size
    }

    if orderby:
        params['orderby'] = orderby
    if desc is not None:
        params['desc'] = str(desc).lower()  # 转为字符串 "true"/"false"
    if session_name:
        params['name'] = session_name
    if session_id:
        params['id'] = session_id
    if user_id:
        params['user_id'] = user_id

    try:
        response = requests.get(url, headers=headers, params=params)
        response.raise_for_status()  # 如果响应状态码不是 2xx，抛出异常
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"请求失败: {e}")
        if e.response is not None:
            print("响应内容:", e.response.text)
        return None


if __name__ == '__main__':
    API_KEY = "ragflow-NiNjVkN2I0NTRmMTExZjBhZTU5N2ExZG"
    BASE_URL = "http://10.200.16.1/api/v1/chats"

    # result = list_chats(
    #     api_key=API_KEY,
    #     base_url=BASE_URL,
    #     page=1,
    #     page_size=10,
    #     # orderby="created_at",
    #     # desc=True,
    #     chat_name="行政小助手",
    #     # chat_id="3f162d8654f111f0bab37a1dfda6c132"
    # )
    #
    # if result:
    #     pprint(result)

    CHAT_ID = "chat_12345"

    result = list_chat_sessions(
        api_key=API_KEY,
        base_url=BASE_URL,
        chat_id=CHAT_ID,
        page=1,
        page_size=10,
        orderby="created_at",
        desc=True,
        session_name="测试会话",
        session_id="session_67890",
        user_id="user_abc"
    )

    if result:
        print("返回数据：", result)