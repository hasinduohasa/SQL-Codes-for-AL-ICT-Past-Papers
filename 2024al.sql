-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 17, 2025 at 06:26 PM
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
-- Database: `2024al`
--

-- --------------------------------------------------------

--
-- Table structure for table `customor`
--

DROP TABLE IF EXISTS `customor`;
CREATE TABLE IF NOT EXISTS `customor` (
  `Cid` char(5) NOT NULL,
  `Cfname` varchar(10) NOT NULL,
  `Csname` varchar(10) NOT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customor`
--

INSERT INTO `customor` (`Cid`, `Cfname`, `Csname`) VALUES
('C001', 'Kasun', 'Perera'),
('C002', 'Nimal', 'Fernando'),
('C003', 'Amali', 'Wijesinghe');

-- --------------------------------------------------------

--
-- Table structure for table `customor_phone`
--

DROP TABLE IF EXISTS `customor_phone`;
CREATE TABLE IF NOT EXISTS `customor_phone` (
  `Cid` char(5) NOT NULL,
  `Cphone` int NOT NULL,
  PRIMARY KEY (`Cid`,`Cphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customor_phone`
--

INSERT INTO `customor_phone` (`Cid`, `Cphone`) VALUES
('C001', 719876543),
('C001', 771234567),
('C002', 765432198),
('C003', 751122334);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `Eno` char(5) NOT NULL,
  `Ename` varchar(10) NOT NULL,
  `Eposition` varchar(10) NOT NULL,
  `Etype` varchar(10) NOT NULL,
  PRIMARY KEY (`Eno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Eno`, `Ename`, `Eposition`, `Etype`) VALUES
('E001', 'Saman', 'Manager', 'Full-Time'),
('E002', 'Ruwan', 'Cashier', 'Part-Time'),
('E003', 'Dilani', 'Attendant', 'Full-Time');

-- --------------------------------------------------------

--
-- Table structure for table `petrol`
--

DROP TABLE IF EXISTS `petrol`;
CREATE TABLE IF NOT EXISTS `petrol` (
  `Pid` char(5) NOT NULL,
  `Pprice` int NOT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `petrol`
--

INSERT INTO `petrol` (`Pid`, `Pprice`) VALUES
('P001', 365),
('P002', 430),
('P003', 450);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `Vno` char(5) NOT NULL,
  `Pid` char(5) NOT NULL,
  `Sqty` int NOT NULL,
  `State` char(5) NOT NULL,
  PRIMARY KEY (`Vno`,`Pid`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`Vno`, `Pid`, `Sqty`, `State`) VALUES
('V001', 'P001', 20, 'Paid'),
('V002', 'P002', 15, 'Paid'),
('V003', 'P003', 25, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

DROP TABLE IF EXISTS `sell`;
CREATE TABLE IF NOT EXISTS `sell` (
  `Pid` char(5) NOT NULL,
  `Eno` char(5) NOT NULL,
  PRIMARY KEY (`Pid`,`Eno`),
  KEY `Eno` (`Eno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE IF NOT EXISTS `vehicle` (
  `Vno` char(5) NOT NULL,
  `Vmodel` varchar(10) NOT NULL,
  `Cid` char(5) NOT NULL,
  PRIMARY KEY (`Vno`),
  KEY `Cid` (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vno`, `Vmodel`, `Cid`) VALUES
('V001', 'Axio', 'C001'),
('V002', 'Alto', 'C002'),
('V003', 'Vezel', 'C003');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customor_phone`
--
ALTER TABLE `customor_phone`
  ADD CONSTRAINT `customor_phone_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `customor` (`Cid`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`Vno`) REFERENCES `vehicle` (`Vno`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`Pid`) REFERENCES `petrol` (`Pid`);

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `petrol` (`Pid`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`Eno`) REFERENCES `employee` (`Eno`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `customor` (`Cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
