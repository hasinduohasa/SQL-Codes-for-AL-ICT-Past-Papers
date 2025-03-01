-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 01, 2025 at 10:42 AM
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
-- Database: `2015al`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `BillID` char(5) NOT NULL,
  PRIMARY KEY (`BillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BillID`) VALUES
('601'),
('602'),
('603');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `DocID` char(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`DocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DocID`, `Name`) VALUES
('301', 'Dr. Mahesh Wijesingh'),
('302', 'Dr. Chamini De Silva'),
('303', 'Dr. Harsha Tennakoon');

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
CREATE TABLE IF NOT EXISTS `drug` (
  `DrugID` char(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`DrugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`DrugID`, `Name`) VALUES
('201', 'Panadol'),
('202', 'Amoxillin'),
('203', 'Metformin'),
('204', 'Cetirizine'),
('205', 'Losartan');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE IF NOT EXISTS `hospital` (
  `HosID` char(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `ContactNo` int NOT NULL,
  PRIMARY KEY (`HosID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`HosID`, `Name`, `Address`, `ContactNo`) VALUES
('401', 'National Hospital Co', 'Colombo 10, Sri Lank', 112691111),
('402', 'Karapitiya Teaching ', 'Galle, Sri Lanka', 912222265),
('403', 'Peradeniya Teaching ', 'Peradeniya, Sri Lank', 812388888);

-- --------------------------------------------------------

--
-- Table structure for table `parmacist`
--

DROP TABLE IF EXISTS `parmacist`;
CREATE TABLE IF NOT EXISTS `parmacist` (
  `PharID` char(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`PharID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parmacist`
--

INSERT INTO `parmacist` (`PharID`, `Name`) VALUES
('1', 'Nuwan Perera'),
('2', 'Shanika Silva'),
('3', 'Dilan Weerasinghe');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `PatID` char(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Age` int NOT NULL,
  `Address` varchar(20) NOT NULL,
  PRIMARY KEY (`PatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatID`, `Name`, `Age`, `Address`) VALUES
('101', 'Kasun', 32, 'Kandy'),
('102', 'Tharushi', 26, 'Galle'),
('103', 'Ravindu', 40, 'Colombo 07');

-- --------------------------------------------------------

--
-- Table structure for table `patientphone`
--

DROP TABLE IF EXISTS `patientphone`;
CREATE TABLE IF NOT EXISTS `patientphone` (
  `PatID` char(5) NOT NULL,
  `Phone` int NOT NULL,
  PRIMARY KEY (`PatID`,`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patientphone`
--

INSERT INTO `patientphone` (`PatID`, `Phone`) VALUES
('101', 711234567),
('101', 762594657),
('102', 779876543),
('103', 702345678),
('103', 711212372),
('103', 717424269);

-- --------------------------------------------------------

--
-- Table structure for table `prepare`
--

DROP TABLE IF EXISTS `prepare`;
CREATE TABLE IF NOT EXISTS `prepare` (
  `PharID` char(5) NOT NULL,
  `BillID` char(5) NOT NULL,
  `PreID` char(5) NOT NULL,
  PRIMARY KEY (`PharID`,`BillID`,`PreID`),
  KEY `BillID` (`BillID`),
  KEY `PreID` (`PreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prepare`
--

INSERT INTO `prepare` (`PharID`, `BillID`, `PreID`) VALUES
('1', '601', '501'),
('2', '602', '502'),
('3', '603', '503');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `PreID` char(5) NOT NULL,
  `DocID` char(5) NOT NULL,
  `HosID` char(5) NOT NULL,
  `DateIssued` date NOT NULL,
  PRIMARY KEY (`PreID`,`DocID`,`HosID`),
  UNIQUE KEY `PreID` (`PreID`),
  KEY `DocID` (`DocID`),
  KEY `HosID` (`HosID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`PreID`, `DocID`, `HosID`, `DateIssued`) VALUES
('501', '301', '401', '0000-00-00'),
('502', '302', '402', '0000-00-00'),
('503', '303', '403', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_drug`
--

DROP TABLE IF EXISTS `prescription_drug`;
CREATE TABLE IF NOT EXISTS `prescription_drug` (
  `PreID` char(5) NOT NULL,
  `DrugID` char(5) NOT NULL,
  `SizeValue` decimal(6,2) NOT NULL,
  `SizeUnit` varchar(10) NOT NULL,
  `DoseValue` decimal(6,2) NOT NULL,
  `DoseUnit` varchar(10) NOT NULL,
  PRIMARY KEY (`PreID`,`DrugID`),
  KEY `DrugID` (`DrugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prescription_drug`
--

INSERT INTO `prescription_drug` (`PreID`, `DrugID`, `SizeValue`, `SizeUnit`, `DoseValue`, `DoseUnit`) VALUES
('501', '201', 500.00, 'mg', 2.00, 'times/day'),
('501', '202', 250.00, 'mg', 3.00, 'times/day'),
('502', '203', 850.00, 'mg', 1.00, 'time/day'),
('503', '204', 10.00, 'mg', 1.00, 'time/day'),
('503', '205', 50.00, 'mg', 1.00, 'time/day');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patientphone`
--
ALTER TABLE `patientphone`
  ADD CONSTRAINT `patientphone_ibfk_1` FOREIGN KEY (`PatID`) REFERENCES `patient` (`PatID`);

--
-- Constraints for table `prepare`
--
ALTER TABLE `prepare`
  ADD CONSTRAINT `prepare_ibfk_1` FOREIGN KEY (`PharID`) REFERENCES `parmacist` (`PharID`),
  ADD CONSTRAINT `prepare_ibfk_2` FOREIGN KEY (`BillID`) REFERENCES `bill` (`BillID`),
  ADD CONSTRAINT `prepare_ibfk_3` FOREIGN KEY (`PreID`) REFERENCES `prescription` (`PreID`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`DocID`) REFERENCES `doctor` (`DocID`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`HosID`) REFERENCES `hospital` (`HosID`);

--
-- Constraints for table `prescription_drug`
--
ALTER TABLE `prescription_drug`
  ADD CONSTRAINT `prescription_drug_ibfk_1` FOREIGN KEY (`PreID`) REFERENCES `prescription` (`PreID`),
  ADD CONSTRAINT `prescription_drug_ibfk_2` FOREIGN KEY (`DrugID`) REFERENCES `drug` (`DrugID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
