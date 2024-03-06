CREATE TABLE `column_manage` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `table_id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '属于哪个表',
  `merge_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多列合并使用同一个merge_name(仅前端可用到)',
  `key` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名（英文，用于建表）',
  `value` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名（中文，用于前端显示）',
  `type` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段类型：int、str、datetime、text、bool等',
  `empty` tinyint(1) NOT NULL COMMENT '是否可为空',
  `primary` tinyint(1) NOT NULL COMMENT '是否为主键',
  `unique` tinyint(1) NOT NULL COMMENT '是否唯一',
  `association` json DEFAULT NULL COMMENT '定义关联字段，可定义多个，数组表示',
  `comment` json DEFAULT NULL COMMENT '字段描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `column_manage_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table_manage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--ALTER TABLE `column_manage` MODIFY ...
--alter table 表名 add 字段名 数据类型 [完整性约束条件] [first | after 字段名];
--alter table 表名 drop 字段名;
