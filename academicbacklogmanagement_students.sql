-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: academicbacklogmanagement
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `roll_number` varchar(15) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `enrollment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `roll_number` (`roll_number`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'21691A28B1','Aarav Sharma','21691a28b1@mits.ac.in','9876543210',1,'2024-11-28 14:33:25'),(2,'21691A28B2','Vanya Gupta','21691a28b2@mits.ac.in','9887654321',2,'2024-11-28 14:33:25'),(3,'21691A28B3','Ishaan Patel','21691a28b3@mits.ac.in','9871234567',1,'2024-11-28 14:33:25'),(4,'21691A28B4','Ananya Verma','21691a28b4@mits.ac.in','9876543201',3,'2024-11-28 14:33:25'),(5,'21691A28B5','Saanvi Rao','21691a28b5@mits.ac.in','9880123456',2,'2024-11-28 14:33:25'),(6,'21691A28B6','Aditya Mehta','21691a28b6@mits.ac.in','9873124560',1,'2024-11-28 14:33:25'),(7,'21691A28B7','Ayesha Khan','21691a28b7@mits.ac.in','9812345678',3,'2024-11-28 14:33:25'),(8,'21691A28B8','Rohit Yadav','21691a28b8@mits.ac.in','9912345670',2,'2024-11-28 14:33:25'),(9,'21691A28B9','Pooja Reddy','21691a28b9@mits.ac.in','9945678901',1,'2024-11-28 14:33:25'),(10,'21691A28B10','Manish Kumar','21691a28b10@mits.ac.in','9934567890',2,'2024-11-28 14:33:25'),(11,'21691A28B11','Shivani Singh','21691a28b11@mits.ac.in','9879876543',3,'2024-11-28 14:33:25'),(12,'21691A28B12','Karan Bhatia','21691a28b12@mits.ac.in','9988776655',1,'2024-11-28 14:33:25'),(13,'21691A28B13','Neha Joshi','21691a28b13@mits.ac.in','9812345671',3,'2024-11-28 14:33:25'),(14,'21691A28B14','Rahul Desai','21691a28b14@mits.ac.in','9954321876',2,'2024-11-28 14:33:25'),(15,'21691A28B15','Tanya Kapoor','21691a28b15@mits.ac.in','9876543299',1,'2024-11-28 14:33:25'),(16,'21691A28B16','Ravi Gupta','21691a28b16@mits.ac.in','9832145690',2,'2024-11-28 14:33:25'),(17,'21691A28B17','Swara Pandey','21691a28b17@mits.ac.in','9812345698',3,'2024-11-28 14:33:25'),(18,'21691A28B18','Arjun Soni','21691a28b18@mits.ac.in','9876543212',1,'2024-11-28 14:33:25'),(19,'21691A28B19','Simran Choudhary','21691a28b19@mits.ac.in','9812345700',2,'2024-11-28 14:33:25'),(20,'21691A28B20','Devika Thakur','21691a28b20@mits.ac.in','9932145678',3,'2024-11-28 14:33:25');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 23:46:37
