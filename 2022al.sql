-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 17, 2025 at 04:05 PM
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
-- Database: `2022al`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentId` char(5) NOT NULL,
  `studentFname` varchar(10) NOT NULL,
  `studnetLname` varchar(10) NOT NULL,
  `Age` int NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentFname`, `studnetLname`, `Age`) VALUES
('201', 'Namal', 'Kumara', 12),
('202', 'Sadun', 'Priyankara', 17),
('203', 'Dimuthu', 'Wedage', 16),
('204', 'Chamuditha', 'Disanayaka', 12);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subjectNumber` char(5) NOT NULL,
  `subjectName` varchar(10) NOT NULL,
  `Prerequiste_Subject` char(5) NOT NULL,
  PRIMARY KEY (`subjectNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectNumber`, `subjectName`, `Prerequiste_Subject`) VALUES
('300', 'English', '301'),
('301', 'Mathematic', '302'),
('302', 'Physics', '300'),
('303', 'ICT', '300'),
('304', 'Biology', '301');

-- --------------------------------------------------------

--
-- Table structure for table `subject_offering`
--

DROP TABLE IF EXISTS `subject_offering`;
CREATE TABLE IF NOT EXISTS `subject_offering` (
  `studentId` char(5) NOT NULL,
  `subjectNumber` char(5) NOT NULL,
  `teacherId` char(5) NOT NULL,
  `year` int NOT NULL,
  `semester` int NOT NULL,
  `classroom` char(5) NOT NULL,
  PRIMARY KEY (`studentId`,`subjectNumber`,`teacherId`),
  KEY `subjectNumber` (`subjectNumber`),
  KEY `teacherId` (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subject_offering`
--

INSERT INTO `subject_offering` (`studentId`, `subjectNumber`, `teacherId`, `year`, `semester`, `classroom`) VALUES
('201', '300', '101', 2023, 3, 'B1'),
('201', '302', '100', 2023, 1, 'A2'),
('201', '303', '101', 2023, 3, 'A1'),
('201', '304', '103', 2024, 1, 'B1'),
('202', '301', '103', 2025, 1, 'A1'),
('202', '304', '103', 2022, 1, 'A2'),
('203', '302', '101', 2022, 1, 'A1'),
('203', '304', '101', 2024, 1, 'A1'),
('204', '302', '100', 2022, 1, 'A1'),
('204', '303', '101', 2022, 2, 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherId` char(5) NOT NULL,
  `teacherName` varchar(10) NOT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherId`, `teacherName`) VALUES
('100', 'Amal '),
('101', 'Kamal'),
('103', 'Sunil');

-- --------------------------------------------------------

--
-- Table structure for table `teacherqualification`
--

DROP TABLE IF EXISTS `teacherqualification`;
CREATE TABLE IF NOT EXISTS `teacherqualification` (
  `teacherId` char(5) NOT NULL,
  `Qualification` varchar(10) NOT NULL,
  PRIMARY KEY (`teacherId`,`Qualification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teacherqualification`
--

INSERT INTO `teacherqualification` (`teacherId`, `Qualification`) VALUES
('100', 'MSC'),
('100', 'PHD'),
('101', 'BA'),
('101', 'MSc'),
('103', 'BIT'),
('103', 'MIT');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subject_offering`
--
ALTER TABLE `subject_offering`
  ADD CONSTRAINT `subject_offering_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`),
  ADD CONSTRAINT `subject_offering_ibfk_2` FOREIGN KEY (`subjectNumber`) REFERENCES `subject` (`subjectNumber`),
  ADD CONSTRAINT `subject_offering_ibfk_3` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`teacherId`);

--
-- Constraints for table `teacherqualification`
--
ALTER TABLE `teacherqualification`
  ADD CONSTRAINT `teacherqualification_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`teacherId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
