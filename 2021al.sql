-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2025 at 02:47 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2021al`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `Code` int NOT NULL,
  `Name` varchar(10) NOT NULL,
  `ContactNo` int NOT NULL,
  PRIMARY KEY (`Code`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`Code`, `Name`, `ContactNo`) VALUES
(321, 'Anil', 702229555),
(321, 'MahindaRP', 214516434),
(456, 'TonyStark', 213366778),
(876, 'ChandanaSB', 25677865);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Email` varchar(30) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Location` varchar(10) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Email`, `Name`, `Location`) VALUES
('akd@gov.lk', 'Anura Kuma', 'Colombo'),
('Amal@hotmail.com', 'Amal Perer', 'Matara'),
('Info@gatesfoundation.org', 'Bill Gates', 'United Sta'),
('the.boy.who.lived@hogwats.uk', 'Harry Pott', 'London');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `OrderNo` int NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Value` int NOT NULL,
  PRIMARY KEY (`OrderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderNo`, `Description`, `Value`) VALUES
(122, 'A broom that can fly', 999999),
(123, 'Fabric Cloths', 2500),
(876, 'Cotton buds', 144),
(987, 'V8 twin turbo engine', 23000),
(1253, 'Nike T-shirts', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `Code` int NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Code`, `Address`) VALUES
(123, 'Darmapala Rd,Colombo7\r\n'),
(231, 'CBl,KANDY\r\n'),
(321, 'Apex,Matara'),
(456, 'IBM, Sri Lanka\r\n'),
(876, 'Olee AI,Kaduwela\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `supplierphone`
--

DROP TABLE IF EXISTS `supplierphone`;
CREATE TABLE IF NOT EXISTS `supplierphone` (
  `Code` int NOT NULL,
  `ContactNo` int NOT NULL,
  PRIMARY KEY (`Code`,`ContactNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplierphone`
--

INSERT INTO `supplierphone` (`Code`, `ContactNo`) VALUES
(123, 214516434),
(231, 78665432),
(231, 772288155),
(321, 702229555),
(456, 213366778),
(456, 772594657),
(876, 25677865),
(876, 412286555);

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
CREATE TABLE IF NOT EXISTS `supplies` (
  `Code` int NOT NULL,
  `Email` varchar(30) NOT NULL,
  `OrderNo` int NOT NULL,
  PRIMARY KEY (`Code`,`Email`,`OrderNo`),
  KEY `Email` (`Email`),
  KEY `OrderNo` (`OrderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`Code`, `Email`, `OrderNo`) VALUES
(231, 'akd@gov.lk', 122),
(456, 'the.boy.who.lived@hogwats.uk', 122),
(231, 'Amal@hotmail.com', 123),
(123, 'Info@gatesfoundation.org', 876),
(876, 'Info@gatesfoundation.org', 987),
(876, 'Amal@hotmail.com', 1253);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`Code`) REFERENCES `supplier` (`Code`);

--
-- Constraints for table `supplierphone`
--
ALTER TABLE `supplierphone`
  ADD CONSTRAINT `supplierphone_ibfk_1` FOREIGN KEY (`Code`) REFERENCES `supplier` (`Code`);

--
-- Constraints for table `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`Code`) REFERENCES `supplier` (`Code`),
  ADD CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`Email`) REFERENCES `customer` (`Email`),
  ADD CONSTRAINT `supplies_ibfk_3` FOREIGN KEY (`OrderNo`) REFERENCES `order` (`OrderNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
