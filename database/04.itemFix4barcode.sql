-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.44-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for pos
CREATE DATABASE IF NOT EXISTS `pos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pos`;


-- Dumping structure for table pos.ospos_app_config
CREATE TABLE IF NOT EXISTS `ospos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_app_config: ~40 rows (approximately)
DELETE FROM `ospos_app_config`;
/*!40000 ALTER TABLE `ospos_app_config` DISABLE KEYS */;
INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
	('address', 'Alamat : Desa Cicadas Kec. Gunung Putri Kabupaten Bogor - Jawa Barat Indonesia, 16964'),
	('barcode_content', 'id'),
	('barcode_first_row', 'category'),
	('barcode_font', 'Arial'),
	('barcode_font_size', '10'),
	('barcode_height', '50'),
	('barcode_num_in_row', '2'),
	('barcode_page_cellspacing', '20'),
	('barcode_page_width', '100'),
	('barcode_quality', '100'),
	('barcode_second_row', 'item_code'),
	('barcode_third_row', 'cost_price'),
	('barcode_type', 'id'),
	('barcode_width', '250'),
	('company', 'PT. HSI'),
	('company_logo', ''),
	('default_sales_discount', '0'),
	('default_tax_rate', '8'),
	('email', 'marketing@pthsi.com'),
	('fax', ''),
	('invoice_default_comments', 'This is a default comment'),
	('invoice_email_message', 'Dear $CU, In attachment the receipt for sale $INV'),
	('lines_per_page', '25'),
	('phone', '+62218671739'),
	('print_bottom_margin', '0'),
	('print_footer', '0'),
	('print_header', '0'),
	('print_left_margin', '0'),
	('print_right_margin', '0'),
	('print_silently', '1'),
	('print_top_margin', '0'),
	('receipt_show_taxes', '0'),
	('recv_invoice_format', '$CO'),
	('return_policy', 'Test'),
	('sales_invoice_format', '$CO'),
	('show_total_discount', '1'),
	('tax_included', '0'),
	('timezone', 'Asia/Jakarta'),
	('use_invoice_template', '1'),
	('website', '');
/*!40000 ALTER TABLE `ospos_app_config` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_customers
CREATE TABLE IF NOT EXISTS `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_customers: ~0 rows (approximately)
DELETE FROM `ospos_customers`;
/*!40000 ALTER TABLE `ospos_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_customers` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_employees
CREATE TABLE IF NOT EXISTS `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_employees: ~2 rows (approximately)
DELETE FROM `ospos_employees`;
/*!40000 ALTER TABLE `ospos_employees` DISABLE KEYS */;
INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
	('adminhsi', '55772918a13bc70691fca45668c4e353', 1, 0),
	('joko.susilo', '25d55ad283aa400af464c76d713c07ad', 2, 0);
/*!40000 ALTER TABLE `ospos_employees` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_giftcards
CREATE TABLE IF NOT EXISTS `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` int(10) NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_giftcards: ~0 rows (approximately)
DELETE FROM `ospos_giftcards`;
/*!40000 ALTER TABLE `ospos_giftcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_giftcards` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_grants
CREATE TABLE IF NOT EXISTS `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_grants: ~47 rows (approximately)
DELETE FROM `ospos_grants`;
/*!40000 ALTER TABLE `ospos_grants` DISABLE KEYS */;
INSERT INTO `ospos_grants` (`permission_id`, `person_id`) VALUES
	('config', 1),
	('customers', 1),
	('employees', 1),
	('giftcards', 1),
	('items', 1),
	('items_stock', 1),
	('item_kits', 1),
	('receivings', 1),
	('receivings_stock', 1),
	('reports', 1),
	('reports_categories', 1),
	('reports_customers', 1),
	('reports_discounts', 1),
	('reports_employees', 1),
	('reports_inventory', 1),
	('reports_items', 1),
	('reports_payments', 1),
	('reports_receivings', 1),
	('reports_sales', 1),
	('reports_suppliers', 1),
	('reports_taxes', 1),
	('sales', 1),
	('sales_stock', 1),
	('suppliers', 1),
	('customers', 2),
	('employees', 2),
	('giftcards', 2),
	('items', 2),
	('items_stock', 2),
	('item_kits', 2),
	('receivings', 2),
	('receivings_stock', 2),
	('reports', 2),
	('reports_categories', 2),
	('reports_customers', 2),
	('reports_discounts', 2),
	('reports_employees', 2),
	('reports_inventory', 2),
	('reports_items', 2),
	('reports_payments', 2),
	('reports_receivings', 2),
	('reports_sales', 2),
	('reports_suppliers', 2),
	('reports_taxes', 2),
	('sales', 2),
	('sales_stock', 2),
	('suppliers', 2);
/*!40000 ALTER TABLE `ospos_grants` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_inventory
CREATE TABLE IF NOT EXISTS `ospos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_inventory: ~0 rows (approximately)
DELETE FROM `ospos_inventory`;
/*!40000 ALTER TABLE `ospos_inventory` DISABLE KEYS */;
INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
	(1, 11, 1, '2015-08-21 14:31:16', 'Qty CSV Imported', 1, 0),
	(2, 12, 1, '2015-08-21 14:31:16', 'Qty CSV Imported', 1, 0),
	(3, 13, 1, '2015-08-21 14:31:16', 'Qty CSV Imported', 1, 0),
	(4, 14, 1, '2015-08-21 14:31:17', 'Qty CSV Imported', 1, 0),
	(5, 15, 1, '2015-08-21 14:31:17', 'Qty CSV Imported', 1, 0),
	(6, 16, 1, '2015-08-21 14:31:17', 'Qty CSV Imported', 1, 0),
	(7, 17, 1, '2015-08-21 14:31:17', 'Qty CSV Imported', 1, 0),
	(8, 18, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(9, 19, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(10, 20, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(11, 21, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(12, 22, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(13, 23, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(14, 24, 1, '2015-08-21 14:31:18', 'Qty CSV Imported', 1, 0),
	(15, 25, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(16, 26, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(17, 27, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(18, 28, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(19, 29, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(20, 30, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(21, 31, 1, '2015-08-21 14:31:19', 'Qty CSV Imported', 1, 0),
	(22, 32, 1, '2015-08-21 14:31:20', 'Qty CSV Imported', 1, 0),
	(23, 33, 1, '2015-08-21 14:31:20', 'Qty CSV Imported', 1, 0),
	(24, 34, 1, '2015-08-21 14:31:20', 'Qty CSV Imported', 1, 0),
	(25, 35, 1, '2015-08-21 14:31:20', 'Qty CSV Imported', 1, 0),
	(26, 36, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(27, 37, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(28, 38, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(29, 39, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(30, 40, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(31, 41, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(32, 42, 1, '2015-08-21 14:31:21', 'Qty CSV Imported', 1, 0),
	(33, 43, 1, '2015-08-21 14:31:22', 'Qty CSV Imported', 1, 0),
	(34, 44, 1, '2015-08-21 14:31:22', 'Qty CSV Imported', 1, 0),
	(35, 45, 1, '2015-08-21 14:31:22', 'Qty CSV Imported', 1, 0),
	(36, 46, 1, '2015-08-21 14:31:22', 'Qty CSV Imported', 1, 0),
	(37, 47, 1, '2015-08-21 14:31:22', 'Qty CSV Imported', 1, 0),
	(38, 48, 1, '2015-08-21 14:31:22', 'Qty CSV Imported', 1, 0),
	(39, 49, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(40, 50, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(41, 51, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(42, 52, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(43, 53, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(44, 54, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(45, 55, 1, '2015-08-21 14:31:23', 'Qty CSV Imported', 1, 0),
	(46, 56, 1, '2015-08-21 14:31:24', 'Qty CSV Imported', 1, 0),
	(47, 57, 1, '2015-08-21 14:31:24', 'Qty CSV Imported', 1, 0),
	(48, 58, 1, '2015-08-21 14:31:24', 'Qty CSV Imported', 1, 0),
	(49, 59, 1, '2015-08-21 14:31:24', 'Qty CSV Imported', 1, 0),
	(50, 60, 1, '2015-08-21 14:31:24', 'Qty CSV Imported', 1, 0),
	(51, 61, 1, '2015-08-21 14:31:24', 'Qty CSV Imported', 1, 0),
	(52, 62, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(53, 63, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(54, 64, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(55, 65, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(56, 66, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(57, 67, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(58, 68, 1, '2015-08-21 14:31:25', 'Qty CSV Imported', 1, 0),
	(59, 69, 1, '2015-08-21 14:31:26', 'Qty CSV Imported', 1, 0),
	(60, 70, 1, '2015-08-21 14:31:26', 'Qty CSV Imported', 1, 0),
	(61, 71, 1, '2015-08-21 14:31:26', 'Qty CSV Imported', 1, 0),
	(62, 72, 1, '2015-08-21 14:31:26', 'Qty CSV Imported', 1, 0),
	(63, 73, 1, '2015-08-21 14:31:26', 'Qty CSV Imported', 1, 0),
	(64, 74, 1, '2015-08-21 14:31:26', 'Qty CSV Imported', 1, 0),
	(65, 75, 1, '2015-08-21 14:31:27', 'Qty CSV Imported', 1, 0),
	(66, 76, 1, '2015-08-21 14:31:27', 'Qty CSV Imported', 1, 0),
	(67, 77, 1, '2015-08-21 14:31:27', 'Qty CSV Imported', 1, 0),
	(68, 78, 1, '2015-08-21 14:31:27', 'Qty CSV Imported', 1, 0),
	(69, 79, 1, '2015-08-21 14:31:27', 'Qty CSV Imported', 1, 0),
	(70, 80, 1, '2015-08-21 14:31:27', 'Qty CSV Imported', 1, 0),
	(71, 81, 1, '2015-08-21 14:31:28', 'Qty CSV Imported', 1, 0),
	(72, 82, 1, '2015-08-21 14:31:28', 'Qty CSV Imported', 1, 0),
	(73, 83, 1, '2015-08-21 14:31:28', 'Qty CSV Imported', 1, 0),
	(74, 84, 1, '2015-08-21 14:31:28', 'Qty CSV Imported', 1, 0),
	(75, 85, 1, '2015-08-21 14:31:29', 'Qty CSV Imported', 1, 0),
	(76, 86, 1, '2015-08-21 14:31:29', 'Qty CSV Imported', 1, 0),
	(77, 87, 1, '2015-08-21 14:31:29', 'Qty CSV Imported', 1, 0),
	(78, 88, 1, '2015-08-21 14:31:29', 'Qty CSV Imported', 1, 0),
	(79, 89, 1, '2015-08-21 14:31:29', 'Qty CSV Imported', 1, 0),
	(80, 90, 1, '2015-08-21 14:31:29', 'Qty CSV Imported', 1, 0),
	(81, 91, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(82, 92, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(83, 93, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(84, 94, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(85, 95, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(86, 96, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(87, 97, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(88, 98, 1, '2015-08-21 14:31:30', 'Qty CSV Imported', 1, 0),
	(89, 99, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(90, 100, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(91, 101, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(92, 102, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(93, 103, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(94, 104, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(95, 105, 1, '2015-08-21 14:31:31', 'Qty CSV Imported', 1, 0),
	(96, 106, 1, '2015-08-21 14:31:32', 'Qty CSV Imported', 1, 0),
	(97, 107, 1, '2015-08-21 14:31:32', 'Qty CSV Imported', 1, 0),
	(98, 108, 1, '2015-08-21 14:31:32', 'Qty CSV Imported', 1, 0),
	(99, 109, 1, '2015-08-21 14:31:32', 'Qty CSV Imported', 1, 0),
	(100, 110, 1, '2015-08-21 14:31:32', 'Qty CSV Imported', 1, 0),
	(101, 111, 1, '2015-08-21 14:31:32', 'Qty CSV Imported', 1, 0),
	(102, 112, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(103, 113, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(104, 114, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(105, 115, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(106, 116, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(107, 117, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(108, 118, 1, '2015-08-21 14:31:33', 'Qty CSV Imported', 1, 0),
	(109, 119, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(110, 120, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(111, 121, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(112, 122, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(113, 123, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(114, 124, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(115, 125, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(116, 126, 1, '2015-08-21 14:31:34', 'Qty CSV Imported', 1, 0),
	(117, 127, 1, '2015-08-21 14:31:35', 'Qty CSV Imported', 1, 0),
	(118, 128, 1, '2015-08-21 14:31:35', 'Qty CSV Imported', 1, 0),
	(119, 129, 1, '2015-08-21 14:31:35', 'Qty CSV Imported', 1, 0),
	(120, 130, 1, '2015-08-21 14:31:35', 'Qty CSV Imported', 1, 0),
	(121, 131, 1, '2015-08-21 14:31:35', 'Qty CSV Imported', 1, 0),
	(122, 132, 1, '2015-08-21 14:31:35', 'Qty CSV Imported', 1, 0),
	(123, 133, 1, '2015-08-21 14:31:36', 'Qty CSV Imported', 1, 0),
	(124, 134, 1, '2015-08-21 14:31:36', 'Qty CSV Imported', 1, 0),
	(125, 135, 1, '2015-08-21 14:31:36', 'Qty CSV Imported', 1, 0),
	(126, 136, 1, '2015-08-21 14:31:36', 'Qty CSV Imported', 1, 0),
	(127, 137, 1, '2015-08-21 14:31:36', 'Qty CSV Imported', 1, 0),
	(128, 138, 1, '2015-08-21 14:31:36', 'Qty CSV Imported', 1, 0),
	(129, 139, 1, '2015-08-21 14:31:37', 'Qty CSV Imported', 1, 0),
	(130, 140, 1, '2015-08-21 14:31:37', 'Qty CSV Imported', 1, 0),
	(131, 141, 1, '2015-08-21 14:31:37', 'Qty CSV Imported', 1, 0),
	(132, 142, 1, '2015-08-21 14:31:37', 'Qty CSV Imported', 1, 0),
	(133, 143, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(134, 144, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(135, 145, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(136, 146, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(137, 147, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(138, 148, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(139, 149, 1, '2015-08-21 14:31:38', 'Qty CSV Imported', 1, 0),
	(140, 150, 1, '2015-08-21 14:31:39', 'Qty CSV Imported', 1, 0),
	(141, 151, 1, '2015-08-21 14:31:39', 'Qty CSV Imported', 1, 0),
	(142, 152, 1, '2015-08-21 14:31:39', 'Qty CSV Imported', 1, 0),
	(145, 26, 1, '2015-08-22 08:17:49', 'Manual Edit of Quantity', 1, 142),
	(146, 148, 1, '2015-08-22 08:18:34', 'Manual Edit of Quantity', 1, 139),
	(147, 145, 1, '2015-08-22 08:20:23', 'Manual Edit of Quantity', 1, 76),
	(148, 65, 1, '2015-08-22 08:20:48', 'Manual Edit of Quantity', 1, 70),
	(149, 140, 1, '2015-08-22 08:21:39', 'Manual Edit of Quantity', 1, 65),
	(150, 77, 1, '2015-08-22 08:22:07', 'Manual Edit of Quantity', 1, 58),
	(151, 112, 1, '2015-08-22 08:22:36', 'Manual Edit of Quantity', 1, 55),
	(152, 113, 1, '2015-08-22 08:22:58', 'Manual Edit of Quantity', 1, 55),
	(153, 137, 1, '2015-08-22 08:23:35', 'Manual Edit of Quantity', 1, 50),
	(154, 64, 1, '2015-08-22 08:23:58', 'Manual Edit of Quantity', 1, 45),
	(155, 138, 1, '2015-08-22 08:24:23', 'Manual Edit of Quantity', 1, 44),
	(156, 49, 1, '2015-08-22 08:24:44', 'Manual Edit of Quantity', 1, 41),
	(157, 50, 1, '2015-08-22 08:26:25', 'Manual Edit of Quantity', 1, 40),
	(158, 62, 1, '2015-08-22 08:26:43', 'Manual Edit of Quantity', 1, 40),
	(159, 149, 1, '2015-08-22 08:27:38', 'Manual Edit of Quantity', 1, 39),
	(160, 103, 1, '2015-08-22 08:27:59', 'Manual Edit of Quantity', 1, 37),
	(161, 70, 1, '2015-08-22 08:28:14', 'Manual Edit of Quantity', 1, 36),
	(162, 75, 1, '2015-08-22 08:28:24', 'Manual Edit of Quantity', 1, 36),
	(163, 66, 1, '2015-08-22 08:28:38', 'Manual Edit of Quantity', 1, 35),
	(164, 108, 1, '2015-08-22 08:31:00', 'Manual Edit of Quantity', 1, 32),
	(165, 74, 1, '2015-08-22 08:31:10', 'Manual Edit of Quantity', 1, 30),
	(166, 102, 1, '2015-08-22 08:31:26', 'Manual Edit of Quantity', 1, 30),
	(167, 109, 1, '2015-08-22 08:31:40', 'Manual Edit of Quantity', 1, 30),
	(168, 25, 1, '2015-08-22 08:33:39', 'Manual Edit of Quantity', 1, 28),
	(169, 130, 1, '2015-08-22 08:33:54', 'Manual Edit of Quantity', 1, 25),
	(170, 142, 1, '2015-08-22 08:34:19', 'Manual Edit of Quantity', 1, 25),
	(171, 63, 1, '2015-08-22 08:42:11', 'Manual Edit of Quantity', 1, 23),
	(172, 30, 1, '2015-08-22 08:42:18', 'Manual Edit of Quantity', 1, 22),
	(173, 90, 1, '2015-08-22 08:42:33', 'Manual Edit of Quantity', 1, 22),
	(174, 92, 1, '2015-08-22 08:42:58', 'Manual Edit of Quantity', 1, 22),
	(175, 111, 1, '2015-08-22 08:47:10', 'Manual Edit of Quantity', 1, 21),
	(176, 131, 1, '2015-08-22 08:47:23', 'Manual Edit of Quantity', 1, 21),
	(177, 17, 1, '2015-08-22 08:47:34', 'Manual Edit of Quantity', 1, 18),
	(178, 118, 1, '2015-08-22 08:47:48', 'Manual Edit of Quantity', 1, 18),
	(179, 152, 1, '2015-08-22 08:48:00', 'Manual Edit of Quantity', 1, 17),
	(180, 13, 1, '2015-08-22 08:51:51', 'Manual Edit of Quantity', 1, 16),
	(181, 39, 1, '2015-08-22 08:52:02', 'Manual Edit of Quantity', 1, 16),
	(182, 83, 1, '2015-08-22 08:52:17', 'Manual Edit of Quantity', 1, 16),
	(183, 89, 1, '2015-08-22 08:52:30', 'Manual Edit of Quantity', 1, 16),
	(184, 91, 1, '2015-08-22 08:55:42', 'Manual Edit of Quantity', 1, 16),
	(185, 16, 1, '2015-08-22 08:56:01', 'Manual Edit of Quantity', 1, 15),
	(186, 40, 1, '2015-08-22 08:56:10', 'Manual Edit of Quantity', 1, 15),
	(187, 94, 1, '2015-08-22 08:56:20', 'Manual Edit of Quantity', 1, 15),
	(188, 99, 1, '2015-08-22 08:56:32', 'Manual Edit of Quantity', 1, 15),
	(189, 12, 1, '2015-08-22 08:58:49', 'Manual Edit of Quantity', 1, 14),
	(190, 15, 1, '2015-08-22 08:59:02', 'Manual Edit of Quantity', 1, 14),
	(191, 48, 1, '2015-08-22 08:59:14', 'Manual Edit of Quantity', 1, 14),
	(192, 120, 1, '2015-08-22 08:59:29', 'Manual Edit of Quantity', 1, 14),
	(193, 88, 1, '2015-08-22 08:59:41', 'Manual Edit of Quantity', 1, 13),
	(194, 19, 1, '2015-08-22 08:59:52', 'Manual Edit of Quantity', 1, 12),
	(195, 100, 1, '2015-08-22 09:00:05', 'Manual Edit of Quantity', 1, 12),
	(196, 114, 1, '2015-08-22 09:00:15', 'Manual Edit of Quantity', 1, 12),
	(197, 81, 1, '2015-08-22 09:00:26', 'Manual Edit of Quantity', 1, 11),
	(198, 132, 1, '2015-08-22 09:00:36', 'Manual Edit of Quantity', 1, 11),
	(199, 35, 1, '2015-08-22 09:00:50', 'Manual Edit of Quantity', 1, 10),
	(200, 98, 1, '2015-08-22 09:01:01', 'Manual Edit of Quantity', 1, 100),
	(201, 98, 1, '2015-08-22 09:01:06', 'Manual Edit of Quantity', 1, -90),
	(202, 73, 1, '2015-08-22 09:10:25', 'Manual Edit of Quantity', 1, 9),
	(203, 67, 1, '2015-08-22 09:10:35', 'Manual Edit of Quantity', 1, 8),
	(204, 71, 1, '2015-08-22 09:10:44', 'Manual Edit of Quantity', 1, 8),
	(205, 95, 1, '2015-08-22 09:10:56', 'Manual Edit of Quantity', 1, 8),
	(206, 104, 1, '2015-08-22 09:11:08', 'Manual Edit of Quantity', 1, 8),
	(207, 38, 1, '2015-08-22 09:11:22', 'Manual Edit of Quantity', 1, 7),
	(208, 119, 1, '2015-08-22 09:11:37', 'Manual Edit of Quantity', 1, 7),
	(209, 121, 1, '2015-08-22 09:11:48', 'Manual Edit of Quantity', 1, 7),
	(210, 124, 1, '2015-08-22 09:12:07', 'Manual Edit of Quantity', 1, 7),
	(211, 52, 1, '2015-08-22 09:14:59', 'Manual Edit of Quantity', 1, 6),
	(212, 79, 1, '2015-08-22 09:15:10', 'Manual Edit of Quantity', 1, 6),
	(213, 110, 1, '2015-08-22 09:15:19', 'Manual Edit of Quantity', 1, 6),
	(214, 129, 1, '2015-08-22 09:15:29', 'Manual Edit of Quantity', 1, 6),
	(215, 11, 1, '2015-08-22 09:15:44', 'Manual Edit of Quantity', 1, 5),
	(216, 69, 1, '2015-08-22 09:15:56', 'Manual Edit of Quantity', 1, 5),
	(217, 78, 1, '2015-08-22 09:16:15', 'Manual Edit of Quantity', 1, 5),
	(218, 93, 1, '2015-08-22 09:16:31', 'Manual Edit of Quantity', 1, 5),
	(219, 101, 1, '2015-08-22 09:20:48', 'Manual Edit of Quantity', 1, 5),
	(220, 123, 1, '2015-08-22 09:21:01', 'Manual Edit of Quantity', 1, 5),
	(221, 18, 1, '2015-08-22 09:21:09', 'Manual Edit of Quantity', 1, 4),
	(222, 106, 1, '2015-08-22 09:21:23', 'Manual Edit of Quantity', 1, 4),
	(223, 151, 1, '2015-08-22 09:21:32', 'Manual Edit of Quantity', 1, 4),
	(224, 14, 1, '2015-08-22 09:21:40', 'Manual Edit of Quantity', 1, 3),
	(225, 107, 1, '2015-08-22 09:22:01', 'Manual Edit of Quantity', 1, 3),
	(226, 126, 1, '2015-08-22 09:22:25', 'Manual Edit of Quantity', 1, 3),
	(227, 133, 1, '2015-08-22 09:22:40', 'Manual Edit of Quantity', 1, 3),
	(228, 55, 1, '2015-08-22 09:22:51', 'Manual Edit of Quantity', 1, 2),
	(229, 136, 1, '2015-08-22 09:23:01', 'Manual Edit of Quantity', 1, 2),
	(230, 72, 1, '2015-08-22 09:23:13', 'Manual Edit of Quantity', 1, 1),
	(231, 134, 1, '2015-08-22 09:23:26', 'Manual Edit of Quantity', 1, 1);
/*!40000 ALTER TABLE `ospos_inventory` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_items
CREATE TABLE IF NOT EXISTS `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,2) NOT NULL DEFAULT '0.00',
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `pic_id` int(10) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_items: ~142 rows (approximately)
DELETE FROM `ospos_items`;
/*!40000 ALTER TABLE `ospos_items` DISABLE KEYS */;
INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_id`, `allow_alt_description`, `is_serialized`, `deleted`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
	('1.Set of 12 (pcs)', '1', NULL, '11111111', '', 0.00, 0.00, 0.00, 1, 11, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('1.(1B) Set of 8 (pcs)', '1', NULL, '11111112', '', 0.00, 0.00, 0.00, 1, 12, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('1.Set of 4 Dinner (pcs)', '1', NULL, '11111113', '', 0.00, 0.00, 0.00, 1, 13, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('2.Set of 12 (pcs)', '2', NULL, '11111114', '', 0.00, 0.00, 0.00, 1, 14, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('2.Set of 4 Mug (pcs)', '2', NULL, '11111115', '', 0.00, 0.00, 0.00, 1, 15, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('3.Set of 16 (pcs)', '3', NULL, '11111116', '', 0.00, 0.00, 0.00, 1, 16, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('3.(3B) Set of 12 (pcs)', '3', NULL, '11111117', '', 0.00, 0.00, 0.00, 1, 17, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('3.(3C) Set of 8 (pcs)', '3', NULL, '11111118', '', 0.00, 0.00, 0.00, 1, 18, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('3.(3D) Set of 4 bowl (pcs)', '3', NULL, '11111119', '', 0.00, 0.00, 0.00, 1, 19, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('4.Set of 16 (pcs)', '4', NULL, '11111120', '', 0.00, 0.00, 0.00, 1, 20, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('4.Set of 12 (pcs)', '4', NULL, '11111121', '', 0.00, 0.00, 0.00, 1, 21, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('4.Set of 8 (pcs)', '4', NULL, '11111122', '', 0.00, 0.00, 0.00, 1, 22, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('4.Set of 4 bol (pcs)', '4', NULL, '11111123', '', 0.00, 0.00, 0.00, 1, 23, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('5.Set of 12 (pcs)', '5', NULL, '11111124', '', 0.00, 0.00, 0.00, 1, 24, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('5.Set of 8 (pcs)', '5', NULL, '11111125', '', 0.00, 0.00, 0.00, 1, 25, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('5.Set of 4 Salad (pcs)', '5', NULL, '11111126', '', 0.00, 0.00, 0.00, 1, 26, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('6.Set of 12 (pcs)', '6', NULL, '11111127', '', 0.00, 0.00, 0.00, 1, 27, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('7.Set of 12 (pcs)', '7', NULL, '11111128', '', 0.00, 0.00, 0.00, 1, 28, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('7.Set of 8 (Pcs)', '7', NULL, '11111129', '', 0.00, 0.00, 0.00, 1, 29, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('8.Set of 12 (pcs)', '8', NULL, '11111130', '', 0.00, 0.00, 0.00, 1, 30, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('8.Set of 8 (pcs)', '8', NULL, '11111131', '', 0.00, 0.00, 0.00, 1, 31, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('8.Set of 4 dinner (pcs)', '8', NULL, '11111132', '', 0.00, 0.00, 0.00, 1, 32, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('9.Set of 13 (pcs)', '9', NULL, '11111133', '', 0.00, 0.00, 0.00, 1, 33, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('9.Set of 9 (pcs)', '9', NULL, '11111134', '', 0.00, 0.00, 0.00, 1, 34, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('10.Set of 12 (pcs)', '10', NULL, '11111135', '', 0.00, 0.00, 0.00, 1, 35, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('10.Set of 4 salad (pcs)', '10', NULL, '11111136', '', 0.00, 0.00, 0.00, 1, 36, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('11.Set of 12 (pcs)', '11', NULL, '11111137', '', 0.00, 0.00, 0.00, 1, 37, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('12.Set of 16 (pcs)', '12', NULL, '11111138', '', 0.00, 0.00, 0.00, 1, 38, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('12.Set of 4 Mug (pcs)', '12', NULL, '11111139', '', 0.00, 0.00, 0.00, 1, 39, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('12.Set of 2 Mug (pcs)', '12', NULL, '11111140', '', 0.00, 0.00, 0.00, 1, 40, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('12.Set of 12 (pcs)', '12', NULL, '11111141', '', 0.00, 0.00, 0.00, 1, 41, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('12.Set of 8 (pcs)', '12', NULL, '11111142', '', 0.00, 0.00, 0.00, 1, 42, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('12.Set of 4 Handle bowl (pcs)', '12', NULL, '11111143', '', 0.00, 0.00, 0.00, 1, 43, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('13.Set of 16 (pcs)', '13', NULL, '11111144', '', 0.00, 0.00, 0.00, 1, 44, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('13.Set of 12 (pcs)', '13', NULL, '11111145', '', 0.00, 0.00, 0.00, 1, 45, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('13.Set of 8 (pcs)', '13', NULL, '11111146', '', 0.00, 0.00, 0.00, 1, 46, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('13.Set of 4 mug (pcs)', '13', NULL, '11111147', '', 0.00, 0.00, 0.00, 1, 47, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('14.Set of 12 (pcs)', '14', NULL, '11111148', '', 0.00, 0.00, 0.00, 1, 48, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('14.(14B) Set of 8 (pcs)', '14', NULL, '11111149', '', 0.00, 0.00, 0.00, 1, 49, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('14.Set of 4 Salad (pcs)', '14', NULL, '11111150', '', 0.00, 0.00, 0.00, 1, 50, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('15.Set of 8 (pcs)', '15', NULL, '11111151', '', 0.00, 0.00, 0.00, 1, 51, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('16.Set of 12 (pcs)', '16', NULL, '11111152', '', 0.00, 0.00, 0.00, 1, 52, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('16.Set of 8 (pcs)', '16', NULL, '11111153', '', 0.00, 0.00, 0.00, 1, 53, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('16.Set of 4 salad (pcs)', '16', NULL, '11111154', '', 0.00, 0.00, 0.00, 1, 54, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('17.Set of 8 (pcs)', '17', NULL, '11111155', '', 0.00, 0.00, 0.00, 1, 55, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('17.Set of 8 (pcs)', '17', NULL, '11111156', '', 0.00, 0.00, 0.00, 1, 56, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('19.Set of 12 (pcs)', '19', NULL, '11111157', '', 0.00, 0.00, 0.00, 1, 57, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('19.Set of 8 (pcs)', '19', NULL, '11111158', '', 0.00, 0.00, 0.00, 1, 58, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('19.Set of 4 salad (pcs)', '19', NULL, '11111159', '', 0.00, 0.00, 0.00, 1, 59, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('20.Set of 4 rice bowl (pcs)', '20', NULL, '11111160', '', 0.00, 0.00, 0.00, 1, 60, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('21.Set of 4 rice bowl (pcs)', '21', NULL, '11111161', '', 0.00, 0.00, 0.00, 1, 61, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('22.Set of 4 Salad (pcs)', '22', NULL, '11111162', '', 0.00, 0.00, 0.00, 1, 62, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('23.Set of 4 Salad (pcs)', '23', NULL, '11111163', '', 0.00, 0.00, 0.00, 1, 63, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('24.Set of 4 Salad (pcs)', '24', NULL, '11111164', '', 0.00, 0.00, 0.00, 1, 64, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('26.Set of 4 Salad  (pcs)', '26', NULL, '11111165', '', 0.00, 0.00, 0.00, 1, 65, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('27.Set of 12 (pcs)', '27', NULL, '11111166', '', 0.00, 0.00, 0.00, 1, 66, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('27.Set of 8 (pcs)', '27', NULL, '11111167', '', 0.00, 0.00, 0.00, 1, 67, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('27.Set of 8 (pcs)', '27', NULL, '11111168', '', 0.00, 0.00, 0.00, 1, 68, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('28.Set of 12 (pcs)', '28', NULL, '11111169', '', 0.00, 0.00, 0.00, 1, 69, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('28.(28B) Set of 4 Dinner (pcs)', '28', NULL, '11111170', '', 0.00, 0.00, 0.00, 1, 70, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('29.Set of 12 (pcs)', '29', NULL, '11111171', '', 0.00, 0.00, 0.00, 1, 71, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('29.Set of 8 (pcs)', '29', NULL, '11111172', '', 0.00, 0.00, 0.00, 1, 72, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('29.Set of 4 Dinner (pcs)', '29', NULL, '11111173', '', 0.00, 0.00, 0.00, 1, 73, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('30.Set of 12 tea set  (pcs)', '30', NULL, '11111174', '', 0.00, 0.00, 0.00, 1, 74, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('32.Set of 16 (pcs)', '32', NULL, '11111175', '', 0.00, 0.00, 0.00, 1, 75, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('32.Set of 4 salad (pcs)', '32', NULL, '11111176', '', 0.00, 0.00, 0.00, 1, 76, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('33.Set of 16 (pcs)', '33', NULL, '11111177', '', 0.00, 0.00, 0.00, 1, 77, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('33.Set of 12 (pcs)', '33', NULL, '11111178', '', 0.00, 0.00, 0.00, 1, 78, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('33.Set of  tea set (pcs)', '33', NULL, '11111179', '', 0.00, 0.00, 0.00, 1, 79, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('33.Open Stock', '33', NULL, '11111180', '', 0.00, 0.00, 0.00, 1, 80, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('34.Set of 12 (pcs)', '34', NULL, '11111181', '', 0.00, 0.00, 0.00, 1, 81, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('34.Open stock', '34', NULL, '11111182', '', 0.00, 0.00, 0.00, 1, 82, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('35.Set of 12 tea set (pcs)', '35', NULL, '11111183', '', 0.00, 0.00, 0.00, 1, 83, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('36.Set of 20 (pcs)', '36', NULL, '11111184', '', 0.00, 0.00, 0.00, 1, 84, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('36.Set of 16 (pcs)', '36', NULL, '11111185', '', 0.00, 0.00, 0.00, 1, 85, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('36.Set of 8 (pcs)', '36', NULL, '11111186', '', 0.00, 0.00, 0.00, 1, 86, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('36.Set of 4 Salad (pcs)', '36', NULL, '11111187', '', 0.00, 0.00, 0.00, 1, 87, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('37.Set of 16 (pcs)', '37', NULL, '11111188', '', 0.00, 0.00, 0.00, 1, 88, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('37.Set of 20 (pcs)', '37', NULL, '11111189', '', 0.00, 0.00, 0.00, 1, 89, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('37.Set of 16 (pcs)', '37', NULL, '11111190', '', 0.00, 0.00, 0.00, 1, 90, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('38.Set of 16 (pcs)', '38', NULL, '11111191', '', 0.00, 0.00, 0.00, 1, 91, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('38.Set of 4 mug (pcs)', '38', NULL, '11111192', '', 0.00, 0.00, 0.00, 1, 92, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('38.Set of 16 (pcs)', '38', NULL, '11111193', '', 0.00, 0.00, 0.00, 1, 93, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('38.Set of 4 mug (pcs)', '38', NULL, '11111194', '', 0.00, 0.00, 0.00, 1, 94, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('39.Set of 12 (pcs)', '39', NULL, '11111195', '', 0.00, 0.00, 0.00, 1, 95, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('39.Set of 8 (pcs)', '39', NULL, '11111196', '', 0.00, 0.00, 0.00, 1, 96, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('39. Set of 4 Mug (pcs)', '39', NULL, '11111197', '', 0.00, 0.00, 0.00, 1, 97, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('40.Set of 21 (pcs)', '40', NULL, '11111198', '', 0.00, 0.00, 0.00, 1, 98, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('41.Set of 12 (pcs)', '41', NULL, '11111199', '', 0.00, 0.00, 0.00, 1, 99, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('41.Set of 4 salad (4 pcs)', '41', NULL, '11111200', '', 0.00, 0.00, 0.00, 1, 100, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('42.Set of 12 (pcs)', '42', NULL, '11111201', '', 0.00, 0.00, 0.00, 1, 101, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('42.Set of 4 salad (pcs)', '42', NULL, '11111202', '', 0.00, 0.00, 0.00, 1, 102, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('43.Set of 12 tea sat (pcs)', '43', NULL, '11111203', '', 0.00, 0.00, 0.00, 1, 103, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('45.Set of 12 tea sat (pcs)', '45', NULL, '11111204', '', 0.00, 0.00, 0.00, 1, 104, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('46.Set of 12 tea set (pcs)', '46', NULL, '11111205', '', 0.00, 0.00, 0.00, 1, 105, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('48.Set of 12 tea sat (pcs)', '48', NULL, '11111206', '', 0.00, 0.00, 0.00, 1, 106, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('49.Set of 12 tea sat (pcs)', '49', NULL, '11111207', '', 0.00, 0.00, 0.00, 1, 107, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('51.Set of 12 tea sat (pcs)', '51', NULL, '11111208', '', 0.00, 0.00, 0.00, 1, 108, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('52.Set of 12 tea sat (pcs)', '52', NULL, '11111209', '', 0.00, 0.00, 0.00, 1, 109, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('53.Set of 4 mug (pcs)', '53', NULL, '11111210', '', 0.00, 0.00, 0.00, 1, 110, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('54.Set of 4 mug (pcs)', '54', NULL, '11111211', '', 0.00, 0.00, 0.00, 1, 111, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('55. Set of 4 mug (pcs)', '55', NULL, '11111212', '', 0.00, 0.00, 0.00, 1, 112, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('93. Set of 4 coupsop (pcs)', '93', NULL, '11111213', '', 0.00, 0.00, 0.00, 1, 113, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('95. Set of 20 (pcs)', '95', NULL, '11111214', '', 0.00, 0.00, 0.00, 1, 114, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('95. Set of 16 (pcs)', '95', NULL, '11111215', '', 0.00, 0.00, 0.00, 1, 115, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('95. Set of 12 (pcs)', '95', NULL, '11111216', '', 0.00, 0.00, 0.00, 1, 116, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('95. Set of 8 (pcs)', '95', NULL, '11111217', '', 0.00, 0.00, 0.00, 1, 117, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('96. Set of 12 (pcs)', '96', NULL, '11111218', '', 0.00, 0.00, 0.00, 1, 118, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('96. (96B) Set of 8 (pcs)', '96', NULL, '11111219', '', 0.00, 0.00, 0.00, 1, 119, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('97. Set of 12 (pcs)', '97', NULL, '11111220', '', 0.00, 0.00, 0.00, 1, 120, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('97. Set of 8 (pcs)', '97', NULL, '11111221', '', 0.00, 0.00, 0.00, 1, 121, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('97. Set of 4 Salad (pcs)', '97', NULL, '11111222', '', 0.00, 0.00, 0.00, 1, 122, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('98. Set of 12 (pcs)', '98', NULL, '11111223', '', 0.00, 0.00, 0.00, 1, 123, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('98. Set of 8 (pcs)', '98', NULL, '11111224', '', 0.00, 0.00, 0.00, 1, 124, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('98. Set of 4 Coupsop(pcs)', '98', NULL, '11111225', '', 0.00, 0.00, 0.00, 1, 125, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('99. Set of 12 (pcs)', '99', NULL, '11111226', '', 0.00, 0.00, 0.00, 1, 126, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('99. Set of 8 (pcs)', '99', NULL, '11111227', '', 0.00, 0.00, 0.00, 1, 127, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Set of 8 (pcs)', '', NULL, '11111228', '', 0.00, 0.00, 0.00, 1, 128, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('111. Set of 8 (pcs)', '111', NULL, '11111229', '', 0.00, 0.00, 0.00, 1, 129, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('112. set of 8 (pcs)', '112', NULL, '11111230', '', 0.00, 0.00, 0.00, 1, 130, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('113. Set of  6 BB Plate (6 pcs)', '113', NULL, '11111231', '', 0.00, 0.00, 0.00, 1, 131, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('114. Set of  6 BB Plate (6 pcs)', '114', NULL, '11111232', '', 0.00, 0.00, 0.00, 1, 132, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('115. Set of  6 BB Plate (6 pcs)', '115', NULL, '11111233', '', 0.00, 0.00, 0.00, 1, 133, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('116. Set of  6 BB Plate (6 pcs)', '116', NULL, '11111234', '', 0.00, 0.00, 0.00, 1, 134, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('117. Set of  6 BB Plate (6 pcs)', '117', NULL, '11111235', '', 0.00, 0.00, 0.00, 1, 135, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('118. Set of  8 (pcs)', '118', NULL, '11111236', '', 0.00, 0.00, 0.00, 1, 136, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('131. Set of 16 (Pcs)', '131', NULL, '11111237', '', 0.00, 0.00, 0.00, 1, 137, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('132. Set Of 16 (Pcs)', '132', NULL, '11111238', '', 0.00, 0.00, 0.00, 1, 138, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('133. Set Of 12 (Prs)', '133', NULL, '11111239', '', 0.00, 0.00, 0.00, 1, 139, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Bamboo Green. Set of 12 (pcs)', 'Bamboo Green', NULL, '11111240', '', 0.00, 0.00, 0.00, 1, 140, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Bamboo Green. Set of 4 Bowl  (pcs)', 'Bamboo Green', NULL, '11111241', '', 0.00, 0.00, 0.00, 1, 141, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Living Stone. Set of 12 (pcs)', 'Living Stone', NULL, '11111242', '', 0.00, 0.00, 0.00, 1, 142, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Living Stone. Set of 4 Salad Bowl  (pcs)', 'Living Stone', NULL, '11111243', '', 0.00, 0.00, 0.00, 1, 143, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Living Stone. Set of 4 Dinner  (pcs)', 'Living Stone', NULL, '11111244', '', 0.00, 0.00, 0.00, 1, 144, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Maison Stoneware. Set of 12 (pcs)', 'Maison Stoneware', NULL, '11111245', '', 0.00, 0.00, 0.00, 1, 145, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Maison Stoneware. Set of 4 Salad Bowl  (pcs)', 'Maison Stoneware', NULL, '11111246', '', 0.00, 0.00, 0.00, 1, 146, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Maison Stoneware. Set of 4 Dinner  (pcs)', 'Maison Stoneware', NULL, '11111247', '', 0.00, 0.00, 0.00, 1, 147, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Overan  12\' Santa. Set of 12" (1 pcs)', 'Overan  12\' Santa', NULL, '11111248', '', 0.00, 0.00, 0.00, 1, 148, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Overan SQ Dinner. Set of 1 SQ Dinner (1 pcs)', 'Overan SQ Dinner', NULL, '11111249', '', 0.00, 0.00, 0.00, 1, 149, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Overan SQ Dinner. (96B) Set of 8 (pcs)', 'Overan SQ Dinner', NULL, '11111250', '', 0.00, 0.00, 0.00, 1, 150, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', ''),
	('Overan (Round Veg Bowl Noritake). Set of 1 round veg bowl (1 pcs)', 'Overan (Round Veg Bowl Noritake)', NULL, '11111251', '', 0.00, 0.00, 0.00, 1, 151, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Overan (Caserolle). Set of  1 caserolle (1 pcs)', 'Overan (Caserolle)', NULL, '11111252', '', 0.00, 0.00, 0.00, 1, 152, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
/*!40000 ALTER TABLE `ospos_items` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_items_taxes
CREATE TABLE IF NOT EXISTS `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`),
  CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_items_taxes: ~0 rows (approximately)
DELETE FROM `ospos_items_taxes`;
/*!40000 ALTER TABLE `ospos_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_items_taxes` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_item_kits
CREATE TABLE IF NOT EXISTS `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_item_kits: ~0 rows (approximately)
DELETE FROM `ospos_item_kits`;
/*!40000 ALTER TABLE `ospos_item_kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_item_kits` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_item_kit_items
CREATE TABLE IF NOT EXISTS `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`),
  CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_item_kit_items: ~0 rows (approximately)
DELETE FROM `ospos_item_kit_items`;
/*!40000 ALTER TABLE `ospos_item_kit_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_item_kit_items` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_item_quantities
CREATE TABLE IF NOT EXISTS `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_item_quantities: ~0 rows (approximately)
DELETE FROM `ospos_item_quantities`;
/*!40000 ALTER TABLE `ospos_item_quantities` DISABLE KEYS */;
INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
	(11, 1, 5),
	(12, 1, 14),
	(13, 1, 16),
	(14, 1, 3),
	(15, 1, 14),
	(16, 1, 15),
	(17, 1, 18),
	(18, 1, 4),
	(19, 1, 12),
	(20, 1, 0),
	(21, 1, 0),
	(22, 1, 0),
	(23, 1, 0),
	(24, 1, 0),
	(25, 1, 28),
	(26, 1, 142),
	(27, 1, 0),
	(28, 1, 0),
	(29, 1, 0),
	(30, 1, 22),
	(31, 1, 0),
	(32, 1, 0),
	(33, 1, 0),
	(34, 1, 0),
	(35, 1, 10),
	(36, 1, 0),
	(37, 1, 0),
	(38, 1, 7),
	(39, 1, 16),
	(40, 1, 15),
	(41, 1, 0),
	(42, 1, 0),
	(43, 1, 0),
	(44, 1, 0),
	(45, 1, 0),
	(46, 1, 0),
	(47, 1, 0),
	(48, 1, 14),
	(49, 1, 41),
	(50, 1, 40),
	(51, 1, 0),
	(52, 1, 6),
	(53, 1, 0),
	(54, 1, 0),
	(55, 1, 2),
	(56, 1, 0),
	(57, 1, 0),
	(58, 1, 0),
	(59, 1, 0),
	(60, 1, 0),
	(61, 1, 0),
	(62, 1, 40),
	(63, 1, 23),
	(64, 1, 45),
	(65, 1, 70),
	(66, 1, 35),
	(67, 1, 8),
	(68, 1, 0),
	(69, 1, 5),
	(70, 1, 36),
	(71, 1, 8),
	(72, 1, 1),
	(73, 1, 9),
	(74, 1, 30),
	(75, 1, 36),
	(76, 1, 0),
	(77, 1, 58),
	(78, 1, 5),
	(79, 1, 6),
	(80, 1, 0),
	(81, 1, 11),
	(82, 1, 0),
	(83, 1, 16),
	(84, 1, 0),
	(85, 1, 0),
	(86, 1, 0),
	(87, 1, 0),
	(88, 1, 13),
	(89, 1, 16),
	(90, 1, 22),
	(91, 1, 16),
	(92, 1, 22),
	(93, 1, 5),
	(94, 1, 15),
	(95, 1, 8),
	(96, 1, 0),
	(97, 1, 0),
	(98, 1, 10),
	(99, 1, 15),
	(100, 1, 12),
	(101, 1, 5),
	(102, 1, 30),
	(103, 1, 37),
	(104, 1, 8),
	(105, 1, 0),
	(106, 1, 4),
	(107, 1, 3),
	(108, 1, 32),
	(109, 1, 30),
	(110, 1, 6),
	(111, 1, 21),
	(112, 1, 55),
	(113, 1, 55),
	(114, 1, 12),
	(115, 1, 0),
	(116, 1, 0),
	(117, 1, 0),
	(118, 1, 18),
	(119, 1, 7),
	(120, 1, 14),
	(121, 1, 7),
	(122, 1, 0),
	(123, 1, 5),
	(124, 1, 7),
	(125, 1, 0),
	(126, 1, 3),
	(127, 1, 0),
	(128, 1, 0),
	(129, 1, 6),
	(130, 1, 25),
	(131, 1, 21),
	(132, 1, 11),
	(133, 1, 3),
	(134, 1, 1),
	(135, 1, 0),
	(136, 1, 2),
	(137, 1, 50),
	(138, 1, 44),
	(139, 1, 0),
	(140, 1, 65),
	(141, 1, 0),
	(142, 1, 25),
	(143, 1, 0),
	(144, 1, 0),
	(145, 1, 76),
	(146, 1, 0),
	(147, 1, 0),
	(148, 1, 139),
	(149, 1, 39),
	(150, 1, 0),
	(151, 1, 4),
	(152, 1, 17);
/*!40000 ALTER TABLE `ospos_item_quantities` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_modules
CREATE TABLE IF NOT EXISTS `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_modules: ~10 rows (approximately)
DELETE FROM `ospos_modules`;
/*!40000 ALTER TABLE `ospos_modules` DISABLE KEYS */;
INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
	('module_config', 'module_config_desc', 100, 'config'),
	('module_customers', 'module_customers_desc', 10, 'customers'),
	('module_employees', 'module_employees_desc', 80, 'employees'),
	('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
	('module_items', 'module_items_desc', 20, 'items'),
	('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
	('module_receivings', 'module_receivings_desc', 60, 'receivings'),
	('module_reports', 'module_reports_desc', 50, 'reports'),
	('module_sales', 'module_sales_desc', 70, 'sales'),
	('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');
/*!40000 ALTER TABLE `ospos_modules` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_people
CREATE TABLE IF NOT EXISTS `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_people: ~3 rows (approximately)
DELETE FROM `ospos_people`;
/*!40000 ALTER TABLE `ospos_people` DISABLE KEYS */;
INSERT INTO `ospos_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
	('Admin', 'hsi', 0, '104', 'it@pthsi.com', '', '', '', '', '', '', '', 1),
	('Joko', 'Susilo', 1, '', '', '', '', '', '', '', '', '', 2),
	('HSI', 'PUSAT', 1, '', '', '', '', '', '', '', '', '', 3);
/*!40000 ALTER TABLE `ospos_people` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_permissions
CREATE TABLE IF NOT EXISTS `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_permissions: ~24 rows (approximately)
DELETE FROM `ospos_permissions`;
/*!40000 ALTER TABLE `ospos_permissions` DISABLE KEYS */;
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
	('config', 'config', NULL),
	('customers', 'customers', NULL),
	('employees', 'employees', NULL),
	('giftcards', 'giftcards', NULL),
	('items', 'items', NULL),
	('items_stock', 'items', 1),
	('item_kits', 'item_kits', NULL),
	('receivings', 'receivings', NULL),
	('receivings_stock', 'receivings', 1),
	('reports', 'reports', NULL),
	('reports_categories', 'reports', NULL),
	('reports_customers', 'reports', NULL),
	('reports_discounts', 'reports', NULL),
	('reports_employees', 'reports', NULL),
	('reports_inventory', 'reports', NULL),
	('reports_items', 'reports', NULL),
	('reports_payments', 'reports', NULL),
	('reports_receivings', 'reports', NULL),
	('reports_sales', 'reports', NULL),
	('reports_suppliers', 'reports', NULL),
	('reports_taxes', 'reports', NULL),
	('sales', 'sales', NULL),
	('sales_stock', 'sales', 1),
	('suppliers', 'suppliers', NULL);
/*!40000 ALTER TABLE `ospos_permissions` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_receivings
CREATE TABLE IF NOT EXISTS `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_receivings: ~0 rows (approximately)
DELETE FROM `ospos_receivings`;
/*!40000 ALTER TABLE `ospos_receivings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_receivings` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_receivings_items
CREATE TABLE IF NOT EXISTS `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_receivings_items: ~0 rows (approximately)
DELETE FROM `ospos_receivings_items`;
/*!40000 ALTER TABLE `ospos_receivings_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_receivings_items` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales
CREATE TABLE IF NOT EXISTS `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`),
  CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales: ~0 rows (approximately)
DELETE FROM `ospos_sales`;
/*!40000 ALTER TABLE `ospos_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_items
CREATE TABLE IF NOT EXISTS `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`),
  CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_items: ~0 rows (approximately)
DELETE FROM `ospos_sales_items`;
/*!40000 ALTER TABLE `ospos_sales_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_items` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_items_taxes
CREATE TABLE IF NOT EXISTS `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_items_taxes: ~0 rows (approximately)
DELETE FROM `ospos_sales_items_taxes`;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_payments
CREATE TABLE IF NOT EXISTS `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_payments: ~0 rows (approximately)
DELETE FROM `ospos_sales_payments`;
/*!40000 ALTER TABLE `ospos_sales_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_payments` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_suspended
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `ospos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_suspended: ~0 rows (approximately)
DELETE FROM `ospos_sales_suspended`;
/*!40000 ALTER TABLE `ospos_sales_suspended` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_suspended_items
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `ospos_sales_suspended_items_ibfk_3` (`item_location`),
  CONSTRAINT `ospos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`),
  CONSTRAINT `ospos_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_suspended_items: ~0 rows (approximately)
DELETE FROM `ospos_sales_suspended_items`;
/*!40000 ALTER TABLE `ospos_sales_suspended_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended_items` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_suspended_items_taxes
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended_items` (`sale_id`),
  CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_suspended_items_taxes: ~0 rows (approximately)
DELETE FROM `ospos_sales_suspended_items_taxes`;
/*!40000 ALTER TABLE `ospos_sales_suspended_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended_items_taxes` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sales_suspended_payments
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  CONSTRAINT `ospos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sales_suspended_payments: ~0 rows (approximately)
DELETE FROM `ospos_sales_suspended_payments`;
/*!40000 ALTER TABLE `ospos_sales_suspended_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended_payments` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_sessions
CREATE TABLE IF NOT EXISTS `ospos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_sessions: ~5 rows (approximately)
DELETE FROM `ospos_sessions`;
/*!40000 ALTER TABLE `ospos_sessions` DISABLE KEYS */;
INSERT INTO `ospos_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('0ce2d0d48ddda0744cc7f3e3ed6b73ce', '192.168.0.5', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-gb; GT-I9082 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mo', 1440142708, 'a:8:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:4:"cart";a:2:{i:1;a:16:{s:7:"item_id";s:1:"2";s:13:"item_location";s:1:"1";s:10:"stock_name";s:5:"stock";s:4:"line";i:1;s:4:"name";s:21:"1.(1B) Set of 8 (pcs)";s:11:"item_number";s:8:"11111112";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:2:"10";s:8:"discount";s:1:"0";s:8:"in_stock";s:1:"0";s:5:"price";s:4:"0.00";s:5:"total";s:4:"0.00";s:16:"discounted_total";s:7:"0.00000";}i:2;a:16:{s:7:"item_id";s:3:"123";s:13:"item_location";s:1:"1";s:10:"stock_name";s:5:"stock";s:4:"line";i:2;s:4:"name";s:31:"115. Set of  6 BB Plate (6 pcs)";s:11:"item_number";s:8:"11111233";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";s:1:"0";s:8:"in_stock";s:1:"0";s:5:"price";s:4:"0.00";s:5:"total";s:4:"0.00";s:16:"discounted_total";s:7:"0.00000";}}s:9:"sale_mode";s:4:"sale";s:13:"sale_location";s:1:"1";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:20:"sales_invoice_number";s:1:"0";}'),
	('36724c23dd2c8ee557948623c0dafcb8', '192.168.0.91', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 1440142665, 'a:3:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"2";s:13:"item_location";s:1:"1";}'),
	('3ee682664c160a83b19acaaf77ca0147', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', 1440142555, 'a:3:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:13:"item_location";s:1:"1";}'),
	('7ac5c10785fcf35c6565622e35fe8245', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', 1440214319, 'a:9:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:13:"item_location";s:1:"1";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:13:"sale_location";s:1:"1";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:20:"sales_invoice_number";s:1:"0";}'),
	('b2dfb661e950ac8769aa48cb3da6d985', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', 1440214427, ''),
	('bdd71cf974806ad23ad71d3053fc3696', '192.168.0.233', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', 1440141285, 'a:3:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:13:"item_location";s:1:"1";}');
/*!40000 ALTER TABLE `ospos_sessions` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_stock_locations
CREATE TABLE IF NOT EXISTS `ospos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_stock_locations: ~1 rows (approximately)
DELETE FROM `ospos_stock_locations`;
/*!40000 ALTER TABLE `ospos_stock_locations` DISABLE KEYS */;
INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
	(1, 'stock', 0);
/*!40000 ALTER TABLE `ospos_stock_locations` ENABLE KEYS */;


-- Dumping structure for table pos.ospos_suppliers
CREATE TABLE IF NOT EXISTS `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table pos.ospos_suppliers: ~1 rows (approximately)
DELETE FROM `ospos_suppliers`;
/*!40000 ALTER TABLE `ospos_suppliers` DISABLE KEYS */;
INSERT INTO `ospos_suppliers` (`person_id`, `company_name`, `agency_name`, `account_number`, `deleted`) VALUES
	(3, 'PT. Haeng Nam Sejahtera Indonesia', 'Kantor Pusat', NULL, 0);
/*!40000 ALTER TABLE `ospos_suppliers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
