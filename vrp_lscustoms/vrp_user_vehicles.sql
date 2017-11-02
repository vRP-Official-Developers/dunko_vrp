-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2017 at 05:09 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vrpfx`
--

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_vehicles`
--

CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `veh_type` varchar(255) NOT NULL DEFAULT 'default',
  `vehicle_plate` varchar(255) DEFAULT NULL,
  `vehicle_colorprimary` varchar(255) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(255) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(255) DEFAULT NULL,
  `vehicle_wheelcolor` varchar(255) DEFAULT NULL,
  `vehicle_plateindex` varchar(255) DEFAULT NULL,
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `tyresmoke` varchar(45) DEFAULT '255,255,255',
  `mod0` varchar(45) DEFAULT '-1',
  `mod1` varchar(45) DEFAULT '-1',
  `mod2` varchar(45) DEFAULT '-1',
  `mod3` varchar(45) DEFAULT '-1',
  `mod4` varchar(45) DEFAULT '-1',
  `mod5` varchar(45) DEFAULT '-1',
  `mod6` varchar(45) DEFAULT '-1',
  `mod7` varchar(45) DEFAULT '-1',
  `mod8` varchar(45) DEFAULT '-1',
  `mod9` varchar(45) DEFAULT '-1',
  `mod10` varchar(45) DEFAULT '-1',
  `mod11` varchar(45) DEFAULT '-1',
  `mod12` varchar(45) DEFAULT '-1',
  `mod13` varchar(45) DEFAULT '-1',
  `mod14` varchar(45) DEFAULT '-1',
  `mod15` varchar(45) DEFAULT '-1',
  `mod16` varchar(45) DEFAULT '-1',
  `mod17` varchar(45) DEFAULT '-1',
  `mod18` varchar(45) DEFAULT '-1',
  `mod19` varchar(45) DEFAULT '-1',
  `mod20` varchar(45) DEFAULT '-1',
  `mod21` varchar(45) DEFAULT '-1',
  `mod22` varchar(45) DEFAULT '-1',
  `mod23` varchar(45) DEFAULT '-1',
  `mod24` varchar(45) DEFAULT '-1',
  PRIMARY KEY (`user_id`,`vehicle`),
  UNIQUE KEY `car_id` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  ADD CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
