-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: muldshop
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_hoa_don`
--

DROP TABLE IF EXISTS `chi_tiet_hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_hoa_don` (
  `ma_chi_tiet_hoa_don` int NOT NULL AUTO_INCREMENT,
  `ma_hoa_don` int NOT NULL,
  `ma_san_pham` int NOT NULL,
  `so_luong` int NOT NULL,
  `giam_gia` int NOT NULL,
  PRIMARY KEY (`ma_chi_tiet_hoa_don`,`ma_hoa_don`,`ma_san_pham`),
  KEY `ma_san_pham_idx` (`ma_san_pham`),
  KEY `ma_hoa_don_idx` (`ma_hoa_don`),
  CONSTRAINT `ma_hoa_don` FOREIGN KEY (`ma_hoa_don`) REFERENCES `hoa_don` (`ma_hoa_don`),
  CONSTRAINT `ma_san_pham` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`ma_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_hoa_don`
--

LOCK TABLES `chi_tiet_hoa_don` WRITE;
/*!40000 ALTER TABLE `chi_tiet_hoa_don` DISABLE KEYS */;
INSERT INTO `chi_tiet_hoa_don` VALUES (1,1,1,1,100),(2,2,2,1,1000);
/*!40000 ALTER TABLE `chi_tiet_hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danh_muc` (
  `ma_danh_muc` int NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `danh_muc_cha` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_danh_muc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc`
--

LOCK TABLES `danh_muc` WRITE;
/*!40000 ALTER TABLE `danh_muc` DISABLE KEYS */;
INSERT INTO `danh_muc` VALUES (1,'Laptop','null'),(2,'Dell','1'),(3,'Asus','1'),(4,'Phone','null'),(5,'Realme','4'),(6,'SamSung','4'),(7,'Iphone','4');
/*!40000 ALTER TABLE `danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `ma_hoa_don` int NOT NULL AUTO_INCREMENT,
  `ma_tai_khoan` int NOT NULL,
  `dia_chi_giao_hang` varchar(255) NOT NULL,
  `phuong_thuc_thanh_toan` varchar(255) NOT NULL,
  `ngay_giao_hang` datetime NOT NULL,
  `ngay_mua_hang` datetime NOT NULL,
  PRIMARY KEY (`ma_hoa_don`,`ma_tai_khoan`),
  KEY `ma_tai_khoan_idx` (`ma_tai_khoan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` VALUES (1,1,'Ha Noi','Tien mat','2022-09-21 00:00:00','2022-09-19 00:00:00'),(2,2,'Ha Noi','Momo','2022-09-22 00:00:00','2022-09-20 00:00:00');
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `ma_san_pham` int NOT NULL,
  `ma_danh_muc` int NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `hinh_anh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `so_luong` int NOT NULL,
  `mo_ta` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `don_gia` int NOT NULL,
  `giam_gia` int DEFAULT NULL,
  PRIMARY KEY (`ma_san_pham`,`ma_danh_muc`),
  KEY `ma_danh_muc_idx` (`ma_danh_muc`),
  CONSTRAINT `ma_danh_muc` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danh_muc` (`ma_danh_muc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,2,'Dell G3','null',10,'Laptop vip',1900,100),(2,5,'Realme 3pro','null',99,'Realme APK',400,10);
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tai_khoan` (
  `ma_tai_khoan` int NOT NULL,
  `ten_tai_khoan` varchar(255) NOT NULL,
  `ten_dang_nhap` varchar(255) NOT NULL,
  `quyen_truy_cap` bit(1) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `so_dien_thoai` varchar(45) NOT NULL,
  `mat_khau` varchar(45) NOT NULL,
  `gioi_tinh` bit(1) NOT NULL,
  `tinh_trang` bit(1) NOT NULL,
  PRIMARY KEY (`ma_tai_khoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'van thai','muld',_binary '','ha noi','2001-05-09','0164555978','123456',_binary '',_binary ''),(2,'ma quen','admin',_binary '\0','Ha Noi','2002-04-07','0346699785','123456',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-21 17:02:41
