-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (x86_64)
--
-- Host: localhost    Database: b
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--
/*
DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brandId` int NOT NULL AUTO_INCREMENT,
  `brandName` varchar(50) NOT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'LuxuryStay'),(2,'ComfortInn'),(3,'UrbanEscape'),(4,'EcoRetreat'),(5,'SkylineSuites');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `buildingId` int NOT NULL AUTO_INCREMENT,
  `hotelId` int NOT NULL,
  PRIMARY KEY (`buildingId`),
  KEY `fk_building_hotel` (`hotelId`),
  CONSTRAINT `fk_building_hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (201,101),(202,101),(203,102),(204,103),(205,104);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerFirstName` varchar(50) NOT NULL,
  `customerLastName` varchar(50) NOT NULL,
  `customerPhoneNumber` varchar(20) DEFAULT NULL,
  `customerEmail` varchar(50) DEFAULT NULL,
  `organizationId` int DEFAULT NULL,
  `cardOnFile` char(16) DEFAULT NULL,
  `requiresAdvanceDeposit` tinyint(1) NOT NULL,
  `confidentialWhereabouts` tinyint(1) NOT NULL,
  PRIMARY KEY (`customerId`),
  KEY `fk_customer_organization` (`organizationId`),
  CONSTRAINT `fk_customer_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`organizationId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Brittany','Ramirez','2125551001.0','user1@email.com',2,'Yes',0,0),(2,'Donald','Brown','2125551002.0','user2@email.com',5,'Yes',0,0),(3,'Timothy','Cuevas','2125551003.0','user3@email.com',4,'Yes',1,1),(4,'Monica','Price','2125551004.0','user4@email.com',1,'Yes',1,0),(5,'Sara','Jones','2125551005.0','user5@email.com',9,'No',0,1),(6,'Benjamin','Horton','2125551006.0','user6@email.com',8,'No',0,0),(7,'Nancy','Arellano','2125551007.0','user7@email.com',3,'No',0,0),(8,'Richard','Blackwell','2125551008.0','user8@email.com',3,'Yes',0,1),(9,'Denise','Taylor','2125551009.0','user9@email.com',4,'No',1,1),(10,'Amanda','Stein','2125551010.0','user10@email.com',9,'No',1,1),(11,'Nicole','Bell','2125551011.0','user11@email.com',5,'No',1,0),(12,'Annette','Henson','2125551012.0','user12@email.com',9,'No',1,1),(13,'Emily','Johnson','2125551013.0','user13@email.com',7,'No',0,0),(14,'Michael','Cooper','2125551014.0','user14@email.com',3,'No',0,0),(15,'Philip','Figueroa','2125551015.0','user15@email.com',6,'Yes',1,0),(16,'Nathan','Bass','2125551016.0','user16@email.com',8,'No',1,0),(17,'Brandon','Werner','2125551017.0','user17@email.com',4,'No',1,0),(18,'Alexander','Wise','2125551018.0','user18@email.com',6,'Yes',1,0),(19,'Samantha','Rivera','2125551019.0','user19@email.com',3,'Yes',0,1),(20,'Justin','Woods','2125551020.0','user20@email.com',1,'No',0,1),(21,'Elizabeth','Robinson','2125551021.0','user21@email.com',6,'Yes',0,0),(22,'Jennifer','Jones','2125551022.0','user22@email.com',4,'No',0,1),(23,'Jonathan','Dominguez','2125551023.0','user23@email.com',4,'Yes',1,1),(24,'Leah','Marsh','2125551024.0','user24@email.com',9,'No',0,1),(25,'David','Yates','2125551025.0','user25@email.com',9,'Yes',0,0),(26,'William','Anderson','2125551026.0','user26@email.com',6,'Yes',0,1),(27,'Leslie','Wheeler','2125551027.0','user27@email.com',3,'Yes',0,1),(28,'Rachel','Sullivan','2125551028.0','user28@email.com',3,'No',0,0),(29,'Ian','Sharp','2125551029.0','user29@email.com',9,'No',0,0),(30,'Nicole','Galloway','2125551030.0','user30@email.com',8,'No',0,0),(31,'Pamela','Lee','2125551031.0','user31@email.com',6,'No',0,0),(32,'Lauren','Martinez','2125551032.0','user32@email.com',8,'No',1,0),(33,'Molly','Snyder','2125551033.0','user33@email.com',1,'Yes',1,1),(34,'Richard','Hampton','2125551034.0','user34@email.com',1,'No',0,0),(35,'Devon','Sanchez','2125551035.0','user35@email.com',10,'Yes',0,1),(36,'Mark','Davidson','2125551036.0','user36@email.com',9,'Yes',1,1),(37,'Kristopher','Stone','2125551037.0','user37@email.com',3,'No',1,0),(38,'Jacob','Porter','2125551038.0','user38@email.com',2,'No',0,0),(39,'Erik','Anderson','2125551039.0','user39@email.com',1,'Yes',1,1),(40,'George','Nelson','2125551040.0','user40@email.com',4,'Yes',0,1),(41,'Michael','Howell','2125551041.0','user41@email.com',8,'No',1,0),(42,'Lynn','Randolph','2125551042.0','user42@email.com',5,'Yes',1,1),(43,'Nathan','Mason','2125551043.0','user43@email.com',9,'No',1,0),(44,'Mary','West','2125551044.0','user44@email.com',10,'No',0,0),(45,'Stephanie','Jackson','2125551045.0','user45@email.com',6,'Yes',1,0),(46,'Michael','Anderson','2125551046.0','user46@email.com',3,'No',0,0),(47,'Vernon','Bell','2125551047.0','user47@email.com',9,'Yes',0,0),(48,'Adrian','Wagner','2125551048.0','user48@email.com',4,'No',1,0),(49,'Erik','Bryant','2125551049.0','user49@email.com',6,'Yes',1,0),(50,'Jeffrey','Williams','2125551050.0','user50@email.com',6,'Yes',0,0),(51,'Tim','Baker','2125551051.0','user51@email.com',2,'No',1,1),(52,'William','Foley','2125551052.0','user52@email.com',8,'Yes',1,1),(53,'Alejandra','Gutierrez','2125551053.0','user53@email.com',1,'No',1,0),(54,'Sara','Davis','2125551054.0','user54@email.com',7,'Yes',1,1),(55,'Spencer','Taylor','2125551055.0','user55@email.com',9,'Yes',1,0),(56,'Brandon','Flores','2125551056.0','user56@email.com',10,'No',0,0),(57,'Eric','Boyer','2125551057.0','user57@email.com',1,'No',1,0),(58,'Christine','Boyd','2125551058.0','user58@email.com',2,'No',1,0),(59,'Amber','Carter','2125551059.0','user59@email.com',1,'No',1,1),(60,'David','Cochran','2125551060.0','user60@email.com',4,'No',1,1),(61,'Arthur','Knight','2125551061.0','user61@email.com',8,'Yes',1,1),(62,'Kelly','Rios','2125551062.0','user62@email.com',1,'No',1,0),(63,'Brad','Miller','2125551063.0','user63@email.com',2,'Yes',0,0),(64,'Andrea','Davis','2125551064.0','user64@email.com',1,'No',1,0),(65,'Patrick','Smith','2125551065.0','user65@email.com',7,'No',1,1),(66,'Donna','Holt','2125551066.0','user66@email.com',4,'Yes',0,1),(67,'David','Hansen','2125551067.0','user67@email.com',9,'Yes',1,1),(68,'Jenna','Castro','2125551068.0','user68@email.com',5,'No',1,1),(69,'Michelle','Hill','2125551069.0','user69@email.com',6,'Yes',1,0),(70,'Zachary','Norris','2125551070.0','user70@email.com',3,'Yes',0,0),(71,'Alan','Johnson','2125551071.0','user71@email.com',8,'Yes',1,1),(72,'Diane','Watts','2125551072.0','user72@email.com',2,'No',0,0),(73,'Angela','Ray','2125551073.0','user73@email.com',8,'No',1,0),(74,'Amber','Daniels','2125551074.0','user74@email.com',7,'Yes',0,0),(75,'Karen','Flores','2125551075.0','user75@email.com',1,'No',1,0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_evaluation`
--

DROP TABLE IF EXISTS `customer_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_evaluation` (
  `evaluationId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `reservationId` int NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `reviewComment` varchar(255) DEFAULT NULL,
  `evaluationDate` datetime NOT NULL,
  PRIMARY KEY (`evaluationId`),
  KEY `fk_evaluation_customer` (`customerId`),
  KEY `fk_evaluation_reservation` (`reservationId`),
  CONSTRAINT `fk_evaluation_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_evaluation_reservation` FOREIGN KEY (`reservationId`) REFERENCES `reservation` (`reservationId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_evaluation`
--

LOCK TABLES `customer_evaluation` WRITE;
/*!40000 ALTER TABLE `customer_evaluation` DISABLE KEYS */;
INSERT INTO `customer_evaluation` VALUES (1,68,49,4.00,'Would not host again','2024-01-11 00:00:00'),(2,66,10,1.00,'Caused issues','2024-06-07 00:00:00'),(3,8,126,4.00,'Very polite','2024-05-28 00:00:00'),(4,36,29,1.00,'Caused issues','2024-04-06 00:00:00'),(5,26,71,3.00,'Would not host again','2024-06-02 00:00:00'),(6,7,67,4.00,'Caused issues','2024-04-15 00:00:00'),(7,6,52,1.00,'Very polite','2024-03-16 00:00:00'),(8,13,19,2.00,'Very polite','2024-05-28 00:00:00'),(9,42,22,3.00,'Would not host again','2024-02-13 00:00:00'),(10,62,36,3.00,'Great guest','2024-02-29 00:00:00'),(11,30,46,4.00,'Very polite','2024-01-06 00:00:00'),(12,41,119,2.00,'Caused issues','2024-04-15 00:00:00'),(13,48,140,1.00,'No complaints','2024-02-08 00:00:00'),(14,23,150,3.00,'Would not host again','2024-06-06 00:00:00'),(15,14,60,1.00,'Very polite','2024-05-28 00:00:00'),(16,47,91,3.00,'No complaints','2024-01-05 00:00:00'),(17,53,5,2.00,'Would not host again','2024-02-28 00:00:00'),(18,64,4,4.00,'Caused issues','2024-04-10 00:00:00'),(19,31,63,1.00,'Caused issues','2024-03-10 00:00:00'),(20,27,85,2.00,'Caused issues','2024-06-13 00:00:00'),(21,38,115,4.00,'Caused issues','2024-01-15 00:00:00'),(22,9,92,5.00,'Great guest','2024-02-09 00:00:00'),(23,10,41,2.00,'Caused issues','2024-03-29 00:00:00'),(24,61,127,5.00,'No complaints','2024-03-22 00:00:00'),(25,1,94,3.00,'Great guest','2024-01-15 00:00:00'),(26,4,93,4.00,'Great guest','2024-05-20 00:00:00'),(27,44,12,1.00,'Would not host again','2024-05-06 00:00:00'),(28,24,117,2.00,'Would not host again','2024-05-28 00:00:00'),(29,18,132,2.00,'No complaints','2024-03-13 00:00:00'),(30,56,15,4.00,'Caused issues','2024-03-01 00:00:00'),(31,46,125,5.00,'Would not host again','2024-04-29 00:00:00'),(32,16,141,4.00,'Caused issues','2024-05-23 00:00:00'),(33,17,103,1.00,'No complaints','2024-05-12 00:00:00'),(34,33,75,2.00,'Great guest','2024-04-04 00:00:00'),(35,65,16,4.00,'Would not host again','2024-05-09 00:00:00'),(36,20,54,3.00,'Would not host again','2024-01-22 00:00:00'),(37,57,131,2.00,'Caused issues','2024-04-20 00:00:00'),(38,32,43,5.00,'Caused issues','2024-03-12 00:00:00'),(39,5,27,2.00,'No complaints','2024-03-29 00:00:00'),(40,34,121,4.00,'No complaints','2024-02-12 00:00:00'),(41,58,25,1.00,'Great guest','2024-03-23 00:00:00'),(42,21,72,3.00,'Great guest','2024-01-01 00:00:00'),(43,37,23,2.00,'Would not host again','2024-01-06 00:00:00'),(44,67,113,1.00,'No complaints','2024-05-31 00:00:00'),(45,43,106,1.00,'Great guest','2024-03-09 00:00:00'),(46,3,73,1.00,'Would not host again','2024-05-10 00:00:00'),(47,15,64,3.00,'No complaints','2024-01-18 00:00:00'),(48,52,89,1.00,'Caused issues','2024-04-30 00:00:00'),(49,74,116,2.00,'Caused issues','2024-05-02 00:00:00'),(50,51,26,3.00,'No complaints','2024-03-13 00:00:00');
/*!40000 ALTER TABLE `customer_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_history`
--

DROP TABLE IF EXISTS `customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_history` (
  `customerId` int NOT NULL,
  `reservationId` int NOT NULL,
  PRIMARY KEY (`customerId`,`reservationId`),
  KEY `fk_customerhistory_reservation` (`reservationId`),
  CONSTRAINT `fk_customerhistory_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_customerhistory_reservation` FOREIGN KEY (`reservationId`) REFERENCES `reservation` (`reservationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_history`
--

LOCK TABLES `customer_history` WRITE;
/*!40000 ALTER TABLE `customer_history` DISABLE KEYS */;
INSERT INTO `customer_history` VALUES (29,1),(58,2),(32,3),(75,4),(33,5),(61,6),(42,7),(37,8),(3,9),(30,10),(38,11),(57,12),(59,13),(32,14),(52,15),(35,16),(12,17),(34,18),(15,19),(35,20),(60,21),(56,22),(12,23),(35,24),(48,25),(11,26),(35,27),(25,28),(41,29),(51,30),(13,31),(5,32),(50,33),(56,34),(70,35),(4,36),(33,37),(17,38),(3,39),(50,40),(35,41),(40,42),(3,43),(39,44),(69,45),(31,46),(24,47),(12,48),(5,49),(45,50),(55,51),(34,52),(18,53),(11,54),(12,55),(34,56),(15,57),(16,58),(30,59),(11,60),(58,61),(30,62),(4,63),(49,64),(57,65),(35,66),(52,67),(49,68),(10,69),(71,70),(72,71),(17,72),(20,73),(1,74),(25,75),(17,76),(71,77),(52,78),(23,79),(69,80),(39,81),(25,82),(29,83),(2,84),(22,85),(3,86),(66,87),(55,88),(6,89),(59,90),(46,91),(5,92),(7,93),(16,94),(54,95),(22,96),(1,97),(16,98),(51,99),(40,100),(54,101),(23,102),(6,103),(2,104),(14,105),(28,106),(53,107),(60,108),(20,109),(1,110),(35,111),(8,112),(42,113),(49,114),(68,115),(49,116),(73,117),(10,118),(62,119),(50,120),(62,121),(27,122),(13,123),(14,124),(36,125),(27,126),(7,127),(19,128),(15,129),(33,130),(51,131),(53,132),(38,133),(5,134),(27,135),(71,136),(35,137),(59,138),(42,139),(70,140),(52,141),(53,142),(72,143),(23,144),(36,145),(74,146),(72,147),(68,148),(5,149),(57,150);
/*!40000 ALTER TABLE `customer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `eventName` varchar(50) NOT NULL,
  `organizationId` int DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  PRIMARY KEY (`eventId`),
  KEY `fk_event_organization` (`organizationId`),
  CONSTRAINT `fk_event_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`organizationId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Event_1',8,'2024-05-11 00:00:00','2024-05-13 00:00:00'),(2,'Event_2',6,'2024-02-11 00:00:00','2024-02-14 00:00:00'),(3,'Event_3',8,'2024-03-31 00:00:00','2024-04-03 00:00:00'),(4,'Event_4',10,'2024-02-12 00:00:00','2024-02-15 00:00:00'),(5,'Event_5',3,'2024-06-14 00:00:00','2024-06-17 00:00:00'),(6,'Event_6',5,'2024-03-22 00:00:00','2024-03-25 00:00:00'),(7,'Event_7',3,'2024-06-08 00:00:00','2024-06-10 00:00:00'),(8,'Event_8',2,'2024-04-14 00:00:00','2024-04-16 00:00:00'),(9,'Event_9',9,'2024-02-28 00:00:00','2024-03-02 00:00:00'),(10,'Event_10',1,'2024-05-30 00:00:00','2024-06-02 00:00:00'),(11,'Event_11',4,'2024-02-25 00:00:00','2024-02-28 00:00:00'),(12,'Event_12',10,'2024-03-14 00:00:00','2024-03-16 00:00:00'),(13,'Event_13',8,'2024-05-25 00:00:00','2024-05-26 00:00:00'),(14,'Event_14',7,'2024-03-07 00:00:00','2024-03-09 00:00:00'),(15,'Event_15',4,'2024-03-01 00:00:00','2024-03-04 00:00:00'),(16,'Event_16',3,'2024-05-16 00:00:00','2024-05-18 00:00:00'),(17,'Event_17',8,'2024-03-06 00:00:00','2024-03-08 00:00:00'),(18,'Event_18',7,'2024-04-22 00:00:00','2024-04-25 00:00:00'),(19,'Event_19',3,'2024-02-02 00:00:00','2024-02-05 00:00:00'),(20,'Event_20',3,'2024-05-23 00:00:00','2024-05-26 00:00:00'),(21,'Event_21',10,'2024-04-17 00:00:00','2024-04-20 00:00:00'),(22,'Event_22',5,'2024-03-22 00:00:00','2024-03-25 00:00:00'),(23,'Event_23',9,'2024-05-10 00:00:00','2024-05-12 00:00:00'),(24,'Event_24',5,'2024-02-11 00:00:00','2024-02-12 00:00:00'),(25,'Event_25',5,'2024-01-21 00:00:00','2024-01-22 00:00:00'),(26,'Event_26',7,'2024-03-08 00:00:00','2024-03-09 00:00:00'),(27,'Event_27',9,'2024-01-18 00:00:00','2024-01-19 00:00:00'),(28,'Event_28',3,'2024-03-26 00:00:00','2024-03-29 00:00:00'),(29,'Event_29',9,'2024-02-25 00:00:00','2024-02-27 00:00:00'),(30,'Event_30',9,'2024-01-30 00:00:00','2024-02-02 00:00:00');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_guest`
--

DROP TABLE IF EXISTS `event_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_guest` (
  `eventId` int NOT NULL,
  `customerId` int NOT NULL,
  PRIMARY KEY (`eventId`,`customerId`),
  KEY `fk_eventguest_customer` (`customerId`),
  CONSTRAINT `fk_eventguest_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_eventguest_event` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_guest`
--

LOCK TABLES `event_guest` WRITE;
/*!40000 ALTER TABLE `event_guest` DISABLE KEYS */;
INSERT INTO `event_guest` VALUES (12,2),(13,2),(23,2),(12,3),(27,3),(11,4),(18,5),(13,6),(27,6),(6,7),(12,7),(29,8),(26,9),(18,10),(4,12),(8,12),(23,12),(7,13),(19,15),(2,16),(16,16),(29,16),(2,17),(14,18),(20,18),(5,19),(26,19),(10,20),(9,22),(20,22),(25,22),(1,23),(23,23),(25,23),(7,24),(9,24),(21,24),(19,25),(2,26),(14,26),(28,26),(16,28),(12,29),(25,29),(3,30),(4,31),(6,31),(11,31),(9,32),(20,32),(26,33),(8,34),(7,35),(18,36),(23,36),(28,37),(3,38),(2,40),(15,40),(5,41),(19,43),(3,44),(18,44),(8,45),(22,45),(24,49),(9,50),(18,51),(22,51),(25,51),(16,52),(29,52),(26,53),(18,54),(6,55),(15,55),(28,55),(14,56),(17,56),(3,57),(26,58),(21,59),(28,59),(5,62),(16,62),(16,63),(13,64),(8,65),(19,66),(17,67),(14,69),(19,69),(24,71),(12,72),(21,72),(20,73),(18,74),(23,74),(1,75),(15,75);
/*!40000 ALTER TABLE `event_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor` (
  `floorId` int NOT NULL AUTO_INCREMENT,
  `wingId` int NOT NULL,
  `floorNumber` int NOT NULL,
  PRIMARY KEY (`floorId`),
  KEY `fk_floor_wing` (`wingId`),
  CONSTRAINT `fk_floor_wing` FOREIGN KEY (`wingId`) REFERENCES `wing` (`wingId`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (401,301,1),(402,301,2),(403,302,1),(404,303,3),(405,304,4);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotelId` int NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `brandId` int NOT NULL,
  PRIMARY KEY (`hotelId`),
  KEY `fk_hotel_brand` (`brandId`),
  CONSTRAINT `fk_hotel_brand` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (101,'The Grand Manhattan','123 Broadway, New York, NY',1),(102,'Cozy Bay Resort','456 Ocean Drive, Miami, FL',2),(103,'City Lights Hotel','789 Sunset Blvd, Los Angeles, CA',3),(104,'Green Hills Retreat','321 Hilltop Road, Boulder, CO',4),(105,'Sky Tower','987 High Street, Chicago, IL',5);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_log`
--

DROP TABLE IF EXISTS `maintenance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_log` (
  `staffCardNumber` int NOT NULL,
  `roomId` int NOT NULL,
  PRIMARY KEY (`staffCardNumber`,`roomId`),
  KEY `fk_maintenancelog_room` (`roomId`),
  CONSTRAINT `fk_maintenancelog_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`),
  CONSTRAINT `fk_maintenancelog_staff` FOREIGN KEY (`staffCardNumber`) REFERENCES `staff_card` (`staffCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_log`
--

LOCK TABLES `maintenance_log` WRITE;
/*!40000 ALTER TABLE `maintenance_log` DISABLE KEYS */;
INSERT INTO `maintenance_log` VALUES (1,1003),(6,1005),(6,1007),(4,1012),(1,1013),(8,1013),(3,1014),(4,1014),(5,1019),(7,1021),(4,1025),(8,1026),(5,1027),(1,1028),(3,1032),(8,1045),(2,1053),(5,1054),(10,1063),(9,1070);
/*!40000 ALTER TABLE `maintenance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_type`
--

DROP TABLE IF EXISTS `maintenance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_type` (
  `maintenanceTypeId` int NOT NULL AUTO_INCREMENT,
  `maintenanceType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`maintenanceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_type`
--

LOCK TABLES `maintenance_type` WRITE;
/*!40000 ALTER TABLE `maintenance_type` DISABLE KEYS */;
INSERT INTO `maintenance_type` VALUES (1,'Plumbing'),(2,'Electrical'),(3,'HVAC'),(4,'Cleaning');
/*!40000 ALTER TABLE `maintenance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_room`
--

DROP TABLE IF EXISTS `meeting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_room` (
  `roomId` int NOT NULL,
  `meetingCapacity` int NOT NULL,
  `hasToilet` tinyint(1) NOT NULL,
  `slotRate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`roomId`),
  CONSTRAINT `fk_meetingroom_roomid` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_room`
--

LOCK TABLES `meeting_room` WRITE;
/*!40000 ALTER TABLE `meeting_room` DISABLE KEYS */;
INSERT INTO `meeting_room` VALUES (1006,17,0,596.23),(1016,29,0,224.91),(1022,10,0,223.85),(1027,21,0,528.65),(1029,33,1,512.06),(1030,27,0,336.60),(1036,10,0,517.16),(1037,49,1,229.38),(1038,48,1,585.55),(1043,35,0,550.22),(1045,35,0,265.42),(1046,19,0,414.46),(1048,32,0,435.40),(1051,37,0,474.45),(1053,33,1,226.41),(1054,39,0,424.80),(1058,41,1,528.64),(1061,29,1,295.20),(1063,45,0,358.88),(1064,50,1,273.98);
/*!40000 ALTER TABLE `meeting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_room_reservation`
--

DROP TABLE IF EXISTS `meeting_room_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_room_reservation` (
  `roomReservationId` int NOT NULL AUTO_INCREMENT,
  `reservationId` int NOT NULL,
  `roomId` int DEFAULT NULL,
  `checkInDateTime` datetime DEFAULT NULL,
  `checkOutDateTime` datetime DEFAULT NULL,
  `timeSlot` varchar(50) NOT NULL,
  `roomCost` decimal(10,2) DEFAULT NULL,
  `eatingUse` tinyint(1) NOT NULL,
  `numGuests` int NOT NULL,
  `hasToilet` tinyint(1) DEFAULT NULL,
  `handicapAccess` tinyint(1) DEFAULT NULL,
  `closeToPool` tinyint(1) DEFAULT NULL,
  `closeToRestaurant` tinyint(1) DEFAULT NULL,
  `closeToParking` tinyint(1) DEFAULT NULL,
  `closeToGym` tinyint(1) DEFAULT NULL,
  `smoking` tinyint(1) NOT NULL,
  PRIMARY KEY (`roomReservationId`),
  KEY `fk_meetroomres_reservation` (`reservationId`),
  KEY `fk_meetroomres_room` (`roomId`),
  CONSTRAINT `fk_meetroomres_reservation` FOREIGN KEY (`reservationId`) REFERENCES `reservation` (`reservationId`),
  CONSTRAINT `fk_meetroomres_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_room_reservation`
--

LOCK TABLES `meeting_room_reservation` WRITE;
/*!40000 ALTER TABLE `meeting_room_reservation` DISABLE KEYS */;
INSERT INTO `meeting_room_reservation` VALUES (76,76,1037,'2024-05-04 00:00:00','2024-05-04 07:00:00','0:00 - 7:00',1184.89,1,17,0,1,1,1,1,0,0),(77,77,1027,'2024-03-14 00:00:00','2024-03-14 07:00:00','0:00 - 7:00',1182.84,0,14,0,0,1,0,1,0,0),(78,78,1027,'2024-02-07 00:00:00','2024-02-07 03:00:00','0:00 - 3:00',719.91,0,22,0,0,1,0,1,0,1),(79,79,1054,'2024-01-01 00:00:00','2024-01-01 06:00:00','0:00 - 6:00',1161.22,0,28,1,1,1,1,0,0,1),(80,80,1016,'2024-03-08 00:00:00','2024-03-08 01:00:00','0:00 - 1:00',1374.89,1,23,1,0,0,1,1,0,0),(81,81,1051,'2024-04-01 00:00:00','2024-04-01 06:00:00','0:00 - 6:00',1288.06,0,40,1,1,0,0,0,0,0),(82,82,1058,'2024-02-24 00:00:00','2024-02-24 06:00:00','0:00 - 6:00',1323.11,0,7,0,1,1,1,1,1,0),(83,83,1022,'2024-03-30 00:00:00','2024-03-30 02:00:00','0:00 - 2:00',1166.63,1,5,0,1,1,1,1,1,0),(84,84,1038,'2024-01-24 00:00:00','2024-01-24 03:00:00','0:00 - 3:00',1078.17,1,33,1,1,0,1,1,0,0),(85,85,1016,'2024-03-16 00:00:00','2024-03-16 03:00:00','0:00 - 3:00',819.18,0,25,1,0,0,0,0,1,1),(86,86,1061,'2024-05-09 00:00:00','2024-05-09 07:00:00','0:00 - 7:00',872.88,0,28,1,1,0,0,0,0,0),(87,87,1022,'2024-03-18 00:00:00','2024-03-18 05:00:00','0:00 - 5:00',1145.91,0,15,1,0,1,1,0,1,1),(88,88,1048,'2024-04-12 00:00:00','2024-04-12 06:00:00','0:00 - 6:00',920.23,0,39,1,0,0,1,0,0,0),(89,89,1058,'2024-01-01 00:00:00','2024-01-01 04:00:00','0:00 - 4:00',1219.60,1,26,1,1,1,0,0,0,0),(90,90,1006,'2024-06-09 00:00:00','2024-06-09 05:00:00','0:00 - 5:00',1321.29,0,38,0,1,0,1,1,1,1),(91,91,1022,'2024-06-13 00:00:00','2024-06-13 08:00:00','0:00 - 8:00',746.24,0,40,1,0,1,1,0,0,0),(92,92,1029,'2024-05-13 00:00:00','2024-05-13 04:00:00','0:00 - 4:00',665.69,1,10,1,0,1,0,0,1,0),(93,93,1051,'2024-01-04 00:00:00','2024-01-04 08:00:00','0:00 - 8:00',1321.79,1,32,0,0,1,0,1,1,0),(94,94,1053,'2024-02-19 00:00:00','2024-02-19 06:00:00','0:00 - 6:00',913.13,1,5,0,0,0,0,1,0,1),(95,95,1053,'2024-05-05 00:00:00','2024-05-05 06:00:00','0:00 - 6:00',644.39,0,22,1,0,0,1,1,0,0),(96,96,1053,'2024-05-09 00:00:00','2024-05-09 08:00:00','0:00 - 8:00',363.90,0,28,0,1,1,0,1,1,0),(97,97,1058,'2024-02-18 00:00:00','2024-02-18 08:00:00','0:00 - 8:00',1070.42,0,11,0,0,1,1,0,1,1),(98,98,1030,'2024-05-18 00:00:00','2024-05-18 08:00:00','0:00 - 8:00',688.13,0,36,1,1,0,0,0,1,1),(99,99,1064,'2024-01-17 00:00:00','2024-01-17 01:00:00','0:00 - 1:00',503.56,1,12,0,1,0,1,0,1,1),(100,100,1053,'2024-03-08 00:00:00','2024-03-08 08:00:00','0:00 - 8:00',1383.27,0,35,1,0,1,0,0,0,1),(101,101,1048,'2024-05-18 00:00:00','2024-05-18 01:00:00','0:00 - 1:00',1449.47,1,34,1,1,0,0,1,0,1),(102,102,1038,'2024-04-23 00:00:00','2024-04-23 01:00:00','0:00 - 1:00',857.07,0,27,1,1,1,0,0,1,1),(103,103,1029,'2024-04-07 00:00:00','2024-04-07 06:00:00','0:00 - 6:00',1423.80,0,14,0,0,0,0,1,0,0),(104,104,1053,'2024-04-20 00:00:00','2024-04-20 04:00:00','0:00 - 4:00',795.07,1,20,1,0,1,1,1,1,1),(105,105,1045,'2024-02-13 00:00:00','2024-02-13 04:00:00','0:00 - 4:00',837.99,1,12,1,1,0,1,0,0,1),(106,106,1038,'2024-06-04 00:00:00','2024-06-04 08:00:00','0:00 - 8:00',575.86,1,9,1,0,0,0,0,1,0),(107,107,1038,'2024-06-12 00:00:00','2024-06-12 08:00:00','0:00 - 8:00',1052.38,0,13,1,1,1,0,1,0,1),(108,108,1061,'2024-01-27 00:00:00','2024-01-27 05:00:00','0:00 - 5:00',651.81,0,9,1,1,0,0,1,1,0),(109,109,1054,'2024-04-19 00:00:00','2024-04-19 03:00:00','0:00 - 3:00',907.81,0,25,0,1,1,1,1,1,1),(110,110,1030,'2024-06-27 00:00:00','2024-06-27 06:00:00','0:00 - 6:00',359.58,1,34,0,1,1,0,0,1,1),(111,111,1045,'2024-03-23 00:00:00','2024-03-23 02:00:00','0:00 - 2:00',1345.85,0,19,1,0,1,0,0,1,1),(112,112,1063,'2024-02-15 00:00:00','2024-02-15 08:00:00','0:00 - 8:00',476.01,1,5,1,1,1,1,1,1,1),(113,113,1054,'2024-05-31 00:00:00','2024-05-31 05:00:00','0:00 - 5:00',1138.98,1,40,1,1,0,1,1,0,1),(114,114,1006,'2024-02-20 00:00:00','2024-02-20 06:00:00','0:00 - 6:00',1435.43,0,5,0,0,0,0,1,1,1),(115,115,1030,'2024-06-24 00:00:00','2024-06-24 03:00:00','0:00 - 3:00',438.04,1,10,0,1,1,1,1,1,0),(116,116,1063,'2024-02-18 00:00:00','2024-02-18 03:00:00','0:00 - 3:00',1004.78,0,15,0,0,1,1,0,0,1),(117,117,1045,'2024-05-24 00:00:00','2024-05-24 02:00:00','0:00 - 2:00',1026.28,1,12,1,0,0,0,0,0,0),(118,118,1063,'2024-03-04 00:00:00','2024-03-04 04:00:00','0:00 - 4:00',640.06,0,27,0,1,0,0,1,1,0),(119,119,1061,'2024-04-21 00:00:00','2024-04-21 08:00:00','0:00 - 8:00',710.59,1,9,0,0,1,0,0,1,0),(120,120,1027,'2024-02-04 00:00:00','2024-02-04 02:00:00','0:00 - 2:00',1329.64,0,8,1,1,0,1,0,1,0),(121,121,1058,'2024-03-16 00:00:00','2024-03-16 06:00:00','0:00 - 6:00',725.54,0,14,0,1,0,1,1,0,1),(122,122,1045,'2024-06-01 00:00:00','2024-06-01 08:00:00','0:00 - 8:00',512.63,0,31,1,0,1,0,1,1,1),(123,123,1037,'2024-01-28 00:00:00','2024-01-28 04:00:00','0:00 - 4:00',662.55,1,39,0,1,1,1,1,1,0),(124,124,1022,'2024-05-04 00:00:00','2024-05-04 06:00:00','0:00 - 6:00',1082.79,0,22,0,0,1,1,0,1,1),(125,125,1022,'2024-05-30 00:00:00','2024-05-30 01:00:00','0:00 - 1:00',984.15,1,34,0,1,1,1,0,0,1),(126,126,1022,'2024-05-09 00:00:00','2024-05-09 01:00:00','0:00 - 1:00',721.10,1,30,1,0,1,0,1,1,1),(127,127,1046,'2024-06-27 00:00:00','2024-06-27 06:00:00','0:00 - 6:00',308.49,1,24,1,1,0,0,1,1,1),(128,128,1061,'2024-06-19 00:00:00','2024-06-19 06:00:00','0:00 - 6:00',1160.97,0,36,0,0,1,0,1,1,0),(129,129,1064,'2024-03-02 00:00:00','2024-03-02 04:00:00','0:00 - 4:00',839.98,1,12,0,0,1,1,0,1,0),(130,130,1063,'2024-03-10 00:00:00','2024-03-10 02:00:00','0:00 - 2:00',1237.51,1,12,0,1,1,1,1,1,0),(131,131,1048,'2024-05-16 00:00:00','2024-05-16 03:00:00','0:00 - 3:00',831.27,0,5,1,1,0,1,1,0,0),(132,132,1045,'2024-06-13 00:00:00','2024-06-13 05:00:00','0:00 - 5:00',1064.20,1,29,0,1,0,0,0,0,0),(133,133,1064,'2024-01-19 00:00:00','2024-01-19 04:00:00','0:00 - 4:00',853.73,1,29,0,1,0,1,1,1,0),(134,134,1038,'2024-02-27 00:00:00','2024-02-27 03:00:00','0:00 - 3:00',333.51,1,19,1,0,0,1,0,1,0),(135,135,1045,'2024-03-24 00:00:00','2024-03-24 08:00:00','0:00 - 8:00',555.35,1,39,0,0,0,1,1,1,0),(136,136,1030,'2024-05-04 00:00:00','2024-05-04 07:00:00','0:00 - 7:00',449.59,1,26,1,1,0,0,1,0,1),(137,137,1061,'2024-01-10 00:00:00','2024-01-10 08:00:00','0:00 - 8:00',816.49,1,33,1,1,0,0,0,0,1),(138,138,1064,'2024-04-18 00:00:00','2024-04-18 05:00:00','0:00 - 5:00',1121.43,1,17,1,1,0,0,0,1,1),(139,139,1045,'2024-04-18 00:00:00','2024-04-18 07:00:00','0:00 - 7:00',1264.56,1,17,0,1,1,0,0,1,1),(140,140,1054,'2024-01-17 00:00:00','2024-01-17 04:00:00','0:00 - 4:00',758.14,0,13,0,1,0,1,1,0,1),(141,141,1037,'2024-05-17 00:00:00','2024-05-17 05:00:00','0:00 - 5:00',1273.57,1,25,1,0,1,1,0,1,0),(142,142,1016,'2024-02-12 00:00:00','2024-02-12 06:00:00','0:00 - 6:00',667.34,0,38,1,0,0,1,0,0,0),(143,143,1051,'2024-05-28 00:00:00','2024-05-28 07:00:00','0:00 - 7:00',357.02,0,37,0,0,0,1,0,1,0),(144,144,1048,'2024-03-22 00:00:00','2024-03-22 05:00:00','0:00 - 5:00',1219.41,1,36,1,1,0,0,1,1,1),(145,145,1036,'2024-05-14 00:00:00','2024-05-14 02:00:00','0:00 - 2:00',330.56,0,5,0,0,0,1,1,1,0),(146,146,1053,'2024-05-23 00:00:00','2024-05-23 02:00:00','0:00 - 2:00',414.86,0,21,0,0,0,0,1,0,0),(147,147,1054,'2024-06-27 00:00:00','2024-06-27 06:00:00','0:00 - 6:00',566.21,0,15,1,1,0,1,1,1,1),(148,148,1054,'2024-02-28 00:00:00','2024-02-28 04:00:00','0:00 - 4:00',304.88,1,10,1,1,1,1,1,1,0),(149,149,1048,'2024-03-22 00:00:00','2024-03-22 04:00:00','0:00 - 4:00',1467.82,1,10,1,1,1,1,1,1,1),(150,150,1063,'2024-01-22 00:00:00','2024-01-22 05:00:00','0:00 - 5:00',1438.18,1,6,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `meeting_room_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageId` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `callerName` varchar(50) NOT NULL,
  `messageTime` datetime NOT NULL,
  `messageContents` varchar(1000) NOT NULL,
  `messageReceivedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  KEY `fk_message_customer` (`customerId`),
  CONSTRAINT `fk_message_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,5,'Caller_1','2024-03-29 13:00:00','This is a message left for customer 5.','2024-03-29 13:25:00'),(2,8,'Caller_2','2024-05-24 17:00:00','This is a message left for customer 8.','2024-05-24 18:00:00'),(3,55,'Caller_3','2024-04-04 08:00:00','This is a message left for customer 55.','2024-04-04 08:30:00'),(4,2,'Caller_4','2024-03-16 23:00:00','This is a message left for customer 2.','2024-03-16 23:06:00'),(5,34,'Caller_5','2024-05-11 00:00:00','This is a message left for customer 34.','2024-05-11 00:01:00'),(6,36,'Caller_6','2024-04-30 12:00:00','This is a message left for customer 36.','2024-04-30 12:59:00'),(7,10,'Caller_7','2024-01-22 22:00:00','This is a message left for customer 10.','2024-01-22 22:15:00'),(8,25,'Caller_8','2024-04-25 05:00:00','This is a message left for customer 25.','2024-04-25 05:45:00'),(9,35,'Caller_9','2024-06-15 07:00:00','This is a message left for customer 35.','2024-06-15 07:33:00'),(10,32,'Caller_10','2024-04-05 02:00:00','This is a message left for customer 32.','2024-04-05 02:13:00'),(11,22,'Caller_11','2024-05-17 11:00:00','This is a message left for customer 22.','2024-05-17 11:46:00'),(12,67,'Caller_12','2024-03-08 05:00:00','This is a message left for customer 67.','2024-03-08 05:49:00'),(13,5,'Caller_13','2024-01-24 05:00:00','This is a message left for customer 5.','2024-01-24 05:55:00'),(14,23,'Caller_14','2024-02-15 23:00:00','This is a message left for customer 23.','2024-02-15 23:36:00'),(15,30,'Caller_15','2024-03-04 21:00:00','This is a message left for customer 30.','2024-03-04 21:12:00'),(16,10,'Caller_16','2024-04-01 11:00:00','This is a message left for customer 10.','2024-04-01 11:37:00'),(17,48,'Caller_17','2024-06-25 20:00:00','This is a message left for customer 48.','2024-06-25 20:32:00'),(18,51,'Caller_18','2024-03-05 12:00:00','This is a message left for customer 51.','2024-03-05 12:57:00'),(19,48,'Caller_19','2024-06-06 22:00:00','This is a message left for customer 48.','2024-06-06 22:21:00'),(20,48,'Caller_20','2024-04-03 02:00:00','This is a message left for customer 48.','2024-04-03 02:35:00'),(21,16,'Caller_21','2024-04-27 09:00:00','This is a message left for customer 16.','2024-04-27 09:30:00'),(22,3,'Caller_22','2024-02-14 10:00:00','This is a message left for customer 3.','2024-02-14 10:39:00'),(23,9,'Caller_23','2024-02-22 18:00:00','This is a message left for customer 9.','2024-02-22 18:41:00'),(24,24,'Caller_24','2024-03-10 14:00:00','This is a message left for customer 24.','2024-03-10 14:03:00'),(25,32,'Caller_25','2024-05-07 11:00:00','This is a message left for customer 32.','2024-05-07 11:42:00'),(26,33,'Caller_26','2024-01-26 07:00:00','This is a message left for customer 33.','2024-01-26 07:01:00'),(27,34,'Caller_27','2024-06-03 04:00:00','This is a message left for customer 34.','2024-06-03 04:30:00'),(28,51,'Caller_28','2024-04-23 00:00:00','This is a message left for customer 51.','2024-04-23 00:02:00'),(29,15,'Caller_29','2024-06-23 10:00:00','This is a message left for customer 15.','2024-06-23 10:45:00'),(30,17,'Caller_30','2024-04-25 11:00:00','This is a message left for customer 17.','2024-04-25 11:29:00'),(31,51,'Caller_31','2024-02-13 14:00:00','This is a message left for customer 51.','2024-02-13 14:07:00'),(32,20,'Caller_32','2024-01-12 17:00:00','This is a message left for customer 20.','2024-01-12 17:15:00'),(33,2,'Caller_33','2024-05-29 19:00:00','This is a message left for customer 2.','2024-05-29 19:25:00'),(34,75,'Caller_34','2024-05-16 02:00:00','This is a message left for customer 75.','2024-05-16 02:23:00'),(35,50,'Caller_35','2024-03-28 06:00:00','This is a message left for customer 50.','2024-03-28 06:22:00'),(36,45,'Caller_36','2024-05-17 00:00:00','This is a message left for customer 45.','2024-05-17 00:43:00'),(37,49,'Caller_37','2024-03-26 07:00:00','This is a message left for customer 49.','2024-03-26 07:02:00'),(38,72,'Caller_38','2024-05-01 08:00:00','This is a message left for customer 72.','2024-05-01 08:58:00'),(39,70,'Caller_39','2024-04-06 00:00:00','This is a message left for customer 70.','2024-04-06 00:31:00'),(40,66,'Caller_40','2024-03-06 20:00:00','This is a message left for customer 66.','2024-03-06 20:06:00'),(41,28,'Caller_41','2024-06-05 15:00:00','This is a message left for customer 28.','2024-06-05 15:02:00'),(42,15,'Caller_42','2024-04-17 12:00:00','This is a message left for customer 15.','2024-04-17 12:14:00'),(43,4,'Caller_43','2024-04-30 10:00:00','This is a message left for customer 4.','2024-04-30 11:00:00'),(44,48,'Caller_44','2024-06-26 18:00:00','This is a message left for customer 48.','2024-06-26 18:10:00'),(45,19,'Caller_45','2024-03-25 16:00:00','This is a message left for customer 19.','2024-03-25 16:48:00'),(46,7,'Caller_46','2024-06-05 13:00:00','This is a message left for customer 7.','2024-06-05 13:29:00'),(47,43,'Caller_47','2024-01-16 22:00:00','This is a message left for customer 43.','2024-01-16 22:33:00'),(48,38,'Caller_48','2024-01-04 06:00:00','This is a message left for customer 38.','2024-01-04 06:06:00'),(49,46,'Caller_49','2024-03-18 01:00:00','This is a message left for customer 46.','2024-03-18 01:04:00'),(50,66,'Caller_50','2024-03-16 13:00:00','This is a message left for customer 66.','2024-03-16 13:59:00'),(51,69,'Caller_51','2024-06-22 14:00:00','This is a message left for customer 69.','2024-06-22 14:30:00'),(52,71,'Caller_52','2024-03-23 12:00:00','This is a message left for customer 71.','2024-03-23 12:53:00'),(53,70,'Caller_53','2024-03-28 10:00:00','This is a message left for customer 70.','2024-03-28 10:12:00'),(54,14,'Caller_54','2024-01-28 23:00:00','This is a message left for customer 14.','2024-01-28 23:59:00'),(55,2,'Caller_55','2024-01-01 08:00:00','This is a message left for customer 2.','2024-01-01 08:54:00'),(56,37,'Caller_56','2024-03-15 04:00:00','This is a message left for customer 37.','2024-03-15 04:12:00'),(57,52,'Caller_57','2024-05-09 15:00:00','This is a message left for customer 52.','2024-05-09 15:47:00'),(58,41,'Caller_58','2024-05-08 13:00:00','This is a message left for customer 41.','2024-05-08 13:04:00'),(59,8,'Caller_59','2024-03-20 11:00:00','This is a message left for customer 8.','2024-03-20 11:30:00'),(60,37,'Caller_60','2024-04-28 04:00:00','This is a message left for customer 37.','2024-04-28 04:57:00'),(61,28,'Caller_61','2024-02-17 06:00:00','This is a message left for customer 28.','2024-02-17 06:45:00'),(62,18,'Caller_62','2024-04-05 06:00:00','This is a message left for customer 18.','2024-04-05 06:51:00'),(63,63,'Caller_63','2024-04-23 06:00:00','This is a message left for customer 63.','2024-04-23 06:41:00'),(64,57,'Caller_64','2024-01-15 15:00:00','This is a message left for customer 57.','2024-01-15 15:55:00'),(65,18,'Caller_65','2024-02-29 22:00:00','This is a message left for customer 18.','2024-02-29 22:59:00'),(66,1,'Caller_66','2024-04-22 16:00:00','This is a message left for customer 1.','2024-04-22 16:06:00'),(67,6,'Caller_67','2024-05-07 06:00:00','This is a message left for customer 6.','2024-05-07 06:25:00'),(68,34,'Caller_68','2024-04-06 02:00:00','This is a message left for customer 34.','2024-04-06 02:06:00'),(69,1,'Caller_69','2024-04-13 08:00:00','This is a message left for customer 1.','2024-04-13 08:42:00'),(70,6,'Caller_70','2024-05-11 14:00:00','This is a message left for customer 6.','2024-05-11 14:19:00'),(71,67,'Caller_71','2024-02-19 11:00:00','This is a message left for customer 67.','2024-02-19 11:45:00'),(72,56,'Caller_72','2024-02-26 22:00:00','This is a message left for customer 56.','2024-02-26 22:49:00'),(73,1,'Caller_73','2024-04-15 04:00:00','This is a message left for customer 1.','2024-04-15 04:43:00'),(74,68,'Caller_74','2024-06-27 21:00:00','This is a message left for customer 68.','2024-06-27 21:39:00'),(75,17,'Caller_75','2024-02-17 06:00:00','This is a message left for customer 17.','2024-02-17 06:55:00');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `organizationId` int NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(255) NOT NULL,
  `organizationPhone` varchar(15) DEFAULT NULL,
  `organizationEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organizationId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Org_1','5550101234.0','contact@org1.com'),(2,'Org_2','5550102234.0','contact@org2.com'),(3,'Org_3','5550103234.0','contact@org3.com'),(4,'Org_4','5550104234.0','contact@org4.com'),(5,'Org_5','5550105234.0','contact@org5.com'),(6,'Org_6','5550106234.0','contact@org6.com'),(7,'Org_7','5550107234.0','contact@org7.com'),(8,'Org_8','5550108234.0','contact@org8.com'),(9,'Org_9','5550109234.0','contact@org9.com'),(10,'Org_10','5550110234.0','contact@org10.com');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin_card`
--

DROP TABLE IF EXISTS `pin_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin_card` (
  `pin` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `validityStart` datetime NOT NULL,
  `validityExpiration` datetime NOT NULL,
  PRIMARY KEY (`pin`),
  KEY `fk_pincard_customer` (`customerId`),
  CONSTRAINT `fk_pincard_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin_card`
--

LOCK TABLES `pin_card` WRITE;
/*!40000 ALTER TABLE `pin_card` DISABLE KEYS */;
INSERT INTO `pin_card` VALUES (1,1,'2024-01-15 00:00:00','2024-07-22 00:00:00'),(2,2,'2024-01-04 00:00:00','2024-07-11 00:00:00'),(3,3,'2024-01-03 00:00:00','2024-07-25 00:00:00'),(4,4,'2024-01-17 00:00:00','2024-07-15 00:00:00'),(5,5,'2024-01-24 00:00:00','2024-07-17 00:00:00'),(6,6,'2024-01-12 00:00:00','2024-07-26 00:00:00'),(7,7,'2024-01-26 00:00:00','2024-07-06 00:00:00'),(8,8,'2024-01-06 00:00:00','2024-07-27 00:00:00'),(9,9,'2024-01-31 00:00:00','2024-07-20 00:00:00'),(10,10,'2024-01-14 00:00:00','2024-07-14 00:00:00'),(11,11,'2024-01-06 00:00:00','2024-07-07 00:00:00'),(12,12,'2024-01-25 00:00:00','2024-07-04 00:00:00'),(13,13,'2024-01-19 00:00:00','2024-07-05 00:00:00'),(14,14,'2024-01-09 00:00:00','2024-07-25 00:00:00'),(15,15,'2024-01-29 00:00:00','2024-07-10 00:00:00'),(16,16,'2024-01-12 00:00:00','2024-07-13 00:00:00'),(17,17,'2024-01-19 00:00:00','2024-07-12 00:00:00'),(18,18,'2024-01-11 00:00:00','2024-07-05 00:00:00'),(19,19,'2024-01-27 00:00:00','2024-07-28 00:00:00'),(20,20,'2024-01-24 00:00:00','2024-07-31 00:00:00'),(21,21,'2024-01-12 00:00:00','2024-07-28 00:00:00'),(22,22,'2024-01-01 00:00:00','2024-07-24 00:00:00'),(23,23,'2024-01-15 00:00:00','2024-07-10 00:00:00'),(24,24,'2024-01-09 00:00:00','2024-07-12 00:00:00'),(25,25,'2024-01-25 00:00:00','2024-07-12 00:00:00'),(26,26,'2024-01-22 00:00:00','2024-07-20 00:00:00'),(27,27,'2024-01-30 00:00:00','2024-07-06 00:00:00'),(28,28,'2024-01-05 00:00:00','2024-07-15 00:00:00'),(29,29,'2024-01-15 00:00:00','2024-07-27 00:00:00'),(30,30,'2024-01-27 00:00:00','2024-07-03 00:00:00'),(31,31,'2024-01-06 00:00:00','2024-07-28 00:00:00'),(32,32,'2024-01-15 00:00:00','2024-07-18 00:00:00'),(33,33,'2024-01-22 00:00:00','2024-07-15 00:00:00'),(34,34,'2024-01-10 00:00:00','2024-07-24 00:00:00'),(35,35,'2024-01-21 00:00:00','2024-07-17 00:00:00'),(36,36,'2024-01-29 00:00:00','2024-07-27 00:00:00'),(37,37,'2024-01-20 00:00:00','2024-07-09 00:00:00'),(38,38,'2024-01-27 00:00:00','2024-07-13 00:00:00'),(39,39,'2024-01-08 00:00:00','2024-07-06 00:00:00'),(40,40,'2024-01-14 00:00:00','2024-07-14 00:00:00'),(41,41,'2024-01-30 00:00:00','2024-07-11 00:00:00'),(42,42,'2024-01-24 00:00:00','2024-07-21 00:00:00'),(43,43,'2024-01-09 00:00:00','2024-07-11 00:00:00'),(44,44,'2024-01-25 00:00:00','2024-07-13 00:00:00'),(45,45,'2024-01-02 00:00:00','2024-07-05 00:00:00'),(46,46,'2024-01-24 00:00:00','2024-07-28 00:00:00'),(47,47,'2024-01-07 00:00:00','2024-07-01 00:00:00'),(48,48,'2024-01-05 00:00:00','2024-07-17 00:00:00'),(49,49,'2024-01-16 00:00:00','2024-07-08 00:00:00'),(50,50,'2024-01-07 00:00:00','2024-07-15 00:00:00'),(51,51,'2024-01-30 00:00:00','2024-07-29 00:00:00'),(52,52,'2024-01-30 00:00:00','2024-07-13 00:00:00'),(53,53,'2024-01-14 00:00:00','2024-07-14 00:00:00'),(54,54,'2024-01-31 00:00:00','2024-07-04 00:00:00'),(55,55,'2024-01-16 00:00:00','2024-07-22 00:00:00'),(56,56,'2024-01-13 00:00:00','2024-07-01 00:00:00'),(57,57,'2024-01-20 00:00:00','2024-07-06 00:00:00'),(58,58,'2024-01-31 00:00:00','2024-07-04 00:00:00'),(59,59,'2024-01-28 00:00:00','2024-07-13 00:00:00'),(60,60,'2024-01-15 00:00:00','2024-07-31 00:00:00'),(61,61,'2024-01-07 00:00:00','2024-07-31 00:00:00'),(62,62,'2024-01-16 00:00:00','2024-07-01 00:00:00'),(63,63,'2024-01-13 00:00:00','2024-07-15 00:00:00'),(64,64,'2024-01-14 00:00:00','2024-07-29 00:00:00'),(65,65,'2024-01-27 00:00:00','2024-07-13 00:00:00'),(66,66,'2024-01-08 00:00:00','2024-07-20 00:00:00'),(67,67,'2024-01-02 00:00:00','2024-07-11 00:00:00'),(68,68,'2024-01-31 00:00:00','2024-07-27 00:00:00'),(69,69,'2024-01-27 00:00:00','2024-07-23 00:00:00'),(70,70,'2024-01-03 00:00:00','2024-07-04 00:00:00'),(71,71,'2024-01-18 00:00:00','2024-07-06 00:00:00'),(72,72,'2024-01-30 00:00:00','2024-07-29 00:00:00'),(73,73,'2024-01-01 00:00:00','2024-07-28 00:00:00'),(74,74,'2024-01-07 00:00:00','2024-07-30 00:00:00'),(75,75,'2024-01-20 00:00:00','2024-07-30 00:00:00');
/*!40000 ALTER TABLE `pin_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin_card_location`
--

DROP TABLE IF EXISTS `pin_card_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin_card_location` (
  `pin` int NOT NULL,
  `roomId` int NOT NULL,
  `enteringOrLeaving` varchar(8) DEFAULT NULL,
  `locationDateTime` datetime NOT NULL,
  PRIMARY KEY (`pin`,`roomId`,`locationDateTime`),
  KEY `fk_pincardlocation_room` (`roomId`),
  CONSTRAINT `fk_pincardlocation_pin` FOREIGN KEY (`pin`) REFERENCES `pin_card` (`pin`),
  CONSTRAINT `fk_pincardlocation_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin_card_location`
--

LOCK TABLES `pin_card_location` WRITE;
/*!40000 ALTER TABLE `pin_card_location` DISABLE KEYS */;
INSERT INTO `pin_card_location` VALUES (1,1003,'Leaving','2024-05-22 04:00:00'),(1,1039,'Leaving','2024-05-04 19:00:00'),(4,1016,'Entering','2024-05-21 00:00:00'),(7,1063,'Entering','2024-04-21 02:00:00'),(8,1037,'Leaving','2024-05-22 04:00:00'),(9,1032,'Leaving','2024-01-20 09:00:00'),(10,1041,'Leaving','2024-04-22 16:00:00'),(11,1003,'Leaving','2024-04-01 06:00:00'),(11,1022,'Entering','2024-04-10 11:00:00'),(11,1041,'Entering','2024-06-06 16:00:00'),(11,1065,'Entering','2024-03-26 04:00:00'),(13,1006,'Entering','2024-03-10 04:00:00'),(13,1030,'Leaving','2024-04-14 19:00:00'),(17,1006,'Entering','2024-04-20 23:00:00'),(18,1065,'Leaving','2024-04-17 05:00:00'),(19,1047,'Entering','2024-01-20 22:00:00'),(19,1066,'Entering','2024-02-22 01:00:00'),(20,1066,'Entering','2024-05-23 05:00:00'),(21,1026,'Leaving','2024-02-11 12:00:00'),(23,1009,'Entering','2024-02-09 02:00:00'),(23,1010,'Entering','2024-03-30 20:00:00'),(23,1048,'Entering','2024-05-14 07:00:00'),(23,1050,'Entering','2024-01-16 07:00:00'),(23,1063,'Leaving','2024-06-25 17:00:00'),(23,1067,'Leaving','2024-05-20 10:00:00'),(25,1063,'Entering','2024-01-16 04:00:00'),(26,1010,'Leaving','2024-02-24 20:00:00'),(27,1010,'Entering','2024-04-28 03:00:00'),(27,1029,'Leaving','2024-06-10 04:00:00'),(28,1004,'Leaving','2024-03-18 01:00:00'),(28,1013,'Leaving','2024-05-31 08:00:00'),(28,1029,'Leaving','2024-02-12 12:00:00'),(29,1060,'Entering','2024-06-05 08:00:00'),(34,1017,'Entering','2024-04-01 15:00:00'),(34,1017,'Leaving','2024-04-27 09:00:00'),(34,1044,'Entering','2024-06-24 12:00:00'),(34,1067,'Leaving','2024-02-24 06:00:00'),(35,1019,'Entering','2024-03-07 00:00:00'),(35,1033,'Entering','2024-01-23 12:00:00'),(36,1045,'Leaving','2024-04-15 15:00:00'),(37,1005,'Entering','2024-01-28 14:00:00'),(37,1070,'Leaving','2024-06-09 04:00:00'),(39,1019,'Leaving','2024-01-14 02:00:00'),(41,1015,'Leaving','2024-05-09 08:00:00'),(41,1044,'Entering','2024-01-04 10:00:00'),(42,1049,'Entering','2024-05-08 20:00:00'),(42,1056,'Leaving','2024-05-30 23:00:00'),(42,1070,'Entering','2024-06-05 12:00:00'),(43,1005,'Entering','2024-04-24 09:00:00'),(43,1028,'Entering','2024-04-25 12:00:00'),(43,1061,'Leaving','2024-05-18 23:00:00'),(43,1069,'Entering','2024-02-18 23:00:00'),(45,1006,'Leaving','2024-01-29 17:00:00'),(45,1026,'Entering','2024-06-06 06:00:00'),(46,1025,'Leaving','2024-03-13 13:00:00'),(46,1054,'Leaving','2024-03-03 13:00:00'),(47,1022,'Leaving','2024-04-22 10:00:00'),(47,1033,'Leaving','2024-05-16 05:00:00'),(47,1045,'Leaving','2024-04-04 05:00:00'),(48,1004,'Leaving','2024-06-18 09:00:00'),(48,1014,'Entering','2024-06-04 04:00:00'),(48,1016,'Entering','2024-01-04 16:00:00'),(48,1036,'Entering','2024-05-15 06:00:00'),(50,1006,'Entering','2024-06-14 16:00:00'),(50,1052,'Leaving','2024-01-03 02:00:00'),(50,1067,'Leaving','2024-01-21 09:00:00'),(51,1011,'Leaving','2024-01-02 19:00:00'),(51,1047,'Entering','2024-04-09 09:00:00'),(52,1033,'Leaving','2024-05-14 21:00:00'),(53,1066,'Entering','2024-01-07 16:00:00'),(54,1035,'Entering','2024-01-15 05:00:00'),(55,1024,'Entering','2024-02-12 14:00:00'),(55,1039,'Leaving','2024-03-30 23:00:00'),(55,1043,'Leaving','2024-03-03 09:00:00'),(56,1019,'Leaving','2024-02-29 08:00:00'),(57,1050,'Entering','2024-05-01 10:00:00'),(57,1056,'Entering','2024-03-29 11:00:00'),(58,1027,'Leaving','2024-04-05 19:00:00'),(60,1011,'Leaving','2024-05-12 22:00:00'),(60,1042,'Entering','2024-05-14 16:00:00'),(60,1053,'Entering','2024-04-17 10:00:00'),(62,1002,'Entering','2024-04-28 13:00:00'),(62,1054,'Leaving','2024-05-16 12:00:00'),(63,1036,'Leaving','2024-05-17 05:00:00'),(63,1048,'Leaving','2024-03-18 16:00:00'),(63,1057,'Leaving','2024-02-25 07:00:00'),(65,1013,'Leaving','2024-02-08 16:00:00'),(65,1046,'Leaving','2024-04-22 10:00:00'),(67,1038,'Entering','2024-06-01 22:00:00'),(68,1029,'Entering','2024-04-07 02:00:00'),(70,1056,'Entering','2024-02-08 09:00:00'),(70,1060,'Entering','2024-02-15 06:00:00'),(71,1052,'Leaving','2024-03-13 13:00:00'),(71,1067,'Entering','2024-01-04 19:00:00'),(72,1011,'Leaving','2024-01-04 06:00:00'),(72,1031,'Leaving','2024-02-24 00:00:00'),(72,1064,'Leaving','2024-06-04 09:00:00'),(75,1020,'Entering','2024-01-03 06:00:00'),(75,1020,'Entering','2024-03-27 20:00:00'),(75,1044,'Leaving','2024-04-14 03:00:00');
/*!40000 ALTER TABLE `pin_card_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin_card_room_access`
--

DROP TABLE IF EXISTS `pin_card_room_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin_card_room_access` (
  `pin` int NOT NULL,
  `roomId` int NOT NULL,
  PRIMARY KEY (`pin`,`roomId`),
  KEY `fk_pincardaccess_room` (`roomId`),
  CONSTRAINT `fk_pincardaccess_pin` FOREIGN KEY (`pin`) REFERENCES `pin_card` (`pin`),
  CONSTRAINT `fk_pincardaccess_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin_card_room_access`
--

LOCK TABLES `pin_card_room_access` WRITE;
/*!40000 ALTER TABLE `pin_card_room_access` DISABLE KEYS */;
INSERT INTO `pin_card_room_access` VALUES (46,1001),(74,1001),(45,1002),(3,1003),(33,1005),(70,1005),(50,1006),(75,1006),(55,1007),(5,1008),(6,1008),(27,1008),(21,1009),(10,1010),(20,1010),(29,1010),(40,1010),(65,1011),(15,1012),(51,1012),(54,1012),(58,1012),(61,1012),(52,1013),(22,1015),(65,1016),(75,1016),(12,1018),(66,1018),(59,1019),(63,1020),(37,1021),(59,1022),(18,1023),(28,1023),(48,1023),(14,1024),(18,1025),(26,1027),(47,1027),(8,1028),(43,1028),(37,1030),(1,1031),(37,1031),(66,1032),(52,1033),(8,1034),(16,1034),(74,1035),(1,1036),(46,1036),(48,1037),(10,1038),(23,1038),(56,1038),(71,1040),(14,1041),(58,1042),(69,1042),(31,1043),(42,1043),(51,1043),(26,1045),(42,1045),(44,1045),(42,1046),(35,1047),(62,1047),(67,1047),(72,1047),(6,1049),(18,1051),(50,1052),(17,1054),(46,1054),(38,1055),(48,1055),(53,1055),(18,1056),(40,1056),(40,1057),(55,1058),(2,1061),(63,1061),(16,1062),(51,1062),(8,1064),(21,1065),(7,1066),(37,1066),(75,1066),(13,1067),(26,1067),(31,1069),(39,1069),(72,1070);
/*!40000 ALTER TABLE `pin_card_room_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `eventId` int DEFAULT NULL,
  `reservationPlacementDate` datetime NOT NULL,
  `statusId` int DEFAULT NULL,
  `transactionId` int DEFAULT NULL,
  PRIMARY KEY (`reservationId`),
  KEY `fk_reservation_customer` (`customerId`),
  KEY `fk_reservation_event` (`eventId`),
  KEY `fk_reservation_reservationstatus` (`statusId`),
  KEY `fk_reservation_transaction` (`transactionId`),
  CONSTRAINT `fk_reservation_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_reservation_event` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`),
  CONSTRAINT `fk_reservation_reservationstatus` FOREIGN KEY (`statusId`) REFERENCES `reservation_status` (`statusId`),
  CONSTRAINT `fk_reservation_transaction` FOREIGN KEY (`transactionId`) REFERENCES `transaction` (`transactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,29,NULL,'2024-01-06 00:00:00',1,201),(2,58,NULL,'2024-05-22 00:00:00',2,202),(3,32,NULL,'2024-06-24 00:00:00',3,203),(4,75,NULL,'2024-06-29 00:00:00',2,204),(5,33,NULL,'2024-04-23 00:00:00',2,205),(6,61,NULL,'2024-03-28 00:00:00',2,206),(7,42,NULL,'2024-06-12 00:00:00',1,207),(8,37,NULL,'2024-03-01 00:00:00',3,208),(9,3,NULL,'2024-02-19 00:00:00',2,209),(10,30,NULL,'2024-05-21 00:00:00',3,210),(11,38,NULL,'2024-03-19 00:00:00',3,211),(12,57,NULL,'2024-04-06 00:00:00',1,212),(13,59,NULL,'2024-02-26 00:00:00',2,213),(14,32,NULL,'2024-04-28 00:00:00',2,214),(15,52,NULL,'2024-06-28 00:00:00',2,215),(16,35,NULL,'2024-02-09 00:00:00',2,216),(17,12,NULL,'2024-04-27 00:00:00',2,217),(18,34,NULL,'2024-01-07 00:00:00',1,218),(19,15,NULL,'2024-03-11 00:00:00',1,219),(20,35,NULL,'2024-03-05 00:00:00',1,220),(21,60,NULL,'2024-02-12 00:00:00',2,221),(22,56,NULL,'2024-02-26 00:00:00',1,222),(23,12,NULL,'2024-06-25 00:00:00',3,223),(24,35,NULL,'2024-02-09 00:00:00',2,224),(25,48,NULL,'2024-06-06 00:00:00',1,225),(26,11,NULL,'2024-06-20 00:00:00',3,226),(27,35,NULL,'2024-01-04 00:00:00',1,227),(28,25,NULL,'2024-03-29 00:00:00',3,228),(29,41,NULL,'2024-06-01 00:00:00',1,229),(30,51,NULL,'2024-06-01 00:00:00',1,230),(31,13,NULL,'2024-01-04 00:00:00',3,231),(32,5,NULL,'2024-06-20 00:00:00',1,232),(33,50,NULL,'2024-06-11 00:00:00',1,233),(34,56,NULL,'2024-05-22 00:00:00',3,234),(35,70,NULL,'2024-06-01 00:00:00',3,235),(36,4,NULL,'2024-05-02 00:00:00',3,236),(37,33,NULL,'2024-02-17 00:00:00',2,237),(38,17,NULL,'2024-01-14 00:00:00',2,238),(39,3,NULL,'2024-01-13 00:00:00',1,239),(40,50,NULL,'2024-05-04 00:00:00',1,240),(41,35,NULL,'2024-01-19 00:00:00',3,241),(42,40,NULL,'2024-05-30 00:00:00',3,242),(43,3,NULL,'2024-06-02 00:00:00',1,243),(44,39,NULL,'2024-04-23 00:00:00',2,244),(45,69,NULL,'2024-04-30 00:00:00',2,245),(46,31,NULL,'2024-02-18 00:00:00',3,246),(47,24,NULL,'2024-06-02 00:00:00',3,247),(48,12,NULL,'2024-05-02 00:00:00',3,248),(49,5,NULL,'2024-02-08 00:00:00',1,249),(50,45,NULL,'2024-03-28 00:00:00',3,250),(51,55,NULL,'2024-01-22 00:00:00',2,251),(52,34,NULL,'2024-04-13 00:00:00',3,252),(53,18,NULL,'2024-05-13 00:00:00',1,253),(54,11,NULL,'2024-01-18 00:00:00',2,254),(55,12,NULL,'2024-01-09 00:00:00',3,255),(56,34,NULL,'2024-04-30 00:00:00',2,256),(57,15,NULL,'2024-06-06 00:00:00',2,257),(58,16,NULL,'2024-01-15 00:00:00',1,258),(59,30,NULL,'2024-04-04 00:00:00',1,259),(60,11,NULL,'2024-05-30 00:00:00',1,260),(61,58,NULL,'2024-03-30 00:00:00',1,261),(62,30,NULL,'2024-02-28 00:00:00',3,262),(63,4,NULL,'2024-05-18 00:00:00',1,263),(64,49,NULL,'2024-04-02 00:00:00',2,264),(65,57,NULL,'2024-04-06 00:00:00',2,265),(66,35,NULL,'2024-06-04 00:00:00',2,266),(67,52,NULL,'2024-04-30 00:00:00',3,267),(68,49,NULL,'2024-01-27 00:00:00',2,268),(69,10,NULL,'2024-05-09 00:00:00',3,269),(70,71,NULL,'2024-04-22 00:00:00',3,270),(71,72,NULL,'2024-04-08 00:00:00',2,271),(72,17,NULL,'2024-04-05 00:00:00',3,272),(73,20,NULL,'2024-05-01 00:00:00',2,273),(74,1,NULL,'2024-03-31 00:00:00',2,274),(75,25,NULL,'2024-03-16 00:00:00',1,275),(76,17,NULL,'2024-06-09 00:00:00',3,276),(77,71,NULL,'2024-04-24 00:00:00',3,277),(78,52,NULL,'2024-05-05 00:00:00',2,278),(79,23,NULL,'2024-04-06 00:00:00',1,279),(80,69,NULL,'2024-04-22 00:00:00',2,280),(81,39,NULL,'2024-04-11 00:00:00',1,281),(82,25,NULL,'2024-05-28 00:00:00',1,282),(83,29,NULL,'2024-01-09 00:00:00',2,283),(84,2,NULL,'2024-05-08 00:00:00',1,284),(85,22,NULL,'2024-05-03 00:00:00',1,285),(86,3,NULL,'2024-02-08 00:00:00',2,286),(87,66,NULL,'2024-06-21 00:00:00',1,287),(88,55,NULL,'2024-05-28 00:00:00',2,288),(89,6,NULL,'2024-05-11 00:00:00',1,289),(90,59,NULL,'2024-06-09 00:00:00',1,290),(91,46,NULL,'2024-02-25 00:00:00',3,291),(92,5,NULL,'2024-04-07 00:00:00',2,292),(93,7,NULL,'2024-02-27 00:00:00',1,293),(94,16,NULL,'2024-03-17 00:00:00',3,294),(95,54,NULL,'2024-03-02 00:00:00',2,295),(96,22,NULL,'2024-01-22 00:00:00',1,296),(97,1,NULL,'2024-06-12 00:00:00',2,297),(98,16,NULL,'2024-02-11 00:00:00',1,298),(99,51,NULL,'2024-04-26 00:00:00',1,299),(100,40,NULL,'2024-01-27 00:00:00',2,300),(101,54,NULL,'2024-05-07 00:00:00',3,301),(102,23,NULL,'2024-06-08 00:00:00',3,302),(103,6,NULL,'2024-01-13 00:00:00',2,303),(104,2,NULL,'2024-03-23 00:00:00',1,304),(105,14,NULL,'2024-04-28 00:00:00',2,305),(106,28,NULL,'2024-05-02 00:00:00',3,306),(107,53,NULL,'2024-01-24 00:00:00',3,307),(108,60,NULL,'2024-04-26 00:00:00',1,308),(109,20,NULL,'2024-02-23 00:00:00',2,309),(110,1,NULL,'2024-02-29 00:00:00',1,310),(111,35,NULL,'2024-06-09 00:00:00',2,311),(112,8,NULL,'2024-05-03 00:00:00',2,312),(113,42,NULL,'2024-06-02 00:00:00',2,313),(114,49,NULL,'2024-01-20 00:00:00',3,314),(115,68,NULL,'2024-06-04 00:00:00',1,315),(116,49,NULL,'2024-02-22 00:00:00',2,316),(117,73,NULL,'2024-04-20 00:00:00',1,317),(118,10,NULL,'2024-06-25 00:00:00',3,318),(119,62,NULL,'2024-01-30 00:00:00',3,319),(120,50,NULL,'2024-06-06 00:00:00',1,320),(121,62,NULL,'2024-04-10 00:00:00',3,321),(122,27,NULL,'2024-01-05 00:00:00',3,322),(123,13,NULL,'2024-06-27 00:00:00',2,323),(124,14,NULL,'2024-06-04 00:00:00',2,324),(125,36,NULL,'2024-03-18 00:00:00',1,325),(126,27,NULL,'2024-05-16 00:00:00',1,326),(127,7,NULL,'2024-04-04 00:00:00',3,327),(128,19,NULL,'2024-05-05 00:00:00',2,328),(129,15,NULL,'2024-05-06 00:00:00',1,329),(130,33,NULL,'2024-02-16 00:00:00',2,330),(131,51,NULL,'2024-05-27 00:00:00',3,331),(132,53,NULL,'2024-06-09 00:00:00',3,332),(133,38,NULL,'2024-02-10 00:00:00',1,333),(134,5,NULL,'2024-01-01 00:00:00',2,334),(135,27,NULL,'2024-05-15 00:00:00',3,335),(136,71,NULL,'2024-04-10 00:00:00',3,336),(137,35,NULL,'2024-05-02 00:00:00',1,337),(138,59,NULL,'2024-05-08 00:00:00',2,338),(139,42,NULL,'2024-06-23 00:00:00',1,339),(140,70,NULL,'2024-04-28 00:00:00',3,340),(141,52,NULL,'2024-03-03 00:00:00',2,341),(142,53,NULL,'2024-06-14 00:00:00',2,342),(143,72,NULL,'2024-03-22 00:00:00',1,343),(144,23,NULL,'2024-02-15 00:00:00',3,344),(145,36,NULL,'2024-01-09 00:00:00',2,345),(146,74,NULL,'2024-03-19 00:00:00',1,346),(147,72,NULL,'2024-03-08 00:00:00',1,347),(148,68,NULL,'2024-05-07 00:00:00',1,348),(149,5,NULL,'2024-03-08 00:00:00',2,349),(150,57,NULL,'2024-01-23 00:00:00',3,350);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_status`
--

DROP TABLE IF EXISTS `reservation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_status` (
  `statusId` int NOT NULL,
  `statusName` varchar(15) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_status`
--

LOCK TABLES `reservation_status` WRITE;
/*!40000 ALTER TABLE `reservation_status` DISABLE KEYS */;
INSERT INTO `reservation_status` VALUES (1,'Confirmed'),(2,'Cancelled'),(3,'Checked In');
/*!40000 ALTER TABLE `reservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomId` int NOT NULL AUTO_INCREMENT,
  `roomNum` int NOT NULL,
  `floorId` int NOT NULL,
  `floorplanFile` mediumblob,
  `handicapAccess` tinyint(1) DEFAULT NULL,
  `closeToPool` tinyint(1) DEFAULT NULL,
  `closeToRestaurant` tinyint(1) DEFAULT NULL,
  `closeToParking` tinyint(1) DEFAULT NULL,
  `closeToGym` tinyint(1) DEFAULT NULL,
  `smoking` tinyint(1) NOT NULL,
  PRIMARY KEY (`roomId`),
  KEY `fk_room_floor` (`floorId`),
  CONSTRAINT `fk_room_floor` FOREIGN KEY (`floorId`) REFERENCES `floor` (`floorId`)
) ENGINE=InnoDB AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1001,265,401,_binary 'floorplan_1001.pdf',1,0,1,0,0,1),(1002,728,402,_binary 'floorplan_1002.pdf',0,1,0,0,1,1),(1003,404,404,_binary 'floorplan_1003.pdf',0,1,0,1,0,1),(1004,546,402,_binary 'floorplan_1004.pdf',1,1,1,0,1,1),(1005,737,401,_binary 'floorplan_1005.pdf',1,0,0,0,1,1),(1006,692,401,_binary 'floorplan_1006.pdf',0,1,0,0,1,1),(1007,292,404,_binary 'floorplan_1007.pdf',0,1,1,0,0,0),(1008,451,402,_binary 'floorplan_1008.pdf',0,1,0,1,0,0),(1009,219,401,_binary 'floorplan_1009.pdf',1,0,0,0,1,1),(1010,547,403,_binary 'floorplan_1010.pdf',1,0,1,0,1,1),(1011,362,401,_binary 'floorplan_1011.pdf',0,1,1,1,1,1),(1012,990,402,_binary 'floorplan_1012.pdf',0,0,0,1,0,0),(1013,758,401,_binary 'floorplan_1013.pdf',0,1,1,0,0,1),(1014,552,403,_binary 'floorplan_1014.pdf',0,1,0,0,0,0),(1015,769,404,_binary 'floorplan_1015.pdf',0,1,0,0,1,1),(1016,200,403,_binary 'floorplan_1016.pdf',1,1,1,0,0,1),(1017,941,404,_binary 'floorplan_1017.pdf',1,0,0,0,0,1),(1018,410,405,_binary 'floorplan_1018.pdf',1,0,0,0,1,1),(1019,122,403,_binary 'floorplan_1019.pdf',0,0,1,0,1,1),(1020,910,404,_binary 'floorplan_1020.pdf',1,1,0,0,1,0),(1021,916,404,_binary 'floorplan_1021.pdf',0,0,1,0,0,1),(1022,439,401,_binary 'floorplan_1022.pdf',0,0,0,0,1,1),(1023,502,404,_binary 'floorplan_1023.pdf',0,0,1,1,0,1),(1024,555,402,_binary 'floorplan_1024.pdf',0,1,0,1,1,0),(1025,351,405,_binary 'floorplan_1025.pdf',0,1,1,1,0,0),(1026,651,405,_binary 'floorplan_1026.pdf',1,0,0,0,0,1),(1027,127,405,_binary 'floorplan_1027.pdf',0,0,0,1,1,1),(1028,994,402,_binary 'floorplan_1028.pdf',0,1,1,1,1,0),(1029,883,404,_binary 'floorplan_1029.pdf',0,0,0,0,0,1),(1030,575,405,_binary 'floorplan_1030.pdf',0,0,0,0,0,0),(1031,616,403,_binary 'floorplan_1031.pdf',0,1,1,0,1,0),(1032,260,403,_binary 'floorplan_1032.pdf',0,1,0,1,1,0),(1033,620,404,_binary 'floorplan_1033.pdf',1,0,1,1,0,1),(1034,513,403,_binary 'floorplan_1034.pdf',1,0,0,1,1,1),(1035,929,404,_binary 'floorplan_1035.pdf',0,1,1,0,0,0),(1036,433,402,_binary 'floorplan_1036.pdf',1,0,0,1,1,1),(1037,285,404,_binary 'floorplan_1037.pdf',0,1,0,1,0,0),(1038,294,405,_binary 'floorplan_1038.pdf',1,0,0,1,1,0),(1039,807,403,_binary 'floorplan_1039.pdf',0,1,1,0,1,0),(1040,889,403,_binary 'floorplan_1040.pdf',0,1,1,0,0,1),(1041,792,403,_binary 'floorplan_1041.pdf',1,0,0,1,0,1),(1042,924,402,_binary 'floorplan_1042.pdf',1,0,0,0,1,0),(1043,277,404,_binary 'floorplan_1043.pdf',1,1,0,0,1,1),(1044,299,405,_binary 'floorplan_1044.pdf',1,0,1,1,1,1),(1045,650,404,_binary 'floorplan_1045.pdf',1,0,1,1,0,0),(1046,371,403,_binary 'floorplan_1046.pdf',1,0,1,0,1,1),(1047,804,405,_binary 'floorplan_1047.pdf',0,0,1,1,1,0),(1048,545,401,_binary 'floorplan_1048.pdf',1,1,0,1,1,1),(1049,601,404,_binary 'floorplan_1049.pdf',1,0,0,0,0,1),(1050,193,402,_binary 'floorplan_1050.pdf',1,1,0,0,1,1),(1051,255,402,_binary 'floorplan_1051.pdf',1,1,0,0,1,0),(1052,723,402,_binary 'floorplan_1052.pdf',0,0,1,0,1,0),(1053,794,405,_binary 'floorplan_1053.pdf',0,0,1,1,0,0),(1054,403,404,_binary 'floorplan_1054.pdf',0,1,1,1,1,1),(1055,192,404,_binary 'floorplan_1055.pdf',0,0,1,0,1,1),(1056,139,401,_binary 'floorplan_1056.pdf',1,1,0,0,1,1),(1057,361,402,_binary 'floorplan_1057.pdf',0,0,1,0,1,1),(1058,466,403,_binary 'floorplan_1058.pdf',1,1,0,1,0,1),(1059,294,402,_binary 'floorplan_1059.pdf',1,1,0,1,1,1),(1060,686,403,_binary 'floorplan_1060.pdf',1,0,1,0,0,1),(1061,580,401,_binary 'floorplan_1061.pdf',0,1,1,1,0,0),(1062,441,403,_binary 'floorplan_1062.pdf',0,1,0,1,0,0),(1063,940,402,_binary 'floorplan_1063.pdf',1,1,1,0,0,0),(1064,729,402,_binary 'floorplan_1064.pdf',1,1,0,0,0,1),(1065,505,404,_binary 'floorplan_1065.pdf',1,0,1,0,0,0),(1066,520,404,_binary 'floorplan_1066.pdf',0,1,1,0,1,0),(1067,171,403,_binary 'floorplan_1067.pdf',1,0,1,0,0,1),(1068,502,401,_binary 'floorplan_1068.pdf',0,1,1,1,0,0),(1069,620,402,_binary 'floorplan_1069.pdf',0,1,1,1,1,1),(1070,846,405,_binary 'floorplan_1070.pdf',1,0,0,1,1,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_linkage`
--

DROP TABLE IF EXISTS `room_linkage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_linkage` (
  `roomOne` int NOT NULL,
  `roomTwo` int NOT NULL,
  `removableWall` tinyint(1) NOT NULL,
  PRIMARY KEY (`roomOne`,`roomTwo`),
  KEY `fk_roomtwo_room` (`roomTwo`),
  CONSTRAINT `fk_roomone_room` FOREIGN KEY (`roomOne`) REFERENCES `room` (`roomId`),
  CONSTRAINT `fk_roomtwo_room` FOREIGN KEY (`roomTwo`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_linkage`
--

LOCK TABLES `room_linkage` WRITE;
/*!40000 ALTER TABLE `room_linkage` DISABLE KEYS */;
INSERT INTO `room_linkage` VALUES (1003,1021,0),(1010,1031,0),(1013,1035,0),(1020,1056,1),(1027,1061,0),(1032,1011,0),(1040,1006,0),(1041,1014,1),(1043,1008,1),(1051,1047,1);
/*!40000 ALTER TABLE `room_linkage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_maintenance`
--

DROP TABLE IF EXISTS `room_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_maintenance` (
  `roomId` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `maintenanceTypeId` int NOT NULL,
  `maintenanceNotes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`roomId`,`startDateTime`),
  KEY `fk_maintenance_type` (`maintenanceTypeId`),
  CONSTRAINT `fk_maintenance_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`),
  CONSTRAINT `fk_maintenance_type` FOREIGN KEY (`maintenanceTypeId`) REFERENCES `maintenance_type` (`maintenanceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_maintenance`
--

LOCK TABLES `room_maintenance` WRITE;
/*!40000 ALTER TABLE `room_maintenance` DISABLE KEYS */;
INSERT INTO `room_maintenance` VALUES (1002,'2024-06-10 00:00:00','2024-06-10 04:00:00',1,NULL),(1006,'2024-05-17 00:00:00','2024-05-17 11:00:00',3,NULL),(1007,'2024-05-02 00:00:00','2024-05-02 17:00:00',1,NULL),(1012,'2024-05-12 00:00:00','2024-05-13 16:00:00',4,NULL),(1013,'2024-02-24 00:00:00','2024-02-25 18:00:00',4,NULL),(1014,'2024-03-29 00:00:00','2024-03-29 15:00:00',4,NULL),(1016,'2024-05-20 00:00:00','2024-05-20 19:00:00',3,NULL),(1020,'2024-03-01 00:00:00','2024-03-01 04:00:00',2,NULL),(1022,'2024-01-22 00:00:00','2024-01-23 01:00:00',1,NULL),(1031,'2024-04-18 00:00:00','2024-04-19 18:00:00',3,NULL),(1032,'2024-03-05 00:00:00','2024-03-05 08:00:00',4,NULL),(1033,'2024-02-01 00:00:00','2024-02-01 09:00:00',2,NULL),(1036,'2024-04-11 00:00:00','2024-04-11 11:00:00',2,NULL),(1041,'2024-03-09 00:00:00','2024-03-09 04:00:00',2,NULL),(1044,'2024-06-28 00:00:00','2024-06-28 17:00:00',1,NULL),(1046,'2024-03-02 00:00:00','2024-03-02 22:00:00',4,NULL),(1053,'2024-03-18 00:00:00','2024-03-19 17:00:00',2,NULL),(1057,'2024-05-13 00:00:00','2024-05-13 06:00:00',2,NULL),(1060,'2024-06-05 00:00:00','2024-06-05 17:00:00',4,NULL),(1065,'2024-06-21 00:00:00','2024-06-22 12:00:00',2,NULL);
/*!40000 ALTER TABLE `room_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `roomTypeId` int NOT NULL AUTO_INCREMENT,
  `roomType` varchar(50) NOT NULL,
  `guestCapacity` int NOT NULL,
  PRIMARY KEY (`roomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'Standard',2),(2,'Deluxe',4),(3,'Suite',6),(4,'Conference',20),(5,'Boardroom',10);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleeping_room`
--

DROP TABLE IF EXISTS `sleeping_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleeping_room` (
  `roomId` int NOT NULL,
  `roomTypeId` int NOT NULL,
  `roomRate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`roomId`),
  CONSTRAINT `fk_sleepingroom_roomid` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleeping_room`
--

LOCK TABLES `sleeping_room` WRITE;
/*!40000 ALTER TABLE `sleeping_room` DISABLE KEYS */;
INSERT INTO `sleeping_room` VALUES (1001,1,328.48),(1002,3,325.62),(1003,3,215.36),(1004,2,336.57),(1005,3,290.52),(1007,3,134.77),(1008,3,277.92),(1009,3,233.71),(1010,1,186.68),(1011,1,302.99),(1012,1,168.64),(1013,3,336.94),(1014,2,165.26),(1015,3,295.78),(1017,2,161.47),(1018,1,150.34),(1019,2,172.14),(1020,2,335.20),(1021,2,296.66),(1023,3,192.18),(1024,2,244.95),(1025,1,158.87),(1026,3,226.72),(1028,3,318.41),(1031,2,312.21),(1032,3,334.54),(1033,2,248.69),(1034,1,276.02),(1035,2,347.26),(1039,1,245.52),(1040,1,198.77),(1041,1,290.38),(1042,3,214.68),(1044,3,199.19),(1047,1,348.89),(1049,1,203.57),(1050,2,274.66),(1052,1,252.85),(1055,3,291.66),(1056,2,233.92),(1057,2,288.67),(1059,1,231.93),(1060,3,181.66),(1062,3,274.32),(1065,2,184.66),(1066,3,159.34),(1067,3,341.75),(1068,1,307.23),(1069,3,162.04),(1070,1,292.21);
/*!40000 ALTER TABLE `sleeping_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleeping_room_guest`
--

DROP TABLE IF EXISTS `sleeping_room_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleeping_room_guest` (
  `roomReservationId` int NOT NULL,
  `customerId` int NOT NULL,
  PRIMARY KEY (`roomReservationId`,`customerId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `sleeping_room_guest_ibfk_1` FOREIGN KEY (`roomReservationId`) REFERENCES `sleeping_room_reservation` (`roomReservationId`),
  CONSTRAINT `sleeping_room_guest_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleeping_room_guest`
--

LOCK TABLES `sleeping_room_guest` WRITE;
/*!40000 ALTER TABLE `sleeping_room_guest` DISABLE KEYS */;
INSERT INTO `sleeping_room_guest` VALUES (4,1),(28,1),(66,1),(5,2),(14,2),(21,3),(47,3),(66,3),(67,3),(38,4),(63,4),(68,4),(70,4),(33,6),(61,6),(5,7),(16,7),(19,7),(62,7),(26,8),(34,8),(11,9),(66,9),(6,10),(24,10),(32,10),(39,10),(62,10),(70,10),(23,11),(31,11),(71,11),(14,12),(26,12),(38,12),(65,12),(2,13),(73,13),(34,14),(42,14),(69,14),(71,14),(25,15),(64,15),(29,16),(65,16),(74,16),(16,17),(43,18),(51,18),(3,19),(11,19),(51,19),(17,20),(43,20),(55,20),(72,20),(3,21),(7,21),(20,21),(31,21),(4,22),(26,22),(32,22),(69,22),(56,24),(23,25),(25,25),(44,25),(50,25),(69,25),(1,26),(22,26),(56,26),(15,28),(18,28),(49,28),(66,28),(9,29),(12,29),(27,29),(34,29),(37,29),(3,30),(7,31),(17,31),(69,31),(6,32),(32,32),(49,32),(22,33),(36,33),(30,34),(65,34),(62,35),(7,36),(48,37),(53,37),(58,37),(5,38),(16,38),(36,38),(22,39),(46,39),(1,40),(13,40),(45,40),(55,40),(57,40),(10,41),(27,41),(73,41),(15,42),(18,42),(3,43),(60,43),(2,44),(16,44),(53,44),(8,45),(30,45),(51,45),(47,46),(64,46),(70,46),(41,47),(53,47),(2,48),(40,48),(50,48),(55,48),(60,48),(14,49),(33,49),(41,49),(62,49),(73,49),(53,50),(65,50),(28,51),(71,51),(11,53),(12,53),(46,53),(56,54),(11,55),(34,55),(60,55),(43,56),(14,57),(27,57),(33,57),(8,58),(17,58),(4,59),(21,59),(13,60),(63,60),(75,60),(43,61),(68,62),(36,63),(38,63),(13,64),(71,64),(13,65),(21,65),(35,65),(50,65),(4,66),(21,66),(28,66),(35,66),(54,66),(12,67),(20,67),(55,67),(72,67),(70,68),(73,68),(41,69),(47,69),(49,69),(25,70),(50,70),(57,70),(25,71),(26,71),(35,71),(36,71),(38,71),(60,72),(52,73),(58,73),(63,74),(27,75),(35,75),(56,75),(59,75),(63,75),(72,75);
/*!40000 ALTER TABLE `sleeping_room_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleeping_room_reservation`
--

DROP TABLE IF EXISTS `sleeping_room_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleeping_room_reservation` (
  `roomReservationId` int NOT NULL AUTO_INCREMENT,
  `reservationId` int NOT NULL,
  `roomId` int DEFAULT NULL,
  `numGuests` int DEFAULT NULL,
  `checkInDateTime` datetime DEFAULT NULL,
  `checkOutDateTime` datetime DEFAULT NULL,
  `roomCost` decimal(10,2) DEFAULT NULL,
  `handicapAccess` tinyint(1) DEFAULT NULL,
  `closeToPool` tinyint(1) DEFAULT NULL,
  `closeToRestaurant` tinyint(1) DEFAULT NULL,
  `closeToParking` tinyint(1) DEFAULT NULL,
  `closeToGym` tinyint(1) DEFAULT NULL,
  `smoking` tinyint(1) NOT NULL,
  PRIMARY KEY (`roomReservationId`),
  KEY `fk_sleeproomres_reservation` (`reservationId`),
  KEY `fk_sleeproomres_room` (`roomId`),
  CONSTRAINT `fk_sleeproomres_reservation` FOREIGN KEY (`reservationId`) REFERENCES `reservation` (`reservationId`),
  CONSTRAINT `fk_sleeproomres_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleeping_room_reservation`
--

LOCK TABLES `sleeping_room_reservation` WRITE;
/*!40000 ALTER TABLE `sleeping_room_reservation` DISABLE KEYS */;
INSERT INTO `sleeping_room_reservation` VALUES (1,1,1019,2,'2024-06-29 00:00:00','2024-07-02 00:00:00',546.71,0,0,1,1,0,0),(2,2,1021,3,'2024-05-29 00:00:00','2024-06-03 00:00:00',289.28,1,0,1,1,0,0),(3,3,1013,4,'2024-05-08 00:00:00','2024-05-13 00:00:00',815.68,1,0,0,1,0,1),(4,4,1052,4,'2024-05-25 00:00:00','2024-05-29 00:00:00',641.21,1,1,0,1,0,0),(5,5,1011,3,'2024-02-10 00:00:00','2024-02-12 00:00:00',360.11,1,0,0,0,1,1),(6,6,1052,2,'2024-03-28 00:00:00','2024-03-29 00:00:00',364.89,0,0,1,0,1,0),(7,7,1007,3,'2024-03-12 00:00:00','2024-03-13 00:00:00',478.82,0,1,1,1,1,0),(8,8,1023,2,'2024-05-05 00:00:00','2024-05-06 00:00:00',567.74,0,1,1,1,1,0),(9,9,1004,1,'2024-03-26 00:00:00','2024-03-30 00:00:00',718.34,1,1,1,1,1,1),(10,10,1003,1,'2024-01-29 00:00:00','2024-02-03 00:00:00',541.56,0,1,0,0,0,1),(11,11,1001,4,'2024-02-08 00:00:00','2024-02-09 00:00:00',479.32,1,1,0,0,0,1),(12,12,1014,3,'2024-05-02 00:00:00','2024-05-03 00:00:00',473.96,1,0,1,1,0,0),(13,13,1055,4,'2024-02-05 00:00:00','2024-02-08 00:00:00',885.53,1,0,1,1,1,0),(14,14,1035,4,'2024-04-08 00:00:00','2024-04-11 00:00:00',893.42,0,0,0,0,1,1),(15,15,1059,2,'2024-05-29 00:00:00','2024-06-03 00:00:00',429.75,0,1,0,0,0,1),(16,16,1023,4,'2024-01-18 00:00:00','2024-01-19 00:00:00',217.88,0,0,0,0,1,1),(17,17,1013,3,'2024-02-15 00:00:00','2024-02-19 00:00:00',549.63,1,1,1,1,0,0),(18,18,1025,2,'2024-06-10 00:00:00','2024-06-15 00:00:00',760.68,0,0,0,1,0,1),(19,19,1015,1,'2024-05-18 00:00:00','2024-05-22 00:00:00',578.56,0,0,0,1,0,1),(20,20,1018,2,'2024-01-04 00:00:00','2024-01-09 00:00:00',661.86,1,1,0,0,1,0),(21,21,1069,4,'2024-05-23 00:00:00','2024-05-28 00:00:00',688.20,0,1,1,0,0,0),(22,22,1056,3,'2024-06-23 00:00:00','2024-06-24 00:00:00',665.25,0,0,1,0,1,0),(23,23,1005,2,'2024-03-09 00:00:00','2024-03-14 00:00:00',934.04,0,0,1,1,0,1),(24,24,1026,1,'2024-02-26 00:00:00','2024-02-29 00:00:00',152.24,0,0,1,1,1,0),(25,25,1050,4,'2024-06-08 00:00:00','2024-06-13 00:00:00',684.75,1,0,1,1,1,0),(26,26,1018,4,'2024-04-13 00:00:00','2024-04-18 00:00:00',254.02,1,0,0,1,1,0),(27,27,1001,4,'2024-01-10 00:00:00','2024-01-15 00:00:00',916.02,1,1,0,0,0,1),(28,28,1056,3,'2024-02-22 00:00:00','2024-02-26 00:00:00',258.36,1,1,0,0,0,1),(29,29,1023,1,'2024-04-19 00:00:00','2024-04-23 00:00:00',271.59,0,1,1,1,1,1),(30,30,1011,2,'2024-04-09 00:00:00','2024-04-11 00:00:00',528.23,0,1,1,0,1,1),(31,31,1056,2,'2024-01-23 00:00:00','2024-01-26 00:00:00',908.22,1,0,0,1,0,1),(32,32,1003,3,'2024-06-08 00:00:00','2024-06-10 00:00:00',384.12,0,0,0,0,0,1),(33,33,1007,3,'2024-02-19 00:00:00','2024-02-24 00:00:00',335.97,0,0,1,0,1,1),(34,34,1018,4,'2024-04-29 00:00:00','2024-05-02 00:00:00',623.51,1,1,0,0,0,1),(35,35,1052,4,'2024-01-24 00:00:00','2024-01-29 00:00:00',727.97,0,0,0,0,1,1),(36,36,1001,4,'2024-05-21 00:00:00','2024-05-24 00:00:00',540.13,0,0,0,1,0,0),(37,37,1047,1,'2024-05-11 00:00:00','2024-05-14 00:00:00',642.42,1,1,0,0,1,0),(38,38,1013,4,'2024-03-20 00:00:00','2024-03-21 00:00:00',302.60,0,1,0,1,1,1),(39,39,1020,1,'2024-04-08 00:00:00','2024-04-11 00:00:00',962.66,0,0,1,1,1,1),(40,40,1021,1,'2024-03-19 00:00:00','2024-03-21 00:00:00',901.87,0,1,0,0,0,1),(41,41,1066,3,'2024-03-07 00:00:00','2024-03-09 00:00:00',682.71,0,0,0,1,1,1),(42,42,1065,1,'2024-01-19 00:00:00','2024-01-20 00:00:00',197.69,1,1,0,0,0,1),(43,43,1034,4,'2024-06-15 00:00:00','2024-06-19 00:00:00',360.41,1,1,0,0,1,0),(44,44,1023,1,'2024-02-13 00:00:00','2024-02-16 00:00:00',202.48,0,0,0,0,0,0),(45,45,1010,1,'2024-05-07 00:00:00','2024-05-10 00:00:00',888.02,1,0,0,0,0,0),(46,46,1004,2,'2024-02-11 00:00:00','2024-02-13 00:00:00',786.18,0,1,1,0,1,0),(47,47,1005,3,'2024-05-12 00:00:00','2024-05-14 00:00:00',813.14,1,0,0,1,1,1),(48,48,1001,1,'2024-06-27 00:00:00','2024-06-28 00:00:00',962.49,0,1,1,0,1,0),(49,49,1009,3,'2024-05-02 00:00:00','2024-05-06 00:00:00',629.30,0,0,0,0,1,1),(50,50,1002,4,'2024-01-12 00:00:00','2024-01-15 00:00:00',561.67,0,0,1,0,0,1),(51,51,1031,3,'2024-04-22 00:00:00','2024-04-25 00:00:00',446.09,1,0,0,0,0,1),(52,52,1014,1,'2024-02-26 00:00:00','2024-02-27 00:00:00',670.88,1,0,0,1,1,0),(53,53,1010,4,'2024-03-26 00:00:00','2024-03-30 00:00:00',247.42,0,1,0,1,1,1),(54,54,1069,1,'2024-03-17 00:00:00','2024-03-18 00:00:00',334.77,0,0,0,0,0,0),(55,55,1047,4,'2024-05-30 00:00:00','2024-06-02 00:00:00',920.49,0,0,1,0,0,1),(56,56,1059,4,'2024-03-18 00:00:00','2024-03-22 00:00:00',907.08,1,1,0,1,1,0),(57,57,1017,2,'2024-06-01 00:00:00','2024-06-04 00:00:00',363.16,0,1,0,0,0,0),(58,58,1012,2,'2024-01-27 00:00:00','2024-01-29 00:00:00',261.37,0,1,0,1,0,0),(59,59,1062,1,'2024-02-22 00:00:00','2024-02-23 00:00:00',386.87,0,0,0,0,0,0),(60,60,1007,4,'2024-03-26 00:00:00','2024-03-29 00:00:00',358.42,0,0,0,1,1,0),(61,61,1005,1,'2024-05-23 00:00:00','2024-05-24 00:00:00',158.50,0,0,0,1,1,1),(62,62,1050,4,'2024-04-10 00:00:00','2024-04-15 00:00:00',880.56,0,0,0,1,1,1),(63,63,1028,4,'2024-01-22 00:00:00','2024-01-25 00:00:00',372.43,0,1,1,0,0,1),(64,64,1040,2,'2024-05-15 00:00:00','2024-05-19 00:00:00',914.94,1,1,1,1,0,0),(65,65,1010,4,'2024-05-08 00:00:00','2024-05-13 00:00:00',322.49,0,1,0,0,1,0),(66,66,1040,4,'2024-01-04 00:00:00','2024-01-05 00:00:00',473.04,1,0,0,0,1,1),(67,67,1032,1,'2024-05-11 00:00:00','2024-05-13 00:00:00',324.54,0,0,0,1,1,0),(68,68,1028,2,'2024-01-08 00:00:00','2024-01-09 00:00:00',959.63,0,1,1,1,1,0),(69,69,1035,4,'2024-03-19 00:00:00','2024-03-21 00:00:00',463.67,1,0,0,1,0,0),(70,70,1011,4,'2024-04-19 00:00:00','2024-04-24 00:00:00',577.95,0,1,0,0,1,1),(71,71,1057,4,'2024-03-24 00:00:00','2024-03-29 00:00:00',664.67,0,0,0,0,1,1),(72,72,1035,3,'2024-04-21 00:00:00','2024-04-26 00:00:00',447.67,1,1,1,1,1,1),(73,73,1012,4,'2024-02-16 00:00:00','2024-02-21 00:00:00',883.94,1,1,1,0,1,1),(74,74,1041,1,'2024-06-05 00:00:00','2024-06-10 00:00:00',460.25,0,0,0,0,1,0),(75,75,1056,1,'2024-06-09 00:00:00','2024-06-14 00:00:00',451.32,1,1,1,1,0,0);
/*!40000 ALTER TABLE `sleeping_room_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffId` int NOT NULL AUTO_INCREMENT,
  `staffFirstName` varchar(50) NOT NULL,
  `staffLastName` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'StaffFirst1','StaffLast1','Front Desk'),(2,'StaffFirst2','StaffLast2','Security'),(3,'StaffFirst3','StaffLast3','Maintenance'),(4,'StaffFirst4','StaffLast4','Security'),(5,'StaffFirst5','StaffLast5','Maintenance'),(6,'StaffFirst6','StaffLast6','Maintenance'),(7,'StaffFirst7','StaffLast7','Front Desk'),(8,'StaffFirst8','StaffLast8','Housekeeping'),(9,'StaffFirst9','StaffLast9','Front Desk'),(10,'StaffFirst10','StaffLast10','Front Desk');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_card`
--

DROP TABLE IF EXISTS `staff_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_card` (
  `staffCardNumber` int NOT NULL AUTO_INCREMENT,
  `staffId` int NOT NULL,
  PRIMARY KEY (`staffCardNumber`),
  KEY `fk_staffcard_staff` (`staffId`),
  CONSTRAINT `fk_staffcard_staff` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_card`
--

LOCK TABLES `staff_card` WRITE;
/*!40000 ALTER TABLE `staff_card` DISABLE KEYS */;
INSERT INTO `staff_card` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `staff_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telephone` (
  `telephoneNumber` varchar(15) NOT NULL,
  `roomId` int NOT NULL,
  `outgoingMessage` longblob NOT NULL,
  PRIMARY KEY (`telephoneNumber`),
  KEY `fk_telephone_room` (`roomId`),
  CONSTRAINT `fk_telephone_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephone`
--

LOCK TABLES `telephone` WRITE;
/*!40000 ALTER TABLE `telephone` DISABLE KEYS */;
INSERT INTO `telephone` VALUES ('8005551000.0',1008,_binary 'outgoing_message_1.mp3'),('8005551001.0',1004,_binary 'outgoing_message_2.mp3'),('8005551002.0',1046,_binary 'outgoing_message_3.mp3'),('8005551003.0',1013,_binary 'outgoing_message_4.mp3'),('8005551004.0',1001,_binary 'outgoing_message_5.mp3'),('8005551005.0',1066,_binary 'outgoing_message_6.mp3'),('8005551006.0',1040,_binary 'outgoing_message_7.mp3'),('8005551007.0',1063,_binary 'outgoing_message_8.mp3'),('8005551008.0',1015,_binary 'outgoing_message_9.mp3'),('8005551009.0',1002,_binary 'outgoing_message_10.mp3'),('8005551010.0',1037,_binary 'outgoing_message_11.mp3'),('8005551011.0',1003,_binary 'outgoing_message_12.mp3'),('8005551012.0',1014,_binary 'outgoing_message_13.mp3'),('8005551013.0',1029,_binary 'outgoing_message_14.mp3'),('8005551014.0',1006,_binary 'outgoing_message_15.mp3'),('8005551015.0',1019,_binary 'outgoing_message_16.mp3'),('8005551016.0',1007,_binary 'outgoing_message_17.mp3'),('8005551017.0',1025,_binary 'outgoing_message_18.mp3'),('8005551018.0',1021,_binary 'outgoing_message_19.mp3'),('8005551019.0',1028,_binary 'outgoing_message_20.mp3'),('8005551020.0',1026,_binary 'outgoing_message_21.mp3'),('8005551021.0',1031,_binary 'outgoing_message_22.mp3'),('8005551022.0',1009,_binary 'outgoing_message_23.mp3'),('8005551023.0',1038,_binary 'outgoing_message_24.mp3'),('8005551024.0',1022,_binary 'outgoing_message_25.mp3'),('8005551025.0',1059,_binary 'outgoing_message_26.mp3'),('8005551026.0',1055,_binary 'outgoing_message_27.mp3'),('8005551027.0',1034,_binary 'outgoing_message_28.mp3'),('8005551028.0',1050,_binary 'outgoing_message_29.mp3'),('8005551029.0',1041,_binary 'outgoing_message_30.mp3'),('8005551030.0',1017,_binary 'outgoing_message_31.mp3'),('8005551031.0',1061,_binary 'outgoing_message_32.mp3'),('8005551032.0',1047,_binary 'outgoing_message_33.mp3'),('8005551033.0',1011,_binary 'outgoing_message_34.mp3'),('8005551034.0',1057,_binary 'outgoing_message_35.mp3'),('8005551035.0',1042,_binary 'outgoing_message_36.mp3'),('8005551036.0',1039,_binary 'outgoing_message_37.mp3'),('8005551037.0',1012,_binary 'outgoing_message_38.mp3'),('8005551038.0',1005,_binary 'outgoing_message_39.mp3'),('8005551039.0',1065,_binary 'outgoing_message_40.mp3'),('8005551040.0',1043,_binary 'outgoing_message_41.mp3'),('8005551041.0',1036,_binary 'outgoing_message_42.mp3'),('8005551042.0',1020,_binary 'outgoing_message_43.mp3'),('8005551043.0',1023,_binary 'outgoing_message_44.mp3'),('8005551044.0',1030,_binary 'outgoing_message_45.mp3'),('8005551045.0',1027,_binary 'outgoing_message_46.mp3'),('8005551046.0',1032,_binary 'outgoing_message_47.mp3'),('8005551047.0',1044,_binary 'outgoing_message_48.mp3'),('8005551048.0',1070,_binary 'outgoing_message_49.mp3'),('8005551049.0',1056,_binary 'outgoing_message_50.mp3');
/*!40000 ALTER TABLE `telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionId` int NOT NULL AUTO_INCREMENT,
  `transactionTypeId` int NOT NULL,
  `billingPartyId` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transactionTime` datetime NOT NULL,
  `transactionStatus` int NOT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `fk_transaction_transactiontype` (`transactionTypeId`),
  KEY `fk_transaction_transactionstatus` (`transactionStatus`),
  CONSTRAINT `fk_transaction_transactionstatus` FOREIGN KEY (`transactionStatus`) REFERENCES `transaction_status` (`statusId`),
  CONSTRAINT `fk_transaction_transactiontype` FOREIGN KEY (`transactionTypeId`) REFERENCES `transaction_type` (`transactionTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,50,1369.43,'2024-06-03 15:34:00',3),(2,1,24,564.73,'2024-03-26 18:10:21',3),(3,1,52,1397.84,'2024-01-13 11:23:42',2),(4,1,64,255.91,'2024-01-17 06:41:21',1),(5,1,54,1412.34,'2024-05-18 04:51:46',2),(6,1,2,429.39,'2024-01-10 21:48:45',3),(7,1,28,444.33,'2024-02-22 19:45:47',3),(8,1,27,1481.60,'2024-02-21 01:11:59',2),(9,1,37,1053.05,'2024-01-23 14:09:50',2),(10,1,47,1053.90,'2024-02-11 17:13:46',3),(11,1,50,822.75,'2024-06-07 19:28:22',3),(12,1,35,1346.15,'2024-06-19 13:08:26',3),(13,1,8,628.20,'2024-05-11 19:32:06',1),(14,1,33,436.00,'2024-03-31 01:18:46',2),(15,1,23,650.62,'2024-04-20 23:46:06',3),(16,1,11,831.14,'2024-04-19 13:10:47',1),(17,1,52,1121.98,'2024-04-14 05:40:27',1),(18,1,27,342.05,'2024-02-17 20:27:15',2),(19,1,44,917.92,'2024-05-29 09:49:18',1),(20,1,47,529.55,'2024-02-07 08:45:59',1),(21,1,37,323.92,'2024-05-31 07:51:29',2),(22,1,13,1286.90,'2024-03-23 19:10:52',1),(23,1,36,310.22,'2024-01-28 03:50:32',2),(24,1,60,1413.67,'2024-04-30 23:59:54',1),(25,1,67,937.04,'2024-01-02 14:21:19',1),(26,1,72,464.43,'2024-03-18 07:26:26',3),(27,1,7,1300.96,'2024-05-02 05:45:13',1),(28,1,67,1156.10,'2024-06-15 19:30:21',1),(29,1,27,259.79,'2024-06-14 13:11:21',3),(30,1,56,1025.41,'2024-05-09 15:52:41',3),(31,1,16,386.28,'2024-06-01 21:04:19',3),(32,1,49,735.79,'2024-06-23 03:29:06',3),(33,1,20,713.05,'2024-04-10 18:12:04',1),(34,1,72,1494.70,'2024-05-14 11:53:44',3),(35,1,37,1116.44,'2024-01-05 10:28:46',1),(36,1,15,666.98,'2024-05-19 09:09:35',2),(37,1,32,671.54,'2024-01-17 05:59:54',2),(38,1,46,984.68,'2024-02-14 17:51:24',3),(39,1,56,872.05,'2024-02-02 01:37:35',1),(40,1,2,372.53,'2024-06-03 12:56:22',3),(41,1,50,430.46,'2024-02-28 09:17:08',2),(42,1,42,722.47,'2024-05-24 04:10:30',1),(43,1,38,1468.72,'2024-05-05 00:38:38',1),(44,1,37,1250.11,'2024-01-25 06:34:37',3),(45,1,37,922.43,'2024-05-18 18:05:52',3),(46,1,66,992.74,'2024-05-04 10:08:01',1),(47,1,49,1443.30,'2024-03-02 00:28:22',1),(48,1,20,292.81,'2024-06-26 22:27:39',2),(49,1,22,796.60,'2024-01-17 04:53:59',1),(50,1,56,1431.96,'2024-03-09 04:09:51',2),(51,1,24,1170.32,'2024-04-19 14:11:23',1),(52,1,26,1312.82,'2024-03-11 23:52:48',1),(53,1,12,644.75,'2024-06-06 13:29:14',2),(54,1,63,272.82,'2024-01-18 17:52:21',3),(55,1,66,934.60,'2024-02-17 17:14:24',1),(56,1,25,364.97,'2024-03-01 06:01:56',1),(57,1,55,1364.20,'2024-02-08 17:53:40',1),(58,1,68,979.05,'2024-05-17 17:56:22',1),(59,1,19,1457.40,'2024-03-04 03:32:19',3),(60,1,1,853.97,'2024-05-26 11:28:25',1),(61,1,32,1039.89,'2024-03-06 15:04:07',2),(62,1,66,220.71,'2024-05-10 17:12:07',3),(63,1,69,1026.94,'2024-05-21 11:39:23',2),(64,1,10,1307.57,'2024-03-20 08:53:20',1),(65,1,25,313.51,'2024-03-28 23:46:57',2),(66,1,50,743.65,'2024-05-09 21:59:57',3),(67,1,53,1397.94,'2024-04-11 07:18:38',3),(68,1,28,1475.02,'2024-05-30 11:59:46',3),(69,1,46,687.29,'2024-06-05 03:51:39',2),(70,1,27,319.88,'2024-03-19 12:52:00',2),(71,1,1,1045.86,'2024-05-25 15:20:12',3),(72,1,14,227.67,'2024-05-31 00:38:28',3),(73,1,44,998.07,'2024-02-07 06:32:58',1),(74,1,39,1441.02,'2024-05-22 10:32:56',1),(75,1,18,327.93,'2024-03-03 04:48:30',1),(76,1,63,1286.56,'2024-04-07 01:19:33',2),(77,1,42,715.52,'2024-05-25 14:18:48',1),(78,1,70,484.04,'2024-03-26 07:15:40',3),(79,1,16,1040.99,'2024-02-26 03:35:34',2),(80,1,28,597.53,'2024-04-24 20:46:13',2),(81,1,55,477.67,'2024-06-12 05:49:12',3),(82,1,16,322.22,'2024-02-03 20:01:24',1),(83,1,72,1170.80,'2024-06-02 05:32:57',2),(84,1,67,555.80,'2024-04-05 11:19:00',1),(85,1,67,341.24,'2024-06-02 07:54:26',3),(86,1,1,1166.37,'2024-06-01 08:53:02',2),(87,1,21,1421.13,'2024-01-28 21:44:48',3),(88,1,9,1406.63,'2024-06-21 23:19:05',3),(89,1,45,1367.59,'2024-04-03 10:37:28',3),(90,1,26,720.56,'2024-04-23 14:43:06',1),(91,1,59,1188.22,'2024-05-19 12:00:24',3),(92,1,57,1348.38,'2024-05-10 23:56:47',1),(93,1,51,893.65,'2024-05-17 17:29:32',1),(94,1,28,1255.87,'2024-01-11 00:26:23',3),(95,1,20,266.21,'2024-04-17 06:27:39',2),(96,1,68,434.56,'2024-05-01 11:49:50',3),(97,1,2,886.16,'2024-01-19 11:01:17',1),(98,1,5,1076.37,'2024-01-24 09:08:24',1),(99,1,44,570.72,'2024-01-13 12:09:10',3),(100,1,21,305.88,'2024-03-06 11:26:01',3),(101,1,57,1181.71,'2024-06-15 19:37:57',3),(102,1,51,587.30,'2024-05-03 08:12:03',1),(103,1,54,312.17,'2024-05-23 20:31:29',3),(104,1,30,1423.74,'2024-02-25 18:41:45',2),(105,1,36,966.23,'2024-01-12 20:51:35',3),(106,1,7,1113.33,'2024-06-20 06:36:36',3),(107,1,12,997.69,'2024-03-11 10:22:56',1),(108,1,72,683.63,'2024-03-14 11:08:38',3),(109,1,49,306.32,'2024-06-10 19:52:45',1),(110,1,67,455.67,'2024-06-16 19:40:10',2),(111,1,58,340.27,'2024-06-26 21:33:34',3),(112,1,61,880.91,'2024-05-14 01:39:32',1),(113,1,25,832.82,'2024-05-03 23:50:14',2),(114,1,65,717.15,'2024-01-20 08:39:44',1),(115,1,18,867.52,'2024-05-18 15:28:09',1),(116,1,63,992.59,'2024-05-21 21:06:53',2),(117,1,75,752.79,'2024-01-22 23:13:26',2),(118,1,17,388.64,'2024-02-15 23:27:53',2),(119,1,75,1255.73,'2024-06-22 00:49:25',1),(120,1,44,820.67,'2024-05-07 10:42:33',2),(121,1,70,1138.02,'2024-05-29 11:58:10',2),(122,1,27,898.99,'2024-06-15 10:32:05',2),(123,1,5,408.35,'2024-03-30 21:39:42',2),(124,1,43,459.70,'2024-04-13 13:59:42',2),(125,1,60,1430.46,'2024-02-12 12:29:51',3),(126,1,74,1093.17,'2024-03-13 20:10:32',2),(127,1,14,775.79,'2024-03-25 09:39:46',3),(128,1,36,698.46,'2024-01-29 08:57:46',1),(129,1,20,548.90,'2024-04-10 13:02:21',2),(130,1,32,786.16,'2024-04-15 07:18:28',1),(131,1,23,1482.48,'2024-05-06 05:37:54',2),(132,1,24,799.51,'2024-05-14 19:13:00',2),(133,1,30,826.72,'2024-04-17 12:15:25',2),(134,1,43,320.79,'2024-03-27 23:38:38',2),(135,1,52,879.23,'2024-01-21 10:22:55',2),(136,1,59,1487.91,'2024-05-16 01:39:21',1),(137,1,67,1419.46,'2024-01-31 07:03:24',3),(138,1,54,881.18,'2024-04-24 02:51:32',3),(139,1,37,1125.60,'2024-01-17 12:57:45',2),(140,1,54,1150.78,'2024-05-14 09:32:09',3),(141,1,39,1471.71,'2024-06-17 07:02:20',3),(142,1,68,1152.29,'2024-04-24 00:34:56',3),(143,1,46,1072.51,'2024-02-04 00:47:44',2),(144,1,73,1480.82,'2024-03-14 16:56:03',1),(145,1,24,1237.47,'2024-06-30 11:17:57',2),(146,1,42,760.42,'2024-02-07 14:04:45',2),(147,1,18,503.95,'2024-03-11 07:37:00',1),(148,1,9,1093.10,'2024-02-08 00:38:48',3),(149,1,13,1122.99,'2024-05-20 10:32:10',2),(150,1,45,1266.41,'2024-04-12 16:47:28',1),(151,5,75,17.57,'2024-01-21 10:43:19',1),(152,4,40,92.36,'2024-04-15 22:04:37',1),(153,5,43,224.88,'2024-04-13 04:56:50',1),(154,3,31,113.58,'2024-02-25 11:43:42',3),(155,4,9,108.12,'2024-01-30 23:00:18',2),(156,2,3,219.11,'2024-06-11 14:17:28',3),(157,5,65,80.30,'2024-04-19 21:12:40',3),(158,4,73,119.53,'2024-02-01 17:04:39',1),(159,5,47,263.14,'2024-01-28 04:05:59',1),(160,2,26,53.45,'2024-05-09 15:27:07',2),(161,4,1,16.37,'2024-05-20 05:15:04',2),(162,4,74,50.30,'2024-03-27 01:02:20',1),(163,2,12,287.43,'2024-01-13 12:26:40',3),(164,2,59,240.59,'2024-01-27 17:39:23',1),(165,2,38,95.71,'2024-01-19 07:05:46',3),(166,4,46,241.25,'2024-06-04 04:23:53',2),(167,3,23,134.46,'2024-01-02 06:10:01',2),(168,2,14,249.54,'2024-04-28 22:03:01',2),(169,2,52,116.53,'2024-02-16 21:48:21',1),(170,5,33,126.97,'2024-05-09 11:44:08',2),(171,5,34,75.19,'2024-04-22 13:39:47',1),(172,5,31,30.69,'2024-03-28 14:57:57',3),(173,4,55,293.04,'2024-03-18 05:27:19',1),(174,4,58,186.68,'2024-05-12 05:04:02',2),(175,5,14,109.30,'2024-02-13 19:12:20',2),(176,4,61,280.75,'2024-02-22 22:18:18',3),(177,4,55,289.16,'2024-05-15 23:35:45',2),(178,5,26,136.50,'2024-05-11 09:25:23',1),(179,5,57,297.10,'2024-01-05 21:14:31',1),(180,2,63,147.54,'2024-03-22 20:13:31',3),(181,2,64,63.31,'2024-04-19 09:41:02',1),(182,2,67,232.45,'2024-06-01 11:17:39',2),(183,3,1,35.79,'2024-03-04 15:48:38',2),(184,4,8,251.55,'2024-04-28 08:31:59',2),(185,5,20,181.60,'2024-05-21 09:26:51',1),(186,3,70,95.73,'2024-05-21 09:33:08',2),(187,2,21,119.28,'2024-02-06 13:58:13',1),(188,3,73,175.58,'2024-06-22 23:36:43',1),(189,4,47,251.79,'2024-04-04 03:15:22',3),(190,5,3,40.46,'2024-04-23 02:15:31',1),(191,2,23,220.46,'2024-06-26 21:42:08',1),(192,5,4,171.17,'2024-01-22 11:39:20',2),(193,4,55,295.16,'2024-05-27 02:53:21',3),(194,2,34,275.66,'2024-02-04 19:52:30',1),(195,2,12,66.20,'2024-06-30 12:22:50',2),(196,2,62,189.46,'2024-05-14 05:56:33',1),(197,4,73,70.97,'2024-02-22 08:02:03',3),(198,5,34,16.52,'2024-01-10 05:56:52',2),(199,5,30,58.04,'2024-02-22 23:46:11',2),(200,5,8,75.46,'2024-06-04 01:00:55',1),(201,1,1,546.71,'2024-02-26 04:33:29',3),(202,1,2,289.28,'2024-06-11 11:20:46',3),(203,1,3,815.68,'2024-01-02 15:02:13',3),(204,1,4,641.21,'2024-01-10 02:13:51',3),(205,1,5,360.11,'2024-03-03 08:00:18',3),(206,1,6,364.89,'2024-05-15 01:37:28',3),(207,1,7,478.82,'2024-05-08 12:55:20',3),(208,1,8,567.74,'2024-06-27 02:04:46',3),(209,1,9,718.34,'2024-05-11 21:54:16',3),(210,1,10,541.56,'2024-03-15 23:30:45',3),(211,1,11,479.32,'2024-05-21 05:48:05',3),(212,1,12,473.96,'2024-01-30 18:33:55',3),(213,1,13,885.53,'2024-03-26 07:19:27',3),(214,1,14,893.42,'2024-06-09 09:17:44',3),(215,1,15,429.75,'2024-06-15 02:55:41',3),(216,1,16,217.88,'2024-06-25 05:25:11',3),(217,1,17,549.63,'2024-03-29 10:31:16',3),(218,1,18,760.68,'2024-05-12 16:14:59',3),(219,1,19,578.56,'2024-01-22 22:57:17',3),(220,1,20,661.86,'2024-02-20 04:54:08',3),(221,1,21,688.20,'2024-03-05 18:04:32',3),(222,1,22,665.25,'2024-06-26 00:50:06',3),(223,1,23,934.04,'2024-05-11 20:29:51',3),(224,1,24,152.24,'2024-02-16 13:00:52',3),(225,1,25,684.75,'2024-02-06 02:06:00',3),(226,1,26,254.02,'2024-04-10 02:02:07',3),(227,1,27,916.02,'2024-02-16 13:24:15',3),(228,1,28,258.36,'2024-01-19 00:28:45',3),(229,1,29,271.59,'2024-04-25 20:43:00',3),(230,1,30,528.23,'2024-03-09 11:22:11',3),(231,1,31,908.22,'2024-05-16 22:08:46',3),(232,1,32,384.12,'2024-05-22 09:33:22',3),(233,1,33,335.97,'2024-01-04 01:41:28',3),(234,1,34,623.51,'2024-04-21 03:01:59',3),(235,1,35,727.97,'2024-01-03 03:05:53',3),(236,1,36,540.13,'2024-06-20 12:08:51',3),(237,1,37,642.42,'2024-03-02 05:42:03',3),(238,1,38,302.60,'2024-02-23 04:58:52',3),(239,1,39,962.66,'2024-06-16 02:46:45',3),(240,1,40,901.87,'2024-04-01 21:34:13',3),(241,1,41,682.71,'2024-05-12 12:47:47',3),(242,1,42,197.69,'2024-01-08 04:03:19',3),(243,1,43,360.41,'2024-05-06 13:11:34',3),(244,1,44,202.48,'2024-03-02 00:37:23',3),(245,1,45,888.02,'2024-04-18 22:26:59',3),(246,1,46,786.18,'2024-02-22 14:41:27',3),(247,1,47,813.14,'2024-01-21 05:25:26',3),(248,1,48,962.49,'2024-04-11 23:17:46',3),(249,1,49,629.30,'2024-05-14 03:07:13',3),(250,1,50,561.67,'2024-05-23 22:35:09',3),(251,1,51,446.09,'2024-01-21 10:32:14',3),(252,1,52,670.88,'2024-02-12 16:08:59',3),(253,1,53,247.42,'2024-02-25 10:40:29',3),(254,1,54,334.77,'2024-03-31 03:49:12',3),(255,1,55,920.49,'2024-04-20 09:51:44',3),(256,1,56,907.08,'2024-06-05 01:34:05',3),(257,1,57,363.16,'2024-01-02 05:52:02',3),(258,1,58,261.37,'2024-05-28 15:35:56',3),(259,1,59,386.87,'2024-06-27 15:50:11',3),(260,1,60,358.42,'2024-01-09 07:29:08',3),(261,1,61,158.50,'2024-04-11 20:46:32',3),(262,1,62,880.56,'2024-02-09 15:51:35',3),(263,1,63,372.43,'2024-04-02 15:56:48',3),(264,1,64,914.94,'2024-01-18 11:30:14',3),(265,1,65,322.49,'2024-05-14 09:04:10',3),(266,1,66,473.04,'2024-02-10 19:58:10',3),(267,1,67,324.54,'2024-06-22 19:03:47',3),(268,1,68,959.63,'2024-05-16 06:14:53',3),(269,1,69,463.67,'2024-05-19 21:48:16',3),(270,1,70,577.95,'2024-06-19 12:06:14',3),(271,1,71,664.67,'2024-05-25 11:02:18',3),(272,1,72,447.67,'2024-02-13 16:41:18',3),(273,1,73,883.94,'2024-05-15 07:48:26',3),(274,1,74,460.25,'2024-04-11 16:41:47',3),(275,1,75,451.32,'2024-06-18 10:05:03',3),(276,1,76,1184.89,'2024-04-09 11:35:17',3),(277,1,77,1182.84,'2024-04-06 22:30:36',3),(278,1,78,719.91,'2024-04-27 23:37:24',3),(279,1,79,1161.22,'2024-01-25 16:37:27',3),(280,1,80,1374.89,'2024-02-20 13:00:22',3),(281,1,81,1288.06,'2024-03-25 10:42:49',3),(282,1,82,1323.11,'2024-01-18 11:18:34',3),(283,1,83,1166.63,'2024-05-10 18:08:20',3),(284,1,84,1078.17,'2024-02-18 06:26:08',3),(285,1,85,819.18,'2024-05-25 13:57:34',3),(286,1,86,872.88,'2024-06-27 06:16:33',3),(287,1,87,1145.91,'2024-06-25 15:46:08',3),(288,1,88,920.23,'2024-05-31 08:01:23',3),(289,1,89,1219.60,'2024-03-23 06:31:37',3),(290,1,90,1321.29,'2024-05-25 08:46:02',3),(291,1,91,746.24,'2024-03-15 03:41:54',3),(292,1,92,665.69,'2024-02-06 11:34:53',3),(293,1,93,1321.79,'2024-05-27 02:23:59',3),(294,1,94,913.13,'2024-06-09 20:55:28',3),(295,1,95,644.39,'2024-05-28 05:45:43',3),(296,1,96,363.90,'2024-04-15 19:03:06',3),(297,1,97,1070.42,'2024-05-23 07:06:29',3),(298,1,98,688.13,'2024-04-19 17:43:40',3),(299,1,99,503.56,'2024-02-19 21:56:55',3),(300,1,100,1383.27,'2024-02-18 04:07:41',3),(301,1,101,1449.47,'2024-04-15 15:04:08',3),(302,1,102,857.07,'2024-05-02 19:41:21',3),(303,1,103,1423.80,'2024-05-28 09:30:46',3),(304,1,104,795.07,'2024-05-12 06:01:16',3),(305,1,105,837.99,'2024-05-25 02:37:44',3),(306,1,106,575.86,'2024-03-31 09:31:17',3),(307,1,107,1052.38,'2024-01-13 23:28:28',3),(308,1,108,651.81,'2024-02-19 15:35:39',3),(309,1,109,907.81,'2024-03-18 19:11:39',3),(310,1,110,359.58,'2024-02-03 12:40:44',3),(311,1,111,1345.85,'2024-01-04 04:43:26',3),(312,1,112,476.01,'2024-01-29 07:21:04',3),(313,1,113,1138.98,'2024-02-02 01:58:03',3),(314,1,114,1435.43,'2024-04-27 14:50:38',3),(315,1,115,438.04,'2024-03-08 22:36:39',3),(316,1,116,1004.78,'2024-05-27 23:14:05',3),(317,1,117,1026.28,'2024-05-07 04:43:09',3),(318,1,118,640.06,'2024-02-07 13:16:12',3),(319,1,119,710.59,'2024-04-10 07:12:55',3),(320,1,120,1329.64,'2024-05-05 00:30:57',3),(321,1,121,725.54,'2024-04-11 21:11:53',3),(322,1,122,512.63,'2024-04-01 05:21:14',3),(323,1,123,662.55,'2024-03-21 08:17:02',3),(324,1,124,1082.79,'2024-01-13 10:17:14',3),(325,1,125,984.15,'2024-06-23 06:03:16',3),(326,1,126,721.10,'2024-01-03 11:49:04',3),(327,1,127,308.49,'2024-03-02 03:27:40',3),(328,1,128,1160.97,'2024-03-26 13:28:07',3),(329,1,129,839.98,'2024-03-23 02:25:25',3),(330,1,130,1237.51,'2024-03-06 05:20:49',3),(331,1,131,831.27,'2024-02-28 03:07:54',3),(332,1,132,1064.20,'2024-04-30 22:35:56',3),(333,1,133,853.73,'2024-01-15 12:29:48',3),(334,1,134,333.51,'2024-01-24 13:46:32',3),(335,1,135,555.35,'2024-05-20 07:42:07',3),(336,1,136,449.59,'2024-05-01 17:12:55',3),(337,1,137,816.49,'2024-01-30 09:15:44',3),(338,1,138,1121.43,'2024-06-27 04:55:43',3),(339,1,139,1264.56,'2024-03-02 19:48:27',3),(340,1,140,758.14,'2024-06-14 01:10:14',3),(341,1,141,1273.57,'2024-01-27 20:27:55',3),(342,1,142,667.34,'2024-03-12 11:07:08',3),(343,1,143,357.02,'2024-01-13 03:08:57',3),(344,1,144,1219.41,'2024-05-29 17:52:17',3),(345,1,145,330.56,'2024-02-22 18:53:30',3),(346,1,146,414.86,'2024-02-15 13:09:52',3),(347,1,147,566.21,'2024-04-03 12:33:03',3),(348,1,148,304.88,'2024-04-16 19:49:22',3),(349,1,149,1467.82,'2024-06-10 15:57:55',3),(350,1,150,1438.18,'2024-02-05 21:34:32',3);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_status`
--

DROP TABLE IF EXISTS `transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_status` (
  `statusId` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(31) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_status`
--

LOCK TABLES `transaction_status` WRITE;
/*!40000 ALTER TABLE `transaction_status` DISABLE KEYS */;
INSERT INTO `transaction_status` VALUES (1,'Completed'),(2,'Pending'),(3,'Failed');
/*!40000 ALTER TABLE `transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `transactionTypeId` int NOT NULL AUTO_INCREMENT,
  `transactionTypeName` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transactionTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'Room Reservation','Cost associated with room reservations'),(2,'Restaurant','Food and beverage charges from the hotel restaurant'),(3,'Gift Shop','Purchases made from the hotel gift shop'),(4,'Event Fee','Fees related to events hosted at the hotel'),(5,'Room Service','In-room dining and services');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wing`
--

DROP TABLE IF EXISTS `wing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wing` (
  `wingId` int NOT NULL AUTO_INCREMENT,
  `buildingId` int NOT NULL,
  `wingName` varchar(50) NOT NULL,
  `wingDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`wingId`),
  KEY `fk_wing_building` (`buildingId`),
  CONSTRAINT `fk_wing_building` FOREIGN KEY (`buildingId`) REFERENCES `building` (`buildingId`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wing`
--

LOCK TABLES `wing` WRITE;
/*!40000 ALTER TABLE `wing` DISABLE KEYS */;
INSERT INTO `wing` VALUES (301,201,'North Wing','Near the main lobby'),(302,201,'South Wing','Facing the garden'),(303,202,'East Wing','Close to the spa'),(304,203,'West Wing','Overlooks the city'),(305,204,'Main Wing','Central access to all amenities');
/*!40000 ALTER TABLE `wing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 19:15:02
/*