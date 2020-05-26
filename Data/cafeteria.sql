-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id_admin` tinyint(3) NOT NULL,
  `Password` text NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
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
  `id_alimento` tinyint(4) NOT NULL,
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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `id_alumno` int(2) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `ApePat` varchar(20) DEFAULT NULL,
  `Edad` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Tamara Isabel','Arenas Vázquez ',18),(2,'Francisco','Badillo Romero ',16),(3,'Ingrid Montserrat','Baez de la Rosa',15),(4,'Luna Patricia','Carrillo Rivera',18),(5,'Oscar Francisco','Cortés Garcá',18),(6,'Raul de Jesus','Damian Magaña',18),(7,'Juan de Dios','De Luna Santillán',15),(8,'Luis Antonio','Domínguez Ávila',18),(9,'Gonzalo Alain','Flores Barrera ',15),(10,'Giovanni','Garfias Becerril ',18),(11,'Jorge','Gutiérrez Tafoya',15),(12,'Silvia','Herrera González',16),(13,'Adriana Marlette','Jiménez Hernández',16),(14,'José Carlos','Juárez Almaguer ',17),(15,'Arantxa Camil','Junco Flores',18),(16,'Erick','León Gómez',17),(17,'Abraham Emilio','López Contreras',17),(18,'Emiliano','Lopez Esquivel',15),(19,'Mariana Itzel','Melo Téllez',15),(20,'Ian Rodrigo','Méndez Jacinto ',17),(21,'Luis Antonio','Mendoza Ramirez',16),(22,'Diego','Muriel González',18),(23,'Omar Rodolfo','Ordóñez Rangel',15),(24,'Valeria Alejandra','Oviedo Sánchez ',16),(25,'Eduardo Miguel','Paniagua Broca',16),(26,'Lenin','Pavón',18),(27,'Natalia Abigail','Pérez Romero',16),(28,'David Alexander','Ramos Maldonado ',16),(29,'Jaasiel','Ríos Lira',18),(30,'Gabriel','Rivas Maldonado',16),(31,'Rodrigo','Romero Lara',18),(32,'Ana Paula','Rosales Olguín',16),(33,'Julio Maximiliano','Ruíz González',18),(34,'Elizabeth','Salgado Abreu',17),(35,'Henry','Torres González ',15),(36,'Crsitian Alberto','Umaña Aguirre',17),(37,'Diego','Vapnik Blancas',17),(38,'Astrid Xanat','Veiga Cruz',18),(39,'Carlos Iván','Villafranca Hernánde',17),(40,'José Antonio','Zahuantitla Vázquez ',16),(41,'María Fernanda','Villafan Flores',18);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `NCuenta` int(9) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPat` varchar(15) NOT NULL,
  `Grupo` int(3) DEFAULT NULL,
  PRIMARY KEY (`NCuenta`)
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
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion` (
  `alumno` int(2) DEFAULT NULL,
  `modulo` int(2) DEFAULT NULL,
  `calificacion` int(2) DEFAULT NULL,
  KEY `alumno` (`alumno`),
  KEY `modulo` (`modulo`),
  CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`modulo`) REFERENCES `modulo` (`id_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
INSERT INTO `calificacion` VALUES (11,5,8),(26,2,8),(30,4,9),(13,7,8),(6,5,8),(15,2,7),(24,2,7),(18,7,8),(21,6,10),(14,6,9),(29,7,8),(29,1,7),(35,1,7),(30,5,9),(15,7,10),(40,6,10),(5,1,8),(4,7,9),(10,6,9),(23,7,8),(33,6,6),(21,7,6),(24,7,8),(14,7,10),(35,4,10),(24,1,7),(4,6,10),(26,4,9),(31,2,8),(18,6,8),(41,1,6),(12,7,7),(19,4,10),(26,2,7),(41,6,10),(27,2,8),(18,3,8),(11,7,8),(24,5,9),(27,1,7),(38,7,6),(29,4,8),(17,2,9),(25,6,9),(30,7,10),(14,3,7),(39,7,6),(10,7,10),(10,1,9),(39,5,8),(25,7,6),(1,4,10),(32,1,6),(7,3,10),(39,6,6),(15,3,10),(21,6,7),(1,2,8),(18,7,10),(25,2,6),(16,6,6),(40,6,6),(21,3,6),(40,5,8),(6,1,6),(16,7,9),(25,7,8),(22,7,6),(39,3,8),(4,7,7),(28,3,8),(36,4,10),(23,7,7),(19,5,7),(10,4,6),(4,5,9),(7,4,8),(13,4,8),(10,5,6),(33,5,6),(22,2,10),(41,2,6),(6,1,9),(3,1,7),(34,7,9),(16,2,6),(37,7,7),(20,1,10),(33,6,9),(31,3,10),(1,4,7),(7,1,10),(28,4,10),(1,1,7),(18,7,7),(29,3,6),(6,2,6),(20,7,8);
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancelaciones`
--

DROP TABLE IF EXISTS `cancelaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelaciones` (
  `id_cancelacion` tinyint(9) NOT NULL,
  `id_pedido` tinyint(9) NOT NULL,
  `id_usuario` varchar(13) NOT NULL,
  `id_razon` tinyint(3) NOT NULL,
  `comentario` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_cancelacion`),
  KEY `pedido` (`id_pedido`),
  KEY `usuarios` (`id_usuario`),
  KEY `razon` (`id_razon`),
  CONSTRAINT `cancelaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `razon` FOREIGN KEY (`id_razon`) REFERENCES `razones` (`id_razon`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colegios`
--

LOCK TABLES `colegios` WRITE;
/*!40000 ALTER TABLE `colegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `colegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregas` (
  `id_entrega` tinyint(9) NOT NULL,
  `id_pedido` tinyint(9) NOT NULL,
  `id_alimento` tinyint(4) NOT NULL,
  `cantidad` int(2) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_pedido` (`id_pedido`),
  KEY `alimentos` (`id_alimento`),
  CONSTRAINT `alimentos` FOREIGN KEY (`id_alimento`) REFERENCES `alimentos` (`id_alimento`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `entregas_ibfk_2` FOREIGN KEY (`id_alimento`) REFERENCES `menu` (`id_menu`)
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
  `id_estatus` tinyint(2) NOT NULL,
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
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` int(3) NOT NULL,
  `Grado` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (456,4),(605,6),(652,6),(654,6);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `id_instructor` int(1) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `ApePat` varchar(15) DEFAULT NULL,
  `ApeMat` varchar(15) DEFAULT NULL,
  `Edad` int(2) DEFAULT NULL,
  `Constancias` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Carlos Alfredo','Campos','De la Garza',26,9),(2,'Antonio','Lopez','Chong',17,5),(3,'Juan Carlos','Camacho','Barrientos',18,4),(4,'Gamaliel','Rios','Lira',18,5),(5,'Diego','Rosas','Franco',17,5),(6,'Emiliano','Cruz','HernÃ¡ndez',18,4),(7,'Jose Manuel','List','CeseÃ±a',19,4);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_negra`
--

DROP TABLE IF EXISTS `lista_negra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_negra` (
  `id_lista_negra` tinyint(9) NOT NULL,
  `id_usuario` varchar(13) NOT NULL,
  `id_cancelacion` tinyint(9) NOT NULL,
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
  `id_lugar` tinyint(2) NOT NULL AUTO_INCREMENT,
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
  `id_mensajero` tinyint(3) NOT NULL,
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
  `id_menu` tinyint(3) NOT NULL,
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
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `id_modulo` int(2) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Karel\r'),(2,'PHP\r'),(3,'Bases de Datos\r'),(4,'Diseño\r'),(5,'Seguridad\r'),(6,'JavaScript\r'),(7,'HTML\r');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` tinyint(9) NOT NULL,
  `id_usuario` varchar(13) NOT NULL,
  `id_mensajero` tinyint(3) NOT NULL,
  `Costo` float(6,2) NOT NULL,
  `Fecha` date NOT NULL,
  `Lugar` tinyint(2) NOT NULL,
  `id_estatus` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `usuario` (`id_usuario`),
  KEY `mensajero` (`id_mensajero`),
  KEY `Lugar` (`Lugar`),
  KEY `id_estatus` (`id_estatus`),
  CONSTRAINT `mensajero` FOREIGN KEY (`id_mensajero`) REFERENCES `mensajeros` (`id_mensajero`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Lugar`) REFERENCES `lugares` (`id_lugar`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus` (`id_estatus`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
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
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `id_profesor` int(1) NOT NULL,
  `Nombre` varchar(15) DEFAULT NULL,
  `ApePat` varchar(15) DEFAULT NULL,
  `Modulo` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `Modulo` (`Modulo`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`Modulo`) REFERENCES `modulo` (`id_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Carlos Alfredo','Campos',1),(2,'Antonio','Lopez',2),(3,'Juan Carlos','Camacho',3),(4,'Gamaliel','Rios',5),(5,'Diego','Rosas',6),(6,'Emiliano','Cruz',7),(7,'Jose Manuel','List',4);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
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
  `id_razon` tinyint(3) NOT NULL,
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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(1) DEFAULT NULL,
  `Nombre` varchar(15) DEFAULT NULL,
  `Tipo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'diego','alumno\r'),(2,'manuel','profesor\r'),(3,'carlos','profesor\r'),(4,'juan','alumno\r'),(5,'manuel','alumno\r'),(6,'emiliano','profesor\r'),(7,'samuel','alumno\r'),(8,'gama','profesor\r'),(9,'sonia','alumno\r'),(10,'jorge','profesor\r'),(11,'edson','alumno\r'),(12,'erik','alumno');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` varchar(13) NOT NULL,
  `password` text DEFAULT NULL,
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

-- Dump completed on 2020-05-25 19:55:20
