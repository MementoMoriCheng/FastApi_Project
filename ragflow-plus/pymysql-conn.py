import pymysql


class MySQLManager:
    def __init__(self, host, user, password, database):
        self.connection = pymysql.connect(
            host=host,
            user=user,
            password=password,
            database=database,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        print("数据库连接成功")

    def create_table(self):
        """创建示例表"""
        with self.connection.cursor() as cursor:
            sql = """
            CREATE TABLE IF NOT EXISTS users (
                id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(50) NOT NULL,
                email VARCHAR(100) NOT NULL UNIQUE,
                age INT
            )
            """
            cursor.execute(sql)
        self.connection.commit()
        print("表创建成功")

    def insert_user(self, name, email, age):
        """插入数据"""
        with self.connection.cursor() as cursor:
            sql = "INSERT INTO users (name, email, age) VALUES (%s, %s, %s)"
            cursor.execute(sql, (name, email, age))
        self.connection.commit()
        print(f"插入数据成功: {name}")

    def get_users(self):
        """查询所有数据"""
        with self.connection.cursor() as cursor:
            sql = "SELECT * FROM users"
            cursor.execute(sql)
            result = cursor.fetchall()
            return result

    def get_user_by_id(self, user_id):
        """根据ID查询用户"""
        with self.connection.cursor() as cursor:
            sql = "SELECT * FROM users WHERE id = %s"
            cursor.execute(sql, (user_id,))
            result = cursor.fetchone()
            return result

    def update_user(self, user_id, name=None, email=None, age=None):
        """更新用户数据"""
        with self.connection.cursor() as cursor:
            updates = []
            params = []
            if name:
                updates.append("name = %s")
                params.append(name)
            if email:
                updates.append("email = %s")
                params.append(email)
            if age is not None:
                updates.append("age = %s")
                params.append(age)

            if not updates:
                return False

            sql = f"UPDATE users SET {', '.join(updates)} WHERE id = %s"
            params.append(user_id)
            cursor.execute(sql, tuple(params))
            self.connection.commit()
            print(f"更新用户ID {user_id} 成功")
            return True

    def delete_user(self, user_id):
        """删除用户"""
        with self.connection.cursor() as cursor:
            sql = "DELETE FROM users WHERE id = %s"
            cursor.execute(sql, (user_id,))
            self.connection.commit()
            print(f"删除用户ID {user_id} 成功")

    def close(self):
        """关闭数据库连接"""
        self.connection.close()
        print("数据库连接已关闭")


# 使用示例
if __name__ == "__main__":
    # 配置数据库连接信息
    config = {
        'host': 'localhost',
        'user': 'your_username',
        'password': 'your_password',
        'database': 'your_database'
    }

    manager = MySQLManager(**config)

    try:
        # 创建表
        manager.create_table()

        # 插入数据
        manager.insert_user("张三", "zhangsan@example.com", 25)
        manager.insert_user("李四", "lisi@example.com", 30)

        # 查询所有用户
        print("\n所有用户:")
        users = manager.get_users()
        for user in users:
            print(user)

        # 更新用户
        manager.update_user(1, name="张三丰", age=28)

        # 查询单个用户
        print("\n更新后的用户1:")
        print(manager.get_user_by_id(1))

        # 删除用户
        manager.delete_user(2)

        # 再次查询所有用户
        print("\n删除后的用户列表:")
        users = manager.get_users()
        for user in users:
            print(user)

    finally:
        # 关闭连接
        manager.close()