#!/usr/bin/env python
# coding :utf-8
# @email : yilifeng@mvt-inc.com
# @author: yilifeng
# @file  : pre_package.py
# @time  : 2023/8/23 下午3:48
import os.path
import shutil
import sys
import traceback

from src import settings

paths = sys.path

packages_path = ""
for path_m in paths:
    if os.path.basename(path_m) == "site-packages":
        packages_path = path_m
        break

print(packages_path)

app_dir = "flight-training-server"


def rewrite_code():
    src_path = os.path.join(settings.ROOT_PATH, "app.py")
    des_path = os.path.join(settings.ROOT_PATH, "appbak.py")
    shutil.copyfile(src_path, des_path)

    content = ""
    with open(src_path, "r") as f:
        content = f.read()
        content = content.replace("reload=True", "reload=False")

    with open(src_path, "w") as f:
        f.write(content)


def after_pack():
    src_path = os.path.join(settings.ROOT_PATH, "app.py")
    shutil.copyfile(src_path, os.path.join(settings.ROOT_PATH, "pack", "dist", app_dir, "app.py"))
    des_path = os.path.join(settings.ROOT_PATH, "appbak.py")

    shutil.copytree(
        os.path.join(packages_path, "aiomysql"),
        os.path.join(settings.ROOT_PATH, "pack", "dist", app_dir, "_internal", "aiomysql")
    )
    try:
        dist_lib_path = os.path.join(settings.ROOT_PATH, "pack", "dist", app_dir, "_internal")
        files = os.listdir(dist_lib_path)
        for item in files:
            if os.path.isdir(os.path.join(dist_lib_path, item)) and item[:8] == "dmpython":
                dm_lib_path = os.path.join(dist_lib_path, item)
                dm_lib_files = os.listdir(dm_lib_path)
                for item_lib in dm_lib_files:
                    shutil.copy(os.path.join(dm_lib_path, item_lib), dist_lib_path)
    except:
        print(traceback.print_exc())

    os.remove(src_path)
    shutil.move(des_path, src_path)
