
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2014 at 01:16 AM
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
CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Coupon`(IN
p_CouponID INT,
p_DateCreated DATE,
p_ExpirationDate DATE,
p_Discount int,
p_Description varchar(500)
)
BEGIN

IF p_CouponID=0 THEN
INSERT INTO tblCoupon (
DateCreated,
ExpirationDate,
Discount,
Description
)

VALUES
(
p_DateCreated,
p_ExpirationDate,
p_Discount,
p_Description
);

ELSE
UPDATE tblCoupon
SET
DateCreated=p_DateCreated,
ExpirationDate=p_ExpirationDate,
Discount=p_Discount,
Description=p_Description

WHERE CouponID=p_CouponID;

end if;

end$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Coupon_ByID`(IN
p_CouponID INT

)
BEGIN

SELECT * FROM tblCoupon WHERE CouponID=p_CouponID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Coupon_Del`(IN
p_CouponID INT
)
BEGIN

DELETE FROM tblCoupon where CouponID=p_CouponID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Coupon_List`()
BEGIN

SELECT



tblCoupon.CouponID as "ID",
DATE_FORMAT(tblCoupon.DateCreated,'%d %b %Y') as "Inicio",
DATE_FORMAT(tblCoupon.ExpirationDate,'%d %b %Y') as "Expiracion",
CONCAT(tblCoupon.Discount,'%') as "Descuento",
tblCoupon.Description as "Descripcion"

FROM tblCoupon;

end$$

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
p_Phone varchar(50),
p_Address VARCHAR(200),
p_Email VARCHAR(100),
p_Password VARCHAR(100),
p_Salary INT,
p_Active BIT
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
	Salary,
        Active
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
	p_Salary,
        0
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
	Salary=p_Salary,
        Active=p_Active
        
	WHERE EmployeeID=p_EmployeeID;
        
        if p_Password<>'' then
        UPDATE tblEmployee set Password=p_Password where EmployeeID=p_EmployeeID;
        end IF;
        
END IF;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Employee_ByID`(IN
p_EmployeeID INT
)
BEGIN

SELECT

tblEmployee.EmployeeID,
tblEmployee.PositionID,
tblEmployee.FirstName,
tblEmployee.LastName,
(case when tblEmployee.Gender=0 then "Male" else "Female" end) as Gender,
tblEmployee.Phone,
tblEmployee.Address,
tblEmployee.Email,
tblEmployee.Salary,
(case when tblEmployee.Active=0 then "Active" else "Innactive" end) as Active

 FROM tblEmployee WHERE EmployeeID=p_EmployeeID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Employee_ByNames`(IN
p_Search VARCHAR(100)
)
BEGIN

SELECT

tblEmployee.EmployeeID as ID,
tblPosition.PositionName as Posicion,
tblEmployee.FirstName as Nombres,
tblEmployee.LastName as Apellidos,
(case when tblEmployee.Gender=0 then "Masculino" else "Femenino" end) as Sexo,
tblEmployee.Phone as Telefono,
tblEmployee.Address as Direccion,
tblEmployee.Email as Correo,
CONCAT('$', FORMAT(tblEmployee.Salary, 2)) as Salario,
(case when tblEmployee.Active=0 then "Activo" else "Inactivo" end) as Estado

FROM tblEmployee 
JOIN tblPosition ON tblEmployee.PositionID=tblPosition.PositionID
WHERE tblEmployee.FirstName LIKE CONCAT('%', p_Search, '%') OR tblEmployee.LastName LIKE CONCAT('%', p_Search, '%')
ORDER BY tblEmployee.Active;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Employee_Del`(IN
p_EmployeeID INT
)
begin

DELETE FROM tblEmployee where EmployeeID=p_EmployeeID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Employee_List`()
BEGIN 

SELECT

tblEmployee.EmployeeID as ID,
tblPosition.PositionName as Posicion,
tblEmployee.FirstName as Nombres,
tblEmployee.LastName as Apellidos,
(case when tblEmployee.Gender=0 then "Masculino" else "Femenino" end) as Sexo,
tblEmployee.Phone as Telefono,
tblEmployee.Address as Direccion,
tblEmployee.Email as Correo,
CONCAT('$', FORMAT(tblEmployee.Salary, 2)) as Salario,
(case when tblEmployee.Active=0 then "Activo" else "Inactivo" end) as Estado

FROM tblEmployee
JOIN tblPosition ON tblEmployee.PositionID=tblPosition.PositionID
ORDER BY tblEmployee.Active,tblEmployee.LastName;

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

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Provider`(IN
p_ProviderID INT,
p_ProviderName varchar(100),
p_ProviderAddress VARCHAR(300),
p_ProviderPhone varchar(50),
p_ProviderCellphone varchar(50),
p_ProviderCompany VARCHAR(100),
p_ProviderEmail varchar(100),
p_Active BIT
)
BEGIN
IF p_ProviderID=0 then
	INSERT INTO tblProvider
	(
	ProviderName,
	ProviderAddress,
	ProviderPhone,
	ProviderCellphone,
	ProviderCompany,
	ProviderEmail,
        Active
	)
	VALUES
	(
	p_ProviderName,
	p_ProviderAddress,
	p_ProviderPhone,
	p_ProviderCellphone,
	p_ProviderCompany,
	p_ProviderEmail,
        0
	);
else
	UPDATE tblProvider set
	ProviderName=p_ProviderName,
	ProviderAddress=p_ProviderAddress,
	ProviderPhone=p_ProviderPhone,
	ProviderCellphone=p_ProviderCellphone,
	ProviderCompany=p_ProviderCompany,
	ProviderEmail=p_ProviderEmail,
        Active=p_Active

	WHERE ProviderID=p_ProviderID;

END IF;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Provider_ByID`(
IN
p_ProviderID INT
)
BEGIN

SELECT * FROM tblProvider WHERE ProviderID=p_ProviderID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Provider_ByNames`( IN
p_Search VARCHAR(100)
)
BEGIN

	SELECT

	ProviderID as ID,
	ProviderName as Nombre,
	ProviderAddress as Direccion,
	ProviderPhone as Telefono,
	ProviderCellphone as Celular,
	ProviderCompany as Compañia,
	ProviderEmail as Email,
        (case when tblProvider.Active=0 then "Activo" else "Inactivo" end) as Estado

	FROM tblProvider WHERE ProviderName LIKE CONCAT('%', p_Search, '%') OR ProviderCompany LIKE CONCAT('%', p_Search, '%') ORDER BY Active, ProviderCompany;
END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Provider_Del`(
IN
p_ProviderID INT
)
BEGIN

DELETE FROM tblProvider WHERE ProviderID=p_ProviderID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Provider_EmailVerification`(IN
p_Email VARCHAR(100)
)
BEGIN

SELECT * FROM tblProvider WHERE Email=p_Email;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Provider_List`()
BEGIN

	SELECT

	ProviderID as ID,
	ProviderName as Nombre,
	ProviderAddress as Direccion,
	ProviderPhone as Telefono,
	ProviderCellphone as Celular,
	ProviderCompany as Compañia,
	ProviderEmail as Email,
    (case when tblProvider.Active=0 then "Activo" else "Inactivo" end) as Estado

	FROM tblProvider ORDER BY Active, ProviderCompany;
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
p_ProviderID INT,
p_StockName VARCHAR(50),
p_QuantityAvailable INT,
p_UnitID INT
)
BEGIN

IF p_StockID=0 THEN
	insert into tblStock
		(
			ProviderID,
			StockName,
			QuantityAvailable,
			UnitID
		)

		VALUES
		(
			p_ProviderID,
			p_StockName,
			p_QuantityAvailable,
			p_UnitID
		);

ELSE
	update tblStock set
		ProviderID=p_ProviderID,
		StockName=p_StockName,
		QuantityAvailable=p_QuantityAvailable,
		UnitID=p_UnitID
	WHERE StockID=p_StockID;

END IF;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_StockOrder`(IN
p_StockOrderID INT,
p_EmployeeID INT,
p_ProviderID INT,
p_StockOrderCost DECIMAL
)
BEGIN

IF p_StockOrderID=0 THEN
	insert into tblStockOrder
		(
			EmployeeID,
			ProviderID,
			StockOrderDate,
			StockOrderCost
		)

		VALUES
		(
			p_EmployeeID,
			p_ProviderID,
			NOW(),
			p_StockOrderCost
		);

ELSE
	update tblStockOrder set
		EmployeeID=p_EmployeeID,
		ProviderID=p_ProviderID,
		StockOrderCost=p_StockOrderCost
	WHERE StockOrderID=p_StockOrderID;

END IF;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_StockOrderDetail`(IN
p_StockOrderDetailID INT,
p_StockOrderID INT,
p_StockID INT,
p_Quantity INT
)
BEGIN

IF p_StockOrderDetailID=0 THEN
	insert into tblStockOrderDetail
		(
			StockOrderID,
			StockID,
			Quantity
		)

		VALUES
		(
			p_StockOrderID,
			p_StockID,
			p_Quantity
		);

ELSE
	update tblStockOrderDetail set
		StockOrderID=p_StockOrderID,
		StockID=p_StockID,
		Quantity=p_Quantity
	WHERE StockOrderDetailID=p_StockOrderDetailID;

END IF;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Stock_ByID`(IN
p_StockID INT
)
BEGIN

SELECT * FROM tblStock where StockID=p_StockID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Stock_Del`(IN
p_StockID INT
)
BEGIN

DELETE FROM tblStock WHERE StockID=p_StockID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Stock_List`()
BEGIN

SELECT

tblStock.StockID as "ID",
tblProvider.ProviderCompany as "Compañia",
tblStock.StockName as "Consumible",
tblStock.QuantityAvailable as "Disponible",
tblUnit.UnitName as "Unidad"

FROM tblStock

JOIN tblProvider on tblStock.ProviderID=tblProvider.ProviderID
JOIN tblUnit on tblUnit.UnitID=tblStock.UnitID;

end$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Ticket`(IN
p_TicketID INT,
p_EmployeeID INT,
p_Price DECIMAL (10,2)
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
    	DATE_SUB(NOW(),INTERVAL 3 HOUR),
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

IF p_TicketDetailID=0 THEN
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
    	(select Price from tblProduct_Price where tblProduct_Price.ProductID=p_ProductID and tblProduct_Price.SizeID = p_SizeID),
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

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_TicketDetail_ByTicketID`(IN
p_TicketID INT)
BEGIN

SELECT

tblProduct.ProductName as Nombre,
tblSize.SizeName as Tamano,
tblTicketDetail.Quantity as Cantidad,
tblTicketDetail.ProductPrice as Precio,
(tblTicketDetail.Quantity*tblTicketDetail.ProductPrice) as Total

FROM tblTicketDetail
JOIN tblProduct on tblTicketDetail.ProductID=tblProduct.ProductID
JOIN tblSize on tblTicketDetail.SizeID=tblSize.SizeID
WHERE tblTicketDetail.TicketID=p_TicketID;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Ticket_List`()
BEGIN 

SELECT

tblTicket.TicketID as ID,
DATE_FORMAT(tblTicket.TicketDate,'%b %d %Y %h:%i %p') as Fecha,
tblEmployee.FirstName as Empleado,
CONCAT('$', FORMAT((tblTicket.Price*0.16), 2)) as IVA,
CONCAT('$', FORMAT(tblTicket.Price, 2)) as Total

FROM tblTicket
JOIN tblEmployee ON tblEmployee.EmployeeID=tblTicket.EmployeeID
ORDER BY TicketID DESC;

END$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Ticket_List_ByDate`(IN
p_StartDate DATE,
p_EndDate DATE)
BEGIN 

SELECT

tblTicket.TicketID as ID,
tblTicket.TicketDate as Fecha,
tblEmployee.FirstName as Empleado,
CONCAT('$', FORMAT((tblTicket.Price*0.16), 2)) as IVA,
CONCAT('$', FORMAT(tblTicket.Price, 2)) as Total

FROM tblTicket 
JOIN tblEmployee ON tblEmployee.EmployeeID=tblTicket.EmployeeID
WHERE tblTicket.TicketDate BETWEEN p_StartDate AND p_EndDate;
end$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Unit`(IN
p_UnitID INT,
p_UnitName VARCHAR(100)
)
BEGIN

if p_UnitID=0 THEN
insert into tblUnit (UnitName) values (p_UnitName);

else 
update tblUnit set UnitName=p_UnitName where UnitID=p_UnitID;

end if;

end$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Unit_ByID`(IN p_UnitID INT)
BEGIN
SELECT * FROM tblUnit where UnitID=p_UnitID;
end$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Unit_Del`(IN p_UnitID INT)
BEGIN
DELETE FROM tblUnit where UnitID=p_UnitID;
end$$

CREATE DEFINER=`u304295155_hdcde`@`localhost` PROCEDURE `sp_Unit_List`()
BEGIN
select * from tblUnit;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblCoupon`
--

CREATE TABLE IF NOT EXISTS `tblCoupon` (
  `CouponID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` date NOT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tblCoupon`
--

INSERT INTO `tblCoupon` (`CouponID`, `DateCreated`, `ExpirationDate`, `Discount`, `Description`) VALUES
(7, '2014-06-09', '2014-06-13', 25, 'Descuento en todo'),
(2, '2014-06-09', '2014-06-14', 25, 'Descuentos!');

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
  `Phone` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`PositionID`),
  KEY `fk_tblEmployee_tblPosition1_idx` (`PositionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `tblEmployee`
--

INSERT INTO `tblEmployee` (`EmployeeID`, `PositionID`, `FirstName`, `LastName`, `Gender`, `Phone`, `Address`, `Email`, `Password`, `Salary`, `Active`) VALUES
(1, 1, 'Super', 'User', b'0', '(432) 143-2143', 'Calle 8 #718', 'admin@gmail.com', '12345', 100000, b'0'),
(82, 3, 'Martin', 'Toledo Dude', b'0', '(123) 456-4556', 'Calle Dude #123', 'martin@gmail.com', '12345', 4234214, b'1'),
(81, 1, 'Quignones', 'Quignones', b'0', '(900) 900-9090', 'Av Seridores, Colonia Apache 22345', 'quignones@gmail.com', '12345', 9000000, b'0'),
(73, 2, 'Supervisor', 'Supervisor', b'0', '(143) 143-1431', 'Calle Cajero #1234, Tijuana, B.C.', 'supervisor@gmail.com', '12345', 2147483647, b'0'),
(72, 1, 'Cajero', 'Cajero', b'1', '(143) 143-1431', 'Calle Cajero #1234, Tijuana, B.C.', 'cajero@gmail.com', '12345', 2147483647, b'0'),
(71, 3, 'Gerente', 'Gerente', b'0', '(143) 143-1431', 'Calle Gerente #1234, Tijuana, B.C.', 'gerente@gmail.com', '12345', 2147483647, b'0'),
(70, 3, 'Omar', 'Lopez', b'0', '(143) 143-1431', 'Calle Jorge #1234, Tijuana, B.C.', 'jorge@gmail.com', '12345', 2147483647, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tblPosition`
--

CREATE TABLE IF NOT EXISTS `tblPosition` (
  `PositionID` int(11) NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblPosition`
--

INSERT INTO `tblPosition` (`PositionID`, `PositionName`) VALUES
(1, 'Cajero'),
(2, 'Supervisor'),
(3, 'Gerente');

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
  `ProviderPhone` varchar(50) DEFAULT NULL,
  `ProviderCellphone` varchar(50) DEFAULT NULL,
  `ProviderCompany` varchar(100) DEFAULT NULL,
  `ProviderEmail` varchar(100) DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`ProviderID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblProvider`
--

INSERT INTO `tblProvider` (`ProviderID`, `ProviderName`, `ProviderAddress`, `ProviderPhone`, `ProviderCellphone`, `ProviderCompany`, `ProviderEmail`, `Active`) VALUES
(1, 'Juan Cortez', 'calle roma', '(231) 231-2233', '(664) 354-1231', 'Food Inc.', 'juan@gmail.com', b'0'),
(3, 'Ivan Sanchez', 'Winterfell, Dracarys 2543 Tijuana B.C.', '(664) 737-3898', '(664) 123-1231', 'Huevos BC', 'huevo@gmail.com', b'0');

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
  `ProviderID` int(11) NOT NULL,
  `StockName` varchar(50) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  `UnitID` int(11) NOT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tblStock`
--

INSERT INTO `tblStock` (`StockID`, `ProviderID`, `StockName`, `QuantityAvailable`, `UnitID`) VALUES
(1, 1, 'Vasos de cafe medianos', 100, 1),
(2, 1, 'Vasos chicos de cafe', 300, 1),
(5, 1, 'Cafe americano', 5000, 2);

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
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TicketID`,`EmployeeID`),
  KEY `fk_tblTicket_tblEmployee_idx` (`EmployeeID`),
  KEY `Price` (`Price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `tblTicket`
--

INSERT INTO `tblTicket` (`TicketID`, `EmployeeID`, `TicketDate`, `Price`) VALUES
(29, 1, '2014-05-25 21:41:04', '100.00'),
(30, 4, '2014-05-26 14:21:31', '100.00'),
(31, 1, '2014-05-26 15:31:04', '66.00'),
(32, 1, '2014-05-26 15:34:02', '51.00'),
(33, 1, '2014-05-26 16:33:06', '71.00'),
(34, 1, '2014-05-26 18:24:56', '94.00'),
(35, 1, '2014-05-27 17:42:14', '89.00'),
(36, 1, '2014-05-27 17:44:21', '89.00'),
(37, 1, '2014-05-27 21:36:02', '96.00'),
(38, 1, '2014-05-27 21:36:08', '44.00'),
(39, 1, '2014-05-29 12:04:15', '74.00'),
(40, 1, '2014-05-29 14:34:20', '58.00'),
(41, 1, '2014-05-29 15:49:10', '74.00'),
(42, 1, '2014-05-30 08:56:14', '31.00'),
(43, 1, '2014-05-30 11:53:41', '14.00'),
(44, 72, '2014-05-30 18:24:43', '64.00'),
(45, 1, '2014-05-30 18:38:13', '155.00'),
(46, 72, '2014-06-03 16:47:42', '79.00'),
(47, 1, '2014-06-03 17:08:01', '21.00'),
(48, 1, '2014-06-03 17:33:29', '35.00'),
(49, 1, '2014-06-03 17:34:33', '17.00'),
(50, 72, '2014-06-03 18:41:49', '23.00'),
(51, 1, '2014-06-04 15:36:54', '0.00'),
(52, 1, '2014-06-04 15:42:47', '12.00'),
(53, 72, '2014-06-04 15:53:24', '77.00'),
(54, 72, '2014-06-04 15:54:11', '35.00'),
(55, 72, '2014-06-04 16:17:10', '79.00'),
(56, 72, '2014-06-04 16:17:40', '135.00'),
(57, 72, '2014-06-04 16:18:23', '23.00'),
(58, 1, '2014-06-04 16:20:03', '108.00'),
(59, 1, '2014-06-04 23:04:20', '108.00'),
(60, 1, '2014-06-05 16:28:57', '35.00'),
(61, 1, '2014-06-06 11:45:32', '151.00'),
(62, 1, '2014-06-07 21:55:17', '111.00'),
(63, 1, '2014-06-07 21:55:18', '35.00'),
(64, 1, '2014-06-07 21:56:47', '128.00'),
(65, 1, '2014-06-07 22:03:25', '31.00'),
(66, 1, '2014-06-08 02:01:46', '0.00'),
(67, 1, '2014-06-08 02:02:29', '21.00'),
(68, 1, '2014-06-08 02:10:22', '98.60'),
(69, 1, '2014-06-08 02:16:33', '32.48'),
(70, 1, '2014-06-08 02:19:18', '85.84'),
(71, 1, '2014-06-08 02:19:48', '53.36'),
(72, 1, '2014-06-08 02:19:56', '40.60'),
(73, 1, '2014-06-08 02:49:20', '71.92'),
(74, 72, '2014-06-09 11:18:26', '52.20'),
(75, 1, '2014-06-09 12:52:36', '0.00'),
(76, 1, '2014-06-09 12:58:57', '0.00'),
(77, 1, '2014-06-09 12:59:17', '0.00'),
(78, 1, '2014-06-09 12:59:24', '0.00'),
(79, 1, '2014-06-09 13:01:17', '0.00'),
(80, 1, '2014-06-09 13:01:27', '0.00'),
(81, 1, '2014-06-09 16:18:28', '155.44');

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
  PRIMARY KEY (`TicketDetailID`,`TicketID`,`ProductID`),
  KEY `fk_tblTicketDetail_tblTicket1_idx` (`TicketID`),
  KEY `fk_tblTicketDetail_tblProduct1_idx` (`ProductID`),
  KEY `fk_tblTicketDetail_tblSize1_idx` (`SizeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- Dumping data for table `tblTicketDetail`
--

INSERT INTO `tblTicketDetail` (`TicketDetailID`, `TicketID`, `ProductID`, `ProductPrice`, `SizeID`, `Quantity`) VALUES
(2, 29, 4, '18', 2, 1),
(3, 29, 3, '12', 1, 1),
(4, 30, 1, '15', 3, 1),
(5, 30, 4, '18', 2, 1),
(6, 30, 6, '31', 3, 1),
(7, 30, 4, '20', 3, 1),
(8, 30, 4, '20', 3, 1),
(9, 30, 4, '20', 3, 1),
(10, 30, 4, '20', 3, 1),
(11, 30, 4, '18', 2, 1),
(12, 30, 3, '15', 2, 1),
(13, 30, 3, '15', 2, 1),
(14, 30, 3, '15', 2, 1),
(15, 30, 3, '15', 2, 1),
(16, 30, 3, '15', 2, 1),
(17, 30, 3, '15', 2, 1),
(18, 30, 3, '15', 2, 1),
(19, 31, 4, '18', 2, 1),
(20, 31, 3, '17', 3, 1),
(21, 31, 5, '22', 1, 1),
(22, 32, 1, '12', 2, 2),
(23, 32, 2, '20', 3, 1),
(24, 33, 2, '18', 2, 1),
(25, 33, 1, '10', 1, 1),
(26, 33, 3, '17', 3, 1),
(27, 33, 4, '16', 1, 1),
(28, 34, 1, '12', 2, 1),
(29, 34, 4, '20', 3, 1),
(30, 34, 6, '29', 2, 1),
(31, 34, 2, '20', 3, 1),
(32, 35, 1, '15', 3, 1),
(33, 35, 4, '18', 2, 1),
(34, 35, 6, '26', 1, 1),
(35, 35, 2, '18', 2, 1),
(36, 36, 1, '15', 3, 1),
(37, 36, 4, '18', 2, 1),
(38, 36, 6, '26', 1, 1),
(39, 36, 2, '18', 2, 1),
(40, 37, 1, '12', 2, 1),
(41, 37, 4, '20', 3, 1),
(42, 37, 3, '15', 2, 1),
(43, 37, 2, '18', 2, 2),
(44, 38, 2, '18', 2, 1),
(45, 38, 2, '20', 3, 1),
(46, 39, 2, '18', 2, 1),
(47, 39, 4, '20', 3, 1),
(48, 39, 6, '26', 1, 1),
(49, 40, 4, '20', 3, 1),
(50, 40, 3, '15', 2, 2),
(51, 41, 1, '10', 1, 1),
(52, 41, 4, '18', 2, 3),
(53, 42, 1, '12', 2, 1),
(54, 42, 1, '15', 3, 1),
(55, 43, 1, '12', 2, 1),
(56, 44, 3, '15', 2, 3),
(57, 44, 1, '10', 1, 1),
(58, 45, 1, '15', 3, 1),
(59, 45, 6, '31', 3, 1),
(60, 45, 5, '25', 2, 2),
(61, 45, 1, '12', 2, 1),
(62, 45, 6, '26', 1, 1),
(63, 46, 2, '18', 2, 1),
(64, 46, 4, '20', 3, 1),
(65, 46, 3, '15', 2, 2),
(66, 47, 4, '18', 2, 1),
(67, 48, 3, '15', 2, 2),
(68, 49, 1, '15', 3, 1),
(69, 50, 2, '20', 3, 1),
(70, 52, 1, '10', 1, 1),
(71, 53, 1, '15', 3, 1),
(72, 53, 2, '20', 3, 1),
(73, 53, 6, '31', 3, 1),
(74, 54, 1, '15', 3, 1),
(75, 54, 3, '15', 2, 1),
(76, 55, 4, '20', 3, 1),
(77, 55, 6, '31', 3, 1),
(78, 55, 3, '17', 3, 1),
(79, 56, 1, '12', 2, 1),
(80, 56, 4, '18', 2, 1),
(81, 56, 6, '29', 2, 1),
(82, 56, 6, '31', 3, 1),
(83, 56, 6, '26', 1, 1),
(84, 57, 2, '20', 3, 1),
(85, 58, 1, '15', 3, 1),
(86, 58, 5, '22', 1, 1),
(87, 58, 5, '28', 3, 2),
(88, 59, 6, '31', 3, 1),
(89, 59, 4, '18', 2, 1),
(90, 59, 3, '17', 3, 2),
(91, 59, 1, '10', 1, 1),
(92, 60, 1, '15', 3, 1),
(93, 60, 3, '15', 2, 1),
(94, 61, 4, '18', 2, 1),
(95, 61, 2, '20', 3, 1),
(96, 61, 6, '31', 3, 1),
(97, 61, 6, '26', 1, 1),
(98, 61, 4, '20', 3, 1),
(99, 61, 3, '15', 2, 1),
(100, 62, 4, '20', 3, 1),
(101, 62, 3, '17', 3, 1),
(102, 62, 2, '18', 2, 1),
(103, 62, 1, '12', 2, 1),
(104, 62, 6, '29', 2, 1),
(105, 63, 1, '10', 1, 3),
(106, 64, 1, '10', 1, 3),
(107, 64, 4, '18', 2, 1),
(108, 64, 6, '31', 3, 2),
(109, 65, 1, '12', 2, 1),
(110, 65, 3, '15', 2, 1),
(111, 67, 2, '18', 2, 1),
(112, 68, 2, '20', 3, 1),
(113, 68, 4, '18', 2, 2),
(114, 68, 6, '29', 2, 1),
(115, 69, 1, '10', 1, 1),
(116, 69, 2, '18', 2, 1),
(117, 70, 4, '18', 2, 1),
(118, 70, 3, '15', 2, 1),
(119, 70, 6, '29', 2, 1),
(120, 70, 6, '26', 1, 1),
(121, 71, 2, '20', 3, 1),
(122, 71, 6, '26', 1, 1),
(123, 72, 4, '20', 3, 1),
(124, 72, 3, '15', 2, 1),
(125, 73, 3, '15', 2, 1),
(126, 73, 4, '16', 1, 1),
(127, 73, 6, '31', 3, 1),
(128, 74, 3, '15', 2, 1),
(129, 74, 2, '18', 2, 1),
(130, 74, 2, '15', 1, 1),
(131, 81, 4, '18', 2, 1),
(132, 81, 6, '29', 2, 4);

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

-- --------------------------------------------------------

--
-- Table structure for table `tblUnit`
--

CREATE TABLE IF NOT EXISTS `tblUnit` (
  `UnitID` int(11) NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UnitID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblUnit`
--

INSERT INTO `tblUnit` (`UnitID`, `UnitName`) VALUES
(1, 'Unidades'),
(2, 'Gramos'),
(3, 'Mililitros');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
