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
-- Database: `2014al`
--

-- --------------------------------------------------------

--
-- Table structure for table `courseunit`
--

DROP TABLE IF EXISTS `courseunit`;
CREATE TABLE IF NOT EXISTS `courseunit` (
  `CourseID` char(5) NOT NULL,
  `CourseName` varchar(20) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `degreeprogram`
--

DROP TABLE IF EXISTS `degreeprogram`;
CREATE TABLE IF NOT EXISTS `degreeprogram` (
  `DegreeID` char(5) NOT NULL,
  `ProgramFee` decimal(8,2) NOT NULL,
  `DegreeName` varchar(20) NOT NULL,
  `FacultyID` char(5) DEFAULT NULL,
  PRIMARY KEY (`DegreeID`),
  KEY `FacultyID` (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `degreeprogram_courseunit`
--

DROP TABLE IF EXISTS `degreeprogram_courseunit`;
CREATE TABLE IF NOT EXISTS `degreeprogram_courseunit` (
  `DegreeID` char(5) NOT NULL,
  `CourseID` char(5) NOT NULL,
  `Type` char(10) NOT NULL,
  PRIMARY KEY (`DegreeID`,`CourseID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `FacultyID` char(5) NOT NULL,
  `FacultyName` varchar(20) NOT NULL,
  PRIMARY KEY (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `FacultyName`) VALUES
('F001', 'Management'),
('F002', 'Biology'),
('F003', 'Computer Science'),
('F004', 'Engineering'),
('F005', 'Art');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `LecturerID` char(5) NOT NULL,
  `LecturerName` varchar(20) NOT NULL,
  PRIMARY KEY (`LecturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_courseunit`
--

DROP TABLE IF EXISTS `lecturer_courseunit`;
CREATE TABLE IF NOT EXISTS `lecturer_courseunit` (
  `LecturerID` char(5) NOT NULL,
  `CourseID` char(5) NOT NULL,
  `AssignedHours` int NOT NULL,
  PRIMARY KEY (`LecturerID`,`CourseID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` char(5) NOT NULL,
  `StudnetName` varchar(10) NOT NULL,
  `DegreeID` char(5) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `DegreeID` (`DegreeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `degreeprogram`
--
ALTER TABLE `degreeprogram`
  ADD CONSTRAINT `degreeprogram_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`);

--
-- Constraints for table `degreeprogram_courseunit`
--
ALTER TABLE `degreeprogram_courseunit`
  ADD CONSTRAINT `degreeprogram_courseunit_ibfk_1` FOREIGN KEY (`DegreeID`) REFERENCES `degreeprogram` (`DegreeID`),
  ADD CONSTRAINT `degreeprogram_courseunit_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courseunit` (`CourseID`);

--
-- Constraints for table `lecturer_courseunit`
--
ALTER TABLE `lecturer_courseunit`
  ADD CONSTRAINT `lecturer_courseunit_ibfk_1` FOREIGN KEY (`LecturerID`) REFERENCES `lecturer` (`LecturerID`),
  ADD CONSTRAINT `lecturer_courseunit_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courseunit` (`CourseID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`DegreeID`) REFERENCES `degreeprogram` (`DegreeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
