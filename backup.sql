-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tickets
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Nicolas Casas'),(2,'Hugo Lopez'),(3,'Ivan Rodriguez'),(4,'Juan Ramirez');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'SOPORTE');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'cpu');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problema`
--

DROP TABLE IF EXISTS `problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problema`
--

LOCK TABLES `problema` WRITE;
/*!40000 ALTER TABLE `problema` DISABLE KEYS */;
INSERT INTO `problema` VALUES (1,'S.U.A punto de venta'),(2,'switch'),(3,'cpu');
/*!40000 ALTER TABLE `problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'central'),(2,'mololoa'),(3,'juan escutia'),(4,'plaza'),(5,'la cruz'),(6,'valle'),(7,'del sol'),(8,'xalisco'),(9,'abarrotes'),(10,'santiago');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `folio` varchar(20) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `usuario` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `ip_Equipo` varchar(15) DEFAULT NULL,
  `falla_Real` text DEFAULT NULL,
  `causa` text DEFAULT NULL,
  `recomendacion` text DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `equipo` int(11) DEFAULT NULL,
  `estatus` enum('ABIERTO','CERRADO') DEFAULT 'ABIERTO',
  `modo` enum('PRESENCIAL','REMOTO') DEFAULT NULL,
  `atendio` int(11) DEFAULT NULL,
  `turno` enum('MATUTINO','VESPERTINO') DEFAULT NULL,
  `error_Sucursal` enum('si','no') DEFAULT NULL,
  `tiempo_Solucion` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `problema` int(11) DEFAULT NULL,
  `fecha_Cerrado` date DEFAULT NULL,
  `hora_Cerrado` time DEFAULT NULL,
  `hora_Abierto` time DEFAULT NULL,
  `fecha_Abierto` date DEFAULT NULL,
  PRIMARY KEY (`folio`),
  KEY `sucursal_FK` (`sucursal`),
  KEY `atendio_FK` (`atendio`),
  KEY `area_FK` (`area`),
  KEY `equipo_FK` (`equipo`),
  KEY `problema_FK` (`problema`),
  CONSTRAINT `area_FK` FOREIGN KEY (`area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `atendio_FK` FOREIGN KEY (`atendio`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipo_FK` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `problema_FK` FOREIGN KEY (`problema`) REFERENCES `problema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sucursal_FK` FOREIGN KEY (`sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('SF1307122519',1,'javier ibarra','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'12:25:31','2025-07-13'),('SF1307132723',1,'IVAN UNUJUSA','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:27:09','2025-07-13'),('SF1307132763',1,'roberto teto pa','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:27:34','2025-07-13'),('SF1307132790',1,'benito camelo','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:27:22','2025-07-13'),('SF1307133414',1,'roberto teto pa','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:34:44','2025-07-13'),('SF1307133482',1,'roberto teto pa','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:34:42','2025-07-13'),('SF1307133490',1,'juan madrigal','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:34:52','2025-07-13'),('SF1307133516',1,'esqueletorn','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:35:46','2025-07-13'),('SF1307133533',1,'estiven mensin','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:35:00','2025-07-13'),('SF1307133539',1,'pakistanie','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:35:51','2025-07-13'),('SF1307133582',1,'tropo teton','3112552522','no puedo tener dos ventanas abiertas del sua','192.168.25.10',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:35:42','2025-07-13'),('SF1407134798',1,'benito camelo','3111322514','Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius omnis doloribus iusto? Ex accusantium soluta voluptatem beatae obcaecati nihil ducimus consectetur atque ipsa possimus. At repudiandae possimus eaque itaque excepturi.','192.168.254.197',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'13:47:05','2025-07-14');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-14 14:34:14
