-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2025 at 09:15 AM
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
-- Database: `2019al`
--

-- --------------------------------------------------------

--
-- Table structure for table `customor`
--

DROP TABLE IF EXISTS `customor`;
CREATE TABLE IF NOT EXISTS `customor` (
  `Customor_NIC` char(10) NOT NULL,
  `Customor_Name` varchar(20) NOT NULL,
  `City` char(10) NOT NULL,
  PRIMARY KEY (`Customor_NIC`),
  KEY `City` (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customor`
--

INSERT INTO `customor` (`Customor_NIC`, `Customor_Name`, `City`) VALUES
('1968102233', 'Sarath Gunapala', 'Kandy'),
('1988050511', 'Okitha Nimsara', 'Galle'),
('1998061120', 'Ajith Serasingha', 'Matara'),
('2006124001', 'Madahasa Ranthilina', 'Jaffna'),
('20090613', 'Loochana Jayakodi', 'Colombo'),
('201508776', 'Mahinda Rajapaksha', 'Kandy');

-- --------------------------------------------------------

--
-- Table structure for table `customor_city`
--

DROP TABLE IF EXISTS `customor_city`;
CREATE TABLE IF NOT EXISTS `customor_city` (
  `City` char(10) NOT NULL,
  `Postal_Code` varchar(15) NOT NULL,
  PRIMARY KEY (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customor_city`
--

INSERT INTO `customor_city` (`City`, `Postal_Code`) VALUES
('Colombo', '11290'),
('Galle', '21890'),
('Jaffna', '1990'),
('Kandy', '50180'),
('Matara', '81000');

-- --------------------------------------------------------

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
CREATE TABLE IF NOT EXISTS `rents` (
  `Customor_NIC` char(10) NOT NULL,
  `Vehical_Reg_No` varchar(10) NOT NULL,
  `Rent_Date` date NOT NULL,
  PRIMARY KEY (`Customor_NIC`,`Vehical_Reg_No`),
  KEY `Vehical_Reg_No` (`Vehical_Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rents`
--

INSERT INTO `rents` (`Customor_NIC`, `Vehical_Reg_No`, `Rent_Date`) VALUES
('1968102233', '2267397542', '2025-03-05'),
('1968102233', '6382578523', '2025-03-02'),
('1988050511', '6382578523', '2025-03-24'),
('1988050511', 'q527365498', '2025-03-31'),
('2006124001', '2638206543', '0000-00-00'),
('20090613', '2344567098', '2025-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `vehical`
--

DROP TABLE IF EXISTS `vehical`;
CREATE TABLE IF NOT EXISTS `vehical` (
  `Vehical_Reg_No` varchar(10) NOT NULL,
  `Description` varchar(20) NOT NULL,
  `Owner_Id` char(5) NOT NULL,
  PRIMARY KEY (`Vehical_Reg_No`),
  KEY `Owner_Id` (`Owner_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehical`
--

INSERT INTO `vehical` (`Vehical_Reg_No`, `Description`, `Owner_Id`) VALUES
('2267397542', 'Apollo 11', '1334'),
('2344567098', ' A Helicopter :)', '2213'),
('2638206543', 'Rolls Royce Phantom ', '6721'),
('6254378296', 'Dio Scooter with  a ', '6721'),
('6382578523', 'Nissan GTR', '3310'),
('6739287546', 'Land Rover Defender', '1334'),
('q527365498', 'Porsche 911', '3310');

-- --------------------------------------------------------

--
-- Table structure for table `vehical_owner`
--

DROP TABLE IF EXISTS `vehical_owner`;
CREATE TABLE IF NOT EXISTS `vehical_owner` (
  `Owner_Id` char(5) NOT NULL,
  `Owner_Name` varchar(15) NOT NULL,
  `Contact_No` int NOT NULL,
  PRIMARY KEY (`Owner_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehical_owner`
--

INSERT INTO `vehical_owner` (`Owner_Id`, `Owner_Name`, `Contact_No`) VALUES
('1334', 'Donald J. Trump', 119),
('2213', 'Bill Gates', 634667782),
('2250', 'Tom Cruise', 711234567),
('3310', 'Peter Paker', 711212372),
('6721', 'Mr.Bean', 214516434);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customor`
--
ALTER TABLE `customor`
  ADD CONSTRAINT `customor_ibfk_1` FOREIGN KEY (`City`) REFERENCES `customor_city` (`City`);

--
-- Constraints for table `rents`
--
ALTER TABLE `rents`
  ADD CONSTRAINT `rents_ibfk_1` FOREIGN KEY (`Customor_NIC`) REFERENCES `customor` (`Customor_NIC`),
  ADD CONSTRAINT `rents_ibfk_2` FOREIGN KEY (`Vehical_Reg_No`) REFERENCES `vehical` (`Vehical_Reg_No`);

--
-- Constraints for table `vehical`
--
ALTER TABLE `vehical`
  ADD CONSTRAINT `vehical_ibfk_1` FOREIGN KEY (`Owner_Id`) REFERENCES `vehical_owner` (`Owner_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
