SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `BeanMeUp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `BeanMeUp` ;

-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblEmployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblEmployee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(100) NULL,
  `LastName` VARCHAR(100) NULL,
  `Gender` BIT NULL,
  `Phone` INT NULL,
  `Address` VARCHAR(200) NULL,
  `Email` VARCHAR(100) NULL,
  `PositionID` INT NULL,
  `Salary` INT NULL,
  `DistrictID` INT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblCustomer` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(100) NULL,
  `LastName` VARCHAR(100) NULL,
  `Gender` BIT NULL,
  `Phone` INT NULL,
  `Address` VARCHAR(200) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblCoupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblCoupon` (
  `CouponID` INT NOT NULL,
  `ExpirationDate` DATETIME NULL,
  `Discount` INT NULL,
  PRIMARY KEY (`CouponID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblTicket` (
  `TicketID` INT NOT NULL,
  `TicketDate` DATETIME NULL,
  `TotalCost` DECIMAL NULL,
  `CustomerID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`TicketID`),
  INDEX `fk_tblTicket_tblEmployee_idx` (`EmployeeID` ASC),
  INDEX `fk_tblTicket_tblCustomer1_idx` (`CustomerID` ASC),
  CONSTRAINT `fk_tblTicket_tblEmployee`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `BeanMeUp`.`tblEmployee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicket_tblCustomer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `BeanMeUp`.`tblCustomer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblTicketDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblTicketDetail` (
  `TicketDetailID` INT NOT NULL,
  `TicketID` INT NULL,
  `DrinkID` INT NULL,
  `SizeID` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`TicketDetailID`),
  INDEX `fk_tblTicketDetail_tblTicket1_idx` (`TicketID` ASC),
  CONSTRAINT `fk_tblTicketDetail_tblTicket1`
    FOREIGN KEY (`TicketID`)
    REFERENCES `BeanMeUp`.`tblTicket` (`TicketDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblSize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblSize` (
  `SizeID` INT NOT NULL,
  `SizeName` VARCHAR(50) NULL,
  `SizeVolumeML` INT NULL,
  PRIMARY KEY (`SizeID`),
  CONSTRAINT `fk_tblSize_tblTicketDetail1`
    FOREIGN KEY (`SizeID`)
    REFERENCES `BeanMeUp`.`tblTicketDetail` (`SizeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblDrink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblDrink` (
  `DrinkID` INT NOT NULL,
  `DrinkName` VARCHAR(100) NULL,
  PRIMARY KEY (`DrinkID`),
  CONSTRAINT `fk_tblDrink_tblTicketDetail1`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `BeanMeUp`.`tblTicketDetail` (`DrinkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblDrink_Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblDrink_Price` (
  `Drink_PriceID` INT NOT NULL,
  `DrinkID` INT NULL,
  `SizeID` INT NULL,
  `Price` DECIMAL NULL,
  PRIMARY KEY (`Drink_PriceID`),
  INDEX `fk_tblDrink_Price_tblDrink1_idx` (`DrinkID` ASC),
  INDEX `fk_tblDrink_Price_tblSize1_idx` (`SizeID` ASC),
  CONSTRAINT `fk_tblDrink_Price_tblDrink1`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `BeanMeUp`.`tblDrink` (`DrinkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblDrink_Price_tblSize1`
    FOREIGN KEY (`SizeID`)
    REFERENCES `BeanMeUp`.`tblSize` (`SizeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblTicket_Coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblTicket_Coupon` (
  `Ticket_CouponID` INT NOT NULL,
  `TicketID` INT NULL,
  `CouponID` INT NULL,
  PRIMARY KEY (`Ticket_CouponID`),
  INDEX `fk_tblTicket_Coupon_tblTicket1_idx` (`TicketID` ASC),
  INDEX `fk_tblTicket_Coupon_tblCoupon1_idx` (`CouponID` ASC),
  CONSTRAINT `fk_tblTicket_Coupon_tblTicket1`
    FOREIGN KEY (`TicketID`)
    REFERENCES `BeanMeUp`.`tblTicket` (`TicketID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTicket_Coupon_tblCoupon1`
    FOREIGN KEY (`CouponID`)
    REFERENCES `BeanMeUp`.`tblCoupon` (`CouponID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblIngredient` (
  `IngredientID` INT NOT NULL,
  `IngredientName` VARCHAR(100) NULL,
  `Description` VARCHAR(300) NULL,
  PRIMARY KEY (`IngredientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblStock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblStock` (
  `StockID` INT NOT NULL,
  `IngredientID` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`StockID`),
  INDEX `fk_tblStock_tblIngredient1_idx` (`IngredientID` ASC),
  CONSTRAINT `fk_tblStock_tblIngredient1`
    FOREIGN KEY (`IngredientID`)
    REFERENCES `BeanMeUp`.`tblIngredient` (`IngredientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblDrink_Ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblDrink_Ingredient` (
  `Drink_IngredientID` INT NOT NULL,
  `DrinkID` INT NULL,
  `IngredientID` INT NULL,
  `SizeID` INT NULL,
  `PrepQuantity` INT NULL,
  PRIMARY KEY (`Drink_IngredientID`),
  INDEX `fk_tblDrink_Ingredient_tblDrink1_idx` (`DrinkID` ASC),
  INDEX `fk_tblDrink_Ingredient_tblIngredient1_idx` (`IngredientID` ASC),
  INDEX `fk_tblDrink_Ingredient_tblSize1_idx` (`SizeID` ASC),
  CONSTRAINT `fk_tblDrink_Ingredient_tblDrink1`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `BeanMeUp`.`tblDrink` (`DrinkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblDrink_Ingredient_tblIngredient1`
    FOREIGN KEY (`IngredientID`)
    REFERENCES `BeanMeUp`.`tblIngredient` (`IngredientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblDrink_Ingredient_tblSize1`
    FOREIGN KEY (`SizeID`)
    REFERENCES `BeanMeUp`.`tblSize` (`SizeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BeanMeUp`.`tblStockOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BeanMeUp`.`tblStockOrder` (
  `StockOrderID` INT NOT NULL,
  `StockOrderDate` DATETIME NULL,
  `Provider` VARCHAR(200) NULL,
  `Company` VARCHAR(100) NULL,
  `StockOrderCost` DECIMAL NULL,
  `IngredientID` INT NULL,
  `StockOrderQuantity` INT NULL,
  `StockOrderPhone` INT NULL,
  PRIMARY KEY (`StockOrderID`),
  INDEX `fk_tblStockOrder_tblIngredient1_idx` (`IngredientID` ASC),
  CONSTRAINT `fk_tblStockOrder_tblIngredient1`
    FOREIGN KEY (`IngredientID`)
    REFERENCES `BeanMeUp`.`tblIngredient` (`IngredientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
