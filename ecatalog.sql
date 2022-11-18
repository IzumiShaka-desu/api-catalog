-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 18, 2022 at 07:56 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecatalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_kendaraan`
--

CREATE TABLE `brand_kendaraan` (
  `id_brand` int(11) NOT NULL,
  `nama_brand` text NOT NULL,
  `id_jenis_kendaraan` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand_kendaraan`
--

INSERT INTO `brand_kendaraan` (`id_brand`, `nama_brand`, `id_jenis_kendaraan`, `created_at`) VALUES
(1, 'BMW', 1, '2021-12-08 02:38:40'),
(2, 'Chery', 1, '2021-12-08 02:38:40'),
(3, 'Daihatsu', 1, '2021-12-08 02:38:40'),
(4, 'Datsu', 1, '2021-12-08 02:38:40'),
(5, 'Daewoo', 1, '2021-12-08 02:38:40'),
(6, 'Ford', 1, '2021-12-08 02:38:40'),
(7, 'Hino', 1, '2021-12-08 02:38:40'),
(8, 'Honda', 1, '2021-12-08 02:38:40'),
(9, 'Hyundai', 1, '2021-12-08 02:38:40'),
(10, 'Isuzu', 1, '2021-12-08 02:38:40'),
(11, 'KIA', 1, '2021-12-08 02:38:40'),
(12, 'Mazda', 1, '2021-12-08 02:38:40'),
(13, 'Marcedes', 1, '2021-12-08 02:38:40'),
(14, 'Mitsubishi', 1, '2021-12-08 02:38:40'),
(15, 'Nissan', 1, '2021-12-08 02:38:40'),
(16, 'Opel', 1, '2021-12-08 02:38:40'),
(17, 'Peugeot', 1, '2021-12-08 02:38:40'),
(18, 'Proton', 1, '2021-12-08 02:38:40'),
(19, 'Renault', 1, '2021-12-08 02:38:40'),
(20, 'Ssangyong', 1, '2021-12-08 02:38:40'),
(21, 'Suzuki', 1, '2021-12-08 02:38:40'),
(22, 'Toyota', 1, '2021-12-08 02:38:40'),
(23, 'UD Truck', 1, '2021-12-08 02:38:40'),
(24, 'VW', 1, '2021-12-08 02:38:40'),
(25, 'Wuling', 1, '2021-12-08 02:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `feature_tree`
--

CREATE TABLE `feature_tree` (
  `id_feature_tree` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `feature` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature_tree`
--

INSERT INTO `feature_tree` (`id_feature_tree`, `id_product`, `feature`) VALUES
(1, 1, 'general'),
(2, 1, 'new_arrivals'),
(3, 1, 'featured');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kendaraan`
--

CREATE TABLE `jenis_kendaraan` (
  `id_jenis_kendaraan` int(11) NOT NULL,
  `nama_jenis_kendaraan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_kendaraan`
--

INSERT INTO `jenis_kendaraan` (`id_jenis_kendaraan`, `nama_jenis_kendaraan`) VALUES
(1, 'Roda 4'),
(2, 'Roda 2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `join product tree`
-- (See below for the actual view)
--
CREATE TABLE `join product tree` (
`id_product` int(11)
,`id_tipe_battery` int(11)
,`nama_product` text
,`desc_product` text
,`thumbnail_product` varchar(100)
,`spec_product` varchar(50)
,`created_at` timestamp
,`nama_tipe_battery` varchar(100)
,`nama_tipe` text
,`nama_brand` text
,`nama_jenis_kendaraan` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `like_product`
--

CREATE TABLE `like_product` (
  `id_like` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_tipe_battery` int(11) NOT NULL,
  `nama_product` text NOT NULL,
  `desc_product` text NOT NULL,
  `thumbnail_product` varchar(100) NOT NULL,
  `spec_product` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `id_tipe_battery`, `nama_product`, `desc_product`, `thumbnail_product`, `spec_product`, `created_at`) VALUES
(1, 3, '12N24 MF', '12N24 MF merupakan battery MF', 'aa7cc77fd625f12f9c8a35b24acb2119.jpg', '3981533f74c1e52d1cb68f313a5288b6.PNG', '2021-12-08 03:19:38'),
(2, 1, 'NS40', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(3, 1, 'NS40L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(4, 1, 'NS40(S)', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(5, 1, 'NS40L(S)', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(6, 1, 'NS40Z', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(7, 1, 'NS40ZL', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(8, 1, 'NS40Z(S)', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(9, 1, 'NS40ZL(S)', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(10, 1, 'NS60', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(11, 1, 'NS60L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(12, 1, 'NS60(S)', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(13, 1, 'NS60L(S)', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(14, 1, 'N40', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(15, 1, 'N40L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(16, 1, '55D23', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(17, 1, '55D23L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(18, 1, 'N50', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(19, 1, 'N50L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(20, 1, 'N50Z', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(21, 1, 'N50ZL', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(22, 1, 'NS70', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(23, 1, 'NS70L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(24, 1, 'NX110-5', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(25, 1, 'NX110-5L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(26, 1, 'N70', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(27, 1, 'N70L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(28, 1, 'N70Z', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(29, 1, 'N70ZL', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(30, 1, 'NX120-7', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(31, 1, 'NX120-7L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(32, 1, '105D31', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(33, 1, '105D31L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(34, 1, 'N100', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(35, 1, 'N100L', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(36, 1, 'N120', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(37, 1, 'N150', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(38, 1, 'N200', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(39, 1, '544-59', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(40, 1, '544-65', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(41, 1, '545-19', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(42, 1, '555-59', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(43, 1, '555-65', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(44, 1, '562-19', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(45, 1, '566-38', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(46, 1, '574-12', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(47, 1, '580-24', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(48, 1, '588-27', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(49, 1, '620-34', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(50, 1, '650-38', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(51, 1, '670-18', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(52, 1, '700-27', 'Conventional battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:29:38'),
(53, 2, 'NS40', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:16'),
(54, 2, 'NS40L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(55, 2, 'NS40(S)', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(56, 2, 'NS40L(S)', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(57, 2, 'NS40Z', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(58, 2, 'NS40ZL', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(59, 2, 'NS40Z(S)', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(60, 2, 'NS40ZL(S)', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(61, 2, 'NS60', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(62, 2, 'NS60L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(63, 2, 'N50', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(64, 2, 'N50L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(65, 2, 'N50Z', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(66, 2, 'N50ZL', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(67, 2, 'NS70', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(68, 2, 'NS70L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(69, 2, 'NX110-5', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(70, 2, 'NX110-5L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(71, 2, 'N70', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(72, 2, 'N70L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(73, 2, 'N70Z', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(74, 2, 'N70ZL', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(75, 2, 'NX120-7', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(76, 2, 'NX120-7L', 'Hybrid battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:17'),
(77, 3, 'MF 12N24-3', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(78, 3, 'MF 12N24-4', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(79, 3, 'MF NS40', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(80, 3, 'MF NS40L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(81, 3, 'MF NS40(S)', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(82, 3, 'MF NS40L(S)', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(83, 3, 'MF NS40Z', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(84, 3, 'MF NS40ZL', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(85, 3, 'MF NS40Z(S)', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(86, 3, 'MF NS40ZL(S)', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(87, 3, 'MF NS60', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(88, 3, 'MF NS60L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(89, 3, 'MF NS60(S)', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(90, 3, 'MF NS60L(S)', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(91, 3, 'MF N40', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(92, 3, 'MF N40L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(93, 3, 'MF 55D23', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(94, 3, 'MF 55D23L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(95, 3, 'MF 75D23', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(96, 3, 'MF 75D23L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(97, 3, 'MF N50', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(98, 3, 'MF N50L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(99, 3, 'MF N50Z', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(100, 3, 'MF N50ZL', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(101, 3, 'MF NS70', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(102, 3, 'MF NS70L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(103, 3, 'MF NX110-5', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(104, 3, 'MF NX110-5L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(105, 3, 'MF 90D26', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(106, 3, 'MF 90D26L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(107, 3, 'MF N70', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(108, 3, 'MF N70L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(109, 3, 'MF N70Z', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(110, 3, 'MF N70ZL', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(111, 3, 'MF NX120-7', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(112, 3, 'MF NX120-7L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(113, 3, 'MF N70ZZ', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(114, 3, 'MF N70ZZL', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(115, 3, 'MF 115D31', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(116, 3, 'MF 115D31L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(117, 3, 'MF 105D31', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(118, 3, 'MF 105D31L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(119, 3, 'MF N100', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(120, 3, 'MF N100L', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(121, 3, 'MF N120', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(122, 3, 'MF N150', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(123, 3, 'MF N200', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(124, 3, 'MF 544-59', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(125, 3, 'MF 544-64', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(126, 3, 'MF 555-59', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(127, 3, 'MF 555-65', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(128, 3, 'MF 560-73', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(129, 3, 'MF 562-19', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(130, 3, 'MF 562-21', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(131, 3, 'MF 545-19', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(132, 3, 'MF 555-66', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(133, 3, 'MF 562-05', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(134, 3, 'MF 566-33', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(135, 3, 'MF 566-38', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(136, 3, 'MF 572-33', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(137, 3, 'MF 574-12', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(138, 3, 'MF 574-13', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(139, 3, 'MF 575-19', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(140, 3, 'MF 575-20', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(141, 3, 'MF 580-24', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(142, 3, 'MF 566-40', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(143, 3, 'MF 575-49', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(144, 3, 'MF 588-21', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(145, 3, 'MF 588-27', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(146, 3, 'MF 600-38', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(147, 3, 'MF 588-15', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(148, 3, 'MF 670-18', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43'),
(149, 3, 'MF 720-18', 'Maintenance free battery for automotive', 'a.jpg', 'b.jpg', '2021-12-14 03:30:43');

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_complete_data`
-- (See below for the actual view)
--
CREATE TABLE `product_complete_data` (
`id_product` int(11)
,`id_tipe_battery` int(11)
,`nama_product` text
,`desc_product` text
,`thumbnail_product` varchar(100)
,`spec_product` varchar(50)
,`created_at` timestamp
,`nama_tipe_battery` varchar(100)
,`nama_tipe` text
,`nama_brand` text
,`nama_jenis_kendaraan` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

CREATE TABLE `product_gallery` (
  `id_product_gallery` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `image_product` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`id_product_gallery`, `id_product`, `image_product`, `created_at`) VALUES
(1, 1, '17aed4e42c27d376b69325709c5c222e.jpg', '2021-12-09 01:32:27'),
(2, 1, '12N24MFincoe0.jpeg', '2022-11-16 00:56:46'),
(3, 1, '12N24MFincoe1.jpeg', '2022-11-16 00:56:46'),
(4, 1, '12N24MFincoe2.jpeg', '2022-11-16 00:56:46'),
(5, 16, '55D23incoe1.jpeg', '2022-11-16 01:02:34'),
(6, 16, '55D23incoe2.jpeg', '2022-11-16 01:02:34'),
(7, 16, '55D23incoe3.jpeg', '2022-11-16 01:02:34'),
(8, 16, '55D23incoe4.jpeg', '2022-11-16 01:02:34'),
(9, 2, 'NS40incoe3.jpeg', '2022-11-16 01:02:34'),
(10, 2, 'NS40incoe0.jpeg', '2022-11-16 01:02:34'),
(11, 2, 'NS40incoe1.jpeg', '2022-11-16 01:02:34'),
(12, 2, 'NS40incoe2.jpeg', '2022-11-16 01:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_tree`
--

CREATE TABLE `product_tree` (
  `id_product_tree` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_jenis_kendaraan` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_tipe` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `slider` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_battery`
--

CREATE TABLE `tipe_battery` (
  `id_tipe_battery` int(11) NOT NULL,
  `nama_tipe_battery` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipe_battery`
--

INSERT INTO `tipe_battery` (`id_tipe_battery`, `nama_tipe_battery`, `created_at`) VALUES
(1, 'Conventional', '2021-12-08 03:15:04'),
(2, 'Hybrid', '2021-12-08 03:15:04'),
(3, 'Maintenance Free', '2021-12-08 03:15:04'),
(4, 'AGM Battery', '2021-12-08 03:15:04'),
(5, 'Gel Battery', '2021-12-08 03:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kendaraan`
--

CREATE TABLE `tipe_kendaraan` (
  `id_tipe` int(11) NOT NULL,
  `nama_tipe` text NOT NULL,
  `id_brand` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipe_kendaraan`
--

INSERT INTO `tipe_kendaraan` (`id_tipe`, `nama_tipe`, `id_brand`, `created_at`) VALUES
(1, 'A4', 1, '2021-12-08 03:13:32'),
(2, 'A3', 1, '2021-12-08 03:13:32'),
(3, 'A6', 1, '2021-12-08 03:13:32'),
(4, '318', 2, '2021-12-08 03:13:32'),
(5, '320', 2, '2021-12-08 03:13:32'),
(6, '325', 2, '2021-12-08 03:13:32'),
(7, '5 series', 2, '2021-12-08 03:13:32'),
(8, 'X3 series', 2, '2021-12-08 03:13:32'),
(9, 'X5 series', 2, '2021-12-08 03:13:32'),
(10, 'Chery QQ (SX/GX)', 3, '2021-12-08 03:13:32'),
(11, 'Tiggo (SX/GX)', 3, '2021-12-08 03:13:32'),
(12, 'Espass', 4, '2021-12-08 03:13:32'),
(13, 'Neo Zebra', 4, '2021-12-08 03:13:32'),
(14, 'Feroza', 4, '2021-12-08 03:13:32'),
(15, 'Taruna', 4, '2021-12-08 03:13:32'),
(16, 'Xenia  (Mi/Li/Xi) 2003-2009', 4, '2021-12-08 03:13:32'),
(17, 'Xenia  (Mi/Li/Xi) 2010-2014', 4, '2021-12-08 03:13:32'),
(18, 'Grand  New Xenia', 4, '2021-12-08 03:13:32'),
(19, 'Grand  Xenia  (X/R/RDeluxe)', 4, '2021-12-08 03:13:32'),
(20, 'All New Terios  (X/XDeluxe/R/RDeluxe)', 4, '2021-12-08 03:13:32'),
(21, 'Terios  (TS/TX) 2006', 4, '2021-12-08 03:13:32'),
(22, 'Terios  (TS/TX) 2010', 4, '2021-12-08 03:13:32'),
(23, 'Taft Series', 4, '2021-12-08 03:13:32'),
(24, 'Charade', 4, '2021-12-08 03:13:32'),
(25, 'Classy', 4, '2021-12-08 03:13:32'),
(26, 'Ceria', 4, '2021-12-08 03:13:32'),
(27, 'YRV', 4, '2021-12-08 03:13:32'),
(28, 'Sirion  (D/M)', 4, '2021-12-08 03:13:32'),
(29, 'Gran Max (PU/MB)', 4, '2021-12-08 03:13:32'),
(30, 'Luxio (D/M/X)', 4, '2021-12-08 03:13:32'),
(31, 'Ayla', 4, '2021-12-08 03:13:32'),
(32, 'Sigra', 4, '2021-12-08 03:13:32'),
(33, 'Go', 5, '2021-12-08 03:13:32'),
(34, 'Go +', 5, '2021-12-08 03:13:32'),
(35, 'Espero', 6, '2021-12-08 03:13:32'),
(36, 'Nexia', 6, '2021-12-08 03:13:32'),
(37, 'Laser', 7, '2021-12-08 03:13:32'),
(38, 'New Laser', 7, '2021-12-08 03:13:32'),
(39, 'Link', 7, '2021-12-08 03:13:32'),
(40, 'Gala', 7, '2021-12-08 03:13:32'),
(41, 'Brilian', 7, '2021-12-08 03:13:32'),
(42, 'Ranger SC', 7, '2021-12-08 03:13:32'),
(43, 'Escape VVT (XLS/XLT/LTD)', 7, '2021-12-08 03:13:32'),
(44, 'Everest TDCI (XLT)', 7, '2021-12-08 03:13:32'),
(45, 'FL (260/235 TI)', 8, '2021-12-08 03:13:32'),
(46, 'FG (260/235 TI)', 8, '2021-12-08 03:13:32'),
(47, 'SG 260J', 8, '2021-12-08 03:13:32'),
(48, 'FM (320P/260JM)', 8, '2021-12-08 03:13:32'),
(49, 'Dutro', 8, '2021-12-08 03:13:32'),
(50, 'Civic series', 9, '2021-12-08 03:13:32'),
(51, 'New Civic', 9, '2021-12-08 03:13:32'),
(52, 'All New Civic', 9, '2021-12-08 03:13:32'),
(53, 'Nouva', 9, '2021-12-08 03:13:32'),
(54, 'Ferio AT', 9, '2021-12-08 03:13:32'),
(55, 'Estilo', 9, '2021-12-08 03:13:32'),
(56, 'Genio', 9, '2021-12-08 03:13:32'),
(57, 'Maestro', 9, '2021-12-08 03:13:32'),
(58, 'Cielo SV 4AT', 9, '2021-12-08 03:13:32'),
(59, 'Accord Series', 9, '2021-12-08 03:13:32'),
(60, 'All New Accord', 9, '2021-12-08 03:13:32'),
(61, 'City', 9, '2021-12-08 03:13:32'),
(62, 'All New City (R/Reclining)', 9, '2021-12-08 03:13:32'),
(63, 'Jazz', 9, '2021-12-08 03:13:32'),
(64, 'All New Jazz (S/SR)', 9, '2021-12-08 03:13:32'),
(65, 'Freed', 9, '2021-12-08 03:13:32'),
(66, 'Stream', 9, '2021-12-08 03:13:32'),
(67, 'CRV', 9, '2021-12-08 03:13:32'),
(68, 'All New CRV', 9, '2021-12-08 03:13:32'),
(69, 'Odyssey', 9, '2021-12-08 03:13:32'),
(70, 'Brio', 9, '2021-12-08 03:13:32'),
(71, 'Mobilio', 9, '2021-12-08 03:13:32'),
(72, 'HRV', 9, '2021-12-08 03:13:32'),
(73, 'Accent', 10, '2021-12-08 03:13:32'),
(74, 'Cakra', 10, '2021-12-08 03:13:32'),
(75, 'Exel', 10, '2021-12-08 03:13:32'),
(76, 'Elantra', 10, '2021-12-08 03:13:32'),
(77, 'Nenggala', 10, '2021-12-08 03:13:32'),
(78, 'Coupe', 10, '2021-12-08 03:13:32'),
(79, 'Grandeur', 10, '2021-12-08 03:13:32'),
(80, 'Sonata', 10, '2021-12-08 03:13:32'),
(81, 'Santa FE', 10, '2021-12-08 03:13:32'),
(82, 'Accent Verna', 10, '2021-12-08 03:13:32'),
(83, 'Exel II ( Taksi )', 10, '2021-12-08 03:13:32'),
(84, 'Atoz', 10, '2021-12-08 03:13:32'),
(85, 'Avega (GL/SG)', 10, '2021-12-08 03:13:32'),
(86, 'Matrix', 10, '2021-12-08 03:13:32'),
(87, 'i10 (GL, GLS, IC) MT/AT', 10, '2021-12-08 03:13:32'),
(88, 'Getz (SG) MT/AT', 10, '2021-12-08 03:13:32'),
(89, 'Trajet', 10, '2021-12-08 03:13:32'),
(90, 'H-1 (GLS/ES/XG)', 10, '2021-12-08 03:13:32'),
(91, 'Grace', 10, '2021-12-08 03:13:32'),
(92, 'HDMT (Truck)', 10, '2021-12-08 03:13:32'),
(93, 'i20(GL) MT/AT', 10, '2021-12-08 03:13:32'),
(94, 'H-1 (CRDI) Diesel', 10, '2021-12-08 03:13:32'),
(95, 'Grand Avega', 10, '2021-12-08 03:13:32'),
(96, 'Panther Series', 11, '2021-12-08 03:13:32'),
(97, 'ELF 95 PS (NHR55E)', 11, '2021-12-08 03:13:32'),
(98, 'ELF 95 PS (NKR55E)', 11, '2021-12-08 03:13:32'),
(99, 'ELF 120 PS (NKR71E/NKR71D)', 11, '2021-12-08 03:13:32'),
(100, 'Bison', 11, '2021-12-08 03:13:32'),
(101, 'Borneo (F.Series)', 11, '2021-12-08 03:13:32'),
(102, 'Travera', 11, '2021-12-08 03:13:32'),
(103, 'D-Max', 11, '2021-12-08 03:13:32'),
(104, 'MU-X', 11, '2021-12-08 03:13:32'),
(105, 'Timor Series', 12, '2021-12-08 03:13:32'),
(106, 'Shuma', 12, '2021-12-08 03:13:32'),
(107, 'Visto', 12, '2021-12-08 03:13:32'),
(108, 'Picanto', 12, '2021-12-08 03:13:32'),
(109, 'Carrens I', 12, '2021-12-08 03:13:32'),
(110, 'Carrens II', 12, '2021-12-08 03:13:32'),
(111, 'Carrens III', 12, '2021-12-08 03:13:32'),
(112, 'Sportage', 12, '2021-12-08 03:13:32'),
(113, 'Carnival (D)', 12, '2021-12-08 03:13:32'),
(114, 'Pregio', 12, '2021-12-08 03:13:32'),
(115, 'K-27 (Truck)', 12, '2021-12-08 03:13:32'),
(116, 'Sedona (G)', 12, '2021-12-08 03:13:32'),
(117, 'Sedona (D)', 12, '2021-12-08 03:13:32'),
(118, 'Rio', 12, '2021-12-08 03:13:32'),
(119, 'Sorento', 12, '2021-12-08 03:13:32'),
(120, 'Mazda 323', 13, '2021-12-08 03:13:32'),
(121, 'Astina', 13, '2021-12-08 03:13:32'),
(122, 'Mazda 626', 13, '2021-12-08 03:13:32'),
(123, 'Cronos', 13, '2021-12-08 03:13:32'),
(124, 'Interplay', 13, '2021-12-08 03:13:32'),
(125, 'Capella', 13, '2021-12-08 03:13:32'),
(126, 'Familia', 13, '2021-12-08 03:13:32'),
(127, 'Lentis', 13, '2021-12-08 03:13:32'),
(128, 'MR-90', 13, '2021-12-08 03:13:32'),
(129, 'Vantrend  Series', 13, '2021-12-08 03:13:32'),
(130, 'E-2000', 13, '2021-12-08 03:13:32'),
(131, 'E-2000 Diesel', 13, '2021-12-08 03:13:32'),
(132, 'Mazda 2', 13, '2021-12-08 03:13:32'),
(133, 'Mazda 2 Sedan', 13, '2021-12-08 03:13:32'),
(134, 'Mazda 3, 6, 8', 13, '2021-12-08 03:13:32'),
(135, 'Biante', 13, '2021-12-08 03:13:32'),
(136, 'C180', 14, '2021-12-08 03:13:32'),
(137, 'C200', 14, '2021-12-08 03:13:32'),
(138, 'C230', 14, '2021-12-08 03:13:32'),
(139, 'T-120SS  OLD', 15, '2021-12-08 03:13:32'),
(140, 'T-120SS  MPI', 15, '2021-12-08 03:13:32'),
(141, 'Maven', 15, '2021-12-08 03:13:32'),
(142, 'Galant - Eterna', 15, '2021-12-08 03:13:32'),
(143, 'New Galant', 15, '2021-12-08 03:13:32'),
(144, 'Lancer', 15, '2021-12-08 03:13:32'),
(145, 'New Lancer', 15, '2021-12-08 03:13:32'),
(146, 'Kuda Series', 15, '2021-12-08 03:13:32'),
(147, 'Kuda Series Diesel', 15, '2021-12-08 03:13:32'),
(148, 'New Pajero Sport Diesel', 15, '2021-12-08 03:13:32'),
(149, 'L-200 (Mega Cabin)', 15, '2021-12-08 03:13:32'),
(150, 'L-200 (Double  Cabin)', 15, '2021-12-08 03:13:32'),
(151, 'L-200 (Super Pick Up )', 15, '2021-12-08 03:13:32'),
(152, 'L-300 Series', 15, '2021-12-08 03:13:32'),
(153, 'L-300 Series Diesel', 15, '2021-12-08 03:13:32'),
(154, 'Triton', 15, '2021-12-08 03:13:32'),
(155, 'Cold Diesel 110-125  PS (FE Series)', 15, '2021-12-08 03:13:32'),
(156, 'Fuso (FM517HS/HL FN527MS/ML)', 15, '2021-12-08 03:13:32'),
(157, 'Bus BM155L', 15, '2021-12-08 03:13:32'),
(158, 'Bus', 15, '2021-12-08 03:13:32'),
(159, 'Mirage', 15, '2021-12-08 03:13:32'),
(160, 'Strada', 15, '2021-12-08 03:13:32'),
(161, 'Outlander', 15, '2021-12-08 03:13:32'),
(162, 'Delica', 15, '2021-12-08 03:13:32'),
(163, 'Xpander', 15, '2021-12-08 03:13:32'),
(164, 'Sunny', 16, '2021-12-08 03:13:32'),
(165, 'Neo Sunny', 16, '2021-12-08 03:13:32'),
(166, 'Sentra', 16, '2021-12-08 03:13:32'),
(167, 'Infiniti', 16, '2021-12-08 03:13:32'),
(168, 'Cefiro', 16, '2021-12-08 03:13:32'),
(169, 'Cedric', 16, '2021-12-08 03:13:32'),
(170, 'Teana', 16, '2021-12-08 03:13:32'),
(171, 'Murano', 16, '2021-12-08 03:13:32'),
(172, 'Lattio', 16, '2021-12-08 03:13:32'),
(173, 'Livina (XR/X-Gear)', 16, '2021-12-08 03:13:32'),
(174, 'Grand Livina 1.5L (XV)', 16, '2021-12-08 03:13:32'),
(175, 'Grand Livina 1.8L (XV/Ultm)', 16, '2021-12-08 03:13:32'),
(176, 'X-Trail', 16, '2021-12-08 03:13:32'),
(177, 'New Serena (CT/NWS)', 16, '2021-12-08 03:13:32'),
(178, 'Terrano', 16, '2021-12-08 03:13:32'),
(179, 'Patrol', 16, '2021-12-08 03:13:32'),
(180, 'Frontier  Double Cabin', 16, '2021-12-08 03:13:32'),
(181, 'March', 16, '2021-12-08 03:13:32'),
(182, 'Juke', 16, '2021-12-08 03:13:32'),
(183, 'Evalia', 16, '2021-12-08 03:13:32'),
(184, 'Vectra', 17, '2021-12-08 03:13:32'),
(185, 'Optima', 17, '2021-12-08 03:13:32'),
(186, 'Blazer', 17, '2021-12-08 03:13:32'),
(187, '504/505', 18, '2021-12-08 03:13:32'),
(188, '604', 18, '2021-12-08 03:13:32'),
(189, '605', 18, '2021-12-08 03:13:32'),
(190, '206 / 306', 18, '2021-12-08 03:13:32'),
(191, '406', 18, '2021-12-08 03:13:32'),
(192, '3008 / 5008', 18, '2021-12-08 03:13:32'),
(193, '307 / 308 / 408', 18, '2021-12-08 03:13:32'),
(194, 'Saga (Taksi)', 19, '2021-12-08 03:13:32'),
(195, 'New Saga', 19, '2021-12-08 03:13:32'),
(196, 'Savvy', 19, '2021-12-08 03:13:32'),
(197, 'Waja', 19, '2021-12-08 03:13:32'),
(198, 'Exora', 19, '2021-12-08 03:13:32'),
(199, 'Clio', 20, '2021-12-08 03:13:32'),
(200, 'Kango', 20, '2021-12-08 03:13:32'),
(201, 'Megane Series', 20, '2021-12-08 03:13:32'),
(202, 'Boxer SG.320', 21, '2021-12-08 03:13:32'),
(203, 'Carry Series', 22, '2021-12-08 03:13:32'),
(204, 'Futura', 22, '2021-12-08 03:13:32'),
(205, 'Karimun', 22, '2021-12-08 03:13:32'),
(206, 'Karimun Estilo', 22, '2021-12-08 03:13:32'),
(207, 'APV (GE/GL/GX/SGX/Luxury)', 22, '2021-12-08 03:13:32'),
(208, 'Real Van', 22, '2021-12-08 03:13:32'),
(209, 'Katana', 22, '2021-12-08 03:13:32'),
(210, 'Sidekick', 22, '2021-12-08 03:13:32'),
(211, 'Escudo', 22, '2021-12-08 03:13:32'),
(212, 'Grand Escudo (2.0)', 22, '2021-12-08 03:13:32'),
(213, 'Vitara', 22, '2021-12-08 03:13:32'),
(214, 'Grand Vitara (YT4)', 22, '2021-12-08 03:13:32'),
(215, 'Esteem', 22, '2021-12-08 03:13:32'),
(216, 'Baleno', 22, '2021-12-08 03:13:32'),
(217, 'New Baleno', 22, '2021-12-08 03:13:32'),
(218, 'Aerio MT', 22, '2021-12-08 03:13:32'),
(219, 'Aerio AT', 22, '2021-12-08 03:13:32'),
(220, 'Swift (ST/GT)', 22, '2021-12-08 03:13:32'),
(221, 'SX-4 Cross Over', 22, '2021-12-08 03:13:32'),
(222, 'Splash', 22, '2021-12-08 03:13:32'),
(223, 'Ertiga', 22, '2021-12-08 03:13:32'),
(224, 'Ignis', 22, '2021-12-08 03:13:32'),
(225, 'Karimun Wagon R', 22, '2021-12-08 03:13:32'),
(226, 'Kijang  Standard', 23, '2021-12-08 03:13:32'),
(227, 'Kijang  Grand', 23, '2021-12-08 03:13:32'),
(228, 'Kijang  Diesel', 23, '2021-12-08 03:13:32'),
(229, 'Kijang  Innova  (E/J)', 23, '2021-12-08 03:13:32'),
(230, 'Kijang  Innova  (G/V)', 23, '2021-12-08 03:13:32'),
(231, 'Kijang  Innova  Diesel  (E/G/V)', 23, '2021-12-08 03:13:32'),
(232, 'Kijang  Innova  Reborn  (Bensin)', 23, '2021-12-08 03:13:32'),
(233, 'Kijang  Innova  Reborn  (Diesel)', 23, '2021-12-08 03:13:32'),
(234, 'Avanza  (E/G/S)  2003-2009', 23, '2021-12-08 03:13:32'),
(235, 'Avanza  (E/G/S)  2010-2014', 23, '2021-12-08 03:13:32'),
(236, 'Grand  New Avanza  (E/G)', 23, '2021-12-08 03:13:32'),
(237, 'Avanza  Veloz', 23, '2021-12-08 03:13:32'),
(238, 'Grand  New Veloz', 23, '2021-12-08 03:13:32'),
(239, 'Rush (G/S) 2006-2010', 23, '2021-12-08 03:13:32'),
(240, 'Rush (G/S) 2011', 23, '2021-12-08 03:13:32'),
(241, 'Starlet  Series', 23, '2021-12-08 03:13:32'),
(242, 'Corolla  Series', 23, '2021-12-08 03:13:32'),
(243, 'Corolla  Altis', 23, '2021-12-08 03:13:32'),
(244, 'New Corolla  Altis', 23, '2021-12-08 03:13:32'),
(245, 'All New Corolla  Altis (J/G/V)', 23, '2021-12-08 03:13:32'),
(246, 'Corona Series', 23, '2021-12-08 03:13:32'),
(247, 'Soluna', 23, '2021-12-08 03:13:32'),
(248, 'Vios', 23, '2021-12-08 03:13:32'),
(249, 'New Vios (E/G)', 23, '2021-12-08 03:13:32'),
(250, 'Limo', 23, '2021-12-08 03:13:32'),
(251, 'New Limo (E/G)', 23, '2021-12-08 03:13:32'),
(252, 'Yaris (J/E/S)', 23, '2021-12-08 03:13:32'),
(253, 'All New Yaris', 23, '2021-12-08 03:13:32'),
(254, 'Raum', 23, '2021-12-08 03:13:32'),
(255, 'Passo', 23, '2021-12-08 03:13:32'),
(256, 'Porte', 23, '2021-12-08 03:13:32'),
(257, 'Voxy', 23, '2021-12-08 03:13:32'),
(258, 'Camry  (G/V/Q)', 23, '2021-12-08 03:13:32'),
(259, 'Crown', 23, '2021-12-08 03:13:32'),
(260, 'Land Cruiser', 23, '2021-12-08 03:13:32'),
(261, 'Prado', 23, '2021-12-08 03:13:32'),
(262, 'Harrier', 23, '2021-12-08 03:13:32'),
(263, 'Calya', 23, '2021-12-08 03:13:32'),
(264, 'Sienta', 23, '2021-12-08 03:13:32'),
(265, 'Fortuner (G/V)', 23, '2021-12-08 03:13:32'),
(266, 'Fortuner Diesel  (G)', 23, '2021-12-08 03:13:32'),
(267, 'All New Fortuner (Bensin)', 23, '2021-12-08 03:13:32'),
(268, 'All New Fortuner (Diesel)', 23, '2021-12-08 03:13:32'),
(269, 'RAV 4', 23, '2021-12-08 03:13:32'),
(270, 'Alphard', 23, '2021-12-08 03:13:32'),
(271, 'Lexus', 23, '2021-12-08 03:13:32'),
(272, 'Hilux (PU, DC)', 23, '2021-12-08 03:13:32'),
(273, 'Dyna', 23, '2021-12-08 03:13:32'),
(274, 'New Dyna 200', 23, '2021-12-08 03:13:32'),
(275, 'Etios Valco', 23, '2021-12-08 03:13:32'),
(276, 'Agya', 23, '2021-12-08 03:13:32'),
(277, 'Quester CKE', 24, '2021-12-08 03:13:32'),
(278, 'Quester CDE', 24, '2021-12-08 03:13:32'),
(279, 'Quester CWE', 24, '2021-12-08 03:13:32'),
(280, 'Quester CGE', 24, '2021-12-08 03:13:32'),
(281, 'Quester GKE', 24, '2021-12-08 03:13:32'),
(282, 'Quester GDE', 24, '2021-12-08 03:13:32'),
(283, 'Quester GWE', 24, '2021-12-08 03:13:32'),
(284, '740', 24, '2021-12-08 03:13:32'),
(285, '960', 24, '2021-12-08 03:13:32'),
(286, '240', 24, '2021-12-08 03:13:32'),
(287, '340', 24, '2021-12-08 03:13:32'),
(288, '580', 24, '2021-12-08 03:13:32'),
(289, '850', 24, '2021-12-08 03:13:32'),
(290, '244', 24, '2021-12-08 03:13:32'),
(291, '264', 24, '2021-12-08 03:13:32'),
(292, 'Polo', 25, '2021-12-08 03:13:32'),
(293, 'Golf', 25, '2021-12-08 03:13:32'),
(294, 'Tiguan', 25, '2021-12-08 03:13:32'),
(295, 'Confero', 26, '2021-12-08 03:13:32'),
(296, 'Cortez', 26, '2021-12-08 03:13:32'),
(297, 'Almaz', 26, '2021-12-08 03:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `watch_list`
--

CREATE TABLE `watch_list` (
  `id_list` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `join product tree`
--
DROP TABLE IF EXISTS `join product tree`;

CREATE ALGORITHM=UNDEFINED DEFINER=`join_product_tree`@`%` SQL SECURITY DEFINER VIEW `join product tree`  AS SELECT `product`.`id_product` AS `id_product`, `product`.`id_tipe_battery` AS `id_tipe_battery`, `product`.`nama_product` AS `nama_product`, `product`.`desc_product` AS `desc_product`, `product`.`thumbnail_product` AS `thumbnail_product`, `product`.`spec_product` AS `spec_product`, `product`.`created_at` AS `created_at`, `tipe_battery`.`nama_tipe_battery` AS `nama_tipe_battery`, `tipe_kendaraan`.`nama_tipe` AS `nama_tipe`, `brand_kendaraan`.`nama_brand` AS `nama_brand`, `jenis_kendaraan`.`nama_jenis_kendaraan` AS `nama_jenis_kendaraan` FROM (((((`product` left join `tipe_battery` on((`tipe_battery`.`id_tipe_battery` = `product`.`id_tipe_battery`))) left join `product_tree` on((`product_tree`.`id_product` = `product`.`id_product`))) left join `tipe_kendaraan` on((`product_tree`.`id_tipe` = `tipe_kendaraan`.`id_tipe`))) left join `brand_kendaraan` on((`brand_kendaraan`.`id_brand` = `product_tree`.`id_brand`))) left join `jenis_kendaraan` on((`jenis_kendaraan`.`id_jenis_kendaraan` = `product_tree`.`id_jenis_kendaraan`))) ;

-- --------------------------------------------------------

--
-- Structure for view `product_complete_data`
--
DROP TABLE IF EXISTS `product_complete_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_complete_data`  AS SELECT `product`.`id_product` AS `id_product`, `product`.`id_tipe_battery` AS `id_tipe_battery`, `product`.`nama_product` AS `nama_product`, `product`.`desc_product` AS `desc_product`, `product`.`thumbnail_product` AS `thumbnail_product`, `product`.`spec_product` AS `spec_product`, `product`.`created_at` AS `created_at`, `tipe_battery`.`nama_tipe_battery` AS `nama_tipe_battery`, `tipe_kendaraan`.`nama_tipe` AS `nama_tipe`, `brand_kendaraan`.`nama_brand` AS `nama_brand`, `jenis_kendaraan`.`nama_jenis_kendaraan` AS `nama_jenis_kendaraan` FROM (((((`product` left join `tipe_battery` on((`tipe_battery`.`id_tipe_battery` = `product`.`id_tipe_battery`))) left join `product_tree` on((`product_tree`.`id_product` = `product`.`id_product`))) left join `tipe_kendaraan` on((`product_tree`.`id_tipe` = `tipe_kendaraan`.`id_tipe`))) left join `brand_kendaraan` on((`brand_kendaraan`.`id_brand` = `product_tree`.`id_brand`))) left join `jenis_kendaraan` on((`jenis_kendaraan`.`id_jenis_kendaraan` = `product_tree`.`id_jenis_kendaraan`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_kendaraan`
--
ALTER TABLE `brand_kendaraan`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `id_jenis_kendaraan` (`id_jenis_kendaraan`);

--
-- Indexes for table `feature_tree`
--
ALTER TABLE `feature_tree`
  ADD PRIMARY KEY (`id_feature_tree`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  ADD PRIMARY KEY (`id_jenis_kendaraan`);

--
-- Indexes for table `like_product`
--
ALTER TABLE `like_product`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `id_product` (`id_product`,`id_user`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `type_battery` (`id_tipe_battery`);

--
-- Indexes for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD PRIMARY KEY (`id_product_gallery`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `product_tree`
--
ALTER TABLE `product_tree`
  ADD PRIMARY KEY (`id_product_tree`),
  ADD KEY `id_product` (`id_product`,`id_jenis_kendaraan`,`id_brand`,`id_tipe`),
  ADD KEY `id_tipe` (`id_tipe`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `tipe_battery`
--
ALTER TABLE `tipe_battery`
  ADD PRIMARY KEY (`id_tipe_battery`);

--
-- Indexes for table `tipe_kendaraan`
--
ALTER TABLE `tipe_kendaraan`
  ADD PRIMARY KEY (`id_tipe`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Indexes for table `watch_list`
--
ALTER TABLE `watch_list`
  ADD PRIMARY KEY (`id_list`),
  ADD KEY `id_user` (`id_user`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_kendaraan`
--
ALTER TABLE `brand_kendaraan`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `feature_tree`
--
ALTER TABLE `feature_tree`
  MODIFY `id_feature_tree` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  MODIFY `id_jenis_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `like_product`
--
ALTER TABLE `like_product`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `product_gallery`
--
ALTER TABLE `product_gallery`
  MODIFY `id_product_gallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_tree`
--
ALTER TABLE `product_tree`
  MODIFY `id_product_tree` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipe_battery`
--
ALTER TABLE `tipe_battery`
  MODIFY `id_tipe_battery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tipe_kendaraan`
--
ALTER TABLE `tipe_kendaraan`
  MODIFY `id_tipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `watch_list`
--
ALTER TABLE `watch_list`
  MODIFY `id_list` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand_kendaraan`
--
ALTER TABLE `brand_kendaraan`
  ADD CONSTRAINT `brand_kendaraan_ibfk_1` FOREIGN KEY (`id_jenis_kendaraan`) REFERENCES `jenis_kendaraan` (`id_jenis_kendaraan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feature_tree`
--
ALTER TABLE `feature_tree`
  ADD CONSTRAINT `feature_tree_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `like_product`
--
ALTER TABLE `like_product`
  ADD CONSTRAINT `like_product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_tipe_battery`) REFERENCES `tipe_battery` (`id_tipe_battery`);

--
-- Constraints for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD CONSTRAINT `product_gallery_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Constraints for table `product_tree`
--
ALTER TABLE `product_tree`
  ADD CONSTRAINT `product_tree_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `product_tree_ibfk_3` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_kendaraan` (`id_tipe`) ON DELETE NO ACTION;

--
-- Constraints for table `watch_list`
--
ALTER TABLE `watch_list`
  ADD CONSTRAINT `watch_list_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;