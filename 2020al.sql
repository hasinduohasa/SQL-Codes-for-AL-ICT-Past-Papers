-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 14, 2025 at 01:11 PM
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
-- Database: `2020al`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `Code` int NOT NULL,
  `Description` varchar(20) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`Code`, `Description`) VALUES
(119, 'HighJump'),
(213, 'Elle'),
(321, 'Chess'),
(432, 'Cricket'),
(765, 'Football');

-- --------------------------------------------------------

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
CREATE TABLE IF NOT EXISTS `play` (
  `NIC` int NOT NULL,
  `Code` int NOT NULL,
  `Hours` int NOT NULL,
  PRIMARY KEY (`NIC`,`Code`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `play`
--

INSERT INTO `play` (`NIC`, `Code`, `Hours`) VALUES
(234678, 321, 2),
(345567, 119, 1),
(1234567, 765, 5),
(3467889, 213, 4),
(99999999, 213, 11);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `NIC` int NOT NULL,
  `Surname` varchar(10) NOT NULL,
  `Initials` varchar(10) NOT NULL,
  `Title` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`NIC`),
  KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`NIC`, `Surname`, `Initials`, `Title`) VALUES
(234678, 'Amadi', 'J.W.', 'Elon Musk'),
(345567, 'Nimali', 'W.S.', 'Sanath Jay'),
(1234567, 'Gajath', 'M.K.', 'Dhammika P'),
(3467889, 'Amara', 'A.K.D', 'Gotabaya R'),
(4563224, 'Ranil', 'W.', NULL),
(99999999, 'Sumane', 'R.P.G.', 'Kumar Sang');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
CREATE TABLE IF NOT EXISTS `sponsor` (
  `Title` varchar(10) NOT NULL,
  `Address` varchar(10) NOT NULL,
  PRIMARY KEY (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`Title`, `Address`) VALUES
('Dhammika P', 'Colombo'),
('Elon Musk', 'UnitedKind'),
('Gotabaya R', 'Jaffna'),
('Kumar Sang', 'Matara'),
('Sanath Jay', 'Galle');

-- --------------------------------------------------------

--
-- Table structure for table `sportsclub`
--

DROP TABLE IF EXISTS `sportsclub`;
CREATE TABLE IF NOT EXISTS `sportsclub` (
  `Name` varchar(10) NOT NULL,
  `Points` int NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sportsclub`
--

INSERT INTO `sportsclub` (`Name`, `Points`) VALUES
('Gajaba', 2),
('Gamunu', 200),
('Parakum', 198),
('Vijaya', 370);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `play`
--
ALTER TABLE `play`
  ADD CONSTRAINT `play_ibfk_1` FOREIGN KEY (`NIC`) REFERENCES `player` (`NIC`),
  ADD CONSTRAINT `play_ibfk_2` FOREIGN KEY (`Code`) REFERENCES `game` (`Code`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`Title`) REFERENCES `sponsor` (`Title`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
