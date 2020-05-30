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
INSERT INTO `alumnos` VALUES (123456777,'Guernica','Pavón',1),(123456788,'Uwu','Uwu',1),(123456789,'Lenin','Pavón',1),(319014216,'Lenin','Pavón',1),(319014217,'Lenin','Pavón',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaciones`
--

LOCK TABLES `asignaciones` WRITE;
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` VALUES (103,1,48),(104,2,49),(105,1,50),(106,2,51),(107,1,52),(108,2,53),(109,1,54);
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
  `comentario` text,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cancelacion`),
  KEY `pedido` (`id_pedido`),
  KEY `usuarios` (`id_usuario`),
  KEY `id_razon` (`id_razon`),
  CONSTRAINT `cancelaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `id_razon` FOREIGN KEY (`id_razon`) REFERENCES `razones` (`id_razon`),
  CONSTRAINT `pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancelaciones`
--

LOCK TABLES `cancelaciones` WRITE;
/*!40000 ALTER TABLE `cancelaciones` DISABLE KEYS */;
INSERT INTO `cancelaciones` VALUES (2,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:20:46'),(3,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:21:47'),(4,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:21:58'),(5,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:22:48'),(6,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:28:14'),(7,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:32:14'),(8,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:34:07'),(9,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:34:51'),(10,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:37:30'),(11,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:40:08'),(12,48,'A319014217',1,'Fue mui grosero','2020-05-29 23:44:29'),(13,48,'A319014217',1,NULL,'2020-05-29 23:47:13'),(14,48,'A319014217',1,NULL,'2020-05-29 23:47:51'),(15,48,'A319014217',1,NULL,'2020-05-29 23:56:12'),(16,54,'A319014217',1,NULL,'2020-05-30 00:06:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (42,48,1,2),(43,49,1,1),(44,50,1,6),(45,50,2,2),(46,51,3,3),(47,52,1,1),(48,53,1,1),(49,54,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'En proceso'),(2,'Entregado'),(3,'Cancelado');
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
INSERT INTO `funcionarios` VALUES (1,'Lenin','Pavón','AAAA9007151H0');
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
  `grupo` smallint(10) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,401),(2,402),(3,403),(4,404),(5,405),(6,406),(7,407),(8,408),(9,409),(10,410),(11,411),(12,412),(13,413),(14,414),(15,415),(16,416),(17,417),(18,451),(19,452),(20,453),(21,454),(22,455),(23,456),(24,457),(25,458),(26,459),(27,460),(28,461),(29,462),(30,463),(31,464),(32,465),(33,466),(34,501),(35,502),(36,503),(37,504),(38,505),(39,506),(40,507),(41,508),(42,509),(43,510),(44,511),(45,512),(46,513),(47,514),(48,515),(49,516),(50,517),(51,518),(52,551),(53,552),(54,553),(55,554),(56,555),(57,556),(58,557),(59,558),(60,559),(61,560),(62,561),(63,562),(64,563),(65,564),(66,601),(67,602),(68,603),(69,604),(70,605),(71,606),(72,607),(73,608),(74,609),(75,610),(76,611),(77,612),(78,613),(79,614),(80,615),(81,616),(82,617),(83,618),(84,619),(85,651),(86,652),(87,653),(88,654),(89,655),(90,656),(91,657),(92,658),(93,659),(94,660),(95,661),(96,662),(97,663),(98,664);
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
  `fecha_final` datetime DEFAULT NULL,
  PRIMARY KEY (`id_lista_negra`),
  KEY `cancelacion` (`id_usuario`),
  KEY `id_cancelacion` (`id_cancelacion`),
  CONSTRAINT `lista_negra_ibfk_1` FOREIGN KEY (`id_cancelacion`) REFERENCES `cancelaciones` (`id_cancelacion`),
  CONSTRAINT `lista_negra_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_negra`
--

LOCK TABLES `lista_negra` WRITE;
/*!40000 ALTER TABLE `lista_negra` DISABLE KEYS */;
INSERT INTO `lista_negra` VALUES (1,'A319014217',11,'2020-06-03 18:40:08'),(2,'A319014217',12,'2020-06-03 18:44:29'),(3,'A319014217',12,'2020-06-03 18:44:29'),(4,'A319014217',12,'2020-06-03 18:44:29'),(5,'A319014217',12,'2020-06-03 18:44:29'),(6,'A319014217',13,'2020-06-03 18:47:13'),(7,'A319014217',14,'2020-06-03 18:47:51'),(8,'A319014217',15,'2020-06-03 18:56:12'),(9,'A319014217',16,'2020-06-03 19:06:56');
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
  `lugar` smallint(7) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (48,'A319014217',103,27.00,'2020-05-29 23:56:12',1,3),(49,'A319014217',104,13.50,'2020-05-29 18:29:48',1,1),(50,'A319014217',105,133.50,'2020-05-30 00:02:34',1,2),(51,'A319014217',106,36.00,'2020-05-30 00:02:52',1,1),(52,'A319014217',107,13.50,'2020-05-30 00:06:47',1,2),(53,'A319014217',108,13.50,'2020-05-30 00:06:03',1,1),(54,'A319014217',109,13.50,'2020-05-30 00:06:56',1,3);
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
INSERT INTO `profesores` VALUES ('BBBB9007151H0',1,'Lenin','Pavón');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `razones`
--

LOCK TABLES `razones` WRITE;
/*!40000 ALTER TABLE `razones` DISABLE KEYS */;
INSERT INTO `razones` VALUES (1,'No se liquidó el pedido'),(2,'No se presentó a recoger el pedido'),(3,'Petición del usuario'),(4,'Otro');
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
INSERT INTO `trabajadores` VALUES ('123456789','Lenin','Pavón'),('516689000','Augusto','Augusto');
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
INSERT INTO `usuarios` VALUES ('A123456777','8DaOT/lgWalFMz6cTKuprQ==','01HqHjY0yG$y4Eg'),('A123456788','KGxRYSpxAg6zJfEpARJaRw==','C6pAzV%f(m(nihv'),('A123456789','xhi18grGGRhgwCCfbASCUA==','Hg/vMW1W?rK3l7#'),('A319014216','10beTOaYhXKf0ZYn+AD95g==','1OM7kHx6cTk$n9r'),('A319014217','tffN5+srALU1k9OcQicpJ8rEVnLfYL1nkq0TT0Rwv+pNXeokEBO7M9+t7ixEqbuxN46R27SQYyvDZO+JqKofB+45/k5hKPn5v4Ze6i0atHA=','Jzxwr4lWIN2QCeO'),('FAAAA9007151H0','GE86Grx24vt55x0/DD42Ug==','QzzpBL!yz?4gdCh'),('PBBBB9007151H0','wZ5ybYZjYj/feVI+EOthZQ==','%dZNSDvWXDQ)$C%'),('root','root','a'),('T123456789','09/hBB9/lUyFuf3N+1KIpg==','w4ek&Wt4FAfyEIA'),('T516689000','A0uzS8Ex9lRwW349GAwPLg==','qd7gbNhnbOS&/A9'),('uwu','uwu','uwu');
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

-- Dump completed on 2020-05-29 19:49:48
