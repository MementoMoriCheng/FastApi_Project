#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2022/12/9 10:28
# @Author  : yilifeng
# @File    : app.py
# @Software: PyCharm
import uvicorn
import sys
from pathlib import Path
import colorama

from src.db.init_db import init_db

sys.path.append(str(Path(__file__).absolute().parent.parent))  # fix no module name

from src import create_application
from src.utils.logger import logger

colorama.init(autoreset=True)
app = create_application()

if __name__ == "__main__":
    host = "0.0.0.0"
    port = 8080
    if len(sys.argv) > 1:
        print(sys.argv)
        if "-h" in sys.argv:
            h_index = sys.argv.index("-h")
            host = sys.argv[h_index + 1]
        if "-p" in sys.argv:
            p_index = sys.argv.index("-p")
            port = int(sys.argv[p_index + 1])
        if "--initdb" in sys.argv:
            init_db()
        if "--initdb-drop" in sys.argv:
            init_db("drop")
    uvicorn.run("app:app", host=host, port=port, reload=False)
    logger.debug(f"Application startup complete [host={host}, port={port}]")
