import jwt
from fastapi import Request, status, HTTPException
from src.utils.logger import logger
from src.config.setting import settings


__all__ = ["verify_token"]


def decode_token(token):
    try:
        payload = jwt.decode(token, key=settings.SECRET_KEY, algorithms="HS256", leeway=10)
    except jwt.InvalidTokenError as e:
        logger.error(f"jwt.InvalidTokenError:{e}")
        return
    except jwt.InvalidSignatureError as e:
        logger.error(f"jwt.InvalidSignatureError:{e}")
        return
    else:
        return payload


def identify_access_token(access_token):
    payload = decode_token(access_token)
    if payload and ("username" in payload) and (payload["refresh"] == 0):
        return payload["username"]
    else:
        return


def get_token_from_header(request: Request):
    if "Authorization" in request.headers:
        try:
            token_type, token = request.headers["Authorization"].split()
        except ValueError:
            token_type = token = None
    else:
        token_type = token = None
    return token_type, token


def verify_token(request: Request):
    return

    if not settings.AUTH:
        return

    allowed_path = ["/", ]
    if request.url.path in allowed_path:
        return

    token_type, token = get_token_from_header(request)

    if request.method != "OPTIONS":
        credential_exception = HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Could not validate credential",
            headers={"WWW-Authenticate": "Bearer"},
        )
        if token is None:
            raise credential_exception
        if token_type.lower() != "bearer":
            raise credential_exception
        username = identify_access_token(token)
        if not username:
            raise credential_exception
        request.state.current_user = username
