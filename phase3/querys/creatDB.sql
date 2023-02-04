-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `NationalId` INT NOT NULL,
  `firstName` VARCHAR(50) NULL,
  `type` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NationalId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`basket` (
  `Id` INT NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stock` (
  `Id` INT NOT NULL,
  `address` LINESTRING NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`supplier` (
  `Id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phoneNumber` DECIMAL UNSIGNED NULL,
  `address` LINESTRING NULL,
  `paymentMethod` VARCHAR(45) NULL,
  `cSAT` DECIMAL(3,2) ZEROFILL NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `Id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `manufactureDate` DATE NULL,
  `purchaseDate` DATE NOT NULL,
  `basket_Id` INT NULL,
  `stock_Id` INT NOT NULL,
  `supplier_Id` INT NOT NULL,
  `discount` INT NOT NULL,
  `expirationDate` DATE NULL,
  `type` ENUM('labaniat', 'drink', 'tanagholat', 'adviejat', 'kalaAsasi', 'dokhaniat') NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_product_basket1_idx` (`basket_Id` ASC) VISIBLE,
  INDEX `fk_product_stock1_idx` (`stock_Id` ASC) VISIBLE,
  INDEX `fk_product_supplier1_idx` (`supplier_Id` ASC) VISIBLE,
  CONSTRAINT `fk_product_basket1`
    FOREIGN KEY (`basket_Id`)
    REFERENCES `mydb`.`basket` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_stock1`
    FOREIGN KEY (`stock_Id`)
    REFERENCES `mydb`.`stock` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_supplier1`
    FOREIGN KEY (`supplier_Id`)
    REFERENCES `mydb`.`supplier` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`priceRecord`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`priceRecord` (
  `date` DATE NOT NULL,
  `purchasePrice` INT NOT NULL,
  `sellPrice` INT NOT NULL,
  `product_Id` INT NOT NULL,
  PRIMARY KEY (`product_Id`, `date`),
  CONSTRAINT `fk_priceRecord_product1`
    FOREIGN KEY (`product_Id`)
    REFERENCES `mydb`.`product` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paymentMethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paymentMethod` (
  `TracingCode` INT NOT NULL,
  `rawAmount` DOUBLE NULL,
  `finalAmount` DOUBLE NULL,
  PRIMARY KEY (`TracingCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cash`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cash` (
  `paymentMethod_TracingCode` INT NOT NULL,
  PRIMARY KEY (`paymentMethod_TracingCode`),
  CONSTRAINT `fk_cash_paymentMethod`
    FOREIGN KEY (`paymentMethod_TracingCode`)
    REFERENCES `mydb`.`paymentMethod` (`TracingCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`discountCod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`discountCod` (
  `code` VARCHAR(45) NOT NULL,
  `percent` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`discount` (
  `code` VARCHAR(45) NOT NULL,
  `paymentMethod_TracingCode` INT NOT NULL,
  `discountCod_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paymentMethod_TracingCode`),
  INDEX `fk_discount_discountCod1_idx` (`discountCod_code` ASC) VISIBLE,
  CONSTRAINT `fk_discount_paymentMethod1`
    FOREIGN KEY (`paymentMethod_TracingCode`)
    REFERENCES `mydb`.`paymentMethod` (`TracingCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_discount_discountCod1`
    FOREIGN KEY (`discountCod_code`)
    REFERENCES `mydb`.`discountCod` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `Id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `salary` DOUBLE ZEROFILL NOT NULL,
  `employDate` DATE NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seller` (
  `employee_Id` INT NOT NULL,
  PRIMARY KEY (`employee_Id`),
  CONSTRAINT `fk_seller_employee1`
    FOREIGN KEY (`employee_Id`)
    REFERENCES `mydb`.`employee` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`postman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`postman` (
  `employee_Id` INT NOT NULL,
  PRIMARY KEY (`employee_Id`),
  CONSTRAINT `fk_postman_employee1`
    FOREIGN KEY (`employee_Id`)
    REFERENCES `mydb`.`employee` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bookKeeper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bookKeeper` (
  `employee_Id` INT NOT NULL,
  PRIMARY KEY (`employee_Id`),
  CONSTRAINT `fk_bookKeeper_employee1`
    FOREIGN KEY (`employee_Id`)
    REFERENCES `mydb`.`employee` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bill` (
  `Id` INT NOT NULL,
  `generateDate` DATE NOT NULL,
  `bookKeeper_employee_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_bill_bookKeeper1_idx` (`bookKeeper_employee_Id` ASC) VISIBLE,
  CONSTRAINT `fk_bill_bookKeeper1`
    FOREIGN KEY (`bookKeeper_employee_Id`)
    REFERENCES `mydb`.`bookKeeper` (`employee_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stockman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stockman` (
  `employee_Id` INT NOT NULL,
  `stock_Id` INT NOT NULL,
  PRIMARY KEY (`employee_Id`),
  INDEX `fk_stockman_stock1_idx` (`stock_Id` ASC) VISIBLE,
  CONSTRAINT `fk_stockman_employee1`
    FOREIGN KEY (`employee_Id`)
    REFERENCES `mydb`.`employee` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stockman_stock1`
    FOREIGN KEY (`stock_Id`)
    REFERENCES `mydb`.`stock` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BUY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BUY` (
  `customer_NationalId` INT NOT NULL,
  `paymentMethod_TracingCode` INT NOT NULL,
  `basket_Id` INT NOT NULL,
  `bill_Id` INT NOT NULL,
  `seller_employee_Id` INT NOT NULL,
  `postman_employee_Id` INT NOT NULL,
  PRIMARY KEY (`customer_NationalId`, `paymentMethod_TracingCode`, `basket_Id`, `seller_employee_Id`, `postman_employee_Id`),
  INDEX `fk_BUY_paymentMethod1_idx` (`paymentMethod_TracingCode` ASC) VISIBLE,
  INDEX `fk_BUY_basket1_idx` (`basket_Id` ASC) VISIBLE,
  INDEX `fk_BUY_bill1_idx` (`bill_Id` ASC) VISIBLE,
  INDEX `fk_BUY_seller1_idx` (`seller_employee_Id` ASC) VISIBLE,
  INDEX `fk_BUY_postman1_idx` (`postman_employee_Id` ASC) VISIBLE,
  CONSTRAINT `fk_BUY_customer1`
    FOREIGN KEY (`customer_NationalId`)
    REFERENCES `mydb`.`customer` (`NationalId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BUY_paymentMethod1`
    FOREIGN KEY (`paymentMethod_TracingCode`)
    REFERENCES `mydb`.`paymentMethod` (`TracingCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BUY_basket1`
    FOREIGN KEY (`basket_Id`)
    REFERENCES `mydb`.`basket` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BUY_bill1`
    FOREIGN KEY (`bill_Id`)
    REFERENCES `mydb`.`bill` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BUY_seller1`
    FOREIGN KEY (`seller_employee_Id`)
    REFERENCES `mydb`.`seller` (`employee_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BUY_postman1`
    FOREIGN KEY (`postman_employee_Id`)
    REFERENCES `mydb`.`postman` (`employee_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`commend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`commend` (
  `Id` INT NOT NULL,
  `point` INT NOT NULL,
  `text` LONGTEXT NOT NULL,
  `product_Id` INT NOT NULL,
  `customer_NationalId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_commend_product1_idx` (`product_Id` ASC) VISIBLE,
  INDEX `fk_commend_customer1_idx` (`customer_NationalId` ASC) VISIBLE,
  CONSTRAINT `fk_commend_product1`
    FOREIGN KEY (`product_Id`)
    REFERENCES `mydb`.`product` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commend_customer1`
    FOREIGN KEY (`customer_NationalId`)
    REFERENCES `mydb`.`customer` (`NationalId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
