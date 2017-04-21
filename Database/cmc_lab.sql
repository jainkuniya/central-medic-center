-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cmc
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `lab`
--

DROP TABLE IF EXISTS `lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab` (
  `labId` int(11) NOT NULL AUTO_INCREMENT,
  `labName` varchar(45) NOT NULL,
  `testFor` varchar(45) NOT NULL,
  `labResult` varchar(45) DEFAULT NULL,
  `reportFile` varchar(45) DEFAULT NULL,
  `itemId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  PRIMARY KEY (`labId`),
  KEY `labfk1_idx` (`itemId`),
  KEY `labfk2_idx` (`doctorId`),
  CONSTRAINT `labfk1` FOREIGN KEY (`itemId`) REFERENCES `appointmentItems` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `labfk11` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab`
--

LOCK TABLES `lab` WRITE;
/*!40000 ALTER TABLE `lab` DISABLE KEYS */;
INSERT INTO `lab` VALUES (1,'Urine Test','Blood Sugar','High',NULL,12,12),(3,'Blood Test','Haemoglobin',NULL,NULL,41,12),(4,'Kidney Test','Stones','Low',NULL,46,12);
/*!40000 ALTER TABLE `lab` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-21  3:47:43
