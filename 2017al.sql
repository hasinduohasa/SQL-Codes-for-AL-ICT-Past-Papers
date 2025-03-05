-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 05, 2025 at 05:39 PM
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
-- Database: `2017al`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
CREATE TABLE IF NOT EXISTS `candidate` (
  `CID` char(5) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `AL_RESULT` varchar(3) NOT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`CID`, `Address`, `AL_RESULT`) VALUES
('Dhamm', 'Colombo7', 'SSS'),
('Ganin', 'Galle', 'AAB'),
('Saman', 'Jaffa(Near Nallur)', 'WWW'),
('Sinet', 'Matara', 'AAA');

-- --------------------------------------------------------

--
-- Table structure for table `financial_support`
--

DROP TABLE IF EXISTS `financial_support`;
CREATE TABLE IF NOT EXISTS `financial_support` (
  `FID` char(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `financial_support`
--

INSERT INTO `financial_support` (`FID`, `Name`, `payment_type`) VALUES
('F01', 'Mahapola', 'FullTime Cash'),
('F02', 'PodiPola', 'Half Cash '),
('F03', 'Ranil\'s University L', 'FREEEEE');

-- --------------------------------------------------------

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
CREATE TABLE IF NOT EXISTS `laptop` (
  `serial_no` char(5) NOT NULL,
  `model` varchar(20) NOT NULL,
  `Warrenty_period` varchar(20) NOT NULL,
  PRIMARY KEY (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `laptop`
--

INSERT INTO `laptop` (`serial_no`, `model`, `Warrenty_period`) VALUES
('L01', 'MacBookPro', '10Years'),
('L02', 'IBM ThinkPad', '2Days'),
('L03', 'HP NoteBookXE', '2Years'),
('L04', 'ABC Laptop', '3Years'),
('L05', 'PDP', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `SID` char(5) NOT NULL,
  `SName` varchar(10) DEFAULT NULL,
  `Address` varchar(10) NOT NULL,
  `serial_no` char(5) NOT NULL,
  `Academic_Year` char(4) NOT NULL,
  `Last_Date` date NOT NULL,
  PRIMARY KEY (`SID`),
  KEY `serial_no` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`SID`, `SName`, `Address`, `serial_no`, `Academic_Year`, `Last_Date`) VALUES
('S01', 'Amal', 'Galle', 'L02', '2024', '2025-03-05'),
('S02', 'Namal', 'Thangalle', 'L04', '2024', '2025-03-19'),
('S03', 'HasinduOha', 'UnitedKind', 'L01', '2027', '2029-03-29'),
('S04', 'Sunimal', 'Kamburupit', 'L05', '1999', '2015-03-08'),
('S05', 'Jagath', 'Kandy', 'L04', '2025', '2025-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `student_finance`
--

DROP TABLE IF EXISTS `student_finance`;
CREATE TABLE IF NOT EXISTS `student_finance` (
  `SID` char(5) NOT NULL,
  `FID` char(5) NOT NULL,
  PRIMARY KEY (`SID`,`FID`),
  KEY `FID` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_finance`
--

INSERT INTO `student_finance` (`SID`, `FID`) VALUES
('S01', 'F01'),
('S05', 'F01'),
('S02', 'F02'),
('S04', 'F02'),
('S03', 'F03');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`serial_no`) REFERENCES `laptop` (`serial_no`);

--
-- Constraints for table `student_finance`
--
ALTER TABLE `student_finance`
  ADD CONSTRAINT `student_finance_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  ADD CONSTRAINT `student_finance_ibfk_2` FOREIGN KEY (`FID`) REFERENCES `financial_support` (`FID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
