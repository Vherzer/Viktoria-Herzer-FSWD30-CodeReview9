-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 03, 2018 at 03:29 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_viktoria_herzer_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `fuel_level` int(11) DEFAULT NULL,
  `damages` int(11) DEFAULT NULL,
  `fk_return_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `fuel_level`, `damages`, `fk_return_location_id`) VALUES
(1, 0, 0, NULL),
(2, 30, 0, NULL),
(3, 25, 0, NULL),
(4, 0, 50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `model` varchar(30) DEFAULT NULL,
  `fuel_type` varchar(15) DEFAULT NULL,
  `license_plate` varchar(15) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `fk_return_location_id` int(11) DEFAULT NULL,
  `fk_start_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `model`, `fuel_type`, `license_plate`, `color`, `type`, `fk_return_location_id`, `fk_start_location_id`) VALUES
(1, 'diesel', 'tiguan', 'w389s8', 'silver', 'VW', NULL, NULL),
(2, 'diesel', 'polo', 'w3af78', 'blue', 'VW', NULL, NULL),
(3, 'benzin', 'ibiza', 'w234g2', 'black', 'Seat', NULL, NULL),
(4, 'diesel', 'Velar', 'w92839s', 'black', 'Range Rover', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `drivers_license` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `d_o_b` date DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `drivers_license`, `name`, `email`, `address`, `d_o_b`, `fk_reservation_id`, `fk_car_id`, `fk_invoice_id`) VALUES
(1, '123d32', 'John Doe', 'john@gmail.com', 'internetstreet 1 1010 internet', '1975-12-01', NULL, NULL, NULL),
(2, '2342d34', 'Jane Doe', 'jane@gmail.com', 'websitestreet 1 1010 website', '1990-08-02', NULL, NULL, NULL),
(3, '8797s789', 'john man', 'man.john@gmail.com', 'hellostreet 2 1020 welcometown', '0000-00-00', NULL, NULL, NULL),
(4, '3454qa44', 'jane woman', 'woman.jane@gmail.com', 'berrystreet 22/3 1232 planet jupiter', '0000-00-00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `employee_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `employee_number`) VALUES
(1, 'frank ocean', 2324),
(2, 'Mariah Carey', 8786),
(3, 'Willy Smith', 4543),
(4, 'Audrey Hepburn ', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `total_bill` int(11) DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_additional_charges_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_number`, `date_created`, `total_bill`, `fk_driver_id`, `fk_additional_charges_id`, `fk_employee_id`) VALUES
(1, 23411, '2017-11-15', 300, NULL, NULL, NULL),
(2, 23412, '2017-11-15', 150, NULL, NULL, NULL),
(3, 23414, '2017-11-16', 200, NULL, NULL, NULL),
(4, 23417, '2017-11-17', 400, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rental_company`
--

CREATE TABLE `rental_company` (
  `rental_company_id` int(11) NOT NULL,
  `company_branch` varchar(60) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rental_company`
--

INSERT INTO `rental_company` (`rental_company_id`, `company_branch`, `fk_employee_id`, `fk_car_id`, `fk_reservation_id`) VALUES
(1, 'Hertz - Vienna Airport', NULL, NULL, NULL),
(2, 'Sixt - Vienna Airport', NULL, NULL, NULL),
(3, 'Herzt - Zürich Airport', NULL, NULL, NULL),
(4, 'Sixt - Zürich Airport', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `date_reserved` date DEFAULT NULL,
  `under_23_insurance` varchar(100) DEFAULT NULL,
  `additional_driver` varchar(100) DEFAULT NULL,
  `selected_car` varchar(100) DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `date_reserved`, `under_23_insurance`, `additional_driver`, `selected_car`, `fk_driver_id`) VALUES
(1, '2017-11-12', 'not required', '1 person', 'Range-rover Velar', NULL),
(2, '2017-11-07', 'not required', '0 person', 'VW Polo', NULL),
(3, '2017-11-13', 'under 23 insurance purchased', '0 person', 'none selected', NULL),
(4, '2017-11-13', 'not required', '1 person', 'Seat Ibiza', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `return_location`
--

CREATE TABLE `return_location` (
  `return_location_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `car_inspection` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_location`
--

INSERT INTO `return_location` (`return_location_id`, `address`, `car_inspection`) VALUES
(1, 'Vienna Airport', 'no damages'),
(2, 'Zurich Airport', 'no damages'),
(3, 'Vienna Airport', 'no damages'),
(4, 'Zürich Airport', 'Rear left bumper minor scratch');

-- --------------------------------------------------------

--
-- Table structure for table `start_location`
--

CREATE TABLE `start_location` (
  `start_location_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_location`
--

INSERT INTO `start_location` (`start_location_id`, `address`, `fk_reservation_id`) VALUES
(1, 'Vienna Airport', NULL),
(2, 'Vienna Hertz, City-center location', NULL),
(3, 'Zürich airport', NULL),
(4, 'Zürich airport', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_return_location_id` (`fk_return_location_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_return_location_id` (`fk_return_location_id`),
  ADD KEY `fk_start_location_id` (`fk_start_location_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_additional_charges_id` (`fk_additional_charges_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `rental_company`
--
ALTER TABLE `rental_company`
  ADD PRIMARY KEY (`rental_company_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indexes for table `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_location_id`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_location_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_return_location_id`) REFERENCES `return_location` (`return_location_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_return_location_id`) REFERENCES `return_location` (`return_location_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_start_location_id`) REFERENCES `start_location` (`start_location_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `driver_ibfk_3` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_additional_charges_id`) REFERENCES `additional_charges` (`additional_charges_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `rental_company`
--
ALTER TABLE `rental_company`
  ADD CONSTRAINT `rental_company_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `rental_company_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `rental_company_ibfk_3` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints for table `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `start_location_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
