-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: adventure
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Jones','Liam','383 Greenfield St.','Springfield','MA',3053,'683-952-4125'),(2,'Ryan','Brian','78 Main St.','Edinboro','PA',14395,'858-155-6289'),(3,'Stewart','Martha','8 Old Saw Mill Rd.','Fairfield','CT',28766,'235-626-8135'),(4,'Patterson','Rebecca','725 Central St.','Frederick','MD',21702,'489-357-8195'),(5,'Chau','Karen','88 Strawberry Ln.','Cambridge','MA',83590,'258-815-8223');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide`
--

DROP TABLE IF EXISTS `guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guide` (
  `GID` int(11) NOT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  PRIMARY KEY (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide`
--

LOCK TABLES `guide` WRITE;
/*!40000 ALTER TABLE `guide` DISABLE KEYS */;
INSERT INTO `guide` VALUES (1,'Abrams','Harley','56 Oak St.','Williamsburg','MA',15542,'818-590-8852','2012-06-23'),(2,'Stevens','Ray','52 Pine Ln.','Sunderland','MA',52616,'361-689-9715','2015-12-02'),(3,'Davenport','Dean','25 South Lawn Rd.','Conventry','VT',26274,'616-627-3677','2013-03-24'),(4,'James','Gregory','9 Congress Dr.','Springfield','MA',22463,'767-928-0002','2010-10-13'),(5,'Myers','Rowan','7 River Rd.','Fraconia','NH',15625,'301-258-3829','2011-05-01');
/*!40000 ALTER TABLE `guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `RID` int(11) NOT NULL,
  `tourDate` date DEFAULT NULL,
  `numPersons` int(11) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `TID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RID`),
  KEY `fk_customer_reservation` (`CID`),
  KEY `fk_tour_reservation` (`TID`),
  CONSTRAINT `fk_customer_reservation` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  CONSTRAINT `fk_tour_reservation` FOREIGN KEY (`TID`) REFERENCES `tour` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2017-03-26',5,55.00,3,2),(2,'2017-09-12',7,35.00,1,5),(3,'2017-10-16',2,70.00,2,3),(4,'2017-11-11',1,20.00,4,2),(5,'2017-06-18',3,45.00,5,4);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `TID` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `maxGroupSize` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `season` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Mount Garfield Hike','Woodstock','NH',5,10,'Hiking','Fall'),(2,'Lower Pond Tour','Poland','ME',8,10,'Paddling','Spring'),(3,'Pondicherry Trail Ride','White Mountains','NH',15,15,'Biking','Spring'),(4,'Wachusett Mountain','Princeton','MA',8,10,'Hiking','Spring'),(5,'Pisgah State Park Ride','Northborough','NH',12,15,'Biking','Summer');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourguide`
--

DROP TABLE IF EXISTS `tourguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourguide` (
  `TID` int(11) NOT NULL,
  `GID` int(11) NOT NULL,
  PRIMARY KEY (`TID`,`GID`),
  KEY `fk_guide` (`GID`),
  CONSTRAINT `fk_guide` FOREIGN KEY (`GID`) REFERENCES `guide` (`GID`),
  CONSTRAINT `fk_tour` FOREIGN KEY (`TID`) REFERENCES `tour` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourguide`
--

LOCK TABLES `tourguide` WRITE;
/*!40000 ALTER TABLE `tourguide` DISABLE KEYS */;
INSERT INTO `tourguide` VALUES (1,1),(5,1),(3,2),(4,2),(2,3),(3,3),(1,4),(5,4),(2,5),(4,5);
/*!40000 ALTER TABLE `tourguide` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-03 22:56:22
