from typing import Text

from pydantic import BaseModel, constr


class CreateDataHandle(BaseModel):
    name: str = None
    user_id: str = None
    handle_type: int = 1
    url: str = None
    handle_time: str = None
    description: Text = None


class RestoreBackup(BaseModel):
    id: str
    user_id: str = None
    handle_type: int = 2
    description: Text = None


class SyncDatas(BaseModel):
    remote_host: str = None
    remote_port: str = None
    user_id: str = None
    handle_type: int = 3
    description: Text = None


class DeleteDataHandle(BaseModel):
    id: constr(min_length=32, max_length=36)


class DataHandleSchemas(CreateDataHandle):
    id: str

    class Config:
        orm_mode = True
