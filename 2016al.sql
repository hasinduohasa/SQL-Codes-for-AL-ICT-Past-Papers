-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 02, 2025 at 09:15 AM
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
-- Database: `2016al`
--

-- --------------------------------------------------------

--
-- Table structure for table `demonstrator`
--

DROP TABLE IF EXISTS `demonstrator`;
CREATE TABLE IF NOT EXISTS `demonstrator` (
  `DemID` char(5) NOT NULL,
  `DemName` varchar(15) NOT NULL,
  PRIMARY KEY (`DemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `demonstrator`
--

INSERT INTO `demonstrator` (`DemID`, `DemName`) VALUES
('Dem01', 'Ranil'),
('Dem2', 'Basil'),
('Dem3', 'Pradeep'),
('Dem5', 'Amal'),
('Dem6', 'Ruwan');

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
CREATE TABLE IF NOT EXISTS `lecture` (
  `LectureID` char(5) NOT NULL,
  `LectureTopic` varchar(20) NOT NULL,
  `LecID` char(5) DEFAULT NULL,
  PRIMARY KEY (`LectureID`),
  KEY `LecID` (`LecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`LectureID`, `LectureTopic`, `LecID`) VALUES
('LE01', 'Quantum Computing', 'LR01'),
('LE02', 'AstroPhysics ', 'LR02'),
('LE03', 'History', 'LR03'),
('LE04', 'Chemical Engineering', 'LR04'),
('LE05', 'English', 'LR05');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `LecID` char(5) NOT NULL,
  `LecName` varchar(15) NOT NULL,
  PRIMARY KEY (`LecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`LecID`, `LecName`) VALUES
('LR01', 'Sadakalum'),
('LR02', 'Janaka'),
('LR03', 'David'),
('LR04', 'Samadhi '),
('LR05', 'CHANDRIKA');

-- --------------------------------------------------------

--
-- Table structure for table `practical`
--

DROP TABLE IF EXISTS `practical`;
CREATE TABLE IF NOT EXISTS `practical` (
  `PracticalID` char(5) NOT NULL,
  `PracticalName` varchar(15) NOT NULL,
  PRIMARY KEY (`PracticalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `practical`
--

INSERT INTO `practical` (`PracticalID`, `PracticalName`) VALUES
('P01', 'Bomb Deactivati'),
('P02', 'Money Tree '),
('P04', 'Bank Vault Brea'),
('P05', 'Making a Flying');

-- --------------------------------------------------------

--
-- Table structure for table `practical_demonstrator`
--

DROP TABLE IF EXISTS `practical_demonstrator`;
CREATE TABLE IF NOT EXISTS `practical_demonstrator` (
  `PracticalID` char(5) NOT NULL,
  `DemID` char(5) NOT NULL,
  PRIMARY KEY (`PracticalID`,`DemID`),
  KEY `DemID` (`DemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `practical_demonstrator`
--

INSERT INTO `practical_demonstrator` (`PracticalID`, `DemID`) VALUES
('P01', 'Dem01'),
('P05', 'Dem2'),
('P02', 'Dem3'),
('P02', 'Dem5'),
('P04', 'Dem5'),
('P05', 'Dem6');

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

DROP TABLE IF EXISTS `seminar`;
CREATE TABLE IF NOT EXISTS `seminar` (
  `SeminarID` char(5) NOT NULL,
  `SeminarTopic` varchar(15) NOT NULL,
  `LecID` char(5) DEFAULT NULL,
  PRIMARY KEY (`SeminarID`),
  KEY `LecID` (`LecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seminar`
--

INSERT INTO `seminar` (`SeminarID`, `SeminarTopic`, `LecID`) VALUES
('Sem01', 'Apple vs Androi', 'LR01'),
('Sem02', 'Who will be the', 'LR02'),
('Sem03', 'How to get Rich', 'LR03'),
('Sem4', 'A guide to a ha', 'LR05');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `PeriodID` char(5) NOT NULL,
  `PeriodDuration` varchar(20) NOT NULL,
  `LectureID` char(5) NOT NULL,
  `SeminarID` char(5) NOT NULL,
  `PracticalID` char(5) NOT NULL,
  PRIMARY KEY (`PeriodID`),
  KEY `LectureID` (`LectureID`),
  KEY `SeminarID` (`SeminarID`),
  KEY `PracticalID` (`PracticalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`PeriodID`, `PeriodDuration`, `LectureID`, `SeminarID`, `PracticalID`) VALUES
('1', '8.00am to 10am', 'LE01', 'Sem01', 'P01'),
('2', '10.00am to 12.00pm', 'LE02', 'Sem03', 'P04'),
('3', '1.00pm to 3.00pm', 'LE04', 'Sem03', 'P05'),
('4', '3.00pm to 5.00pm', 'LE05', 'Sem4', 'P05');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecture`
--
ALTER TABLE `lecture`
  ADD CONSTRAINT `lecture_ibfk_1` FOREIGN KEY (`LecID`) REFERENCES `lecturer` (`LecID`);

--
-- Constraints for table `practical_demonstrator`
--
ALTER TABLE `practical_demonstrator`
  ADD CONSTRAINT `practical_demonstrator_ibfk_1` FOREIGN KEY (`PracticalID`) REFERENCES `practical` (`PracticalID`),
  ADD CONSTRAINT `practical_demonstrator_ibfk_2` FOREIGN KEY (`DemID`) REFERENCES `demonstrator` (`DemID`);

--
-- Constraints for table `seminar`
--
ALTER TABLE `seminar`
  ADD CONSTRAINT `seminar_ibfk_1` FOREIGN KEY (`LecID`) REFERENCES `lecturer` (`LecID`);

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`LectureID`) REFERENCES `lecture` (`LectureID`),
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`SeminarID`) REFERENCES `seminar` (`SeminarID`),
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`PracticalID`) REFERENCES `practical` (`PracticalID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
