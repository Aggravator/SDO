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
  `changes_table` varchar(40) NOT NULL,
  `changes_user` int(11) NOT NULL,
  `changes_time` datetime NOT NULL,
  `changes_action` enum('CREATE','UPDATE','DELETE') NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
INSERT INTO `changes` VALUES ('class',1,'2014-12-01 16:44:11','CREATE'),('class',1,'2014-12-01 16:47:06','UPDATE'),('specificity',1,'2014-12-01 20:36:01','CREATE'),('specificity',1,'2014-12-01 20:36:16','CREATE'),('specificity',1,'2014-12-01 20:49:17','CREATE');
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
  PRIMARY KEY (`class_id`),
  KEY `classcreator_user_idx` (`creator`),
  KEY `classupdater_user_idx` (`updater`),
  CONSTRAINT `classcreator_user` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `classupdater_user` FOREIGN KEY (`updater`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (2,'416',33,'\0',1,1,'2014-12-01 20:12:34');
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
	INSERT into changes(changes_table,changes_user,changes_action,changes_time) values ('class',NEW.creator,'CREATE',NOW());
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
	INSERT into changes(changes_table,changes_user,changes_action,changes_time) values ('class',NEW.updater,'UPDATE',NOW());
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
  PRIMARY KEY (`plantable_id`,`datesplantable_date`),
  KEY `dpt_class_idx` (`datesplantable_class`),
  CONSTRAINT `dpt` FOREIGN KEY (`plantable_id`) REFERENCES `plantable` (`plantable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datesplantable`
--

LOCK TABLES `datesplantable` WRITE;
/*!40000 ALTER TABLE `datesplantable` DISABLE KEYS */;
/*!40000 ALTER TABLE `datesplantable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datesrealtable`
--

DROP TABLE IF EXISTS `datesrealtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datesrealtable` (
  `realtable_id` bigint(20) NOT NULL,
  `realtable_date` date NOT NULL,
  `realtable_class` int(11) NOT NULL,
  PRIMARY KEY (`realtable_id`,`realtable_date`),
  KEY `drt_class_idx` (`realtable_class`),
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

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`group_id`,`groupplan_year`),
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

--
-- Table structure for table `plantable`
--

DROP TABLE IF EXISTS `plantable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plantable` (
  `plantable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) unsigned NOT NULL,
  `plantable_datestart` date DEFAULT NULL,
  `plantable_timestart` time NOT NULL,
  `plantable_timeend` time NOT NULL,
  `planttable_desc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`plantable_id`),
  KEY `plantable_progid` (`program_id`,`plantable_datestart`,`plantable_timestart`),
  CONSTRAINT `plantable_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantable`
--

LOCK TABLES `plantable` WRITE;
/*!40000 ALTER TABLE `plantable` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantable` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programgroups`
--

DROP TABLE IF EXISTS `programgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programgroups` (
  `program_id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`program_id`,`group_id`),
  KEY `programgroups_group_idx` (`group_id`),
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
  PRIMARY KEY (`program_id`,`programplan_year`),
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
  PRIMARY KEY (`program_id`,`programtime_start`,`programtime_end`),
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

--
-- Table structure for table `realtable`
--

DROP TABLE IF EXISTS `realtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realtable` (
  `realtable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned NOT NULL,
  `realtable_datestart` date DEFAULT NULL,
  `realtable_timestart` time NOT NULL,
  `realtable_timeend` time NOT NULL,
  `realtable_desc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`realtable_id`),
  KEY `realtable_program_idx` (`program_id`),
  CONSTRAINT `realtable_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtable`
--

LOCK TABLES `realtable` WRITE;
/*!40000 ALTER TABLE `realtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `realtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specclass`
--

DROP TABLE IF EXISTS `specclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specclass` (
  `class_id` int(11) NOT NULL,
  `specificity_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`class_id`,`specificity_id`),
  KEY `specclass_spec_idx` (`specificity_id`),
  CONSTRAINT `specclass_spec` FOREIGN KEY (`specificity_id`) REFERENCES `specificity` (`specificity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specclass_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specclass`
--

LOCK TABLES `specclass` WRITE;
/*!40000 ALTER TABLE `specclass` DISABLE KEYS */;
INSERT INTO `specclass` VALUES (2,1);
/*!40000 ALTER TABLE `specclass` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specificity`
--

LOCK TABLES `specificity` WRITE;
/*!40000 ALTER TABLE `specificity` DISABLE KEYS */;
INSERT INTO `specificity` VALUES (1,'Word 2007',1,NULL,'2014-12-01 20:36:01'),(3,'adfadf',1,NULL,'2014-12-01 20:49:17');
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
	INSERT into changes(changes_table,changes_user,changes_action,changes_time) values ('specificity',NEW.creator,'CREATE',NOW());
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
	INSERT into changes(changes_table,changes_user,changes_action,changes_time) values ('specificity',NEW.updater,'UPDATE',NOW());
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
  PRIMARY KEY (`program_id`,`specificity_id`),
  KEY `specprog_spec_idx` (`specificity_id`),
  CONSTRAINT `specprog_spec` FOREIGN KEY (`specificity_id`) REFERENCES `specificity` (`specificity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specprog_prog` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specprogram`
--

LOCK TABLES `specprogram` WRITE;
/*!40000 ALTER TABLE `specprogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `specprogram` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aggravator','a12345','Андрей','Клейменов','Анатольевич',NULL);
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

-- Dump completed on 2014-12-02  8:43:43
