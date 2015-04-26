-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2015 at 09:09 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

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
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'access to backend', NULL, NULL, NULL, NULL),
('normal-user', 2, 'normal user has access to frontend ', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_agency`
--

INSERT INTO `company_agency` (`id`, `company_agency_code`, `company_agency_name`, `company_agency_description`, `create_time`, `update_time`) VALUES
(5, 'DTI', 'Department of Trade and Industry', 'In all these, we adhere strictly to the tenets of professionalism, integrity, and transparency. We continue to be the public''s Agency of Choice, an organization where creativity, innovation, professional and personal growth find full expression.', '2015-03-28 11:49:28', '2015-03-28 20:26:03'),
(6, 'CSC', 'Civil Service Commission', '', '2015-04-15 23:10:00', '2015-04-16 07:10:00'),
(7, 'SC', 'Supreme Court', '', '2015-04-15 23:10:38', '2015-04-16 07:10:38'),
(8, 'NSB', 'National Selection Board', '', '2015-04-15 23:11:57', '2015-04-16 07:11:57'),
(9, 'CESB', 'Career Executive Service Board', '', '2015-04-15 23:12:18', '2015-04-16 07:12:18'),
(10, 'NICA', 'National Intelligence Coordinating Agency', '', '2015-04-15 23:13:13', '2015-04-16 07:13:13'),
(11, 'DBM', 'Department of Budget', '', '2015-04-15 23:13:29', '2015-04-16 07:13:49'),
(12, 'DOF', 'Department of Finance', '', '2015-04-15 23:14:24', '2015-04-16 07:14:24'),
(13, 'PMS', 'Pesidential Management Staff', '', '2015-04-15 23:15:45', '2015-04-16 07:15:45'),
(14, 'PHILHEALTH', 'Philippine Health Insurance Corporation', '', '2015-04-15 23:16:48', '2015-04-16 07:16:48'),
(15, 'Pag-IBIG', 'Home Development Mutual Fund', '', '2015-04-15 23:18:24', '2015-04-16 07:18:24'),
(16, 'Ombudsman', 'Office of the Ombudsman', '', '2015-04-15 23:18:58', '2015-04-16 07:18:58'),
(17, 'NBI', 'National Bureau Invistigations', '', '2015-04-15 23:19:35', '2015-04-16 07:19:35');

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
  `logo` varchar(200) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `document_tracking_number`, `document_name`, `document_description`, `document_target_date`, `document_category`, `document_priority_id`, `document_type_id`, `document_comment`, `employee_id`, `customer_id`, `company_agency_id`, `document_image_front_page`, `logo`, `create_time`, `update_time`, `section_id`) VALUES
(1, '20150421-02-0006', 'Fwfafwa', 'afawfwa', '2015-04-22', 3, 2, 15, 'wfwafwa', 2, 3, 8, NULL, '', '2015-04-21 05:26:50', '2015-04-21 13:26:50', 7),
(2, '20150424-02-0007', 'dfdsfdsf', 'dfdsfdsf', '2015-04-30', 3, 2, 25, 'dsfdsfdsf', 2, 3, 11, NULL, '', '2015-04-24 00:57:10', '2015-04-24 08:57:10', 7),
(3, '20150426-02-0008', 'dfdfe', 'effe', '2015-04-29', 3, 3, 25, 'fefe', 2, 3, 10, NULL, '', '2015-04-26 07:07:26', '2015-04-26 15:07:26', 7);

--
-- Triggers `document`
--
DELIMITER //
CREATE TRIGGER `tg_dtn_insert` BEFORE INSERT ON `document`
 FOR EACH ROW BEGIN

  declare DTN varchar(20); 
  
  INSERT INTO table_seq VALUES (NULL, CURDATE());  
  
  SET DTN = CONCAT(DATE_FORMAT(NOW(), "%Y%m%d-"),
      (SELECT section_number from section where id = NEW.section_id),"-",
      LPAD(LAST_INSERT_ID(), 4, '0'));
  
  SET NEW.document_tracking_number = DTN;
  
END
//
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_category`
--

INSERT INTO `document_category` (`id`, `document_category_name`, `document_category_description`, `create_time`, `update_time`) VALUES
(3, 'Organizational Management ', '', '2015-04-16 00:30:01', '2015-04-16 08:30:01'),
(4, 'Budget Allocation', '', '2015-04-16 00:31:40', '2015-04-16 08:31:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_priority`
--

INSERT INTO `document_priority` (`id`, `document_priority_name`, `document_priority_description`, `create_time`, `update_time`) VALUES
(1, 'Low', '', '2015-03-28 13:33:09', '2015-04-20 11:28:50'),
(2, 'Medium', '', NULL, '2015-04-20 11:28:22'),
(3, 'High', '', NULL, '2015-04-20 11:28:30'),
(4, 'Urgent', '', '2015-04-20 03:28:16', '2015-04-20 11:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE IF NOT EXISTS `document_type` (
`id` int(11) NOT NULL,
  `document_type_name` varchar(255) DEFAULT NULL,
  `document_type_description` text,
  `section_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `document_type_name`, `document_type_description`, `section_id`, `create_time`, `update_time`) VALUES
(13, 'Service Record', '', 10, '2015-04-20 06:34:46', '2015-04-20 14:34:46'),
(14, 'Request for Certification of Employment (COE)', '', 10, '2015-04-20 06:37:27', '2015-04-20 14:37:27'),
(15, 'Subpoena', '', 10, '2015-04-20 06:37:42', '2015-04-20 14:37:42'),
(16, 'Request for Transfer', '', 10, '2015-04-20 06:38:00', '2015-04-20 14:38:00'),
(17, 'RTAO/RSO', '', 10, '2015-04-20 06:41:23', '2015-04-20 14:41:23'),
(18, 'Statement of Asseets, Liabiliteis and Net Wort (SALN)', '', 10, '2015-04-20 06:41:48', '2015-04-20 14:41:48'),
(19, 'Memorandum', '', 7, '2015-04-20 06:42:36', '2015-04-20 14:42:36'),
(20, 'Employment Test Results (ETRs)', '', 7, '2015-04-20 06:43:09', '2015-04-20 14:43:09'),
(21, 'Lineup of Candidates', '', 7, '2015-04-20 06:43:38', '2015-04-20 14:43:38'),
(22, 'Forced Rank List (FRL)', '', 7, '2015-04-20 06:43:59', '2015-04-20 14:43:59'),
(24, '1st Checklist ', '', 7, '2015-04-20 06:45:34', '2015-04-20 14:45:34'),
(25, '2nd Checklist', '', 7, '2015-04-20 06:45:51', '2015-04-20 14:45:51'),
(26, 'Authority to Report (docket)', '', 7, '2015-04-20 06:46:09', '2015-04-20 14:46:09'),
(27, 'Payroll Endorsement / Payroll Adjustment', '', 7, '2015-04-20 06:46:35', '2015-04-20 14:46:35'),
(28, 'Obligation Request / Disbursement Voucher', '', 7, '2015-04-20 06:47:15', '2015-04-20 14:47:15'),
(29, 'Report on Appointments Issued (RAI)', '', 7, '2015-04-20 06:48:22', '2015-04-20 14:48:22'),
(30, 'Probationary Report', '', 7, '2015-04-20 06:48:36', '2015-04-20 14:48:36'),
(31, 'List of Promotables', '', 7, '2015-04-20 06:48:49', '2015-04-20 14:48:49'),
(32, 'Appointments', '', 7, '2015-04-20 06:49:41', '2015-04-20 14:49:41'),
(33, 'Report on Signed Appointments', '', 7, '2015-04-20 06:50:02', '2015-04-20 14:50:02'),
(34, 'Publication', '', 7, '2015-04-20 06:50:12', '2015-04-20 14:50:12'),
(35, 'Plantilla of Report', '', 7, '2015-04-20 06:50:30', '2015-04-20 14:50:30'),
(36, 'RAT PLAN Report', '', 7, '2015-04-20 06:50:56', '2015-04-20 14:50:56'),
(37, 'NOSCA (Notice of Organization, Staffing and Compensation Action)', '', 7, '2015-04-20 06:51:43', '2015-04-20 14:51:43'),
(38, 'NOSA (Notice of Salary Adjustment)', '', 7, '2015-04-20 06:52:03', '2015-04-20 14:52:03'),
(39, 'Notice of Accommodation to the same item number, change in item number, reappointment', '', 7, '2015-04-20 06:52:45', '2015-04-20 14:52:45'),
(40, 'Regret Letters to Applicants', '', 7, '2015-04-20 06:53:30', '2015-04-20 14:53:30'),
(41, 'Memorandum', '', 11, '2015-04-20 06:54:35', '2015-04-20 14:54:35'),
(42, 'Indorsement', '', 11, '2015-04-20 06:54:56', '2015-04-20 14:54:56'),
(43, 'Request Letter', '', 11, '2015-04-20 06:55:12', '2015-04-20 14:55:12'),
(44, 'BIR E-Card', '', 11, '2015-04-20 06:55:26', '2015-04-20 14:55:26'),
(45, 'Ref. Slip from CBS', '', 11, '2015-04-20 06:55:41', '2015-04-20 14:55:41'),
(46, 'LDDAP', '', 11, '2015-04-20 06:55:58', '2015-04-20 14:55:58'),
(47, 'Hard Copies of Payroll Registers', '', 11, '2015-04-20 06:56:18', '2015-04-20 14:56:18'),
(48, 'Call-Up Letter', '', 11, '2015-04-20 06:57:06', '2015-04-20 14:57:06'),
(49, 'Report', '', 11, '2015-04-20 06:57:23', '2015-04-20 14:57:23'),
(50, 'Request of Funding', '', 11, '2015-04-20 06:57:42', '2015-04-20 14:57:42'),
(51, 'Certification', '', 11, '2015-04-20 06:58:51', '2015-04-20 14:58:51'),
(52, 'Payroll Register', '', 11, '2015-04-20 06:59:12', '2015-04-20 14:59:12'),
(53, 'General Office Payroll', '', 11, '2015-04-20 06:59:36', '2015-04-20 14:59:36'),
(54, 'Individual Claim', '', 11, '2015-04-20 06:59:52', '2015-04-20 14:59:52');

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
  `document_workflow_status_id` int(11) NOT NULL,
  `time_accepted` datetime DEFAULT NULL,
  `time_released` datetime NOT NULL,
  `total_time_spent` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `employee_id1` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_workflow`
--

INSERT INTO `document_workflow` (`id`, `document_id`, `employee_id`, `station_desk_id`, `document_wokflow_comments`, `document_workflow_status_id`, `time_accepted`, `time_released`, `total_time_spent`, `create_time`, `update_time`, `employee_id1`) VALUES
(1, 1, 2, 2, 'fefefe', 1, '2015-04-21 13:27:47', '2015-04-26 13:30:01', '5day/s,00hour/s 02min/s 14s', '2015-04-21 13:27:47', '2015-04-26 13:30:01', 4),
(2, 1, 3, 4, 'jyjygj', 1, NULL, '2015-04-26 13:50:24', NULL, '2015-04-26 13:50:03', '2015-04-26 13:50:24', 2),
(3, 1, 4, 5, '', 2, '2015-04-26 14:27:51', '2015-04-26 14:28:27', '0day/s,00hour/s 00min/s 36s', '2015-04-26 14:27:51', '2015-04-26 14:28:27', 2),
(4, 1, 4, 4, 'ffef', 1, '2015-04-26 14:31:43', '2015-04-26 14:31:43', NULL, '2015-04-26 14:31:43', '2015-04-26 14:31:43', 2),
(5, 1, 3, 3, '', 1, '2015-04-26 14:37:25', '2015-04-26 14:37:25', NULL, '2015-04-26 14:37:25', '2015-04-26 14:37:25', 2),
(6, 1, 3, 4, '', 2, '2015-04-26 14:42:00', '2015-04-26 14:42:24', '0day/s,00hour/s 00min/s 24s', '2015-04-26 14:42:00', '2015-04-26 14:42:24', 3),
(7, 1, 3, 3, '', 1, '2015-04-26 14:45:27', '2015-04-26 14:45:41', '0day/s,00hour/s 00min/s 14s', '2015-04-26 14:45:27', '2015-04-26 14:45:41', 2);

--
-- Triggers `document_workflow`
--
DELIMITER //
CREATE TRIGGER `tg_insert_total_time` BEFORE UPDATE ON `document_workflow`
 FOR EACH ROW BEGIN

  declare DTN varchar(20); 
  declare day varchar(20);
  declare oras varchar(20);
  
  SET oras = (SELECT DATE_FORMAT(TIMEDIFF(NEW.time_released, NEW.time_accepted), "%Hhour/s %imin/s %ssec/s"));
  SET day = (SELECT DATEDIFF(DATE_FORMAT(NEW.time_released, "%Y-%m-%d"), DATE_FORMAT(NEW.time_accepted, "%Y-%m-%d")));
  
  
  SET NEW.total_time_spent = CONCAT(day, "day/s,", oras);
  
  
END
//
DELIMITER ;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_workflow_status`
--

INSERT INTO `document_workflow_status` (`id`, `document_workflow_status_name`, `document_workflow_status_description`, `create_time`, `update_time`) VALUES
(1, 'Ongoing', 'thjomvmdgbrbbdrfb', '2015-03-28 15:31:32', '2015-03-28 23:31:32'),
(2, 'Finished', 'The document is being released', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_id_number`, `employee_last_name`, `employee_first_name`, `current_position`, `section_id`, `create_time`, `update_time`, `user_id`) VALUES
(2, '2015-00001', 'Topacio', 'Bernard', 2, 6, '2015-04-15 23:04:34', '2015-04-16 07:04:34', 3),
(3, '2015-00002', 'Lansigan', 'Paolo', 2, 7, '2015-04-15 23:05:02', '2015-04-16 07:05:02', 4),
(4, '2015-00003', 'Rianzares', 'Mark', 2, 9, '2015-04-15 23:05:21', '2015-04-16 07:05:21', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_has_position`
--

INSERT INTO `employee_has_position` (`id`, `employee_id`, `position_id`, `employee_position_start_date`, `employee_position_end_date`, `create_time`, `update_time`) VALUES
(1, 2, 2, '2015-04-06', '2016-06-21', '2015-04-15 23:08:27', '2015-04-16 07:08:27'),
(2, 3, 2, '2015-04-14', '2016-07-20', '2015-04-15 23:08:43', '2015-04-16 07:08:43'),
(3, 4, 2, '2015-04-14', '2016-06-29', '2015-04-15 23:08:59', '2015-04-16 07:08:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `position_code`, `position_name`, `position_description`, `position_notes`, `create_time`, `update_time`) VALUES
(1, 'OP', 'Opeaning Position', 'fisnenfens', 'effsfesfsef', '2015-03-28 16:21:15', '2015-03-29 00:21:15'),
(2, 'RCV', 'Reciever ', 'Receives Documents ', '', '2015-04-15 23:03:11', '2015-04-16 07:03:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `section_number`, `section_code`, `section_name`, `section_description`, `create_time`, `update_time`) VALUES
(6, '01', 'CM', 'Career Management', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2015-04-15 22:54:00', '2015-04-16 06:54:00'),
(7, '02', 'MM', 'Manpower Management Section', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2015-04-15 22:54:17', '2015-04-16 06:54:17'),
(8, '03', 'PM', 'Performance Evaluation and Management', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2015-04-15 22:54:34', '2015-04-16 06:54:34'),
(9, '04', 'CB', 'Compensation and Benefits', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2015-04-15 22:54:55', '2015-04-16 06:54:55'),
(10, '05', 'IR', 'Information and Records', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2015-04-15 22:55:16', '2015-04-16 06:55:16'),
(11, '06', 'PR', 'Payroll', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2015-04-15 22:55:39', '2015-04-16 06:55:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station_desk`
--

INSERT INTO `station_desk` (`id`, `station_desk_code`, `station_desk_name`, `station_desk_notes`, `create_time`, `update_time`, `section_id`) VALUES
(2, 'RCV-01', 'Recieving Station', 'Station to receives document  ', '2015-04-15 23:06:27', '2015-04-16 07:06:27', 6),
(3, 'RCV-02', 'Recieving Station', 'Station to receives document ', '2015-04-15 23:06:52', '2015-04-16 07:06:52', 7),
(4, 'RCV-03', 'Recieving Station', 'Station to receives document ', '2015-04-15 23:07:02', '2015-04-16 07:07:02', 8),
(5, 'RCV-04', 'Recieving Station', 'Station to receives document ', '2015-04-15 23:07:23', '2015-04-16 07:07:23', 9),
(6, 'RCV-05', 'Recieving Station', 'Station to receives document ', '2015-04-15 23:07:35', '2015-04-16 07:07:35', 10),
(7, 'RCV-06', 'Recieving Station', 'Station to receives document ', '2015-04-15 23:07:46', '2015-04-16 07:07:46', 11);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
  `time_stamp` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_seq`
--

INSERT INTO `table_seq` (`id`, `time_stamp`) VALUES
(1, '2015-04-16'),
(2, '2015-04-16'),
(3, '2015-04-17'),
(4, '2015-04-17'),
(5, '2015-04-17'),
(6, '2015-04-21'),
(7, '2015-04-24'),
(8, '2015-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'mfrianzares', NULL, 'x8HM9FKRdDBpRwOIaCxM888yZ5LBE2U9', '$2y$13$FfYJcsG4sxF7mFNydxXsSuGPwJo5lwE2.FRiFxVi1LztUELMMRfRy', '', 'mfrianzares@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'bptopacio', NULL, '6P8JJJPAXnuIFrjFphypqXTMa_tfVZ-f', '$2y$13$IwUALhy5UrzKn/i7ty.GjejfE2MJ.n7XvL8w0Q/uSQbkcmj1JtMg6', '', 'bptopacio@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'pglansigan', NULL, 'tUwgRE_tqD9aratYXzjg_pmGl_RW7qsY', '$2y$13$oeRPErCETJctvjJSoOlRhui24GFDCYOHL6Hmp5kjAFr4yHqMJU4NK', '', 'pglansigan@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'admin1', NULL, 'FNAHm5H9mnbXX_OjhAGC4-4YcUkzYTSE', '$2y$13$AIBhh0cuIcuHePuQ3BlTkuL.aOC5JvepdRXizflD.SYju9wCLapPO', '', 'admin@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'admin2', NULL, '0I2jjmgr9mThf4ddT2e6MDY5FUZFpGLZ', '$2y$13$uLVVHdjoOgCSHPBslX2tIey4SPZLgTvxRZ7/agylJTQRbzFqVBuOq', '', 'admin2@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'admin3', NULL, 'XwKUFs3P7ALqaUiX04uRUCgHY0qCQLbD', '$2y$13$SwobQo9GA.5/LA/k5ShgXOUuyqo/VN9roPOZnepzbIxNqj416XOWy', '', 'admin3@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'admin4', NULL, 'tBoj7tiF9oerrZTvAe3gykZutdOBh2sT', '$2y$13$XRTGPFFgHw2vx5uxSBahEeyy8RxtmRv/.7wlXs2JRc0tNtnuU4yzu', '', 'admin4@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'user1', NULL, 'Tj61ToH7G2lTJpeNNvep_kiUcyYd1tIH', '$2y$13$cwMoXm3IMfRJ7NnpFKoy2u9ZdqkqHwERFwdXbgIqMM3J0SUDf1/8G', '', 'user1@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'user2', NULL, '-CPqbmOS3aQGGYm-zbK3TCdq2VFzf845', '$2y$13$qTaJeg/bmPgZ5SwqM2RmfOFhrAAsXTLQebu0ZhbjWJRufOi0VjN0a', '', 'user2@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'user3', NULL, 'P8_9JyYUZy9J-pVVOnI4q0kM-T2ED7y9', '$2y$13$Nj5N7TAjWdz4DF8LupiZ2.UKZjZfZeVSlHlTWuC7eOn9rLqQ9/KZG', '', 'user3@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'user4', NULL, 'z68OSuXkkQKSrhJXhVyi00-wG5rxQ4a_', '$2y$13$RWW8V.Yu9dRZgic50z4v0.w2YgdfMgM9LdHmPXN8KE3vtjrXx7ou.', '', 'user4@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'user5', NULL, 'dgipiMg512NMWGz0cG9xwOiBUx8_rx1p', '$2y$13$PZ46m2jYdPWCcL29R2O5ge166dgYpjM5MMNnnawP2DwMzOmCM5pzm', '', 'user5@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'user6', NULL, 'BB6pKACYVn4YW0iZ3Jf7j7qdZj2NGz7e', '$2y$13$20eV0hB3xdCq4FdON8sSCOtER3l3l4o32aanjZFEKqTNXYAM71c.C', '', 'user6@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'user7', NULL, 'gN8fOB4NpW22yRt1fi_N4QJAo2WlfUrZ', '$2y$13$l8eBkk3T6SUDG373mjGigO6CStTIQkCZRRvtsidlv2mbzmxeHcrvq', '', 'user7@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'user8', NULL, 'X6b8iGAEWhS3v7i4gpVTWbpO3NDfboR5', '$2y$13$4QpjIELpu2Zqpp4.az1r.Ot7UrwMgbU5qTOPPNytUFJxlDINMMqT2', '', 'user8@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'user9', NULL, '2AIAahxzo-CJwWrdVrXi85QxRU0iST3C', '$2y$13$W5Lyl25OsdoxLpDYYBB8SOuYEN0.y7b3FkHMEQTvdn/.Eq86VPdX2', '', 'user9@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'user10', NULL, 'zl18_BPqDF62V7eSTayZVdmoDduVWymK', '$2y$13$BO6KoAKiOmR0/jecHUJm2.AbSZmdsqMZHaxUN2OcaD667.YS4Nnma', '', 'user10@gmail.com', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
 ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `rule_name` (`rule_name`), ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
 ADD PRIMARY KEY (`name`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `document_workflow`
--
ALTER TABLE `document_workflow`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_document_wokflow_document1_idx` (`document_id`), ADD KEY `fk_document_wokflow_employee1_idx` (`employee_id`), ADD KEY `fk_document_wokflow_station_desk1_idx` (`station_desk_id`), ADD KEY `fk_document_workflow_employee1_idx` (`employee_id1`), ADD KEY `fk_document_workflow_document_status1_idx` (`document_workflow_status_id`);

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
-- Indexes for table `table_seq`
--
ALTER TABLE `table_seq`
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `document_category`
--
ALTER TABLE `document_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `document_priority`
--
ALTER TABLE `document_priority`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `document_workflow`
--
ALTER TABLE `document_workflow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `document_workflow_status`
--
ALTER TABLE `document_workflow_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employee_has_position`
--
ALTER TABLE `employee_has_position`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee_has_station_desk`
--
ALTER TABLE `employee_has_station_desk`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `station_desk`
--
ALTER TABLE `station_desk`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `station_desk_role`
--
ALTER TABLE `station_desk_role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `table_seq`
--
ALTER TABLE `table_seq`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `document_type`
--
ALTER TABLE `document_type`
ADD CONSTRAINT `document_type_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);

--
-- Constraints for table `document_workflow`
--
ALTER TABLE `document_workflow`
ADD CONSTRAINT `fk_document_wokflow_document1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_wokflow_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_wokflow_station_desk1` FOREIGN KEY (`station_desk_id`) REFERENCES `station_desk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_document_workflow_document_status1` FOREIGN KEY (`document_workflow_status_id`) REFERENCES `document_workflow_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `e_daily` ON SCHEDULE EVERY 1 DAY STARTS '2015-04-27 00:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Descriptive comment' DO TRUNCATE table_seq$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
