-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: flyingtrainingdb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auto_b_b_z_d__p_hs`
--

DROP TABLE IF EXISTS `auto_b_b_z_d__p_hs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_b_b_z_d__p_hs` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__eehB` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_b_b_z_d__p_hs`
--

LOCK TABLES `auto_b_b_z_d__p_hs` WRITE;
/*!40000 ALTER TABLE `auto_b_b_z_d__p_hs` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_b_b_z_d__p_hs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_b_j_ch_x_x_d_j_b__tirz`
--

DROP TABLE IF EXISTS `auto_b_j_ch_x_x_d_j_b__tirz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_b_j_ch_x_x_d_j_b__tirz` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_b_j_ch_x_x_d_j_b__tirz`
--

LOCK TABLES `auto_b_j_ch_x_x_d_j_b__tirz` WRITE;
/*!40000 ALTER TABLE `auto_b_j_ch_x_x_d_j_b__tirz` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_b_j_ch_x_x_d_j_b__tirz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_b_q_d_j_b__wprd`
--

DROP TABLE IF EXISTS `auto_b_q_d_j_b__wprd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_b_q_d_j_b__wprd` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_b_q_d_j_b__wprd`
--

LOCK TABLES `auto_b_q_d_j_b__wprd` WRITE;
/*!40000 ALTER TABLE `auto_b_q_d_j_b__wprd` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_b_q_d_j_b__wprd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_b_z_d__abfr`
--

DROP TABLE IF EXISTS `auto_b_z_d__abfr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_b_z_d__abfr` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__nXEt` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_b_z_d__abfr`
--

LOCK TABLES `auto_b_z_d__abfr` WRITE;
/*!40000 ALTER TABLE `auto_b_z_d__abfr` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_b_z_d__abfr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_d_j_l_b_z_d__wxwj`
--

DROP TABLE IF EXISTS `auto_d_j_l_b_z_d__wxwj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_d_j_l_b_z_d__wxwj` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__BXPp` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_d_j_l_b_z_d__wxwj`
--

LOCK TABLES `auto_d_j_l_b_z_d__wxwj` WRITE;
/*!40000 ALTER TABLE `auto_d_j_l_b_z_d__wxwj` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_d_j_l_b_z_d__wxwj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_d_w_d_j_b__dxfz`
--

DROP TABLE IF EXISTS `auto_d_w_d_j_b__dxfz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_d_w_d_j_b__dxfz` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_d_w_d_j_b__dxfz`
--

LOCK TABLES `auto_d_w_d_j_b__dxfz` WRITE;
/*!40000 ALTER TABLE `auto_d_w_d_j_b__dxfz` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_d_w_d_j_b__dxfz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_d_j_l_l_b__c__ttrw`
--

DROP TABLE IF EXISTS `auto_f_d_j_l_l_b__c__ttrw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_d_j_l_l_b__c__ttrw` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_d_j_l_l_b__c__ttrw`
--

LOCK TABLES `auto_f_d_j_l_l_b__c__ttrw` WRITE;
/*!40000 ALTER TABLE `auto_f_d_j_l_l_b__c__ttrw` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_d_j_l_l_b__c__ttrw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_d_j_l_l_b_s_c___htt`
--

DROP TABLE IF EXISTS `auto_f_d_j_l_l_b_s_c___htt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_d_j_l_l_b_s_c___htt` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_d_j_l_l_b_s_c___htt`
--

LOCK TABLES `auto_f_d_j_l_l_b_s_c___htt` WRITE;
/*!40000 ALTER TABLE `auto_f_d_j_l_l_b_s_c___htt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_d_j_l_l_b_s_c___htt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_d_j_l_l_b_y_c__mhds`
--

DROP TABLE IF EXISTS `auto_f_d_j_l_l_b_y_c__mhds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_d_j_l_l_b_y_c__mhds` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_d_j_l_l_b_y_c__mhds`
--

LOCK TABLES `auto_f_d_j_l_l_b_y_c__mhds` WRITE;
/*!40000 ALTER TABLE `auto_f_d_j_l_l_b_y_c__mhds` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_d_j_l_l_b_y_c__mhds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_j_l_l_b__c__tjzg`
--

DROP TABLE IF EXISTS `auto_f_j_l_l_b__c__tjzg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_j_l_l_b__c__tjzg` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_j_l_l_b__c__tjzg`
--

LOCK TABLES `auto_f_j_l_l_b__c__tjzg` WRITE;
/*!40000 ALTER TABLE `auto_f_j_l_l_b__c__tjzg` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_j_l_l_b__c__tjzg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_j_l_l_b_y_c__jfbx`
--

DROP TABLE IF EXISTS `auto_f_j_l_l_b_y_c__jfbx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_j_l_l_b_y_c__jfbx` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_j_l_l_b_y_c__jfbx`
--

LOCK TABLES `auto_f_j_l_l_b_y_c__jfbx` WRITE;
/*!40000 ALTER TABLE `auto_f_j_l_l_b_y_c__jfbx` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_j_l_l_b_y_c__jfbx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_j_x_x_d_j_b__hrwm`
--

DROP TABLE IF EXISTS `auto_f_j_x_x_d_j_b__hrwm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_j_x_x_d_j_b__hrwm` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_j_x_x_d_j_b__hrwm`
--

LOCK TABLES `auto_f_j_x_x_d_j_b__hrwm` WRITE;
/*!40000 ALTER TABLE `auto_f_j_x_x_d_j_b__hrwm` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_j_x_x_d_j_b__hrwm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_j_zh_t_z_d__zfmb`
--

DROP TABLE IF EXISTS `auto_f_j_zh_t_z_d__zfmb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_j_zh_t_z_d__zfmb` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__at_T` int DEFAULT NULL,
  `n_r__krXX` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_j_zh_t_z_d__zfmb`
--

LOCK TABLES `auto_f_j_zh_t_z_d__zfmb` WRITE;
/*!40000 ALTER TABLE `auto_f_j_zh_t_z_d__zfmb` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_j_zh_t_z_d__zfmb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_x_d_j_z_d__nmta`
--

DROP TABLE IF EXISTS `auto_f_x_d_j_z_d__nmta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_x_d_j_z_d__nmta` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r___jQp` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_x_d_j_z_d__nmta`
--

LOCK TABLES `auto_f_x_d_j_z_d__nmta` WRITE;
/*!40000 ALTER TABLE `auto_f_x_d_j_z_d__nmta` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_x_d_j_z_d__nmta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_x_j_h_g_l__badm`
--

DROP TABLE IF EXISTS `auto_f_x_j_h_g_l__badm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_x_j_h_g_l__badm` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_x_j_h_g_l__badm`
--

LOCK TABLES `auto_f_x_j_h_g_l__badm` WRITE;
/*!40000 ALTER TABLE `auto_f_x_j_h_g_l__badm` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_x_j_h_g_l__badm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_f_x_j_h_l_x_z_d__wpca`
--

DROP TABLE IF EXISTS `auto_f_x_j_h_l_x_z_d__wpca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_f_x_j_h_l_x_z_d__wpca` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__aWPY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_f_x_j_h_l_x_z_d__wpca`
--

LOCK TABLES `auto_f_x_j_h_l_x_z_d__wpca` WRITE;
/*!40000 ALTER TABLE `auto_f_x_j_h_l_x_z_d__wpca` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_f_x_j_h_l_x_z_d__wpca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_h_d_k_g_l__gm_n`
--

DROP TABLE IF EXISTS `auto_h_d_k_g_l__gm_n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_h_d_k_g_l__gm_n` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_h_d_k_g_l__gm_n`
--

LOCK TABLES `auto_h_d_k_g_l__gm_n` WRITE;
/*!40000 ALTER TABLE `auto_h_d_k_g_l__gm_n` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_h_d_k_g_l__gm_n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_h_x_g_l__gfxb`
--

DROP TABLE IF EXISTS `auto_h_x_g_l__gfxb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_h_x_g_l__gfxb` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_h_x_g_l__gfxb`
--

LOCK TABLES `auto_h_x_g_l__gfxb` WRITE;
/*!40000 ALTER TABLE `auto_h_x_g_l__gfxb` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_h_x_g_l__gfxb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_ch_x_x_d_j_b__rsqm`
--

DROP TABLE IF EXISTS `auto_j_ch_x_x_d_j_b__rsqm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_ch_x_x_d_j_b__rsqm` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_ch_x_x_d_j_b__rsqm`
--

LOCK TABLES `auto_j_ch_x_x_d_j_b__rsqm` WRITE;
/*!40000 ALTER TABLE `auto_j_ch_x_x_d_j_b__rsqm` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_ch_x_x_d_j_b__rsqm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_h_zh_t_z_d__pkfp`
--

DROP TABLE IF EXISTS `auto_j_h_zh_t_z_d__pkfp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_h_zh_t_z_d__pkfp` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__nStS` int DEFAULT NULL,
  `n_r__NpBj` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_h_zh_t_z_d__pkfp`
--

LOCK TABLES `auto_j_h_zh_t_z_d__pkfp` WRITE;
/*!40000 ALTER TABLE `auto_j_h_zh_t_z_d__pkfp` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_h_zh_t_z_d__pkfp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_sh_j_ch_b__npfb`
--

DROP TABLE IF EXISTS `auto_j_sh_j_ch_b__npfb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_sh_j_ch_b__npfb` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_sh_j_ch_b__npfb`
--

LOCK TABLES `auto_j_sh_j_ch_b__npfb` WRITE;
/*!40000 ALTER TABLE `auto_j_sh_j_ch_b__npfb` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_sh_j_ch_b__npfb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_x_d_j_b__ddkz`
--

DROP TABLE IF EXISTS `auto_j_x_d_j_b__ddkz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_x_d_j_b__ddkz` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `m_ch__wdrd` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_x_d_j_b__ddkz`
--

LOCK TABLES `auto_j_x_d_j_b__ddkz` WRITE;
/*!40000 ALTER TABLE `auto_j_x_d_j_b__ddkz` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_x_d_j_b__ddkz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_x_d_j_z_d__bfkk`
--

DROP TABLE IF EXISTS `auto_j_x_d_j_z_d__bfkk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_x_d_j_z_d__bfkk` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__TnZ_` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_x_d_j_z_d__bfkk`
--

LOCK TABLES `auto_j_x_d_j_z_d__bfkk` WRITE;
/*!40000 ALTER TABLE `auto_j_x_d_j_z_d__bfkk` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_x_d_j_z_d__bfkk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_y_x_x_b__etdf`
--

DROP TABLE IF EXISTS `auto_j_y_x_x_b__etdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_y_x_x_b__etdf` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_y_x_x_b__etdf`
--

LOCK TABLES `auto_j_y_x_x_b__etdf` WRITE;
/*!40000 ALTER TABLE `auto_j_y_x_x_b__etdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_y_x_x_b__etdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_j_zh_j_y_x_x_b__ebez`
--

DROP TABLE IF EXISTS `auto_j_zh_j_y_x_x_b__ebez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_j_zh_j_y_x_x_b__ebez` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_j_zh_j_y_x_x_b__ebez`
--

LOCK TABLES `auto_j_zh_j_y_x_x_b__ebez` WRITE;
/*!40000 ALTER TABLE `auto_j_zh_j_y_x_x_b__ebez` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_j_zh_j_y_x_x_b__ebez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_k_y_x_x_d_j_b__rxsr`
--

DROP TABLE IF EXISTS `auto_k_y_x_x_d_j_b__rxsr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_k_y_x_x_d_j_b__rxsr` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_k_y_x_x_d_j_b__rxsr`
--

LOCK TABLES `auto_k_y_x_x_d_j_b__rxsr` WRITE;
/*!40000 ALTER TABLE `auto_k_y_x_x_d_j_b__rxsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_k_y_x_x_d_j_b__rxsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_l_x_j_l_l_b__c__jbdq`
--

DROP TABLE IF EXISTS `auto_l_x_j_l_l_b__c__jbdq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_l_x_j_l_l_b__c__jbdq` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_l_x_j_l_l_b__c__jbdq`
--

LOCK TABLES `auto_l_x_j_l_l_b__c__jbdq` WRITE;
/*!40000 ALTER TABLE `auto_l_x_j_l_l_b__c__jbdq` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_l_x_j_l_l_b__c__jbdq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_l_x_j_l_l_b_s_c__zrmn`
--

DROP TABLE IF EXISTS `auto_l_x_j_l_l_b_s_c__zrmn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_l_x_j_l_l_b_s_c__zrmn` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_l_x_j_l_l_b_s_c__zrmn`
--

LOCK TABLES `auto_l_x_j_l_l_b_s_c__zrmn` WRITE;
/*!40000 ALTER TABLE `auto_l_x_j_l_l_b_s_c__zrmn` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_l_x_j_l_l_b_s_c__zrmn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_l_x_j_l_l_b_y_c__wspr`
--

DROP TABLE IF EXISTS `auto_l_x_j_l_l_b_y_c__wspr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_l_x_j_l_l_b_y_c__wspr` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_l_x_j_l_l_b_y_c__wspr`
--

LOCK TABLES `auto_l_x_j_l_l_b_y_c__wspr` WRITE;
/*!40000 ALTER TABLE `auto_l_x_j_l_l_b_y_c__wspr` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_l_x_j_l_l_b_y_c__wspr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_m_z_z_d__yjhk`
--

DROP TABLE IF EXISTS `auto_m_z_z_d__yjhk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_m_z_z_d__yjhk` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__hfKH` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_m_z_z_d__yjhk`
--

LOCK TABLES `auto_m_z_z_d__yjhk` WRITE;
/*!40000 ALTER TABLE `auto_m_z_z_d__yjhk` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_m_z_z_d__yjhk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_q_t_b_j_x_x_b__niex`
--

DROP TABLE IF EXISTS `auto_q_t_b_j_x_x_b__niex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_q_t_b_j_x_x_b__niex` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_q_t_b_j_x_x_b__niex`
--

LOCK TABLES `auto_q_t_b_j_x_x_b__niex` WRITE;
/*!40000 ALTER TABLE `auto_q_t_b_j_x_x_b__niex` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_q_t_b_j_x_x_b__niex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_q_t_r_y_b__nfrc`
--

DROP TABLE IF EXISTS `auto_q_t_r_y_b__nfrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_q_t_r_y_b__nfrc` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_q_t_r_y_b__nfrc`
--

LOCK TABLES `auto_q_t_r_y_b__nfrc` WRITE;
/*!40000 ALTER TABLE `auto_q_t_r_y_b__nfrc` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_q_t_r_y_b__nfrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_q_x_z_d__ratj`
--

DROP TABLE IF EXISTS `auto_q_x_z_d__ratj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_q_x_z_d__ratj` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__TTtX` int DEFAULT NULL,
  `n_r__pNtn` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_q_x_z_d__ratj`
--

LOCK TABLES `auto_q_x_z_d__ratj` WRITE;
/*!40000 ALTER TABLE `auto_q_x_z_d__ratj` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_q_x_z_d__ratj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_q_x_z_d__znar`
--

DROP TABLE IF EXISTS `auto_q_x_z_d__znar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_q_x_z_d__znar` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__HJci` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_q_x_z_d__znar`
--

LOCK TABLES `auto_q_x_z_d__znar` WRITE;
/*!40000 ALTER TABLE `auto_q_x_z_d__znar` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_q_x_z_d__znar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_s_zh_x_x_d_j_b__mr_p`
--

DROP TABLE IF EXISTS `auto_s_zh_x_x_d_j_b__mr_p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_s_zh_x_x_d_j_b__mr_p` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_s_zh_x_x_d_j_b__mr_p`
--

LOCK TABLES `auto_s_zh_x_x_d_j_b__mr_p` WRITE;
/*!40000 ALTER TABLE `auto_s_zh_x_x_d_j_b__mr_p` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_s_zh_x_x_d_j_b__mr_p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_t_j_l_x_z_d__mpwc`
--

DROP TABLE IF EXISTS `auto_t_j_l_x_z_d__mpwc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_t_j_l_x_z_d__mpwc` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__nJER` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_t_j_l_x_z_d__mpwc`
--

LOCK TABLES `auto_t_j_l_x_z_d__mpwc` WRITE;
/*!40000 ALTER TABLE `auto_t_j_l_x_z_d__mpwc` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_t_j_l_x_z_d__mpwc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_t_j_x_x_b__dwtf`
--

DROP TABLE IF EXISTS `auto_t_j_x_x_b__dwtf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_t_j_x_x_b__dwtf` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_t_j_x_x_b__dwtf`
--

LOCK TABLES `auto_t_j_x_x_b__dwtf` WRITE;
/*!40000 ALTER TABLE `auto_t_j_x_x_b__dwtf` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_t_j_x_x_b__dwtf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_t_x_z_d__z_m_`
--

DROP TABLE IF EXISTS `auto_t_x_z_d__z_m_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_t_x_z_d__z_m_` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__zNrr` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_t_x_z_d__z_m_`
--

LOCK TABLES `auto_t_x_z_d__z_m_` WRITE;
/*!40000 ALTER TABLE `auto_t_x_z_d__z_m_` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_t_x_z_d__z_m_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_w_zh_z_d__wprk`
--

DROP TABLE IF EXISTS `auto_w_zh_z_d__wprk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_w_zh_z_d__wprk` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `x_h__ZENb` int DEFAULT NULL,
  `n_r__pQZW` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_w_zh_z_d__wprk`
--

LOCK TABLES `auto_w_zh_z_d__wprk` WRITE;
/*!40000 ALTER TABLE `auto_w_zh_z_d__wprk` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_w_zh_z_d__wprk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_x_b_z_d__xhaf`
--

DROP TABLE IF EXISTS `auto_x_b_z_d__xhaf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_x_b_z_d__xhaf` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__CwNY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_x_b_z_d__xhaf`
--

LOCK TABLES `auto_x_b_z_d__xhaf` WRITE;
/*!40000 ALTER TABLE `auto_x_b_z_d__xhaf` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_x_b_z_d__xhaf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_x_l_z_d__hcyh`
--

DROP TABLE IF EXISTS `auto_x_l_z_d__hcyh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_x_l_z_d__hcyh` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__HeiS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_x_l_z_d__hcyh`
--

LOCK TABLES `auto_x_l_z_d__hcyh` WRITE;
/*!40000 ALTER TABLE `auto_x_l_z_d__hcyh` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_x_l_z_d__hcyh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_x_w_z_d__wafe`
--

DROP TABLE IF EXISTS `auto_x_w_z_d__wafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_x_w_z_d__wafe` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__bNRd` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_x_w_z_d__wafe`
--

LOCK TABLES `auto_x_w_z_d__wafe` WRITE;
/*!40000 ALTER TABLE `auto_x_w_z_d__wafe` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_x_w_z_d__wafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_x_y_x_x_b__dxtc`
--

DROP TABLE IF EXISTS `auto_x_y_x_x_b__dxtc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_x_y_x_x_b__dxtc` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_x_y_x_x_b__dxtc`
--

LOCK TABLES `auto_x_y_x_x_b__dxtc` WRITE;
/*!40000 ALTER TABLE `auto_x_y_x_x_b__dxtc` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_x_y_x_x_b__dxtc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_zh_y_z_d__hwxr`
--

DROP TABLE IF EXISTS `auto_zh_y_z_d__hwxr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_zh_y_z_d__hwxr` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__iRnX` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_zh_y_z_d__hwxr`
--

LOCK TABLES `auto_zh_y_z_d__hwxr` WRITE;
/*!40000 ALTER TABLE `auto_zh_y_z_d__hwxr` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_zh_y_z_d__hwxr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_zh_zh_d_j_z_d__emzc`
--

DROP TABLE IF EXISTS `auto_zh_zh_d_j_z_d__emzc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_zh_zh_d_j_z_d__emzc` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__hRpA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_zh_zh_d_j_z_d__emzc`
--

LOCK TABLES `auto_zh_zh_d_j_z_d__emzc` WRITE;
/*!40000 ALTER TABLE `auto_zh_zh_d_j_z_d__emzc` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_zh_zh_d_j_z_d__emzc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_zh_zh_m_m_z_d__errh`
--

DROP TABLE IF EXISTS `auto_zh_zh_m_m_z_d__errh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_zh_zh_m_m_z_d__errh` (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_r__TBmb` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_zh_zh_m_m_z_d__errh`
--

LOCK TABLES `auto_zh_zh_m_m_z_d__errh` WRITE;
/*!40000 ALTER TABLE `auto_zh_zh_m_m_z_d__errh` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_zh_zh_m_m_z_d__errh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `column_manage`
--

DROP TABLE IF EXISTS `column_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `column_manage` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属于哪个表',
  `merge_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多列合并使用同一个merge_name(仅前端可用到)',
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级字段',
  `is_parent` tinyint(1) DEFAULT NULL COMMENT '表明父级字段',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名（中文，用于前端显示）',
  `sort` float DEFAULT NULL COMMENT '列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序',
  `status` int DEFAULT NULL COMMENT '列状态：1：显示，2：隐藏',
  `field_length` int DEFAULT NULL COMMENT 'varchar列的长度',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名（英文，用于建表）',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字段类型：int、str 32、datetime、text、bool等',
  `empty` tinyint(1) DEFAULT NULL COMMENT '是否可为空',
  `primary` tinyint(1) DEFAULT NULL COMMENT '是否为主键',
  `unique` tinyint(1) DEFAULT NULL COMMENT '是否唯一',
  `is_encrypt` tinyint(1) DEFAULT NULL COMMENT '是否加密',
  `association` json DEFAULT NULL COMMENT '定义关联字段，可定义多个，数组表示',
  `description` json DEFAULT NULL COMMENT '字段描述',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `column_manage_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table_manage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `column_manage`
--

LOCK TABLES `column_manage` WRITE;
/*!40000 ALTER TABLE `column_manage` DISABLE KEYS */;
INSERT INTO `column_manage` VALUES ('0ed7762d-bad8-40d1-96ce-bb325958f3f5','cf958655-ccc3-4806-8819-25766a9a7026',NULL,'',0,'序号',0,1,NULL,0,'x_h__TTtX','int',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:24:53','2024-04-28 10:24:53'),('27657e84-474d-4f81-81eb-a78d1cf9d1c6','a299b7ea-6992-45e4-8eee-22cecedf88b3',NULL,'',0,'内容',0,1,2,0,'n_r__aWPY','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:25:53','2024-04-28 10:25:53'),('28edebba-24a8-412a-bccf-db7e4036cf96','e9912b94-4b8b-4830-bdcb-5790a5e015d7',NULL,'',0,'序号',0,1,NULL,0,'x_h__ZENb','int',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:23:40','2024-04-28 10:23:40'),('2902dc62-de36-4e22-958e-7f216544fa49','38bc7488-42f6-4bba-9e53-191c68941d0c',NULL,'',0,'内容',0,1,1,0,'n_r__CwNY','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:18:28','2024-04-28 10:18:28'),('29fa7424-8c5f-45d0-8bac-d5dc655f43af','2579616f-f8a9-46c4-a10e-1f20bff21a40',NULL,'',0,'内容',0,1,2,0,'n_r__eehB','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:27:23','2024-04-28 10:27:23'),('2f029aae-0992-40c9-9a89-0a385b78a902','cf958655-ccc3-4806-8819-25766a9a7026',NULL,'',0,'内容',0,1,4,0,'n_r__pNtn','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:25:03','2024-04-28 10:25:03'),('2f67045c-5cfc-4c21-8691-ea2d32bd3a0a','7b728056-aed1-4fe4-af88-82e048595648',NULL,'',0,'内容',0,1,2,0,'n_r__krXX','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:24:29','2024-04-28 10:24:29'),('5bb22265-49b4-4ebf-94fb-c6707d7cd523','9400a484-c7a7-4cce-ac43-5129c340da63',NULL,'',0,'内容',0,1,2,0,'n_r__bNRd','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:20:14','2024-04-28 10:20:14'),('7e48f5df-5e60-4445-9478-20dc960ce0ef','1165e73e-61b7-49c2-8527-7e373ec01372',NULL,'',0,'内容',0,1,16,0,'n_r__iRnX','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:22:53','2024-04-28 10:22:53'),('821ceed8-97c2-4cd9-a2bf-30dbf870b64b','b9cc5b40-682a-46ee-91dd-0cb9d6e11b8f',NULL,'',0,'内容',0,1,10,0,'n_r__hfKH','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:19:29','2024-04-28 10:19:29'),('87a1166f-2853-4785-9320-a0908bc2a7ee','9ef25a11-2eb7-458d-b100-8032a9aff2b2',NULL,'',0,'内容',0,1,4,0,'n_r__HeiS','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:19:51','2024-04-28 10:19:51'),('914f49c8-f4a6-47cd-9a30-0b2f33ac70ce','3c30575d-3685-4cff-92e5-1a5851b65493',NULL,'',0,'名称',0,1,16,0,'m_ch__wdrd','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 13:44:52','2024-04-28 13:44:52'),('9f727eeb-271d-4983-8af5-e87633e993d0','63682de3-546e-4b4e-86a9-7df3e29b2cee',NULL,'',0,'内容',0,1,4,0,'n_r__TBmb','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:18:58','2024-04-28 10:18:58'),('a63505f0-8245-47fd-b5df-49aec0a9c922','fb480f23-2098-4ae5-8a19-1fff88c59536',NULL,'',0,'内容',0,1,10,0,'n_r__TnZ_','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:20:43','2024-04-28 10:20:43'),('b954e059-7e19-4eb3-a966-0692be351401','46f479de-4c23-48c1-a374-88e715539a0e',NULL,'',0,'序号',0,1,NULL,0,'x_h__nStS','int',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:26:47','2024-04-28 10:26:47'),('c488ccda-a24f-4193-a71a-63879c237416','e9912b94-4b8b-4830-bdcb-5790a5e015d7',NULL,'',0,'内容',0,1,2,0,'n_r__pQZW','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:23:48','2024-04-28 10:23:48'),('c9d1bc47-d864-4ee1-9139-6d97b6f4497b','46f479de-4c23-48c1-a374-88e715539a0e',NULL,'',0,'内容',0,1,4,0,'n_r__NpBj','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:26:55','2024-04-28 10:26:55'),('cb930d8f-6ec1-42d0-8ee3-54ed5e08e089','f4f4e22f-6475-49bb-b00d-13dadfa778fa',NULL,'',0,'内容',0,1,1,0,'n_r__nXEt','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:23:12','2024-04-28 10:23:12'),('cff32530-00a1-4667-8154-ca6a5fad6c41','048fe8a8-6ad6-423d-ba7f-8c6769afcdf6',NULL,'',0,'内容',0,1,2,0,'n_r__BXPp','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:27:55','2024-04-28 10:27:55'),('e1f68145-ee4e-4638-80cf-da59d7e2a2e5','c0bd7d0c-4047-40f7-8a99-f17cdedfe589',NULL,'',0,'内容',0,1,2,0,'n_r___jQp','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:21:35','2024-04-28 10:21:35'),('e4221fe8-71b9-4d3a-a2bd-9dcd19a54793','82f94fee-6e5a-4bcb-b0e9-5fbd9c4ae48c',NULL,'',0,'内容',0,1,2,0,'n_r__zNrr','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:25:25','2024-04-28 10:25:25'),('e5119aa1-01a8-46be-aeea-8ef4f51ff77e','2288113a-e9be-452f-a88f-16506b2218ca',NULL,'',0,'内容',0,1,4,0,'n_r__nJER','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:22:20','2024-04-28 10:22:20'),('e6c154f0-dcfa-44a7-9668-b1da9cc6d860','5f46e5c2-7c43-457a-aade-882baa4baadb',NULL,'',0,'内容',0,1,4,0,'n_r__HJci','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:26:16','2024-04-28 10:26:16'),('ecf10867-3a47-41bc-b4f5-2aebf0c45f51','7b728056-aed1-4fe4-af88-82e048595648',NULL,'',0,'序号',0,1,NULL,0,'x_h__at_T','int',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:24:19','2024-04-28 10:24:19'),('f86ddd4c-98fe-4e16-8aea-1dc89819956f','67c95641-828f-46d4-baff-aa758a15ea31',NULL,'',0,'内容',0,1,10,0,'n_r__hRpA','varchar',NULL,NULL,NULL,NULL,'[]','null','sysadmin',NULL,'2024-04-28 10:21:07','2024-04-28 10:21:07');
/*!40000 ALTER TABLE `column_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_chapter`
--

DROP TABLE IF EXISTS `course_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_chapter` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父章节, 自关联',
  `type` int DEFAULT NULL COMMENT '1课程、2资源',
  `course_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '课程名称/教学资源名称',
  `course_chapter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '章节名称/教学资源名称',
  `serial_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '章节编号',
  `knowledge_points` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '知识点',
  `learning_hours` int DEFAULT NULL COMMENT '学时',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `course_chapter_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `course_chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_chapter`
--

LOCK TABLES `course_chapter` WRITE;
/*!40000 ALTER TABLE `course_chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_date` date DEFAULT NULL COMMENT '日期',
  `course_sequence` int DEFAULT NULL COMMENT '节次',
  `classroom` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室',
  `course_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程',
  `teacher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师',
  `classes` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '期班',
  `students_num` int DEFAULT NULL COMMENT '学习人数',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int DEFAULT NULL COMMENT '状态',
  `course_start` datetime NOT NULL COMMENT '课程开始时间',
  `course_end` datetime NOT NULL COMMENT '课程结束时间',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedule`
--

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_source`
--

DROP TABLE IF EXISTS `course_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_source` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_chapter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称/教学资源id',
  `file_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文档id',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '资源描述信息',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_chapter_id` (`course_chapter_id`),
  CONSTRAINT `course_source_ibfk_1` FOREIGN KEY (`course_chapter_id`) REFERENCES `course_chapter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_source`
--

LOCK TABLES `course_source` WRITE;
/*!40000 ALTER TABLE `course_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文档名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文档存放路径ftp',
  `document_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文档类型',
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '记录',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文档上传人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_archive`
--

DROP TABLE IF EXISTS `error_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_archive` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试题ID',
  `collector` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收藏者ID',
  `explanation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错题解析',
  `difficulty` int DEFAULT NULL COMMENT '错题难度,(''1'', ''入门''),(''2'', ''简单''),(''3'', ''普通''),(''4'', ''较难''),(''5'', ''困难'')',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_archive`
--

LOCK TABLES `error_archive` WRITE;
/*!40000 ALTER TABLE `error_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_result` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生ID',
  `exam_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试ID',
  `total_score` int DEFAULT NULL COMMENT '学生考试得分',
  `start_time` datetime DEFAULT NULL COMMENT '学生开始考试的时间',
  `end_time` datetime DEFAULT NULL COMMENT '学生结束考试的时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  PRIMARY KEY (`id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `exam_result_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `examination` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_result_chk_1` CHECK ((`total_score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result_detail`
--

DROP TABLE IF EXISTS `exam_result_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_result_detail` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exam_result_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试结果ID',
  `question_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试题ID',
  `solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '学生作答结果',
  `mark` int DEFAULT NULL COMMENT '试题得分',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  PRIMARY KEY (`id`),
  KEY `exam_result_id` (`exam_result_id`),
  CONSTRAINT `exam_result_detail_ibfk_1` FOREIGN KEY (`exam_result_id`) REFERENCES `exam_result` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_result_detail_chk_1` CHECK ((`mark` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result_detail`
--

LOCK TABLES `exam_result_detail` WRITE;
/*!40000 ALTER TABLE `exam_result_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_result_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级id, 自关联',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '期班名称',
  `paper_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷ID',
  `description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考试描述',
  `exam_date` date DEFAULT NULL COMMENT '考试日期',
  `total_time` int DEFAULT NULL COMMENT '考试时长(分钟)',
  `start_time` datetime DEFAULT NULL COMMENT '考试开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '考试结束时间',
  `major` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业课',
  `tips` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考生须知',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `is_published` int DEFAULT NULL COMMENT '是否发布, 1：发布、0：保留，默认值：0',
  `publish_date` datetime DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `examination` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flying_service`
--

DROP TABLE IF EXISTS `flying_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flying_service` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '安排的计划名',
  `route_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '航线id',
  `plane_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '飞机id',
  `coach_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教员id',
  `student_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学员id',
  `plan_duration` int NOT NULL COMMENT '计划飞行时长',
  `plan_time_start` datetime NOT NULL COMMENT '计划飞行开始时间',
  `plan_time_end` datetime NOT NULL COMMENT '计划飞行结束时间',
  `status` int NOT NULL COMMENT '计划中，正在进行，按计划完成，补签完成，过时未进行，已调整，已取消',
  `real_duration` int DEFAULT NULL COMMENT '实际飞行时长',
  `real_time_start` datetime DEFAULT NULL COMMENT '实际飞行开始时间',
  `real_time_end` datetime DEFAULT NULL COMMENT '实际飞行开始时间',
  `handle_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `handle_user` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人',
  `handle_reason` json DEFAULT NULL COMMENT '操作原因',
  `adjust_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '调整到其他飞行计划的id, 自关联',
  `description` json DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `expand_data` json DEFAULT NULL COMMENT '依据',
  PRIMARY KEY (`id`),
  KEY `adjust_id` (`adjust_id`),
  CONSTRAINT `flying_service_ibfk_1` FOREIGN KEY (`adjust_id`) REFERENCES `flying_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flying_service`
--

LOCK TABLES `flying_service` WRITE;
/*!40000 ALTER TABLE `flying_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `flying_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gnss_data`
--

DROP TABLE IF EXISTS `gnss_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gnss_data` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sync_code1` int NOT NULL COMMENT '同步码1',
  `sync_code2` int NOT NULL COMMENT '同步码2',
  `sync_code3` int NOT NULL COMMENT '同步码3',
  `identify_code` int NOT NULL COMMENT '识别码',
  `gps_week` int NOT NULL COMMENT 'GPS周数',
  `gps_milliseconds` int NOT NULL COMMENT 'GPS毫秒数',
  `latitude` float NOT NULL COMMENT '纬度',
  `longitude` float NOT NULL COMMENT '经度',
  `altitude` float NOT NULL COMMENT '海拔高度',
  `latitude_stddev` float NOT NULL COMMENT '纬度标准偏差',
  `longitude_stddev` float NOT NULL COMMENT '经度标准偏差',
  `altitude_stddev` float NOT NULL COMMENT '海拔高度标准偏差',
  `horizon_speed` float NOT NULL COMMENT '水平速度',
  `upward_speed` float NOT NULL COMMENT '垂直速度',
  `track_direction` float NOT NULL COMMENT '航迹方向',
  `positioning_status_satellite_count` int NOT NULL COMMENT '定位状态/卫星数量',
  `solution_satellite_count` int NOT NULL COMMENT '解决方案卫星数量',
  `differential_age` float NOT NULL COMMENT '差分龄期',
  `azimuth` float NOT NULL COMMENT '方位角',
  `pitch` float NOT NULL COMMENT '俯仰角',
  `checksum` int NOT NULL COMMENT '校验和',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gnss_data`
--

LOCK TABLES `gnss_data` WRITE;
/*!40000 ALTER TABLE `gnss_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `gnss_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_manage`
--

DROP TABLE IF EXISTS `log_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_manage` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` int NOT NULL COMMENT '0: debug, 1: info, 2: warning, 3: error',
  `handle_user` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人',
  `handle_reason` json DEFAULT NULL COMMENT '操作原因',
  `handle_params` json DEFAULT NULL COMMENT '操作参数',
  `entity_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作数据库表的名字',
  `entity_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作的实体id',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_manage`
--

LOCK TABLES `log_manage` WRITE;
/*!40000 ALTER TABLE `log_manage` DISABLE KEYS */;
INSERT INTO `log_manage` VALUES ('01abd723-69b1-46d6-95b1-22a16ed1627d',1,'sysadmin','\"创建菜单\"','{\"code\": \"f_d_j_l_l_x_x__atRb\", \"icon\": \"Ticket\", \"name\": \"发动机履历信息\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','429583ad-5084-4f62-a5cd-fcf4370b95b8',0,'2024-04-28 18:23:10'),('07fc405e-4b9e-44ef-b3cc-00ce3c4d91da',1,'sysadmin','\"创建菜单\"','{\"code\": \"y_c__bteh\", \"icon\": \"Reading\", \"name\": \"一册\", \"sort\": 999, \"type\": 2, \"parent\": \"l_x_j_l_l_x_x__MmaD\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','6fbcdf0e-f227-4097-9fe0-202d8cae312d',0,'2024-04-28 18:29:33'),('095b2918-04ab-4d37-aac3-c3ed898dd016',1,'sysadmin','\"创建菜单\"','{\"code\": \"d_q_t_x__AhDW\", \"icon\": \"AlarmClock\", \"name\": \"到期提醒\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_s_zh_x_x__jsmG\", \"status\": 1, \"table_code\": \"s_zh_x_x_d_j_b__mR_p\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','89163529-6200-4645-b41f-f9e8db527014',0,'2024-04-28 18:16:09'),('09b734f0-aa4e-48a3-9a38-9f9262a8dcc1',1,'sysadmin','\"创建菜单\"','{\"code\": \"f_x_j_h_g_l__kTWW\", \"icon\": \"Guide\", \"name\": \"飞行计划管理\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_g_h__AKJw\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','fd682c93-289a-4568-b8f1-174b4c9f29bc',0,'2024-04-28 17:42:25'),('0ac94bc6-ce18-42a0-b0a0-2df49f73bab7',1,'sysadmin','\"创建菜单\"','{\"code\": \"j_h_zh_d__PfwW\", \"icon\": \"EditPen\", \"name\": \"计划制定\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_j_h_g_l__kTWW\", \"status\": 1, \"table_code\": \"f_x_j_h_g_l__bAdm\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','71530b76-7c56-4ea6-afc4-4fcfbfd0af10',0,'2024-04-28 17:43:17'),('0e98c3fe-0a14-42c0-bff2-1e660cc28b53',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__wkMt\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"s_c__YXeW\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b_s_c__Zrmn\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','ac6d8442-9a63-4f90-9328-7259418f65b5',0,'2024-04-29 10:55:09'),('146409d1-d116-4e0e-90d6-973a29cea20e',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_j_x_x_d_j_b__hrwM\", \"name\": \"飞机信息登记表\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建飞机信息登记表@20240428180935\", \"update_user\": null}','f_j_x_x_d_j_b__hrwM','3cd1461b-da43-4aff-8510-a4dbfecb4dc3',0,'2024-04-28 18:09:38'),('16ddeaa0-b389-4cef-8a3c-cc3977b6be82',1,'sysadmin','\"创建数据库表\"','{\"code\": \"h_d_k_g_l__GM_n\", \"name\": \"航点库管理\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建航点库管理@20240428173359\", \"update_user\": null}','h_d_k_g_l__GM_n','b70c4c30-479d-45c8-833c-79a2ea2d7355',0,'2024-04-28 17:34:00'),('1b2b7b66-8575-42b1-bb01-1b944df98ab1',1,'sysadmin','\"创建菜单\"','{\"code\": \"s_c__xwCS\", \"icon\": \"Reading\", \"name\": \"三册\", \"sort\": 999, \"type\": 2, \"parent\": \"f_d_j_l_l_x_x__atRb\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','adafb28f-c54d-4232-8f57-443c526ff6aa',0,'2024-04-28 18:26:25'),('1b611dc4-5724-416f-b22e-f0fd60057b27',1,'sysadmin','\"编辑菜单\"','{\"code\": null, \"icon\": null, \"name\": \"二册 \", \"sort\": 999, \"type\": null, \"parent\": null, \"status\": 1, \"is_delete\": false, \"table_code\": \"\", \"description\": \"\", \"update_user\": \"sysadmin\"}','menu_manage','80f324a7-fef4-4baa-a926-f367a3970555',0,'2024-04-28 18:32:51'),('2119b81e-be6f-4dd2-98ce-9bdb084a3baa',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__ShDQ\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"h_d_k_g_l__WnmJ\", \"status\": 1, \"table_code\": \"h_d_k_g_l__GM_n\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','65bc87fc-3a57-454b-94b2-cd3ae72f6ead',0,'2024-04-28 17:38:10'),('223f22f6-c981-475b-a553-e98336f34723',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__MQaJ\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"s_c__xwCS\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b_s_c___hTt\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','0ad4b858-fa56-4188-8692-41b19d4c1860',0,'2024-04-28 18:27:25'),('27565073-3b34-4613-b242-49ee579a6033',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__FD_M\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"f_j_x_x_d_j_b__hrwM\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','cb7ff192-2d98-43a3-a465-4243da52e654',0,'2024-04-28 18:13:45'),('2dc10383-399a-40ac-a321-6082e4940e4e',1,'sysadmin','\"创建菜单\"','{\"code\": \"q_t_b_j_x_x__BBCC\", \"icon\": \"MoreFilled\", \"name\": \"其他部件信息\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','903c70f5-60a0-454b-aa40-655c11603bec',0,'2024-04-29 10:56:49'),('308af1fa-2431-45a8-9cd1-3b760f6e3786',1,'sysadmin','\"创建数据库表\"','{\"code\": \"l_x_j_l_l_b__c__JBdQ\", \"name\": \"螺旋桨履历表二册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建螺旋桨履历表二册@20240428181142\", \"update_user\": null}','l_x_j_l_l_b__c__JBdQ','108bbb7e-ccc4-4290-9750-cc72554ee636',0,'2024-04-28 18:11:43'),('33c95d63-8e68-4a0b-81b6-46e06de8aa0b',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__xQCJ\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"s_c__YXeW\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b_s_c__Zrmn\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','e6a0e3c8-e59a-4563-8b00-515d111f385d',0,'2024-04-29 10:55:45'),('3b2f2546-b793-473f-978a-5e01b6cb1a94',1,'sysadmin','\"编辑菜单\"','{\"code\": null, \"icon\": null, \"name\": null, \"sort\": 999, \"type\": null, \"parent\": \"f_j_x_x__Zjhy\", \"status\": 1, \"is_delete\": false, \"table_code\": \"\", \"description\": \"\", \"update_user\": \"sysadmin\"}','menu_manage','cb7ff192-2d98-43a3-a465-4243da52e654',0,'2024-04-28 18:14:02'),('3c9ab69b-ec4c-4d1f-b771-ca54b79f86e4',1,'sysadmin','\"创建菜单\"','{\"code\": \"g_h__SPfS\", \"icon\": \"EditPen\", \"name\": \"规划\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_h_x_g_l__QyEG\", \"status\": 1, \"table_code\": \"h_x_g_l__Gfxb\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','9a888419-8702-49d3-94fa-2057b752c53f',0,'2024-04-28 17:41:00'),('3ec5b9b6-1967-44e1-8181-f68297a00093',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_d_j_l_l_b__c__TTrW\", \"name\": \"发动机履历表二册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建发动机履历表二册@20240428181050\", \"update_user\": null}','f_d_j_l_l_b__c__TTrW','9c0197f8-0491-4f8d-884d-b9df51ac8166',0,'2024-04-28 18:10:51'),('3f8e4fb3-0832-428c-a6d8-16d4e76ffd9c',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__sGJK\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__bmwJ\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b__c__JBdQ\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','7bfa0197-6c37-4471-9876-301b2b25b5e1',0,'2024-04-28 18:37:43'),('42589658-95ec-4283-a450-047b3b2c729a',1,'sysadmin','\"创建数据库表\"','{\"code\": \"q_t_b_j_x_x_b__NieX\", \"name\": \"其他部件信息表\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建其他部件信息表@20240428181216\", \"update_user\": null}','q_t_b_j_x_x_b__NieX','5f917074-6910-4c67-91c6-e70205dfa0a1',0,'2024-04-28 18:12:18'),('42925c4f-f7b2-4dc6-bbbb-514c3c943169',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__iDWM\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__bckt\", \"status\": 1, \"table_code\": \"f_j_l_l_b__c__tJZG\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','ac889799-dbc3-43ac-a605-c89d29205e90',0,'2024-04-28 18:20:37'),('4783f06c-d505-4308-b6cb-daa242542fdb',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__d_pH\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__bckt\", \"status\": 1, \"table_code\": \"f_j_l_l_b__c__tJZG\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','038a63d6-d527-4d1b-b2ef-c9861e633241',0,'2024-04-28 18:20:54'),('47f457da-122d-4d53-9905-0957a185a0f6',1,'sysadmin','\"创建菜单\"','{\"code\": \"h_d_k_g_l__WnmJ\", \"icon\": \"MagicStick\", \"name\": \"航点库管理\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_g_h__AKJw\", \"status\": 1, \"table_code\": \"h_d_k_g_l__GM_n\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','8fa3ba96-1555-4c03-963a-75e2733394fe',0,'2024-04-28 17:37:11'),('49cf7443-2329-45fa-aae7-8ceec56b6af9',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__thZx\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_x_x__Zjhy\", \"status\": 1, \"table_code\": \"f_j_x_x_d_j_b__hrwM\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','e59f31f5-82dd-49d4-9bed-83c31f8d3880',0,'2024-04-28 18:14:31'),('5cf8d6c6-d977-4b07-b987-670a279c4d4a',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__aKJb\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__bteh\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b_y_c__WsPR\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','81949851-1dd9-431c-9ac5-269f4dc63cbb',0,'2024-04-28 18:29:55'),('5d711e9b-5725-4264-9398-603c35af62f6',1,'sysadmin','\"创建菜单\"','{\"code\": \"y_c__zzRm\", \"icon\": \"Reading\", \"name\": \"一册\", \"sort\": 999, \"type\": 2, \"parent\": \"f_d_j_l_l_x_x__atRb\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','1762496b-4867-4c09-a8ff-d77cebc058bd',0,'2024-04-28 18:23:32'),('5e04312a-1098-4d01-811c-2223a3d1d041',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__XBNh\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__bmwJ\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b__c__JBdQ\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','e86083cb-9e49-45ef-82ec-4ca27f026ff7',0,'2024-04-28 18:36:28'),('63fb388b-d284-46d3-91d3-b7a9b08f0f02',1,'sysadmin','\"创建菜单\"','{\"code\": \"d_q_t_x__GFGW\", \"icon\": \"AlarmClock\", \"name\": \"到期提醒\", \"sort\": 999, \"type\": 2, \"parent\": \"q_t_b_j_x_x__BBCC\", \"status\": 1, \"table_code\": \"q_t_b_j_x_x_b__NieX\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','8037f67a-16f7-4485-aeb2-7f9ba85e9056',0,'2024-04-29 10:57:36'),('67c61b2c-dc3d-421a-9eee-4c97cd6dca3c',1,'sysadmin','\"创建数据库表\"','{\"code\": \"l_x_j_l_l_b_y_c__WsPR\", \"name\": \"螺旋桨履历表一册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建螺旋桨履历表一册@20240428181133\", \"update_user\": null}','l_x_j_l_l_b_y_c__WsPR','db841c6f-0afe-4b83-9039-0aef80721b39',0,'2024-04-28 18:11:34'),('688c9d78-5d73-4a74-b70d-e1688b4cc581',1,'sysadmin','\"创建菜单\"','{\"code\": \"s_c__YXeW\", \"icon\": \"Reading\", \"name\": \"三册\", \"sort\": 999, \"type\": 2, \"parent\": \"l_x_j_l_l_x_x__MmaD\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','6446c20e-9dc7-48fa-8aff-36a6971e2183',0,'2024-04-29 10:54:48'),('695c4397-e49f-4e2b-8ed1-c2c97385416f',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__deCr\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__QXfs\", \"status\": 1, \"table_code\": \"f_j_l_l_b_y_c__JFbX\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','b216e170-f0cc-41f4-9049-64a7ff221c85',0,'2024-04-28 18:19:10'),('6e158b3a-d8f3-4ec7-a197-8c218f0d561b',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__MdEe\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__CiYQ\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b__c__TTrW\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','4e776400-fb20-4282-8508-96e8f11acc3a',0,'2024-04-28 18:26:01'),('6f0a7f32-ecd5-44b8-859e-340ffa3b6cad',1,'sysadmin','\"创建菜单\"','{\"code\": \"f_j_x_x__Zjhy\", \"icon\": \"Promotion\", \"name\": \"飞机信息\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','65d0c015-4d78-46cd-b245-951bdf0dce55',0,'2024-04-28 18:13:03'),('6f8e979e-ce7a-4809-98ac-df4eb30069d3',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__FZiT\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__QXfs\", \"status\": 1, \"table_code\": \"f_j_l_l_b_y_c__JFbX\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','3776479d-608f-4f00-bcd7-c6bc857545e6',0,'2024-04-28 18:18:26'),('74273a80-cbc2-48fb-9f83-5d2f2849b2e7',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_d_j_l_l_b_y_c__MhDS\", \"name\": \"发动机履历表一册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建发动机履历表一册@20240428181039\", \"update_user\": null}','f_d_j_l_l_b_y_c__MhDS','2762b17f-7fc5-4a93-9fc8-c1ee1daff11d',0,'2024-04-28 18:10:41'),('752d0355-39ea-4000-b6e0-cb8f204d3060',1,'sysadmin','\"编辑菜单\"','{\"code\": null, \"icon\": null, \"name\": \"航点库管理\", \"sort\": 999, \"type\": null, \"parent\": null, \"status\": 1, \"is_delete\": false, \"table_code\": \"\", \"description\": \"\", \"update_user\": \"sysadmin\"}','menu_manage','8fa3ba96-1555-4c03-963a-75e2733394fe',0,'2024-04-28 17:37:44'),('774174e1-2cf7-4f78-839f-c400bcaeaefb',1,'sysadmin','\"编辑菜单\"','{\"code\": null, \"icon\": null, \"name\": \"飞行规划\", \"sort\": 999, \"type\": null, \"parent\": null, \"status\": 1, \"is_delete\": false, \"table_code\": \"\", \"description\": \"\", \"update_user\": \"sysadmin\"}','menu_manage','1b10e366-a10c-4f9b-b692-f91724bb4996',0,'2024-04-28 17:42:42'),('77695868-150e-4f8b-83e0-d717a53a1aa0',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__eGdM\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__zzRm\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b_y_c__MhDS\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','7d1ea571-565e-488a-afdc-f4cc00af3dc5',0,'2024-04-28 18:23:51'),('77e0f7e8-5f6f-4352-a747-dccec823b7c8',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_x_j_h_g_l__bAdm\", \"name\": \"飞行计划管理\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建飞行计划管理@20240428173434\", \"update_user\": null}','f_x_j_h_g_l__bAdm','63d07e11-8a57-4a22-a4f0-5d511814a32a',0,'2024-04-28 17:34:35'),('7eb36325-b408-45c7-841f-1ba68c9d7386',1,'sysadmin','\"创建菜单\"','{\"code\": \"y_c__QXfs\", \"icon\": \"Reading\", \"name\": \"一册\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_l_l_x_x__edXy\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','5e03c81e-475f-4480-bb8b-7e3e70e473bd',0,'2024-04-28 18:18:04'),('815ba46d-5ff8-4684-8da1-ea8c3044f7cf',1,'sysadmin','\"创建数据库表\"','{\"code\": \"s_zh_x_x_d_j_b__mR_p\", \"name\": \"三证信息登记表\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建三证信息登记表@20240428180952\", \"update_user\": null}','s_zh_x_x_d_j_b__mR_p','c4578457-06d4-4ee8-9041-8189c144beec',0,'2024-04-28 18:09:53'),('8531afac-eb4d-422b-8961-dee45990bcd7',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_d_j_l_l_b_s_c___hTt\", \"name\": \"发动机履历表三册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建发动机履历表三册@20240428181059\", \"update_user\": null}','f_d_j_l_l_b_s_c___hTt','dadd9bd8-31a9-42f8-9f38-97e0e5c24262',0,'2024-04-28 18:11:00'),('87b3102e-b247-441b-8513-b0d45cf2bd09',1,'sysadmin','\"创建菜单\"','{\"code\": \"f_j_l_l_x_x__edXy\", \"icon\": \"Flag\", \"name\": \"飞机履历信息\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','8b902c4f-504f-4348-a6a3-5e29e576961d',0,'2024-04-28 18:17:07'),('8800a8ca-c3f1-49f0-9452-231c202e56c2',1,'sysadmin','\"编辑菜单\"','{\"code\": null, \"icon\": null, \"name\": \"航点库信息\", \"sort\": 999, \"type\": null, \"parent\": null, \"status\": 1, \"is_delete\": false, \"table_code\": \"\", \"description\": \"\", \"update_user\": \"sysadmin\"}','menu_manage','8fa3ba96-1555-4c03-963a-75e2733394fe',0,'2024-04-28 17:37:20'),('88ac71f3-2405-4b28-9ee2-afd5a7c8dc39',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_j_l_l_b_y_c__JFbX\", \"name\": \"飞机履历表一册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建飞机履历表一册@20240428181010\", \"update_user\": null}','f_j_l_l_b_y_c__JFbX','00658f74-6f5b-4873-a414-1610669c44c1',0,'2024-04-28 18:10:11'),('8e83c864-ca32-48c4-bade-addce7aeea49',1,'sysadmin','\"创建菜单\"','{\"code\": \"j_h_ch_k__iTyx\", \"icon\": \"Search\", \"name\": \"计划查看\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_j_h_g_l__kTWW\", \"status\": 1, \"table_code\": \"f_x_j_h_g_l__bAdm\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','e3461840-c351-4327-834b-e88332379f8f',0,'2024-04-28 17:43:42'),('98a2c759-fa45-4461-af11-ad5a99c5d3fa',1,'sysadmin','\"创建数据库表\"','{\"code\": \"h_x_g_l__Gfxb\", \"name\": \"航线管理\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建航线管理@20240428173410\", \"update_user\": null}','h_x_g_l__Gfxb','7d031493-b14f-4686-89f5-3bf63b8f8e5f',0,'2024-04-28 17:34:11'),('98a745f5-675c-48e7-8433-bdea8f387ca6',1,'sysadmin','\"创建数据库表\"','{\"code\": \"l_x_j_l_l_b_s_c__Zrmn\", \"name\": \"螺旋桨履历表三册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建螺旋桨履历表三册@20240428181151\", \"update_user\": null}','l_x_j_l_l_b_s_c__Zrmn','bbabfbaf-939d-436e-9ce9-16d289de8c1c',0,'2024-04-28 18:11:52'),('a5ee3069-8fc2-4938-8900-6285a8520a50',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j___QPr\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__bteh\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b_y_c__WsPR\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','f093dd88-d54e-4c45-9c35-4e93458cb34d',0,'2024-04-28 18:31:56'),('a688c779-ff55-4bf7-85da-488c612f22a5',1,'sysadmin','\"创建菜单\"','{\"code\": \"y_l__MeYY\", \"icon\": \"View\", \"name\": \"预览\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_h_x_g_l__QyEG\", \"status\": 1, \"table_code\": \"h_x_g_l__Gfxb\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','cfd28786-c98b-4af2-8030-830baae47605',0,'2024-04-28 17:41:23'),('ae004824-089e-45dd-9580-2a74742b57de',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__QtAh\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"s_c__xwCS\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b_s_c___hTt\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','f917f41e-1dac-41f2-b8d2-3dfcadc351f3',0,'2024-04-28 18:26:47'),('b162dd1c-9429-4e57-8c5f-135a02dda15d',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__BByT\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__CiYQ\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b__c__TTrW\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','df16514c-67ed-4055-92a8-55fd8e335c72',0,'2024-04-28 18:25:39'),('b6c698bb-df5a-4244-8da7-16d050a52bd2',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__CRiJ\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__bckt\", \"status\": 1, \"table_code\": \"f_j_l_l_b__c__tJZG\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','1897605b-26ad-45d6-bef4-f8d9ff104019',0,'2024-04-28 18:20:21'),('bcb9ec6b-ee6d-41d8-89de-92a4928973b2',1,'sysadmin','\"创建菜单\"','{\"code\": \"y_l__TWcX\", \"icon\": \"View\", \"name\": \"预览\", \"sort\": 999, \"type\": 2, \"parent\": \"h_d_k_g_l__WnmJ\", \"status\": 1, \"table_code\": \"h_d_k_g_l__GM_n\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','1e26a891-22a6-4e8a-b502-3159e18f5b87',0,'2024-04-28 17:39:26'),('c02a7ef1-9e4f-4d46-aa51-6fc324097e8f',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_x_j_l_l_x_x__MmaD\", \"icon\": \"Orange\", \"name\": \"螺旋桨履历信息\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','18a8a37d-b864-4556-8bde-3f4bf023dc60',0,'2024-04-28 18:29:11'),('c6410f6b-a70b-4603-a859-589790c39f6e',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__mPxJ\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"q_t_b_j_x_x__BBCC\", \"status\": 1, \"table_code\": \"q_t_b_j_x_x_b__NieX\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','680107e8-3d4a-4aa4-b107-14b6d811964d',0,'2024-04-29 10:57:19'),('c7b59997-7d00-4802-90ae-60cc4a4955bc',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__RhdY\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_s_zh_x_x__jsmG\", \"status\": 1, \"table_code\": \"s_zh_x_x_d_j_b__mR_p\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','6ade68a4-d05d-46b8-bf26-cb9fe9add4f6',0,'2024-04-28 18:15:46'),('c994bf08-66d1-4e49-855d-51b4978d8fbe',1,'sysadmin','\"创建数据库表\"','{\"code\": \"f_j_l_l_b__c__tJZG\", \"name\": \"飞机履历表二册\", \"menu_id\": null, \"is_delete\": false, \"create_user\": \"sysadmin\", \"description\": \"创建飞机履历表二册@20240428181022\", \"update_user\": null}','f_j_l_l_b__c__tJZG','4a19af0a-065f-430c-b616-af0cc7bd7e50',0,'2024-04-28 18:10:23'),('cc167c42-8b80-428d-a655-57459a6c519d',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__Tfmm\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"s_c__YXeW\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b_s_c__Zrmn\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','0f6a10d1-d4fc-46c2-8b32-649b2b3ce82b',0,'2024-04-29 10:55:26'),('d1d4425c-8ca2-40ea-80df-0c8f9eb36f0f',1,'sysadmin','\"创建菜单\"','{\"code\": \"_c__bckt\", \"icon\": \"Reading\", \"name\": \"二册\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_l_l_x_x__edXy\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','18a8713d-c10b-4f8b-907d-2a631790bc7d',0,'2024-04-28 18:20:00'),('d3bf8767-db5a-4840-9566-e716cb896285',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__wSBx\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__QXfs\", \"status\": 1, \"table_code\": \"f_j_l_l_b_y_c__JFbX\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','08a1d480-8cee-42fb-ab07-f1330cd992d0',0,'2024-04-28 18:18:47'),('d7c967a6-2875-4042-a8b7-7091fe9e603e',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__DEnf\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__bmwJ\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b__c__JBdQ\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','93cc9721-084e-4e52-a336-fa7fb767af48',0,'2024-04-28 18:33:25'),('e5c578a4-9cca-42fe-a7a4-eaaca80cf305',1,'sysadmin','\"创建菜单\"','{\"code\": \"_c__CiYQ\", \"icon\": \"Reading\", \"name\": \"二册\", \"sort\": 999, \"type\": 2, \"parent\": \"f_d_j_l_l_x_x__atRb\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','6dd485f7-483b-444e-b9b3-8b14e83b0234',0,'2024-04-28 18:24:58'),('ede14abc-e758-4900-b807-9cb5ddad5ffa',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__KEMc\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"_c__CiYQ\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b__c__TTrW\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','f7088eb4-6637-4605-99ff-f7daab3c41b0',0,'2024-04-28 18:25:17'),('eea02e66-f118-488f-8b7f-e2c4719973eb',1,'sysadmin','\"创建菜单\"','{\"code\": \"t_j__AHZr\", \"icon\": \"Histogram\", \"name\": \"统计\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__zzRm\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b_y_c__MhDS\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','14d6ecfd-5e0a-4da5-8343-432983e4f869',0,'2024-04-28 18:24:28'),('ef5d395d-3ad0-4bf5-a9a9-084f77d4b8e9',1,'sysadmin','\"编辑菜单\"','{\"code\": null, \"icon\": null, \"name\": null, \"sort\": 999, \"type\": null, \"parent\": null, \"status\": 1, \"is_delete\": false, \"table_code\": \"f_j_x_x_d_j_b__hrwM\", \"description\": \"\", \"update_user\": \"sysadmin\"}','menu_manage','cb7ff192-2d98-43a3-a465-4243da52e654',0,'2024-04-28 18:14:08'),('ef657444-afee-4b79-a0e6-8b6ef21e5c80',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__aNQa\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__bteh\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b_y_c__WsPR\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','865737db-6b20-4843-866c-805a8d25dbec',0,'2024-04-28 18:30:16'),('eff5b7b5-448a-42cf-94f9-c18cbd3e69f6',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__iPMc\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"s_c__xwCS\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b_s_c___hTt\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','87bb2ac8-0b93-4b99-9f7d-32869ff12d93',0,'2024-04-28 18:27:06'),('f31946d9-8653-4329-8aa9-edb2a1fd168d',1,'sysadmin','\"创建菜单\"','{\"code\": \"f_j_s_zh_x_x__jsmG\", \"icon\": \"Notebook\", \"name\": \"飞机三证信息\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_b_j__YQRx\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','a7d41b85-daf0-4d40-a974-944e990a2bac',0,'2024-04-28 18:15:26'),('f3252ec1-f93c-492c-9291-7741c3c07b70',1,'sysadmin','\"创建菜单\"','{\"code\": \"ch_x__mcdA\", \"icon\": \"Search\", \"name\": \"查询\", \"sort\": 999, \"type\": 2, \"parent\": \"y_c__zzRm\", \"status\": 1, \"table_code\": \"f_d_j_l_l_b_y_c__MhDS\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','6cf3b855-ca49-453c-a831-4b2d3354fffc',0,'2024-04-28 18:24:09'),('f67eefa0-d198-4af6-82d8-acbed61f53b8',1,'sysadmin','\"创建菜单\"','{\"code\": \"_c__bmwJ\", \"icon\": \"Reading\", \"name\": \"二册\", \"sort\": 999, \"type\": 2, \"parent\": \"l_x_j_l_l_x_x__MmaD\", \"status\": 1, \"table_code\": \"l_x_j_l_l_b__c__JBdQ\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','80f324a7-fef4-4baa-a926-f367a3970555',0,'2024-04-28 18:32:44'),('f7fa78e1-2ffb-4fb7-ad0f-30e30e607ea8',1,'sysadmin','\"创建菜单\"','{\"code\": \"f_x_h_x_g_l__QyEG\", \"icon\": \"Operation\", \"name\": \"飞行航线管理\", \"sort\": 999, \"type\": 2, \"parent\": \"f_x_g_h__AKJw\", \"status\": 1, \"table_code\": \"\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','d5e8e0c1-8da5-441b-94b9-f92434d55929',0,'2024-04-28 17:40:34'),('fbdd45f1-72ff-4159-97e9-24c630f76d3f',1,'sysadmin','\"创建菜单\"','{\"code\": \"l_r__rHtM\", \"icon\": \"EditPen\", \"name\": \"录入\", \"sort\": 999, \"type\": 2, \"parent\": \"f_j_x_x__Zjhy\", \"status\": 1, \"table_code\": \"f_j_x_x_d_j_b__hrwM\", \"create_user\": \"sysadmin\", \"description\": \"\"}','menu_manage','08ad37b9-2841-4942-9ae9-0bdc155e8b72',0,'2024-04-28 18:13:25');
/*!40000 ALTER TABLE `log_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_manage`
--

DROP TABLE IF EXISTS `menu_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_manage` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表中文名称',
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级菜单',
  `code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码，预留字段',
  `description` json DEFAULT NULL COMMENT '描述',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `type` int DEFAULT NULL COMMENT '类型：1：主菜单，2：分菜单',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL COMMENT '列状态：1：显示，2：隐藏',
  `sort` float DEFAULT NULL COMMENT '列排序: x.5: 左侧侧固定; x.9: 右侧固定 X:整型普通排序',
  `icon` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `table_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单对应数据库表，后续一系列的增删改查',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_manage_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu_manage` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_manage`
--

LOCK TABLES `menu_manage` WRITE;
/*!40000 ALTER TABLE `menu_manage` DISABLE KEYS */;
INSERT INTO `menu_manage` VALUES ('038a63d6-d527-4d1b-b2ef-c9861e633241','统计','_c__bckt','t_j__d_pH','\"\"',0,2,'2024-04-28 18:20:54','2024-04-28 18:20:54',1,999,'Histogram','sysadmin',NULL,'f_j_l_l_b__c__tJZG'),('04425589-edbf-4e8d-bfa5-ad55dfdb6aba','人员信息',NULL,'r_y_x_x__BaXc','\"\"',0,1,'2024-04-28 10:12:29','2024-04-28 10:12:29',1,999,'Avatar','sysadmin',NULL,''),('08a1d480-8cee-42fb-ab07-f1330cd992d0','查询','y_c__QXfs','ch_x__wSBx','\"\"',0,2,'2024-04-28 18:18:47','2024-04-28 18:18:47',1,999,'Search','sysadmin',NULL,'f_j_l_l_b_y_c__JFbX'),('08ad37b9-2841-4942-9ae9-0bdc155e8b72','录入','f_j_x_x__Zjhy','l_r__rHtM','\"\"',0,2,'2024-04-28 18:13:25','2024-04-28 18:13:25',1,999,'EditPen','sysadmin',NULL,'f_j_x_x_d_j_b__hrwM'),('0ad4b858-fa56-4188-8692-41b19d4c1860','统计','s_c__xwCS','t_j__MQaJ','\"\"',0,2,'2024-04-28 18:27:25','2024-04-28 18:27:25',1,999,'Histogram','sysadmin',NULL,'f_d_j_l_l_b_s_c___hTt'),('0f6a10d1-d4fc-46c2-8b32-649b2b3ce82b','查询','s_c__YXeW','ch_x__Tfmm','\"\"',0,2,'2024-04-29 10:55:26','2024-04-29 10:55:26',1,999,'Search','sysadmin',NULL,'l_x_j_l_l_b_s_c__Zrmn'),('1046afe8-68fd-4e92-b08c-c4db292af18b','到期提醒','j_sh_j_c_x_x__zyZQ','d_q_t_x__cNRM','\"\"',0,2,'2024-04-28 13:56:14','2024-04-28 13:56:14',1,999,'AlarmClock','sysadmin',NULL,'j_sh_j_ch_b__npfb'),('14d6ecfd-5e0a-4da5-8343-432983e4f869','统计','y_c__zzRm','t_j__AHZr','\"\"',0,2,'2024-04-28 18:24:28','2024-04-28 18:24:28',1,999,'Histogram','sysadmin',NULL,'f_d_j_l_l_b_y_c__MhDS'),('1762496b-4867-4c09-a8ff-d77cebc058bd','一册','f_d_j_l_l_x_x__atRb','y_c__zzRm','\"\"',0,2,'2024-04-28 18:23:32','2024-04-28 18:23:32',1,999,'Reading','sysadmin',NULL,''),('1897605b-26ad-45d6-bef4-f8d9ff104019','录入','_c__bckt','l_r__CRiJ','\"\"',0,2,'2024-04-28 18:20:21','2024-04-28 18:20:21',1,999,'EditPen','sysadmin',NULL,'f_j_l_l_b__c__tJZG'),('18a8713d-c10b-4f8b-907d-2a631790bc7d','二册','f_j_l_l_x_x__edXy','_c__bckt','\"\"',0,2,'2024-04-28 18:20:00','2024-04-28 18:20:00',1,999,'Reading','sysadmin',NULL,''),('18a8a37d-b864-4556-8bde-3f4bf023dc60','螺旋桨履历信息','f_j_b_j__YQRx','l_x_j_l_l_x_x__MmaD','\"\"',0,2,'2024-04-28 18:29:11','2024-04-28 18:29:11',1,999,'Orange','sysadmin',NULL,''),('1b047ab3-0ef5-43f6-af57-94ffcd95c445','飞机部件',NULL,'f_j_b_j__YQRx','\"\"',0,1,'2024-04-28 10:12:52','2024-04-28 10:12:52',1,999,'Promotion','sysadmin',NULL,''),('1b10e366-a10c-4f9b-b692-f91724bb4996','飞行规划',NULL,'f_x_g_h__AKJw','\"\"',0,1,'2024-04-28 10:13:23','2024-04-28 17:42:42',1,999,'HelpFilled','sysadmin','sysadmin',''),('1bdf14bf-1adf-43a6-8315-3eac42c59e6d','实时监控',NULL,'map','\"\"',0,1,'2024-04-28 10:14:22','2024-04-28 17:32:09',1,999,'Platform','sysadmin',NULL,''),('1d1cf3fd-842c-4273-9583-ad10a4868c46','检查类别字典','z_d_g_l__MQtH','j_ch_l_b_z_d__XRD_','\"\"',0,2,'2024-04-28 10:40:15','2024-04-28 10:40:15',1,999,'DocumentChecked','sysadmin',NULL,'d_j_l_b_z_d__wXwj'),('1e26a891-22a6-4e8a-b502-3159e18f5b87','预览','h_d_k_g_l__WnmJ','y_l__TWcX','\"\"',0,2,'2024-04-28 17:39:26','2024-04-28 17:39:26',1,999,'View','sysadmin',NULL,'h_d_k_g_l__GM_n'),('20f95441-3bca-42ae-b6cb-ee3a0af63d9d','体检类型字典','z_d_g_l__MQtH','t_j_l_x_z_d__cXeY','\"\"',0,2,'2024-04-28 10:33:58','2024-04-28 10:33:58',1,999,'Checked','sysadmin',NULL,'t_j_l_x_z_d__Mpwc'),('250bdec0-3c42-424a-b728-e7a95ab1288b','教学等级字典','z_d_g_l__MQtH','j_x_d_j_z_d__YTmj','\"\"',0,2,'2024-04-28 10:31:13','2024-04-28 10:31:13',1,999,'School','sysadmin',NULL,'j_x_d_j_z_d__bFKK'),('29a99d8d-332c-4f68-94ad-434b9107bb5e','机场信息登记','q_t_x_x__EpEj','j_ch_x_x_d_j__jENy','\"\"',0,2,'2024-04-28 13:41:54','2024-04-28 13:41:54',1,999,'Cpu','sysadmin',NULL,'j_ch_x_x_d_j_b__rsQM'),('2a873532-58c4-45ea-ba29-688a5bd9b14c','飞行评估',NULL,'f_x_p_g__Gztf','\"\"',0,1,'2024-04-28 10:14:44','2024-04-28 10:14:44',1,999,'TrendCharts','sysadmin',NULL,''),('2c12eca1-1e59-453c-a1b1-9a23dc70b8b7','体检信息','r_y_x_x__BaXc','t_j_x_x__beCt','\"\"',0,2,'2024-04-28 13:54:34','2024-04-28 13:54:34',1,999,'Checked','sysadmin',NULL,''),('37035bba-e221-464f-9975-81872b26364e','机型信息登记','q_t_x_x__EpEj','j_x_x_x_d_j__JRAy','\"\"',0,2,'2024-04-28 13:41:13','2024-04-28 13:41:13',1,999,'Brush','sysadmin',NULL,'j_x_d_j_b__Ddkz'),('3776479d-608f-4f00-bcd7-c6bc857545e6','录入','y_c__QXfs','l_r__FZiT','\"\"',0,2,'2024-04-28 18:18:26','2024-04-28 18:18:26',1,999,'EditPen','sysadmin',NULL,'f_j_l_l_b_y_c__JFbX'),('387e5d85-303a-4c04-89f8-2413e461c2f2','查询','q_t_r_y_x_x__TTSH','ch_x___MAc','\"\"',0,2,'2024-04-28 13:53:21','2024-04-28 13:53:21',1,999,'Search','sysadmin',NULL,'q_t_r_y_b__NFRc'),('3b8f2845-88d0-45cf-92b2-0894ff52808f','飞行等级字典','z_d_g_l__MQtH','f_x_d_j_z_d__wbEd','\"\"',0,2,'2024-04-28 10:33:27','2024-04-28 10:33:27',1,999,'Position','sysadmin',NULL,'f_x_d_j_z_d__Nmta'),('4171441f-93fe-4ce5-9ba3-dcd1719efa33','其他信息',NULL,'q_t_x_x__EpEj','\"\"',0,1,'2024-04-28 10:15:12','2024-04-28 10:15:12',1,999,'Menu','sysadmin',NULL,''),('417f32bd-10fb-4f41-8eaf-335de3ee03b0','查询','j_y_x_x__WGK_','ch_x__HZaD','\"\"',0,2,'2024-04-28 13:48:03','2024-04-28 13:48:03',1,999,'Search','sysadmin',NULL,'j_y_x_x_b__eTdf'),('429583ad-5084-4f62-a5cd-fcf4370b95b8','发动机履历信息','f_j_b_j__YQRx','f_d_j_l_l_x_x__atRb','\"\"',0,2,'2024-04-28 18:23:10','2024-04-28 18:23:10',1,999,'Ticket','sysadmin',NULL,''),('448b8460-f831-4083-9469-af2d72cf056a','计划状态字典','z_d_g_l__MQtH','j_h_zh_t_z_d__zjWs','\"\"',0,2,'2024-04-28 10:38:44','2024-04-28 10:38:44',1,999,'CircleCheck','sysadmin',NULL,'j_h_zh_t_z_d__PKfP'),('4e776400-fb20-4282-8508-96e8f11acc3a','统计','_c__CiYQ','t_j__MdEe','\"\"',0,2,'2024-04-28 18:26:01','2024-04-28 18:26:01',1,999,'Histogram','sysadmin',NULL,'f_d_j_l_l_b__c__TTrW'),('5472e271-4d05-4759-944b-3f432279f4e6','查询','x_y_x_x__SSpx','ch_x__i_Mf','\"\"',0,2,'2024-04-28 13:51:45','2024-04-28 13:51:45',1,999,'Search','sysadmin',NULL,'x_y_x_x_b__dxTc'),('55386d62-c89f-4cda-bdfe-83e4b39609ad','专业字典','z_d_g_l__MQtH','zh_y_z_d___bTA','\"\"',0,2,'2024-04-28 10:34:18','2024-04-28 10:34:18',1,999,'Guide','sysadmin',NULL,'zh_y_z_d__HwXR'),('593cd0ba-001f-45e9-bc27-e23af650f7bb','录入','q_t_r_y_x_x__TTSH','l_r__CSJB','\"\"',0,2,'2024-04-28 13:53:02','2024-04-28 13:53:02',1,999,'EditPen','sysadmin',NULL,'q_t_r_y_b__NFRc'),('5e03c81e-475f-4480-bb8b-7e3e70e473bd','一册','f_j_l_l_x_x__edXy','y_c__QXfs','\"\"',0,2,'2024-04-28 18:18:04','2024-04-28 18:18:04',1,999,'Reading','sysadmin',NULL,''),('5e6b0577-9598-454b-b2a9-cc98f91d3c91','学员信息','r_y_x_x__BaXc','x_y_x_x__SSpx','\"\"',0,2,'2024-04-28 13:51:06','2024-04-28 13:51:06',1,999,'UserFilled','sysadmin',NULL,''),('6446c20e-9dc7-48fa-8aff-36a6971e2183','三册','l_x_j_l_l_x_x__MmaD','s_c__YXeW','\"\"',0,2,'2024-04-29 10:54:48','2024-04-29 10:54:48',1,999,'Reading','sysadmin',NULL,''),('64ff18cb-bcb4-4acc-93e8-45c03a34107e','气象字典','z_d_g_l__MQtH','q_x_z_d__BbSw','\"\"',0,2,'2024-04-28 10:38:15','2024-04-28 10:38:15',1,999,'PartlyCloudy','sysadmin',NULL,'q_x_z_d__ZnaR'),('653eb32a-c688-4018-83a6-55f5604a5c4f','查询','j_zh_j_y_x_x__NmGt','ch_x__Ckmc','\"\"',0,2,'2024-04-28 13:49:57','2024-04-28 13:49:57',1,999,'Search','sysadmin',NULL,'j_zh_j_y_x_x_b__ebez'),('65bc87fc-3a57-454b-94b2-cd3ae72f6ead','录入','h_d_k_g_l__WnmJ','l_r__ShDQ','\"\"',0,2,'2024-04-28 17:38:10','2024-04-28 17:38:10',1,999,'EditPen','sysadmin',NULL,'h_d_k_g_l__GM_n'),('65d0c015-4d78-46cd-b245-951bdf0dce55','飞机信息','f_j_b_j__YQRx','f_j_x_x__Zjhy','\"\"',0,2,'2024-04-28 18:13:03','2024-04-28 18:13:03',1,999,'Promotion','sysadmin',NULL,''),('680107e8-3d4a-4aa4-b107-14b6d811964d','录入','q_t_b_j_x_x__BBCC','l_r__mPxJ','\"\"',0,2,'2024-04-29 10:57:19','2024-04-29 10:57:19',1,999,'EditPen','sysadmin',NULL,'q_t_b_j_x_x_b__NieX'),('683ff9fb-c987-4001-b71b-2fcfa67d4f8a','录入','x_y_x_x__SSpx','l_r__ESfC','\"\"',0,2,'2024-04-28 13:51:28','2024-04-28 13:51:28',1,999,'EditPen','sysadmin',NULL,'x_y_x_x_b__dxTc'),('695236d0-2681-4ad6-9a74-5ab5719ef6cd','空域信息登记','q_t_x_x__EpEj','k_y_x_x_d_j__ntDm','\"\"',0,2,'2024-04-28 13:42:21','2024-04-28 13:42:21',1,999,'Sunrise','sysadmin',NULL,'k_y_x_x_d_j_b__rXsR'),('6ade68a4-d05d-46b8-bf26-cb9fe9add4f6','录入','f_j_s_zh_x_x__jsmG','l_r__RhdY','\"\"',0,2,'2024-04-28 18:15:46','2024-04-28 18:15:46',1,999,'EditPen','sysadmin',NULL,'s_zh_x_x_d_j_b__mR_p'),('6b36458f-c99f-47fd-8cae-552ef3e3314b','题型字典','z_d_g_l__MQtH','t_x_z_d__EYtf','\"\"',0,2,'2024-04-28 10:37:22','2024-04-28 10:37:22',1,999,'Edit','sysadmin',NULL,'t_x_z_d__z_m_'),('6cf3b855-ca49-453c-a831-4b2d3354fffc','查询','y_c__zzRm','ch_x__mcdA','\"\"',0,2,'2024-04-28 18:24:09','2024-04-28 18:24:09',1,999,'Search','sysadmin',NULL,'f_d_j_l_l_b_y_c__MhDS'),('6dd485f7-483b-444e-b9b3-8b14e83b0234','二册','f_d_j_l_l_x_x__atRb','_c__CiYQ','\"\"',0,2,'2024-04-28 18:24:58','2024-04-28 18:24:58',1,999,'Reading','sysadmin',NULL,''),('6fbcdf0e-f227-4097-9fe0-202d8cae312d','一册','l_x_j_l_l_x_x__MmaD','y_c__bteh','\"\"',0,2,'2024-04-28 18:29:33','2024-04-28 18:29:33',1,999,'Reading','sysadmin',NULL,''),('71530b76-7c56-4ea6-afc4-4fcfbfd0af10','计划制定','f_x_j_h_g_l__kTWW','flight','\"\"',0,2,'2024-04-28 17:43:17','2024-04-28 18:38:49',1,999,'EditPen','sysadmin',NULL,'f_x_j_h_g_l__bAdm'),('750ca663-c0e0-4682-bf6d-0c2fb03deb3c','技术检测信息','r_y_x_x__BaXc','j_sh_j_c_x_x__zyZQ','\"\"',0,2,'2024-04-28 13:55:33','2024-04-28 13:55:33',1,999,'DocumentChecked','sysadmin',NULL,''),('7bfa0197-6c37-4471-9876-301b2b25b5e1','统计','_c__bmwJ','t_j__sGJK','\"\"',0,2,'2024-04-28 18:37:43','2024-04-28 18:37:43',1,999,'Histogram','sysadmin',NULL,'l_x_j_l_l_b__c__JBdQ'),('7d1ea571-565e-488a-afdc-f4cc00af3dc5','录入','y_c__zzRm','l_r__eGdM','\"\"',0,2,'2024-04-28 18:23:51','2024-04-28 18:23:51',1,999,'EditPen','sysadmin',NULL,'f_d_j_l_l_b_y_c__MhDS'),('7debd827-2b89-4462-9781-1540d13c0dbb','版本字典','z_d_g_l__MQtH','b_b_z_d__ShPz','\"\"',0,2,'2024-04-28 10:39:50','2024-04-28 10:39:50',1,999,'Management','sysadmin',NULL,'b_b_z_d__P_hs'),('8037f67a-16f7-4485-aeb2-7f9ba85e9056','到期提醒','q_t_b_j_x_x__BBCC','d_q_t_x__GFGW','\"\"',0,2,'2024-04-29 10:57:36','2024-04-29 10:57:36',1,999,'AlarmClock','sysadmin',NULL,'q_t_b_j_x_x_b__NieX'),('80f324a7-fef4-4baa-a926-f367a3970555','二册 ','l_x_j_l_l_x_x__MmaD','_c__bmwJ','\"\"',0,2,'2024-04-28 18:32:44','2024-04-28 18:32:51',1,999,'Reading','sysadmin','sysadmin',''),('81949851-1dd9-431c-9ac5-269f4dc63cbb','录入','y_c__bteh','l_r__aKJb','\"\"',0,2,'2024-04-28 18:29:55','2024-04-28 18:29:55',1,999,'EditPen','sysadmin',NULL,'l_x_j_l_l_b_y_c__WsPR'),('865737db-6b20-4843-866c-805a8d25dbec','查询','y_c__bteh','ch_x__aNQa','\"\"',0,2,'2024-04-28 18:30:16','2024-04-28 18:30:16',1,999,'Search','sysadmin',NULL,'l_x_j_l_l_b_y_c__WsPR'),('87bb2ac8-0b93-4b99-9f7d-32869ff12d93','查询','s_c__xwCS','ch_x__iPMc','\"\"',0,2,'2024-04-28 18:27:06','2024-04-28 18:27:06',1,999,'Search','sysadmin',NULL,'f_d_j_l_l_b_s_c___hTt'),('89163529-6200-4645-b41f-f9e8db527014','到期提醒','f_j_s_zh_x_x__jsmG','d_q_t_x__AhDW','\"\"',0,2,'2024-04-28 18:16:09','2024-04-28 18:16:09',1,999,'AlarmClock','sysadmin',NULL,'s_zh_x_x_d_j_b__mR_p'),('8b902c4f-504f-4348-a6a3-5e29e576961d','飞机履历信息','f_j_b_j__YQRx','f_j_l_l_x_x__edXy','\"\"',0,2,'2024-04-28 18:17:07','2024-04-28 18:17:07',1,999,'Flag','sysadmin',NULL,''),('8c044eb3-17d1-42b3-a949-925a306e97af','兼职教员信息','r_y_x_x__BaXc','j_zh_j_y_x_x__NmGt','\"\"',0,2,'2024-04-28 13:49:16','2024-04-28 13:49:16',1,999,'User','sysadmin',NULL,''),('8d4da03c-3e36-44e1-a881-db0b26547316','单位信息登记','q_t_x_x__EpEj','d_w_x_x_d_j__RKFD','\"\"',0,2,'2024-04-28 13:40:18','2024-04-28 13:40:18',1,999,'OfficeBuilding','sysadmin',NULL,'d_w_d_j_b__dxFZ'),('8f9a1631-e4a3-47e0-85fb-99d527531df6','学历字典','z_d_g_l__MQtH','x_l_z_d___RZn','\"\"',0,2,'2024-04-28 10:30:29','2024-04-28 10:30:29',1,999,'Notebook','sysadmin',NULL,'x_l_z_d__HCYH'),('8fa3ba96-1555-4c03-963a-75e2733394fe','航点库管理','f_x_g_h__AKJw','h_d_k_g_l__WnmJ','\"\"',0,2,'2024-04-28 17:37:11','2024-04-28 17:37:44',1,999,'MagicStick','sysadmin','sysadmin',''),('903c70f5-60a0-454b-aa40-655c11603bec','其他部件信息','f_j_b_j__YQRx','q_t_b_j_x_x__BBCC','\"\"',0,2,'2024-04-29 10:56:49','2024-04-29 10:56:49',1,999,'MoreFilled','sysadmin',NULL,''),('93cc9721-084e-4e52-a336-fa7fb767af48','录入','_c__bmwJ','l_r__DEnf','\"\"',0,2,'2024-04-28 18:33:25','2024-04-28 18:33:25',1,999,'EditPen','sysadmin',NULL,'l_x_j_l_l_b__c__JBdQ'),('96203bb4-1f60-441f-a24f-2600951f6b5d','录入','j_y_x_x__WGK_','l_r__bDkN','\"\"',0,2,'2024-04-28 13:47:46','2024-04-28 13:47:46',1,999,'EditPen','sysadmin',NULL,'j_y_x_x_b__eTdf'),('995a6a8d-65c5-4fb0-ba58-5929b234e729','统计','x_y_x_x__SSpx','t_j__weSm','\"\"',0,2,'2024-04-28 13:52:22','2024-04-28 13:52:22',1,999,'Histogram','sysadmin',NULL,'x_y_x_x_b__dxTc'),('9979b6fa-f40a-4fac-8b3b-e9e63af6e8c9','飞机状态字典','z_d_g_l__MQtH','f_j_zh_t_z_d__ZtR_','\"\"',0,2,'2024-04-28 10:36:22','2024-04-28 10:36:22',1,999,'CircleCheckFilled','sysadmin',NULL,'f_j_zh_t_z_d__ZfMb'),('9a888419-8702-49d3-94fa-2057b752c53f','规划','f_x_h_x_g_l__QyEG','g_h__SPfS','\"\"',0,2,'2024-04-28 17:41:00','2024-04-28 17:41:00',1,999,'EditPen','sysadmin',NULL,'h_x_g_l__Gfxb'),('a4b948d3-a0f0-41f8-8815-7cbc65ad3f57','飞行计划类型字典','z_d_g_l__MQtH','f_x_j_h_l_x_z_d__MZDP','\"\"',0,2,'2024-04-28 10:37:53','2024-04-28 10:37:53',1,999,'Odometer','sysadmin',NULL,'f_x_j_h_l_x_z_d__wPca'),('a685424a-6c15-436e-8916-105ec8748cdb','录入','j_zh_j_y_x_x__NmGt','l_r__JHDY','\"\"',0,2,'2024-04-28 13:49:39','2024-04-28 13:49:39',1,999,'EditPen','sysadmin',NULL,'j_zh_j_y_x_x_b__ebez'),('a7d41b85-daf0-4d40-a974-944e990a2bac','飞机三证信息','f_j_b_j__YQRx','f_j_s_zh_x_x__jsmG','\"\"',0,2,'2024-04-28 18:15:26','2024-04-28 18:15:26',1,999,'Notebook','sysadmin',NULL,''),('ac6d8442-9a63-4f90-9328-7259418f65b5','录入','s_c__YXeW','l_r__wkMt','\"\"',0,2,'2024-04-29 10:55:09','2024-04-29 10:55:09',1,999,'EditPen','sysadmin',NULL,'l_x_j_l_l_b_s_c__Zrmn'),('ac889799-dbc3-43ac-a605-c89d29205e90','查询','_c__bckt','ch_x__iDWM','\"\"',0,2,'2024-04-28 18:20:36','2024-04-28 18:20:36',1,999,'Search','sysadmin',NULL,'f_j_l_l_b__c__tJZG'),('ad8fa5dc-a1dc-4716-9de9-b195598b61d8','政治面貌字典','z_d_g_l__MQtH','zh_zh_m_m_z_d__ZcJx','\"\"',0,2,'2024-04-28 10:29:13','2024-04-28 10:29:13',1,999,'Operation','sysadmin',NULL,'zh_zh_m_m_z_d__ERrh'),('adafb28f-c54d-4232-8f57-443c526ff6aa','三册','f_d_j_l_l_x_x__atRb','s_c__xwCS','\"\"',0,2,'2024-04-28 18:26:25','2024-04-28 18:26:25',1,999,'Reading','sysadmin',NULL,''),('af29edfc-409f-46aa-95b0-263febbbff9d','统计','j_zh_j_y_x_x__NmGt','t_j__yXnS','\"\"',0,2,'2024-04-28 13:50:30','2024-04-28 13:50:30',1,999,'Histogram','sysadmin',NULL,'j_zh_j_y_x_x_b__ebez'),('b216e170-f0cc-41f4-9049-64a7ff221c85','统计','y_c__QXfs','t_j__deCr','\"\"',0,2,'2024-04-28 18:19:10','2024-04-28 18:19:10',1,999,'Histogram','sysadmin',NULL,'f_j_l_l_b_y_c__JFbX'),('b4f8c3c3-cee3-4d87-aaeb-162db123c56f','备降场信息登记','q_t_x_x__EpEj','b_j_ch_x_x_d_j__nRNA','\"\"',0,2,'2024-04-28 13:43:11','2024-04-28 13:43:11',1,999,'Rank','sysadmin',NULL,'b_j_ch_x_x_d_j_b__TirZ'),('b74f9674-edc4-4708-bd02-eda49b905e78','性别字典','z_d_g_l__MQtH','x_b_z_d__e_dC','\"\"',0,2,'2024-04-28 10:28:40','2024-04-28 10:28:40',1,999,'Switch','sysadmin',NULL,'x_b_z_d__XHaF'),('bcee252b-41df-4d3c-b22d-56be956f6350','教员信息','r_y_x_x__BaXc','j_y_x_x__WGK_','\"\"',0,2,'2024-04-28 13:46:18','2024-04-28 13:46:18',1,999,'UserFilled','sysadmin',NULL,''),('bcf6dc68-8325-4cf6-aeea-5236ae863774','班期信息登记','q_t_x_x__EpEj','b_q_x_x_d_j__tRHp','\"\"',0,2,'2024-04-28 13:41:33','2024-04-28 13:41:33',1,999,'School','sysadmin',NULL,'b_q_d_j_b__wpRd'),('c10911e5-0dc1-472a-9349-69ba75e3e8a0','地面教学',NULL,'d_m_j_x__DPdw','\"\"',0,1,'2024-04-28 10:13:06','2024-04-28 10:13:06',1,999,'School','sysadmin',NULL,''),('c4dd228a-a5eb-417f-95f7-8e385fc9248a','班字典','z_d_g_l__MQtH','b_z_d__eJpy','\"\"',0,2,'2024-04-28 10:35:29','2024-04-28 10:35:29',1,999,'More','sysadmin',NULL,'b_z_d__AbFr'),('c810d8d6-8d54-4895-9dc8-9d07bef8f29a','字典管理',NULL,'z_d_g_l__MQtH','\"\"',0,1,'2024-04-28 10:15:24','2024-04-28 10:15:24',1,999,'Reading','sysadmin',NULL,''),('cb7ff192-2d98-43a3-a465-4243da52e654','查询','f_j_x_x__Zjhy','ch_x__FD_M','\"\"',0,2,'2024-04-28 18:13:45','2024-04-28 18:14:08',1,999,'Search','sysadmin','sysadmin','f_j_x_x_d_j_b__hrwM'),('cc23d1fe-844e-4535-8e0a-906b308ded08','统计','q_t_r_y_x_x__TTSH','t_j__j_Sc','\"\"',0,2,'2024-04-28 13:53:44','2024-04-28 13:53:44',1,999,'Histogram','sysadmin',NULL,'q_t_r_y_b__NFRc'),('cfd28786-c98b-4af2-8030-830baae47605','预览','f_x_h_x_g_l__QyEG','y_l__MeYY','\"\"',0,2,'2024-04-28 17:41:23','2024-04-28 17:41:23',1,999,'View','sysadmin',NULL,'h_x_g_l__Gfxb'),('d1905e95-a7f2-4123-9080-1c40425151bd','统计','j_y_x_x__WGK_','t_j__TWSK','\"\"',0,2,'2024-04-28 13:48:55','2024-04-28 13:48:55',1,999,'Histogram','sysadmin',NULL,'j_y_x_x_b__eTdf'),('d5e8e0c1-8da5-441b-94b9-f92434d55929','飞行航线管理','f_x_g_h__AKJw','f_x_h_x_g_l__QyEG','\"\"',0,2,'2024-04-28 17:40:34','2024-04-28 17:40:34',1,999,'Operation','sysadmin',NULL,''),('d6444004-782c-4209-a8ac-f09efd915b71','权限字典','z_d_g_l__MQtH','q_x_z_d__eCMT','\"\"',0,2,'2024-04-28 10:36:47','2024-04-28 10:36:47',1,999,'Aim','sysadmin',NULL,'q_x_z_d__raTJ'),('dd4e369f-f538-41a9-a3a7-27bc14a3bdeb','到期提醒','t_j_x_x__beCt','d_q_t_x__fzEM','\"\"',0,2,'2024-04-28 13:55:14','2024-04-28 13:55:14',1,999,'AlarmClock','sysadmin',NULL,'t_j_x_x_b__dwtF'),('df16514c-67ed-4055-92a8-55fd8e335c72','查询','_c__CiYQ','ch_x__BByT','\"\"',0,2,'2024-04-28 18:25:39','2024-04-28 18:25:39',1,999,'Search','sysadmin',NULL,'f_d_j_l_l_b__c__TTrW'),('e3461840-c351-4327-834b-e88332379f8f','计划查看','f_x_j_h_g_l__kTWW','flight_view','\"\"',0,2,'2024-04-28 17:43:42','2024-04-28 17:52:11',1,999,'Search','sysadmin',NULL,'f_x_j_h_g_l__bAdm'),('e59f31f5-82dd-49d4-9bed-83c31f8d3880','统计','f_j_x_x__Zjhy','t_j__thZx','\"\"',0,2,'2024-04-28 18:14:31','2024-04-28 18:14:31',1,999,'Histogram','sysadmin',NULL,'f_j_x_x_d_j_b__hrwM'),('e6a0e3c8-e59a-4563-8b00-515d111f385d','统计','s_c__YXeW','t_j__xQCJ','\"\"',0,2,'2024-04-29 10:55:45','2024-04-29 10:55:45',1,999,'Histogram','sysadmin',NULL,'l_x_j_l_l_b_s_c__Zrmn'),('e804c139-9ed4-41e3-968c-1db2c469fdbf','录入','t_j_x_x__beCt','l_r__Y_DK','\"\"',0,2,'2024-04-28 13:54:55','2024-04-28 13:54:55',1,999,'EditPen','sysadmin',NULL,'t_j_x_x_b__dwtF'),('e86083cb-9e49-45ef-82ec-4ca27f026ff7','查询','_c__bmwJ','ch_x__XBNh','\"\"',0,2,'2024-04-28 18:36:28','2024-04-28 18:36:28',1,999,'Search','sysadmin',NULL,'l_x_j_l_l_b__c__JBdQ'),('eab32cc9-1163-42bc-afdf-9b43e0c32242','其他人员信息','r_y_x_x__BaXc','q_t_r_y_x_x__TTSH','\"\"',0,2,'2024-04-28 13:52:42','2024-04-28 13:52:42',1,999,'User','sysadmin',NULL,''),('eacac877-2582-42e4-8803-87d6f1b559ce','位置字典','z_d_g_l__MQtH','w_zh_z_d__StBJ','\"\"',0,2,'2024-04-28 10:36:00','2024-04-28 10:36:00',1,999,'AddLocation','sysadmin',NULL,'w_zh_z_d__wPrK'),('ec815093-ba5f-4531-b138-21025f0c066a','民族字典','z_d_g_l__MQtH','m_z_z_d__Z_Ba','\"\"',0,2,'2024-04-28 10:29:32','2024-04-28 10:29:32',1,999,'Share','sysadmin',NULL,'m_z_z_d__yJHK'),('ec968797-d655-481a-8f04-64d0978cfef0','录入','j_sh_j_c_x_x__zyZQ','l_r___hPt','\"\"',0,2,'2024-04-28 13:55:50','2024-04-28 13:55:50',1,999,'EditPen','sysadmin',NULL,'j_sh_j_ch_b__npfb'),('f093dd88-d54e-4c45-9c35-4e93458cb34d','统计','y_c__bteh','t_j___QPr','\"\"',0,2,'2024-04-28 18:31:56','2024-04-28 18:31:56',1,999,'Histogram','sysadmin',NULL,'l_x_j_l_l_b_y_c__WsPR'),('f3ccdaef-64d1-4457-8a7e-d5bb107ed99f','学位字典','z_d_g_l__MQtH','x_w_z_d__SKdG','\"\"',0,2,'2024-04-28 10:30:49','2024-04-28 10:30:49',1,999,'Stamp','sysadmin',NULL,'x_w_z_d__waFe'),('f7088eb4-6637-4605-99ff-f7daab3c41b0','录入','_c__CiYQ','l_r__KEMc','\"\"',0,2,'2024-04-28 18:25:17','2024-04-28 18:25:17',1,999,'EditPen','sysadmin',NULL,'f_d_j_l_l_b__c__TTrW'),('f917f41e-1dac-41f2-b8d2-3dfcadc351f3','录入','s_c__xwCS','l_r__QtAh','\"\"',0,2,'2024-04-28 18:26:47','2024-04-28 18:26:47',1,999,'EditPen','sysadmin',NULL,'f_d_j_l_l_b_s_c___hTt'),('fbc71259-5fcb-4a16-8b2d-565512f472a0','执照等级字典','z_d_g_l__MQtH','zh_zh_d_j_z_d__tShw','\"\"',0,2,'2024-04-28 10:32:29','2024-04-28 10:32:44',1,999,'Money','sysadmin','sysadmin','zh_zh_d_j_z_d__emZc'),('fd682c93-289a-4568-b8f1-174b4c9f29bc','飞行计划管理','f_x_g_h__AKJw','f_x_j_h_g_l__kTWW','\"\"',0,2,'2024-04-28 17:42:25','2024-04-28 17:42:25',1,999,'Guide','sysadmin',NULL,'');
/*!40000 ALTER TABLE `menu_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_learning_record`
--

DROP TABLE IF EXISTS `online_learning_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_learning_record` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生ID',
  `course_chapter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称/教学资源id',
  `start_time` datetime DEFAULT NULL COMMENT '学生开始学习的时间',
  `end_time` datetime DEFAULT NULL COMMENT '学生结束学习的时间',
  `keep_time` int DEFAULT NULL COMMENT '学习时长，单位秒',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  PRIMARY KEY (`id`),
  KEY `course_chapter_id` (`course_chapter_id`),
  CONSTRAINT `online_learning_record_ibfk_1` FOREIGN KEY (`course_chapter_id`) REFERENCES `course_chapter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_learning_record`
--

LOCK TABLES `online_learning_record` WRITE;
/*!40000 ALTER TABLE `online_learning_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_learning_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷名称',
  `description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷描述',
  `score` int DEFAULT NULL COMMENT '总分',
  `duration_minutes` int DEFAULT NULL COMMENT '考试时长',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `is_published` int DEFAULT NULL COMMENT '是否发布, 1：发布、0：保留，默认值：0',
  `publish_date` datetime DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `paper_chk_1` CHECK ((`score` >= 0)),
  CONSTRAINT `paper_chk_2` CHECK ((`duration_minutes` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_questions`
--

DROP TABLE IF EXISTS `paper_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_questions` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `paper_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷ID',
  `question_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试题ID',
  `sequence_number` int DEFAULT NULL COMMENT '试题顺序',
  `mark` int DEFAULT NULL COMMENT '试题得分',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属模块',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paper_id` (`paper_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `paper_questions_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE CASCADE,
  CONSTRAINT `paper_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `paper_questions_chk_1` CHECK ((`sequence_number` >= 0)),
  CONSTRAINT `paper_questions_chk_2` CHECK ((`mark` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_questions`
--

LOCK TABLES `paper_questions` WRITE;
/*!40000 ALTER TABLE `paper_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_chapter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称/教学资源id',
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '题目',
  `type` int DEFAULT NULL COMMENT '试题类型 1:单选 2:多选 3:判断 4:填空 5:简答',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '试题选项',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '正确答案',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '题目解析',
  `score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '分值',
  `level_choices` int DEFAULT NULL COMMENT '题目难度:1入门,2简单,3普通,4较难,5困难',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int DEFAULT NULL COMMENT '试题状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_chapter_id` (`course_chapter_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`course_chapter_id`) REFERENCES `course_chapter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_favorite`
--

DROP TABLE IF EXISTS `questions_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_favorite` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试题ID',
  `collector` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收藏者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_favorite`
--

LOCK TABLES `questions_favorite` WRITE;
/*!40000 ALTER TABLE `questions_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_statistics`
--

DROP TABLE IF EXISTS `score_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_statistics` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '期班名称',
  `major` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业课/课程',
  `student_num` int NOT NULL COMMENT '学生人数',
  `highest_score` float NOT NULL COMMENT '最高分',
  `lowest_score` float NOT NULL COMMENT '最低分',
  `average_score` float NOT NULL COMMENT '平均分',
  `ideal_percentage` float NOT NULL COMMENT '优秀的比例',
  `good_percentage` float NOT NULL COMMENT '良好的比例',
  `pass_percentage` float NOT NULL COMMENT '及格的比例',
  `flunk_percentage` float NOT NULL COMMENT '不及格的比例',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_statistics`
--

LOCK TABLES `score_statistics` WRITE;
/*!40000 ALTER TABLE `score_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_manage`
--

DROP TABLE IF EXISTS `table_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_manage` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表中文名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表名称（英文，用于表名）',
  `description` json DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int DEFAULT NULL COMMENT '表状态：0：设计中，1：使用中',
  `sync_flag` int DEFAULT NULL COMMENT '同步标志：0：不同步，1：同步',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_manage`
--

LOCK TABLES `table_manage` WRITE;
/*!40000 ALTER TABLE `table_manage` DISABLE KEYS */;
INSERT INTO `table_manage` VALUES ('00658f74-6f5b-4873-a414-1610669c44c1','飞机履历表一册','f_j_l_l_b_y_c__JFbX','\"创建飞机履历表一册@20240428181010\"','2024-04-28 18:10:11','2024-04-28 18:10:11','sysadmin',NULL,0,0,0),('037d67f1-94c5-4938-98ed-f6a356d68c15','教员信息表','j_y_x_x_b__eTdf','\"创建教员信息表@20240428134631\"','2024-04-28 13:46:32','2024-04-28 13:46:32','sysadmin',NULL,0,0,0),('048fe8a8-6ad6-423d-ba7f-8c6769afcdf6','定检类别字典','d_j_l_b_z_d__wXwj','\"创建定检类别字典@20240428102739\"','2024-04-28 10:27:40','2024-04-28 10:27:40','sysadmin',NULL,0,0,0),('102e4f46-9945-431a-9c88-b08ed4a263cb','技术检查表','j_sh_j_ch_b__npfb','\"创建技术检查表@20240428134720\"','2024-04-28 13:47:21','2024-04-28 13:47:21','sysadmin',NULL,0,0,0),('108bbb7e-ccc4-4290-9750-cc72554ee636','螺旋桨履历表二册','l_x_j_l_l_b__c__JBdQ','\"创建螺旋桨履历表二册@20240428181142\"','2024-04-28 18:11:42','2024-04-28 18:11:42','sysadmin',NULL,0,0,0),('1165e73e-61b7-49c2-8527-7e373ec01372','专业字典','zh_y_z_d__HwXR','\"创建专业字典@20240428102242\"','2024-04-28 10:22:43','2024-04-28 10:22:43','sysadmin',NULL,0,0,0),('2288113a-e9be-452f-a88f-16506b2218ca','体检类型字典','t_j_l_x_z_d__Mpwc','\"创建体检类型字典@20240428102202\"','2024-04-28 10:22:03','2024-04-28 10:22:03','sysadmin',NULL,0,0,0),('2579616f-f8a9-46c4-a10e-1f20bff21a40','版本字典','b_b_z_d__P_hs','\"创建版本字典@20240428102709\"','2024-04-28 10:27:11','2024-04-28 10:27:11','sysadmin',NULL,0,0,0),('2762b17f-7fc5-4a93-9fc8-c1ee1daff11d','发动机履历表一册','f_d_j_l_l_b_y_c__MhDS','\"创建发动机履历表一册@20240428181039\"','2024-04-28 18:10:40','2024-04-28 18:10:40','sysadmin',NULL,0,0,0),('3703743f-b2ba-4972-b4f4-c2791d6eb6e4','班期登记表','b_q_d_j_b__wpRd','\"创建班期登记表@20240428133657\"','2024-04-28 13:36:58','2024-04-28 13:36:58','sysadmin',NULL,0,0,0),('38bc7488-42f6-4bba-9e53-191c68941d0c','性别字典','x_b_z_d__XHaF','\"创建性别字典@20240428101632\"','2024-04-28 10:16:33','2024-04-28 10:16:33','sysadmin',NULL,0,0,0),('3c30575d-3685-4cff-92e5-1a5851b65493','机型登记表','j_x_d_j_b__Ddkz','\"创建机型登记表@20240428133645\"','2024-04-28 13:36:46','2024-04-28 13:36:46','sysadmin',NULL,0,0,0),('3cd1461b-da43-4aff-8510-a4dbfecb4dc3','飞机信息登记表','f_j_x_x_d_j_b__hrwM','\"创建飞机信息登记表@20240428180935\"','2024-04-28 18:09:38','2024-04-28 18:09:38','sysadmin',NULL,0,0,0),('46f479de-4c23-48c1-a374-88e715539a0e','计划状态字典','j_h_zh_t_z_d__PKfP','\"创建计划状态字典@20240428102632\"','2024-04-28 10:26:33','2024-04-28 10:26:33','sysadmin',NULL,0,0,0),('4a19af0a-065f-430c-b616-af0cc7bd7e50','飞机履历表二册','f_j_l_l_b__c__tJZG','\"创建飞机履历表二册@20240428181022\"','2024-04-28 18:10:23','2024-04-28 18:10:23','sysadmin',NULL,0,0,0),('51604a74-5a77-4370-8008-d85f667d9035','兼职教员信息表','j_zh_j_y_x_x_b__ebez','\"创建兼职教员信息表@20240428134641\"','2024-04-28 13:46:42','2024-04-28 13:46:42','sysadmin',NULL,0,0,0),('5f46e5c2-7c43-457a-aade-882baa4baadb','气象字典','q_x_z_d__ZnaR','\"创建气象字典@20240428102602\"','2024-04-28 10:26:03','2024-04-28 10:26:03','sysadmin',NULL,0,0,0),('5f917074-6910-4c67-91c6-e70205dfa0a1','其他部件信息表','q_t_b_j_x_x_b__NieX','\"创建其他部件信息表@20240428181216\"','2024-04-28 18:12:18','2024-04-28 18:12:18','sysadmin',NULL,0,0,0),('63682de3-546e-4b4e-86a9-7df3e29b2cee','政治面貌字典','zh_zh_m_m_z_d__ERrh','\"创建政治面貌字典@20240428101845\"','2024-04-28 10:18:46','2024-04-28 10:18:46','sysadmin',NULL,0,0,0),('63d07e11-8a57-4a22-a4f0-5d511814a32a','飞行计划管理','f_x_j_h_g_l__bAdm','\"创建飞行计划管理@20240428173434\"','2024-04-28 17:34:35','2024-04-28 17:34:35','sysadmin',NULL,0,0,0),('67c95641-828f-46d4-baff-aa758a15ea31','执照等级字典','zh_zh_d_j_z_d__emZc','\"创建执照等级字典@20240428102055\"','2024-04-28 10:20:56','2024-04-28 10:20:56','sysadmin',NULL,0,0,0),('7b728056-aed1-4fe4-af88-82e048595648','飞机状态字典','f_j_zh_t_z_d__ZfMb','\"创建飞机状态字典@20240428102408\"','2024-04-28 10:24:09','2024-04-28 10:24:09','sysadmin',NULL,0,0,0),('7d031493-b14f-4686-89f5-3bf63b8f8e5f','航线管理','h_x_g_l__Gfxb','\"创建航线管理@20240428173410\"','2024-04-28 17:34:11','2024-04-28 17:34:11','sysadmin',NULL,0,0,0),('82f94fee-6e5a-4bcb-b0e9-5fbd9c4ae48c','题型字典','t_x_z_d__z_m_','\"创建题型字典@20240428102515\"','2024-04-28 10:25:16','2024-04-28 10:25:16','sysadmin',NULL,0,0,0),('834f6de6-adea-478a-97d2-838aa1d39061','其他人员表','q_t_r_y_b__NFRc','\"创建其他人员表@20240428134658\"','2024-04-28 13:46:58','2024-04-28 13:46:58','sysadmin',NULL,0,0,0),('8594aca6-05dd-48e7-b1f4-02c76ca75519','备降场信息登记表','b_j_ch_x_x_d_j_b__TirZ','\"创建备降场信息登记表@20240428133758\"','2024-04-28 13:37:58','2024-04-28 13:37:58','sysadmin',NULL,0,0,0),('9400a484-c7a7-4cce-ac43-5129c340da63','学位字典','x_w_z_d__waFe','\"创建学位字典@20240428101958\"','2024-04-28 10:19:59','2024-04-28 10:19:59','sysadmin',NULL,0,0,0),('9432ae75-6ba2-477d-a450-07dc9c3b4525','体检信息表','t_j_x_x_b__dwtF','\"创建体检信息表@20240428134709\"','2024-04-28 13:47:10','2024-04-28 13:47:10','sysadmin',NULL,0,0,0),('9c0197f8-0491-4f8d-884d-b9df51ac8166','发动机履历表二册','f_d_j_l_l_b__c__TTrW','\"创建发动机履历表二册@20240428181050\"','2024-04-28 18:10:51','2024-04-28 18:10:51','sysadmin',NULL,0,0,0),('9ef25a11-2eb7-458d-b100-8032a9aff2b2','学历字典','x_l_z_d__HCYH','\"创建学历字典@20240428101939\"','2024-04-28 10:19:40','2024-04-28 10:19:40','sysadmin',NULL,0,0,0),('a299b7ea-6992-45e4-8eee-22cecedf88b3','飞行计划类型字典','f_x_j_h_l_x_z_d__wPca','\"创建飞行计划类型字典@20240428102538\"','2024-04-28 10:25:39','2024-04-28 10:25:39','sysadmin',NULL,0,0,0),('b70c4c30-479d-45c8-833c-79a2ea2d7355','航点库管理','h_d_k_g_l__GM_n','\"创建航点库管理@20240428173359\"','2024-04-28 17:34:00','2024-04-28 17:34:00','sysadmin',NULL,0,0,0),('b9cc5b40-682a-46ee-91dd-0cb9d6e11b8f','民族字典','m_z_z_d__yJHK','\"创建民族字典@20240428101917\"','2024-04-28 10:19:19','2024-04-28 10:19:19','sysadmin',NULL,0,0,0),('bbabfbaf-939d-436e-9ce9-16d289de8c1c','螺旋桨履历表三册','l_x_j_l_l_b_s_c__Zrmn','\"创建螺旋桨履历表三册@20240428181151\"','2024-04-28 18:11:52','2024-04-28 18:11:52','sysadmin',NULL,0,0,0),('c0bd7d0c-4047-40f7-8a99-f17cdedfe589','飞行等级字典','f_x_d_j_z_d__Nmta','\"创建飞行等级字典@20240428102122\"','2024-04-28 10:21:23','2024-04-28 10:21:23','sysadmin',NULL,0,0,0),('c4578457-06d4-4ee8-9041-8189c144beec','三证信息登记表','s_zh_x_x_d_j_b__mR_p','\"创建三证信息登记表@20240428180952\"','2024-04-28 18:09:53','2024-04-28 18:09:53','sysadmin',NULL,0,0,0),('cf3132ee-d839-4f4c-aca5-23af9a5067aa','学员信息表','x_y_x_x_b__dxTc','\"创建学员信息表@20240428134649\"','2024-04-28 13:46:50','2024-04-28 13:46:50','sysadmin',NULL,0,0,0),('cf958655-ccc3-4806-8819-25766a9a7026','权限字典','q_x_z_d__raTJ','\"创建权限字典@20240428102442\"','2024-04-28 10:24:44','2024-04-28 10:24:44','sysadmin',NULL,0,0,0),('dadd9bd8-31a9-42f8-9f38-97e0e5c24262','发动机履历表三册','f_d_j_l_l_b_s_c___hTt','\"创建发动机履历表三册@20240428181059\"','2024-04-28 18:11:00','2024-04-28 18:11:00','sysadmin',NULL,0,0,0),('db841c6f-0afe-4b83-9039-0aef80721b39','螺旋桨履历表一册','l_x_j_l_l_b_y_c__WsPR','\"创建螺旋桨履历表一册@20240428181133\"','2024-04-28 18:11:34','2024-04-28 18:11:34','sysadmin',NULL,0,0,0),('e942f067-62a7-4fec-979e-90f57e5f4912','单位登记表','d_w_d_j_b__dxFZ','\"创建单位登记表@20240428133631\"','2024-04-28 13:36:33','2024-04-28 13:36:33','sysadmin',NULL,0,0,0),('e9912b94-4b8b-4830-bdcb-5790a5e015d7','位置字典','w_zh_z_d__wPrK','\"创建位置字典@20240428102330\"','2024-04-28 10:23:31','2024-04-28 10:23:31','sysadmin',NULL,0,0,0),('f4d10534-1cd3-420b-8af3-f98d6487547c','机场信息登记表','j_ch_x_x_d_j_b__rsQM','\"创建机场信息登记表@20240428133736\"','2024-04-28 13:37:37','2024-04-28 13:37:37','sysadmin',NULL,0,0,0),('f4f4e22f-6475-49bb-b00d-13dadfa778fa','班字典','b_z_d__AbFr','\"创建班字典@20240428102302\"','2024-04-28 10:23:03','2024-04-28 10:23:03','sysadmin',NULL,0,0,0),('f78c5e09-9bf2-4972-9681-3d1a414430ba','空域信息登记表','k_y_x_x_d_j_b__rXsR','\"创建空域信息登记表@20240428133749\"','2024-04-28 13:37:50','2024-04-28 13:37:50','sysadmin',NULL,0,0,0),('fb480f23-2098-4ae5-8a19-1fff88c59536','教学等级字典','j_x_d_j_z_d__bFKK','\"创建教学等级字典@20240428102029\"','2024-04-28 10:20:30','2024-04-28 10:20:30','sysadmin',NULL,0,0,0);
/*!40000 ALTER TABLE `table_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching_journal`
--

DROP TABLE IF EXISTS `teaching_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching_journal` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_date` date DEFAULT NULL COMMENT '日期',
  `course_sequence` int DEFAULT NULL COMMENT '节次',
  `classroom` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室',
  `course_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程',
  `teacher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '课程内容',
  `students_num` int DEFAULT NULL COMMENT '学习人数',
  `is_delete` int DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int DEFAULT NULL COMMENT '状态',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `course_start` datetime NOT NULL COMMENT '课程开始时间',
  `course_end` datetime NOT NULL COMMENT '课程结束时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching_journal`
--

LOCK TABLES `teaching_journal` WRITE;
/*!40000 ALTER TABLE `teaching_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaching_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'flyingtrainingdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 15:22:10
