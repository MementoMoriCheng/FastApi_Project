import mysql.connector

DB_CONFIG = {
    "host": "localhost",
    "port": 3306,
    "user": "root",
    "password": "123456",
    "database": "rag_flow",
}

# 连接到 MySQL 数据库
conn = mysql.connector.connect(**DB_CONFIG)

# 创建游标
cursor = conn.cursor()

# 执行 SQL 查询
cursor.execute("SELECT * FROM user")

# 获取查询结果
result = cursor.fetchall()

# 输出结果
for row in result:
    print(row)

# 关闭游标和连接
cursor.close()
conn.close()
