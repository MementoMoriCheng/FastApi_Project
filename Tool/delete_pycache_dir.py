import os
import shutil
import argparse


def delete_pycache_folders(root_dir, dry_run=False):
    """
    删除指定目录下所有 __pycache__ 文件夹

    :param root_dir: 要搜索的根目录
    :param dry_run: 如果为True，只显示将要删除的文件夹而不实际删除
    """
    total_deleted = 0
    total_freed = 0

    for dirpath, dirnames, filenames in os.walk(root_dir, topdown=False):
        if os.path.basename(dirpath) == '__pycache__':
            try:
                folder_size = get_folder_size(dirpath)

                if dry_run:
                    print(f"[DRY RUN] 将删除: {dirpath} (大小: {format_size(folder_size)})")
                else:
                    shutil.rmtree(dirpath)
                    print(f"已删除: {dirpath} (大小: {format_size(folder_size)})")

                total_deleted += 1
                total_freed += folder_size

            except Exception as e:
                print(f"删除 {dirpath} 时出错: {str(e)}")

    if total_deleted > 0:
        print(f"\n操作完成! 共删除 {total_deleted} 个 __pycache__ 文件夹")
        print(f"释放空间: {format_size(total_freed)}")
    else:
        print(f"\n在 {root_dir} 中未找到 __pycache__ 文件夹")


def get_folder_size(path):
    """计算文件夹大小（字节）"""
    total_size = 0
    for dirpath, _, filenames in os.walk(path):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            if os.path.exists(fp):
                total_size += os.path.getsize(fp)
    return total_size


def format_size(size_bytes):
    """将字节大小转换为易读格式"""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size_bytes < 1024.0:
            return f"{size_bytes:.1f} {unit}"
        size_bytes /= 1024.0
    return f"{size_bytes:.1f} TB"


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='删除指定目录下的所有 __pycache__ 文件夹')
    parser.add_argument('directory', nargs='?', default=os.getcwd(),
                        help='要清理的目录（默认为当前工作目录）')
    parser.add_argument('--dry-run', action='store_true',
                        help='模拟运行，显示将要删除的内容但不实际删除')

    args = parser.parse_args()

    if not os.path.isdir(args.directory):
        print(f"错误: {args.directory} 不是有效目录")
        exit(1)

    print(f"正在清理目录: {os.path.abspath(args.directory)}")
    if args.dry_run:
        print("运行模式: 模拟运行 (不会实际删除文件)\n")

    delete_pycache_folders(args.directory, args.dry_run)