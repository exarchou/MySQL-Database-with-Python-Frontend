-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB
DROP SCHEMA IF EXISTS `heroku_188970d196d4f26`;
CREATE SCHEMA `heroku_188970d196d4f26`;
USE `heroku_188970d196d4f26`;


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
-- Temporary table structure for view `all_galaxies_black_holes_mass`
--

DROP TABLE IF EXISTS `all_galaxies_black_holes_mass`;
/*!50001 DROP VIEW IF EXISTS `all_galaxies_black_holes_mass`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_galaxies_black_holes_mass` (
  `Black_Hole` tinyint NOT NULL,
  `Mass` tinyint NOT NULL,
  `Galaxy` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `all_moons_mass`
--

DROP TABLE IF EXISTS `all_moons_mass`;
/*!50001 DROP VIEW IF EXISTS `all_moons_mass`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_moons_mass` (
  `Mass` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `all_planetary_systems_satellites_launch_sites`
--

DROP TABLE IF EXISTS `all_planetary_systems_satellites_launch_sites`;
/*!50001 DROP VIEW IF EXISTS `all_planetary_systems_satellites_launch_sites`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_planetary_systems_satellites_launch_sites` (
  `Planetary_System` tinyint NOT NULL,
  `Planet` tinyint NOT NULL,
  `Launch_Site` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `all_planets_civilizations`
--

DROP TABLE IF EXISTS `all_planets_civilizations`;
/*!50001 DROP VIEW IF EXISTS `all_planets_civilizations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_planets_civilizations` (
  `Planet` tinyint NOT NULL,
  `Civilization` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `asteroid`
--

DROP TABLE IF EXISTS `asteroid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asteroid` (
  `AsteroidID` int(6) NOT NULL,
  `Diameter` int(6) unsigned NOT NULL,
  `Type` enum('Chondrite','Stony','Metallic','Other') DEFAULT NULL,
  `PlanetarySystem_PlanetarySystemID` int(6) NOT NULL,
  PRIMARY KEY (`AsteroidID`,`PlanetarySystem_PlanetarySystemID`),
  KEY `fk_Asteroid_Planetary System_idx` (`PlanetarySystem_PlanetarySystemID`),
  CONSTRAINT `fk_Asteroid_Planetary System` FOREIGN KEY (`PlanetarySystem_PlanetarySystemID`) REFERENCES `planetarysystem` (`PlanetarySystemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asteroid`
--

LOCK TABLES `asteroid` WRITE;
/*!40000 ALTER TABLE `asteroid` DISABLE KEYS */;
INSERT INTO `asteroid` VALUES (23233,268,'Stony',1),(23235,254,'Other',32),(43543,434,'Chondrite',32),(87654,512,'Chondrite',10012),(90821,939,'Chondrite',1),(90822,525,'Chondrite',10012);
/*!40000 ALTER TABLE `asteroid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackhole`
--

DROP TABLE IF EXISTS `blackhole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackhole` (
  `BlackHoleID` int(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Mass` float unsigned DEFAULT NULL,
  `Type` enum('stellar','intermediate','supermassive','miniature') DEFAULT NULL,
  `Galaxy_GalaxyID` int(6) DEFAULT NULL,
  PRIMARY KEY (`BlackHoleID`),
  KEY `fk_Black Hole_Galaxy1_idx` (`Galaxy_GalaxyID`),
  CONSTRAINT `fk_Black Hole_Galaxy1` FOREIGN KEY (`Galaxy_GalaxyID`) REFERENCES `galaxy` (`GalaxyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackhole`
--

LOCK TABLES `blackhole` WRITE;
/*!40000 ALTER TABLE `blackhole` DISABLE KEYS */;
INSERT INTO `blackhole` VALUES (42042,'HR 6819',6.3,'intermediate',1),(42043,'A0620-00',11.3,'supermassive',1),(42044,'XTE J1118+480',6.5,'intermediate',1),(42045,'Gargantua',6.7,'intermediate',2),(42046,'GRO J0422+32',3.97,'miniature',2),(42047,'Cygnus X-3',10.3,'stellar',1);
/*!40000 ALTER TABLE `blackhole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `civilization`
--

DROP TABLE IF EXISTS `civilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `civilization` (
  `CivilizationID` int(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` enum('planetary','stellar','galactic') DEFAULT NULL,
  PRIMARY KEY (`CivilizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civilization`
--

LOCK TABLES `civilization` WRITE;
/*!40000 ALTER TABLE `civilization` DISABLE KEYS */;
INSERT INTO `civilization` VALUES (1,'Humanity','planetary'),(3,'Chitauri','stellar'),(5,'The Klyntar','stellar'),(76,'Luphomoids','galactic'),(98,'Skrulls','galactic'),(10002,'Celestials','galactic'),(23432,'Martians','planetary'),(78878,'The Sovereign','stellar');
/*!40000 ALTER TABLE `civilization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galaxy`
--

DROP TABLE IF EXISTS `galaxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galaxy` (
  `GalaxyID` int(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Shape` enum('Spiral','Elliptical','Lenticular','Irregular') DEFAULT NULL,
  PRIMARY KEY (`GalaxyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galaxy`
--

LOCK TABLES `galaxy` WRITE;
/*!40000 ALTER TABLE `galaxy` DISABLE KEYS */;
INSERT INTO `galaxy` VALUES (1,'Milky Way','Spiral'),(2,'Andromeda Galaxy','Spiral'),(5,'Whirlpool Galaxy','Spiral'),(102,'IC 1101','Elliptical'),(506,'Carina dwarf','Irregular'),(607,'NGC 7814','Spiral'),(1002,'NGC 1375','Lenticular');
/*!40000 ALTER TABLE `galaxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moon`
--

DROP TABLE IF EXISTS `moon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moon` (
  `MoonID` int(6) NOT NULL,
  `Mass` float unsigned DEFAULT NULL,
  `Diameter` int(6) unsigned DEFAULT NULL,
  `OrbitalDays` float unsigned DEFAULT NULL,
  `Planet_PlanetID` int(6) NOT NULL,
  PRIMARY KEY (`MoonID`,`Planet_PlanetID`),
  KEY `fk_Moon_Planet1_idx` (`Planet_PlanetID`),
  CONSTRAINT `fk_Moon_Planet1` FOREIGN KEY (`Planet_PlanetID`) REFERENCES `planet` (`PlanetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moon`
--

LOCK TABLES `moon` WRITE;
/*!40000 ALTER TABLE `moon` DISABLE KEYS */;
INSERT INTO `moon` VALUES (1,7.34,384399,27.32,1),(1,1.08,9380,0.319,7),(1,3.6,421800,1769,32),(2,2,23460,1262,7),(2,0.2,671100,35551,32),(4,0.66,377420,2737,744),(5,15.95,527070,4518,744),(13,4,48387000,9379.99,42),(17,352,12179400,1288.38,69);
/*!40000 ALTER TABLE `moon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet`
--

DROP TABLE IF EXISTS `planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planet` (
  `PlanetID` int(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Mass` float unsigned DEFAULT NULL,
  `OrbitalPeriod` float unsigned DEFAULT NULL,
  `DistanceFromStar` int(10) unsigned DEFAULT NULL,
  `PlanetarySystem_PlanetarySystemID` int(6) NOT NULL,
  PRIMARY KEY (`PlanetID`),
  KEY `fk_Planet_Planetary System1_idx` (`PlanetarySystem_PlanetarySystemID`),
  CONSTRAINT `fk_Planet_Planetary System1` FOREIGN KEY (`PlanetarySystem_PlanetarySystemID`) REFERENCES `planetarysystem` (`PlanetarySystemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet`
--

LOCK TABLES `planet` WRITE;
/*!40000 ALTER TABLE `planet` DISABLE KEYS */;
INSERT INTO `planet` VALUES (1,'Earth',1,1,149600000,1),(7,'Mars',0.11,1.03,227900000,1),(32,'Jupiter',317.83,0.41,778500000,1),(42,'Neptune',17.15,0.67,44950000,1),(69,'Uranus',14.54,0.72,2871000000,1),(744,'Saturn',95.16,0.44,1434000000,1),(777,'Krypton',102.5,4.42,375004895,10012),(999,'Asgard',99.99,9.99,99999999,32);
/*!40000 ALTER TABLE `planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet_has_civilization`
--

DROP TABLE IF EXISTS `planet_has_civilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planet_has_civilization` (
  `Planet_PlanetID` int(6) NOT NULL DEFAULT '0',
  `Civilization_CivilizationID` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Planet_PlanetID`,`Civilization_CivilizationID`),
  KEY `fk_Planet_has_Civilization_Civilization1_idx` (`Civilization_CivilizationID`),
  KEY `fk_Planet_has_Civilization_Planet1_idx` (`Planet_PlanetID`),
  CONSTRAINT `fk_Planet_has_Civilization_Civilization1` FOREIGN KEY (`Civilization_CivilizationID`) REFERENCES `civilization` (`CivilizationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planet_has_Civilization_Planet1` FOREIGN KEY (`Planet_PlanetID`) REFERENCES `planet` (`PlanetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet_has_civilization`
--

LOCK TABLES `planet_has_civilization` WRITE;
/*!40000 ALTER TABLE `planet_has_civilization` DISABLE KEYS */;
INSERT INTO `planet_has_civilization` VALUES (1,1),(7,5),(32,10002),(42,23432),(744,3),(777,98),(999,78878);
/*!40000 ALTER TABLE `planet_has_civilization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planetarysystem`
--

DROP TABLE IF EXISTS `planetarysystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planetarysystem` (
  `PlanetarySystemID` int(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Constellation` varchar(45) DEFAULT NULL,
  `Mass` float unsigned DEFAULT NULL,
  `Galaxy_GalaxyID` int(6) DEFAULT NULL,
  PRIMARY KEY (`PlanetarySystemID`),
  KEY `fk_Planetary System_Galaxy1_idx` (`Galaxy_GalaxyID`),
  CONSTRAINT `fk_Planetary System_Galaxy1` FOREIGN KEY (`Galaxy_GalaxyID`) REFERENCES `galaxy` (`GalaxyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planetarysystem`
--

LOCK TABLES `planetarysystem` WRITE;
/*!40000 ALTER TABLE `planetarysystem` DISABLE KEYS */;
INSERT INTO `planetarysystem` VALUES (1,'Solar System','Centaurus',100014,1),(32,'Yggdrasil','Ragnarok',540005,506),(10012,'M3 Solar System','Scutum',110002,5),(23457,'GF 983 S','Orion',6540,2),(98987,'Titanosaur','Polonus',532120,607),(877777,'Houmongosor','Vorionopus',128871,506);
/*!40000 ALTER TABLE `planetarysystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satellite`
--

DROP TABLE IF EXISTS `satellite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `satellite` (
  `SatelliteID` int(6) NOT NULL,
  `LaunchSite` varchar(45) DEFAULT NULL,
  `CarrierRocket` varchar(45) DEFAULT NULL,
  `Planet_PlanetID` int(6) NOT NULL,
  PRIMARY KEY (`SatelliteID`,`Planet_PlanetID`),
  KEY `fk_Satellite_Planet1_idx` (`Planet_PlanetID`),
  CONSTRAINT `fk_Satellite_Planet1` FOREIGN KEY (`Planet_PlanetID`) REFERENCES `planet` (`PlanetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satellite`
--

LOCK TABLES `satellite` WRITE;
/*!40000 ALTER TABLE `satellite` DISABLE KEYS */;
INSERT INTO `satellite` VALUES (38,'Boca Chica','Atlas LV-3 Agena-D',7),(194,'VAFB, SLC-3E','Atlas E/F SGS-1',1),(446,'Boca Chica','Atlas SLV-3C Centaur-D',7),(1643,'Kourou','Soyuz ST-B/Fregat-MT',1),(2384,'Baikonur','Soyuz-FG/Fregat',1),(76125,'Delta II','CCAFS, LC-17A',1),(90645,'Falcon 9','CCAFS, SLC-40',1);
/*!40000 ALTER TABLE `satellite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `StarID` int(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Mass` float unsigned DEFAULT NULL,
  `DistanceFromEarth` float unsigned DEFAULT NULL,
  `PlanetarySystem_PlanetarySystemID` int(6) DEFAULT NULL,
  PRIMARY KEY (`StarID`),
  KEY `fk_Star_Planetary System1_idx` (`PlanetarySystem_PlanetarySystemID`),
  CONSTRAINT `fk_Star_Planetary System1` FOREIGN KEY (`PlanetarySystem_PlanetarySystemID`) REFERENCES `planetarysystem` (`PlanetarySystemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (1,'Sun',1,0.0000158,1),(1000,'Proxima Centauri',0.1221,42.441,98987),(10000,'Wolf359',0.09,7.856,32),(12232,'Sirius',2.02,8.659,23457),(12233,'Luyten 726-8',0.102,8.791,10012),(32333,'EZ Aquarii',0.11,11.109,23457);
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_galaxies_black_holes_mass`
--

/*!50001 DROP TABLE IF EXISTS `all_galaxies_black_holes_mass`*/;
/*!50001 DROP VIEW IF EXISTS `all_galaxies_black_holes_mass`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `all_galaxies_black_holes_mass` AS select `blackhole`.`Name` AS `Black_Hole`,`blackhole`.`Mass` AS `Mass`,`galaxy`.`Name` AS `Galaxy` from (`blackhole` join `galaxy` on((`blackhole`.`Galaxy_GalaxyID` = `galaxy`.`GalaxyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_moons_mass`
--

/*!50001 DROP TABLE IF EXISTS `all_moons_mass`*/;
/*!50001 DROP VIEW IF EXISTS `all_moons_mass`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `all_moons_mass` AS select `moon`.`Mass` AS `Mass` from (`planet` join `moon` on((`moon`.`Planet_PlanetID` = `planet`.`PlanetID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_planetary_systems_satellites_launch_sites`
--

/*!50001 DROP TABLE IF EXISTS `all_planetary_systems_satellites_launch_sites`*/;
/*!50001 DROP VIEW IF EXISTS `all_planetary_systems_satellites_launch_sites`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `all_planetary_systems_satellites_launch_sites` AS select `planetarysystem`.`Name` AS `Planetary_System`,`planet`.`Name` AS `Planet`,`satellite`.`LaunchSite` AS `Launch_Site` from ((`satellite` join `planet` on((`satellite`.`Planet_PlanetID` = `planet`.`PlanetID`))) join `planetarysystem` on((`planetarysystem`.`PlanetarySystemID` = `planet`.`PlanetarySystem_PlanetarySystemID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_planets_civilizations`
--

/*!50001 DROP TABLE IF EXISTS `all_planets_civilizations`*/;
/*!50001 DROP VIEW IF EXISTS `all_planets_civilizations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `all_planets_civilizations` AS select `planet`.`Name` AS `Planet`,`civilization`.`Name` AS `Civilization` from ((`planet` join `planet_has_civilization` on((`planet`.`PlanetID` = `planet_has_civilization`.`Planet_PlanetID`))) join `civilization` on((`civilization`.`CivilizationID` = `planet_has_civilization`.`Civilization_CivilizationID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 18:10:37
