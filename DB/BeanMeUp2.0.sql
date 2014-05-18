SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `BeanMeUp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `BeanMeUp` ;

-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblPosition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblPosition` (
  `PositionID` INT NOT NULL AUTO_INCREMENT,
  `PositionName` VARCHAR(100) NULL,
  PRIMARY KEY (`PositionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblEmployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblEmployee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `PositionID` INT NOT NULL,
  `FirstName` VARCHAR(100) NULL,
  `LastName` VARCHAR(100) NULL,
  `Gender` BIT NULL,
  `Phone` INT NULL,
  `Address` VARCHAR(200) NULL,
  `Email` VARCHAR(100) NULL,
  `Password` VARCHAR(100) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`EmployeeID`, `PositionID`),
  INDEX `fk_tblEmployee_tblPosition1_idx` (`PositionID` ASC),
  CONSTRAINT `fk_tblEmployee_tblPosition1`
    FOREIGN KEY (`PositionID`)
    REFERENCES `BeanMeUp`.`tblPosition` (`PositionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblCoupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblCoupon` (
  `CouponID` INT NOT NULL AUTO_INCREMENT,
  `ExpirationDate` DATETIME NULL,
  `Discount` INT NULL,
  PRIMARY KEY (`CouponID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblTicket` (
  `TicketID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT NOT NULL,
  `TicketDate` DATETIME NULL,
  `TotalCost` DECIMAL NULL,
  PRIMARY KEY (`TicketID`, `EmployeeID`),
  INDEX `fk_tblTicket_tblEmployee_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_tblTicket_tblEmployee`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `BeanMeUp`.`tblEmployee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblSize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblSize` (
  `SizeID` INT NOT NULL AUTO_INCREMENT,
  `SizeName` VARCHAR(50) NULL,
  `SizeVolumeML` INT NULL,
  PRIMARY KEY (`SizeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblProductCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblProductCategory` (
  `ProductCategoryID` INT NOT NULL AUTO_INCREMENT,
  `ProductCategoryName` VARCHAR(100) NULL,
  PRIMARY KEY (`ProductCategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblProduct` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductCategoryID` INT NOT NULL,
  `ProductName` VARCHAR(100) NULL,
  PRIMARY KEY (`ProductID`, `ProductCategoryID`),
  INDEX `fk_tblProduct_tblProductCategory1_idx` (`ProductCategoryID` ASC),
  CONSTRAINT `fk_tblProduct_tblProductCategory1`
    FOREIGN KEY (`ProductCategoryID`)
    REFERENCES `BeanMeUp`.`tblProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblTicketDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblTicketDetail` (
  `TicketDetailID` INT NOT NULL AUTO_INCREMENT,
  `TicketID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `SizeID` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`TicketDetailID`, `TicketID`, `ProductID`),
  INDEX `fk_tblTicketDetail_tblTicket1_idx` (`TicketID` ASC),
  INDEX `fk_tblTicketDetail_tblProduct1_idx` (`ProductID` ASC),
  INDEX `fk_tblTicketDetail_tblSize1_idx` (`SizeID` ASC),
  CONSTRAINT `fk_tblTicketDetail_tblTicket1`
    FOREIGN KEY (`TicketID`)
    REFERENCES `BeanMeUp`.`tblTicket` (`TicketID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicketDetail_tblProduct1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `BeanMeUp`.`tblProduct` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicketDetail_tblSize1`
    FOREIGN KEY (`SizeID`)
    REFERENCES `BeanMeUp`.`tblSize` (`SizeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblProduct_Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblProduct_Price` (
  `Product_PriceID` INT NOT NULL AUTO_INCREMENT,
  `ProductID` INT NOT NULL,
  `SizeID` INT NOT NULL,
  `Price` DECIMAL NULL,
  PRIMARY KEY (`Product_PriceID`, `ProductID`, `SizeID`),
  INDEX `fk_tblProduct_Price_tblProduct1_idx` (`ProductID` ASC),
  INDEX `fk_tblProduct_Price_tblSize1_idx` (`SizeID` ASC),
  CONSTRAINT `fk_tblProduct_Price_tblProduct1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `BeanMeUp`.`tblProduct` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProduct_Price_tblSize1`
    FOREIGN KEY (`SizeID`)
    REFERENCES `BeanMeUp`.`tblSize` (`SizeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblTicket_Coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblTicket_Coupon` (
  `Ticket_CouponID` INT NOT NULL AUTO_INCREMENT,
  `CouponID` INT NOT NULL,
  `TicketID` INT NOT NULL,
  PRIMARY KEY (`Ticket_CouponID`, `CouponID`, `TicketID`),
  INDEX `fk_tblTicket_Coupon_tblCoupon1_idx` (`CouponID` ASC),
  INDEX `fk_tblTicket_Coupon_tblTicket1_idx` (`TicketID` ASC),
  CONSTRAINT `fk_tblTicket_Coupon_tblCoupon1`
    FOREIGN KEY (`CouponID`)
    REFERENCES `BeanMeUp`.`tblCoupon` (`CouponID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicket_Coupon_tblTicket1`
    FOREIGN KEY (`TicketID`)
    REFERENCES `BeanMeUp`.`tblTicket` (`TicketID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblStock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblStock` (
  `StockID` INT NOT NULL AUTO_INCREMENT,
  `StockName` VARCHAR(50) NULL,
  `QuantityAvailable` INT NULL,
  PRIMARY KEY (`StockID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblProduct_Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblProduct_Stock` (
  `Product_StockID` INT NOT NULL AUTO_INCREMENT,
  `ProductID` INT NOT NULL,
  `SizeID` INT NOT NULL,
  `StockID` INT NOT NULL,
  `QuantityNeeded` INT NULL,
  PRIMARY KEY (`Product_StockID`, `ProductID`, `SizeID`, `StockID`),
  INDEX `fk_tblProduct_Stock_tblStock1_idx` (`StockID` ASC),
  INDEX `fk_tblProduct_Stock_tblSize1_idx` (`SizeID` ASC),
  INDEX `fk_tblProduct_Stock_tblProduct1_idx` (`ProductID` ASC),
  CONSTRAINT `fk_tblProduct_Stock_tblStock1`
    FOREIGN KEY (`StockID`)
    REFERENCES `BeanMeUp`.`tblStock` (`StockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProduct_Stock_tblSize1`
    FOREIGN KEY (`SizeID`)
    REFERENCES `BeanMeUp`.`tblSize` (`SizeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProduct_Stock_tblProduct1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `BeanMeUp`.`tblProduct` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblProvider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblProvider` (
  `ProviderID` INT NOT NULL AUTO_INCREMENT,
  `ProviderName` VARCHAR(100) NULL,
  `ProviderAddress` VARCHAR(300) NULL,
  `ProviderPhone` INT NULL,
  `ProviderCompany` VARCHAR(100) NULL,
  `ProviderEmail` VARCHAR(100) NULL,
  PRIMARY KEY (`ProviderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblStockOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblStockOrder` (
  `StockOrderID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT NOT NULL,
  `ProviderID` INT NOT NULL,
  `StockOrderDate` DATETIME NULL,
  `StockOrderCost` DECIMAL NULL,
  PRIMARY KEY (`StockOrderID`, `EmployeeID`, `ProviderID`),
  INDEX `fk_tblStockOrder_tblEmployee1_idx` (`EmployeeID` ASC),
  INDEX `fk_tblStockOrder_tblProvider1_idx` (`ProviderID` ASC),
  CONSTRAINT `fk_tblStockOrder_tblEmployee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `BeanMeUp`.`tblEmployee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblStockOrder_tblProvider1`
    FOREIGN KEY (`ProviderID`)
    REFERENCES `BeanMeUp`.`tblProvider` (`ProviderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblStockOrderDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblStockOrderDetail` (
  `StockOrderDetailID` INT NOT NULL AUTO_INCREMENT,
  `StockOrderID` INT NOT NULL,
  `StockID` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`StockOrderDetailID`, `StockOrderID`, `StockID`),
  INDEX `fk_tblStockOrderDetail_tblStockOrder1_idx` (`StockOrderID` ASC),
  INDEX `fk_tblStockOrderDetail_tblStock1_idx` (`StockID` ASC),
  CONSTRAINT `fk_tblStockOrderDetail_tblStockOrder1`
    FOREIGN KEY (`StockOrderID`)
    REFERENCES `BeanMeUp`.`tblStockOrder` (`StockOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblStockOrderDetail_tblStock1`
    FOREIGN KEY (`StockID`)
    REFERENCES `BeanMeUp`.`tblStock` (`StockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
