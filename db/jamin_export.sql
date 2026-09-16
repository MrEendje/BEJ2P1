-- Export van database `jamin` (BE-opdracht 01)
-- Gegenereerd op 2026-09-16 07:37:13

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Tabel: Product
-- ----------------------------
DROP TABLE IF EXISTS `Product`;
CREATE TABLE `product` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Barcode` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Product_Barcode` (`Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Product` (`Id`, `Naam`, `Barcode`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Mintnopjes', '8719587231278', 1, NULL, '2026-09-16 09:27:38.152028', '2026-09-16 09:27:38.152034'),
(2, 'Schoolkrijt', '8719587326713', 1, NULL, '2026-09-16 09:27:38.152288', '2026-09-16 09:27:38.152290'),
(3, 'Honingdrop', '8719587327836', 1, NULL, '2026-09-16 09:27:38.152317', '2026-09-16 09:27:38.152317'),
(4, 'Zure Beren', '8719587321441', 1, NULL, '2026-09-16 09:27:38.152322', '2026-09-16 09:27:38.152323'),
(5, 'Cola Flesjes', '8719587321237', 1, NULL, '2026-09-16 09:27:38.152327', '2026-09-16 09:27:38.152327'),
(6, 'Turtles', '8719587322245', 1, NULL, '2026-09-16 09:27:38.152332', '2026-09-16 09:27:38.152332'),
(7, 'Witte Muizen', '8719587328256', 1, NULL, '2026-09-16 09:27:38.152337', '2026-09-16 09:27:38.152339'),
(8, 'Reuzen Slangen', '8719587325641', 1, NULL, '2026-09-16 09:27:38.152349', '2026-09-16 09:27:38.152349'),
(9, 'Zoute Rijen', '8719587322739', 1, NULL, '2026-09-16 09:27:38.152369', '2026-09-16 09:27:38.152369'),
(10, 'Winegums', '8719587327527', 1, NULL, '2026-09-16 09:27:38.152380', '2026-09-16 09:27:38.152381'),
(11, 'Drop Munten', '8719587322345', 1, NULL, '2026-09-16 09:27:38.152392', '2026-09-16 09:27:38.152392'),
(12, 'Kruis Drop', '8719587322265', 1, NULL, '2026-09-16 09:27:38.152403', '2026-09-16 09:27:38.152404'),
(13, 'Zoute Ruitjes', '8719587323256', 1, NULL, '2026-09-16 09:27:38.152414', '2026-09-16 09:27:38.152415');

-- ----------------------------
-- Tabel: Allergeen
-- ----------------------------
DROP TABLE IF EXISTS `Allergeen`;
CREATE TABLE `allergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Allergeen` (`Id`, `Naam`, `Omschrijving`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Gluten', 'Dit product bevat gluten', 1, NULL, '2026-09-16 09:27:38.170320', '2026-09-16 09:27:38.170325'),
(2, 'Gelatine', 'Dit product bevat gelatine', 1, NULL, '2026-09-16 09:27:38.170372', '2026-09-16 09:27:38.170373'),
(3, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen', 1, NULL, '2026-09-16 09:27:38.170401', '2026-09-16 09:27:38.170402'),
(4, 'Lactose', 'Dit product bevat lactose', 1, NULL, '2026-09-16 09:27:38.170412', '2026-09-16 09:27:38.170412'),
(5, 'Soja', 'Dit product bevat soja', 1, NULL, '2026-09-16 09:27:38.170420', '2026-09-16 09:27:38.170420');

-- ----------------------------
-- Tabel: Leverancier
-- ----------------------------
DROP TABLE IF EXISTS `Leverancier`;
CREATE TABLE `leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Leverancier_LeverancierNummer` (`LeverancierNummer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Leverancier` (`Id`, `Naam`, `ContactPersoon`, `LeverancierNummer`, `Mobiel`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', 1, NULL, '2026-09-16 09:27:38.259043', '2026-09-16 09:27:38.259050'),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', 1, NULL, '2026-09-16 09:27:38.259145', '2026-09-16 09:27:38.259147'),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', 1, NULL, '2026-09-16 09:27:38.259199', '2026-09-16 09:27:38.259201'),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', 1, NULL, '2026-09-16 09:27:38.259233', '2026-09-16 09:27:38.259234'),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', 1, NULL, '2026-09-16 09:27:38.259261', '2026-09-16 09:27:38.259263');

-- ----------------------------
-- Tabel: Magazijn
-- ----------------------------
DROP TABLE IF EXISTS `Magazijn`;
CREATE TABLE `magazijn` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `VerpakkingsEenheidInKilogram` decimal(6,3) NOT NULL,
  `AantalAanwezig` int unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Magazijn` (`Id`, `ProductId`, `VerpakkingsEenheidInKilogram`, `AantalAanwezig`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, '5.000', 453, 1, NULL, '2026-09-16 09:27:38.308232', '2026-09-16 09:27:38.308235'),
(2, 2, '2.500', 400, 1, NULL, '2026-09-16 09:27:38.308279', '2026-09-16 09:27:38.308279'),
(3, 3, '5.000', 1, 1, NULL, '2026-09-16 09:27:38.308292', '2026-09-16 09:27:38.308292'),
(4, 4, '1.000', 800, 1, NULL, '2026-09-16 09:27:38.308298', '2026-09-16 09:27:38.308298'),
(5, 5, '3.000', 234, 1, NULL, '2026-09-16 09:27:38.308304', '2026-09-16 09:27:38.308304'),
(6, 6, '2.000', 345, 1, NULL, '2026-09-16 09:27:38.308309', '2026-09-16 09:27:38.308309'),
(7, 7, '1.000', 795, 1, NULL, '2026-09-16 09:27:38.308314', '2026-09-16 09:27:38.308314'),
(8, 8, '10.000', 233, 1, NULL, '2026-09-16 09:27:38.308319', '2026-09-16 09:27:38.308319'),
(9, 9, '2.500', 123, 1, NULL, '2026-09-16 09:27:38.308324', '2026-09-16 09:27:38.308324'),
(10, 10, '3.000', NULL, 1, NULL, '2026-09-16 09:27:38.308329', '2026-09-16 09:27:38.308329'),
(11, 11, '2.000', 367, 1, NULL, '2026-09-16 09:27:38.308334', '2026-09-16 09:27:38.308334'),
(12, 12, '1.000', 467, 1, NULL, '2026-09-16 09:27:38.308338', '2026-09-16 09:27:38.308339'),
(13, 13, '5.000', 20, 1, NULL, '2026-09-16 09:27:38.308343', '2026-09-16 09:27:38.308343');

-- ----------------------------
-- Tabel: ProductPerAllergeen
-- ----------------------------
DROP TABLE IF EXISTS `ProductPerAllergeen`;
CREATE TABLE `productperallergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `AllergeenId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_ProductPerAllergeen_Product_Allergeen` (`ProductId`,`AllergeenId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ProductPerAllergeen` (`Id`, `ProductId`, `AllergeenId`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 2, 1, NULL, '2026-09-16 09:27:38.341812', '2026-09-16 09:27:38.341814'),
(2, 1, 1, 1, NULL, '2026-09-16 09:27:38.341848', '2026-09-16 09:27:38.341848'),
(3, 1, 3, 1, NULL, '2026-09-16 09:27:38.341895', '2026-09-16 09:27:38.341897'),
(4, 3, 4, 1, NULL, '2026-09-16 09:27:38.341927', '2026-09-16 09:27:38.341935'),
(5, 6, 5, 1, NULL, '2026-09-16 09:27:38.341949', '2026-09-16 09:27:38.341949'),
(6, 9, 2, 1, NULL, '2026-09-16 09:27:38.341956', '2026-09-16 09:27:38.341956'),
(7, 9, 5, 1, NULL, '2026-09-16 09:27:38.341963', '2026-09-16 09:27:38.341963'),
(8, 10, 2, 1, NULL, '2026-09-16 09:27:38.341970', '2026-09-16 09:27:38.341971'),
(9, 12, 4, 1, NULL, '2026-09-16 09:27:38.341978', '2026-09-16 09:27:38.341978'),
(10, 13, 1, 1, NULL, '2026-09-16 09:27:38.341985', '2026-09-16 09:27:38.341985'),
(11, 13, 4, 1, NULL, '2026-09-16 09:27:38.341991', '2026-09-16 09:27:38.341991'),
(12, 13, 5, 1, NULL, '2026-09-16 09:27:38.341998', '2026-09-16 09:27:38.341998');

-- ----------------------------
-- Tabel: ProductPerLeverancier
-- ----------------------------
DROP TABLE IF EXISTS `ProductPerLeverancier`;
CREATE TABLE `productperleverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` int unsigned NOT NULL,
  `ProductId` int unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ProductPerLeverancier` (`Id`, `LeverancierId`, `ProductId`, `DatumLevering`, `Aantal`, `DatumEerstVolgendeLevering`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 1, '2024-10-09', 23, '2024-10-16', 1, NULL, '2026-09-16 09:27:38.393496', '2026-09-16 09:27:38.393498'),
(2, 1, 1, '2024-10-18', 21, '2024-10-25', 1, NULL, '2026-09-16 09:27:38.393539', '2026-09-16 09:27:38.393539'),
(3, 1, 2, '2024-10-09', 12, '2024-10-16', 1, NULL, '2026-09-16 09:27:38.393556', '2026-09-16 09:27:38.393556'),
(4, 1, 3, '2024-10-10', 11, '2024-10-17', 1, NULL, '2026-09-16 09:27:38.393564', '2026-09-16 09:27:38.393564'),
(5, 2, 4, '2024-10-14', 16, '2024-10-21', 1, NULL, '2026-09-16 09:27:38.393586', '2026-09-16 09:27:38.393587'),
(6, 2, 4, '2024-10-21', 23, '2024-10-28', 1, NULL, '2026-09-16 09:27:38.393596', '2026-09-16 09:27:38.393596'),
(7, 2, 5, '2024-10-14', 45, '2024-10-21', 1, NULL, '2026-09-16 09:27:38.393603', '2026-09-16 09:27:38.393603'),
(8, 2, 6, '2024-10-14', 30, '2024-10-21', 1, NULL, '2026-09-16 09:27:38.393610', '2026-09-16 09:27:38.393610'),
(9, 3, 7, '2024-10-12', 12, '2024-10-19', 1, NULL, '2026-09-16 09:27:38.393617', '2026-09-16 09:27:38.393617'),
(10, 3, 7, '2024-10-19', 23, '2024-10-26', 1, NULL, '2026-09-16 09:27:38.393625', '2026-09-16 09:27:38.393625'),
(11, 3, 8, '2024-10-10', 12, '2024-10-17', 1, NULL, '2026-09-16 09:27:38.393643', '2026-09-16 09:27:38.393643'),
(12, 3, 9, '2024-10-11', 1, '2024-10-18', 1, NULL, '2026-09-16 09:27:38.393661', '2026-09-16 09:27:38.393662'),
(13, 4, 10, '2024-10-16', 24, '2024-10-30', 1, NULL, '2026-09-16 09:27:38.393681', '2026-09-16 09:27:38.393681'),
(14, 5, 11, '2024-10-10', 47, '2024-10-17', 1, NULL, '2026-09-16 09:27:38.393699', '2026-09-16 09:27:38.393700'),
(15, 5, 11, '2024-10-19', 60, '2024-10-26', 1, NULL, '2026-09-16 09:27:38.393718', '2026-09-16 09:27:38.393718'),
(16, 5, 12, '2024-10-11', 45, NULL, 1, NULL, '2026-09-16 09:27:38.393737', '2026-09-16 09:27:38.393737'),
(17, 5, 13, '2024-10-12', 23, NULL, 1, NULL, '2026-09-16 09:27:38.393759', '2026-09-16 09:27:38.393759');

SET FOREIGN_KEY_CHECKS=1;
