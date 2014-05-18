CREATE DATABASE  IF NOT EXISTS `u304295155_bnmup` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `u304295155_bnmup`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: u304295155_bnmup
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `tblcoupon`
--

DROP TABLE IF EXISTS `tblcoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcoupon` (
  `CouponID` int(11) NOT NULL AUTO_INCREMENT,
  `ExpirationDate` datetime DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcoupon`
--

LOCK TABLES `tblcoupon` WRITE;
/*!40000 ALTER TABLE `tblcoupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemployee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `PositionID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`,`PositionID`),
  KEY `fk_tblEmployee_tblPosition1_idx` (`PositionID`),
  CONSTRAINT `fk_tblEmployee_tblPosition1` FOREIGN KEY (`PositionID`) REFERENCES `tblposition` (`PositionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployee`
--

LOCK TABLES `tblemployee` WRITE;
/*!40000 ALTER TABLE `tblemployee` DISABLE KEYS */;
INSERT INTO `tblemployee` VALUES (1,1,'Super','User','\0',1234567,'Calle Quinta #123','admin@gmail.com','12345',100000),(2,1,'Otro','mono','',2324234,'Tu madre','mono@gmail.com','asdfg',4000);
/*!40000 ALTER TABLE `tblemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblposition`
--

DROP TABLE IF EXISTS `tblposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblposition` (
  `PositionID` int(11) NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblposition`
--

LOCK TABLES `tblposition` WRITE;
/*!40000 ALTER TABLE `tblposition` DISABLE KEYS */;
INSERT INTO `tblposition` VALUES (1,'Administrador');
/*!40000 ALTER TABLE `tblposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct`
--

DROP TABLE IF EXISTS `tblproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategoryID` int(11) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductPicture` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`ProductCategoryID`),
  KEY `fk_tblProduct_tblProductCategory1_idx` (`ProductCategoryID`),
  CONSTRAINT `fk_tblProduct_tblProductCategory1` FOREIGN KEY (`ProductCategoryID`) REFERENCES `tblproductcategory` (`ProductCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct`
--

LOCK TABLES `tblproduct` WRITE;
/*!40000 ALTER TABLE `tblproduct` DISABLE KEYS */;
INSERT INTO `tblproduct` VALUES (1,1,'Cafe del Dia','CafeDelDia.jpg'),(2,1,'Cafe Mocha','CafeMocha.jpg'),(3,1,'Chocolate Caliente','ChocolateCaliente.jpg'),(4,1,'Expresso Americano','ExpressoAmericano.jpg'),(5,1,'Hazelnut Helado','HazelnutHelado.jpg'),(6,1,'Hazelnut Macchiato','HazelnutMacchiato.jpg');
/*!40000 ALTER TABLE `tblproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_price`
--

DROP TABLE IF EXISTS `tblproduct_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_price` (
  `Product_PriceID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Product_PriceID`,`ProductID`,`SizeID`),
  KEY `fk_tblProduct_Price_tblProduct1_idx` (`ProductID`),
  KEY `fk_tblProduct_Price_tblSize1_idx` (`SizeID`),
  CONSTRAINT `fk_tblProduct_Price_tblProduct1` FOREIGN KEY (`ProductID`) REFERENCES `tblproduct` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProduct_Price_tblSize1` FOREIGN KEY (`SizeID`) REFERENCES `tblsize` (`SizeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_price`
--

LOCK TABLES `tblproduct_price` WRITE;
/*!40000 ALTER TABLE `tblproduct_price` DISABLE KEYS */;
INSERT INTO `tblproduct_price` VALUES (1,1,1,10),(2,1,2,12),(3,1,3,15),(4,2,1,15),(5,2,2,18),(6,2,3,20),(7,3,1,12),(8,3,2,15),(9,3,3,17),(10,4,1,16),(11,4,2,18),(12,4,3,20),(13,5,1,22),(14,5,2,25),(15,5,3,28),(16,6,1,26),(17,6,2,29),(18,6,3,31);
/*!40000 ALTER TABLE `tblproduct_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_stock`
--

DROP TABLE IF EXISTS `tblproduct_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_stock` (
  `Product_StockID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `StockID` int(11) NOT NULL,
  `QuantityNeeded` int(11) DEFAULT NULL,
  PRIMARY KEY (`Product_StockID`,`ProductID`,`SizeID`,`StockID`),
  KEY `fk_tblProduct_Stock_tblStock1_idx` (`StockID`),
  KEY `fk_tblProduct_Stock_tblSize1_idx` (`SizeID`),
  KEY `fk_tblProduct_Stock_tblProduct1_idx` (`ProductID`),
  CONSTRAINT `fk_tblProduct_Stock_tblStock1` FOREIGN KEY (`StockID`) REFERENCES `tblstock` (`StockID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProduct_Stock_tblSize1` FOREIGN KEY (`SizeID`) REFERENCES `tblsize` (`SizeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProduct_Stock_tblProduct1` FOREIGN KEY (`ProductID`) REFERENCES `tblproduct` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_stock`
--

LOCK TABLES `tblproduct_stock` WRITE;
/*!40000 ALTER TABLE `tblproduct_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproduct_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductcategory`
--

DROP TABLE IF EXISTS `tblproductcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductcategory` (
  `ProductCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategoryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductcategory`
--

LOCK TABLES `tblproductcategory` WRITE;
/*!40000 ALTER TABLE `tblproductcategory` DISABLE KEYS */;
INSERT INTO `tblproductcategory` VALUES (1,'Bebidas'),(2,'Snacks');
/*!40000 ALTER TABLE `tblproductcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprovider`
--

DROP TABLE IF EXISTS `tblprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprovider` (
  `ProviderID` int(11) NOT NULL AUTO_INCREMENT,
  `ProviderName` varchar(100) DEFAULT NULL,
  `ProviderAddress` varchar(300) DEFAULT NULL,
  `ProviderPhone` int(11) DEFAULT NULL,
  `ProviderCompany` varchar(100) DEFAULT NULL,
  `ProviderEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProviderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprovider`
--

LOCK TABLES `tblprovider` WRITE;
/*!40000 ALTER TABLE `tblprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsize`
--

DROP TABLE IF EXISTS `tblsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsize` (
  `SizeID` int(11) NOT NULL AUTO_INCREMENT,
  `SizeName` varchar(50) DEFAULT NULL,
  `SizeVolumeML` int(11) DEFAULT NULL,
  PRIMARY KEY (`SizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsize`
--

LOCK TABLES `tblsize` WRITE;
/*!40000 ALTER TABLE `tblsize` DISABLE KEYS */;
INSERT INTO `tblsize` VALUES (1,'Chico',300),(2,'Mediano',450),(3,'Grande',550);
/*!40000 ALTER TABLE `tblsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstock`
--

DROP TABLE IF EXISTS `tblstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstock` (
  `StockID` int(11) NOT NULL AUTO_INCREMENT,
  `StockName` varchar(50) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstock`
--

LOCK TABLES `tblstock` WRITE;
/*!40000 ALTER TABLE `tblstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstockorder`
--

DROP TABLE IF EXISTS `tblstockorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstockorder` (
  `StockOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `ProviderID` int(11) NOT NULL,
  `StockOrderDate` datetime DEFAULT NULL,
  `StockOrderCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`StockOrderID`,`EmployeeID`,`ProviderID`),
  KEY `fk_tblStockOrder_tblEmployee1_idx` (`EmployeeID`),
  KEY `fk_tblStockOrder_tblProvider1_idx` (`ProviderID`),
  CONSTRAINT `fk_tblStockOrder_tblEmployee1` FOREIGN KEY (`EmployeeID`) REFERENCES `tblemployee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblStockOrder_tblProvider1` FOREIGN KEY (`ProviderID`) REFERENCES `tblprovider` (`ProviderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstockorder`
--

LOCK TABLES `tblstockorder` WRITE;
/*!40000 ALTER TABLE `tblstockorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstockorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstockorderdetail`
--

DROP TABLE IF EXISTS `tblstockorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstockorderdetail` (
  `StockOrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `StockOrderID` int(11) NOT NULL,
  `StockID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`StockOrderDetailID`,`StockOrderID`,`StockID`),
  KEY `fk_tblStockOrderDetail_tblStockOrder1_idx` (`StockOrderID`),
  KEY `fk_tblStockOrderDetail_tblStock1_idx` (`StockID`),
  CONSTRAINT `fk_tblStockOrderDetail_tblStockOrder1` FOREIGN KEY (`StockOrderID`) REFERENCES `tblstockorder` (`StockOrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblStockOrderDetail_tblStock1` FOREIGN KEY (`StockID`) REFERENCES `tblstock` (`StockID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstockorderdetail`
--

LOCK TABLES `tblstockorderdetail` WRITE;
/*!40000 ALTER TABLE `tblstockorderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstockorderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticket`
--

DROP TABLE IF EXISTS `tblticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticket` (
  `TicketID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `TicketDate` datetime DEFAULT NULL,
  `TotalCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`TicketID`,`EmployeeID`),
  KEY `fk_tblTicket_tblEmployee_idx` (`EmployeeID`),
  CONSTRAINT `fk_tblTicket_tblEmployee` FOREIGN KEY (`EmployeeID`) REFERENCES `tblemployee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticket`
--

LOCK TABLES `tblticket` WRITE;
/*!40000 ALTER TABLE `tblticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticket_coupon`
--

DROP TABLE IF EXISTS `tblticket_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticket_coupon` (
  `Ticket_CouponID` int(11) NOT NULL AUTO_INCREMENT,
  `CouponID` int(11) NOT NULL,
  `TicketID` int(11) NOT NULL,
  PRIMARY KEY (`Ticket_CouponID`,`CouponID`,`TicketID`),
  KEY `fk_tblTicket_Coupon_tblCoupon1_idx` (`CouponID`),
  KEY `fk_tblTicket_Coupon_tblTicket1_idx` (`TicketID`),
  CONSTRAINT `fk_tblTicket_Coupon_tblCoupon1` FOREIGN KEY (`CouponID`) REFERENCES `tblcoupon` (`CouponID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicket_Coupon_tblTicket1` FOREIGN KEY (`TicketID`) REFERENCES `tblticket` (`TicketID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticket_coupon`
--

LOCK TABLES `tblticket_coupon` WRITE;
/*!40000 ALTER TABLE `tblticket_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticket_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketdetail`
--

DROP TABLE IF EXISTS `tblticketdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticketdetail` (
  `TicketDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `TicketID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductPrice` decimal(10,0) DEFAULT NULL,
  `SizeID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `tblticketdetailcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TicketDetailID`,`TicketID`,`ProductID`),
  KEY `fk_tblTicketDetail_tblTicket1_idx` (`TicketID`),
  KEY `fk_tblTicketDetail_tblProduct1_idx` (`ProductID`),
  KEY `fk_tblTicketDetail_tblSize1_idx` (`SizeID`),
  CONSTRAINT `fk_tblTicketDetail_tblProduct1` FOREIGN KEY (`ProductID`) REFERENCES `tblproduct` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicketDetail_tblSize1` FOREIGN KEY (`SizeID`) REFERENCES `tblsize` (`SizeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicketDetail_tblTicket1` FOREIGN KEY (`TicketID`) REFERENCES `tblticket` (`TicketID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticketdetail`
--

LOCK TABLES `tblticketdetail` WRITE;
/*!40000 ALTER TABLE `tblticketdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'u304295155_bnmup'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_EmailVerification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_EmailVerification`(IN
p_Email VARCHAR(100)
)
BEGIN

SELECT * FROM tblEmployee WHERE Email=p_Email;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Employee`(IN
p_EmployeeID INT,
p_PositionID INT,
p_FirstName VARCHAR(100),
p_LastName VARCHAR(100),
p_Gender BIT,
p_Phone INT,
p_Address VARCHAR(200),
p_Email VARCHAR(100),
p_Password VARCHAR(100),
p_Salary INT
)
BEGIN
IF p_EmployeeID=0 then
	INSERT INTO tblEmployee
	(
	PositionID,
	FirstName,
	LastName,
	Gender,
	Phone,
	Address,
	Email,
	Password,
	Salary
	)
	VALUES
	(
	p_PositionID,
	p_FirstName,
	p_LastName,
	p_Gender,
	p_Phone,
	p_Address,
	p_Email,
	p_Password,
	p_Salary
	);
else
	UPDATE tblEmployee set
	PositionID=p_PositionID,
	FirstName=p_FirstName,
	LastName=p_LastName,
	Gender=p_Gender,
	Phone=p_Phone,
	Address=p_Address,
	Email=p_Email,
	Password=p_Password,
	Salary=p_Salary

	WHERE EmployeeID=p_EmployeeID;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Login`(IN
p_Email VARCHAR(100),
p_Password VARCHAR(100)
)
BEGIN

SELECT * FROM tblEmployee WHERE Email=p_Email AND Password=p_Password;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Position`(IN
p_PositionID INT,
p_PositionName VARCHAR(100)
)
BEGIN
IF p_PositionID=0 then
	INSERT INTO tblPosition
	(
	PositionName
	)
	VALUES
	(
	p_PositionName
	);
else
	UPDATE tblPosition set
	PositionName=p_PositionName

	WHERE PositionID=p_PositionID;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product`(IN
p_ProductID INT,
p_ProductCategoryID INT,
p_ProductName VARCHAR(100),
p_ProductPicture VARCHAR(150)
)
BEGIN
IF p_ProductID=0 then
	INSERT INTO tblProduct
	(
	ProductCategoryID,
	ProductName,
	ProductPicture
	)
	VALUES
	(
	p_ProductCategoryID,
	p_ProductName,
	p_ProductPicture
	);
else
	UPDATE tblProduct set
	ProductCategoryID=p_ProductCategoryID,
	ProductName=p_ProductName,
	ProductPicture=p_ProductPicture

	WHERE ProductID=p_ProductID;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_ProductCategory`(IN
p_ProductCategoryID INT,
p_ProductCategoryName VARCHAR(100)
)
BEGIN
IF p_ProductCategoryID=0 then
	INSERT INTO tblProductCategory
	(
	ProductCategoryName
	)
	VALUES
	(
	p_ProductCategoryName
	);
else
	UPDATE tblProductCategory set
	ProductCategoryName=p_ProductCategoryName

	WHERE ProductCategoryID=p_ProductCategoryID;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Product_ByCategoryID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product_ByCategoryID`(IN
p_ProductCategoryID INT
)
BEGIN

SELECT * FROM tblProduct WHERE ProductCategoryID=p_ProductCategoryID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Product_Price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product_Price`(IN
p_Product_PriceID INT,
p_ProductID INT,
p_SizeID INT,
p_Price DECIMAL
)
BEGIN

IF p_Product_PriceID=0 THEN
    	INSERT INTO tblProduct_Price
    	(
     	ProductID,
     	SizeID,
     	Price
    	)
    	VALUES
    	(
    	p_ProductID,
    	p_SizeID,
    	p_Price
    	);
ELSE
    	UPDATE tblProduct_Price SET
    	ProductID=p_ProductID,
    	SizeID=p_SizeID,
    	Price= p_Price
   	 
    	WHERE Product_PriceID=p_Product_PriceID;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Product_Price_ByProductID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product_Price_ByProductID`(IN
p_ProductID INT
)
BEGIN

SELECT * FROM tblproduct_price WHERE ProductID=p_ProductID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Product_Stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product_Stock`(IN
p_Product_StockID INT,
p_ProductID INT,
p_SizeID INT,
p_StockID INT,
QuantityNeeded INT
)
BEGIN

IF p_Product_StockID=0 THEN
    	INSERT INTO tblProduct_Stock
    	(
     	ProductID,
     	SizeID,
        StockID,
        QuantityNeeded
    	)
    	VALUES
    	(
    	p_ProductID,
    	p_SizeID,
        p_StockID,
        p_QuantityNeeded
    	);
ELSE
    	UPDATE tblProduct_Stock SET
    	ProductID=p_ProductID,
        SizeID=p_SizeID,
        StockID=p_StockID,
    	QuantityNeeded=p_QuantityNeeded
   	 
    	WHERE Product_StockID=p_Product_StockID;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Size` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Size`(IN
p_SizeID INT,
p_SizeName VARCHAR(50),
p_SizeVolumeML INT
)
BEGIN
IF p_SizeID=0 then
	INSERT INTO tblSize
	(
	SizeName,
	SizeVolumeML
	)
	VALUES
	(
	p_SizeName,
	p_SizeVolumeML
	);
else
	UPDATE tblSize set
	SizeName=p_SizeName,
	SizeVolumeML=p_SizeVolumeML

	WHERE SizeID=p_SizeID;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Stock`(IN
p_StockID INT,
p_StockName varchar(50),
p_QuantityAvailable INT
)
BEGIN

IF p_StockID=0 THEN
    	INSERT INTO tblStock
    	(
     	StockName,
     	QuantityAvailable
    	)
    	VALUES
    	(
    	p_StockID,
    	p_QuantityAvailable
    	);
ELSE
    	UPDATE tblStock SET
    	StockName=p_StockID,
    	QuantityAvailable=p_QuantityAvailable
   	 
    	WHERE StockID=p_StockID;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Ticket`(IN
p_TicketID INT,
p_EmployeeID INT,
p_Price DECIMAL
)
BEGIN

IF p_TicketID=0 THEN
    	INSERT INTO tblTicket
    	(
     	EmployeeID,
     	TicketDate,
     	Price
    	)
    	VALUES
    	(
    	p_EmployeeID,
    	NOW(),
    	p_Price
    	);
ELSE
    	UPDATE tblTicket SET
    	EmployeeID=p_EmployeeID,
    	Price= p_Price
   	 
    	WHERE TicketID=p_TicketID;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TicketDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_TicketDetail`(IN
p_TicketDetailID INT,
p_TicketID INT,
p_ProductID INT,
p_SizeID INT,
p_Quantity INT
)
BEGIN

IF p_TicketID=0 THEN
    	INSERT INTO tblTicketDetail
    	(
     	TicketID,
     	ProductID,
     	SizeID,
     	ProductPrice,
     	Quantity
    	)
    	VALUES
    	(
    	p_TicketID,
    	p_ProductID,
    	p_SizeID,
    	(select Price from tblproduct_price where tblproduct_price.ProductID=p_ProductID and tblproduct_price.SizeID = p_SizeID),
    	p_Quantity
    	);
ELSE
    	UPDATE tblTicketDetail SET
    	TicketID=p_TicketID,
    	ProductID=p_ProductID,
    	SizeID=p_SizeID,
    	Quantity= p_Quantity
   	 
    	WHERE TicketDetailID=p_TicketDetailID;
END IF;

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

-- Dump completed on 2014-05-17 16:54:33
