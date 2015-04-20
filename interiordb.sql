-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2015 at 04:19 PM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `interiordb`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `applicationID` int(11) NOT NULL,
  `appDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`applicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `application_has_table1`
--

CREATE TABLE IF NOT EXISTS `application_has_table1` (
  `application_applicationID` int(11) NOT NULL,
  `table1_userType` int(11) NOT NULL,
  PRIMARY KEY (`application_applicationID`,`table1_userType`),
  KEY `fk_application_has_table1_table11_idx` (`table1_userType`),
  KEY `fk_application_has_table1_application1_idx` (`application_applicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `phoneNum` int(11) NOT NULL,
  `areaCode` int(11) NOT NULL,
  PRIMARY KEY (`phoneNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`phoneNum`, `areaCode`) VALUES
(5223456, 1203),
(7600525, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerContactNumber` int(45) NOT NULL,
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerFirstName` varchar(45) NOT NULL,
  `customerLastName` varchar(45) DEFAULT NULL,
  `customerAddress` varchar(500) NOT NULL,
  `customerType` char(1) NOT NULL,
  PRIMARY KEY (`customerContactNumber`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`),
  KEY `fk_customer_Type1_idx` (`customerType`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerContactNumber`, `customerID`, `customerFirstName`, `customerLastName`, `customerAddress`, `customerType`) VALUES
(1111111, 2, 'Alvin', NULL, 'daiubsdaiusdh', 'A'),
(2222222, 4, 'Mhargoth', NULL, 'manila, philippines', 'A'),
(3333333, 3, 'TKN Shop', NULL, 'Caloocan', 'B'),
(90651466, 1, 'ICS Carpentry Shop', NULL, 'Lot 11 Blk 31 Northfields Village Longos Malolos Bulcan', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employeeContactNumber` int(11) NOT NULL,
  `employeefirstName` varchar(45) NOT NULL,
  `employeeLastname` varchar(45) NOT NULL,
  `employee_fromdate` date DEFAULT NULL,
  `employee_todate` date DEFAULT NULL,
  `branch_phoneNum` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`employeeContactNumber`),
  KEY `fk_employee_branch1_idx` (`branch_phoneNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeContactNumber`, `employeefirstName`, `employeeLastname`, `employee_fromdate`, `employee_todate`, `branch_phoneNum`, `username`, `password`) VALUES
(9614578, 'Mhargoth', 'Sandel', NULL, NULL, 5223456, 'Sandel', 'KKK'),
(9919999, 'Janine', 'Angelo', NULL, NULL, 5223456, 'DLSU', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_table1`
--

CREATE TABLE IF NOT EXISTS `employee_has_table1` (
  `employeeContactNumber` int(11) NOT NULL,
  `table1_userType` int(11) NOT NULL,
  PRIMARY KEY (`employeeContactNumber`,`table1_userType`),
  KEY `fk_employee_has_table1_table11_idx` (`table1_userType`),
  KEY `fk_employee_has_table1_employee1_idx` (`employeeContactNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `productID` int(11) NOT NULL,
  `itemCode` int(11) NOT NULL,
  `statusID` char(1) NOT NULL,
  `orderID` int(11) NOT NULL,
  PRIMARY KEY (`itemCode`),
  KEY `fk_Product_product1_idx` (`productID`),
  KEY `fk_items_itemStatus1_idx` (`statusID`),
  KEY `fk_items_order1_idx` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemstatus`
--

CREATE TABLE IF NOT EXISTS `itemstatus` (
  `statusID` char(1) NOT NULL DEFAULT '',
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemstatus`
--

INSERT INTO `itemstatus` (`statusID`, `description`) VALUES
('A', 'Available'),
('D', 'Delivered'),
('E', 'Defective');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `orderID` int(11) NOT NULL,
  `customerContactNumber` int(11) NOT NULL,
  `orderStatus` char(1) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `orderArrivalDate` date DEFAULT NULL,
  `branch_phoneNum` int(11) NOT NULL,
  `employeeContactNumber` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `fk_order_status1_idx` (`orderStatus`),
  KEY `fk_order_customer1_idx` (`customerContactNumber`),
  KEY `fk_order_branch1_idx` (`branch_phoneNum`),
  KEY `fk_order_employee1_idx` (`employeeContactNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderID`, `customerContactNumber`, `orderStatus`, `orderDate`, `orderArrivalDate`, `branch_phoneNum`, `employeeContactNumber`) VALUES
(1, 90651466, 'P', '2015-04-30', NULL, 5223456, 9919999),
(2, 2222222, 'P', '2015-04-30', NULL, 5223456, 9919999);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE IF NOT EXISTS `orderstatus` (
  `orderStatus` char(1) NOT NULL,
  `statusdescription` varchar(45) NOT NULL,
  PRIMARY KEY (`orderStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`orderStatus`, `statusdescription`) VALUES
('P', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(8) NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) NOT NULL,
  `productdescription` varchar(45) NOT NULL,
  `productPrice` decimal(9,2) NOT NULL,
  `productLine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`),
  KEY `fk_product_productLine1_idx` (`productLine`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90000010 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productname`, `productdescription`, `productPrice`, `productLine`) VALUES
(90000001, 'Kim Chair', 'Brown', '600.00', 'Chair'),
(90000003, 'King Bed', 'Standard', '6000.00', 'Bed'),
(90000004, 'GAMLEBY', 'Black', '650.54', 'Chair'),
(90000005, 'HEMNES', 'Desk', '850.65', 'Table'),
(90000006, 'MALAM', 'Desk', '846.48', 'Table'),
(90000007, 'METOD', 'Base Cabinet', '3542.69', 'Cabinet'),
(90000008, 'TARVA', 'Wooden', '5634.89', 'Cabinet'),
(90000009, 'DAGARN', 'two-seat sofa', '3524.00', 'Sofa');

-- --------------------------------------------------------

--
-- Table structure for table `productline`
--

CREATE TABLE IF NOT EXISTS `productline` (
  `productLine` varchar(45) NOT NULL,
  `productDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productline`
--

INSERT INTO `productline` (`productLine`, `productDescription`) VALUES
('Bed', 'Standard'),
('Cabinet', 'Two-door'),
('Chair', 'Brown'),
('Sofa', 'Set'),
('Table', 'Long');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE IF NOT EXISTS `purchaseorder` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `itemCode` int(11) NOT NULL,
  `orderStatus` char(1) NOT NULL,
  `orderDate` date NOT NULL,
  `orderArrivalDate` date NOT NULL,
  `phoneNum` int(11) NOT NULL,
  `employeeContactNumber` int(11) NOT NULL,
  PRIMARY KEY (`orderID`,`productID`,`itemCode`),
  KEY `fk_order_status1_idx` (`orderStatus`),
  KEY `fk_order_items1_idx` (`productID`,`itemCode`),
  KEY `fk_order_branch1_idx` (`phoneNum`),
  KEY `fk_purchaseorder_employee1_idx` (`employeeContactNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `typeID` char(1) NOT NULL,
  `definition` varchar(45) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typeID`, `definition`) VALUES
('A', 'Customer'),
('B', 'Company');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `userType` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application_has_table1`
--
ALTER TABLE `application_has_table1`
  ADD CONSTRAINT `fk_application_has_table1_application1` FOREIGN KEY (`application_applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_application_has_table1_table11` FOREIGN KEY (`table1_userType`) REFERENCES `usertype` (`userType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_Type1` FOREIGN KEY (`customerType`) REFERENCES `type` (`typeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_branch1` FOREIGN KEY (`branch_phoneNum`) REFERENCES `branch` (`phoneNum`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_has_table1`
--
ALTER TABLE `employee_has_table1`
  ADD CONSTRAINT `fk_employee_has_table1_employee1` FOREIGN KEY (`employeeContactNumber`) REFERENCES `employee` (`employeeContactNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_has_table1_table11` FOREIGN KEY (`table1_userType`) REFERENCES `usertype` (`userType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_items_itemStatus1` FOREIGN KEY (`statusID`) REFERENCES `itemstatus` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_items_order1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_branch1` FOREIGN KEY (`branch_phoneNum`) REFERENCES `branch` (`phoneNum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customerContactNumber`) REFERENCES `customer` (`customerContactNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_employee1` FOREIGN KEY (`employeeContactNumber`) REFERENCES `employee` (`employeeContactNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_status1` FOREIGN KEY (`orderStatus`) REFERENCES `orderstatus` (`orderStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_productLine1` FOREIGN KEY (`productLine`) REFERENCES `productline` (`productLine`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `fk_order_branch10` FOREIGN KEY (`phoneNum`) REFERENCES `branch` (`phoneNum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_items10` FOREIGN KEY (`productID`, `itemCode`) REFERENCES `items` (`productID`, `itemCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_status10` FOREIGN KEY (`orderStatus`) REFERENCES `orderstatus` (`orderStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchaseorder_employee1` FOREIGN KEY (`employeeContactNumber`) REFERENCES `employee` (`employeeContactNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
