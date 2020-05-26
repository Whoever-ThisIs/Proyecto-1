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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimentos`
--

LOCK TABLES `alimentos` WRITE;
/*!40000 ALTER TABLE `alimentos` DISABLE KEYS */;
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
-- Table structure for table `cancelaciones`
--

DROP TABLE IF EXISTS `cancelaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelaciones` (
  `id_cancelacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_usuario` varchar(13) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
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
  `id_usuario` varchar(13) NOT NULL,
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
  `id_lugar` smallint(7) NOT NULL,
  `Lugar` varchar(20) NOT NULL,
  PRIMARY KEY (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
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
  PRIMARY KEY (`id_mensajero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajeros`
--

LOCK TABLES `mensajeros` WRITE;
/*!40000 ALTER TABLE `mensajeros` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` smallint(7) NOT NULL,
  `id_alimento` tinyint(2) NOT NULL,
  `cantidad` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `alimento` (`id_alimento`),
  CONSTRAINT `alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimentos` (`id_alimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
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
  `id_usuario` varchar(13) NOT NULL,
  `id_mensajero` tinyint(3) NOT NULL,
  `Costo` float(6,2) NOT NULL,
  `Fecha` date NOT NULL,
  `lugar` smallint(7) DEFAULT NULL,
  `id_estatus` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `usuario` (`id_usuario`),
  KEY `mensajero` (`id_mensajero`),
  KEY `Lugar` (`lugar`),
  KEY `id_estatus` (`id_estatus`),
  CONSTRAINT `mensajero` FOREIGN KEY (`id_mensajero`) REFERENCES `mensajeros` (`id_mensajero`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus` (`id_estatus`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`lugar`) REFERENCES `lugares` (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
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
  `id_usuario` varchar(13) NOT NULL,
  `password` text,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
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

-- Dump completed on 2020-05-26  0:00:43
