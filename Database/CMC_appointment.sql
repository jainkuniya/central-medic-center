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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `isClosed` int(11) DEFAULT '0',
  `dateCreated` double DEFAULT NULL,
  `symptons` varchar(45) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  `preferredDate` double DEFAULT NULL,
  `allocatedDate` double DEFAULT '0',
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientId` (`patientId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,12,1,1492426867320,'Cough',' Tubercolosis',1492426867320,1492426867320,NULL),(2,1,12,0,1492427049030,'Heart Pain',' Heart Attack',1492427049030,1492427049030,NULL),(3,1,12,1,1492427176793,'Headache',' Brain Tumor',1492427176793,1492427176793,NULL),(4,1,NULL,0,1492427265008,'Headache','Migraine',1492427265008,1492427265008,NULL),(5,1,NULL,1,1492427355113,'Pain in Bones',' Bone Fracture',1492427355113,1492427355113,NULL),(6,1,12,0,1492427586601,'Pain in Left Ear','Ear Drum Rupture',1492427586601,1492427586601,NULL),(7,1,NULL,0,1492427777615,'Pain in eye','Eye Infection',1492427777615,1492427777615,NULL),(8,1,NULL,0,1492519085680,'Sneezing','Cold',1492519085680,1492519085680,NULL),(9,1,NULL,0,1492620672132,'hi im sick','dont know',1492540200000,0,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19 23:09:16
