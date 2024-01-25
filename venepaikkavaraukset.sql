-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: venepaikkavaraukset
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `ASIAKKAAT`
--

DROP TABLE IF EXISTS `ASIAKKAAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASIAKKAAT` (
  `Asiakas_id` int NOT NULL AUTO_INCREMENT,
  `EtuNimi` varchar(50) NOT NULL,
  `SukuNimi` varchar(50) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Puh` varchar(20) DEFAULT NULL,
  `Katuosoite` varchar(150) DEFAULT NULL,
  `Postinumero` varchar(5) NOT NULL,
  PRIMARY KEY (`Asiakas_id`),
  KEY `Postinumero_idx` (`Postinumero`),
  CONSTRAINT `Postinumero` FOREIGN KEY (`Postinumero`) REFERENCES `POSTINUMEROT` (`Postinumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIAKKAAT`
--

LOCK TABLES `ASIAKKAAT` WRITE;
/*!40000 ALTER TABLE `ASIAKKAAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASIAKKAAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KUVAT`
--

DROP TABLE IF EXISTS `KUVAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KUVAT` (
  `Kuva_id` varchar(100) NOT NULL,
  `Palvelu_id` int NOT NULL,
  `Kuvateksti` varchar(150) NOT NULL,
  `Prioriteetti` int NOT NULL,
  PRIMARY KEY (`Kuva_id`),
  KEY `Palvelu_id_idx` (`Palvelu_id`),
  CONSTRAINT `Palvelu_id_K` FOREIGN KEY (`Palvelu_id`) REFERENCES `PALVELUT` (`Palvelu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KUVAT`
--

LOCK TABLES `KUVAT` WRITE;
/*!40000 ALTER TABLE `KUVAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `KUVAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIKAT`
--

DROP TABLE IF EXISTS `PAIKAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAIKAT` (
  `Paikka_id` int NOT NULL AUTO_INCREMENT,
  `Satama_id` int NOT NULL,
  `PaikkaTyyppi_id` int NOT NULL,
  PRIMARY KEY (`Paikka_id`),
  KEY `PaikkaTyyppi_id_idx` (`PaikkaTyyppi_id`),
  KEY `Satama_id_idx` (`Satama_id`),
  CONSTRAINT `PaikkaTyyppi_id` FOREIGN KEY (`PaikkaTyyppi_id`) REFERENCES `PAIKKATYYPIT` (`PaikkaTyyppi_id`),
  CONSTRAINT `Satama_id_P` FOREIGN KEY (`Satama_id`) REFERENCES `SATAMAT` (`Satama_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIKAT`
--

LOCK TABLES `PAIKAT` WRITE;
/*!40000 ALTER TABLE `PAIKAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAIKAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIKKATYYPIT`
--

DROP TABLE IF EXISTS `PAIKKATYYPIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAIKKATYYPIT` (
  `PaikkaTyyppi_id` int NOT NULL AUTO_INCREMENT,
  `Tyyppi` varchar(50) DEFAULT NULL,
  `Leveys` varchar(5) NOT NULL,
  `Pituus` varchar(5) NOT NULL,
  `Syvays` varchar(5) NOT NULL,
  `Vrk_hinta` int NOT NULL,
  `Vklp_hinta` int DEFAULT NULL,
  `Vk_hinta` int DEFAULT NULL,
  PRIMARY KEY (`PaikkaTyyppi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIKKATYYPIT`
--

LOCK TABLES `PAIKKATYYPIT` WRITE;
/*!40000 ALTER TABLE `PAIKKATYYPIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAIKKATYYPIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIKKAVARAUKSET`
--

DROP TABLE IF EXISTS `PAIKKAVARAUKSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAIKKAVARAUKSET` (
  `Paikkavaraukset_id` int NOT NULL AUTO_INCREMENT,
  `Varaus_id` int NOT NULL,
  `Paikka_id` int NOT NULL,
  `AlkuAika` datetime NOT NULL,
  `LoppuAika` datetime NOT NULL,
  `Toteutunut` tinyint DEFAULT NULL,
  `Hinta` int DEFAULT NULL,
  PRIMARY KEY (`Paikkavaraukset_id`),
  KEY `Varaus_id_idx` (`Varaus_id`),
  KEY `Paikka_id_idx` (`Paikka_id`),
  CONSTRAINT `Paikka_id` FOREIGN KEY (`Paikka_id`) REFERENCES `PAIKAT` (`Paikka_id`),
  CONSTRAINT `Varaus_id` FOREIGN KEY (`Varaus_id`) REFERENCES `VARAUKSET` (`Varaus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIKKAVARAUKSET`
--

LOCK TABLES `PAIKKAVARAUKSET` WRITE;
/*!40000 ALTER TABLE `PAIKKAVARAUKSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAIKKAVARAUKSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PALVELUT`
--

DROP TABLE IF EXISTS `PALVELUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PALVELUT` (
  `Palvelu_id` int NOT NULL AUTO_INCREMENT,
  `Palvelu` varchar(100) NOT NULL,
  `Kuvaus` varchar(500) NOT NULL,
  `Hinta` int NOT NULL,
  PRIMARY KEY (`Palvelu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PALVELUT`
--

LOCK TABLES `PALVELUT` WRITE;
/*!40000 ALTER TABLE `PALVELUT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PALVELUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POSTINUMEROT`
--

DROP TABLE IF EXISTS `POSTINUMEROT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POSTINUMEROT` (
  `Postinumero` varchar(5) NOT NULL,
  `Postitoimipaikka` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Postinumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POSTINUMEROT`
--

LOCK TABLES `POSTINUMEROT` WRITE;
/*!40000 ALTER TABLE `POSTINUMEROT` DISABLE KEYS */;
/*!40000 ALTER TABLE `POSTINUMEROT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SATAMAPALVELUT`
--

DROP TABLE IF EXISTS `SATAMAPALVELUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SATAMAPALVELUT` (
  `Satamapalvelu_id` int NOT NULL AUTO_INCREMENT,
  `Satama_id` int NOT NULL,
  `Palvelu_id` int NOT NULL,
  `Kpl` int NOT NULL,
  PRIMARY KEY (`Satamapalvelu_id`),
  KEY `Satama_id_idx` (`Satama_id`),
  KEY `Palvelu_id_idx` (`Palvelu_id`),
  CONSTRAINT `Palvelu_id` FOREIGN KEY (`Palvelu_id`) REFERENCES `PALVELUT` (`Palvelu_id`),
  CONSTRAINT `Satama_id` FOREIGN KEY (`Satama_id`) REFERENCES `SATAMAT` (`Satama_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SATAMAPALVELUT`
--

LOCK TABLES `SATAMAPALVELUT` WRITE;
/*!40000 ALTER TABLE `SATAMAPALVELUT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SATAMAPALVELUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SATAMAT`
--

DROP TABLE IF EXISTS `SATAMAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SATAMAT` (
  `Satama_id` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(50) NOT NULL,
  `Puh` varchar(20) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Koordinaatit` varchar(60) NOT NULL,
  `Url` varchar(300) DEFAULT NULL,
  `Lisatiedot` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Satama_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SATAMAT`
--

LOCK TABLES `SATAMAT` WRITE;
/*!40000 ALTER TABLE `SATAMAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SATAMAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYYPIT`
--

DROP TABLE IF EXISTS `TYYPIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TYYPIT` (
  `Tyyppi_id` int NOT NULL AUTO_INCREMENT,
  `Tyyppi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Tyyppi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYYPIT`
--

LOCK TABLES `TYYPIT` WRITE;
/*!40000 ALTER TABLE `TYYPIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYYPIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VARAUKSET`
--

DROP TABLE IF EXISTS `VARAUKSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VARAUKSET` (
  `Varaus_id` int NOT NULL AUTO_INCREMENT,
  `Vene_id` int NOT NULL,
  `Asiakas_id` int NOT NULL,
  `Pvm` date NOT NULL,
  PRIMARY KEY (`Varaus_id`),
  KEY `Vene_id_idx` (`Vene_id`),
  KEY `Asiakas_id_idx` (`Asiakas_id`),
  CONSTRAINT `Asiakas_id` FOREIGN KEY (`Asiakas_id`) REFERENCES `ASIAKKAAT` (`Asiakas_id`),
  CONSTRAINT `Vene_id` FOREIGN KEY (`Vene_id`) REFERENCES `VENEET` (`Vene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VARAUKSET`
--

LOCK TABLES `VARAUKSET` WRITE;
/*!40000 ALTER TABLE `VARAUKSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `VARAUKSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VARAUSPALVELUT`
--

DROP TABLE IF EXISTS `VARAUSPALVELUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VARAUSPALVELUT` (
  `Varauspalvelu_id` int NOT NULL AUTO_INCREMENT,
  `Varaus_id` int NOT NULL,
  `Palvelu_id` int NOT NULL,
  PRIMARY KEY (`Varauspalvelu_id`),
  KEY `Varaus_id_VP_idx` (`Varaus_id`),
  KEY `Palvelu_id_P_idx` (`Palvelu_id`),
  CONSTRAINT `Palvelu_id_P` FOREIGN KEY (`Palvelu_id`) REFERENCES `PALVELUT` (`Palvelu_id`),
  CONSTRAINT `Varaus_id_VP` FOREIGN KEY (`Varaus_id`) REFERENCES `VARAUKSET` (`Varaus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VARAUSPALVELUT`
--

LOCK TABLES `VARAUSPALVELUT` WRITE;
/*!40000 ALTER TABLE `VARAUSPALVELUT` DISABLE KEYS */;
/*!40000 ALTER TABLE `VARAUSPALVELUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENEET`
--

DROP TABLE IF EXISTS `VENEET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENEET` (
  `Vene_id` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(70) NOT NULL,
  `Leveys` varchar(5) NOT NULL,
  `Pituus` varchar(5) NOT NULL,
  `Syvays` varchar(5) NOT NULL,
  `Tyyppi` int NOT NULL,
  PRIMARY KEY (`Vene_id`),
  KEY `Tyyppi_idx` (`Tyyppi`),
  CONSTRAINT `Tyyppi` FOREIGN KEY (`Tyyppi`) REFERENCES `TYYPIT` (`Tyyppi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENEET`
--

LOCK TABLES `VENEET` WRITE;
/*!40000 ALTER TABLE `VENEET` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENEET` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-25 18:30:57
