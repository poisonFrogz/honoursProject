-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2023 at 02:43 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `honours`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` varchar(8) NOT NULL,
  `customerID` int(11) NOT NULL,
  `flightNumber` varchar(10) NOT NULL,
  `bookingDate` date NOT NULL,
  `bookingTime` time NOT NULL,
  `adults` int(11) NOT NULL DEFAULT 2,
  `children` int(11) NOT NULL DEFAULT 0,
  `infants` int(11) NOT NULL DEFAULT 0,
  `checkedIn` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `customerID`, `flightNumber`, `bookingDate`, `bookingTime`, `adults`, `children`, `infants`, `checkedIn`) VALUES
('TFS011', 27, 'BA1479', '2023-03-27', '11:30:00', 1, 0, 0, 'No'),
('TFS012', 28, 'BA1479', '2023-03-13', '19:20:00', 1, 0, 0, 'No'),
('TFS013', 29, 'BA1479', '2023-03-24', '19:40:00', 1, 0, 0, 'No'),
('TFS014', 30, 'BA1479', '2023-03-30', '14:20:00', 1, 0, 0, 'No'),
('TFS015', 31, 'BA1479', '2023-03-24', '12:20:00', 1, 0, 0, 'No'),
('TFS016', 32, 'BA1479', '2023-07-28', '19:20:00', 1, 0, 0, 'No'),
('TFS017', 33, 'BA1479', '2023-08-28', '11:20:00', 1, 0, 0, 'No'),
('TFS018', 35, 'BA1479', '2023-08-28', '11:50:00', 1, 0, 0, 'No'),
('TFS019', 36, 'BA1479', '2023-03-31', '11:00:00', 1, 0, 0, 'No'),
('TFS020', 37, 'BA1479', '2023-03-31', '11:00:00', 1, 0, 0, 'No'),
('TFS021', 38, 'BA1479', '2023-03-31', '11:00:00', 1, 0, 0, 'No'),
('TFS022', 39, 'BA1479', '2023-03-31', '11:00:00', 1, 0, 0, 'No'),
('TFS023', 40, 'BA1479', '2023-03-19', '11:00:00', 2, 0, 0, 'No'),
('TFS024', 41, 'BA1479', '2023-03-19', '11:00:00', 1, 0, 0, 'No'),
('TFS025', 42, 'BA1479', '2023-03-19', '11:00:00', 1, 0, 0, 'No'),
('TFS026', 43, 'BA1479', '2023-03-19', '11:00:00', 1, 0, 0, 'No'),
('TFS027', 44, 'BA1479', '2023-08-28', '11:00:00', 1, 0, 0, 'No'),
('TFS028', 45, 'BA1479', '2023-03-31', '11:00:00', 1, 0, 0, 'No');

--
-- Triggers `booking`
--
DELIMITER $$
CREATE TRIGGER `tg_booking_insert` BEFORE INSERT ON `booking` FOR EACH ROW BEGIN
	INSERT INTO booking_seq VALUES (NULL);
    SET NEW.bookingID = CONCAT('TFS', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `booking_seq`
--

CREATE TABLE `booking_seq` (
  `bookingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_seq`
--

INSERT INTO `booking_seq` (`bookingID`) VALUES
(1),
(4),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `title` enum('Mr','Miss','Mrs','Ms','Mx','Dr','Prof') DEFAULT NULL,
  `forename` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `title`, `forename`, `surname`, `email`) VALUES
(12, 'Mr', 'Iain', 'Hendry', 'IH@gmail.com'),
(13, 'Mr', 'charlie', 'shaw', 'CS@gmail.com'),
(14, 'Ms', 'Karen', 'Bloggs', 'KBL@gmail.com'),
(15, 'Dr', 'Henry', 'Hunter', 'HH@gmail.com'),
(16, 'Mr', 'Charles', 'Shaw', 'CH@gmail.com'),
(17, 'Mr', 'Derek', 'Gentle', 'DG@gmail.com'),
(18, 'Mr', 'Geneva', 'Smith', 'GS@gmail.com'),
(19, 'Mr', 'Dean', 'Smith', 'DS@gmail.com'),
(20, 'Mr', 'Charlie', 'Shaw', 'charlie@thepiper.scot'),
(21, 'Mr', 'John', 'Smith', 'JS@gmail.com'),
(22, 'Mr', 'Dean', 'Domino', 'DD@gmail.com'),
(23, 'Mr', 'Phillip', 'Franco', 'PH@gmail.com'),
(24, 'Mr', 'Charles', 'Shaw', 'charlie@thepiper.scot'),
(25, 'Mr', 'Ryn', 'Gamble', 'RG@gmail.com'),
(26, 'Mr', 'Charlie', 'Shaw', 'CS@gmail.com'),
(27, 'Mr', 'Gene', 'Wilder', 'GW@gmail.com'),
(28, 'Mr', 'Imnot', 'Goodanames', 'IG@gmail.com'),
(29, 'Mr', 'Bean', 'Baz', 'BB@gmail.com'),
(30, 'Mr', 'Barry', 'Bean', 'BG@gmail.com'),
(31, 'Mr', 'Charles', 'Shaw', 'CS@gmail.com'),
(32, 'Mr', 'CHARLES', 'SHAW', 'charlie@thepiper.scot'),
(33, 'Mr', 'CHARLES', 'SHAW', 'charlie@thepiper.scot'),
(35, 'Mr', 'Charlie', 'Shaw', 'cs@gmail.com'),
(36, 'Mr', 'c', 's', 'cs@gmail.com'),
(37, 'Mr', 'c', 's', 'cs@gmail.com'),
(38, 'Mr', 'c', 's', 'cs@gmail.com'),
(39, 'Mr', 'c', 's', 'cs@gmail.com'),
(40, 'Mr', 'c', 's', 'cs@gmail.com'),
(41, 'Mr', 'Charlie', 'Shaw', 'cs@gmail.com'),
(42, 'Mr', 'Charlie', 'Shaw', 'cs@gmail.com'),
(43, 'Mr', 'Charlie', 'Shaw', 'cs@gmail.com'),
(44, 'Mr', 'c', 's', 'cs@gmail.com'),
(45, 'Mr', 'c', 's', 'cs@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flightinfo`
--

CREATE TABLE `flightinfo` (
  `flightNumber` varchar(10) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `departure` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flightinfo`
--

INSERT INTO `flightinfo` (`flightNumber`, `destination`, `departure`) VALUES
('BA1479', 'London Heathrow', '10:00:00'),
('BA1487', 'London Heathrow', '12:40:00'),
('BA1489', 'London Heathrow', '16:00:00'),
('BA1493', 'London Heathrow', '17:25:00'),
('BA1495', 'London Heathrow', '18:45:00'),
('BA1499', 'London Heathrow', '11:40:00'),
('EI3221', 'Dublin', '08:20:00'),
('EI3225', 'Dublin', '11:55:00'),
('EI3623', 'Belfast City', '11:25:00'),
('EI3629', 'Belfast City', '18:30:00'),
('EK28', 'Dubai', '13:20:00'),
('EZY404', 'Bristol', '21:15:00'),
('EZY468', 'Belfast Intl', '19:50:00'),
('EZY511', 'Birmingham', '09:50:00'),
('EZY6815A', 'Jersey', '11:50:00'),
('EZY6823', 'Geneva', '10:45:00'),
('EZY6825', 'Geneva', '16:45:00'),
('EZY6843', 'Faro', '16:05:00'),
('EZY6867', 'Agadir', '14:40:00'),
('EZY6877', 'Alicante', '12:25:00'),
('EZY6893', 'Tenerife', '12:40:00'),
('EZY886', 'London Gatwick', '14:00:00'),
('FI431', 'Reykjavik', '12:35:00'),
('FR2522', 'Alicante', '18:40:00'),
('FR2609', 'Malaga', '09:00:00'),
('FR5105', 'Dublin', '15:25:00'),
('FR5150', 'Dublin', '10:25:00'),
('FR5154', 'Dublin', '22:45:00'),
('FR5564', 'Dublin', '08:00:00'),
('KL1474', 'Amsterdam', '10:40:00'),
('KL1478', 'Amsterdam', '17:25:00'),
('LH961', 'Frankfurt', '12:25:00'),
('LM407', 'Benbecula', '10:00:00'),
('LM421', 'Islay', '08:00:00'),
('LM432', 'Kirkwall', '08:30:00'),
('LM437', 'Sumburgh', '10:40:00'),
('LM451', 'Barra', '12:25:00'),
('LM453', 'Tiree', '10:30:00'),
('LM455', 'Barra', '13:20:00'),
('LM474', 'Stornoway', '12:05:00'),
('LM491', 'Southampton', '10:30:00'),
('LS109', 'Antalya', '14:40:00'),
('LS125', 'Tenerife', '14:10:00'),
('LS137', 'Fuerteventura', '09:30:00'),
('LS143', 'Gran Canaria', '10:15:00'),
('LS155', 'Tenerife', '08:45:00'),
('LS167', 'Lanzarote', '09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `uID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`uID`, `username`, `pwd`) VALUES
(1, 'root', '*668425423DB5193AF921380129F465A6425216D0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `flightNumber` (`flightNumber`);

--
-- Indexes for table `booking_seq`
--
ALTER TABLE `booking_seq`
  ADD PRIMARY KEY (`bookingID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `flightinfo`
--
ALTER TABLE `flightinfo`
  ADD PRIMARY KEY (`flightNumber`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`uID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_seq`
--
ALTER TABLE `booking_seq`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `uID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`flightNumber`) REFERENCES `flightinfo` (`flightNumber`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
