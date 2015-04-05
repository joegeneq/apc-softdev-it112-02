-- phpMyAdmin SQL Dump
-- version 4.3.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2015 at 02:47 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `TruncateTable`()
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
    TRUNCATE table_seq;
END$$

DELIMITER ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `logo` varchar(200) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `document_tracking_number`, `document_name`, `document_description`, `document_target_date`, `document_category`, `document_priority_id`, `document_type_id`, `document_comment`, `employee_id`, `customer_id`, `company_agency_id`, `document_image_front_page`, `logo`, `create_time`, `update_time`, `section_id`) VALUES
(1, '32343432432', 'dsa', 'fefe', '0000-00-00', 2, 1, 2, 'fefes', 1, 3, 5, '', '', '2015-03-29 01:34:29', '2015-03-29 16:42:15', 4),
(65, '2015040502003', 'qgqgq', 'egqegw', '2015-04-05', 2, 1, 2, 'afas', 1, 3, 5, NULL, '', '2015-04-05 07:19:35', '2015-04-05 15:19:35', 5),
(66, '2015040502004', 'BER', 'dsdfsdffhgfhrssvs', '2015-04-15', 2, 1, 2, '', 1, 3, 5, NULL, '', '2015-04-05 11:49:26', '2015-04-05 19:49:26', 5);

--
-- Triggers `document`
--
DELIMITER $$
CREATE TRIGGER `tg_dtn_insert` BEFORE INSERT ON `document`
 FOR EACH ROW BEGIN

  declare DTN varchar(20); 
  
  INSERT INTO table_seq VALUES (NULL, CURDATE());  
  
  SET DTN = CONCAT(DATE_FORMAT(NOW(), "%Y%m%d"),
      (SELECT section_number from section where id = NEW.section_id),
      LPAD(LAST_INSERT_ID(), 3, '0'));
  
  SET NEW.document_tracking_number = DTN;
  
END
$$
DELIMITER ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `document_workflow`
--

INSERT INTO `document_workflow` (`id`, `document_id`, `employee_id`, `station_desk_id`, `document_wokflow_comments`, `document_status_id`, `time_accepted`, `time_released`, `total_time_spent`, `create_time`, `update_time`, `employee_id1`) VALUES
(1, 1, 1, 1, 'sdfsdfsefes', 1, NULL, NULL, NULL, '2015-03-29 01:39:10', '2015-03-29 09:39:10', 1);

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

--
-- Dumping data for table `document_workflow_status`
--

INSERT INTO `document_workflow_status` (`id`, `document_workflow_status_name`, `document_workflow_status_description`, `create_time`, `update_time`) VALUES
(1, 'Ongoing', 'thjomvmdgbrbbdrfb', '2015-03-28 15:31:32', '2015-03-28 23:31:32');

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

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_id_number`, `employee_last_name`, `employee_first_name`, `current_position`, `section_id`, `create_time`, `update_time`, `user_id`) VALUES
(1, '4544234', 'Topacio', 'Bernard', 1, 4, '2015-03-28 16:35:59', '2015-03-29 00:35:59', 1);

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
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_has_station_desk`
--

INSERT INTO `employee_has_station_desk` (`id`, `employee_id`, `station_desk_id`, `station_desk_role_id`, `create_time`, `update_time`) VALUES
(1, 1, 1, 1, '2015-03-29 01:21:37', '2015-03-29 09:21:37');

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

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `position_code`, `position_name`, `position_description`, `position_notes`, `create_time`, `update_time`) VALUES
(1, 'OP', 'Opeaning Position', 'fisnenfens', 'effsfesfsef', '2015-03-28 16:21:15', '2015-03-29 00:21:15');

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

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `section_number`, `section_code`, `section_name`, `section_description`, `create_time`, `update_time`) VALUES
(4, '01', 'PSN', 'PeopleSection', 'regregregregreg', '2015-03-28 16:05:53', '2015-03-29 00:05:53'),
(5, '02', 'SMSGT', 'IAmLegend', 'para sa kinabukasan', '2015-03-28 16:05:53', '2015-03-29 00:05:53');

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

--
-- Dumping data for table `station_desk`
--

INSERT INTO `station_desk` (`id`, `station_desk_code`, `station_desk_name`, `station_desk_notes`, `create_time`, `update_time`, `section_id`) VALUES
(1, 'STND', 'station desk 1 ', 'dfsfdgdgwfdgrgfrdh', '2015-03-28 16:41:50', '2015-03-29 00:41:50', 4);

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

--
-- Dumping data for table `station_desk_role`
--

INSERT INTO `station_desk_role` (`id`, `station_desk_role_code`, `station_desk_role_name`, `station_desk_role_description`, `create_time`, `update_time`) VALUES
(1, 'DNN', 'Desk Na Na', 'sesfesfsef', '2015-03-28 16:43:44', '2015-03-29 00:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `table_seq`
--

CREATE TABLE IF NOT EXISTS `table_seq` (
  `id` int(11) NOT NULL,
  `time_stamp` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_seq`
--

INSERT INTO `table_seq` (`id`, `time_stamp`) VALUES
(1, '2015-04-06'),
(3, '2015-04-05'),
(4, '2015-04-05');

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
(3, 'mfrianzares', 'Wo12hFFLPUWLRQowgYhpicKoGigazQC0', '$2y$13$rCFhSEG3uEubpEDwgfJhyuUc87g.PZTgrVZH40D8aDXVdTM7W82UC', NULL, 'markrianzares@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'test', 'nSpv2sRWp57vA1E8bXeNEw60I1R2_p_U', '$2y$13$/YaybwakF/65cr/m/mazWOfOiras4MHz/p7OrkdJVSYC/RSq2wVde', NULL, 'test@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
