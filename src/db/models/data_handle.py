from sqlalchemy import Column, String, DateTime, func, Text, Integer

from src.db.config import Base
from src.utils import generate_uuid


class DataHandle(Base):
    """
    数据操作记录表
    """
    __tablename__ = 'data_handle'

    id = Column(String(36), primary_key=True, default=generate_uuid)
    name = Column(String(128), comment="备份名称")
    user_id = Column(String(36), comment="操作人")
    handle_type = Column(Integer, comment="操作类型，1：备份数据，2：还原数据，3：同步数据，4：还原数据，默认值：1", default=1)
    url = Column(String(255), comment="备份文件存放路径(或导入/导出临时数据存放路径)，需支持再次导出(下载)")
    handle_time = Column(String(16), comment="数据备份时间，ftp目录下有backups目录，以这个字段命名")
    description = Column(Text(), comment="描述")
    create_time = Column(DateTime, server_default=func.now())

    __mapper_args__ = {"eager_defaults": True}
