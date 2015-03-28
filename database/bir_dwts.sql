-- phpMyAdmin SQL Dump
-- version 4.3.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2015 at 03:12 PM
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
  `company_agency_name` varchar(45) DEFAULT NULL,
  `company_agency_description` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_agency`
--

INSERT INTO `company_agency` (`id`, `company_agency_code`, `company_agency_name`, `company_agency_description`, `create_time`, `update_time`) VALUES
(5, 'DTI', 'Department of Trade and Industry', 'In all these, we adhere strictly to the tenets of professionalism, integrity, and transparency. We continue to be the public''s Agency of Choice, an organization where creativity, innovation, professional and personal growth find full expression.', '2015-03-28 11:49:28', '2015-03-28 20:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL,
  `customer_lastname` varchar(45) DEFAULT NULL,
  `customer_firstname` varchar(45) DEFAULT NULL,
  `company_agency_id` int(11) NOT NULL,
  `customer_cell_phone` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_landline` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_lastname`, `customer_firstname`, `company_agency_id`, `customer_cell_phone`, `customer_email`, `customer_landline`, `create_time`, `update_time`) VALUES
(3, 'Philip', 'John', 5, '0922-432-112', 'jsphilip@gmail.com', '0925621926', '2015-03-28 12:30:20', '2015-03-28 20:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL,
  `document_tracking_number` varchar(45) DEFAULT NULL,
  `document_name` varchar(45) DEFAULT NULL,
  `document_description` varchar(45) DEFAULT NULL,
  `document_target_date` date DEFAULT NULL,
  `document_category` int(11) NOT NULL,
  `document_priority_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `document_comment` varchar(45) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `company_agency_id` int(11) NOT NULL,
  `document_image_front_page` blob,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_category`
--

CREATE TABLE IF NOT EXISTS `document_category` (
  `id` int(11) NOT NULL,
  `document_category_name` varchar(45) DEFAULT NULL,
  `document_category_description` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_category`
--

INSERT INTO `document_category` (`id`, `document_category_name`, `document_category_description`, `create_time`, `update_time`) VALUES
(1, 'Paru', 'this category', NULL, NULL),
(2, 'Category ', 'fgsgdfsdf', '2015-03-28 13:00:05', '2015-03-28 21:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `document_priority`
--

CREATE TABLE IF NOT EXISTS `document_priority` (
  `id` int(11) NOT NULL,
  `document_priority_name` varchar(45) DEFAULT NULL,
  `document_priority_description` text,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_priority`
--

INSERT INTO `document_priority` (`id`, `document_priority_name`, `document_priority_description`, `create_time`, `update_time`) VALUES
(1, 'Meduim', 'blah', '2015-03-28 13:33:09', '2015-03-28 21:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE IF NOT EXISTS `document_type` (
  `id` int(11) NOT NULL,
  `document_type_name` varchar(45) DEFAULT NULL,
  `document_type_description` text,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `document_type_name`, `document_type_description`, `create_time`, `update_time`) VALUES
(2, 'Services', 'docu', '2015-03-28 13:27:24', '2015-03-28 21:27:24');

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
  `document_status_id` int(11) NOT NULL,
  `time_accepted` timestamp NULL DEFAULT NULL,
  `time_released` timestamp NULL DEFAULT NULL,
  `total_time_spent` time DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `employee_id1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_workflow_status`
--

CREATE TABLE IF NOT EXISTS `document_workflow_status` (
  `id` int(11) NOT NULL,
  `document_workflow_status_name` varchar(45) DEFAULT NULL,
  `document_workflow_status_description` text,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL,
  `employee_id_number` varchar(45) DEFAULT NULL,
  `employee_last_name` varchar(45) DEFAULT NULL,
  `employee_first_name` varchar(45) DEFAULT NULL,
  `current_position` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_position`
--

CREATE TABLE IF NOT EXISTS `employee_has_position` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `employee_position_start_date` date DEFAULT NULL,
  `employee_position_end_date` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
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
  `created_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL,
  `position_code` varchar(45) DEFAULT NULL,
  `position_name` varchar(45) DEFAULT NULL,
  `position_description` text,
  `position_notes` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `id` int(11) NOT NULL,
  `section_number` varchar(45) DEFAULT NULL,
  `section_code` varchar(45) DEFAULT NULL,
  `section_name` varchar(45) NOT NULL,
  `section_description` text NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station_desk`
--

CREATE TABLE IF NOT EXISTS `station_desk` (
  `id` int(11) NOT NULL,
  `station_desk_code` varchar(45) DEFAULT NULL,
  `station_desk_name` varchar(45) DEFAULT NULL,
  `station_desk_notes` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station_desk_role`
--

CREATE TABLE IF NOT EXISTS `station_desk_role` (
  `id` int(11) NOT NULL,
  `station_desk_role_code` varchar(45) DEFAULT NULL,
  `station_desk_role_name` varchar(45) DEFAULT NULL,
  `station_desk_role_description` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `user_type`, `created_time`, `update_time`) VALUES
(1, 'bptopacio', 'qwerty', NULL, NULL, NULL);

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
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_document_employee1_idx` (`employee_id`), ADD KEY `fk_document_customer1_idx` (`customer_id`), ADD KEY `fk_document_company_agency1_idx` (`company_agency_id`), ADD KEY `fk_document_document_category1_idx` (`document_category`), ADD KEY `fk_document_document_priority1_idx` (`document_priority_id`), ADD KEY `fk_document_document_type1_idx` (`document_type_id`), ADD KEY `fk_document_section1_idx` (`section_id`);

--
-- Indexes for table `document_category`
--
ALTER TABLE `document_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_priority`
--
ALTER TABLE `document_priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_workflow`
--
ALTER TABLE `document_workflow`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_document_wokflow_document1_idx` (`document_id`), ADD KEY `fk_document_wokflow_employee1_idx` (`employee_id`), ADD KEY `fk_document_wokflow_station_desk1_idx` (`station_desk_id`), ADD KEY `fk_document_workflow_employee1_idx` (`employee_id1`), ADD KEY `fk_document_workflow_document_status1_idx` (`document_status_id`);

--
-- Indexes for table `document_workflow_status`
--
ALTER TABLE `document_workflow_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_employee_position1_idx` (`current_position`), ADD KEY `fk_employee_division1_idx` (`section_id`), ADD KEY `fk_employee_user1_idx` (`user_id`);

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
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station_desk`
--
ALTER TABLE `station_desk`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_station_desk_division1_idx` (`section_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document_category`
--
ALTER TABLE `document_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `document_priority`
--
ALTER TABLE `document_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `document_workflow`
--
ALTER TABLE `document_workflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `station_desk`
--
ALTER TABLE `station_desk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `station_desk_role`
--
ALTER TABLE `station_desk_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
ADD CONSTRAINT `fk_document_document_priority1` FOREIGN KEY (`document_priority_id`) REFERENCES `document_priority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_document_type1` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `document_workflow`
--
ALTER TABLE `document_workflow`
ADD CONSTRAINT `fk_document_wokflow_document1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_wokflow_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_wokflow_station_desk1` FOREIGN KEY (`station_desk_id`) REFERENCES `station_desk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_workflow_document_status1` FOREIGN KEY (`document_status_id`) REFERENCES `document_workflow_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_workflow_employee1` FOREIGN KEY (`employee_id1`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
ADD CONSTRAINT `fk_employee_division1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
ADD CONSTRAINT `fk_station_desk_division1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
