-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 07, 2025 at 01:55 PM
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
-- Database: `2018al`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `CompanyRegNo` char(5) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Address` varchar(10) NOT NULL,
  PRIMARY KEY (`CompanyRegNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyRegNo`, `Name`, `Address`) VALUES
('R01', 'Microsoft', 'Colombo'),
('R02', 'Adobe', 'Matara'),
('R03', 'Google ', 'Polonnaruw'),
('R04', 'Tesla', 'Planet Mar'),
('R05', 'Black Berr', 'Brasilia');

-- --------------------------------------------------------

--
-- Table structure for table `dependant`
--

DROP TABLE IF EXISTS `dependant`;
CREATE TABLE IF NOT EXISTS `dependant` (
  `Name` varchar(10) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Relationship` varchar(10) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `StaffID` char(5) NOT NULL,
  PRIMARY KEY (`Name`,`StaffID`),
  KEY `StaffID` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dependant`
--

INSERT INTO `dependant` (`Name`, `DateOfBirth`, `Relationship`, `Gender`, `StaffID`) VALUES
('Chandana', '2016-11-12', 'Son', 'Male', 'S05'),
('Kanthi', '2000-12-25', 'Sister', 'Female', 'S06'),
('Navindu Th', '2006-10-11', 'Son', 'Male', 'S02'),
('Sachindra', '1998-05-12', 'Wife', 'Female', 'S06'),
('Sanduni', '2019-11-15', 'Daugther', 'Female', 'S01'),
('Shashika R', '1998-06-07', 'Daugther', 'Female', 'S01'),
('Thisum', '2001-11-12', 'Brother', 'Male', 'S04');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `StaffID` char(5) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Address` varchar(10) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `WorkSince` date NOT NULL,
  `CompanyRegNo` char(5) NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `CompanyRegNo` (`CompanyRegNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `Address`, `DateOfBirth`, `WorkSince`, `CompanyRegNo`) VALUES
('S01', 'Chandra Ku', 'Moon', '1998-03-12', '2000-05-12', 'R04'),
('S02', 'Amal Sirip', 'Colombo', '1948-02-04', '2002-08-28', 'R05'),
('S03', 'Shavendra ', 'Negombo', '1788-02-13', '2024-01-01', 'R02'),
('S04', 'Chamath Pa', 'Los Angele', '1967-06-08', '1999-09-09', 'R01'),
('S05', 'Stave Jobs', 'Jaffa(Near', '1887-06-12', '2014-05-21', 'R03'),
('S06', 'Bill Gates', 'Hambanthot', '1988-10-09', '2008-08-08', 'R03');

-- --------------------------------------------------------

--
-- Table structure for table `staff_phone`
--

DROP TABLE IF EXISTS `staff_phone`;
CREATE TABLE IF NOT EXISTS `staff_phone` (
  `StaffID` char(5) NOT NULL,
  `Phone` int NOT NULL,
  PRIMARY KEY (`StaffID`,`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff_phone`
--

INSERT INTO `staff_phone` (`StaffID`, `Phone`) VALUES
('S01', 711212372),
('S02', 41227788),
('S02', 682556783),
('S03', 7788),
('S04', 21445566),
('S04', 774516439),
('S05', 98225563);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dependant`
--
ALTER TABLE `dependant`
  ADD CONSTRAINT `dependant_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`CompanyRegNo`) REFERENCES `company` (`CompanyRegNo`);

--
-- Constraints for table `staff_phone`
--
ALTER TABLE `staff_phone`
  ADD CONSTRAINT `staff_phone_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
