
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2014 at 02:03 AM
-- Server version: 5.1.69
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u304295155_bnmup`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_EmailVerification`(IN
p_Email VARCHAR(100)
)
BEGIN

SELECT * FROM tblEmployee WHERE Email=p_Email;

END$$

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

SELECT COUNT(*) AS validation from tblemployee WHERE Email=p_Email;

if validation>0 then
	select 1;

ELSEIF p_EmployeeID=0 then
	INSERT INTO tblemployee
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

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Login`(IN
p_Email VARCHAR(100),
p_Password VARCHAR(100)
)
BEGIN

SELECT * FROM tblEmployee WHERE Email=p_Email AND Password=p_Password;

END$$

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

END$$

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

END$$

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

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product_ByCategoryID`(IN
p_ProductCategoryID INT
)
BEGIN

SELECT * FROM tblProduct WHERE ProductCategoryID=p_ProductCategoryID;

END$$

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

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Product_Price_ByProductID`(IN
p_ProductID INT
)
BEGIN

SELECT * FROM tblProduct_Price WHERE ProductID=p_ProductID;

END$$

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

END$$

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

END$$

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

END$$

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

END$$

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

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblCoupon`
--

CREATE TABLE IF NOT EXISTS `tblCoupon` (
  `CouponID` int(11) NOT NULL AUTO_INCREMENT,
  `ExpirationDate` datetime DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmployee`
--

CREATE TABLE IF NOT EXISTS `tblEmployee` (
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
  KEY `fk_tblEmployee_tblPosition1_idx` (`PositionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tblEmployee`
--

INSERT INTO `tblEmployee` (`EmployeeID`, `PositionID`, `FirstName`, `LastName`, `Gender`, `Phone`, `Address`, `Email`, `Password`, `Salary`) VALUES
(1, 1, 'Super', 'User', b'0', 1234567, 'Calle Quinta #123', 'admin@gmail.com', '12345', 100000),
(2, 1, 'Otro', 'mono', b'1', 2324234, 'Tu madre', 'mono@gmail.com', 'asdfg', 4000),
(4, 1, '', '', b'0', 0, 'roma #5424', 'ivanrivas65@gmail.com', '12345', 1000),
(5, 1, 'Luisa', 'Velarde', b'0', 0, 'rome #4354', 'luisa@gmail.com', '12345', 1000),
(6, 1, 'Maria', 'Rodriguez', b'0', 0, 'rome #4354', 'Maria@gmail.com', '12345', 1000),
(7, 1, 'Josefa', 'Rodriguez', b'0', 0, 'rome #4354', 'josefa@gmail.com', '12345', 1000),
(8, 1, 'Sofia', 'Gonzales', b'0', 0, 'roma #5424', 'sofia@gmail.com', '12345', 1000),
(9, 1, 'Elizabeth', 'Lopez', b'0', 0, 'roma #5424', 'eli@gmail.com', '12345', 1000),
(10, 1, 'Josefa', 'Rodriguez', b'0', 0, 'rome #4354', 'josefa1@gmail.com', '12345', 1000),
(11, 1, 'Josefa', 'Rodriguez', b'0', 0, 'rome #4354', 'josefa2@gmail.com', '12345', 1000),
(12, 1, 'Josefa', 'Rodriguez', b'0', 0, 'rome #4354', 'josefa3@gmail.com', '12345', 1000),
(13, 1, 'Elizabeth', 'Lopez', b'0', 0, 'roma #5424', 'eli32@gmail.com', '12345', 1000),
(14, 1, 'Elizabeth', 'Lopez', b'0', 0, 'roma #5424', 'eli3@gmail.com', '12345', 1000),
(15, 1, 'Elizabeth', 'Lopez', b'0', 0, 'roma #5424', 'eli4@gmail.com', '12345', 1000),
(16, 1, 'josefa', 'ortiz', b'1', 0, 'fdasfda', 'josefas@gmail.com', '', 0),
(17, 1, 'jorge', 'lopez', b'1', 0, 'calle jorge', 'jorge@gmail.com', '12345', 0),
(18, 0, 'Emmanuel', 'Gutierrez', b'1', 0, 'calle manny', 'manny@gmail.com', 'manny', 20000),
(19, 0, 'test', 'tester', b'0', 0, 'fdfdas', 'test@gmail.com', '12345', 0),
(20, 0, 'test2', 'tester2', b'0', 0, 'fdfdas', 'test2@gmail.com', '12345', 1111),
(21, 0, 'test2', 'tester2', b'0', 0, 'fdfdas', 'test3@gmail.com', '12345', 1111),
(22, 0, 'test3', 'tester3', b'0', 0, 'fdfdas', 'test4@gmail.com', '12345', 1111),
(23, 0, 'test4', 'tester4', b'0', 0, 'fdfdas', 'test5@gmail.com', '12345', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `tblPosition`
--

CREATE TABLE IF NOT EXISTS `tblPosition` (
  `PositionID` int(11) NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblPosition`
--

INSERT INTO `tblPosition` (`PositionID`, `PositionName`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Table structure for table `tblProduct`
--

CREATE TABLE IF NOT EXISTS `tblProduct` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategoryID` int(11) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductPicture` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`ProductCategoryID`),
  KEY `fk_tblProduct_tblProductCategory1_idx` (`ProductCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tblProduct`
--

INSERT INTO `tblProduct` (`ProductID`, `ProductCategoryID`, `ProductName`, `ProductPicture`) VALUES
(1, 1, 'Cafe del Dia', 'CafeDelDia.jpg'),
(2, 1, 'Cafe Mocha', 'CafeMocha.jpg'),
(3, 1, 'Chocolate Caliente', 'ChocolateCaliente.jpg'),
(4, 1, 'Expresso Americano', 'ExpressoAmericano.jpg'),
(5, 1, 'Hazelnut Helado', 'HazelnutHelado.jpg'),
(6, 1, 'Hazelnut Macchiato', 'HazelnutMacchiato.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblProductCategory`
--

CREATE TABLE IF NOT EXISTS `tblProductCategory` (
  `ProductCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategoryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblProductCategory`
--

INSERT INTO `tblProductCategory` (`ProductCategoryID`, `ProductCategoryName`) VALUES
(1, 'Bebidas'),
(2, 'Snacks');

-- --------------------------------------------------------

--
-- Table structure for table `tblProduct_Price`
--

CREATE TABLE IF NOT EXISTS `tblProduct_Price` (
  `Product_PriceID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Product_PriceID`,`ProductID`,`SizeID`),
  KEY `fk_tblProduct_Price_tblProduct1_idx` (`ProductID`),
  KEY `fk_tblProduct_Price_tblSize1_idx` (`SizeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tblProduct_Price`
--

INSERT INTO `tblProduct_Price` (`Product_PriceID`, `ProductID`, `SizeID`, `Price`) VALUES
(1, 1, 1, '10'),
(2, 1, 2, '12'),
(3, 1, 3, '15'),
(4, 2, 1, '15'),
(5, 2, 2, '18'),
(6, 2, 3, '20'),
(7, 3, 1, '12'),
(8, 3, 2, '15'),
(9, 3, 3, '17'),
(10, 4, 1, '16'),
(11, 4, 2, '18'),
(12, 4, 3, '20'),
(13, 5, 1, '22'),
(14, 5, 2, '25'),
(15, 5, 3, '28'),
(16, 6, 1, '26'),
(17, 6, 2, '29'),
(18, 6, 3, '31');

-- --------------------------------------------------------

--
-- Table structure for table `tblProduct_Stock`
--

CREATE TABLE IF NOT EXISTS `tblProduct_Stock` (
  `Product_StockID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `StockID` int(11) NOT NULL,
  `QuantityNeeded` int(11) DEFAULT NULL,
  PRIMARY KEY (`Product_StockID`,`ProductID`,`SizeID`,`StockID`),
  KEY `fk_tblProduct_Stock_tblStock1_idx` (`StockID`),
  KEY `fk_tblProduct_Stock_tblSize1_idx` (`SizeID`),
  KEY `fk_tblProduct_Stock_tblProduct1_idx` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblProvider`
--

CREATE TABLE IF NOT EXISTS `tblProvider` (
  `ProviderID` int(11) NOT NULL AUTO_INCREMENT,
  `ProviderName` varchar(100) DEFAULT NULL,
  `ProviderAddress` varchar(300) DEFAULT NULL,
  `ProviderPhone` int(11) DEFAULT NULL,
  `ProviderCompany` varchar(100) DEFAULT NULL,
  `ProviderEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProviderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblSize`
--

CREATE TABLE IF NOT EXISTS `tblSize` (
  `SizeID` int(11) NOT NULL AUTO_INCREMENT,
  `SizeName` varchar(50) DEFAULT NULL,
  `SizeVolumeML` int(11) DEFAULT NULL,
  PRIMARY KEY (`SizeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblSize`
--

INSERT INTO `tblSize` (`SizeID`, `SizeName`, `SizeVolumeML`) VALUES
(1, 'Chico', 300),
(2, 'Mediano', 450),
(3, 'Grande', 550);

-- --------------------------------------------------------

--
-- Table structure for table `tblStock`
--

CREATE TABLE IF NOT EXISTS `tblStock` (
  `StockID` int(11) NOT NULL AUTO_INCREMENT,
  `StockName` varchar(50) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblStockOrder`
--

CREATE TABLE IF NOT EXISTS `tblStockOrder` (
  `StockOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `ProviderID` int(11) NOT NULL,
  `StockOrderDate` datetime DEFAULT NULL,
  `StockOrderCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`StockOrderID`,`EmployeeID`,`ProviderID`),
  KEY `fk_tblStockOrder_tblEmployee1_idx` (`EmployeeID`),
  KEY `fk_tblStockOrder_tblProvider1_idx` (`ProviderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblStockOrderDetail`
--

CREATE TABLE IF NOT EXISTS `tblStockOrderDetail` (
  `StockOrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `StockOrderID` int(11) NOT NULL,
  `StockID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`StockOrderDetailID`,`StockOrderID`,`StockID`),
  KEY `fk_tblStockOrderDetail_tblStockOrder1_idx` (`StockOrderID`),
  KEY `fk_tblStockOrderDetail_tblStock1_idx` (`StockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblTicket`
--

CREATE TABLE IF NOT EXISTS `tblTicket` (
  `TicketID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `TicketDate` datetime DEFAULT NULL,
  `TotalCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`TicketID`,`EmployeeID`),
  KEY `fk_tblTicket_tblEmployee_idx` (`EmployeeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblTicketDetail`
--

CREATE TABLE IF NOT EXISTS `tblTicketDetail` (
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
  KEY `fk_tblTicketDetail_tblSize1_idx` (`SizeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblTicket_Coupon`
--

CREATE TABLE IF NOT EXISTS `tblTicket_Coupon` (
  `Ticket_CouponID` int(11) NOT NULL AUTO_INCREMENT,
  `CouponID` int(11) NOT NULL,
  `TicketID` int(11) NOT NULL,
  PRIMARY KEY (`Ticket_CouponID`,`CouponID`,`TicketID`),
  KEY `fk_tblTicket_Coupon_tblCoupon1_idx` (`CouponID`),
  KEY `fk_tblTicket_Coupon_tblTicket1_idx` (`TicketID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
