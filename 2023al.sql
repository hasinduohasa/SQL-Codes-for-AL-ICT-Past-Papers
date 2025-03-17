-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 17, 2025 at 06:01 PM
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
-- Database: `2023al`
--

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `Division_name` varchar(10) NOT NULL,
  `Task_Number` char(5) DEFAULT NULL,
  PRIMARY KEY (`Division_name`),
  KEY `Task_Number` (`Task_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`Division_name`, `Task_Number`) VALUES
('HR', '223'),
('Sales', '245'),
('Marketing', '255'),
('Head Offic', '260');

-- --------------------------------------------------------

--
-- Table structure for table `division_location`
--

DROP TABLE IF EXISTS `division_location`;
CREATE TABLE IF NOT EXISTS `division_location` (
  `Division_name` varchar(10) NOT NULL,
  `Location` varchar(10) NOT NULL,
  PRIMARY KEY (`Division_name`,`Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `division_location`
--

INSERT INTO `division_location` (`Division_name`, `Location`) VALUES
('Head Offic', 'Colombo'),
('HR', 'Kandy'),
('HR', 'Matara'),
('Marketing', 'Jaffna'),
('Sales', 'London'),
('Sales', 'United Sta');

-- --------------------------------------------------------

--
-- Table structure for table `manages`
--

DROP TABLE IF EXISTS `manages`;
CREATE TABLE IF NOT EXISTS `manages` (
  `NIC_number` int NOT NULL,
  `Division_name` varchar(10) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  PRIMARY KEY (`NIC_number`,`Division_name`),
  KEY `Division_name` (`Division_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `manages`
--

INSERT INTO `manages` (`NIC_number`, `Division_name`, `Start_Date`) VALUES
(8776543, 'Sales', NULL),
(23449876, 'Head Offic', '2025-03-05'),
(76554326, 'HR', '2025-03-12'),
(200610063, 'Marketing', '2025-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
CREATE TABLE IF NOT EXISTS `officer` (
  `NIC_number` int NOT NULL,
  `First_name` varchar(10) NOT NULL,
  `Surname` varchar(10) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Phone_number` int NOT NULL,
  `Division_name` varchar(10) NOT NULL,
  PRIMARY KEY (`NIC_number`),
  KEY `Division_name` (`Division_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`NIC_number`, `First_name`, `Surname`, `Address`, `Phone_number`, `Division_name`) VALUES
(7544325, 'Sunimal', 'Bandara', 'Tangalle', 77665544, 'Sales'),
(8776543, 'Namal', 'Rajapaksha', 'Tangalle', 114516434, 'Marketing'),
(23449876, 'Sunil', 'Perera', 'Galle', 77337746, 'Head Offic'),
(76554326, 'Kumara', 'Lokugee', 'Matara', 71223345, 'HR'),
(200610063, 'Amal', 'Kumara', 'Matara', 771212345, 'Head Offic');

-- --------------------------------------------------------

--
-- Table structure for table `officer_task`
--

DROP TABLE IF EXISTS `officer_task`;
CREATE TABLE IF NOT EXISTS `officer_task` (
  `NIC_number` int NOT NULL,
  `Task_number` char(5) NOT NULL,
  KEY `NIC_number` (`NIC_number`),
  KEY `Task_number` (`Task_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `officer_task`
--

INSERT INTO `officer_task` (`NIC_number`, `Task_number`) VALUES
(23449876, '223'),
(76554326, '255'),
(200610063, '255'),
(7544325, '260'),
(8776543, '245'),
(200610063, '245');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `Task_number` char(5) NOT NULL,
  `Task_name` varchar(20) NOT NULL,
  PRIMARY KEY (`Task_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`Task_number`, `Task_name`) VALUES
('223', 'Clean Sri Lanka'),
('245', 'Sales Analytics '),
('255', 'Research '),
('260', 'Summer Vacation');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `division`
--
ALTER TABLE `division`
  ADD CONSTRAINT `division_ibfk_1` FOREIGN KEY (`Task_Number`) REFERENCES `task` (`Task_number`);

--
-- Constraints for table `division_location`
--
ALTER TABLE `division_location`
  ADD CONSTRAINT `division_location_ibfk_1` FOREIGN KEY (`Division_name`) REFERENCES `division` (`Division_name`);

--
-- Constraints for table `manages`
--
ALTER TABLE `manages`
  ADD CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`NIC_number`) REFERENCES `officer` (`NIC_number`),
  ADD CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`Division_name`) REFERENCES `division` (`Division_name`);

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `officer_ibfk_1` FOREIGN KEY (`Division_name`) REFERENCES `division` (`Division_name`);

--
-- Constraints for table `officer_task`
--
ALTER TABLE `officer_task`
  ADD CONSTRAINT `officer_task_ibfk_1` FOREIGN KEY (`NIC_number`) REFERENCES `officer` (`NIC_number`),
  ADD CONSTRAINT `officer_task_ibfk_2` FOREIGN KEY (`Task_number`) REFERENCES `task` (`Task_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
