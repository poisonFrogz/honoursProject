-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2023 at 12:49 AM
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
('TFS029', 46, 'FR5150', '2023-03-01', '09:00:00', 1, 0, 0, 'No'),
('TFS030', 47, 'LS137', '2023-03-02', '07:30:00', 3, 2, 0, 'No'),
('TFS031', 48, 'LM451', '2023-03-03', '11:00:00', 2, 0, 0, 'No'),
('TFS032', 49, 'BA1489', '2023-03-04', '13:00:00', 3, 0, 0, 'No'),
('TFS033', 50, 'EZY6825', '2023-03-05', '12:00:00', 2, 0, 0, 'Yes'),
('TFS034', 51, 'EI3629', '2023-03-06', '15:00:00', 1, 1, 1, 'No'),
('TFS035', 52, 'EZY468', '2023-03-06', '16:50:00', 1, 0, 0, 'No'),
('TFS036', 53, 'FR2522', '2023-03-07', '16:20:00', 2, 1, 1, 'No'),
('TFS037', 54, 'LM421', '2023-03-30', '06:00:00', 1, 0, 0, 'No'),
('TFS038', 55, 'LM421', '2023-03-30', '06:00:00', 1, 0, 0, 'No'),
('TFS039', 56, 'LM421', '2023-03-30', '06:00:00', 1, 0, 0, 'No'),
('TFS040', 57, 'FR5564', '2023-03-30', '06:15:00', 1, 0, 0, 'No'),
('TFS041', 58, 'EI3221', '2023-03-30', '06:15:00', 1, 0, 0, 'No'),
('TFS042', 59, 'LS155', '2023-03-30', '06:30:00', 1, 0, 0, 'No'),
('TFS043', 60, 'FR2609', '2020-03-30', '07:00:00', 1, 0, 0, 'No'),
('TFS044', 61, 'LS143', '2023-03-30', '08:00:00', 1, 0, 0, 'No'),
('TFS045', 62, 'BA1499', '2023-03-30', '09:01:00', 2, 2, 0, 'No'),
('TFS046', 66, 'BA1479', '2023-08-28', '11:00:00', 1, 0, 0, 'No'),
('TFS047', 66, 'BA1479', '2023-08-28', '11:00:00', 1, 0, 0, 'No'),
('TFS048', 67, 'BA1479', '2023-08-28', '11:00:00', 1, 0, 0, 'No'),
('TFS049', 68, 'LM421', '2023-03-28', '11:00:00', 1, 0, 0, 'No'),
('TFS050', 68, 'LM421', '2023-03-28', '11:00:00', 1, 0, 0, 'No'),
('TFS052', 69, 'LM421', '2023-08-28', '11:00:00', 1, 0, 0, 'No'),
('TFS053', 70, 'BA1479', '2023-08-28', '11:00:00', 1, 0, 0, 'No');

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
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53);

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
(46, 'Mr', 'Charlie', 'Shaw', 'charlie@gmail.com'),
(47, 'Dr', 'Harold', 'Fig', 'FigHarold@gmail.com'),
(48, 'Prof', 'John', 'Sharp', 'johnsharp24@outlook.com'),
(49, 'Miss', 'Katie', 'Shaw', 'katieShaw@gmail.com'),
(50, 'Mx', 'Ash', 'Smithson', 'ash2000@gmail.com'),
(51, 'Ms', 'Elizabeth', 'Hendry', 'lizzyH12@gmail.com'),
(52, 'Miss', 'Emilia', 'Jones', 'milly2345@gmail.com'),
(53, 'Mr', 'John', 'Shaw', 'jShaw@gmail.com'),
(54, 'Mr', 'Derek', 'Hall', 'DH@gmail.com'),
(55, 'Mr', 'John', 'Jones', 'JJ@gmail.com'),
(56, 'Mrs', 'Dalia', 'Privy', 'Dalia3040@gmail.com'),
(57, 'Miss', 'Liz', 'Lockhart', 'LH@gmail.com'),
(58, 'Mx', 'Robyn', 'Coal', 'rynC@gmail.com'),
(59, 'Prof', 'Harley', 'Heart', 'HeartHarly@gmail.com'),
(60, 'Mr', 'Jim', 'Dole', 'JD@gmail.com'),
(61, 'Mr', 'Jim', 'Jones', 'JJ@gmail.com'),
(62, 'Mr', 'Frank', 'Furter', 'FF@gmail.com'),
(63, 'Mr', 'John', 'Smith', 'cs@gmail.com'),
(64, 'Mr', 'Jerry', 'Jones', 'JJ213@gmail.com'),
(65, 'Mr', 'Jerry', 'Jones', 'csd@gmail.com'),
(66, 'Mr', 'Charlie', 'Shaw', 'charlie@thepiper.scot'),
(67, 'Mr', 'Charlie', 'Shaw', 'charlie@thepiper.scot'),
(68, 'Mr', 'Charlie', 'Shaw', 'charlie@thepiper.scot'),
(69, 'Mr', 'CHARLES', 'SHAW', 'charlie@thepiper.scot'),
(70, 'Mr', 'Charlie', 'Shaw', 'charlie@thepiper.scot'),
(71, 'Mr', 'CHARLES', 'SHAW', 'charlie@thepiper.scot');

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
(2, 'root', '$2y$10$6.Eue.LETgWLOPCQBh7gY.X3U41O5T0VaRvOLTOi0lDOOxWmYqiSe');

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
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `uID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
