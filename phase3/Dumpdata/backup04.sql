-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `Id` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `Id` int NOT NULL,
  `generateDate` date NOT NULL,
  `bookKeeper_employee_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_bill_bookKeeper1_idx` (`bookKeeper_employee_Id`),
  CONSTRAINT `fk_bill_bookKeeper1` FOREIGN KEY (`bookKeeper_employee_Id`) REFERENCES `bookkeeper` (`employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookkeeper`
--

DROP TABLE IF EXISTS `bookkeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookkeeper` (
  `employee_Id` int NOT NULL,
  PRIMARY KEY (`employee_Id`),
  CONSTRAINT `fk_bookKeeper_employee1` FOREIGN KEY (`employee_Id`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookkeeper`
--

LOCK TABLES `bookkeeper` WRITE;
/*!40000 ALTER TABLE `bookkeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookkeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
  `customer_NationalId` int NOT NULL,
  `paymentMethod_TracingCode` int NOT NULL,
  `basket_Id` int NOT NULL,
  `bill_Id` int NOT NULL,
  `seller_employee_Id` int NOT NULL,
  `postman_employee_Id` int NOT NULL,
  PRIMARY KEY (`customer_NationalId`,`paymentMethod_TracingCode`,`basket_Id`,`seller_employee_Id`,`postman_employee_Id`),
  KEY `fk_BUY_paymentMethod1_idx` (`paymentMethod_TracingCode`),
  KEY `fk_BUY_basket1_idx` (`basket_Id`),
  KEY `fk_BUY_bill1_idx` (`bill_Id`),
  KEY `fk_BUY_seller1_idx` (`seller_employee_Id`),
  KEY `fk_BUY_postman1_idx` (`postman_employee_Id`),
  CONSTRAINT `fk_BUY_basket1` FOREIGN KEY (`basket_Id`) REFERENCES `basket` (`Id`),
  CONSTRAINT `fk_BUY_bill1` FOREIGN KEY (`bill_Id`) REFERENCES `bill` (`Id`),
  CONSTRAINT `fk_BUY_customer1` FOREIGN KEY (`customer_NationalId`) REFERENCES `customer` (`NationalId`),
  CONSTRAINT `fk_BUY_paymentMethod1` FOREIGN KEY (`paymentMethod_TracingCode`) REFERENCES `paymentmethod` (`TracingCode`),
  CONSTRAINT `fk_BUY_postman1` FOREIGN KEY (`postman_employee_Id`) REFERENCES `postman` (`employee_Id`),
  CONSTRAINT `fk_BUY_seller1` FOREIGN KEY (`seller_employee_Id`) REFERENCES `seller` (`employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash` (
  `paymentMethod_TracingCode` int NOT NULL,
  PRIMARY KEY (`paymentMethod_TracingCode`),
  CONSTRAINT `fk_cash_paymentMethod` FOREIGN KEY (`paymentMethod_TracingCode`) REFERENCES `paymentmethod` (`TracingCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commend`
--

DROP TABLE IF EXISTS `commend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commend` (
  `Id` int NOT NULL,
  `point` int NOT NULL,
  `text` longtext NOT NULL,
  `product_Id` int NOT NULL,
  `customer_NationalId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_commend_product1_idx` (`product_Id`),
  KEY `fk_commend_customer1_idx` (`customer_NationalId`),
  CONSTRAINT `fk_commend_customer1` FOREIGN KEY (`customer_NationalId`) REFERENCES `customer` (`NationalId`),
  CONSTRAINT `fk_commend_product1` FOREIGN KEY (`product_Id`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commend`
--

LOCK TABLES `commend` WRITE;
/*!40000 ALTER TABLE `commend` DISABLE KEYS */;
/*!40000 ALTER TABLE `commend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `NationalId` int NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`NationalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (12,'mohamadhasan','normal','binabaji','mashad','undefined'),(13,'reza','normal','sadeghi','mashad','undefined'),(15,'r','normal','s','mashad','undefined'),(16,'mostafa','normal','binabaji','mashad','1111'),(20,'hasan','normal','sefidro','tehran','1234');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `code` varchar(45) NOT NULL,
  `paymentMethod_TracingCode` int NOT NULL,
  `discountCod_code` varchar(45) NOT NULL,
  PRIMARY KEY (`paymentMethod_TracingCode`),
  KEY `fk_discount_discountCod1_idx` (`discountCod_code`),
  CONSTRAINT `fk_discount_discountCod1` FOREIGN KEY (`discountCod_code`) REFERENCES `discountcod` (`code`),
  CONSTRAINT `fk_discount_paymentMethod1` FOREIGN KEY (`paymentMethod_TracingCode`) REFERENCES `paymentmethod` (`TracingCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountcod`
--

DROP TABLE IF EXISTS `discountcod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountcod` (
  `code` varchar(45) NOT NULL,
  `percent` decimal(3,2) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountcod`
--

LOCK TABLES `discountcod` WRITE;
/*!40000 ALTER TABLE `discountcod` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountcod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `salary` double unsigned zerofill NOT NULL,
  `employDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `TracingCode` int NOT NULL,
  `rawAmount` double DEFAULT NULL,
  `finalAmount` double DEFAULT NULL,
  PRIMARY KEY (`TracingCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postman`
--

DROP TABLE IF EXISTS `postman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postman` (
  `employee_Id` int NOT NULL,
  PRIMARY KEY (`employee_Id`),
  CONSTRAINT `fk_postman_employee1` FOREIGN KEY (`employee_Id`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postman`
--

LOCK TABLES `postman` WRITE;
/*!40000 ALTER TABLE `postman` DISABLE KEYS */;
/*!40000 ALTER TABLE `postman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricerecord`
--

DROP TABLE IF EXISTS `pricerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricerecord` (
  `date` date NOT NULL,
  `purchasePrice` int NOT NULL,
  `sellPrice` int NOT NULL,
  `product_Id` int NOT NULL,
  PRIMARY KEY (`product_Id`,`date`),
  CONSTRAINT `fk_priceRecord_product1` FOREIGN KEY (`product_Id`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricerecord`
--

LOCK TABLES `pricerecord` WRITE;
/*!40000 ALTER TABLE `pricerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `manufactureDate` date DEFAULT NULL,
  `purchaseDate` date NOT NULL,
  `basket_Id` int DEFAULT NULL,
  `stock_Id` int NOT NULL,
  `supplier_Id` int NOT NULL,
  `discount` int NOT NULL,
  `expirationDate` date DEFAULT NULL,
  `type` enum('labaniat','drink','tanagholat','adviejat','kalaAsasi','dokhaniat') DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_product_basket1_idx` (`basket_Id`),
  KEY `fk_product_stock1_idx` (`stock_Id`),
  KEY `fk_product_supplier1_idx` (`supplier_Id`),
  CONSTRAINT `fk_product_basket1` FOREIGN KEY (`basket_Id`) REFERENCES `basket` (`Id`),
  CONSTRAINT `fk_product_stock1` FOREIGN KEY (`stock_Id`) REFERENCES `stock` (`Id`),
  CONSTRAINT `fk_product_supplier1` FOREIGN KEY (`supplier_Id`) REFERENCES `supplier` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `employee_Id` int NOT NULL,
  PRIMARY KEY (`employee_Id`),
  CONSTRAINT `fk_seller_employee1` FOREIGN KEY (`employee_Id`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `Id` int NOT NULL,
  `address` linestring NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockman`
--

DROP TABLE IF EXISTS `stockman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockman` (
  `employee_Id` int NOT NULL,
  `stock_Id` int NOT NULL,
  PRIMARY KEY (`employee_Id`),
  KEY `fk_stockman_stock1_idx` (`stock_Id`),
  CONSTRAINT `fk_stockman_employee1` FOREIGN KEY (`employee_Id`) REFERENCES `employee` (`Id`),
  CONSTRAINT `fk_stockman_stock1` FOREIGN KEY (`stock_Id`) REFERENCES `stock` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockman`
--

LOCK TABLES `stockman` WRITE;
/*!40000 ALTER TABLE `stockman` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `phoneNumber` decimal(10,0) unsigned DEFAULT NULL,
  `address` linestring DEFAULT NULL,
  `paymentMethod` varchar(45) DEFAULT NULL,
  `cSAT` decimal(3,2) unsigned zerofill DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-05  9:37:43
