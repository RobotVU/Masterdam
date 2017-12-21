-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2016 at 11:03 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `the_city`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `name`) VALUES
(1, 'Tourist Destination'),
(2, 'Food & Drink'),
(3, 'Hotels'),
(4, 'Entertainment'),
(5, 'Sport'),
(6, 'Shopping'),
(7, 'Transportation'),
(8, 'Religion'),
(9, 'Public Services'),
(10, 'Money'),
(11, 'Featured Places');

-- --------------------------------------------------------

--
-- Table structure for table `gcm`
--

CREATE TABLE IF NOT EXISTS `gcm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `version` varchar(100) NOT NULL,
  `regid` text NOT NULL,
  `date_create` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_device` (`device`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `gcm`
--

INSERT INTO `gcm` (`id`, `device`, `email`, `version`, `regid`, `date_create`) VALUES
(1, 'Device Sample', 'device.sample@mail.com', '5.0', 'gcmRegId', 1460883373557);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `place_id` int(11) NOT NULL,
  `name` text NOT NULL,
  KEY `fk_table_images` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`place_id`, `name`) VALUES
(1, 'place_Saung Angklung Udjo_01460551937596.jpg'),
(1, 'place_Saung Angklung Udjo_11460551937768.jpg'),
(8, 'place_Dusun Bambu_01460552724078.jpg'),
(8, 'place_Dusun Bambu_11460552724094.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL DEFAULT '-',
  `website` varchar(100) NOT NULL DEFAULT '-',
  `description` text NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `last_update` bigint(20) NOT NULL,
  PRIMARY KEY (`place_id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`place_id`, `name`, `image`, `address`, `phone`, `website`, `description`, `lat`, `lng`, `last_update`) VALUES
(1, 'Saung Angklung Udjo', 'place_Saung Angklung Udjo.jpg', 'Jl. Padasuka No. 118, Bandung, West Java.', '022-727-1714', 'www.angklung-udjo.co.id', 'Saung Angklung Udjo (SAU) is oneâ€“stop cultural workshop, consists of : performance venue, bamboo handicraft centre, and bamboo instrument workshop. Apart from that, SAU has an honorable function as an educational laboratory and training centre to preserve the Sundanese culture â€“ Angklung in particular. Saung Angklung Udjo (SAU) is oneâ€“stop cultural workshop, consists of : performance venue, bamboo handicraft centre, and bamboo instrument workshop. Apart from that, SAU has an honorable function as an educational.', -6.8980322, -6.8980322, 1460475240380),
(8, 'Dusun Bambu', 'place_Dusun Bambu.jpg', 'Jl. Kolonel Masturi Km. 11, Situ Lembang, West Bandung, West Java.', '022-8278-2020', 'www.dusunbambu.com', 'Dusun Bambu Family Leisure Park is an ecotourism with 7E concepts that represent seven aspects of life: Ecology (nature), Education, Economic, Ethnology (culture), Ethics, Esthetics, and Entertainment. By this 7E, Dusun Bambu Family Leisure Park becomes a park in the mountain feet that provide education and recreation facilities.', -6.789375, 107.5787534, 1460475240380);

-- --------------------------------------------------------

--
-- Table structure for table `place_category`
--

CREATE TABLE IF NOT EXISTS `place_category` (
  `place_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  KEY `fk_place_category1` (`place_id`),
  KEY `fk_place_category2` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `place_category`
--

INSERT INTO `place_category` (`place_id`, `cat_id`) VALUES
(1, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'User Place', 'user_place', 'user.place@mail.com', 'ee11cbb19052e40b07aac0ca060c23ee');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_table_images` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`) ON DELETE CASCADE;

--
-- Constraints for table `place_category`
--
ALTER TABLE `place_category`
  ADD CONSTRAINT `fk_place_category_1` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_place_category_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
