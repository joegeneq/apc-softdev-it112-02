-- phpMyAdmin SQL Dump
-- version 4.3.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2015 at 02:55 PM
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
  `id` int(11) NOT NULL,
  `company_agency_code` varchar(45) DEFAULT NULL,
  `company_agency_full_name` varchar(45) DEFAULT NULL,
  `company_agency_notes` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_agency`
--

INSERT INTO `company_agency` (`id`, `company_agency_code`, `company_agency_full_name`, `company_agency_notes`, `create_time`, `update_time`) VALUES
(1, 'MNGT-01', 'Management 01', 'asdasd', '2015-03-21 08:40:43', '2015-03-21 16:40:49'),
(2, 'MNGT-02', 'Management 02', 'ewewew', '2015-03-21 08:42:23', '2015-03-21 16:43:46'),
(3, '12345', 'Paolo', '12312', '2015-03-22 11:45:52', '2015-03-22 19:45:57'),
(4, '54321', 'Lopao', 'sdfsdfsdfsdfs', '2015-03-22 11:47:25', '2015-03-22 19:55:55'),
(5, 'fsdfsfsd', '9090', '999', '2015-03-22 12:01:41', '2015-03-22 20:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_lastname` varchar(45) DEFAULT NULL,
  `company_agency_id` int(11) NOT NULL,
  `customer_cell_phone` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_landline` varchar(45) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `customer_lastname`, `company_agency_id`, `customer_cell_phone`, `customer_email`, `customer_landline`, `create_time`, `update_time`) VALUES
(1, 'Paolo', 'pangit', 1, '092364282847', 'kemchii.69@gmail.com', '4327472', '2015-03-21 08:46:50', '2015-03-22 20:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
  `id` int(11) NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `division_description` varchar(32) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `division_name`, `division_description`, `create_time`, `update_time`) VALUES
(1, 'Division 1', 'Division 1 bla bs', '2015-03-21 08:51:47', '2015-03-21 16:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `company_agency_id` int(11) NOT NULL,
  `document_tracking_number` varchar(45) DEFAULT NULL,
  `document_description` varchar(45) DEFAULT NULL,
  `document_category` int(11) NOT NULL,
  `document_priority` varchar(45) DEFAULT NULL,
  `document_target_date` date DEFAULT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `document_notes` varchar(45) DEFAULT NULL,
  `document_image_front_page` blob,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_category`
--

CREATE TABLE IF NOT EXISTS `document_category` (
  `id` int(11) NOT NULL,
  `document_category_name` varchar(45) DEFAULT NULL,
  `document_category_description` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_category`
--

INSERT INTO `document_category` (`id`, `document_category_name`, `document_category_description`, `create_time`, `update_time`) VALUES
(1, 'FILE 1 ', 'THIS IS FILE 1', '2015-03-21 08:57:47', '2015-03-21 16:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `document_seq`
--

CREATE TABLE IF NOT EXISTS `document_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_workflow`
--

CREATE TABLE IF NOT EXISTS `document_workflow` (
  `id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `station_desk_id` int(11) NOT NULL,
  `document_wokflow_comments` text,
  `document_wokflow_status` varchar(45) DEFAULT NULL COMMENT 'Document Workflow Status',
  `time_accepted` timestamp NULL DEFAULT NULL,
  `time_released` timestamp NULL DEFAULT NULL,
  `total_time_spent` time DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_receiver` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL,
  `current_position` int(11) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `current_position`, `last_name`, `first_name`, `create_time`, `update_time`, `user_id`, `division_id`) VALUES
(1, 1, 'Lansigan', 'Paolo Lopao', '2015-03-22 09:25:16', '2015-03-22 17:27:59', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_position`
--

CREATE TABLE IF NOT EXISTS `employee_has_position` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `employee_position_start_date` date DEFAULT NULL,
  `employee_position_end_date` varchar(45) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_station_desk`
--

CREATE TABLE IF NOT EXISTS `employee_has_station_desk` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `station_desk_id` int(11) NOT NULL,
  `station_desk_role_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1426776916),
('m130524_201442_init', 1426776919);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL,
  `position_code` varchar(45) DEFAULT NULL,
  `position_description` varchar(45) DEFAULT NULL,
  `position_notes` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `position_code`, `position_description`, `position_notes`, `create_time`, `update_time`) VALUES
(1, 'sdsds', 'asdasda', 'asdasda', '2015-03-21 07:33:42', '2015-03-21 16:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `station_desk`
--

CREATE TABLE IF NOT EXISTS `station_desk` (
  `id` int(11) NOT NULL,
  `station_desk_code` varchar(45) DEFAULT NULL,
  `station_desk_name` varchar(45) DEFAULT NULL,
  `station_desk_notes` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `division_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station_desk`
--

INSERT INTO `station_desk` (`id`, `station_desk_code`, `station_desk_name`, `station_desk_notes`, `create_time`, `update_time`, `division_id`) VALUES
(1, 'STN-01', 'Station 1', 'This station is a station', '2015-03-21 09:08:47', '2015-03-21 17:08:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `station_desk_role`
--

CREATE TABLE IF NOT EXISTS `station_desk_role` (
  `id` int(11) NOT NULL,
  `station_desk_code` varchar(45) DEFAULT NULL,
  `station_desk_description` varchar(45) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station_desk_role`
--

INSERT INTO `station_desk_role` (`id`, `station_desk_code`, `station_desk_description`, `create_time`, `update_time`) VALUES
(1, 'Station 1', 'Station is station', '2015-03-21 09:11:25', '2015-03-21 17:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bptopacio', 'IPhtC_N3eWDFdJPnNswe12Yhn1GUHJHR', '$2y$13$fnum5645.5p78mSUBAVRQ.33v807OvY9A5oo6gDsB7VLC8Wq6ud5i', NULL, 'bptopacio@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'plansigan', 'jx_MsLhXJwy0Vn9W4a2tLXSQyzcVV6V9', '$2y$13$XZV1dwB5BytIQnKMvbB7ZuDH7qP6Dumko7z.nWF.rpuwWxRIwJzmu', NULL, 'kemchii.69@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'mfrianzares', 'Wo12hFFLPUWLRQowgYhpicKoGigazQC0', '$2y$13$rCFhSEG3uEubpEDwgfJhyuUc87g.PZTgrVZH40D8aDXVdTM7W82UC', NULL, 'markrianzares@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_agency`
--
ALTER TABLE `company_agency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_customer_company_agency1_idx` (`company_agency_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_document_employee1_idx` (`encoded_by`), ADD KEY `fk_document_customer1_idx` (`customer_id`), ADD KEY `fk_document_company_agency1_idx` (`company_agency_id`), ADD KEY `fk_document_document_category1_idx` (`document_category`);

--
-- Indexes for table `document_category`
--
ALTER TABLE `document_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_seq`
--
ALTER TABLE `document_seq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_workflow`
--
ALTER TABLE `document_workflow`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_document_wokflow_document1_idx` (`document_id`), ADD KEY `fk_document_wokflow_employee1_idx` (`employee_id`), ADD KEY `fk_document_wokflow_station_desk1_idx` (`station_desk_id`), ADD KEY `fk_document_workflow_employee1_idx` (`next_receiver`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_employee_position1_idx` (`current_position`), ADD KEY `fk_employee_user1_idx` (`user_id`), ADD KEY `fk_employee_division1_idx` (`division_id`);

--
-- Indexes for table `employee_has_position`
--
ALTER TABLE `employee_has_position`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_employee_has_position_position1_idx` (`position_id`), ADD KEY `fk_employee_has_position_employee1_idx` (`employee_id`);

--
-- Indexes for table `employee_has_station_desk`
--
ALTER TABLE `employee_has_station_desk`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_employee_has_station_desk_station_desk1_idx` (`station_desk_id`), ADD KEY `fk_employee_has_station_desk_employee_idx` (`employee_id`), ADD KEY `fk_employee_has_station_desk_station_desk_role1_idx` (`station_desk_role_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station_desk`
--
ALTER TABLE `station_desk`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_station_desk_division1_idx` (`division_id`);

--
-- Indexes for table `station_desk_role`
--
ALTER TABLE `station_desk_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_agency`
--
ALTER TABLE `company_agency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `document_category`
--
ALTER TABLE `document_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `document_seq`
--
ALTER TABLE `document_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document_workflow`
--
ALTER TABLE `document_workflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_has_position`
--
ALTER TABLE `employee_has_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_has_station_desk`
--
ALTER TABLE `employee_has_station_desk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `station_desk`
--
ALTER TABLE `station_desk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `station_desk_role`
--
ALTER TABLE `station_desk_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
ADD CONSTRAINT `fk_document_document_category1` FOREIGN KEY (`document_category`) REFERENCES `document_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_employee1` FOREIGN KEY (`encoded_by`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `document_workflow`
--
ALTER TABLE `document_workflow`
ADD CONSTRAINT `fk_document_wokflow_document1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_wokflow_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_wokflow_station_desk1` FOREIGN KEY (`station_desk_id`) REFERENCES `station_desk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_workflow_employee1` FOREIGN KEY (`next_receiver`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
ADD CONSTRAINT `fk_employee_division1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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

--
-- Constraints for table `station_desk`
--
ALTER TABLE `station_desk`
ADD CONSTRAINT `fk_station_desk_division1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
