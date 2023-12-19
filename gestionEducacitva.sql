-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: educacion_alex
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `idactividades` int NOT NULL AUTO_INCREMENT,
  `practica` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `discusion` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `resolucion` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `alumnos_idAlumnos` int NOT NULL,
  `profesor_idProfesor` int NOT NULL,
  PRIMARY KEY (`idactividades`),
  KEY `fk_actividades_alumnos_idx` (`alumnos_idAlumnos`),
  KEY `fk_actividades_profesor1_idx` (`profesor_idProfesor`),
  CONSTRAINT `fk_actividades_alumnos` FOREIGN KEY (`alumnos_idAlumnos`) REFERENCES `alumnos` (`idAlumnos`),
  CONSTRAINT `fk_actividades_profesor1` FOREIGN KEY (`profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `idAlumnos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_nacimiento` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `profesor_idProfesor` int NOT NULL,
  PRIMARY KEY (`idAlumnos`),
  KEY `fk_alumnos_profesor1_idx` (`profesor_idProfesor`),
  CONSTRAINT `fk_alumnos_profesor1` FOREIGN KEY (`profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendisaje`
--

DROP TABLE IF EXISTS `aprendisaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendisaje` (
  `idaprendisaje` int NOT NULL AUTO_INCREMENT,
  `experiencia` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `practica` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `interaccion` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `profesor_idProfesor` int NOT NULL,
  `profesorAlumno_idprofesorAlumno` int NOT NULL,
  PRIMARY KEY (`idaprendisaje`),
  KEY `fk_aprendisaje_profesor1_idx` (`profesor_idProfesor`),
  KEY `fk_aprendisaje_profesorAlumno1_idx` (`profesorAlumno_idprofesorAlumno`),
  CONSTRAINT `fk_aprendisaje_profesor1` FOREIGN KEY (`profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`),
  CONSTRAINT `fk_aprendisaje_profesorAlumno1` FOREIGN KEY (`profesorAlumno_idprofesorAlumno`) REFERENCES `profesoralumno` (`idprofesorAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendisaje`
--

LOCK TABLES `aprendisaje` WRITE;
/*!40000 ALTER TABLE `aprendisaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprendisaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `idProfesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `domicilio` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `alumnos_idAlumnos` int NOT NULL,
  `profesorAlumno_idprofesorAlumno` int NOT NULL,
  PRIMARY KEY (`idProfesor`,`profesorAlumno_idprofesorAlumno`),
  KEY `fk_profesor_alumnos1_idx` (`alumnos_idAlumnos`),
  KEY `fk_profesor_profesorAlumno1_idx` (`profesorAlumno_idprofesorAlumno`),
  CONSTRAINT `fk_profesor_alumnos1` FOREIGN KEY (`alumnos_idAlumnos`) REFERENCES `alumnos` (`idAlumnos`),
  CONSTRAINT `fk_profesor_profesorAlumno1` FOREIGN KEY (`profesorAlumno_idprofesorAlumno`) REFERENCES `profesoralumno` (`idprofesorAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesoralumno`
--

DROP TABLE IF EXISTS `profesoralumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesoralumno` (
  `idprofesorAlumno` int NOT NULL AUTO_INCREMENT,
  `colaboracion` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `conexionAlProf` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `atencion` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`idprofesorAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesoralumno`
--

LOCK TABLES `profesoralumno` WRITE;
/*!40000 ALTER TABLE `profesoralumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesoralumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallermañana`
--

DROP TABLE IF EXISTS `tallermañana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallermañana` (
  `idTallerMañana` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `profesor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `horario` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lugarFisico` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `profesor_idProfesor` int NOT NULL,
  `alumnos_idAlumnos` int NOT NULL,
  PRIMARY KEY (`idTallerMañana`),
  KEY `fk_tallerMañana_profesor1_idx` (`profesor_idProfesor`),
  KEY `fk_tallerMañana_alumnos1_idx` (`alumnos_idAlumnos`),
  CONSTRAINT `fk_tallerMañana_alumnos1` FOREIGN KEY (`alumnos_idAlumnos`) REFERENCES `alumnos` (`idAlumnos`),
  CONSTRAINT `fk_tallerMañana_profesor1` FOREIGN KEY (`profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallermañana`
--

LOCK TABLES `tallermañana` WRITE;
/*!40000 ALTER TABLE `tallermañana` DISABLE KEYS */;
/*!40000 ALTER TABLE `tallermañana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallertarde`
--

DROP TABLE IF EXISTS `tallertarde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallertarde` (
  `idtallerTarde` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `profesor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `horario` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lugarFisico` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `profesor_idProfesor` int NOT NULL,
  `alumnos_idAlumnos` int NOT NULL,
  PRIMARY KEY (`idtallerTarde`),
  KEY `fk_tallerTarde_profesor1_idx` (`profesor_idProfesor`),
  KEY `fk_tallerTarde_alumnos1_idx` (`alumnos_idAlumnos`),
  CONSTRAINT `fk_tallerTarde_alumnos1` FOREIGN KEY (`alumnos_idAlumnos`) REFERENCES `alumnos` (`idAlumnos`),
  CONSTRAINT `fk_tallerTarde_profesor1` FOREIGN KEY (`profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallertarde`
--

LOCK TABLES `tallertarde` WRITE;
/*!40000 ALTER TABLE `tallertarde` DISABLE KEYS */;
/*!40000 ALTER TABLE `tallertarde` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-18 22:41:11
