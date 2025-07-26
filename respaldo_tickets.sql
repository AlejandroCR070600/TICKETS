-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tickets
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
  `estatus` varchar(20) DEFAULT NULL,
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
INSERT INTO `tickets` VALUES ('SF2507152439',16,'Nicolas Casas','3112552522','problema con el sua no puedo tener dos ventanas abiertas','192.168.254.168','asasdasd','asasdasda','asasdsadasd',2,2,'CERRADO','REMOTO',7,'MATUTINO','SI',473,7,2025,5,'2025-07-25','23:17:44','15:24:19','2025-07-25'),('SF2507152736',16,'Nicolas Casas','3112552522','problema con el sua no puedo tener dos ventanas abiertas','192.168.254.168','asdasd','asdasdas','dasdasd',2,2,'CERRADO','PRESENCIAL',8,'0','SI',157,7,2025,5,'2025-07-25','18:05:07','15:27:29','2025-07-25'),('SF2507152762',16,'Nicolas Casas','3112552522','problema con el sua no puedo tener dos ventanas abiertas','192.168.254.168','asd','asd','asd',2,2,'CERRADO','REMOTO',7,'MATUTINO','NO',475,7,2025,5,'2025-07-25','23:23:34','15:27:55','2025-07-25'),('SF2507153013',16,'Nicolas Casas','3112552522','no puedo entrar al sua','192.168.254.140','saddsf','sadfsadf','sadfasdf',2,2,'CERRADO','2',7,'0','NO',148,7,2025,5,'2025-07-25','17:58:32','15:30:30','2025-07-25'),('SF2507153095',16,'Nicolas Casas','3112552522','no puedo entrar al sua','192.168.254.140','as','as','as',2,2,'CERRADO','REMOTO',7,'MATUTINO','NO',465,7,2025,5,'2025-07-25','23:15:46','15:30:27','2025-07-25'),('SF2507233594',16,'alejandro','3112552522','asdsadfsdfsdfsdfsadfsdfsdfsadfsd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:35:13','2025-07-25'),('SF2507233697',16,'alejandro','3112552522','asdsadfsdfsdfsdfsadfsdfsdfsadfsd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:36:45','2025-07-25'),('SF2507233733',16,'nicolas casas','3112552522','asdasdf51sd65g1df65g','192.168.24.11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:37:10','2025-07-25'),('SF2507233899',16,'alejandro','3112552522','asdfsdfasdf','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:38:50','2025-07-25'),('SF2507233946',16,'nicolas casas','3112552522','123123123','21312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:39:10','2025-07-25'),('SF2507233949',16,'alejandro nicolas','3111234567','asdasdfsdf','192.1068.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:39:44','2025-07-25'),('SF2507234962',16,'nicolas casas','3112552522','sua','192.168.254.13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:49:14','2025-07-25'),('SF2507235069',16,'nicolas casas','3112552522','asdasd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:50:54','2025-07-25'),('SF2507235167',16,'nicolas casas','3112552522','asdasd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:51:49','2025-07-25'),('SF2507235382',16,'nicolas casas','3112552522','sdasd','192.168.56.20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:53:02','2025-07-25'),('SF2507235743',16,'nicolas casas','3112552522','asdasd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:57:47','2025-07-25'),('SF2507235964',16,'nicolas casas','3112552522','asdasd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'23:59:05','2025-07-25'),('SF2607000036',16,'nicolas casas','3112552522','asdasdsd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:00:43','2025-07-26'),('SF2607000123',16,'nicolas casas','3112552522','12','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:01:55','2025-07-26'),('SF2607000128',16,'nicolas casas','3112552522','2','121',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:01:15','2025-07-26'),('SF2607000256',16,'nicolas casas','3112552522','asdasd','192.168.254.197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:02:42','2025-07-26'),('SF2607000471',16,'nicolas casas','3112552522','12','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:04:18','2025-07-26'),('SF2607000570',16,'alejandro','3112552522','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:05:26','2025-07-26'),('SF2607000628',16,'nicolas casas','3112552522','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:06:26','2025-07-26'),('SF260700109',16,'nicolas casas','3112552522','15','185',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'00:10:21','2025-07-26');
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

-- Dump completed on 2025-07-26  0:13:50
