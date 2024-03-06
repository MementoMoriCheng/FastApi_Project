-- flyingtrainingdb.auto_airscrew_record definition

CREATE TABLE IF NOT EXISTS `auto_airscrew_record` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_c_d_ definition

CREATE TABLE IF NOT EXISTS `auto_c_d_` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_coach definition

CREATE TABLE IF NOT EXISTS `auto_coach` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `birth` date DEFAULT NULL,
  `birth_place` text,
  `education` text,
  `politics` text,
  `id_card` text,
  `duty` text,
  `department` text,
  `phone` text,
  `reg_date` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_data_define definition

CREATE TABLE IF NOT EXISTS `auto_data_define` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_dbtable definition

CREATE TABLE IF NOT EXISTS `auto_dbtable` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_dbtablecolumn definition

CREATE TABLE IF NOT EXISTS `auto_dbtablecolumn` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_demo definition

CREATE TABLE IF NOT EXISTS `auto_demo` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `birth` datetime DEFAULT NULL,
  `birth_place` text,
  `education` text,
  `politics` text,
  `id_card` text,
  `duty` text,
  `department` text,
  `phone` int DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `age` float DEFAULT NULL,
  `org` text,
  `aircraft_type` text,
  `aircraft_card` text,
  `serial_num` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_engine_record definition

CREATE TABLE IF NOT EXISTS `auto_engine_record` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_flight definition

CREATE TABLE IF NOT EXISTS `auto_flight` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_fly_route definition

CREATE TABLE IF NOT EXISTS `auto_fly_route` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `serial_num` text,
  `WTNfCW` float DEFAULT NULL,
  `QhDe__` float DEFAULT NULL,
  `flight_range` float DEFAULT NULL,
  `flight_duration` float DEFAULT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_licence definition

CREATE TABLE IF NOT EXISTS `auto_licence` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_menu_manage definition

CREATE TABLE IF NOT EXISTS `auto_menu_manage` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_other_user definition

CREATE TABLE IF NOT EXISTS `auto_other_user` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_other_widget definition

CREATE TABLE IF NOT EXISTS `auto_other_widget` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_part_time_coach definition

CREATE TABLE IF NOT EXISTS `auto_part_time_coach` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_physical_examinations definition

CREATE TABLE IF NOT EXISTS `auto_physical_examinations` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_plane definition

CREATE TABLE IF NOT EXISTS `auto_plane` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `serial_num` text,
  `org` text,
  `aircraft_type` text,
  `aircraft_card` text,
  `flight_duration` float DEFAULT NULL,
  `flight_interval` float DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `name` text,
  `my_test` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_plane_record definition

CREATE TABLE IF NOT EXISTS `auto_plane_record` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_r_y_g_l definition

CREATE TABLE IF NOT EXISTS `auto_r_y_g_l` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_staff_manage definition

CREATE TABLE IF NOT EXISTS `auto_staff_manage` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_student definition

CREATE TABLE IF NOT EXISTS `auto_student` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `birth` date DEFAULT NULL,
  `birth_place` text,
  `education` text,
  `politics` text,
  `id_card` text,
  `department` text,
  `phone` text,
  `gender` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_system_manage definition

CREATE TABLE IF NOT EXISTS `auto_system_manage` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_test definition

CREATE TABLE IF NOT EXISTS `auto_test` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.auto_widget definition

CREATE TABLE IF NOT EXISTS `auto_widget` (
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `create_user` varchar(64) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.table_manage definition

CREATE TABLE IF NOT EXISTS `table_manage` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '数据表中文名称',
  `code` varchar(32) NOT NULL COMMENT '数据表名称（英文，用于表名）',
  `description` json DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int DEFAULT NULL COMMENT '表状态：0：设计中，1：使用中',
  `menu_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '所属菜单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `table_manage_menu_manage_FK` (`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.column_manage definition

CREATE TABLE IF NOT EXISTS `column_manage` (
  `id` varchar(36) NOT NULL,
  `table_id` varchar(36) NOT NULL COMMENT '属于哪个表',
  `merge_name` varchar(64) DEFAULT NULL COMMENT '多列合并使用同一个merge_name(仅前端可用到)',
  `parent` varchar(36) DEFAULT NULL COMMENT '父级字段',
  `is_parent` tinyint(1) DEFAULT NULL COMMENT '表明父级字段',
  `name` varchar(64) NOT NULL COMMENT '字段名（中文，用于前端显示）',
  `sort` float DEFAULT NULL COMMENT '列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序',
  `status` int DEFAULT NULL COMMENT '列状态：1：显示，2：隐藏',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `code` varchar(32) NOT NULL COMMENT '字段名（英文，用于建表）',
  `type` varchar(32) DEFAULT NULL COMMENT '字段类型：int、str 32、datetime、text、bool等',
  `empty` tinyint(1) DEFAULT NULL COMMENT '是否可为空',
  `primary` tinyint(1) DEFAULT NULL COMMENT '是否为主键',
  `unique` tinyint(1) DEFAULT NULL COMMENT '是否唯一',
  `association` json DEFAULT NULL COMMENT '定义关联字段，可定义多个，数组表示',
  `description` json DEFAULT NULL COMMENT '字段描述',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `field_length` int DEFAULT NULL COMMENT 'varchar 类型长度',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `column_manage_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table_manage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.flying_service definition

CREATE TABLE IF NOT EXISTS `flying_service` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '数据表中文名称',
  `route_id` varchar(36) NOT NULL COMMENT '航线id',
  `plane_id` varchar(36) NOT NULL COMMENT '飞机id',
  `coach_id` varchar(36) NOT NULL COMMENT '教员id',
  `student_id` varchar(36) NOT NULL COMMENT '学员id',
  `plan_duration` int NOT NULL COMMENT '计划飞行时长',
  `plan_time_start` datetime NOT NULL COMMENT '计划飞行开始时间',
  `plan_time_end` datetime NOT NULL COMMENT '计划飞行结束时间',
  `real_duration` int DEFAULT NULL COMMENT '实际飞行时长',
  `real_time_start` datetime DEFAULT NULL COMMENT '实际飞行开始时间',
  `real_time_end` datetime DEFAULT NULL COMMENT '实际飞行开始时间',
  `status` int NOT NULL COMMENT '计划中，正在进行，按计划完成，补签完成，过时未进行，已调整，已取消',
  `handle_time` datetime DEFAULT NULL COMMENT '操作时间',
  `handle_user` varchar(36) DEFAULT NULL COMMENT '操作人',
  `handle_reason` json DEFAULT NULL COMMENT '操作原因',
  `adjust_id` varchar(36) DEFAULT NULL COMMENT '调整到其他飞行计划的id, 自关联',
  `description` json DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT '0' COMMENT '是否已删除',
  `expand_data` json DEFAULT NULL COMMENT '依据',
  PRIMARY KEY (`id`),
  KEY `adjust_id` (`adjust_id`),
  CONSTRAINT `flying_service_ibfk_1` FOREIGN KEY (`adjust_id`) REFERENCES `flying_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- flyingtrainingdb.menu_manage definition

CREATE TABLE IF NOT EXISTS `menu_manage` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据表中文名称',
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '父级菜单',
  `code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码，预留字段',
  `description` json DEFAULT NULL COMMENT '描述',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `type` int DEFAULT NULL COMMENT '类型：1：主菜单，2：分菜单',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT '1' COMMENT '列状态：1：显示，2：隐藏',
  `sort` float DEFAULT '999' COMMENT '列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序',
  `icon` varchar(36) DEFAULT 'star-icon' COMMENT '菜单图标',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建者',
  `table_code` varchar(32) DEFAULT NULL COMMENT '菜单对应数据库表，后续一系列的增删改查',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent` (`parent`),
  KEY `menu_manage_table_manage_FK` (`table_code`),
  CONSTRAINT `menu_manage_menu_manage_FK` FOREIGN KEY (`parent`) REFERENCES `menu_manage` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;