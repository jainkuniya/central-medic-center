-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: CMC
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.10.1

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
-- Table structure for table `appointmentItems`
--

DROP TABLE IF EXISTS `appointmentItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` double DEFAULT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `appointmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appointmentId` (`appointmentId`),
  KEY `type` (`type`),
  CONSTRAINT `appointmentItems_ibfk_3` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`id`),
  CONSTRAINT `appointmentItems_ibfk_4` FOREIGN KEY (`type`) REFERENCES `appointmentItemsType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentItems`
--

LOCK TABLES `appointmentItems` WRITE;
/*!40000 ALTER TABLE `appointmentItems` DISABLE KEYS */;
INSERT INTO `appointmentItems` VALUES (3,1492427586653,1,'Created',2),(4,1492427777672,1,'Created',2),(5,1492428063017,1,'Created',2),(6,1492520802790,1,'Created',2),(7,1492620672230,1,'Created',1),(8,1492622614686,1,'hi',2),(9,1492622692799,1,'hi',2),(10,1492622725353,1,'hi',2),(11,1492622736819,1,'hi',2),(12,1492622959679,1,'hi 4',2),(13,1492622970390,1,'hi 6',6),(14,1492622978433,1,'hi 9',6),(15,1492623015649,1,'hi 10',6),(16,1492623021668,1,'hi 10',6),(17,1492623027269,1,'hi 10',6),(18,1492623049226,1,'hi',6),(19,1492623149342,1,'1',6),(21,1492623510259,2,'hi me',2),(22,1492623944292,2,'hi',7),(23,1492624201629,2,'hi 1',4),(24,1492624206060,2,'hi 2',4),(25,1492624474161,2,'hi 1',1),(26,1492624524731,2,'hi ',9),(27,1492624582025,2,'hi i am new',8);
/*!40000 ALTER TABLE `appointmentItems` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-20  0:23:58
