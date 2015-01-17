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
) ENGINE=MEMORY AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
INSERT INTO `changes` VALUES (2,'program',2,'2014-12-06 04:23:01','CREATE',2),(3,'programtime',2,'2014-12-06 04:23:41','CREATE',2),(4,'specificity',2,'2014-12-06 05:33:58','CREATE',4),(5,'specificity',2,'2014-12-06 05:33:58','CREATE',5),(6,'realtable',2,'2014-12-13 19:17:56','CREATE',1),(7,'class',2,'2014-12-13 20:28:28','CREATE',4),(8,'datesrealtable',2,'2014-12-13 20:29:01','CREATE',1),(9,'datesrealtable',2,'2014-12-13 20:36:01','CREATE',1),(10,'datesrealtable',2,'2014-12-13 21:00:14','UPDATE',1),(11,'specclass',2,'2014-12-14 17:53:20','CREATE',4),(12,'specprogram',2,'2014-12-14 18:00:31','CREATE',2),(13,'programplan',2,'2014-12-14 18:56:51','CREATE',2),(14,'programtime',2,'2014-12-14 18:57:25','CREATE',2),(15,'group',2,'2014-12-14 20:47:32','CREATE',1),(16,'group',2,'2014-12-14 20:48:27','CREATE',2),(17,'group',2,'2014-12-14 20:49:25','CREATE',3),(18,'group',2,'2014-12-14 20:50:47','CREATE',4),(19,'group',2,'2014-12-14 20:57:48','CREATE',5),(20,'group',2,'2014-12-14 20:59:35','CREATE',6),(21,'group',2,'2014-12-14 21:00:45','CREATE',7),(22,'groupplan',2,'2014-12-14 21:01:27','CREATE',7),(23,'group',2,'2014-12-14 21:18:04','DELETE',4),(24,'group',2,'2014-12-14 21:19:24','DELETE',5),(25,'program',2,'2014-12-15 01:49:55','UPDATE',2),(26,'program',2,'2014-12-15 02:07:14','UPDATE',2),(27,'program',2,'2014-12-15 02:14:29','UPDATE',2),(28,'specificity',2,'2014-12-15 17:41:10','CREATE',6),(29,'specificity',2,'2014-12-15 17:41:56','CREATE',7),(30,'specificity',2,'2014-12-15 18:08:16','DELETE',7),(31,'specificity',2,'2014-12-15 18:09:14','CREATE',8),(32,'specificity',2,'2014-12-15 18:09:29','DELETE',8),(33,'specificity',2,'2014-12-15 18:09:46','DELETE',5),(34,'specificity',2,'2014-12-15 18:15:39','CREATE',9),(35,'specificity',2,'2014-12-15 18:15:48','DELETE',9),(36,'specificity',2,'2014-12-15 20:10:58','CREATE',10),(37,'specificity',2,'2014-12-15 20:13:01','CREATE',11),(38,'specificity',2,'2014-12-15 20:13:53','CREATE',12),(39,'specificity',2,'2014-12-17 02:51:20','DELETE',12),(40,'specificity',2,'2014-12-17 02:51:54','DELETE',11),(41,'specificity',2,'2014-12-17 02:52:20','CREATE',13),(42,'specificity',2,'2014-12-17 04:23:07','CREATE',14),(43,'specificity',2,'2014-12-17 04:45:19','CREATE',15),(44,'group',2,'2014-12-19 02:04:16','UPDATE',7),(45,'group',2,'2014-12-19 02:05:00','UPDATE',6),(46,'group',2,'2014-12-19 02:21:19','UPDATE',6),(47,'group',2,'2014-12-19 02:21:25','UPDATE',6),(48,'group',2,'2014-12-19 02:40:16','UPDATE',6),(49,'group',2,'2014-12-20 00:32:57','CREATE',8),(50,'groupplan',2,'2014-12-20 00:32:58','CREATE',8),(51,'group',2,'2014-12-20 02:06:34','UPDATE',8),(52,'group',2,'2014-12-20 02:06:57','UPDATE',7),(53,'group',2,'2014-12-20 02:07:07','UPDATE',8),(54,'group',2,'2014-12-20 02:07:24','UPDATE',8),(55,'group',2,'2014-12-20 04:14:50','UPDATE',6),(56,'group',2,'2014-12-20 04:46:49','UPDATE',6),(57,'group',2,'2014-12-20 04:49:00','UPDATE',6),(58,'groupplan',2,'2014-12-20 04:55:46','CREATE',8),(59,'group',2,'2014-12-20 04:59:49','UPDATE',8),(60,'group',2,'2014-12-20 05:10:45','UPDATE',8),(61,'group',2,'2014-12-20 05:10:49','UPDATE',8),(62,'groupplan',2,'2014-12-20 05:11:00','DELETE',8),(63,'groupplan',2,'2014-12-20 05:11:00','CREATE',8),(64,'groupplan',2,'2014-12-20 05:11:12','DELETE',8),(65,'groupplan',2,'2014-12-20 05:11:12','CREATE',8),(66,'groupplan',2,'2014-12-20 05:16:42','DELETE',7),(67,'groupplan',2,'2014-12-20 05:16:42','CREATE',7),(68,'group',2,'2014-12-20 05:30:39','UPDATE',7),(69,'group',2,'2014-12-20 05:30:39','UPDATE',8),(70,'group',2,'2014-12-20 05:30:44','UPDATE',6),(71,'group',2,'2014-12-20 05:57:00','UPDATE',7),(72,'group',2,'2014-12-20 05:57:00','UPDATE',8),(73,'group',2,'2014-12-20 05:59:21','UPDATE',8),(74,'group',2,'2014-12-20 19:58:17','DELETE',8),(75,'class',2,'2014-12-20 20:27:32','DELETE',4),(76,'class',2,'2014-12-20 21:06:50','CREATE',5),(77,'class',2,'2014-12-21 00:08:28','UPDATE',5),(78,'class',2,'2014-12-21 00:08:28','CREATE',6),(79,'class',2,'2014-12-21 00:11:32','UPDATE',6),(80,'specclass',2,'2014-12-21 00:13:57','CREATE',5),(81,'specclass',2,'2014-12-21 00:13:57','CREATE',5),(82,'specclass',2,'2014-12-21 00:13:57','CREATE',5),(83,'specclass',2,'2014-12-21 00:13:57','CREATE',5),(84,'class',2,'2014-12-21 00:20:36','UPDATE',5),(85,'specclass',2,'2014-12-21 00:20:36','DELETE',5),(86,'specclass',2,'2014-12-21 00:20:36','DELETE',5),(87,'specclass',2,'2014-12-21 00:20:36','DELETE',5),(88,'specclass',2,'2014-12-21 00:20:36','DELETE',5),(89,'specclass',2,'2014-12-21 00:20:36','CREATE',5),(90,'specclass',2,'2014-12-21 00:20:36','CREATE',5),(91,'specclass',2,'2014-12-21 00:20:48','DELETE',5),(92,'specclass',2,'2014-12-21 00:20:48','DELETE',5),(93,'specclass',2,'2014-12-21 00:20:48','CREATE',5),(94,'specclass',2,'2014-12-21 00:20:48','CREATE',5),(95,'specclass',2,'2014-12-21 00:20:48','CREATE',5),(96,'specclass',2,'2014-12-21 00:20:48','CREATE',5),(97,'specclass',2,'2014-12-21 00:22:34','DELETE',5),(98,'specclass',2,'2014-12-21 00:22:34','DELETE',5),(99,'specclass',2,'2014-12-21 00:22:34','DELETE',5),(100,'specclass',2,'2014-12-21 00:22:34','DELETE',5),(101,'specclass',2,'2014-12-21 00:22:34','CREATE',5),(102,'specclass',2,'2014-12-21 00:22:34','CREATE',5),(103,'class',2,'2014-12-21 00:23:56','UPDATE',5),(104,'specclass',2,'2014-12-21 00:23:56','DELETE',5),(105,'specclass',2,'2014-12-21 00:23:56','DELETE',5),(106,'specclass',2,'2014-12-21 00:23:56','CREATE',5),(107,'specclass',2,'2014-12-21 00:23:56','CREATE',5),(108,'specclass',2,'2014-12-21 00:23:56','CREATE',5),(109,'specclass',2,'2014-12-21 00:23:56','CREATE',5),(110,'class',2,'2014-12-21 00:24:05','UPDATE',6),(111,'class',2,'2014-12-21 00:25:30','CREATE',7),(112,'specclass',2,'2014-12-21 00:25:31','CREATE',7),(113,'specclass',2,'2014-12-21 00:31:58','CREATE',7),(114,'specclass',2,'2014-12-21 00:31:58','CREATE',7),(115,'specclass',2,'2014-12-21 00:31:58','CREATE',7),(116,'class',2,'2014-12-21 00:32:09','DELETE',7),(117,'class',2,'2014-12-21 00:32:09','DELETE',5),(118,'class',2,'2014-12-21 00:36:54','CREATE',8),(119,'specclass',2,'2014-12-21 00:41:50','CREATE',8),(120,'specclass',2,'2014-12-21 00:41:50','CREATE',8),(121,'specclass',2,'2014-12-21 00:41:50','CREATE',8),(122,'class',2,'2014-12-21 00:42:56','CREATE',9),(123,'specclass',2,'2014-12-21 00:43:01','CREATE',9),(124,'specclass',2,'2014-12-21 00:43:01','CREATE',9),(125,'specclass',2,'2014-12-21 00:43:01','CREATE',9),(126,'specclass',2,'2014-12-21 00:43:01','CREATE',9),(127,'specclass',2,'2014-12-21 00:43:01','CREATE',9),(128,'specclass',2,'2014-12-21 00:43:01','CREATE',9),(129,'class',2,'2014-12-21 00:43:40','UPDATE',9),(130,'class',2,'2014-12-21 00:45:15','CREATE',10),(131,'specclass',2,'2014-12-21 00:45:15','CREATE',10),(132,'specclass',2,'2014-12-21 00:45:15','CREATE',10),(133,'specclass',2,'2014-12-21 00:45:15','CREATE',10),(134,'class',2,'2014-12-21 00:45:16','DELETE',8),(135,'class',2,'2014-12-21 00:45:16','DELETE',9),(136,'class',2,'2014-12-21 00:46:38','CREATE',11),(137,'specclass',2,'2014-12-21 00:46:38','CREATE',11),(138,'specclass',2,'2014-12-21 00:46:38','CREATE',11),(139,'specclass',2,'2014-12-21 00:46:38','CREATE',11),(140,'class',2,'2014-12-21 00:50:20','UPDATE',6),(141,'class',2,'2014-12-21 00:50:20','CREATE',12),(142,'specclass',2,'2014-12-21 00:50:20','CREATE',12),(143,'specclass',2,'2014-12-21 00:50:20','CREATE',12),(144,'specclass',2,'2014-12-21 00:50:20','CREATE',12),(145,'specclass',2,'2014-12-21 00:50:20','CREATE',12),(146,'class',2,'2014-12-21 00:52:15','DELETE',11),(147,'class',2,'2014-12-21 00:52:16','DELETE',6),(148,'class',2,'2014-12-21 00:52:16','DELETE',10),(149,'class',2,'2014-12-21 00:52:35','CREATE',13),(150,'specclass',2,'2014-12-21 00:52:36','CREATE',13),(151,'specclass',2,'2014-12-21 00:52:36','CREATE',13),(152,'specclass',2,'2014-12-21 00:52:36','CREATE',13),(153,'specclass',2,'2014-12-21 00:52:36','CREATE',13),(154,'class',2,'2014-12-21 00:53:38','CREATE',14),(155,'specclass',2,'2014-12-21 00:53:38','CREATE',14),(156,'specclass',2,'2014-12-21 00:53:38','CREATE',14),(157,'specclass',2,'2014-12-21 00:53:38','CREATE',14),(158,'class',2,'2014-12-21 01:00:33','CREATE',15),(159,'specclass',2,'2014-12-21 01:00:33','CREATE',15),(160,'specclass',2,'2014-12-21 01:00:33','CREATE',15),(161,'specclass',2,'2014-12-21 01:00:33','CREATE',15),(162,'specclass',2,'2014-12-21 01:00:33','CREATE',15),(163,'class',2,'2014-12-21 01:04:12','CREATE',16),(164,'specclass',2,'2014-12-21 01:05:06','CREATE',16),(165,'specclass',2,'2014-12-21 01:05:06','CREATE',16),(166,'class',2,'2014-12-21 01:14:19','DELETE',13),(167,'class',2,'2014-12-21 01:14:20','DELETE',14),(168,'class',2,'2014-12-21 01:14:20','DELETE',12),(169,'class',2,'2014-12-21 01:15:46','CREATE',17),(170,'specclass',2,'2014-12-21 01:16:28','CREATE',17),(171,'specclass',2,'2014-12-21 01:16:28','CREATE',17),(172,'specclass',2,'2014-12-21 01:16:28','CREATE',17),(173,'class',2,'2014-12-21 01:24:40','CREATE',18),(174,'specclass',2,'2014-12-21 01:24:40','CREATE',18),(175,'specclass',2,'2014-12-21 01:24:40','CREATE',18),(176,'specclass',2,'2014-12-21 01:24:40','CREATE',18),(177,'class',2,'2014-12-21 01:24:41','DELETE',16),(178,'class',2,'2014-12-21 01:24:41','DELETE',17),(179,'class',2,'2014-12-21 01:24:47','DELETE',15),(180,'plantable',2,'2015-02-01 04:26:12','CREATE',2),(181,'datesplantable',2,'2015-02-01 04:27:13','CREATE',2),(182,'datesplantable',2,'2015-02-01 10:07:49','UPDATE',2),(183,'datesplantable',2,'2015-02-01 10:12:55','UPDATE',2),(184,'datesplantable',2,'2015-02-01 10:17:41','UPDATE',2),(185,'program',2,'2015-02-01 16:52:15','UPDATE',2),(186,'datesplantable',2,'2015-01-15 18:01:33','UPDATE',2),(187,'program',2,'2015-01-15 20:21:34','CREATE',3),(188,'programtime',2,'2015-01-15 20:22:44','CREATE',3),(189,'programtime',2,'2015-01-15 20:22:44','CREATE',3),(190,'realtable',2,'2015-01-15 20:30:27','CREATE',2),(191,'datesrealtable',2,'2015-01-15 20:31:47','CREATE',2),(192,'datesrealtable',2,'2015-01-15 20:31:58','UPDATE',2),(193,'datesrealtable',2,'2015-01-15 20:32:54','UPDATE',2),(194,'program',2,'2015-01-15 22:40:23','UPDATE',3),(195,'program',2,'2015-01-16 07:56:22','UPDATE',3),(196,'program',2,'2015-01-16 09:16:10','UPDATE',3),(197,'plantable',2,'2015-01-16 18:26:04','UPDATE',2),(198,'realtable',2,'2015-01-16 18:26:12','UPDATE',2),(199,'realtable',2,'2015-01-16 18:26:12','UPDATE',1),(200,'datesplantable',2,'2015-01-16 19:10:48','UPDATE',2),(201,'datesrealtable',2,'2015-01-16 19:10:54','UPDATE',1),(202,'datesrealtable',2,'2015-01-16 19:10:54','UPDATE',1),(203,'datesrealtable',2,'2015-01-16 19:10:54','UPDATE',2),(204,'program',2,'2015-01-16 19:32:17','UPDATE',2),(205,'datesrealtable',2,'2015-01-16 19:35:36','CREATE',2),(206,'datesrealtable',2,'2015-01-16 19:47:46','CREATE',2),(207,'datesrealtable',2,'2015-01-16 19:48:29','UPDATE',2),(208,'datesrealtable',2,'2015-01-16 19:49:10','UPDATE',2),(209,'datesrealtable',2,'2015-01-16 19:49:17','UPDATE',2),(210,'datesrealtable',2,'2015-01-16 19:50:35','UPDATE',2),(211,'datesrealtable',2,'2015-01-16 19:51:04','UPDATE',2),(212,'datesrealtable',2,'2015-01-16 19:55:52','UPDATE',2),(213,'class',2,'2015-01-16 20:00:24','CREATE',19),(214,'datesrealtable',2,'2015-01-16 20:01:09','UPDATE',2),(215,'datesplantable',2,'2015-01-16 20:03:09','CREATE',2),(216,'datesplantable',2,'2015-01-16 20:08:49','UPDATE',2),(217,'plantable',2,'2015-01-16 22:49:53','CREATE',3),(218,'datesplantable',2,'2015-01-16 22:50:54','CREATE',3),(219,'program',2,'2015-01-16 22:51:55','UPDATE',3),(220,'datesplantable',2,'2015-01-16 23:02:43','CREATE',3),(221,'datesplantable',2,'2015-01-17 00:14:20','CREATE',3),(222,'realtable',2,'2015-01-17 02:21:45','CREATE',3),(223,'realtable',2,'2015-01-17 02:23:09','CREATE',4),(224,'realtable',2,'2015-01-17 02:29:23','CREATE',5),(225,'realtable',2,'2015-01-17 02:30:53','CREATE',6),(226,'realtable',2,'2015-01-17 02:33:56','CREATE',7),(227,'datesrealtable',2,'2015-01-17 02:34:59','CREATE',7),(228,'datesrealtable',2,'2015-01-17 02:34:59','CREATE',7),(229,'datesrealtable',2,'2015-01-17 02:34:59','CREATE',7),(230,'realtable',2,'2015-01-17 02:36:21','CREATE',8),(231,'realtable',2,'2015-01-17 02:37:03','CREATE',9),(232,'datesrealtable',2,'2015-01-17 02:37:03','CREATE',9),(233,'datesrealtable',2,'2015-01-17 02:37:03','CREATE',9),(234,'datesrealtable',2,'2015-01-17 02:37:03','CREATE',9),(235,'realtable',2,'2015-01-17 02:38:21','CREATE',10),(236,'datesrealtable',2,'2015-01-17 02:38:21','CREATE',10),(237,'datesrealtable',2,'2015-01-17 02:38:21','CREATE',10),(238,'datesrealtable',2,'2015-01-17 02:38:21','CREATE',10),(239,'realtable',2,'2015-01-17 02:46:23','CREATE',11),(240,'datesrealtable',2,'2015-01-17 02:46:23','CREATE',11),(241,'datesrealtable',2,'2015-01-17 02:46:23','CREATE',11),(242,'datesrealtable',2,'2015-01-17 02:46:23','CREATE',11),(243,'realtable',2,'2015-01-17 02:47:27','CREATE',12),(244,'datesrealtable',2,'2015-01-17 02:47:27','CREATE',12),(245,'datesrealtable',2,'2015-01-17 02:47:27','CREATE',12),(246,'datesrealtable',2,'2015-01-17 02:47:27','CREATE',12),(247,'realtable',2,'2015-01-17 02:58:08','CREATE',13),(248,'datesrealtable',2,'2015-01-17 02:58:08','CREATE',13),(249,'datesrealtable',2,'2015-01-17 02:58:08','CREATE',13),(250,'datesrealtable',2,'2015-01-17 02:58:08','CREATE',13),(251,'realtable',2,'2015-01-17 03:00:55','CREATE',14),(252,'datesrealtable',2,'2015-01-17 03:00:55','CREATE',14),(253,'datesrealtable',2,'2015-01-17 03:00:55','CREATE',14),(254,'datesrealtable',2,'2015-01-17 03:00:55','CREATE',14),(255,'plantable',2,'2015-01-17 05:16:18','CREATE',4),(256,'datesplantable',2,'2015-01-17 05:16:18','CREATE',4),(257,'program',2,'2015-01-17 05:21:29','UPDATE',3),(258,'plantable',2,'2015-01-17 05:22:17','CREATE',5),(259,'datesplantable',2,'2015-01-17 05:22:17','CREATE',5),(260,'plantable',2,'2015-01-17 05:25:01','CREATE',6),(261,'datesplantable',2,'2015-01-17 05:25:01','CREATE',6),(262,'datesplantable',2,'2015-01-17 05:25:01','CREATE',6),(263,'datesplantable',2,'2015-01-17 05:25:01','CREATE',6),(264,'datesplantable',2,'2015-01-17 05:25:01','CREATE',6),(265,'datesplantable',2,'2015-01-17 05:25:01','CREATE',6),(266,'realtable',2,'2015-01-17 05:26:39','CREATE',15),(267,'datesrealtable',2,'2015-01-17 05:26:39','CREATE',15),(268,'datesrealtable',2,'2015-01-17 05:26:39','CREATE',15),(269,'datesrealtable',2,'2015-01-17 05:26:39','CREATE',15),(270,'datesrealtable',2,'2015-01-17 05:26:39','CREATE',15),(271,'datesrealtable',2,'2015-01-17 05:26:39','CREATE',15),(272,'plantable',2,'2015-01-17 05:31:40','CREATE',7),(273,'datesplantable',2,'2015-01-17 05:31:40','CREATE',7),(274,'datesplantable',2,'2015-01-17 05:31:40','CREATE',7),(275,'plantable',2,'2015-01-17 05:31:57','CREATE',8),(276,'datesplantable',2,'2015-01-17 05:31:57','CREATE',8),(277,'datesplantable',2,'2015-01-17 05:31:57','CREATE',8),(278,'realtable',2,'2015-01-17 05:32:14','CREATE',16),(279,'datesrealtable',2,'2015-01-17 05:32:14','CREATE',16),(280,'datesrealtable',2,'2015-01-17 05:32:14','CREATE',16),(281,'realtable',2,'2015-01-17 05:33:25','CREATE',17),(282,'datesrealtable',2,'2015-01-17 05:33:25','CREATE',17),(283,'datesrealtable',2,'2015-01-17 05:33:25','CREATE',17),(284,'plantable',2,'2015-01-17 05:34:33','CREATE',9),(285,'datesplantable',2,'2015-01-17 05:34:33','CREATE',9),(286,'datesplantable',2,'2015-01-17 05:34:33','CREATE',9),(287,'datesplantable',2,'2015-01-17 05:34:33','CREATE',9),(288,'datesplantable',2,'2015-01-17 05:34:33','CREATE',9),(289,'datesplantable',2,'2015-01-17 05:34:33','CREATE',9),(290,'realtable',2,'2015-01-17 05:34:41','CREATE',18),(291,'datesrealtable',2,'2015-01-17 05:34:41','CREATE',18),(292,'datesrealtable',2,'2015-01-17 05:34:41','CREATE',18),(293,'realtable',2,'2015-01-17 05:34:53','CREATE',19),(294,'datesrealtable',2,'2015-01-17 05:34:53','CREATE',19),(295,'datesrealtable',2,'2015-01-17 05:34:53','CREATE',19),(296,'plantable',2,'2015-01-17 05:35:48','CREATE',10),(297,'datesplantable',2,'2015-01-17 05:35:48','CREATE',10),(298,'datesplantable',2,'2015-01-17 05:35:48','CREATE',10);
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
INSERT INTO `class` VALUES (18,'342',156,'\0',2,NULL,'2014-12-21 01:24:40',''),(19,'416б',23,'\0',2,NULL,'2015-01-16 20:00:24','');
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
  CONSTRAINT `dptc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dptu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dpt` FOREIGN KEY (`plantable_id`) REFERENCES `plantable` (`plantable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datesplantable`
--

LOCK TABLES `datesplantable` WRITE;
/*!40000 ALTER TABLE `datesplantable` DISABLE KEYS */;
INSERT INTO `datesplantable` VALUES (3,'2015-01-02',18,2,NULL,'2015-01-17 00:14:20'),(3,'2015-01-09',18,2,NULL,'2015-01-16 22:50:54'),(3,'2015-01-10',18,2,NULL,'2015-01-16 23:02:43'),(6,'2015-01-17',19,2,NULL,'2015-01-17 05:25:01'),(6,'2015-01-18',19,2,NULL,'2015-01-17 05:25:01'),(6,'2015-01-19',19,2,NULL,'2015-01-17 05:25:01'),(6,'2015-01-20',19,2,NULL,'2015-01-17 05:25:01'),(6,'2015-01-21',19,2,NULL,'2015-01-17 05:25:01'),(7,'2015-01-07',19,2,NULL,'2015-01-17 05:31:40'),(7,'2015-01-08',19,2,NULL,'2015-01-17 05:31:40'),(8,'2015-01-01',19,2,NULL,'2015-01-17 05:31:57'),(8,'2015-01-02',19,2,NULL,'2015-01-17 05:31:57'),(9,'2014-12-08',19,2,NULL,'2015-01-17 05:34:33'),(9,'2014-12-09',19,2,NULL,'2015-01-17 05:34:33'),(9,'2014-12-10',19,2,NULL,'2015-01-17 05:34:33'),(9,'2014-12-11',19,2,NULL,'2015-01-17 05:34:33'),(9,'2014-12-12',19,2,NULL,'2015-01-17 05:34:33'),(10,'2014-12-13',19,2,NULL,'2015-01-17 05:35:48'),(10,'2014-12-14',19,2,NULL,'2015-01-17 05:35:48');
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
  CONSTRAINT `drtu_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `drtc_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `drt_rt` FOREIGN KEY (`realtable_id`) REFERENCES `realtable` (`realtable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datesrealtable`
--

LOCK TABLES `datesrealtable` WRITE;
/*!40000 ALTER TABLE `datesrealtable` DISABLE KEYS */;
INSERT INTO `datesrealtable` VALUES (1,'2012-11-03',18,2,2,'2014-12-13 20:29:01'),(1,'2012-12-01',18,2,2,'2014-12-13 20:36:01'),(14,'2015-01-02',18,2,NULL,'2015-01-17 03:00:55'),(14,'2015-01-09',18,2,NULL,'2015-01-17 03:00:55'),(14,'2015-01-10',18,2,NULL,'2015-01-17 03:00:55'),(15,'2015-01-18',19,2,NULL,'2015-01-17 05:26:39'),(15,'2015-01-19',19,2,NULL,'2015-01-17 05:26:39'),(15,'2015-01-20',19,2,NULL,'2015-01-17 05:26:39'),(15,'2015-01-21',19,2,NULL,'2015-01-17 05:26:39'),(15,'2015-01-22',19,2,NULL,'2015-01-17 05:26:39'),(16,'2015-01-07',19,2,NULL,'2015-01-17 05:32:14'),(16,'2015-01-08',19,2,NULL,'2015-01-17 05:32:14'),(17,'2015-01-01',19,2,NULL,'2015-01-17 05:33:25'),(17,'2015-01-02',19,2,NULL,'2015-01-17 05:33:25'),(18,'2014-12-09',18,2,NULL,'2015-01-17 05:34:41'),(18,'2014-12-10',18,2,NULL,'2015-01-17 05:34:41'),(19,'2014-12-06',19,2,NULL,'2015-01-17 05:34:53'),(19,'2014-12-07',19,2,NULL,'2015-01-17 05:34:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (6,'БКГ',2,2,'2014-12-14 20:59:35','\0'),(7,'ВКГ',2,2,'2014-12-14 21:00:45','\0');
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
INSERT INTO `groupplan` VALUES (7,2014,22000,2,NULL,'2014-12-20 05:16:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantable`
--

LOCK TABLES `plantable` WRITE;
/*!40000 ALTER TABLE `plantable` DISABLE KEYS */;
INSERT INTO `plantable` VALUES (3,3,'12:00:00','14:00:00',NULL,2,NULL,'2015-01-16 22:49:53',20),(6,3,'12:00:00','14:00:00','(null)',2,NULL,'2015-01-17 05:25:01',45),(7,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:31:40',23),(8,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:31:57',23),(9,3,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:34:33',23),(10,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:35:48',56);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (2,'zcvzcv','zcvzcv','','',23,2,2,'2014-12-06 04:23:01',65280,18,2),(3,'АИС запись детей в учреждения дополнительного образования города Москвы (АИС ГОУ ДО). Формирование планов приема заявителей и обработка заявлений','ИС_18_2','\0','',23,2,2,'2015-01-15 20:21:34',14540032,100,5);
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
INSERT INTO `programplan` VALUES (2,2014,1000,2,NULL,'2014-12-14 18:56:51');
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
INSERT INTO `programtime` VALUES (2,'10:00:00','12:00:00',2,NULL,'2014-12-06 04:23:41'),(2,'13:00:00','15:00:00',2,NULL,'2014-12-14 18:57:25'),(3,'10:00:00','12:00:00',2,NULL,'2015-01-15 20:22:44'),(3,'12:00:00','14:00:00',2,NULL,'2015-01-15 20:22:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtable`
--

LOCK TABLES `realtable` WRITE;
/*!40000 ALTER TABLE `realtable` DISABLE KEYS */;
INSERT INTO `realtable` VALUES (1,2,'10:00:00','12:00:00','sfgsdfgsf',2,2,'2014-12-13 19:17:56',13),(2,3,'12:00:00','14:00:00','gsdfg',2,2,'2015-01-15 20:30:27',12),(14,3,'12:00:00','14:00:00','(null)',2,NULL,'2015-01-17 03:00:55',20),(15,3,'12:00:00','14:00:00','(null)',2,NULL,'2015-01-17 05:26:39',45),(16,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:32:14',23),(17,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:33:25',23),(18,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:34:41',12),(19,2,'10:00:00','12:00:00','(null)',2,NULL,'2015-01-17 05:34:53',32);
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
INSERT INTO `specclass` VALUES (18,10,2,NULL,'2014-12-21 01:24:40'),(18,13,2,NULL,'2014-12-21 01:24:40'),(18,15,2,NULL,'2014-12-21 01:24:40');
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
INSERT INTO `specificity` VALUES (4,'Microsoft 2007',2,NULL,'2014-12-06 05:33:58'),(6,'Access 2007',2,NULL,'2014-12-15 17:41:10'),(10,'Microsoft 2010',2,NULL,'2014-12-15 20:10:58'),(13,'Access 2010',2,NULL,'2014-12-17 02:52:20'),(14,'Excel 2007',2,NULL,'2014-12-17 04:23:07'),(15,'Excel 2010',2,NULL,'2014-12-17 04:45:19');
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

-- Dump completed on 2015-01-17  7:45:38
