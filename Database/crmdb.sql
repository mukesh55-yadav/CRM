-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: crmdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaintsubject` varchar(45) DEFAULT NULL,
  `details` varchar(2000) DEFAULT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,'About Payment..','Refund My Payment..','After 24hrs.',4);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productcategoryname` varchar(45) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'Electronics','i have multipal types of Electronics product.'),(2,'Beauty and Personal Care','all product of Beauty and Personal Care');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) DEFAULT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `Details` varchar(2000) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `productCategoryid` bigint DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productcategoryid_idx` (`productCategoryid`),
  CONSTRAINT `productcategoryid` FOREIGN KEY (`productCategoryid`) REFERENCES `productcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetails`
--

LOCK TABLES `productdetails` WRITE;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
INSERT INTO `productdetails` VALUES (1,'PR101','I-Phone','i have multipal types of mobiles','1000000',1,'p2.jpg'),(2,'PR901','Hair Care','I have another types of Hair Care product.','4000',2,'BP1.jpg');
/*!40000 ALTER TABLE `productdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productinquiry`
--

DROP TABLE IF EXISTS `productinquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productinquiry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enqno` varchar(45) DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `details` varchar(2000) DEFAULT NULL,
  `userName` bigint DEFAULT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_idx` (`product`),
  KEY `username_idx` (`userName`),
  CONSTRAINT `product` FOREIGN KEY (`product`) REFERENCES `productdetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productinquiry`
--

LOCK TABLES `productinquiry` WRITE;
/*!40000 ALTER TABLE `productinquiry` DISABLE KEYS */;
INSERT INTO `productinquiry` VALUES (1,'En101',1,'what is price??',4,'10,000,0');
/*!40000 ALTER TABLE `productinquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phoneNo` varchar(45) DEFAULT NULL,
  `rolename` varchar(45) DEFAULT NULL,
  `roleid` bigint DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  `createdatetime` timestamp NULL DEFAULT NULL,
  `modifieddatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Admin@123gmail.com','Admin@123','8828468765','ADMIN',1,'root','root','2022-07-13 12:18:02','2022-07-13 12:18:02'),(2,'User','User@123gmail.com','User@1234','9799567422','User',2,'root','root','2022-09-26 08:16:14','2022-09-26 08:16:14'),(3,'Emp','Emp@123gmail.com','Emp@1234','9165435598','Employee',3,'root','root','2022-09-26 08:17:48','2022-09-26 08:17:48'),(4,'Dk','DK@123gmail.com','User@1234','9165435598','User',2,'root','root','2022-09-28 10:04:28','2022-09-28 10:04:28');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-28 19:08:08
