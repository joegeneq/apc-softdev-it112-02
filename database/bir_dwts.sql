-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2015 at 02:05 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bir_dwts`
--

-- --------------------------------------------------------

--
-- Table structure for table `company_agency`
--

CREATE TABLE IF NOT EXISTS `company_agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `company_agency_code` varchar(45) DEFAULT NULL,
  `company_agency_full_name` varchar(45) DEFAULT NULL,
  `company_agency_notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_lastname` varchar(45) DEFAULT NULL,
  `company_agency_id` int(11) NOT NULL,
  `customer_cell_phone` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_landline` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_company_agency1_idx` (`company_agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `encoded_by` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `company_agency_id` int(11) DEFAULT NULL,
  `document_tracking_number` varchar(45) DEFAULT NULL,
  `document_description` varchar(45) DEFAULT NULL,
  `document_priority` varchar(45) DEFAULT NULL,
  `document_category` varchar(45) DEFAULT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `document_notes` varchar(45) DEFAULT NULL,
  `document_image_front_page` blob,
  PRIMARY KEY (`id`),
  KEY `fk_document_employee1_idx` (`encoded_by`),
  KEY `fk_document_customer1_idx` (`customer_id`),
  KEY `fk_document_company_agency1_idx` (`company_agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `document_workflow`
--

CREATE TABLE IF NOT EXISTS `document_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `station_desk_id` int(11) NOT NULL,
  `document_wokflow_comments` text,
  `document_wokflow_status` varchar(45) DEFAULT NULL COMMENT 'Document Workflow Status',
  `time_accepted` timestamp NULL DEFAULT NULL,
  `time_released` timestamp NULL DEFAULT NULL,
  `total_time_spent` time DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_wokflow_document1_idx` (`document_id`),
  KEY `fk_document_wokflow_employee1_idx` (`employee_id`),
  KEY `fk_document_wokflow_station_desk1_idx` (`station_desk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_position` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_position1_idx` (`current_position`),
  KEY `fk_employee_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `current_position`, `name`, `first_name`, `create_time`, `update_time`, `user_id`) VALUES
(1, 1, 'bernard topacio', 'bernard', '2015-03-04 23:33:28', '2015-03-04 23:33:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_position`
--

CREATE TABLE IF NOT EXISTS `employee_has_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `employee_position_start_date` date DEFAULT NULL,
  `employee_position_end_date` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_has_position_position1_idx` (`position_id`),
  KEY `fk_employee_has_position_employee1_idx` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employee_has_position`
--

INSERT INTO `employee_has_position` (`id`, `employee_id`, `position_id`, `employee_position_start_date`, `employee_position_end_date`, `create_time`, `update_time`) VALUES
(1, 1, 1, '2015-03-05', NULL, '2015-03-04 23:36:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_station_desk`
--

CREATE TABLE IF NOT EXISTS `employee_has_station_desk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `station_desk_id` int(11) NOT NULL,
  `station_desk_role_id` int(11) NOT NULL,
  `time_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_has_station_desk_station_desk1_idx` (`station_desk_id`),
  KEY `fk_employee_has_station_desk_employee_idx` (`employee_id`),
  KEY `fk_employee_has_station_desk_station_desk_role1_idx` (`station_desk_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1425459770),
('m130524_201442_init', 1425459773);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_code` varchar(45) DEFAULT NULL,
  `position_description` varchar(45) DEFAULT NULL,
  `position_notes` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `position_code`, `position_description`, `position_notes`, `create_time`, `update_time`) VALUES
(1, 'positioncode1', 'Head Desk', 'first to take document', '2015-03-04 23:31:43', '2015-03-04 23:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `station_desk`
--

CREATE TABLE IF NOT EXISTS `station_desk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_desk_code` varchar(45) DEFAULT NULL,
  `station_desk_name` varchar(45) DEFAULT NULL,
  `station_desk_notes` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `station_desk_role`
--

CREATE TABLE IF NOT EXISTS `station_desk_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_desk_code` varchar(45) DEFAULT NULL,
  `station_desk_description` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bptopacio', '-R76iQI-C3lCSqdVW1Vy-ycP6NY9c2NT', '$2y$13$kUlkIh3yeJgYlirq8RItHu.ZazMW0mp6WEW79KBWlLYdVgyMsqK0.', NULL, 'bptopacio@gmail.com', 10, 1425459827, 1425459827);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_company_agency1` FOREIGN KEY (`company_agency_id`) REFERENCES `company_agency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_document_company_agency1` FOREIGN KEY (`company_agency_id`) REFERENCES `company_agency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_document_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_document_employee1` FOREIGN KEY (`encoded_by`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `document_workflow`
--
ALTER TABLE `document_workflow`
  ADD CONSTRAINT `fk_document_wokflow_document1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_document_wokflow_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_document_wokflow_station_desk1` FOREIGN KEY (`station_desk_id`) REFERENCES `station_desk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_position1` FOREIGN KEY (`current_position`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_has_position`
--
ALTER TABLE `employee_has_position`
  ADD CONSTRAINT `fk_employee_has_position_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_has_position_position1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_has_station_desk`
--
ALTER TABLE `employee_has_station_desk`
  ADD CONSTRAINT `fk_employee_has_station_desk_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_has_station_desk_station_desk1` FOREIGN KEY (`station_desk_id`) REFERENCES `station_desk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_has_station_desk_station_desk_role1` FOREIGN KEY (`station_desk_role_id`) REFERENCES `station_desk_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
