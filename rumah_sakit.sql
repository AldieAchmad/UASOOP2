-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 10:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `pay_return` int(11) DEFAULT NULL,
  `id_patient` int(11) DEFAULT NULL,
  `id_doctor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `date`, `amount`, `pay`, `pay_return`, `id_patient`, `id_doctor`) VALUES
(1, '2024-07-22', 4000, 4000, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `billing_detail`
--

CREATE TABLE `billing_detail` (
  `id` int(11) NOT NULL,
  `id_billing` int(11) DEFAULT NULL,
  `id_room` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `amount_service` int(11) DEFAULT NULL,
  `day_of_room` int(11) DEFAULT NULL,
  `amount_room` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing_detail`
--

INSERT INTO `billing_detail` (`id`, `id_billing`, `id_room`, `id_service`, `amount_service`, `day_of_room`, `amount_room`, `total_amount`) VALUES
(1, 1, 102, 2, 1800, 1, 2200, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id_doctor` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `qualification` text NOT NULL,
  `specialization` text NOT NULL,
  `gender` varchar(5) NOT NULL,
  `date_of_join` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id_doctor`, `name`, `address`, `contact`, `email`, `qualification`, `specialization`, `gender`, `date_of_join`) VALUES
(0, 'Dr Sheakh Rashed Haider Noori', 'Mirpur Dhaka', '019652356', 'Noori.cse@diu.edu.bd', 'FCPS', 'Diabetes', 'M', '0000-00-00'),
(1, 'Md Omar Faruk', 'Comilla', '01830730994', 'Omarfaruk8709@yahoo.com', 'MBBS', 'Heart', 'M', '0000-00-00'),
(2, 'Dr. Md. Zahid Hasan', 'Dhaka', '01672580748', 'Zahid@diu.edu.bd', 'BMBS', 'Surgery', 'M', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id_patient` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `age` int(11) NOT NULL,
  `gender` text NOT NULL,
  `blood_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id_patient`, `name`, `Address`, `contact`, `email`, `age`, `gender`, `blood_type`) VALUES
(1, 'test', 'test', '123', 'qwe', 123, 'M', 'O+');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `type`, `amount`, `status`) VALUES
(101, 'General', 1200, 'Vacant'),
(102, 'Deluxe', 2200, 'Vacant'),
(103, 'Deluxe', 1800, 'Booked'),
(104, 'General', 1000, 'Vacant');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id_service` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id_service`, `name`, `amount`) VALUES
(1, 'X-ray Test', 2300),
(2, 'Ultra', 1800),
(3, 'Echocardiography', 2500),
(4, 'Arthroscopy', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_petugas` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_petugas`, `nama`, `email`, `no_hp`, `username`, `password`) VALUES
(1, 'test', 'test', '0909090', 'test', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btp` (`id_patient`),
  ADD KEY `btd` (`id_doctor`);

--
-- Indexes for table `billing_detail`
--
ALTER TABLE `billing_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bdtb` (`id_billing`),
  ADD KEY `bdtr` (`id_room`),
  ADD KEY `bdts` (`id_service`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id_doctor`) USING BTREE;

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`) USING BTREE;

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_petugas`),
  ADD UNIQUE KEY `nama` (`nama`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_detail`
--
ALTER TABLE `billing_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `btd` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id_doctor`),
  ADD CONSTRAINT `btp` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`);

--
-- Constraints for table `billing_detail`
--
ALTER TABLE `billing_detail`
  ADD CONSTRAINT `bdtb` FOREIGN KEY (`id_billing`) REFERENCES `billing` (`id`),
  ADD CONSTRAINT `bdtr` FOREIGN KEY (`id_room`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `bdts` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
