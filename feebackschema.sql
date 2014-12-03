-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: feedback
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `coursedetails`
--

DROP TABLE IF EXISTS `coursedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursedetails` (
  `cid` varchar(25) NOT NULL DEFAULT '',
  `coursename` char(50) DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `type` (`type`),
  CONSTRAINT `coursedetails_ibfk_1` FOREIGN KEY (`type`) REFERENCES `coursetype` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursedetails`
--

LOCK TABLES `coursedetails` WRITE;
/*!40000 ALTER TABLE `coursedetails` DISABLE KEYS */;
INSERT INTO `coursedetails` VALUES ('CMFT_ODD_2014_15','Classical Mechanics and Field Theory','theory'),('DAA_ODD_2014_15','Data Analysis and ALgorithms','theory'),('OLC_ODD_2014_15','Optics and Laser Communication','theory'),('OOPS_ODD_2014_1','Object Oriented Prograaming Structures','theory'),('OOPS_ODD_2014_15','Object Oriented Prograaming Structures','theory');
/*!40000 ALTER TABLE `coursedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetype`
--

DROP TABLE IF EXISTS `coursetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetype` (
  `type` char(10) NOT NULL,
  `Q1` char(100) DEFAULT NULL,
  `Q2` char(100) DEFAULT NULL,
  `Q3` char(100) DEFAULT NULL,
  `Q4` char(100) DEFAULT NULL,
  `Q5` char(100) DEFAULT NULL,
  `Q6` char(100) DEFAULT NULL,
  `Q7` char(100) DEFAULT NULL,
  `Q8` char(100) DEFAULT NULL,
  `Q9` char(100) DEFAULT NULL,
  `Q10` char(100) DEFAULT NULL,
  `Q11` char(100) DEFAULT NULL,
  `Q12` char(100) DEFAULT NULL,
  `Q13` char(100) DEFAULT NULL,
  `Q14` char(100) DEFAULT NULL,
  `Q15` char(100) DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetype`
--

LOCK TABLES `coursetype` WRITE;
/*!40000 ALTER TABLE `coursetype` DISABLE KEYS */;
INSERT INTO `coursetype` VALUES ('lab','Content Delivery','How do you rate your participation','Test Question','Test Question',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('theory','Content Delivery','How do you rate your participation','Test Question','Test Question',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `coursetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled`
--

DROP TABLE IF EXISTS `enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled` (
  `sid` char(10) NOT NULL DEFAULT '',
  `cid` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `studentdetails` (`sid`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `coursedetails` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled`
--

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;
INSERT INTO `enrolled` VALUES ('y12uc001','CMFT_ODD_2014_15'),('y12uc002','CMFT_ODD_2014_15'),('y12uc003','CMFT_ODD_2014_15'),('y12uc004','CMFT_ODD_2014_15'),('y12uc005','CMFT_ODD_2014_15'),('y12uc006','CMFT_ODD_2014_15'),('y12uc007','CMFT_ODD_2014_15'),('y12uc001','DAA_ODD_2014_15'),('y12uc002','DAA_ODD_2014_15'),('y12uc003','DAA_ODD_2014_15'),('y12uc004','DAA_ODD_2014_15'),('y12uc005','DAA_ODD_2014_15'),('y12uc006','DAA_ODD_2014_15'),('y12uc007','DAA_ODD_2014_15'),('y12uc001','OLC_ODD_2014_15'),('y12uc002','OLC_ODD_2014_15'),('y12uc003','OLC_ODD_2014_15'),('y12uc001','OOPS_ODD_2014_1'),('y12uc001','OOPS_ODD_2014_15'),('y12uc002','OOPS_ODD_2014_15'),('y12uc003','OOPS_ODD_2014_15'),('y12uc004','OOPS_ODD_2014_15'),('y12uc005','OOPS_ODD_2014_15'),('y12uc006','OOPS_ODD_2014_15'),('y12uc007','OOPS_ODD_2014_15');
/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultydetails`
--

DROP TABLE IF EXISTS `facultydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultydetails` (
  `fid` char(5) NOT NULL,
  `facultyname` char(50) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultydetails`
--

LOCK TABLES `facultydetails` WRITE;
/*!40000 ALTER TABLE `facultydetails` DISABLE KEYS */;
INSERT INTO `facultydetails` VALUES ('AN','Amit Neogi'),('AS','Anupam Singh'),('DK','Dinesh Khandelwal'),('MJ','Mukesh Jadon'),('PS','Preeti Singh'),('SD','Subrat Dash');
/*!40000 ALTER TABLE `facultydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbackinfo`
--

DROP TABLE IF EXISTS `feedbackinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackinfo` (
  `transid` int(25) NOT NULL AUTO_INCREMENT,
  `cid` char(25) DEFAULT NULL,
  `sid` char(10) DEFAULT NULL,
  `fid` char(5) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `R1` int(2) DEFAULT NULL,
  `R2` int(2) DEFAULT NULL,
  `R3` int(2) DEFAULT NULL,
  `R4` int(2) DEFAULT NULL,
  `R5` int(2) DEFAULT NULL,
  `R6` int(2) DEFAULT NULL,
  `R7` int(2) DEFAULT NULL,
  `R8` int(2) DEFAULT NULL,
  `R9` int(2) DEFAULT NULL,
  `R10` int(2) DEFAULT NULL,
  `R11` int(2) DEFAULT NULL,
  `R12` int(2) DEFAULT NULL,
  `R13` int(2) DEFAULT NULL,
  `R14` int(2) DEFAULT NULL,
  `R15` int(2) DEFAULT NULL,
  `suggestions` char(140) DEFAULT NULL,
  PRIMARY KEY (`transid`),
  UNIQUE KEY `transid` (`transid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  KEY `fid` (`fid`),
  CONSTRAINT `feedbackinfo_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coursedetails` (`cid`),
  CONSTRAINT `feedbackinfo_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `studentdetails` (`sid`),
  CONSTRAINT `feedbackinfo_ibfk_3` FOREIGN KEY (`fid`) REFERENCES `facultydetails` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbackinfo`
--

LOCK TABLES `feedbackinfo` WRITE;
/*!40000 ALTER TABLE `feedbackinfo` DISABLE KEYS */;
INSERT INTO `feedbackinfo` VALUES (6,'CMFT_ODD_2014_15','y12uc001','AS','127.0.0.1','2014-10-18 15:26:57',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'helloQQjji'),(7,'CMFT_ODD_2014_15','y12uc002','AS','127.0.0.1','2014-10-19 18:29:10',2,3,4,3,2,4,5,4,3,2,1,2,3,4,3,'hello! nice\r\n'),(8,'CMFT_ODD_2014_15','y12uc002','AS','172.22.31.63','2014-10-28 08:13:31',5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,''),(9,'CMFT_ODD_2014_15','y12uc002','AS','172.22.31.63','2014-10-28 08:13:55',5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,''),(10,'OLC_ODD_2014_15','y12uc001','AN','127.0.0.1','2014-10-28 11:48:55',1,2,2,2,2,2,3,3,3,3,3,3,3,3,3,''),(11,'DAA_ODD_2014_15','y12uc001','DK','127.0.0.1','2014-10-28 11:57:45',1,1,2,2,2,2,3,3,3,3,5,4,4,4,5,'great'),(12,'OOPS_ODD_2014_15','y12uc001','PS','127.0.0.1','2014-11-01 06:09:12',3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,''),(13,'OOPS_ODD_2014_15','y12uc001','MJ','127.0.0.1','2014-11-01 06:15:09',3,3,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(14,'DAA_ODD_2014_15','y12uc002','DK','127.0.0.1','2014-11-05 12:44:25',5,4,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'None');
/*!40000 ALTER TABLE `feedbackinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdetails`
--

DROP TABLE IF EXISTS `studentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentdetails` (
  `sid` char(10) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `password` char(20) DEFAULT NULL,
  `branch` char(5) DEFAULT NULL,
  `batch` char(5) DEFAULT NULL,
  `emailid` char(30) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdetails`
--

LOCK TABLES `studentdetails` WRITE;
/*!40000 ALTER TABLE `studentdetails` DISABLE KEYS */;
INSERT INTO `studentdetails` VALUES ('admin',NULL,'admin',NULL,NULL,NULL),('y12uc001','aayush','001','CCE','y12','xyz.com'),('y12uc002','aakun','002','CSE','y12','xyz.com'),('y12uc003','aayush s','003','CCE','y12','xyz.com'),('y12uc004','aaditya','004','ECE','y12','xyz.com'),('y12uc005','ayush','005','ECE','y12','xyz.com'),('y12uc006','aditi','0069','CCE','y12','xyz.com'),('y12uc007','aditya','007','CSE','y12','xyz.com');
/*!40000 ALTER TABLE `studentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach` (
  `fid` char(10) NOT NULL DEFAULT '',
  `cid` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coursedetails` (`cid`),
  CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `coursedetails` (`cid`),
  CONSTRAINT `teach_ibfk_3` FOREIGN KEY (`fid`) REFERENCES `facultydetails` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach`
--

LOCK TABLES `teach` WRITE;
/*!40000 ALTER TABLE `teach` DISABLE KEYS */;
INSERT INTO `teach` VALUES ('AS','CMFT_ODD_2014_15'),('DK','DAA_ODD_2014_15'),('AN','OLC_ODD_2014_15'),('MJ','OOPS_ODD_2014_15'),('PS','OOPS_ODD_2014_15');
/*!40000 ALTER TABLE `teach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-03 12:15:20
