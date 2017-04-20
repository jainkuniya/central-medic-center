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
-- Table structure for table `appointmentItems`
--

DROP TABLE IF EXISTS `appointmentItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentItems` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `date` double DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `appointmentId` int(11) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `appointmentId` (`appointmentId`),
  KEY `type` (`typeId`),
  CONSTRAINT `appointmentItems_ibfk_3` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`),
  CONSTRAINT `appointmentItems_ibfk_4` FOREIGN KEY (`typeId`) REFERENCES `appointmentItemsType` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentItems`
--

LOCK TABLES `appointmentItems` WRITE;
/*!40000 ALTER TABLE `appointmentItems` DISABLE KEYS */;
INSERT INTO `appointmentItems` VALUES (1,1492426867320,6,'Appointment Created',1),(2,1492427049030,6,'Appointment Created',2),(3,1492427176793,6,'Appointment Created',3),(4,1492427176793,6,'Appointment Created',4),(5,1492427176793,6,'Appointment Created',5),(6,1492427176793,6,'Appointment Created',6),(7,1492427176793,6,'Appointment Created',7),(8,1492427176793,6,'Appointment Created',8),(9,1492427176793,6,'Appointment Created',9),(10,1492427176793,6,'Appointment Created',10),(11,1492427176793,3,'Medicine',1),(12,1492427176793,4,'Lab Report',1);
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

-- Dump completed on 2017-04-20 22:38:20
