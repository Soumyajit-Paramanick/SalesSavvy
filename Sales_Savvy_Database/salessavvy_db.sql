-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: salessavvy_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,23,1,1),(2,23,2,2),(3,24,1,2),(4,24,2,1),(5,24,4,1);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Accessories'),(5,'Mobile Accessories'),(4,'Mobiles'),(2,'Pants'),(1,'Shirts');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_tokens`
--

DROP TABLE IF EXISTS `jwt_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_tokens` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `jwt_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
INSERT INTO `jwt_tokens` VALUES (17,32,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBQSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTc3MTM4OTA2MywiZXhwIjoxNzcxMzkyNjYzfQ.qdHcE8SPpT55W6b5BpVdvR0Bjs5GWqr2sIWVlE__PW9Ehidwg2AfF8lkCjwg7uOPW7oi3FiOJeo3ecBdzysGkQ','2026-02-18 11:01:03'),(20,29,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBZG1pbiIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTc3MTM5MzQ3MSwiZXhwIjoxNzcxMzk3MDcxfQ.GZDptMxk6BDyYW5AwmUdkxnx2I9L7q9n-UCfmgyIlk8paORLkNsj_RgGIkUtnKcuHEJxehGBLVhEPDIFTSvRiA','2026-02-18 06:44:31'),(21,33,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJCQiIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTc3MTM5NDQwMSwiZXhwIjoxNzcxMzk4MDAxfQ.q_soEOVKrquRU70Y88Xd3PRODctJLq5kvrzSXU69gciuIFsJZjQgTDVAFEf7jWQ4XR7xHsLakasDBYjS5ubs5g','2026-02-18 07:00:01');
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_per_unit` decimal(38,2) NOT NULL,
  `total_price` decimal(38,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (10,'order_Rr0cpxl1hZiNZd',65,9,199.99,1799.91),(11,'order_RrlweWuNpQTazD',5,1,899.99,899.99),(12,'order_RrlweWuNpQTazD',6,1,999.99,999.99),(13,'order_RtQ2GXBJpiwBkK',3,6,699.99,4199.94),(14,'order_RtQ2GXBJpiwBkK',2,1,599.99,599.99),(15,'order_RtQ2GXBJpiwBkK',6,1,999.99,999.99),(16,'order_RtQ2GXBJpiwBkK',18,1,759.99,759.99),(17,'order_RtQ2GXBJpiwBkK',19,1,689.99,689.99),(18,'order_RtQ2GXBJpiwBkK',23,1,799.00,799.00),(19,'order_RtQ66j5O5jfzI3',4,1,799.99,799.99),(20,'order_RtQ66j5O5jfzI3',9,1,1299.99,1299.99),(21,'order_RtQ66j5O5jfzI3',7,1,1099.99,1099.99),(22,'order_RtjsiIqLuQbfSp',1,1,499.99,499.99),(23,'order_RtjsiIqLuQbfSp',3,1,699.99,699.99),(24,'order_RtjsiIqLuQbfSp',4,2,799.99,1599.98),(25,'order_SHUSykkWHPg3YK',33,1,29999.00,29999.00),(26,'order_SHUSykkWHPg3YK',34,1,25999.99,25999.99),(27,'order_SHUa7AEh8pco30',4,1,799.99,799.99),(28,'order_SHUa7AEh8pco30',5,1,899.99,899.99),(29,'order_SHUfKnXv7clH3H',5,1,899.99,899.99),(30,'order_SHUfKnXv7clH3H',4,2,799.99,1599.98),(31,'order_SHVX5AnO2oK3Xv',9,1,1299.99,1299.99),(32,'order_SHVX5AnO2oK3Xv',8,1,1199.99,1199.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('order_Rr0C7hoM8xZTLS',25,1799.91,'PENDING','2025-12-13 06:47:32',NULL),('order_Rr0cpxl1hZiNZd',25,1799.91,'SUCCESS','2025-12-13 07:12:49','2025-12-13 07:13:57'),('order_Rr0D0dXDWLa3Ve',25,1799.91,'PENDING','2025-12-13 06:48:22',NULL),('order_Rr0Fawdr9EfKrz',25,1799.91,'PENDING','2025-12-13 06:50:49',NULL),('order_Rr0HfzYianRuRB',25,1799.91,'PENDING','2025-12-13 06:52:47',NULL),('order_Rr0IGxBy3H0EuW',25,1799.91,'PENDING','2025-12-13 06:53:21',NULL),('order_RrlweWuNpQTazD',25,1899.98,'SUCCESS','2025-12-15 05:30:13','2025-12-15 05:30:39'),('order_RtjsiIqLuQbfSp',28,2799.96,'SUCCESS','2025-12-20 04:47:04','2025-12-20 04:47:32'),('order_RtQ2GXBJpiwBkK',25,8048.90,'SUCCESS','2025-12-19 09:22:13','2025-12-19 09:22:42'),('order_RtQ66j5O5jfzI3',26,3199.97,'SUCCESS','2025-12-19 09:25:52','2025-12-19 09:26:15'),('order_SHUa7AEh8pco30',32,1699.98,'SUCCESS','2026-02-17 23:55:06','2026-02-17 23:55:43'),('order_SHUfKnXv7clH3H',32,2499.97,'SUCCESS','2026-02-18 00:00:03','2026-02-18 00:00:28'),('order_SHUSykkWHPg3YK',32,55998.99,'SUCCESS','2026-02-17 23:48:21','2026-02-17 23:49:40'),('order_SHVX5AnO2oK3Xv',34,2499.98,'SUCCESS','2026-02-18 00:50:56','2026-02-18 00:51:19');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,1,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(2,2,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt10.png'),(3,3,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt11.png'),(4,4,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt12.png'),(5,5,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt12.png'),(6,6,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt14.png'),(7,7,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt15.png'),(8,8,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt2.png'),(9,9,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(10,10,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(11,11,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(12,12,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(13,13,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(14,14,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt11.png'),(15,15,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt12.png'),(16,17,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt14.png'),(17,18,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt15.png'),(18,19,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt10.png'),(19,20,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(20,21,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph12.png'),(21,22,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph13.png'),(22,23,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph14.png'),(23,24,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph15.png'),(24,25,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph16.png'),(25,26,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph17.png'),(26,27,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph2.png'),(27,28,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph3.png'),(28,29,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph4.png'),(29,30,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph5.png'),(30,31,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv1.png'),(31,32,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv10.png'),(32,33,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv11.png'),(33,34,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv12.png'),(34,35,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv13.png'),(35,36,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv14.png'),(36,37,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv15.png'),(37,38,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv2.png'),(38,39,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv3.png'),(39,40,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv4.png'),(40,41,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv5.png'),(41,42,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv6.png'),(42,43,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv7.png'),(43,44,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv8.png'),(44,45,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv9.png'),(45,46,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv9.png'),(46,47,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(47,48,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(48,49,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(49,50,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(50,51,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(51,53,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(52,54,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(53,56,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(54,57,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(55,58,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(56,59,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(57,60,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(58,61,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(59,62,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(60,63,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(61,64,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(62,65,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(63,66,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(64,68,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(65,69,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(66,70,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(67,72,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(68,73,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(69,74,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv7.png'),(70,75,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(71,76,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(72,77,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(73,78,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/tv7.png'),(74,79,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(75,80,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(76,81,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(77,82,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png'),(78,83,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(79,84,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(80,85,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(81,86,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(82,87,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(83,88,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(84,89,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(85,90,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(86,91,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(87,92,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(88,93,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(89,94,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/ph11.png'),(90,95,'https://production-inventory-service.s3.ap-south-1.amazonaws.com/kodnest-documents/salessavvy/COSTOMER+IMAGES/shirt1.png');
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Shirt1','Stylish Shirt1',499.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(2,'Shirt2','Stylish Shirt2',599.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(3,'Shirt3','Stylish Shirt3',699.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(4,'Shirt4','Stylish Shirt4',799.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(5,'Shirt5','Stylish Shirt5',899.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(6,'Shirt6','Stylish Shirt6',999.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(7,'Shirt7','Stylish Shirt7',1099.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(8,'Shirt8','Stylish Shirt8',1199.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(9,'Shirt9','Stylish Shirt9',1299.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(10,'Shirt10','Stylish Shirt10',1399.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(11,'Shirt11','Stylish Shirt11',1499.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(12,'Shirt12','Best Shirt In the Segment',987.00,200,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(13,'Shirt13','Stylish Shirt13',1699.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(14,'Shirt14','Stylish Shirt14',1799.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(15,'Shirt15','Stylish Shirt15',1899.99,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(16,'Pant1','Stylish Pant1',799.99,50,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(17,'Pant2','Stylish Pant2',899.50,45,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(18,'Pant3','Stylish Pant3',759.99,40,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(19,'Pant4','Stylish Pant4',689.99,55,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(20,'Pant5','Stylish Pant5',999.99,30,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(21,'Pant6','Stylish Pant6',699.99,20,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(22,'Pant7','Stylish Pant7',849.50,35,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(23,'Pant8','Stylish Pant8',799.00,60,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(24,'Pant9','Stylish Pant9',729.99,25,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(25,'Pant10','Stylish Pant10',889.99,50,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(26,'Pant11','Stylish Pant11',819.99,40,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(27,'Shirt Colourful','Best Shirt',750.00,50,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(28,'cool shirt','colourful shirt',800.00,50,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(29,'Best color Shirt','Cool color shirt',900.00,90,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(30,'Pant15','Stylish Pant15',899.99,90,2,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(31,'TV1','Smart TV1 with HD display',18999.99,20,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(32,'TV2','Smart TV2 with Full HD display',21999.50,15,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(33,'TV3','Smart TV3 with 4K display',29999.00,10,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(34,'TV4','Smart TV4 with HDR and Dolby Vision',25999.99,12,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(35,'TV5','Smart TV5 with Ultra HD screen',34999.99,8,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(36,'TV6','Smart TV6 with Alexa Built-in',27999.50,18,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(37,'TV7','Smart TV7 with Android OS',22999.00,22,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(38,'TV8','Smart TV8 with High Refresh Rate',31999.99,14,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(39,'TV9','Smart TV9 with Thin Bezels',24999.99,20,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(40,'TV10','Smart TV10 with AI Upscaling',39999.00,5,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(41,'Speaker','Worlds BEst',12999.99,50,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(42,'Nikon DSLR','Indias best',8999.50,75,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(43,'NIK DSLR2','Sales Choice',15999.00,40,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(44,'NIC DSLR3','Capture Nik',19999.99,30,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(45,'LAPTOP','Smart TV15 with AI Upscaling',24999.99,25,3,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(46,'Mobile1','Mobile6 with gaming chipset and high refresh rate',19999.99,50,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(47,'Mobile2','Mobile7 with gaming chipset and high refresh rate',8999.50,55,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(48,'Mobile3','Mobile8 with gaming chipset and high refresh rate',22999.00,50,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(49,'Mobile4','Mobile9 with gaming chipset and high refresh rate',8999.50,55,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(50,'Mobile5','Mobile10 with gaming chipset and high refresh rate',39999.00,50,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(51,'Mobile6','Mobile10 with gaming chipset and high refresh rate',48765.00,30,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(53,'Mobile8','Mobile12with gaming chipset and high refresh rate',34598.00,345,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(54,'Mobile9','Mobile13 with gaming chipset and high refresh rate',45673.00,45,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(56,'Mobile11','Mobile15 with gaming chipset and high refresh rate',23412.00,65,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(57,'Mobile12','Mobile12 with gaming chipset and high refresh rate',89765.00,456,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(58,'Mobile13','Mobile14 with gaming chipset and high refresh rate',23456.00,567,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(59,'Mobile14','Mobile11 with gaming chipset and high refresh rate',99990.00,234,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(60,'Mobile15','Mobile15 with gaming chipset and high refresh rate',45389.00,225,4,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(61,'Mobile Accessory -1','Durable and practical mobile accessory for everyday use.',999.00,30,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(62,'Mobile Accessory 2','Durable and practical mobile accessory for everyday use.',349.50,200,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(63,'Mobile Accessory 3','A versatile mobile accessory with modern features.',899.00,80,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(64,'Mobile Accessory 4','Reliable mobile accessory designed for convenience.',749.75,120,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(65,'Mobile Accessory 5','Mobile accessory offering comfort and durability.',199.99,250,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(66,'Mobile Accessory 6','A stylish and protective mobile accessory.',249.99,500,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(68,'Mobile Accessory 8','An essential mobile accessory designed for convenience.',399.50,350,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(69,'super','awesome',999.00,40,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(70,'Mobile Accessory 10','Compact and efficient mobile accessory for all your needs.',1099.99,100,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(71,'cool','verycool',876.00,50,5,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(72,'Louies-2','Cool Louies 2.',156.99,321,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(73,'awesome','awesome',8989.00,50,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(74,'spykershirt','best shirt',999.00,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(75,'Spy shirts','good cool',99.00,200,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(76,'spyker hot shirt','best shirt',999.00,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(77,'louies s[yker','cool hot shirt',854.00,20,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(78,'78','marvalous',768.00,100,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(79,'LouiesSpiker','wonderful striped shirt',899.00,200,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(80,'spiker','adsjfkhbsjkdf',999.00,200,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(81,'spyker12','wednc ewjhcew',999.00,20,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(82,'gyshirt','dcjhbSJDHCac',899.00,10,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(83,'aKS;JC','ZADJLNSV ',767.00,29,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(84,'hgdv','wedjkcwev',644.00,10,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(85,'sdfhjb1','sdkjvb',657.00,20,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(86,'sdkfjn','sdfkjn',23.00,23,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(87,'dsf','sdfb',23.00,23,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(88,'dsfbvsdf','sdfb',23.00,21,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(89,'shiet','asdvwefg',23.00,23,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(90,'zdf','sdfb',23.00,23,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(91,'shirtspyker','aschjadc',123.00,23,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(92,'asdkjc','wdf',12.00,23,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(93,'abc','dfghj',40.00,5,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(94,'abc2','gyvhujnkml,',30.00,3,1,'2025-12-08 10:58:04','2025-12-08 10:58:04'),(95,'blueShirt','Awesome Blue Shirt',876.00,20,1,'2025-12-08 10:58:04','2025-12-08 10:58:04');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','CUSTOMER') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'soumyajit','soumyajit@example.com','$2a$10$ZNsjive.BSg3Ls0Iy6YsEePEPe8J.1.gBI9qgmmz69TxN153sHnx2','CUSTOMER','2025-11-20 10:31:10','2025-11-20 10:31:10'),(2,'user1','user1@gmail.com','$2a$10$vfvMWtCmyaNTyla7PlMHK.yg3BSVMFeWh1c/mQGjgJNBJndcy2Iv.','CUSTOMER','2025-11-20 11:03:02','2025-11-20 11:03:02'),(3,'user2','user2@gmail.com','$2a$10$67VJl.O6kL/MWAiHxC.IfeKSjAmZh9MG/kULkFS/acDLbYIzrvfs.','CUSTOMER','2025-11-20 11:18:00','2025-11-20 11:18:00'),(4,'user3','user3@gmail.com','$2a$10$mZJCH9QEB8HpIFOd9lfLSu3szeLYJP0LU7WBmzkLfjS5lU3AtrvNS','CUSTOMER','2025-11-20 11:39:53','2025-11-20 11:39:53'),(5,'user4','user4@gmail.com','$2a$10$9x22rkFUrcxQlWVh3a.HVefGXom/BkM4nHFWGFhHz2qqbXgeJm8Bu','CUSTOMER','2025-11-20 11:43:54','2025-11-20 11:43:54'),(6,'user5','user5@gmail.com','$2a$10$ALaaQuxw4p.s7iEKlO11T.NgL..WqpNdN5Hy3wdqw4nwe5DATU5Zq','CUSTOMER','2025-11-20 11:45:15','2025-11-20 11:45:15'),(7,'user6','user6@gmail.com','$2a$10$cTj4MWvHjqyZXwNx8OeVNOQhntNvp0M8CcXSuEebydhqhM8tejmUa','CUSTOMER','2025-11-20 11:48:16','2025-11-20 11:48:16'),(8,'admin1','admin1@gmail.com','$2a$10$xvQe2xOxqZ1rFzDjzoLACuVI4euG.g/pZDrvx4ieLvq9xTjxJJI9.','ADMIN','2025-11-20 11:58:11','2025-11-20 11:58:11'),(9,'admin2','admin2@gmail.com','$2a$10$OgugJrE2BNPSNL8Ij8uaLOueplk./yr7oXHdV3Cjz7k0Elh572Ir6','ADMIN','2025-11-20 12:07:26','2025-11-20 12:07:26'),(10,'admin3','admin3@gmail.com','$2a$10$vqU0YIzKcnXXpsZaDL.xZegiAFg3exZiv73SzudfpG7B3Cyxf1dAK','ADMIN','2025-11-26 07:39:09','2025-11-26 07:39:09'),(11,'customer1','customer1@gmail.com','$2a$10$nkhy5JjoahpZlXbuHVo4zOjAUUEYR9zGUSwLCfkLEBXqrCAcToi6W','CUSTOMER','2025-11-26 09:36:11','2025-11-26 09:36:11'),(12,'Customer2','customer2@gmail.com','$2a$10$LalVbMql9Ei0LcooqAvnqeWEuom8LSCPresYtZ2cUveSVuHWE6BNm','CUSTOMER','2025-11-26 09:52:18','2025-11-26 09:52:18'),(13,'Customer3','Customer3@gmail.com','$2a$10$9bGufPJAABHQthXhJlivMuNTIG7Jx3sSY8wT0ouP.sm.kT164sspS','CUSTOMER','2025-11-26 13:00:04','2025-11-26 13:00:04'),(14,'Customer4','customer4@gmail.com','$2a$10$RMyUr6mVs7.GAw63nOYWku1wYNQshKn9pYwDtIcWWsweAuRmv00HK','CUSTOMER','2025-11-27 04:54:30','2025-11-27 04:54:30'),(15,'Customer5','customer5@gmail.com','$2a$10$fT2M36LI1wTQca/TAnXmJuXDbnLRQ512quryInnukE.hF1UjsDnX6','CUSTOMER','2025-11-27 05:21:58','2025-11-27 05:21:58'),(16,'xyz1','xyz1@gmail.com','$2a$10$ISHYknPIgvjaVk/HA.Y0tOHLNatKLBFykFZRKh7Dg7JciTAyYb/k2','CUSTOMER','2025-12-06 10:41:07','2025-12-06 10:41:07'),(17,'xyz2','xyz2@gmail.com','$2a$10$lZK5cGKAf5TzGn7DEbAkR.XqP/jFoSlhmuej.l36YIAB0bhH8RJvW','CUSTOMER','2025-12-06 10:52:32','2025-12-06 10:52:32'),(18,'xyz3','xyz3@gmail.com','$2a$10$OSNbkycz6QWlZ/wA723lLul51IPiTjSW9dJ3KdGmZ0e6bs86ZI7GS','CUSTOMER','2025-12-08 07:07:46','2025-12-08 07:07:46'),(19,'xyz4','xyz4@gmail.com','$2a$10$fUm4av83JjCeM8.geEK5h.4nD/AaIovCQWp3wUOe63O28HX8RB79e','CUSTOMER','2025-12-08 07:24:06','2025-12-08 07:24:06'),(20,'testuser','test@gmail.com','$2a$10$B5g.Cl1FmIt/0OXeZ6Vk7e3shOtCOZuRJJU7J8c8QykjWcscM54Dm','CUSTOMER','2025-12-08 09:17:42','2025-12-08 09:17:42'),(21,'xyz5','xyz5@gmail.com','$2a$10$b5DJLeTDpbKb/RHLN4g6WO3vvkf5ZHF5Ev4e5xhqoyB5F2B0wxjXW','CUSTOMER','2025-12-08 10:05:34','2025-12-08 10:05:34'),(22,'xyz6','xyz6@gmail.com','$2a$10$IsPY6rkMEcduBU52up5IcO0Ka7TRIMI.lW9HwogCd49jPW6wb5gam','CUSTOMER','2025-12-09 06:36:23','2025-12-09 06:36:23'),(23,'xyz7','xyz7@gmail.com','$2a$10$gjeCzE0DKCpsaLEfT6oR1OsCu54QOb0EBNeyDMvE1E9v6YclKLNLS','CUSTOMER','2025-12-09 06:44:16','2025-12-09 06:44:16'),(24,'xyz8','xyz8@gmail.com','$2a$10$MHevNbwtMJivkk0m2P0GQeSayAKa2m9pPGbyT1ntg3XGRANbC2sY2','CUSTOMER','2025-12-09 10:38:27','2025-12-09 10:38:27'),(25,'xyz9_9','xyz9_9@gmail.com','$2a$10$JLU6JZacfkJlj7DJxqxxqenkaqUsMomb3lLbm.jK5LbGrqE8etyyi','CUSTOMER','2025-12-10 07:12:46','2025-12-10 07:12:46'),(26,'xyz10','xyz10@gmail.com','$2a$10$L4uR1HIfD958mudr241mJOxz.uVbjYBHXPZ./DK0xnydy.B8qklu.','CUSTOMER','2025-12-19 09:25:31','2025-12-19 09:25:31'),(27,'xyz11','xyz11@gmail.com','$2a$10$2T/M/mYa3ZFHQTzR.lXr8OfmbvMXSr8lCDaaTKdpJm/BBer22tM6W','CUSTOMER','2025-12-19 11:19:11','2025-12-19 11:19:11'),(28,'xyz12','xyz12@gmail.com','$2a$10$Co5ZUP/RId4M54TJxL7tkO7qOag61O0A0J970FlS2dAIzyVDha1EW','CUSTOMER','2025-12-20 04:46:18','2025-12-20 04:46:18'),(29,'Admin','Admin@gmail.com','$2a$10$WMRkAtnEDdkRl/JswDXYAeUVrA6ivUFh5tOSWwrs78C8UVJg4kSMu','ADMIN','2025-12-23 06:22:31','2025-12-23 06:23:16'),(30,'Soumyajit Paramanick','soumyajitparamanick96419@gmail.com','$2a$10$/2Dwn/RNpklQaavKp/ae2urrvQWLOZm5Dj8AOokZ5emmgqmELNWPm','CUSTOMER','2026-02-18 04:29:19','2026-02-18 04:29:19'),(31,'Jit','jit@gmail.com','$2a$10$nk5lDNerEfOyOYmPjOR8O.3XYlfjUdR6vAboC1/1tOVin9BThVJ4i','CUSTOMER','2026-02-18 04:30:11','2026-02-18 04:30:11'),(32,'AA','aa@gmail.com','$2a$10$.iSX31XTTU4b0L9U3LNlbOme.emhTEOavhT5lNvvltx3V630xm6Ba','CUSTOMER','2026-02-18 04:30:56','2026-02-18 04:30:56'),(33,'BB','bb@gmail.com','$2a$10$o51jBjdGzEm4mejnEF.IhOhWDduCGL8l0n6eux0Bw6Fuy6VneB6uW','CUSTOMER','2026-02-18 00:29:55','2026-02-18 00:29:55'),(34,'CC','cc@gmail.com','$2a$10$zXQ18EtXcHYatNdRdQf0CeZ/RsGkipj7mpm51SeuHiQeBR94UgYT2','CUSTOMER','2026-02-18 00:50:37','2026-02-18 00:50:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 12:03:18
