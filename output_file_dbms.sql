-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: madhav
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `Society_Enrollment_Count`
--

DROP TABLE IF EXISTS `Society_Enrollment_Count`;
/*!50001 DROP VIEW IF EXISTS `Society_Enrollment_Count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Society_Enrollment_Count` AS SELECT 
 1 AS `Society_Name`,
 1 AS `Total_Students_Enrolled`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `Roll_No` char(6) NOT NULL,
  `Society_ID` char(6) NOT NULL,
  `Date_of_Enrollment` date DEFAULT NULL,
  `Enrollment_Fees_Paid` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`Roll_No`),
  KEY `sil` (`Society_ID`),
  CONSTRAINT `sil` FOREIGN KEY (`Society_ID`) REFERENCES `society` (`Society_ID`),
  CONSTRAINT `sr1` FOREIGN KEY (`Roll_No`) REFERENCES `student` (`Roll_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES ('123','S00001','2018-01-15','yes'),('124','S00002','2024-05-05','yes'),('125','S00003','2018-01-02','no'),('126','S00004','2024-10-16','no'),('127','S00005','2024-10-17','yes'),('128','S00001','2018-01-15','no'),('129','S00002','2024-05-05','yes'),('130','S00003','2018-01-02','yes');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society`
--

DROP TABLE IF EXISTS `society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `society` (
  `Society_ID` char(6) NOT NULL,
  `Society_Name` enum('QuickSort','NCC','BrushStrokes','FinGen','Enactus') DEFAULT NULL,
  `Mentor_Name` varchar(20) NOT NULL,
  `Total_Seats` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Society_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society`
--

LOCK TABLES `society` WRITE;
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` VALUES ('S00001','QuickSort','Simran Lochab',55),('S00002','NCC','Priya Patel',66),('S00003','BrushStrokes','Aarav Gupta',44),('S00004','FinGen','Kriti Singh',50),('S00005','Enactus','Ananya Mishra',61);
/*!40000 ALTER TABLE `society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Roll_No` char(6) NOT NULL,
  `Student_Name` varchar(20) NOT NULL,
  `Course` enum('Computer Science','Botany','Physics','Electronics') DEFAULT NULL,
  `Date_of_Birth` date NOT NULL,
  `Mobile_number` varchar(15) DEFAULT '9999999999',
  PRIMARY KEY (`Roll_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('123','Madhav Agarwal','Computer Science','2004-06-24','9999999999'),('124','Sushant Mundepi','Computer Science','2004-08-14','9999999999'),('125','Shiva Marshall','Botany','2004-08-18','9999999999'),('126','Shivam Gangwar','Physics','2004-03-21','9999999999'),('127','Khushi Chillar','Electronics','2006-05-01','9999999999'),('128','Jiya Sharma','Botany','2005-02-24','9999999999'),('129','Nikhil Jangid','Physics','2003-01-05','9999999999'),('130','Satyam Dubey','Computer Science','2004-09-16','9999999999'),('131','Munender Singh','Physics','2005-02-17','9999999999');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Society_Enrollment_Count`
--

/*!50001 DROP VIEW IF EXISTS `Society_Enrollment_Count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Society_Enrollment_Count` AS select `soc`.`Society_Name` AS `Society_Name`,count(`e`.`Roll_No`) AS `Total_Students_Enrolled` from (`society` `soc` left join `enrollment` `e` on((`soc`.`Society_ID` = `e`.`Society_ID`))) group by `soc`.`Society_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14  8:12:24
