CREATE DATABASE  IF NOT EXISTS `sdo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sdo`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: sdo
-- ------------------------------------------------------
-- Server version	5.6.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `changes_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `changes_table` varchar(40) NOT NULL,
  `changes_user` int(11) NOT NULL,
  `changes_time` datetime NOT NULL,
  `changes_action` enum('CREATE','UPDATE','DELETE') NOT NULL,
  `changes_rid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`changes_id`)
) ENGINE=MEMORY AUTO_INCREMENT=736 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
INSERT INTO `changes` VALUES (1,'program',2,'2015-01-21 09:58:36','CREATE',4),(2,'program',2,'2015-01-21 10:10:50','CREATE',5),(3,'specprogram',2,'2015-01-21 10:10:56','CREATE',5),(4,'specprogram',2,'2015-01-21 10:10:56','CREATE',5),(5,'programgroups',2,'2015-01-21 10:10:56','CREATE',5),(6,'program',2,'2015-01-21 10:16:30','CREATE',6),(7,'specprogram',2,'2015-01-21 10:16:30','CREATE',6),(8,'programgroups',2,'2015-01-21 10:16:31','CREATE',6),(9,'programgroups',2,'2015-01-21 10:16:31','CREATE',6),(10,'program',2,'2015-01-21 10:24:27','CREATE',7),(11,'programplan',2,'2015-01-21 10:24:28','CREATE',7),(12,'programplan',2,'2015-01-21 10:24:28','CREATE',7),(13,'specprogram',2,'2015-01-21 10:24:28','CREATE',7),(14,'specprogram',2,'2015-01-21 10:24:28','CREATE',7),(15,'programgroups',2,'2015-01-21 10:24:28','CREATE',7),(16,'programgroups',2,'2015-01-21 10:24:28','CREATE',7),(17,'program',2,'2015-01-21 10:36:50','CREATE',8),(18,'programplan',2,'2015-01-21 10:36:50','CREATE',8),(19,'specprogram',2,'2015-01-21 10:36:50','CREATE',8),(20,'specprogram',2,'2015-01-21 10:36:50','CREATE',8),(21,'programgroups',2,'2015-01-21 10:36:51','CREATE',8),(22,'programgroups',2,'2015-01-21 10:36:51','CREATE',8),(23,'program',2,'2015-01-21 10:50:37','CREATE',9),(24,'programplan',2,'2015-01-21 10:50:45','CREATE',9),(25,'specprogram',2,'2015-01-21 10:50:45','CREATE',9),(26,'specprogram',2,'2015-01-21 10:50:45','CREATE',9),(27,'programgroups',2,'2015-01-21 10:50:45','CREATE',9),(28,'program',2,'2015-01-21 10:53:18','CREATE',10),(29,'programplan',2,'2015-01-21 10:53:21','CREATE',10),(30,'specprogram',2,'2015-01-21 10:53:21','CREATE',10),(31,'specprogram',2,'2015-01-21 10:53:21','CREATE',10),(32,'programgroups',2,'2015-01-21 10:53:21','CREATE',10),(33,'programgroups',2,'2015-01-21 10:53:21','CREATE',10),(34,'programtime',2,'2015-01-21 10:53:22','CREATE',10),(35,'program',2,'2015-01-21 10:54:20','UPDATE',3),(36,'programtime',2,'2015-01-21 10:55:47','DELETE',10),(37,'programtime',2,'2015-01-21 10:59:36','CREATE',10),(38,'programtime',2,'2015-01-21 10:59:36','CREATE',10),(39,'program',2,'2015-01-21 12:14:56','UPDATE',3),(40,'programtime',2,'2015-01-21 12:14:56','DELETE',3),(41,'programtime',2,'2015-01-21 12:14:56','DELETE',3),(42,'programtime',2,'2015-01-21 12:14:56','CREATE',3),(43,'programtime',2,'2015-01-21 12:14:56','CREATE',3),(44,'program',2,'2015-01-21 15:24:26','UPDATE',3),(45,'programtime',2,'2015-01-21 15:24:26','DELETE',3),(46,'programtime',2,'2015-01-21 15:24:26','DELETE',3),(47,'programtime',2,'2015-01-21 15:24:26','CREATE',3),(48,'programtime',2,'2015-01-21 15:24:26','CREATE',3),(49,'program',2,'2015-01-21 15:25:06','UPDATE',3),(50,'programtime',2,'2015-01-21 15:25:06','DELETE',3),(51,'programtime',2,'2015-01-21 15:25:06','DELETE',3),(52,'programtime',2,'2015-01-21 15:25:06','CREATE',3),(53,'programtime',2,'2015-01-21 15:25:06','CREATE',3),(54,'program',2,'2015-01-21 15:26:34','UPDATE',10),(55,'programtime',2,'2015-01-21 15:26:35','DELETE',10),(56,'programtime',2,'2015-01-21 15:26:35','DELETE',10),(57,'programtime',2,'2015-01-21 15:26:35','CREATE',10),(58,'programtime',2,'2015-01-21 15:26:35','CREATE',10),(59,'plantable',2,'2015-01-21 15:26:51','CREATE',14),(60,'program',2,'2015-01-22 03:16:38','UPDATE',10),(61,'programtime',2,'2015-01-22 03:16:38','DELETE',10),(62,'programtime',2,'2015-01-22 03:16:38','DELETE',10),(63,'programtime',2,'2015-01-22 03:16:38','CREATE',10),(64,'programtime',2,'2015-01-22 03:16:38','CREATE',10),(65,'program',2,'2015-01-22 03:17:04','UPDATE',3),(66,'programtime',2,'2015-01-22 03:17:04','DELETE',3),(67,'programtime',2,'2015-01-22 03:17:04','DELETE',3),(68,'programtime',2,'2015-01-22 03:17:04','CREATE',3),(69,'programplan',2,'2015-01-22 03:37:59','CREATE',3),(70,'specprogram',2,'2015-01-22 03:37:59','CREATE',3),(71,'programgroups',2,'2015-01-22 03:38:00','CREATE',3),(72,'plantable',2,'2015-01-22 04:49:56','CREATE',15),(73,'program',2,'2015-01-22 04:56:27','UPDATE',3),(74,'plantable',2,'2015-01-22 04:56:42','CREATE',16),(75,'program',2,'2015-01-22 04:57:45','UPDATE',10),(76,'plantable',2,'2015-01-22 04:58:15','CREATE',17),(77,'datesplantable',2,'2015-01-22 04:58:15','CREATE',17),(78,'datesplantable',2,'2015-01-22 04:58:26','DELETE',17),(79,'datesplantable',2,'2015-01-22 04:58:26','CREATE',17),(80,'plantable',2,'2015-01-22 05:01:24','CREATE',18),(81,'datesplantable',2,'2015-01-22 05:01:24','CREATE',18),(82,'program',2,'2015-01-22 05:01:35','UPDATE',10),(83,'plantable',2,'2015-01-22 05:04:35','CREATE',19),(84,'datesplantable',2,'2015-01-22 05:04:35','CREATE',19),(85,'group',2,'2015-01-22 05:07:42','UPDATE',7),(86,'datesplantable',2,'2015-01-22 05:23:01','DELETE',18),(87,'datesplantable',2,'2015-01-22 05:23:01','CREATE',18),(88,'datesplantable',2,'2015-01-22 05:23:04','DELETE',19),(89,'datesplantable',2,'2015-01-22 05:23:04','CREATE',19),(90,'realtable',2,'2015-01-22 05:23:05','CREATE',20),(91,'datesrealtable',2,'2015-01-22 05:23:05','CREATE',20),(92,'datesplantable',2,'2015-01-22 05:23:12','DELETE',20),(93,'datesrealtable',2,'2015-01-22 05:23:12','CREATE',20),(94,'datesplantable',2,'2015-01-22 05:23:18','DELETE',19),(95,'datesplantable',2,'2015-01-22 05:23:18','CREATE',19),(96,'datesplantable',2,'2015-01-22 05:23:51','DELETE',19),(97,'datesplantable',2,'2015-01-22 05:23:51','CREATE',19),(98,'datesplantable',2,'2015-01-22 05:26:23','DELETE',20),(99,'datesrealtable',2,'2015-01-22 05:26:23','CREATE',20),(100,'datesplantable',2,'2015-01-22 05:26:28','DELETE',18),(101,'datesplantable',2,'2015-01-22 05:26:28','CREATE',18),(102,'datesplantable',2,'2015-01-22 05:26:31','DELETE',19),(103,'datesplantable',2,'2015-01-22 05:26:31','CREATE',19),(104,'datesplantable',2,'2015-01-22 05:26:43','DELETE',20),(105,'datesrealtable',2,'2015-01-22 05:26:43','CREATE',20),(106,'datesplantable',2,'2015-01-22 05:27:53','DELETE',20),(107,'datesrealtable',2,'2015-01-22 05:27:53','CREATE',20),(108,'datesplantable',2,'2015-01-22 05:27:56','DELETE',20),(109,'datesrealtable',2,'2015-01-22 05:27:56','CREATE',20),(110,'datesplantable',2,'2015-01-22 05:32:44','DELETE',20),(111,'datesrealtable',2,'2015-01-22 05:32:44','CREATE',20),(112,'datesplantable',2,'2015-01-22 05:32:47','DELETE',20),(113,'datesrealtable',2,'2015-01-22 05:32:47','CREATE',20),(114,'datesplantable',2,'2015-01-22 05:32:48','DELETE',20),(115,'datesrealtable',2,'2015-01-22 05:32:48','CREATE',20),(116,'datesplantable',2,'2015-01-22 05:32:52','DELETE',19),(117,'datesplantable',2,'2015-01-22 05:32:52','CREATE',19),(118,'program',2,'2015-01-22 05:40:45','UPDATE',3),(119,'program',2,'2015-01-22 05:41:09','UPDATE',10),(120,'datesplantable',2,'2015-01-22 05:57:23','DELETE',20),(121,'datesrealtable',2,'2015-01-22 05:57:23','CREATE',20),(122,'program',2,'2015-01-22 05:57:35','UPDATE',3),(123,'realtable',2,'2015-01-22 05:57:48','CREATE',21),(124,'datesrealtable',2,'2015-01-22 05:57:48','CREATE',21),(125,'datesrealtable',2,'2015-01-22 05:57:48','CREATE',21),(126,'datesrealtable',2,'2015-01-22 05:57:48','CREATE',21),(127,'datesplantable',2,'2015-01-22 05:58:22','DELETE',21),(128,'datesrealtable',2,'2015-01-22 05:58:22','CREATE',21),(129,'datesplantable',2,'2015-01-22 06:00:23','DELETE',21),(130,'datesplantable',2,'2015-01-22 06:00:23','DELETE',21),(131,'datesplantable',2,'2015-01-22 06:00:23','DELETE',21),(132,'datesrealtable',2,'2015-01-22 06:00:23','CREATE',21),(133,'datesrealtable',2,'2015-01-22 06:00:23','CREATE',21),(134,'datesrealtable',2,'2015-01-22 06:00:23','CREATE',21),(135,'datesplantable',2,'2015-01-22 06:00:28','DELETE',21),(136,'datesrealtable',2,'2015-01-22 06:00:28','CREATE',21),(137,'datesplantable',2,'2015-01-22 06:00:30','DELETE',21),(138,'datesrealtable',2,'2015-01-22 06:00:30','CREATE',21),(139,'datesplantable',2,'2015-01-22 06:00:34','DELETE',21),(140,'datesplantable',2,'2015-01-22 06:00:34','DELETE',21),(141,'datesplantable',2,'2015-01-22 06:00:34','DELETE',21),(142,'datesrealtable',2,'2015-01-22 06:00:34','CREATE',21),(143,'datesrealtable',2,'2015-01-22 06:00:34','CREATE',21),(144,'datesrealtable',2,'2015-01-22 06:00:34','CREATE',21),(145,'datesplantable',2,'2015-01-22 06:00:37','DELETE',21),(146,'datesplantable',2,'2015-01-22 06:00:37','DELETE',21),(147,'datesplantable',2,'2015-01-22 06:00:37','DELETE',21),(148,'datesrealtable',2,'2015-01-22 06:00:37','CREATE',21),(149,'datesrealtable',2,'2015-01-22 06:00:37','CREATE',21),(150,'datesrealtable',2,'2015-01-22 06:00:37','CREATE',21),(151,'datesplantable',2,'2015-01-22 06:02:27','DELETE',21),(152,'datesplantable',2,'2015-01-22 06:02:27','DELETE',21),(153,'datesplantable',2,'2015-01-22 06:02:27','DELETE',21),(154,'datesrealtable',2,'2015-01-22 06:02:27','CREATE',21),(155,'datesrealtable',2,'2015-01-22 06:02:27','CREATE',21),(156,'datesrealtable',2,'2015-01-22 06:02:27','CREATE',21),(157,'datesplantable',2,'2015-01-22 06:02:31','DELETE',21),(158,'datesplantable',2,'2015-01-22 06:02:31','DELETE',21),(159,'datesplantable',2,'2015-01-22 06:02:31','DELETE',21),(160,'datesrealtable',2,'2015-01-22 06:02:31','CREATE',21),(161,'datesrealtable',2,'2015-01-22 06:02:31','CREATE',21),(162,'datesrealtable',2,'2015-01-22 06:02:31','CREATE',21),(163,'datesplantable',2,'2015-01-22 06:05:32','DELETE',21),(164,'datesplantable',2,'2015-01-22 06:05:32','DELETE',21),(165,'datesplantable',2,'2015-01-22 06:05:32','DELETE',21),(166,'datesrealtable',2,'2015-01-22 06:05:32','CREATE',21),(167,'datesrealtable',2,'2015-01-22 06:05:32','CREATE',21),(168,'datesrealtable',2,'2015-01-22 06:05:32','CREATE',21),(169,'datesplantable',2,'2015-01-22 06:05:46','DELETE',21),(170,'datesplantable',2,'2015-01-22 06:05:46','DELETE',21),(171,'datesplantable',2,'2015-01-22 06:05:46','DELETE',21),(172,'datesrealtable',2,'2015-01-22 06:05:46','CREATE',21),(173,'datesrealtable',2,'2015-01-22 06:05:46','CREATE',21),(174,'datesrealtable',2,'2015-01-22 06:05:46','CREATE',21),(175,'datesplantable',2,'2015-01-22 06:05:49','DELETE',21),(176,'datesplantable',2,'2015-01-22 06:05:49','DELETE',21),(177,'datesplantable',2,'2015-01-22 06:05:49','DELETE',21),(178,'datesrealtable',2,'2015-01-22 06:05:49','CREATE',21),(179,'datesrealtable',2,'2015-01-22 06:05:49','CREATE',21),(180,'datesrealtable',2,'2015-01-22 06:05:49','CREATE',21),(181,'datesplantable',2,'2015-01-22 06:43:05','DELETE',21),(182,'datesplantable',2,'2015-01-22 06:43:05','DELETE',21),(183,'datesplantable',2,'2015-01-22 06:43:05','DELETE',21),(184,'datesrealtable',2,'2015-01-22 06:43:05','CREATE',21),(185,'datesrealtable',2,'2015-01-22 06:43:05','CREATE',21),(186,'datesrealtable',2,'2015-01-22 06:43:05','CREATE',21),(187,'datesplantable',2,'2015-01-22 06:56:29','DELETE',21),(188,'datesplantable',2,'2015-01-22 06:56:29','DELETE',21),(189,'datesplantable',2,'2015-01-22 06:56:29','DELETE',21),(190,'datesrealtable',2,'2015-01-22 06:56:29','CREATE',21),(191,'datesrealtable',2,'2015-01-22 06:56:29','CREATE',21),(192,'datesrealtable',2,'2015-01-22 06:56:29','CREATE',21),(193,'datesplantable',2,'2015-01-22 06:56:40','DELETE',21),(194,'datesplantable',2,'2015-01-22 06:56:40','DELETE',21),(195,'datesplantable',2,'2015-01-22 06:56:40','DELETE',21),(196,'datesrealtable',2,'2015-01-22 06:56:40','CREATE',21),(197,'datesrealtable',2,'2015-01-22 06:56:40','CREATE',21),(198,'datesrealtable',2,'2015-01-22 06:56:40','CREATE',21),(199,'realtable',2,'2015-01-22 06:58:32','CREATE',22),(200,'datesrealtable',2,'2015-01-22 06:58:32','CREATE',22),(201,'datesplantable',2,'2015-01-22 08:00:27','DELETE',18),(202,'datesplantable',2,'2015-01-22 08:00:27','CREATE',18),(203,'datesplantable',2,'2015-01-22 08:00:33','DELETE',18),(204,'datesplantable',2,'2015-01-22 08:00:33','CREATE',18),(205,'datesplantable',2,'2015-01-22 08:00:35','DELETE',18),(206,'datesplantable',2,'2015-01-22 08:00:35','CREATE',18),(207,'datesplantable',2,'2015-01-22 08:00:53','DELETE',18),(208,'datesplantable',2,'2015-01-22 08:00:53','CREATE',18),(209,'datesplantable',2,'2015-01-22 08:00:56','DELETE',18),(210,'datesplantable',2,'2015-01-22 08:00:56','CREATE',18),(211,'datesplantable',2,'2015-01-22 08:01:05','DELETE',18),(212,'datesplantable',2,'2015-01-22 08:01:05','CREATE',18),(213,'datesplantable',2,'2015-01-22 08:01:06','DELETE',18),(214,'datesplantable',2,'2015-01-22 08:01:06','CREATE',18),(215,'datesplantable',2,'2015-01-22 08:02:10','DELETE',18),(216,'datesplantable',2,'2015-01-22 08:02:10','CREATE',18),(217,'datesplantable',2,'2015-01-22 08:02:15','DELETE',18),(218,'datesplantable',2,'2015-01-22 08:02:15','CREATE',18),(219,'datesplantable',2,'2015-01-22 08:02:17','DELETE',18),(220,'datesplantable',2,'2015-01-22 08:02:17','CREATE',18),(221,'datesplantable',2,'2015-01-22 08:02:19','DELETE',18),(222,'datesplantable',2,'2015-01-22 08:02:19','CREATE',18),(223,'datesplantable',2,'2015-01-22 08:02:21','DELETE',18),(224,'datesplantable',2,'2015-01-22 08:02:21','CREATE',18),(225,'datesplantable',2,'2015-01-22 08:02:30','DELETE',18),(226,'datesplantable',2,'2015-01-22 08:02:30','CREATE',18),(227,'datesplantable',2,'2015-01-22 08:02:49','DELETE',18),(228,'datesplantable',2,'2015-01-22 08:02:49','CREATE',18),(229,'datesplantable',2,'2015-01-22 08:02:50','DELETE',18),(230,'datesplantable',2,'2015-01-22 08:02:50','CREATE',18),(231,'datesplantable',2,'2015-01-22 08:02:53','DELETE',18),(232,'datesplantable',2,'2015-01-22 08:02:53','CREATE',18),(233,'datesplantable',2,'2015-01-22 08:02:54','DELETE',18),(234,'datesplantable',2,'2015-01-22 08:02:54','CREATE',18),(235,'datesplantable',2,'2015-01-22 08:02:57','DELETE',18),(236,'datesplantable',2,'2015-01-22 08:02:57','CREATE',18),(237,'datesplantable',2,'2015-01-22 08:02:58','DELETE',18),(238,'datesplantable',2,'2015-01-22 08:02:58','CREATE',18),(239,'datesplantable',2,'2015-01-22 08:02:59','DELETE',18),(240,'datesplantable',2,'2015-01-22 08:02:59','CREATE',18),(241,'datesplantable',2,'2015-01-22 08:03:01','DELETE',18),(242,'datesplantable',2,'2015-01-22 08:03:01','CREATE',18),(243,'datesplantable',2,'2015-01-22 08:03:03','DELETE',18),(244,'datesplantable',2,'2015-01-22 08:03:03','CREATE',18),(245,'datesplantable',2,'2015-01-22 08:03:22','DELETE',21),(246,'datesplantable',2,'2015-01-22 08:03:22','DELETE',21),(247,'datesplantable',2,'2015-01-22 08:03:22','DELETE',21),(248,'datesrealtable',2,'2015-01-22 08:03:22','CREATE',21),(249,'datesrealtable',2,'2015-01-22 08:03:22','CREATE',21),(250,'datesrealtable',2,'2015-01-22 08:03:22','CREATE',21),(251,'datesplantable',2,'2015-01-22 12:09:56','CREATE',19),(252,'datesplantable',2,'2015-03-12 15:08:23','DELETE',19),(253,'datesplantable',2,'2015-03-12 15:08:23','CREATE',19),(254,'datesplantable',2,'2015-03-12 15:08:28','DELETE',19),(255,'datesplantable',2,'2015-03-12 15:08:28','CREATE',19),(256,'datesplantable',2,'2015-03-12 15:08:40','DELETE',19),(257,'datesplantable',2,'2015-03-12 15:08:40','CREATE',19),(258,'datesplantable',2,'2015-03-12 15:09:58','DELETE',19),(259,'datesplantable',2,'2015-03-12 15:09:58','CREATE',19),(260,'realtable',2,'2015-03-12 15:11:09','CREATE',23),(261,'datesrealtable',2,'2015-03-12 15:11:09','CREATE',23),(262,'datesrealtable',2,'2015-03-12 15:11:09','CREATE',23),(263,'datesrealtable',2,'2015-03-12 15:11:09','CREATE',23),(264,'datesplantable',2,'2015-03-12 15:12:25','DELETE',23),(265,'datesplantable',2,'2015-03-12 15:12:25','DELETE',23),(266,'datesplantable',2,'2015-03-12 15:12:25','DELETE',23),(267,'datesrealtable',2,'2015-03-12 15:12:25','CREATE',23),(268,'datesrealtable',2,'2015-03-12 15:12:25','CREATE',23),(269,'datesrealtable',2,'2015-03-12 15:12:25','CREATE',23),(270,'datesplantable',2,'2015-03-12 15:12:40','DELETE',23),(271,'datesplantable',2,'2015-03-12 15:12:40','DELETE',23),(272,'datesplantable',2,'2015-03-12 15:12:40','DELETE',23),(273,'datesrealtable',2,'2015-03-12 15:12:40','CREATE',23),(274,'datesrealtable',2,'2015-03-12 15:12:40','CREATE',23),(275,'datesrealtable',2,'2015-03-12 15:12:40','CREATE',23),(276,'datesplantable',2,'2015-03-12 15:34:59','DELETE',19),(277,'datesplantable',2,'2015-03-12 15:34:59','CREATE',19),(278,'datesplantable',2,'2015-03-12 15:35:07','DELETE',19),(279,'datesplantable',2,'2015-03-12 15:35:07','CREATE',19),(280,'datesplantable',2,'2015-03-12 15:35:10','DELETE',19),(281,'datesplantable',2,'2015-03-12 15:35:10','CREATE',19),(282,'datesplantable',2,'2015-03-12 15:35:11','DELETE',19),(283,'datesplantable',2,'2015-03-12 15:35:11','CREATE',19),(284,'datesplantable',2,'2015-03-12 15:35:12','DELETE',19),(285,'datesplantable',2,'2015-03-12 15:35:12','CREATE',19),(286,'datesplantable',2,'2015-03-12 15:36:09','DELETE',19),(287,'datesplantable',2,'2015-03-12 15:36:09','CREATE',19),(288,'datesplantable',2,'2015-03-12 15:36:29','DELETE',21),(289,'datesrealtable',2,'2015-03-12 15:36:29','CREATE',21),(290,'datesplantable',2,'2015-03-12 15:36:38','DELETE',21),(291,'datesrealtable',2,'2015-03-12 15:36:38','CREATE',21),(292,'realtable',2,'2015-03-12 15:38:10','CREATE',24),(293,'datesrealtable',2,'2015-03-12 15:38:10','CREATE',24),(294,'realtable',2,'2014-12-28 16:16:15','CREATE',25),(295,'datesrealtable',2,'2014-12-28 16:16:15','CREATE',25),(296,'datesrealtable',2,'2014-12-28 16:16:15','CREATE',25),(297,'datesrealtable',2,'2014-12-28 16:16:15','CREATE',25),(298,'datesplantable',2,'2014-12-28 16:16:35','DELETE',25),(299,'datesplantable',2,'2014-12-28 16:16:35','DELETE',25),(300,'datesrealtable',2,'2014-12-28 16:16:35','CREATE',25),(301,'datesrealtable',2,'2014-12-28 16:16:35','CREATE',25),(302,'datesplantable',2,'2014-12-28 16:16:42','DELETE',25),(303,'datesrealtable',2,'2014-12-28 16:16:42','CREATE',25),(304,'datesplantable',2,'2014-12-28 16:17:34','DELETE',25),(305,'datesrealtable',2,'2014-12-28 16:17:34','CREATE',25),(306,'datesplantable',2,'2014-12-28 16:17:37','DELETE',25),(307,'datesrealtable',2,'2014-12-28 16:17:37','CREATE',25),(308,'datesplantable',2,'2014-12-28 16:17:57','DELETE',25),(309,'datesrealtable',2,'2014-12-28 16:17:57','CREATE',25),(310,'datesplantable',2,'2014-12-28 16:18:01','DELETE',25),(311,'datesrealtable',2,'2014-12-28 16:18:01','CREATE',25),(312,'realtable',2,'2014-12-28 16:18:23','CREATE',26),(313,'datesrealtable',2,'2014-12-28 16:18:23','CREATE',26),(314,'plantable',2,'2014-12-28 17:31:01','CREATE',20),(315,'datesplantable',2,'2014-12-28 17:31:01','CREATE',20),(316,'datesplantable',2,'2014-12-28 17:31:01','CREATE',20),(317,'datesplantable',2,'2014-12-28 17:31:01','CREATE',20),(318,'plantable',2,'2014-12-28 17:32:53','CREATE',21),(319,'datesplantable',2,'2014-12-28 17:32:53','CREATE',21),(320,'datesplantable',2,'2014-12-28 17:32:53','CREATE',21),(321,'datesplantable',2,'2014-12-28 17:32:53','CREATE',21),(322,'realtable',2,'2014-12-28 17:38:55','CREATE',27),(323,'datesrealtable',2,'2014-12-28 17:38:55','CREATE',27),(324,'datesrealtable',2,'2014-12-28 17:38:55','CREATE',27),(325,'datesrealtable',2,'2014-12-28 17:38:55','CREATE',27),(326,'plantable',2,'2014-12-28 17:39:08','CREATE',22),(327,'datesplantable',2,'2014-12-28 17:39:08','CREATE',22),(328,'datesplantable',2,'2014-12-28 17:39:08','CREATE',22),(329,'datesplantable',2,'2014-12-28 17:39:08','CREATE',22),(330,'realtable',2,'2014-12-28 17:41:01','CREATE',28),(331,'datesrealtable',2,'2014-12-28 17:41:01','CREATE',28),(332,'datesrealtable',2,'2014-12-28 17:41:01','CREATE',28),(333,'datesrealtable',2,'2014-12-28 17:41:01','CREATE',28),(334,'plantable',2,'2014-12-28 17:41:15','CREATE',23),(335,'datesplantable',2,'2014-12-28 17:41:15','CREATE',23),(336,'datesplantable',2,'2014-12-28 17:41:15','CREATE',23),(337,'datesplantable',2,'2014-12-28 17:41:15','CREATE',23),(338,'realtable',2,'2014-12-28 17:41:32','CREATE',29),(339,'datesrealtable',2,'2014-12-28 17:41:32','CREATE',29),(340,'datesrealtable',2,'2014-12-28 17:41:32','CREATE',29),(341,'datesrealtable',2,'2014-12-28 17:41:32','CREATE',29),(342,'plantable',2,'2014-12-28 17:41:42','CREATE',24),(343,'datesplantable',2,'2014-12-28 17:41:42','CREATE',24),(344,'datesplantable',2,'2014-12-28 17:41:42','CREATE',24),(345,'datesplantable',2,'2014-12-28 17:41:42','CREATE',24),(346,'realtable',2,'2014-12-28 17:45:35','CREATE',30),(347,'datesrealtable',2,'2014-12-28 17:45:35','CREATE',30),(348,'datesrealtable',2,'2014-12-28 17:45:35','CREATE',30),(349,'datesrealtable',2,'2014-12-28 17:45:35','CREATE',30),(350,'plantable',2,'2014-12-28 17:45:44','CREATE',25),(351,'datesplantable',2,'2014-12-28 17:45:44','CREATE',25),(352,'datesplantable',2,'2014-12-28 17:45:44','CREATE',25),(353,'datesplantable',2,'2014-12-28 17:45:44','CREATE',25),(354,'plantable',2,'2014-12-28 17:47:43','CREATE',26),(355,'datesplantable',2,'2014-12-28 17:47:43','CREATE',26),(356,'datesplantable',2,'2014-12-28 17:47:43','CREATE',26),(357,'datesplantable',2,'2014-12-28 17:47:43','CREATE',26),(358,'realtable',2,'2014-12-28 17:47:58','CREATE',31),(359,'datesrealtable',2,'2014-12-28 17:47:58','CREATE',31),(360,'datesrealtable',2,'2014-12-28 17:47:58','CREATE',31),(361,'datesrealtable',2,'2014-12-28 17:47:58','CREATE',31),(362,'plantable',2,'2014-12-28 17:51:06','CREATE',27),(363,'datesplantable',2,'2014-12-28 17:51:06','CREATE',27),(364,'datesplantable',2,'2014-12-28 17:51:06','CREATE',27),(365,'datesplantable',2,'2014-12-28 17:51:06','CREATE',27),(366,'realtable',2,'2014-12-28 17:51:18','CREATE',32),(367,'datesrealtable',2,'2014-12-28 17:51:18','CREATE',32),(368,'datesrealtable',2,'2014-12-28 17:51:18','CREATE',32),(369,'datesrealtable',2,'2014-12-28 17:51:18','CREATE',32),(370,'plantable',2,'2014-12-28 17:51:31','CREATE',28),(371,'datesplantable',2,'2014-12-28 17:51:31','CREATE',28),(372,'datesplantable',2,'2014-12-28 17:51:31','CREATE',28),(373,'datesplantable',2,'2014-12-28 17:51:31','CREATE',28),(374,'realtable',2,'2014-12-28 17:53:10','CREATE',33),(375,'datesrealtable',2,'2014-12-28 17:53:10','CREATE',33),(376,'datesrealtable',2,'2014-12-28 17:53:10','CREATE',33),(377,'datesrealtable',2,'2014-12-28 17:53:10','CREATE',33),(378,'realtable',2,'2014-12-28 17:53:15','CREATE',34),(379,'datesrealtable',2,'2014-12-28 17:53:15','CREATE',34),(380,'datesrealtable',2,'2014-12-28 17:53:15','CREATE',34),(381,'datesrealtable',2,'2014-12-28 17:53:15','CREATE',34),(382,'datesplantable',2,'2014-12-28 17:53:39','DELETE',24),(383,'datesplantable',2,'2014-12-28 17:53:39','CREATE',24),(384,'datesplantable',2,'2014-12-28 17:53:42','DELETE',24),(385,'datesplantable',2,'2014-12-28 17:53:42','CREATE',24),(386,'realtable',2,'2014-12-28 17:57:14','CREATE',35),(387,'datesrealtable',2,'2014-12-28 17:57:14','CREATE',35),(388,'datesrealtable',2,'2014-12-28 17:57:14','CREATE',35),(389,'datesrealtable',2,'2014-12-28 17:57:14','CREATE',35),(390,'plantable',2,'2014-12-28 17:57:24','CREATE',29),(391,'datesplantable',2,'2014-12-28 17:57:24','CREATE',29),(392,'datesplantable',2,'2014-12-28 17:57:24','CREATE',29),(393,'datesplantable',2,'2014-12-28 17:57:24','CREATE',29),(394,'plantable',2,'2014-12-28 17:57:39','CREATE',30),(395,'datesplantable',2,'2014-12-28 17:57:39','CREATE',30),(396,'realtable',2,'2014-12-28 17:58:01','CREATE',36),(397,'datesrealtable',2,'2014-12-28 17:58:01','CREATE',36),(398,'realtable',2,'2014-12-28 17:58:11','CREATE',37),(399,'datesrealtable',2,'2014-12-28 17:58:11','CREATE',37),(400,'program',2,'2014-12-28 17:59:28','UPDATE',10),(401,'realtable',2,'2014-12-28 18:24:26','CREATE',38),(402,'datesrealtable',2,'2014-12-28 18:24:26','CREATE',38),(403,'datesrealtable',2,'2014-12-28 18:24:26','CREATE',38),(404,'datesrealtable',2,'2014-12-28 18:24:26','CREATE',38),(405,'datesplantable',2,'2014-12-28 18:24:40','DELETE',29),(406,'datesplantable',2,'2014-12-28 18:24:40','DELETE',29),(407,'datesplantable',2,'2014-12-28 18:24:40','CREATE',29),(408,'datesplantable',2,'2014-12-28 18:24:40','CREATE',29),(409,'datesplantable',2,'2014-12-28 18:24:43','DELETE',29),(410,'datesplantable',2,'2014-12-28 18:24:43','CREATE',29),(411,'datesplantable',2,'2014-12-28 18:24:45','DELETE',29),(412,'datesplantable',2,'2014-12-28 18:24:45','CREATE',29),(413,'datesplantable',2,'2014-12-28 18:24:49','DELETE',29),(414,'datesplantable',2,'2014-12-28 18:24:49','DELETE',29),(415,'datesplantable',2,'2014-12-28 18:24:49','CREATE',29),(416,'datesplantable',2,'2014-12-28 18:24:49','CREATE',29),(417,'datesplantable',2,'2014-12-28 18:26:22','DELETE',29),(418,'datesplantable',2,'2014-12-28 18:26:22','CREATE',29),(419,'datesplantable',2,'2014-12-28 18:26:25','DELETE',29),(420,'datesplantable',2,'2014-12-28 18:26:25','CREATE',29),(421,'datesplantable',2,'2014-12-28 18:26:27','DELETE',29),(422,'datesplantable',2,'2014-12-28 18:26:27','CREATE',29),(423,'datesplantable',2,'2014-12-28 18:26:28','DELETE',29),(424,'datesplantable',2,'2014-12-28 18:26:28','CREATE',29),(425,'datesplantable',2,'2014-12-28 18:26:30','DELETE',29),(426,'datesplantable',2,'2014-12-28 18:26:30','CREATE',29),(427,'datesplantable',2,'2014-12-28 18:26:31','DELETE',29),(428,'datesplantable',2,'2014-12-28 18:26:31','CREATE',29),(429,'datesplantable',2,'2014-12-28 18:26:48','DELETE',37),(430,'datesrealtable',2,'2014-12-28 18:26:48','CREATE',37),(431,'datesplantable',2,'2014-12-28 18:31:29','DELETE',29),(432,'datesplantable',2,'2014-12-28 18:31:29','CREATE',29),(433,'datesplantable',2,'2014-12-28 18:31:33','DELETE',29),(434,'datesplantable',2,'2014-12-28 18:31:33','CREATE',29),(435,'datesplantable',2,'2014-12-28 18:31:35','DELETE',29),(436,'datesplantable',2,'2014-12-28 18:31:35','CREATE',29),(437,'datesplantable',2,'2014-12-28 18:31:38','DELETE',30),(438,'datesplantable',2,'2014-12-28 18:31:38','CREATE',30),(439,'datesplantable',2,'2014-12-28 18:31:39','DELETE',30),(440,'datesplantable',2,'2014-12-28 18:31:39','CREATE',30),(441,'datesplantable',2,'2014-12-28 18:31:41','DELETE',30),(442,'datesplantable',2,'2014-12-28 18:31:41','CREATE',30),(443,'datesplantable',2,'2014-12-28 18:33:44','DELETE',29),(444,'datesplantable',2,'2014-12-28 18:33:44','CREATE',29),(445,'datesplantable',2,'2014-12-28 18:33:46','DELETE',29),(446,'datesplantable',2,'2014-12-28 18:33:46','CREATE',29),(447,'program',2,'2014-12-28 18:39:44','UPDATE',10),(448,'datesplantable',2,'2014-12-28 18:53:12','DELETE',37),(449,'datesrealtable',2,'2014-12-28 18:53:12','CREATE',37),(450,'datesplantable',2,'2014-12-28 18:53:19','DELETE',37),(451,'datesrealtable',2,'2014-12-28 18:53:20','CREATE',37),(452,'datesplantable',2,'2014-12-28 18:53:21','DELETE',37),(453,'datesrealtable',2,'2014-12-28 18:53:21','CREATE',37),(454,'datesplantable',2,'2014-12-28 18:55:58','DELETE',29),(455,'datesplantable',2,'2014-12-28 18:55:58','DELETE',29),(456,'datesplantable',2,'2014-12-28 18:55:58','DELETE',29),(457,'datesplantable',2,'2014-12-28 18:55:58','CREATE',29),(458,'datesplantable',2,'2014-12-28 18:55:58','CREATE',29),(459,'datesplantable',2,'2014-12-28 18:55:58','CREATE',29),(460,'datesplantable',2,'2014-12-28 18:56:00','DELETE',29),(461,'datesplantable',2,'2014-12-28 18:56:00','CREATE',29),(462,'datesplantable',2,'2014-12-28 19:05:27','DELETE',30),(463,'datesplantable',2,'2014-12-28 19:05:27','CREATE',30),(464,'datesplantable',2,'2014-12-28 19:05:28','DELETE',30),(465,'datesplantable',2,'2014-12-28 19:05:28','CREATE',30),(466,'datesplantable',2,'2014-12-28 19:05:30','DELETE',30),(467,'datesplantable',2,'2014-12-28 19:05:30','CREATE',30),(468,'datesplantable',2,'2014-12-28 19:05:32','DELETE',30),(469,'datesplantable',2,'2014-12-28 19:05:32','CREATE',30),(470,'datesplantable',2,'2014-12-28 19:05:33','DELETE',30),(471,'datesplantable',2,'2014-12-28 19:05:33','CREATE',30),(472,'datesplantable',2,'2014-12-28 19:05:34','DELETE',30),(473,'datesplantable',2,'2014-12-28 19:05:34','CREATE',30),(474,'datesplantable',2,'2014-12-28 19:05:40','DELETE',29),(475,'datesplantable',2,'2014-12-28 19:05:40','DELETE',29),(476,'datesplantable',2,'2014-12-28 19:05:40','CREATE',29),(477,'datesplantable',2,'2014-12-28 19:05:40','CREATE',29),(478,'datesplantable',2,'2014-12-28 19:05:43','DELETE',29),(479,'datesplantable',2,'2014-12-28 19:05:43','DELETE',29),(480,'datesplantable',2,'2014-12-28 19:05:43','CREATE',29),(481,'datesplantable',2,'2014-12-28 19:05:43','CREATE',29),(482,'datesplantable',2,'2014-12-28 19:05:45','DELETE',29),(483,'datesplantable',2,'2014-12-28 19:05:45','DELETE',29),(484,'datesplantable',2,'2014-12-28 19:05:45','CREATE',29),(485,'datesplantable',2,'2014-12-28 19:05:45','CREATE',29),(486,'datesplantable',2,'2014-12-28 19:05:55','DELETE',29),(487,'datesplantable',2,'2014-12-28 19:05:55','CREATE',29),(488,'datesplantable',2,'2014-12-28 19:05:57','DELETE',29),(489,'datesplantable',2,'2014-12-28 19:05:57','CREATE',29),(490,'realtable',2,'2014-12-28 19:07:58','CREATE',39),(491,'datesrealtable',2,'2014-12-28 19:07:59','CREATE',39),(492,'datesrealtable',2,'2014-12-28 19:07:59','CREATE',39),(493,'realtable',2,'2014-12-28 19:09:37','CREATE',40),(494,'datesrealtable',2,'2014-12-28 19:09:37','CREATE',40),(495,'realtable',2,'2014-12-28 19:10:50','CREATE',41),(496,'datesrealtable',2,'2014-12-28 19:10:51','CREATE',41),(497,'realtable',2,'2014-12-28 19:14:56','CREATE',42),(498,'datesrealtable',2,'2014-12-28 19:14:56','CREATE',42),(499,'realtable',2,'2014-12-28 19:17:55','CREATE',43),(500,'realtable',2,'2014-12-28 19:19:44','CREATE',44),(501,'datesrealtable',2,'2014-12-28 19:19:48','CREATE',44),(502,'realtable',2,'2014-12-28 19:22:05','CREATE',45),(503,'datesrealtable',2,'2014-12-28 19:22:05','CREATE',45),(504,'datesrealtable',2,'2014-12-28 19:22:05','CREATE',45),(505,'datesrealtable',2,'2014-12-28 19:22:05','CREATE',45),(506,'realtable',2,'2014-12-28 19:38:41','CREATE',46),(507,'datesrealtable',2,'2014-12-28 19:38:42','CREATE',46),(508,'datesrealtable',2,'2014-12-28 19:38:42','CREATE',46),(509,'datesrealtable',2,'2014-12-28 19:38:42','CREATE',46),(510,'realtable',2,'2014-12-28 19:47:26','UPDATE',46),(511,'realtable',2,'2014-12-28 19:48:17','UPDATE',46),(512,'realtable',2,'2014-12-28 19:58:13','UPDATE',46),(513,'realtable',2,'2014-12-28 20:02:20','UPDATE',46),(514,'datesplantable',2,'2014-12-28 21:00:45','DELETE',46),(515,'datesplantable',2,'2014-12-28 21:00:45','DELETE',46),(516,'datesplantable',2,'2014-12-28 21:00:45','DELETE',46),(517,'datesrealtable',2,'2014-12-28 21:00:45','CREATE',46),(518,'datesrealtable',2,'2014-12-28 21:00:45','CREATE',46),(519,'datesplantable',2,'2014-12-28 21:01:21','DELETE',46),(520,'datesplantable',2,'2014-12-28 21:01:21','DELETE',46),(521,'datesrealtable',2,'2014-12-28 21:01:21','CREATE',46),(522,'datesrealtable',2,'2014-12-28 21:01:21','CREATE',46),(523,'datesplantable',2,'2014-12-28 21:01:26','DELETE',46),(524,'datesrealtable',2,'2014-12-28 21:01:26','CREATE',46),(525,'datesplantable',2,'2014-12-28 21:01:29','DELETE',46),(526,'datesrealtable',2,'2014-12-28 21:01:29','CREATE',46),(527,'realtable',2,'2014-12-28 21:02:25','CREATE',47),(528,'datesrealtable',2,'2014-12-28 21:02:25','CREATE',47),(529,'realtable',2,'2014-12-28 21:03:40','CREATE',48),(530,'datesrealtable',2,'2014-12-28 21:03:40','CREATE',48),(531,'datesrealtable',2,'2014-12-28 21:03:40','CREATE',48),(532,'datesrealtable',2,'2014-12-28 21:03:40','CREATE',48),(533,'plantable',2,'2014-12-28 21:06:49','CREATE',31),(534,'datesplantable',2,'2014-12-28 21:06:49','CREATE',31),(535,'datesplantable',2,'2014-12-28 21:06:49','CREATE',31),(536,'datesplantable',2,'2014-12-28 21:06:49','CREATE',31),(537,'plantable',2,'2014-12-28 21:24:27','UPDATE',31),(538,'plantable',2,'2014-12-28 21:24:43','UPDATE',31),(539,'plantable',2,'2014-12-28 21:29:39','DELETE',31),(540,'realtable',2,'2014-12-28 22:02:36','DELETE',48),(541,'realtable',2,'2014-12-28 22:03:35','DELETE',47),(542,'plantable',2,'2014-12-28 22:04:21','CREATE',32),(543,'datesplantable',2,'2014-12-28 22:04:21','CREATE',32),(544,'datesplantable',2,'2014-12-28 22:04:21','CREATE',32),(545,'datesplantable',2,'2014-12-28 22:04:21','CREATE',32),(546,'datesplantable',2,'2014-12-28 22:04:30','DELETE',32),(547,'datesplantable',2,'2014-12-28 22:04:30','DELETE',32),(548,'datesplantable',2,'2014-12-28 22:04:30','DELETE',32),(549,'datesplantable',2,'2014-12-28 22:04:30','CREATE',32),(550,'datesplantable',2,'2014-12-28 22:04:30','CREATE',32),(551,'datesplantable',2,'2014-12-28 22:04:30','CREATE',32),(552,'datesplantable',2,'2014-12-28 22:04:34','DELETE',32),(553,'datesplantable',2,'2014-12-28 22:04:34','CREATE',32),(554,'datesplantable',2,'2014-12-28 22:04:38','DELETE',32),(555,'datesplantable',2,'2014-12-28 22:04:38','CREATE',32),(556,'datesplantable',2,'2014-12-28 22:04:50','DELETE',32),(557,'datesplantable',2,'2014-12-28 22:04:50','CREATE',32),(558,'plantable',2,'2014-12-28 22:05:12','UPDATE',32),(559,'realtable',2,'2014-12-28 22:15:09','CREATE',49),(560,'datesrealtable',2,'2014-12-28 22:15:09','CREATE',49),(561,'datesrealtable',2,'2014-12-28 22:15:09','CREATE',49),(562,'datesrealtable',2,'2014-12-28 22:15:09','CREATE',49),(563,'realtable',2,'2014-12-28 22:16:43','CREATE',50),(564,'datesrealtable',2,'2014-12-28 22:16:43','CREATE',50),(565,'datesrealtable',2,'2014-12-28 22:16:43','CREATE',50),(566,'datesrealtable',2,'2014-12-28 22:16:43','CREATE',50),(567,'realtable',2,'2014-12-28 22:18:27','CREATE',51),(568,'datesrealtable',2,'2014-12-28 22:18:27','CREATE',51),(569,'datesrealtable',2,'2014-12-28 22:18:27','CREATE',51),(570,'datesrealtable',2,'2014-12-28 22:18:27','CREATE',51),(571,'realtable',2,'2014-12-29 05:45:23','CREATE',52),(572,'datesrealtable',2,'2014-12-29 05:45:23','CREATE',52),(573,'plantable',2,'2014-12-29 05:45:36','CREATE',33),(574,'datesplantable',2,'2014-12-29 05:45:36','CREATE',33),(575,'datesplantable',2,'2014-12-29 05:45:46','DELETE',33),(576,'datesplantable',2,'2014-12-29 05:45:46','CREATE',33),(577,'datesplantable',2,'2014-12-29 05:45:50','DELETE',33),(578,'datesplantable',2,'2014-12-29 05:45:50','CREATE',33),(579,'datesplantable',2,'2014-12-29 05:45:53','DELETE',33),(580,'datesplantable',2,'2014-12-29 05:45:53','CREATE',33),(581,'datesplantable',2,'2014-12-29 05:45:54','DELETE',33),(582,'datesplantable',2,'2014-12-29 05:45:54','CREATE',33),(583,'datesplantable',2,'2014-12-29 05:45:57','DELETE',33),(584,'datesplantable',2,'2014-12-29 05:45:57','CREATE',33),(585,'datesplantable',2,'2014-12-29 05:46:07','DELETE',33),(586,'datesplantable',2,'2014-12-29 05:46:07','CREATE',33),(587,'datesplantable',2,'2014-12-29 05:46:10','DELETE',33),(588,'datesplantable',2,'2014-12-29 05:46:10','CREATE',33),(589,'realtable',2,'2014-12-29 05:58:20','CREATE',53),(590,'datesrealtable',2,'2014-12-29 05:58:21','CREATE',53),(591,'datesrealtable',2,'2014-12-29 05:58:21','CREATE',53),(592,'datesrealtable',2,'2014-12-29 05:58:21','CREATE',53),(593,'realtable',2,'2014-12-29 05:58:26','DELETE',53),(594,'realtable',2,'2014-12-29 06:00:21','UPDATE',49),(595,'realtable',2,'2014-12-29 06:03:39','UPDATE',49),(596,'plantable',2,'2014-12-29 06:04:51','DELETE',32),(597,'datesplantable',2,'2014-12-29 06:06:12','DELETE',33),(598,'datesplantable',2,'2014-12-29 06:06:12','CREATE',33),(599,'datesplantable',2,'2014-12-29 06:06:15','DELETE',33),(600,'datesplantable',2,'2014-12-29 06:06:15','CREATE',33),(601,'datesplantable',2,'2014-12-29 06:06:16','DELETE',33),(602,'datesplantable',2,'2014-12-29 06:06:16','CREATE',33),(603,'datesplantable',2,'2014-12-29 06:06:17','DELETE',33),(604,'datesplantable',2,'2014-12-29 06:06:17','CREATE',33),(605,'datesplantable',2,'2014-12-29 06:06:19','DELETE',33),(606,'datesplantable',2,'2014-12-29 06:06:19','CREATE',33),(607,'datesplantable',2,'2014-12-29 06:06:20','DELETE',33),(608,'datesplantable',2,'2014-12-29 06:06:20','CREATE',33),(609,'datesplantable',2,'2014-12-29 06:06:23','DELETE',33),(610,'datesplantable',2,'2014-12-29 06:06:23','CREATE',33),(611,'datesplantable',2,'2014-12-29 06:06:24','DELETE',33),(612,'datesplantable',2,'2014-12-29 06:06:24','CREATE',33),(613,'datesplantable',2,'2014-12-29 06:06:25','DELETE',33),(614,'datesplantable',2,'2014-12-29 06:06:25','CREATE',33),(615,'datesplantable',2,'2014-12-29 06:06:27','DELETE',33),(616,'datesplantable',2,'2014-12-29 06:06:27','CREATE',33),(617,'programplan',2,'2014-12-29 08:21:04','CREATE',3),(618,'realtable',2,'2014-12-29 08:22:11','CREATE',54),(619,'datesrealtable',2,'2014-12-29 08:22:11','CREATE',54),(620,'datesrealtable',2,'2014-12-29 08:22:11','CREATE',54),(621,'datesrealtable',2,'2014-12-29 08:22:11','CREATE',54),(622,'realtable',2,'2014-12-29 08:29:45','DELETE',54),(623,'realtable',2,'2014-12-29 08:29:51','DELETE',51),(624,'realtable',2,'2014-12-29 08:29:54','DELETE',49),(625,'realtable',2,'2014-12-29 08:30:08','CREATE',55),(626,'datesrealtable',2,'2014-12-29 08:30:08','CREATE',55),(627,'datesrealtable',2,'2014-12-29 08:30:08','CREATE',55),(628,'datesrealtable',2,'2014-12-29 08:30:08','CREATE',55),(629,'realtable',2,'2014-12-29 08:30:16','DELETE',55),(630,'realtable',2,'2014-12-29 08:30:28','CREATE',56),(631,'datesrealtable',2,'2014-12-29 08:30:28','CREATE',56),(632,'datesrealtable',2,'2014-12-29 08:30:28','CREATE',56),(633,'datesrealtable',2,'2014-12-29 08:30:28','CREATE',56),(634,'realtable',2,'2014-12-29 08:32:51','DELETE',56),(635,'realtable',2,'2014-12-29 08:35:30','CREATE',57),(636,'datesrealtable',2,'2014-12-29 08:35:30','CREATE',57),(637,'datesrealtable',2,'2014-12-29 08:35:30','CREATE',57),(638,'datesrealtable',2,'2014-12-29 08:35:30','CREATE',57),(639,'realtable',2,'2014-12-29 08:35:59','CREATE',58),(640,'datesrealtable',2,'2014-12-29 08:35:59','CREATE',58),(641,'datesrealtable',2,'2014-12-29 08:35:59','CREATE',58),(642,'datesrealtable',2,'2014-12-29 08:35:59','CREATE',58),(643,'realtable',2,'2014-12-29 08:36:12','DELETE',58),(644,'realtable',2,'2014-12-29 08:36:32','CREATE',59),(645,'datesrealtable',2,'2014-12-29 08:36:32','CREATE',59),(646,'datesrealtable',2,'2014-12-29 08:36:32','CREATE',59),(647,'datesrealtable',2,'2014-12-29 08:36:32','CREATE',59),(648,'realtable',2,'2014-12-29 08:36:38','DELETE',59),(649,'realtable',2,'2014-12-29 08:36:46','DELETE',57),(650,'realtable',2,'2014-12-29 08:43:56','CREATE',60),(651,'datesrealtable',2,'2014-12-29 08:43:56','CREATE',60),(652,'datesrealtable',2,'2014-12-29 08:43:56','CREATE',60),(653,'datesrealtable',2,'2014-12-29 08:43:56','CREATE',60),(654,'realtable',2,'2014-12-29 08:46:16','DELETE',60),(655,'realtable',2,'2014-12-29 08:46:41','CREATE',61),(656,'datesrealtable',2,'2014-12-29 08:46:41','CREATE',61),(657,'datesrealtable',2,'2014-12-29 08:46:41','CREATE',61),(658,'datesrealtable',2,'2014-12-29 08:46:41','CREATE',61),(659,'realtable',2,'2014-12-29 08:50:39','CREATE',62),(660,'datesrealtable',2,'2014-12-29 08:50:39','CREATE',62),(661,'datesrealtable',2,'2014-12-29 08:50:39','CREATE',62),(662,'datesrealtable',2,'2014-12-29 08:50:39','CREATE',62),(663,'realtable',2,'2014-12-29 08:50:48','CREATE',63),(664,'datesrealtable',2,'2014-12-29 08:50:48','CREATE',63),(665,'datesrealtable',2,'2014-12-29 08:50:48','CREATE',63),(666,'datesrealtable',2,'2014-12-29 08:50:48','CREATE',63),(667,'realtable',2,'2014-12-29 08:50:57','CREATE',64),(668,'datesrealtable',2,'2014-12-29 08:50:58','CREATE',64),(669,'datesrealtable',2,'2014-12-29 08:50:58','CREATE',64),(670,'datesrealtable',2,'2014-12-29 08:50:58','CREATE',64),(671,'realtable',2,'2014-12-29 08:51:18','DELETE',64),(672,'realtable',2,'2014-12-29 08:51:26','CREATE',65),(673,'datesrealtable',2,'2014-12-29 08:51:26','CREATE',65),(674,'datesrealtable',2,'2014-12-29 08:51:26','CREATE',65),(675,'datesrealtable',2,'2014-12-29 08:51:26','CREATE',65),(676,'realtable',2,'2014-12-29 08:51:36','DELETE',65),(677,'realtable',2,'2014-12-29 08:51:37','DELETE',63),(678,'realtable',2,'2014-12-29 08:51:39','DELETE',62),(679,'realtable',2,'2014-12-29 08:51:41','DELETE',50),(680,'realtable',2,'2014-12-29 08:51:44','DELETE',52),(681,'plantable',2,'2014-12-29 08:51:46','DELETE',33),(682,'realtable',2,'2014-12-29 08:51:51','DELETE',45),(683,'realtable',2,'2014-12-29 08:54:47','DELETE',61),(684,'realtable',2,'2014-12-29 08:55:26','CREATE',66),(685,'datesrealtable',2,'2014-12-29 08:55:26','CREATE',66),(686,'datesrealtable',2,'2014-12-29 08:55:26','CREATE',66),(687,'datesrealtable',2,'2014-12-29 08:55:26','CREATE',66),(688,'realtable',2,'2014-12-29 08:55:38','CREATE',67),(689,'datesrealtable',2,'2014-12-29 08:55:38','CREATE',67),(690,'datesrealtable',2,'2014-12-29 08:55:38','CREATE',67),(691,'datesrealtable',2,'2014-12-29 08:55:38','CREATE',67),(692,'realtable',2,'2014-12-29 08:56:46','CREATE',68),(693,'datesrealtable',2,'2014-12-29 08:56:47','CREATE',68),(694,'datesrealtable',2,'2014-12-29 08:56:47','CREATE',68),(695,'datesrealtable',2,'2014-12-29 08:56:47','CREATE',68),(696,'realtable',2,'2014-12-29 08:56:55','CREATE',69),(697,'datesrealtable',2,'2014-12-29 08:56:55','CREATE',69),(698,'datesrealtable',2,'2014-12-29 08:56:55','CREATE',69),(699,'datesrealtable',2,'2014-12-29 08:56:55','CREATE',69),(700,'realtable',2,'2014-12-29 08:57:04','CREATE',70),(701,'datesrealtable',2,'2014-12-29 08:57:04','CREATE',70),(702,'datesrealtable',2,'2014-12-29 08:57:04','CREATE',70),(703,'datesrealtable',2,'2014-12-29 08:57:04','CREATE',70),(704,'realtable',2,'2014-12-29 08:57:11','CREATE',71),(705,'datesrealtable',2,'2014-12-29 08:57:12','CREATE',71),(706,'datesrealtable',2,'2014-12-29 08:57:12','CREATE',71),(707,'datesrealtable',2,'2014-12-29 08:57:12','CREATE',71),(708,'realtable',2,'2014-12-29 08:59:38','DELETE',71),(709,'realtable',2,'2014-12-29 08:59:52','DELETE',69),(710,'realtable',2,'2014-12-29 09:00:02','DELETE',70),(711,'realtable',2,'2014-12-29 09:00:17','DELETE',66),(712,'realtable',2,'2014-12-29 09:00:20','DELETE',68),(713,'realtable',2,'2014-12-29 09:01:14','DELETE',67),(714,'realtable',2,'2014-12-29 09:06:31','CREATE',72),(715,'datesrealtable',2,'2014-12-29 09:06:31','CREATE',72),(716,'realtable',2,'2014-12-29 09:06:37','DELETE',72),(717,'realtable',2,'2014-12-29 09:06:52','CREATE',73),(718,'datesrealtable',2,'2014-12-29 09:06:52','CREATE',73),(719,'realtable',2,'2014-12-29 09:07:05','CREATE',74),(720,'datesrealtable',2,'2014-12-29 09:07:05','CREATE',74),(721,'realtable',2,'2014-12-29 09:07:18','DELETE',73),(722,'realtable',2,'2014-12-29 09:07:23','DELETE',74),(723,'class',2,'2014-12-29 09:24:22','DELETE',19),(724,'program',2,'2014-12-29 09:29:05','DELETE',3),(725,'program',2,'2014-12-29 09:29:05','DELETE',10),(726,'specificity',2,'2014-12-29 09:29:15','DELETE',13),(727,'specificity',2,'2014-12-29 09:29:15','DELETE',14),(728,'class',2,'2014-12-29 09:30:38','DELETE',18),(729,'specificity',2,'2014-12-29 09:30:43','DELETE',15),(730,'specificity',2,'2014-12-29 09:30:43','DELETE',10),(731,'group',2,'2014-12-29 09:30:54','DELETE',6),(732,'group',2,'2014-12-29 09:30:54','DELETE',7),(733,'program',2,'2014-12-29 09:39:05','CREATE',11),(734,'programtime',2,'2014-12-29 09:39:05','CREATE',11),(735,'program',2,'2014-12-29 09:39:48','DELETE',11);
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(10) NOT NULL,
  `class_stcapacity` tinyint(3) unsigned DEFAULT NULL,
  `class_isrent` bit(1) DEFAULT b'0',
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `class_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `class_isactual` bit(1) DEFAULT b'1',
  PRIMARY KEY (`class_id`),
  KEY `classcreator_user_idx` (`creator`),
  KEY `classupdater_user_idx` (`updater`),
  CONSTRAINT `classcreator_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `classupdater_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `class_AINS` AFTER INSERT ON `class` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('class',NEW.creator,'CREATE',NEW.class_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `class_AUPD` AFTER UPDATE ON `class` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('class',NEW.updater,'UPDATE',NEW.class_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `class_BDEL` BEFORE DELETE ON `class` FOR EACH ROW
begin
		delete from specclass where specclass.class_id=OLD.class_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `datesplantable`
--

DROP TABLE IF EXISTS `datesplantable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datesplantable` (
  `plantable_id` bigint(20) NOT NULL,
  `datesplantable_date` date NOT NULL,
  `datesplantable_class` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `datesplantable_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`plantable_id`,`datesplantable_date`),
  KEY `dpt_class_idx` (`datesplantable_class`),
  KEY `dptc_user_idx` (`creator`),
  KEY `dptu_user_idx` (`updater`),
  CONSTRAINT `dpt` FOREIGN KEY (`plantable_id`) REFERENCES `plantable` (`plantable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dptc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dptu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datesplantable`
--

LOCK TABLES `datesplantable` WRITE;
/*!40000 ALTER TABLE `datesplantable` DISABLE KEYS */;
/*!40000 ALTER TABLE `datesplantable` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `datesplantable_AINS` AFTER INSERT ON `datesplantable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('datesplantable',NEW.creator,'CREATE',NEW.plantable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `datesplantable_AUPD` AFTER UPDATE ON `datesplantable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('datesplantable',NEW.updater,'UPDATE',NEW.plantable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `datesrealtable`
--

DROP TABLE IF EXISTS `datesrealtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datesrealtable` (
  `realtable_id` bigint(20) NOT NULL,
  `datesrealtable_date` date NOT NULL,
  `datesrealtable_class` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `datesrealtable_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`realtable_id`,`datesrealtable_date`),
  KEY `drt_class_idx` (`datesrealtable_class`),
  KEY `drtc_user_idx` (`creator`),
  KEY `drtu_user_idx` (`updater`),
  CONSTRAINT `drtc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `drtu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `drt_rt` FOREIGN KEY (`realtable_id`) REFERENCES `realtable` (`realtable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datesrealtable`
--

LOCK TABLES `datesrealtable` WRITE;
/*!40000 ALTER TABLE `datesrealtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `datesrealtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `datesrealtable_AINS` AFTER INSERT ON `datesrealtable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('datesrealtable',NEW.creator,'CREATE',NEW.realtable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `datesrealtable_AUPD` AFTER UPDATE ON `datesrealtable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('datesrealtable',NEW.updater,'UPDATE',NEW.realtable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `group_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `group_isactual` bit(1) DEFAULT b'1',
  PRIMARY KEY (`group_id`),
  KEY `groupc_user_idx` (`creator`),
  KEY `groupu_user_idx` (`updater`),
  CONSTRAINT `groupc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `groupu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `group_AINS` AFTER INSERT ON `group` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('group',NEW.creator,'CREATE',NEW.group_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `group_AUPD` AFTER UPDATE ON `group` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('group',NEW.updater,'UPDATE',NEW.group_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `group_BDEL` BEFORE DELETE ON `group` FOR EACH ROW
begin
	delete from groupplan where groupplan.group_id=OLD.group_id;
	delete from programgroups where group_id=OLD.group_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `groupplan`
--

DROP TABLE IF EXISTS `groupplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupplan` (
  `group_id` int(11) NOT NULL,
  `groupplan_year` year(4) NOT NULL,
  `groupplan_count` mediumint(8) unsigned DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `groupplan_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`groupplan_year`),
  KEY `groupplanc_user_idx` (`creator`),
  KEY `groupplanu_user_idx` (`updater`),
  CONSTRAINT `groupplanc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `groupplanu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `groupplan_group` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupplan`
--

LOCK TABLES `groupplan` WRITE;
/*!40000 ALTER TABLE `groupplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `groupplan_AINS` AFTER INSERT ON `groupplan` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('groupplan',NEW.creator,'CREATE',NEW.group_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `groupplan_AUPD` AFTER UPDATE ON `groupplan` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('groupplan',NEW.updater,'UPDATE',NEW.group_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plantable`
--

DROP TABLE IF EXISTS `plantable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plantable` (
  `plantable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) unsigned NOT NULL,
  `plantable_timestart` time NOT NULL,
  `plantable_timeend` time NOT NULL,
  `plantable_desc` varchar(2000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `plantable_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `plantable_students` int(11) DEFAULT NULL,
  PRIMARY KEY (`plantable_id`),
  KEY `plantable_progid` (`program_id`,`plantable_timestart`),
  KEY `plantablec_user_idx` (`creator`),
  KEY `plantableu_user_idx` (`updater`),
  CONSTRAINT `plantablec_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `plantableu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `plantable_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantable`
--

LOCK TABLES `plantable` WRITE;
/*!40000 ALTER TABLE `plantable` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantable` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `plantable_AINS` AFTER INSERT ON `plantable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('plantable',NEW.creator,'CREATE',NEW.plantable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `plantable_AUPD` AFTER UPDATE ON `plantable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('plantable',NEW.updater,'UPDATE',NEW.plantable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `plantable_BDEL` BEFORE DELETE ON `plantable` FOR EACH ROW
begin
		delete from datesplantable where plantable_id=OLD.plantable_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_name` varchar(250) NOT NULL,
  `program_key` varchar(10) DEFAULT NULL,
  `program_istraining` bit(1) NOT NULL DEFAULT b'1',
  `program_isactual` bit(1) DEFAULT b'1',
  `program_stcapacity` tinyint(3) unsigned DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `program_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `program_color` int(10) unsigned DEFAULT NULL,
  `program_hours` tinyint(4) DEFAULT NULL,
  `program_days` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  KEY `programc_user_idx` (`creator`),
  KEY `programu_user_idx` (`updater`),
  CONSTRAINT `programc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `program_AINS` AFTER INSERT ON `program` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('program',NEW.creator,'CREATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `program_AUPD` AFTER UPDATE ON `program` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('program',NEW.updater,'UPDATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `program_BDEL` BEFORE DELETE ON `program` FOR EACH ROW
begin
	delete from specprogram where program_id=OLD.program_id;
	delete from realtable where program_id=OLD.program_id;
	delete from plantable where program_id=OLD.program_id;
	delete from programtime where program_id=OLD.program_id;
	delete from programgroups where program_id=OLD.program_id;
	delete from programplan where program_id=OLD.program_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `programgroups`
--

DROP TABLE IF EXISTS `programgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programgroups` (
  `program_id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `programgroups_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`program_id`,`group_id`),
  KEY `programgroups_group_idx` (`group_id`),
  KEY `programgroupsc_user_idx` (`creator`),
  KEY `programgroupsu_user_idx` (`updater`),
  CONSTRAINT `programgroupsc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programgroupsu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programgroups_group` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programgroups_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programgroups`
--

LOCK TABLES `programgroups` WRITE;
/*!40000 ALTER TABLE `programgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `programgroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `programgroups_AINS` AFTER INSERT ON `programgroups` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('programgroups',NEW.creator,'CREATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `programgroups_AUPD` AFTER UPDATE ON `programgroups` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('programgroups',NEW.updater,'UPDATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `programplan`
--

DROP TABLE IF EXISTS `programplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programplan` (
  `program_id` int(11) unsigned NOT NULL,
  `programplan_year` year(4) NOT NULL,
  `programplan_count` mediumint(8) unsigned NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `programplan_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`program_id`,`programplan_year`),
  KEY `programplanc_user_idx` (`creator`),
  KEY `programplanu_user_idx` (`updater`),
  CONSTRAINT `programplanc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programplanu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programplan_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programplan`
--

LOCK TABLES `programplan` WRITE;
/*!40000 ALTER TABLE `programplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `programplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `programplan_AINS` AFTER INSERT ON `programplan` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('programplan',NEW.creator,'CREATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `programplan_AUPD` AFTER UPDATE ON `programplan` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('programplan',NEW.updater,'UPDATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `programtime`
--

DROP TABLE IF EXISTS `programtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programtime` (
  `program_id` int(10) unsigned NOT NULL,
  `programtime_start` time NOT NULL,
  `programtime_end` time NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `programtime_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`program_id`,`programtime_start`,`programtime_end`),
  KEY `programtimec_user_idx` (`creator`),
  KEY `programtimeu_user_idx` (`updater`),
  CONSTRAINT `programtimec_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programtimeu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programtime_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programtime`
--

LOCK TABLES `programtime` WRITE;
/*!40000 ALTER TABLE `programtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `programtime` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `programtime_AINS` AFTER INSERT ON `programtime` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('programtime',NEW.creator,'CREATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `programtime_AUPD` AFTER UPDATE ON `programtime` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('programtime',NEW.updater,'UPDATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `realtable`
--

DROP TABLE IF EXISTS `realtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realtable` (
  `realtable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned NOT NULL,
  `realtable_timestart` time NOT NULL,
  `realtable_timeend` time NOT NULL,
  `realtable_desc` varchar(2000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `realtable_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `realtable_students` int(11) DEFAULT NULL,
  PRIMARY KEY (`realtable_id`),
  KEY `realtable_program_idx` (`program_id`),
  KEY `realtablec_user_idx` (`creator`),
  KEY `realtableu_user_idx` (`updater`),
  CONSTRAINT `realtablec_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `realtableu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `realtable_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtable`
--

LOCK TABLES `realtable` WRITE;
/*!40000 ALTER TABLE `realtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `realtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `realtable_AINS` AFTER INSERT ON `realtable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('realtable',NEW.creator,'CREATE',NEW.realtable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `realtable_AUPD` AFTER UPDATE ON `realtable` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('realtable',NEW.updater,'UPDATE',NEW.realtable_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `realtable_BDEL` BEFORE DELETE ON `realtable` FOR EACH ROW
begin
		delete from datesrealtable where realtable_id=OLD.realtable_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `specclass`
--

DROP TABLE IF EXISTS `specclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specclass` (
  `class_id` int(11) NOT NULL,
  `specificity_id` tinyint(3) unsigned NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `specclass_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`,`specificity_id`),
  KEY `specclass_spec_idx` (`specificity_id`),
  KEY `specclass_user_idx` (`creator`),
  KEY `specclassu_user_idx` (`updater`),
  CONSTRAINT `specclassu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specclass_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specclass_spec` FOREIGN KEY (`specificity_id`) REFERENCES `specificity` (`specificity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `speclassc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specclass`
--

LOCK TABLES `specclass` WRITE;
/*!40000 ALTER TABLE `specclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `specclass` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specclass_AINS` AFTER INSERT ON `specclass` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('specclass',NEW.creator,'CREATE',NEW.class_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specclass_AUPD` AFTER UPDATE ON `specclass` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('specclass',NEW.updater,'UPDATE',NEW.class_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `specificity`
--

DROP TABLE IF EXISTS `specificity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specificity` (
  `specificity_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `specificity_name` varchar(45) NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `specificity_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`specificity_id`),
  KEY `specificityc_user_idx` (`creator`),
  KEY `specificityu_user_idx` (`updater`),
  CONSTRAINT `specificityc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specificityu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specificity`
--

LOCK TABLES `specificity` WRITE;
/*!40000 ALTER TABLE `specificity` DISABLE KEYS */;
/*!40000 ALTER TABLE `specificity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specificity_AINS` AFTER INSERT ON `specificity` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('specificity',NEW.creator,'CREATE',NEW.specificity_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specificity_AUPD` AFTER UPDATE ON `specificity` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('specificity',NEW.updater,'UPDATE',NEW.specificity_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specificity_BDEL` BEFORE DELETE ON `specificity` FOR EACH ROW
begin
delete from specclass where specificity_id=OLD.specificity_id;
delete from specprogram where specificity_id=OLD.specificity_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `specprogram`
--

DROP TABLE IF EXISTS `specprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specprogram` (
  `program_id` int(10) unsigned NOT NULL,
  `specificity_id` tinyint(3) unsigned NOT NULL,
  `creator` int(11) NOT NULL,
  `updater` int(11) DEFAULT NULL,
  `specprogram_createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`program_id`,`specificity_id`),
  KEY `specprog_spec_idx` (`specificity_id`),
  KEY `specprogc_user_idx` (`creator`),
  KEY `specprogu_user_idx` (`updater`),
  CONSTRAINT `specprogc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specprogu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specprog_prog` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specprog_spec` FOREIGN KEY (`specificity_id`) REFERENCES `specificity` (`specificity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specprogram`
--

LOCK TABLES `specprogram` WRITE;
/*!40000 ALTER TABLE `specprogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `specprogram` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specprogram_AINS` AFTER INSERT ON `specprogram` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('specprogram',NEW.creator,'CREATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `specprogram_AUPD` AFTER UPDATE ON `specprogram` FOR EACH ROW
begin
	INSERT into changes(changes_table,changes_user,changes_action,changes_rid,changes_time) values ('specprogram',NEW.updater,'UPDATE',NEW.program_id,NOW());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_surname` varchar(45) DEFAULT NULL,
  `user_patronymic` varchar(45) DEFAULT NULL,
  `user_lasttime` datetime DEFAULT NULL,
  `user_cookie` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'andrey','a12345','cvcv','cvcv','cvcv',NULL,130);
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

-- Dump completed on 2014-12-29  9:48:41
