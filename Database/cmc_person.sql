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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(10) DEFAULT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `dob` double DEFAULT NULL,
  `token` varchar(10) CHARACTER SET big5 DEFAULT '0',
  `personType` int(1) NOT NULL DEFAULT '1',
  `gender` varchar(2) DEFAULT 'NA',
  `address` varchar(45) DEFAULT NULL,
  `contactNumber` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`personId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `type` (`personType`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`personType`) REFERENCES `persontype` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Vishal','Sanghai','vishal','qwerty',925842600000,'1',1,'M','Dover Terrace, Kolkata','9521113802'),(2,'Shubham ','Mangal','shubham','qwerty',925842600000,'1',1,'M','Mansarovar, Jaipur','9571620779'),(3,'Satyam','Shubham','satyam','qwerty',925842600000,'1',1,'M','Bihar Sharif, Nalanda','8981000909'),(4,'Harsh','Modi','harsh','qwerty',925842600000,'1',1,'M','Jaipuria Marg, Indore','8981000899'),(5,'Hemant','Verma','hemant','qwerty',925842600000,'1',1,'M','Pagal Gali, Ganganagar','8981001717'),(6,'Anmol','Ratnam','anmol','qwerty',925842600000,'1',1,'M','Panchawati Chowk, Hazaribagh','9521113806'),(7,'Utsav','Singh','utsav','qwerty',925842600000,'1',1,'M','Ram Gali, Patna','9521113816'),(8,'Akshat','Mathur','akshat','qwerty',925842600000,'1',1,'M','Jai Baba, Ajmer','9163990299'),(9,'Rishabh','Tiwari','rishabh','qwerty',925842600000,'1',1,'M','Ankur Villa, Gurgaon','9830085588'),(10,'Vishwesh','Jainkuniya','vishwesh','qwerty',889236840000,'1',1,'M','Park Street, Pratapgarh','8100055671'),(11,'Dr. Rachit','Sharma','rachit','qwerty',925842600000,'1',2,'M','Billu Marg, Jaipur','8114487323'),(12,'Dr. Gourav','Khatri','gourav','qwerty',889236840000,'1',2,'M','Howrah, Kolkata','8240558662'),(13,'Dr. Ankur','Arora','ankur','qwerty',925842600000,'1',2,'M','Hauz Kauz, Delhi','9521356402'),(14,'Dr. Vivek','Tewari','vivek','qwerty',889236840000,'1',2,'M','Jheel, Hazaribagh','8987213127'),(15,'Dr. Manas','Jain','manas','qwerty',925842600000,'1',2,'M','Boli Marg, Udaipur','8898645151'),(16,'Ruchika','Sharma','ruchika','qwerty',925842600000,'1',3,'F','Jaipur','8574878596'),(17,'Ritu','Jain','ritu','qwerty',925842600000,'1',4,'F','Udaipur','8574875485'),(18,'Karishma','Chawla','karishma','qwerty',925842600000,'1',5,'F',' CP, New Delhi','9865478521');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
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
