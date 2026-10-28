-- Export van database `jamin` (BE-opdracht 02, incl. stored procedures)
-- Gegenereerd op 2026-10-28 09:39:58


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
DROP TABLE IF EXISTS `allergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `allergeen` WRITE;
/*!40000 ALTER TABLE `allergeen` DISABLE KEYS */;
INSERT INTO `allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-10-28 09:39:58.151860','2026-10-28 09:39:58.151863'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-10-28 09:39:58.151889','2026-10-28 09:39:58.151889'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-10-28 09:39:58.151913','2026-10-28 09:39:58.151913'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-10-28 09:39:58.151917','2026-10-28 09:39:58.151917'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-10-28 09:39:58.151920','2026-10-28 09:39:58.151921');
/*!40000 ALTER TABLE `allergeen` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Leverancier_LeverancierNummer` (`LeverancierNummer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `leverancier` WRITE;
/*!40000 ALTER TABLE `leverancier` DISABLE KEYS */;
INSERT INTO `leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',_binary '',NULL,'2026-10-28 09:39:58.176503','2026-10-28 09:39:58.176506'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',_binary '',NULL,'2026-10-28 09:39:58.176549','2026-10-28 09:39:58.176549'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',_binary '',NULL,'2026-10-28 09:39:58.176561','2026-10-28 09:39:58.176561'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',_binary '',NULL,'2026-10-28 09:39:58.176567','2026-10-28 09:39:58.176567'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',_binary '',NULL,'2026-10-28 09:39:58.176572','2026-10-28 09:39:58.176572'),(6,'Quality Street','Johan Nooij','L1029234586','06-23458456',_binary '',NULL,'2026-10-28 09:39:58.176577','2026-10-28 09:39:58.176577');
/*!40000 ALTER TABLE `leverancier` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `magazijn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazijn` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `VerpakkingsEenheidInKilogram` decimal(6,3) NOT NULL,
  `AantalAanwezig` int unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `magazijn` WRITE;
/*!40000 ALTER TABLE `magazijn` DISABLE KEYS */;
INSERT INTO `magazijn` VALUES (1,1,5.000,453,_binary '',NULL,'2026-10-28 09:39:58.195806','2026-10-28 09:39:58.195810'),(2,2,2.500,400,_binary '',NULL,'2026-10-28 09:39:58.195861','2026-10-28 09:39:58.195862'),(3,3,5.000,1,_binary '',NULL,'2026-10-28 09:39:58.195873','2026-10-28 09:39:58.195873'),(4,4,1.000,800,_binary '',NULL,'2026-10-28 09:39:58.195879','2026-10-28 09:39:58.195879'),(5,5,3.000,234,_binary '',NULL,'2026-10-28 09:39:58.195885','2026-10-28 09:39:58.195885'),(6,6,2.000,345,_binary '',NULL,'2026-10-28 09:39:58.195890','2026-10-28 09:39:58.195890'),(7,7,1.000,795,_binary '',NULL,'2026-10-28 09:39:58.195895','2026-10-28 09:39:58.195896'),(8,8,10.000,233,_binary '',NULL,'2026-10-28 09:39:58.195901','2026-10-28 09:39:58.195901'),(9,9,2.500,123,_binary '',NULL,'2026-10-28 09:39:58.195909','2026-10-28 09:39:58.195909'),(10,10,3.000,NULL,_binary '',NULL,'2026-10-28 09:39:58.195913','2026-10-28 09:39:58.195914'),(11,11,2.000,367,_binary '',NULL,'2026-10-28 09:39:58.195918','2026-10-28 09:39:58.195918'),(12,12,1.000,467,_binary '',NULL,'2026-10-28 09:39:58.195923','2026-10-28 09:39:58.195923'),(13,13,5.000,20,_binary '',NULL,'2026-10-28 09:39:58.195928','2026-10-28 09:39:58.195928');
/*!40000 ALTER TABLE `magazijn` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Barcode` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Product_Barcode` (`Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-10-28 09:39:58.140842','2026-10-28 09:39:58.140846'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-10-28 09:39:58.140886','2026-10-28 09:39:58.140886'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-10-28 09:39:58.140900','2026-10-28 09:39:58.140900'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-10-28 09:39:58.140905','2026-10-28 09:39:58.140905'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-10-28 09:39:58.140910','2026-10-28 09:39:58.140911'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-10-28 09:39:58.140915','2026-10-28 09:39:58.140916'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-10-28 09:39:58.140921','2026-10-28 09:39:58.140921'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-10-28 09:39:58.140926','2026-10-28 09:39:58.140926'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-10-28 09:39:58.140932','2026-10-28 09:39:58.140932'),(10,'Winegums','8719587327527',_binary '\0','Wordt niet meer geproduceerd','2026-10-28 09:39:58.140937','2026-10-28 09:39:58.140937'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-10-28 09:39:58.140945','2026-10-28 09:39:58.140945'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-10-28 09:39:58.140950','2026-10-28 09:39:58.140950'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-10-28 09:39:58.140955','2026-10-28 09:39:58.140955');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `productperallergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperallergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `AllergeenId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_ProductPerAllergeen_Product_Allergeen` (`ProductId`,`AllergeenId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `productperallergeen` WRITE;
/*!40000 ALTER TABLE `productperallergeen` DISABLE KEYS */;
INSERT INTO `productperallergeen` VALUES (1,1,2,_binary '',NULL,'2026-10-28 09:39:58.223255','2026-10-28 09:39:58.223258'),(2,1,1,_binary '',NULL,'2026-10-28 09:39:58.223297','2026-10-28 09:39:58.223298'),(3,1,3,_binary '',NULL,'2026-10-28 09:39:58.223310','2026-10-28 09:39:58.223310'),(4,3,4,_binary '',NULL,'2026-10-28 09:39:58.223318','2026-10-28 09:39:58.223318'),(5,6,5,_binary '',NULL,'2026-10-28 09:39:58.223325','2026-10-28 09:39:58.223325'),(6,9,2,_binary '',NULL,'2026-10-28 09:39:58.223331','2026-10-28 09:39:58.223332'),(7,9,5,_binary '',NULL,'2026-10-28 09:39:58.223339','2026-10-28 09:39:58.223339'),(8,10,2,_binary '',NULL,'2026-10-28 09:39:58.223346','2026-10-28 09:39:58.223346'),(9,12,4,_binary '',NULL,'2026-10-28 09:39:58.223357','2026-10-28 09:39:58.223357'),(10,13,1,_binary '',NULL,'2026-10-28 09:39:58.223364','2026-10-28 09:39:58.223364'),(11,13,4,_binary '',NULL,'2026-10-28 09:39:58.223370','2026-10-28 09:39:58.223370'),(12,13,5,_binary '',NULL,'2026-10-28 09:39:58.223377','2026-10-28 09:39:58.223377');
/*!40000 ALTER TABLE `productperallergeen` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `productperleverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperleverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` int unsigned NOT NULL,
  `ProductId` int unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `productperleverancier` WRITE;
/*!40000 ALTER TABLE `productperleverancier` DISABLE KEYS */;
INSERT INTO `productperleverancier` VALUES (1,1,1,'2024-11-09',23,'2024-11-16',_binary '',NULL,'2026-10-28 09:39:58.259644','2026-10-28 09:39:58.259646'),(2,1,1,'2024-11-18',21,'2024-11-25',_binary '',NULL,'2026-10-28 09:39:58.259688','2026-10-28 09:39:58.259688'),(3,1,2,'2024-11-09',12,'2024-11-16',_binary '',NULL,'2026-10-28 09:39:58.259705','2026-10-28 09:39:58.259705'),(4,1,3,'2024-11-10',11,'2024-11-17',_binary '',NULL,'2026-10-28 09:39:58.259713','2026-10-28 09:39:58.259714'),(5,2,4,'2024-11-14',16,'2024-11-21',_binary '',NULL,'2026-10-28 09:39:58.259721','2026-10-28 09:39:58.259721'),(6,2,4,'2024-11-21',23,'2024-11-28',_binary '',NULL,'2026-10-28 09:39:58.259729','2026-10-28 09:39:58.259729'),(7,2,5,'2024-11-14',45,'2024-11-21',_binary '',NULL,'2026-10-28 09:39:58.259736','2026-10-28 09:39:58.259736'),(8,2,6,'2024-11-14',30,'2024-11-21',_binary '',NULL,'2026-10-28 09:39:58.259743','2026-10-28 09:39:58.259743'),(9,3,7,'2024-11-12',12,'2024-11-19',_binary '',NULL,'2026-10-28 09:39:58.259750','2026-10-28 09:39:58.259750'),(10,3,7,'2024-11-19',23,'2024-11-26',_binary '',NULL,'2026-10-28 09:39:58.259757','2026-10-28 09:39:58.259757'),(11,3,8,'2024-11-10',12,'2024-11-17',_binary '',NULL,'2026-10-28 09:39:58.259764','2026-10-28 09:39:58.259764'),(12,3,9,'2024-11-11',1,'2024-11-18',_binary '',NULL,'2026-10-28 09:39:58.259771','2026-10-28 09:39:58.259772'),(13,4,10,'2024-11-16',24,'2024-11-30',_binary '',NULL,'2026-10-28 09:39:58.259779','2026-10-28 09:39:58.259780'),(14,5,11,'2024-11-10',47,'2024-11-17',_binary '',NULL,'2026-10-28 09:39:58.259799','2026-10-28 09:39:58.259799'),(15,5,11,'2024-11-19',60,'2024-11-26',_binary '',NULL,'2026-10-28 09:39:58.259814','2026-10-28 09:39:58.259814'),(16,5,12,'2024-11-11',45,NULL,_binary '',NULL,'2026-10-28 09:39:58.259820','2026-10-28 09:39:58.259821'),(17,5,13,'2024-11-12',23,NULL,_binary '',NULL,'2026-10-28 09:39:58.259828','2026-10-28 09:39:58.259828');
/*!40000 ALTER TABLE `productperleverancier` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateLevering` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateLevering`(
    IN p_LeverancierId              INT UNSIGNED
   ,IN p_ProductId                  INT UNSIGNED
   ,IN p_Aantal                     INT UNSIGNED
   ,IN p_DatumEerstVolgendeLevering DATE
)
BEGIN
    DECLARE v_ProductIsActief TINYINT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SELECT   CAST(PROD.IsActief AS UNSIGNED)
    INTO     v_ProductIsActief
    FROM     Product AS PROD
    WHERE    PROD.Id = p_ProductId;

    IF v_ProductIsActief = 0 THEN
        SELECT 0 AS IsGelukt;
    ELSE
        START TRANSACTION;

        INSERT INTO ProductPerLeverancier
        (
             LeverancierId
            ,ProductId
            ,DatumLevering
            ,Aantal
            ,DatumEerstVolgendeLevering
            ,IsActief
            ,Opmerking
            ,DatumAangemaakt
            ,DatumGewijzigd
        )
        VALUES
        (
             p_LeverancierId
            ,p_ProductId
            ,CURDATE()
            ,p_Aantal
            ,p_DatumEerstVolgendeLevering
            ,1
            ,NULL
            ,SYSDATE(6)
            ,SYSDATE(6)
        );

        UPDATE   Magazijn
        SET      AantalAanwezig = COALESCE(AantalAanwezig, 0) + p_Aantal
                ,DatumGewijzigd = SYSDATE(6)
        WHERE    ProductId = p_ProductId;

        COMMIT;

        SELECT 1 AS IsGelukt;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAllLeveranciers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllLeveranciers`()
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
            ,COUNT(DISTINCT PPLE.ProductId)     AS AantalVerschillendeProducten
    FROM     Leverancier AS LEVE
    LEFT JOIN ProductPerLeverancier AS PPLE
           ON PPLE.LeverancierId = LEVE.Id
    GROUP BY LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    ORDER BY AantalVerschillendeProducten DESC
            ,LEVE.Naam ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetGeleverdeProductenByLeverancierId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetGeleverdeProductenByLeverancierId`(
    IN p_LeverancierId  INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id                            AS ProductId
            ,PROD.Naam
            ,MAGA.AantalAanwezig
            ,MAGA.VerpakkingsEenheidInKilogram  AS VerpakkingsEenheid
            ,MAX(PPLE.DatumLevering)            AS LaatsteLevering
    FROM     ProductPerLeverancier AS PPLE
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    LEFT JOIN Magazijn AS MAGA
           ON MAGA.ProductId = PROD.Id
    WHERE    PPLE.LeverancierId = p_LeverancierId
    GROUP BY PROD.Id
            ,PROD.Naam
            ,MAGA.AantalAanwezig
            ,MAGA.VerpakkingsEenheidInKilogram
    ORDER BY MAGA.AantalAanwezig DESC
            ,PROD.Naam ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetLeverancierById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetLeverancierById`(
    IN p_LeverancierId  INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    FROM     Leverancier AS LEVE
    WHERE    LEVE.Id = p_LeverancierId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetLeveringProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetLeveringProduct`(
    IN p_LeverancierId  INT UNSIGNED
   ,IN p_ProductId      INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id                        AS ProductId
            ,PROD.Naam                      AS ProductNaam
            ,CAST(PROD.IsActief AS UNSIGNED) AS ProductIsActief
            ,LEVE.Id                        AS LeverancierId
            ,LEVE.Naam                      AS LeverancierNaam
            ,LEVE.ContactPersoon
            ,LEVE.Mobiel
    FROM     Product AS PROD
    CROSS JOIN Leverancier AS LEVE
    WHERE    PROD.Id = p_ProductId
      AND    LEVE.Id = p_LeverancierId
      AND    EXISTS (SELECT 1
                     FROM   ProductPerLeverancier AS PPLE
                     WHERE  PPLE.LeverancierId = LEVE.Id
                       AND  PPLE.ProductId     = PROD.Id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

