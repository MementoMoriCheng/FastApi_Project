#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/8/18 17:35
# @Author  : yilifeng
# @File    : do_pack.py
# @Software: PyCharm
import os
import shutil
import subprocess
from src.config.setting import settings
from pack.pre_package import rewrite_code, after_pack, app_dir

pPath = os.path.join(settings.ROOT_PATH, "pack")


def clean(result=False):
    if not result:
        if os.path.exists(os.path.join(pPath, "dist")):
            shutil.rmtree(os.path.join(pPath, "dist"))
    if os.path.exists(os.path.join(pPath, "build")):
        shutil.rmtree(os.path.join(pPath, "build"))
    if os.path.exists(os.path.join(pPath, "app.spec")):
        os.remove(os.path.join(pPath, "app.spec"))


def doPackage():
    clean(False)
    rewrite_code()
    mainApp = os.path.join(settings.ROOT_PATH, "app.py")
    cmd = ["pyinstaller", "-D", mainApp]
    print("pyinstaller package cmd ({}) will excute.".format(cmd))
    p_cf = subprocess.Popen(cmd, shell=False, cwd=pPath, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    while p_cf.poll() is None:
        line = p_cf.stdout.readline()
        line = line.strip()
        if line:
            print('[{}]'.format(line.decode()))
            # print(line.decode("gbk"))
    if p_cf.returncode == 0:
        print("package success!")
    else:
        print("package failed!")


def afterPackage():
    clean(True)
    os.mkdir(os.path.join(pPath, "dist", "app", "src"))
    shutil.move(os.path.join(pPath, "dist", "app"), os.path.join(pPath, "dist", app_dir))
    shutil.copytree(os.path.join(
        settings.ROOT_PATH, "src", "static"), os.path.join(pPath, "dist", app_dir, "src", "static")
    )

    shutil.copytree(os.path.join(
        settings.ROOT_PATH, "src", "static"), os.path.join(pPath, "dist", app_dir, "_internal", "src", "static")
    )
    # shutil.rmtree(os.path.join(pPath, "dist", app_dir, "_internal", "src", "static", "sql"))
    os.remove(os.path.join(pPath, "dist", app_dir, "_internal", "src", "static", ".config"))

    after_pack()


if __name__ == "__main__":
    doPackage()
    afterPackage()
