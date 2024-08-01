/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : flyingtrainingdb

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 31/07/2024 17:00:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auto_b_b_z_d__p_hs
-- ----------------------------
DROP TABLE IF EXISTS `auto_b_b_z_d__p_hs`;
CREATE TABLE `auto_b_b_z_d__p_hs`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__eehB` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_b_b_z_d__p_hs
-- ----------------------------
INSERT INTO `auto_b_b_z_d__p_hs` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '3f4ed00b-85c3-44ae-9b06-ad39c7544fc5', 'R1', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_b_b_z_d__p_hs` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '57d4529c-894d-40ce-94c9-0284451a2743', 'R3', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_b_b_z_d__p_hs` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'f5989693-0ed9-4ab1-9659-9530817e9990', 'R2', '2024-05-09 18:21:19', NULL);

-- ----------------------------
-- Table structure for auto_b_j_ch_x_x_d_j_b__tirz
-- ----------------------------
DROP TABLE IF EXISTS `auto_b_j_ch_x_x_d_j_b__tirz`;
CREATE TABLE `auto_b_j_ch_x_x_d_j_b__tirz`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_ch__GkhC` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__QMnx` int NOT NULL,
  `b_j_ch__Gtte` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_d__HthK` float NOT NULL,
  `w_d__DWye` float NOT NULL,
  `z_l___xMr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `h_t__tGmz` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__dprC` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__SXkE` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`j_ch__GkhC`) USING BTREE,
  UNIQUE INDEX `j_ch__GkhC`(`j_ch__GkhC` ASC) USING BTREE,
  UNIQUE INDEX `b_j_ch__Gtte`(`b_j_ch__Gtte` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_b_j_ch_x_x_d_j_b__tirz
-- ----------------------------

-- ----------------------------
-- Table structure for auto_b_q_d_j_b__wprd
-- ----------------------------
DROP TABLE IF EXISTS `auto_b_q_d_j_b__wprd`;
CREATE TABLE `auto_b_q_d_j_b__wprd`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_d__YNbE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__TyTF` int NOT NULL,
  `q__RXym` int NOT NULL,
  `b__QEfr` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `q_b__RXcH` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_ch__dbe_` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `b_zh__WZPd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__FAWj` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`q_b__RXcH`) USING BTREE,
  UNIQUE INDEX `q_b__RXcH`(`q_b__RXcH` ASC) USING BTREE,
  INDEX `j_d__YNbE`(`j_d__YNbE` ASC) USING BTREE,
  INDEX `b__QEfr`(`b__QEfr` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_b_q_d_j_b__wprd_ibfk_1` FOREIGN KEY (`j_d__YNbE`) REFERENCES `auto_d_w_d_j_b__dxfz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_b_q_d_j_b__wprd_ibfk_2` FOREIGN KEY (`b__QEfr`) REFERENCES `auto_b_z_d__abfr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_b_q_d_j_b__wprd
-- ----------------------------

-- ----------------------------
-- Table structure for auto_b_z_d__abfr
-- ----------------------------
DROP TABLE IF EXISTS `auto_b_z_d__abfr`;
CREATE TABLE `auto_b_z_d__abfr`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__nXEt` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_b_z_d__abfr
-- ----------------------------
INSERT INTO `auto_b_z_d__abfr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '0639a2d4-e795-4d62-96f3-6d2cfe9aa5d0', '甲', '2024-05-09 18:21:21', NULL);
INSERT INTO `auto_b_z_d__abfr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '6ce563c7-c34f-4695-a6aa-15f6395cdb94', '乙', '2024-05-09 18:21:21', NULL);
INSERT INTO `auto_b_z_d__abfr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'd6ea1e62-8885-432d-98e5-47ad10ab0878', '丁', '2024-05-09 18:21:21', NULL);
INSERT INTO `auto_b_z_d__abfr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'f5960341-b866-4cad-b50f-63448a35e3a6', '丙', '2024-05-09 18:21:21', NULL);

-- ----------------------------
-- Table structure for auto_content_dict
-- ----------------------------
DROP TABLE IF EXISTS `auto_content_dict`;
CREATE TABLE `auto_content_dict`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__PbHJ` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_content_dict
-- ----------------------------

-- ----------------------------
-- Table structure for auto_course_information
-- ----------------------------
DROP TABLE IF EXISTS `auto_course_information`;
CREATE TABLE `auto_course_information`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `serial_number` int NOT NULL,
  `major` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class_hour` int NULL DEFAULT NULL,
  `remarks` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`full_name`) USING BTREE,
  UNIQUE INDEX `full_name`(`full_name` ASC) USING BTREE,
  UNIQUE INDEX `short_name`(`short_name` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  INDEX `id_4`(`id` ASC) USING BTREE,
  INDEX `id_5`(`id` ASC) USING BTREE,
  INDEX `id_6`(`id` ASC) USING BTREE,
  INDEX `id_7`(`id` ASC) USING BTREE,
  INDEX `id_8`(`id` ASC) USING BTREE,
  INDEX `id_9`(`id` ASC) USING BTREE,
  INDEX `id_10`(`id` ASC) USING BTREE,
  INDEX `id_11`(`id` ASC) USING BTREE,
  INDEX `id_12`(`id` ASC) USING BTREE,
  INDEX `id_13`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_course_information
-- ----------------------------

-- ----------------------------
-- Table structure for auto_course_schedule
-- ----------------------------
DROP TABLE IF EXISTS `auto_course_schedule`;
CREATE TABLE `auto_course_schedule`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `classes` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `students_num` int NULL DEFAULT NULL,
  `course_date` date NOT NULL,
  `course_sequence` int NOT NULL,
  `course_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `classroom` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `teacher` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `class_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `remarks` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SID` bigint NOT NULL,
  PRIMARY KEY (`SID`) USING BTREE,
  UNIQUE INDEX `SID`(`SID` ASC) USING BTREE,
  INDEX `classes`(`classes` ASC) USING BTREE,
  INDEX `course_name`(`course_name` ASC) USING BTREE,
  CONSTRAINT `auto_course_schedule_ibfk_1` FOREIGN KEY (`classes`) REFERENCES `auto_b_q_d_j_b__wprd` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_course_schedule_ibfk_2` FOREIGN KEY (`course_name`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_course_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for auto_d_j_l_b_z_d__wxwj
-- ----------------------------
DROP TABLE IF EXISTS `auto_d_j_l_b_z_d__wxwj`;
CREATE TABLE `auto_d_j_l_b_z_d__wxwj`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__BXPp` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_d_j_l_b_z_d__wxwj
-- ----------------------------
INSERT INTO `auto_d_j_l_b_z_d__wxwj` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '0af0f481-8b82-4f88-b64b-08dc453b9dae', '时控', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_d_j_l_b_z_d__wxwj` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '1336ae9d-908f-41ab-8d1c-43ddd56a803c', '其他', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_d_j_l_b_z_d__wxwj` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '4e9a5b74-c458-423a-86e6-39310f829c3f', '排故', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_d_j_l_b_z_d__wxwj` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '608451ed-9518-4b77-81f9-9d6096b21b27', '定检', '2024-05-09 18:21:19', NULL);

-- ----------------------------
-- Table structure for auto_d_w_d_j_b__dxfz
-- ----------------------------
DROP TABLE IF EXISTS `auto_d_w_d_j_b__dxfz`;
CREATE TABLE `auto_d_w_d_j_b__dxfz`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_h__JkWC` int NOT NULL,
  `j__WATn` int NOT NULL,
  `d_w__zxfQ` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `m_ch__NBpQ` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sh_j__cKhQ` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_ch__sddz` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `b_zh__JTHX` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__AMYA` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`d_w__zxfQ`) USING BTREE,
  UNIQUE INDEX `d_w__zxfQ`(`d_w__zxfQ` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `sh_j__cKhQ`(`sh_j__cKhQ` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  INDEX `id_4`(`id` ASC) USING BTREE,
  INDEX `id_5`(`id` ASC) USING BTREE,
  INDEX `id_6`(`id` ASC) USING BTREE,
  INDEX `id_7`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_d_w_d_j_b__dxfz_ibfk_1` FOREIGN KEY (`sh_j__cKhQ`) REFERENCES `auto_d_w_d_j_b__dxfz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_d_w_d_j_b__dxfz
-- ----------------------------

-- ----------------------------
-- Table structure for auto_engine_position_dict
-- ----------------------------
DROP TABLE IF EXISTS `auto_engine_position_dict`;
CREATE TABLE `auto_engine_position_dict`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `w_zh__MCQX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `serial_number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_engine_position_dict
-- ----------------------------
INSERT INTO `auto_engine_position_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '34eac4b2-78a9-4dba-aee8-7721821f1b86', '左发', '2024-05-09 18:21:20', '2024-05-10 22:47:32', 1);
INSERT INTO `auto_engine_position_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '3badaa9d-d7c3-4a95-b19e-bef5c2109ccb', '单发', '2024-05-09 18:21:20', '2024-05-10 22:47:34', 2);
INSERT INTO `auto_engine_position_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'ac01eb61-0e6e-4831-a0d3-1066a4ba8997', '右发', '2024-05-09 18:21:20', '2024-05-10 22:47:35', 3);
INSERT INTO `auto_engine_position_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'b78df213-008e-47ca-ba56-11a23d3bb850', '双发', '2024-05-09 18:21:20', '2024-05-10 22:47:38', 4);

-- ----------------------------
-- Table structure for auto_exam_result
-- ----------------------------
DROP TABLE IF EXISTS `auto_exam_result`;
CREATE TABLE `auto_exam_result`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `major` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_num` int NULL DEFAULT NULL,
  `highest_score` int NULL DEFAULT NULL,
  `lowest_score` int NULL DEFAULT NULL,
  `average_score` int NULL DEFAULT NULL,
  `ideal_percentage` float NULL DEFAULT NULL,
  `good_percentage` float NULL DEFAULT NULL,
  `pass_percentage` float NULL DEFAULT NULL,
  `flunk_percentage` float NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_exam_result
-- ----------------------------

-- ----------------------------
-- Table structure for auto_exam_result_detail
-- ----------------------------
DROP TABLE IF EXISTS `auto_exam_result_detail`;
CREATE TABLE `auto_exam_result_detail`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` bigint NOT NULL,
  `QID` bigint NOT NULL,
  `serial_number` int NOT NULL,
  `solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `mark` float NULL DEFAULT NULL,
  `correct` tinyint(1) NULL DEFAULT NULL,
  `reviewed` tinyint(1) NOT NULL,
  `remarks` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `ERID` bigint NOT NULL,
  PRIMARY KEY (`ERID`) USING BTREE,
  UNIQUE INDEX `ERID`(`ERID` ASC) USING BTREE,
  INDEX `auto_exam_result_detail_ibfk_1`(`PID` ASC) USING BTREE,
  CONSTRAINT `auto_exam_result_detail_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `auto_paper_info` (`PIID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_exam_result_detail
-- ----------------------------

-- ----------------------------
-- Table structure for auto_examination
-- ----------------------------
DROP TABLE IF EXISTS `auto_examination`;
CREATE TABLE `auto_examination`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EID` bigint NOT NULL,
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exam_name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `total_time` int NULL DEFAULT NULL,
  `paper_num` int NULL DEFAULT NULL,
  `reference_unit` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `allow_times` int NULL DEFAULT NULL,
  `examinees_num` int NULL DEFAULT NULL,
  `manual_grading` tinyint(1) NULL DEFAULT NULL,
  `judge` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end` tinyint(1) NULL DEFAULT NULL,
  `course_1` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_1` float NULL DEFAULT NULL,
  `course_2` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_2` float NULL DEFAULT NULL,
  `course_3` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_3` float NULL DEFAULT NULL,
  `course_4` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_4` float NULL DEFAULT NULL,
  `course_5` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_5` float NULL DEFAULT NULL,
  `course_6` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_6` float NULL DEFAULT NULL,
  `course_7` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_7` float NULL DEFAULT NULL,
  `course_8` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_8` float NULL DEFAULT NULL,
  `course_9` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_9` float NULL DEFAULT NULL,
  `course_10` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratio_10` float NULL DEFAULT NULL,
  `single_choice_num` int NULL DEFAULT NULL,
  `single_choice_score` float NULL DEFAULT NULL,
  `multiple_choice_num` int NULL DEFAULT NULL,
  `multiple_choice_score` float NULL DEFAULT NULL,
  `judge_num` int NULL DEFAULT NULL,
  `judge_score` float NULL DEFAULT NULL,
  `fill_num` int NULL DEFAULT NULL,
  `fill_score` float NULL DEFAULT NULL,
  `short_answer_num` int NULL DEFAULT NULL,
  `short_answer_score` float NULL DEFAULT NULL,
  `remarks` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EID`) USING BTREE,
  UNIQUE INDEX `EID`(`EID` ASC) USING BTREE,
  INDEX `reference_unit`(`reference_unit` ASC) USING BTREE,
  INDEX `course1`(`course_1` ASC) USING BTREE,
  INDEX `course_2`(`course_2` ASC) USING BTREE,
  INDEX `course_3`(`course_3` ASC) USING BTREE,
  INDEX `course_4`(`course_4` ASC) USING BTREE,
  INDEX `course_5`(`course_5` ASC) USING BTREE,
  INDEX `course_6`(`course_6` ASC) USING BTREE,
  INDEX `course_7`(`course_7` ASC) USING BTREE,
  INDEX `course_8`(`course_8` ASC) USING BTREE,
  INDEX `course_9`(`course_9` ASC) USING BTREE,
  INDEX `course_10`(`course_10` ASC) USING BTREE,
  CONSTRAINT `auto_examination_ibfk_1` FOREIGN KEY (`reference_unit`) REFERENCES `auto_b_q_d_j_b__wprd` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_10` FOREIGN KEY (`course_9`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_11` FOREIGN KEY (`course_10`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_2` FOREIGN KEY (`course_1`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_3` FOREIGN KEY (`course_2`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_4` FOREIGN KEY (`course_3`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_5` FOREIGN KEY (`course_4`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_6` FOREIGN KEY (`course_5`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_7` FOREIGN KEY (`course_6`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_8` FOREIGN KEY (`course_7`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_examination_ibfk_9` FOREIGN KEY (`course_8`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_examination
-- ----------------------------

-- ----------------------------
-- Table structure for auto_executed_flight_plan_base
-- ----------------------------
DROP TABLE IF EXISTS `auto_executed_flight_plan_base`;
CREATE TABLE `auto_executed_flight_plan_base`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weather` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `airport` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `takeoff` datetime NOT NULL,
  `end` datetime NOT NULL,
  `occupation_time` int NOT NULL,
  `people_number` int NOT NULL,
  `situation` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chief_director` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deputy_director` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_flight_number` int NULL DEFAULT NULL,
  `flight_number` int NULL DEFAULT NULL,
  `flight_date` tinyint(1) NULL DEFAULT NULL,
  `night_flight` int NULL DEFAULT NULL,
  `air_time` int NULL DEFAULT NULL,
  `ground_time` int NULL DEFAULT NULL,
  `dual_flight` int NULL DEFAULT NULL,
  `captain` int NULL DEFAULT NULL,
  `solo_flight` int NULL DEFAULT NULL,
  `cross_country_flight` int NULL DEFAULT NULL,
  `instrument_flight` int NULL DEFAULT NULL,
  `exam` int NULL DEFAULT NULL,
  `spiral` int NULL DEFAULT NULL,
  `proficiency` int NULL DEFAULT NULL,
  `conversion` int NULL DEFAULT NULL,
  `test_flight` int NULL DEFAULT NULL,
  `mission` int NULL DEFAULT NULL,
  `inspection` int NULL DEFAULT NULL,
  `task` int NULL DEFAULT NULL,
  `sightseeing` int NULL DEFAULT NULL,
  `teaching` int NULL DEFAULT NULL,
  `coach_exam` int NULL DEFAULT NULL,
  `coach_conversion` int NULL DEFAULT NULL,
  `coach_inspection` int NULL DEFAULT NULL,
  `ballasting` int NULL DEFAULT NULL,
  `FTD` int NULL DEFAULT NULL,
  `total_time` int NULL DEFAULT NULL,
  `day_time` int NULL DEFAULT NULL,
  `night_time` int NULL DEFAULT NULL,
  `cross_country_flight_time` int NULL DEFAULT NULL,
  `local_flight_time` int NULL DEFAULT NULL,
  `local_flight_number` int NULL DEFAULT NULL,
  `cross_country_flight_number` int NULL DEFAULT NULL,
  `takeoff_number` int NULL DEFAULT NULL,
  `landing_number` int NULL DEFAULT NULL,
  `day_landing_number` int NULL DEFAULT NULL,
  `night_landing_number` int NULL DEFAULT NULL,
  `coach` int NULL DEFAULT NULL,
  `student` int NULL DEFAULT NULL,
  `coach_time` int NULL DEFAULT NULL,
  `student_time` int NULL DEFAULT NULL,
  `coach_average` int NULL DEFAULT NULL,
  `student_average` int NULL DEFAULT NULL,
  `student_progress` float NULL DEFAULT NULL,
  `plane_number` int NULL DEFAULT NULL,
  `plane_average` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unit`(`unit` ASC) USING BTREE,
  INDEX `type`(`type` ASC) USING BTREE,
  INDEX `weather`(`weather` ASC) USING BTREE,
  CONSTRAINT `auto_executed_flight_plan_base_ibfk_1` FOREIGN KEY (`type`) REFERENCES `auto_f_x_j_h_l_x_z_d__wpca` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_executed_flight_plan_base_ibfk_2` FOREIGN KEY (`weather`) REFERENCES `auto_q_x_z_d__znar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_executed_flight_plan_base
-- ----------------------------

-- ----------------------------
-- Table structure for auto_executed_flight_plan_content
-- ----------------------------
DROP TABLE IF EXISTS `auto_executed_flight_plan_content`;
CREATE TABLE `auto_executed_flight_plan_content`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `takeoff_airport` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `landing_airport` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ups_and_downs` int NULL DEFAULT NULL,
  `spiral` int NULL DEFAULT NULL,
  `HS1` int NULL DEFAULT NULL,
  `coach_exam` int NULL DEFAULT NULL,
  `captain` int NULL DEFAULT NULL,
  `rear_cabin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inspection` int NULL DEFAULT NULL,
  `cross_country_flight` int NULL DEFAULT NULL,
  `unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `summary` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `front_cabin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `air_time` int NULL DEFAULT NULL,
  `night_landing_number` int NULL DEFAULT NULL,
  `engine_shutdown` datetime NULL DEFAULT NULL,
  `landing` datetime NULL DEFAULT NULL,
  `takeoff` datetime NULL DEFAULT NULL,
  `sightseeing` int NULL DEFAULT NULL,
  `total_time` int NULL DEFAULT NULL,
  `night_flight` int NULL DEFAULT NULL,
  `instrument_flight` int NULL DEFAULT NULL,
  `solo_flight` int NULL DEFAULT NULL,
  `mission` int NULL DEFAULT NULL,
  `dual_flight` int NULL DEFAULT NULL,
  `teaching` int NULL DEFAULT NULL,
  `engine_start` int NOT NULL,
  `serial_number` int NULL DEFAULT NULL,
  `ballasting` int NULL DEFAULT NULL,
  `ground_time` int NULL DEFAULT NULL,
  `coach_conversion` int NULL DEFAULT NULL,
  `conversion` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `task` int NULL DEFAULT NULL,
  `HS2` int NULL DEFAULT NULL,
  `day_landing_number` int NULL DEFAULT NULL,
  `test_flight` int NULL DEFAULT NULL,
  `coach_inspection` int NULL DEFAULT NULL,
  `FTD` int NULL DEFAULT NULL,
  `exam` int NULL DEFAULT NULL,
  `practised` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aircraft_id`(`aircraft_id` ASC) USING BTREE,
  INDEX `SID`(`SID` ASC) USING BTREE,
  INDEX `FID`(`FID` ASC) USING BTREE,
  INDEX `BID`(`BID` ASC) USING BTREE,
  INDEX `takeoff_airport`(`takeoff_airport` ASC) USING BTREE,
  INDEX `landing_airport`(`landing_airport` ASC) USING BTREE,
  CONSTRAINT `auto_executed_flight_plan_content_ibfk_1` FOREIGN KEY (`aircraft_id`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_executed_flight_plan_content_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `auto_flight_subject_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_executed_flight_plan_content_ibfk_3` FOREIGN KEY (`FID`) REFERENCES `auto_x_y_x_x_b__dxtc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_executed_flight_plan_content_ibfk_4` FOREIGN KEY (`BID`) REFERENCES `auto_x_y_x_x_b__dxtc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_executed_flight_plan_content_ibfk_5` FOREIGN KEY (`takeoff_airport`) REFERENCES `auto_j_ch_x_x_d_j_b__rsqm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_executed_flight_plan_content_ibfk_6` FOREIGN KEY (`landing_airport`) REFERENCES `auto_j_ch_x_x_d_j_b__rsqm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_executed_flight_plan_content
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_d_j_l_l_b__c__ttrw
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_d_j_l_l_b__c__ttrw`;
CREATE TABLE `auto_f_d_j_l_l_b__c__ttrw`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `engine_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `last_overhaul_date` date NULL DEFAULT NULL,
  `content` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reporter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `UID` bigint NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `UID`(`UID` ASC) USING BTREE,
  INDEX `aircraft_serial`(`aircraft_serial` ASC) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  INDEX `engine_model`(`engine_model` ASC) USING BTREE,
  INDEX `engine_serial`(`engine_serial` ASC) USING BTREE,
  INDEX `content`(`content` ASC) USING BTREE,
  CONSTRAINT `auto_f_d_j_l_l_b__c__ttrw_ibfk_1` FOREIGN KEY (`aircraft_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b__c__ttrw_ibfk_2` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b__c__ttrw_ibfk_3` FOREIGN KEY (`engine_model`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b__c__ttrw_ibfk_4` FOREIGN KEY (`engine_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b__c__ttrw_ibfk_5` FOREIGN KEY (`content`) REFERENCES `intermediate_table` (`correlation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_d_j_l_l_b__c__ttrw
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_d_j_l_l_b_s_c___htt
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_d_j_l_l_b_s_c___htt`;
CREATE TABLE `auto_f_d_j_l_l_b_s_c___htt`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `aircraft_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `engine_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ADSB` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `completion_date` date NOT NULL,
  `flight_hours` int NULL DEFAULT NULL,
  `repeat` tinyint(1) NULL DEFAULT NULL,
  `next_execution_date` date NULL DEFAULT NULL,
  `reporter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `ID`(`UID` ASC) USING BTREE,
  INDEX `aircraft_serial`(`aircraft_serial` ASC) USING BTREE,
  INDEX `engine_model`(`engine_model` ASC) USING BTREE,
  INDEX `engine_serial`(`engine_serial` ASC) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  CONSTRAINT `auto_f_d_j_l_l_b_s_c___htt_ibfk_1` FOREIGN KEY (`aircraft_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b_s_c___htt_ibfk_2` FOREIGN KEY (`engine_model`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b_s_c___htt_ibfk_3` FOREIGN KEY (`engine_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b_s_c___htt_ibfk_4` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_d_j_l_l_b_s_c___htt
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_d_j_l_l_b_y_c__mhds
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_d_j_l_l_b_y_c__mhds`;
CREATE TABLE `auto_f_d_j_l_l_b_y_c__mhds`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `aircraft_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `operating_hours` int NOT NULL,
  `inspection_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reporter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `ID`(`UID` ASC) USING BTREE,
  INDEX `aircraft_serial`(`aircraft_serial` ASC) USING BTREE,
  INDEX `engine_model`(`engine_model` ASC) USING BTREE,
  INDEX `engine_serial`(`engine_serial` ASC) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  CONSTRAINT `auto_f_d_j_l_l_b_y_c__mhds_ibfk_1` FOREIGN KEY (`aircraft_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b_y_c__mhds_ibfk_2` FOREIGN KEY (`engine_model`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b_y_c__mhds_ibfk_3` FOREIGN KEY (`engine_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_d_j_l_l_b_y_c__mhds_ibfk_4` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_d_j_l_l_b_y_c__mhds
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_j_l_l_b__c__tjzg
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_j_l_l_b__c__tjzg`;
CREATE TABLE `auto_f_j_l_l_b__c__tjzg`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `serial_number` bigint NOT NULL,
  `aircraft_number` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `signature` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `signer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `license_number` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `add_lubricant` int NULL DEFAULT NULL,
  `captain` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_officer` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visual_1` tinyint(1) NULL DEFAULT NULL,
  `night_vision_1` tinyint(1) NULL DEFAULT NULL,
  `instrument_1` tinyint(1) NULL DEFAULT NULL,
  `departure_station_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `arrival_station_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fuel_left_1` int NULL DEFAULT NULL,
  `fuel_right_1` int NULL DEFAULT NULL,
  `start_engine_1` datetime NULL DEFAULT NULL,
  `takeoff_1` datetime NULL DEFAULT NULL,
  `landing_1` datetime NULL DEFAULT NULL,
  `shutdown_1` datetime NULL DEFAULT NULL,
  `ground_time_1` int NULL DEFAULT NULL,
  `flight_time_1` int NULL DEFAULT NULL,
  `total_time_1` int NULL DEFAULT NULL,
  `engine_starts_1` int NULL DEFAULT NULL,
  `landings_1` int NULL DEFAULT NULL,
  `visual_2` tinyint(1) NULL DEFAULT NULL,
  `night_vision_2` tinyint(1) NULL DEFAULT NULL,
  `instrument_2` tinyint(1) NULL DEFAULT NULL,
  `departure_station_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `arrival_station_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fuel_left_2` int NULL DEFAULT NULL,
  `fuel_right_2` int NULL DEFAULT NULL,
  `start_engine_2` datetime NULL DEFAULT NULL,
  `takeoff_2` datetime NULL DEFAULT NULL,
  `landing_2` datetime NULL DEFAULT NULL,
  `shutdown_2` datetime NULL DEFAULT NULL,
  `ground_time_2` int NULL DEFAULT NULL,
  `flight_time_2` int NULL DEFAULT NULL,
  `total_time_2` int NULL DEFAULT NULL,
  `engine_starts_2` int NULL DEFAULT NULL,
  `landings_2` int NULL DEFAULT NULL,
  `visual_3` tinyint(1) NULL DEFAULT NULL,
  `night_vision_3` tinyint(1) NULL DEFAULT NULL,
  `instrument_3` tinyint(1) NULL DEFAULT NULL,
  `departure_station_3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `arrival_station_3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fuel_left_3` int NULL DEFAULT NULL,
  `fuel_right_3` int NULL DEFAULT NULL,
  `start_engine_3` datetime NULL DEFAULT NULL,
  `takeoff_3` datetime NULL DEFAULT NULL,
  `landing_3` datetime NULL DEFAULT NULL,
  `shutdown_3` datetime NULL DEFAULT NULL,
  `ground_time_3` int NULL DEFAULT NULL,
  `flight_time_3` int NULL DEFAULT NULL,
  `total_time_3` int NULL DEFAULT NULL,
  `engine_starts_3` int NULL DEFAULT NULL,
  `landings_3` int NULL DEFAULT NULL,
  `visual_4` tinyint(1) NULL DEFAULT NULL,
  `night_vision_4` tinyint(1) NULL DEFAULT NULL,
  `instrument_4` tinyint(1) NULL DEFAULT NULL,
  `departure_station_4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `arrival_station_4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fuel_left_4` int NULL DEFAULT NULL,
  `fuel_right_4` int NULL DEFAULT NULL,
  `start_engine_4` datetime NULL DEFAULT NULL,
  `takeoff_4` datetime NULL DEFAULT NULL,
  `landing_4` datetime NULL DEFAULT NULL,
  `shutdown_4` datetime NULL DEFAULT NULL,
  `ground_time_4` int NULL DEFAULT NULL,
  `flight_time_4` int NULL DEFAULT NULL,
  `total_time_4` int NULL DEFAULT NULL,
  `engine_starts_4` int NULL DEFAULT NULL,
  `landings_4` int NULL DEFAULT NULL,
  `maintenance_report_1` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reporter_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_1` date NULL DEFAULT NULL,
  `maintenance_report_2` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reporter_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_2` date NULL DEFAULT NULL,
  `maintenance_report_3` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reporter_3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station_3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_3` date NULL DEFAULT NULL,
  `maintenance_record` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maintenance_station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maintenance_performer` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maintenance_date` date NULL DEFAULT NULL,
  `ata_chapter_1` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_name_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `removed_part_number_1` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `removed_serial_number_1` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `installed_part_number_1` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `installed_serial_number_1` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ata_chapter_2` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_name_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `removed_part_number_2` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `removed_serial_number_2` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `installed_part_number_2` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `installed_serial_number_2` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ata_chapter_3` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_name_3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `removed_part_number_3` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `removed_serial_number_3` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `installed_part_number_3` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `installed_serial_number_3` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `release_signature` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `release_license_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inspector` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inspection_license_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inspection_date` date NULL DEFAULT NULL,
  `inspection_station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comments` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`serial_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_j_l_l_b__c__tjzg
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_j_l_l_b_y_c__jfbx
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_j_l_l_b_y_c__jfbx`;
CREATE TABLE `auto_f_j_l_l_b_y_c__jfbx`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_x__CchN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_h__bGYP` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `f_d_j_x_h__JXaK` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `f_d_j_x_h__KiaX` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `f_d_j__zh__C_Hy` date NULL DEFAULT NULL,
  `f_d_j_sh_m__BrzW` int NULL DEFAULT NULL,
  `f_d_j_sh_j__tSRE` int NULL DEFAULT NULL,
  `l_x_j_x_h__BEbc` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l_x_j_x_h__ewrn` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l_x_j__zh__Kwmt` date NULL DEFAULT NULL,
  `l_x_j_sh_m__EMb_` int NULL DEFAULT NULL,
  `l_x_j_sh_j__BEM_` int NULL DEFAULT NULL,
  `h_y_x_h__mKnC` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_l_x_y_x_h__ii_B` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_ch_ch_x_h__ZQPK` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_ch_ch_r_q__CAAi` date NULL DEFAULT NULL,
  `h_k_q_zh_z_sh__RTdm` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_j_f_r_q__BTSK` date NULL DEFAULT NULL,
  `f_d_j_zh_z_sh__PaYR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l_x_j_zh_z_sh__Dkrx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_k_zh__zPZS` int NULL DEFAULT NULL,
  `h_k_q_j_zh__Bitf` int NULL DEFAULT NULL,
  `z_d_j_y_l__fmpD` int NULL DEFAULT NULL,
  `z_d_q_f_zh_l__MDhh` int NULL DEFAULT NULL,
  `z_d_zh_l_zh_l__GnMs` int NULL DEFAULT NULL,
  `j_sh_ch_d__wQiJ` int NULL DEFAULT NULL,
  `y_zh__FThj` int NULL DEFAULT NULL,
  `j_sh_g_d__tbCx` int NULL DEFAULT NULL,
  `d_zh__BPaW` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `t_x__nNHM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `y_b__GCjm` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_zh__nGaz` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`j_h__bGYP`) USING BTREE,
  UNIQUE INDEX `j_h__bGYP`(`j_h__bGYP` ASC) USING BTREE,
  INDEX `j_x__CchN`(`j_x__CchN` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_j_l_l_b_y_c__jfbx
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_j_x_x_d_j_b__hrwm
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_j_x_x_d_j_b__hrwm`;
CREATE TABLE `auto_f_j_x_x_d_j_b__hrwm`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_x__CchN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_h__bGYP` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_h__fFmZ` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `d_w__BpK_` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_sh_sh_m__rSFE` int NULL DEFAULT NULL,
  `j_sh_sh_j__dZMc` int NULL DEFAULT NULL,
  `f_d_j_x_h__JXaK` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `f_d_j_x_h__KiaX` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `f_d_j__zh__C_Hy` date NULL DEFAULT NULL,
  `f_d_j_sh_m__BrzW` int NULL DEFAULT NULL,
  `f_d_j_sh_j__tSRE` int NULL DEFAULT NULL,
  `l_x_j_x_h__BEbc` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l_x_j_x_h__ewrn` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l_x_j__zh__Kwmt` date NULL DEFAULT NULL,
  `l_x_j_sh_m__EMb_` int NULL DEFAULT NULL,
  `l_x_j_sh_j__BEM_` int NULL DEFAULT NULL,
  `h_y_x_h__mKnC` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_l_x_y_x_h__ii_B` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_j_zh_h__fPwx` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_j_zh_r_q__ySzx` date NULL DEFAULT NULL,
  `sh_h_zh_h__tkCY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sh_h_zh_f_zh__TSAx` date NULL DEFAULT NULL,
  `sh_h_zh_d_q__BFFi` date NULL DEFAULT NULL,
  `d_t_zh_h__NYNZ` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_t_zh_f_zh__GhQT` date NULL DEFAULT NULL,
  `d_t_zh_d_q__MXYH` date NULL DEFAULT NULL,
  `h_k_q_ch_ch_x_h__ZQPK` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_ch_ch_r_q__CAAi` date NULL DEFAULT NULL,
  `h_k_q_zh_z_sh__RTdm` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_j_f_r_q__BTSK` date NULL DEFAULT NULL,
  `f_d_j_zh_z_sh__PaYR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l_x_j_zh_z_sh__Dkrx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_k_q_k_zh__zPZS` int NULL DEFAULT NULL,
  `h_k_q_j_zh__Bitf` int NULL DEFAULT NULL,
  `z_d_j_y_l__fmpD` int NULL DEFAULT NULL,
  `z_d_q_f_zh_l__MDhh` int NULL DEFAULT NULL,
  `z_d_zh_l_zh_l__GnMs` int NULL DEFAULT NULL,
  `j_sh_ch_d__wQiJ` int NULL DEFAULT NULL,
  `y_zh__FThj` int NULL DEFAULT NULL,
  `j_sh_g_d__tbCx` int NULL DEFAULT NULL,
  `d_zh__BPaW` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `t_x__nNHM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `y_b__GCjm` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_zh__nGaz` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `k_f_k_m__JHba` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_f_k_m__Sdzb` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `f_j_zh_t__sbwY` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `t_j_r_q__ZdW_` date NULL DEFAULT NULL,
  `z_c__JBTP` tinyint(1) NOT NULL,
  `f_j__hnWz` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__XRKr` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__wmfZ` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `j_h__bGYP`(`j_h__bGYP` ASC) USING BTREE,
  INDEX `j_x__CchN`(`j_x__CchN` ASC) USING BTREE,
  INDEX `d_w__BpK_`(`d_w__BpK_` ASC) USING BTREE,
  INDEX `f_j_zh_t__sbwY`(`f_j_zh_t__sbwY` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  INDEX `id_4`(`id` ASC) USING BTREE,
  INDEX `id_5`(`id` ASC) USING BTREE,
  INDEX `id_6`(`id` ASC) USING BTREE,
  INDEX `id_7`(`id` ASC) USING BTREE,
  INDEX `id_8`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_f_j_x_x_d_j_b__hrwm_ibfk_1` FOREIGN KEY (`j_x__CchN`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_j_x_x_d_j_b__hrwm_ibfk_2` FOREIGN KEY (`d_w__BpK_`) REFERENCES `auto_d_w_d_j_b__dxfz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_f_j_x_x_d_j_b__hrwm_ibfk_3` FOREIGN KEY (`f_j_zh_t__sbwY`) REFERENCES `auto_f_j_zh_t_z_d__zfmb` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_j_x_x_d_j_b__hrwm
-- ----------------------------

-- ----------------------------
-- Table structure for auto_f_j_zh_t_z_d__zfmb
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_j_zh_t_z_d__zfmb`;
CREATE TABLE `auto_f_j_zh_t_z_d__zfmb`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__at_T` int NULL DEFAULT NULL,
  `n_r__krXX` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_j_zh_t_z_d__zfmb
-- ----------------------------
INSERT INTO `auto_f_j_zh_t_z_d__zfmb` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'be5e6e82-281a-44c5-8f55-e473f5dc6ca1', 3, '封存', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_j_zh_t_z_d__zfmb` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'd2d46d79-e884-45e8-8554-0e764c620b4f', 1, '可用', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_j_zh_t_z_d__zfmb` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'e2205415-93bc-4b16-b75a-a5afaa93e4fe', 2, '维修', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_j_zh_t_z_d__zfmb` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'f282d689-c5ab-4083-a026-60b341c40ca1', 4, '报废', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_f_x_d_j_z_d__nmta
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_x_d_j_z_d__nmta`;
CREATE TABLE `auto_f_x_d_j_z_d__nmta`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r___jQp` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_x_d_j_z_d__nmta
-- ----------------------------
INSERT INTO `auto_f_x_d_j_z_d__nmta` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '27260f0b-ead0-47fe-9404-e2d1436197cd', '三级', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_x_d_j_z_d__nmta` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '440bfb49-ef7b-42c9-9506-010dfd970e84', '二级', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_x_d_j_z_d__nmta` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '92f83ef8-e416-426b-8223-bae47a04f371', '特级', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_x_d_j_z_d__nmta` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'd648d36d-a9f5-4821-addc-d09998dcab37', '一级', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_f_x_j_h_l_x_z_d__wpca
-- ----------------------------
DROP TABLE IF EXISTS `auto_f_x_j_h_l_x_z_d__wpca`;
CREATE TABLE `auto_f_x_j_h_l_x_z_d__wpca`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__aWPY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_f_x_j_h_l_x_z_d__wpca
-- ----------------------------
INSERT INTO `auto_f_x_j_h_l_x_z_d__wpca` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '0d5fdcc8-100a-425a-8630-bc66df19e455', '主', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_x_j_h_l_x_z_d__wpca` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '88d35a7f-367a-4336-930d-045b8919e0c7', '备2', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_x_j_h_l_x_z_d__wpca` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '90ccab92-1eeb-4b55-b39f-c741389752f0', '备1', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_f_x_j_h_l_x_z_d__wpca` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'afea4bdc-aab8-4a82-b449-79edde1633a2', '考试', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_flight_action
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_action`;
CREATE TABLE `auto_flight_action`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AID` int NOT NULL,
  `aircraft_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_name` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `course_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`AID`) USING BTREE,
  UNIQUE INDEX `AID`(`AID` ASC) USING BTREE,
  INDEX `aircraft_type`(`aircraft_type` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_flight_action_ibfk_1` FOREIGN KEY (`aircraft_type`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_action
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_estimate
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_estimate`;
CREATE TABLE `auto_flight_estimate`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_serial` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filght_time` datetime NOT NULL,
  `AID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_segment_altitude` int NULL DEFAULT NULL,
  `entry_segment_speed` float NULL DEFAULT NULL,
  `entry_segment_other` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `entry_segment_score` float NULL DEFAULT NULL,
  `maintain_segment_altitude` int NULL DEFAULT NULL,
  `maintain_segment_speed` float NULL DEFAULT NULL,
  `maintain_segment_other` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maintain_segment_score` float NULL DEFAULT NULL,
  `recovery_segment_altitude` int NULL DEFAULT NULL,
  `recovery_segment_speed` float NULL DEFAULT NULL,
  `recovery_segment_other` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `recovery_segment_score` float NULL DEFAULT NULL,
  `altitude_change` float NULL DEFAULT NULL,
  `speed_change` float NULL DEFAULT NULL,
  `heading_change` float NULL DEFAULT NULL,
  `warning` tinyint(1) NULL DEFAULT NULL,
  `exceed_limit` tinyint(1) NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `duration` int NULL DEFAULT NULL,
  `remarks` varchar(49) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FID` int NOT NULL,
  PRIMARY KEY (`FID`) USING BTREE,
  UNIQUE INDEX `FID`(`FID` ASC) USING BTREE,
  INDEX `AID`(`AID` ASC) USING BTREE,
  CONSTRAINT `auto_flight_estimate_ibfk_1` FOREIGN KEY (`AID`) REFERENCES `auto_flight_action` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_estimate
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_evaluation_phase_dict
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_evaluation_phase_dict`;
CREATE TABLE `auto_flight_evaluation_phase_dict`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `serial_number` int NOT NULL,
  `content` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `serial_number`(`serial_number` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_evaluation_phase_dict
-- ----------------------------
INSERT INTO `auto_flight_evaluation_phase_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:10:23', '2024-05-11 15:10:23', '02393db8-f97c-4d21-a8ff-e7960eb8ea77', 3, '保持');
INSERT INTO `auto_flight_evaluation_phase_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:10:09', '2024-05-11 15:10:09', '2db726d4-6240-42c3-81b5-4eab4b126f0b', 2, '进入');
INSERT INTO `auto_flight_evaluation_phase_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:09:56', '2024-05-11 15:09:56', '55d360ea-d7d6-4d2a-a825-04982b77ed25', 1, '全称');
INSERT INTO `auto_flight_evaluation_phase_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:10:31', '2024-05-11 15:10:31', 'b5f28237-82e8-4f11-9bfd-77e18caa219d', 4, '改出');

-- ----------------------------
-- Table structure for auto_flight_evaluation_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_evaluation_type_dict`;
CREATE TABLE `auto_flight_evaluation_type_dict`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `serial_number` int NOT NULL,
  `content` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `serial_number`(`serial_number` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_evaluation_type_dict
-- ----------------------------
INSERT INTO `auto_flight_evaluation_type_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:11:01', '2024-05-11 15:11:01', '4429d8a9-34cb-4e8c-ac3d-558634069c8c', 3, '预警');
INSERT INTO `auto_flight_evaluation_type_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:10:52', '2024-05-11 15:10:52', 'a40477b8-56f9-4fff-8ddc-f1acf1de2123', 2, '打分');
INSERT INTO `auto_flight_evaluation_type_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:11:18', '2024-05-11 15:11:18', 'a5da408d-b877-447f-9819-5a78a7663dec', 4, '超限');
INSERT INTO `auto_flight_evaluation_type_dict` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2024-05-11 15:10:45', '2024-05-11 15:10:45', 'd0a0406c-802a-48c3-8822-7d44330dcb50', 1, '记录');

-- ----------------------------
-- Table structure for auto_flight_outline
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_outline`;
CREATE TABLE `auto_flight_outline`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL,
  `OID` int NOT NULL,
  `version` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `release_time` datetime NULL DEFAULT NULL,
  `attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`OID`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `version`(`version` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_flight_outline_ibfk_1` FOREIGN KEY (`version`) REFERENCES `auto_b_b_z_d__p_hs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_outline
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_plan_base
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_plan_base`;
CREATE TABLE `auto_flight_plan_base`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL,
  `PID` bigint NOT NULL,
  `UID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weather` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `formulate` datetime NOT NULL,
  `approve` datetime NOT NULL,
  `takeoff` datetime NOT NULL,
  `end` datetime NOT NULL,
  `rows` int NOT NULL,
  `width` float NOT NULL,
  `flight_number` int NOT NULL,
  `airport` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `daybreak` datetime NOT NULL,
  `sunrise` datetime NOT NULL,
  `sunset` datetime NOT NULL,
  `dark` datetime NOT NULL,
  `chief_director_1` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chief_director_2` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deputy_director_1` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deputy_director_2` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trainee_director_1` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trainee_director_2` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handover` datetime NOT NULL,
  `airspace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alternate_airfield_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alternate_airfield_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alternate_airfield_1_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alternate_airfield_2_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_1` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_2` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_1_altitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_2_altitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `timer_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `timer_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `miscellaneous` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `standby_aircraft` int NULL DEFAULT NULL,
  `mission_aircraft` int NULL DEFAULT NULL,
  `tower_callsign` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `navaid_callsign` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `control_center_callsign` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `identification_friend_or_foe` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `setup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`PID`) USING BTREE,
  UNIQUE INDEX `PID`(`PID` ASC) USING BTREE,
  INDEX `l_x__mJBc`(`type` ASC) USING BTREE,
  INDEX `q_x__Z__a`(`weather` ASC) USING BTREE,
  INDEX `zh_t__fQSH`(`status` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_flight_plan_base_ibfk_1` FOREIGN KEY (`type`) REFERENCES `auto_f_x_j_h_l_x_z_d__wpca` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_base_ibfk_2` FOREIGN KEY (`weather`) REFERENCES `auto_q_x_z_d__znar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_base_ibfk_3` FOREIGN KEY (`status`) REFERENCES `auto_j_h_zh_t_z_d__pkfp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_plan_base
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_plan_content
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_plan_content`;
CREATE TABLE `auto_flight_plan_content`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BID` bigint NOT NULL,
  `aircraft_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aircraft_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `longitudinal_position` int NOT NULL,
  `scheduled_takeoff` datetime NOT NULL,
  `initiate_takeoff` datetime NULL DEFAULT NULL,
  `engine_start` datetime NULL DEFAULT NULL,
  `landing` datetime NULL DEFAULT NULL,
  `parking` datetime NULL DEFAULT NULL,
  `trainee_subject` tinyint(1) NOT NULL,
  `practice_combination` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `launch_interval` float NOT NULL,
  `preparation_time` int NOT NULL,
  `number_of_practices` int NOT NULL,
  `number_of_flyers` int NOT NULL,
  `crew_combination` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `front_cabin_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `front_cabin_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rear_cabin_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rear_cabin_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `BID`(`BID` ASC) USING BTREE,
  INDEX `d_q_zh_t__zNfC`(`current_status` ASC) USING BTREE,
  INDEX `aircraft_id`(`aircraft_id` ASC) USING BTREE,
  INDEX `auto_flight_plan_content_ibfk_3`(`aircraft_type` ASC) USING BTREE,
  INDEX `PID`(`PID` ASC) USING BTREE,
  CONSTRAINT `auto_flight_plan_content_ibfk_1` FOREIGN KEY (`current_status`) REFERENCES `auto_j_h_zh_t_z_d__pkfp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_content_ibfk_3` FOREIGN KEY (`aircraft_type`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_content_ibfk_4` FOREIGN KEY (`aircraft_id`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_plan_content
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_plan_pilot
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_plan_pilot`;
CREATE TABLE `auto_flight_plan_pilot`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `number_of_practices` int NOT NULL,
  `flight_sorties` int NOT NULL,
  `flight_quiz_results` float NULL DEFAULT NULL,
  `flight_quiz_pass` tinyint(1) NULL DEFAULT NULL,
  `mission` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `update_timeupdate_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PID`(`PID` ASC) USING BTREE,
  INDEX `UID`(`UID` ASC) USING BTREE,
  CONSTRAINT `auto_flight_plan_pilot_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `auto_flight_plan_base` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_pilot_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `auto_x_y_x_x_b__dxtc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_plan_pilot
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_plan_plane
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_plan_plane`;
CREATE TABLE `auto_flight_plan_plane`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `flight_sorties` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aircraft_id`(`aircraft_id` ASC) USING BTREE,
  INDEX `aircraft_type`(`aircraft_type` ASC) USING BTREE,
  INDEX `PID`(`PID` ASC) USING BTREE,
  CONSTRAINT `auto_flight_plan_plane_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `auto_flight_plan_base` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_plane_ibfk_2` FOREIGN KEY (`aircraft_id`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_plane_ibfk_3` FOREIGN KEY (`aircraft_type`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_plan_plane
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_plan_subject
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_plan_subject`;
CREATE TABLE `auto_flight_plan_subject`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `practice_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NULL DEFAULT NULL,
  `flight_number` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `SID`(`SID` ASC) USING BTREE,
  INDEX `aircraft_type`(`aircraft_type` ASC) USING BTREE,
  INDEX `PID`(`PID` ASC) USING BTREE,
  CONSTRAINT `auto_flight_plan_subject_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `auto_flight_plan_base` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_plan_subject_ibfk_2` FOREIGN KEY (`aircraft_type`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_plan_subject
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_standard
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_standard`;
CREATE TABLE `auto_flight_standard`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_stage` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `flight_evaluation_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parameters` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `standard_value` float NULL DEFAULT NULL,
  `rating_ideal_upper` float NULL DEFAULT NULL,
  `rating_ideal_lower` float NULL DEFAULT NULL,
  `rating_good_upper` float NULL DEFAULT NULL,
  `rating_good_lower` float NULL DEFAULT NULL,
  `rating_average_upper` float NULL DEFAULT NULL,
  `rating_average_lower` float NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FID` bigint NOT NULL,
  PRIMARY KEY (`FID`) USING BTREE,
  UNIQUE INDEX `FID`(`FID` ASC) USING BTREE,
  INDEX `AID`(`AID` ASC) USING BTREE,
  INDEX `action_stage`(`action_stage` ASC) USING BTREE,
  INDEX `flight_evaluation_type`(`flight_evaluation_type` ASC) USING BTREE,
  CONSTRAINT `auto_flight_standard_ibfk_1` FOREIGN KEY (`AID`) REFERENCES `auto_flight_action` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_standard_ibfk_2` FOREIGN KEY (`action_stage`) REFERENCES `auto_flight_evaluation_phase_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_standard_ibfk_3` FOREIGN KEY (`flight_evaluation_type`) REFERENCES `auto_flight_evaluation_type_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_standard
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_subitem_socre
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_subitem_socre`;
CREATE TABLE `auto_flight_subitem_socre`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_serial` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `takeoff` datetime NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `duration` int NULL DEFAULT NULL,
  `score` float NULL DEFAULT NULL,
  `exceed_limit_count` int NULL DEFAULT NULL,
  `warning_count` int NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FID` bigint NOT NULL,
  PRIMARY KEY (`FID`) USING BTREE,
  UNIQUE INDEX `FID`(`FID` ASC) USING BTREE,
  INDEX `AID`(`AID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_subitem_socre
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_subject_details
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_subject_details`;
CREATE TABLE `auto_flight_subject_details`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pilot_license` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stage` int NOT NULL,
  `course` int NOT NULL,
  `SID` bigint NOT NULL,
  `subject` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dual_flight` int NULL DEFAULT NULL,
  `captain` int NULL DEFAULT NULL,
  `solo_flight` int NULL DEFAULT NULL,
  `cross_country_flight` int NULL DEFAULT NULL,
  `night_flight` int NULL DEFAULT NULL,
  `instrument_flight` int NULL DEFAULT NULL,
  `spiral` int NULL DEFAULT NULL,
  `exam` int NULL DEFAULT NULL,
  `FTD` int NULL DEFAULT NULL,
  `proficiency` int NULL DEFAULT NULL,
  `conversion` int NULL DEFAULT NULL,
  `test_flight` int NULL DEFAULT NULL,
  `mission` int NULL DEFAULT NULL,
  `inspection` int NULL DEFAULT NULL,
  `task` int NULL DEFAULT NULL,
  `sightseeing` int NULL DEFAULT NULL,
  `time` int NULL DEFAULT NULL,
  `daylight` tinyint(1) NULL DEFAULT NULL,
  `aerobatics` tinyint(1) NULL DEFAULT NULL,
  `multi_engine` tinyint(1) NULL DEFAULT NULL,
  `supplementary_training` tinyint(1) NULL DEFAULT NULL,
  `launch_interval` float NULL DEFAULT NULL,
  `altitude_range` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `execute_route` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `number_of_fliers` int NULL DEFAULT NULL,
  `airspace_used` tinyint(1) NULL DEFAULT NULL,
  `course_objectives` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `completion_criteria` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_class_assignment` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `SID`(`SID` ASC) USING BTREE,
  INDEX `OID`(`OID` ASC) USING BTREE,
  INDEX `pilot_license`(`pilot_license` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_flight_subject_details_ibfk_1` FOREIGN KEY (`OID`) REFERENCES `auto_flight_outline` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_subject_details_ibfk_2` FOREIGN KEY (`pilot_license`) REFERENCES `auto_zh_zh_d_j_z_d__emzc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_subject_details
-- ----------------------------

-- ----------------------------
-- Table structure for auto_flight_total_score
-- ----------------------------
DROP TABLE IF EXISTS `auto_flight_total_score`;
CREATE TABLE `auto_flight_total_score`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_serial` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `front_cabin` bigint NOT NULL,
  `rear_cabin` bigint NULL DEFAULT NULL,
  `takeoff` datetime NOT NULL,
  `landing` datetime NOT NULL,
  `duration` int NOT NULL,
  `score` float NULL DEFAULT NULL,
  `exceed_limit_count` int NULL DEFAULT NULL,
  `warning_count` int NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FID` bigint NOT NULL,
  `course_nacourse_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`FID`) USING BTREE,
  UNIQUE INDEX `FID`(`FID` ASC) USING BTREE,
  INDEX `aircraft_model`(`aircraft_model` ASC) USING BTREE,
  INDEX `course_nacourse_name`(`course_nacourse_name` ASC) USING BTREE,
  CONSTRAINT `auto_flight_total_score_ibfk_1` FOREIGN KEY (`aircraft_model`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_flight_total_score_ibfk_2` FOREIGN KEY (`course_nacourse_name`) REFERENCES `auto_flight_subject_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_flight_total_score
-- ----------------------------

-- ----------------------------
-- Table structure for auto_h_d_k_g_l__gm_n
-- ----------------------------
DROP TABLE IF EXISTS `auto_h_d_k_g_l__gm_n`;
CREATE TABLE `auto_h_d_k_g_l__gm_n`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL,
  `airport` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sequence_number` int NOT NULL,
  `waypoint` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NULL DEFAULT NULL,
  `height` int NOT NULL,
  `remarks` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aeronautical_chart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `airport`(`airport` ASC) USING BTREE,
  CONSTRAINT `auto_h_d_k_g_l__gm_n_ibfk_1` FOREIGN KEY (`airport`) REFERENCES `auto_j_ch_x_x_d_j_b__rsqm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_h_d_k_g_l__gm_n
-- ----------------------------

-- ----------------------------
-- Table structure for auto_h_x_g_l__gfxb
-- ----------------------------
DROP TABLE IF EXISTS `auto_h_x_g_l__gfxb`;
CREATE TABLE `auto_h_x_g_l__gfxb`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `airport` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sequence_number` int NOT NULL,
  `air_route` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_point` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_point` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `all_point` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aeronautical_chart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `remarks` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flight_height` int NULL DEFAULT NULL,
  `flight_speed` int NULL DEFAULT NULL,
  `flight_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`airport`, `air_route`) USING BTREE,
  INDEX `start_point`(`start_point` ASC) USING BTREE,
  INDEX `all_point`(`all_point` ASC) USING BTREE,
  INDEX `end_point`(`end_point` ASC) USING BTREE,
  CONSTRAINT `auto_h_x_g_l__gfxb_ibfk_1` FOREIGN KEY (`airport`) REFERENCES `auto_j_ch_x_x_d_j_b__rsqm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_h_x_g_l__gfxb_ibfk_2` FOREIGN KEY (`start_point`) REFERENCES `auto_h_d_k_g_l__gm_n` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_h_x_g_l__gfxb_ibfk_3` FOREIGN KEY (`all_point`) REFERENCES `intermediate_table` (`correlation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_h_x_g_l__gfxb_ibfk_4` FOREIGN KEY (`end_point`) REFERENCES `auto_h_d_k_g_l__gm_n` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_h_x_g_l__gfxb
-- ----------------------------

-- ----------------------------
-- Table structure for auto_j_ch_x_x_d_j_b__rsqm
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_ch_x_x_d_j_b__rsqm`;
CREATE TABLE `auto_j_ch_x_x_d_j_b__rsqm`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_ch__XrPy` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `magnetic_variation` float NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `runway_direction` float NULL DEFAULT NULL,
  `runwawy_length` int NULL DEFAULT NULL,
  `runaway_width` int NULL DEFAULT NULL,
  `runaway_thickness` int NULL DEFAULT NULL,
  `j_t__j_l__BysW` int NULL DEFAULT NULL,
  `y_t__j_l__szjD` int NULL DEFAULT NULL,
  `j_t__j_l__T_wN` int NULL DEFAULT NULL,
  `y_t__j_l__e_Hk` int NULL DEFAULT NULL,
  `landing_radar_model` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alarm_radar_model` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ILS_equipment_model` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_ch_h_t__eDNN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__JbHp` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__HMAa` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`j_ch__XrPy`) USING BTREE,
  UNIQUE INDEX `j_ch__XrPy`(`j_ch__XrPy` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_ch_x_x_d_j_b__rsqm
-- ----------------------------

-- ----------------------------
-- Table structure for auto_j_h_zh_t_z_d__pkfp
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_h_zh_t_z_d__pkfp`;
CREATE TABLE `auto_j_h_zh_t_z_d__pkfp`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__nStS` int NULL DEFAULT NULL,
  `n_r__NpBj` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_h_zh_t_z_d__pkfp
-- ----------------------------
INSERT INTO `auto_j_h_zh_t_z_d__pkfp` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '1102207e-d76b-4d96-a231-dd66d31dca1f', 1, '实施中', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_j_h_zh_t_z_d__pkfp` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2e9bd845-78c3-435e-b6fe-2dc70851fe26', 0, '未实施', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_j_h_zh_t_z_d__pkfp` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '3fb51687-58e1-498d-ab94-67b51b01aebe', 2, '已实施', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_j_sh_j_ch_b__npfb
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_sh_j_ch_b__npfb`;
CREATE TABLE `auto_j_sh_j_ch_b__npfb`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UID` bigint NOT NULL,
  `inspection_date` date NOT NULL,
  `j_ch_d_w__iybK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_ch_y__Ydti` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Inspection_period` int NOT NULL,
  `reminder_date` date NOT NULL,
  `j_ch_h_g__zYZc` tinyint(1) NOT NULL,
  `f_j__sYtN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__kzGY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__GMcy` datetime NOT NULL,
  `j_ch_j_x__xfhe` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `j_ch_j_x__xfhe`(`j_ch_j_x__xfhe` ASC) USING BTREE,
  CONSTRAINT `auto_j_sh_j_ch_b__npfb_ibfk_1` FOREIGN KEY (`j_ch_j_x__xfhe`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_sh_j_ch_b__npfb
-- ----------------------------

-- ----------------------------
-- Table structure for auto_j_x_d_j_b__ddkz
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_x_d_j_b__ddkz`;
CREATE TABLE `auto_j_x_d_j_b__ddkz`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `m_ch__wdrd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE,
  INDEX `id_4`(`id` ASC) USING BTREE,
  INDEX `id_5`(`id` ASC) USING BTREE,
  INDEX `id_6`(`id` ASC) USING BTREE,
  INDEX `id_7`(`id` ASC) USING BTREE,
  INDEX `id_8`(`id` ASC) USING BTREE,
  INDEX `id_9`(`id` ASC) USING BTREE,
  INDEX `id_10`(`id` ASC) USING BTREE,
  INDEX `id_11`(`id` ASC) USING BTREE,
  INDEX `id_12`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_x_d_j_b__ddkz
-- ----------------------------

-- ----------------------------
-- Table structure for auto_j_x_d_j_z_d__bfkk
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_x_d_j_z_d__bfkk`;
CREATE TABLE `auto_j_x_d_j_z_d__bfkk`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__TnZ_` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_x_d_j_z_d__bfkk
-- ----------------------------
INSERT INTO `auto_j_x_d_j_z_d__bfkk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '28adfe36-11a3-496e-aa7c-15aed9f17a93', '基础教员', '2024-05-09 18:21:21', NULL);
INSERT INTO `auto_j_x_d_j_z_d__bfkk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'e19f4fd4-ec0a-45ec-bcb8-b4866650b024', '仪表教员', '2024-05-09 18:21:21', NULL);

-- ----------------------------
-- Table structure for auto_j_y_x_x_b__etdf
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_y_x_x_b__etdf`;
CREATE TABLE `auto_j_y_x_x_b__etdf`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_w__P_XG` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `y_d_w__WKRA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `x_m__QYBH` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `d_z__zhpS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_h__THr_` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_h__RGPN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_b__NsS_` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_sh_r_q__iWJm` date NULL DEFAULT NULL,
  `zh_zh_m_m__XWtQ` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_t_r_q__RPFK` date NULL DEFAULT NULL,
  `m_z__H_MC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_g__KasG` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_l__ShYT` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_w__KHzw` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zh_w__zDWc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_x_d_j__CCDP` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zh_zh_d_j__tiYN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_zh_n_y__yrpR` date NULL DEFAULT NULL,
  `d__b_h__kcNH` int NULL DEFAULT NULL,
  `b_y_y_x__GNnX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_y_n_y__KiSc` date NULL DEFAULT NULL,
  `c_f_d_j__BXJb` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_f_sh_j__YrGR` int NULL DEFAULT NULL,
  `x_f_sh_j___tyn` int NULL DEFAULT NULL,
  `j_x_sh_j__mpWn` int NULL DEFAULT NULL,
  `x_p__WwPM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `z_w__FMTN` tinyint(1) NOT NULL,
  `b_m__eXwk` tinyint(1) NOT NULL,
  `p_x__jjcZ` int NULL DEFAULT NULL,
  `f_j__PcTa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__kNAZ` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zh_c_r_q__BQmy` date NULL DEFAULT NULL,
  `zh_x_r_q__aWiH` date NULL DEFAULT NULL,
  `login_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d____ZfNH` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d_____fyaF` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__xGSS` date NOT NULL,
  `c_f_j_x__NBXF` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `y_h_m__kKfM`(`username` ASC) USING BTREE,
  UNIQUE INDEX `d__b_h__kcNH`(`d__b_h__kcNH` ASC) USING BTREE,
  INDEX `d_w__P_XG`(`d_w__P_XG` ASC) USING BTREE,
  INDEX `x_b__NsS_`(`x_b__NsS_` ASC) USING BTREE,
  INDEX `zh_zh_m_m__XWtQ`(`zh_zh_m_m__XWtQ` ASC) USING BTREE,
  INDEX `m_z__H_MC`(`m_z__H_MC` ASC) USING BTREE,
  INDEX `x_l__ShYT`(`x_l__ShYT` ASC) USING BTREE,
  INDEX `x_w__KHzw`(`x_w__KHzw` ASC) USING BTREE,
  INDEX `j_x_d_j__CCDP`(`j_x_d_j__CCDP` ASC) USING BTREE,
  INDEX `zh_zh_d_j__tiYN`(`zh_zh_d_j__tiYN` ASC) USING BTREE,
  INDEX `c_f_d_j__BXJb`(`c_f_d_j__BXJb` ASC) USING BTREE,
  INDEX `c_f_j_x__NBXF`(`c_f_j_x__NBXF` ASC) USING BTREE,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_1` FOREIGN KEY (`d_w__P_XG`) REFERENCES `auto_d_w_d_j_b__dxfz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_10` FOREIGN KEY (`c_f_d_j__BXJb`) REFERENCES `auto_f_x_d_j_z_d__nmta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_12` FOREIGN KEY (`c_f_j_x__NBXF`) REFERENCES `intermediate_table` (`correlation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_2` FOREIGN KEY (`x_b__NsS_`) REFERENCES `auto_x_b_z_d__xhaf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_3` FOREIGN KEY (`zh_zh_m_m__XWtQ`) REFERENCES `auto_zh_zh_m_m_z_d__errh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_4` FOREIGN KEY (`m_z__H_MC`) REFERENCES `auto_m_z_z_d__yjhk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_5` FOREIGN KEY (`x_l__ShYT`) REFERENCES `auto_x_l_z_d__hcyh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_6` FOREIGN KEY (`x_w__KHzw`) REFERENCES `auto_x_w_z_d__wafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_7` FOREIGN KEY (`j_x_d_j__CCDP`) REFERENCES `auto_j_x_d_j_z_d__bfkk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_y_x_x_b__etdf_ibfk_8` FOREIGN KEY (`zh_zh_d_j__tiYN`) REFERENCES `auto_zh_zh_d_j_z_d__emzc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_y_x_x_b__etdf
-- ----------------------------

-- ----------------------------
-- Table structure for auto_j_zh_j_y_x_x_b__ebez
-- ----------------------------
DROP TABLE IF EXISTS `auto_j_zh_j_y_x_x_b__ebez`;
CREATE TABLE `auto_j_zh_j_y_x_x_b__ebez`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_w__P_XG` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `y_d_w__WKRA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `x_m__QYBH` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `d_z__zhpS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_h__THr_` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_h__RGPN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_b__NsS_` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_sh_r_q__iWJm` date NULL DEFAULT NULL,
  `zh_zh_m_m__XWtQ` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_t_r_q__RPFK` date NULL DEFAULT NULL,
  `m_z__H_MC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_g__KasG` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_l__ShYT` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_w__KHzw` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_zh_g_w__zDWc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_x_d_j__CCDP` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zh_zh_d_j__tiYN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_zh_n_y__yrpR` date NULL DEFAULT NULL,
  `d__b_h__kcNH` int NULL DEFAULT NULL,
  `b_y_y_x__GNnX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_y_n_y__KiSc` date NULL DEFAULT NULL,
  `c_f_d_j__BXJb` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_f_sh_j__YrGR` int NULL DEFAULT NULL,
  `x_f_sh_j___tyn` int NULL DEFAULT NULL,
  `j_x_sh_j__mpWn` int NULL DEFAULT NULL,
  `x_p__WwPM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `z_w__FMTN` tinyint(1) NOT NULL,
  `b_m__eXwk` tinyint(1) NOT NULL,
  `p_x__jjcZ` int NULL DEFAULT NULL,
  `f_j__PcTa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__kNAZ` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zh_c_r_q__BQmy` date NULL DEFAULT NULL,
  `zh_x_r_q__aWiH` date NULL DEFAULT NULL,
  `login_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d____ZfNH` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d_____fyaF` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__xGSS` date NOT NULL,
  `c_f_j_x___Hrd` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `y_h_m__kKfM`(`username` ASC) USING BTREE,
  UNIQUE INDEX `d__b_h__kcNH`(`d__b_h__kcNH` ASC) USING BTREE,
  INDEX `d_w__P_XG`(`d_w__P_XG` ASC) USING BTREE,
  INDEX `x_b__NsS_`(`x_b__NsS_` ASC) USING BTREE,
  INDEX `zh_zh_m_m__XWtQ`(`zh_zh_m_m__XWtQ` ASC) USING BTREE,
  INDEX `m_z__H_MC`(`m_z__H_MC` ASC) USING BTREE,
  INDEX `x_l__ShYT`(`x_l__ShYT` ASC) USING BTREE,
  INDEX `x_w__KHzw`(`x_w__KHzw` ASC) USING BTREE,
  INDEX `j_x_d_j__CCDP`(`j_x_d_j__CCDP` ASC) USING BTREE,
  INDEX `zh_zh_d_j__tiYN`(`zh_zh_d_j__tiYN` ASC) USING BTREE,
  INDEX `c_f_d_j__BXJb`(`c_f_d_j__BXJb` ASC) USING BTREE,
  INDEX `c_f_j_x___Hrd`(`c_f_j_x___Hrd` ASC) USING BTREE,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_1` FOREIGN KEY (`d_w__P_XG`) REFERENCES `auto_d_w_d_j_b__dxfz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_10` FOREIGN KEY (`c_f_d_j__BXJb`) REFERENCES `auto_f_x_d_j_z_d__nmta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_11` FOREIGN KEY (`c_f_j_x___Hrd`) REFERENCES `intermediate_table` (`correlation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_2` FOREIGN KEY (`x_b__NsS_`) REFERENCES `auto_x_b_z_d__xhaf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_3` FOREIGN KEY (`zh_zh_m_m__XWtQ`) REFERENCES `auto_zh_zh_m_m_z_d__errh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_4` FOREIGN KEY (`m_z__H_MC`) REFERENCES `auto_m_z_z_d__yjhk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_5` FOREIGN KEY (`x_l__ShYT`) REFERENCES `auto_x_l_z_d__hcyh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_6` FOREIGN KEY (`x_w__KHzw`) REFERENCES `auto_x_w_z_d__wafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_7` FOREIGN KEY (`j_x_d_j__CCDP`) REFERENCES `auto_j_x_d_j_z_d__bfkk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_j_zh_j_y_x_x_b__ebez_ibfk_8` FOREIGN KEY (`zh_zh_d_j__tiYN`) REFERENCES `auto_zh_zh_d_j_z_d__emzc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_j_zh_j_y_x_x_b__ebez
-- ----------------------------

-- ----------------------------
-- Table structure for auto_k_y_x_x_d_j_b__rxsr
-- ----------------------------
DROP TABLE IF EXISTS `auto_k_y_x_x_d_j_b__rxsr`;
CREATE TABLE `auto_k_y_x_x_d_j_b__rxsr`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_ch__jRHK` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__nDCQ` int NOT NULL,
  `k_y__KNS_` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_l_k_y__XXxA` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `k_y_d_d__zptz` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_zh__DRYy` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__XZsD` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`j_ch__jRHK`, `k_y__KNS_`) USING BTREE,
  UNIQUE INDEX `j_ch__jRHK`(`j_ch__jRHK` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_k_y_x_x_d_j_b__rxsr
-- ----------------------------

-- ----------------------------
-- Table structure for auto_l_x_j_l_l_b__c__jbdq
-- ----------------------------
DROP TABLE IF EXISTS `auto_l_x_j_l_l_b__c__jbdq`;
CREATE TABLE `auto_l_x_j_l_l_b__c__jbdq`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aircraft_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `airscrew_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `airscrew_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `last_overhaul_date` date NULL DEFAULT NULL,
  `content` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reporter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `UID` bigint NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `UID`(`UID` ASC) USING BTREE,
  INDEX `aircraft_serial`(`aircraft_serial` ASC) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  INDEX `airscrew_model`(`airscrew_model` ASC) USING BTREE,
  INDEX `airscrew_serial`(`airscrew_serial` ASC) USING BTREE,
  INDEX `content`(`content` ASC) USING BTREE,
  CONSTRAINT `auto_l_x_j_l_l_b__c__jbdq_ibfk_1` FOREIGN KEY (`aircraft_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b__c__jbdq_ibfk_2` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b__c__jbdq_ibfk_3` FOREIGN KEY (`airscrew_model`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b__c__jbdq_ibfk_4` FOREIGN KEY (`airscrew_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b__c__jbdq_ibfk_5` FOREIGN KEY (`content`) REFERENCES `intermediate_table` (`correlation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_l_x_j_l_l_b__c__jbdq
-- ----------------------------

-- ----------------------------
-- Table structure for auto_l_x_j_l_l_b_s_c__zrmn
-- ----------------------------
DROP TABLE IF EXISTS `auto_l_x_j_l_l_b_s_c__zrmn`;
CREATE TABLE `auto_l_x_j_l_l_b_s_c__zrmn`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `aircraft_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `airscrew_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `airscrew_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ADSB` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `completion_date` date NOT NULL,
  `flight_hours` int NULL DEFAULT NULL,
  `repeat` tinyint(1) NULL DEFAULT NULL,
  `next_execution_date` date NULL DEFAULT NULL,
  `reporter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `ID`(`UID` ASC) USING BTREE,
  INDEX `aircraft_serial`(`aircraft_serial` ASC) USING BTREE,
  INDEX `airscrew_model`(`airscrew_model` ASC) USING BTREE,
  INDEX `airscrew_serial`(`airscrew_serial` ASC) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  CONSTRAINT `auto_l_x_j_l_l_b_s_c__zrmn_ibfk_1` FOREIGN KEY (`aircraft_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b_s_c__zrmn_ibfk_2` FOREIGN KEY (`airscrew_model`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b_s_c__zrmn_ibfk_3` FOREIGN KEY (`airscrew_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b_s_c__zrmn_ibfk_4` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_l_x_j_l_l_b_s_c__zrmn
-- ----------------------------

-- ----------------------------
-- Table structure for auto_l_x_j_l_l_b_y_c__wspr
-- ----------------------------
DROP TABLE IF EXISTS `auto_l_x_j_l_l_b_y_c__wspr`;
CREATE TABLE `auto_l_x_j_l_l_b_y_c__wspr`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `aircraft_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `airscrew_model` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `airscrew_serial` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `operating_hours` int NOT NULL,
  `inspection_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `station` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reporter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `ID`(`UID` ASC) USING BTREE,
  INDEX `aircraft_serial`(`aircraft_serial` ASC) USING BTREE,
  INDEX `airscrew_model`(`airscrew_model` ASC) USING BTREE,
  INDEX `airscrew_serial`(`airscrew_serial` ASC) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  CONSTRAINT `auto_l_x_j_l_l_b_y_c__wspr_ibfk_1` FOREIGN KEY (`aircraft_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b_y_c__wspr_ibfk_2` FOREIGN KEY (`airscrew_model`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b_y_c__wspr_ibfk_3` FOREIGN KEY (`airscrew_serial`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_l_x_j_l_l_b_y_c__wspr_ibfk_4` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_l_x_j_l_l_b_y_c__wspr
-- ----------------------------

-- ----------------------------
-- Table structure for auto_m_z_z_d__yjhk
-- ----------------------------
DROP TABLE IF EXISTS `auto_m_z_z_d__yjhk`;
CREATE TABLE `auto_m_z_z_d__yjhk`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__hfKH` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_m_z_z_d__yjhk
-- ----------------------------
INSERT INTO `auto_m_z_z_d__yjhk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '483d22f4-d0bc-4b88-8771-572c27a0c18e', '汉族', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_m_z_z_d__yjhk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '8f298ceb-66bc-4f91-b408-d9ad0a06001e', '藏族', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_m_z_z_d__yjhk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '926b465b-de92-455e-8726-8f2d1dc73c46', '蒙古族', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_m_z_z_d__yjhk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'cd5ac7e0-2f05-4bef-b787-a05cf0814cf5', '满族', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_m_z_z_d__yjhk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'fc59ecfc-0250-4ede-b5e4-fa4e590b99ae', '回族', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_m_z_z_d__yjhk` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'ff742b31-e283-49cb-95ed-2f98c3b4d404', '维吾尔族', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_online_learning_record
-- ----------------------------
DROP TABLE IF EXISTS `auto_online_learning_record`;
CREATE TABLE `auto_online_learning_record`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `learning_content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keep_time` int NULL DEFAULT NULL,
  `LID` bigint NOT NULL,
  PRIMARY KEY (`LID`) USING BTREE,
  UNIQUE INDEX `LID`(`LID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_online_learning_record
-- ----------------------------

-- ----------------------------
-- Table structure for auto_paper_info
-- ----------------------------
DROP TABLE IF EXISTS `auto_paper_info`;
CREATE TABLE `auto_paper_info`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EID` bigint NOT NULL,
  `UID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` bigint NOT NULL,
  `date` date NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `answer_question_time` int NULL DEFAULT NULL,
  `paper_serial` int NULL DEFAULT NULL,
  `total_score` float NULL DEFAULT NULL,
  `judge` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `judge_datetime` datetime NULL DEFAULT NULL,
  `remarks` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PIID` bigint NOT NULL,
  PRIMARY KEY (`PIID`) USING BTREE,
  UNIQUE INDEX `PIID`(`PIID` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_paper_info
-- ----------------------------

-- ----------------------------
-- Table structure for auto_q_t_b_j_x_x_b__niex
-- ----------------------------
DROP TABLE IF EXISTS `auto_q_t_b_j_x_x_b__niex`;
CREATE TABLE `auto_q_t_b_j_x_x_b__niex`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_h__eiGx` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATA___zh_j__GzQJ` int NOT NULL,
  `b_j_m_ch__XRab` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `w_x_g_z__QnpP` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_g_x_sh_sh__tnMf` int NULL DEFAULT NULL,
  `j_ch_r_q__saAX` date NOT NULL,
  `x_c_r_q___PSp` date NULL DEFAULT NULL,
  `sh_y_sh_m__eFTx` int NULL DEFAULT NULL,
  `h_zh__zDNj` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `t_b_r__sbma` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `b_zh__XHTz` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__BCFW` datetime NOT NULL,
  `UID` bigint NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UID`(`UID` ASC) USING BTREE,
  INDEX `j_h__eiGx`(`j_h__eiGx` ASC) USING BTREE,
  CONSTRAINT `auto_q_t_b_j_x_x_b__niex_ibfk_1` FOREIGN KEY (`j_h__eiGx`) REFERENCES `auto_f_j_x_x_d_j_b__hrwm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_q_t_b_j_x_x_b__niex
-- ----------------------------

-- ----------------------------
-- Table structure for auto_q_t_r_y_b__nfrc
-- ----------------------------
DROP TABLE IF EXISTS `auto_q_t_r_y_b__nfrc`;
CREATE TABLE `auto_q_t_r_y_b__nfrc`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `d_w__afAx` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UID` bigint NOT NULL,
  `x_m__GKrG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_b__EHeC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_sh_r_q__JPzd` date NULL DEFAULT NULL,
  `zh_zh_m_m__eZs_` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_t_r_q__dwJr` date NULL DEFAULT NULL,
  `m_z__QstX` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_g__zpXr` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_l___Dsa` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_w__idKD` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zh_w__cxTb` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_zh_n_y__zjAc` date NULL DEFAULT NULL,
  `d__b_h__dEP_` int NOT NULL,
  `x_p__xmsE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `z_w__YHyp` tinyint(1) NOT NULL,
  `b_m__TDT_` tinyint(1) NOT NULL,
  `p_x__xAsb` int NULL DEFAULT NULL,
  `f_j__RaBS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__Szc_` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zh_c_r_q__zy_n` date NULL DEFAULT NULL,
  `zh_x_r_q__yTJY` date NULL DEFAULT NULL,
  `login_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d____zAZy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d_____dQKK` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__hpjA` datetime NOT NULL,
  `sh_f__RzEr` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `d__b_h__dEP_`(`d__b_h__dEP_` ASC) USING BTREE,
  UNIQUE INDEX `y_h_m__WcHG`(`username` ASC) USING BTREE,
  INDEX `d_w__afAx`(`d_w__afAx` ASC) USING BTREE,
  INDEX `x_b__EHeC`(`x_b__EHeC` ASC) USING BTREE,
  INDEX `zh_zh_m_m__eZs_`(`zh_zh_m_m__eZs_` ASC) USING BTREE,
  INDEX `m_z__QstX`(`m_z__QstX` ASC) USING BTREE,
  INDEX `x_l___Dsa`(`x_l___Dsa` ASC) USING BTREE,
  INDEX `x_w__idKD`(`x_w__idKD` ASC) USING BTREE,
  INDEX `sh_f__RzEr`(`sh_f__RzEr` ASC) USING BTREE,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_1` FOREIGN KEY (`d_w__afAx`) REFERENCES `auto_d_w_d_j_b__dxfz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_2` FOREIGN KEY (`x_b__EHeC`) REFERENCES `auto_x_b_z_d__xhaf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_3` FOREIGN KEY (`zh_zh_m_m__eZs_`) REFERENCES `auto_zh_zh_m_m_z_d__errh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_4` FOREIGN KEY (`m_z__QstX`) REFERENCES `auto_m_z_z_d__yjhk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_5` FOREIGN KEY (`x_l___Dsa`) REFERENCES `auto_x_l_z_d__hcyh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_6` FOREIGN KEY (`x_w__idKD`) REFERENCES `auto_x_w_z_d__wafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_q_t_r_y_b__nfrc_ibfk_7` FOREIGN KEY (`sh_f__RzEr`) REFERENCES `auto_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_q_t_r_y_b__nfrc
-- ----------------------------

-- ----------------------------
-- Table structure for auto_q_x_z_d__ratj
-- ----------------------------
DROP TABLE IF EXISTS `auto_q_x_z_d__ratj`;
CREATE TABLE `auto_q_x_z_d__ratj`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__TTtX` int NULL DEFAULT NULL,
  `n_r__pNtn` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_q_x_z_d__ratj
-- ----------------------------
INSERT INTO `auto_q_x_z_d__ratj` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '0c6b5956-c819-4c80-83ed-f01d3bcdeb66', 4, '编辑', '2024-05-09 18:21:21', NULL);
INSERT INTO `auto_q_x_z_d__ratj` VALUES (NULL, NULL, 'sysadmin', 'sysadmin', NULL, '1ee71ca7-46da-4f3a-b407-3b9b52824c87', 2, '下载', '2024-05-09 18:21:21', NULL);
INSERT INTO `auto_q_x_z_d__ratj` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'e634bfc0-c6d1-4378-ab83-e30922a62213', 1, '浏览', '2024-05-09 18:21:21', NULL);

-- ----------------------------
-- Table structure for auto_q_x_z_d__znar
-- ----------------------------
DROP TABLE IF EXISTS `auto_q_x_z_d__znar`;
CREATE TABLE `auto_q_x_z_d__znar`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__HJci` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_q_x_z_d__znar
-- ----------------------------
INSERT INTO `auto_q_x_z_d__znar` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '7cf2f40f-1b2e-42cb-a10f-beac37dd9836', '夜间', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_q_x_z_d__znar` VALUES (NULL, NULL, 'sysadmin', 'sysadmin', NULL, 'c3051d2c-ad84-4c37-a95e-7097e61d766a', '跨昼夜', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_q_x_z_d__znar` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'eba675b5-e168-45bd-ac89-8ac00b6fd8d7', '昼间', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `auto_question_bank`;
CREATE TABLE `auto_question_bank`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `QID` bigint NOT NULL,
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `major` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `section` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `option_number` int NULL DEFAULT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `evaluate_answers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `used_times` int NULL DEFAULT NULL,
  `scored_times` int NULL DEFAULT NULL,
  `remarks` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`QID`) USING BTREE,
  UNIQUE INDEX `QID`(`QID` ASC) USING BTREE,
  INDEX `major_courses`(`major` ASC) USING BTREE,
  INDEX `course`(`course` ASC) USING BTREE,
  INDEX `type`(`type` ASC) USING BTREE,
  CONSTRAINT `auto_question_bank_ibfk_1` FOREIGN KEY (`major`) REFERENCES `auto_zh_y_z_d__hwxr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_question_bank_ibfk_2` FOREIGN KEY (`course`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_question_bank_ibfk_3` FOREIGN KEY (`type`) REFERENCES `auto_t_x_z_d__z_m_` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_question_bank
-- ----------------------------

-- ----------------------------
-- Table structure for auto_roles
-- ----------------------------
DROP TABLE IF EXISTS `auto_roles`;
CREATE TABLE `auto_roles`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sh_f__CRcR` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sh_f__CRcR`(`sh_f__CRcR` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_roles
-- ----------------------------

-- ----------------------------
-- Table structure for auto_s_zh_x_x_d_j_b__mr_p
-- ----------------------------
DROP TABLE IF EXISTS `auto_s_zh_x_x_d_j_b__mr_p`;
CREATE TABLE `auto_s_zh_x_x_d_j_b__mr_p`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_x__XBwY` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `j_h__NfWs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `g_j_zh_h__djPd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_j_zh_r_q__cSkr` date NULL DEFAULT NULL,
  `sh_h_zh_h__eNnT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sh_h_zh_f_zh__hGpa` date NULL DEFAULT NULL,
  `sh_h_zh_d_q__BRAP` date NULL DEFAULT NULL,
  `d_t_zh_h__Sbia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_t_zh_f_zh__rHDa` date NULL DEFAULT NULL,
  `d_t_zh_d_q__HAGx` date NULL DEFAULT NULL,
  `f_j__WTiG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__EJ_W` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__bCGH` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`j_h__NfWs`) USING BTREE,
  INDEX `j_x__XBwY`(`j_x__XBwY` ASC) USING BTREE,
  CONSTRAINT `auto_s_zh_x_x_d_j_b__mr_p_ibfk_1` FOREIGN KEY (`j_x__XBwY`) REFERENCES `auto_j_x_d_j_b__ddkz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_s_zh_x_x_d_j_b__mr_p
-- ----------------------------

-- ----------------------------
-- Table structure for auto_special_situation_manual
-- ----------------------------
DROP TABLE IF EXISTS `auto_special_situation_manual`;
CREATE TABLE `auto_special_situation_manual`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_views` int NULL DEFAULT NULL,
  `download` int NULL DEFAULT NULL,
  `file_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `key_word` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resource` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auto_special_situation_manual
-- ----------------------------

-- ----------------------------
-- Table structure for auto_sys_test_table
-- ----------------------------
DROP TABLE IF EXISTS `auto_sys_test_table`;
CREATE TABLE `auto_sys_test_table`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `person_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `engine_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `engine_pdf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `personal_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `personal_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `address` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `engine_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QID` bigint NULL DEFAULT NULL,
  `SID` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `engine_position`(`engine_position` ASC) USING BTREE,
  CONSTRAINT `auto_sys_test_table_ibfk_1` FOREIGN KEY (`engine_position`) REFERENCES `auto_engine_position_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_sys_test_table
-- ----------------------------

-- ----------------------------
-- Table structure for auto_t_j_l_x_z_d__mpwc
-- ----------------------------
DROP TABLE IF EXISTS `auto_t_j_l_x_z_d__mpwc`;
CREATE TABLE `auto_t_j_l_x_z_d__mpwc`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__nJER` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_t_j_l_x_z_d__mpwc
-- ----------------------------
INSERT INTO `auto_t_j_l_x_z_d__mpwc` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '00e058bb-459f-4949-a4e9-8a8b7ce2d73e', '不定期', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_t_j_l_x_z_d__mpwc` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '0a0656cc-d5c6-4df4-b770-98ff7bfa5cef', '定期', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_t_j_l_x_z_d__mpwc` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'e2c9ddf0-3ae7-4846-b6f7-87d4b8fb6edf', '选拔', '2024-05-09 18:21:19', NULL);

-- ----------------------------
-- Table structure for auto_t_j_x_x_b__dwtf
-- ----------------------------
DROP TABLE IF EXISTS `auto_t_j_x_x_b__dwtf`;
CREATE TABLE `auto_t_j_x_x_b__dwtf`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UID` bigint NOT NULL,
  `inspection_date` date NOT NULL,
  `t_j_d_w__NSDk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Inspection_period` int NOT NULL,
  `reminder_date` date NOT NULL,
  `t_j_h_g__Kjzz` tinyint(1) NOT NULL,
  `f_j__hPwY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__ccxR` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__HKyD` datetime NOT NULL,
  `t_j_l_x__AbFh` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_j_l_x__AbFh`(`t_j_l_x__AbFh` ASC) USING BTREE,
  CONSTRAINT `auto_t_j_x_x_b__dwtf_ibfk_1` FOREIGN KEY (`t_j_l_x__AbFh`) REFERENCES `auto_t_j_l_x_z_d__mpwc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_t_j_x_x_b__dwtf
-- ----------------------------

-- ----------------------------
-- Table structure for auto_t_x_z_d__z_m_
-- ----------------------------
DROP TABLE IF EXISTS `auto_t_x_z_d__z_m_`;
CREATE TABLE `auto_t_x_z_d__z_m_`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__zNrr` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_t_x_z_d__z_m_
-- ----------------------------
INSERT INTO `auto_t_x_z_d__z_m_` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '10455b60-9b70-435c-9c93-9e5532b6eb65', '填空', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_t_x_z_d__z_m_` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '7f960c5e-d425-4922-a783-523de26ae904', '判断', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_t_x_z_d__z_m_` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '84e19827-dccf-46ed-9497-f3a6e72eca84', '多选', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_t_x_z_d__z_m_` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'be375a95-7dd5-4e77-a85b-9ce076afaab7', '单选', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_t_x_z_d__z_m_` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'df95a06a-4fe6-4637-9412-85af4b1fee97', '问答', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_teaching_journal
-- ----------------------------
DROP TABLE IF EXISTS `auto_teaching_journal`;
CREATE TABLE `auto_teaching_journal`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `teacher` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `students_num` int NULL DEFAULT NULL,
  `notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TID` bigint NOT NULL,
  PRIMARY KEY (`TID`) USING BTREE,
  UNIQUE INDEX `TID`(`TID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_teaching_journal
-- ----------------------------

-- ----------------------------
-- Table structure for auto_teaching_resource_management
-- ----------------------------
DROP TABLE IF EXISTS `auto_teaching_resource_management`;
CREATE TABLE `auto_teaching_resource_management`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RID` bigint NOT NULL,
  `UID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `major` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `section` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `course_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `key_word` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extension` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authority` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visition` int NULL DEFAULT NULL,
  `download` int NULL DEFAULT NULL,
  `remarks` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RID`) USING BTREE,
  UNIQUE INDEX `RID`(`RID` ASC) USING BTREE,
  INDEX `major`(`major` ASC) USING BTREE,
  INDEX `course`(`course` ASC) USING BTREE,
  INDEX `authority`(`authority` ASC) USING BTREE,
  CONSTRAINT `auto_teaching_resource_management_ibfk_1` FOREIGN KEY (`major`) REFERENCES `auto_zh_y_z_d__hwxr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_teaching_resource_management_ibfk_2` FOREIGN KEY (`course`) REFERENCES `auto_course_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_teaching_resource_management_ibfk_3` FOREIGN KEY (`authority`) REFERENCES `auto_q_x_z_d__ratj` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_teaching_resource_management
-- ----------------------------

-- ----------------------------
-- Table structure for auto_w_zh_z_d__wprk
-- ----------------------------
DROP TABLE IF EXISTS `auto_w_zh_z_d__wprk`;
CREATE TABLE `auto_w_zh_z_d__wprk`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__ZENb` int NULL DEFAULT NULL,
  `n_r__pQZW` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_w_zh_z_d__wprk
-- ----------------------------

-- ----------------------------
-- Table structure for auto_x_b_z_d__xhaf
-- ----------------------------
DROP TABLE IF EXISTS `auto_x_b_z_d__xhaf`;
CREATE TABLE `auto_x_b_z_d__xhaf`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__CwNY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_x_b_z_d__xhaf
-- ----------------------------
INSERT INTO `auto_x_b_z_d__xhaf` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '52d0dcb9-c044-40fc-924a-a6766f03c564', '男', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_b_z_d__xhaf` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '7a276217-bca9-49af-be6e-d3606d2c3ffd', '女', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_x_l_z_d__hcyh
-- ----------------------------
DROP TABLE IF EXISTS `auto_x_l_z_d__hcyh`;
CREATE TABLE `auto_x_l_z_d__hcyh`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__HeiS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_x_l_z_d__hcyh
-- ----------------------------
INSERT INTO `auto_x_l_z_d__hcyh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '08216325-453f-4a99-97e6-52cd6be244ce', '本科', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_l_z_d__hcyh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'a9b57316-d0de-4711-9711-ebab34be6ee4', '高中', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_l_z_d__hcyh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'b409bb9a-53e8-4015-8702-8048a6c2a700', '研究生', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_l_z_d__hcyh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'ca02fca5-f7c3-4a7a-97fe-31cf38ce7026', '大专', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_x_w_z_d__wafe
-- ----------------------------
DROP TABLE IF EXISTS `auto_x_w_z_d__wafe`;
CREATE TABLE `auto_x_w_z_d__wafe`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__bNRd` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_x_w_z_d__wafe
-- ----------------------------
INSERT INTO `auto_x_w_z_d__wafe` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '5ca9abde-84a2-425f-b71a-bce1b1afbd57', '硕士', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_w_z_d__wafe` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '638c3ae0-9d0b-470e-9385-948c4792512a', '博士', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_w_z_d__wafe` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '6d0a8f27-fae0-445a-a0c1-c266ad3ef168', '学士', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_x_w_z_d__wafe` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'c2f9c4f4-e77e-404e-9271-65fccd580c3e', '无', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_x_y_x_x_b__dxtc
-- ----------------------------
DROP TABLE IF EXISTS `auto_x_y_x_x_b__dxtc`;
CREATE TABLE `auto_x_y_x_x_b__dxtc`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `q_b__HYyD` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `l_y__rpwj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UID` bigint NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_z__dPPy` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_h__PDxr` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h_h__cJWN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_b__RDAd` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ch_sh_r_q__MdbE` date NULL DEFAULT NULL,
  `zh_zh_m_m__Zwis` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_t_r_q__yDsY` date NULL DEFAULT NULL,
  `m_z___Hcm` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `j_g__QPfW` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_l__Ssey` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `x_w__JBKN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d__b_h__ZZtX` int NULL DEFAULT NULL,
  `b_y_y_x__hmxH` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_y_n_y__CQ_P` date NULL DEFAULT NULL,
  `c_f_j_x__PEBF` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_f_sh_j__mNNM` int NULL DEFAULT NULL,
  `x_f_sh_j__wGMY` int NULL DEFAULT NULL,
  `flight_outline` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_j_j_y__JDPa` bigint NULL DEFAULT NULL,
  `k_x_r_q__raDj` date NULL DEFAULT NULL,
  `b_y_r_q__jJyN` date NULL DEFAULT NULL,
  `x_p__TNCP` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `z_x__nFds` tinyint(1) NOT NULL,
  `b_y__rhHn` tinyint(1) NOT NULL,
  `j_y__WSGd` tinyint(1) NOT NULL,
  `b_m__FkR_` tinyint(1) NOT NULL,
  `p_x__Gdba` int NULL DEFAULT NULL,
  `f_j__ycwc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `b_zh__ESzx` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zh_c_r_q__mjxH` date NULL DEFAULT NULL,
  `zh_x_r_q__Ztij` date NULL DEFAULT NULL,
  `login_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d____dpnk` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `b_d_____zNnp` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_x_sh_j__xcap` datetime NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`) USING BTREE,
  UNIQUE INDEX `UID`(`UID` ASC) USING BTREE,
  UNIQUE INDEX `y_h_m__aFyw`(`username` ASC) USING BTREE,
  INDEX `q_b__HYyD`(`q_b__HYyD` ASC) USING BTREE,
  INDEX `x_b__RDAd`(`x_b__RDAd` ASC) USING BTREE,
  INDEX `zh_zh_m_m__Zwis`(`zh_zh_m_m__Zwis` ASC) USING BTREE,
  INDEX `m_z___Hcm`(`m_z___Hcm` ASC) USING BTREE,
  INDEX `x_l__Ssey`(`x_l__Ssey` ASC) USING BTREE,
  INDEX `x_w__JBKN`(`x_w__JBKN` ASC) USING BTREE,
  INDEX `c_f_j_x__PEBF`(`c_f_j_x__PEBF` ASC) USING BTREE,
  INDEX `f_x_d_g__XzyM`(`flight_outline` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_1` FOREIGN KEY (`q_b__HYyD`) REFERENCES `auto_b_q_d_j_b__wprd` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_2` FOREIGN KEY (`x_b__RDAd`) REFERENCES `auto_x_b_z_d__xhaf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_3` FOREIGN KEY (`zh_zh_m_m__Zwis`) REFERENCES `auto_zh_zh_m_m_z_d__errh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_4` FOREIGN KEY (`m_z___Hcm`) REFERENCES `auto_m_z_z_d__yjhk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_5` FOREIGN KEY (`x_l__Ssey`) REFERENCES `auto_x_l_z_d__hcyh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_6` FOREIGN KEY (`x_w__JBKN`) REFERENCES `auto_x_w_z_d__wafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_7` FOREIGN KEY (`c_f_j_x__PEBF`) REFERENCES `intermediate_table` (`correlation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auto_x_y_x_x_b__dxtc_ibfk_8` FOREIGN KEY (`flight_outline`) REFERENCES `auto_flight_outline` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_x_y_x_x_b__dxtc
-- ----------------------------

-- ----------------------------
-- Table structure for auto_zh_y_z_d__hwxr
-- ----------------------------
DROP TABLE IF EXISTS `auto_zh_y_z_d__hwxr`;
CREATE TABLE `auto_zh_y_z_d__hwxr`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__iRnX` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_zh_y_z_d__hwxr
-- ----------------------------
INSERT INTO `auto_zh_y_z_d__hwxr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '05adafd4-7e03-41cd-911e-d270a3f004b3', '航电', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_zh_y_z_d__hwxr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '06209a82-d145-4038-a245-2f36d519c567', '机械', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_zh_y_z_d__hwxr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '304c9a50-d588-454f-a9a8-fbd0464f4467', '领航', '2024-05-09 18:21:19', NULL);
INSERT INTO `auto_zh_y_z_d__hwxr` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '335fb2a0-c98d-4bda-a036-aead6851fa5a', '飞训', '2024-05-09 18:21:19', NULL);

-- ----------------------------
-- Table structure for auto_zh_zh_d_j_z_d__emzc
-- ----------------------------
DROP TABLE IF EXISTS `auto_zh_zh_d_j_z_d__emzc`;
CREATE TABLE `auto_zh_zh_d_j_z_d__emzc`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__hRpA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_zh_zh_d_j_z_d__emzc
-- ----------------------------
INSERT INTO `auto_zh_zh_d_j_z_d__emzc` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'c8dfae0b-60df-4db7-984a-f63fa6067213', '商照', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_zh_zh_d_j_z_d__emzc` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, 'ee73f62c-d348-4b5c-9bcc-bb549ce5bbe2', '私照', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for auto_zh_zh_m_m_z_d__errh
-- ----------------------------
DROP TABLE IF EXISTS `auto_zh_zh_m_m_z_d__errh`;
CREATE TABLE `auto_zh_zh_m_m_z_d__errh`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__TBmb` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `id_2`(`id` ASC) USING BTREE,
  INDEX `id_3`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_zh_zh_m_m_z_d__errh
-- ----------------------------
INSERT INTO `auto_zh_zh_m_m_z_d__errh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '0aab88af-e503-4f76-acc4-7778c8cc65ac', '共青团员', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_zh_zh_m_m_z_d__errh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '2c0122c6-1ff6-48c1-82b0-57967550f58c', '群众', '2024-05-09 18:21:20', NULL);
INSERT INTO `auto_zh_zh_m_m_z_d__errh` VALUES (NULL, NULL, 'sysadmin', NULL, NULL, '91fb4f9b-15a7-47e7-8363-7bf89eaadc26', '中共党员', '2024-05-09 18:21:20', NULL);

-- ----------------------------
-- Table structure for column_manage
-- ----------------------------
DROP TABLE IF EXISTS `column_manage`;
CREATE TABLE `column_manage`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属于哪个表',
  `merge_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多列合并使用同一个merge_name(仅前端可用到)',
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级字段',
  `is_parent` tinyint(1) NULL DEFAULT NULL COMMENT '表明父级字段',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名（中文，用于前端显示）',
  `sort` float NULL DEFAULT NULL COMMENT '列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序',
  `status` int NULL DEFAULT NULL COMMENT '列状态：1：显示，2：隐藏',
  `field_length` int NULL DEFAULT NULL COMMENT 'varchar列的长度',
  `is_delete` int NULL DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名（英文，用于建表）',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段类型：int、str 32、datetime、text、bool等',
  `empty` tinyint(1) NULL DEFAULT NULL COMMENT '是否可为空',
  `primary` tinyint(1) NULL DEFAULT NULL COMMENT '是否为主键',
  `unique` tinyint(1) NULL DEFAULT NULL COMMENT '是否唯一',
  `is_encrypt` tinyint(1) NULL DEFAULT NULL COMMENT '是否加密',
  `association` json NULL COMMENT '定义关联字段，可定义多个，数组表示',
  `description` json NULL COMMENT '字段描述',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `save_length` int NULL DEFAULT NULL,
  `rules` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `auto_generate` tinyint NULL DEFAULT NULL,
  `read_only` tinyint NULL DEFAULT NULL COMMENT '只读列',
  `repeatable` tinyint NULL DEFAULT NULL COMMENT '可重复',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_id`(`table_id` ASC) USING BTREE,
  CONSTRAINT `column_manage_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table_manage` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of column_manage
-- ----------------------------
INSERT INTO `column_manage` VALUES ('001343a0-8db5-46be-967f-b185f87583ac', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '显示答案', 9, 1, NULL, 0, 'answer', 'text', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:33:50', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('00276231-3e78-487a-8fdc-a420dc043603', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '民族', 4, 1, 36, 0, 'm_z__H_MC', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hfKH\", \"tableCode\": \"m_z_z_d__yjhk\"}]', 'null', 'sysadmin', NULL, '2024-05-06 16:04:55', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('00ae0b99-1ba7-4dae-80d4-12cc24d83e3e', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '实施航线', 29, 1, 20, 0, 'execute_route', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:39:33', '2024-07-18 16:58:31', 20, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('00b8a32b-540d-4c32-9abf-8ef726d42800', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '使用空域', 31, 1, NULL, 0, 'airspace_used', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:41:15', '2024-07-18 16:58:31', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('01053e4f-c192-426e-b1bc-10611650edf3', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '次数', 5, 1, NULL, 0, 'flight_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:26:25', '2024-07-18 16:58:31', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('011016df-1da8-4875-8314-3fd1881cd730', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '起落次数', 39, 1, NULL, 0, 'ups_and_downs', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:40:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('011bda2e-2fab-4f2b-b9f1-1a5caae8965b', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '期班', 1, 1, 36, 0, 'classes', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"q_b__RXcH\", \"tableCode\": \"b_q_d_j_b__wprd\"}]', 'null', 'sysadmin', NULL, '2024-05-14 14:20:19', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0139512e-4dfa-41d3-95d8-33e9ecaadbb2', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '注册日期', 26, 1, NULL, 0, 'zh_c_r_q__zy_n', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:24:26', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('016358de-93c4-4bfe-9829-b698875d02d6', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '备注', 0, 1, 48, 0, 'b_zh__dprC', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:23:47', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('01ac0c5c-0d95-4517-ad34-4cedc51dadab', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '填空分值', 42, 2, NULL, 0, 'fill_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:35:13', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('01c49a09-74a0-40f9-8192-1701c7e25514', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '开车_1', 15, 1, NULL, 0, 'start_engine_1', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('025aa35f-be2c-49af-8fe2-78833108a409', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '机身寿命', 4, 1, NULL, 0, 'j_sh_sh_m__rSFE', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:51:24', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('026b6ce9-21a3-47fd-b484-7d30efae17f0', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '更新时间', 36, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:43:26', '2024-07-18 16:58:31', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0282043c-87f3-4e77-9a1b-7d701dcf6c3c', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '螺旋', 23, 1, NULL, 0, 'spiral', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:36:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('02872896-f1d8-4b0e-9e0c-998ce4142cbf', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '绑定MAC', 33, 1, 64, 0, 'b_d_____zNnp', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:20:12', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('02f5b791-7f21-46b3-9265-5d740098c5a3', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '填表人', 8, 1, 10, 0, 'reporter', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:14:18', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0301d9e8-83c7-4d42-8f92-a66b26ff2fad', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '航图', 10, 1, NULL, 0, 'aeronautical_chart', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:13:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('034f6d58-15ae-45e0-9e0b-ce315d567a94', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查机型', 4, 1, 36, 0, 'j_ch_j_x__xfhe', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:59:36', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('037e8fa5-2428-4fcb-b890-ee9df510c419', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '提醒日期', 5, 1, NULL, 0, 'reminder_date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:40:04', '2024-07-18 16:58:31', NULL, NULL, 0, 1, 1);
INSERT INTO `column_manage` VALUES ('037ee8b0-fc46-4290-b288-08f9f3006a2b', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '故障报告_3', 80, 1, 800, 0, 'maintenance_report_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0399857e-9bcb-4a23-875e-a44560b1b906', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '更新时间', 27, 1, NULL, 0, 'g_x_sh_j__xGSS', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:18:06', '2024-07-18 16:58:31', NULL, '\"[0]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('039d26ef-c4f4-4b63-9145-ab77b6a12c46', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '练习组合', 11, 1, 50, 0, 'practice_combination', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:47:46', '2024-07-18 16:58:31', 50, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('03de12da-9b51-4565-8cbc-07fb946d1ca2', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '登录密码', 15, 1, 200, 0, 'login_password', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:19:38', '2024-07-31 16:58:08', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('048379e0-1552-4132-a370-545fc725077e', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '更新时间', 0, 1, NULL, 0, 'g_x_sh_j__SXkE', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:24:10', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('04a3c561-32b0-42e8-b957-0002f05d1e10', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '架次', 13, 1, NULL, 0, 'flight_number', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:56:25', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('04bb054b-0d39-48c1-abbb-2161e3bbb1c6', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '夜视_3', 41, 1, NULL, 0, 'night_vision_3', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('04cd4e72-59c8-40af-8908-1f424db729c9', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '单位', 10, 1, 36, 0, 'd_w__afAx', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"d_w__zxfQ\", \"tableCode\": \"d_w_d_j_b__dxfz\"}]', 'null', 'sysadmin', NULL, '2024-05-07 17:31:05', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('04ef7c26-e792-4e06-b36b-59e2aed6a747', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '毕业', 26, 1, NULL, 0, 'b_y__rhHn', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:16:38', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('050cd253-40cb-4738-9f12-17c06d42f243', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, '授课内容', 2, 1, 100, 0, 'course_content', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:39:08', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('055681db-eb47-4313-b2cd-30c52c8bd519', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '日期', 4, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:12:10', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('05739b55-01c6-40a8-aaae-9522ed1a4971', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '可飞科目', 46, 1, 500, 0, 'k_f_k_m__JHba', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:02:37', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('05858070-a9e1-4d56-90bc-9da3109574ae', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '单位', 2, 1, 100, 0, 'department', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:08:31', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('05df01fa-3e7c-4cf0-8636-a6a61d517a41', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '机场', 0, 1, 10, 0, 'airport', 'varchar', NULL, 1, 1, NULL, '[{\"tableCol\": \"j_ch__XrPy\", \"tableCode\": \"j_ch_x_x_d_j_b__rsqm\"}]', 'null', 'sysadmin', NULL, '2024-05-10 11:13:58', '2024-07-26 11:06:56', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('05f121f3-4fe4-4e7d-a4f2-4f77d74f5382', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '出发站_4', 59, 1, 10, 0, 'departure_station_4', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('06652262-dec1-457c-8159-c9c30115918b', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '级', 1, 1, NULL, 0, 'j__WATn', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:44:11', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('06be5129-295e-4ee6-abf2-ffce53787540', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '答题时间', 7, 1, NULL, 0, 'answer_question_time', 'int', 1, NULL, NULL, NULL, '[]', '\"自动记录答题时间，分钟\"', 'sysadmin', NULL, '2024-05-14 16:14:27', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('06ecfe2e-0cb5-41ee-b050-47ac70f83475', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, 'HS1', 10, 1, NULL, 0, 'HS1', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 14:19:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('076accd4-1e85-4d46-a367-bcf7e17ddfbd', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, '更新时间', 6, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:41:49', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0788ac8e-5591-40fd-bf2c-89a9b3674635', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '结束', 9, 1, NULL, 0, 'end', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:51:51', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0854a46e-ab51-45bb-88eb-57b91cba859e', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '报告人_2', 77, 1, 10, 0, 'reporter_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('08c50392-2644-47be-ac8a-1b81950522b6', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '夜视_1', 9, 1, NULL, 0, 'night_vision_1', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('08e7cadf-b6a0-40e5-9fc5-882c6ebdfa95', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '教员考试', 33, 1, NULL, 0, 'coach_exam', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:39:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('08f01ae1-3734-4121-b5e1-0324ebd043ae', '51604a74-5a77-4370-8008-d85f667d9035', NULL, '', 1, '档案信息', 14, 1, 50, 0, 'archival_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:42:03', '2024-07-18 16:58:31', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('08f19fad-e21e-4834-bbb2-73c28ff4c76b', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '专业', 1, 1, 36, 0, 'major', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__iRnX\", \"tableCode\": \"zh_y_z_d__hwxr\"}]', 'null', 'sysadmin', NULL, '2024-05-13 10:21:06', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0907e105-e0c5-4220-8edd-5e14ee08bab6', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '更新时间', 25, 1, NULL, 0, 'g_x_sh_j__xGSS', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:18:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('090a303f-9a10-4520-96ee-7c320d62ac43', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '绑定MAC', 21, 1, 64, 0, 'b_d_____fyaF', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:17:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0925204b-74d1-49a9-bd06-ad7b9bbf51f4', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '绑定IP', 20, 1, 64, 0, 'b_d____ZfNH', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:17:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('09676fda-40ba-4716-968f-6fee8a7b29c1', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '题目', 7, 1, NULL, 0, 'question', 'text', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:30:58', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('099c390f-c54d-4a39-b95b-64d2499831d4', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '批准', 7, 1, NULL, 0, 'approve', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:51:30', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('09a9b6f9-e8db-493d-8412-b88d5ee081dd', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '装上件号_1', 92, 1, 24, 0, 'installed_part_number_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('09ad45a2-a1b8-42d1-8455-e9b610961d3b', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '登录密码', 13, 1, 200, 0, 'login_password', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:16:00', '2024-07-31 16:58:08', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('09ad60a4-3764-4d2c-a629-3294cf292369', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '着陆', 6, 1, NULL, 0, 'landing', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:25:21', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('09dd173b-de48-4151-97e3-81de5c455feb', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '注销日期', 23, 1, NULL, 0, 'zh_x_r_q__aWiH', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:16:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('09fbe375-6a64-4b7a-a1d2-a2991a80e82f', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '测试2', 0, 1, 36, 1, 'c_sh___CjkM', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-08 14:03:36', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0a230ce2-c04f-4e92-9095-d244d4e87329', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '注册日期', 22, 1, NULL, 0, 'zh_c_r_q__BQmy', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:16:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0a4555da-e8a1-407b-9b4f-f17c7acbc48d', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '是否重复', 8, 1, NULL, 0, 'repeat', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0a5d7bde-ea50-4016-9ec0-754b12bcc702', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '出生日期', 5, 1, NULL, 0, 'ch_sh_r_q__MdbE', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:39:09', '2024-07-18 16:58:31', NULL, NULL, 0, 1, 1);
INSERT INTO `column_manage` VALUES ('0a6ec18a-fd1a-4a7f-93f9-d2a94dbbc8d9', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '用户名', 12, 1, 50, 0, 'username', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:15:00', '2024-07-31 16:56:42', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('0a8075f0-9c8e-435b-b329-284c397c6a07', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量右_3', 46, 1, NULL, 0, 'fuel_right_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0a93a6de-b0ae-4165-bc6c-3a00e31015c2', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '适航证发证', 30, 1, NULL, 0, 'sh_h_zh_f_zh__TSAx', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:56:46', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0aa7f33a-db5d-4cdd-af8a-e48169456718', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '备注', 24, 1, 64, 0, 'b_zh__kNAZ', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:15:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ab1c8d0-564c-43a3-9c0f-20ad250f31de', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '名称_1', 89, 1, 10, 0, 'item_name_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ab9ce7c-4668-439c-a1d6-667a771b6c31', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '附件', 19, 1, NULL, 0, 'f_j__PcTa', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:15:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ac5ed04-8104-41c6-8d74-27e4a1a82876', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '排序', 1, 1, NULL, 0, 'p_x__jjcZ', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:14:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ad4bd9b-2b4c-4315-9d02-a1b81e8039b2', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '保密', 33, 1, NULL, 0, 'b_m__eXwk', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:14:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0b03d004-387d-464b-ab62-d0d0d8c4b745', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '在位', 32, 1, NULL, 0, 'z_w__FMTN', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:14:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0b3fc799-8a59-4cab-991b-c2fd3cc0b15e', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '相片', 16, 1, NULL, 0, 'x_p__WwPM', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:13:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0b580c7e-a0f3-4083-82a8-48f15dacaab1', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '曾飞时间', 41, 1, NULL, 0, 'c_f_sh_j__mNNM', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:43:45', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0b699fb2-d6d4-4878-950b-3fad42798b80', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '教学时间', 34, 1, NULL, 0, 'j_x_sh_j__mpWn', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:13:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0b7a2070-ed6d-4afb-bd85-746d9e4285e4', '43c8d179-343c-4292-9f16-10435e7cb2bc', NULL, '', 0, '身份', 0, 1, 16, 0, 'sh_f__CRcR', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:27:48', '2024-07-26 11:10:21', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('0b9fb05e-2400-424a-8a0c-9cd0da2e8865', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '现飞时间', 40, 1, NULL, 0, 'x_f_sh_j___tyn', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:12:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0bde1f4c-6e7e-4bb4-a353-2d18d16a88cf', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '更新时间', 17, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:18:04', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0bf7d167-aed1-4e50-8c95-08783f83a9cb', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '曾飞时间', 43, 1, NULL, 0, 'c_f_sh_j__YrGR', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:12:00', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0c100315-0fb0-471b-be82-962a58627c23', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '电台证号', 7, 1, 20, 0, 'd_t_zh_h__Sbia', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:19:32', '2024-07-18 16:58:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0c13d949-1e96-4d6f-a691-fb751bcd66dd', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '曾飞等级', 41, 1, 36, 0, 'c_f_d_j__BXJb', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r___jQp\", \"tableCode\": \"f_x_d_j_z_d__nmta\"}]', 'null', 'sysadmin', '', '2024-05-06 16:12:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0c384c5e-a6f9-4c15-87c0-edd79d478030', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '简称', 5, 1, 48, 0, 'j_ch__dbe_', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:50:56', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0c50ec12-0c3b-4f61-bc8a-bbcc0ff3afb6', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '毕业年月', 18, 1, NULL, 0, 'b_y_n_y__KiSc', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:11:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0c582a64-fb78-4705-987a-bdfe57475279', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量左_2', 29, 1, NULL, 0, 'fuel_left_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0c5ddabe-6979-4afd-a847-d33fd0edf889', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '毕业院校', 17, 1, 20, 0, 'b_y_y_x__GNnX', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:10:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ca829d2-8d76-4368-9131-7ef4c972e4b2', '51604a74-5a77-4370-8008-d85f667d9035', '', 'archival_information', 0, '档案编号', 15, 1, NULL, 0, 'd__b_h__kcNH', 'int', 1, NULL, 1, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:09:00', '2024-07-26 09:59:31', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('0cb82bdb-0b4b-4bab-ba4c-4ae822a3d63b', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '机长', 18, 1, NULL, 0, 'captain', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:26:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0d01e006-9dfa-458f-96fb-bf07db80af98', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '入职年月', 29, 1, NULL, 0, 'r_zh_n_y__yrpR', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:08:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0d556b37-19f0-4ef7-a2e9-b4dc4103458c', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '执照等级', 39, 1, 36, 0, 'zh_zh_d_j__tiYN', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hRpA\", \"tableCode\": \"zh_zh_d_j_z_d__emzc\"}]', 'null', 'sysadmin', '', '2024-05-06 16:08:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0d66eb82-4fb3-40ff-8572-34fc1afa4b10', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '教学等级', 30, 1, 36, 0, 'j_x_d_j__CCDP', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TnZ_\", \"tableCode\": \"j_x_d_j_z_d__bfkk\"}]', 'null', 'sysadmin', '', '2024-05-06 16:07:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0d68a1cd-8e3c-422a-ad38-1e4afd6d8e96', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '目视_4', 56, 1, NULL, 0, 'visual_4', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0d6e00ea-1de9-4183-8fa8-ef28123066bd', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '兼职岗位', 31, 1, 10, 0, 'j_zh_g_w__zDWc', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:06:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0d772129-87f3-4411-b233-8ae280ed7f92', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '练习号', 3, 1, 10, 0, 'practice_id', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:25:00', '2024-07-18 16:58:32', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0da57657-50c5-4df1-a3d4-25e0f25818ee', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '实到人数', 2, 1, NULL, 0, 'students_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:25:33', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0daef3db-ae4a-4977-a015-f1167916689d', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '学位', 9, 1, 36, 0, 'x_w__KHzw', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__bNRd\", \"tableCode\": \"x_w_z_d__wafe\"}]', 'null', 'sysadmin', '', '2024-05-06 16:06:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0dd3423a-5d40-4c32-b824-1713695353b4', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '学历', 8, 1, 36, 0, 'x_l__ShYT', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__HeiS\", \"tableCode\": \"x_l_z_d__hcyh\"}]', 'null', 'sysadmin', '', '2024-05-06 16:05:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0dfcfded-2b4e-47a1-93ef-ce76e72615a1', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '更新时间', 10, 1, NULL, 0, 'g_x_sh_j__GMcy', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:09:35', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0e11f04f-85fe-4f51-9e7b-d355df0e03dc', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '籍贯', 5, 1, 16, 0, 'j_g__KasG', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:05:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0e2ffe9d-b17a-4abc-9253-f5e0669352e9', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '民族', 6, 1, 36, 0, 'm_z__H_MC', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hfKH\", \"tableCode\": \"m_z_z_d__yjhk\"}]', 'null', 'sysadmin', '', '2024-05-06 16:04:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0e5e2a7d-960b-4a35-992e-d17db5940906', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '党团日期', 11, 1, NULL, 0, 'd_t_r_q__RPFK', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:03:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0e7146b6-32a3-4042-a6af-5a6d4edc3890', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '政治面貌', 10, 1, 36, 0, 'zh_zh_m_m__XWtQ', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TBmb\", \"tableCode\": \"zh_zh_m_m_z_d__errh\"}]', 'null', 'sysadmin', '', '2024-05-06 16:03:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0e7544b1-f93b-4c49-8e05-5eebe91ccf4f', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '航线_2高度', 30, 1, 20, 0, 'route_2_altitude', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:04:15', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0e91d136-76c3-4285-adc4-dbdc3181ed4f', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '出生日期', 4, 1, NULL, 0, 'ch_sh_r_q__iWJm', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:02:00', '2024-07-18 16:58:32', NULL, NULL, 0, 1, 1);
INSERT INTO `column_manage` VALUES ('0e92a928-c540-4aef-a639-4db7e0591ede', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '螺旋桨制造商', 28, 1, 40, 0, 'l_x_j_zh_z_sh__Dkrx', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:59:22', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0eab4025-2184-47c5-919b-bf29551e2aca', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '性别', 3, 1, 36, 0, 'x_b__NsS_', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__CwNY\", \"tableCode\": \"x_b_z_d__xhaf\"}]', 'null', 'sysadmin', '', '2024-05-06 16:01:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0eb03c4d-469e-484d-8541-07336235e81f', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '期班', 10, 1, 36, 0, 'q_b__HYyD', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"q_b__RXcH\", \"tableCode\": \"b_q_d_j_b__wprd\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:36:19', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ed7762d-bad8-40d1-96ce-bb325958f3f5', 'cf958655-ccc3-4806-8819-25766a9a7026', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__TTtX', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:24:53', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('0ee1f41d-c541-4230-bcb7-8e01cc6a2ab6', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '呼号', 38, 1, 19, 0, 'h_h__RGPN', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:01:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0eed8011-d4db-47a8-932a-881caac38324', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '代号', 36, 1, 8, 0, 'd_h__THr_', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:00:00', '2024-07-18 17:01:42', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('0f23dd4b-cb15-44da-b9e8-d4d94ca9df61', '51604a74-5a77-4370-8008-d85f667d9035', '', 'flight_information', 0, '代字', 37, 1, 1, 0, 'd_z__zhpS', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:00:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0f75ed1c-0904-46b1-be8c-56b00c1b7329', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '后舱', 9, 1, 10, 0, 'rear_cabin', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:18:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0f7d282c-5dc0-4020-b85a-bf007c1c03cf', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '姓名', 2, 1, 10, 0, 'x_m__QYBH', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 16:00:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0f960449-cd16-4795-8f5d-54cd45b9b148', '51604a74-5a77-4370-8008-d85f667d9035', '', 'basic_information', 0, '身份证UID', 7, 1, NULL, 0, 'UID', 'bigint', NULL, 1, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 15:59:00', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('0fa6b5e5-9efd-4a52-b540-0143cf3b999a', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '原单位', 28, 1, 100, 0, 'y_d_w__WKRA', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-06 15:54:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0fb288ce-8cb3-46b6-9077-e371bdca320b', '51604a74-5a77-4370-8008-d85f667d9035', '', 'job_information', 0, '单位', 27, 1, 36, 0, 'd_w__P_XG', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"d_w__zxfQ\", \"tableCode\": \"d_w_d_j_b__dxfz\"}]', 'null', 'sysadmin', '', '2024-05-06 15:49:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('0ff48e5a-8223-4ac9-865d-7b802000d322', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '任务PID', 0, 1, 36, 0, 'PID', 'varchar', NULL, 1, 1, NULL, '[{\"tableCol\": \"PID\", \"tableCode\": \"flight_plan_base\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:22:52', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('1042bc52-136f-4c44-ab1c-c68ee388f92c', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, 'ATA章节', 1, 1, NULL, 0, 'ATA___zh_j__GzQJ', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:10:29', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('106a42f7-caa7-4b23-9532-b349801ed92a', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '完成日期', 6, 1, NULL, 0, 'completion_date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('10d65f6a-33e1-4c8a-aea1-a6ff2442a337', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '跑道方向', 4, 1, NULL, 0, 'runway_direction', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:35:25', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('11109df7-97a8-40f5-98a4-1e614fc872b1', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '螺旋桨序号', 3, 1, 36, 0, 'airscrew_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"l_x_j_x_h__BEbc\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-08 17:11:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('1130a6bd-2384-46d2-9e01-d7fceb709597', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '判断题数', 43, 2, NULL, 0, 'judge_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:34:21', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('117093b0-0483-40fa-af9a-2a72ece00d4d', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '机号', 0, 1, 36, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('11e25fcb-520b-4920-be1e-82e4c710a2c2', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, '', 1, '飞行信息', 36, 1, 50, 0, 'flight_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-31 16:36:07', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('11fccca8-108c-4d41-80b2-3c959a9957b9', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '备注', 52, 1, 64, 0, 'b_zh__XRKr', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:05:53', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1253351e-7e29-43e0-aa39-1f76c855707f', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 3', 22, 2, NULL, 0, 'ratio_3', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:25:01', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('125ea506-3f25-4ee9-8ed3-70f0bef03292', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '气象', 3, 1, 36, 0, 'weather', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__HJci\", \"tableCode\": \"q_x_z_d__znar\"}]', 'null', 'sysadmin', NULL, '2024-06-06 11:09:52', '2024-07-18 16:58:32', 4, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('127c8f9c-20eb-4027-8837-be866256e5a4', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '课后作业', 34, 1, 2000, 0, 'post_class_assignment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:42:39', '2024-07-18 16:58:32', 2000, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1306f4b8-fb10-4106-a7c6-f365afdb5dbf', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 5', 26, 2, NULL, 0, 'ratio_5', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:25:34', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('13696458-6131-48ed-bf94-1ae2ef768641', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '仪表_1', 10, 1, NULL, 0, 'instrument_1', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('13aa1393-74e8-452e-8deb-fc4a293beae4', '51604a74-5a77-4370-8008-d85f667d9035', NULL, '', 1, '基础信息', 0, 1, 50, 0, 'basic_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:41:48', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('13cad8af-8e85-4e77-a934-bb75d7bec66f', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '起飞', 5, 1, NULL, 0, 'takeoff', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:25:09', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('13ceb402-e1f6-4f50-8206-49fcc8e70a2a', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '飞行人数', 30, 1, NULL, 0, 'number_of_fliers', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:40:52', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('13d9174f-2ff6-4cc4-9e1b-7b90620e6a40', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '后舱', 4, 1, NULL, 0, 'rear_cabin', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:24:57', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('13dbf98d-8241-467c-8f15-f4402ee1551c', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '准备时间', 13, 1, NULL, 0, 'preparation_time', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:48:29', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('14aff969-3971-4c8f-8aba-e87262f079da', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '填表人', 9, 1, 10, 0, 'reporter', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:45:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('14c57269-ece7-4d84-a2e2-7a8072b8a234', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '机身高度', 9, 1, NULL, 0, 'j_sh_g_d__tbCx', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:00:56', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('14ef61c9-697f-4683-86b9-f9d83c2eb4ce', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, '测试rules列', 0, 2, 255, 1, 'add_rules', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-06-26 09:31:09', '2024-07-18 16:58:32', 255, '\"[2,4]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('14f7a57d-3c9b-49b8-96f9-ff39618a28fa', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 1', 17, 2, 36, 0, 'course_1', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 15:10:05', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1508e060-9878-4ff2-94ce-962671e7d0e9', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '更新时间', 16, 1, NULL, 0, 'g_x_sh_j__xcap', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:20:27', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('156cd16d-5db0-4fcc-9407-6a1cf1a15ce3', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '关车_4', 66, 1, NULL, 0, 'shutdown_4', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('15701fb4-48e3-4d73-82fc-16b038330e80', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '检查', 29, 1, NULL, 0, 'inspection', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:38:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('15d3d889-92e6-43d9-a1f3-1789232b3bf7', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 7', 29, 2, 36, 0, 'course_7', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:23:22', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('15f22f90-5ae7-4a9d-99d9-b44b903a1f70', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起飞_4', 64, 1, NULL, 0, 'takeoff_4', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('162b1d24-eb2f-45d0-aef1-c7cc605390ea', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '登录密码', 14, 1, 200, 0, 'login_password', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:16:55', '2024-07-31 16:58:08', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1637b255-2f06-481a-bd7f-af5c724984cb', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '航线_1', 27, 1, 20, 0, 'route_1', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"air_route\", \"tableCode\": \"h_x_g_l__gfxb\"}]', 'null', 'sysadmin', NULL, '2024-05-11 17:03:23', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1666a19b-40bb-4af0-bada-344c1e1cfe72', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '曾飞时间', 40, 1, NULL, 0, 'c_f_sh_j__YrGR', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:12:37', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1669494e-cfdd-4ed2-8c12-99f5d7ace15b', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '出发站_2', 27, 1, 10, 0, 'departure_station_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('16b38cbc-ff5e-4c91-970e-05d0f949c248', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '更新时间', 11, 1, NULL, 0, 'last_update', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:46:26', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('16fbf60d-256c-41be-beca-3b1420fcfc8f', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '发动机安装', 9, 1, NULL, 0, 'f_d_j__zh__C_Hy', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:52:57', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('17fbca8a-e86a-4565-a081-abde3542d8d5', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '更新时间', 17, 1, NULL, 0, 'g_x_sh_j__HMAa', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:45:14', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1874f982-6cb8-4c09-970a-f6a18a769a1d', '51604a74-5a77-4370-8008-d85f667d9035', NULL, '', 1, '工作信息', 26, 1, 50, 0, 'job_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:42:19', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('18a3245b-7857-476e-9546-cb4c06468dc5', '17097c4c-fb1a-44b2-823b-611ffc83926d', NULL, '', 0, '更新时间', 5, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 11:26:40', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('18d142a9-1bfa-4447-b3b3-49995fd9ec0b', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, 'BID', 1, 1, NULL, 0, 'BID', 'bigint', NULL, NULL, 1, NULL, '[]', '\"计划条 ID，程序生\"', 'sysadmin', NULL, '2024-06-03 14:42:50', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('19300f2a-bae2-439e-b2fa-6dd165ce6fe0', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量右_4', 62, 1, NULL, 0, 'fuel_right_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('19af02c7-1403-44e0-84c2-56cdefd602cc', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '更新时间', 10, 1, NULL, 0, 'last_update', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:15:24', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1a5abdaf-22ba-42b9-8869-6c7beb1c8335', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '螺旋桨时间', 16, 1, NULL, 0, 'l_x_j_sh_j__BEM_', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:54:52', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1b4c27e9-232d-49a4-8b86-3d708d69fa9d', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '螺旋桨序号', 3, 1, 36, 0, 'airscrew_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"l_x_j_x_h__BEbc\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-09 09:37:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('1b8ed240-b482-4261-9de3-24f6ac5cb027', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查期限', 5, 1, NULL, 0, 'Inspection_period', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:08:04', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1bdc0476-a986-40b9-8764-f081050eb963', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, 'AID', 0, 1, 36, 0, 'AID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"AID\", \"tableCode\": \"flight_action\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:32:53', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('1c10d577-2c7a-4877-9b3c-a861ec4e60e5', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '高度', 0, 1, NULL, 0, 'height', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:17:26', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1c4c626b-dc30-454a-96f3-4dc5962a29cb', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 4', 23, 2, 36, 0, 'course_4', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:21:29', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1c5498b0-1abc-4932-9f67-04f4e6f93aa4', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '日期', 4, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:37:20', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1c67ec5b-d95c-4885-ac6f-2a1e534bc517', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '相片', 19, 1, NULL, 0, 'x_p__WwPM', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:13:50', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1c84eb1e-2199-46f5-a175-a5487de6e550', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '机号', 0, 1, 36, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-08 17:04:34', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1cbfa976-1e12-4c34-b109-a67c23733b7e', '338103bc-338e-41ff-9e70-5b5062d10443', NULL, '', 0, '下载', 3, 1, NULL, 0, 'download', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-22 15:16:34', '2024-07-22 15:26:43', NULL, '\"[]\"', 0, 1, 1);
INSERT INTO `column_manage` VALUES ('1d2e3dbf-df97-4f92-aa26-5f428333761a', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '注册日期', 25, 1, NULL, 0, 'zh_c_r_q__BQmy', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:16:08', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1d58171b-83da-4ea5-aaa1-f4abdf06294a', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '保持段成绩', 10, 1, NULL, 0, 'maintain_segment_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:43:33', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1db31320-9f54-41a2-b597-1426161a1b46', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '气象', 5, 1, 36, 0, 'weather', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__HJci\", \"tableCode\": \"q_x_z_d__znar\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:50:42', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1dc2015d-94e1-4454-9e23-1f9e39635fca', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '下次执行', 9, 1, NULL, 0, 'next_execution_date', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1e273aba-abe4-45d8-aa6e-af394f8112f6', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, '日期', 3, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:39:28', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1e3f63a4-2b6b-43eb-9da0-02bd96e484d3', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '填表人', 11, 1, 10, 0, 'reporter', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1e9527b8-ab79-46fb-b671-3afba4181a70', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '选项', 8, 1, NULL, 0, 'option_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:28:58', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1efb1618-bbb3-447f-bc56-e39fc4e3b28e', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '编号', 0, 1, NULL, 0, 'serial_number', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 10:20:13', '2024-07-26 10:01:48', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('1f73d046-d21a-47a3-9bb6-1c5605fa30f8', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '更新时间', 11, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:17:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1f8505ce-e270-4bc2-bcc8-3c9c4bb955da', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '机号', 0, 1, 36, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-09 09:20:00', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1f884155-fb90-47d3-a68e-735e022ad835', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '进入段速度', 4, 1, NULL, 0, 'entry_segment_speed', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:41:20', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1fac1624-edc4-466c-9209-3de0fa0a1124', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '副驾驶', 7, 1, 10, 0, 'first_officer', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1fb8793b-5070-4faa-862a-4925fab6e2d2', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '附件', 10, 1, NULL, 0, 'f_j__WTiG', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:20:33', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1fd8a54e-2176-4ce0-ba9e-85916c035893', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '备注', 6, 1, 64, 0, 'b_zh__WZPd', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:51:05', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('1ff05918-e190-466b-806c-7feae6524f6b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '转场', 9, 1, NULL, 0, 'cross_country_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:28:11', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('205ea4c5-b059-410f-8bd5-14bdaac15ad5', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '注销日期', 29, 1, NULL, 0, 'zh_x_r_q__yTJY', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:24:42', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('20b5f955-52a3-49b7-8e9b-4ded0deaf9a0', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '部件名称', 2, 1, 20, 0, 'b_j_m_ch__XRab', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:10:41', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('20c12c6a-531d-4daa-9398-877e3bb3a388', '17097c4c-fb1a-44b2-823b-611ffc83926d', NULL, '', 0, '发布时间', 3, 1, NULL, 0, 'release_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 11:26:10', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('20ec3900-3a86-4b18-9d7b-768885fc89d2', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '航线_2', 29, 1, 20, 0, 'route_2', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"air_route\", \"tableCode\": \"h_x_g_l__gfxb\"}]', 'null', 'sysadmin', NULL, '2024-05-11 17:03:36', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('224391f5-ee70-4e49-ad89-49c2d9632ee2', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '补训', 26, 1, NULL, 0, 'supplementary_training', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:37:22', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('227b0ecf-e087-408e-9f3a-87a8595cf862', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '最大起飞重量', 12, 1, NULL, 0, 'z_d_q_f_zh_l__MDhh', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:00:06', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('228ee048-64d6-4421-8414-135366192966', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '到达站_3', 44, 1, 10, 0, 'arrival_station_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('22d02bda-42da-413e-9e5a-18caf3ac927b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '练习号SID', 4, 1, NULL, 0, 'SID', 'int', NULL, 1, 1, NULL, '[]', '\"根据 OID/执照/阶段/课程自动生成\"', 'sysadmin', NULL, '2024-06-03 17:17:39', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('23335a0d-bef7-4b21-9ed7-5411ecef2bc4', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '判断分值', 44, 2, NULL, 0, 'judge_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:34:40', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('236a68f2-85ff-4e9d-98e4-769bb5829dd8', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '进入段其它', 5, 1, 500, 0, 'entry_segment_other', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:41:34', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('23772f3d-363f-4e31-b8a3-ab088944cde0', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, 'UID', 12, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-09 16:13:38', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('23a9f026-5488-4c18-b217-d97c7e2f3123', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '题型', 6, 1, 36, 0, 'type', 'varchar', 0, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__zNrr\", \"tableCode\": \"t_x_z_d__z_m_\"}]', 'null', 'sysadmin', NULL, '2024-05-13 11:26:55', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2422f960-a232-4eb4-8f34-96bfb4c5cd3c', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '下载', 15, 1, NULL, 0, 'download', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:17:04', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2423f01e-dd18-4a55-91d5-8f000735258e', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '备注', 9, 1, 64, 0, 'comment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:14:57', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('244ba949-5dcf-4c9e-a754-c49167f85969', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '更新时间', 45, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 14:24:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('24ecfcc1-c05a-406c-a718-26f4ce50ba73', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '目视_1', 8, 1, NULL, 0, 'visual_1', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2542ce0b-1bf9-4804-8538-720c6e4bfb7b', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量左_4', 61, 1, NULL, 0, 'fuel_left_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('25a74c6f-293c-4762-b3e7-5a0f5efe6948', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '远台1距离', 8, 1, NULL, 0, 'y_t__j_l__szjD', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:38:38', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('25b669d8-917d-407c-8c5d-9dd5ccb4c845', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '保持段速度', 8, 1, NULL, 0, 'maintain_segment_speed', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:42:13', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('25bd1c8d-584e-4c07-9d38-d53db84e9a87', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '启动数_3', 54, 1, NULL, 0, 'engine_starts_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('261129b0-ebfa-47b1-a68d-35094025e45f', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '空中时间_4', 68, 1, NULL, 0, 'flight_time_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('27604442-2d69-4d2d-b2c2-ac33b1de8bd9', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '维修工作者', 86, 1, 10, 0, 'maintenance_performer', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('27657e84-474d-4f81-81eb-a78d1cf9d1c6', 'a299b7ea-6992-45e4-8eee-22cecedf88b3', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__aWPY', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:25:53', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('27db688e-c757-4780-a091-93915bf40bb3', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, 'QID', 0, 1, 10, 0, 'QID', 'bigint', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-26 15:17:27', '2024-07-18 16:59:38', 10, '\"[1,2]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('282ab872-1bc0-4906-af7a-9ab6804213bc', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '行数', 10, 1, NULL, 0, 'rows', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:55:43', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('28416ee5-0ff8-4564-96c5-79268bfee216', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '发动机寿命', 5, 1, NULL, 0, 'f_d_j_sh_m__BrzW', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:53:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('28c9cd5f-b629-464d-ae55-71bf4c383569', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '备注', 12, 1, 64, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:28:08', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('28e81fe4-6347-4999-802e-0a28a9407855', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '发动机序号', 3, 1, 36, 0, 'engine_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"f_d_j_x_h__JXaK\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-08 17:11:38', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('28e89bf3-ef6e-4971-987e-e9f5e9e5ef71', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '空域', 0, 1, 8, 0, 'k_y__KNS_', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:47:17', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('28edebba-24a8-412a-bccf-db7e4036cf96', 'e9912b94-4b8b-4830-bdcb-5790a5e015d7', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__ZENb', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:23:40', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2902dc62-de36-4e22-958e-7f216544fa49', '38bc7488-42f6-4bba-9e53-191c68941d0c', NULL, '', 0, '内容', 0, 1, 1, 0, 'n_r__CwNY', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:18:28', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2942d36d-227b-4eb0-9d25-273b30086dde', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '机号', 1, 1, 12, 0, 'aircraft_number', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('29dfed4f-4ff2-408f-8739-e1bd14a3049b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '特技', 24, 1, NULL, 0, 'aerobatics', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:36:03', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('29fa7424-8c5f-45d0-8bac-d5dc655f43af', '2579616f-f8a9-46c4-a10e-1f20bff21a40', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__eehB', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:27:23', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2a1d9ee2-a784-499d-b890-9d4a672d3619', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '机场', 0, 1, 10, 0, 'j_ch__XrPy', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:30:10', '2024-07-26 11:06:56', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2a348d68-9426-433a-89f2-5340c7737118', '27176200-dac2-469b-aa85-95ace5088a28', NULL, '', 0, '考试', 1, 1, 10, 0, 'major', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"exam_name\", \"tableCode\": \"examination\"}]', 'null', 'sysadmin', NULL, '2024-07-11 18:02:51', '2024-07-23 10:06:58', 10, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2a581b9b-fd3a-402d-9b4a-1a2956186015', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, 'BID', 6, 1, 36, 0, 'BID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"UID\", \"tableCode\": \"x_y_x_x_b__dxtc\"}]', 'null', 'sysadmin', NULL, '2024-06-06 15:40:01', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2a642951-da2f-4c25-af19-dbde2e7201a2', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '齿轮箱油型号', 13, 1, 24, 0, 'ch_l_x_y_x_h__ii_B', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:55:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2a6acb03-25f6-4b36-ae37-5c60a34a8c9a', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '绑定IP', 32, 1, 64, 0, 'b_d____dpnk', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:19:57', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2aa785d8-9083-4437-ae15-b50d5f733b57', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, 'QID', 1, 2, NULL, 0, 'QID', 'bigint', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:20:27', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2acf43fb-6ff8-4574-90ea-59683de0cd24', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '电台证到期', 13, 1, NULL, 0, 'd_t_zh_d_q__MXYH', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:57:42', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2ad6931e-6a21-403c-a948-c7dfb828ecab', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '体检类型', 3, 1, 36, 0, 't_j_l_x__AbFh', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__nJER\", \"tableCode\": \"t_j_l_x_z_d__mpwc\"}]', 'null', 'sysadmin', NULL, '2024-05-06 14:47:10', '2024-07-25 14:51:38', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2b13aa12-5586-49f5-9ba6-79d5d3a46216', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '备注', 12, 1, 48, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:16:33', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2b3695af-3af1-4439-b721-370381e97637', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '检查', 19, 1, NULL, 0, 'inspection', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:34:15', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2b52007d-61ab-423e-b55f-273e069f5069', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '交接', 25, 1, NULL, 0, 'handover', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:01:24', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2b8508b0-bbc4-4e44-b256-5412d816bbb2', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '备注', 15, 1, 64, 0, 'b_zh__Szc_', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:22:28', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2bd5180c-9680-4f90-b9e0-3fa3f2025503', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '发动机时间', 6, 1, NULL, 0, 'f_d_j_sh_j__tSRE', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:53:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2c049def-766f-4b91-a2a6-06550c43a256', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '到达站_1', 12, 1, 10, 0, 'arrival_station_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2c095b95-30b7-4aae-a63c-2adf5bc8ff8a', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '纬度', 0, 1, NULL, 0, 'latitude', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:17:01', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2c5c85e4-114b-4a39-995e-9fc988d55197', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '位置', 1, 1, 36, 0, 'engine_position', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', '', '2024-05-09 09:34:00', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2c9d1043-73cd-4a05-9e53-3600307eb29a', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '内容', 7, 1, 36, 0, 'content', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__PbHJ\", \"tableCode\": \"content_dict\"}]', 'null', 'sysadmin', '', '2024-05-09 09:44:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2caad36c-199d-4191-93fa-afd92015e463', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '航空器出厂序号', 14, 1, 20, 0, 'h_k_q_ch_ch_x_h__ZQPK', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:58:06', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2d6019fb-c786-4ad7-b35b-136f113347f2', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '用户UID', 1, 1, 36, 0, 'UID', 'varchar', NULL, NULL, 1, NULL, '[{\"tableCol\": \"UID\", \"tableCode\": \"x_y_x_x_b__dxtc\"}]', 'null', 'sysadmin', NULL, '2024-06-03 15:54:06', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2d8118fe-d240-40b7-9b17-1a51a00ba50c', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '毕业院校', 21, 1, 20, 0, 'b_y_y_x__GNnX', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:10:14', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2df85c77-a578-4582-9e80-c021e4c90652', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '测试2', 0, 1, 36, 1, 'c_sh___PTks', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__bbHC\", \"tableCode\": \"flight_program\"}]', 'null', 'sysadmin', NULL, '2024-05-08 11:05:01', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2df9b4ac-a00b-46f6-8be0-506eb316b22b', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '日期', 1, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:07:40', '2024-07-18 16:58:32', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2e2eed03-730a-43b9-888f-9022f39bee35', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '政治面貌', 12, 1, 36, 0, 'zh_zh_m_m__Zwis', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TBmb\", \"tableCode\": \"zh_zh_m_m_z_d__errh\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:39:33', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2e88ad9d-3686-4b18-afc8-13660a16184b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '高度范围', 28, 1, 8, 0, 'altitude_range', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:39:15', '2024-07-18 16:58:32', 8, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2e94d542-aafc-4487-9bce-59b01cd219a8', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '体检日期', 1, 1, NULL, 0, 'inspection_date', 'date', NULL, 1, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:25:02', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2ef6cc6c-e616-4d14-b8af-772fc2b96d37', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '序号', 3, 1, NULL, 0, 'serial_number', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:20:51', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('2f029aae-0992-40c9-9a89-0a385b78a902', 'cf958655-ccc3-4806-8819-25766a9a7026', NULL, '', 0, '内容', 0, 1, 4, 0, 'n_r__pNtn', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:25:03', '2024-07-18 16:58:32', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2f07f1e3-1d1b-4683-9178-becf01406ba5', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, '测试df ', 0, 1, NULL, 1, 'test_col', 'bigint', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-29 11:28:03', '2024-07-18 16:58:32', NULL, '\"[2,1]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2f0c4da1-9b89-440d-a381-b45946b3119d', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, '更新时间', 6, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:48:03', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2f67045c-5cfc-4c21-8691-ea2d32bd3a0a', '7b728056-aed1-4fe4-af88-82e048595648', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__krXX', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:24:29', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('2f7b7567-90fd-45b5-b406-24bad2928421', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '位置', 1, 1, 36, 0, 'engine_position', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', NULL, '2024-05-09 09:20:51', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('31128826-1aec-4a01-9d64-e036442c63bc', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '更新时间', 11, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:08:15', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('311b2425-17a9-474f-aff2-c6212a4229df', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '转场', 20, 1, NULL, 0, 'cross_country_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:28:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3163eb5a-6954-4cac-aaa3-2d4cdb6b9f8d', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '名称', 3, 1, 48, 0, 'm_ch__NBpQ', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:44:44', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('317b2068-077f-4b1a-9416-9b7a263af104', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '合计时间_2', 37, 1, NULL, 0, 'total_time_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('31aae86a-236b-483d-93f5-fc6b4db61151', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '测试1', 0, 1, 36, 1, 'c_sh___TAPE', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"sh_f__CRcR\", \"tableCode\": \"roles\"}]', 'null', 'sysadmin', NULL, '2024-05-08 11:04:20', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('31de6c3c-d81d-470f-baf4-14c479833092', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '更新时间', 0, 1, NULL, 0, 'g_x_sh_j__XZsD', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:48:29', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3218099d-6620-4245-8173-8d62f856ce7d', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '更新时间', 53, 1, NULL, 0, 'g_x_sh_j__wmfZ', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:06:03', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('32863a29-54d7-4872-b316-6218486e7d7c', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '熟练', 2, 1, NULL, 0, 'proficiency', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:37:01', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('33228565-b1ae-4aca-808b-8d00e8b25bd4', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 10', 36, 2, NULL, 0, 'ratio_10', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:26:50', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('33282aa8-fcbc-4bff-97aa-5ab7973c50ac', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '定向台呼号', 42, 1, 8, 0, 'navaid_callsign', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:06:18', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('33599be5-3eea-4a32-ab6b-993985be6580', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '结束时间', 21, 1, NULL, 0, 'end_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:51:37', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('33740939-f97f-4cd9-8db9-e18fd0c89f9a', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, 'ADSB', 4, 1, 40, 0, 'ADSB', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('34a4ec8f-0dd2-4928-823e-b44880c96677', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起落数_3', 55, 1, NULL, 0, 'landings_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('352e040e-6d76-4b50-b247-9937f08241d0', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '飞机平均', 4, 1, NULL, 0, 'plane_average', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:23:45', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('359ee49e-42b6-468a-9219-eded132c2a94', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'percentage', 0, '及格', 10, 1, NULL, 0, 'pass_percentage', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:15:47', '2024-07-18 16:58:33', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('35bd76c5-edc6-4d3a-839c-f7626efc389a', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '备注', 12, 1, 64, 0, 'comment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('364b65ab-2bf8-4507-94c7-f00297803b5f', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '专业', 4, 1, 36, 0, 'major', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__iRnX\", \"tableCode\": \"zh_y_z_d__hwxr\"}]', 'null', 'sysadmin', NULL, '2024-05-11 18:01:05', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3667df75-e0b2-48c5-9318-d1b7eb751647', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '单位', 0, 1, 100, 0, 'unit', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:07:00', '2024-07-26 11:10:48', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('36bc7f44-5a9b-4406-8194-eb2e96596c0c', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '备注', 9, 1, 48, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:34:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('36cfa648-c607-4ff8-b270-275057d01f31', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '见指_2', 24, 1, 36, 0, 'trainee_director_2', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"x_m__QYBH\", \"tableCode\": \"j_y_x_x_b__etdf\"}]', 'null', 'sysadmin', NULL, '2024-05-11 17:01:10', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('36f64bfc-c6d5-460c-a3a2-0a13222d1470', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '指挥所呼号', 43, 1, 8, 0, 'control_center_callsign', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:06:28', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('37193816-56c7-4b5e-9f45-7260c054ac9a', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 6', 27, 2, 36, 0, 'course_6', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:22:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('375f0fa9-1746-4efe-97eb-70cc8ba76eab', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '备注', 114, 1, 64, 0, 'comments', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('38383213-391c-466a-adfc-03fc03bc2025', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, '', 1, '基础信息', 0, 1, 50, 0, 'basic_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 11:18:16', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3847dcdf-5fb6-433d-b864-92d9a62b87d9', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, '起飞机场', 40, 1, 36, 0, 'takeoff_airport', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_ch__XrPy\", \"tableCode\": \"j_ch_x_x_d_j_b__rsqm\"}]', 'null', 'sysadmin', NULL, '2024-06-06 15:40:57', '2024-07-18 16:58:33', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3886f473-bca8-49e4-8814-9020fb9ff417', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '发动机序号', 3, 1, 36, 0, 'engine_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"f_d_j_x_h__JXaK\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('38dd88a2-a658-4276-9ecc-0dfb8c71471b', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '描述', 6, 1, 200, 0, 'description', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:40:49', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('38e4c9cf-6146-43c6-913a-8aa87324e8b0', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, 'UID', 1, 1, NULL, 0, 'UID', 'bigint', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:07:41', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('39610fc5-e817-4f8e-a8d7-30ea41b758f0', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, 'UID', 11, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-08 16:58:43', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('3968c6ab-937c-4409-8e51-db899ec91674', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '适航证到期', 6, 1, NULL, 0, 'sh_h_zh_d_q__BRAP', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:19:16', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('398aa17f-a9e8-49c1-b31f-ca06a7032f98', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '更新时间', 7, 1, NULL, 0, 'g_x_sh_j__AMYA', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:45:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('39cca4f2-ea96-48f0-92b7-9767783867fa', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '小结', 44, 1, 800, 0, 'summary', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:07:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('39e1d6ac-a33a-465c-84b4-44e20d71cee7', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '结束日期', 7, 1, NULL, 0, 'end_date', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:54:52', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('39e6cc5e-25db-48c6-9007-37c551018348', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '转场架次', 5, 1, NULL, 0, 'cross_country_flight_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:15:12', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3a281b2e-61d4-4b9b-81bc-ee96425c379a', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '备注', 11, 1, 64, 0, 'comment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3a4593a3-a1fc-4941-8efe-a52bead016a2', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '备注', 35, 1, 50, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:43:04', '2024-07-18 16:58:33', 50, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3a6356c8-8a4e-4edd-83d9-75f4a5490ba8', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, 'FID', 1, 2, NULL, 0, 'FID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 16:35:38', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('3a71f596-b982-4000-9b39-f5e940308efe', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '变化量航向', 17, 1, NULL, 0, 'heading_change', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:45:03', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3a8698f5-d46d-436d-b0d5-2365db234f7d', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '参考单位', 4, 1, 36, 0, 'reference_unit', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"q_b__RXcH\", \"tableCode\": \"b_q_d_j_b__wprd\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 15:01:52', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3aa5f73e-0a87-4e92-b192-6f740be55ac1', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '螺旋桨时间', 11, 1, NULL, 0, 'l_x_j_sh_j__BEM_', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:54:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3b0ee956-6772-4f4d-b842-1230ee69b6b9', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '考试', 6, 1, NULL, 0, 'exam', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:36:08', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3bbac72b-fc2d-494c-bd7b-e4321e214fc9', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '优秀下限', 7, 1, NULL, 0, 'rating_ideal_lower', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:18:08', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3be4e15e-967b-40d9-ac75-2d5121ab0a01', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起飞_3', 48, 1, NULL, 0, 'takeoff_3', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3bfa0c34-2e3c-423f-92e2-bf42f1d83fc2', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '试卷套数', 3, 1, NULL, 0, 'paper_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:58:38', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3c4f10c8-3765-42ec-a461-81539371fb72', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '前舱', 8, 1, 10, 0, 'front_cabin', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:19:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3c99b83e-669f-4814-8665-82a5bd4f8b75', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '空中', 15, 1, NULL, 0, 'air_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:23:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3cb8dbc2-474c-463d-829e-417f67c6510f', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '起点', 3, 1, 36, 0, 'start_point', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"waypoint\", \"tableCode\": \"h_d_k_g_l__gm_n\"}]', 'null', 'sysadmin', '', '2024-05-10 11:33:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3ccab950-f293-4136-a29e-0241714a4ce3', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '多发', 25, 1, NULL, 0, 'multi_engine', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:36:38', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3d205ee2-1114-43ca-9f8d-5da3ac835df7', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '超限', 19, 1, NULL, 0, 'exceed_limit', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:49:57', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3d28a8ae-bd49-4483-b88e-8bc4bcf56e36', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '签字', 3, 1, 255, 0, 'signer', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3d566259-e1aa-4614-9c5b-82bc6b6b5607', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '进入段高度', 3, 1, NULL, 0, 'entry_segment_altitude', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:41:09', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3da39fa1-416d-4c13-9520-f452f09526e2', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '机场', 0, 1, 10, 0, 'j_ch__GkhC', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:10:34', '2024-07-26 11:07:10', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('3ddfef91-c59c-45b8-a53b-23e85020bef7', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '更新时间', 9, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:25:01', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3de180f9-09a0-48b3-bdba-01b88d529649', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '航空器制造商', 16, 1, 40, 0, 'h_k_q_zh_z_sh__RTdm', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:58:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3de488a7-b75f-44c4-93ab-279e9ccccda8', '51604a74-5a77-4370-8008-d85f667d9035', NULL, '', 1, '飞行信息', 35, 1, 50, 0, 'flight_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:42:31', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3e2d1092-06ea-4ca1-b0f0-037b3fff1d47', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, 'EID', 0, 2, NULL, 0, 'EID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 14:51:19', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('3e63b4ad-6c14-4ee5-9cb1-b7a10bfd51e8', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '日期', 4, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:12:37', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3e644ced-6a37-4b3f-a8c0-ab94c9e393d9', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, '备注', 5, 1, 64, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:41:29', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3e72b88f-4621-48ab-b582-152d94196587', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '科目', 5, 1, 20, 0, 'subject', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:18:08', '2024-07-18 16:58:33', 19, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3e82e899-d3f7-4f1f-9257-efad9c7d9f64', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '单位', 2, 1, 100, 0, 'd_w__zxfQ', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:44:24', '2024-07-26 11:10:57', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('3ee593ee-1fbd-4758-8181-5ce864dc16f4', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '备注', 15, 1, 64, 0, 'b_zh__kNAZ', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:15:18', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3eeeedfd-3f4c-40b9-a9ef-38f4e2dd2128', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '航站', 10, 1, 10, 0, 'station', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3f45a47b-0fa8-456c-bb25-f63aa9640c26', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量右_1', 14, 1, NULL, 0, 'fuel_right_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3f693c95-8804-4c3c-a3d3-93aada8ea0bb', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '机型', 0, 1, 36, 0, 'j_x__XBwY', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-08 10:52:09', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3f958633-e548-4592-9ecb-ba1771054d42', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '附件', 21, 1, NULL, 0, 'f_j__ycwc', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:18:01', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3fd4c609-3886-4a59-aa4e-6bec5f3857a0', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '党团日期', 13, 1, NULL, 0, 'd_t_r_q__yDsY', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:40:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('3fd59f2d-b725-4a37-9125-c13bd805c8de', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '昼间着陆', 7, 1, NULL, 0, 'day_landing_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:17:29', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4015e5cc-1237-4014-aac7-589713028e06', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '排序', 1, 1, NULL, 0, 'p_x__xAsb', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:21:32', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4096c3fc-adf2-49b4-844c-0bb5470cb3f3', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '滑油型号', 17, 1, 24, 0, 'h_y_x_h__mKnC', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:55:10', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4166f272-9ad6-4c59-b904-60ca7dfd1332', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '更新时间', 24, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:52:29', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('418dc049-957f-45c5-96a8-c9b24e9eab68', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '作业', 8, 1, NULL, 0, 'mission', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:37:55', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('42072c74-7ae8-42a8-bd68-7a4a27fe54a2', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '装上序号_3', 105, 1, 24, 0, 'installed_serial_number_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('421c9ac8-002e-4c36-a09c-deb6cde352a2', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '标准值', 5, 1, NULL, 0, 'standard_value', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:17:21', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('423b537e-f6ec-4947-8466-a85ce4453906', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '航空器制造商', 17, 1, 40, 0, 'h_k_q_zh_z_sh__RTdm', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:58:40', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('423c60d2-c959-4333-9820-f43a81fab4d8', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '近台1距离', 9, 1, NULL, 0, 'j_t__j_l__BysW', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:37:53', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('426967c9-5a02-4683-9c4b-2ba9d891e764', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '内容', 7, 1, 36, 0, 'content', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__PbHJ\", \"tableCode\": \"content_dict\"}]', 'null', 'sysadmin', NULL, '2024-05-09 09:44:40', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('429c34ae-819a-4161-aa61-40aa8c55e539', '53da270e-17a8-49e3-b78c-4817844c6ad5', NULL, '', 0, '内容', 0, 1, 10, 0, 'content', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-19 09:59:43', '2024-07-19 09:59:43', 10, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('42d05034-4ee6-4415-89be-fab9ae33d8e3', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '拆下序号_3', 103, 1, 24, 0, 'removed_serial_number_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('43356958-cd64-4ba2-95e2-993c0781311a', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '通信', 43, 1, 20, 0, 't_x__nNHM', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:01:23', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('43f028fe-79cb-496c-bfbc-29edf0350fa2', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '机号', 3, 1, 12, 0, 'aircraft_id', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"aircraft_id\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-06-03 14:44:15', '2024-07-18 16:58:33', 12, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('441d2247-a787-4474-a799-24209a5ce178', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '毕业年月', 22, 1, NULL, 0, 'b_y_n_y__KiSc', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:11:04', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4442ed39-9071-4b93-b063-04ed918054e9', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '用户名', 14, 1, 50, 0, 'username', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:18:50', '2024-07-31 16:56:42', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('44686f31-f2cb-4b99-9430-18420d949dbe', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '性别', 3, 1, 36, 0, 'x_b__EHeC', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__CwNY\", \"tableCode\": \"x_b_z_d__xhaf\"}]', 'null', 'sysadmin', NULL, '2024-05-07 17:32:07', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('44738f22-2295-4344-8868-aa94debf5f3d', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, 'ERID', 2, 2, NULL, 0, 'ERID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:25:34', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('448a9db5-5a73-4a3e-ab8f-d6b951a8f427', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '多选分值', 40, 2, NULL, 0, 'multiple_choice_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:33:43', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('449b0280-ae83-4a94-b7bc-4432063e3bd3', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '机长', 7, 1, NULL, 0, 'captain', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:27:09', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('44c63433-a4af-4ed9-87a3-94fca6b1eeb2', 'b3753460-89a3-4dff-8008-1a6ad1c40d1c', NULL, '', 0, '名称', 3, 1, 19, 0, 'action_name', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 14:16:16', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('44c8304d-2382-44da-b589-a2d689d45fcb', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教员平均', 9, 1, NULL, 0, 'coach_average', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:21:32', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4570f0f9-ef94-4b7f-a06b-0c3bf6f58fe1', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '预警次数', 8, 1, NULL, 0, 'warning_count', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:34:28', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4578a85b-c364-4504-a248-807704f32879', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '更新时间', 10, 1, NULL, 0, 'last_update', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:15:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('45997bbd-3ec3-47cb-bb2c-36a89a83682f', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '地址', 42, 1, 80, 0, 'd_zh__BPaW', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:01:09', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('45bd0e8d-5fd7-4093-beb3-dc49ebff19be', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '夜间着陆', 43, 1, NULL, 0, 'night_landing_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 14:17:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('45d561ce-ca13-42ed-af74-95cbe2664caa', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查机型', 0, 1, 36, 1, 'j_ch_j_x__Rmzx', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__dMGn\", \"tableCode\": \"j_x_z_d__kwaj\"}]', 'null', 'sysadmin', NULL, '2024-05-06 15:22:11', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('45e09f5f-152f-41eb-8843-4bbbca2d49d2', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '更新时间', 6, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:26:43', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('463f6367-a793-40a4-829c-ce2e8137c768', 'ab13f8b4-dd62-4e66-951a-15e73686d064', NULL, '', 0, '序号', 0, 1, NULL, 0, 'serial_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 14:46:19', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('464bfc6e-58bf-483f-aa59-0435b66ff87a', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '附件', 8, 1, NULL, 0, 'f_j__sYtN', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:08:57', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('469d8f1b-d954-4863-af25-a1c92d075019', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '启动数_2', 38, 1, NULL, 0, 'engine_starts_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('46e13402-8dbe-4667-af18-ef49efb0f10e', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '测问成绩', 5, 1, NULL, 0, 'flight_quiz_results', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:16:50', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('470c41ec-db37-45ea-a62c-365d967bc5a5', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, 'UID', 0, 1, NULL, 0, 'UID', 'float', NULL, 1, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:24:28', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('477b0c49-0988-41e3-8537-8c2475af6cf0', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '下次执行', 9, 1, NULL, 0, 'next_execution_date', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('47f3264d-289c-478e-9a9a-b33e9463d4ca', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '夜航', 10, 1, NULL, 0, 'night_flight', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:22:41', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('47fa6de7-a41c-41f9-86e2-a872c20e452a', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '报告人_3', 81, 1, 10, 0, 'reporter_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4832bb02-0520-4d02-a328-9cbc48cb20db', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '盲降设备型号', 13, 1, 48, 0, 'ILS_equipment_model', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:44:23', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4875e308-55b6-4f7c-8131-bb8d4c1f1dde', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '日期', 4, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('487e326d-68f9-4ea6-ae4e-50aa856c47ec', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '保密', 24, 1, NULL, 0, 'b_m__eXwk', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:14:28', '2024-07-18 16:58:33', NULL, '\"[0]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('488ab9f3-0d87-425f-b21e-00e9b3dcb8df', '17097c4c-fb1a-44b2-823b-611ffc83926d', NULL, '', 0, '名称', 1, 1, 40, 0, 'name', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:06:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4945832c-3667-4e68-8524-bfabd4d45945', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '螺旋桨型号', 2, 1, 36, 0, 'airscrew_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"l_x_j_x_h__ewrn\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('496adaa1-58bf-433c-970d-0f000a577e99', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '螺旋桨安装', 9, 1, NULL, 0, 'l_x_j__zh__Kwmt', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:54:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('497ee5c0-2c4b-4a6e-b41d-e0f4bd4ca0a9', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '螺旋', 12, 1, NULL, 0, 'spiral', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:36:39', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('498a666b-2382-4974-a014-9009ef25d6c4', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, 'PID', 0, 1, 36, 0, 'PID', 'varchar', NULL, 1, 1, NULL, '[{\"tableCol\": \"PID\", \"tableCode\": \"flight_plan_base\"}]', '\"计划 ID\"', 'sysadmin', NULL, '2024-06-03 14:42:22', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('49c4211e-6270-448b-bbed-a1002047981d', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, '', 1, '工作信息', 28, 1, 50, 0, 'job_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:03:00', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('49d748e7-9c34-452d-812b-d31e1e672176', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '在训', 25, 1, NULL, 0, 'z_x__nFds', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:16:29', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4a03cfea-0142-47c4-a278-db695a1f2d82', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '齿轮箱油型号', 18, 1, 24, 0, 'ch_l_x_y_x_h__ii_B', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:55:27', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4af055a9-d245-4e27-acfd-a4c67cf66f32', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '保持段高度', 7, 1, NULL, 0, 'maintain_segment_altitude', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:42:01', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4af192a1-e433-4bcd-a5c9-8b3eab89c31e', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '练习个数', 14, 1, NULL, 0, 'number_of_practices', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:48:40', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4b3c2ac9-d077-4aaf-b883-40d10be90c15', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '计划起飞', 5, 1, NULL, 0, 'scheduled_takeoff', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:44:57', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4b3cc2c1-4807-4b8a-8882-b389ce18725f', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '职务', 29, 1, 10, 0, 'zh_w__zDWc', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:06:30', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4b3ccff2-c2e8-47e0-b93b-7ea8617ccf1d', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, 'UID', 11, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-08 16:58:00', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('4b3e4caf-eb97-489c-9d79-f6ccef77bbfc', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '开始时间', 5, 1, NULL, 0, 'start_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:13:07', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4b483b53-2926-417c-a593-be25cfbe7f9e', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '备注', 9, 1, 64, 0, 'b_zh__kzGY', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:09:11', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4b65fc91-fb6d-4716-81d7-5569060a030d', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '完成日期', 6, 1, NULL, 0, 'completion_date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4b9a3d49-2bd9-4c76-bbd4-b04a2b005b33', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '维修航站', 85, 1, 10, 0, 'maintenance_station', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4bf762e8-5dc9-42bf-b857-cb8ab970acb0', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '机号', 0, 1, 36, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-08 17:04:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4cc0264f-966b-4198-a0f8-e6132896e2b7', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '出发站_3', 43, 1, 10, 0, 'departure_station_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4d83c232-7a49-4edc-978b-0a3892227e15', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, 'FTD', 37, 1, NULL, 0, 'FTD', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-21 09:49:18', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4da957ad-b213-4367-a238-24f0a95d787f', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '天黑', 18, 1, NULL, 0, 'dark', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:57:19', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4dc72ec6-85eb-41f9-a270-0229aff7a561', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '关车', 13, 1, NULL, 0, 'engine_shutdown', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:14:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4dd3c689-6129-4f60-bea9-80adf5420b03', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '多选题数', 39, 2, NULL, 0, 'multiple_choice_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:33:21', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4e147466-2cda-4ee6-af89-728b7e396a63', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '副指_1', 21, 1, 36, 0, 'deputy_director_1', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"x_m__QYBH\", \"tableCode\": \"j_y_x_x_b__etdf\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:58:57', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4e1acd90-7585-4028-ba39-441d5beeb81b', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '拆下件号_3', 102, 1, 24, 0, 'removed_part_number_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4eb0e4d4-b45d-437f-8128-20cbc8523370', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '备注', 11, 1, 50, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:26:49', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4ecb9f36-63d3-41a7-845e-526eef3716ff', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '其他', 8, 1, NULL, 0, 'other_info', 'text', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:18:48', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4f07cc2d-8449-4846-b6ab-0cf701a488e2', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '合计时间_4', 69, 1, NULL, 0, 'total_time_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4f28358d-a475-4993-9ffd-499f0297a243', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '统计日期', 49, 1, NULL, 0, 't_j_r_q__ZdW_', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:04:29', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4f2b7979-b43d-4723-ad68-863a87305578', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, 'PID', 1, 1, NULL, 0, 'PID', 'bigint', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:11:26', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('4fc3c303-5708-470c-8040-6dddf9926d2e', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '现飞时间', 42, 1, NULL, 0, 'x_f_sh_j__wGMY', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:43:56', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4fdcc146-6f7c-44bd-b0ea-88b64e1b01b9', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '航空器基重', 22, 1, NULL, 0, 'h_k_q_j_zh__Bitf', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:59:44', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4fee25ec-309d-443d-9b43-220bfee96f93', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '本场架次', 13, 1, NULL, 0, 'local_flight_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:13:17', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('4ff41821-a8de-4c13-aa79-121f76f6d72c', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '开始日期', 6, 1, NULL, 0, 'start_date', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:54:37', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5086d0cb-4315-47c7-9e06-6f5948da69d3', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '超限次数', 9, 1, NULL, 0, 'exceed_limit_count', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:34:13', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5097a37e-4129-41b0-bdb6-c290dffdfb83', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '飞机状态', 48, 1, 36, 0, 'f_j_zh_t__sbwY', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__krXX\", \"tableCode\": \"f_j_zh_t_z_d__zfmb\"}]', 'null', 'sysadmin', NULL, '2024-05-08 15:04:10', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('50ab393a-6c0e-4c9b-9a0c-8147ba16492b', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '毕业日期', 29, 1, NULL, 0, 'b_y_r_q__jJyN', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:15:26', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('50b59108-265f-432f-a304-511a1450f64d', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 8', 31, 2, 36, 0, 'course_8', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:23:42', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('50e0f9db-89a8-4cc0-a21b-10641e775bb3', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '螺旋桨型号', 8, 1, 24, 0, 'l_x_j_x_h__ewrn', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:54:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('51031a17-c207-4fe8-8db1-1720c3c1ac56', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '在位', 24, 1, NULL, 0, 'z_w__YHyp', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:21:06', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('513ca68c-6b35-469a-b729-f6f618ee0648', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '更新时间', 12, 1, NULL, 0, 'last_update', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('51572c65-fd72-48f8-908d-6737d8da249e', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '电台证号', 24, 1, 20, 0, 'd_t_zh_h__NYNZ', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:57:17', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5180ac80-013a-4f60-bbc0-7c8c1a94678e', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '试飞', 17, 1, NULL, 0, 'test_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:33:33', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('51bc5ede-3a21-408a-bcf4-1ad8ce52372e', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '单选分值', 38, 2, NULL, 0, 'single_choice_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:32:51', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('52051dd8-4204-4799-88e8-55775abe3bb0', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, 'SID', 0, 2, NULL, 0, 'SID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 14:29:04', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('5205a36a-1ef4-491a-be14-8aaa693abe93', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '螺旋桨安装', 14, 1, NULL, 0, 'l_x_j__zh__Kwmt', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:54:19', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5233412e-7355-49a4-95de-dcacb6ecc16e', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '单位', 30, 1, 36, 0, 'd_w__P_XG', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"d_w__zxfQ\", \"tableCode\": \"d_w_d_j_b__dxfz\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 15:49:51', '2024-07-18 16:58:33', NULL, '\"[0]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('52a8b7f6-f2b5-468b-989e-ec956ce4b1c0', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '变化量高度', 15, 1, NULL, 0, 'altitude_change', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:44:35', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5310800e-4e08-4d35-8ee4-234fe2c0d685', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '螺旋桨序号', 12, 1, 24, 0, 'l_x_j_x_h__BEbc', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:53:45', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('532de117-0b15-43bc-bb14-3b33d95d4b9b', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '主指_1', 19, 1, 36, 0, 'chief_director_1', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"x_m__QYBH\", \"tableCode\": \"j_y_x_x_b__etdf\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:58:03', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5337e5d4-0bb5-4944-a311-716e376102b7', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '仪表_2', 26, 1, NULL, 0, 'instrument_2', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('53438890-fc9f-4caa-b5ff-ca4bd24143f1', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '地面时间_3', 51, 1, NULL, 0, 'ground_time_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('535c5298-5de1-4589-9470-4888b545e001', '18dab118-6411-40ef-a1ec-bdcdbe2f6c33', NULL, '', 0, '序号', 0, 1, NULL, 0, 'serial_number', 'int', 0, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:02:58', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('53b052fe-ab08-461e-ba61-96608107703f', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '类型', 4, 1, 36, 0, 'type', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__aWPY\", \"tableCode\": \"f_x_j_h_l_x_z_d__wpca\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:50:26', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('53b5acd3-6b13-4704-bed9-fc5f57955675', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '航站', 8, 1, 10, 0, 'station', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:45:20', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5464ae45-0081-4c77-8b10-c1640135f0ff', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '备注', 8, 1, 48, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:24:24', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('552116b1-deb1-4181-930b-d762a1f7864e', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '航站', 7, 1, 10, 0, 'station', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:13:48', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('55277133-bc46-449b-96d5-841147de9edf', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '故障报告_2', 76, 1, 800, 0, 'maintenance_report_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('55945921-294d-4431-9acd-688ac1fca708', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '拆下序号_1', 91, 1, 24, 0, 'removed_serial_number_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('55db2de0-e5f1-4e2a-96ba-cee4aa11971c', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '密码', 46, 1, 128, 0, 'password', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:06:56', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('56594e30-fd03-4360-964e-bdbabb97c061', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '落地', 12, 1, NULL, 0, 'landing', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:14:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('574e1a26-5c12-468c-bbda-32d6432a96ed', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, 'FID', 5, 1, 36, 0, 'FID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"UID\", \"tableCode\": \"x_y_x_x_b__dxtc\"}]', 'null', 'sysadmin', NULL, '2024-06-06 15:39:25', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('57c29bd5-79aa-4eb1-a10c-ee8c5b032f50', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '最大着陆重量', 24, 1, NULL, 0, 'z_d_zh_l_zh_l__GnMs', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:00:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('57eb785d-2c4b-47a0-aa3d-b483bed2d537', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, 'PID', 0, 1, 36, 0, 'PID', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:19:46', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('58361e89-024b-4c0c-ab64-c58dcf6e9c33', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '航站', 7, 1, 10, 0, 'station', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:13:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('58a7630e-df5b-4a16-ae5c-b8b623be9fdf', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '起飞', 11, 1, NULL, 0, 'takeoff', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:14:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5932ac02-4091-4f87-8946-7b5eea26b931', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '用户名', 12, 1, 50, 0, 'username', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:22:55', '2024-07-31 16:56:42', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('593d3aef-32b0-4de5-b069-40a17829bc61', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '国籍证日期', 29, 1, NULL, 0, 'g_j_zh_r_q__ySzx', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:56:14', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('595f6cf2-6295-4d16-9eb9-58fdc76b95f3', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '人工判卷', 12, 1, NULL, 0, 'manual_grading', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:07:35', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('59846b7f-be9b-4ee1-88e7-4e5972ea1c50', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '机号', 0, 1, 36, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-09 09:20:26', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('59af6b0d-6949-465a-a05e-c8df99d686e6', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '到达站_4', 60, 1, 10, 0, 'arrival_station_4', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('59c3002c-8d66-44db-8953-48e78a01c660', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教员时间', 14, 1, NULL, 0, 'coach_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:20:24', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('59ccb9cf-7c43-45e4-8565-69da7e13d3f1', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '人员组合', 16, 1, 20, 0, 'crew_combination', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:49:11', '2024-07-18 16:58:33', 20, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5b296945-287e-4301-8e2a-5e515b27be9e', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '禁飞科目', 47, 1, 500, 0, 'j_f_k_m__Sdzb', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:02:54', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5b5c1c5c-c0dd-4f0b-b123-5ba7270dca55', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '游览', 31, 1, NULL, 0, 'sightseeing', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:38:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5ba70287-fecf-44e4-a200-54facdbbe714', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '用户名', 10, 1, 50, 0, 'username', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:15:49', '2024-07-31 16:56:42', NULL, '\"[0]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('5bae373f-2b9e-4b05-a97b-bf608085cdc9', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '航站', 8, 1, 10, 0, 'station', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:45:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5bb22265-49b4-4ebf-94fb-c6707d7cd523', '9400a484-c7a7-4cce-ac43-5129c340da63', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__bNRd', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:20:14', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5bef096a-3d80-4144-84fe-5edde49853f9', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '主指_2', 20, 1, 36, 0, 'chief_director_2', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"x_m__QYBH\", \"tableCode\": \"j_y_x_x_b__etdf\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:58:17', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5c1c7676-d520-4873-8e1f-60355cc2a4b2', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, 'FTD', 15, 1, NULL, 0, 'FTD', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:46:14', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5c7c7a62-c590-4e86-ab11-53383c38c2f9', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '适航证号', 31, 1, 20, 0, 'sh_h_zh_h__tkCY', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:56:27', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5c7e9370-9df5-4355-8fda-3fadaf60f57a', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '登录密码', 13, 1, 200, 0, 'login_password', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:24:59', '2024-07-31 16:58:08', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5c84f9c2-62c7-4d20-a136-725acd9780ec', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '纬度', 0, 1, NULL, 0, 'w_d__DWye', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:21:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5c98821a-b521-41db-915f-e347462a98fe', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '航线_1高度', 28, 1, 20, 0, 'route_1_altitude', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:03:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5cc3f838-476c-4fb7-a8b2-934d78fddcf3', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '任务', 20, 1, NULL, 0, 'task', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:34:31', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5cf0882f-7c6d-496a-ba08-624b693a385d', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__JkWC', 'int', 0, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:43:56', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('5d15f346-5604-4c01-b76a-346113403f18', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, 'SID', 7, 1, 36, 0, 'SID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"SID\", \"tableCode\": \"flight_subject_details\"}]', 'null', 'sysadmin', NULL, '2024-06-06 15:38:27', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('5d45a9b0-d91b-457f-8e2c-3671631d12f7', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '序号', 1, 1, NULL, 0, 'x_h__TyTF', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:49:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('5deb8995-0c32-4d9a-8fe1-fdb6f6e8d35d', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '国籍证日期', 3, 1, NULL, 0, 'g_j_zh_r_q__cSkr', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:18:13', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5e0e8688-c3a3-4a8e-98be-c44d6104ec28', '338103bc-338e-41ff-9e70-5b5062d10443', NULL, '', 0, '浏览', 4, 1, NULL, 0, 'file_views', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-22 15:15:58', '2024-07-22 15:26:43', NULL, '\"[]\"', 0, 1, 1);
INSERT INTO `column_manage` VALUES ('5e5d0988-0569-440f-bd2e-b6e506dff317', '27176200-dac2-469b-aa85-95ace5088a28', NULL, NULL, 1, '百分率', 7, 1, NULL, 0, 'percentage', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', NULL, NULL, '2024-07-11 18:13:59', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5ef4fc71-c49f-469f-ba4b-a15d9d587a9e', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '更新时间', 13, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:20:11', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5ef89532-9091-4377-93eb-b39efe93544b', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '副指', 16, 1, 20, 0, 'deputy_director', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:19:33', '2024-07-18 16:58:33', 20, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5f0ad15a-f8d6-450b-9d94-452ee6ca1e4f', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '本场时间', 17, 1, NULL, 0, 'local_flight_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:12:10', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('5f287696-ff44-4daa-95c0-d8d36b7c0157', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '关车_1', 18, 1, NULL, 0, 'shutdown_1', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60321ee9-dd83-4ad6-9be0-9b6a02cf8194', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '绑定IP', 27, 1, 64, 0, 'b_d____zAZy', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:25:20', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('604bba94-65b6-41ec-bcaf-492fa91ccb2e', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '简号', 2, 1, 3, 0, 'j_h__fFmZ', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:50:14', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('605011e2-3b91-49e5-bb1f-5af925351823', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '在册', 50, 1, NULL, 0, 'z_c__JBTP', 'bool', 0, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:04:57', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60887d9f-adc9-4572-9f4d-f920666efb6b', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '经度', 0, 1, NULL, 0, 'j_d__HthK', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:21:48', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60a3b5fc-877a-42b1-b652-6ea728905d5d', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '学历', 8, 1, 36, 0, 'x_l__Ssey', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__HeiS\", \"tableCode\": \"x_l_z_d__hcyh\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:41:08', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60ae420c-5a49-4168-a423-5eec36fb09c9', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '开训日期', 28, 1, NULL, 0, 'k_x_r_q__raDj', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:15:08', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60c2fd06-d899-4909-a8c9-9c3c2bcd6083', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '阶段', 2, 1, 36, 0, 'action_stage', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"content\", \"tableCode\": \"flight_evaluation_phase_dict\"}]', 'null', 'sysadmin', NULL, '2024-05-11 15:13:25', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60c5c3ed-df7d-4d29-b7eb-956f4cf3c801', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '附件', 21, 1, NULL, 0, 'f_j__RaBS', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:22:06', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('60dd73e3-6167-4e0f-a000-e85b54b00fd8', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '主指', 18, 1, 20, 0, 'chief_director', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:18:58', '2024-07-18 16:58:33', 20, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('610de8bd-6467-4a56-b3e6-cb8c141d8aa7', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查日期', 1, 1, NULL, 0, 'inspection_date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:59:43', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('611f382c-31e2-44b4-93d3-f5e7382a38a5', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '空中时间_3', 52, 1, NULL, 0, 'flight_time_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('613aa57d-f098-4d66-aa10-6ad525ee5800', '528bb1bd-8984-459c-b5f5-4ad93c5ec91b', NULL, '', 0, '序号', 0, 1, NULL, 0, 'serial_number', 'int', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:04:09', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('61527ece-7fd7-4c74-b180-1bbff490684a', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '航空器交付日期', 17, 1, NULL, 0, 'h_k_q_j_f_r_q__BTSK', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:58:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('619520ee-4844-43e6-bd8c-7634143ea9c4', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '职务', 22, 1, 16, 0, 'zh_w__cxTb', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:19:30', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('62201617-bc8a-495a-90e1-190b15a9af78', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '结束', 19, 1, NULL, 0, 'end', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:15:17', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('626f0ee2-541f-4cf3-815a-c9cf422a72d0', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '着陆_4', 65, 1, NULL, 0, 'landing_4', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('62749a7b-fd5e-44ef-9517-d1f36ca7176c', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '备注', 16, 1, 48, 0, 'b_zh__JbHp', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:45:02', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('628fce29-4933-4670-a4d9-8467b2285b16', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '备注', 23, 1, 49, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:52:04', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('62ef6698-6e3c-41b4-abf7-5f1b9d460c34', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '参数', 3, 1, 10, 0, 'parameters', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:16:21', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('62fd55e6-ed85-45d5-8879-6094738fae18', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '合计', 38, 1, NULL, 0, 'total_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:46:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('63e0c804-f966-4bad-a9c2-b6b8da49d89a', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, '机号', 2, 1, 36, 0, 'aircraft_id', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-06-06 15:35:28', '2024-07-18 16:58:33', 12, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6437e8ff-40ce-4821-9af1-93d8cf217d75', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '在位', 23, 1, NULL, 0, 'z_w__FMTN', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:14:12', '2024-07-18 16:58:33', NULL, '\"[0]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('64615a61-3ce9-4398-9c8c-e20d350432f4', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '人数', 3, 1, NULL, 0, 'students_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:21:18', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('647a327c-5299-44d2-9d2d-23bb454ae5eb', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '单位', 0, 1, 100, 0, 'unit', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:07:13', '2024-07-26 11:11:08', 100, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('64b98b67-7980-4785-8a00-eb95006e5d9a', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 10', 35, 2, 36, 0, 'course_10', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:24:28', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('64cc9fb1-dd7c-4fee-8c1b-94f6d8ab5295', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '经度', 0, 1, NULL, 0, 'longitude', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:16:20', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('64e7e66f-f898-4b39-b3c6-5d069b1b1214', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '夜间着陆', 20, 1, NULL, 0, 'night_landing_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:17:56', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6517e894-608e-4891-a8f0-28703029e87f', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '机号', 2, 1, 12, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:31:15', '2024-07-26 10:01:05', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('65485bbb-d66c-45c6-84db-2c9290e85d38', '5242000e-c725-41b1-8113-3a8e38a3e731', NULL, '', 0, '任务PID', 0, 1, 36, 0, 'PID', 'varchar', NULL, 1, 1, NULL, '[{\"tableCol\": \"PID\", \"tableCode\": \"flight_plan_base\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:19:43', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('66c9b157-587e-46da-bd76-84cb0e0cc97a', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '发动机寿命', 10, 1, NULL, 0, 'f_d_j_sh_m__BrzW', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:53:10', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('66d5a867-9332-4bc7-8d6b-66202a5b863b', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '转场', 21, 1, NULL, 0, 'cross_country_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:28:24', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('673b5210-b0f8-44ae-9fe3-d00d39694ef5', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '位置', 1, 1, 36, 0, 'engine_position', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', '', '2024-05-09 09:20:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('67470dc2-a533-40c3-ba6c-896509741fc0', 'ab13f8b4-dd62-4e66-951a-15e73686d064', NULL, '', 0, '位置', 0, 1, 20, 0, 'w_zh__MCQX', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:08:07', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('67a5e06a-9c02-43ad-9b4f-890e1e38260d', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '电台证发证', 33, 1, NULL, 0, 'd_t_zh_f_zh__GhQT', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:57:31', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('67c4bc82-b712-4e55-99c1-33b489d4531c', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, 'SID', 0, 1, 10, 0, 'SID', 'bigint', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-26 16:00:15', '2024-07-18 16:59:38', 10, '\"[1,2]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('67cc7b4e-9d95-4240-90c8-44f125570098', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '航站_1', 74, 1, 10, 0, 'station_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('67e764f1-e384-4cfa-9c74-edffd78b754b', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '发动机型号', 8, 1, 24, 0, 'f_d_j_x_h__KiaX', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:52:40', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('686295dc-300f-4d2b-a800-45fe1ce52972', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '档案编号', 18, 1, NULL, 0, 'd__b_h__dEP_', 'int', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:20:28', '2024-07-26 09:59:31', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('68b41e3f-5328-45f4-903c-e4f3c748099d', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '籍贯', 7, 1, 16, 0, 'j_g__QPfW', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:40:51', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('68cc9c0f-e5e7-43a4-99f8-b6c64d5e5b7b', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '一般上限', 10, 1, NULL, 0, 'rating_average_upper', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:19:08', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('692e2051-c595-4498-a521-ce8ff6319ea5', '5242000e-c725-41b1-8113-3a8e38a3e731', NULL, '', 0, '更新时间', 5, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:22:06', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('69500872-915a-4fef-9ea2-fc1abce80cd6', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '时间', 22, 1, NULL, 0, 'time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:35:21', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('69676f86-01b1-48d6-a842-21164e35af57', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '航线', 2, 1, 20, 0, 'air_route', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:34:00', '2024-07-26 11:11:22', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('6a1f1349-5d0d-4a7c-9d1a-ab9053184ff9', '17097c4c-fb1a-44b2-823b-611ffc83926d', NULL, '', 0, 'OID', 0, 1, NULL, 0, 'OID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 11:18:06', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('6aa65732-e580-42fa-8b00-c3e31fd1b14b', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '原单位', 31, 1, 100, 0, 'y_d_w__WKRA', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 15:54:17', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6ac6c3da-3e63-4751-96b8-7aec53d70f6e', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '备注', 10, 1, 64, 0, 'comment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:46:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6b13e3bb-9274-4697-8fe0-7336c6e05d6d', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '结束时间', 7, 1, NULL, 0, 'end_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:33:34', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6b7cbf60-e1e4-4208-9b66-662bbac065c4', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '辅导资料', 11, 1, NULL, 0, 'class_file', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:27:38', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6b885ea6-2678-4765-a262-99744c1798a6', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '类别', 108, 1, 20, 0, 'category', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6b93715a-b4aa-4120-8a3e-19c54179fcf1', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '下次日期', 5, 1, NULL, 0, 'x_c_r_q___PSp', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:11:59', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6ec6d85b-f2ce-42c3-a489-57be787d19ae', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '夜间', 21, 1, NULL, 0, 'night_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:35:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6ee17c71-f2fc-43a0-87e6-e4bc545013e9', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '螺旋桨寿命', 15, 1, NULL, 0, 'l_x_j_sh_m__EMb_', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:54:40', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6efa331c-110f-4651-9d2c-868e72e6b777', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '档案编号', 19, 1, NULL, 0, 'd__b_h__ZZtX', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:41:58', '2024-07-26 09:59:31', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('6f1b4505-13ea-4214-9e97-1ac47116d870', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '序号', 1, 1, NULL, 0, 'sequence_number', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:43:00', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('6f67dae7-61fa-4a88-8e4b-e1f10f669b05', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '螺旋桨型号', 2, 1, 36, 0, 'airscrew_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"l_x_j_x_h__ewrn\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-08 17:10:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6f9d2b6a-6ecd-474c-8102-89e01aabd38e', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '毕业院校', 22, 1, 20, 0, 'b_y_y_x__hmxH', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:42:12', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('6fdba817-178b-4111-a4c3-4f1b9781b731', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '关键词', 9, 1, 10, 0, 'key_word', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:12:54', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('706ffda5-210a-462c-870e-54a9005ccf11', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '更新时间', 15, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:36:48', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('70bdeb84-4018-4027-a80d-c06f5e0e26ca', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '执照', 1, 1, 36, 0, 'pilot_license', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hRpA\", \"tableCode\": \"zh_zh_d_j_z_d__emzc\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:53:14', '2024-07-18 16:58:33', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('71036ba2-de5e-4587-ad7c-f887eac208d7', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '描述', 6, 1, 200, 0, 'description', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:40:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7112f7f6-a26f-4fd2-8f0f-0eb18ee33958', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '排序', 1, 1, NULL, 0, 'p_x__jjcZ', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:14:45', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('71322123-5553-463d-992c-2f5fc5100adc', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, 'ADSB', 4, 1, 40, 0, 'ADSB', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('714cd170-3d7d-4f31-b95d-f6e9c9ea25f3', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '仪表', 22, 1, NULL, 0, 'instrument_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:35:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('71886ac1-4516-4854-bab8-909e9b82d8f1', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, 'FTD', 14, 1, NULL, 0, 'FTD', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:32:38', '2024-07-18 16:58:33', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('71a73460-86c7-44c1-a9e1-d0b49e61c206', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '航空器基重', 21, 1, NULL, 0, 'h_k_q_j_zh__Bitf', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:59:00', '2024-07-18 16:58:33', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('721c215b-e260-4c5f-8cb7-04f2def3a276', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '学员人数', 22, 1, NULL, 0, 'student', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:19:43', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('72c5554a-e156-452e-bb94-27eb4337eb36', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '授课内容', 9, 1, 100, 0, 'course_content', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:24:54', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('72cf937b-1f30-4729-94a7-90db889b46ea', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '描述', 5, 1, 200, 0, 'description', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('736368e6-61bd-48de-b4de-a734e70fdc90', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '已判', 5, 1, NULL, 0, 'reviewed', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:24:03', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('73a30c1b-5d4b-43a0-a3bf-36c40a3c182f', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '航图', 0, 1, NULL, 0, 'h_t__tGmz', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:23:22', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('73ce53bf-56cb-4330-aeab-ea2134254d88', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '出发站_1', 11, 1, 10, 0, 'departure_station_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('73d46042-b83d-408b-b9b8-bbf60170060d', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '成绩', 8, 1, NULL, 0, 'total_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:15:27', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7430717f-ae61-4c4d-af31-c5ae503a1e23', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '机号', 1, 1, 12, 0, 'j_h__bGYP', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:49:25', '2024-07-26 10:01:10', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('745786a2-c20a-47fb-9d19-c65abb1c4982', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, 'FID', 1, 2, NULL, 0, 'FID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 15:23:15', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('745d6b51-bba7-4d30-8e58-e855a924ada9', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '实施起飞', 6, 1, NULL, 0, 'initiate_takeoff', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:45:14', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('74667416-89af-4114-a73c-c463335a5fa0', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '使用时间', 5, 1, NULL, 0, 'operating_hours', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:12:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('74ce034a-5cda-40be-9a89-099d41a113e3', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '籍贯', 5, 1, 16, 0, 'j_g__zpXr', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:18:01', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('751b54c7-c8fb-404d-adc8-89199539e747', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '航空器出厂日期', 15, 1, NULL, 0, 'h_k_q_ch_ch_r_q__CAAi', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:58:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('75407cc3-187f-4544-9177-dfe6ff0a7037', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '拆下序号_2', 97, 1, 24, 0, 'removed_serial_number_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('759ca221-90c3-4fef-b32e-fefd9e7a2136', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '故障报告_1', 72, 1, 800, 0, 'maintenance_report_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('75bbfa1f-49ce-4296-8a09-52bcb497d781', '27176200-dac2-469b-aa85-95ace5088a28', NULL, '', 0, '备注', 12, 1, 1000, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:16:29', '2024-07-18 16:58:34', 1000, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('75ecd4fb-aaef-4c3f-bb8b-ce2d77d11c8e', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '曾飞机型', 41, 1, 36, 0, 'c_f_j_x__NBXF', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-07 11:06:06', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('762f9a46-43f0-46e5-803c-85f803990d7f', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '填表人', 8, 1, 10, 0, 'reporter', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:14:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('764557a3-f7aa-418b-84f8-c574af706f7c', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '得分', 12, 1, NULL, 0, 'scored_times', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:34:50', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('767f09c4-8b4b-44ac-8e5d-1725643ddce5', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'info', 0, '照片', 0, 1, NULL, 0, 'personal_photo', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 17:00:07', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('76bc4662-6f15-4d2c-9861-f936ebb86c8b', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '考试名称', 1, 1, 24, 0, 'exam_name', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:53:43', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('77a50eef-ef45-43fd-b542-1e7d29349952', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '课程目标', 32, 1, 2000, 0, 'course_objectives', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:41:45', '2024-07-18 16:58:34', 2000, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('77aa186d-3c5b-4493-ab26-8d1315d67a0a', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '身份证UID', 4, 1, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:37:13', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('77de5797-abbd-4f10-b376-3b2a360db8c7', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '机号', 1, 1, 12, 0, 'j_h__NfWs', 'varchar', NULL, 1, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:54:20', '2024-07-26 10:01:10', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('78135969-0fae-4964-b99c-1da2f5389068', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '螺旋桨制造商', 19, 1, 40, 0, 'l_x_j_zh_z_sh__Dkrx', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:59:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('785c6f9c-2a36-499f-9f53-2fc26fb7a501', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '更新时间', 23, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:51:52', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('786b9cb0-45fd-4ca2-b168-2c03b0eb328d', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '时长', 3, 1, NULL, 0, 'duration', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:33:45', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('787b8d90-5cde-4753-abd3-057dcff16faa', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '教学时间', 35, 1, NULL, 0, 'j_x_sh_j__mpWn', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:13:22', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('78ef534c-7ee5-45f7-9948-48f67bc0a507', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '日期_2', 79, 1, NULL, 0, 'date_2', 'date', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('78fa7c8b-6f87-4f24-8e2d-d35f83271a32', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'engine', 0, '发动机照片', 0, 1, NULL, 0, 'engine_photo', 'file', 1, NULL, NULL, NULL, '[]', '\"5687\"', 'sysadmin', 'sysadmin', '2024-05-13 16:56:56', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('792f3f41-c1be-48a0-a5d2-ff974f70071a', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '地面时间_2', 35, 1, NULL, 0, 'ground_time_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7940af3c-cbbc-48c3-824f-b823110ec7aa', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '时间', 2, 1, NULL, 0, 'time', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 15:54:48', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('79a52fbd-9553-4259-b7ed-5fda097fdb37', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '机型', 2, 1, 36, 0, 'aircraft_type', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"aircraft_type\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-06-03 14:43:53', '2024-07-18 16:58:34', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('79a86ca0-f5db-40bc-9062-7d67d3cc65f3', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, '', 1, '基础信息', 0, 1, 50, 0, 'basic_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:01:02', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('79bddc50-e2d0-4edb-bb7f-ab5f3b94b66b', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '机身高度', 27, 1, NULL, 0, 'j_sh_g_d__tbCx', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:00:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('79beb400-cc53-44a7-a4ef-1dbc8dd6156d', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '国籍证号', 35, 1, 20, 0, 'g_j_zh_h__fPwx', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:55:42', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7a16a0e5-8182-4070-8100-74fd750605de', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '档案编号', 18, 1, NULL, 0, 'd__b_h__kcNH', 'int', 1, NULL, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:09:48', '2024-07-26 09:59:31', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('7a5c536f-953e-4e75-bec9-bbbc76f80344', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '更新时间', 13, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:28:36', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7a9ac1a9-49a9-4e0a-93ab-9b28b1a81249', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '单飞', 19, 1, NULL, 0, 'solo_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:27:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7aed8319-4460-42aa-9aa8-8d762833add6', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '剩余寿命', 7, 1, NULL, 0, 'sh_y_sh_m__eFTx', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:12:17', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7af287bc-3d8f-4cb7-980e-f6cf93ac51a7', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '简称', 5, 1, 48, 0, 'j_ch__sddz', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:45:30', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7b9dbd1a-46c2-40f7-aa0e-4806018e76ed', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '出生日期', 6, 1, NULL, 0, 'ch_sh_r_q__iWJm', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:02:28', '2024-07-18 16:58:34', NULL, NULL, 0, 1, 1);
INSERT INTO `column_manage` VALUES ('7b9ee1bf-f358-4fc6-a5f3-f14b556418dc', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '地面时间_4', 67, 1, NULL, 0, 'ground_time_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7b9fcf78-f88e-4ab3-a907-3d4c2c5f8e27', '27176200-dac2-469b-aa85-95ace5088a28', NULL, '', 0, '期班', 0, 1, 36, 0, 'class_name', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"q_b__RXcH\", \"tableCode\": \"b_q_d_j_b__wprd\"}]', 'null', 'sysadmin', NULL, '2024-07-11 18:02:15', '2024-07-25 14:51:39', 10, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7bac337e-e0a8-425d-a0b4-128513560ab0', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量左_1', 13, 1, NULL, 0, 'fuel_left_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7bd5300b-350a-4059-a4b7-5e30655142a8', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '显示', 3, 1, 60, 0, 'display', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:48:57', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7c0ab894-8468-44f4-8e89-dc458e9b30b5', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量左_3', 45, 1, NULL, 0, 'fuel_left_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7c474fc9-b563-46c1-8ff7-1a9af0705723', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教员检查', 23, 1, NULL, 0, 'coach_inspection', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:40:30', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7c54c4bd-835b-4d5e-a19c-21900a5d90ce', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '更新时间', 9, 1, NULL, 0, 'g_x_sh_j__HKyD', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:41:22', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7c58f096-f7c3-4931-9654-85c48de88d49', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '关车_2', 34, 1, NULL, 0, 'shutdown_2', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7d1985cc-d063-468b-ac91-69f0fe9aa0d1', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '机号', 0, 1, 36, 0, 'j_h__eiGx', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-09 16:09:36', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7dab4e09-97c6-4130-aa29-9fdbcb892937', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, '记事', 4, 1, 1000, 0, 'notes', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:41:06', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7dea9b37-c480-49b6-9815-43625d2b959f', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '类型', 4, 1, 36, 0, 'flight_evaluation_type', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"content\", \"tableCode\": \"flight_evaluation_type_dict\"}]', 'null', 'sysadmin', NULL, '2024-05-11 15:14:56', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7e2f9b52-2019-4337-b1f3-61ee55d7c41c', '5242000e-c725-41b1-8113-3a8e38a3e731', NULL, '', 0, '机号', 1, 1, 36, 0, 'aircraft_id', 'varchar', NULL, NULL, 1, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:20:25', '2024-07-18 16:58:34', 12, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7e48f5df-5e60-4445-9478-20dc960ce0ef', '1165e73e-61b7-49c2-8527-7e373ec01372', NULL, '', 0, '内容', 0, 1, 16, 0, 'n_r__iRnX', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:22:53', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7e9f2d66-6a6f-4150-849b-b3d327e78552', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '结业', 27, 1, NULL, 0, 'j_y__WSGd', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:16:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7eb86ad7-aec7-42b0-a447-c35b6a421208', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '备降场_1', 31, 1, 10, 0, 'alternate_airfield_1', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:02:04', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7ed43918-17f4-4cde-a9fc-1fadf38d480f', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, 'ATA3', 100, 1, 4, 0, 'ata_chapter_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7f30312d-85ad-49d1-9c7c-fda26e046717', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '开车_4', 63, 1, NULL, 0, 'start_engine_4', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7f44bb67-9eca-4778-bb67-4d8049e06f6b', '17097c4c-fb1a-44b2-823b-611ffc83926d', NULL, '', 0, '版本', 2, 1, 36, 0, 'version', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__eehB\", \"tableCode\": \"b_b_z_d__p_hs\"}]', 'null', 'sysadmin', NULL, '2024-05-11 11:25:14', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7f5e9ba8-eff7-448a-b471-810727727236', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '教学等级', 33, 1, 36, 0, 'j_x_d_j__CCDP', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TnZ_\", \"tableCode\": \"j_x_d_j_z_d__bfkk\"}]', 'null', 'sysadmin', NULL, '2024-05-06 16:07:17', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7f72ec68-7738-4af6-8594-6973be97c121', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '装上序号_1', 93, 1, 24, 0, 'installed_serial_number_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('7f7538b9-daab-442f-8928-537a7a9689c0', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '传真', 31, 1, 20, 0, 'ch_zh__nGaz', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:02:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7f86429a-c1bf-4a9a-8b75-8423274ca08c', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '发动机安装', 4, 1, NULL, 0, 'f_d_j__zh__C_Hy', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:52:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('7fda3cbd-63bf-4868-96e8-5e0614564ceb', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '全称', 2, 1, 40, 0, 'full_name', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 10:21:50', '2024-07-26 11:11:36', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('80718aec-e39e-4f17-9020-1fb3529064fe', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '作业', 28, 1, NULL, 0, 'mission', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:37:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('80b87702-b35c-41b5-80fe-69741fff0b32', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '航空器出厂序号', 14, 1, 20, 0, 'h_k_q_ch_ch_x_h__ZQPK', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:58:00', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('8158a19f-e6da-4bf3-bedd-ed2eeea6b010', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '备注', 37, 1, 20, 0, 'remark', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:05:14', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('81e1769a-2a01-4ae4-8222-f6811e34babc', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '邮编', 44, 1, 20, 0, 'y_b__GCjm', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:01:33', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('821b8eff-5d4f-4725-b825-ef70add50887', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '定检级别', 6, 1, 10, 0, 'inspection_level', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:13:20', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('821ceed8-97c2-4cd9-a2bf-30dbf870b64b', 'b9cc5b40-682a-46ee-91dd-0cb9d6e11b8f', NULL, '', 0, '内容', 0, 1, 10, 0, 'n_r__hfKH', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:19:29', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('823bdffd-c5ab-4212-a43e-a93e5c684dbb', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '更新时间', 32, 1, NULL, 0, 'g_x_sh_j__wmfZ', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:06:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('82527973-810b-4c08-a037-6a676248d256', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '装上序号_2', 99, 1, 24, 0, 'installed_serial_number_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('8281a6bd-5d1c-43ca-8290-0f6e1cb10d8b', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '地面时间_1', 19, 1, NULL, 0, 'ground_time_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('82ac1ad0-b3d2-4769-b6b9-59e3dd0b1265', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '备注', 5, 1, 64, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 10:23:46', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('82c7a808-ec27-4714-a2f1-24bd0f46bdd5', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '名称', 7, 1, 40, 0, 'course_name', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:11:43', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('82f5b1c4-905b-4da3-b2f3-a30de2f980f8', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '备注', 10, 1, 50, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:34:50', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8304e126-6a61-425e-bda3-19935f674835', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教学', 24, 1, NULL, 0, 'teaching', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:39:16', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('846e647b-8f4f-4570-b39b-583dd3087349', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '备降场_2资料', 34, 1, 100, 0, 'alternate_airfield_2_info', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:02:52', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('84c15857-0d60-475d-973c-344c675fae12', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '学位', 9, 1, 36, 0, 'x_w__KHzw', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__bNRd\", \"tableCode\": \"x_w_z_d__wafe\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:06:07', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('84f5b11c-5ac1-4d7a-a95b-1d63d430af06', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, 'EID', 0, 1, NULL, 0, 'EID', 'bigint', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:10:42', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('857848af-1efb-4208-a0f6-dc0f90b3ccaa', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '到达站_2', 28, 1, 10, 0, 'arrival_station_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('85b2d436-0f88-42e9-910e-70c4fdccd875', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'score', 0, '平均分', 6, 1, NULL, 0, 'average_score', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:13:05', '2024-07-18 16:58:34', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('85b5ecae-8e00-42c4-8b1d-0fc5ec4c988a', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, 'FID', 13, 2, NULL, 0, 'FID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 16:27:25', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('85c07d94-6c94-4698-9107-fe9605e647fc', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '计时', 25, 1, 10, 0, 'time', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:20:25', '2024-07-18 16:58:34', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('85f61e3f-cf65-4c63-82dc-5356cf44a5f1', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查单位', 2, 1, 100, 0, 'j_ch_d_w__iybK', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:59:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8648fe8b-9b8c-46a6-b905-6100fdfd0292', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '名称_3', 101, 1, 10, 0, 'item_name_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('869636aa-33ce-4169-b67b-d57c270857df', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '预警', 18, 1, NULL, 0, 'warning', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:49:43', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('86f0d43c-78ea-4e64-8841-0f3b52ecdd60', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '螺旋桨型号', 2, 1, 36, 0, 'airscrew_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"l_x_j_x_h__ewrn\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-09 09:36:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('86f718f4-5efb-4077-a0b0-cfe0d6003659', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '路径', 11, 1, 1024, 0, 'file_path', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:14:52', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('87878b16-5138-441e-8fbb-802771255215', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '发动机序号', 7, 1, 24, 0, 'f_d_j_x_h__JXaK', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:52:25', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('87a1166f-2853-4785-9320-a0908bc2a7ee', '9ef25a11-2eb7-458d-b100-8032a9aff2b2', NULL, '', 0, '内容', 0, 1, 4, 0, 'n_r__HeiS', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:19:51', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('87be8614-f67d-4754-9d58-179aa2b95c85', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, '学习内容', 5, 1, 50, 0, 'learning_content', 'varchar', 1, NULL, NULL, NULL, '[]', '\"自动填写打开的资源名称\"', 'sysadmin', NULL, '2024-05-14 15:45:29', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('87c4ea9b-baad-48f0-bae5-6a7a2513086f', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '夜视_4', 57, 1, NULL, 0, 'night_vision_4', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('87e96f28-40a0-4809-9f61-1a23695f4c18', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '更新时间', 16, 1, NULL, 0, 'g_x_sh_j__hpjA', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:25:50', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('87e98cd3-4c46-411e-806a-c2338a5cc9f6', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '后舱姓名', 20, 1, 10, 0, 'rear_cabin_name', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:50:36', '2024-07-18 16:58:34', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('87f22cdf-33dc-4108-9032-3c3fdf87f60c', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '任务机', 40, 1, NULL, 0, 'mission_aircraft', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:05:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('88251bcc-d4a5-4342-a9aa-5cac45a02e00', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '维修日期', 87, 1, NULL, 0, 'maintenance_date', 'date', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8833629d-1aec-49d9-8c4c-cfa2979e0720', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, '', 1, '档案信息', 17, 1, 50, 0, 'archival_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 10:02:18', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('88957e84-4bb4-40f1-8b9d-a676c98f95f1', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '是否重复', 8, 1, NULL, 0, 'repeat', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('88b9140a-693b-41e9-9636-f5d84eae46bf', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '航行速度', 7, 1, NULL, 0, 'flight_speed', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:15:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('88c7a0b2-7825-48b4-a38d-e48344de4415', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '空中时间_1', 20, 1, NULL, 0, 'flight_time_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('88f7bbd5-d778-496a-bbc4-fe1812d28c7f', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, '', 1, '飞行信息', 34, 1, 50, 0, 'flight_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 11:04:31', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('891571ff-5840-4d24-a116-9f9333b1cb2c', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '成绩', 5, 1, NULL, 0, 'score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:33:55', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8918a773-2b0d-45bf-8c20-64a8e419fff2', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '次数', 4, 1, NULL, 0, 'number_of_practices', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 15:55:45', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('89354fad-4fff-43ba-abfb-51592c60e069', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '使用时间', 5, 1, NULL, 0, 'operating_hours', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 17:12:38', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('89932f99-2b6b-4720-808f-d7c85064657b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '熟练', 15, 1, NULL, 0, 'proficiency', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:32:53', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8a2828d5-76d7-434a-8417-9561f28003da', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '改出段其它', 13, 1, 500, 0, 'recovery_segment_other', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:44:11', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8a484bba-f5a1-4478-bd97-9533e5d69167', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '绑定MAC', 12, 1, 64, 0, 'b_d_____fyaF', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:17:51', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8a7606a8-95d6-4565-9251-3d8411ffa064', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '启动数_4', 70, 1, NULL, 0, 'engine_starts_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8a96e3c0-fb8e-44e3-b21b-aa5889804b38', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '备注', 12, 1, 50, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:19:48', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8a9ad9ce-4787-4b1b-984b-980c4c4c0bdd', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, '政治面貌', 0, 1, 36, 0, 'zh_zh_m_m__AmCN', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TBmb\", \"tableCode\": \"zh_zh_m_m_z_d__errh\"}]', 'null', 'sysadmin', NULL, '2024-07-19 09:55:52', '2024-07-19 09:55:52', 4, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8ad20fcf-6626-4dd9-9864-beed40603745', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '后舱代号', 21, 1, 3, 0, 'rear_cabin_code', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:50:50', '2024-07-18 17:01:42', 3, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('8add98f7-9789-4086-b566-a82926d5bd4b', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '定检级别', 6, 1, 10, 0, 'inspection_level', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:13:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8ae85c87-1f6c-4bfe-88ab-89c9f6ce550d', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '填表人', 9, 1, 10, 0, 'reporter', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:45:42', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8af274cb-0dbe-4122-93e9-e0289e81e9d1', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '合计', 26, 1, NULL, 0, 'total_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:46:34', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8b0ff330-6679-4441-8d42-89be9f35c2de', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '游览', 27, 1, NULL, 0, 'sightseeing', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:38:42', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8b816c42-57be-4d90-ace1-60d1173bcaa2', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '相片', 20, 1, NULL, 0, 'x_p__TNCP', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:15:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8ba1e4a5-a62b-40db-89f3-9368ac0e0224', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 1, '发动机', 0, 1, 50, 0, 'engine', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-13 16:55:03', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8bbe74c6-2bd3-46a5-8ad9-6175c30b360c', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '机身长度', 25, 1, NULL, 0, 'j_sh_ch_d__wQiJ', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:00:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8be7bd43-af9a-4886-b266-857536a9e3ec', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, '', 1, '档案信息', 18, 1, 50, 0, 'archival_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 11:04:11', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8bebec37-e340-456d-98c2-581fbf9300a8', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '代字', 37, 1, 1, 0, 'd_z__zhpS', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 16:00:39', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8c4ff19d-6d69-4cac-ba7d-7cc9b24b233e', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, 'RID', 0, 2, NULL, 0, 'RID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-13 11:07:10', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('8c5331ec-bad7-4fe1-a676-24b2877d9909', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '期班', 28, 1, 100, 0, 'class', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:08:11', '2024-07-18 16:58:34', 100, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8c5b23e8-3c84-44d8-9bd7-31e62b43e793', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '塔台呼号', 41, 1, 8, 0, 'tower_callsign', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:06:06', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8c7dac86-f640-485a-8441-7e2a1ace3102', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '最大起飞重量', 23, 1, NULL, 0, 'z_d_q_f_zh_l__MDhh', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:00:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8d6fd20c-dfb0-42f5-97be-4466ae2792bc', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '飞机数量', 29, 1, NULL, 0, 'plane_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:23:16', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8d848f9b-1fa9-405b-8f34-b768cb023ef3', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'engine', 0, '发动机文件', 0, 1, NULL, 0, 'engine_pdf', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 16:58:07', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8dceb448-879e-495a-a902-4638d9b7a401', '338103bc-338e-41ff-9e70-5b5062d10443', NULL, '', 0, '名称', 0, 1, 40, 0, 'file_name', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-22 15:17:13', '2024-07-22 15:17:13', 40, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8dd2ede2-7b5f-4fc4-9cdb-f5bad25dfad0', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '适航证到期', 38, 1, NULL, 0, 'sh_h_zh_d_q__BFFi', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:57:04', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8debe0a5-6614-48e7-b0c3-f1972d8a8b48', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '性别', 3, 1, 36, 0, 'x_b__RDAd', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__CwNY\", \"tableCode\": \"x_b_z_d__xhaf\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:38:48', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8e122a78-816b-4ac4-8f44-690f21549b14', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '执照等级', 34, 1, 36, 0, 'zh_zh_d_j__tiYN', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hRpA\", \"tableCode\": \"zh_zh_d_j_z_d__emzc\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:08:32', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8e47d7bc-0d72-442e-8f9a-4734fda271c1', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, '着陆机场', 41, 1, 36, 0, 'landing_airport', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_ch__XrPy\", \"tableCode\": \"j_ch_x_x_d_j_b__rsqm\"}]', 'null', 'sysadmin', NULL, '2024-06-06 15:41:27', '2024-07-18 16:58:34', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8edcf9db-c28b-4d18-bedb-eac8e8f07492', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '当前状态', 17, 1, 36, 0, 'current_status', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__NpBj\", \"tableCode\": \"j_h_zh_t_z_d__pkfp\"}]', 'null', 'sysadmin', NULL, '2024-06-03 14:49:52', '2024-07-18 16:58:34', 4, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8f273487-3991-419b-b3a7-a82dbdc0f01c', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '机型', 0, 1, 36, 0, 'aircraft_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:23:32', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('8fd3bc4a-6dd4-4eae-8f61-15c67978ca34', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, 'UID', 1, 1, NULL, 0, 'UID', 'bigint', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:48:16', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('8ffa8225-0020-4789-a27d-734dcaee8079', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '邮编', 30, 1, 20, 0, 'y_b__GCjm', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:01:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('903fd64f-f400-44a4-b78d-e943b40e0f1a', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '改装', 16, 1, NULL, 0, 'conversion', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:33:14', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('90422572-d477-4d1c-b8a9-2be547a72cf3', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '着陆_1', 17, 1, NULL, 0, 'landing_1', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('908dda3c-eebb-4e1d-9400-080a25a6b98e', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '经度', 1, 1, NULL, 0, 'longitude', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:34:31', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('90aeb989-8145-4d95-93ba-061b8f92ec6e', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '访问', 14, 1, NULL, 0, 'visition', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:16:46', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('910f676b-9a72-42a3-819a-04d5071a7613', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '上级', 4, 1, 36, 0, 'sh_j__cKhQ', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"d_w__zxfQ\", \"tableCode\": \"d_w_d_j_b__dxfz\"}]', 'null', 'sysadmin', NULL, '2024-05-06 09:45:07', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9124da24-778a-494d-92e3-0cacc6d9641f', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '发动机型号', 2, 1, 24, 0, 'f_d_j_x_h__KiaX', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:52:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('914f49c8-f4a6-47cd-9a30-0b2f33ac70ce', '3c30575d-3685-4cff-92e5-1a5851b65493', NULL, '', 0, '名称', 0, 1, 16, 0, 'm_ch__wdrd', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 13:44:52', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('91a841ff-5650-40ae-ac41-39bb504d3821', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, 'FID', 25, 2, NULL, 0, 'FID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 15:52:44', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('9261d76a-650e-4c9f-aa98-03fbab96ea8a', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '前舱姓名', 18, 1, 10, 0, 'front_cabin_name', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:50:11', '2024-07-18 16:58:34', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9274745c-7b8f-43a5-abb1-ab848d8f9a15', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '改装', 30, 1, NULL, 0, 'conversion', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:37:16', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9299eb2c-459c-4f0a-8ba3-a64cccada464', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '作业', 18, 1, NULL, 0, 'mission', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:33:56', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('933b234a-324b-4fdf-b31c-5a535a6d3751', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '机场', 0, 1, 36, 0, 'airport', 'varchar', NULL, 1, 1, NULL, '[{\"tableCol\": \"j_ch__XrPy\", \"tableCode\": \"j_ch_x_x_d_j_b__rsqm\"}]', 'null', 'sysadmin', '', '2024-05-10 11:13:00', '2024-07-26 11:07:21', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('93887686-2380-4f12-ae6b-2204f97fa93c', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '拆下件号_2', 96, 1, 24, 0, 'removed_part_number_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('938c3205-cdc2-4a5b-a5a3-3f78358c10c2', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '目视_3', 40, 1, NULL, 0, 'visual_3', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('93c6c1e5-02a6-4d53-8008-666f040b7738', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'info', 0, '家庭地址', 0, 1, 10, 0, 'address', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-20 10:43:16', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('93df9f5d-7b4c-4b90-b223-2c2a8ab10691', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'info', 0, '手机号', 0, 1, 20, 0, 'phone', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 17:27:18', '2024-07-26 10:01:05', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('94540ce8-1492-424f-8948-5cd62208589b', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 2', 19, 2, 36, 0, 'course_2', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:14:40', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9454a9e8-e687-40d0-8655-f89470deed10', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'engine', 0, '发动机位置', 0, 1, 36, 0, 'engine_position', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', NULL, '2024-06-24 14:27:50', '2024-07-18 16:58:34', 20, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('94e1c492-10db-4b5c-8a8e-2280173e39f0', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '毕业年月', 23, 1, NULL, 0, 'b_y_n_y__CQ_P', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:42:33', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('950dc14e-cd4e-4ce5-96d6-e0b221532a01', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '宽度', 12, 1, NULL, 0, 'width', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:56:04', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('95592388-b830-4362-aae6-5a1ac2d3bec9', '27176200-dac2-469b-aa85-95ace5088a28', NULL, NULL, 1, '分值', 3, 1, NULL, 0, 'score', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', NULL, NULL, '2024-07-11 18:09:50', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('95651ad3-d02e-4a19-98d9-66141d45a03e', 'b3753460-89a3-4dff-8008-1a6ad1c40d1c', NULL, '', 0, 'AID', 0, 2, NULL, 0, 'AID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 11:42:09', '2024-07-22 11:11:44', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('968cba5f-1316-4fec-be82-ae80b21380e6', '338103bc-338e-41ff-9e70-5b5062d10443', NULL, '', 0, '资源', 1, 1, 36, 0, 'resource', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-22 15:21:36', '2024-07-22 15:21:45', 36, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('974099ce-78f3-40bc-89ab-6732718ea6ea', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '学生答案', 4, 1, NULL, 0, 'solution', 'text', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:21:51', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('975687b2-1410-495d-815c-0fd7245f066c', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '扩展名', 10, 1, 10, 0, 'extension', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:13:39', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('976a32a9-06cb-4880-af00-dd406555046e', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 3', 21, 2, 36, 0, 'course_3', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:20:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('97ca202c-d9b5-4f90-bdfd-394f16ad2313', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '拆下件号_1', 90, 1, 24, 0, 'removed_part_number_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('98b05f1e-d265-46cd-b8a4-f184212de479', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '课程', 4, 1, 36, 0, 'course', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-13 11:09:35', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('98c4e6ea-7656-43e1-bd97-68eb46f8831d', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '附件', 20, 1, NULL, 0, 'f_j__PcTa', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:15:03', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9902db9b-abb7-4bdb-8444-c8dda11e30ca', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '党团日期', 14, 1, NULL, 0, 'd_t_r_q__dwJr', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:17:23', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('99618039-2b02-486b-8f53-426a6d6a62d5', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '问答题数', 45, 2, NULL, 0, 'short_answer_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:35:34', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9963e11b-97a9-42a8-9bf2-aec02cc69978', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '绑定MAC', 28, 1, 64, 0, 'b_d_____dQKK', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:25:36', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('99a04437-148e-4d94-9464-0fa8c291fec0', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '单位', 1, 1, 100, 0, 'department', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:59:57', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('99e7c767-2647-4cd5-a886-56946a96f1ec', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '描述', 5, 1, 200, 0, 'description', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9a14becf-b3cd-4d48-9dbf-27df030e3a6c', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '维修工作记录', 84, 1, 8000, 0, 'maintenance_record', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9a281531-78b0-4d44-b618-26c119029cb9', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '姓名', 2, 1, 10, 0, 'x_m__GKrG', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:31:45', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9bc8ebac-2715-4963-88d8-08ddf3f8f46c', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '更新时间', 31, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:24:07', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9bcc8c4c-7bfb-4043-bb6d-defe8f5f6ed9', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 2', 20, 2, NULL, 0, 'ratio_2', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:17:53', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9c089015-d0dd-4516-8811-361ed9f43652', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '记事', 10, 1, 1000, 0, 'notes', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:26:27', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9c30294f-66ab-4d36-b5d3-78d26606018d', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, 'UID', 14, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-10 09:37:00', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('9c3c5448-58ac-4c77-abe4-aee615942689', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '开飞', 8, 1, NULL, 0, 'takeoff', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:51:39', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9c44d20c-2f3a-40b7-8c8e-e5d1be9722f0', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '副指_2', 22, 1, 36, 0, 'deputy_director_2', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"x_m__QYBH\", \"tableCode\": \"j_y_x_x_b__etdf\"}]', 'null', 'sysadmin', NULL, '2024-05-11 17:00:33', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9c4edf8b-7992-4f74-9bf1-b05541894b56', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '位置', 1, 1, 36, 0, 'engine_position', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9c767adb-f195-4130-9dbf-22ef48fdd1f1', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '发动机型号', 2, 1, 36, 0, 'engine_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"f_d_j_x_h__KiaX\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-08 17:10:59', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9c9786ad-6ad4-4eec-98be-0225791bb153', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '体检单位', 2, 1, 100, 0, 't_j_d_w__NSDk', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:36:06', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9cbfdedd-919d-4e45-b761-2f35850cc7cc', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, 'UID', 0, 1, NULL, 0, 'UID', 'bigint', NULL, 1, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:58:35', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('9cf03fd9-0fb2-4895-a3e3-9399a470ae67', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, 'ATA2', 94, 1, 4, 0, 'ata_chapter_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9d72963e-f972-41cc-9d28-9f064173addd', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '课目', 2, 1, 36, 0, 'course_nacourse_name', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"subject\", \"tableCode\": \"flight_subject_details\"}]', 'null', 'sysadmin', NULL, '2024-07-01 10:29:39', '2024-07-18 16:58:34', 20, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9dc42c57-e03e-410d-ac26-31fdf772fa68', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '练习号SID', 1, 1, NULL, 0, 'SID', 'varchar', NULL, NULL, 1, NULL, '[{\"tableCol\": \"SID\", \"tableCode\": \"flight_subject_details\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:23:18', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('9dfc52ed-3d0b-41c1-a6e2-cfe936c17581', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教员人数', 32, 1, NULL, 0, 'coach', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:18:19', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9e0cc32a-ad12-4b85-b3ed-b6f4b0f12fd4', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '跑道厚度', 5, 1, NULL, 0, 'runaway_thickness', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:37:29', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9e826172-0cbe-458f-86c6-2f3dde648fc1', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '空中时间_2', 36, 1, NULL, 0, 'flight_time_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9ec9a51f-9ef5-41f1-b03e-74f7a3e166f4', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 7', 30, 2, NULL, 0, 'ratio_7', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:26:05', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9f670de0-8af1-4482-9825-b9cded27c384', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '占场', 33, 1, NULL, 0, 'occupation_time', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:17:06', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9f727eeb-271d-4983-8af5-e87633e993d0', '63682de3-546e-4b4e-86a9-7df3e29b2cee', NULL, '', 0, '内容', 0, 1, 4, 0, 'n_r__TBmb', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:18:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9f96329c-c71d-4028-95d0-ea2272af6f4d', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '开车', 7, 1, NULL, 0, 'engine_start', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:46:36', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9fa5ead6-c580-4b22-9f90-57f8e0225ca1', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '开车_3', 47, 1, NULL, 0, 'start_engine_3', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('9fcc3013-faa4-4c2f-a057-c8d7cb64542b', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '序号', 0, 1, NULL, 0, 'sequence_number', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:14:55', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a0c9ad95-c75b-4d4a-b919-f272d18ee587', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, 'TID', 0, 2, NULL, 0, 'TID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 14:42:21', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a0d122d8-b774-4300-9f64-6103c912b091', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '得分', 6, 1, NULL, 0, 'mark', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:22:35', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a0deda72-cf29-4ad3-907b-d7317082d881', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '排序', 1, 1, NULL, 0, 'p_x__Gdba', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:17:36', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a0e543b4-17cd-4f32-8907-ab6adeb39f7e', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'percentage', 0, '良好', 9, 1, NULL, 0, 'good_percentage', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:15:23', '2024-07-18 16:58:34', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a105f4c0-3321-467c-9b5f-f4d57ad561bf', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '简称', 3, 1, 10, 0, 'short_name', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 10:22:25', '2024-07-26 11:11:51', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a12df70f-1b6d-46b8-bba2-fc72151cc2b7', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '飞行人数', 15, 1, NULL, 0, 'number_of_flyers', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:48:49', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a13b1896-cae6-48ff-9530-387232983c23', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, '学习时长', 4, 1, NULL, 0, 'keep_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:46:30', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a14fe6b2-1e04-450c-ba80-24557bcdaad5', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '日出', 16, 1, NULL, 0, 'sunrise', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:56:53', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a1b22588-82ea-4d48-9d75-f633af77ff3c', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '预警次数', 9, 1, NULL, 0, 'warning_count', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:26:29', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a1c70dac-8561-4397-84a1-be8104ec4689', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '期', 3, 1, NULL, 0, 'q__RXym', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:50:10', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a1e3c501-7dd7-42ea-9511-e6ca5f9c7027', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '备降场_1资料', 32, 1, 100, 0, 'alternate_airfield_1_info', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:02:39', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a1f9d9ea-fbae-46dc-991f-f77a1afc3a30', '2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', NULL, '', 0, '位置', 1, 1, 36, 0, 'engine_position', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', NULL, '2024-05-09 09:34:31', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a2164d1a-549f-46a1-8828-e36a4186d1b0', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '游览', 21, 1, NULL, 0, 'sightseeing', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:34:58', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a2a43a5e-94c6-48df-9a8f-f61ebd0364e0', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '日期_1', 75, 1, NULL, 0, 'date_1', 'date', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a2d0aaf5-aefe-494a-ba1e-7f790d99f5c0', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '籍贯', 7, 1, 16, 0, 'j_g__KasG', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:05:16', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a32fba5b-cbe9-4391-80fc-f0d2c06364ad', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '添加滑油', 5, 1, NULL, 0, 'add_lubricant', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a3d4c8b2-1ef9-4add-a351-0126447c95b5', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '卷号', 3, 1, NULL, 0, 'paper_serial', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:15:08', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a4098978-96b8-4984-b21f-ab126c698d31', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '改出段速度', 12, 1, NULL, 0, 'recovery_segment_speed', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:43:57', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a41e49dd-0df9-4b3e-8f60-281e80aa3e10', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 9', 34, 2, NULL, 0, 'ratio_9', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:26:35', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a4b6d00d-36f8-4243-96a9-194bc7efeb9e', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查合格', 7, 1, NULL, 0, 'j_ch_h_g__zYZc', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:08:39', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a4d962d9-2241-4013-86e9-ba41cdd1f090', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '检查者', 109, 1, 10, 0, 'inspector', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a54dcbb6-dc5e-4a8c-9657-97fc143184a2', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '传真', 45, 1, 20, 0, 'ch_zh__nGaz', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:02:23', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a580e116-f10d-4b8e-8148-19df75d6ee43', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '架次', 34, 1, NULL, 0, 'total_flight_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:24:48', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a5d5e245-053a-4f3e-b0aa-2b38b422d638', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '带飞', 17, 1, NULL, 0, 'dual_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:26:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a5fb0340-e99e-4615-88bd-90134707a79b', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '发动机制造商', 18, 1, 40, 0, 'f_d_j_zh_z_sh__PaYR', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:59:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a62a0227-b7ed-487e-9d6d-d3c2fbc1040b', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '计划PID', 0, 1, 36, 0, 'PID', 'varchar', NULL, 1, 1, NULL, '[{\"tableCol\": \"PID\", \"tableCode\": \"flight_plan_base\"}]', 'null', 'sysadmin', NULL, '2024-06-03 15:52:38', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a63505f0-8245-47fd-b5df-49aec0a9c922', 'fb480f23-2098-4ae5-8a19-1fff88c59536', NULL, '', 0, '内容', 0, 1, 10, 0, 'n_r__TnZ_', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:20:43', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a6d956ab-5a17-41e7-8853-9d3e344506f9', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '螺旋桨序号', 7, 1, 24, 0, 'l_x_j_x_h__BEbc', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:53:00', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a7047677-5107-43af-848a-46cce1ebb269', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '合计时间_1', 21, 1, NULL, 0, 'total_time_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a706eeec-2455-4880-aded-288dd22e793d', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '学历', 8, 1, 36, 0, 'x_l___Dsa', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__HeiS\", \"tableCode\": \"x_l_z_d__hcyh\"}]', 'null', 'sysadmin', NULL, '2024-05-08 10:18:58', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a71420ac-1a5f-468b-be35-24bff9addf75', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '学历', 8, 1, 36, 0, 'x_l__ShYT', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__HeiS\", \"tableCode\": \"x_l_z_d__hcyh\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:05:44', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a739024d-7c4c-4ac1-acd5-fd84ee739f40', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '纵位置', 4, 1, NULL, 0, 'longitudinal_position', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:44:31', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a74577bb-eb16-44a2-b0c2-d3f90acf3b93', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '着陆_3', 49, 1, NULL, 0, 'landing_3', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a77fa45b-ddf5-4424-9b29-5d8bd95991aa', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '超限次数', 10, 1, NULL, 0, 'exceed_limit_count', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:26:07', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a88415dc-fb3c-41a6-9c0b-b62253b6dcda', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '判卷人', 13, 1, 200, 0, 'judge', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:08:14', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a8b6a5ad-3ff9-4584-af8e-0aa2843b7d44', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, '', 1, '档案信息', 17, 1, 50, 0, 'archival_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 11:18:40', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a8e1000a-207e-4766-b527-44aa88799fad', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, 'UID', 2, 1, 36, 0, 'UID', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:38:47', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a9027e49-dfd4-4731-8976-fb1f148411ea', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '着陆雷达型号', 12, 1, 48, 0, 'landing_radar_model', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:41:20', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a90cac24-2ec3-4521-b113-b704b10704ec', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '日期', 4, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:12:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a95afd92-0ede-4a3f-a937-e13bea1a90b0', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__QMnx', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:10:51', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('a97f62ff-b11b-4154-812a-55ef6f0d16a7', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '目视_2', 24, 1, NULL, 0, 'visual_2', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a98a546c-3fdd-4d7c-8f1c-0833063f9ae0', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '结束', 14, 1, NULL, 0, 'end', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:08:44', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a9ed165d-4353-47d2-8963-81cea809ce9a', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '航空器空重', 40, 1, NULL, 0, 'h_k_q_k_zh__zPZS', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:59:34', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('a9f54396-2900-4ac4-b6c8-2f3709d3f3f5', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '备降场', 0, 1, 10, 0, 'b_j_ch__Gtte', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:11:16', '2024-07-26 11:11:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('aa0f571b-6be7-4d50-b818-c8d8bd7df5f8', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '地址', 28, 1, 80, 0, 'd_zh__BPaW', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:01:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('aa3a451a-a95b-4837-899f-2d9432dd6949', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '来源', 11, 1, 100, 0, 'l_y__rpwj', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:36:50', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('aab5790a-89c3-4ae3-bfd1-9b5d5070d568', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '任务', 36, 1, NULL, 0, 'task', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:38:27', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('aac6a676-6021-4f0a-8d89-358bbab4e5cc', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '制定', 6, 1, NULL, 0, 'formulate', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:51:22', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('aafa72b0-42f6-4822-9c2b-9963cada2d4c', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '课程', 5, 1, 36, 0, 'course', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-13 11:25:43', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ab0c3bf0-dd04-4038-8750-83aac54d8bba', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '曾飞机型', 40, 1, 36, 0, 'c_f_j_x__PEBF', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:43:17', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ab0f5900-206b-470a-93b2-4a5a2c0815a9', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '良好上限', 8, 1, NULL, 0, 'rating_good_upper', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:18:30', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ab290a38-b06f-449e-9da8-a8ea33839fc8', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '判卷时间', 10, 1, NULL, 0, 'judge_datetime', 'datetime', 1, NULL, NULL, NULL, '[]', '\"人工判卷时，自动记录判卷时刻\"', 'sysadmin', NULL, '2024-05-14 16:16:15', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ab4e1701-cf87-41c9-a647-a9549401497c', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '最大加油量', 41, 1, NULL, 0, 'z_d_j_y_l__fmpD', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:59:55', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('aba9caed-df5f-4761-89c3-4dbdc663fa4e', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '航站', 8, 1, 10, 0, 'h_zh__zDNj', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:12:36', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('abcfb3e6-616b-4b29-88a1-d6d5dfca6a51', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '代号', 38, 1, 8, 0, 'd_h__THr_', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 16:00:58', '2024-07-18 17:01:42', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('abe81625-ceed-4e5c-a875-7ccae0d3cd04', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '单选题数', 37, 2, NULL, 0, 'single_choice_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:32:05', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ac15c1f5-274a-4360-b90d-e3e751ba7883', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '适航证号', 4, 1, 20, 0, 'sh_h_zh_h__eNnT', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:18:39', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ac1a9c19-3816-4316-9f6a-b449c3fb4c28', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '跑道宽度', 6, 1, NULL, 0, 'runaway_width', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:36:47', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('acc131dc-e857-47e3-aaf2-4f3d37ca5c9e', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '螺旋桨寿命', 10, 1, NULL, 0, 'l_x_j_sh_m__EMb_', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:54:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ad003efd-2b24-4e42-a9a4-be680220edb2', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '飞行时间', 7, 1, NULL, 0, 'flight_hours', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ad01158f-fa9d-40b0-82a7-6aa3f119dab6', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '时长', 22, 1, NULL, 0, 'duration', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:51:46', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ad431a30-c8ad-48bd-a0c3-9183a94e9947', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '停车', 9, 1, NULL, 0, 'parking', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:47:07', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ae6e72d0-680d-4832-973b-f1fefb59fbc1', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '试飞', 37, 1, NULL, 0, 'test_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:37:35', '2024-07-18 16:58:34', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('af1a3804-5e27-4a9c-80ce-ebeb710eac42', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '变化量速度', 16, 1, NULL, 0, 'speed_change', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:44:52', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('af3e944e-6083-4970-82c2-57e8bce04c9b', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '机身长度', 42, 1, NULL, 0, 'j_sh_ch_d__wQiJ', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:00:36', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('afb0cb78-a487-4379-87f3-18c7c3638e0f', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '检查航站', 112, 1, 10, 0, 'inspection_station', 'varchar', NULL, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b02bfc9b-a596-41e2-be4b-d1def3ebdee8', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '日没', 17, 1, NULL, 0, 'sunset', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:57:04', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b05454f4-3928-4a4c-a849-9ab60bb03428', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '更新时间', 33, 1, NULL, 1, 'g_x_sh_j__wmfZ', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:06:00', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b05b3de0-79e6-42ee-aa3a-b05a98f3ab9c', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '现飞时间', 43, 1, NULL, 0, 'x_f_sh_j___tyn', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:12:56', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b0654801-8138-4278-9ceb-544f4f46d655', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '更新时间', 7, 1, NULL, 0, 'g_x_sh_j__FAWj', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:51:12', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b08b2b46-ba8a-4a96-be4f-76b11b433fce', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '备降场_2', 33, 1, 10, 0, 'alternate_airfield_2', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:02:16', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b0ace2be-ed7b-4614-890b-47ff8b6ffe57', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '报告人_1', 73, 1, 10, 0, 'reporter_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b0c6afc6-2f10-494e-a379-9ff6cfb16f87', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '呼号', 37, 1, 20, 0, 'h_h__cJWN', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:38:21', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b0e9654b-8ded-425d-afe5-4f38d3dcfa73', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '螺旋桨型号', 13, 1, 24, 0, 'l_x_j_x_h__ewrn', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:54:02', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b11f06ad-718a-4512-a4a3-70c8f7efb889', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '体检合格', 6, 1, NULL, 0, 't_j_h_g__Kjzz', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:40:25', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b127ed6c-ca85-49cb-a0fe-004ccf1b4edc', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '测试1', 0, 1, 36, 1, 'c_sh___emkD', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__bbHC\", \"tableCode\": \"flight_program\"}]', 'null', 'sysadmin', NULL, '2024-05-08 14:03:06', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b1472614-bbf5-4671-aabc-4d114d1eba9a', '0d8baab6-efe9-4029-969e-55efcfacfd33', NULL, '', 0, '正确', 7, 1, NULL, 0, 'correct', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:23:10', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b15f7266-c058-43c8-94a6-a0d6afc39aba', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '机场', 14, 1, 10, 0, 'airport', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:56:35', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b19504da-234e-4562-9c1d-8ef065ffd140', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '发动机制造商', 44, 1, 40, 0, 'f_d_j_zh_z_sh__PaYR', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:59:09', '2024-07-18 16:58:34', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b1ba47f5-e411-4347-92c9-49ff43801332', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '最大加油量', 22, 1, NULL, 0, 'z_d_j_y_l__fmpD', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:59:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b1f5bbda-f039-4ebd-89a4-1f897086f919', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '夜间', 10, 1, NULL, 0, 'night_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:28:28', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b2258037-bca0-4530-aeb0-64cf693d918b', 'e942f067-62a7-4fec-979e-90f57e5f4912', NULL, '', 0, '备注', 6, 1, 64, 0, 'b_zh__JTHX', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:45:48', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b25d2f08-1cb0-46f0-bd00-5b6b5b376961', '5242000e-c725-41b1-8113-3a8e38a3e731', NULL, '', 0, '时间', 3, 1, NULL, 0, 'time', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:21:16', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b3101acb-307d-43b0-a0ac-a73f5a1d8d0d', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '着陆次数', 38, 1, NULL, 0, 'landing_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:16:34', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b3bafe1e-d2c0-4b09-a9a2-84253d4897ec', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '计时员_2', 36, 1, 10, 0, 'timer_2', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:04:55', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b3d64cfe-f1b0-4957-8814-03b59b3e8a32', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '空域顶点', 0, 1, 400, 0, 'k_y_d_d__zptz', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:48:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b46ca810-9ce9-4bee-aa83-451cd122f1be', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '航站_3', 82, 1, 10, 0, 'station_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b497f0e2-15ac-403c-a533-5de02fcf0a50', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '呼号', 39, 1, 20, 0, 'h_h__RGPN', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 16:01:22', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b586f708-48f8-481a-8226-0fef1c7fef54', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 5', 25, 2, 36, 0, 'course_5', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:22:14', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b59ed4f0-051a-45b3-b2a1-28a1b1dcb44f', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'flight_information', 0, '曾飞等级', 42, 1, 36, 0, 'c_f_d_j__BXJb', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r___jQp\", \"tableCode\": \"f_x_d_j_z_d__nmta\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:12:15', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b59fcefb-e333-49de-ab0b-e01fb5441b37', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, '教员检查', 35, 1, NULL, 0, 'coach_inspection', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-21 09:47:26', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b65ec698-3da8-4dda-9495-be62910f9bc2', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'percentage', 0, '优秀', 8, 1, NULL, 0, 'ideal_percentage', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-07-11 18:14:42', '2024-07-18 16:58:35', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b70c40ea-9fe8-431a-aac9-3bcd173ee4c7', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '电台证到期', 9, 1, NULL, 0, 'd_t_zh_d_q__HAGx', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:20:15', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b761935f-d2ee-447b-9324-3e8841b6530d', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, '实到人数', 3, 1, NULL, 0, 'students_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:39:46', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b8155463-6296-4ce2-8950-68d4c62f367c', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '判卷人', 9, 1, 10, 0, 'judge', 'varchar', 1, NULL, NULL, NULL, '[]', '\"人工判卷时，自动记录判卷人用户名\"', 'sysadmin', NULL, '2024-05-14 16:15:51', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b8fe3ea1-9bd9-42cd-b406-acc0b887b548', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '仪表_4', 58, 1, NULL, 0, 'instrument_4', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b921fc9a-d265-49aa-92bd-823df98806c0', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '夜间', 11, 1, NULL, 0, 'night_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:35:27', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b93343f7-8235-4763-b535-044740b1c250', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '教学', 32, 1, NULL, 0, 'teaching', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:39:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b953ac00-c491-45a8-9e3c-52e6421d2049', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 1', 18, 2, NULL, 0, 'ratio_1', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:11:08', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b954e059-7e19-4eb3-a966-0692be351401', '46f479de-4c23-48c1-a374-88e715539a0e', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__nStS', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:26:47', '2024-07-18 17:00:58', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('b96f108a-5c91-4f8a-94e5-ece776f996c5', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '编号', 0, 1, NULL, 0, 'serial_number', 'int', NULL, 1, 1, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-26 10:02:07', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('b9930a0e-6fca-42a0-ba10-fdd7fc53d733', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '备注', 8, 1, 64, 0, 'b_zh__ccxR', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:41:05', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b9ab0f3d-05cb-42e1-8d33-3f170f5ef2a9', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '考试时长', 2, 1, NULL, 0, 'total_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:58:16', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b9baaf5f-949a-464b-8518-e248ee93ccc8', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '飞行时间', 7, 1, NULL, 0, 'flight_hours', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b9de6053-940f-46d9-bd08-236b5fc96cb8', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '学时', 4, 1, NULL, 0, 'class_hour', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 10:23:14', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b9e71222-cd33-4a37-8ec6-4422c4cea24a', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '机长', 6, 1, 10, 0, 'captain', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('b9ea4a9b-fb4d-4583-80a5-60d04e00ef12', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '发动机型号', 2, 1, 36, 0, 'engine_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"f_d_j_x_h__KiaX\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ba133665-1665-4679-8ec7-3cb4ce600fe3', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '保持段其它', 9, 1, 500, 0, 'maintain_segment_other', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:42:24', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ba2a5e7e-7152-4349-addf-1ca7ef238f07', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, 'PIID', 13, 2, NULL, 0, 'PIID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:18:22', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('ba591ccf-a135-41b1-9766-706450b13eff', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '航空器交付日期', 45, 1, NULL, 0, 'h_k_q_j_f_r_q__BTSK', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:58:54', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ba8f5d27-2cbe-4ce3-9a5f-eb5fd2964418', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '计时员_1', 35, 1, 10, 0, 'timer_1', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:04:43', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ba9d2f3b-0c2d-4f61-a99d-4835277c530b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '昼间', 23, 1, NULL, 0, 'daylight', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:35:41', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bacb0bc6-5980-4690-9127-c8d276135a1d', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '位置', 1, 1, 36, 0, 'engine_position', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"w_zh__MCQX\", \"tableCode\": \"engine_position_dict\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('badc4d5e-d184-452c-a0ad-a8e27ecf5b8a', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '教室', 7, 1, 10, 0, 'classroom', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:23:37', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bafe9759-1705-48af-badf-11adcf0da7e9', '8594aca6-05dd-48e7-b1f4-02c76ca75519', NULL, '', 0, '资料', 0, 1, NULL, 0, 'z_l___xMr', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 17:23:03', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bb33b0e3-c64a-4c41-b0b8-923dc169e7a8', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '改出段成绩', 14, 1, NULL, 0, 'recovery_segment_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:44:23', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bb5aa4fe-35c1-482f-aed1-67d55f4283c6', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '机场', 39, 1, 10, 0, 'airport', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:14:01', '2024-07-18 16:58:35', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bb68b16d-69c2-456a-b915-032c4af147ee', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '场次', 35, 1, NULL, 0, 'flight_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:21:46', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bc407ed2-8045-4b69-9214-7cc15aa9fe86', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '发动机序号', 3, 1, 36, 0, 'engine_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"f_d_j_x_h__JXaK\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-09 09:37:02', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('bc52068a-ce25-4598-8da2-6ea95e527aa2', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '近台2距离', 10, 1, NULL, 0, 'j_t__j_l__T_wN', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:38:49', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bc76ec44-b01f-495a-bd74-5e2cbd1ed514', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '装上件号_3', 104, 1, 24, 0, 'installed_part_number_3', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bcb1d5e9-a3fa-44a5-a779-d4430ab13098', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '翼展', 46, 1, NULL, 0, 'y_zh__FThj', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:00:45', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bcca4bc1-adef-48f9-8807-c02fbfe0b2b7', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '更新时间', 10, 1, NULL, 0, 'g_x_sh_j__BCFW', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:13:21', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bcfc4879-f63d-4c95-8793-43385fc22016', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '任务', 7, 1, 200, 0, 'mission', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:18:29', '2024-07-18 16:58:35', 199, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bd8cee03-bc96-4cb3-90c9-fbfdbaf93031', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '间隔小时数', 3, 1, NULL, 0, 'j_g_x_sh_sh__tnMf', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:11:17', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bdba8de9-5218-4c29-bd13-9fbe4fb09040', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '组织单位', 5, 1, 100, 0, 'department', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:52:45', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bdec3cff-edaa-4ce3-aed9-f3d4384b5dcf', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '学员平均', 40, 1, NULL, 0, 'student_average', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:21:56', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bdf2aff6-c014-4df6-b965-136fcb83e35c', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '开车', 3, 1, NULL, 0, 'engine_start', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:14:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('be6934c3-fd58-4903-9e11-21d3bf1c977a', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '检查员', 3, 1, 10, 0, 'j_ch_y__Ydti', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:00:28', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bea24068-7cf9-45f5-8288-83bf314cbf6b', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '基地', 0, 1, 36, 0, 'j_d__YNbE', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"d_w__zxfQ\", \"tableCode\": \"d_w_d_j_b__dxfz\"}]', 'null', 'sysadmin', NULL, '2024-05-06 09:49:47', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('beee5bf1-035e-4a28-97b5-0585418dbf7c', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'info', 0, '人名', 0, 1, 10, 0, 'person_name', 'varchar', 1, NULL, 0, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 16:56:03', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bf13c759-9a39-45cc-bbf9-1b0f35d62d22', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'job_information', 0, '入职年月', 32, 1, NULL, 0, 'r_zh_n_y__yrpR', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:08:53', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bf1d9262-b8fa-4afc-bcda-bf00cc32a14a', '528bb1bd-8984-459c-b5f5-4ad93c5ec91b', NULL, '', 0, '内容', 0, 1, 19, 0, 'content', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:04:31', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('bf6b6583-82da-47fa-99bc-dc0072a1855b', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '问答分值', 46, 2, NULL, 0, 'short_answer_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:36:06', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c0291f01-403a-49e4-b579-0d5d99f9d3a4', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '翼展', 26, 1, NULL, 0, 'y_zh__FThj', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:00:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c0b31982-8cc4-40c6-8488-5ffddbe6c703', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '压座', 41, 1, NULL, 0, 'ballasting', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:45:56', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c0e0b9ef-9b90-4d88-a2af-11a44df32ac1', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '航空器出厂日期', 47, 1, NULL, 0, 'h_k_q_ch_ch_r_q__CAAi', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:58:25', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c0f0967e-5fb4-44ea-9ab6-645cf720b73f', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '权限', 13, 1, 36, 0, 'authority', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__pNtn\", \"tableCode\": \"q_x_z_d__ratj\"}]', 'null', 'sysadmin', NULL, '2024-05-13 11:16:04', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c1245cf8-4af0-47e5-add9-3e7737622708', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '通信', 29, 1, 20, 0, 't_x__nNHM', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 15:01:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c12adcd3-251c-4074-bf46-a7b2e5c93b4c', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '备注', 11, 1, 64, 0, 'b_zh__EJ_W', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:20:49', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c1c4578e-b18c-42e4-aacd-69e5429e229d', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '政治面貌', 11, 1, 36, 0, 'zh_zh_m_m__eZs_', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TBmb\", \"tableCode\": \"zh_zh_m_m_z_d__errh\"}]', 'null', 'sysadmin', NULL, '2024-05-08 10:17:07', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c27212f3-a634-4469-a624-b3b5b26aaf4a', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '课程 9', 33, 2, 36, 0, 'course_9', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"full_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 15:24:03', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c2984643-5c15-4f7f-8c22-17388742a5c5', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '机型', 0, 1, 36, 1, 'aircraft_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-11 16:32:10', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c2c35f3b-bc2c-4bae-a313-8372f0d40ff6', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '航点', 0, 1, 20, 0, 'waypoint', 'varchar', NULL, NULL, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:15:35', '2024-07-26 11:12:05', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('c2dc3a0c-436f-496d-afb8-0d92daab20dd', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '开飞', 42, 1, NULL, 0, 'takeoff', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:14:59', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c370c721-2cf2-4395-a237-a622f33f6f24', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '备注', 13, 1, 64, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:35:09', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c3bff2c9-9b11-41fa-b5e7-455512a09397', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '填空题数', 41, 2, NULL, 0, 'fill_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:34:54', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c3d068ee-ce1e-49e1-aa6d-aacc9b492fad', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '授课人', 8, 1, 40, 0, 'teacher', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:24:07', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c3ec93d8-917a-4df3-bfbf-686593b46364', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '学员时间', 43, 1, NULL, 0, 'student_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:20:57', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c488ccda-a24f-4193-a71a-63879c237416', 'e9912b94-4b8b-4830-bdcb-5790a5e015d7', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__pQZW', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:23:48', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c4fb801d-a5ab-4e99-90b2-6adf1a1bb604', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '来源', 12, 1, 64, 0, 'source', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:15:20', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c54fea12-a590-4802-82a1-e206884c1732', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '检查日期', 4, 1, NULL, 0, 'j_ch_r_q__saAX', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:11:43', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c5827f8e-912a-470c-8f7a-55d970e8b6cb', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '其它', 22, 1, NULL, 0, 'other_info', 'text', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:51:28', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c586ce05-08ab-4ab6-aa30-f2215dc5ddf5', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '更新时间', 12, 1, NULL, 0, 'g_x_sh_j__bCGH', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:21:07', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c59e8369-31f9-45eb-a553-ccf6f73a335f', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '代字', 35, 1, 1, 0, 'd_z__dPPy', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:37:55', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c5af3cad-2ee6-48b0-b3af-8e599e7fe746', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '飞行日', 44, 1, NULL, 0, 'flight_date', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:22:10', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c5c949d2-8ddb-4418-aaac-5e3fb0586833', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '大纲OID', 0, 1, 36, 0, 'OID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"OID\", \"tableCode\": \"flight_outline\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:52:12', '2024-07-18 16:59:38', NULL, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('c643c24e-485c-4851-81b7-7556125e1475', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '更新时间', 9, 1, NULL, 0, 'update_timeupdate_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:19:05', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c6550454-771d-46ca-ab37-6834b631d793', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '学员科目', 10, 1, NULL, 0, 'trainee_subject', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:47:30', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c6e8ac31-fd6d-4ce3-9d8b-5faf9b308cd0', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '党团日期', 13, 1, NULL, 0, 'd_t_r_q__RPFK', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:03:53', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c75022e0-9b05-4cdd-82a1-deb7432746c2', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '发动机时间', 48, 1, NULL, 0, 'f_d_j_sh_j__tSRE', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:53:30', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c75357ab-cdf4-4002-8e3a-db4b5c8cb00e', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '代号', 36, 1, 8, 0, 'd_h__PDxr', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:38:08', '2024-07-18 17:01:42', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('c753a19e-ee84-4699-bd90-c116e60e8c26', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '良好下限', 9, 1, NULL, 0, 'rating_good_lower', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:18:47', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c76b169a-1084-4674-9061-1254ca7ccefb', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, 'ATA1', 88, 1, 4, 0, 'ata_chapter_1', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c782a9e5-543f-4e66-ab7d-540f9c9b12ad', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '一般下限', 11, 1, NULL, 0, 'rating_average_lower', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:19:31', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c79c86af-f316-49ba-9e8b-533f55139911', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '阶段', 2, 1, NULL, 0, 'stage', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:16:27', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c7d3ce59-9b32-424e-84b8-25ade2a47e99', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '放飞间隔', 27, 1, NULL, 0, 'launch_interval', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:38:47', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c7e42e9b-2a6a-4376-a9c0-1fa59a016cc7', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '终点', 5, 1, 36, 0, 'end_point', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"waypoint\", \"tableCode\": \"h_d_k_g_l__gm_n\"}]', 'null', 'sysadmin', '', '2024-05-10 11:17:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c8cd67c3-f957-4059-a571-2963f5618ffd', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '仪表', 11, 1, NULL, 0, 'instrument_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:29:12', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c8d72667-a5bf-4405-8d41-183faab2f9c1', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '序号', 4, 1, NULL, 0, 'serial_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 14:23:00', '2024-07-18 17:00:59', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('c8e81862-3c45-4a87-a221-db9e683262db', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '滑油型号', 12, 1, 24, 0, 'h_y_x_h__mKnC', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:55:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c8fcc4ab-9391-46e2-ae0f-d0e55e25de68', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '更新时间', 0, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:34:09', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c94cac8d-df86-4283-97f1-d5e37da5dcd4', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '上次翻修', 5, 1, NULL, 0, 'last_overhaul_date', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:38:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c9921a66-7701-4abc-af53-c9b1d3bfe55c', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '检查', 45, 1, NULL, 0, 'inspection', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:38:14', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c9b2773e-6800-483e-aa49-fbaf20e71fa4', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '改出段高度', 11, 1, NULL, 0, 'recovery_segment_altitude', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:43:45', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c9d1bc47-d864-4ee1-9139-6d97b6f4497b', '46f479de-4c23-48c1-a374-88e715539a0e', NULL, '', 0, '内容', 0, 1, 4, 0, 'n_r__NpBj', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:26:55', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c9f1f86e-ab69-43ba-988c-2126b8722a2e', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '机号', 0, 1, 36, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"j_h__bGYP\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('c9f99299-c548-466d-a59e-7884b1540814', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '备注', 17, 1, 64, 0, 'b_zh__ESzx', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:18:22', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ca17403f-54f6-4b57-86b0-3f06e2db2c78', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '执照编号', 4, 1, 36, 0, 'license_number', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"sh_h_zh_h__eNnT\", \"tableCode\": \"s_zh_x_x_d_j_b__mr_p\"}]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ca419b64-86a4-428b-8a87-234e9d53323b', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '考试', 13, 1, NULL, 0, 'exam', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:32:11', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ca43d3dd-8daa-4628-ab86-759da0d41f20', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '绑定IP', 11, 1, 64, 0, 'b_d____ZfNH', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:17:24', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ca462b41-f7e8-4a14-98e3-0bca335689ae', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, 'QID', 0, 2, NULL, 0, 'QID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 17:58:15', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('ca5b8701-b571-4ad8-8f6d-d458969480f0', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 1, '信息', 0, 1, 50, 0, 'info', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 16:53:36', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ca8db0d2-a7e4-46b6-9ede-72d823c3d822', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '航站_2', 78, 1, 10, 0, 'station_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cae9b2f6-779e-4ff8-80fa-0affc9808313', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '仪表', 46, 1, NULL, 0, 'instrument_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:35:51', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cb8be662-cbd8-44e4-b5f4-5d2b09709979', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 4', 24, 2, NULL, 0, 'ratio_4', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:25:14', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cb930d8f-6ec1-42d0-8ee3-54ed5e08e089', 'f4f4e22f-6475-49bb-b00d-13dadfa778fa', NULL, '', 0, '内容', 0, 1, 1, 0, 'n_r__nXEt', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:23:12', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cb9b55b3-b75d-4372-a3e2-efe9eec74aa4', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '保密', 24, 1, NULL, 0, 'b_m__FkR_', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:17:09', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cba2db62-3374-4fc1-904a-8e652239764a', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, 'UID', 13, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-10 09:37:00', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('cbb68163-f7d5-4fcc-b1c2-d3917d12ec06', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '仪表_3', 42, 1, NULL, 0, 'instrument_3', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cbe524f6-17d5-4b2b-a8f3-960a7972f6e0', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '带飞', 47, 1, NULL, 0, 'dual_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:26:10', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cc23d052-af81-4eb0-b72a-ffad74f8bc29', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '压座', 36, 1, NULL, 0, 'ballasting', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:45:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cc2a2f74-6f3a-476f-8a62-c490c6931295', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起飞_1', 16, 1, NULL, 0, 'takeoff_1', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cc4723c9-fb6b-47ef-be7d-a10e5ea39e34', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '使用', 11, 1, NULL, 0, 'used_times', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:34:19', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cc99b610-1b5b-4254-bafd-b29a90bd2d5e', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '更新时间', 12, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:27:07', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ccbb6bb9-f445-4468-b586-803708ac61fc', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '转场时间', 48, 1, NULL, 0, 'cross_country_flight_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:08:57', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd44b81f-b805-4ce9-837d-1601a96f6887', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '备注', 16, 1, 64, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:17:47', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd54bd67-719a-4358-9317-859b4fefbe8f', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '进入段成绩', 6, 1, NULL, 0, 'entry_segment_score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:41:48', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd6837e8-54e8-4f95-b3b9-2780831a74a1', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '评判答案', 10, 1, NULL, 0, 'evaluate_answers', 'text', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:32:49', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd6cc1d2-b209-47db-97d0-08412e9b2b5e', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '学位', 9, 1, 36, 0, 'x_w__JBKN', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__bNRd\", \"tableCode\": \"x_w_z_d__wafe\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:41:25', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd8b7c79-7b8b-4696-b2e5-89841b8c557f', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 6', 28, 2, NULL, 0, 'ratio_6', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:25:48', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd8e9def-0c1a-4e02-96a4-5402bf53c6e7', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '夜视_2', 25, 1, NULL, 0, 'night_vision_2', 'bool', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cd8f186a-c798-48d8-87a4-6692dcc9758d', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '见指_1', 23, 1, 36, 0, 'trainee_director_1', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"x_m__QYBH\", \"tableCode\": \"j_y_x_x_b__etdf\"}]', 'null', 'sysadmin', NULL, '2024-05-11 17:00:50', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ce176218-c189-4fa1-9197-99cdb3b9c256', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, 'PID', 0, 1, NULL, 0, 'PID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-11 16:47:55', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('ce255bb6-9055-4449-9346-78c819747105', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '昼间时间', 49, 1, NULL, 0, 'day_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:06:52', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ce878a16-a6e2-49a4-9980-89f0611aab93', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '相邻空域', 0, 1, 32, 0, 'x_l_k_y__XXxA', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:47:44', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ce90d7f6-a2ff-4393-ae27-07dfdf5e2281', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '国籍证号', 2, 1, 20, 0, 'g_j_zh_h__djPd', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:17:55', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ceec0502-5f44-4266-ba2f-59fbc2b642c4', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '单位', 3, 1, 36, 0, 'd_w__BpK_', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"d_w__zxfQ\", \"tableCode\": \"d_w_d_j_b__dxfz\"}]', 'null', 'sysadmin', NULL, '2024-05-08 14:50:50', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cf99c7e0-e25a-4f2e-815e-cea52c1e98dd', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '签署执照编号', 107, 1, 20, 0, 'release_license_number', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cfa476f1-bb7e-4f8a-b35d-814d1edfa34c', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '政治面貌', 16, 1, 36, 0, 'zh_zh_m_m__XWtQ', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__TBmb\", \"tableCode\": \"zh_zh_m_m_z_d__errh\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:03:29', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cfc06b8a-06f7-49fa-b00c-ba9b38f96778', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, '结束时间', 6, 1, NULL, 0, 'end_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 16:13:24', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cfce7707-b101-4aa8-b2fb-afe5b36eb2d0', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '身份证UID', 5, 1, NULL, 0, 'UID', 'bigint', NULL, 1, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 15:59:20', '2024-07-18 16:59:38', NULL, '\"[0]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('cfe498e9-2c9f-4992-9ce6-dc5eb649770b', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '机长', 50, 1, NULL, 0, 'captain', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:26:43', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('cff32530-00a1-4667-8154-ca6a5fad6c41', '048fe8a8-6ad6-423d-ba7f-8c6769afcdf6', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__BXPp', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:27:55', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d05e44a1-4fd4-4846-ad9b-7d86458fc189', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'archival_information', 0, '注销日期', 26, 1, NULL, 0, 'zh_x_r_q__aWiH', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:16:19', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d0ca25ed-f979-4b0e-b3b6-076dba2d8d5b', '338103bc-338e-41ff-9e70-5b5062d10443', NULL, '', 0, '关键词', 2, 1, 10, 0, 'key_word', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-22 15:17:57', '2024-07-22 15:21:45', 10, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d1385a28-8546-4ede-89be-1769a2d74887', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, '优秀上限', 6, 1, NULL, 0, 'rating_ideal_upper', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:17:47', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d146de65-3405-487d-b779-c88aff00bf96', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '检查执照编号', 110, 1, 10, 0, 'inspection_license_number', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d1642364-02ab-4a1d-80d9-26985ab81383', 'd00d6dfc-b948-4948-b2da-2b9cc2a3455d', NULL, '', 0, '授课人', 1, 1, 40, 0, 'teacher', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:38:16', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d1b128fc-2190-449f-9f46-2d75e17c6d1a', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '启动数_1', 22, 1, NULL, 0, 'engine_starts_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d1da65ed-5aed-42b3-81e3-e8735748b31a', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '课程', 3, 1, NULL, 0, 'course', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:16:56', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d1fdbd40-da71-4e93-9e37-4f78fe4a0217', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '关车_3', 50, 1, NULL, 0, 'shutdown_3', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d1ff52c9-2036-4a87-97b9-7dbd7eb5a257', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '身份证UID', 6, 1, NULL, 0, 'UID', 'bigint', NULL, 1, 0, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:31:30', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('d2302b8b-4245-4055-ad1a-f51879b9031c', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '更新时间', 114, 1, NULL, 0, 'update_time', 'datetime', 0, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d269a8d7-c9ad-4e9d-8b0b-0d534d092594', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '机号', 0, 1, 12, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:39:27', '2024-07-26 10:01:05', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('d3087096-d37d-46d6-872c-7efb2d2caf9a', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '前舱代号', 19, 1, 3, 0, 'front_cabin_code', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:50:26', '2024-07-18 17:01:42', 3, 'null', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('d31f76f9-fcd9-4723-9005-e93aa2e1112d', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '保密', 25, 1, NULL, 0, 'b_m__TDT_', 'bool', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:21:18', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d352fc6f-3875-41ef-a44c-9f668d9b7759', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '航图', 0, 1, NULL, 0, 'aeronautical_chart', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:43:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d3b63b5a-c975-4d39-baa4-70baaddce2c4', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '附件', 51, 1, NULL, 0, 'f_j__hnWz', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:05:38', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d3bcf4d0-cc05-4b63-8e8e-2e9a8c7bb89f', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '航空器空重', 20, 1, NULL, 0, 'h_k_q_k_zh__zPZS', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:59:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d3ed21c6-3294-4300-8aed-7a1aee4926b4', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '飞行大纲', 38, 1, 36, 0, 'flight_outline', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"name\", \"tableCode\": \"flight_outline\"}]', 'null', 'sysadmin', NULL, '2024-05-07 17:14:23', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d42ded34-45f0-406e-815a-ad2ca32eabba', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '地面', 16, 1, NULL, 0, 'ground_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:24:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d4641a39-91aa-4d11-8b18-2f83c138125b', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '注销日期', 31, 1, NULL, 0, 'zh_x_r_q__Ztij', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:19:20', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d4dfb2e3-4ab7-4ef6-8dbf-a599b19b5575', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '性别', 3, 1, 36, 0, 'x_b__NsS_', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__CwNY\", \"tableCode\": \"x_b_z_d__xhaf\"}]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:01:59', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d5396a50-573e-4f77-8e4d-a682d8ebe62b', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, '更新时间', 11, 1, NULL, 0, 'last_update', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-09 09:46:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d53f1370-f03b-46f0-acaf-8d0f8ee3a759', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '检查日期', 111, 1, NULL, 0, 'inspection_date', 'date', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d57db6c8-c47d-4a6d-9aea-bb2d28b72d0e', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '类型', 8, 1, 4, 0, 'type', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:12:25', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d60e9659-2c0d-4c66-a590-694b6e47ab91', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '螺旋桨序号', 3, 1, 36, 0, 'airscrew_serial', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"l_x_j_x_h__BEbc\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('d69febda-d78f-405b-a7e0-69d5a065e9ee', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '类型', 51, 1, 36, 0, 'type', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__aWPY\", \"tableCode\": \"f_x_j_h_l_x_z_d__wpca\"}]', 'null', 'sysadmin', NULL, '2024-06-06 11:08:59', '2024-07-18 16:58:35', 2, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d6a2ec0a-e224-499e-a432-d1b641d6a30c', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '时长', 7, 1, NULL, 0, 'duration', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:25:37', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d6dfaf26-ebef-4ef6-9890-e7779d66a5e2', '51604a74-5a77-4370-8008-d85f667d9035', NULL, 'flight_information', 0, '曾飞机型', 42, 1, 36, 0, 'c_f_j_x___Hrd', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:03:58', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d7080ec5-9e47-4a76-a86c-53fc93e29ab6', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '班', 4, 1, 36, 0, 'b__QEfr', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__nXEt\", \"tableCode\": \"b_z_d__abfr\"}]', 'null', 'sysadmin', NULL, '2024-05-06 09:50:26', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d7715c94-4c35-4514-9fc3-75ec1a18a53c', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '教员改装', 34, 1, NULL, 0, 'coach_conversion', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:40:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d8c7d252-20df-4ad9-b5ea-2c246c9d955a', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '架次', 3, 1, NULL, 0, 'flight_sorties', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 15:57:04', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d8d28c4c-f9b8-47ac-825b-c59aceabab03', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '时间', 4, 1, NULL, 0, 'time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:25:19', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d99282de-927d-4c15-b8b3-5826f9be7962', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'score', 0, '最高分', 4, 1, NULL, 0, 'highest_score', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:11:50', '2024-07-18 16:58:35', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('d9a42994-e358-4e86-9fa9-edafb8d0958f', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '比例 8', 32, 2, NULL, 0, 'ratio_8', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:26:20', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('da110e5b-6a55-4cd1-9777-0e12071fb2e7', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '体检类型', 0, 1, 8, 1, 't_j_l_x__nxRR', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:36:33', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('da1dbb6b-566d-4f95-a3c3-31b6c8181ab5', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '远台2距离', 11, 1, NULL, 0, 'y_t__j_l__e_Hk', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:39:07', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('da22ee69-0a5a-4a86-9f4e-feb87ae8691e', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '空中', 52, 1, NULL, 0, 'air_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:23:53', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('da233ab6-6ec9-42eb-91f9-f11ec0342e4e', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '相片', 19, 1, NULL, 0, 'x_p__xmsE', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:20:50', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('db1c0f72-0075-40b5-a8ce-c53390973c8c', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, 'RID', 1, 1, 36, 0, 'RID', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:39:51', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('db77088b-f287-4bf8-9329-f3686123eb48', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '完成标准', 33, 1, 2000, 0, 'completion_criteria', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:42:10', '2024-07-18 16:58:35', 2000, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dc09b3bc-15ad-4fce-ab01-7ae99c2d2b6d', 'bbabfbaf-939d-436e-9ce9-16d289de8c1c', '', '', 0, '更新时间', 13, 1, NULL, 0, 'last_update', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dc4daa1d-b3f7-4af9-be70-9e2cbc88773e', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '附件', 7, 1, NULL, 0, 'f_j__hPwY', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:40:48', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dd0f0ad2-388c-49f6-a352-b3def1a089ac', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '敌我识别号', 44, 1, 8, 0, 'identification_friend_or_foe', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:06:38', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dd169d5c-6457-428b-a23d-ef2c790fd4ed', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '改装', 26, 1, NULL, 0, 'conversion', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:37:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dd1f5c72-d71f-4adf-8d70-2d385c4890bb', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '更新时间', 11, 1, NULL, 0, 'update_time', 'datetime', 0, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:35:17', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dd386260-5522-4ec7-884f-24afd71f3381', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '节', 3, 1, 36, 0, 'section', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:26:26', '2024-07-23 14:05:13', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dd46208b-bb74-45e6-acae-1647a9b9a97e', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '填表人', 9, 1, 10, 0, 't_b_r__sbma', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:12:47', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dde0afc3-4493-442e-91e9-8aa882efabc7', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '天亮', 15, 1, NULL, 0, 'daybreak', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:56:45', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('de0557f1-23e2-4ae7-be44-d3f0c7a4d72a', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '装上件号_2', 98, 1, 24, 0, 'installed_part_number_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('de163708-26d7-4e6d-bde8-ef3f25f8741f', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '名称_2', 95, 1, 10, 0, 'item_name_2', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('de7825a9-d493-47bf-b67e-11680c8243b7', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '航行时间', 8, 1, NULL, 0, 'flight_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:14:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('deb6fce3-0bd5-441f-89b2-93231cd8d594', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '告警雷达型号', 14, 1, 48, 0, 'alarm_radar_model', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:41:52', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ded1d90e-4e86-45c4-a8a7-5abf32ddb1ca', '17097c4c-fb1a-44b2-823b-611ffc83926d', NULL, '', 0, '附件', 4, 1, NULL, 0, 'attachment', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 11:27:28', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('df3b9be5-4c9c-4999-887c-5851f0ca5bf0', '0c69abc1-296d-497d-86b0-904179ed63b1', NULL, '', 0, 'AID', 0, 1, 36, 0, 'AID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"AID\", \"tableCode\": \"flight_action\"}]', 'null', 'sysadmin', NULL, '2024-05-11 15:12:27', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('dffb2d4c-2ac4-429d-a863-59de6d6a994b', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '姓名', 2, 1, 10, 0, 'name', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 16:37:29', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('dfff523b-2755-4b16-8ee1-582e86889b16', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, 'info', 0, '档案', 0, 1, NULL, 0, 'personal_file', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 17:28:06', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e00afaa1-a827-48ba-afe4-5c3def691412', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '起飞次数', 53, 1, NULL, 0, 'takeoff_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:16:07', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e046650b-9d53-4961-b4d1-78dc8edd0998', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, '考试', 24, 1, NULL, 0, 'exam', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-12 15:01:37', '2024-07-18 16:58:35', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e0b00b2d-3310-4e84-9b14-f20a3dc03b85', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起飞_2', 32, 1, NULL, 0, 'takeoff_2', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e0b74623-e677-4bc2-9f1d-5fdb17141f29', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '夜间时间', 54, 1, NULL, 0, 'night_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:08:02', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e0d18f27-6dac-4658-b955-b5052d21e22a', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'archival_information', 0, '注册日期', 30, 1, NULL, 0, 'zh_c_r_q__mjxH', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:19:06', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e0f60fc4-1d10-4d1f-a909-52710801a202', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '前舱', 3, 1, NULL, 0, 'front_cabin', 'int', 0, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:24:46', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e1043dfd-85d0-4ba6-b355-c6962a892568', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '日期', 1, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:07:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e157d2d2-a079-4c5a-aae4-f72c332d3de5', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', NULL, '', 0, '熟练', 25, 1, NULL, 0, 'practised', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-12 15:02:12', '2024-07-18 16:58:35', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e19323b3-14ae-432c-99bc-4dbd56777863', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '适航证发证', 5, 1, NULL, 0, 'sh_h_zh_f_zh__hGpa', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:19:02', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e1bf5301-b237-4b6b-9be8-6a1a4e8a73bf', '64913184-e70d-4f15-b1d6-1b62f1b6cd46', NULL, '', 0, '内容', 0, 1, 200, 0, 'n_r__PbHJ', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:43:09', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e1ddf5e4-dd17-4dd1-9da4-e21f463acfc7', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '任务', 30, 1, NULL, 0, 'task', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:38:00', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e1f68145-ee4e-4638-80cf-da59d7e2a2e5', 'c0bd7d0c-4047-40f7-8a99-f17cdedfe589', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r___jQp', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:21:35', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e2939517-7b2e-4abf-aecc-21e07a840514', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '章', 5, 1, 36, 0, 'chapter', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:10:28', '2024-07-23 16:02:28', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e2e9bc56-4ec3-42bd-a532-2a4b21dd4c6e', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '备注', 10, 1, 64, 0, 'comment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:46:08', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e38c3be8-accf-485c-9741-1a5c2e932454', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '成绩', 8, 1, NULL, 0, 'score', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:25:54', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e3f74c91-1d2f-40e4-bedd-c577e14034e0', 'ea542b04-0e24-4719-ac01-6da110c704d3', NULL, '', 0, '机型', 2, 1, 36, 0, 'aircraft_type', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:24:02', '2024-07-18 16:58:35', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e417a862-d0c7-4604-94f9-ca71344303a4', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '放飞间隔', 12, 1, NULL, 0, 'launch_interval', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:48:04', '2024-07-18 16:58:35', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e4221fe8-71b9-4d3a-a2bd-9dcd19a54793', '82f94fee-6e5a-4bcb-b0e9-5fbd9c4ae48c', NULL, '', 0, '内容', 0, 1, 2, 0, 'n_r__zNrr', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:25:25', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e455dd01-46ac-465e-984f-65ee1bcc7c1a', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '着陆_2', 33, 1, NULL, 0, 'landing_2', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e46ff75c-65a7-4a30-a5c0-ee0d3fb50098', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '章', 2, 1, 36, 0, 'chapter', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:26:16', '2024-07-23 16:02:31', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e4819e70-0037-4626-afb0-66de2216ef05', '85b1b285-7c23-4e7b-88ce-66d73c6a12b5', NULL, '', 0, '更新时间', 14, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:35:26', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e4c5e75c-b019-4410-9cbe-4c536a32b5ad', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '备注', 11, 1, 64, 0, 'b_zh__XHTz', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:13:06', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e5119aa1-01a8-46be-aeea-8ef4f51ff77e', '2288113a-e9be-452f-a88f-16506b2218ca', NULL, '', 0, '内容', 0, 1, 4, 0, 'n_r__nJER', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:22:20', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e52bbebb-2ed9-4cf2-b616-088df041b63d', '5d2529a5-5218-4bdd-a70d-75fd511164b2', NULL, '', 0, '更新时间', 6, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 10:23:59', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e553f46c-4b7e-4ee5-9ed8-97f6e099e58e', 'b70c4c30-479d-45c8-833c-79a2ea2d7355', NULL, '', 0, '备注', 0, 1, 48, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-10 11:33:17', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e5796d34-30ee-4b97-9123-94079d326399', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '机型', 0, 1, 36, 0, 'j_x__CchN', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-08 14:48:54', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e5796d34-30ee-4b97-9123-94079d329399', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '机型', 0, 1, 36, 0, 'j_x__CchN', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', '', '2024-05-08 14:48:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e58431b9-9e18-4dac-a32a-11564f846014', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '开始时间', 6, 1, NULL, 0, 'start_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:33:21', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e5bb67ab-0cd0-46d1-a78d-e54716ae7972', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '机身时间', 5, 1, NULL, 0, 'j_sh_sh_j__dZMc', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:52:04', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e5d01d2a-b760-4480-a6a9-13d5ffdf1375', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '编辑', 47, 1, 10, 0, 'edit', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:07:14', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e5ee2042-0d51-4175-b0ed-126777dea01f', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '测试三', 0, 1, 36, 1, 'c_sh_s__pDdB', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-08 11:06:19', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e621d8de-4203-4ee4-80ba-454a413c3a1b', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '单位', 2, 1, 100, 0, 'unit', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:48:39', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e68f01cf-0e20-4277-ad50-8259449e4259', '5242000e-c725-41b1-8113-3a8e38a3e731', NULL, '', 0, '机型', 2, 1, 36, 0, 'aircraft_type', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-06-03 16:20:44', '2024-07-18 16:58:35', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e69aa87a-a886-4d2e-a9d6-c8955be50cef', '33a4f4c1-4519-460b-bb6a-c9a719904495', NULL, '', 0, '起飞', 4, 1, NULL, 0, 'takeoff', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:33:10', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e6c154f0-dcfa-44a7-9668-b1da9cc6d860', '5f46e5c2-7c43-457a-aade-882baa4baadb', NULL, '', 0, '内容', 0, 1, 4, 0, 'n_r__HJci', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:26:16', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e715bd8f-8c4f-421b-9fa3-bfb877704816', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '出生日期', 7, 1, NULL, 0, 'ch_sh_r_q__JPzd', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:15:58', '2024-07-18 16:58:35', NULL, NULL, 0, 1, 1);
INSERT INTO `column_manage` VALUES ('e7244a8c-6a1c-4ad1-a8b4-70b49b69b49c', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '发动机型号', 2, 1, 36, 0, 'engine_model', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"f_d_j_x_h__KiaX\", \"tableCode\": \"f_j_x_x_d_j_b__hrwm\"}]', 'null', 'sysadmin', NULL, '2024-05-09 09:36:20', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e73faef0-d0a7-4f93-98bf-79218d2688a1', '3cd1461b-da43-4aff-8510-a4dbfecb4dc3', NULL, '', 0, '最大着陆重量', 50, 1, NULL, 0, 'z_d_zh_l_zh_l__GnMs', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 15:00:19', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e77afc48-c6b4-4f07-b711-0e301e6b5df9', 'b3753460-89a3-4dff-8008-1a6ad1c40d1c', NULL, '', 0, '更新时间', 5, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 14:16:38', '2024-07-18 16:58:35', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e7a215cb-a23a-4036-be04-74da503e9b96', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '备注', 16, 1, 64, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:36:31', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e7dd3f6e-2531-4d64-8732-ca18c15642e7', '29eedd99-dfc8-4057-9384-708e0a251ef7', NULL, '', 0, 'LID', 0, 2, NULL, 0, 'LID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 15:47:44', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('e7f1badd-521a-4b58-b0f2-f400c6ebc079', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '开始时间', 20, 1, NULL, 0, 'start_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:51:24', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e82e6f3e-b6ac-4d6b-92f8-31980306cd01', '9432ae75-6ba2-477d-a450-07dc9c3b4525', NULL, '', 0, '体检期限', 4, 1, NULL, 0, 'Inspection_period', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 14:39:24', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e8e4be27-8303-4fe6-8eb3-3286518d1df5', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '磁差', 3, 1, NULL, 0, 'magnetic_variation', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:34:05', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e8e6a7d5-8f62-4055-884f-3daef7481bb7', '27176200-dac2-469b-aa85-95ace5088a28', NULL, '', 0, '人数', 2, 1, NULL, 0, 'student_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:03:11', '2024-07-18 16:58:42', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e976233a-2f10-411a-a6b5-6cfbe6ac2a8d', '5242000e-c725-41b1-8113-3a8e38a3e731', NULL, '', 0, '架次', 4, 1, NULL, 0, 'flight_sorties', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:21:47', '2024-07-18 16:58:42', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e997ce7e-b003-4cf1-a2c1-223e9445176e', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '情况', 55, 1, 200, 0, 'situation', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:18:19', '2024-07-18 16:58:42', 200, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('e9998e39-c38c-439a-a361-b5eb8f93194f', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '途经点', 4, 1, 36, 0, 'all_point', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"waypoint\", \"tableCode\": \"h_d_k_g_l__gm_n\"}]', 'null', 'sysadmin', '', '2024-05-10 11:17:00', '2024-07-25 14:51:39', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ea829fbb-b9c8-4cf6-b3fc-5394d816860f', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '单飞', 8, 1, NULL, 0, 'solo_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:27:27', '2024-07-18 16:58:42', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ea8560c4-788a-404a-ab03-a87140c778fc', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '单飞', 56, 1, NULL, 0, 'solo_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:27:08', '2024-07-18 16:58:42', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ea8b2432-f461-4fb9-860b-7a64ac83990d', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '纬度', 2, 1, NULL, 0, 'latitude', 'float', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:34:47', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ea96d2ea-f5bf-41ab-88fd-654477c1d266', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '跑道长度', 7, 1, NULL, 0, 'runwawy_length', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:36:15', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('eaef030d-f08b-4ea9-9150-405bffd2b356', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '节', 6, 1, 36, 0, 'section', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-13 11:10:48', '2024-07-23 14:05:08', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('eb2a7025-98ae-4e91-810b-4090559b7bc3', '3703743f-b2ba-4972-b4f4-c2791d6eb6e4', NULL, '', 0, '期班', 2, 1, 100, 0, 'q_b__RXcH', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 09:50:42', '2024-07-26 11:12:11', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('eb32447e-57ec-4c24-a98d-628296925669', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, 'AID', 2, 1, 36, 0, 'AID', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"AID\", \"tableCode\": \"flight_action\"}]', 'null', 'sysadmin', NULL, '2024-05-11 15:40:25', '2024-07-18 16:59:38', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('eb54e22d-71b4-4f4e-9844-1fe4b2309cec', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起落数_4', 71, 1, NULL, 0, 'landings_4', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('eb5d2a9f-44a5-468d-8c07-373773c0cd9c', 'db841c6f-0afe-4b83-9039-0aef80721b39', '', '', 0, '备注', 9, 1, 64, 0, 'comment', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 17:14:00', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('eb7dcd97-dc97-4b9e-b454-d5f02cf450da', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, 'UID', 12, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-09 09:46:52', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('ebccf28d-c98d-4758-926a-5aa8b1e6b8ed', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, 'HS2', 14, 1, NULL, 0, 'HS2', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 14:19:00', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ebffb1f5-c0df-42d0-9732-45443c62c696', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '人数', 57, 1, NULL, 0, 'people_number', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:17:45', '2024-07-18 16:58:42', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ec979b69-5b94-4254-8366-ea5737076bce', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '昼间着陆', 42, 1, NULL, 0, 'day_landing_number', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 14:17:00', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ecbc5856-a474-4d83-b887-eab0faab0678', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'basic_information', 0, '民族', 6, 1, 36, 0, 'm_z___Hcm', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hfKH\", \"tableCode\": \"m_z_z_d__yjhk\"}]', 'null', 'sysadmin', NULL, '2024-05-07 16:40:24', '2024-07-25 14:51:40', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ecf10867-3a47-41bc-b4f5-2aebf0c45f51', '7b728056-aed1-4fe4-af88-82e048595648', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__at_T', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:24:19', '2024-07-18 17:00:59', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('ed65d3bc-6c9e-4ec7-9c0b-3bd2c49b0dcf', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '学位', 9, 1, 36, 0, 'x_w__idKD', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__bNRd\", \"tableCode\": \"x_w_z_d__wafe\"}]', 'null', 'sysadmin', NULL, '2024-05-08 10:19:15', '2024-07-25 14:51:40', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ed857540-51fc-4956-b302-49c05707d287', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'basic_information', 0, '民族', 4, 1, 36, 0, 'm_z__QstX', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__hfKH\", \"tableCode\": \"m_z_z_d__yjhk\"}]', 'null', 'sysadmin', NULL, '2024-05-08 10:17:43', '2024-07-25 14:51:40', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ed95e1d4-31f3-4421-b543-48cf77980334', '9c0197f8-0491-4f8d-884d-b9df51ac8166', NULL, '', 0, '上次翻修', 5, 1, NULL, 0, 'last_overhaul_date', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 09:38:13', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('eded8c03-b8e6-443a-a3ff-2ed5de9131a5', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'score', 0, '最低分', 5, 1, NULL, 0, 'lowest_score', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:12:46', '2024-07-18 16:58:42', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ee073a2d-db4d-4394-88c2-6d018009136b', '108bbb7e-ccc4-4290-9750-cc72554ee636', '', '', 0, 'UID', 12, 2, NULL, 0, 'UID', 'bigint', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-09 09:46:00', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('eecde1d0-3f4c-4e0b-bc50-dacab8239457', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '状态', 45, 1, 36, 0, 'status', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__NpBj\", \"tableCode\": \"j_h_zh_t_z_d__pkfp\"}]', 'null', 'sysadmin', NULL, '2024-05-11 17:07:43', '2024-07-25 14:51:40', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ef1786a5-af28-4af0-bb05-f099d4a71246', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '设置', 48, 1, NULL, 0, 'setup', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:07:55', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ef2a4080-8956-4f74-948e-02671b083340', 'c4578457-06d4-4ee8-9041-8189c144beec', NULL, '', 0, '电台证发证', 8, 1, NULL, 0, 'd_t_zh_f_zh__rHDa', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 14:19:54', '2024-07-18 16:58:42', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ef434626-d0f2-44b9-b5d8-a5704369846a', '27176200-dac2-469b-aa85-95ace5088a28', NULL, 'percentage', 0, '不及格', 11, 1, NULL, 0, 'flunk_percentage', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-07-11 18:16:08', '2024-07-18 16:58:43', NULL, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ef4b5ad5-e987-4e1a-8fc4-b200faa18268', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教员考试', 58, 1, NULL, 0, 'coach_exam', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:39:38', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('efdd41c6-9dee-4356-a57b-2fdbdad8d0d6', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '机场', 0, 1, 10, 0, 'j_ch__jRHK', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:46:28', '2024-07-26 11:07:26', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('f06df8f2-74c5-4f8f-a6ca-8cc7e179dea3', '1db4b56f-49a4-435a-bd67-f1659b6635ed', NULL, '', 0, '专业', 3, 1, 36, 0, 'major', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"n_r__iRnX\", \"tableCode\": \"zh_y_z_d__hwxr\"}]', 'null', 'sysadmin', NULL, '2024-05-13 11:08:56', '2024-07-25 14:51:40', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f0f7d44a-bf0e-4134-bbcc-b56c521443f3', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '已考人数', 11, 1, NULL, 0, 'examinees_num', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:06:18', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f1039931-cb9f-43e5-8a20-9fe9efa4eabe', '51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', NULL, '', 0, '测问合格', 6, 1, NULL, 0, 'flight_quiz_pass', 'bool', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 16:18:10', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f10826e8-8967-4e08-af67-2f796912f283', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '日期_3', 83, 1, NULL, 0, 'date_3', 'date', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f16315a1-4b47-4603-a9be-68ab6a9fa076', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '备注', 0, 1, 48, 0, 'b_zh__DRYy', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:48:18', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f1ac30ea-1281-4acd-bb94-20f2a6e399a1', '5054cfa2-a339-4284-baab-70254a717a30', NULL, '', 0, '飞行时间', 1, 1, NULL, 0, 'flight_duration', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:40:05', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f1ca81b2-af01-484f-b97c-eca06d880530', 'f78c5e09-9bf2-4972-9681-3d1a414430ba', NULL, '', 0, '序号', 0, 1, NULL, 0, 'x_h__nDCQ', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:46:44', '2024-07-18 17:00:59', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('f273b75e-606c-4f68-a7e8-914fc79e93a2', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, '关联关系', 0, 1, 36, 0, 'the_association', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"content\", \"tableCode\": \"test_the_association_ttable\"}]', 'null', 'sysadmin', NULL, '2024-07-19 10:01:02', '2024-07-19 10:01:02', 36, '\"[]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f386b18f-592e-47dc-8bcd-5d0edf5b0f60', 'f4d10534-1cd3-420b-8af3-f98d6487547c', NULL, '', 0, '机场航图', 15, 1, NULL, 0, 'j_ch_h_t__eDNN', 'file', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:44:48', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f3942efb-4973-4e7d-a3bd-515e2a5c2901', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '签署', 3, 1, 10, 0, 'signature', 'varchar', NULL, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f3a5e53e-a4cc-41d4-ae44-3044a490baa5', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '开始时间', 8, 1, NULL, 0, 'start_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:57:33', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f4066c45-43b0-44d5-8cb0-c08d58317152', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '地面', 59, 1, NULL, 0, 'ground_time', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:24:13', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f433c17f-f778-4494-b801-07d3341d77b5', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '合计时间_3', 53, 1, NULL, 0, 'total_time_3', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f4613b7a-1cdb-4b9b-a644-a70096b52c68', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '备份机', 39, 1, NULL, 0, 'standby_aircraft', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:05:44', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f467de09-a0c8-4a05-a41e-6c520e8b2134', 'b3753460-89a3-4dff-8008-1a6ad1c40d1c', NULL, '', 0, '机型', 1, 1, 36, 0, 'aircraft_type', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"m_ch__wdrd\", \"tableCode\": \"j_x_d_j_b__ddkz\"}]', 'null', 'sysadmin', NULL, '2024-05-11 14:15:45', '2024-07-25 14:51:40', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f4aaf5ea-ef90-41d4-8a8c-71cb795bc2d2', 'fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', NULL, '', 0, 'UID', 2, 1, 36, 0, 'UID', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-14 16:11:10', '2024-07-18 16:59:38', NULL, '\"[]\"', 0, 0, 0);
INSERT INTO `column_manage` VALUES ('f52be17c-cd5e-4564-8243-ffa0cd1e37bc', '1503e9bd-51e4-4f6e-bdf5-209739b068ec', '', '', 0, '试飞', 27, 1, NULL, 0, 'test_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-06-06 11:37:00', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f533a507-fe92-4924-8865-b8054eafd3f0', '102e4f46-9945-431a-9c88-b08ed4a263cb', NULL, '', 0, '提醒日期', 6, 1, NULL, 0, 'reminder_date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-06 15:08:24', '2024-07-18 16:58:43', NULL, NULL, 0, 1, 1);
INSERT INTO `column_manage` VALUES ('f6df38f1-d05a-4e9a-8e01-0c23fb37552a', '98bf9a92-bed3-4187-9f79-530365a2bbce', NULL, '', 0, '着陆', 8, 1, NULL, 0, 'landing', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 14:46:51', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f71dc971-98f5-4876-8c98-af84e0cf6a7a', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '节次', 5, 1, NULL, 0, 'course_sequence', 'int', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:22:28', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f790b48d-3b77-44df-baeb-a16663907148', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '放行签署', 106, 1, 10, 0, 'release_signature', 'varchar', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f796101e-d98f-4d6a-a2a0-500f482d684e', 'dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '', '', 0, '填表人', 10, 1, 10, 0, 'reporter', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 09:37:00', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f868aff4-7a2c-4043-9a63-b4c86674d5cd', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '燃油量右_2', 30, 1, NULL, 0, 'fuel_right_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f86ddd4c-98fe-4e16-8aea-1dc89819956f', '67c95641-828f-46d4-baff-aa758a15ea31', NULL, '', 0, '内容', 0, 1, 10, 0, 'n_r__hRpA', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-04-28 10:21:07', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f8ba20f9-2017-483e-b471-046014b70c66', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '开车_2', 31, 1, NULL, 0, 'start_engine_2', 'datetime', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f94b18d9-c95a-4e0f-b018-6c5294395099', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起落数_2', 39, 1, NULL, 0, 'landings_2', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:59', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f94f4d50-82b4-4464-8d98-e76ccfc70a17', '037d67f1-94c5-4938-98ed-f6a356d68c15', NULL, 'basic_information', 0, '姓名', 2, 1, 10, 0, 'x_m__QYBH', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-06 16:00:07', '2024-07-18 16:58:43', NULL, '\"[0,4]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f9975460-653c-4178-af9a-20cda4d7b821', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '带飞', 6, 1, NULL, 0, 'dual_flight', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:26:40', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f9a7e7d4-9953-4358-a06d-4b2e54702550', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '发动机序号', 3, 1, 24, 0, 'f_d_j_x_h__JXaK', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:52:00', '2024-07-18 17:00:59', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('f9acd391-4131-4f1c-b363-191e95fe71ee', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '航行高度', 6, 1, NULL, 0, 'flight_height', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:16:00', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f9ca7ceb-0259-438f-bb59-20f91b3a0daf', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '身份', 20, 1, 36, 0, 'sh_f__RzEr', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', 'sysadmin', '2024-05-08 10:31:07', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('f9e612f1-50cd-4247-b163-ede137b3bc95', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '教员改装', 60, 1, NULL, 0, 'coach_conversion', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 11:40:04', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fa047117-484e-4da1-ab91-28fd2eee5c65', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '日期', 2, 1, NULL, 0, 'date', 'date', NULL, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fa4f1b0c-d0bd-4ce0-aa24-b5f7448e0b3b', '5f917074-6910-4c67-91c6-e70205dfa0a1', NULL, '', 0, '维修工作', 6, 1, 20, 0, 'w_x_g_z__QnpP', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-09 16:11:03', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fadcc0f1-6c02-4cd3-84a1-9c2593a5b19a', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, '', 1, '基础信息', 0, 1, 50, 0, 'basic_information', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 11:03:52', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('faf4f127-98ee-4dc0-b5d0-e2d1868d4fd1', 'b3753460-89a3-4dff-8008-1a6ad1c40d1c', NULL, '', 0, '课目', 2, 1, 36, 0, 'course_name', 'varchar', NULL, NULL, NULL, NULL, '[{\"tableCol\": \"subject\", \"tableCode\": \"flight_subject_details\"}]', 'null', 'sysadmin', NULL, '2024-07-01 10:17:46', '2024-07-18 16:58:43', 10, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fb5f8ef3-0e9c-4656-b946-28fcad37ac57', '1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', NULL, '', 0, '学员进度', 61, 1, NULL, 0, 'student_progress', 'float', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-06 14:22:53', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fbabb536-1ad9-4359-a3c5-7f27eaf3a347', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '日期', 4, 1, NULL, 0, 'course_date', 'date', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:21:48', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fbb84af7-3c05-4189-8443-2a0c1d42f1a8', '00658f74-6f5b-4873-a414-1610669c44c1', '', '', 0, '机号', 1, 1, 12, 0, 'j_h__bGYP', 'varchar', NULL, 1, 1, NULL, '[]', 'null', 'sysadmin', '', '2024-05-08 14:49:00', '2024-07-26 10:01:10', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('fbf60fa0-f3ea-4cb0-aebc-ad14b10c8fdf', '834f6de6-adea-478a-97d2-838aa1d39061', NULL, 'archival_information', 0, '入职年月', 23, 1, NULL, 0, 'r_zh_n_y__zjAc', 'date', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-08 10:19:55', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fc065b17-5c77-4f53-a3fc-6d2a3b147095', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '允许次数', 10, 1, NULL, 0, 'allow_times', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 15:05:27', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fc1ec0e0-f138-46ba-bbf2-ce4b4037507d', '18dab118-6411-40ef-a1ec-bdcdbe2f6c33', NULL, '', 0, '内容', 0, 1, 20, 0, 'content', 'varchar', 0, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 15:03:31', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fc9ff9e1-1c1b-4c0a-aa49-2c4de7f8fce2', 'cf3132ee-d839-4f4c-aca5-23af9a5067aa', NULL, 'flight_information', 0, '带教教员', 39, 1, NULL, 0, 'd_j_j_y__JDPa', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-07 17:14:49', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fcf0f91e-b123-4157-a7ac-1e6e29393329', 'ca3ea1a4-6f77-47ba-a497-aff104d2c109', NULL, '', 0, '螺旋', 12, 1, NULL, 0, 'spiral', 'int', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-03 17:31:58', '2024-07-18 16:58:43', NULL, 'null', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fd636ef0-6b58-440a-9967-f6a98c5824ec', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '其它', 38, 1, 100, 0, 'miscellaneous', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:05:31', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fda4a96c-4519-42a1-a5a6-f501128a7096', 'af6c42b8-c724-4439-8e2e-07aabb2ff9f1', NULL, '', 0, '机号', 1, 1, 12, 0, 'aircraft_serial', 'varchar', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 16:16:00', '2024-07-26 10:01:05', NULL, NULL, 0, 0, 0);
INSERT INTO `column_manage` VALUES ('fdded50b-7293-4cae-bf60-7f45814c8433', '7d031493-b14f-4686-89f5-3bf63b8f8e5f', '', '', 0, '更新时间', 11, 1, NULL, 0, 'update_time', 'datetime', NULL, NULL, NULL, NULL, '[]', 'null', 'sysadmin', '', '2024-05-10 11:43:00', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fddf487b-2faf-4e0c-9a99-f14d70489c9c', 'ebe7ad42-0f87-4d50-a03f-0f9841083f81', NULL, '', 0, 'testrules', 0, 1, 10, 1, 'testrules', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-06-26 15:13:28', '2024-07-18 16:58:43', 10, '\"[1,3]\"', 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fea33aed-a6cc-426c-b447-5c764924b698', 'bf36a05e-7879-4b62-85b8-b255731b1854', NULL, '', 0, '课程', 6, 1, 36, 0, 'course_name', 'varchar', 1, NULL, NULL, NULL, '[{\"tableCol\": \"short_name\", \"tableCode\": \"course_information\"}]', 'null', 'sysadmin', NULL, '2024-05-14 14:23:15', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fed6f605-8c0d-4fe7-bfbd-6cc4f1496230', 'b3753460-89a3-4dff-8008-1a6ad1c40d1c', NULL, '', 0, '备注', 4, 1, 50, 0, 'remarks', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 14:17:10', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('fed9bbba-9e2e-4c07-92f4-0d39f07121b9', '63d07e11-8a57-4a22-a4f0-5d511814a32a', NULL, '', 0, '空域', 26, 1, 100, 0, 'airspace', 'varchar', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-11 17:01:39', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ff465b96-cb23-454f-aaf9-f2e72dee2e43', 'ee7d3153-a7e7-4535-a745-b23e794a60bb', NULL, '', 0, '结束时间', 9, 1, NULL, 0, 'end_time', 'datetime', 1, NULL, NULL, NULL, '[]', 'null', 'sysadmin', NULL, '2024-05-14 14:57:56', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);
INSERT INTO `column_manage` VALUES ('ffcf9b48-3667-4ebb-aa93-85c34cfd2043', '4a19af0a-065f-430c-b616-af0cc7bd7e50', NULL, '', 0, '起落数_1', 23, 1, NULL, 0, 'landings_1', 'int', 1, NULL, NULL, NULL, '[]', NULL, 'sysadmin', NULL, '2024-05-10 17:27:58', '2024-07-18 16:58:43', NULL, NULL, 0, 0, 1);

-- ----------------------------
-- Table structure for data_handle
-- ----------------------------
DROP TABLE IF EXISTS `data_handle`;
CREATE TABLE `data_handle`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备份名称',
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `handle_type` int NULL DEFAULT NULL COMMENT '操作类型，1：备份数据，2：还原数据，3：同步数据，4：还原数据，默认值：1',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备份文件存放路径(或导入/导出临时数据存放路径)，需支持再次导出(下载)',
  `handle_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据备份时间，ftp目录下有backups目录，以这个字段命名',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_handle
-- ----------------------------

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档存放路径ftp',
  `document_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档类型',
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '记录',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档上传人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for flying_service
-- ----------------------------
DROP TABLE IF EXISTS `flying_service`;
CREATE TABLE `flying_service`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据表中文名称',
  `route_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '航线id',
  `plane_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '飞机id',
  `coach_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教员id',
  `student_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学员id',
  `plan_duration` int NOT NULL COMMENT '计划飞行时长',
  `plan_time_start` datetime NOT NULL COMMENT '计划飞行开始时间',
  `plan_time_end` datetime NOT NULL COMMENT '计划飞行结束时间',
  `real_duration` int NULL DEFAULT NULL COMMENT '实际飞行时长',
  `real_time_start` datetime NULL DEFAULT NULL COMMENT '实际飞行开始时间',
  `real_time_end` datetime NULL DEFAULT NULL COMMENT '实际飞行开始时间',
  `status` int NOT NULL COMMENT '计划中，正在进行，按计划完成，补签完成，过时未进行，已调整，已取消',
  `handle_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `handle_user` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `handle_reason` json NULL COMMENT '操作原因',
  `adjust_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调整到其他飞行计划的id, 自关联',
  `description` json NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int NULL DEFAULT 0,
  `expand_data` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `adjust_id`(`adjust_id` ASC) USING BTREE,
  CONSTRAINT `flying_service_ibfk_1` FOREIGN KEY (`adjust_id`) REFERENCES `flying_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of flying_service
-- ----------------------------

-- ----------------------------
-- Table structure for gnss_data
-- ----------------------------
DROP TABLE IF EXISTS `gnss_data`;
CREATE TABLE `gnss_data`  (
  `is_delete` int NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sync_code1` int NULL DEFAULT NULL,
  `sync_code2` int NULL DEFAULT NULL,
  `sync_code3` int NULL DEFAULT NULL,
  `identify_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gps_week` int NULL DEFAULT NULL,
  `gps_milliseconds` int NULL DEFAULT NULL,
  `latitude` float NULL DEFAULT NULL,
  `longitude` float NULL DEFAULT NULL,
  `altitude` float NULL DEFAULT NULL,
  `latitude_stddev` float NULL DEFAULT NULL,
  `longitude_stddev` float NULL DEFAULT NULL,
  `altitude_stddev` float NULL DEFAULT NULL,
  `horizon_speed` float NULL DEFAULT NULL,
  `upward_speed` float NULL DEFAULT NULL,
  `track_direction` float NULL DEFAULT NULL,
  `positioning_status` int NULL DEFAULT NULL,
  `observation_satellite` int NULL DEFAULT NULL,
  `calculate_satellite` int NULL DEFAULT NULL,
  `rtk_satellite` int NULL DEFAULT NULL,
  `differential_age` float NULL DEFAULT NULL,
  `azimuth` float NULL DEFAULT NULL,
  `pitch` float NULL DEFAULT NULL,
  `checksum` int NULL DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flight_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gnss_data
-- ----------------------------

-- ----------------------------
-- Table structure for intermediate_table
-- ----------------------------
DROP TABLE IF EXISTS `intermediate_table`;
CREATE TABLE `intermediate_table`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据 id',
  `correlation_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联 id',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `correlation_id_2`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_3`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_4`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_5`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_6`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_7`(`correlation_id` ASC) USING BTREE,
  INDEX `data_id`(`data_id` ASC) USING BTREE,
  INDEX `correlation_id_8`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_9`(`correlation_id` ASC) USING BTREE,
  INDEX `correlation_id_10`(`correlation_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of intermediate_table
-- ----------------------------

-- ----------------------------
-- Table structure for log_manage
-- ----------------------------
DROP TABLE IF EXISTS `log_manage`;
CREATE TABLE `log_manage`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` int NOT NULL COMMENT '0: debug, 1: info, 2: warning, 3: error',
  `handle_user` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `handle_reason` json NULL COMMENT '操作原因',
  `handle_params` json NULL COMMENT '操作参数',
  `entity_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作数据库表的名字',
  `entity_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的实体id',
  `is_delete` int NULL DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_manage
-- ----------------------------

-- ----------------------------
-- Table structure for menu_manage
-- ----------------------------
DROP TABLE IF EXISTS `menu_manage`;
CREATE TABLE `menu_manage`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表中文名称',
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级菜单',
  `code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码，预留字段',
  `description` json NULL COMMENT '描述',
  `is_delete` int NULL DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `type` int NULL DEFAULT NULL COMMENT '类型：1：主菜单，2：分菜单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NULL DEFAULT NULL COMMENT '列状态：1：显示，2：隐藏',
  `sort` float NULL DEFAULT NULL COMMENT '列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序',
  `icon` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `table_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单对应数据库表，后续一系列的增删改查',
  `use_type` int NULL DEFAULT NULL COMMENT '使用类型：0：录入，1：查询，2：统计，3：到期提醒',
  `tree_mode` tinyint(1) NULL DEFAULT NULL COMMENT '是否可按树结构显示：ture：可以，false：不可以',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE,
  INDEX `parent`(`parent` ASC) USING BTREE,
  CONSTRAINT `menu_manage_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu_manage` (`code`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_manage
-- ----------------------------
INSERT INTO `menu_manage` VALUES ('038a63d6-d527-4d1b-b2ef-c9861e633241', '统计', '_c__bckt', 't_j__d_pH', 'null', 0, 2, '2024-04-28 18:20:54', '2024-05-31 15:54:41', 1, 39, 'Histogram', 'sysadmin', NULL, 'f_j_l_l_b__c__tjzg', 2, 0);
INSERT INTO `menu_manage` VALUES ('04425589-edbf-4e8d-bfa5-ad55dfdb6aba', '人员信息', NULL, 'r_y_x_x__BaXc', 'null', 0, 1, '2024-04-28 10:12:29', '2024-05-31 15:54:41', 1, 0, 'Avatar', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('08a1d480-8cee-42fb-ab07-f1330cd992d0', '查询', 'y_c__QXfs', 'ch_x__wSBx', 'null', 0, 2, '2024-04-28 18:18:47', '2024-05-31 15:54:41', 1, 34, 'Search', 'sysadmin', NULL, 'f_j_l_l_b_y_c__jfbx', 1, 0);
INSERT INTO `menu_manage` VALUES ('08ad37b9-2841-4942-9ae9-0bdc155e8b72', '录入', 'f_j_x_x__Zjhy', 'l_r__rHtM', 'null', 0, 2, '2024-04-28 18:13:25', '2024-05-31 15:54:41', 1, 25, 'EditPen', 'sysadmin', NULL, 'f_j_x_x_d_j_b__hrwm', 0, 0);
INSERT INTO `menu_manage` VALUES ('0ad4b858-fa56-4188-8692-41b19d4c1860', '统计', 's_c__xwCS', 't_j__MQaJ', 'null', 0, 2, '2024-04-28 18:27:25', '2024-05-31 15:54:41', 1, 52, 'Histogram', 'sysadmin', NULL, 'f_d_j_l_l_b_s_c___htt', 2, 0);
INSERT INTO `menu_manage` VALUES ('0f6a10d1-d4fc-46c2-8b32-649b2b3ce82b', '查询', 's_c__YXeW', 'ch_x__Tfmm', 'null', 0, 2, '2024-04-29 10:55:26', '2024-05-31 15:54:41', 1, 64, 'Search', 'sysadmin', NULL, 'l_x_j_l_l_b_s_c__zrmn', 1, 0);
INSERT INTO `menu_manage` VALUES ('1046afe8-68fd-4e92-b08c-c4db292af18b', '到期提醒', 'j_sh_j_c_x_x__zyZQ', 'd_q_t_x__cNRM', 'null', 0, 2, '2024-04-28 13:56:14', '2024-05-31 15:54:41', 1, 22, 'AlarmClock', 'sysadmin', NULL, 'j_sh_j_ch_b__npfb', 3, 0);
INSERT INTO `menu_manage` VALUES ('12b19e28-6638-4515-ba5a-4f7c978ff5ca', '测试内容', 'q_t_x_x__EpEj', 'c_sh_n_r__yYkQ', 'null', 1, 2, '2024-05-10 09:53:25', '2024-05-11 11:40:03', 1, 999, 'SetUp', 'sysadmin', NULL, 'test_time1', 0, 0);
INSERT INTO `menu_manage` VALUES ('14d6ecfd-5e0a-4da5-8343-432983e4f869', '统计', 'y_c__zzRm', 't_j__AHZr', 'null', 0, 2, '2024-04-28 18:24:28', '2024-05-31 15:54:41', 1, 44, 'Histogram', 'sysadmin', NULL, 'f_d_j_l_l_b_y_c__mhds', 2, 0);
INSERT INTO `menu_manage` VALUES ('1762496b-4867-4c09-a8ff-d77cebc058bd', '一册', 'f_d_j_l_l_x_x__atRb', 'y_c__zzRm', 'null', 0, 2, '2024-04-28 18:23:32', '2024-05-31 15:54:41', 1, 41, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('1897605b-26ad-45d6-bef4-f8d9ff104019', '录入', '_c__bckt', 'l_r__CRiJ', 'null', 0, 2, '2024-04-28 18:20:21', '2024-05-31 15:54:41', 1, 37, 'EditPen', 'sysadmin', NULL, 'f_j_l_l_b__c__tjzg', 0, 0);
INSERT INTO `menu_manage` VALUES ('18a8713d-c10b-4f8b-907d-2a631790bc7d', '二册', 'f_j_l_l_x_x__edXy', '_c__bckt', 'null', 0, 2, '2024-04-28 18:20:00', '2024-05-31 15:54:41', 1, 36, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('18a8a37d-b864-4556-8bde-3f4bf023dc60', '螺旋桨履历信息', 'f_j_b_j__YQRx', 'l_x_j_l_l_x_x__MmaD', 'null', 0, 2, '2024-04-28 18:29:11', '2024-05-31 15:54:41', 1, 53, 'Orange', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('1b047ab3-0ef5-43f6-af57-94ffcd95c445', '飞机部件', NULL, 'f_j_b_j__YQRx', 'null', 0, 1, '2024-04-28 10:12:52', '2024-05-31 15:54:41', 1, 23, 'Promotion', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('1b10e366-a10c-4f9b-b692-f91724bb4996', '飞行规划', NULL, 'f_x_g_h__AKJw', 'null', 0, 1, '2024-04-28 10:13:23', '2024-07-12 11:04:07', 1, 89, 'HelpFilled', 'sysadmin', 'sysadmin', '', 0, 0);
INSERT INTO `menu_manage` VALUES ('1bdf14bf-1adf-43a6-8315-3eac42c59e6d', '飞行安全', NULL, 'f_x_a_q__Lpni', 'null', 0, 1, '2024-04-28 10:14:22', '2024-07-12 11:04:07', 1, 105, 'Platform', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('1d1cf3fd-842c-4273-9583-ad10a4868c46', '检查类别字典', 'z_d_g_l__MQtH', 'j_ch_l_b_z_d__XRD_', 'null', 0, 2, '2024-04-28 10:40:15', '2024-07-12 11:04:08', 1, 145, 'DocumentChecked', 'sysadmin', NULL, 'd_j_l_b_z_d__wxwj', 0, 0);
INSERT INTO `menu_manage` VALUES ('1d575acb-009a-4c2d-8bd6-fbaf329409b5', '已实施飞行计划基础信息表', 'y_zh_x_f_x_j_h_g_l__FdaQ', 'y_sh_sh_f_x_j_h_j_ch_x_x_b__fiMs', 'null', 0, 2, '2024-07-12 16:54:40', '2024-07-12 16:54:40', 1, 999, 'DocumentChecked', 'sysadmin', NULL, 'executed_flight_plan_base', 0, 0);
INSERT INTO `menu_manage` VALUES ('1e26a891-22a6-4e8a-b502-3159e18f5b87', '预览', 'h_d_k_g_l__WnmJ', 'y_l__TWcX', 'null', 0, 2, '2024-04-28 17:39:26', '2024-07-12 11:04:07', 1, 92, 'View', 'sysadmin', NULL, 'h_d_k_g_l__gm_n', 4, 0);
INSERT INTO `menu_manage` VALUES ('1ef338b2-8fe8-441f-b870-bd25342a6c7b', '查询', 'k_sh_ch_j_g_l__dcDF', 'ch_x__DBfP', 'null', 0, 2, '2024-05-06 10:09:58', '2024-07-12 11:04:07', 1, 84, 'Search', 'sysadmin', 'sysadmin', 'exam_result', 1, 0);
INSERT INTO `menu_manage` VALUES ('20f95441-3bca-42ae-b6cb-ee3a0af63d9d', '体检类型字典', 'z_d_g_l__MQtH', 't_j_l_x_z_d__cXeY', 'null', 0, 2, '2024-04-28 10:33:58', '2024-07-12 11:04:08', 1, 135, 'Checked', 'sysadmin', NULL, 't_j_l_x_z_d__mpwc', 0, 0);
INSERT INTO `menu_manage` VALUES ('210029bc-cfd5-4080-8623-e62e5ae1a890', '飞行评估查询', 'f_x_p_g__Gztf', 'f_x_p_g_ch_x__NWRM', 'null', 0, 2, '2024-05-06 10:14:44', '2024-07-12 11:04:08', 1, 115, 'Search', 'sysadmin', NULL, NULL, 1, 0);
INSERT INTO `menu_manage` VALUES ('221adad6-b09a-411a-8987-3ce0d704392e', '教学日志', 'd_m_j_x__DPdw', 'j_x_r_zh__Ytwa', 'null', 0, 2, '2024-05-06 10:04:59', '2024-05-31 15:54:41', 1, 75, 'DocumentCopy', 'sysadmin', 'sysadmin', 'teaching_journal', 0, 0);
INSERT INTO `menu_manage` VALUES ('23776faa-fc15-431d-a7da-3fe3b52af7a3', '总览', 'c_x_k_m__rPrS', 'general_view', 'null', 0, 2, '2024-07-02 14:33:11', '2024-07-12 11:04:07', 1, 102, 'Postcard', 'sysadmin', NULL, 'flight_plan_subject', 0, 0);
INSERT INTO `menu_manage` VALUES ('250bdec0-3c42-424a-b728-e7a95ab1288b', '教学等级字典', 'z_d_g_l__MQtH', 'j_x_d_j_z_d__YTmj', 'null', 0, 2, '2024-04-28 10:31:13', '2024-07-12 11:04:08', 1, 132, 'School', 'sysadmin', NULL, 'j_x_d_j_z_d__bfkk', 0, 0);
INSERT INTO `menu_manage` VALUES ('27b373c3-5f76-437e-bcd1-eb4970549d50', '查询', 'j_x_r_zh__Ytwa', 'ch_x__zciQ', 'null', 0, 2, '2024-05-06 10:05:32', '2024-05-31 15:54:41', 1, 77, 'Search', 'sysadmin', 'sysadmin', 'teaching_journal', 1, 0);
INSERT INTO `menu_manage` VALUES ('29a99d8d-332c-4f68-94ad-434b9107bb5e', '机场信息登记', 'q_t_x_x__EpEj', 'j_ch_x_x_d_j__jENy', 'null', 0, 2, '2024-04-28 13:41:54', '2024-07-12 11:04:08', 1, 120, 'Cpu', 'sysadmin', NULL, 'j_ch_x_x_d_j_b__rsqm', 0, 0);
INSERT INTO `menu_manage` VALUES ('2a873532-58c4-45ea-ba29-688a5bd9b14c', '飞行评估', NULL, 'f_x_p_g__Gztf', 'null', 0, 1, '2024-04-28 10:14:44', '2024-07-12 11:04:07', 1, 108, 'TrendCharts', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('2c12eca1-1e59-453c-a1b1-9a23dc70b8b7', '体检信息', 'r_y_x_x__BaXc', 't_j_x_x__beCt', 'null', 0, 2, '2024-04-28 13:54:34', '2024-05-31 15:54:41', 1, 17, 'Checked', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('3465322d-bca9-4381-b341-5eebeb9ff1aa', '管理', 'j_x_r_zh__Ytwa', 'g_l__apTx', 'null', 0, 2, '2024-05-06 10:05:16', '2024-05-31 15:54:41', 1, 76, 'Management', 'sysadmin', 'sysadmin', 'teaching_journal', 0, 0);
INSERT INTO `menu_manage` VALUES ('35613869-7742-4e05-ab69-60aeaad73391', '动作识别数据表', 'p_g_g_z_sh_zh__fJay', 'd_z_sh_b_sh_j_b__pxKF', 'null', 1, 1, '2024-05-11 16:03:28', '2024-05-11 16:12:27', 1, 999, 'Operation', 'sysadmin', 'sysadmin', 'flight_estimate', 0, 0);
INSERT INTO `menu_manage` VALUES ('356a91a5-b516-48c0-8fce-7b404d227eaa', '在线学习', 'd_m_j_x__DPdw', 'z_x_x_x__pADh', 'null', 0, 2, '2024-05-06 10:07:11', '2024-05-31 15:54:41', 1, 79, 'Edit', 'sysadmin', NULL, NULL, 0, 0);
INSERT INTO `menu_manage` VALUES ('36a70ab4-a21c-4b02-aea8-8c0352ed1b45', '发动机位置字典', 'z_d_g_l__MQtH', 'f_d_j_w_zh_z_d__TcHk', 'null', 0, 2, '2024-05-08 17:07:20', '2024-07-12 11:04:08', 1, 146, 'Tickets', 'sysadmin', NULL, 'engine_position_dict', 0, 0);
INSERT INTO `menu_manage` VALUES ('36aa0bed-902e-4ca4-8c8b-f83990e44567', '考试成绩管理', 'd_m_j_x__DPdw', 'k_sh_ch_j_g_l__dcDF', 'null', 0, 2, '2024-05-06 10:09:21', '2024-07-12 11:04:07', 1, 82, 'Notebook', 'sysadmin', 'sysadmin', 'exam_result', 0, 0);
INSERT INTO `menu_manage` VALUES ('36c24d4e-b657-46c4-b17d-e74778579891', '分项成绩', 'f_x_j_c_p_g__NPKr', 'f_x_ch_j__zAAz', 'null', 0, 2, '2024-05-11 16:39:13', '2024-07-12 11:04:08', 1, 111, 'Checked', 'sysadmin', 'sysadmin', 'flight_subitem_socre', 0, 0);
INSERT INTO `menu_manage` VALUES ('37035bba-e221-464f-9975-81872b26364e', '机型信息登记', 'q_t_x_x__EpEj', 'j_x_x_x_d_j__JRAy', 'null', 0, 2, '2024-04-28 13:41:13', '2024-07-12 11:04:08', 1, 118, 'Brush', 'sysadmin', NULL, 'j_x_d_j_b__ddkz', 0, 0);
INSERT INTO `menu_manage` VALUES ('3776479d-608f-4f00-bcd7-c6bc857545e6', '录入', 'y_c__QXfs', 'l_r__FZiT', 'null', 0, 2, '2024-04-28 18:18:26', '2024-05-31 15:54:41', 1, 33, 'EditPen', 'sysadmin', NULL, 'f_j_l_l_b_y_c__jfbx', 0, 0);
INSERT INTO `menu_manage` VALUES ('387e5d85-303a-4c04-89f8-2413e461c2f2', '查询', 'q_t_r_y_x_x__TTSH', 'ch_x___MAc', 'null', 0, 2, '2024-04-28 13:53:21', '2024-05-31 15:54:41', 1, 15, 'Search', 'sysadmin', NULL, 'q_t_r_y_b__nfrc', 1, 0);
INSERT INTO `menu_manage` VALUES ('3b8f2845-88d0-45cf-92b2-0894ff52808f', '飞行等级字典', 'z_d_g_l__MQtH', 'f_x_d_j_z_d__wbEd', 'null', 0, 2, '2024-04-28 10:33:27', '2024-07-12 11:04:08', 1, 134, 'Position', 'sysadmin', NULL, 'f_x_d_j_z_d__nmta', 0, 0);
INSERT INTO `menu_manage` VALUES ('3bd271a5-eba4-43a4-a3c8-d4be0e76c671', '考试管理', 'd_m_j_x__DPdw', 'k_sh_g_l__P_Gb', 'null', 0, 2, '2024-05-06 10:06:48', '2024-05-31 15:54:41', 1, 78, 'SuccessFilled', 'sysadmin', 'sysadmin', 'examination', 0, 0);
INSERT INTO `menu_manage` VALUES ('3c592579-7219-43b0-bf56-0a4cf052d099', '试卷详细信息', 'sh_j_z_t_x_x_g_l__MXdK', 'details_information', 'null', 0, 2, '2024-07-12 10:56:39', '2024-07-12 11:04:07', 1, 88, 'Tickets', 'sysadmin', NULL, 'exam_result_detail', 0, 0);
INSERT INTO `menu_manage` VALUES ('3ce271a1-b178-4677-a4e3-37e8bb50ccd4', '试卷总体信息', 'sh_j_z_t_x_x_g_l__MXdK', 'general_information', 'null', 0, 2, '2024-07-12 10:55:27', '2024-07-12 11:04:07', 1, 87, 'Tickets', 'sysadmin', NULL, 'paper_info', 0, 0);
INSERT INTO `menu_manage` VALUES ('3d750e6d-44e9-40e2-9aa4-f2175b5604d1', '总成绩', 'f_x_j_c_p_g__NPKr', 'z_ch_j__Q_zs', 'null', 0, 2, '2024-05-11 16:38:29', '2024-07-12 11:04:08', 1, 110, 'Checked', 'sysadmin', NULL, 'flight_total_score', 0, 0);
INSERT INTO `menu_manage` VALUES ('3f180ad6-872f-457b-9726-7645a39da05f', '参训科目', 'f_x_j_h_g_l__kTWW', 'c_x_k_m__rPrS', 'null', 0, 2, '2024-06-03 16:30:29', '2024-07-12 11:04:07', 1, 101, 'Tickets', 'sysadmin', NULL, 'flight_plan_subject', 0, 0);
INSERT INTO `menu_manage` VALUES ('4171441f-93fe-4ce5-9ba3-dcd1719efa33', '其他信息', NULL, 'q_t_x_x__EpEj', 'null', 0, 1, '2024-04-28 10:15:12', '2024-07-12 11:04:08', 1, 116, 'Menu', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('417f32bd-10fb-4f41-8eaf-335de3ee03b0', '查询', 'j_y_x_x__WGK_', 'ch_x__HZaD', 'null', 0, 2, '2024-04-28 13:48:03', '2024-05-31 15:54:41', 1, 3, 'Search', 'sysadmin', NULL, 'j_y_x_x_b__etdf', 1, 0);
INSERT INTO `menu_manage` VALUES ('429583ad-5084-4f62-a5cd-fcf4370b95b8', '发动机履历信息', 'f_j_b_j__YQRx', 'f_d_j_l_l_x_x__atRb', 'null', 0, 2, '2024-04-28 18:23:10', '2024-05-31 15:54:41', 1, 40, 'Ticket', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('43add956-c126-4190-8712-7ccd5303fef6', '飞行评估阶段字典', 'z_d_g_l__MQtH', 'f_x_p_g_j_d_z_d__SbQi', 'null', 0, 2, '2024-05-11 15:08:15', '2024-07-12 11:04:08', 1, 148, 'Document', 'sysadmin', NULL, 'flight_evaluation_phase_dict', 0, 0);
INSERT INTO `menu_manage` VALUES ('448b8460-f831-4083-9469-af2d72cf056a', '计划状态字典', 'z_d_g_l__MQtH', 'j_h_zh_t_z_d__zjWs', 'null', 0, 2, '2024-04-28 10:38:44', '2024-07-12 11:04:08', 1, 143, 'CircleCheck', 'sysadmin', NULL, 'j_h_zh_t_z_d__pkfp', 0, 0);
INSERT INTO `menu_manage` VALUES ('4e776400-fb20-4282-8508-96e8f11acc3a', '统计', '_c__CiYQ', 't_j__MdEe', 'null', 0, 2, '2024-04-28 18:26:01', '2024-05-31 15:54:41', 1, 48, 'Histogram', 'sysadmin', NULL, 'f_d_j_l_l_b__c__ttrw', 2, 0);
INSERT INTO `menu_manage` VALUES ('51130c41-0840-493b-9181-258c8b948f36', '统计', 'k_sh_ch_j_g_l__dcDF', 't_j__NpbA', 'null', 0, 2, '2024-05-06 10:09:43', '2024-07-12 11:04:07', 1, 83, 'Management', 'sysadmin', 'sysadmin', 'exam_result', 0, 0);
INSERT INTO `menu_manage` VALUES ('525fc68c-5435-4c1a-bf72-50ed9828f240', '飞行架次评估', 'f_x_p_g__Gztf', 'f_x_j_c_p_g__NPKr', 'null', 0, 2, '2024-05-06 10:11:59', '2024-07-12 11:04:07', 1, 109, 'Position', 'sysadmin', NULL, NULL, 0, 0);
INSERT INTO `menu_manage` VALUES ('5472e271-4d05-4759-944b-3f432279f4e6', '查询', 'x_y_x_x__SSpx', 'ch_x__i_Mf', 'null', 0, 2, '2024-04-28 13:51:45', '2024-05-31 15:54:41', 1, 11, 'Search', 'sysadmin', NULL, 'x_y_x_x_b__dxtc', 1, 0);
INSERT INTO `menu_manage` VALUES ('55386d62-c89f-4cda-bdfe-83e4b39609ad', '专业字典', 'z_d_g_l__MQtH', 'zh_y_z_d___bTA', 'null', 0, 2, '2024-04-28 10:34:18', '2024-07-12 11:04:08', 1, 136, 'Guide', 'sysadmin', NULL, 'zh_y_z_d__hwxr', 0, 0);
INSERT INTO `menu_manage` VALUES ('593cd0ba-001f-45e9-bc27-e23af650f7bb', '录入', 'q_t_r_y_x_x__TTSH', 'l_r__CSJB', 'null', 0, 2, '2024-04-28 13:53:02', '2024-05-31 15:54:41', 1, 14, 'EditPen', 'sysadmin', NULL, 'q_t_r_y_b__nfrc', 0, 0);
INSERT INTO `menu_manage` VALUES ('5e03c81e-475f-4480-bb8b-7e3e70e473bd', '一册', 'f_j_l_l_x_x__edXy', 'y_c__QXfs', 'null', 0, 2, '2024-04-28 18:18:04', '2024-05-31 15:54:41', 1, 32, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('5e6b0577-9598-454b-b2a9-cc98f91d3c91', '学员信息', 'r_y_x_x__BaXc', 'x_y_x_x__SSpx', 'null', 0, 2, '2024-04-28 13:51:06', '2024-05-31 15:54:41', 1, 9, 'UserFilled', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('611fce38-acd5-476a-b416-0b5026e16b63', '内容字典', 'z_d_g_l__MQtH', 'n_r_z_d__Xpzp', 'null', 0, 2, '2024-05-09 09:42:32', '2024-07-12 11:04:08', 1, 147, 'Box', 'sysadmin', NULL, 'content_dict', 0, 0);
INSERT INTO `menu_manage` VALUES ('6446c20e-9dc7-48fa-8aff-36a6971e2183', '三册', 'l_x_j_l_l_x_x__MmaD', 's_c__YXeW', 'null', 0, 2, '2024-04-29 10:54:48', '2024-05-31 15:54:41', 1, 62, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('64ff18cb-bcb4-4acc-93e8-45c03a34107e', '气象字典', 'z_d_g_l__MQtH', 'q_x_z_d__BbSw', 'null', 0, 2, '2024-04-28 10:38:15', '2024-07-12 11:04:08', 1, 142, 'PartlyCloudy', 'sysadmin', NULL, 'q_x_z_d__znar', 0, 0);
INSERT INTO `menu_manage` VALUES ('653eb32a-c688-4018-83a6-55f5604a5c4f', '查询', 'j_zh_j_y_x_x__NmGt', 'ch_x__Ckmc', 'null', 0, 2, '2024-04-28 13:49:57', '2024-05-31 15:54:41', 1, 7, 'Search', 'sysadmin', NULL, 'j_zh_j_y_x_x_b__ebez', 1, 0);
INSERT INTO `menu_manage` VALUES ('65bc87fc-3a57-454b-94b2-cd3ae72f6ead', '录入', 'h_d_k_g_l__WnmJ', 'l_r__ShDQ', 'null', 0, 2, '2024-04-28 17:38:10', '2024-07-12 11:04:07', 1, 91, 'EditPen', 'sysadmin', NULL, 'h_d_k_g_l__gm_n', 4, 0);
INSERT INTO `menu_manage` VALUES ('65d0c015-4d78-46cd-b245-951bdf0dce55', '飞机信息', 'f_j_b_j__YQRx', 'f_j_x_x__Zjhy', 'null', 0, 2, '2024-04-28 18:13:03', '2024-05-31 15:54:41', 1, 24, 'Promotion', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('680107e8-3d4a-4aa4-b107-14b6d811964d', '录入', 'q_t_b_j_x_x__BBCC', 'l_r__mPxJ', 'null', 0, 2, '2024-04-29 10:57:19', '2024-05-31 15:54:41', 1, 67, 'EditPen', 'sysadmin', NULL, 'q_t_b_j_x_x_b__niex', 0, 0);
INSERT INTO `menu_manage` VALUES ('683ff9fb-c987-4001-b71b-2fcfa67d4f8a', '录入', 'x_y_x_x__SSpx', 'l_r__ESfC', 'null', 0, 2, '2024-04-28 13:51:28', '2024-05-31 15:54:41', 1, 10, 'EditPen', 'sysadmin', NULL, 'x_y_x_x_b__dxtc', 0, 0);
INSERT INTO `menu_manage` VALUES ('695236d0-2681-4ad6-9a74-5ab5719ef6cd', '空域信息登记', 'q_t_x_x__EpEj', 'k_y_x_x_d_j__ntDm', 'null', 0, 2, '2024-04-28 13:42:21', '2024-07-12 11:04:08', 1, 121, 'Sunrise', 'sysadmin', NULL, 'k_y_x_x_d_j_b__rxsr', 0, 0);
INSERT INTO `menu_manage` VALUES ('697fcf78-f7f1-4d40-b2f8-e5e2c88907e4', '已执行飞行计划管理', 'f_x_g_h__AKJw', 'y_zh_x_f_x_j_h_g_l__FdaQ', 'null', 0, 2, '2024-07-12 16:52:39', '2024-07-12 16:52:39', 1, 999, 'Notebook', 'sysadmin', NULL, NULL, 0, 0);
INSERT INTO `menu_manage` VALUES ('6ade68a4-d05d-46b8-bf26-cb9fe9add4f6', '录入', 'f_j_s_zh_x_x__jsmG', 'l_r__RhdY', 'null', 0, 2, '2024-04-28 18:15:46', '2024-05-31 15:54:41', 1, 29, 'EditPen', 'sysadmin', NULL, 's_zh_x_x_d_j_b__mr_p', 0, 0);
INSERT INTO `menu_manage` VALUES ('6b36458f-c99f-47fd-8cae-552ef3e3314b', '题型字典', 'z_d_g_l__MQtH', 't_x_z_d__EYtf', 'null', 0, 2, '2024-04-28 10:37:22', '2024-07-12 11:04:08', 1, 140, 'Edit', 'sysadmin', NULL, 't_x_z_d__z_m_', 0, 0);
INSERT INTO `menu_manage` VALUES ('6ba5170b-269d-44aa-9490-4b890aa512e2', '飞行动作管理', 'f_x_p_g__Gztf', 'flight_action', 'null', 0, 2, '2024-07-01 10:14:13', '2024-07-12 11:04:08', 1, 112, 'Files', 'sysadmin', NULL, 'flight_action', 0, 0);
INSERT INTO `menu_manage` VALUES ('6cf3b855-ca49-453c-a831-4b2d3354fffc', '查询', 'y_c__zzRm', 'ch_x__mcdA', 'null', 0, 2, '2024-04-28 18:24:09', '2024-05-31 15:54:41', 1, 43, 'Search', 'sysadmin', NULL, 'f_d_j_l_l_b_y_c__mhds', 1, 0);
INSERT INTO `menu_manage` VALUES ('6dd485f7-483b-444e-b9b3-8b14e83b0234', '二册', 'f_d_j_l_l_x_x__atRb', '_c__CiYQ', 'null', 0, 2, '2024-04-28 18:24:58', '2024-05-31 15:54:41', 1, 45, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('6e614242-b9eb-4074-873b-d697de2c2a19', '详细信息', 'c_x_k_m__rPrS', 'detailed_information', 'null', 0, 2, '2024-07-02 14:34:28', '2024-07-12 11:04:07', 1, 103, 'Document', 'sysadmin', NULL, 'flight_subject_details', 0, 0);
INSERT INTO `menu_manage` VALUES ('6fbcdf0e-f227-4097-9fe0-202d8cae312d', '一册', 'l_x_j_l_l_x_x__MmaD', 'y_c__bteh', 'null', 0, 2, '2024-04-28 18:29:33', '2024-05-31 15:54:41', 1, 54, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('71530b76-7c56-4ea6-afc4-4fcfbfd0af10', '计划内容', 'f_x_j_h_g_l__kTWW', 'j_h_z_d__Wlic', 'null', 0, 2, '2024-04-28 17:43:17', '2024-07-12 11:04:07', 1, 98, 'Calendar', 'sysadmin', 'sysadmin', 'flight_plan_content', 8, 0);
INSERT INTO `menu_manage` VALUES ('750ca663-c0e0-4682-bf6d-0c2fb03deb3c', '技术检测信息', 'r_y_x_x__BaXc', 'j_sh_j_c_x_x__zyZQ', 'null', 0, 2, '2024-04-28 13:55:33', '2024-05-31 15:54:41', 1, 20, 'DocumentChecked', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('77a5f9fe-6111-4f64-b016-5ea936a4ec27', '评估规则设置', 'f_x_p_g__Gztf', 'p_g_g_z_sh_zh__fJay', 'null', 0, 2, '2024-05-06 10:14:20', '2024-07-12 11:04:08', 1, 114, 'Box', 'sysadmin', 'sysadmin', 'flight_estimate', 0, 0);
INSERT INTO `menu_manage` VALUES ('7bfa0197-6c37-4471-9876-301b2b25b5e1', '统计', '_c__bmwJ', 't_j__sGJK', 'null', 0, 2, '2024-04-28 18:37:43', '2024-05-31 15:54:41', 1, 61, 'Histogram', 'sysadmin', NULL, 'l_x_j_l_l_b__c__jbdq', 2, 0);
INSERT INTO `menu_manage` VALUES ('7d1ea571-565e-488a-afdc-f4cc00af3dc5', '录入', 'y_c__zzRm', 'l_r__eGdM', 'null', 0, 2, '2024-04-28 18:23:51', '2024-05-31 15:54:41', 1, 42, 'EditPen', 'sysadmin', NULL, 'f_d_j_l_l_b_y_c__mhds', 0, 0);
INSERT INTO `menu_manage` VALUES ('7debd827-2b89-4462-9781-1540d13c0dbb', '版本字典', 'z_d_g_l__MQtH', 'b_b_z_d__ShPz', 'null', 0, 2, '2024-04-28 10:39:50', '2024-07-12 11:04:08', 1, 144, 'Management', 'sysadmin', NULL, 'b_b_z_d__p_hs', 0, 0);
INSERT INTO `menu_manage` VALUES ('8037f67a-16f7-4485-aeb2-7f9ba85e9056', '到期提醒', 'q_t_b_j_x_x__BBCC', 'd_q_t_x__GFGW', 'null', 0, 2, '2024-04-29 10:57:36', '2024-05-31 15:54:41', 1, 68, 'AlarmClock', 'sysadmin', NULL, 'q_t_b_j_x_x_b__niex', 3, 0);
INSERT INTO `menu_manage` VALUES ('80f324a7-fef4-4baa-a926-f367a3970555', '二册 ', 'l_x_j_l_l_x_x__MmaD', '_c__bmwJ', 'null', 0, 2, '2024-04-28 18:32:44', '2024-05-31 15:54:41', 1, 58, 'Reading', 'sysadmin', 'sysadmin', '', 0, 0);
INSERT INTO `menu_manage` VALUES ('81949851-1dd9-431c-9ac5-269f4dc63cbb', '录入', 'y_c__bteh', 'l_r__aKJb', 'null', 0, 2, '2024-04-28 18:29:55', '2024-05-31 15:54:41', 1, 55, 'EditPen', 'sysadmin', NULL, 'l_x_j_l_l_b_y_c__wspr', 0, 0);
INSERT INTO `menu_manage` VALUES ('83b08c77-d27f-4360-8962-cb8ad376223d', '飞行评估类型字典', 'z_d_g_l__MQtH', 'f_x_p_g_l_x_z_d__AyC_', 'null', 0, 2, '2024-05-11 15:08:44', '2024-07-12 11:04:08', 1, 149, 'Document', 'sysadmin', NULL, 'flight_evaluation_type_dict', 0, 0);
INSERT INTO `menu_manage` VALUES ('853f002a-4b7a-4979-8038-40994f1d727b', '考试信息管理', 'd_m_j_x__DPdw', 'sh_j_z_t_x_x_g_l__MXdK', 'null', 0, 2, '2024-07-12 10:53:53', '2024-07-12 11:04:07', 1, 85, 'School', 'sysadmin', 'sysadmin', NULL, 0, 0);
INSERT INTO `menu_manage` VALUES ('865737db-6b20-4843-866c-805a8d25dbec', '查询', 'y_c__bteh', 'ch_x__aNQa', 'null', 0, 2, '2024-04-28 18:30:16', '2024-05-31 15:54:41', 1, 56, 'Search', 'sysadmin', NULL, 'l_x_j_l_l_b_y_c__wspr', 1, 0);
INSERT INTO `menu_manage` VALUES ('87bb2ac8-0b93-4b99-9f7d-32869ff12d93', '查询', 's_c__xwCS', 'ch_x__iPMc', 'null', 0, 2, '2024-04-28 18:27:06', '2024-05-31 15:54:41', 1, 51, 'Search', 'sysadmin', NULL, 'f_d_j_l_l_b_s_c___htt', 1, 0);
INSERT INTO `menu_manage` VALUES ('89163529-6200-4645-b41f-f9e8db527014', '到期提醒', 'f_j_s_zh_x_x__jsmG', 'd_q_t_x__AhDW', 'null', 0, 2, '2024-04-28 18:16:09', '2024-05-31 15:54:41', 1, 30, 'AlarmClock', 'sysadmin', NULL, 's_zh_x_x_d_j_b__mr_p', 3, 0);
INSERT INTO `menu_manage` VALUES ('8b902c4f-504f-4348-a6a3-5e29e576961d', '飞机履历信息', 'f_j_b_j__YQRx', 'f_j_l_l_x_x__edXy', 'null', 0, 2, '2024-04-28 18:17:07', '2024-05-31 15:54:41', 1, 31, 'Flag', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('8c044eb3-17d1-42b3-a949-925a306e97af', '兼职教员信息', 'r_y_x_x__BaXc', 'j_zh_j_y_x_x__NmGt', 'null', 0, 2, '2024-04-28 13:49:16', '2024-05-31 15:54:41', 1, 5, 'User', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('8d4da03c-3e36-44e1-a881-db0b26547316', '单位信息登记', 'q_t_x_x__EpEj', 'd_w_x_x_d_j__RKFD', 'null', 0, 2, '2024-04-28 13:40:18', '2024-07-12 11:04:08', 1, 117, 'OfficeBuilding', 'sysadmin', NULL, 'd_w_d_j_b__dxfz', 0, 1);
INSERT INTO `menu_manage` VALUES ('8f9a1631-e4a3-47e0-85fb-99d527531df6', '学历字典', 'z_d_g_l__MQtH', 'x_l_z_d___RZn', 'null', 0, 2, '2024-04-28 10:30:29', '2024-07-12 11:04:08', 1, 130, 'Notebook', 'sysadmin', NULL, 'x_l_z_d__hcyh', 0, 0);
INSERT INTO `menu_manage` VALUES ('8fa3ba96-1555-4c03-963a-75e2733394fe', '航点库管理', 'f_x_g_h__AKJw', 'h_d_k_g_l__WnmJ', 'null', 0, 2, '2024-04-28 17:37:11', '2024-07-12 11:04:07', 1, 90, 'MagicStick', 'sysadmin', 'sysadmin', '', 0, 0);
INSERT INTO `menu_manage` VALUES ('903c70f5-60a0-454b-aa40-655c11603bec', '其他部件信息', 'f_j_b_j__YQRx', 'q_t_b_j_x_x__BBCC', 'null', 0, 2, '2024-04-29 10:56:49', '2024-05-31 15:54:41', 1, 66, 'MoreFilled', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('90aa42bb-713c-4a2b-a669-fdddfa0cae1c', '参训人员', 'f_x_j_h_g_l__kTWW', 'c_x_r_y__GesT', 'null', 0, 2, '2024-06-03 16:29:45', '2024-07-12 11:04:07', 1, 99, 'Stamp', 'sysadmin', NULL, 'flight_plan_pilot', 0, 0);
INSERT INTO `menu_manage` VALUES ('9206ac58-5fef-4670-80f6-7209c8a0d9c0', '实时监控', 'f_x_a_q__Lpni', 's_s_j_k__XXyz', 'null', 0, 2, '2024-04-30 14:42:43', '2024-07-12 11:04:07', 1, 106, 'Monitor', 'sysadmin', NULL, NULL, 6, 0);
INSERT INTO `menu_manage` VALUES ('93cc9721-084e-4e52-a336-fa7fb767af48', '录入', '_c__bmwJ', 'l_r__DEnf', 'null', 0, 2, '2024-04-28 18:33:25', '2024-05-31 15:54:41', 1, 59, 'EditPen', 'sysadmin', NULL, 'l_x_j_l_l_b__c__jbdq', 0, 0);
INSERT INTO `menu_manage` VALUES ('94436b8d-55a7-4021-af81-4072a2c6ba6c', '参训飞机', 'f_x_j_h_g_l__kTWW', 'c_x_f_j__TwTh', 'null', 0, 2, '2024-06-03 16:28:12', '2024-07-12 11:04:07', 1, 100, 'Promotion', 'sysadmin', 'sysadmin', 'flight_plan_plane', 0, 0);
INSERT INTO `menu_manage` VALUES ('96203bb4-1f60-441f-a24f-2600951f6b5d', '录入', 'j_y_x_x__WGK_', 'l_r__bDkN', 'null', 0, 2, '2024-04-28 13:47:46', '2024-05-31 15:54:41', 1, 2, 'EditPen', 'sysadmin', NULL, 'j_y_x_x_b__etdf', 0, 0);
INSERT INTO `menu_manage` VALUES ('995a6a8d-65c5-4fb0-ba58-5929b234e729', '统计', 'x_y_x_x__SSpx', 't_j__weSm', 'null', 0, 2, '2024-04-28 13:52:22', '2024-05-31 15:54:41', 1, 12, 'Histogram', 'sysadmin', NULL, 'x_y_x_x_b__dxtc', 2, 0);
INSERT INTO `menu_manage` VALUES ('9979b6fa-f40a-4fac-8b3b-e9e63af6e8c9', '飞机状态字典', 'z_d_g_l__MQtH', 'f_j_zh_t_z_d__ZtR_', 'null', 0, 2, '2024-04-28 10:36:22', '2024-07-12 11:04:08', 1, 138, 'CircleCheckFilled', 'sysadmin', NULL, 'f_j_zh_t_z_d__zfmb', 0, 0);
INSERT INTO `menu_manage` VALUES ('9a888419-8702-49d3-94fa-2057b752c53f', '规划', 'f_x_h_x_g_l__QyEG', 'g_h__SPfS', 'null', 0, 2, '2024-04-28 17:41:00', '2024-07-12 11:04:07', 1, 94, 'EditPen', 'sysadmin', NULL, 'h_x_g_l__gfxb', 5, 0);
INSERT INTO `menu_manage` VALUES ('9ca16d8d-650c-4f70-bc2c-c57edebef925', '飞行回放', 'f_x_a_q__Lpni', 'f_x_h_f__p_se', 'null', 0, 2, '2024-04-30 14:43:10', '2024-07-12 11:04:07', 1, 107, 'VideoCameraFilled', 'sysadmin', NULL, NULL, 7, 0);
INSERT INTO `menu_manage` VALUES ('a2009023-b150-4242-aedc-6d421bbd8771', '特情处置手册', 'q_t_x_x__EpEj', 't_q_ch_zh_sh_c__CYnF', 'null', 0, 2, '2024-07-22 15:24:47', '2024-07-24 10:06:54', 1, 999, 'Tickets', 'sysadmin', 'sysadmin', 'special_situation_manual', 0, 0);
INSERT INTO `menu_manage` VALUES ('a4b948d3-a0f0-41f8-8815-7cbc65ad3f57', '飞行计划类型字典', 'z_d_g_l__MQtH', 'f_x_j_h_l_x_z_d__MZDP', 'null', 0, 2, '2024-04-28 10:37:53', '2024-07-12 11:04:08', 1, 141, 'Odometer', 'sysadmin', NULL, 'f_x_j_h_l_x_z_d__wpca', 0, 0);
INSERT INTO `menu_manage` VALUES ('a685424a-6c15-436e-8916-105ec8748cdb', '录入', 'j_zh_j_y_x_x__NmGt', 'l_r__JHDY', 'null', 0, 2, '2024-04-28 13:49:39', '2024-05-31 15:54:41', 1, 6, 'EditPen', 'sysadmin', NULL, 'j_zh_j_y_x_x_b__ebez', 0, 0);
INSERT INTO `menu_manage` VALUES ('a7d41b85-daf0-4d40-a974-944e990a2bac', '飞机三证信息', 'f_j_b_j__YQRx', 'f_j_s_zh_x_x__jsmG', 'null', 0, 2, '2024-04-28 18:15:26', '2024-05-31 15:54:41', 1, 28, 'Notebook', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('ab77e5c8-8f46-4b68-9480-c9d0272eebfa', '课程表', 'd_m_j_x__DPdw', 'k_ch_b_g_l__ftHs', 'null', 0, 2, '2024-05-06 10:03:02', '2024-05-31 15:54:41', 1, 72, 'Postcard', 'sysadmin', 'sysadmin', 'course_schedule', 0, 0);
INSERT INTO `menu_manage` VALUES ('ac6d8442-9a63-4f90-9328-7259418f65b5', '录入', 's_c__YXeW', 'l_r__wkMt', 'null', 0, 2, '2024-04-29 10:55:09', '2024-05-31 15:54:41', 1, 63, 'EditPen', 'sysadmin', NULL, 'l_x_j_l_l_b_s_c__zrmn', 0, 0);
INSERT INTO `menu_manage` VALUES ('ac889799-dbc3-43ac-a605-c89d29205e90', '查询', '_c__bckt', 'ch_x__iDWM', 'null', 0, 2, '2024-04-28 18:20:36', '2024-05-31 15:54:41', 1, 38, 'Search', 'sysadmin', NULL, 'f_j_l_l_b__c__tjzg', 1, 0);
INSERT INTO `menu_manage` VALUES ('ac911555-7392-4da9-9922-488322d79ef0', '题库信息管理', 'd_m_j_x__DPdw', 'question_bank', 'null', 0, 2, '2024-05-06 10:02:00', '2024-05-31 15:54:41', 1, 71, 'Coin', 'sysadmin', 'sysadmin', 'question_bank', 0, 0);
INSERT INTO `menu_manage` VALUES ('ac949db3-6647-48fc-8a32-99161cf01ff9', '参训大纲', 'f_x_j_h_g_l__kTWW', 'c_x_d_g__MEbF', 'null', 0, 2, '2024-06-03 16:32:43', '2024-07-12 11:04:07', 1, 104, 'School', 'sysadmin', NULL, 'flight_outline', 0, 0);
INSERT INTO `menu_manage` VALUES ('ad8fa5dc-a1dc-4716-9de9-b195598b61d8', '政治面貌字典', 'z_d_g_l__MQtH', 'zh_zh_m_m_z_d__ZcJx', 'null', 0, 2, '2024-04-28 10:29:13', '2024-07-12 11:04:08', 1, 128, 'Operation', 'sysadmin', NULL, 'zh_zh_m_m_z_d__errh', 0, 0);
INSERT INTO `menu_manage` VALUES ('adafb28f-c54d-4232-8f57-443c526ff6aa', '三册', 'f_d_j_l_l_x_x__atRb', 's_c__xwCS', 'null', 0, 2, '2024-04-28 18:26:25', '2024-05-31 15:54:41', 1, 49, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('af29edfc-409f-46aa-95b0-263febbbff9d', '统计', 'j_zh_j_y_x_x__NmGt', 't_j__yXnS', 'null', 0, 2, '2024-04-28 13:50:30', '2024-05-31 15:54:41', 1, 8, 'Histogram', 'sysadmin', NULL, 'j_zh_j_y_x_x_b__ebez', 2, 0);
INSERT INTO `menu_manage` VALUES ('af44b975-514d-454e-8696-087289f879f0', '计划基本信息', 'f_x_j_h_g_l__kTWW', 'j_h_j_b_x_x__kDSx', 'null', 0, 2, '2024-06-03 14:33:09', '2024-07-12 11:04:07', 1, 97, 'InfoFilled', 'sysadmin', NULL, 'flight_plan_base', 0, 0);
INSERT INTO `menu_manage` VALUES ('b216e170-f0cc-41f4-9049-64a7ff221c85', '统计', 'y_c__QXfs', 't_j__deCr', 'null', 0, 2, '2024-04-28 18:19:10', '2024-05-31 15:54:41', 1, 35, 'Histogram', 'sysadmin', NULL, 'f_j_l_l_b_y_c__jfbx', 2, 0);
INSERT INTO `menu_manage` VALUES ('b3703dbf-f31d-4709-9553-aa0975879d0b', '飞行动作字典', 'z_d_g_l__MQtH', 'f_x_d_z_z_d__tWRJ', 'null', 1, 2, '2024-05-11 11:41:27', '2024-05-11 14:14:47', 1, 999, 'Tickets', 'sysadmin', NULL, 'flight_action', 0, 0);
INSERT INTO `menu_manage` VALUES ('b4f8c3c3-cee3-4d87-aaeb-162db123c56f', '备降场信息登记', 'q_t_x_x__EpEj', 'b_j_ch_x_x_d_j__nRNA', 'null', 0, 2, '2024-04-28 13:43:11', '2024-07-12 11:04:08', 1, 122, 'Rank', 'sysadmin', NULL, 'b_j_ch_x_x_d_j_b__tirz', 0, 0);
INSERT INTO `menu_manage` VALUES ('b74f9674-edc4-4708-bd02-eda49b905e78', '性别字典', 'z_d_g_l__MQtH', 'x_b_z_d__e_dC', 'null', 0, 2, '2024-04-28 10:28:40', '2024-07-12 11:04:08', 1, 127, 'Switch', 'sysadmin', NULL, 'x_b_z_d__xhaf', 0, 0);
INSERT INTO `menu_manage` VALUES ('bcee252b-41df-4d3c-b22d-56be956f6350', '教员信息', 'r_y_x_x__BaXc', 'j_y_x_x__WGK_', 'null', 0, 2, '2024-04-28 13:46:18', '2024-05-31 15:54:41', 1, 1, 'UserFilled', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('bcf6dc68-8325-4cf6-aeea-5236ae863774', '班期信息登记', 'q_t_x_x__EpEj', 'b_q_x_x_d_j__tRHp', 'null', 0, 2, '2024-04-28 13:41:33', '2024-07-12 11:04:08', 1, 119, 'School', 'sysadmin', NULL, 'b_q_d_j_b__wprd', 0, 0);
INSERT INTO `menu_manage` VALUES ('bd8c181d-157d-4aee-9286-e1d7a7f2d3e0', '教学资源管理', 'd_m_j_x__DPdw', 'j_x_z_y_g_l__JNhm', 'null', 0, 2, '2024-05-06 09:58:50', '2024-05-31 15:54:41', 1, 70, 'Files', 'sysadmin', 'sysadmin', 'teaching_resource_management', 0, 0);
INSERT INTO `menu_manage` VALUES ('c10911e5-0dc1-472a-9349-69ba75e3e8a0', '地面教学', NULL, 'd_m_j_x__DPdw', 'null', 0, 1, '2024-04-28 10:13:06', '2024-05-31 15:54:41', 1, 69, 'School', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('c4dd228a-a5eb-417f-95f7-8e385fc9248a', '班字典', 'z_d_g_l__MQtH', 'b_z_d__eJpy', 'null', 0, 2, '2024-04-28 10:35:29', '2024-07-12 11:04:08', 1, 137, 'More', 'sysadmin', NULL, 'b_z_d__abfr', 0, 0);
INSERT INTO `menu_manage` VALUES ('c810d8d6-8d54-4895-9dc8-9d07bef8f29a', '字典管理', NULL, 'z_d_g_l__MQtH', 'null', 0, 1, '2024-04-28 10:15:24', '2024-07-12 11:04:08', 1, 126, 'Reading', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('c9f53d10-8070-4b95-98da-de510f40e6b2', '考试信息', 'sh_j_z_t_x_x_g_l__MXdK', 'exam_information', 'null', 0, 2, '2024-07-12 11:01:39', '2024-07-12 11:04:07', 1, 86, 'Tickets', 'sysadmin', NULL, 'examination', 0, 0);
INSERT INTO `menu_manage` VALUES ('cb7ff192-2d98-43a3-a465-4243da52e654', '查询', 'f_j_x_x__Zjhy', 'ch_x__FD_M', 'null', 0, 2, '2024-04-28 18:13:45', '2024-05-31 15:54:41', 1, 26, 'Search', 'sysadmin', 'sysadmin', 'f_j_x_x_d_j_b__hrwm', 1, 0);
INSERT INTO `menu_manage` VALUES ('cc23d1fe-844e-4535-8e0a-906b308ded08', '统计', 'q_t_r_y_x_x__TTSH', 't_j__j_Sc', 'null', 0, 2, '2024-04-28 13:53:44', '2024-05-31 15:54:41', 1, 16, 'Histogram', 'sysadmin', NULL, 'q_t_r_y_b__nfrc', 2, 0);
INSERT INTO `menu_manage` VALUES ('cfd28786-c98b-4af2-8030-830baae47605', '预览', 'f_x_h_x_g_l__QyEG', 'y_l__MeYY', 'null', 0, 2, '2024-04-28 17:41:23', '2024-07-12 11:04:07', 1, 95, 'View', 'sysadmin', NULL, 'h_x_g_l__gfxb', 5, 0);
INSERT INTO `menu_manage` VALUES ('d1905e95-a7f2-4123-9080-1c40425151bd', '统计', 'j_y_x_x__WGK_', 't_j__TWSK', 'null', 0, 2, '2024-04-28 13:48:55', '2024-05-31 15:54:41', 1, 4, 'Histogram', 'sysadmin', NULL, 'j_y_x_x_b__etdf', 2, 0);
INSERT INTO `menu_manage` VALUES ('d5e8e0c1-8da5-441b-94b9-f92434d55929', '飞行航线管理', 'f_x_g_h__AKJw', 'f_x_h_x_g_l__QyEG', 'null', 0, 2, '2024-04-28 17:40:34', '2024-07-12 11:04:07', 1, 93, 'Operation', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('d6444004-782c-4209-a8ac-f09efd915b71', '权限字典', 'z_d_g_l__MQtH', 'q_x_z_d__eCMT', 'null', 0, 2, '2024-04-28 10:36:47', '2024-07-12 11:04:08', 1, 139, 'Aim', 'sysadmin', NULL, 'q_x_z_d__ratj', 0, 0);
INSERT INTO `menu_manage` VALUES ('d71d95e7-f9ec-4ca9-adfb-1271da747f0f', '飞行大纲', 'q_t_x_x__EpEj', 'flight_outline', 'null', 0, 2, '2024-05-07 17:09:53', '2024-07-12 11:04:08', 1, 123, 'School', 'sysadmin', 'sysadmin', 'flight_outline', 0, 0);
INSERT INTO `menu_manage` VALUES ('d8f0e0cc-7723-48b7-ad0d-c627674f7d7c', '查询', 'k_ch_b_g_l__ftHs', 'ch_x__nZbP', 'null', 0, 2, '2024-05-06 10:04:13', '2024-05-31 15:54:41', 1, 74, 'Search', 'sysadmin', 'sysadmin', 'course_schedule', 1, 0);
INSERT INTO `menu_manage` VALUES ('dc878a50-e799-4bc0-8882-585732eecbc2', '身份登记表', 'q_t_x_x__EpEj', 'sh_f_d_j_b__KZAG', 'null', 0, 2, '2024-05-08 10:29:27', '2024-07-12 11:04:08', 1, 124, 'Tickets', 'sysadmin', NULL, 'roles', 0, 0);
INSERT INTO `menu_manage` VALUES ('dd4e369f-f538-41a9-a3a7-27bc14a3bdeb', '到期提醒', 't_j_x_x__beCt', 'd_q_t_x__fzEM', 'null', 0, 2, '2024-04-28 13:55:14', '2024-05-31 15:54:41', 1, 19, 'AlarmClock', 'sysadmin', NULL, 't_j_x_x_b__dwtf', 3, 0);
INSERT INTO `menu_manage` VALUES ('df16514c-67ed-4055-92a8-55fd8e335c72', '查询', '_c__CiYQ', 'ch_x__BByT', 'null', 0, 2, '2024-04-28 18:25:39', '2024-05-31 15:54:41', 1, 47, 'Search', 'sysadmin', NULL, 'f_d_j_l_l_b__c__ttrw', 1, 0);
INSERT INTO `menu_manage` VALUES ('e3461840-c351-4327-834b-e88332379f8f', '课程详细信息', 'f_x_j_h_g_l__kTWW', 'j_h_c_k__NQlx', 'null', 1, 2, '2024-04-28 17:43:42', '2024-06-26 15:41:50', 1, 7, 'Search', 'sysadmin', 'sysadmin', 'flight_subject_details', 8, 0);
INSERT INTO `menu_manage` VALUES ('e59f31f5-82dd-49d4-9bed-83c31f8d3880', '统计', 'f_j_x_x__Zjhy', 't_j__thZx', 'null', 0, 2, '2024-04-28 18:14:31', '2024-05-31 15:54:41', 1, 27, 'Histogram', 'sysadmin', NULL, 'f_j_x_x_d_j_b__hrwm', 2, 0);
INSERT INTO `menu_manage` VALUES ('e6a0e3c8-e59a-4563-8b00-515d111f385d', '统计', 's_c__YXeW', 't_j__xQCJ', 'null', 0, 2, '2024-04-29 10:55:45', '2024-05-31 15:54:41', 1, 65, 'Histogram', 'sysadmin', NULL, 'l_x_j_l_l_b_s_c__zrmn', 2, 0);
INSERT INTO `menu_manage` VALUES ('e7e34ca1-3f0e-4f2f-9ccf-75171eb34b8a', '在线考试', 'd_m_j_x__DPdw', 'z_x_k_sh__ZkQf', 'null', 0, 2, '2024-05-06 10:08:30', '2024-05-31 15:54:41', 1, 80, 'Clock', 'sysadmin', 'sysadmin', 'exam_result_detail', 0, 0);
INSERT INTO `menu_manage` VALUES ('e804c139-9ed4-41e3-968c-1db2c469fdbf', '录入', 't_j_x_x__beCt', 'l_r__Y_DK', 'null', 0, 2, '2024-04-28 13:54:55', '2024-05-31 15:54:41', 1, 18, 'EditPen', 'sysadmin', NULL, 't_j_x_x_b__dwtf', 0, 0);
INSERT INTO `menu_manage` VALUES ('e86083cb-9e49-45ef-82ec-4ca27f026ff7', '查询', '_c__bmwJ', 'ch_x__XBNh', 'null', 0, 2, '2024-04-28 18:36:28', '2024-05-31 15:54:41', 1, 60, 'Search', 'sysadmin', NULL, 'l_x_j_l_l_b__c__jbdq', 1, 0);
INSERT INTO `menu_manage` VALUES ('e90bc0a5-a88f-49d6-a515-9a2545a45ae4', '课程信息', 'd_m_j_x__DPdw', 'course_information', 'null', 0, 2, '2024-05-13 10:29:59', '2024-07-12 11:04:07', 1, 81, 'Tickets', 'sysadmin', 'sysadmin', 'course_information', 0, 0);
INSERT INTO `menu_manage` VALUES ('eab32cc9-1163-42bc-afdf-9b43e0c32242', '其他人员信息', 'r_y_x_x__BaXc', 'q_t_r_y_x_x__TTSH', 'null', 0, 2, '2024-04-28 13:52:42', '2024-05-31 15:54:41', 1, 13, 'User', 'sysadmin', NULL, '', 0, 0);
INSERT INTO `menu_manage` VALUES ('eacac877-2582-42e4-8803-87d6f1b559ce', '位置字典', 'z_d_g_l__MQtH', 'w_zh_z_d__StBJ', 'null', 1, 2, '2024-04-28 10:36:00', '2024-05-31 11:46:41', 1, 999, 'AddLocation', 'sysadmin', NULL, 'w_zh_z_d__wprk', 0, 0);
INSERT INTO `menu_manage` VALUES ('eae4f912-6e52-4efe-89b7-ade1ccaf48ce', '机型字典', 'z_d_g_l__MQtH', 'j_x_z_d__MdNt', 'null', 1, 2, '2024-05-11 11:46:34', '2024-05-11 11:49:56', 1, 999, 'Document', 'sysadmin', NULL, 'aircraft_type_dict', 0, 0);
INSERT INTO `menu_manage` VALUES ('ec815093-ba5f-4531-b138-21025f0c066a', '民族字典', 'z_d_g_l__MQtH', 'm_z_z_d__Z_Ba', 'null', 0, 2, '2024-04-28 10:29:32', '2024-07-12 11:04:08', 1, 129, 'Share', 'sysadmin', NULL, 'm_z_z_d__yjhk', 0, 0);
INSERT INTO `menu_manage` VALUES ('ec968797-d655-481a-8f04-64d0978cfef0', '录入', 'j_sh_j_c_x_x__zyZQ', 'l_r___hPt', 'null', 0, 2, '2024-04-28 13:55:50', '2024-05-31 15:54:41', 1, 21, 'EditPen', 'sysadmin', NULL, 'j_sh_j_ch_b__npfb', 0, 0);
INSERT INTO `menu_manage` VALUES ('f0144231-c008-45f3-b103-0bb35f5a2a51', '评估标准管理', 'f_x_p_g__Gztf', 'p_g_b_zh_g_l__nHaZ', 'null', 0, 2, '2024-05-06 10:12:56', '2024-07-12 11:04:08', 1, 113, 'Flag', 'sysadmin', 'sysadmin', 'flight_standard', 0, 0);
INSERT INTO `menu_manage` VALUES ('f093dd88-d54e-4c45-9c35-4e93458cb34d', '统计', 'y_c__bteh', 't_j___QPr', 'null', 0, 2, '2024-04-28 18:31:56', '2024-05-31 15:54:41', 1, 57, 'Histogram', 'sysadmin', NULL, 'l_x_j_l_l_b_y_c__wspr', 2, 0);
INSERT INTO `menu_manage` VALUES ('f3ccdaef-64d1-4457-8a7e-d5bb107ed99f', '学位字典', 'z_d_g_l__MQtH', 'x_w_z_d__SKdG', 'null', 0, 2, '2024-04-28 10:30:49', '2024-07-12 11:04:08', 1, 131, 'Stamp', 'sysadmin', NULL, 'x_w_z_d__wafe', 0, 0);
INSERT INTO `menu_manage` VALUES ('f65ed149-c730-49cb-8c0f-1ae902535fbd', '管理', 'k_ch_b_g_l__ftHs', 'g_l__ENaH', 'null', 0, 2, '2024-05-06 10:03:55', '2024-05-31 15:54:41', 1, 73, 'Management', 'sysadmin', 'sysadmin', 'course_schedule', 0, 0);
INSERT INTO `menu_manage` VALUES ('f69d2ce8-bc75-4147-949f-70d83880f907', '测试效果表', 'q_t_x_x__EpEj', 'test_table', 'null', 0, 2, '2024-05-13 17:29:56', '2024-07-12 11:04:08', 1, 125, 'SetUp', 'sysadmin', NULL, 'sys_test_table', 0, 0);
INSERT INTO `menu_manage` VALUES ('f7088eb4-6637-4605-99ff-f7daab3c41b0', '录入', '_c__CiYQ', 'l_r__KEMc', 'null', 0, 2, '2024-04-28 18:25:17', '2024-05-31 15:54:41', 1, 46, 'EditPen', 'sysadmin', NULL, 'f_d_j_l_l_b__c__ttrw', 0, 0);
INSERT INTO `menu_manage` VALUES ('f7e65874-aebe-4d43-a489-901a38e7d879', '已实施飞行内容表', 'y_zh_x_f_x_j_h_g_l__FdaQ', 'y_sh_sh_f_x_n_r_b__BehD', 'null', 0, 2, '2024-07-12 16:55:16', '2024-07-12 16:55:16', 1, 999, 'DocumentChecked', 'sysadmin', NULL, 'executed_flight_plan_content', 0, 0);
INSERT INTO `menu_manage` VALUES ('f917f41e-1dac-41f2-b8d2-3dfcadc351f3', '录入', 's_c__xwCS', 'l_r__QtAh', 'null', 0, 2, '2024-04-28 18:26:47', '2024-05-31 15:54:41', 1, 50, 'EditPen', 'sysadmin', NULL, 'f_d_j_l_l_b_s_c___htt', 0, 0);
INSERT INTO `menu_manage` VALUES ('fbc71259-5fcb-4a16-8b2d-565512f472a0', '执照等级字典', 'z_d_g_l__MQtH', 'zh_zh_d_j_z_d__tShw', 'null', 0, 2, '2024-04-28 10:32:29', '2024-07-12 11:04:08', 1, 133, 'Money', 'sysadmin', 'sysadmin', 'zh_zh_d_j_z_d__emzc', 0, 0);
INSERT INTO `menu_manage` VALUES ('fd682c93-289a-4568-b8f1-174b4c9f29bc', '飞行计划管理', 'f_x_g_h__AKJw', 'f_x_j_h_g_l__kTWW', 'null', 0, 2, '2024-04-28 17:42:25', '2024-07-12 11:04:07', 1, 96, 'Guide', 'sysadmin', NULL, '', 0, 0);

-- ----------------------------
-- Table structure for table_manage
-- ----------------------------
DROP TABLE IF EXISTS `table_manage`;
CREATE TABLE `table_manage`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表中文名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表名称（英文，用于表名）',
  `description` json NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `is_delete` int NULL DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int NULL DEFAULT NULL COMMENT '表状态：0：设计中，1：使用中',
  `sync_flag` int NULL DEFAULT NULL COMMENT '同步标志：0：不同步，1：同步',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of table_manage
-- ----------------------------
INSERT INTO `table_manage` VALUES ('00658f74-6f5b-4873-a414-1610669c44c1', '飞机履历表一册', 'f_j_l_l_b_y_c__jfbx', '\"创建飞机履历表一册@20240428181010\"', '2024-04-28 18:10:11', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('037d67f1-94c5-4938-98ed-f6a356d68c15', '教员信息表', 'j_y_x_x_b__etdf', '\"创建教员信息表@20240428134631\"', '2024-04-28 13:46:32', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 1);
INSERT INTO `table_manage` VALUES ('048fe8a8-6ad6-423d-ba7f-8c6769afcdf6', '定检类别字典', 'd_j_l_b_z_d__wxwj', '\"创建定检类别字典@20240428102739\"', '2024-04-28 10:27:40', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('0c69abc1-296d-497d-86b0-904179ed63b1', '评估标准表', 'flight_standard', '\"创建评估标准表@20240511104447\"', '2024-05-11 10:44:53', '2024-05-11 11:00:39', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('0d8baab6-efe9-4029-969e-55efcfacfd33', '试卷详细信息表', 'exam_result_detail', '\"创建试卷详细信息表@20240514160808\"', '2024-05-14 16:08:09', '2024-05-14 16:08:09', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('102e4f46-9945-431a-9c88-b08ed4a263cb', '技术检查表', 'j_sh_j_ch_b__npfb', '\"创建技术检查表@20240428134720\"', '2024-04-28 13:47:21', '2024-04-28 13:47:21', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('108bbb7e-ccc4-4290-9750-cc72554ee636', '螺旋桨履历表二册', 'l_x_j_l_l_b__c__jbdq', '\"创建螺旋桨履历表二册@20240428181142\"', '2024-04-28 18:11:42', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('1165e73e-61b7-49c2-8527-7e373ec01372', '专业字典', 'zh_y_z_d__hwxr', '\"创建专业字典@20240428102242\"', '2024-04-28 10:22:43', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('1503e9bd-51e4-4f6e-bdf5-209739b068ec', '已实施飞行内容表', 'executed_flight_plan_content', '\"创建已实施飞行内容表@20240606104653\"', '2024-06-06 10:47:10', '2024-06-06 10:47:10', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('17097c4c-fb1a-44b2-823b-611ffc83926d', '飞行大纲', 'flight_outline', '\"创建飞行大纲@20240507170448\"', '2024-05-07 17:05:37', '2024-05-11 11:10:26', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('18dab118-6411-40ef-a1ec-bdcdbe2f6c33', '飞行架次评估类型字典', 'flight_evaluation_type_dict', '\"创建飞行架次评估类型字典@20240511145440\"', '2024-05-11 14:54:43', '2024-05-11 15:00:58', 'sysadmin', 'sysadmin', 0, 0, 0);
INSERT INTO `table_manage` VALUES ('1db4b56f-49a4-435a-bd67-f1659b6635ed', '教学资源管理表', 'teaching_resource_management', '\"创建教学资源管理表@20240513105614\"', '2024-05-13 10:56:17', '2024-05-13 10:56:17', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('1e6c177f-1f8a-42c0-a5ec-10ae8b03e079', '已实施飞行计划基础信息表', 'executed_flight_plan_base', '\"创建飞行计划（已实施）@20240606104400\"', '2024-06-06 10:44:41', '2024-06-06 10:55:40', 'sysadmin', 'sysadmin', 0, 0, 0);
INSERT INTO `table_manage` VALUES ('2288113a-e9be-452f-a88f-16506b2218ca', '体检类型字典', 't_j_l_x_z_d__mpwc', '\"创建体检类型字典@20240428102202\"', '2024-04-28 10:22:03', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('2579616f-f8a9-46c4-a10e-1f20bff21a40', '版本字典', 'b_b_z_d__p_hs', '\"创建版本字典@20240428102709\"', '2024-04-28 10:27:11', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('27176200-dac2-469b-aa85-95ace5088a28', '考试成绩统计', 'exam_result', '\"创建考试成绩统计@20240711175801\"', '2024-07-11 17:59:55', '2024-07-11 17:59:55', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('2762b17f-7fc5-4a93-9fc8-c1ee1daff11d', '发动机履历表一册', 'f_d_j_l_l_b_y_c__mhds', '\"创建发动机履历表一册@20240428181039\"', '2024-04-28 18:10:40', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('29eedd99-dfc8-4057-9384-708e0a251ef7', '在线学习', 'online_learning_record', '\"创建在线学习@20240514153712\"', '2024-05-14 15:37:27', '2024-05-14 15:37:27', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('338103bc-338e-41ff-9e70-5b5062d10443', '特情处置手册', 'special_situation_manual', '\"创建特情处置手册@20240722150954\"', '2024-07-22 15:11:48', '2024-07-22 15:11:48', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('33a4f4c1-4519-460b-bb6a-c9a719904495', '评估结果分项成绩表', 'flight_subitem_socre', '\"创建评估结果分项成绩表@20240511153556\"', '2024-05-11 15:35:59', '2024-06-03 15:50:08', 'sysadmin', 'sysadmin', 0, 0, 0);
INSERT INTO `table_manage` VALUES ('3703743f-b2ba-4972-b4f4-c2791d6eb6e4', '班期登记表', 'b_q_d_j_b__wprd', '\"创建班期登记表@20240428133657\"', '2024-04-28 13:36:58', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('38bc7488-42f6-4bba-9e53-191c68941d0c', '性别字典', 'x_b_z_d__xhaf', '\"创建性别字典@20240428101632\"', '2024-04-28 10:16:33', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('3c30575d-3685-4cff-92e5-1a5851b65493', '机型登记表', 'j_x_d_j_b__ddkz', '\"创建机型登记表@20240428133645\"', '2024-04-28 13:36:46', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('3cd1461b-da43-4aff-8510-a4dbfecb4dc3', '飞机信息登记表', 'f_j_x_x_d_j_b__hrwm', '\"创建飞机信息登记表@20240428180935\"', '2024-04-28 18:09:38', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('43c8d179-343c-4292-9f16-10435e7cb2bc', '身份登记表', 'roles', '\"创建身份登记表@20240508102633\"', '2024-05-08 10:26:53', '2024-05-08 10:26:53', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('46f479de-4c23-48c1-a374-88e715539a0e', '计划状态字典', 'j_h_zh_t_z_d__pkfp', '\"创建计划状态字典@20240428102632\"', '2024-04-28 10:26:33', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('4a19af0a-065f-430c-b616-af0cc7bd7e50', '飞机履历表二册', 'f_j_l_l_b__c__tjzg', '\"创建飞机履历表二册@20240428181022\"', '2024-04-28 18:10:23', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('5054cfa2-a339-4284-baab-70254a717a30', '动作识别数据表', 'flight_estimate', '\"创建动作识别数据表@20240511153335\"', '2024-05-11 15:33:40', '2024-05-11 15:33:40', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('51604a74-5a77-4370-8008-d85f667d9035', '兼职教员信息表', 'j_zh_j_y_x_x_b__ebez', '\"创建兼职教员信息表@20240428134641\"', '2024-04-28 13:46:42', '2024-04-30 14:34:58', 'sysadmin', NULL, 0, 0, 1);
INSERT INTO `table_manage` VALUES ('51c3e5b0-ab77-4f91-b861-05d5c1cb26d8', '参训人员信息表', 'flight_plan_pilot', '\"创建参训人员信息表@20240603154325\"', '2024-06-03 15:44:01', '2024-06-03 15:50:47', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('5242000e-c725-41b1-8113-3a8e38a3e731', '参训飞机信息表', 'flight_plan_plane', '\"创建参训飞 机信息表@20240603154427\"', '2024-06-03 15:45:06', '2024-06-03 15:50:43', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('528bb1bd-8984-459c-b5f5-4ad93c5ec91b', '飞行架次评估阶段字典', 'flight_evaluation_phase_dict', '\"创建飞行架次评估阶段字典@20240511145350\"', '2024-05-11 14:54:14', '2024-05-11 14:54:14', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('5d2529a5-5218-4bdd-a70d-75fd511164b2', '课程信息登记表', 'course_information', '\"创建课程信息登记表@20240511180310\"', '2024-05-11 18:03:19', '2024-05-13 18:08:01', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('5f46e5c2-7c43-457a-aade-882baa4baadb', '气象字典', 'q_x_z_d__znar', '\"创建气象字典@20240428102602\"', '2024-04-28 10:26:03', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('5f917074-6910-4c67-91c6-e70205dfa0a1', '其他部件信息表', 'q_t_b_j_x_x_b__niex', '\"创建其他部件信息表@20240428181216\"', '2024-04-28 18:12:18', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('63682de3-546e-4b4e-86a9-7df3e29b2cee', '政治面貌字典', 'zh_zh_m_m_z_d__errh', '\"创建政治面貌字典@20240428101845\"', '2024-04-28 10:18:46', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('63d07e11-8a57-4a22-a4f0-5d511814a32a', '飞行计划管理', 'flight_plan_base', '\"创建飞行计划管理@20240428173434\"', '2024-04-28 17:34:35', '2024-05-28 10:30:48', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('64913184-e70d-4f15-b1d6-1b62f1b6cd46', '内容字典', 'content_dict', '\"创建内容字典@20240509094106\"', '2024-05-09 09:41:22', '2024-05-09 09:41:22', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('67c95641-828f-46d4-baff-aa758a15ea31', '执照等级字典', 'zh_zh_d_j_z_d__emzc', '\"创建执照等级字典@20240428102055\"', '2024-04-28 10:20:56', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('7b728056-aed1-4fe4-af88-82e048595648', '飞机状态字典', 'f_j_zh_t_z_d__zfmb', '\"创建飞机状态字典@20240428102408\"', '2024-04-28 10:24:09', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('7d031493-b14f-4686-89f5-3bf63b8f8e5f', '航线管理', 'h_x_g_l__gfxb', '\"创建航线管理@20240428173410\"', '2024-04-28 17:34:11', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('82f94fee-6e5a-4bcb-b0e9-5fbd9c4ae48c', '题型字典', 't_x_z_d__z_m_', '\"创建题型字典@20240428102515\"', '2024-04-28 10:25:16', '2024-04-28 10:25:16', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('834f6de6-adea-478a-97d2-838aa1d39061', '其他人员表', 'q_t_r_y_b__nfrc', '\"创建其他人员表@20240428134658\"', '2024-04-28 13:46:58', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 1);
INSERT INTO `table_manage` VALUES ('8594aca6-05dd-48e7-b1f4-02c76ca75519', '备降场信息登记表', 'b_j_ch_x_x_d_j_b__tirz', '\"创建备降场信息登记表@20240428133758\"', '2024-04-28 13:37:58', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('85b1b285-7c23-4e7b-88ce-66d73c6a12b5', '题库信息管理表', 'question_bank', '\"创建题库信息管理表@20240511175240\"', '2024-05-11 17:52:55', '2024-05-11 18:03:33', 'sysadmin', 'sysadmin', 0, 0, 0);
INSERT INTO `table_manage` VALUES ('9400a484-c7a7-4cce-ac43-5129c340da63', '学位字典', 'x_w_z_d__wafe', '\"创建学位字典@20240428101958\"', '2024-04-28 10:19:59', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('9432ae75-6ba2-477d-a450-07dc9c3b4525', '体检信息表', 't_j_x_x_b__dwtf', '\"创建体检信息表@20240428134709\"', '2024-04-28 13:47:10', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('98bf9a92-bed3-4187-9f79-530365a2bbce', '计划内容', 'flight_plan_content', '\"创建计划内容@20240603143553\"', '2024-06-03 14:36:15', '2024-06-03 15:50:38', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('9c0197f8-0491-4f8d-884d-b9df51ac8166', '发动机履历表二册', 'f_d_j_l_l_b__c__ttrw', '\"创建发动机履历表二册@20240428181050\"', '2024-04-28 18:10:51', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('9ef25a11-2eb7-458d-b100-8032a9aff2b2', '学历字典', 'x_l_z_d__hcyh', '\"创建学历字典@20240428101939\"', '2024-04-28 10:19:40', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('a299b7ea-6992-45e4-8eee-22cecedf88b3', '飞行计划类型字典', 'f_x_j_h_l_x_z_d__wpca', '\"创建飞行计划类型字典@20240428102538\"', '2024-04-28 10:25:39', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('ab13f8b4-dd62-4e66-951a-15e73686d064', '发动机位置字典', 'engine_position_dict', '\"创建发动机位置字典@20240508170552\"', '2024-05-08 17:06:26', '2024-05-08 17:06:26', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('af6c42b8-c724-4439-8e2e-07aabb2ff9f1', '评估结果总成绩表', 'flight_total_score', '\"创建评估结果总成绩表@20240511153400\"', '2024-05-11 15:35:05', '2024-05-11 18:04:25', 'sysadmin', 'sysadmin', 0, 0, 0);
INSERT INTO `table_manage` VALUES ('b3753460-89a3-4dff-8008-1a6ad1c40d1c', '飞行动作字典', 'flight_action', '\"创建飞行动作字典@20240511114039\"', '2024-05-11 11:40:45', '2024-05-11 11:40:45', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('b70c4c30-479d-45c8-833c-79a2ea2d7355', '航点库管理', 'h_d_k_g_l__gm_n', '\"创建航点库管理@20240428173359\"', '2024-04-28 17:34:00', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('b9cc5b40-682a-46ee-91dd-0cb9d6e11b8f', '民族字典', 'm_z_z_d__yjhk', '\"创建民族字典@20240428101917\"', '2024-04-28 10:19:19', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('bbabfbaf-939d-436e-9ce9-16d289de8c1c', '螺旋桨履历表三册', 'l_x_j_l_l_b_s_c__zrmn', '\"创建螺旋桨履历表三册@20240428181151\"', '2024-04-28 18:11:52', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('bf36a05e-7879-4b62-85b8-b255731b1854', '课程表', 'course_schedule', '\"创建课程表@20240514141836\"', '2024-05-14 14:18:54', '2024-05-14 14:18:54', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('c0bd7d0c-4047-40f7-8a99-f17cdedfe589', '飞行等级字典', 'f_x_d_j_z_d__nmta', '\"创建飞行等级字典@20240428102122\"', '2024-04-28 10:21:23', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('c4578457-06d4-4ee8-9041-8189c144beec', '三证信息登记表', 's_zh_x_x_d_j_b__mr_p', '\"创建三证信息登记表@20240428180952\"', '2024-04-28 18:09:53', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('ca3ea1a4-6f77-47ba-a497-aff104d2c109', '课目详细信息表', 'flight_subject_details', '\"创建课目详细信息表@20240603163325\"', '2024-06-03 16:34:11', '2024-06-03 16:34:11', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('cf3132ee-d839-4f4c-aca5-23af9a5067aa', '学员信息表', 'x_y_x_x_b__dxtc', '\"创建学员信息表@20240428134649\"', '2024-04-28 13:46:50', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 1);
INSERT INTO `table_manage` VALUES ('cf958655-ccc3-4806-8819-25766a9a7026', '权限字典', 'q_x_z_d__ratj', '\"创建权限字典@20240428102442\"', '2024-04-28 10:24:44', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('d00d6dfc-b948-4948-b2da-2b9cc2a3455d', '教学日志表', 'teaching_journal', '\"创建教学日志表@20240514143240\"', '2024-05-14 14:32:41', '2024-05-14 14:32:41', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('dadd9bd8-31a9-42f8-9f38-97e0e5c24262', '发动机履历表三册', 'f_d_j_l_l_b_s_c___htt', '\"创建发动机履历表三册@20240428181059\"', '2024-04-28 18:11:00', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('db841c6f-0afe-4b83-9039-0aef80721b39', '螺旋桨履历表一册', 'l_x_j_l_l_b_y_c__wspr', '\"创建螺旋桨履历表一册@20240428181133\"', '2024-04-28 18:11:34', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('e942f067-62a7-4fec-979e-90f57e5f4912', '单位登记表', 'd_w_d_j_b__dxfz', '\"创建单位登记表@20240428133631\"', '2024-04-28 13:36:33', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('e9912b94-4b8b-4830-bdcb-5790a5e015d7', '位置字典', 'w_zh_z_d__wprk', '\"创建位置字典@20240428102330\"', '2024-04-28 10:23:31', '2024-05-22 18:22:25', 'sysadmin', NULL, 1, 0, 0);
INSERT INTO `table_manage` VALUES ('ea542b04-0e24-4719-ac01-6da110c704d3', '参训课目信息表', 'flight_plan_subject', '\"创建参训课目信息表@20240603154525\"', '2024-06-03 15:46:29', '2024-06-03 15:46:29', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('ebe7ad42-0f87-4d50-a03f-0f9841083f81', '系统测试表', 'sys_test_table', '\"创建系统测试表@20240513165257\"', '2024-05-13 16:53:07', '2024-05-13 16:53:07', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('ee7d3153-a7e7-4535-a745-b23e794a60bb', '考试管理', 'examination', '\"创建考试管理@20240514144359\"', '2024-05-14 14:44:14', '2024-05-14 14:44:14', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('f4d10534-1cd3-420b-8af3-f98d6487547c', '机场信息登记表', 'j_ch_x_x_d_j_b__rsqm', '\"创建机场信息登记表@20240428133736\"', '2024-04-28 13:37:37', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('f4f4e22f-6475-49bb-b00d-13dadfa778fa', '班字典', 'b_z_d__abfr', '\"创建班字典@20240428102302\"', '2024-04-28 10:23:03', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('f78c5e09-9bf2-4972-9681-3d1a414430ba', '空域信息登记表', 'k_y_x_x_d_j_b__rxsr', '\"创建空域信息登记表@20240428133749\"', '2024-04-28 13:37:50', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('fa4fdf27-3a87-4c78-b5b4-e50c6047ada4', '试卷总体信息表', 'paper_info', '\"创建试卷总体信息表@20240514160616\"', '2024-05-14 16:06:28', '2024-05-14 16:06:28', 'sysadmin', NULL, 0, 0, 0);
INSERT INTO `table_manage` VALUES ('fb480f23-2098-4ae5-8a19-1fff88c59536', '教学等级字典', 'j_x_d_j_z_d__bfkk', '\"创建教学等级字典@20240428102029\"', '2024-04-28 10:20:30', '2024-05-22 18:22:25', 'sysadmin', NULL, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
