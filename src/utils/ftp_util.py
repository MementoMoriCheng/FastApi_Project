# !/usr/bin/python
# -*- coding: utf-8 -*-
import os
import shutil
import base64
import datetime
import traceback
from ftplib import FTP

from src.utils.logger import logger
from cryptography.fernet import Fernet
from src.config.setting import settings
from fastapi.responses import FileResponse


class FTPError(Exception):
    pass


class RemoteFTPService:
    """
    对文件加密,解密行为,加密之后上传到ftp上,若要下载ftp上文件,需要进行解密之后再进行下载
    """

    def __init__(self):
        self.ftp = FTP()
        self.ftp.encoding = "utf-8"
        try:
            self.connect = self.ftp.connect(settings.FTP_HOST, int(settings.FTP_PORT))
            self.login = self.ftp.login(settings.FTP_USER, settings.FTP_PASSWORD)
        except Exception as e:
            logger.error(f"connect fail {e}")
            raise IOError(f"connect fail {e}")
        self.buffer_size = 2048

    @staticmethod
    def generate_key():
        """
        生成加密密钥
        """
        key = Fernet.generate_key()
        return key.decode("utf8")

    async def encrypt_file(self, file_path):
        key = settings.FTP_SECRET_KEY.encode("utf8")
        fernet = Fernet(key)
        with open(file_path, "rb") as file:
            file_data = file.read()
        encrypted_data = fernet.encrypt(file_data)
        return encrypted_data

    def decrypt_file(self, filename):
        key = settings.FTP_SECRET_KEY.encode("utf8")
        fernet = Fernet(key)
        with open(filename, 'rb') as encrypted_file:
            encrypted = encrypted_file.read()
        decrypted = fernet.decrypt(encrypted)
        with open(filename, 'wb') as decrypted_file:
            decrypted_file.write(decrypted)

    async def is_directory_exists(self, directory, mkdir=False):
        try:
            self.ftp.cwd(directory)
            return True
        except:
            if mkdir:
                f_path = os.path.dirname(directory)
                await self.is_directory_exists(f_path, mkdir)
                self.ftp.mkd(directory)
            return False

    async def list_file(self, dir):
        try:
            self.ftp.set_pasv(True)
            file_list = self.ftp.nlst(dir)

            file_names = []
            for item in file_list:
                file_names.append(os.path.basename(item))

            return file_names
        except:
            return None

    async def upload_encrypted_data_to_ftp(self, file_data, remote_file_path):
        self.ftp.set_pasv(True)
        f_path = os.path.dirname(remote_file_path)
        await self.is_directory_exists(f_path, True)
        self.ftp.storbinary(f'STOR {remote_file_path}', file_data, self.buffer_size)

    async def download_ftp_file_origin(self, filename, remote_filename):
        self.ftp.set_pasv(True)
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        local_file_path = os.path.join(base_dir, "tmp", filename)
        with open(local_file_path, 'wb') as f:
            self.ftp.retrbinary(f'RETR {remote_filename}', f.write)

    async def download_ftp_file_encode(self, filename, remote_filename):
        self.ftp.set_pasv(True)
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        local_file_path = os.path.join(base_dir, "tmp", filename)
        with open(local_file_path, 'wb') as f:
            self.ftp.retrbinary(f'RETR {remote_filename}', f.write)
        self.decrypt_file(local_file_path)
        self.ftp.quit()
        with open(local_file_path, 'rb') as file:
            file_content = file.read()
            encoded_content = base64.b64encode(file_content)
        return encoded_content

    async def download_ftp_file(self, filename, db_name, remote_filename):
        self.ftp.set_pasv(True)
        local_file_path = os.path.join(settings.LOCAL_DOWNLOAD_FILE_PATH, filename)
        with open(local_file_path, 'wb') as f:
            self.ftp.retrbinary(f'RETR {remote_filename}', f.write)
        self.decrypt_file(local_file_path)
        self.ftp.quit()
        # 返回下载文件的响应对象
        if filename.endswith('.docx') or filename.endswith('.doc'):
            return FileResponse(
                local_file_path,
                filename=db_name,
                media_type='application/vnd.openxmlformats-officedocument.wordprocessingml.document'
            )
        elif filename.endswith('.pdf'):
            return FileResponse(
                local_file_path,
                filename=db_name,
                media_type='application/pdf'
            )
        else:
            return FileResponse(local_file_path)

    async def download_ftp_backup_file(self, filename, remote_filename, download=False, user_path=None):
        self.ftp.set_pasv(True)
        if not os.path.exists(settings.RESTORE_PATH):
            os.makedirs(settings.RESTORE_PATH)
        if user_path is None:
            local_file_path = os.path.join(settings.RESTORE_PATH, filename)
        else:
            local_file_path = os.path.join(user_path, filename)
        with open(local_file_path, 'wb') as f:
            self.ftp.retrbinary(f'RETR {remote_filename}', f.write)
        self.ftp.quit()

        if download:
            return FileResponse(local_file_path,
                                media_type='application/x-zip-compressed',
                                headers={"Content-Disposition": f"attachment; filename={filename}"})
        return local_file_path

    def remote_ftp_close(self):
        return self.ftp.quit()

    async def delete_all_record(self):
        try:
            self.ftp.set_pasv(True)
            for c_path in [settings.FTP_REMOTE_PATH]:
                self.ftp.cwd(c_path)
                file_list = []
                self.ftp.retrlines("LIST", file_list.append)

                for filename in file_list:
                    filename_arr = filename.split()
                    file_name = filename_arr[len(filename_arr) - 1]
                    if file_name not in [".", ".."]:
                        next_dir = c_path + "/" + file_name
                        try:
                            await self.ftp_remove_dir(next_dir)
                        except:
                            self.ftp_remove_file(next_dir)

            self.ftp.quit()
            return True
        except:
            logger.error(traceback.print_exc())
            return False

    async def ftp_remove_dir(self, path):
        """
        异步递归去把文件夹下套文件夹的文件全部删掉,否则如果说文件夹下有文件夹或者是文件 ftp是不允许进行删除的
        """
        try:
            # 进入目录并获取所有文件及目录列表
            self.ftp.cwd(path)
            files = []
            self.ftp.dir(lambda x: files.append(x))
            for f in files:
                fname = f.split()[-1]
                if fname in ('.', '..'):
                    continue
                elif f.upper().startswith('D'):
                    await self.ftp_remove_dir(fname)
                else:
                    self.ftp.delete(fname)
            # 删除目录
            self.ftp.cwd('..')
            self.ftp.rmd(path)
        except Exception as e:
            logger.error(f'delete {path} dir fail:', e)

    def ftp_remove_file(self, path):
        try:
            self.ftp.delete(path)
            return True
        except Exception as e:
            logger.error(f'delete {path} dir fail:', e)
            return False

    async def download_ftp_template_file(self, filename):
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        path = base_dir + "/" + "tmp"
        if not os.path.exists(path):
            os.makedirs(path)
        local_file_path = os.path.join(base_dir, "tmp", filename)
        self.ftp.cwd(settings.FTP_REMOTE_PATH)
        with open(local_file_path, "wb") as f:
            self.ftp.retrbinary("RETR " + filename, f.write)
        self.ftp.quit()
        return local_file_path

    async def download_ftp_template_file_response(self, filename):
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        path = base_dir + "/" + "tmp"
        if not os.path.exists(path):
            os.makedirs(path)
        local_file_path = os.path.join(base_dir, "tmp", filename)
        self.ftp.cwd(settings.FTP_REMOTE_PATH)
        with open(local_file_path, "wb") as f:
            self.ftp.retrbinary("RETR " + filename, f.write)
        self.ftp.quit()
        return FileResponse(local_file_path)

    async def download_ftp_thumbnail_file(self, filename, db_name):
        self.ftp.set_pasv(True)
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        local_file_path = os.path.join(base_dir, "tmp", filename)
        self.ftp.cwd(settings.FTP_REMOTE_THUMBNAIL_PATH)
        with open(local_file_path, 'wb') as f:
            self.ftp.retrbinary(f'RETR {filename}', f.write)
        self.decrypt_file(local_file_path)
        self.ftp.quit()
        return FileResponse(
            local_file_path,
            filename=db_name,
            media_type="image/jpeg"
        )

    async def download_ftp_thumbnail_file_encode(self, filename):
        self.ftp.set_pasv(True)
        base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        local_file_path = os.path.join(base_dir, "tmp", filename)
        self.ftp.cwd(settings.FTP_REMOTE_THUMBNAIL_PATH)
        with open(local_file_path, 'wb') as f:
            self.ftp.retrbinary(f'RETR {filename}', f.write)
        self.decrypt_file(local_file_path)
        self.ftp.quit()
        with open(local_file_path, 'rb') as file:
            file_content = file.read()
            encoded_content = base64.b64encode(file_content)
        return encoded_content

    async def create_ftp_directory(self, dirs, create_only=False):
        if not dirs:
            return False
        for dir in dirs:
            try:
                self.ftp.cwd(dir)
            except:
                self.ftp.mkd(dir)
                if not create_only:
                    self.ftp.cwd(dir)
                    self.ftp.mkd("profile")
                    self.ftp.mkd("unprofile")
        return True

    async def ftp_upload_dirs(self, dir_path, in_path=""):
        try:
            self.ftp.set_pasv(True)

            if in_path:
                remote_desc = settings.FTP_REMOTE_PATH + in_path + "/"
            else:
                remote_desc = settings.FTP_REMOTE_PATH
            print(remote_desc)
            files = os.listdir(dir_path)
            for item in files:
                loacl_path = os.path.join(dir_path, item)
                self.ftp.cwd(remote_desc)
                if os.path.isdir(loacl_path):
                    self.ftp.mkd(item)
                    await self.ftp_upload_dirs(loacl_path, item)
                elif os.path.isfile(loacl_path):
                    f = open(loacl_path, "rb")
                    await self.upload_encrypted_data_to_ftp(f, remote_desc + "/" + item)
                    f.close()
        except:
            logger.error(traceback.print_exc())

    async def ftp_copy_dir(self, ftp_path, local_path, upload_ftp=True, delete_source=True):
        try:
            self.ftp.set_pasv(True)

            def loop_dir(c_dir, local_dir):
                if os.path.exists(local_dir) and not os.path.isdir(local_dir):
                    os.remove(local_dir)
                if not os.path.exists(local_dir):
                    os.makedirs(local_dir)

                self.ftp.cwd(c_dir)
                file_list = []
                self.ftp.retrlines("LIST", file_list.append)

                for filename in file_list:
                    filename_arr = filename.split()
                    file_name = filename_arr[len(filename_arr) - 1]
                    if file_name not in [".", ".."]:
                        local_filename = os.path.join(local_dir, file_name)

                        next_dir = c_dir + "/" + file_name
                        try:
                            with open(local_filename, "wb") as file:
                                self.ftp.retrbinary("RETR " + file_name, file.write)
                        except:
                            loop_dir(next_dir, local_filename)

            loop_dir(ftp_path, local_path)

            dir_name = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
            dir_url = await self.ftp_zip_dir(local_path, dir_name, upload_ftp, delete_source)
            self.ftp.quit()
            return dir_url
        except Exception as e:
            logger.error(e)
            return False

    async def ftp_zip_dir(self, tmp_dir, dir_name, upload_ftp=True, delete_source=True):
        try:
            shutil.make_archive(tmp_dir, 'zip', tmp_dir)
            shutil.rmtree(tmp_dir)
            if upload_ftp:
                f = open(tmp_dir + ".zip", "rb")
                await self.upload_encrypted_data_to_ftp(f, settings.FTP_REMOTE_BACKUPS_PATH + "/" + dir_name + ".zip")
                f.close()
            if delete_source:
                os.remove(tmp_dir + ".zip")

        except Exception as e:
            logger.error(e)

        return settings.FTP_REMOTE_BACKUPS_PATH + "/" + dir_name + ".zip"


if __name__ == '__main__':
    # ftp_util = FtpUtil("192.168.124.18", 21, "ftpuser", "ftp")
    # a = ftp_util.ftp.mkd("已归档")
    # print("type", type(a))
    # print("aa", a)
    ftp_util = RemoteFTPService()
    print(ftp_util.login, ftp_util.connect)
    # classify = {'name': 'zyz', 'id': 'b7950647-002e-4c8f-810a-fd38f83e6d4d', 'create_time': '2023-06-07T10:50:21',
    #  'update_time': '2023-06-07T10:50:21'}
    # t1 = ftp_util.ftp.mkd(classify["id"])
    # t2 = ftp_util.ftp.cwd(classify["id"])
    # t3 = ftp_util.ftp.mkd("proflie")
    # t4 = ftp_util.ftp.mkd("unprofile")
    # print(t1, t2, t3, t4)
    # print(ftp_util.generate_key())
    # ftp_util.ftp.rmd("dffec9ba-166f-46a7-8274-968b41c2e288")
    # ftp_util.ftp_remove_dir("cb808048-ba1d-4520-b8a5-6010c062890c")
    # import asyncio
    # asyncio.run(ftp_util.upload_encrypted_data_to_ftp(b"helloworld", settings.FTP_REMOTE_PATH + "/" + "test.txt"))
    # asyncio.run(ftp_util.ftp_upload_dirs("D:\\Project\\flight-training-server", settings.FTP_ROOT_PATH))
