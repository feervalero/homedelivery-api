-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: homedelivery
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `City` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `City` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TransportationZone` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_City_State_idx` (`StateId`),
  CONSTRAINT `FK_City_State` FOREIGN KEY (`StateId`) REFERENCES `state` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Monterrey','MX-01-003',1);
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientAddress`
--

DROP TABLE IF EXISTS `ClientAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientAddress` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StateId` int(11) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `ZipCodeId` int(11) DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ClientAddress_State_idx` (`StateId`),
  KEY `FK_ClientAddress_ZipCode_idx` (`ZipCodeId`),
  KEY `FK_ClientAddress_City_idx` (`CityId`),
  CONSTRAINT `FK_ClientAddress_City` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`),
  CONSTRAINT `FK_ClientAddress_State` FOREIGN KEY (`StateId`) REFERENCES `state` (`Id`),
  CONSTRAINT `FK_ClientAddress_ZipCode` FOREIGN KEY (`ZipCodeId`) REFERENCES `zipcode` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientAddress`
--

LOCK TABLES `ClientAddress` WRITE;
/*!40000 ALTER TABLE `ClientAddress` DISABLE KEYS */;
INSERT INTO `ClientAddress` VALUES (1,1,1,1,'feervalero@gmail.com');
/*!40000 ALTER TABLE `ClientAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cluster`
--

DROP TABLE IF EXISTS `Cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cluster` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cluster` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Cluster_State_idx` (`StateId`),
  CONSTRAINT `FK_Cluster_State` FOREIGN KEY (`StateId`) REFERENCES `state` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cluster`
--

LOCK TABLES `Cluster` WRITE;
/*!40000 ALTER TABLE `Cluster` DISABLE KEYS */;
INSERT INTO `Cluster` VALUES (1,'Zona Norte',1);
/*!40000 ALTER TABLE `Cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coverage`
--

DROP TABLE IF EXISTS `Coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Coverage` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cobertura` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `ProductTypeId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL COMMENT 'Esta tabla sirve para determinar la cobertura de los servicios no la cobertura de la entrega del producto SKU',
  PRIMARY KEY (`Id`),
  KEY `FK_Coverage_State_idx` (`StateId`),
  KEY `FK_Coverage_City_idx` (`CityId`),
  KEY `FK_Coverage_ProductType_idx` (`ProductTypeId`),
  KEY `FK_Coverage_Service_idx` (`ServiceId`),
  CONSTRAINT `FK_Coverage_City` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`),
  CONSTRAINT `FK_Coverage_ProductType` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttype` (`Id`),
  CONSTRAINT `FK_Coverage_Service` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`Id`),
  CONSTRAINT `FK_Coverage_State` FOREIGN KEY (`StateId`) REFERENCES `state` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coverage`
--

LOCK TABLES `Coverage` WRITE;
/*!40000 ALTER TABLE `Coverage` DISABLE KEYS */;
INSERT INTO `Coverage` VALUES (3,1,1,1,1,1);
/*!40000 ALTER TABLE `Coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoverageToPlaces`
--

DROP TABLE IF EXISTS `CoverageToPlaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CoverageToPlaces` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CoverageId` int(11) DEFAULT NULL,
  `PlacesId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CoverageToPlaces_Coverage_idx` (`CoverageId`),
  KEY `FK_CoverageToPlaces_Place_idx` (`PlacesId`),
  CONSTRAINT `FK_CoverageToPlaces_Coverage` FOREIGN KEY (`CoverageId`) REFERENCES `coverage` (`Id`),
  CONSTRAINT `FK_CoverageToPlaces_Place` FOREIGN KEY (`PlacesId`) REFERENCES `places` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoverageToPlaces`
--

LOCK TABLES `CoverageToPlaces` WRITE;
/*!40000 ALTER TABLE `CoverageToPlaces` DISABLE KEYS */;
INSERT INTO `CoverageToPlaces` VALUES (2,3,1);
/*!40000 ALTER TABLE `CoverageToPlaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InventoryAllocation`
--

DROP TABLE IF EXISTS `InventoryAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InventoryAllocation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlantId` int(11) DEFAULT NULL,
  `StorageLocationId` int(11) DEFAULT NULL,
  `PlantDeterminationId` int(11) DEFAULT NULL,
  `Order` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_InventoryAllocation_Plant_idx` (`PlantId`),
  KEY `FK_InventoryAllocation_StorageLocation_idx` (`StorageLocationId`),
  KEY `FK_InventoryAllocation_PlantDetermination_idx` (`PlantDeterminationId`),
  CONSTRAINT `FK_InventoryAllocation_Plant` FOREIGN KEY (`PlantId`) REFERENCES `plant` (`Id`),
  CONSTRAINT `FK_InventoryAllocation_PlantDetermination` FOREIGN KEY (`PlantDeterminationId`) REFERENCES `plantdetermination` (`Id`),
  CONSTRAINT `FK_InventoryAllocation_StorageLocation` FOREIGN KEY (`StorageLocationId`) REFERENCES `storagelocation` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InventoryAllocation`
--

LOCK TABLES `InventoryAllocation` WRITE;
/*!40000 ALTER TABLE `InventoryAllocation` DISABLE KEYS */;
INSERT INTO `InventoryAllocation` VALUES (1,1,1,1,'1');
/*!40000 ALTER TABLE `InventoryAllocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Places`
--

DROP TABLE IF EXISTS `Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Places` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlaceTypeId` int(11) DEFAULT NULL,
  `PlantId` int(11) DEFAULT NULL,
  `StorageLocationId` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `Place` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Places_PlaceType_idx` (`PlaceTypeId`),
  KEY `FK_Places_Plant_idx` (`PlantId`),
  KEY `FK_Places_StorageLocation_idx` (`StorageLocationId`),
  KEY `FK_Places_State_idx` (`StateId`),
  CONSTRAINT `FK_Places_PlaceType` FOREIGN KEY (`PlaceTypeId`) REFERENCES `placetype` (`Id`),
  CONSTRAINT `FK_Places_Plant` FOREIGN KEY (`PlantId`) REFERENCES `plant` (`Id`),
  CONSTRAINT `FK_Places_State` FOREIGN KEY (`StateId`) REFERENCES `state` (`Id`),
  CONSTRAINT `FK_Places_StorageLocation` FOREIGN KEY (`StorageLocationId`) REFERENCES `storagelocation` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Places`
--

LOCK TABLES `Places` WRITE;
/*!40000 ALTER TABLE `Places` DISABLE KEYS */;
INSERT INTO `Places` VALUES (1,1,1,1,1,'Will Call para la planta','Miguel Aleman 123');
/*!40000 ALTER TABLE `Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaceType`
--

DROP TABLE IF EXISTS `PlaceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlaceType` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlaceType` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlaceType`
--

LOCK TABLES `PlaceType` WRITE;
/*!40000 ALTER TABLE `PlaceType` DISABLE KEYS */;
INSERT INTO `PlaceType` VALUES (1,'WillCall'),(2,'Ocurre'),(3,'Domicilio'),(4,'Inmediata');
/*!40000 ALTER TABLE `PlaceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plant`
--

DROP TABLE IF EXISTS `Plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plant` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Plant` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plant`
--

LOCK TABLES `Plant` WRITE;
/*!40000 ALTER TABLE `Plant` DISABLE KEYS */;
INSERT INTO `Plant` VALUES (1,'RM04'),(2,'RM01'),(3,'RM08'),(4,'WS01');
/*!40000 ALTER TABLE `Plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlantDetermination`
--

DROP TABLE IF EXISTS `PlantDetermination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlantDetermination` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClusterId` int(11) DEFAULT NULL,
  `ProductTypeId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PlantDetermination_Cluster_idx` (`ClusterId`),
  KEY `FK_PlantDetermination_ProductType_idx` (`ProductTypeId`),
  KEY `FK_PlantDetermination_Service_idx` (`ServiceId`),
  CONSTRAINT `FK_PlantDetermination_Cluster` FOREIGN KEY (`ClusterId`) REFERENCES `cluster` (`Id`),
  CONSTRAINT `FK_PlantDetermination_ProductType` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttype` (`Id`),
  CONSTRAINT `FK_PlantDetermination_Service` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlantDetermination`
--

LOCK TABLES `PlantDetermination` WRITE;
/*!40000 ALTER TABLE `PlantDetermination` DISABLE KEYS */;
INSERT INTO `PlantDetermination` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `PlantDetermination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlantService`
--

DROP TABLE IF EXISTS `PlantService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlantService` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClusterId` int(11) DEFAULT NULL,
  `ProductTypeId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `PlantId` int(11) DEFAULT NULL,
  `StorageLocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PlantService_Cluster_idx` (`ClusterId`),
  KEY `FK_PlantService_Plant_idx` (`PlantId`),
  KEY `FK_PlantService_ProductType_idx` (`ProductTypeId`),
  KEY `FK_PlantService_Service_idx` (`ServiceId`),
  KEY `FK_PlantService_StorageLocation_idx` (`StorageLocationId`),
  CONSTRAINT `FK_PlantService_Cluster` FOREIGN KEY (`ClusterId`) REFERENCES `cluster` (`Id`),
  CONSTRAINT `FK_PlantService_Plant` FOREIGN KEY (`PlantId`) REFERENCES `plant` (`Id`),
  CONSTRAINT `FK_PlantService_ProductType` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttype` (`Id`),
  CONSTRAINT `FK_PlantService_Service` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`Id`),
  CONSTRAINT `FK_PlantService_StorageLocation` FOREIGN KEY (`StorageLocationId`) REFERENCES `storagelocation` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlantService`
--

LOCK TABLES `PlantService` WRITE;
/*!40000 ALTER TABLE `PlantService` DISABLE KEYS */;
INSERT INTO `PlantService` VALUES (3,1,1,1,1,1);
/*!40000 ALTER TABLE `PlantService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductType`
--

DROP TABLE IF EXISTS `ProductType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductType` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductType` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductType`
--

LOCK TABLES `ProductType` WRITE;
/*!40000 ALTER TABLE `ProductType` DISABLE KEYS */;
INSERT INTO `ProductType` VALUES (1,'SDA'),(2,'MDA');
/*!40000 ALTER TABLE `ProductType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Price` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cost` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ClusterId` int(11) DEFAULT NULL,
  `ProductTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Service_Cluster_idx` (`ClusterId`),
  KEY `FK_Service_ProductType_idx` (`ProductTypeId`),
  CONSTRAINT `FK_Service_Cluster` FOREIGN KEY (`ClusterId`) REFERENCES `cluster` (`Id`),
  CONSTRAINT `FK_Service_ProductType` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (1,'ENTREGA (Will-Call)	\nEntrega(Will call)','200','300',1,1);
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `State`
--

DROP TABLE IF EXISTS `State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `State` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `State` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `State`
--

LOCK TABLES `State` WRITE;
/*!40000 ALTER TABLE `State` DISABLE KEYS */;
INSERT INTO `State` VALUES (1,'Nuevo Leon');
/*!40000 ALTER TABLE `State` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StorageLocation`
--

DROP TABLE IF EXISTS `StorageLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StorageLocation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StorageLocation` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StorageLocation`
--

LOCK TABLES `StorageLocation` WRITE;
/*!40000 ALTER TABLE `StorageLocation` DISABLE KEYS */;
INSERT INTO `StorageLocation` VALUES (1,'0001'),(2,'0002');
/*!40000 ALTER TABLE `StorageLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZipCode`
--

DROP TABLE IF EXISTS `ZipCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ZipCode` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ZipCode` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZipCode`
--

LOCK TABLES `ZipCode` WRITE;
/*!40000 ALTER TABLE `ZipCode` DISABLE KEYS */;
INSERT INTO `ZipCode` VALUES (1,'66440');
/*!40000 ALTER TABLE `ZipCode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 12:04:21
