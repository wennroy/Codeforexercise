-- MySQL dump 10.13
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	6.0.4-alpha-community-log

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
-- Table structure for table `binary1`
--

DROP TABLE IF EXISTS `binary1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `binary1` (
  `b` binary(4) DEFAULT NULL,
  `vb` varbinary(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `binary1`
--

LOCK TABLES `binary1` WRITE;
/*!40000 ALTER TABLE `binary1` DISABLE KEYS */;
INSERT INTO `binary1` VALUES ('d\0\0\0','d');
/*!40000 ALTER TABLE `binary1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bit1`
--

DROP TABLE IF EXISTS `bit1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bit1` (
  `b` bit(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bit1`
--

LOCK TABLES `bit1` WRITE;
/*!40000 ALTER TABLE `bit1` DISABLE KEYS */;
INSERT INTO `bit1` VALUES ('\0'),(''),('');
/*!40000 ALTER TABLE `bit1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `char1`
--

DROP TABLE IF EXISTS `char1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `char1` (
  `a` char(5) DEFAULT NULL,
  `b` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `char1`
--

LOCK TABLES `char1` WRITE;
/*!40000 ALTER TABLE `char1` DISABLE KEYS */;
INSERT INTO `char1` VALUES ('',''),('1','1'),('123','123'),('*','*'),('1*','1*'),('123 *','123 *');
/*!40000 ALTER TABLE `char1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date1`
--

DROP TABLE IF EXISTS `date1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `date1` (
  `a` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `date1`
--

LOCK TABLES `date1` WRITE;
/*!40000 ALTER TABLE `date1` DISABLE KEYS */;
INSERT INTO `date1` VALUES ('1949-10-01'),('0000-00-00'),('1956-02-03'),('1949-10-01'),('1950-02-03'),('1956-02-03'),('2023-12-23'),('1976-12-23'),('2015-09-22'),('2015-09-22');
/*!40000 ALTER TABLE `date1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datetime1`
--

DROP TABLE IF EXISTS `datetime1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `datetime1` (
  `a` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `datetime1`
--

LOCK TABLES `datetime1` WRITE;
/*!40000 ALTER TABLE `datetime1` DISABLE KEYS */;
INSERT INTO `datetime1` VALUES ('2023-12-30 23:59:59'),('1978-12-30 23:59:59');
/*!40000 ALTER TABLE `datetime1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum1`
--

DROP TABLE IF EXISTS `enum1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `enum1` (
  `a` enum('woman','man') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `enum1`
--

LOCK TABLES `enum1` WRITE;
/*!40000 ALTER TABLE `enum1` DISABLE KEYS */;
INSERT INTO `enum1` VALUES (NULL),('man'),(''),(NULL),(NULL);
/*!40000 ALTER TABLE `enum1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum2`
--

DROP TABLE IF EXISTS `enum2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `enum2` (
  `a` enum('woman','man') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `enum2`
--

LOCK TABLES `enum2` WRITE;
/*!40000 ALTER TABLE `enum2` DISABLE KEYS */;
INSERT INTO `enum2` VALUES ('woman');
/*!40000 ALTER TABLE `enum2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `float1`
--

DROP TABLE IF EXISTS `float1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `float1` (
  `a` float(6,2) DEFAULT NULL,
  `b` double(6,2) DEFAULT NULL,
  `c` decimal(6,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `float1`
--

LOCK TABLES `float1` WRITE;
/*!40000 ALTER TABLE `float1` DISABLE KEYS */;
INSERT INTO `float1` VALUES (3.14,3.15,'3.14'),(3.14,3.15,'3.14'),(3.14,3.15,'3.15');
/*!40000 ALTER TABLE `float1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `float2`
--

DROP TABLE IF EXISTS `float2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `float2` (
  `a` float DEFAULT NULL,
  `b` double DEFAULT NULL,
  `c` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `float2`
--

LOCK TABLES `float2` WRITE;
/*!40000 ALTER TABLE `float2` DISABLE KEYS */;
INSERT INTO `float2` VALUES (3.143,3.145,'3'),(3.143,3.145,'3');
/*!40000 ALTER TABLE `float2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intdata`
--

DROP TABLE IF EXISTS `intdata`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `intdata` (
  `a` tinyint(3) unsigned zerofill DEFAULT NULL,
  `b` smallint(5) unsigned zerofill DEFAULT NULL,
  `c` mediumint(8) unsigned zerofill DEFAULT NULL,
  `d` int(10) unsigned zerofill DEFAULT NULL,
  `e` bigint(20) unsigned zerofill DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `intdata`
--

LOCK TABLES `intdata` WRITE;
/*!40000 ALTER TABLE `intdata` DISABLE KEYS */;
INSERT INTO `intdata` VALUES (001,00001,00000001,0000000001,00000000000000000001),(001,00001,00000001,0000000001,00000000000000000001);
/*!40000 ALTER TABLE `intdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intdata1`
--

DROP TABLE IF EXISTS `intdata1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `intdata1` (
  `a` tinyint(4) DEFAULT NULL,
  `b` smallint(6) DEFAULT NULL,
  `c` mediumint(9) DEFAULT NULL,
  `d` int(11) DEFAULT NULL,
  `e` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `intdata1`
--

LOCK TABLES `intdata1` WRITE;
/*!40000 ALTER TABLE `intdata1` DISABLE KEYS */;
INSERT INTO `intdata1` VALUES (1,1,1,1,1),(1,1,1,1,1);
/*!40000 ALTER TABLE `intdata1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intdata2`
--

DROP TABLE IF EXISTS `intdata2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `intdata2` (
  `a` int(4) DEFAULT NULL,
  `b` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `intdata2`
--

LOCK TABLES `intdata2` WRITE;
/*!40000 ALTER TABLE `intdata2` DISABLE KEYS */;
INSERT INTO `intdata2` VALUES (111111,22222222),(111111,11111111);
/*!40000 ALTER TABLE `intdata2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set1`
--

DROP TABLE IF EXISTS `set1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `set1` (
  `a` set('A','B','C','D','E') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `set1`
--

LOCK TABLES `set1` WRITE;
/*!40000 ALTER TABLE `set1` DISABLE KEYS */;
INSERT INTO `set1` VALUES ('B'),('B,C,D');
/*!40000 ALTER TABLE `set1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `time` (
  `a` time DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES ('71:50:50'),('22:22:22'),('11:11:00'),('68:20:00'),('68:00:00'),('00:00:30'),('12:12:12'),('13:13:13'),('00:00:00'),('00:00:00'),('19:55:02'),('19:55:02');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timestamp1`
--

DROP TABLE IF EXISTS `timestamp1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `timestamp1` (
  `a` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `timestamp1`
--

LOCK TABLES `timestamp1` WRITE;
/*!40000 ALTER TABLE `timestamp1` DISABLE KEYS */;
INSERT INTO `timestamp1` VALUES ('2015-09-22 12:52:31');
/*!40000 ALTER TABLE `timestamp1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `year` (
  `a` year(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1997),(1998),(0000),(2024),(1986),(2000),(2000),(2024),(1986),(0000);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-23  6:19:31
