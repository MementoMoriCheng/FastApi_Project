import datetime
import asyncio

import jwt
import httpx

import sys
sys.path.append("../../")

from src.config.setting import settings


def generate_service_token():
    """生成用于服务调用的 token"""
    now = datetime.datetime.utcnow()
    exp_dt = now + datetime.timedelta(minutes=3)
    payload = {
        "exp": exp_dt,
        "iat": now,  # 签发时间
        "iss": "mvt",  # 签名
        "app": settings.APP_NAME,
    }
    token = jwt.encode(payload, key=settings.SECRET_KEY, algorithm="HS256")
    return token


def identify_service_token(token):
    """校验服务 token"""
    try:
        payload = jwt.decode(token, key=settings.SECRET_KEY, algorithms="HS256")
    except jwt.InvalidTokenError as e:
        return
    except jwt.InvalidSignatureError as e:
        return
    else:
        if payload and ("app" in payload):
            return payload["app"]


async def http_base(method, url, **kwargs):
    async with httpx.AsyncClient() as client:
        response = await getattr(client, method)(
            url,
            headers={"Authorization": f"bearer {generate_service_token()}"},
            **kwargs,
        )
        if response.status_code == 200:
            return response.json()


async def http_get(url, **kwargs):
    result = await http_base("get", url, **kwargs)
    return result


async def http_post(url, **kwargs):
    result = await http_base("post", url, **kwargs)
    return result


class UserService:
    def __init__(self):
        self.host = "http://192.168.124.15:8001/api"

    async def get_users(self, **kwargs):
        r = await http_get(self.host + "/users", **kwargs)
        return r

    async def get_user_role(self, username: str) -> str:
        pass

    async def get_user_permissions(self, username: str):
        pass


if __name__ == "__main__":
    user_service = UserService()

    r = asyncio.run(user_service.get_users())
    print(r)
