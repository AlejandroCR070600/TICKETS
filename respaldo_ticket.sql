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
  `puesto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (7,'Manuel Jaime',2),(8,'Juan Ramirez',5),(9,'Nicolas Casas',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (2,'Soporte'),(3,'Redes e Infraestructura'),(4,'Sistemas'),(5,'Mantenimiento'),(6,'Adquisiciones'),(7,'TICKET MAL INGRESADO');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (2,'ACCES POINT'),(3,'ANTENA DE COMUNICACION'),(4,'ANTENA INALAMBRICA'),(5,'CAJON DE DINERO'),(6,'SMARTPHONE'),(7,'CHECADOR DE ROSTRO'),(8,'CHECADOR DE HUELLA'),(9,'COMUNICACION VPN'),(10,'CONTACTOS ELECTRICOS'),(11,'CPU'),(12,'DVR'),(13,'ESCANNER'),(14,'EXTENSION TELEFONICA O PAP'),(15,'FUENTE DE PODER'),(16,'HUB'),(17,'IMPRESORA DE TICKETS'),(18,'IMPRESORA HP-BROTHER'),(19,'IMPRESORA EPSON(OFICINAS)'),(20,'LAPTOP'),(21,'PLANTA ELECTRICA'),(22,'MICROSOFT OFFICE'),(23,'MODEM'),(24,'MONITOR'),(25,'MOUSE'),(26,'NO BREAK'),(27,'PINPAD'),(28,'POE'),(29,'POWERLINE'),(30,'PROYECTOR'),(31,'SISTEMA PUNTO DE VENTA'),(32,'SISTEMA BACKOFFICE'),(33,'SISTEMA HEPU'),(34,'SISTEMA DE RECARGAS'),(35,'SISTEMA DE FACTURACION'),(36,'SISTEMA OPERATIVO'),(37,'SWITCH'),(38,'TAMBOR DE IMPRESORA'),(39,'TECLADO'),(40,'TICKET MAL INGRESADO'),(41,'TICKET DUPLICADO'),(42,'TONNER');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problema`
--

LOCK TABLES `problema` WRITE;
/*!40000 ALTER TABLE `problema` DISABLE KEYS */;
INSERT INTO `problema` VALUES (5,'sistema SUA, HEPU'),(6,'Sistema de Facturacion'),(7,'Problemas de Pago de Servicio'),(8,'Problema con Recargas'),(9,'Problema con Pago de Tarjeta'),(10,'falla en Telefono y Extension'),(11,'Impresora de Tickets'),(12,'Impresora HP-Brother'),(13,'Teclado'),(14,'Mouse'),(15,'Monitor'),(16,'Antena Wifi o InalÃ¡mbrica'),(17,'Sin luz electrica'),(18,'Escanner'),(19,'Cajon de dinero'),(20,'Checador de huella o rostro'),(21,'whatsapp web');
/*!40000 ALTER TABLE `problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (2,'Jefe de Sistemas'),(3,'Programador'),(4,'Redes e Infraestructura'),(5,'Jefe de TI'),(6,'Auxiliar TI');
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
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
  `supervisor` int(11) DEFAULT NULL,
  `segmento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (16,'CENTRAL',8,1);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisores`
--

DROP TABLE IF EXISTS `supervisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `claveApp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisores`
--

LOCK TABLES `supervisores` WRITE;
/*!40000 ALTER TABLE `supervisores` DISABLE KEYS */;
INSERT INTO `supervisores` VALUES (8,'Nicolas Casas','xxalinestarxx@gmail.com','3112552522','samu joqp qany ajee');
/*!40000 ALTER TABLE `supervisores` ENABLE KEYS */;
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
  `estatus` enum('CERRADO','ABIERTO') DEFAULT 'ABIERTO',
  `modo` varchar(20) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `error_Sucursal` varchar(10) DEFAULT NULL,
  `tiempo_Solucion` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `problema` int(11) DEFAULT NULL,
  `fecha_Cerrado` date DEFAULT NULL,
  `hora_Cerrado` time DEFAULT NULL,
  `hora_Abierto` time DEFAULT NULL,
  `fecha_Abierto` date DEFAULT NULL,
  `proceso` text DEFAULT NULL,
  PRIMARY KEY (`folio`),
  KEY `sucursal_FK` (`sucursal`),
  KEY `atendio_FK` (`admin`),
  KEY `area_FK` (`area`),
  KEY `equipo_FK` (`equipo`),
  KEY `problema_FK` (`problema`),
  CONSTRAINT `area_FK` FOREIGN KEY (`area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `atendio_FK` FOREIGN KEY (`admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
INSERT INTO `tickets` VALUES ('SF260716533',16,'nicolas casas','3112552522','no abre el sua compañero','192.168.254.197',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'16:53:43','2025-07-26',NULL),('SF2607165595',16,'nicolas casas','3112552522','no puedo entrar al sua compañero','192.168.254.197','no puedo entrar al sua compañero','dos ventanas abiertas','se cierra sesion y se vuelve a entrar',2,31,'CERRADO','REMOTO',9,'VESPERTINO','NO',1,7,2025,5,'2025-07-26','16:57:02','16:55:26','2025-07-26',NULL),('SF260716585',16,'nicolas casas','3112552522','no puedo entrar al sua compañero','192.168.254.197',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'16:58:22','2025-07-26',NULL),('SF2607170078',16,'nicolas casas','3112552522','no puedo entrar al sua compañero','192.168.254.197',NULL,NULL,NULL,NULL,NULL,'ABIERTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'17:00:09','2025-07-26',NULL);
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

-- Dump completed on 2025-07-27 11:30:24
