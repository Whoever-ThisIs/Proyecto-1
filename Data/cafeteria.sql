-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: cafeteria
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id_admin` tinyint(3) NOT NULL AUTO_INCREMENT,
  `Password` text NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alimentos`
--

DROP TABLE IF EXISTS `alimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alimentos` (
  `id_alimento` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `precio` float(5,2) NOT NULL,
  PRIMARY KEY (`id_alimento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimentos`
--

LOCK TABLES `alimentos` WRITE;
/*!40000 ALTER TABLE `alimentos` DISABLE KEYS */;
INSERT INTO `alimentos` VALUES (1,'Agua sabor vaso',13.50),(2,'Yakult',12.00),(3,'Galletas Oreo',12.00),(4,'Chimichangas',50.00);
/*!40000 ALTER TABLE `alimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `Ncuenta` int(32) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPat` varchar(15) NOT NULL,
  `Grupo` tinyint(4) NOT NULL,
  PRIMARY KEY (`Ncuenta`),
  KEY `Grupo` (`Grupo`),
  CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`Grupo`) REFERENCES `Grupos` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaciones` (
  `id_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_mensajero` tinyint(3) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_mensajero` (`id_mensajero`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_mensajero`) REFERENCES `mensajeros` (`id_mensajero`),
  CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaciones`
--

LOCK TABLES `asignaciones` WRITE;
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` VALUES (1,1,NULL),(2,1,NULL),(3,1,NULL),(4,1,NULL),(5,1,NULL),(6,1,NULL),(7,1,NULL),(8,1,NULL),(9,1,NULL),(10,1,NULL),(11,2,NULL),(12,1,NULL),(13,1,NULL),(14,1,NULL),(15,1,NULL),(16,1,NULL),(17,1,NULL),(18,1,NULL),(19,2,NULL),(20,1,NULL),(21,1,NULL),(22,2,NULL),(23,1,NULL),(24,2,NULL),(25,1,NULL),(26,2,NULL),(27,1,NULL),(28,2,NULL),(29,1,NULL),(30,2,NULL),(31,1,NULL),(32,2,NULL),(33,1,NULL),(34,2,NULL),(35,1,NULL),(36,2,NULL),(37,1,NULL),(38,2,NULL),(39,1,NULL),(40,2,NULL),(41,1,NULL),(42,2,NULL),(43,1,NULL),(44,2,NULL),(45,1,NULL),(46,2,NULL),(47,1,NULL),(48,2,NULL),(49,1,NULL),(50,2,NULL),(51,1,NULL),(52,2,NULL),(53,1,NULL),(54,2,NULL),(55,1,NULL),(56,2,NULL),(57,1,NULL),(58,2,NULL),(59,1,NULL),(60,2,NULL),(61,1,NULL),(62,2,NULL),(63,1,NULL),(64,2,NULL),(65,1,NULL),(66,2,NULL),(67,1,NULL),(68,2,NULL),(69,1,NULL),(70,2,NULL),(71,1,NULL),(72,2,NULL),(73,1,NULL),(74,2,NULL),(75,1,NULL),(76,2,NULL),(77,1,NULL),(78,2,NULL),(79,1,NULL),(80,2,NULL),(81,1,NULL),(82,2,NULL),(83,1,NULL),(84,2,NULL),(85,1,NULL),(86,2,NULL),(87,1,NULL),(88,2,NULL),(89,1,NULL),(90,2,NULL),(91,1,NULL),(92,2,NULL),(93,1,NULL),(94,2,NULL);
/*!40000 ALTER TABLE `asignaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancelaciones`
--

DROP TABLE IF EXISTS `cancelaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelaciones` (
  `id_cancelacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_usuario` varchar(14) NOT NULL,
  `id_razon` tinyint(3) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_cancelacion`),
  KEY `pedido` (`id_pedido`),
  KEY `usuarios` (`id_usuario`),
  KEY `id_razon` (`id_razon`),
  CONSTRAINT `cancelaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `id_razon` FOREIGN KEY (`id_razon`) REFERENCES `razones` (`id_razon`),
  CONSTRAINT `pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancelaciones`
--

LOCK TABLES `cancelaciones` WRITE;
/*!40000 ALTER TABLE `cancelaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancelaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colegios`
--

DROP TABLE IF EXISTS `colegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colegios` (
  `id_colegio` tinyint(2) NOT NULL AUTO_INCREMENT,
  `Colegio` varchar(40) NOT NULL,
  PRIMARY KEY (`id_colegio`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colegios`
--

LOCK TABLES `colegios` WRITE;
/*!40000 ALTER TABLE `colegios` DISABLE KEYS */;
INSERT INTO `colegios` VALUES (1,'Física'),(2,'Informática'),(3,'Matemáticas'),(4,'Biología'),(5,'Educación Física'),(6,'Morfología, Fisiología y Salud'),(7,'Orientación Educativa'),(8,'Psicologia e Higiene Mental'),(9,'Química'),(10,'Ciencias Sociales'),(11,'Geografía'),(12,'Historia'),(13,'Alemán'),(14,'Artes Plásticas'),(15,'Danza'),(16,'Dibujo y Modelado'),(17,'Filosofía'),(18,'Francés'),(19,'Inglés'),(20,'Italiano'),(21,'Letras Clásicas'),(22,'Literatura'),(23,'Música'),(24,'Teatro'),(25,'Estudios Técnicos Especializados');
/*!40000 ALTER TABLE `colegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregas` (
  `id_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_menu` smallint(7) DEFAULT NULL,
  `cantidad` tinyint(7) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `entregas_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,13,1,7),(2,14,1,6),(3,15,1,5),(4,16,1,4),(5,16,1,4),(6,17,1,3),(7,18,1,2),(8,19,1,1),(9,20,1,0),(10,21,2,1),(11,22,2,1),(12,23,2,1),(13,24,2,1),(14,25,2,1),(15,26,2,1),(16,27,2,1),(17,28,2,1),(18,29,2,7),(19,30,1,3),(20,31,1,1),(21,32,1,4),(22,33,1,1),(23,34,1,1),(24,35,2,7),(25,35,3,8),(26,35,4,12),(27,36,1,1),(28,36,2,2),(29,36,3,92),(30,36,4,30),(31,37,1,4),(32,38,1,2),(33,39,1,1);
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatus` (
  `id_estatus` tinyint(2) NOT NULL AUTO_INCREMENT,
  `estatus` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'En proceso'),(2,'Entregada');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `id_colegio` tinyint(2) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPat` varchar(15) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  PRIMARY KEY (`RFC`),
  KEY `id_colegio` (`id_colegio`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_colegio`) REFERENCES `colegios` (`id_colegio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id_grupo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `grupo` smallint(6) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_negra`
--

DROP TABLE IF EXISTS `lista_negra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_negra` (
  `id_lista_negra` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(14) NOT NULL,
  `id_cancelacion` int(11) NOT NULL,
  `fecha_final` date NOT NULL,
  PRIMARY KEY (`id_lista_negra`),
  KEY `cancelacion` (`id_usuario`),
  KEY `id_cancelacion` (`id_cancelacion`),
  CONSTRAINT `lista_negra_ibfk_1` FOREIGN KEY (`id_cancelacion`) REFERENCES `cancelaciones` (`id_cancelacion`),
  CONSTRAINT `lista_negra_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_negra`
--

LOCK TABLES `lista_negra` WRITE;
/*!40000 ALTER TABLE `lista_negra` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_negra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugares`
--

DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugares` (
  `id_lugar` smallint(7) NOT NULL AUTO_INCREMENT,
  `Lugar` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_lugar`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` VALUES (1,'Sala de maestros'),(2,'A-17'),(3,'Pulpo'),(4,'Dirección'),(5,'Laboratorio de ciencias'),(6,'Elevador arriba'),(7,'Patio de sextos'),(8,'Patio de cuartos'),(9,'Patio de quintos'),(10,'Pasillo salones B'),(11,'Pasillo salones C'),(12,'Pasillo salones D'),(13,'Pimpos'),(14,'Abajo de biblioteca'),(15,'Canchas'),(16,'Camerinos'),(17,'Auditorio'),(18,'Pasillo salones H'),(19,'Gimnasio'),(20,'Laboratorios'),(21,'Mediateca');
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajeros`
--

DROP TABLE IF EXISTS `mensajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensajeros` (
  `id_mensajero` tinyint(3) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Password` text NOT NULL,
  `estado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_mensajero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajeros`
--

LOCK TABLES `mensajeros` WRITE;
/*!40000 ALTER TABLE `mensajeros` DISABLE KEYS */;
INSERT INTO `mensajeros` VALUES (1,'Juan','Juan',1),(2,'Alejandro','Alejandro',1);
/*!40000 ALTER TABLE `mensajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` smallint(7) NOT NULL AUTO_INCREMENT,
  `id_alimento` tinyint(2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `alimento` (`id_alimento`),
  CONSTRAINT `alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimentos` (`id_alimento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,82),(2,2,89),(3,3,6),(4,4,59);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(14) NOT NULL,
  `id_asignacion` int(11) NOT NULL,
  `Costo` float(6,2) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lugar` smallint(7) DEFAULT NULL,
  `id_estatus` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `usuario` (`id_usuario`),
  KEY `Lugar` (`lugar`),
  KEY `id_estatus` (`id_estatus`),
  KEY `id_asignacion` (`id_asignacion`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus` (`id_estatus`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`lugar`) REFERENCES `lugares` (`id_lugar`),
  CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`id_asignacion`) REFERENCES `asignaciones` (`id_asignacion`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'root',56,13.50,'2020-05-27 20:11:22',1,1),(2,'root',57,13.50,'2020-05-27 20:12:33',1,1),(3,'root',58,13.50,'2020-05-27 20:12:34',1,1),(4,'root',59,13.50,'2020-05-27 20:12:34',1,1),(5,'root',60,50.00,'2020-05-27 22:30:27',3,1),(6,'root',61,13.50,'2020-05-27 22:07:51',1,1),(7,'root',62,13.50,'2020-05-27 22:07:52',1,1),(8,'root',63,13.50,'2020-05-27 22:07:53',1,1),(9,'root',64,13.50,'2020-05-27 22:08:06',1,1),(10,'root',65,13.50,'2020-05-27 22:08:41',1,1),(11,'root',66,13.50,'2020-05-27 22:08:42',1,1),(12,'root',67,13.50,'2020-05-27 22:08:42',1,1),(13,'root',68,13.50,'2020-05-27 22:08:58',1,1),(14,'root',69,13.50,'2020-05-27 22:08:59',1,1),(15,'root',70,13.50,'2020-05-27 22:09:13',1,1),(16,'root',71,13.50,'2020-05-27 22:09:29',1,1),(17,'root',72,13.50,'2020-05-27 22:09:48',1,1),(18,'root',73,13.50,'2020-05-27 22:09:49',1,1),(19,'root',74,13.50,'2020-05-27 22:09:50',1,1),(20,'root',75,13.50,'2020-05-27 22:09:50',1,1),(21,'root',76,12.00,'2020-05-27 22:10:52',1,1),(22,'root',77,12.00,'2020-05-27 22:10:53',1,1),(23,'root',78,12.00,'2020-05-27 22:10:54',1,1),(24,'root',79,12.00,'2020-05-27 22:10:54',1,1),(25,'root',80,12.00,'2020-05-27 22:10:54',1,1),(26,'root',81,12.00,'2020-05-27 22:20:25',1,1),(27,'root',82,12.00,'2020-05-27 22:20:26',1,1),(28,'root',83,12.00,'2020-05-27 22:20:27',1,1),(29,'root',84,372.00,'2020-05-27 22:50:33',1,1),(30,'root',85,40.50,'2020-05-27 22:53:45',2,1),(31,'root',86,13.50,'2020-05-27 22:53:54',1,1),(32,'root',87,54.00,'2020-05-27 22:59:47',1,1),(33,'root',88,13.50,'2020-05-27 23:01:43',1,1),(34,'root',89,13.50,'2020-05-27 23:03:36',1,1),(35,'root',90,4900.00,'2020-05-28 00:49:24',1,1),(36,'uwu',91,3384.00,'2020-05-28 01:46:59',1,1),(37,'uwu',92,54.00,'2020-05-28 02:04:13',1,1),(38,'uwu',93,27.00,'2020-05-28 02:05:39',1,1),(39,'uwu',94,13.50,'2020-05-28 02:10:12',1,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores` (
  `RFC` varchar(13) NOT NULL,
  `id_colegio` tinyint(2) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPat` varchar(15) NOT NULL,
  PRIMARY KEY (`RFC`),
  KEY `id_colegio` (`id_colegio`),
  CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_colegio`) REFERENCES `colegios` (`id_colegio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `razones`
--

DROP TABLE IF EXISTS `razones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `razones` (
  `id_razon` tinyint(3) NOT NULL AUTO_INCREMENT,
  `razon` text NOT NULL,
  PRIMARY KEY (`id_razon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `razones`
--

LOCK TABLES `razones` WRITE;
/*!40000 ALTER TABLE `razones` DISABLE KEYS */;
/*!40000 ALTER TABLE `razones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajadores` (
  `NTrabajador` varchar(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPat` varchar(15) NOT NULL,
  PRIMARY KEY (`NTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` varchar(14) NOT NULL,
  `password` text NOT NULL,
  `condimento` text NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('root','root','a'),('uwu','uwu','uwu');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-28 15:21:11
