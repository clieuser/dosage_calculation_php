-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dhc2021
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `exam_level0`
--

DROP TABLE IF EXISTS `exam_level0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_level0` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(30) NOT NULL,
  `pr_cnt` tinyint(1) NOT NULL DEFAULT '0',
  `pr_prev` varchar(30) NOT NULL,
  `pr_end` tinyint(1) NOT NULL DEFAULT '0',
  `pr_last` datetime NOT NULL,
  `pr_datetime` datetime NOT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `fm_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level0`
--

LOCK TABLES `exam_level0` WRITE;
/*!40000 ALTER TABLE `exam_level0` DISABLE KEYS */;
INSERT INTO `exam_level0` VALUES (1,'admin',5,'14',1,'2021-02-22 22:55:28','2021-02-18 14:43:14'),(2,'andrew',17,'26,25',1,'2021-02-25 17:15:17','2021-02-18 15:59:06'),(3,'admin',21,'20',1,'2021-02-25 17:00:14','2021-02-23 08:44:52'),(4,'admin',19,'22',1,'2021-03-01 05:01:46','2021-02-25 19:02:08'),(5,'andrew',17,'16',1,'2021-03-01 14:56:33','2021-02-25 21:16:03'),(6,'admin',15,'28',1,'2021-03-01 15:20:00','2021-03-01 05:01:46'),(7,'andrew',2,'6,14,11,16,19',0,'2021-03-05 23:36:44','2021-03-01 14:56:37'),(8,'admin',14,'19,12,1',1,'2021-03-01 21:09:52','2021-03-01 15:20:09'),(9,'admin',1,'6,19,11,32,27',0,'2021-03-01 21:55:10','2021-03-01 21:55:06');
/*!40000 ALTER TABLE `exam_level0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_level0_log`
--

DROP TABLE IF EXISTS `exam_level0_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_level0_log` (
  `er_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_id` int(10) NOT NULL DEFAULT '0',
  `mb_id` varchar(30) NOT NULL,
  `wr_id` int(11) NOT NULL,
  `er_cnt` int(4) NOT NULL DEFAULT '0',
  `er_content` mediumtext NOT NULL,
  `er_datetime` datetime NOT NULL,
  PRIMARY KEY (`er_id`),
  KEY `fm_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level0_log`
--

LOCK TABLES `exam_level0_log` WRITE;
/*!40000 ALTER TABLE `exam_level0_log` DISABLE KEYS */;
INSERT INTO `exam_level0_log` VALUES (1,1,'admin',14,3,'14|9693|1|9.693;14|5447|1|5.447;14|5358|5.358|5.358','0000-00-00 00:00:00'),(2,1,'admin',23,2,'23|9194|1|33098400;23|4315|1|15534000','0000-00-00 00:00:00'),(3,1,'admin',16,3,'16|7161|1|7.161;16|3444|1|3.444;16|2280|2.280|2.28','0000-00-00 00:00:00'),(4,1,'admin',2,2,'2|4030|1|4.03;2|3721|1|3.721','0000-00-00 00:00:00'),(5,1,'admin',9,2,'9|9951|1|9951000;9|5682|1|5682000','0000-00-00 00:00:00'),(6,2,'andrew',7,1,'7|6303|6303000|6303','0000-00-00 00:00:00'),(7,2,'andrew',26,1,'26|6935|69350000|6935000','0000-00-00 00:00:00'),(8,2,'andrew',11,2,'11|4756|475600|4756000;11|5386|538600|5386000','0000-00-00 00:00:00'),(9,2,'andrew',28,2,'28|9615|961500|96150;28|1137|113700|11370','0000-00-00 00:00:00'),(10,2,'andrew',5,1,'5|5281|5281|5281000','0000-00-00 00:00:00'),(11,2,'andrew',16,2,'16|9878|987800|9.878;16|7506|75.06|7.506','0000-00-00 00:00:00'),(12,2,'andrew',9,2,'9|1144|114400|1144000;9|2750|27500|2750000','0000-00-00 00:00:00'),(13,2,'andrew',4,2,'4|1164|116400|1.164;4|8632|863200|8.632','0000-00-00 00:00:00'),(14,2,'andrew',22,5,'22|4036|67.2|68.612;22|9746|162.4|165.682;22|3546|20,858|60.282;22|3389|57613|57.613;22|5477|93.109|93.109','0000-00-00 00:00:00'),(15,2,'andrew',29,1,'29|7500|75|750','0000-00-00 00:00:00'),(16,2,'andrew',12,1,'12|749|74900|0.749','0000-00-00 00:00:00'),(17,2,'andrew',15,1,'15|3607|360700|3607000','0000-00-00 00:00:00'),(18,3,'admin',28,2,'28|8656|1|86560;28|6919|1|69190','0000-00-00 00:00:00'),(19,3,'admin',13,1,'13|2699|1|2699000','0000-00-00 00:00:00'),(20,3,'admin',3,2,'3|2341|1|2341000;3|4213|1|4213000','0000-00-00 00:00:00'),(21,3,'admin',25,3,'25|2443|1|2.443;25|9086|90.86|9.086;25|5730|57.30|57.3','0000-00-00 00:00:00'),(22,3,'admin',11,1,'11|5570|1|5570000','0000-00-00 00:00:00'),(23,3,'admin',6,1,'6|7505|1|7.505','0000-00-00 00:00:00'),(24,3,'admin',9,1,'9|1824|1|1824000','0000-00-00 00:00:00'),(25,3,'admin',14,1,'14|6671|1|6.671','0000-00-00 00:00:00'),(26,3,'admin',20,6,'20|3290|1|55.93;20|9967|169.439|169.439;20|6375|108.375|108.375;20|5566|94.662|94.622;20|1818|30.906|30.906;20|724|12.308|12.308','0000-00-00 00:00:00'),(27,3,'admin',10,1,'10|3424|1|3.424','0000-00-00 00:00:00'),(28,3,'admin',21,1,'21|8674|1|520440','0000-00-00 00:00:00'),(29,3,'admin',12,1,'12|9996|1|9.996','0000-00-00 00:00:00'),(30,3,'admin',8,1,'8|7856|1|7856','0000-00-00 00:00:00'),(31,2,'andrew',13,1,'13|7215|725000|7215000','0000-00-00 00:00:00'),(32,2,'andrew',2,1,'2|8777|8.777|8.777','0000-00-00 00:00:00'),(33,2,'andrew',10,1,'10|4004|4.004|4.004','0000-00-00 00:00:00'),(34,4,'admin',12,1,'12|2123|2123000|2.123','0000-00-00 00:00:00'),(35,4,'admin',23,3,'23|1644|196846000|5918400;23|3870|23123|13932000;23|2371|213123|8535600','0000-00-00 00:00:00'),(36,4,'admin',22,4,'22|1313|21.88|22.321;22|8859|147.65|150.603;22|2497|149,820|42.449;22|4715|412312|80.155','0000-00-00 00:00:00'),(37,5,'andrew',9,1,'9|2307|21|2307000','0000-00-00 00:00:00'),(38,5,'andrew',18,1,'18|6485|23|6485','0000-00-00 00:00:00'),(39,5,'andrew',16,1,'16|6737|5|6.737','0000-00-00 00:00:00'),(40,5,'andrew',28,1,'28|5423|6|54230','0000-00-00 00:00:00'),(41,5,'andrew',23,1,'23|2146|6|7725600','0000-00-00 00:00:00'),(42,5,'andrew',12,1,'12|7492|3|7.492','0000-00-00 00:00:00'),(43,5,'andrew',3,1,'3|8190|55|8190000','0000-00-00 00:00:00'),(44,5,'andrew',11,1,'11|2407|55|2407000','0000-00-00 00:00:00'),(45,5,'andrew',20,1,'20|9136|55|155.312','0000-00-00 00:00:00'),(46,5,'andrew',7,1,'7|9952|555|9952','0000-00-00 00:00:00'),(47,4,'admin',17,1,'17|3767|3767.001|3767','0000-00-00 00:00:00'),(48,4,'admin',4,1,'4|2847|2.8472|2.847','0000-00-00 00:00:00'),(49,4,'admin',8,1,'8|522|0.522|522','0000-00-00 00:00:00'),(50,4,'admin',10,1,'10|2633|0.003|2.633','0000-00-00 00:00:00'),(51,4,'admin',25,1,'25|6918|6.918|69.18','0000-00-00 00:00:00'),(52,4,'admin',1,1,'1|1338|1338000000|1338000','0000-00-00 00:00:00'),(53,4,'admin',18,1,'18|9408|94,08|9408','0000-00-00 00:00:00'),(54,4,'admin',20,1,'20|5109|85.15|86.853','0000-00-00 00:00:00'),(55,4,'admin',21,1,'21|423|213|25380','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `exam_level0_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_level0_pass`
--

DROP TABLE IF EXISTS `exam_level0_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_level0_pass` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_id` int(10) NOT NULL DEFAULT '0' COMMENT '회차번호',
  `mb_id` varchar(30) NOT NULL,
  `wr_id` int(11) NOT NULL,
  `ps_cnt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '연속정답수',
  `ps_total` int(5) NOT NULL DEFAULT '0' COMMENT '누적정답수',
  `er_total` int(5) NOT NULL DEFAULT '0',
  `ps_datetime` datetime NOT NULL,
  PRIMARY KEY (`ps_id`),
  UNIQUE KEY `pr_id` (`pr_id`,`mb_id`,`wr_id`),
  KEY `fm_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level0_pass`
--

LOCK TABLES `exam_level0_pass` WRITE;
/*!40000 ALTER TABLE `exam_level0_pass` DISABLE KEYS */;
INSERT INTO `exam_level0_pass` VALUES (1,1,'admin',23,2,2,4,'2021-02-22 22:51:13'),(2,1,'admin',20,2,1,0,'2021-02-20 16:31:46'),(3,1,'admin',9,2,2,4,'2021-02-22 22:51:13'),(4,1,'admin',21,2,1,0,'2021-02-20 16:30:54'),(5,1,'admin',27,2,1,0,'2021-02-20 16:30:54'),(6,1,'admin',28,2,0,0,'2021-02-18 21:01:39'),(7,1,'admin',17,2,0,0,'2021-02-18 21:02:41'),(8,1,'admin',12,2,1,0,'2021-02-20 16:31:01'),(9,1,'admin',5,2,1,0,'2021-02-20 16:31:01'),(10,1,'admin',10,2,1,0,'2021-02-20 16:31:46'),(11,1,'admin',15,2,1,0,'2021-02-20 16:31:46'),(12,1,'admin',6,2,1,0,'2021-02-20 16:30:54'),(13,1,'admin',11,2,1,0,'2021-02-20 16:31:46'),(14,1,'admin',25,2,1,0,'2021-02-20 16:31:46'),(15,1,'admin',2,2,2,4,'2021-02-22 22:51:13'),(16,1,'admin',19,2,0,0,'2021-02-18 21:01:39'),(17,1,'admin',24,2,0,0,'2021-02-18 21:02:41'),(18,1,'admin',1,2,0,0,'2021-02-18 21:02:41'),(19,1,'admin',3,2,0,0,'2021-02-18 21:01:39'),(20,1,'admin',8,2,1,0,'2021-02-20 16:30:54'),(21,1,'admin',7,2,1,0,'2021-02-20 16:31:01'),(22,1,'admin',13,2,1,0,'2021-02-20 16:31:01'),(23,1,'admin',22,2,0,0,'2021-02-18 21:01:39'),(24,1,'admin',26,2,1,0,'2021-02-20 16:31:01'),(25,1,'admin',29,2,0,0,'2021-02-18 21:02:41'),(26,1,'admin',18,2,0,0,'2021-02-18 21:01:39'),(27,1,'admin',4,2,1,0,'2021-02-20 16:30:54'),(28,2,'andrew',18,2,1,0,'2021-02-22 20:35:39'),(29,2,'andrew',1,2,1,0,'2021-02-25 17:10:01'),(30,2,'andrew',21,2,1,0,'2021-02-22 13:18:29'),(31,2,'andrew',8,2,1,0,'2021-02-22 13:24:43'),(32,2,'andrew',28,2,2,2,'2021-02-25 17:03:22'),(33,1,'admin',16,2,2,5,'2021-02-22 22:55:16'),(34,1,'admin',14,2,3,5,'2021-02-22 22:55:28'),(35,2,'andrew',14,2,2,0,'2021-02-22 13:24:43'),(36,2,'andrew',7,2,2,1,'2021-02-25 17:10:01'),(37,2,'andrew',26,2,2,1,'2021-02-25 17:15:17'),(38,2,'andrew',5,2,3,1,'2021-02-25 17:14:55'),(39,2,'andrew',11,2,2,2,'2021-02-25 17:12:36'),(40,2,'andrew',16,2,2,2,'2021-02-25 17:02:15'),(41,2,'andrew',9,2,2,2,'2021-02-25 17:02:15'),(42,2,'andrew',4,2,2,2,'2021-02-25 17:06:27'),(43,2,'andrew',22,2,3,5,'2021-02-25 17:11:09'),(44,2,'andrew',29,2,2,1,'2021-02-25 17:05:24'),(45,2,'andrew',13,2,3,1,'2021-02-25 17:05:24'),(46,2,'andrew',12,2,2,1,'2021-02-25 17:13:53'),(47,2,'andrew',15,2,2,1,'2021-02-25 17:14:55'),(48,3,'admin',28,2,3,2,'2021-02-25 16:56:25'),(49,3,'admin',13,2,2,1,'2021-02-23 09:43:03'),(50,3,'admin',3,2,3,2,'2021-02-25 08:26:52'),(51,3,'admin',25,2,2,3,'2021-02-25 16:57:41'),(52,3,'admin',11,2,2,1,'2021-02-23 09:43:13'),(53,3,'admin',24,2,2,0,'2021-02-23 08:46:10'),(54,3,'admin',18,2,2,0,'2021-02-23 08:45:57'),(55,3,'admin',5,2,2,0,'2021-02-25 16:57:41'),(56,3,'admin',22,2,2,0,'2021-02-23 08:46:03'),(57,3,'admin',19,2,2,0,'2021-02-23 09:43:13'),(58,3,'admin',17,2,2,0,'2021-02-23 09:43:03'),(59,3,'admin',26,2,2,0,'2021-02-23 09:43:03'),(60,3,'admin',29,2,2,0,'2021-02-23 08:46:10'),(61,3,'admin',27,2,2,0,'2021-02-23 09:43:03'),(62,3,'admin',15,2,2,0,'2021-02-25 08:24:01'),(63,3,'admin',21,2,3,1,'2021-02-25 16:56:25'),(64,3,'admin',4,2,2,0,'2021-02-23 09:44:00'),(65,3,'admin',7,2,2,0,'2021-02-23 09:43:13'),(66,3,'admin',10,2,3,1,'2021-02-25 08:25:44'),(67,3,'admin',8,2,3,1,'2021-02-25 16:51:59'),(68,3,'admin',9,2,3,1,'2021-02-25 16:57:41'),(69,3,'admin',6,2,3,1,'2021-02-25 16:51:59'),(70,3,'admin',1,2,2,0,'2021-02-25 08:26:52'),(71,3,'admin',12,2,3,1,'2021-02-25 16:51:59'),(72,3,'admin',14,2,2,1,'2021-02-25 16:51:59'),(73,3,'admin',20,2,3,6,'2021-02-25 17:00:14'),(74,3,'admin',2,2,2,0,'2021-02-25 16:57:41'),(75,3,'admin',23,2,2,0,'2021-02-25 08:26:52'),(76,3,'admin',16,2,2,0,'2021-02-25 16:50:30'),(77,2,'andrew',3,2,2,0,'2021-02-25 17:07:51'),(78,2,'andrew',2,2,2,1,'2021-02-25 17:10:01'),(79,2,'andrew',10,2,3,1,'2021-02-25 17:14:55'),(80,2,'andrew',20,2,2,0,'2021-02-25 17:14:55'),(81,2,'andrew',27,2,2,0,'2021-02-25 17:07:51'),(82,2,'andrew',6,2,2,0,'2021-02-25 17:12:36'),(83,2,'andrew',19,2,2,0,'2021-02-25 17:12:36'),(84,2,'andrew',23,2,2,0,'2021-02-25 17:11:09'),(85,2,'andrew',24,2,2,0,'2021-02-25 17:12:36'),(86,2,'andrew',17,2,2,0,'2021-02-25 17:13:53'),(87,2,'andrew',25,2,2,0,'2021-02-25 17:15:17'),(88,4,'admin',12,2,2,1,'2021-02-25 22:34:40'),(89,4,'admin',21,2,3,1,'2021-03-01 05:01:39'),(90,4,'admin',14,2,2,0,'2021-02-25 21:01:35'),(91,4,'admin',26,2,2,0,'2021-02-25 21:31:48'),(92,4,'admin',23,2,2,3,'2021-03-01 05:01:33'),(93,4,'admin',18,2,3,1,'2021-03-01 05:01:40'),(94,4,'admin',7,2,2,0,'2021-03-01 05:01:35'),(95,4,'admin',4,2,3,1,'2021-02-25 22:34:40'),(96,4,'admin',13,2,2,0,'2021-02-25 21:38:28'),(97,4,'admin',29,2,2,0,'2021-02-25 22:37:42'),(98,4,'admin',11,2,2,0,'2021-02-25 21:37:36'),(99,4,'admin',19,2,2,0,'2021-02-25 21:37:36'),(100,4,'admin',22,2,2,4,'2021-03-01 05:01:46'),(101,4,'admin',17,2,3,1,'2021-03-01 05:01:27'),(102,5,'andrew',9,2,2,1,'2021-03-01 14:56:24'),(103,5,'andrew',18,2,2,1,'2021-03-01 14:46:01'),(104,5,'andrew',16,2,2,1,'2021-03-01 14:56:33'),(105,5,'andrew',28,2,2,1,'2021-03-01 14:56:25'),(106,5,'andrew',23,2,2,1,'2021-03-01 14:34:30'),(107,5,'andrew',12,2,2,1,'2021-03-01 14:56:15'),(108,5,'andrew',3,2,2,1,'2021-03-01 14:56:27'),(109,5,'andrew',11,2,2,1,'2021-03-01 14:56:27'),(110,5,'andrew',20,2,2,1,'2021-03-01 14:45:57'),(111,5,'andrew',7,2,2,1,'2021-03-01 14:56:29'),(112,4,'admin',8,2,2,1,'2021-03-01 05:01:37'),(113,4,'admin',10,2,2,1,'2021-03-01 05:01:40'),(114,4,'admin',15,2,2,0,'2021-02-25 22:36:14'),(115,4,'admin',6,2,2,0,'2021-02-25 21:39:29'),(116,4,'admin',27,2,2,0,'2021-02-25 21:38:28'),(117,4,'admin',3,2,2,0,'2021-02-25 21:39:29'),(118,4,'admin',25,2,2,1,'2021-03-01 05:01:35'),(119,4,'admin',1,2,2,1,'2021-02-25 22:37:05'),(120,4,'admin',28,2,2,0,'2021-03-01 05:01:31'),(121,4,'admin',20,2,2,1,'2021-03-01 05:01:33'),(122,4,'admin',5,2,2,0,'2021-03-01 05:01:37'),(123,4,'admin',2,2,2,0,'2021-03-01 05:01:35'),(124,4,'admin',24,2,2,0,'2021-03-01 05:01:27'),(125,4,'admin',9,2,2,0,'2021-03-01 05:01:39'),(126,4,'admin',31,2,2,0,'2021-03-01 05:01:31'),(127,4,'admin',16,2,2,0,'2021-03-01 05:01:31'),(128,4,'admin',32,2,2,0,'2021-03-01 05:01:35'),(129,4,'admin',33,2,2,0,'2021-03-01 05:01:37'),(130,4,'admin',34,2,2,0,'2021-03-01 05:01:39'),(131,4,'admin',30,2,2,0,'2021-03-01 05:01:39'),(132,6,'admin',21,2,2,0,'2021-03-01 05:01:52'),(133,6,'admin',8,2,2,0,'2021-03-01 05:40:34'),(134,6,'admin',5,2,2,0,'2021-03-01 05:01:54'),(135,6,'admin',24,2,2,0,'2021-03-01 05:40:57'),(136,6,'admin',34,2,2,0,'2021-03-01 05:40:06'),(137,6,'admin',4,2,2,0,'2021-03-01 05:40:34'),(138,6,'admin',17,2,2,0,'2021-03-01 06:05:59'),(139,6,'admin',22,2,2,0,'2021-03-01 05:40:57'),(140,6,'admin',11,2,2,0,'2021-03-01 06:05:59'),(141,6,'admin',14,2,2,0,'2021-03-01 05:43:14'),(142,6,'admin',20,2,2,0,'2021-03-01 05:43:14'),(143,6,'admin',3,2,2,0,'2021-03-01 15:19:31'),(144,6,'admin',6,2,2,0,'2021-03-01 05:40:06'),(145,6,'admin',1,2,2,0,'2021-03-01 05:40:34'),(146,6,'admin',30,2,2,0,'2021-03-01 05:40:34'),(147,6,'admin',12,2,2,0,'2021-03-01 05:40:26'),(148,6,'admin',25,2,2,0,'2021-03-01 05:40:26'),(149,6,'admin',26,2,2,0,'2021-03-01 15:19:31'),(150,6,'admin',10,2,2,0,'2021-03-01 05:40:57'),(151,6,'admin',27,2,2,0,'2021-03-01 05:42:54'),(152,6,'admin',16,2,2,0,'2021-03-01 05:42:54'),(153,6,'admin',23,2,2,0,'2021-03-01 05:40:35'),(154,6,'admin',13,2,2,0,'2021-03-01 05:40:35'),(155,6,'admin',9,2,2,0,'2021-03-01 05:42:54'),(156,6,'admin',19,2,2,0,'2021-03-01 15:19:29'),(157,6,'admin',15,2,2,0,'2021-03-01 06:05:59'),(158,6,'admin',18,2,2,0,'2021-03-01 05:40:57'),(159,6,'admin',29,2,2,0,'2021-03-01 05:40:57'),(160,6,'admin',32,2,2,0,'2021-03-01 06:05:59'),(161,6,'admin',2,2,2,0,'2021-03-01 05:43:14'),(162,6,'admin',7,2,2,0,'2021-03-01 15:19:29'),(163,6,'admin',31,2,2,0,'2021-03-01 15:19:31'),(164,6,'admin',33,2,2,0,'2021-03-01 15:19:31'),(165,5,'andrew',21,2,2,0,'2021-03-01 14:56:29'),(166,5,'andrew',4,2,2,0,'2021-03-01 14:45:57'),(167,5,'andrew',14,2,2,0,'2021-03-01 14:28:04'),(168,5,'andrew',24,2,2,0,'2021-03-01 14:34:30'),(169,5,'andrew',34,2,2,0,'2021-03-01 14:56:25'),(170,5,'andrew',31,2,2,0,'2021-03-01 14:34:30'),(171,5,'andrew',25,2,2,0,'2021-03-01 14:34:27'),(172,5,'andrew',1,2,2,0,'2021-03-01 14:45:57'),(173,5,'andrew',27,2,2,0,'2021-03-01 14:56:27'),(174,5,'andrew',19,2,2,0,'2021-03-01 14:46:04'),(175,5,'andrew',15,2,2,0,'2021-03-01 14:56:21'),(176,5,'andrew',13,2,2,0,'2021-03-01 14:56:31'),(177,5,'andrew',30,2,2,0,'2021-03-01 14:56:21'),(178,5,'andrew',32,2,2,0,'2021-03-01 14:56:29'),(179,5,'andrew',17,2,2,0,'2021-03-01 14:56:15'),(180,5,'andrew',2,2,2,0,'2021-03-01 14:56:31'),(181,5,'andrew',29,2,2,0,'2021-03-01 14:56:24'),(182,5,'andrew',22,2,2,0,'2021-03-01 14:56:21'),(183,5,'andrew',26,2,2,0,'2021-03-01 14:56:21'),(184,5,'andrew',33,2,2,0,'2021-03-01 14:56:25'),(185,5,'andrew',6,2,2,0,'2021-03-01 14:56:27'),(186,5,'andrew',10,2,2,0,'2021-03-01 14:56:29'),(187,5,'andrew',8,2,2,0,'2021-03-01 14:56:27'),(188,5,'andrew',5,2,2,0,'2021-03-01 14:56:31'),(189,7,'andrew',18,1,1,0,'2021-03-01 14:56:38'),(190,7,'andrew',27,1,1,0,'2021-03-01 14:56:38'),(191,7,'andrew',23,1,1,0,'2021-03-01 14:56:38'),(192,7,'andrew',12,1,1,0,'2021-03-01 14:56:38'),(193,7,'andrew',28,1,1,0,'2021-03-01 14:56:38'),(194,6,'admin',28,2,2,0,'2021-03-01 15:20:00'),(254,8,'admin',5,2,2,0,'2021-03-01 21:09:41'),(253,8,'admin',34,2,2,0,'2021-03-01 21:09:41'),(251,8,'admin',22,2,2,0,'2021-03-01 21:09:50'),(252,8,'admin',11,2,2,0,'2021-03-01 21:09:50'),(234,8,'admin',20,2,2,0,'2021-03-01 21:09:30'),(235,8,'admin',17,2,2,0,'2021-03-01 21:09:47'),(236,8,'admin',27,2,2,0,'2021-03-01 21:09:30'),(237,8,'admin',14,2,2,0,'2021-03-01 21:09:37'),(238,8,'admin',29,2,2,0,'2021-03-01 21:09:49'),(239,8,'admin',9,2,2,0,'2021-03-01 21:09:37'),(240,8,'admin',24,2,2,0,'2021-03-01 21:09:49'),(241,8,'admin',32,2,2,0,'2021-03-01 21:09:36'),(242,8,'admin',26,2,2,0,'2021-03-01 21:09:36'),(243,8,'admin',30,2,2,0,'2021-03-01 21:09:44'),(244,8,'admin',7,2,2,0,'2021-03-01 21:09:39'),(245,8,'admin',15,2,2,0,'2021-03-01 21:09:37'),(246,8,'admin',2,2,2,0,'2021-03-01 21:09:44'),(247,8,'admin',6,2,2,0,'2021-03-01 21:09:46'),(248,8,'admin',4,2,2,0,'2021-03-01 21:09:41'),(249,8,'admin',13,2,2,0,'2021-03-01 21:09:49'),(250,8,'admin',23,2,2,0,'2021-03-01 21:09:41'),(255,8,'admin',28,2,2,0,'2021-03-01 21:09:41'),(256,8,'admin',16,2,2,0,'2021-03-01 21:09:44'),(257,8,'admin',1,2,2,0,'2021-03-01 21:09:52'),(258,8,'admin',19,2,2,0,'2021-03-01 21:09:52'),(259,8,'admin',18,2,2,0,'2021-03-01 21:09:46'),(260,8,'admin',31,2,2,0,'2021-03-01 21:09:44'),(261,8,'admin',33,2,2,0,'2021-03-01 21:09:50'),(262,8,'admin',10,2,2,0,'2021-03-01 21:09:47'),(263,8,'admin',8,2,2,0,'2021-03-01 21:09:47'),(264,8,'admin',21,2,2,0,'2021-03-01 21:09:47'),(265,8,'admin',12,2,2,0,'2021-03-01 21:09:52'),(266,8,'admin',25,2,2,0,'2021-03-01 21:09:50'),(267,8,'admin',3,2,2,0,'2021-03-01 21:09:50'),(268,9,'admin',6,1,1,0,'2021-03-01 21:55:10'),(269,9,'admin',19,1,1,0,'2021-03-01 21:55:10'),(270,9,'admin',11,1,1,0,'2021-03-01 21:55:10'),(271,9,'admin',32,1,1,0,'2021-03-01 21:55:10'),(272,9,'admin',27,1,1,0,'2021-03-01 21:55:10'),(273,7,'andrew',6,1,1,0,'2021-03-05 23:36:44'),(274,7,'andrew',14,1,1,0,'2021-03-05 23:36:44'),(275,7,'andrew',11,1,1,0,'2021-03-05 23:36:44'),(276,7,'andrew',16,1,1,0,'2021-03-05 23:36:44'),(277,7,'andrew',19,1,1,0,'2021-03-05 23:36:44');
/*!40000 ALTER TABLE `exam_level0_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_level1`
--

DROP TABLE IF EXISTS `exam_level1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_level1` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(30) NOT NULL,
  `pr_cate` tinyint(1) NOT NULL DEFAULT '0',
  `pr_cnt` tinyint(1) NOT NULL DEFAULT '0',
  `pr_prev` varchar(30) NOT NULL,
  `pr_end` tinyint(1) NOT NULL DEFAULT '0',
  `pr_last` datetime NOT NULL,
  `pr_datetime` datetime NOT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `mb_id` (`mb_id`,`pr_cate`),
  KEY `fm_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level1`
--

LOCK TABLES `exam_level1` WRITE;
/*!40000 ALTER TABLE `exam_level1` DISABLE KEYS */;
INSERT INTO `exam_level1` VALUES (1,'admin',0,3,'7',1,'2021-02-25 18:20:00','2021-02-25 18:15:33'),(2,'andrew',0,0,'9',0,'2021-03-03 20:28:27','2021-02-25 18:15:38'),(3,'admin',1,3,'15',1,'2021-02-25 18:27:05','2021-02-25 18:20:19'),(4,'admin',2,0,'1',0,'2021-02-25 18:31:04','2021-02-25 18:29:07');
/*!40000 ALTER TABLE `exam_level1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_level1_age`
--

DROP TABLE IF EXISTS `exam_level1_age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_level1_age` (
  `ag_sex` tinyint(1) unsigned NOT NULL COMMENT '0:m, 1:f',
  `ag_age` tinyint(1) unsigned NOT NULL,
  `ag_wa` float(4,1) NOT NULL,
  `ag_wb` float(4,1) NOT NULL,
  `ag_wc` float(4,1) NOT NULL,
  `ag_ha` float(4,1) NOT NULL,
  PRIMARY KEY (`ag_sex`,`ag_age`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level1_age`
--

LOCK TABLES `exam_level1_age` WRITE;
/*!40000 ALTER TABLE `exam_level1_age` DISABLE KEYS */;
INSERT INTO `exam_level1_age` VALUES (0,3,15.8,12.9,19.6,99.8),(0,4,17.9,14.4,23.0,106.3),(0,5,20.1,16.0,26.7,112.8),(0,6,22.7,17.8,31.4,119.0),(0,7,25.8,19.6,36.8,125.0),(0,8,29.4,21.6,42.7,130.7),(0,9,33.4,23.6,49.1,136.1),(0,10,37.8,25.8,55.9,141.7),(0,11,42.8,28.5,63.2,147.9),(0,12,48.2,31.9,70.5,155.0),(0,13,53.5,36.0,76.5,162.0),(0,14,58.2,40.6,80.6,167.4),(0,15,61.7,44.8,83.0,170.5),(0,16,64.2,48.1,84.9,172.1),(0,17,65.9,50.2,86.5,173.1),(0,18,67.5,52.1,88.0,174.1),(0,19,74.8,57.6,95.7,173.8),(0,30,77.3,59.5,98.2,174.1),(0,40,74.9,57.7,94.4,172.2),(0,50,71.2,55.5,89.0,169.4),(0,60,68.3,54.0,84.7,166.9),(0,70,65.5,52.4,80.6,164.9),(0,80,61.7,50.0,75.3,162.9),(1,3,15.2,12.3,18.9,98.6),(1,4,17.3,13.9,22.4,105.1),(1,5,19.5,15.5,26.1,111.6),(1,6,22.0,17.1,30.6,117.8),(1,7,24.9,18.8,35.8,123.8),(1,8,28.3,20.8,41.5,129.6),(1,9,32.2,23.1,47.9,135.8),(1,10,36.7,25.6,54.4,142.5),(1,11,41.5,28.7,60.4,148.9),(1,12,45.8,32.3,65.2,154.0),(1,13,49.2,35.9,68.3,157.3),(1,14,51.6,38.8,70.0,159.0),(1,15,53.2,40.7,70.7,159.8),(1,16,54.0,41.8,71.1,160.1),(1,17,54.1,42.4,71.1,160.5),(1,18,54.0,42.8,71.2,160.9),(1,19,56.9,45.5,75.1,161.4),(1,30,58.1,46.5,76.6,161.2),(1,40,58.6,46.9,77.3,159.3),(1,50,58.3,46.6,76.9,156.7),(1,60,58.0,46.4,76.5,154.2),(1,70,56.5,45.2,74.5,151.1),(1,80,52.0,41.6,68.6,147.9);
/*!40000 ALTER TABLE `exam_level1_age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_level1_log`
--

DROP TABLE IF EXISTS `exam_level1_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_level1_log` (
  `lo_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_id` int(10) NOT NULL DEFAULT '0',
  `mb_id` varchar(30) NOT NULL,
  `wr_id` int(11) NOT NULL,
  `as_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '문제번호',
  `lo_false` int(4) NOT NULL DEFAULT '0',
  `lo_true` int(4) NOT NULL DEFAULT '0',
  `lo_datetime` datetime NOT NULL,
  PRIMARY KEY (`lo_id`),
  KEY `fm_id` (`mb_id`,`pr_id`,`wr_id`,`as_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level1_log`
--

LOCK TABLES `exam_level1_log` WRITE;
/*!40000 ALTER TABLE `exam_level1_log` DISABLE KEYS */;
INSERT INTO `exam_level1_log` VALUES (1,1,'admin',8,0,0,5,'2021-02-26 00:27:51'),(2,1,'admin',2,0,0,6,'2021-02-26 00:28:11'),(3,1,'admin',12,0,1,1,'2021-02-25 20:29:24'),(4,1,'admin',7,0,0,1,'2021-02-25 18:20:00'),(5,1,'admin',1,0,0,1,'2021-02-25 18:20:50'),(6,1,'admin',10,0,0,5,'2021-02-25 22:40:07'),(7,1,'admin',9,0,0,4,'2021-02-26 00:28:39'),(8,1,'admin',9,1,0,4,'2021-02-26 00:28:39'),(9,1,'admin',9,2,0,4,'2021-02-26 00:28:39'),(10,3,'admin',2,0,0,1,'2021-02-25 18:25:57'),(11,3,'admin',11,0,1,1,'2021-02-25 18:27:01'),(12,3,'admin',11,1,0,2,'2021-02-25 18:27:01'),(13,3,'admin',6,0,0,2,'2021-02-25 20:36:08'),(14,3,'admin',6,1,0,2,'2021-02-25 20:36:08'),(15,3,'admin',6,2,0,2,'2021-02-25 20:36:08'),(16,3,'admin',15,0,0,1,'2021-02-25 18:27:05'),(17,3,'admin',9,0,0,1,'2021-02-25 18:28:48'),(18,3,'admin',9,1,0,1,'2021-02-25 18:28:48'),(19,3,'admin',9,2,0,1,'2021-02-25 18:28:48'),(20,4,'admin',2,0,0,1,'2021-02-25 18:29:11'),(21,4,'admin',8,0,0,1,'2021-02-25 18:29:13'),(22,4,'admin',4,0,0,1,'2021-02-25 18:29:19'),(23,4,'admin',14,0,1,0,'2021-02-25 18:30:09'),(24,4,'admin',1,0,1,0,'2021-02-25 18:31:04'),(25,2,'andrew',1,0,3,0,'2021-03-02 12:42:37'),(26,2,'andrew',8,0,2,2,'2021-03-01 14:32:54'),(27,2,'andrew',9,0,3,0,'2021-03-03 20:28:27'),(28,2,'andrew',9,1,3,0,'2021-03-03 20:28:27'),(29,2,'andrew',9,2,3,0,'2021-03-03 20:28:27'),(30,3,'admin',13,0,0,1,'2021-02-25 20:35:53'),(31,1,'admin',20,0,0,21,'2021-03-04 05:18:38'),(32,3,'admin',20,0,0,5,'2021-02-28 11:10:04'),(33,4,'admin',20,0,0,2,'2021-02-28 11:10:17'),(34,2,'andrew',2,0,1,1,'2021-03-01 14:30:09'),(35,2,'andrew',20,0,2,0,'2021-03-02 12:41:35'),(36,2,'andrew',12,0,1,0,'2021-03-02 12:42:09');
/*!40000 ALTER TABLE `exam_level1_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_auth`
--

DROP TABLE IF EXISTS `g5_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_auth` (
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `au_menu` varchar(20) NOT NULL DEFAULT '',
  `au_auth` set('r','w','d') NOT NULL DEFAULT '',
  PRIMARY KEY (`mb_id`,`au_menu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_auth`
--

LOCK TABLES `g5_auth` WRITE;
/*!40000 ALTER TABLE `g5_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_autosave`
--

DROP TABLE IF EXISTS `g5_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_autosave` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL,
  `as_uid` bigint(20) unsigned NOT NULL,
  `as_subject` varchar(255) NOT NULL,
  `as_content` text NOT NULL,
  `as_datetime` datetime NOT NULL,
  PRIMARY KEY (`as_id`),
  UNIQUE KEY `as_uid` (`as_uid`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_autosave`
--

LOCK TABLES `g5_autosave` WRITE;
/*!40000 ALTER TABLE `g5_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board`
--

DROP TABLE IF EXISTS `g5_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board` (
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `gr_id` varchar(255) NOT NULL DEFAULT '',
  `bo_subject` varchar(255) NOT NULL DEFAULT '',
  `bo_mobile_subject` varchar(255) NOT NULL DEFAULT '',
  `bo_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
  `bo_admin` varchar(255) NOT NULL DEFAULT '',
  `bo_list_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_read_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_write_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_reply_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_comment_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_upload_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_download_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_html_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_link_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_count_delete` tinyint(4) NOT NULL DEFAULT '0',
  `bo_count_modify` tinyint(4) NOT NULL DEFAULT '0',
  `bo_read_point` int(11) NOT NULL DEFAULT '0',
  `bo_write_point` int(11) NOT NULL DEFAULT '0',
  `bo_comment_point` int(11) NOT NULL DEFAULT '0',
  `bo_download_point` int(11) NOT NULL DEFAULT '0',
  `bo_use_category` tinyint(4) NOT NULL DEFAULT '0',
  `bo_category_list` text NOT NULL,
  `bo_use_sideview` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_file_content` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_secret` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_dhtml_editor` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_rss_view` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_good` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_nogood` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_name` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_signature` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_ip_view` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_list_view` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_list_file` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_list_content` tinyint(4) NOT NULL DEFAULT '0',
  `bo_table_width` int(11) NOT NULL DEFAULT '0',
  `bo_subject_len` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_subject_len` int(11) NOT NULL DEFAULT '0',
  `bo_page_rows` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_page_rows` int(11) NOT NULL DEFAULT '0',
  `bo_new` int(11) NOT NULL DEFAULT '0',
  `bo_hot` int(11) NOT NULL DEFAULT '0',
  `bo_image_width` int(11) NOT NULL DEFAULT '0',
  `bo_skin` varchar(255) NOT NULL DEFAULT '',
  `bo_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `bo_include_head` varchar(255) NOT NULL DEFAULT '',
  `bo_include_tail` varchar(255) NOT NULL DEFAULT '',
  `bo_content_head` text NOT NULL,
  `bo_mobile_content_head` text NOT NULL,
  `bo_content_tail` text NOT NULL,
  `bo_mobile_content_tail` text NOT NULL,
  `bo_insert_content` text NOT NULL,
  `bo_gallery_cols` int(11) NOT NULL DEFAULT '0',
  `bo_gallery_width` int(11) NOT NULL DEFAULT '0',
  `bo_gallery_height` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_gallery_width` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_gallery_height` int(11) NOT NULL DEFAULT '0',
  `bo_upload_size` int(11) NOT NULL DEFAULT '0',
  `bo_reply_order` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_search` tinyint(4) NOT NULL DEFAULT '0',
  `bo_order` int(11) NOT NULL DEFAULT '0',
  `bo_count_write` int(11) NOT NULL DEFAULT '0',
  `bo_count_comment` int(11) NOT NULL DEFAULT '0',
  `bo_write_min` int(11) NOT NULL DEFAULT '0',
  `bo_write_max` int(11) NOT NULL DEFAULT '0',
  `bo_comment_min` int(11) NOT NULL DEFAULT '0',
  `bo_comment_max` int(11) NOT NULL DEFAULT '0',
  `bo_notice` text NOT NULL,
  `bo_upload_count` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_email` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_cert` enum('','cert','adult','hp-cert','hp-adult') NOT NULL DEFAULT '',
  `bo_use_sns` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_captcha` tinyint(4) NOT NULL DEFAULT '0',
  `bo_sort_field` varchar(255) NOT NULL DEFAULT '',
  `bo_1_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_2_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_3_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_4_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_5_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_6_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_7_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_8_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_9_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_10_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_1` varchar(255) NOT NULL DEFAULT '',
  `bo_2` varchar(255) NOT NULL DEFAULT '',
  `bo_3` varchar(255) NOT NULL DEFAULT '',
  `bo_4` varchar(255) NOT NULL DEFAULT '',
  `bo_5` varchar(255) NOT NULL DEFAULT '',
  `bo_6` varchar(255) NOT NULL DEFAULT '',
  `bo_7` varchar(255) NOT NULL DEFAULT '',
  `bo_8` varchar(255) NOT NULL DEFAULT '',
  `bo_9` varchar(255) NOT NULL DEFAULT '',
  `bo_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bo_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board`
--

LOCK TABLES `g5_board` WRITE;
/*!40000 ALTER TABLE `g5_board` DISABLE KEYS */;
INSERT INTO `g5_board` VALUES ('level0','exam','level0 치환문제','','both','',10,10,10,10,10,10,10,10,10,1,1,0,0,0,0,1,'사용|미사용',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,50,50,15,24,100,600,'level0','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,0,0,34,0,0,0,0,0,'',0,0,'',0,0,'wr_good asc, wr_num, wr_reply','','','','','','','','','','','','','','','','','','','',''),('level1','exam','level1 시나리오','','both','',10,10,10,10,10,10,10,10,10,1,1,0,0,0,0,1,'사용|미사용',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'level1','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,0,0,20,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_file`
--

DROP TABLE IF EXISTS `g5_board_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_file` (
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int(11) NOT NULL DEFAULT '0',
  `bf_no` int(11) NOT NULL DEFAULT '0',
  `bf_source` varchar(255) NOT NULL DEFAULT '',
  `bf_file` varchar(255) NOT NULL DEFAULT '',
  `bf_download` int(11) NOT NULL,
  `bf_content` text NOT NULL,
  `bf_fileurl` varchar(255) NOT NULL DEFAULT '',
  `bf_thumburl` varchar(255) NOT NULL DEFAULT '',
  `bf_storage` varchar(50) NOT NULL DEFAULT '',
  `bf_filesize` int(11) NOT NULL DEFAULT '0',
  `bf_width` int(11) NOT NULL DEFAULT '0',
  `bf_height` smallint(6) NOT NULL DEFAULT '0',
  `bf_type` tinyint(4) NOT NULL DEFAULT '0',
  `bf_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bo_table`,`wr_id`,`bf_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_file`
--

LOCK TABLES `g5_board_file` WRITE;
/*!40000 ALTER TABLE `g5_board_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_good`
--

DROP TABLE IF EXISTS `g5_board_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_good` (
  `bg_id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bg_flag` varchar(255) NOT NULL DEFAULT '',
  `bg_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bg_id`),
  UNIQUE KEY `fkey1` (`bo_table`,`wr_id`,`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_good`
--

LOCK TABLES `g5_board_good` WRITE;
/*!40000 ALTER TABLE `g5_board_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_new`
--

DROP TABLE IF EXISTS `g5_board_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_new` (
  `bn_id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int(11) NOT NULL DEFAULT '0',
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `bn_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`bn_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_new`
--

LOCK TABLES `g5_board_new` WRITE;
/*!40000 ALTER TABLE `g5_board_new` DISABLE KEYS */;
INSERT INTO `g5_board_new` VALUES (1,'level0',1,1,'2021-02-15 23:48:12','admin'),(2,'level0',2,2,'2021-02-16 00:46:04','admin'),(3,'level0',3,3,'2021-02-16 00:47:54','admin'),(4,'level0',4,4,'2021-02-16 00:48:15','admin'),(5,'level0',5,5,'2021-02-16 00:48:37','admin'),(6,'level0',6,6,'2021-02-16 00:50:59','admin'),(7,'level0',7,7,'2021-02-16 00:52:07','admin'),(8,'level0',8,8,'2021-02-16 00:56:01','admin'),(9,'level0',9,9,'2021-02-16 00:56:30','admin'),(10,'level0',10,10,'2021-02-16 00:56:57','admin'),(11,'level0',11,11,'2021-02-16 00:57:15','admin'),(12,'level0',12,12,'2021-02-16 00:57:34','admin'),(13,'level0',13,13,'2021-02-16 00:57:51','admin'),(14,'level0',14,14,'2021-02-16 00:58:10','admin'),(15,'level0',15,15,'2021-02-16 00:58:26','admin'),(16,'level0',16,16,'2021-02-16 00:58:56','admin'),(17,'level0',17,17,'2021-02-16 00:59:24','admin'),(18,'level0',18,18,'2021-02-16 00:59:45','admin'),(19,'level0',19,19,'2021-02-16 01:00:04','admin'),(20,'level0',20,20,'2021-02-16 01:00:23','admin'),(21,'level0',21,21,'2021-02-16 01:00:49','admin'),(22,'level0',22,22,'2021-02-16 01:01:10','admin'),(23,'level0',23,23,'2021-02-16 01:01:33','admin'),(24,'level0',24,24,'2021-02-16 01:01:47','admin'),(25,'level0',25,25,'2021-02-16 01:02:06','admin'),(26,'level0',26,26,'2021-02-16 01:02:23','admin'),(27,'level0',27,27,'2021-02-16 01:02:38','admin'),(28,'level0',28,28,'2021-02-16 01:02:56','admin'),(29,'level0',29,29,'2021-02-16 01:03:11','admin'),(30,'level1',1,1,'2021-02-20 20:52:37','admin'),(31,'level1',2,2,'2021-02-21 01:08:17','admin'),(32,'level1',3,3,'2021-02-21 01:29:33','admin'),(33,'level1',4,4,'2021-02-21 02:49:35','admin'),(34,'level1',5,5,'2021-02-21 03:45:02','admin'),(35,'level1',6,6,'2021-02-21 04:06:25','admin'),(36,'level1',7,7,'2021-02-21 04:25:19','admin'),(37,'level1',8,8,'2021-02-21 05:00:23','admin'),(38,'level1',9,9,'2021-02-21 05:13:04','admin'),(39,'level1',10,10,'2021-02-21 05:36:06','admin'),(40,'level1',11,11,'2021-02-21 05:49:49','admin'),(41,'level1',12,12,'2021-02-21 06:12:08','admin'),(42,'level1',13,13,'2021-02-21 06:22:07','admin'),(43,'level1',14,14,'2021-02-21 06:31:04','admin'),(44,'level1',15,15,'2021-02-21 06:45:06','admin'),(45,'level1',16,16,'2021-02-21 07:08:36','admin'),(46,'level1',17,17,'2021-02-21 07:37:24','admin'),(47,'level1',18,18,'2021-02-21 07:55:33','admin'),(48,'level1',19,19,'2021-02-22 02:47:47','admin'),(49,'level1',20,20,'2021-02-22 03:50:04','admin'),(50,'level0',30,30,'2021-02-26 20:57:34','admin'),(51,'level0',31,31,'2021-02-26 20:58:19','admin'),(52,'level0',32,32,'2021-02-26 21:17:58','admin'),(53,'level0',33,33,'2021-02-26 21:18:51','admin'),(54,'level0',34,34,'2021-02-26 21:20:11','admin');
/*!40000 ALTER TABLE `g5_board_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_cert_history`
--

DROP TABLE IF EXISTS `g5_cert_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_cert_history` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `cr_company` varchar(255) NOT NULL DEFAULT '',
  `cr_method` varchar(255) NOT NULL DEFAULT '',
  `cr_ip` varchar(255) NOT NULL DEFAULT '',
  `cr_date` date NOT NULL DEFAULT '0000-00-00',
  `cr_time` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`cr_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_cert_history`
--

LOCK TABLES `g5_cert_history` WRITE;
/*!40000 ALTER TABLE `g5_cert_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_cert_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config`
--

DROP TABLE IF EXISTS `g5_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config` (
  `cf_title` varchar(255) NOT NULL DEFAULT '',
  `cf_theme` varchar(100) NOT NULL DEFAULT '',
  `cf_admin` varchar(100) NOT NULL DEFAULT '',
  `cf_admin_email` varchar(100) NOT NULL DEFAULT '',
  `cf_admin_email_name` varchar(100) NOT NULL DEFAULT '',
  `cf_add_script` text NOT NULL,
  `cf_use_point` tinyint(4) NOT NULL DEFAULT '0',
  `cf_point_term` int(11) NOT NULL DEFAULT '0',
  `cf_use_copy_log` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_email_certify` tinyint(4) NOT NULL DEFAULT '0',
  `cf_login_point` int(11) NOT NULL DEFAULT '0',
  `cf_cut_name` tinyint(4) NOT NULL DEFAULT '0',
  `cf_nick_modify` int(11) NOT NULL DEFAULT '0',
  `cf_new_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_new_rows` int(11) NOT NULL DEFAULT '0',
  `cf_search_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_connect_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_faq_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_read_point` int(11) NOT NULL DEFAULT '0',
  `cf_write_point` int(11) NOT NULL DEFAULT '0',
  `cf_comment_point` int(11) NOT NULL DEFAULT '0',
  `cf_download_point` int(11) NOT NULL DEFAULT '0',
  `cf_write_pages` int(11) NOT NULL DEFAULT '0',
  `cf_mobile_pages` int(11) NOT NULL DEFAULT '0',
  `cf_link_target` varchar(50) NOT NULL DEFAULT '',
  `cf_bbs_rewrite` tinyint(4) NOT NULL DEFAULT '0',
  `cf_delay_sec` int(11) NOT NULL DEFAULT '0',
  `cf_filter` text NOT NULL,
  `cf_possible_ip` text NOT NULL,
  `cf_intercept_ip` text NOT NULL,
  `cf_analytics` text NOT NULL,
  `cf_add_meta` text NOT NULL,
  `cf_syndi_token` varchar(255) NOT NULL,
  `cf_syndi_except` text NOT NULL,
  `cf_member_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_use_homepage` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_homepage` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_tel` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_tel` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_hp` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_hp` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_addr` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_addr` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_signature` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_signature` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_profile` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_profile` tinyint(4) NOT NULL DEFAULT '0',
  `cf_register_level` tinyint(4) NOT NULL DEFAULT '0',
  `cf_register_point` int(11) NOT NULL DEFAULT '0',
  `cf_icon_level` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_recommend` tinyint(4) NOT NULL DEFAULT '0',
  `cf_recommend_point` int(11) NOT NULL DEFAULT '0',
  `cf_leave_day` int(11) NOT NULL DEFAULT '0',
  `cf_search_part` int(11) NOT NULL DEFAULT '0',
  `cf_email_use` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_group_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_board_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_write` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_comment_all` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_mb_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_mb_member` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_po_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_prohibit_id` text NOT NULL,
  `cf_prohibit_email` text NOT NULL,
  `cf_new_del` int(11) NOT NULL DEFAULT '0',
  `cf_memo_del` int(11) NOT NULL DEFAULT '0',
  `cf_visit_del` int(11) NOT NULL DEFAULT '0',
  `cf_popular_del` int(11) NOT NULL DEFAULT '0',
  `cf_optimize_date` date NOT NULL DEFAULT '0000-00-00',
  `cf_use_member_icon` tinyint(4) NOT NULL DEFAULT '0',
  `cf_member_icon_size` int(11) NOT NULL DEFAULT '0',
  `cf_member_icon_width` int(11) NOT NULL DEFAULT '0',
  `cf_member_icon_height` int(11) NOT NULL DEFAULT '0',
  `cf_member_img_size` int(11) NOT NULL DEFAULT '0',
  `cf_member_img_width` int(11) NOT NULL DEFAULT '0',
  `cf_member_img_height` int(11) NOT NULL DEFAULT '0',
  `cf_login_minutes` int(11) NOT NULL DEFAULT '0',
  `cf_image_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_flash_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_movie_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_formmail_is_member` tinyint(4) NOT NULL DEFAULT '0',
  `cf_page_rows` int(11) NOT NULL DEFAULT '0',
  `cf_mobile_page_rows` int(11) NOT NULL DEFAULT '0',
  `cf_visit` varchar(255) NOT NULL DEFAULT '',
  `cf_max_po_id` int(11) NOT NULL DEFAULT '0',
  `cf_stipulation` text NOT NULL,
  `cf_privacy` text NOT NULL,
  `cf_open_modify` int(11) NOT NULL DEFAULT '0',
  `cf_memo_send_point` int(11) NOT NULL DEFAULT '0',
  `cf_mobile_new_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_search_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_connect_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_faq_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_member_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_captcha_mp3` varchar(255) NOT NULL DEFAULT '',
  `cf_editor` varchar(50) NOT NULL DEFAULT '',
  `cf_cert_use` tinyint(4) NOT NULL DEFAULT '0',
  `cf_cert_ipin` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_hp` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kcb_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kcp_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_lg_mid` varchar(100) NOT NULL DEFAULT '',
  `cf_lg_mert_key` varchar(100) NOT NULL DEFAULT '',
  `cf_cert_limit` int(11) NOT NULL DEFAULT '0',
  `cf_cert_req` tinyint(4) NOT NULL DEFAULT '0',
  `cf_sms_use` varchar(255) NOT NULL DEFAULT '',
  `cf_sms_type` varchar(10) NOT NULL DEFAULT '',
  `cf_icode_id` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_pw` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_server_ip` varchar(50) NOT NULL DEFAULT '',
  `cf_icode_server_port` varchar(50) NOT NULL DEFAULT '',
  `cf_googl_shorturl_apikey` varchar(50) NOT NULL DEFAULT '',
  `cf_social_login_use` tinyint(4) NOT NULL DEFAULT '0',
  `cf_social_servicelist` varchar(255) NOT NULL DEFAULT '',
  `cf_payco_clientid` varchar(100) NOT NULL DEFAULT '',
  `cf_payco_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_facebook_appid` varchar(100) NOT NULL,
  `cf_facebook_secret` varchar(100) NOT NULL,
  `cf_twitter_key` varchar(100) NOT NULL,
  `cf_twitter_secret` varchar(100) NOT NULL,
  `cf_google_clientid` varchar(100) NOT NULL DEFAULT '',
  `cf_google_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_naver_clientid` varchar(100) NOT NULL DEFAULT '',
  `cf_naver_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_kakao_rest_key` varchar(100) NOT NULL DEFAULT '',
  `cf_kakao_client_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_kakao_js_apikey` varchar(100) NOT NULL,
  `cf_captcha` varchar(100) NOT NULL DEFAULT '',
  `cf_recaptcha_site_key` varchar(100) NOT NULL DEFAULT '',
  `cf_recaptcha_secret_key` varchar(100) NOT NULL DEFAULT '',
  `cf_1_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_2_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_3_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_4_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_5_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_6_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_7_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_8_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_9_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_10_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_1` varchar(255) NOT NULL DEFAULT '',
  `cf_2` varchar(255) NOT NULL DEFAULT '',
  `cf_3` varchar(255) NOT NULL DEFAULT '',
  `cf_4` varchar(255) NOT NULL DEFAULT '',
  `cf_5` varchar(255) NOT NULL DEFAULT '',
  `cf_6` varchar(255) NOT NULL DEFAULT '',
  `cf_7` varchar(255) NOT NULL DEFAULT '',
  `cf_8` varchar(255) NOT NULL DEFAULT '',
  `cf_9` varchar(255) NOT NULL DEFAULT '',
  `cf_10` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config`
--

LOCK TABLES `g5_config` WRITE;
/*!40000 ALTER TABLE `g5_config` DISABLE KEYS */;
INSERT INTO `g5_config` VALUES ('간호사 실전 트레이닝','','admin','admin@domain.com','최고관리자','',0,0,0,0,100,15,60,'basic',15,'basic','basic','basic',0,0,0,0,10,5,'_blank',0,30,'18아,18놈,18새끼,18뇬,18노,18것,18넘,개년,개놈,개뇬,개새,개색끼,개세끼,개세이,개쉐이,개쉑,개쉽,개시키,개자식,개좆,게색기,게색끼,광뇬,뇬,눈깔,뉘미럴,니귀미,니기미,니미,도촬,되질래,뒈져라,뒈진다,디져라,디진다,디질래,병쉰,병신,뻐큐,뻑큐,뽁큐,삐리넷,새꺄,쉬발,쉬밸,쉬팔,쉽알,스패킹,스팽,시벌,시부랄,시부럴,시부리,시불,시브랄,시팍,시팔,시펄,실밸,십8,십쌔,십창,싶알,쌉년,썅놈,쌔끼,쌩쑈,썅,써벌,썩을년,쎄꺄,쎄엑,쓰바,쓰발,쓰벌,쓰팔,씨8,씨댕,씨바,씨발,씨뱅,씨봉알,씨부랄,씨부럴,씨부렁,씨부리,씨불,씨브랄,씨빠,씨빨,씨뽀랄,씨팍,씨팔,씨펄,씹,아가리,아갈이,엄창,접년,잡놈,재랄,저주글,조까,조빠,조쟁이,조지냐,조진다,조질래,존나,존니,좀물,좁년,좃,좆,좇,쥐랄,쥐롤,쥬디,지랄,지럴,지롤,지미랄,쫍빱,凸,퍽큐,뻑큐,빠큐,ㅅㅂㄹㅁ','','','','','','','basic',0,0,0,0,0,0,0,0,0,0,0,0,3,1000,2,0,0,30,10000,1,0,0,0,0,0,0,0,0,'admin,administrator,관리자,운영자,어드민,주인장,webmaster,웹마스터,sysop,시삽,시샵,manager,매니저,메니저,root,루트,su,guest,방문객','',30,180,180,180,'2021-03-05',2,5000,22,22,50000,60,60,10,'gif|jpg|jpeg|png','swf','asx|asf|wmv|wma|mpg|mpeg|mov|avi|mp3',1,15,15,'오늘:1,어제:,최대:23,전체:158',0,'해당 홈페이지에 맞는 회원가입약관을 입력합니다.','해당 홈페이지에 맞는 개인정보처리방침을 입력합니다.',0,500,'basic','basic','basic','basic','basic','basic','smarteditor2',0,'','','','','','',2,0,'','','','','211.172.232.124','7295','',0,'','','','','','','','','','','','','','','kcaptcha','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_content`
--

DROP TABLE IF EXISTS `g5_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_content` (
  `co_id` varchar(20) NOT NULL DEFAULT '',
  `co_html` tinyint(4) NOT NULL DEFAULT '0',
  `co_subject` varchar(255) NOT NULL DEFAULT '',
  `co_content` longtext NOT NULL,
  `co_seo_title` varchar(255) NOT NULL DEFAULT '',
  `co_mobile_content` longtext NOT NULL,
  `co_skin` varchar(255) NOT NULL DEFAULT '',
  `co_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `co_tag_filter_use` tinyint(4) NOT NULL DEFAULT '0',
  `co_hit` int(11) NOT NULL DEFAULT '0',
  `co_include_head` varchar(255) NOT NULL,
  `co_include_tail` varchar(255) NOT NULL,
  PRIMARY KEY (`co_id`),
  KEY `co_seo_title` (`co_seo_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_content`
--

LOCK TABLES `g5_content` WRITE;
/*!40000 ALTER TABLE `g5_content` DISABLE KEYS */;
INSERT INTO `g5_content` VALUES ('company',1,'회사소개','<p align=center><b>회사소개에 대한 내용을 입력하십시오.</b></p>','','','','',0,0,'',''),('privacy',1,'개인정보 처리방침','<p align=center><b>개인정보 처리방침에 대한 내용을 입력하십시오.</b></p>','','','','',0,0,'',''),('provision',1,'서비스 이용약관','<p align=center><b>서비스 이용약관에 대한 내용을 입력하십시오.</b></p>','','','','',0,0,'','');
/*!40000 ALTER TABLE `g5_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq`
--

DROP TABLE IF EXISTS `g5_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_faq` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fm_id` int(11) NOT NULL DEFAULT '0',
  `fa_subject` text NOT NULL,
  `fa_content` text NOT NULL,
  `fa_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fa_id`),
  KEY `fm_id` (`fm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq`
--

LOCK TABLES `g5_faq` WRITE;
/*!40000 ALTER TABLE `g5_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq_master`
--

DROP TABLE IF EXISTS `g5_faq_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_faq_master` (
  `fm_id` int(11) NOT NULL AUTO_INCREMENT,
  `fm_subject` varchar(255) NOT NULL DEFAULT '',
  `fm_head_html` text NOT NULL,
  `fm_tail_html` text NOT NULL,
  `fm_mobile_head_html` text NOT NULL,
  `fm_mobile_tail_html` text NOT NULL,
  `fm_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq_master`
--

LOCK TABLES `g5_faq_master` WRITE;
/*!40000 ALTER TABLE `g5_faq_master` DISABLE KEYS */;
INSERT INTO `g5_faq_master` VALUES (1,'자주하시는 질문','','','','',0);
/*!40000 ALTER TABLE `g5_faq_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group`
--

DROP TABLE IF EXISTS `g5_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_group` (
  `gr_id` varchar(10) NOT NULL DEFAULT '',
  `gr_subject` varchar(255) NOT NULL DEFAULT '',
  `gr_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
  `gr_admin` varchar(255) NOT NULL DEFAULT '',
  `gr_use_access` tinyint(4) NOT NULL DEFAULT '0',
  `gr_order` int(11) NOT NULL DEFAULT '0',
  `gr_1_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_2_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_3_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_4_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_5_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_6_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_7_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_8_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_9_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_10_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_1` varchar(255) NOT NULL DEFAULT '',
  `gr_2` varchar(255) NOT NULL DEFAULT '',
  `gr_3` varchar(255) NOT NULL DEFAULT '',
  `gr_4` varchar(255) NOT NULL DEFAULT '',
  `gr_5` varchar(255) NOT NULL DEFAULT '',
  `gr_6` varchar(255) NOT NULL DEFAULT '',
  `gr_7` varchar(255) NOT NULL DEFAULT '',
  `gr_8` varchar(255) NOT NULL DEFAULT '',
  `gr_9` varchar(255) NOT NULL DEFAULT '',
  `gr_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group`
--

LOCK TABLES `g5_group` WRITE;
/*!40000 ALTER TABLE `g5_group` DISABLE KEYS */;
INSERT INTO `g5_group` VALUES ('exam','시험문제','both','',0,0,'','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group_member`
--

DROP TABLE IF EXISTS `g5_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_group_member` (
  `gm_id` int(11) NOT NULL AUTO_INCREMENT,
  `gr_id` varchar(255) NOT NULL DEFAULT '',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `gm_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`gm_id`),
  KEY `gr_id` (`gr_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group_member`
--

LOCK TABLES `g5_group_member` WRITE;
/*!40000 ALTER TABLE `g5_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_login`
--

DROP TABLE IF EXISTS `g5_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_login` (
  `lo_ip` varchar(100) NOT NULL DEFAULT '',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `lo_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lo_location` text NOT NULL,
  `lo_url` text NOT NULL,
  PRIMARY KEY (`lo_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_login`
--

LOCK TABLES `g5_login` WRITE;
/*!40000 ALTER TABLE `g5_login` DISABLE KEYS */;
INSERT INTO `g5_login` VALUES ('121.130.2.43','andrew','2021-03-11 22:34:20','간호사 실전 트레이닝','/index.php');
/*!40000 ALTER TABLE `g5_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_mail`
--

DROP TABLE IF EXISTS `g5_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_mail` (
  `ma_id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_subject` varchar(255) NOT NULL DEFAULT '',
  `ma_content` mediumtext NOT NULL,
  `ma_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ma_ip` varchar(255) NOT NULL DEFAULT '',
  `ma_last_option` text NOT NULL,
  PRIMARY KEY (`ma_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_mail`
--

LOCK TABLES `g5_mail` WRITE;
/*!40000 ALTER TABLE `g5_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member`
--

DROP TABLE IF EXISTS `g5_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_member` (
  `mb_no` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `mb_password` varchar(255) NOT NULL DEFAULT '',
  `mb_password2` varchar(255) NOT NULL DEFAULT '',
  `mb_name` varchar(255) NOT NULL DEFAULT '',
  `mb_nick` varchar(255) NOT NULL DEFAULT '',
  `mb_nick_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_email` varchar(255) NOT NULL DEFAULT '',
  `mb_homepage` varchar(255) NOT NULL DEFAULT '',
  `mb_level` tinyint(4) NOT NULL DEFAULT '0',
  `mb_sex` char(1) NOT NULL DEFAULT '',
  `mb_birth` varchar(255) NOT NULL DEFAULT '',
  `mb_tel` varchar(255) NOT NULL DEFAULT '',
  `mb_hp` varchar(255) NOT NULL DEFAULT '',
  `mb_certify` varchar(20) NOT NULL DEFAULT '',
  `mb_adult` tinyint(4) NOT NULL DEFAULT '0',
  `mb_dupinfo` varchar(255) NOT NULL DEFAULT '',
  `mb_zip1` char(3) NOT NULL DEFAULT '',
  `mb_zip2` char(3) NOT NULL DEFAULT '',
  `mb_addr1` varchar(255) NOT NULL DEFAULT '',
  `mb_addr2` varchar(255) NOT NULL DEFAULT '',
  `mb_addr3` varchar(255) NOT NULL DEFAULT '',
  `mb_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
  `mb_signature` text NOT NULL,
  `mb_recommend` varchar(255) NOT NULL DEFAULT '',
  `mb_point` int(11) NOT NULL DEFAULT '0',
  `mb_today_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_login_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_leave_date` varchar(8) NOT NULL DEFAULT '',
  `mb_intercept_date` varchar(8) NOT NULL DEFAULT '',
  `mb_email_certify` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_email_certify2` varchar(255) NOT NULL DEFAULT '',
  `mb_memo` text NOT NULL,
  `mb_lost_certify` varchar(255) NOT NULL,
  `mb_mailling` tinyint(4) NOT NULL DEFAULT '0',
  `mb_sms` tinyint(4) NOT NULL DEFAULT '0',
  `mb_open` tinyint(4) NOT NULL DEFAULT '0',
  `mb_open_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_profile` text NOT NULL,
  `mb_memo_call` varchar(255) NOT NULL DEFAULT '',
  `mb_memo_cnt` int(11) NOT NULL DEFAULT '0',
  `mb_scrap_cnt` int(11) NOT NULL DEFAULT '0',
  `mb_1` varchar(255) NOT NULL DEFAULT '',
  `mb_2` varchar(255) NOT NULL DEFAULT '',
  `mb_3` varchar(255) NOT NULL DEFAULT '',
  `mb_4` varchar(255) NOT NULL DEFAULT '',
  `mb_5` varchar(255) NOT NULL DEFAULT '',
  `mb_6` varchar(255) NOT NULL DEFAULT '',
  `mb_7` varchar(255) NOT NULL DEFAULT '',
  `mb_8` varchar(255) NOT NULL DEFAULT '',
  `mb_9` varchar(255) NOT NULL DEFAULT '',
  `mb_10` varchar(255) NOT NULL DEFAULT '',
  `mb_level0` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:트레이닝완료,2.테스트완료',
  `mb_level1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:트레이닝완료',
  PRIMARY KEY (`mb_no`),
  UNIQUE KEY `mb_id` (`mb_id`),
  KEY `mb_today_login` (`mb_today_login`),
  KEY `mb_datetime` (`mb_datetime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member`
--

LOCK TABLES `g5_member` WRITE;
/*!40000 ALTER TABLE `g5_member` DISABLE KEYS */;
INSERT INTO `g5_member` VALUES (1,'admin','sha256:12000:+m4qWBZxAHIWoxj7Ef/y6F5QlpZ1NFnG:n+RJA94bMXUOg2n195VPa7WMX7O7anqC','*380EFDF50444D4A0BBAF96D6377E719AE0166EF4','최고관리자','최고관리자','0000-00-00','admin@domain.com','',10,'','','','','',0,'','','','','','','','','',200,'2021-03-05 23:34:07','121.130.13.129','2020-04-06 14:51:33','1.209.128.223','','','2020-04-06 14:51:33','','','',1,0,1,'0000-00-00','','',0,0,'','','','','','','','','','',0,2),(2,'test','sha256:12000:Yp0CSQVwsbeeAeFAcH1ajLw4k2tI75yp:5Q7F8oBNenxrEVKjNuOFhKX0rNUBYTaj','','테스트','test','2021-02-15','onlymilk74@naver.com','',2,'','','','','',0,'','','','','','','','','',0,'2021-02-15 08:23:47','218.144.62.247','2021-02-15 08:23:47','218.144.62.247','','','2021-02-15 08:23:47','','','',1,0,0,'2021-02-15','','',0,0,'','','','','','','','','','',0,0),(3,'andrew','sha256:12000:hovfqFmHRsJzI3o2KwGNTtnXITsinNNU:Wc3wNFab6H5UrEk35T7QkREg0HQgx5Fv','','조재환','andrew','2021-02-18','andreacjh@hanmail.net','',3,'','','','','',0,'','','','','','','','','',0,'2021-03-11 22:34:20','121.130.2.43','2021-02-18 10:38:32','211.245.120.76','','','2021-02-18 10:38:32','','','',0,0,0,'2021-02-18','','',0,0,'','','','','','','','','','',1,0);
/*!40000 ALTER TABLE `g5_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member_social_profiles`
--

DROP TABLE IF EXISTS `g5_member_social_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_member_social_profiles` (
  `mp_no` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(50) NOT NULL DEFAULT '',
  `object_sha` varchar(45) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `profileurl` varchar(255) NOT NULL DEFAULT '',
  `photourl` varchar(255) NOT NULL DEFAULT '',
  `displayname` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `mp_register_day` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mp_latest_day` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `mp_no` (`mp_no`),
  KEY `mb_id` (`mb_id`),
  KEY `provider` (`provider`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member_social_profiles`
--

LOCK TABLES `g5_member_social_profiles` WRITE;
/*!40000 ALTER TABLE `g5_member_social_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_member_social_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_memo`
--

DROP TABLE IF EXISTS `g5_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_memo` (
  `me_id` int(11) NOT NULL AUTO_INCREMENT,
  `me_recv_mb_id` varchar(20) NOT NULL DEFAULT '',
  `me_send_mb_id` varchar(20) NOT NULL DEFAULT '',
  `me_send_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `me_read_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `me_memo` text NOT NULL,
  `me_send_id` int(11) NOT NULL DEFAULT '0',
  `me_type` enum('send','recv') NOT NULL DEFAULT 'recv',
  `me_send_ip` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`me_id`),
  KEY `me_recv_mb_id` (`me_recv_mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_memo`
--

LOCK TABLES `g5_memo` WRITE;
/*!40000 ALTER TABLE `g5_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_menu`
--

DROP TABLE IF EXISTS `g5_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_menu` (
  `me_id` int(11) NOT NULL AUTO_INCREMENT,
  `me_code` varchar(255) NOT NULL DEFAULT '',
  `me_name` varchar(255) NOT NULL DEFAULT '',
  `me_link` varchar(255) NOT NULL DEFAULT '',
  `me_target` varchar(255) NOT NULL DEFAULT '',
  `me_order` int(11) NOT NULL DEFAULT '0',
  `me_use` tinyint(4) NOT NULL DEFAULT '0',
  `me_mobile_use` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`me_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_menu`
--

LOCK TABLES `g5_menu` WRITE;
/*!40000 ALTER TABLE `g5_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_new_win`
--

DROP TABLE IF EXISTS `g5_new_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_new_win` (
  `nw_id` int(11) NOT NULL AUTO_INCREMENT,
  `nw_device` varchar(10) NOT NULL DEFAULT 'both',
  `nw_begin_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nw_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nw_disable_hours` int(11) NOT NULL DEFAULT '0',
  `nw_left` int(11) NOT NULL DEFAULT '0',
  `nw_top` int(11) NOT NULL DEFAULT '0',
  `nw_height` int(11) NOT NULL DEFAULT '0',
  `nw_width` int(11) NOT NULL DEFAULT '0',
  `nw_subject` text NOT NULL,
  `nw_content` text NOT NULL,
  `nw_content_html` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nw_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_new_win`
--

LOCK TABLES `g5_new_win` WRITE;
/*!40000 ALTER TABLE `g5_new_win` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_new_win` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_point`
--

DROP TABLE IF EXISTS `g5_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_point` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `po_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `po_content` varchar(255) NOT NULL DEFAULT '',
  `po_point` int(11) NOT NULL DEFAULT '0',
  `po_use_point` int(11) NOT NULL DEFAULT '0',
  `po_expired` tinyint(4) NOT NULL DEFAULT '0',
  `po_expire_date` date NOT NULL DEFAULT '0000-00-00',
  `po_mb_point` int(11) NOT NULL DEFAULT '0',
  `po_rel_table` varchar(20) NOT NULL DEFAULT '',
  `po_rel_id` varchar(20) NOT NULL DEFAULT '',
  `po_rel_action` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`po_id`),
  KEY `index1` (`mb_id`,`po_rel_table`,`po_rel_id`,`po_rel_action`),
  KEY `index2` (`po_expire_date`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_point`
--

LOCK TABLES `g5_point` WRITE;
/*!40000 ALTER TABLE `g5_point` DISABLE KEYS */;
INSERT INTO `g5_point` VALUES (1,'admin','2020-04-06 14:51:58','2020-04-06 첫로그인',100,0,0,'9999-12-31',100,'@login','admin','2020-04-06'),(2,'admin','2021-02-07 20:22:23','2021-02-07 첫로그인',100,0,0,'9999-12-31',200,'@login','admin','2021-02-07');
/*!40000 ALTER TABLE `g5_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll`
--

DROP TABLE IF EXISTS `g5_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_poll` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_subject` varchar(255) NOT NULL DEFAULT '',
  `po_poll1` varchar(255) NOT NULL DEFAULT '',
  `po_poll2` varchar(255) NOT NULL DEFAULT '',
  `po_poll3` varchar(255) NOT NULL DEFAULT '',
  `po_poll4` varchar(255) NOT NULL DEFAULT '',
  `po_poll5` varchar(255) NOT NULL DEFAULT '',
  `po_poll6` varchar(255) NOT NULL DEFAULT '',
  `po_poll7` varchar(255) NOT NULL DEFAULT '',
  `po_poll8` varchar(255) NOT NULL DEFAULT '',
  `po_poll9` varchar(255) NOT NULL DEFAULT '',
  `po_cnt1` int(11) NOT NULL DEFAULT '0',
  `po_cnt2` int(11) NOT NULL DEFAULT '0',
  `po_cnt3` int(11) NOT NULL DEFAULT '0',
  `po_cnt4` int(11) NOT NULL DEFAULT '0',
  `po_cnt5` int(11) NOT NULL DEFAULT '0',
  `po_cnt6` int(11) NOT NULL DEFAULT '0',
  `po_cnt7` int(11) NOT NULL DEFAULT '0',
  `po_cnt8` int(11) NOT NULL DEFAULT '0',
  `po_cnt9` int(11) NOT NULL DEFAULT '0',
  `po_etc` varchar(255) NOT NULL DEFAULT '',
  `po_level` tinyint(4) NOT NULL DEFAULT '0',
  `po_point` int(11) NOT NULL DEFAULT '0',
  `po_date` date NOT NULL DEFAULT '0000-00-00',
  `po_ips` mediumtext NOT NULL,
  `mb_ids` text NOT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll`
--

LOCK TABLES `g5_poll` WRITE;
/*!40000 ALTER TABLE `g5_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll_etc`
--

DROP TABLE IF EXISTS `g5_poll_etc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_poll_etc` (
  `pc_id` int(11) NOT NULL DEFAULT '0',
  `po_id` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `pc_name` varchar(255) NOT NULL DEFAULT '',
  `pc_idea` varchar(255) NOT NULL DEFAULT '',
  `pc_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll_etc`
--

LOCK TABLES `g5_poll_etc` WRITE;
/*!40000 ALTER TABLE `g5_poll_etc` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll_etc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_popular`
--

DROP TABLE IF EXISTS `g5_popular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_popular` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_word` varchar(50) NOT NULL DEFAULT '',
  `pp_date` date NOT NULL DEFAULT '0000-00-00',
  `pp_ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pp_id`),
  UNIQUE KEY `index1` (`pp_date`,`pp_word`,`pp_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_popular`
--

LOCK TABLES `g5_popular` WRITE;
/*!40000 ALTER TABLE `g5_popular` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_popular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_config`
--

DROP TABLE IF EXISTS `g5_qa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_qa_config` (
  `qa_title` varchar(255) NOT NULL DEFAULT '',
  `qa_category` varchar(255) NOT NULL DEFAULT '',
  `qa_skin` varchar(255) NOT NULL DEFAULT '',
  `qa_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `qa_use_email` tinyint(4) NOT NULL DEFAULT '0',
  `qa_req_email` tinyint(4) NOT NULL DEFAULT '0',
  `qa_use_hp` tinyint(4) NOT NULL DEFAULT '0',
  `qa_req_hp` tinyint(4) NOT NULL DEFAULT '0',
  `qa_use_sms` tinyint(4) NOT NULL DEFAULT '0',
  `qa_send_number` varchar(255) NOT NULL DEFAULT '0',
  `qa_admin_hp` varchar(255) NOT NULL DEFAULT '',
  `qa_admin_email` varchar(255) NOT NULL DEFAULT '',
  `qa_use_editor` tinyint(4) NOT NULL DEFAULT '0',
  `qa_subject_len` int(11) NOT NULL DEFAULT '0',
  `qa_mobile_subject_len` int(11) NOT NULL DEFAULT '0',
  `qa_page_rows` int(11) NOT NULL DEFAULT '0',
  `qa_mobile_page_rows` int(11) NOT NULL DEFAULT '0',
  `qa_image_width` int(11) NOT NULL DEFAULT '0',
  `qa_upload_size` int(11) NOT NULL DEFAULT '0',
  `qa_insert_content` text NOT NULL,
  `qa_include_head` varchar(255) NOT NULL DEFAULT '',
  `qa_include_tail` varchar(255) NOT NULL DEFAULT '',
  `qa_content_head` text NOT NULL,
  `qa_content_tail` text NOT NULL,
  `qa_mobile_content_head` text NOT NULL,
  `qa_mobile_content_tail` text NOT NULL,
  `qa_1_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_2_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_3_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_4_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_5_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_1` varchar(255) NOT NULL DEFAULT '',
  `qa_2` varchar(255) NOT NULL DEFAULT '',
  `qa_3` varchar(255) NOT NULL DEFAULT '',
  `qa_4` varchar(255) NOT NULL DEFAULT '',
  `qa_5` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_config`
--

LOCK TABLES `g5_qa_config` WRITE;
/*!40000 ALTER TABLE `g5_qa_config` DISABLE KEYS */;
INSERT INTO `g5_qa_config` VALUES ('1:1문의','회원|포인트','basic','basic',1,0,1,0,0,'0','','',1,60,30,15,15,600,1048576,'','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_qa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_content`
--

DROP TABLE IF EXISTS `g5_qa_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_qa_content` (
  `qa_id` int(11) NOT NULL AUTO_INCREMENT,
  `qa_num` int(11) NOT NULL DEFAULT '0',
  `qa_parent` int(11) NOT NULL DEFAULT '0',
  `qa_related` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `qa_name` varchar(255) NOT NULL DEFAULT '',
  `qa_email` varchar(255) NOT NULL DEFAULT '',
  `qa_hp` varchar(255) NOT NULL DEFAULT '',
  `qa_type` tinyint(4) NOT NULL DEFAULT '0',
  `qa_category` varchar(255) NOT NULL DEFAULT '',
  `qa_email_recv` tinyint(4) NOT NULL DEFAULT '0',
  `qa_sms_recv` tinyint(4) NOT NULL DEFAULT '0',
  `qa_html` tinyint(4) NOT NULL DEFAULT '0',
  `qa_subject` varchar(255) NOT NULL DEFAULT '',
  `qa_content` text NOT NULL,
  `qa_status` tinyint(4) NOT NULL DEFAULT '0',
  `qa_file1` varchar(255) NOT NULL DEFAULT '',
  `qa_source1` varchar(255) NOT NULL DEFAULT '',
  `qa_file2` varchar(255) NOT NULL DEFAULT '',
  `qa_source2` varchar(255) NOT NULL DEFAULT '',
  `qa_ip` varchar(255) NOT NULL DEFAULT '',
  `qa_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `qa_1` varchar(255) NOT NULL DEFAULT '',
  `qa_2` varchar(255) NOT NULL DEFAULT '',
  `qa_3` varchar(255) NOT NULL DEFAULT '',
  `qa_4` varchar(255) NOT NULL DEFAULT '',
  `qa_5` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`qa_id`),
  KEY `qa_num_parent` (`qa_num`,`qa_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_content`
--

LOCK TABLES `g5_qa_content` WRITE;
/*!40000 ALTER TABLE `g5_qa_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_qa_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_scrap`
--

DROP TABLE IF EXISTS `g5_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_scrap` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` varchar(15) NOT NULL DEFAULT '',
  `ms_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ms_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_scrap`
--

LOCK TABLES `g5_scrap` WRITE;
/*!40000 ALTER TABLE `g5_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_uniqid`
--

DROP TABLE IF EXISTS `g5_uniqid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_uniqid` (
  `uq_id` bigint(20) unsigned NOT NULL,
  `uq_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`uq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_uniqid`
--

LOCK TABLES `g5_uniqid` WRITE;
/*!40000 ALTER TABLE `g5_uniqid` DISABLE KEYS */;
INSERT INTO `g5_uniqid` VALUES (2021021521232089,'218.144.62.247'),(2021021521394126,'218.144.62.247'),(2021021523243418,'218.144.62.247'),(2021021523272254,'218.144.62.247'),(2021021523434998,'218.144.62.247'),(2021021523443872,'218.144.62.247'),(2021021523450794,'218.144.62.247'),(2021021523452874,'218.144.62.247'),(2021021523454025,'218.144.62.247'),(2021021523455197,'218.144.62.247'),(2021021523470341,'218.144.62.247'),(2021021523545481,'218.144.62.247'),(2021021523550319,'218.144.62.247'),(2021021523552790,'218.144.62.247'),(2021021600451022,'218.144.62.247'),(2021021600461503,'218.144.62.247'),(2021021600475864,'218.144.62.247'),(2021021600481726,'218.144.62.247'),(2021021600484004,'218.144.62.247'),(2021021600503838,'218.144.62.247'),(2021021600510095,'218.144.62.247'),(2021021600520915,'218.144.62.247'),(2021021600535645,'218.144.62.247'),(2021021600542917,'218.144.62.247'),(2021021600552302,'218.144.62.247'),(2021021600553985,'218.144.62.247'),(2021021600560836,'218.144.62.247'),(2021021600563187,'218.144.62.247'),(2021021600565936,'218.144.62.247'),(2021021600571731,'218.144.62.247'),(2021021600573637,'218.144.62.247'),(2021021600575293,'218.144.62.247'),(2021021600581272,'218.144.62.247'),(2021021600582841,'218.144.62.247'),(2021021600590383,'218.144.62.247'),(2021021600593181,'218.144.62.247'),(2021021600594754,'218.144.62.247'),(2021021601000672,'218.144.62.247'),(2021021601002694,'218.144.62.247'),(2021021601005100,'218.144.62.247'),(2021021601011302,'218.144.62.247'),(2021021601011754,'218.144.62.247'),(2021021601013601,'218.144.62.247'),(2021021601015005,'218.144.62.247'),(2021021601020824,'218.144.62.247'),(2021021601022502,'218.144.62.247'),(2021021601023962,'218.144.62.247'),(2021021601025778,'218.144.62.247'),(2021022019081484,'211.104.15.10'),(2021022019092151,'211.104.15.10'),(2021022019104256,'211.104.15.10'),(2021022019111008,'211.104.15.10'),(2021022019111277,'211.104.15.10'),(2021022019111477,'211.104.15.10'),(2021022019112524,'211.104.15.10'),(2021022019120031,'211.104.15.10'),(2021022019123303,'211.104.15.10'),(2021022019142328,'211.104.15.10'),(2021022019145981,'211.104.15.10'),(2021022019152346,'211.104.15.10'),(2021022019161121,'211.104.15.10'),(2021022019162832,'211.104.15.10'),(2021022019172445,'211.104.15.10'),(2021022019221404,'211.104.15.10'),(2021022019225179,'211.104.15.10'),(2021022020472445,'211.104.15.10'),(2021022020482030,'211.104.15.10'),(2021022020504336,'211.104.15.10'),(2021022020524211,'211.104.15.10'),(2021022020562772,'211.104.15.10'),(2021022020564962,'211.104.15.10'),(2021022020573213,'211.104.15.10'),(2021022020573900,'211.104.15.10'),(2021022020574856,'211.104.15.10'),(2021022020582468,'211.104.15.10'),(2021022020584308,'211.104.15.10'),(2021022020590478,'211.104.15.10'),(2021022020593605,'211.104.15.10'),(2021022020594423,'211.104.15.10'),(2021022021002759,'211.104.15.10'),(2021022021004534,'211.104.15.10'),(2021022021005630,'211.104.15.10'),(2021022021021254,'211.104.15.10'),(2021022021033522,'211.104.15.10'),(2021022021055090,'211.104.15.10'),(2021022021075241,'211.104.15.10'),(2021022021100905,'211.104.15.10'),(2021022021135606,'211.104.15.10'),(2021022022522721,'211.104.15.10'),(2021022022524329,'211.104.15.10'),(2021022022534162,'211.104.15.10'),(2021022022534430,'211.104.15.10'),(2021022022540151,'211.104.15.10'),(2021022022540282,'211.104.15.10'),(2021022022541908,'211.104.15.10'),(2021022022543792,'211.104.15.10'),(2021022022550584,'211.104.15.10'),(2021022022552810,'211.104.15.10'),(2021022023043916,'211.104.15.10'),(2021022023051300,'211.104.15.10'),(2021022023442723,'211.104.15.10'),(2021022100000427,'211.104.15.10'),(2021022100021367,'211.104.15.10'),(2021022100022463,'211.104.15.10'),(2021022100031214,'211.104.15.10'),(2021022100032606,'211.104.15.10'),(2021022100035480,'211.104.15.10'),(2021022100042068,'211.104.15.10'),(2021022100042158,'211.104.15.10'),(2021022100043180,'211.104.15.10'),(2021022100044639,'211.104.15.10'),(2021022100152767,'211.104.15.10'),(2021022100154272,'211.104.15.10'),(2021022100485695,'211.104.15.10'),(2021022100510033,'211.104.15.10'),(2021022100510857,'211.104.15.10'),(2021022100563252,'211.104.15.10'),(2021022100565844,'211.104.15.10'),(2021022101082383,'211.104.15.10'),(2021022101131310,'211.104.15.10'),(2021022101131984,'211.104.15.10'),(2021022101133587,'211.104.15.10'),(2021022101164892,'211.104.15.10'),(2021022101194211,'211.104.15.10'),(2021022101194428,'211.104.15.10'),(2021022101295057,'211.104.15.10'),(2021022101332088,'211.104.15.10'),(2021022101370073,'211.104.15.10'),(2021022101400507,'211.104.15.10'),(2021022101403166,'211.104.15.10'),(2021022101441999,'211.104.15.10'),(2021022101442887,'211.104.15.10'),(2021022101483552,'211.104.15.10'),(2021022102041390,'211.104.15.10'),(2021022102052090,'211.104.15.10'),(2021022102111064,'211.104.15.10'),(2021022102311199,'211.104.15.10'),(2021022102325619,'211.104.15.10'),(2021022102525682,'211.104.15.10'),(2021022102533931,'211.104.15.10'),(2021022102561635,'211.104.15.10'),(2021022102564440,'211.104.15.10'),(2021022102581901,'211.104.15.10'),(2021022103010589,'211.104.15.10'),(2021022103015803,'211.104.15.10'),(2021022103041030,'211.104.15.10'),(2021022103045536,'211.104.15.10'),(2021022103061758,'211.104.15.10'),(2021022103072118,'211.104.15.10'),(2021022103081454,'211.104.15.10'),(2021022103090959,'211.104.15.10'),(2021022103091999,'211.104.15.10'),(2021022103161448,'211.104.15.10'),(2021022103164266,'211.104.15.10'),(2021022103173759,'211.104.15.10'),(2021022103232803,'211.104.15.10'),(2021022103241696,'211.104.15.10'),(2021022103302821,'211.104.15.10'),(2021022103314216,'211.104.15.10'),(2021022103404572,'211.104.15.10'),(2021022103431785,'211.104.15.10'),(2021022103450441,'211.104.15.10'),(2021022103454583,'211.104.15.10'),(2021022103500369,'211.104.15.10'),(2021022103525522,'211.104.15.10'),(2021022103525867,'211.104.15.10'),(2021022103543179,'211.104.15.10'),(2021022103551875,'211.104.15.10'),(2021022104005622,'211.104.15.10'),(2021022104025659,'211.104.15.10'),(2021022104030226,'211.104.15.10'),(2021022104062816,'211.104.15.10'),(2021022104064633,'211.104.15.10'),(2021022104072608,'211.104.15.10'),(2021022104132807,'211.104.15.10'),(2021022104173967,'211.104.15.10'),(2021022104235426,'211.104.15.10'),(2021022104285165,'211.104.15.10'),(2021022104342580,'211.104.15.10'),(2021022104390275,'211.104.15.10'),(2021022104575789,'211.104.15.10'),(2021022104584394,'211.104.15.10'),(2021022105002763,'211.104.15.10'),(2021022105011599,'211.104.15.10'),(2021022105053300,'211.104.15.10'),(2021022105120065,'211.104.15.10'),(2021022105120305,'211.104.15.10'),(2021022105130932,'211.104.15.10'),(2021022105193822,'211.104.15.10'),(2021022105214906,'211.104.15.10'),(2021022105244000,'211.104.15.10'),(2021022105350972,'211.104.15.10'),(2021022105351300,'211.104.15.10'),(2021022105361168,'211.104.15.10'),(2021022105394963,'211.104.15.10'),(2021022105400921,'211.104.15.10'),(2021022105422287,'211.104.15.10'),(2021022105471251,'211.104.15.10'),(2021022105472873,'211.104.15.10'),(2021022105480440,'211.104.15.10'),(2021022105495162,'211.104.15.10'),(2021022105580115,'211.104.15.10'),(2021022106040071,'211.104.15.10'),(2021022106041363,'211.104.15.10'),(2021022106111147,'211.104.15.10'),(2021022106111517,'211.104.15.10'),(2021022106121124,'211.104.15.10'),(2021022106163187,'211.104.15.10'),(2021022106202867,'211.104.15.10'),(2021022106205111,'211.104.15.10'),(2021022106221053,'211.104.15.10'),(2021022106243397,'211.104.15.10'),(2021022106272601,'211.104.15.10'),(2021022106284408,'211.104.15.10'),(2021022106301908,'211.104.15.10'),(2021022106310679,'211.104.15.10'),(2021022106374407,'211.104.15.10'),(2021022106381441,'211.104.15.10'),(2021022106412248,'211.104.15.10'),(2021022106441415,'211.104.15.10'),(2021022106451897,'211.104.15.10'),(2021022106460899,'211.104.15.10'),(2021022106534682,'211.104.15.10'),(2021022106550636,'211.104.15.10'),(2021022106571575,'211.104.15.10'),(2021022106583423,'211.104.15.10'),(2021022107074104,'211.104.15.10'),(2021022107084031,'211.104.15.10'),(2021022107192694,'211.104.15.10'),(2021022107210196,'211.104.15.10'),(2021022107233549,'211.104.15.10'),(2021022107351308,'211.104.15.10'),(2021022107354749,'211.104.15.10'),(2021022107361724,'211.104.15.10'),(2021022107362681,'211.104.15.10'),(2021022107372684,'211.104.15.10'),(2021022107495092,'211.104.15.10'),(2021022107500877,'211.104.15.10'),(2021022107521091,'211.104.15.10'),(2021022107544175,'211.104.15.10'),(2021022107545730,'211.104.15.10'),(2021022107553561,'211.104.15.10'),(2021022108005389,'211.104.15.10'),(2021022108095026,'211.104.15.10'),(2021022108111364,'211.104.15.10'),(2021022202162922,'211.104.15.10'),(2021022202174946,'211.104.15.10'),(2021022202465446,'211.104.15.10'),(2021022202465964,'211.104.15.10'),(2021022202474924,'211.104.15.10'),(2021022202523159,'211.104.15.10'),(2021022203044700,'211.104.15.10'),(2021022203455127,'211.104.15.10'),(2021022203501058,'211.104.15.10'),(2021022204075388,'211.104.15.10'),(2021022204264050,'211.104.15.10'),(2021022204291280,'211.104.15.10'),(2021022204295040,'211.104.15.10'),(2021022220542196,'211.104.15.10'),(2021022220561478,'211.104.15.10'),(2021022221040793,'211.104.15.10'),(2021022221053055,'211.104.15.10'),(2021022221272614,'211.104.15.10'),(2021022221494753,'211.104.15.10'),(2021022306480465,'211.104.15.10'),(2021022402033373,'211.104.15.10'),(2021022402222806,'211.104.15.10'),(2021022404094002,'211.104.15.10'),(2021022404184830,'211.104.15.10'),(2021022404210145,'211.104.15.10'),(2021022404215300,'211.104.15.10'),(2021022404223452,'211.104.15.10'),(2021022404233251,'211.104.15.10'),(2021022404260162,'211.104.15.10'),(2021022408482284,'211.104.15.10'),(2021022420072791,'211.36.135.149'),(2021022501321759,'211.104.15.10'),(2021022503285161,'211.104.15.10'),(2021022503482528,'211.104.15.10'),(2021022503494756,'211.104.15.10'),(2021022503510753,'211.104.15.10'),(2021022504010203,'211.104.15.10'),(2021022504035475,'211.104.15.10'),(2021022504041295,'211.104.15.10'),(2021022504054475,'211.104.15.10'),(2021022504060635,'211.104.15.10'),(2021022504152106,'211.104.15.10'),(2021022504262463,'211.104.15.10'),(2021022506234595,'211.104.15.10'),(2021022506294518,'211.104.15.10'),(2021022506570580,'211.104.15.10'),(2021022506573643,'211.104.15.10'),(2021022506594867,'211.104.15.10'),(2021022507165487,'211.104.15.10'),(2021022507351642,'211.104.15.10'),(2021022507411377,'211.104.15.10'),(2021022507432877,'211.104.15.10'),(2021022507463660,'211.104.15.10'),(2021022507484262,'211.104.15.10'),(2021022507490049,'211.104.15.10'),(2021022508303513,'211.245.120.86'),(2021022511352651,'211.104.15.10'),(2021022511583476,'211.104.15.10'),(2021022512005742,'211.104.15.10'),(2021022512031185,'211.104.15.10'),(2021022512103952,'211.104.15.10'),(2021022512115453,'211.104.15.10'),(2021022512204207,'211.104.15.10'),(2021022512230147,'211.104.15.10'),(2021022512233833,'211.104.15.10'),(2021022513391396,'211.104.15.10'),(2021022513410223,'211.104.15.10'),(2021022513424347,'211.104.15.10'),(2021022513430100,'211.104.15.10'),(2021022513430988,'211.104.15.10'),(2021022513555179,'211.104.15.10'),(2021022514070407,'211.104.15.10'),(2021022514115576,'211.104.15.10'),(2021022514130315,'211.104.15.10'),(2021022514194314,'211.104.15.10'),(2021022514240054,'211.104.15.10'),(2021022514253871,'211.104.15.10'),(2021022514284546,'211.104.15.10'),(2021022514331490,'211.104.15.10'),(2021022514350620,'211.104.15.10'),(2021022514360027,'211.104.15.10'),(2021022514452763,'211.104.15.10'),(2021022514455484,'211.104.15.10'),(2021022514513067,'211.104.15.10'),(2021022515093853,'211.104.15.10'),(2021022516121896,'211.104.15.10'),(2021022516401624,'58.140.217.169'),(2021022516405625,'58.140.217.169'),(2021022516514075,'211.104.15.10'),(2021022516580898,'211.104.15.10'),(2021022517005824,'211.104.15.10'),(2021022517030807,'211.104.15.10'),(2021022517052199,'211.104.15.10'),(2021022517141455,'211.104.15.10'),(2021022517172060,'211.104.15.10'),(2021022517193205,'211.104.15.10'),(2021022517211690,'211.104.15.10'),(2021022517233049,'211.104.15.10'),(2021022517255040,'211.104.15.10'),(2021022517260686,'211.104.15.10'),(2021022517275341,'211.104.15.10'),(2021022517515274,'211.104.15.10'),(2021022517520324,'211.104.15.10'),(2021022518011626,'211.104.15.10'),(2021022518020803,'211.104.15.10'),(2021022518071213,'211.104.15.10'),(2021022518112581,'211.104.15.10'),(2021022518123383,'211.104.15.10'),(2021022518134263,'211.104.15.10'),(2021022518135299,'211.104.15.10'),(2021022604031263,'211.104.15.10'),(2021022604081773,'211.104.15.10'),(2021022604120931,'211.104.15.10'),(2021022604484965,'211.104.15.10'),(2021022604573727,'211.104.15.10'),(2021022609151493,'211.104.15.10'),(2021022609163870,'211.104.15.10'),(2021022609203834,'211.104.15.10'),(2021022609222799,'211.104.15.10'),(2021022610042828,'211.104.15.10'),(2021022610122805,'211.104.15.10'),(2021022610181919,'211.104.15.10'),(2021022610273468,'211.104.15.10'),(2021022610360418,'211.104.15.10'),(2021022610553616,'211.104.15.10'),(2021022610572236,'211.104.15.10'),(2021022610580834,'211.104.15.10'),(2021022611004378,'211.104.15.10'),(2021022614073181,'211.104.15.10'),(2021022614073346,'211.104.15.10'),(2021022620264529,'125.131.24.78'),(2021022620494643,'125.131.24.78'),(2021022620504202,'125.131.24.78'),(2021022620505205,'125.131.24.78'),(2021022620541395,'125.131.24.78'),(2021022620574048,'125.131.24.78'),(2021022621131767,'125.131.24.78'),(2021022621133903,'125.131.24.78'),(2021022621141634,'125.131.24.78'),(2021022621144934,'125.131.24.78'),(2021022621154956,'125.131.24.78'),(2021022621182212,'125.131.24.78'),(2021022621191893,'125.131.24.78'),(2021022621222075,'125.131.24.78'),(2021022621311250,'125.131.24.78'),(2021022621320690,'125.131.24.78'),(2021022621330161,'125.131.24.78'),(2021022621593642,'125.131.24.78'),(2021022623200525,'125.131.24.78'),(2021022623205293,'125.131.24.78'),(2021022623214275,'125.131.24.78'),(2021022700521951,'125.131.24.78'),(2021030105061213,'211.104.15.10'),(2021030105114175,'211.104.15.10'),(2021030105124259,'211.104.15.10'),(2021030105130685,'211.104.15.10'),(2021030105162957,'211.104.15.10'),(2021030105180429,'211.104.15.10'),(2021030105190302,'211.104.15.10'),(2021030212474567,'211.245.120.76'),(2021030314503891,'211.245.120.86'),(2021030314563351,'211.104.15.10'),(2021030314570567,'211.104.15.10'),(2021030314591671,'211.104.15.10'),(2021030317374918,'211.104.15.10'),(2021030317532568,'211.104.15.10'),(2021030317552840,'211.104.15.10'),(2021030318063312,'211.104.15.10'),(2021030320330993,'61.32.123.101'),(2021030320355611,'61.32.123.101'),(2021030320400958,'61.32.123.101'),(2021030320421819,'61.32.123.101');
/*!40000 ALTER TABLE `g5_uniqid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit`
--

DROP TABLE IF EXISTS `g5_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_visit` (
  `vi_id` int(11) NOT NULL DEFAULT '0',
  `vi_ip` varchar(100) NOT NULL DEFAULT '',
  `vi_date` date NOT NULL DEFAULT '0000-00-00',
  `vi_time` time NOT NULL DEFAULT '00:00:00',
  `vi_referer` text NOT NULL,
  `vi_agent` varchar(200) NOT NULL DEFAULT '',
  `vi_browser` varchar(255) NOT NULL DEFAULT '',
  `vi_os` varchar(255) NOT NULL DEFAULT '',
  `vi_device` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`vi_id`),
  UNIQUE KEY `index1` (`vi_ip`,`vi_date`),
  KEY `index2` (`vi_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit`
--

LOCK TABLES `g5_visit` WRITE;
/*!40000 ALTER TABLE `g5_visit` DISABLE KEYS */;
INSERT INTO `g5_visit` VALUES (1,'121.53.83.7','2021-02-05','14:09:56','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(2,'210.220.73.2','2021-02-05','20:34:37','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(3,'210.123.9.46','2021-02-07','20:21:47','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36','','',''),(4,'210.123.9.46','2021-02-11','04:04:16','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(5,'218.144.62.247','2021-02-11','21:39:40','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(6,'218.144.62.247','2021-02-15','07:51:20','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(7,'218.144.62.247','2021-02-16','11:58:55','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(8,'117.111.2.78','2021-02-16','18:53:01','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(9,'58.127.214.27','2021-02-16','22:22:57','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(10,'210.220.79.251','2021-02-16','22:41:20','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(11,'121.130.2.43','2021-02-16','22:56:18','','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.152 Mobile Safari/537.36;KAKAOTALK 2109210','','',''),(12,'211.249.218.6','2021-02-16','23:04:58','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(13,'210.220.79.7','2021-02-16','23:08:03','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(14,'210.220.74.250','2021-02-16','23:09:31','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(15,'210.220.95.255','2021-02-16','23:10:20','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(16,'210.220.73.251','2021-02-16','23:12:01','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(17,'220.64.102.3','2021-02-16','23:12:53','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(18,'220.64.105.6','2021-02-16','23:14:18','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(19,'121.53.180.4','2021-02-16','23:16:18','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(20,'121.53.83.2','2021-02-16','23:17:57','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(21,'210.220.70.4','2021-02-16','23:20:00','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(22,'210.220.74.0','2021-02-16','23:22:19','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(23,'210.220.86.253','2021-02-16','23:23:36','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(24,'220.64.102.4','2021-02-16','23:24:32','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(25,'121.53.181.251','2021-02-16','23:25:24','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(26,'210.220.86.7','2021-02-16','23:26:06','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(27,'121.53.180.1','2021-02-16','23:27:37','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(28,'210.220.74.249','2021-02-16','23:29:06','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(29,'211.104.15.10','2021-02-16','23:52:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(30,'220.64.106.6','2021-02-17','13:23:37','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(31,'106.102.0.167','2021-02-17','19:39:04','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(32,'211.104.15.10','2021-02-18','00:35:33','http://dhc2021.cafe24.com/dhc/level0.php?exam_wr_id%5B0%5D=3&exam_subject%5B0%5D=3640&exam_answer%5B0%5D=1&exam_wr_id%5B1%5D=29&exam_subject%5B1%5D=1926&exam_answer%5B1%5D=2&exam_wr_id%5B2%5D=25&exam_subject%5B2%5D=1952&exam_answer%5B2%5D=3&exam_wr_id%5B3%5D=28&exam_subject%5B3%5D=7474&exam_answer%5B3%5D=3&exam_wr_id%5B4%5D=5&exam_subject%5B4%5D=6060&exam_answer%5B4%5D=%E3%85%87','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(33,'58.127.214.27','2021-02-18','06:17:33','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(34,'211.245.120.76','2021-02-18','10:37:32','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68','','',''),(35,'121.53.180.254','2021-02-18','17:07:24','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(36,'211.176.125.70','2021-02-18','18:12:30','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(37,'210.220.70.0','2021-02-18','18:16:34','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(38,'220.64.106.5','2021-02-18','21:03:06','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(39,'210.220.79.6','2021-02-18','23:54:59','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(40,'211.104.15.10','2021-02-19','00:37:12','http://dhc2021.cafe24.com/dhc/level1_ui_test1.php','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','','',''),(41,'121.53.180.5','2021-02-19','00:53:15','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(42,'220.64.100.1','2021-02-19','00:54:35','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(43,'211.249.218.4','2021-02-19','02:19:46','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(44,'210.220.73.7','2021-02-19','02:19:46','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(45,'220.64.100.4','2021-02-19','04:00:56','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(46,'211.176.125.70','2021-02-19','06:03:52','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(47,'210.220.79.249','2021-02-19','06:18:24','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(48,'211.245.120.86','2021-02-19','08:55:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68','','',''),(49,'220.64.105.2','2021-02-19','08:56:11','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(50,'220.64.102.1','2021-02-19','17:33:26','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(51,'210.220.74.2','2021-02-19','17:33:28','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(52,'220.64.106.4','2021-02-19','17:33:33','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(53,'117.111.10.147','2021-02-19','20:27:13','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(54,'211.176.125.70','2021-02-20','00:15:43','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(55,'211.104.15.10','2021-02-20','01:20:35','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(56,'185.220.102.4','2021-02-20','12:33:58','','Go-http-client/1.1','','',''),(57,'185.247.224.66','2021-02-20','12:34:04','','Go-http-client/1.1','','',''),(58,'211.104.15.10','2021-02-21','01:29:33','http://dhc2021.cafe24.com/bbs/write.php?bo_table=level1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(59,'58.127.214.27','2021-02-21','13:14:15','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(60,'211.104.15.10','2021-02-22','02:15:24','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(61,'211.245.120.86','2021-02-22','13:16:55','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(62,'211.245.120.76','2021-02-22','14:11:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(63,'211.176.125.70','2021-02-22','19:49:31','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(64,'175.223.22.195','2021-02-22','20:31:32','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(65,'58.127.214.27','2021-02-22','22:37:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(66,'58.127.214.27','2021-02-23','00:58:01','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(67,'211.176.125.70','2021-02-23','05:47:57','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(68,'211.104.15.10','2021-02-23','06:48:04','http://dhc2021.cafe24.com/bbs/board.php?bo_table=level1&wr_id=17','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(69,'121.53.180.6','2021-02-23','13:55:14','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(70,'211.245.120.86','2021-02-23','15:17:49','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(71,'117.111.18.153','2021-02-23','20:00:29','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(72,'211.104.15.10','2021-02-24','08:36:45','http://dhc2021.cafe24.com/dhc/level0.php','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(73,'211.245.120.76','2021-02-24','12:52:23','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(74,'211.36.135.149','2021-02-24','19:55:20','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(75,'58.127.214.27','2021-02-25','06:29:06','http://dhc2021.cafe24.com/dhc/level1.php','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(76,'211.245.120.86','2021-02-25','08:18:30','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(77,'211.104.15.10','2021-02-25','11:09:43','http://dhc2021.cafe24.com/dhc/level0.php','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(78,'211.176.125.70','2021-02-25','12:45:07','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(79,'58.140.217.169','2021-02-25','16:29:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74','','',''),(80,'210.220.79.254','2021-02-25','19:06:59','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(81,'211.36.135.149','2021-02-25','19:43:35','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(82,'125.131.24.78','2021-02-25','20:23:43','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74','','',''),(83,'223.38.27.33','2021-02-25','20:26:15','','Mozilla/5.0 (Linux; Android 9; SM-G950N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(84,'121.53.181.7','2021-02-25','20:30:24','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(85,'218.144.109.27','2021-02-25','21:15:12','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36','','',''),(86,'210.220.74.2','2021-02-25','22:36:13','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(87,'58.127.214.27','2021-02-26','00:02:15','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74','','',''),(88,'211.245.120.86','2021-02-26','10:00:52','','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36;KAKAOTALK 2109210','','',''),(89,'211.245.120.76','2021-02-26','10:55:07','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74','','',''),(90,'211.176.125.70','2021-02-26','13:42:00','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(91,'211.104.15.10','2021-02-26','14:07:31','http://dhc2021.cafe24.com/bbs/board.php?bo_table=level1&wr_id=20','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(92,'210.220.70.249','2021-02-26','16:36:20','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(93,'210.220.74.249','2021-02-26','18:53:30','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(94,'218.146.183.24','2021-02-26','18:53:41','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15','','',''),(95,'203.229.163.89','2021-02-26','19:15:38','','Mozilla/5.0 (Linux; Android 9; SM-G950N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(96,'121.53.181.255','2021-02-26','20:02:02','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(97,'223.38.23.204','2021-02-26','20:23:14','http://dhc2021.cafe24.com/','Mozilla/5.0 (Linux; Android 9; SM-G950N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(98,'125.131.24.78','2021-02-26','20:25:00','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74','','',''),(99,'211.36.135.149','2021-02-26','20:34:46','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(100,'220.64.106.0','2021-02-26','22:02:11','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(101,'210.220.70.6','2021-02-27','00:28:43','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(102,'58.127.214.27','2021-02-27','00:48:59','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74','','',''),(103,'220.64.102.3','2021-02-27','10:44:37','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(104,'210.220.74.2','2021-02-27','16:41:30','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(105,'218.144.109.27','2021-02-27','16:42:31','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(106,'211.104.15.10','2021-02-27','18:48:22','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(107,'210.220.73.252','2021-02-27','22:34:55','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(108,'121.130.2.43','2021-02-27','22:34:59','http://dhc2021.cafe24.com/dhc/level1_basic.php','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36;KAKAOTALK 2109210','','',''),(109,'203.229.163.89','2021-02-27','23:12:46','','Mozilla/5.0 (Linux; Android 9; SM-G950N Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(110,'210.220.74.250','2021-02-28','01:52:50','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(111,'203.229.163.89','2021-02-28','04:04:30','','Mozilla/5.0 (Linux; Android 9; SM-G950N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(112,'218.144.109.27','2021-02-28','20:00:30','http://dhc2021.cafe24.com/adm/config_form.php','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(113,'223.38.75.219','2021-02-28','22:36:20','http://dhc2021.cafe24.com/index.php','Mozilla/5.0 (Linux; Android 9; SM-G950N Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(114,'58.127.214.27','2021-03-01','00:21:31','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(115,'203.229.163.89','2021-03-01','01:59:39','','Mozilla/5.0 (Linux; Android 9; SM-G950N Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(116,'211.104.15.10','2021-03-01','03:05:32','http://dhc2021.cafe24.com/dhc/level1.php','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(117,'223.38.75.42','2021-03-01','17:05:59','','Mozilla/5.0 (Linux; Android 9; SM-G950N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(118,'211.176.125.70','2021-03-01','18:37:49','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(119,'210.220.95.6','2021-03-01','21:15:12','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(120,'121.53.83.2','2021-03-01','21:15:12','http://dhc2021.cafe24.com/dhc/level1_basic.php','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(121,'211.176.125.70','2021-03-02','00:09:28','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(122,'220.64.100.7','2021-03-02','05:53:32','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(123,'220.64.105.4','2021-03-02','05:53:32','http://dhc2021.cafe24.com/dhc/level1_basic.php','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(124,'211.245.120.86','2021-03-02','11:09:50','http://dhc2021.cafe24.com/dhc/level1_basic.php','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36;KAKAOTALK 2109210','','',''),(125,'211.36.135.19','2021-03-02','12:18:09','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(126,'223.38.91.242','2021-03-02','12:18:35','','Mozilla/5.0 (Linux; Android 11; SM-G977N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36','','',''),(127,'211.245.120.76','2021-03-02','12:39:51','http://dhc2021.cafe24.com/dhc/level0.php','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36','','',''),(128,'210.220.86.0','2021-03-02','13:09:25','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(129,'210.220.73.2','2021-03-02','13:09:25','http://dhc2021.cafe24.com/dhc/level1_basic.php','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(130,'211.104.15.10','2021-03-02','14:04:42','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(131,'210.220.95.6','2021-03-02','14:54:53','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(132,'121.130.2.43','2021-03-02','18:26:23','','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36','','',''),(133,'58.127.214.27','2021-03-03','00:56:20','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(134,'211.176.125.70','2021-03-03','07:46:36','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(135,'222.109.221.120','2021-03-03','10:58:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(136,'211.245.120.86','2021-03-03','14:47:27','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(137,'211.104.15.10','2021-03-03','14:55:53','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(138,'61.32.123.101','2021-03-03','20:22:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.81','','',''),(139,'117.111.13.2','2021-03-03','20:23:30','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(140,'223.38.74.35','2021-03-03','20:26:00','','Mozilla/5.0 (Linux; Android 9; SM-G950N Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(141,'58.127.214.27','2021-03-04','00:29:13','','Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1','','',''),(142,'211.245.120.86','2021-03-04','14:20:28','','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.72 Mobile Safari/537.36','','',''),(143,'211.245.120.76','2021-03-04','14:39:47','http://dhc2021.cafe24.com/index.php','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.72 Mobile Safari/537.36','','',''),(144,'223.38.74.244','2021-03-04','20:41:14','','Mozilla/5.0 (Linux; Android 9; SM-G950N Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(145,'223.38.74.182','2021-03-04','21:09:19','http://dhc2021.cafe24.com/dhc/level1.php','Mozilla/5.0 (Linux; Android 9; SM-G950N Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(146,'58.127.214.27','2021-03-05','00:19:37','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(147,'121.53.83.4','2021-03-05','20:08:53','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(148,'220.64.104.7','2021-03-05','20:08:53','http://dhc2021.cafe24.com/dhc/level1_basic.php','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(149,'211.176.125.70','2021-03-05','22:57:06','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(150,'106.101.193.146','2021-03-05','23:27:51','','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.72 Mobile Safari/537.36','','',''),(151,'121.130.13.129','2021-03-05','23:34:00','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','','',''),(152,'121.130.2.43','2021-03-05','23:49:26','http://dhc2021.cafe24.com/dhc/introduce.php','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.72 Mobile Safari/537.36','','',''),(153,'203.229.163.89','2021-03-07','18:30:23','http://dhc2021.cafe24.com/bbs/login.php?&url=%2Fdhc%2Flevel0.php','Mozilla/5.0 (Linux; Android 9; SM-G950N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36','','',''),(154,'121.53.181.3','2021-03-08','11:02:29','','facebookexternalhit/1.1; kakaotalk-scrap/1.0; +https://devtalk.kakao.com/t/scrap/33984','','',''),(155,'211.176.125.70','2021-03-08','17:42:01','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(156,'211.176.125.70','2021-03-09','01:11:27','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)','','',''),(157,'121.130.2.43','2021-03-11','22:34:20','','Mozilla/5.0 (Linux; Android 11; SM-N986N Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.86 Mobile Safari/537.36','','','');
/*!40000 ALTER TABLE `g5_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit_sum`
--

DROP TABLE IF EXISTS `g5_visit_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_visit_sum` (
  `vs_date` date NOT NULL DEFAULT '0000-00-00',
  `vs_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vs_date`),
  KEY `index1` (`vs_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit_sum`
--

LOCK TABLES `g5_visit_sum` WRITE;
/*!40000 ALTER TABLE `g5_visit_sum` DISABLE KEYS */;
INSERT INTO `g5_visit_sum` VALUES ('2020-04-06',1),('2021-02-05',2),('2021-02-07',1),('2021-02-11',2),('2021-02-15',1),('2021-02-16',23),('2021-02-17',2),('2021-02-18',8),('2021-02-19',14),('2021-02-20',4),('2021-02-21',2),('2021-02-22',6),('2021-02-23',6),('2021-02-24',3),('2021-02-25',12),('2021-02-26',14),('2021-02-27',9),('2021-02-28',4),('2021-03-01',7),('2021-03-02',12),('2021-03-03',8),('2021-03-04',5),('2021-03-05',7),('2021-03-07',1),('2021-03-08',2),('2021-03-09',1),('2021-03-11',1);
/*!40000 ALTER TABLE `g5_visit_sum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_level0`
--

DROP TABLE IF EXISTS `g5_write_level0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_level0` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` varchar(255) NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(30) NOT NULL,
  `wr_2` varchar(10) NOT NULL,
  `wr_3` tinyint(1) NOT NULL,
  `wr_4` tinyint(1) NOT NULL DEFAULT '0',
  `wr_5` int(4) NOT NULL DEFAULT '1',
  `wr_6` int(5) NOT NULL DEFAULT '9999',
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`),
  KEY `ca_name` (`ca_name`,`wr_good`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_level0`
--

LOCK TABLES `g5_write_level0` WRITE;
/*!40000 ALTER TABLE `g5_write_level0` DISABLE KEYS */;
INSERT INTO `g5_write_level0` VALUES (1,-1,'',1,0,0,'','사용','','kg,g','1kg|1,000g','kgg','','',0,0,4,1,0,'admin','','최고관리자','admin@domain.com','','2021-02-15 23:48:12',0,'2021-02-15 23:48:12','218.144.62.247','','','무게','1000',0,0,1,9999,'','','',''),(2,-2,'',2,0,0,'','사용','','g,kg','1g|0.001kg','mgkg','','',0,0,2,2,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:46:04',0,'2021-02-16 00:46:04','218.144.62.247','','','무게','0.001',3,0,1,9999,'','','',''),(3,-3,'',3,0,0,'','사용','','mg,mcg','1mg|1,000mcg','mgmcg','','',0,0,1,5,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:47:54',0,'2021-02-16 00:47:54','218.144.62.247','','','무게','1000',0,0,1,9999,'','','',''),(4,-4,'',4,0,0,'','사용','','mcg,mg','1mcg|0.001mg','mcgmg','','',0,0,1,6,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:48:15',0,'2021-02-16 00:48:15','218.144.62.247','','','무게','0.001',3,0,1,9999,'','','',''),(5,-5,'',5,0,0,'','사용','','mcg,ng','1mcg|1,000ng','mgmcg-1','','',0,0,1,7,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:48:37',0,'2021-02-16 00:48:37','218.144.62.247','','','무게','1000',0,0,1,9999,'','','',''),(6,-6,'',6,0,0,'','사용','','ng,mcg','1ng|0.001mcg','ngmcg','','',0,0,1,8,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:50:59',0,'2021-02-16 00:50:59','218.144.62.247','','','무게','0.001',3,0,1,9999,'','','',''),(7,-7,'',7,0,0,'','사용','','mcg,µg','1mcg|1µg','mcgµg','','',0,0,1,9,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:52:07',0,'2021-02-16 00:52:07','218.144.62.247','','','무게','1',0,0,1,9999,'','','',''),(8,-8,'',8,0,0,'','사용','','µg,mcg','1µg|1mcg','µgmcg','','',0,0,1,10,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:56:01',0,'2021-02-16 00:56:01','218.144.62.247','','','무게','1',0,0,1,9999,'','','',''),(9,-9,'',9,0,0,'','사용','','mg,µg','1mg|1,000µg','mgµg','','',0,0,1,11,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:56:30',0,'2021-02-16 00:56:30','218.144.62.247','','','무게','1000',0,0,1,9999,'','','',''),(10,-10,'',10,0,0,'','사용','','µg,mg','1µg|0.001mg','µgmg','','',0,0,1,12,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:56:57',0,'2021-02-16 00:56:57','218.144.62.247','','','무게','0.001',3,0,1,9999,'','','',''),(11,-11,'',11,0,0,'','사용','','µg,ng','1µg|1,000ng','µgng','','',0,0,1,13,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:57:15',0,'2021-02-16 00:57:15','218.144.62.247','','','부피','1000',0,0,1,9999,'','','',''),(12,-12,'',12,0,0,'','사용','','ng,µg','1ng|0.001µg','ngµg','','',0,0,1,14,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:57:34',0,'2021-02-16 00:57:34','218.144.62.247','','','부피','0.001',3,0,1,9999,'','','',''),(13,-13,'',13,0,0,'','사용','','L,mL','1L|1,000mL','lml','','',0,0,1,15,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:57:51',0,'2021-02-16 00:57:51','218.144.62.247','','','부피','1000',0,0,1,9999,'','','',''),(14,-14,'',14,0,0,'','사용','','mL,L','1mL|0.001L','mll','','',0,0,1,16,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:58:10',0,'2021-02-16 00:58:10','218.144.62.247','','','부피','0.001',3,0,1,9999,'','','',''),(15,-15,'',15,0,0,'','사용','','IU,mU','1IU|1,000mU','iumu','','',0,0,1,17,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:58:26',0,'2021-02-16 00:58:26','218.144.62.247','','','부피','1000',0,0,1,9999,'','','',''),(16,-16,'',16,0,0,'','사용','','mU,IU','1mU|0.001IU','muiu','','',0,0,1,18,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:58:56',0,'2021-02-16 00:58:56','218.144.62.247','','','부피','0.001',3,0,1,9999,'','','',''),(17,-17,'',17,0,0,'','사용','','mL,cc','1mL|1cc','mlcc','','',0,0,1,19,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:59:24',0,'2021-02-16 00:59:24','218.144.62.247','','','부피','1',0,0,1,9999,'','','',''),(18,-18,'',18,0,0,'','사용','','cc,mL','1cc|1mL','ccml','','',0,0,1,20,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 00:59:45',0,'2021-02-16 00:59:45','218.144.62.247','','','부피','1',0,0,1,9999,'','','',''),(19,-19,'',19,0,0,'','사용','','hr,min','1hr|60min','hrmin','','',0,0,1,21,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:00:04',0,'2021-02-16 01:00:04','218.144.62.247','','','시간','60',0,0,1,9999,'','','',''),(20,-20,'',20,0,0,'','사용','','min,hr','1min|1/60hr','minhr','','',0,0,3,22,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:00:23',0,'2021-02-16 01:00:23','218.144.62.247','','','시간','60',3,1,1,9999,'','','',''),(21,-21,'',21,0,0,'','사용','','min,sec','1min|60sec','minsec','','',0,0,1,23,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:00:49',0,'2021-02-16 01:00:49','218.144.62.247','','','시간','60',0,0,1,9999,'','','',''),(22,-22,'',22,0,0,'','사용','','sec,min','1sec|1/60min','secmin','','',0,0,2,24,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:01:10',0,'2021-02-16 01:01:10','218.144.62.247','','','시간','60',3,1,1,9999,'','','',''),(23,-23,'',23,0,0,'','사용','','hr,sec','1hr|3,600sec','hrsec','','',0,0,1,25,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:01:33',0,'2021-02-16 01:01:33','218.144.62.247','','','시간','3600',0,0,1,9999,'','','',''),(24,-24,'',24,0,0,'','사용','','m,cm','1m|100cm','mcm','','',0,0,1,29,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:01:47',0,'2021-02-16 01:01:47','218.144.62.247','','','길이','100',0,0,1,9999,'','','',''),(25,-25,'',25,0,0,'','사용','','cm,m','1cm|0.01m','cmm','','',0,0,2,30,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:02:06',0,'2021-02-16 01:02:06','218.144.62.247','','','길이','0.01',3,0,1,9999,'','','',''),(26,-26,'',26,0,0,'','사용','','m,mm','1m|1,000mm','mmm','','',0,0,1,31,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:02:23',0,'2021-02-16 01:02:23','218.144.62.247','','','길이','1000',0,0,1,9999,'','','',''),(27,-27,'',27,0,0,'','사용','','mm,m','1mm|0.001m','mmm-1','','',0,0,1,32,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:02:38',0,'2021-02-16 01:02:38','218.144.62.247','','','길이','0.001',3,0,1,9999,'','','',''),(28,-28,'',28,0,0,'','사용','','cm,mm','1cm|10mm','cmmm','','',0,0,1,33,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:02:56',0,'2021-02-16 01:02:56','218.144.62.247','','','길이','10',0,0,1,9999,'','','',''),(29,-29,'',29,0,0,'','사용','','mm,cm','1mm|0.1cm','mmcm','','',0,0,1,34,0,'admin','','최고관리자','admin@domain.com','','2021-02-16 01:03:11',0,'2021-02-16 01:03:11','218.144.62.247','','','길이','0.1',1,0,1,9999,'','','',''),(30,-30,'',30,0,0,'','사용','','g,mg','1g|1,000mg','gmg','','',0,0,1,3,0,'admin','','최고관리자','admin@domain.com','','2021-02-26 20:57:34',0,'2021-02-26 20:57:34','125.131.24.78','','','무게','1000',0,0,1,9999,'','','',''),(31,-31,'',31,0,0,'','사용','','mg,g','1mg|0.001g','mgg','','',0,0,1,4,0,'admin','','최고관리자','admin@domain.com','','2021-02-26 20:58:19',0,'2021-02-26 20:58:19','125.131.24.78','','','무게','0.001',3,0,1,9999,'','','',''),(32,-32,'',32,0,0,'','사용','','sec,hr','1sec|1/3600hr','sechr','','',0,0,2,26,0,'admin','','최고관리자','admin@domain.com','','2021-02-26 21:17:58',0,'2021-02-26 21:17:58','125.131.24.78','','','시간','3600',3,1,1,9999,'','','',''),(33,-33,'',33,0,0,'','사용','','day,hr','1day|24hr','dayhr','','',0,0,1,27,0,'admin','','최고관리자','admin@domain.com','','2021-02-26 21:18:51',0,'2021-02-26 21:18:51','125.131.24.78','','','시간','24',0,0,1,9999,'','','',''),(34,-34,'',34,0,0,'','사용','','day,min','1day|1,440min','daymin','','',0,0,1,28,0,'admin','','최고관리자','admin@domain.com','','2021-02-26 21:20:11',0,'2021-02-26 21:20:11','125.131.24.78','','','시간','1440',0,0,1,9999,'','','','');
/*!40000 ALTER TABLE `g5_write_level0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_level1`
--

DROP TABLE IF EXISTS `g5_write_level1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_level1` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '레벨 : 기초,중급,고급',
  `wr_2` tinyint(1) NOT NULL DEFAULT '0' COMMENT '시나리오 번호',
  `wr_3` tinyint(1) NOT NULL DEFAULT '0' COMMENT '변수수',
  `wr_4` tinyint(1) NOT NULL DEFAULT '1' COMMENT '문항수',
  `wr_5` text NOT NULL COMMENT '변수저장',
  `wr_6` text NOT NULL COMMENT '문항저장',
  `wr_7` text NOT NULL COMMENT '풀이과정',
  `wr_8` text NOT NULL COMMENT '정답내용',
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`),
  KEY `ca_name` (`ca_name`,`wr_1`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_level1`
--

LOCK TABLES `g5_write_level1` WRITE;
/*!40000 ALTER TABLE `g5_write_level1` DISABLE KEYS */;
INSERT INTO `g5_write_level1` VALUES (1,-1,'',1,0,0,'','사용','','통증','응급실에 {1}세 {2} 환자 A가 실려왔다. 응급구조사에  따르면 그는 출근 도중 {3}.  통증이 시작 된지  {5}분이 지났다.  응급의학과 전문의는 {6} {sh2} {7} mg{/sh}을 처방하였다. 병원에 공급되는 {6} 제품은 {sh2}{8} mg/cc{/sh} 이다.','통증','','',0,0,6,1,0,'admin','','최고관리자','admin@domain.com','','2021-02-20 20:52:37',0,'2021-02-20 20:52:37','211.104.15.10','','',0,1,8,1,'YTo4OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjMiO3M6NDoibmFtZSI7czo5OiI1MH42MCDshLgiO3M6MzoibWluIjtzOjI6IjUwIjtzOjM6Im1heCI7czoyOiI2MCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo3OiLrgqh87JesIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MjthOjg6e3M6MzoibnVtIjtzOjE6IjMiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjE2MDoi6rCA7Iq0IOybgOy8nOylkOqzoCDsk7Drn6zsoYzri6Tqs6Ag7ZWc64ukIHzsmbzsqr0g6rCA7Iq07JeQIOyLrO2VnCDthrXspp3snYQg64qQ6rK864uk6rOgIO2VnOuLpHzsmbzsqr0g7YyU6rO8IOyZvOyqveyWtOq5qOuhnCDrsKnsgqzthrXspp0g64qQ6ryI64uk6rOgIO2VnOuLpCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoxMzoi7Zi47Z2hIOqzpOuegCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czo4OiIxNX4zMOu2hCI7czozOiJtaW4iO3M6MjoiMTUiO3M6MzoibWF4IjtzOjI6IjMwIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjE2OiJNb3JwaGluZSBTdWxmYXRlIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjk6IjR+MTAgKG1nKSI7czozOiJtaW4iO3M6MToiNCI7czozOiJtYXgiO3M6MjoiMTAiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo3O2E6ODp7czozOiJudW0iO3M6MToiOCI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTE6IjAuNXwxfDEwfDE1IjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToxOntpOjA7czo4MDoi6rCE7Zi47IKs64qUIOydmOyCrCDsspjrsKnsl5Ag65Sw6528IHtzaDN966qHIG1MPC9zaD7rpbwg7Yis7Jes7ZW07JW8IO2VmOuKlOqwgD8iO30=','투여량 = (처방 용량)/(패키지 용량)\r\n패키지 용량 : 성분용량 / 전체 용량\r\n단위 통일 mL = cc','투여량 (mL)\r\n$$= \\frac{처방용량  {0} (mg)}{패키지용량 {1} (mg/mL)} $$\r\n= {2} (mL)={2} (cc)','※ 최종결과는 소수점 첫째 자리까지 반올림해서 제출하세요','YToxOntpOjA7czoyOiJtTCI7fQ=='),(2,-2,'',2,0,0,'','사용','','알레르기','{1}세 {2}가 {3} 두드러기가 나고 {4} 증세를 호소하며 응급실에 도착하였다. 의사는 {5}라고 진단, {6} 주사 {sh1}{7}mg{/sh}을 처방하였다. 병원에서 사용하는 {6} 주사제는 {sh2}{8A}{/sh} 패키지로 공급된다.','알레르기','','',0,0,3,2,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 01:08:17',0,'2021-02-21 01:08:17','211.104.15.10','','',0,2,8,1,'YTo4OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjMiO3M6NDoibmFtZSI7czo3OiI3fjEz7IS4IjtzOjM6Im1pbiI7czoxOiI3IjtzOjM6Im1heCI7czoyOiIxMyI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7JWEfOyXrOyVhCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo3Mjoi7JaR7Kq9IO2MlOyXkHzsmKTrpbgg7YyU7JeQfHzsmbwg7YyU7JeQ7Jm87Kq9IO2XiOuyheyngOyXkHzrk7Eg7IOB67aA7JeQIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjE5OiLsi6ztlZwg6rCA66Ck7JuA7KadIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NDthOjg6e3M6MzoibnVtIjtzOjE6IjUiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjI5OiLrsozroIjsl5Ag66y866awIOyVjOugiOultOq4sCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjU7YTo4OntzOjM6Im51bSI7czoxOiI2IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czo4OiJCZW5hZHJ5bCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjY7YTo4OntzOjM6Im51bSI7czoxOiI3IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMToiMTB8MTV8MjB8MjUiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo3O2E6ODp7czozOiJudW0iO3M6MToiOCI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6MzA6IjUwLDF8NTAsMjs1MG1nIC8gbUx8NTBtZyAvIDJtTCI7czozOiJtaW4iO3M6MToiMiI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToxOntpOjA7czo1Nzoi7J2Y7IKsIOyymOuwqeyXkCDrlLDrnbwg66qHIGNj66W8IOyjvOyCrO2VtOyVvCDtlZjripTqsIA/Ijt9','투여량 =  (처방 용량)/(패키지 용량)\r\n패키지 용량 : 성분용량 / 전체 용량\r\n단위 통일 mL = cc','투여량 (mL)\r\n$$= \\frac{처방용량 {0} (mg)}{패키지용량 {1} (mg) / {2}(mL)} $$\r\n={3} (mL)={3} (cc)','※ 최종결과는 소수점 첫째 자리까지 반올림해서 제출하세요.','YToxOntpOjA7czoyOiJjYyI7fQ=='),(3,-3,'',3,0,0,'','사용','','소아서맥','{1}세 {2}가 학교 수업도중 {3}을 호소하다 {4} 응급실로 실려왔다. 체중은 {sh2}{1W}kg{/sh}, 신장 {sh1}{1H}cm{/sh}. 심전도검사 결과 맥박 {5}회, {6}으로 진단되어 의사는 {sh1}{8A}{/sh} {7} {sh2}{8}{/sh} mg/kg을 처방하였다. 병원에 공급되는 {7}은 {9A} 이다.','소아서맥','','',0,0,3,3,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 01:29:33',0,'2021-02-21 01:29:33','211.104.15.10','','',2,3,9,1,'YTo5OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjMiO3M6NDoibmFtZSI7czo3OiI3fjEw7IS4IjtzOjM6Im1pbiI7czoxOiI3IjtzOjM6Im1heCI7czoyOiIxMCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czoxOiIyIjt9aToxO2E6ODp7czozOiJudW0iO3M6MToiMiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTM6IuuCqOyVhHzsl6zslYQiO3M6MzoibWluIjtzOjE6IkEiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MjthOjg6e3M6MzoibnVtIjtzOjE6IjMiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjIyOiLslrTsp4Drn7zspp187ZiE6riw7KadIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjI2OiLsnZjsi53snYQg7J6D6rOgIOyTsOufrOyguCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNjoiNDUgfiA2MCAo66el67CVKSI7czozOiJtaW4iO3M6MjoiNDUiO3M6MzoibWF4IjtzOjI6IjYwIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjEzOiLshozslYQg7ISc66elIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjg6IkF0cm9waW5lIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NzthOjg6e3M6MzoibnVtIjtzOjE6IjgiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjkyOiIwLjAyfDAuMDR8MC4wNXwwLjA2O+ygleunpeyjvOyCrOuhnHzquLDqtIDrgrTqtIDsnLzroZx86riw6rSA64K06rSA7Jy866GcfOq4sOq0gOuCtOq0gOycvOuhnCI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6ODthOjg6e3M6MzoibnVtIjtzOjE6IjkiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjQzOiIwLjQsMXwxLDF8OCwyMDswLjQgbWcvbUx8MSBtZy9tTHw4IG1nLzIwIG1MIjtzOjM6Im1pbiI7czoxOiIyIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9fQ==','YToxOntpOjA7czo5Nzoi64u064u56rCE7Zi47IKs64qUIOyymOuwqeyXkCDrlLDrnbwge3NoMX1BdHJvcGluZXsvc2h9IHtzaDN966qHY2N7L3NofeydhCDso7zsgqztlbTslbwg7ZWY64qU6rCAPyI7fQ==','총처방용량 = kg당 처방용량 x 체중 (kg)\r\n패키지 용량 : 성분용량 / 전체 용량\r\n투여량 $$= \\frac{총 처방 용량}{패키지 용량} $$\r\n단위 통일 mL = cc','총처방용량 = {0} (mg/kg) x {1} (kg) = {2} (mg)\r\n패키지 용량 = {3} (mg) / {4} (mL)\r\n투여량 (mL) \r\n$$= \\frac{처방용량  {2} (mg)}{패키지용량 {3} (mg) / {4}(mL)} $$\r\n= {5} (mL)={5} (cc)','※ 최종결과는 소수점 둘째 자리까지 반올림으로 제출하세요.','YToxOntpOjA7czoyOiJjYyI7fQ=='),(4,-4,'',4,0,0,'','사용','','소아소맥','{sh1}{1}세{/sh} {2}가 학교 수업도중 {3}을 호소하다 {4} 응급실로 실려왔다. 체중은 {sh2}{1W}kg{/sh}, 신장 {sh1}{1H}cm{/sh}. 심전도검사 결과 맥박은 {sh1}{5}회{/sh}, {6}으로 진단되어 의사는 {sh1}{8B}{/sh}로 {sh1}{7}{/sh} {sh2}{8A}{/sh}mcg/kg 을 처방하였다. 병원에 공급되는 {sh2}{8C}{/sh} 제품이다.','소아소맥','','',0,0,4,4,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 02:49:35',0,'2021-02-21 02:49:35','211.104.15.10','','',2,4,8,1,'YTo4OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjMiO3M6NDoibmFtZSI7czo4OiIxMH4xM+yEuCI7czozOiJtaW4iO3M6MjoiMTAiO3M6MzoibWF4IjtzOjI6IjEzIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjE6IjIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7JWEfOyXrOyVhCI7czozOiJtaW4iO3M6MToiQSI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToyO2E6ODp7czozOiJudW0iO3M6MToiMyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MjI6IuyWtOyngOufvOymnXztmITquLDspp0iO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTozO2E6ODp7czozOiJudW0iO3M6MToiNCI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6Mjc6IuydmOyLneydhCDsnoPqs6Ag7JOw65+s7KC4ICI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxOToi66el67CV7IiYOiAzNSB+IDUwICI7czozOiJtaW4iO3M6MjoiMzUiO3M6MzoibWF4IjtzOjI6IjUwIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjEzOiLshozslYQg7ISc66elIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjExOiJFcGluZXBocmluZSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjc7YTo4OntzOjM6Im51bSI7czoxOiI4IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czoxMTc6IjEsMTB8MSwxOzEwfDEwMDvsoJXrp6Xso7zsgqx86riw6rSA7Yqc67iMO+ygleunpeyjvOyCrOyaqSBFcGluZXBocmluZeydgCAxOjEwLDAwMHzquLDqtIDtipzruIwgRXBpbmVwaHJpbmXsnYAgMToxLDAwMCI7czozOiJtaW4iO3M6MToiMiI7czozOiJtYXgiO3M6MToiNCI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToxOntpOjA7czo5NDoi64u064u56rCE7Zi47IKs64qUIOyymOuwqeyXkCDrlLDrnbwge3NoMn3rqodtTHsvc2h966W8IOygleunpeyjvOyCrOuhnCDso7zsnoXtlbTslbwg7ZWY64qU6rCAPyI7fQ==','총처방용량 = kg당 처방용량 x 체중 (kg)\r\n\r\n패키지 용량 : \r\n1:10,000 = 1mg / 10mL\r\n1:1,000 = 1mg / 1mL\r\n\r\n투여량= \r\n$$= \\frac{처방용량 }{패키지용량 } $$\r\n\r\n단위 통일 1 mg = 1,000 mcg','총처방용량 = {0} (mcg/kg) x {1} (kg)\r\n= {2} (mcg) = {3} (mg)\r\n\r\n패키지 용량 = {4} (mg) / {5} (mL)\r\n\r\n투여량 (mL)\r\n$$= \\frac{처방용량 {3} (mg)}{패키지용량 {4} (mg) / {5}(mL)} $$\r\n={6} (mL)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요.','YToxOntpOjA7czoyOiJtTCI7fQ=='),(5,-5,'',5,0,0,'','사용','','아나필락시스','의료기관 종사자의 COVID-19 백신 접종이 시작되었다. 신장 {sh1}{1H}cm{/sh}, 체중{sh1}{1W}kg{/sh}의 {1}세 {2} {3}A씨는 COVID-19 백신 1차접종을 맞은 후 {7}분만에 {4}, {5} 증세와 함께, {sh1}수축기 혈압이 {6}mmg{/sh}로 떨어졌다. 응급의학의사는 백신 부작용에 의한 {8}로 진단하고 근육주사 {9} {sh2}{10}mg{/sh}를 처방하였다. 병원에 공급되는 {sh0}{9}{/sh}은 {11A} 제품이다.','아나필락시스','','',0,0,3,5,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 03:45:02',0,'2021-02-21 03:45:02','211.104.15.10','','',2,5,11,1,'YToxMTp7aTowO2E6ODp7czozOiJudW0iO3M6MToiMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIzIjtzOjQ6Im5hbWUiO3M6MTc6IuuCmOydtDogMjV+NTXshLggIjtzOjM6Im1pbiI7czoyOiIyNSI7czozOiJtYXgiO3M6MjoiNTUiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MToiMiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czoxOiJBIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxNjoi6rCE7Zi47IKsfOydmOyCrCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoyNjoi7Zi47Z2h6rOk656AfOq4sOy5qHztnYnthrUiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MzU6IuyWtOyngOufvOymnXzsoIDtmIjslZV87J2Y7Iud7IaM7IukIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjI4OiLsiJjstpXquLAg7ZiI7JWVOiA3MH45MCBtbWcgIjtzOjM6Im1pbiI7czoyOiI3MCI7czozOiJtYXgiO3M6MjoiOTAiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6Mjg6IuymneyEuOyLnOyekeyLnOqwhCA6IDV+NjDrtoQiO3M6MzoibWluIjtzOjE6IjUiO3M6MzoibWF4IjtzOjI6IjYwIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NzthOjg6e3M6MzoibnVtIjtzOjE6IjgiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjE4OiLslYTrgpjtlYTrnb3si5zsiqQiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo4O2E6ODp7czozOiJudW0iO3M6MToiOSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MTE6IkVwaW5lcGhyaW5lIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6OTthOjg6e3M6MzoibnVtIjtzOjI6IjEwIjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoyNzoi7LKY67Cp7Jqp65+JOiAwLjMgfiAxLjAgbWcgIjtzOjM6Im1pbiI7czoxOiIzIjtzOjM6Im1heCI7czoyOiIxMCI7czo0OiJ0ZXJtIjtzOjM6IjAuMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTA7YTo4OntzOjM6Im51bSI7czoyOiIxMSI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6MjU6IjEsMXwxLDEwOzE6MSwwMDB8MToxMCwwMDAiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YToxOntpOjA7czo4NDoi64u064u56rCE7Zi47IKs64qUIOydmOyCrOyymOuwqeyXkCDrlLDrnbwge3NoMn3rqodtTHsvc2h966W8IOyjvOyCrO2VtOyVvCDtlZjripTqsIA/Ijt9','패키지 용량 : \r\n1:1,000 = 1mg / 1mL\r\n1:10,000 = 1mg / 10mL\r\n\r\n투여량 $$ = \\frac{처방용량 }{패키지용량 } $$','패키지 용량 = {0} (mg) / {1} (mL)\r\n\r\n투여량 (mL)=  \r\n$$= \\frac{처방용량 {2} (mg)}{패키지용량 {0} (mg) / {1}(mL)} $$\r\n= {3} (mL)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czoyOiJtTCI7fQ=='),(6,-6,'',6,0,0,'','사용','','심방세동','{sh1}{1}대{/sh} {2} 환자가 갑자기 {3}, {4} 증상이 있고 차고 있던 스마트워치에 심실상 부정맥 주의경고가 뜨는 것을 보고 내원하였다. 심전도 검사 결과 {5}으로 진단되어 담당의사는 {sh2}{6A}{/sh} 을 {sh2}{7A}{/sh}을 처방하였다.','심방세동','','',0,0,2,6,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 04:06:25',0,'2021-02-21 04:06:25','211.104.15.10','','',1,6,7,3,'YTo3OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNjoi64KY7J20OiA0NX42NeyEuCI7czozOiJtaW4iO3M6MjoiNDUiO3M6MzoibWF4IjtzOjI6IjY1IjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MjthOjg6e3M6MzoibnVtIjtzOjE6IjMiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjU4OiLsi6zsnqXsnbQg7YGs6rKMIOuRkOq3vOqxsOumrOqzoHztmLjtnaHsnbQg6rOk656A7ZW07KeA6rOgIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjQ1OiLslrTsp4Drn6zsmrR87ZiI7JWV7J20IOuWqOyWtOyngOuKlHztmITquLDspp0iO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MTI6IuyLrOuwqeyEuOuPmSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjU7YTo4OntzOjM6Im51bSI7czoxOiI2IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czo0ODoiMC41fDF8MjswLjUlIExpZG9jYWluZXwxJSBMaWRvY2FpbmV8MiUgTGlkb2NhaW5lIjtzOjM6Im1pbiI7czoxOiIxIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6NDk6IjUwLDF8MTAwLDF8MTAwLDI7NTAgbWcvbWlufDEwMCBtZy9taW58MTAwIG1nLzJtaW4iO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YTozOntpOjA7czo5NToiMS4ge3NoMn0yJSBMaWRvY2FpbmV7L3NofeydgCBtTOuLuSB7c2gzfeuqhyBtZ3svc2h97J2YIHtzaDF9TGlkb2NhaW5ley9zaH3snbQg65Ok7Ja0IOyeiOuKlOqwgD8iO2k6MTtzOjEwNjoiMi4g7J2Y7IKsIOyymOuwqeyXkCDrlLDrpbTrqbQge3NoMn0yJSBMaWRvY2FpbmV7L3NofeydhCB7c2gxfeu2hOuLuSDrqocgbWx7L3NofeuhnCDso7zsnoXtlbTslbwg7ZWY64qU6rCAPyI7aToyO3M6MTA5OiIzLiDsnZjsgqwg7LKY67Cp7JeQIOuUsOultOuptCB7c2gyfTIlIExpZG9jYWluZXsvc2h9IOydhCB7c2gxfeuqhyBndHQvbWluey9zaH0g7Jy866GcIOyjvOyehe2VtOyVvCDtlZjripTqsIA/Ijt9','6-1\r\n0.5% Lidocaine 5 mg/mL\r\n1% Lidocaine  10 mg/mL\r\n2% Lidocaine  20 mg/mL\r\n\r\n6-2\r\n$${투여량} = \\frac{처방용량}{패키지용량} $$\r\n\r\n6-3\r\n분당 방울 수(gtt/min)\r\n$$1 = \\frac{시간당 주입량 (ml/hr)×20(gtt)}{(60(min.)} $$','6-1 {0}% Lidocaine  {1} mg/mL\r\n\r\n6-2\r\n투여량 (mL)  \r\n$$=\\frac{처방용량  {2} (mg)/{3} min}{패키지용량 {1} (mg) / (mL)}  $$\r\n={4} (mL)\r\n6-3\r\n1분당 방울 수(gtt/min)\r\n$$= \\frac{{4}(ml/min)×{5} (min)×{6}(gtt)}{{5}(min.)} $$\r\n ={7} (gtt/min)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요.','YTozOntpOjA7czo1OiJtZy9tTCI7aToxO3M6MjoibUwiO2k6MjtzOjc6Imd0dC9taW4iO30='),(7,-7,'',7,0,0,'','사용','','전방십자인대파열','{sh1}{1}세{/sh} {2}이 스키장에서 스케이트보드를 타다 넘어져 {3}이 되어 {4}에 입원하였다. 의사는 수술전 {5} {sh1}{6}mg{/sh}을 근육주사로 처방하였다. 병원에 공급되는 {5} 패키지는 {sh2}{7A}{/sh}이다.','전방십자인대파열','','',0,0,2,7,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 04:25:19',0,'2021-02-21 04:25:19','211.104.15.10','','',0,7,7,1,'YTo3OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNzoi64KY7J20OiAyMH40MOyEuCAiO3M6MzoibWluIjtzOjI6IjIwIjtzOjM6Im1heCI7czoyOiI0MCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7ISxfOyXrOyEsSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoyNDoi7KCE67Cp7Iut7J6Q7J2464yA7YyM7Je0IjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjEyOiLsoY3tmJXsmbjqs7wiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6ODoiRGlhemVwYW0iO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo1O2E6ODp7czozOiJudW0iO3M6MToiNiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6NzoiNX4zMG1nICI7czozOiJtaW4iO3M6MToiNSI7czozOiJtYXgiO3M6MjoiMzAiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6NDM6IjEwLDJ8NTAsMTB8MjUsNTsxMG1nLzJtTHw1MG1nLzEwbUx8MjVtZy81bUwiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YToxOntpOjA7czo4Nzoi7J2Y7IKsIOyymOuwqeyXkCDrlLDrpbgge3NoMX1EaWF6ZXBhbXsvc2h97J2YIOuGjeuPhCB7c2gzfShtZy9tTCl7L3NofeuKlCDslrzrp4jsnbjqsIA/Ijt9','계산기본 공식\r\n$$농도 = \\frac{용질의 양}{용액의 양} $$\r\n\r\n※ 여기에서의 농도는 %로 표기하지는 않는다.\r\n※ 별도로 약품을 mix 하지 않는 한 농도는 병원사용 제품 농도와 같다.','$$\\text{농도 (%)} = \\frac{{0} mg}{{1} mL} $$ ={2} mg/mL','','YToxOntpOjA7czo1OiJtZy9tTCI7fQ=='),(8,-8,'',8,0,0,'','사용','','발작심실상빈맥','{1}세 {2}이 {3}을 호소하며 병원에 내원하였다. 심전도 검사 결과는 {4}으로 진단되었다. 정상적인 동율동으로의 신속한 전환을 위해 {5}를 정맥주사하도록 지시하였다.\r\n{6A}은 {7A} 패키지로 공급된다.','발작심실상빈맥','','',0,0,2,8,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 05:00:23',0,'2021-02-21 05:00:23','211.104.15.10','','',0,8,7,1,'YTo3OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNDoi64KY7J20OiAzMH41MCAiO3M6MzoibWluIjtzOjI6IjMwIjtzOjM6Im1heCI7czoyOiI1MCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7ISxfOyXrOyEsSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo0Mzoi7Ius7J6l7J20IO2BrOqyjCDrkZDqt7zqsbDrprx86rCA7Iq0IO2GteymnSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoyMToi67Cc7J6R7Ius7Iuk7IOB67mI66elIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NDthOjg6e3M6MzoibnVtIjtzOjE6IjUiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjk6IkFkZW5vc2luZSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjU7YTo4OntzOjM6Im51bSI7czoxOiI2IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czoyOTk6IjN8NnwxMjt7c2gyfTNtZ3svc2h9fHtzaDF9M21nKOy0iO2ajCnrpbwg7KCV66el7KO87IKsIO2VmOyYgOycvOuCmCDsi6zsi6Tsg4HshLHruYjrp6XsnbQg7IaM7Iuk65CY7KeAIOyViuyekCDri7Tri7nsnZjsgqzripQg7LaU6rCA66Gcey9zaH0ge3NoMn02bWd7L3NofXx7c2gxfTNtZyjstIjtmowpLCA2bWcoMuywqCnrpbwg7KCV66el7KO87IKsIO2VmOyYgOycvOuCmCDsi6zsi6Tsg4HshLHruYjrp6XsnbQg7IaM7Iuk65CY7KeAIOyViuyekCwg64u064u57J2Y7IKs64qUIOy2lOqwgOuhnHsvc2h9IHtzaDJ9MTJtZ3svc2h9IjtzOjM6Im1pbiI7czoxOiIxIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6Mzk6IjYsMnwxMiw0fDI0LDg7Nm1nLzJtTHwxMm1nLzRtTHwyNG1nLzhtTCI7czozOiJtaW4iO3M6MToiMiI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToxOntpOjA7czo5MToi7J2Y7IKsIOyymOuwqeyXkCDrlLDrnbwg7LSdIHtzaDN966qHIG1Mey9zaH3snZgge3NoMX1BZGVub3NpbmV7L3NofeydhCDtiKzsnoXtlbTslbwg7ZWY64KYPyI7fQ==','$$ 투여량 = \\frac{처방용량 }{패키지용량 } $$','투여량(mL)\r\n$$=\\frac{{0}mg}{{1}mg/{2}mL} $$\r\n= {3}(mL)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czoyOiJtTCI7fQ=='),(9,-9,'',9,0,0,'','사용','','심실빈맥','{sh1}{1}세{/sh} {2}이 {3}과 {4}을 느껴 병원에 내원하였다. 환자 체중은 {sh2}{1W}kg{/sh}였으며, 심전도 검사 결과 {5}으로 진단되었다. 담당의사는 {6}을 체중 {sh2}{8A}{/sh}을 {7A}에 희석하여 {sh2}{9A}{/sh}에 걸쳐 천천히 투여하고 처방하였다. 병원에 공급되는 패키지는 {sh2}{10A}{/sh}이다.','심실빈맥','','',0,0,3,9,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 05:13:04',0,'2021-02-21 05:13:04','211.104.15.10','','',0,9,10,3,'YToxMDp7aTowO2E6ODp7czozOiJudW0iO3M6MToiMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIzIjtzOjQ6Im5hbWUiO3M6MTQ6IuuCmOydtDogNDB+NTAgIjtzOjM6Im1pbiI7czoyOiI0MCI7czozOiJtYXgiO3M6MjoiNTAiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MToiMiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czoxOiJBIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo0Mzoi7Ius7J6l7J20IO2BrOqyjCDrkZDqt7zqsbDrprx86rCA7Iq0IO2GteymnSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czozMjoi7Ja07KeA65+s7JuAfOyggO2YiOyVlXztmITquLDspp0iO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MTI6IuyLrOyLpOu5iOunpSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjU7YTo4OntzOjM6Im51bSI7czoxOiI2IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoxMDoiQW1pb2Rhcm9uZSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjY7YTo4OntzOjM6Im51bSI7czoxOiI3IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czozNToiMjUwOzUlIO2PrOuPhOuLuSDso7zsgqzslaEgMjUwIG1MICAiO3M6MzoibWluIjtzOjE6IjEiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjc7YTo4OntzOjM6Im51bSI7czoxOiI4IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czoxMToiNTtrZ+uLuSA1bWciO3M6MzoibWluIjtzOjE6IjEiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjg7YTo4OntzOjM6Im51bSI7czoxOiI5IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czo1NDoiMjB8MzB8NjB8OTB8MTIwOzIwIOu2hHwzMCDrtoR8MSDsi5zqsIR8OTAg67aEfDIg7Iuc6rCEIjtzOjM6Im1pbiI7czoxOiIxIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo5O2E6ODp7czozOiJudW0iO3M6MjoiMTAiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjM5OiIxNTAsM3w0NTAsOTsxNTAgbWcgLyAzIG1MfDQ1MCBtZyAvIDkgbUwiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YTozOntpOjA7czo2Nzoi7J2Y7IKsIOyymOuwqeyXkCDrlLDrnbwg7LSdIHtzaDN966qHbUx7L3NofeulvCDtiKzsnoXtlbTslbwg7ZWY64KYPyI7aToxO3M6NzM6IuydmOyCrCDsspjrsKnsl5Ag65Sw66W066m0IHtzaDN967aE64u5IOuqh21Mey9zaH3rpbwg7Yis7J6F7ZW07JW8IO2VmOuCmD8iO2k6MjtzOjgwOiLsnZjsgqwg7LKY67Cp7JeQIOuUsOultOuptCB7c2gzfeu2hOuLuSDrqofrsKnsmrh7L3NofeydtCDso7zsnoXrkJjslrTslbwg7ZWY64KYPyI7fQ==','1. 총 처방용량 = kg당 처방용량 x 체중 (kg)\r\n2. 분당 처방약품량 (mg/min)\r\n$$=\\frac{총 처방용량 (mg)}{주입시간 (min)} $$\r\n3. 분당 주입량 (mL/min)\r\n$$=\\frac{총 수액 주입량 (mL)}{주입시간 (min)} $$\r\n4. 1분당 방울 수(gtt/min)\r\n=분당 주입량 (ml/min)×20(gtt)','1. 총 처방용량 (mg) \r\n= {0} mg/kg x {1} kg = {2} mg\r\n\r\n- 분당 처방약품량 (mg/min) \r\n= {2} mg / {3} min = {4} mg/min\r\n\r\n2. 분당 주입량 (mL/min) \r\n= {5} mL / {3} min \r\n= {6} mL/min ≒ {7} mL/min\r\n\r\n3. 1분당 방울수 \r\n= {7} (mL/min) x {8} gtt\r\n = {9} gtt ≒ {10} gtt','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YTozOntpOjA7czoyOiJtTCI7aToxO3M6MjoibUwiO2k6MjtzOjM6Imd0dCI7fQ=='),(10,-10,'',10,0,0,'','사용','','당뇨성 케토산증','{3} 치료를 위해 입원한 {sh1}{1}세{/sh} {2} 환자에게 {sh2}{4A}{/sh}를 {sh2}q{5}h{/sh}로 처방하였다.','당뇨성-케토산증','','',0,0,3,10,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 05:36:06',0,'2021-02-21 05:36:06','211.104.15.10','','',0,10,5,1,'YTo1OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNzoi64KY7J20OiA0MH42NSDshLgiO3M6MzoibWluIjtzOjI6IjQwIjtzOjM6Im1heCI7czoyOiI2NSI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7ISxfOyXrOyEsSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoyMToi64u564eo7ISx7LyA7Yag7IKw7KadIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjI1OiI1MDB8MTAwMDtIL1MgNTAwbUx8SC9TIDFMIjtzOjM6Im1pbiI7czoxOiIxIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6NjoiMTJ8OHw2IjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToxOntpOjA7czo3NToi6rCE7Zi47IKs64qUIHtzaDF9SC9Tey9zaH3rpbwg66qHIHtzaDJ9Z3R0L21pbnsvc2h97Jy866GcIOyjvOyWtOyVvCDtlZjrgpg/Ijt9','q12h = 12 hr 마다 1번씩\r\nq8h = 8 hr 마다 1번씩\r\nq6h = 6 hr 마다 1번씩\r\n\r\n단위환산 1L = 1,000 mL\r\n$$시간당 주입량 (mL/hr)=\\frac{총 주입량 (mL)}{주입시간 (hr)} $$\r\n1분당 방울 수(gtt/min)\r\n$$=\\frac{시간당 주입량 (mL/hr)×20(gtt)}{60(min.)} $$','시간당 주입량 (mL/min) \r\n= {0} (mL) / {1} (hr) = {2} (mL)\r\n1분당 방울수 gtt/min\r\n = ({2} x {3}) /{4}\r\n = {5} ≒ {6} (gtt/min)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czo3OiJndHQvbWluIjt9'),(11,-11,'',11,0,0,'','사용','','골수성 백혈병','{sh1}{1}세{/sh} {2}가 {3} 치료를 위해 입원하였다. 입원 후 검사에서 체중은 {sh2}{1W}kg{/sh}으로 측정되었다. 담당의사는 {sh1}1일 {4} {6}mg/kg{/sh}을 {sh3}{8}mL{/sh} {sh1}5% 포도당 수액{/sh}에 혼합하여 투입하도록 처방하였다. 병원에 공급되는 {4}은 {sh2}{7A}{/sh} 제품이다.','골수성-백혈병','','',0,0,3,11,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 05:49:49',0,'2021-02-21 05:49:49','211.104.15.10','','',1,11,8,2,'YTo4OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjMiO3M6NDoibmFtZSI7czo3OiI1fjEz7IS4IjtzOjM6Im1pbiI7czoxOiI1IjtzOjM6Im1heCI7czoyOiIxMyI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czoxOiIxIjt9aToxO2E6ODp7czozOiJudW0iO3M6MToiMiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTM6IuuCqOyVhHzsl6zslYQiO3M6MzoibWluIjtzOjE6IkIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MjthOjg6e3M6MzoibnVtIjtzOjE6IjMiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjI2OiLquInshLEg6rOo7IiY7ISxIOuwse2YiOuzkSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoxMDoiQ3l0YXJhYmluZSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoyMDoiNSUg7Y+s64+E64u5IOyImOyVoSAiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo1O2E6ODp7czozOiJudW0iO3M6MToiNiI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6Mjg6IuyymOuwqeyaqeufiTogMC42fjIuMyBtZy9rZyAiO3M6MzoibWluIjtzOjE6IjYiO3M6MzoibWF4IjtzOjI6IjIzIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjM6IjAuMSI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjM2OiIxMDAsNXw1MDAsMjU7MTAwIG1nLzVtTHw1MDAgbWcvMjUgbUwiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjc7YTo4OntzOjM6Im51bSI7czoxOiI4IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo3OiIyNTB8NTAwIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToyOntpOjA7czoxMzI6IuydmOyCrCDsspjrsKnsl5Ag65Sw6528IEN5dGFyYWJpbmXsnYAg7Iuc6rCE64u5IOuqhyBtZ+ydhCDso7zripQg7IWI7J246rCAPzxicj4o7IaM7IiY7KCQIOuRmOynuOyekOumrOq5jOyngCDrsJjsmKzrprzsnLzroZwg7KCc7LacKSI7aToxO3M6MTE1OiLrtoTri7kg66qHIOuwqeyauCAoZ3R0L21pbikg7Jy866GcIOyjvOyehe2VtOyVvCDtlZjripTqsIA/PGJyPijshozsiJjsoJAg7LKr7Ke47J6Q66as6rmM7KeAIOuwmOyYrOumvOycvOuhnCDsoJzstpwpIjt9','11-1 \r\n총 처방 약품 용량\r\n= kg당 처방용량 (mg/kg) * 체중 (kg)\r\n\r\n시간당  주입약품량 (mg/hr)\r\n$$=\\frac{총 처방용량 (mg)}{주입시간 (hr)} $$\r\n\r\n11-2\r\n시간당  주입약품량 (mg/hr)\r\n$$=\\frac{총 처방용량 (mg)}{주입시간 (hr)} $$\r\n\r\n1분당 방울 수(gtt/min)\r\n$$=\\frac{시간당 수액 주입량 (ml/hr)×20(gtt)}{60(min.)} $$\r\n\r\n참고: 수액에 섞어서 투입하는 경우는 수액에서 처방약 용량만큼을 빼고 주입하기 때문에 ± 0가 되어 결국 수액의 양이 gtt/min 을 결정한다.','11-1\r\n총처방 약품 용량 (mg)\r\n= {0} (mg/kg) x {1} (kg) = {2} (mg)\r\n시간당  주입약품량 (mg/hr)\r\n$$= \\frac{{2} (mg)}{{3} (hr) } $$\r\n= {4} = {5}(mg/hr)\r\n\r\n11-2\r\n시간당 수액 주입량 (ml/hr)\r\n$$=\\frac{{6} (mg)}{{3} (hr) }$$\r\n= {7}(ml/hr)\r\n≒ {8} (ml/hr)\r\n\r\n1분당 방울 수(gtt/min)\r\n$$=\\frac{{7}(ml/hr)×{9}(gtt)}{{10}(min.)}$$\r\n= {11} (gtt/min) \r\n≒ {12} (gtt/min)','','YToyOntpOjA7czoyOiJtZyI7aToxO3M6NzoiZ3R0L21pbiI7fQ=='),(12,-12,'',12,0,0,'','사용','','급성 신부전','{sh1}{1}세{/sh} {2} {3} 환자가 입원하였다. 의사는 이뇨기 단계에서 {4} 및 {5}을 막기 위해 {6} 수액을 시간당 {sh2}{8}ml{/sh}로 {7}로  주입하도록 처방하였다.','급성-신부전','','',0,0,3,12,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 06:12:08',0,'2021-02-21 06:12:08','211.104.15.10','','',0,12,8,1,'YTo4OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNjoi64KY7J20OiA0MH42MOyEuCI7czozOiJtaW4iO3M6MjoiNDAiO3M6MzoibWF4IjtzOjI6IjYwIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MjthOjg6e3M6MzoibnVtIjtzOjE6IjMiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjE2OiLquInshLEg7Iug67aA7KCEIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjMzOiLsiJjrtoQg7IaQ7IukfOq4sOumveyEsSDsoIDtmIjslZUiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6NDA6IuqwgOuyvOyatCDrgpjtirjrpagg6rKw7ZWNfOq3vOycoSDqsr3roKgiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo1O2E6ODp7czozOiJudW0iO3M6MToiNiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTY6IjAuOSUgTlN8MC40NSUgTlMiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTI6InE2aHxxOGh8cTEyaCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjc7YTo4OntzOjM6Im51bSI7czoxOiI4IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMDoiNTB8MTAwfDE1MCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YToxOntpOjA7czo3NToi7J2Y7IKsIOyymOuwqeyXkCDrlLDrnbwg66qHe3NoM31ndHQvbWluey9zaH0g7Jy866GcIO2IrOyehe2VtOyVvCDtlZjripTqsIA/Ijt9','이미 시간당 주입량은 의사 처방으로 나와 있음\r\n1분당 방울 수(gtt/min)\r\n$$=\\frac{시간당 주입량 (ml/hr)×20(gtt)}{60(min.)} $$','1분당 방울 수(gtt/min)\r\n$$=\\frac{{0} (ml/hr)×20(gtt)}{60(min.)}$$\r\n= {1} (gtt/min)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czo3OiJndHQvbWluIjt9'),(13,-13,'',13,0,0,'','사용','','간암','{sh1}{1}세{/sh} {2}이 {3}으로 {4}을 받게 되었다. 수술 전 기관내 삽관을 위해 {sh2}{5A}{/sh}을 {sh2}{6}mg{/sh} 정맥주사로 투입하려면','간암','','',0,0,4,13,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 06:22:07',0,'2021-02-21 06:22:07','211.104.15.10','','',1,13,6,1,'YTo2OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNjoi64KY7J20OiA0MH42MOyEuCI7czozOiJtaW4iO3M6MjoiNDAiO3M6MzoibWF4IjtzOjI6IjYwIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MjthOjg6e3M6MzoibnVtIjtzOjE6IjMiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjY6IuqwhOyVlCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoxMjoi6rCE7KCI7KCc7IigIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NDthOjg6e3M6MzoibnVtIjtzOjE6IjUiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjMxOiIyMHw0MDsyJSBMaWRvY2FpbmV8NCUgTGlkb2NhaW5lIjtzOjM6Im1pbiI7czoxOiIxIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo1O2E6ODp7czozOiJudW0iO3M6MToiNiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6OToiNTB+MTUwbWcgIjtzOjM6Im1pbiI7czoxOiI1IjtzOjM6Im1heCI7czoyOiIxNSI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czoyOiIxMCI7fX0=','YToxOntpOjA7czo0Njoi7LSdIHtzaDJ966qHY2N7L3NofeulvCDso7zsgqztlbTslbwg7ZWY64qU6rCAPyI7fQ==','패키지 성분함량\r\n2% Lidocaine  20mg/mL\r\n4% Lidocaine  40mg/mL\r\n\r\n$$투여량 = \\frac{처방 용량}{패키지 용량} $$','투여량\r\n$$=\\frac{{0}(mg)}{{1}(mg/mL)} $$\r\n={2}(mL)≒{2}(cc)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czoyOiJjYyI7fQ=='),(14,-14,'',14,0,0,'','사용','','허혈성 뇌경색','{sh1}{1}세{/sh} {2}이 {3}으로 쓰러져 입원하였다.\r\n담당의사는 항혈액 응고제로 {4}을 {5A} 주사하도록 처방하였다.\r\n병원에 공급되는 {4} 제품은 {6A} 이다.','허혈성-뇌경색','','',0,0,2,14,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 06:31:04',0,'2021-02-21 06:31:04','211.104.15.10','','',1,14,6,1,'YTo2OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNzoi64KY7J20OiA0MH42MOyEuCAiO3M6MzoibWluIjtzOjI6IjQwIjtzOjM6Im1heCI7czoyOiI2MCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7ISxfOyXrOyEsSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czoxOToi7ZeI7ZiI7ISxIOuHjOqyveyDiSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czo4OiJoZXBhcmluZSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czo3OToiMTAwMDB8MTUwMDB8MjAwMDB8MjUwMDB8MzAwMDA7MTAsMDAwIElVfDE1LDAwMCBJVXwyMCwwMDAgSVV8MjUsMDAwIElVfDMwLDAwMCBJVSI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjQ1OiIyNTAwMCw1fDIwMDAwLDIwOzI1LDAwMCBJVS81bUx8MjAsMDAwIElVLzIwbWwiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YToxOntpOjA7czo3OToi7J2Y7IKsIOyymOuwqeuMgOuhnCDtiKzsnoXtlZjroKTrqbQg7LSdIHtzaDJ966qHY2N7L3NofeulvCDso7zslrTslbwg7ZWY64qU6rCAPyI7fQ==','$$투여량 = \\frac{처방 용량}{패키지 용량} $$','투여량 \r\n$$= \\frac{{0} (IU)}{{1} IU/{2} (mL)} $$\r\n={3} (mL)={3} (cc)\r\n\r\n※	5% 포도당, 식염수, 링겔액 1,000mL에 1,000~3,000 IU를 용해해서 정맥점적 주사하는 계산도 할 수 있음.','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czoyOiJjYyI7fQ=='),(15,-15,'',15,0,0,'','사용','','암 수술','{sh1}{1}세{/sh} {2}환자에게 담당의사가 {3} 수술 후 {4} {5A}를 {6A}동안 주입하도록 처방하였다.','암-수술','','',0,0,3,15,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 06:45:06',0,'2021-02-21 06:45:06','211.104.15.10','','',1,15,6,1,'YTo2OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoxNzoi64KY7J20OiAyMH42MOyEuCAiO3M6MzoibWluIjtzOjI6IjIwIjtzOjM6Im1heCI7czoyOiI2MCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjE7YTo4OntzOjM6Im51bSI7czoxOiIyIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMzoi64Ko7ISxfOyXrOyEsSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czozMDoi7JyE7JWUfO2PkOyVlHzrjIDsnqXslZR86rCE7JWUIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjY2OiLtla3sg53soJwgbWl4IDAuOCV87ZWt7IOd7KCcIG1peCAxLjAlIE5hQ2x87ZWt7IOd7KCcIG1peCAxLjIlIE5hQ2wiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6Mjg6IjEwMCwxfDEwMCwyOzEwMG1MfDEwMG1MIDJiYWciO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjU7YTo4OntzOjM6Im51bSI7czoxOiI2IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czo0NjoiNjB8OTB8MTIwfDE4MDsxIOyLnOqwhHw5MCDrtoR8MiDsi5zqsIQzIOyLnOqwhCI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fX0=','YToxOntpOjA7czo5Nzoi6rCE7Zi47IKs64qUIOyymOuwqSDslb3tkojsnYQge3NoMX3rqofstIjsl5Ag7ZWcIOuwqeyauOyUqXsvc2h9IOuWqOyWtOyngOuPhOuhnSDtlbTslbwg7ZWY64qU6rCAPyI7fQ==','시간당 주입량 (mL/hr)\r\n$$=\\frac{총 주입량 (mL)}{주입시간 (hr)} $$\r\n1분당 방울 수(gtt/min)\r\n$$=\\frac{시간당 수액 주입량 (ml/hr)×20(gtt)}{60(min.)} $$\r\n방울사이 간격 (sec/gtt)\r\n$$=\\frac{60 sec}{1분당 방울 수 (gtt/min.)} $$','시간당 주입량 (mL/hr)\r\n$$ =\\frac{\\frac{{0} mL×{1} (bag)}{{2} (min)}}{{3}(min)} $$\r\n={4} mL/{5}={6} mL/hr\r\n\r\n1분당 방울 수(gtt/min)\r\n$$=\\frac{{6}(ml/hr)×{7}(gtt)}{{8}(min.)} $$\r\n={9}(gtt/min)\r\n\r\n방울사이 간격 (sec/gtt)\r\n$$=\\frac{{10} sec}{{9} (gtt/min.)} $$\r\n={11} (sec/gtt)≒{12} (sec/gtt)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요.','YToxOntpOjA7czo3OiJzZWMvZ3R0Ijt9'),(16,-16,'',16,0,0,'','사용','','교통사고','{sh1}{1}세{/sh} {2}이 교통사고를 당한 후 119구급대에 의해 응급실에 실려왔다. 도착당시 {3}과 {4}상태였으며 {5}가 온 응급상황이었다.\r\n응급의사는 {6} {sh2}{8} mg{/sh}을 {sh1}{7}{/sh} {sh2}{9A}{/sh}에 희석해서 {sh2}{11} mcg/min{/sh}로 주입할 것을 지시하였다. 병원에 공급되는 {6}은 {sh2}{10A}{/sh} 제품이다.','교통사고','','',0,0,4,16,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 07:08:36',0,'2021-02-21 07:08:36','211.104.15.10','','',1,16,11,2,'YToxMTp7aTowO2E6ODp7czozOiJudW0iO3M6MToiMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6MTc6IuuCmOydtDogMjB+NTDshLggIjtzOjM6Im1pbiI7czoyOiIyMCI7czozOiJtYXgiO3M6MjoiNTAiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToxO2E6ODp7czozOiJudW0iO3M6MToiMiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTM6IuuCqOyEsXzsl6zshLEiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToyO2E6ODp7czozOiJudW0iO3M6MToiMyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6Mjc6IuyLrO2VnCDstpztmIh87J2Y7IudIOu2iOuqhSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czozNDoi7Jm87Kq9IOuLpOumrCDqs6jsoIh87LKZ7LaUIOyGkOyDgSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czo0MToi7Iic7ZmYIO2YiOyVoeufiSDsoIDtlZjsl5Ag65Sw66W4IOyHvO2BrCAiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo1O2E6ODp7czozOiJudW0iO3M6MToiNiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MTQ6Ik5vcmVwaW5lcGhyaW5lIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjk6IjUgRFd8NSBEUyI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjc7YTo4OntzOjM6Im51bSI7czoxOiI4IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo3OiI4fDEwfDIwIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6ODthOjg6e3M6MzoibnVtIjtzOjE6IjkiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjIzOiI1MDB8MTAwMDs1MDAgKG1MKXwxIChMKSI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6OTthOjg6e3M6MzoibnVtIjtzOjI6IjEwIjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czoxNToiNCw0OzQgbWcgLyA0IG1MIjtzOjM6Im1pbiI7czoxOiIyIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToxMDthOjg6e3M6MzoibnVtIjtzOjI6IjExIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo1OiIxMHwxNSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YToyOntpOjA7czoxMjE6IuyymOuwqeuQnCB7c2gxfU5vcmVwaW5lcGhyaW5ley9zaH3snYQg7IiY7JWh7JeQIO2drOyEne2VmOq4sCDsnITtlbTshJwg7IiY7JWh7J2EIHtzaDN966qHIGNjey9zaH0g672R7JWE64K07JW8IO2VmOuKlOqwgD8iO2k6MTtzOjkyOiLsnZjsgqwg7LKY67Cp7JeQIOuUsOudvCAx7Iuc6rCE64u5IOyjvOyeheuQmOuKlCDsiJjslaHsnZgg7Jqp65+J7J2AIHtzaDN966qHIGNjey9zaH0g7J246rCAPyI7fQ==','16-1\r\n추출해야 할 수액 부피 (mL)\r\n= 처방 약품 부피 (mL)\r\n$$= \\frac{처방약품량 (mg)}{패키지 단위 약품량 (mg/mL)} $$ \r\n\r\n※ 본 문제에서는 노르에피네프린의 패키지 용량이 4 (mg/4mL) 이므로, 노르에피네프린의 성분용량 (mg)와 약품의 부피 (mL)이 같음.\r\n패키지 용량에 따라 성분무게 당 부피를 별도로 계산해줘야 할 수도 있음.\r\n\r\n16-2\r\n처방약품 성분무게당 수액량 (mL/mg)\r\n$$=\\frac{수액량 (ml)}{처방약품량 (mg)} $$\r\n \r\n시간당 처방약품량 (mg/hr) \r\n= 분당 처방약품량 (mg/min) x 60 (min)\r\n\r\n시간당 주입 수액량 (mL) \r\n= 처방약품 성분무게당 수액량 x 시간당 처방약품량','16-1\r\n추출해야 할 수액 부피 (mL) \r\n= 처방 약품 부피 (mL)\r\n$$= \\frac{{0} (mg)}{{1}mg/{2}mL}  $$ \r\n= {3} mL\r\n\r\n16-2\r\n처방약품 성분무게당 수액량 (mL/mg)\r\n$$= \\frac{{4} (ml)}{{1} (mg)}={5}(mL/mg) $$\r\n \r\n시간당 처방약품량 (mg/hr) \r\n= {6} (mcg/min) x {7} \r\n= {8} (mcg/hr)\r\n= {9} (mg/hr)\r\n\r\n시간당 수액량 \r\n= {5} (mL) * {9} (mg/hr) \r\n= {10} mL = {10} (cc)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToyOntpOjA7czoyOiJjYyI7aToxO3M6MjoiY2MiO30='),(17,-17,'',17,0,0,'','사용','','울현성 심부전증','외래를 방문한 {sh1}{1}세{/sh} {2}이 심장박동이 불규칙하며 호흡곤란과 가래 섞인 기침을 호소했다. 간호사가 진찰 전 건강사정 시 {3}이 청진되었고, {4}주만에 {sh1}{5}kg{/sh}의 체중 증가가 관찰되었다. 현재 환자 몸무게는 {sh2}{1W}kg{/sh}이다. 의사는 환자가 울현성 심부전증이라고 진단하고 입원과 함께 {6} {sh2}{9} mcg/kg/min{/sh}을 처방했다. \r\n담당간호사가 환자에게 {6} {sh2}750mg{/sh}을 {7} {8A}에 희석하여 주입하려고 할 때 몇 {sh3}ml/hr{/sh}로 주입해야 하는가? 병원에 공급되는 {6}은 앰플당 {sh2}{10} mg/5mL{/sh} 제품이다.','울현성-심부전증','','',0,0,4,17,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 07:37:24',0,'2021-02-21 07:37:24','211.104.15.10','','',2,17,10,1,'YToxMDp7aTowO2E6ODp7czozOiJudW0iO3M6MToiMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIzIjtzOjQ6Im5hbWUiO3M6MTc6IuuCmOydtDogMzV+NjDshLggIjtzOjM6Im1pbiI7czoyOiIzNSI7czozOiJtYXgiO3M6MjoiNjAiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MToiMiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czoxOiJDIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMjI6Iu2PkOydjChMdW5nIFNvdW5kKeyXkOyEnCDsiJjtj6zsnYzsnbQg7LKt7KeE65CY7JeI6rOgfOqyveygleunpSDtjL3ssL3snbQg6rSA7LCw65CY7JeI6rOgfOyghOyLoCDrtoDsooXsnbQg6rSA7LCw65CY7JeI6rOgIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjIzOiLrgrTsm5Ag6riw6rCEOiAxfjQg7KO8ICI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiNCI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjQ7YTo4OntzOjM6Im51bSI7czoxOiI1IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czo3OiIyfDN8NHw1IjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjEwOiJEb2J1dGFtaW5lIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjExOiI1JSBEZXh0cm9zZSI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjc7YTo4OntzOjM6Im51bSI7czoxOiI4IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czo5OiI1MDA7NTAwbUwiO3M6MzoibWluIjtzOjE6IjEiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjg7YTo4OntzOjM6Im51bSI7czoxOiI5IjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMDoiNXwxMHwxNXwyMCI7czozOiJtaW4iO3M6MDoiIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjk7YTo4OntzOjM6Im51bSI7czoyOiIxMCI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTY6IjI1MHw1MDB8NzUwfDEwMDAiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9fQ==','YToxOntpOjA7czowOiIiO30=','시간당 처방약품주입용량 (mg/hr)\r\n= 처방약품용량 (mg/kg/min) x 체중(kg) x 60 (min)\r\n\r\n시간당 수액주입량 (mL/hr) = \r\n시간당 처방약품주입용량  (mg/hr) X \r\n$$ \\frac{총수액량 (mL)}{도부타민 기본 용량 (mg)} $$','시간당 처방약품주입용량 (mg/hr)\r\n = ({0} (mcg) x {1} (kg) x {2} (min)) / {3}\r\n = {4} (mg/hr)\r\n\r\n시간당 수액주입량 (mL/hr) \r\n$$={4} (mg/hr) X \\frac{{5} mL}{{6} mg} $$\r\n= {7} mL/hr','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czo1OiJtTC9ociI7fQ=='),(18,-18,'',18,0,0,'','사용','','울현성 심부전증','{sh1}{1}세{/sh} {2}이 불규칙한 심장박동과, 호흡곤란, 기침 가래를 호소하고 있다. 간호사가 건강사정시 {3}하였고, {sh1}{4} 주{/sh} 만에 체중이 {sh1}{5} kg{/sh} 증가하였다. 담당 의사는 환자가 {sh1}울현성 심부전증{/sh}이라고  진단하고 입원과 함께 {11} {7} mg/day를 처방하였다. 병원에 비치된 악품은 {11}는 {6A} 제품이다. 담당간호사는 의사 처방에 따라 {11} {7}mg를 H/S 1L에 mix 해서 {sh2}{9A} {/sh}부터 주입 중이다.  {sh2}{9B}{/sh} 라운딩하는 시점에서 환자에게는 총 몇 mg의 {11}가 주입되었는가?','울현성-심부전증-1','','',0,0,5,18,0,'admin','','최고관리자','admin@domain.com','','2021-02-21 07:55:33',0,'2021-02-21 07:55:33','211.104.15.10','','',2,18,11,1,'YToxMTp7aTowO2E6ODp7czozOiJudW0iO3M6MToiMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIzIjtzOjQ6Im5hbWUiO3M6MTc6IuuCmOydtDogNDF+NjXshLggIjtzOjM6Im1pbiI7czoyOiI0MSI7czozOiJtYXgiO3M6MjoiNjUiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MToiMiI7fWk6MTthOjg6e3M6MzoibnVtIjtzOjE6IjIiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEzOiLrgqjshLF87Jes7ISxIjtzOjM6Im1pbiI7czoxOiJDIjtzOjM6Im1heCI7czowOiIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxMjI6Iu2PkOydjChMdW5nIFNvdW5kKeyXkOyEnCDsiJjtj6zsnYzsnbQg7LKt7KeE65CY7JeI6rOgfOqyveygleunpSDtjL3ssL3snbQg6rSA7LCw65CY7JeI6rOgfOyghOyLoCDrtoDsooXsnbQg6rSA7LCw65CY7JeI6rOgIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MzthOjg6e3M6MzoibnVtIjtzOjE6IjQiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjM5OiLrgrTsm5DquYzsp4DsnZgg6riw6rCEICjso7wpIDogMX40IOyjvCAiO3M6MzoibWluIjtzOjE6IjEiO3M6MzoibWF4IjtzOjE6IjQiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6MzM6IuyytOykkSDspp3qsIDrtoQgKGtnKSA6IDJ+NSAoa2cpICI7czozOiJtaW4iO3M6MToiMiI7czozOiJtYXgiO3M6MToiNSI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjU7YTo4OntzOjM6Im51bSI7czoxOiI2IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czo3NToiMjAsMnw0MCw0fDgwLDh8MTAwLDEwOzIwIG1nIC8gMiBtTHw0MCBtZyAvIDQgbUx8ODAgbWcgLyA4IG1MfDEwMCBtZyAvIDEwIG1MIjtzOjM6Im1pbiI7czoxOiIyIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTE6IjI2fDQwfDYwfDgwIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NzthOjg6e3M6MzoibnVtIjtzOjE6IjgiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjg6IjUwMHwxMDAwIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6ODthOjg6e3M6MzoibnVtIjtzOjE6IjkiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjIwOiLsi5zqsIE6IDcgQU0gfiAyNFBNICI7czozOiJtaW4iO3M6MToiNyI7czozOiJtYXgiO3M6MjoiMjQiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo5O2E6ODp7czozOiJudW0iO3M6MjoiMTAiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjM2OiLslb3rrLzso7zsnoXsi5zsnpEg7Iuc6rCBICsgMn4yMyBociAiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjI6IjIzIjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTA7YTo4OntzOjM6Im51bSI7czoyOiIxMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6MTA6IkZ1cm9zZW1pZGUiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9fQ==','YToxOntpOjA7czowOiIiO30=','시간당 약물 주입량 (mg)\r\n$$=\\frac{처방약품 용량 (mg)}{24} $$\r\n약물투입 경과시간 (hrs)\r\n= 현재시각 K – 투약시작시각\r\n\r\n현재까지 약물 투입량 (mg)\r\n= 시간당 약물 주입량 (mg) x 경과시간 (hrs)','시간당 약물 주입량 (mg)\r\n$$=\\frac{{0} (mg)}{{1} (hrs)}={2}(mg) $$\r\n\r\n약물투입 경과시간 (hrs)\r\n= {3} – {4} \r\n= {5} – {6} = {7}\r\n\r\n현재까지 약물 투입량 (mg)\r\n= {2} (mg) x {7} (hrs) \r\n= {8} ≒ {9} (mg)','※ 최종결과는 소수점 첫째 자리까지 반올림으로 제출하세요','YToxOntpOjA7czoyOiJtZyI7fQ=='),(19,-19,'',19,0,0,'','미사용','','유도분만','Parity: {1}\r\n{sh1}{2}세{/sh} 임신부 (임신 {sh1}{3}주차{/sh})를 진찰한 담당의사는 {4} 산모와 태아의 건강을 위해 {5}을 결정하고, 입원시켰다.\r\n의사는 분만실에서 자궁수축을 위해 {6} {sh2}{8} IU{/sh}를 {7} {9A}에 섞어서, Infusion Pump를 통해 {sh2}{10} mU/min{/sh}부터 시작, 산모와 태아의 Vital을 신중히 모니터링 하면서 {sh2}{11A}{/sh}마다 {sh2}{12} mU/min{/sh}씩 늘리되, {sh2}20 mU/min{/sh}를 초과하면, 투입을 중단하고 보고하도록 지시하였다.\r\n\r\n산모와 태아의 Vital이 별 이상이나 변화가 없는 경우','유도분만','','',0,0,6,19,0,'admin','','최고관리자','admin@domain.com','','2021-02-22 02:47:47',0,'2021-02-22 02:47:47','211.104.15.10','','',0,19,13,2,'YToxMzp7aTowO2E6ODp7czozOiJudW0iO3M6MToiMSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MzE6IjAtMS0wLTF8MS0wLTEtMXwyLTAtMC0xfDItMC0xLTAiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToxO2E6ODp7czozOiJudW0iO3M6MToiMiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6MTY6IuuCmOydtDogMjh+MzXshLgiO3M6MzoibWluIjtzOjI6IjI4IjtzOjM6Im1heCI7czoyOiIzNSI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjI7YTo4OntzOjM6Im51bSI7czoxOiIzIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6NDoibmFtZSI7czoyMDoi7J6E7IugOiAzOH40MeyjvOywqCAiO3M6MzoibWluIjtzOjI6IjM4IjtzOjM6Im1heCI7czoyOiI0MSI7czo0OiJ0ZXJtIjtzOjE6IjEiO3M6NDoidW5pdCI7czowOiIiO31pOjM7YTo4OntzOjM6Im51bSI7czoxOiI0IjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czoxNTU6IuyehOyLoOyEsSDqs6DtmIjslZXsnYQg7LK07YGs7ZWY6rOgfO2DnOuwmOqzvCDslpHsiJgg6rCQ7Je87J2EIO2ZleyduO2VmOqzoHzslpHsiJjqsIAg7J287LCNIO2EsOyngOyekHzsobDsoIjrkJjsp4Ag7JWK64qUIOyehOyLoOyEsSDri7nrh6jrpbwg7ZmV7J247ZWY6rOgIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NDthOjg6e3M6MzoibnVtIjtzOjE6IjUiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiMCI7czo0OiJuYW1lIjtzOjEyOiLsnKDrj4TrtoTrp4wiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo1O2E6ODp7czozOiJudW0iO3M6MToiNiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIwIjtzOjQ6Im5hbWUiO3M6ODoiT3h5dG9jaW4iO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo2O2E6ODp7czozOiJudW0iO3M6MToiNyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6OToiNSUgRFd8SC9TIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NzthOjg6e3M6MzoibnVtIjtzOjE6IjgiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiMSI7czo0OiJuYW1lIjtzOjQ6IjV8MTAiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo4O2E6ODp7czozOiJudW0iO3M6MToiOSI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6MTg6IjUwMHwxMDAwOzUwMCBtTHwxTCI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6OTthOjg6e3M6MzoibnVtIjtzOjI6IjEwIjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjEiO3M6NDoibmFtZSI7czozOiIxfDIiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToxMDthOjg6e3M6MzoibnVtIjtzOjI6IjExIjtzOjQ6Im1vZGUiO3M6MToiMSI7czo0OiJ0eXBlIjtzOjE6IjQiO3M6NDoibmFtZSI7czoxOToiNDB8NjA7NDDrtoR8MeyLnOqwhCI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTE7YTo4OntzOjM6Im51bSI7czoyOiIxMiI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MzoiMXwyIjtzOjM6Im1pbiI7czowOiIiO3M6MzoibWF4IjtzOjA6IiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6MTI7YTo4OntzOjM6Im51bSI7czoyOiIxMyI7czo0OiJtb2RlIjtzOjE6IjEiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6MTA6IjJ+NiDsi5zqsIQiO3M6MzoibWluIjtzOjE6IjIiO3M6MzoibWF4IjtzOjE6IjYiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9fQ==','YToyOntpOjA7czo3Mjoie3NoMn0z7Iuc6rCEey9zaH0ge3NoM33tm4Qg67aE64u5IOyImOyVoSDso7zsnoXrn4l7L3NofeydgCDslrzrp4jsnbjqsIA/IjtpOjE7czoxMzI6IntzaDJ9MjAgbVUvbWluey9zaH3qsIAg64SY7Ja0IO2IrOyeheydhCDspJHri6jtlZjqs6Age3NoM33rs7Tqs6DtlbTslbwg7ZWgIOyLnOygkHsvc2h97J2AIHtzaDN97Ja47KCcICjrqofsi5zqsIQg66qH67aEKXsvc2h97J246rCAPyI7fQ==','19-1\r\nmU당 수액량\r\n$$=\\frac{총 수액 용량 (mL)}{약품 투입 성분 총량 (IU) x 1,000} $$\r\n\r\n경과시점에서의 분당처방약품 단위 (mU/min)\r\n$$=INT\\left( \\frac{(경과시간×60)-조정간격 (min)}{조정간격 (min)}\\right) $$ \r\nX 약품조정용량 (mU) \r\n+ 최초 투입 용량(mU)\r\n\r\n※ 약품투입 시간에 따라 계단식으로 증가함으로 시간 간격의 횟수는 반내림한 정수로 개산해야 함.\r\n경과 시점에서의 분당 수액용량 (mL/min) \r\n= 분당 처방약품 단위 (mU/min) x mU당 수액 량 (mL)\r\n\r\n19-2\r\n경과시점에서의 분당처방약품 단위 (mU/min)\r\n$$ = INT\\left( \\frac{(경과시간×60)-조정간격 (min)}{조정간격 (min)}\\right)  $$\r\nX 약품조정용량 (mU) + 최초 투입 용량(mU)\r\n\r\n약품투입 중단 용량 < 경과시점의 분당 처방약품 용량','19-1\r\nmU당 수액량\r\n$$= \\frac{총 수액 용량 (mL)}{약품 투입 성분 총량 (IU) x1,000} $$\r\n$$= \\frac{{0} (mL)}{{1} (IU)x1,000} $$\r\n= {2} mL/mU\r\n\r\n3경과시점에서의 분당처방약품 단위 (mU/min)\r\n$$ = INT\\left( \\frac{({3}×60)-{4} (min)}{{4} (min)}\\right) $$\r\nX {5} (mU) X + {6} (mU)\r\n= {7} x {8} + {9} = {10} \r\n\r\n3시간 경과시점의 수액량\r\n= {2} (mL/mU) x {10} (mU/min)\r\n= {11} (mL/min)\r\n\r\n19-2\r\n약품투입 중단 용량 = {12} (mU/min)\r\n$$ {12} <  INT\\left( \\frac{χ-{4} (min)}{{4} (min)}\\right) \r\nx {5} (mU) X + {6} (mU) $$\r\nχ<({12} ×{13}) - {14}\r\nχ<{15} χ<{17} (min)\r\n{18} 후 옥시토신 투입 멈춤','','YToyOntpOjA7czo1OiJtTC9tVSI7aToxO3M6Njoi7Iuc6rCEIjt9'),(20,-20,'',20,0,0,'','사용','','소아 당뇨','{1}를 앓고 있는 {sh1}{2}세{/sh} {3}가 학교 {4}으로 쓰러져 병원에 실려왔다. 환자 부모로부터 전달받은 병력을 바탕으로 담당의사는 환자가 인슐린 과민반응이 위험이 있어 포도당 수액 주입에 있어 정확한 농도 조절이 필요하다고 판단하고 {sh2}{6}% DW{/sh} {5}를 {5A}로 공급하도록 처방하였다.\r\n병원에 비치된 DW 수액은 {sh2}{7A}{/sh} {sh2}{8A}{/sh}와 {sh2}{9A}{/sh} {sh2}{8A}{/sh}  제품이다.\r\n의사 처방에 따라 {sh2}{6}% DW{/sh}를 만들기 위해 {sh2}{7A}{/sh} {sh2}{8A}{/sh}에 {sh2}{9A}{/sh}를 {sh3}몇 mL{/sh} 섞어야 하는가?','소아-당뇨','','',0,0,13,20,0,'admin','','최고관리자','admin@domain.com','','2021-02-22 03:50:04',0,'2021-02-22 03:50:04','211.104.15.10','','',0,20,9,1,'YTo5OntpOjA7YTo4OntzOjM6Im51bSI7czoxOiIxIjtzOjQ6Im1vZGUiO3M6MToiMCI7czo0OiJ0eXBlIjtzOjE6IjAiO3M6NDoibmFtZSI7czozODoiMe2YlSDsnbjsipDrprAg7J2Y7KG07ISxIOyGjOyVhCDri7nrh6giO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToxO2E6ODp7czozOiJudW0iO3M6MToiMiI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIyIjtzOjQ6Im5hbWUiO3M6MTU6IuuCmOydtDogOH4xM+yEuCI7czozOiJtaW4iO3M6MToiOCI7czozOiJtYXgiO3M6MjoiMTMiO3M6NDoidGVybSI7czoxOiIxIjtzOjQ6InVuaXQiO3M6MDoiIjt9aToyO2E6ODp7czozOiJudW0iO3M6MToiMyI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTM6IuuCqOyVhHzsl6zslYQiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTozO2E6ODp7czozOiJudW0iO3M6MToiNCI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTUwOiLssrTsnKHsi5zqsIQg7Jq064+ZIOykkSDsoIDtmIjri7kg7KadfO2Vmeq1kCDtlonsgqzroZwg7KCQ7Ius7Iuc6rCE7J20IOuKpuyWtOyguCDsoIDtmIjri7kg7Ie87YGsfOyduOyKkOumsCDqs7zri6TtiKzsnoXsnLzroZwg7J247ZWcIOyggO2YiOuLuSDsh7ztgawiO3M6MzoibWluIjtzOjA6IiI7czozOiJtYXgiO3M6MDoiIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo0O2E6ODp7czozOiJudW0iO3M6MToiNSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6MzM6IjI1MCw0fDUwMCw2OzI1MCBtTHw1MDAgbUw7cTRofHE2aCI7czozOiJtaW4iO3M6MToiMiI7czozOiJtYXgiO3M6MToiMyI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NTthOjg6e3M6MzoibnVtIjtzOjE6IjYiO3M6NDoibW9kZSI7czoxOiIxIjtzOjQ6InR5cGUiO3M6MToiMiI7czo0OiJuYW1lIjtzOjI5OiLsspjrsKnsiJjslaEg64aN64+EOiAxNiV+MTklICI7czozOiJtaW4iO3M6MjoiMTYiO3M6MzoibWF4IjtzOjI6IjE5IjtzOjQ6InRlcm0iO3M6MToiMSI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NjthOjg6e3M6MzoibnVtIjtzOjE6IjciO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjE3OiI1fDEwOzUlIERXfDEwJSBEVyI7czozOiJtaW4iO3M6MToiMSI7czozOiJtYXgiO3M6MToiMiI7czo0OiJ0ZXJtIjtzOjA6IiI7czo0OiJ1bml0IjtzOjA6IiI7fWk6NzthOjg6e3M6MzoibnVtIjtzOjE6IjgiO3M6NDoibW9kZSI7czoxOiIwIjtzOjQ6InR5cGUiO3M6MToiNCI7czo0OiJuYW1lIjtzOjE5OiI1MDB8MTAwMDs1MDAgbUx8MSBMIjtzOjM6Im1pbiI7czoxOiIxIjtzOjM6Im1heCI7czoxOiIyIjtzOjQ6InRlcm0iO3M6MDoiIjtzOjQ6InVuaXQiO3M6MDoiIjt9aTo4O2E6ODp7czozOiJudW0iO3M6MToiOSI7czo0OiJtb2RlIjtzOjE6IjAiO3M6NDoidHlwZSI7czoxOiI0IjtzOjQ6Im5hbWUiO3M6MTk6IjI1fDUwOzI1JSBEV3w1MCUgRFciO3M6MzoibWluIjtzOjE6IjEiO3M6MzoibWF4IjtzOjE6IjIiO3M6NDoidGVybSI7czowOiIiO3M6NDoidW5pdCI7czowOiIiO319','YToxOntpOjA7czowOiIiO30=','농도(%) \r\n$$=\\frac{용질의 양}{용매의 양}$$\r\n$$=\\frac{용해된 성분 총량}{수액 총량} $$','처방농도 {0}%\r\n$$=\\frac{({1}\\text{%} \\times {2} (mL))+({3}\\text{%} \\times X)}{{2}+ X} $$\r\n{4}x({2}+X)={5}+{6}X\r\n{4}X+{7}= {5}+{6}X\r\n χ= {8} (mL)','','YToxOntpOjA7czoyOiJtTCI7fQ==');
/*!40000 ALTER TABLE `g5_write_level1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dhc2021'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18  5:06:56
