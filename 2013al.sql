-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 01, 2025 at 10:41 AM
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
-- Database: `2013al`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE IF NOT EXISTS `car` (
  `CarID` char(5) NOT NULL,
  `OwnerID` char(5) DEFAULT NULL,
  PRIMARY KEY (`CarID`),
  KEY `OwnerID` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`CarID`, `OwnerID`) VALUES
('C01', 'O01'),
('C02', 'O01'),
('C03', 'O02'),
('C04', 'O02'),
('C5', 'O02');

-- --------------------------------------------------------

--
-- Table structure for table `cardriver`
--

DROP TABLE IF EXISTS `cardriver`;
CREATE TABLE IF NOT EXISTS `cardriver` (
  `DriverID` char(5) NOT NULL,
  `CarID` char(5) NOT NULL,
  PRIMARY KEY (`DriverID`,`CarID`),
  KEY `CarID` (`CarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cardriver`
--

INSERT INTO `cardriver` (`DriverID`, `CarID`) VALUES
('D02', 'C01'),
('D01', 'C02'),
('D02', 'C02'),
('D05', 'C02'),
('D02', 'C03'),
('D05', 'C04');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CusID` char(5) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Address` varchar(15) NOT NULL,
  `PHONE` int NOT NULL,
  PRIMARY KEY (`CusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CusID`, `Name`, `Address`, `PHONE`) VALUES
('CD01', 'Lal', 'Galle', 119),
('CD02', 'Anil', 'Matara', 412286586),
('CD03', 'MahindaRP', 'Tangalle', 1990),
('CD04', 'ChandanaSB', 'Collombo', 7788),
('CD05', 'TonyStark', 'California', 6255678),
('CD06', 'TomHolland', 'London', 666778899);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `DriverID` char(5) NOT NULL,
  `DriverName` varchar(15) NOT NULL,
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`DriverID`, `DriverName`) VALUES
('D01', 'HarryPotter'),
('D02', 'Sunimal'),
('D03', 'AKD'),
('D05', 'BabyDriver'),
('D4', 'Madahasa');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `OwnerID` char(5) NOT NULL,
  `OwnerName` varchar(15) NOT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OwnerID`, `OwnerName`) VALUES
('O01', 'Kamal'),
('O02', 'Nimal'),
('O03', 'Sunil'),
('O4', 'Amal');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `CarID` char(5) NOT NULL,
  `CusID` char(5) NOT NULL,
  PRIMARY KEY (`CarID`,`CusID`),
  KEY `CusID` (`CusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`CarID`, `CusID`) VALUES
('C01', 'CD01'),
('C03', 'CD02'),
('C04', 'CD03'),
('C5', 'CD03'),
('C01', 'CD04'),
('C02', 'CD05'),
('C02', 'CD06');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `owner` (`OwnerID`);

--
-- Constraints for table `cardriver`
--
ALTER TABLE `cardriver`
  ADD CONSTRAINT `cardriver_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `driver` (`DriverID`),
  ADD CONSTRAINT `cardriver_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`CusID`) REFERENCES `customer` (`CusID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
