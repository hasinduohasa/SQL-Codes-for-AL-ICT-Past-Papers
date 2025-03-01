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
-- Database: `2012al`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `ClassID` char(3) NOT NULL,
  `ClassName` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `ClassName`) VALUES
('C01', 'Grade 10'),
('C02', 'Grade 11'),
('C03', 'A/L Commer');

-- --------------------------------------------------------

--
-- Table structure for table `desk`
--

DROP TABLE IF EXISTS `desk`;
CREATE TABLE IF NOT EXISTS `desk` (
  `DeskID` char(3) NOT NULL,
  `DeskRow` char(3) NOT NULL,
  `DeskMadeOf` varchar(10) NOT NULL,
  PRIMARY KEY (`DeskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `desk`
--

INSERT INTO `desk` (`DeskID`, `DeskRow`, `DeskMadeOf`) VALUES
('D01', 'A1', 'Teak Wood'),
('D02', 'A2', 'Mahogany'),
('D03', 'B1', 'Plastic');

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
CREATE TABLE IF NOT EXISTS `house` (
  `HouseID` char(3) NOT NULL,
  `HouseName` varchar(10) NOT NULL,
  PRIMARY KEY (`HouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`HouseID`, `HouseName`) VALUES
('H01', 'Gemunu'),
('H02', 'Parakrama'),
('H03', 'Vijaya');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE IF NOT EXISTS `marks` (
  `StudentID` char(5) NOT NULL,
  `SubjectID` char(3) NOT NULL,
  `Marks` char(3) NOT NULL,
  PRIMARY KEY (`StudentID`,`SubjectID`),
  KEY `SubjectID` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`StudentID`, `SubjectID`, `Marks`) VALUES
('S001', 'SB1', '78'),
('S001', 'SB2', '72'),
('S001', 'SB3', '85'),
('S002', 'SB1', '88'),
('S002', 'SB4', '79'),
('S003', 'SB2', '74'),
('S003', 'SB3', '81'),
('S003', 'SB5', '92');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` char(5) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `ClassID` char(3) DEFAULT NULL,
  `DeskID` char(3) DEFAULT NULL,
  `HouseID` char(3) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `ClassID` (`ClassID`),
  KEY `DeskID` (`DeskID`),
  KEY `HouseID` (`HouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `Name`, `NIC`, `ClassID`, `DeskID`, `HouseID`) VALUES
('S001', 'Kasun Pere', '200145678V', 'C01', 'D01', 'H01'),
('S002', 'Nethmi Fer', '200267891V', 'C02', 'D02', 'H02'),
('S003', 'Sajith Jay', '199956123V', 'C03', 'D03', 'H03');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `SubjectID` char(3) NOT NULL,
  `Title` varchar(15) NOT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SubjectID`, `Title`) VALUES
('SB1', 'Mathematics'),
('SB2', 'Science'),
('SB3', 'Sinhala Languag'),
('SB4', 'History'),
('SB5', 'Commerce');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`DeskID`) REFERENCES `desk` (`DeskID`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`HouseID`) REFERENCES `house` (`HouseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
