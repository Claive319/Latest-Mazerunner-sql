-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2025 at 01:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mazerunner`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3003, 'Jozy Altidore', 'Moscow', 200, 5007),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3008, 'Julian Green', 'London', 300, 5002),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ord_no` int(11) NOT NULL,
  `purch_amt` double(10,2) NOT NULL,
  `ord_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_no`, `purch_amt`, `ord_date`, `customer_id`, `salesman_id`) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70013, 3045.60, '2012-04-25', 3002, 5001);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `salesman_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `commission` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Kniter', 'Paris', 0.13),
(5003, 'Lauson Hense', NULL, 0.12),
(5005, 'Pit Alex', 'London', 0.15),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ord_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `salesman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5009;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
