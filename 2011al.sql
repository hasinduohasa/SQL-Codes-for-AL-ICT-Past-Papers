-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 01, 2025 at 10:40 AM
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
-- Database: `2011al`
--

-- --------------------------------------------------------

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
CREATE TABLE IF NOT EXISTS `play` (
  `IndexNo` char(5) NOT NULL,
  `SportId` varchar(10) NOT NULL,
  PRIMARY KEY (`IndexNo`,`SportId`),
  KEY `SportId` (`SportId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `play`
--

INSERT INTO `play` (`IndexNo`, `SportId`) VALUES
('S1', 'G2'),
('S1', 'G3'),
('S2', 'G1'),
('S2', 'G2'),
('S3', 'G1'),
('S3', 'G2'),
('S3', 'G3'),
('S4', 'G2'),
('S4', 'G3'),
('S4', 'G4');

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `SportId` varchar(10) NOT NULL,
  `SportName` varchar(15) NOT NULL,
  PRIMARY KEY (`SportId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`SportId`, `SportName`) VALUES
('G1', 'Cricket'),
('G2', 'Elle'),
('G3', 'Football'),
('G4', 'DoingBadThings');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `IndexNo` char(5) NOT NULL,
  `Student_Name` varchar(10) NOT NULL,
  `Home_Address` varchar(50) NOT NULL,
  `Class` varchar(6) NOT NULL,
  PRIMARY KEY (`IndexNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`IndexNo`, `Student_Name`, `Home_Address`, `Class`) VALUES
('S1', 'Amal', 'Galle', 'Maths'),
('S2', 'Kmal', 'tangalle', 'Bio'),
('S3', 'Nimal', 'Matara', 'Tech'),
('S4', 'Bimal', 'Colombo', 'Art'),
('S5', 'Namal', 'Hambanthota', 'Tec');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
