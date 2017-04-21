CREATE DATABASE  IF NOT EXISTS `cmc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cmc`;
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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointmentId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `isClosed` int(11) DEFAULT '0',
  `dateCreated` double DEFAULT '0',
  `symptons` varchar(45) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  `preferredDate` double DEFAULT '0',
  `allocatedDate` double DEFAULT '0',
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appointmentId`),
  KEY `appointment_ibfk_1_idx` (`patientId`),
  KEY `appointment_ibfk_2_idx` (`doctorId`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (13,1,11,1,1492755207471,'Cough, Sneezing, Fever','Diphtheria',1492713000000,1492799400000,'Cough'),(14,2,15,0,1492755288148,'Headache, Fever, Sweating','Malaria',1492972200000,1492972200000,'Headache'),(15,3,14,0,1492755373422,'weakness, anemia','Scurvy',1492713000000,1492713000000,'Dizziness'),(16,4,NULL,0,1492755623567,'red eyes, fever, cough','Measles',1493145000000,0,'Red Eyes'),(17,2,NULL,0,1492755684391,'Sweating, ache in stomach','Worms',1492972200000,0,'Stomach Ache'),(18,5,NULL,0,1492755818061,'Nose Bleeding, Pain','Fracture in Nose',1492972200000,0,'Nose Bleeding'),(19,6,12,0,1492755887085,'bad bowels, headache','Constipation',1492972200000,1492972200000,'Bad Bowel Movement'),(20,7,11,0,1492755929549,'Frequent Headache','Migrane',1492799400000,1492799400000,'Headache');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentitems`
--

DROP TABLE IF EXISTS `appointmentitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentitems` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `date` double DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `appointmentId` int(11) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `appointmentId` (`appointmentId`),
  KEY `type` (`typeId`),
  CONSTRAINT `appointmentItems_ibfk_3` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`),
  CONSTRAINT `appointmentItems_ibfk_4` FOREIGN KEY (`typeId`) REFERENCES `appointmentitemstype` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentitems`
--

LOCK TABLES `appointmentitems` WRITE;
/*!40000 ALTER TABLE `appointmentitems` DISABLE KEYS */;
INSERT INTO `appointmentitems` VALUES (60,1492755991121,6,'Date Allocated :- 2017-04-22',20),(61,1492755997599,6,'Date Allocated :- 2017-04-24',19),(62,1492756002778,6,'Date Allocated :- 2017-04-21',15),(63,1492756012843,6,'Date Allocated :- 2017-04-22',13),(64,1492756020277,6,'Date Allocated :- 2017-04-24',14),(65,1492757531371,1,'You are experiencing high fever or low fever?',13),(66,1492757568421,2,'low fever!!',13),(67,1492757602756,3,'Medicine Prescribed',13),(68,1492757626515,2,'Do I have to get through any test?',13),(69,1492757657312,5,'Blood Test: Lab Report Requested',13),(70,1492757703928,4,'Lab Report arrived',13),(71,1492757720080,6,'Closed By Doctor: - Dr. Rachit',13);
/*!40000 ALTER TABLE `appointmentitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentitemstype`
--

DROP TABLE IF EXISTS `appointmentitemstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentitemstype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentitemstype`
--

LOCK TABLES `appointmentitemstype` WRITE;
/*!40000 ALTER TABLE `appointmentitemstype` DISABLE KEYS */;
INSERT INTO `appointmentitemstype` VALUES (1,'Message from Doctor'),(2,'Message from Patient'),(3,'Prescription'),(4,'Lab Report'),(5,'Request For Lab Report'),(6,'System');
/*!40000 ALTER TABLE `appointmentitemstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doctorId`),
  UNIQUE KEY `id_UNIQUE` (`doctorId`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (11,'MBBS MD BHHS','Neurologist'),(12,'MBBS BDS','Physician'),(13,'MBBS BDS','Dermatologist'),(14,'MBBS BHBS MD','Cardiologist'),(15,'MBBS MD BDS','Gynecologist');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `labfk1` FOREIGN KEY (`itemId`) REFERENCES `appointmentitems` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `labfk11` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab`
--

LOCK TABLES `lab` WRITE;
/*!40000 ALTER TABLE `lab` DISABLE KEYS */;
INSERT INTO `lab` VALUES (5,'Blood Test','Haemoglobin','low',NULL,70,11);
/*!40000 ALTER TABLE `lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `bloodGroup` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`patientId`),
  UNIQUE KEY `id_UNIQUE` (`patientId`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,178,60,'A+'),(2,165,80,'A+'),(3,171,49,'A-'),(4,180,51,'O+'),(5,175,59,'O-'),(6,176,75,'B+'),(7,170,80,'B+'),(8,165,100,'B-'),(9,166,120,'B-'),(10,159,69,'AB+'),(19,174,51,'A-');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Vishal','Sanghai','vishal','qwerty',925842600000,'1',1,'M','Dover Terrace, Kolkata','9521113802'),(2,'Shubham ','Mangal','shubham','qwerty',925842600000,'1',1,'M','Mansarovar, Jaipur','9571620779'),(3,'Satyam','Shubham','satyam','qwerty',925842600000,'1',1,'M','Bihar Sharif, Nalanda','8981000909'),(4,'Harsh','Modi','harsh','qwerty',925842600000,'1',1,'M','Jaipuria Marg, Indore','8981000899'),(5,'Hemant','Verma','hemant','qwerty',925842600000,'1',1,'M','Pagal Gali, Ganganagar','8981001717'),(6,'Anmol','Ratnam','anmol','qwerty',925842600000,'1',1,'M','Panchawati Chowk, Hazaribagh','9521113806'),(7,'Utsav','Singh','utsav','qwerty',925842600000,'1',1,'M','Ram Gali, Patna','9521113816'),(8,'Akshat','Mathur','akshat','qwerty',925842600000,'1',1,'M','Jai Baba, Ajmer','9163990299'),(9,'Rishabh','Tiwari','rishabh','qwerty',925842600000,'1',1,'M','Ankur Villa, Gurgaon','9830085588'),(10,'Vishwesh','Jainkuniya','vishwesh','qwerty',889236840000,'1',1,'M','Park Street, Pratapgarh','8100055671'),(11,'Dr. Rachit','Sharma','rachit','qwerty',925842600000,'1',2,'M','Billu Marg, Jaipur','8114487323'),(12,'Dr. Gourav','Khatri','gourav','qwerty',889236840000,'1',2,'M','Howrah, Kolkata','8240558662'),(13,'Dr. Ankur','Arora','ankur','qwerty',925842600000,'1',2,'M','Hauz Kauz, Delhi','9521356402'),(14,'Dr. Vivek','Tewari','vivek','qwerty',889236840000,'1',2,'M','Jheel, Hazaribagh','8987213127'),(15,'Dr. Manas','Jain','manas','qwerty',925842600000,'1',2,'M','Boli Marg, Udaipur','8898645151'),(16,'Ruchika','Sharma','ruchika','qwerty',925842600000,'1',3,'F','Jaipur','8574878596'),(17,'Ritu','Jain','ritu','qwerty',925842600000,'1',4,'F','Udaipur','8574875485'),(18,'Karishma','Chawla','karishma','qwerty',925842600000,'1',5,'F',' CP, New Delhi','9865478521'),(19,'Tricha','Gupta','tricha','qwerty',777753000000,'1',1,'F','Jammunagar, Jammu','9685748754');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persontype`
--

DROP TABLE IF EXISTS `persontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persontype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`typeId`),
  UNIQUE KEY `id_UNIQUE` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persontype`
--

LOCK TABLES `persontype` WRITE;
/*!40000 ALTER TABLE `persontype` DISABLE KEYS */;
INSERT INTO `persontype` VALUES (1,'Patient','Patient'),(2,'Doctor','Doctor'),(3,'Admin','Admin'),(4,'Lab Person','LabPerson'),(5,'Receptionist','Reception');
/*!40000 ALTER TABLE `persontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `medicineId` int(11) NOT NULL AUTO_INCREMENT,
  `medicineName` varchar(45) DEFAULT NULL,
  `quantity` double DEFAULT '0',
  `times` int(11) DEFAULT '0',
  `itemId` int(11) NOT NULL,
  PRIMARY KEY (`medicineId`),
  KEY `medine_key1_idx` (`itemId`),
  CONSTRAINT `medine_key1` FOREIGN KEY (`itemId`) REFERENCES `appointmentitems` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (7,'Actified Plus',1,2,67);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-21 12:28:55
