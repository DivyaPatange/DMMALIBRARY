-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 19, 2020 at 03:52 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

DROP TABLE IF EXISTS `academic_years`;
CREATE TABLE IF NOT EXISTS `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_academic_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_academic_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `from_academic_year`, `to_academic_year`, `created_at`, `updated_at`) VALUES
(1, '2019-06-01', '2020-05-31', '2020-10-13 10:24:28', '2020-10-13 10:24:28'),
(2, '2020-06-01', '2021-05-31', '2020-10-13 10:25:47', '2020-10-13 10:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `book_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_pdf` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_cat_id_foreign` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_banks`
--

DROP TABLE IF EXISTS `book_banks`;
CREATE TABLE IF NOT EXISTS `book_banks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expected_return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `book_condition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penalty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_banks`
--

INSERT INTO `book_banks` (`id`, `book_no`, `BT_no`, `issue_date`, `expected_return_date`, `actual_return_date`, `book_condition`, `penalty`, `created_at`, `updated_at`) VALUES
(1, '2', 'BTS517374', '2020-10-18', '2021-10-18', '2020-10-29', 'poor', '67.5', '2020-10-18 05:58:44', '2020-10-18 11:18:18'),
(2, '7', 'BTS517374', '2020-10-18', '2021-10-18', '2020-10-31', 'good', '0', '2020-10-18 06:41:23', '2020-10-18 11:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `book_transactions`
--

DROP TABLE IF EXISTS `book_transactions`;
CREATE TABLE IF NOT EXISTS `book_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_transactions`
--

INSERT INTO `book_transactions` (`id`, `BT_no`, `created_at`, `updated_at`) VALUES
(1, 'BTS482160', '2020-10-13 10:50:31', '2020-10-13 10:50:31'),
(2, 'BTS241181', '2020-10-18 10:29:45', '2020-10-18 10:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
CREATE TABLE IF NOT EXISTS `computers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `system_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computers`
--

INSERT INTO `computers` (`id`, `system_no`, `created_at`, `updated_at`) VALUES
(1, '1', '2020-10-13 10:27:47', '2020-10-13 10:27:47'),
(2, '2', '2020-10-13 10:27:50', '2020-10-13 10:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `computer_accessions`
--

DROP TABLE IF EXISTS `computer_accessions`;
CREATE TABLE IF NOT EXISTS `computer_accessions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_duration`, `created_at`, `updated_at`) VALUES
(1, 'BA', '2 years', '2020-10-13 10:27:05', '2020-10-13 10:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department`, `created_at`, `updated_at`) VALUES
(1, 'BAMS', '2020-10-13 10:25:57', '2020-10-13 10:25:57'),
(2, 'Ayurved', '2020-10-13 10:26:38', '2020-10-13 10:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `department_libraries`
--

DROP TABLE IF EXISTS `department_libraries`;
CREATE TABLE IF NOT EXISTS `department_libraries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` int(10) UNSIGNED NOT NULL,
  `book_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allocation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_libraries_department_id_foreign` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_book_issues`
--

DROP TABLE IF EXISTS `faculty_book_issues`;
CREATE TABLE IF NOT EXISTS `faculty_book_issues` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expected_return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `book_condition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penalty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty_book_issues`
--

INSERT INTO `faculty_book_issues` (`id`, `BT_no`, `book_no`, `issue_date`, `expected_return_date`, `actual_return_date`, `book_condition`, `penalty`, `created_at`, `updated_at`) VALUES
(1, 'BTF321912', '1', '2020-10-18', '2020-10-25', NULL, NULL, NULL, '2020-10-18 12:05:13', '2020-10-18 12:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_b_t_s`
--

DROP TABLE IF EXISTS `faculty_b_t_s`;
CREATE TABLE IF NOT EXISTS `faculty_b_t_s` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty_b_t_s`
--

INSERT INTO `faculty_b_t_s` (`id`, `BT_no`, `name`, `session`, `created_at`, `updated_at`) VALUES
(1, 'BTF321912', 'Divya Patange', '2', '2020-10-18 11:52:02', '2020-10-18 11:52:02'),
(2, 'BTF491013', 'Shreeya Bondre', '1', '2020-10-18 11:52:52', '2020-10-18 11:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
CREATE TABLE IF NOT EXISTS `journals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `journal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_accessions`
--

DROP TABLE IF EXISTS `library_accessions`;
CREATE TABLE IF NOT EXISTS `library_accessions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `library_accessions`
--

INSERT INTO `library_accessions` (`id`, `BT_no`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 'BTS482160', '2020-10-13 21:53:00', NULL, '2020-10-13 10:53:41', '2020-10-13 10:53:41'),
(2, 'BTS482160', '2020-10-13 21:55:00', NULL, '2020-10-13 10:56:00', '2020-10-13 10:56:00'),
(3, 'BTS482160', '2020-10-12 21:56:00', NULL, '2020-10-13 10:56:17', '2020-10-13 10:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `library_books`
--

DROP TABLE IF EXISTS `library_books`;
CREATE TABLE IF NOT EXISTS `library_books` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_pages` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rack_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `library_books`
--

INSERT INTO `library_books` (`id`, `reg_no`, `book_code`, `book_no`, `author_name`, `book_name`, `price`, `publication`, `no_of_pages`, `seller`, `bill_no`, `bill_date`, `rack_no`, `receipt_no`, `receipt_date`, `scheme`, `status`, `department`, `medium`, `remark`, `book_status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '1', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '123', 0, NULL, '2020-10-18 12:05:13'),
(2, '2', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '2', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, '2020-10-18 11:18:18'),
(3, '3', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '3', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '1', 1, NULL, NULL),
(4, '4', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '4', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '22', 1, NULL, NULL),
(5, '5', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '5', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '324', 1, NULL, NULL),
(6, '6', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '6', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '4', 1, NULL, NULL),
(7, '7', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '7', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, '2020-10-18 11:17:52'),
(8, '8', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '8', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(9, '9', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '9', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(10, '10', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '10', 'Dr. Subash Ranade', 'Vaidyakiya Subhashit Sahitya and Vaidyakam', '135', 'Chokamba Prakashan', '184', 'varanasi', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(11, '11', 'Sanskrit shabda-Dhatu-rupawali', '11', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(12, '12', 'Sanskrit shabda-Dhatu-rupawali', '12', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(13, '13', 'Sanskrit shabda-Dhatu-rupawali', '13', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(14, '14', 'Sanskrit shabda-Dhatu-rupawali', '14', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(15, '15', 'Sanskrit shabda-Dhatu-rupawali', '15', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(16, '16', 'Sanskrit shabda-Dhatu-rupawali', '16', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(17, '17', 'Sanskrit shabda-Dhatu-rupawali', '17', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(18, '18', 'Sanskrit shabda-Dhatu-rupawali', '18', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(19, '19', 'Sanskrit shabda-Dhatu-rupawali', '19', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(20, '20', 'Sanskrit shabda-Dhatu-rupawali', '20', 'Pd . Rajaram Shastri Natekar', 'Sanskrit shabda-Dhatu-rupawali', '50', 'Navneet Prakashan', '208', 'Gujrat', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(21, '21', 'Panchtantra', '21', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(22, '22', 'Panchtantra', '22', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(23, '23', 'Panchtantra', '23', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(24, '24', 'Panchtantra', '24', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(25, '25', 'Panchtantra', '25', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(26, '26', 'Panchtantra', '26', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(27, '27', 'Panchtantra', '27', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(28, '28', 'Panchtantra', '28', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(29, '29', 'Panchtantra', '29', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(30, '30', 'Panchtantra', '30', 'Srikant Gawande', 'Panchtantra', '70', 'Profeisant prakashan', '88', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(31, '31', 'Kaumudhi Siddhant', '31', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(32, '32', 'Kaumudhi Siddhant', '32', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(33, '33', 'Kaumudhi Siddhant', '33', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(34, '34', 'Kaumudhi Siddhant', '34', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(35, '35', 'Kaumudhi Siddhant', '35', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(36, '36', 'Kaumudhi Siddhant', '36', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '2', 1, NULL, NULL),
(37, '37', 'Kaumudhi Siddhant', '37', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(38, '38', 'Kaumudhi Siddhant', '38', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(39, '39', 'Kaumudhi Siddhant', '39', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(40, '40', 'Kaumudhi Siddhant', '40', 'Bhramraj Group', 'Kaumudhi Siddhant', '100', 'Dhanwantari Prakashan', '156', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(41, '41', 'Ayurved Sanskrutam ', '41', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(42, '42', 'Ayurved Sanskrutam ', '42', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(43, '43', 'Ayurved Sanskrutam ', '43', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(44, '44', 'Ayurved Sanskrutam ', '44', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(45, '45', 'Ayurved Sanskrutam ', '45', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(46, '46', 'Ayurved Sanskrutam ', '46', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(47, '47', 'Ayurved Sanskrutam ', '47', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(48, '48', 'Ayurved Sanskrutam ', '48', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(49, '49', 'Ayurved Sanskrutam ', '49', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(50, '50', 'Ayurved Sanskrutam ', '50', 'Dr. Vishwanath S. Joshi', 'Ayurved Sanskrutam ', '250', 'Dhanwantari Prakashan', '264', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(51, '51', 'Kriya Sharir (Pratyakshit)', '51', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(52, '52', 'Kriya Sharir (Pratyakshit)', '52', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(53, '53', 'Kriya Sharir (Pratyakshit)', '53', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(54, '54', 'Kriya Sharir (Pratyakshit)', '54', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(55, '55', 'Kriya Sharir (Pratyakshit)', '55', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(56, '56', 'Kriya Sharir (Pratyakshit)', '56', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(57, '57', 'Kriya Sharir (Pratyakshit)', '57', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(58, '58', 'Kriya Sharir (Pratyakshit)', '58', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(59, '59', 'Kriya Sharir (Pratyakshit)', '59', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(60, '60', 'Kriya Sharir (Pratyakshit)', '60', 'Dr. Subash Ranade', 'Kriya Sharir (Pratyakshit)', '175', 'Profeisant prakashan', '237', 'Pune', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(61, '61', 'Kriya Sharir Part -1', '61', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(62, '62', 'Kriya Sharir Part -1', '62', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(63, '63', 'Kriya Sharir Part -1', '63', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(64, '64', 'Kriya Sharir Part -1', '64', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(65, '65', 'Kriya Sharir Part -1', '65', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(66, '66', 'Kriya Sharir Part -1', '66', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(67, '67', 'Kriya Sharir Part -1', '67', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(68, '68', 'Kriya Sharir Part -1', '68', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(69, '69', 'Kriya Sharir Part -1', '69', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(70, '70', 'Kriya Sharir Part -1', '70', 'Vd. D.T.Kodape', 'Kriya Sharir Part -1', '270', 'Dhanwantari Prakashan', '492', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(71, '71', 'Kriya Sharir part-2', '71', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(72, '72', 'Kriya Sharir part-2', '72', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(73, '73', 'Kriya Sharir part-2', '73', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(74, '74', 'Kriya Sharir part-2', '74', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(75, '75', 'Kriya Sharir part-2', '75', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(76, '76', 'Kriya Sharir part-2', '76', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(77, '77', 'Kriya Sharir part-2', '77', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(78, '78', 'Kriya Sharir part-2', '78', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(79, '79', 'Kriya Sharir part-2', '79', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(80, '80', 'Kriya Sharir part-2', '80', 'Vd. D.T.Kodape', 'Kriya Sharir part-2', '250', 'Dhanwantari Prakashan', '465', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Sharir Kriya ', 'Marathi', '6', 1, NULL, NULL),
(81, '81', 'Padharth Vigyan/ Ayurved Itihas', '81', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(82, '82', 'Padharth Vigyan/ Ayurved Itihas', '82', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(83, '83', 'Padharth Vigyan/ Ayurved Itihas', '83', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(84, '84', 'Padharth Vigyan/ Ayurved Itihas', '84', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(85, '85', 'Padharth Vigyan/ Ayurved Itihas', '85', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(86, '86', 'Padharth Vigyan/ Ayurved Itihas', '86', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(87, '87', 'Padharth Vigyan/ Ayurved Itihas', '87', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(88, '88', 'Padharth Vigyan/ Ayurved Itihas', '88', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(89, '89', 'Padharth Vigyan/ Ayurved Itihas', '89', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(90, '90', 'Padharth Vigyan/ Ayurved Itihas', '90', 'Vd. Arun U. Bhatkar', 'Padharth Vigyan/ Ayurved Itihas', '340', 'Meherbaba Prakashan', '460', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(91, '91', 'Rachna Sharir volume-1', '91', ' Dr. Pratibha Shimpi', 'Rachna Sharir volume-1', '450', 'Dhanwantari Prakashan', '338', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(92, '92', 'Rachna Sharir volume-1', '92', ' Dr. Pratibha Shimpi', 'Rachna Sharir volume-1', '450', 'Dhanwantari Prakashan', '338', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(93, '93', 'Rachna Sharir volume-1', '93', ' Dr. Pratibha Shimpi', 'Rachna Sharir volume-1', '450', 'Dhanwantari Prakashan', '338', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(94, '94', 'Rachna Sharir Volume -2', '94', ' Dr. Pratibha Shimpi', 'Rachna Sharir Volume -2', '450', 'Dhanwantari Prakashan', '344', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(95, '95', 'Rachna Sharir Volume -2', '95', ' Dr. Pratibha Shimpi', 'Rachna Sharir Volume -2', '450', 'Dhanwantari Prakashan', '344', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(96, '96', 'Rachna Sharir Volume -2', '96', ' Dr. Pratibha Shimpi', 'Rachna Sharir Volume -2', '450', 'Dhanwantari Prakashan', '344', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(97, '97', 'Pandey\'S Ayurved ANATOMY', '97', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(98, '98', 'Pandey\'S Ayurved ANATOMY', '98', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(99, '99', 'Pandey\'S Ayurved ANATOMY', '99', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(100, '100', 'Pandey\'S Ayurved ANATOMY', '100', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(101, '101', 'Pandey\'S Ayurved ANATOMY', '101', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(102, '102', 'Pandey\'S Ayurved ANATOMY', '102', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(103, '103', 'Pandey\'S Ayurved ANATOMY', '103', 'Dr. vinay Pandey/ Dr. Suresh B. Katre', 'Pandey\'S Ayurved ANATOMY', '610', 'Aquarius Publication', '442', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'Marathi', '6', 1, NULL, NULL),
(104, '104', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '104', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(105, '105', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '105', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(106, '106', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '106', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(107, '107', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '107', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(108, '108', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '108', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(109, '109', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '109', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(110, '110', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '110', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(111, '112', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '112', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(112, '113', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '113', 'Dr.B.M.Bhalme', 'Maulik Siddhant v Dhrusharth Ashtang Hridyam', '300', 'Dhanwantari Prakashan', '469', 'Nagpur', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(113, '114', 'Human Anatomy vol.1', '114', 'B.D. Chaurasia', 'Human Anatomy vol.1', '220', 'CBS publishers', '328', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(114, '115', 'Human Anatomy vol.1', '115', 'B.D. Chaurasia', 'Human Anatomy vol.1', '220', 'CBS publishers', '328', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(115, '116', 'Human Anatomy vol.2', '116', 'B.D. Chaurasia', 'Human Anatomy vol.2', '340', 'CBS publishers', '490', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(116, '117', 'Human Anatomy vol.2', '117', 'B.D. Chaurasia', 'Human Anatomy vol.2', '340', 'CBS publishers', '490', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(117, '118', 'Human Anatomy vol.3', '118', 'B.D. Chaurasia', 'Human Anatomy vol.3', '375', 'CBS publishers', '362', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(118, '119', 'Human Anatomy vol.3', '119', 'B.D. Chaurasia', 'Human Anatomy vol.3', '375', 'CBS publishers', '362', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(119, '120', 'Human Anatomy vol.4', '120', 'B.D. Chaurasia', 'Human Anatomy vol.4', '375', 'CBS publishers', '224', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(120, '121', 'Human Anatomy vol.4', '121', 'B.D. Chaurasia', 'Human Anatomy vol.4', '375', 'CBS publishers', '224', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rachna Sharir ', 'English', '6', 1, NULL, NULL),
(121, '122', 'Human Physiology-1', '122', 'C.C.Chattargee', 'Human Physiology-1', '695', 'CBS publishers', '574', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(122, '123', 'Human Physiology-1', '123', 'C.C.Chattargee', 'Human Physiology-1', '695', 'CBS publishers', '574', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(123, '124', 'Human Physiology-1', '124', 'C.C.Chattargee', 'Human Physiology-1', '695', 'CBS publishers', '574', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(124, '125', 'Human Physiology-1', '125', 'C.C.Chattargee', 'Human Physiology-1', '695', 'CBS publishers', '574', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(125, '126', 'Human Physiology-1', '126', 'C.C.Chattargee', 'Human Physiology-1', '695', 'CBS publishers', '574', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(126, '127', 'Human Physiology-2', '127', 'C.C.Chattargee', 'Human Physiology-2', '675', 'CBS publishers', '510', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(127, '128', 'Human Physiology-2', '128', 'C.C.Chattargee', 'Human Physiology-2', '675', 'CBS publishers', '510', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(128, '129', 'Human Physiology-2', '129', 'C.C.Chattargee', 'Human Physiology-2', '675', 'CBS publishers', '510', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(129, '130', 'Human Physiology-2', '130', 'C.C.Chattargee', 'Human Physiology-2', '675', 'CBS publishers', '510', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(130, '131', 'Human Physiology-2', '131', 'C.C.Chattargee', 'Human Physiology-2', '675', 'CBS publishers', '510', 'Mumbai', 'CR 656', '5/27/2019', '36', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kriya Sharir', 'English', '6', 1, NULL, NULL),
(131, '132', 'Bhaishajyakalpana', '132', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(132, '133', 'Bhaishajyakalpana', '133', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(133, '134', 'Bhaishajyakalpana', '134', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(134, '135', 'Bhaishajyakalpana', '135', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(135, '136', 'Bhaishajyakalpana', '136', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(136, '137', 'Bhaishajyakalpana', '137', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(137, '138', 'Bhaishajyakalpana', '138', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(138, '139', 'Bhaishajyakalpana', '139', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(139, '140', 'Bhaishajyakalpana', '140', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(140, '141', 'Bhaishajyakalpana', '141', 'Vd.Omprakash Tadokar', 'Bhaishajyakalpana', '160', 'Shantanu Prakashan', '296', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(141, '142', 'Rasshashtra', '142', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(142, '143', 'Rasshashtra', '143', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(143, '144', 'Rasshashtra', '144', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(144, '145', 'Rasshashtra', '145', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(145, '146', 'Rasshashtra', '146', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(146, '147', 'Rasshashtra', '147', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(147, '148', 'Rasshashtra', '148', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(148, '149', 'Rasshashtra', '149', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(149, '150', 'Rasshashtra', '150', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(150, '151', 'Rasshashtra', '151', 'Vd.Vinod Sathe', 'Rasshashtra', '250', 'Shantanu Prakashan', '432', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(151, '152', 'Rognidan Bhag-1', '152', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(152, '153', 'Rognidan Bhag-1', '153', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(153, '154', 'Rognidan Bhag-1', '154', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(154, '155', 'Rognidan Bhag-1', '155', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(155, '156', 'Rognidan Bhag-1', '156', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(156, '157', 'Rognidan Bhag-1', '157', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(157, '158', 'Rognidan Bhag-1', '158', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(158, '159', 'Rognidan Bhag-1', '159', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(159, '160', 'Rognidan Bhag-1', '160', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(160, '161', 'Rognidan Bhag-1', '161', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-1', '210', 'Profeisant prakashan', '556', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(161, '162', 'Rognidan Bhag-2', '162', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(162, '163', 'Rognidan Bhag-2', '163', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(163, '164', 'Rognidan Bhag-2', '164', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(164, '165', 'Rognidan Bhag-2', '165', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(165, '166', 'Rognidan Bhag-2', '166', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(166, '167', 'Rognidan Bhag-2', '167', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(167, '168', 'Rognidan Bhag-2', '168', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(168, '169', 'Rognidan Bhag-2', '169', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(169, '170', 'Rognidan Bhag-2', '170', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(170, '171', 'Rognidan Bhag-2', '171', 'dr.Ranade/Dr.Kadaskar', 'Rognidan Bhag-2', '180', 'Profeisant prakashan', '454', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Rognidan', 'Marathi', '6', 1, NULL, NULL),
(171, '172', 'Dravyagunavigyan Bhag 1&2', '172', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(172, '173', 'Dravyagunavigyan Bhag 1&2', '173', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(173, '174', 'Dravyagunavigyan Bhag 1&2', '174', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(174, '175', 'Dravyagunavigyan Bhag 1&2', '175', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(175, '176', 'Dravyagunavigyan Bhag 1&2', '176', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(176, '177', 'Dravyagunavigyan Bhag 1&2', '177', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(177, '178', 'Dravyagunavigyan Bhag 1&2', '178', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(178, '179', 'Dravyagunavigyan Bhag 1&2', '179', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(179, '180', 'Dravyagunavigyan Bhag 1&2', '180', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(180, '181', 'Dravyagunavigyan Bhag 1&2', '181', 'Pra.Deshpande/Javdekar/Ranade', 'Dravyagunavigyan Bhag 1&2', '700', 'Profeisant prakashan', '1043', 'Pune', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'Marathi', '6', 1, NULL, NULL),
(181, '182', 'Charak Samhita part-1', '182', 'Vd.Vijay Kale', 'Charak Samhita part-1', '400', 'choukambba publishers', '896', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(182, '183', 'Charak Samhita part-1', '183', 'Vd.Vijay Kale', 'Charak Samhita part-1', '400', 'choukambba publishers', '896', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(183, '184', 'Charak Samhita part-1', '184', 'Vd.Vijay Kale', 'Charak Samhita part-1', '400', 'choukambba publishers', '896', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(184, '185', 'Charak Samhita part-1', '185', 'Vd.Vijay Kale', 'Charak Samhita part-1', '400', 'choukambba publishers', '896', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL);
INSERT INTO `library_books` (`id`, `reg_no`, `book_code`, `book_no`, `author_name`, `book_name`, `price`, `publication`, `no_of_pages`, `seller`, `bill_no`, `bill_date`, `rack_no`, `receipt_no`, `receipt_date`, `scheme`, `status`, `department`, `medium`, `remark`, `book_status`, `created_at`, `updated_at`) VALUES
(185, '186', 'Charak Samhita part-1', '186', 'Vd.Vijay Kale', 'Charak Samhita part-1', '400', 'choukambba publishers', '896', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(186, '187', 'Essentials of medical pharmacology', '187', 'K.D.Tripathi', 'Essentials of medical pharmacology', '1295', 'Japee Brothers bPublishers', '1064', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'English', '6', 1, NULL, NULL),
(187, '188', 'Essentials of medical pharmacology', '188', 'K.D.Tripathi', 'Essentials of medical pharmacology', '1295', 'Japee Brothers bPublishers', '1064', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Dravyaguna', 'English', '6', 1, NULL, NULL),
(188, '189', 'Toxicology at a  Glance', '189', 'S.K.Singhal', 'Toxicology at a  Glance', '350', 'The National Book Depot', '155', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(189, '190', 'Toxicology at a  Glance', '190', 'S.K.Singhal', 'Toxicology at a  Glance', '350', 'The National Book Depot', '155', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(190, '191', 'Toxicology at a  Glance', '191', 'S.K.Singhal', 'Toxicology at a  Glance', '350', 'The National Book Depot', '155', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(191, '192', 'Toxicology at a  Glance', '192', 'S.K.Singhal', 'Toxicology at a  Glance', '350', 'The National Book Depot', '155', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(192, '193', 'Toxicology at a  Glance', '193', 'S.K.Singhal', 'Toxicology at a  Glance', '350', 'The National Book Depot', '155', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(193, '194', 'Forensic Medicine & Jurisprudence', '194', 'S.K.Singhal', 'Forensic Medicine & Jurisprudence', '500', 'The National Book Depot', '337', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(194, '195', 'Forensic Medicine & Jurisprudence', '195', 'S.K.Singhal', 'Forensic Medicine & Jurisprudence', '500', 'The National Book Depot', '337', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(195, '196', 'Forensic Medicine & Jurisprudence', '196', 'S.K.Singhal', 'Forensic Medicine & Jurisprudence', '500', 'The National Book Depot', '337', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(196, '197', 'Forensic Medicine & Jurisprudence', '197', 'S.K.Singhal', 'Forensic Medicine & Jurisprudence', '500', 'The National Book Depot', '337', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(197, '198', 'Forensic Medicine & Jurisprudence', '198', 'S.K.Singhal', 'Forensic Medicine & Jurisprudence', '500', 'The National Book Depot', '337', 'Mumbai', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'English', '6', 1, NULL, NULL),
(198, '199', 'Rasshashtra Bhaishjyakalpan Charts', '199', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(199, '200', 'Rasshashtra Bhaishjyakalpan Charts', '200', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(200, '201', 'Rasshashtra Bhaishjyakalpan Charts', '201', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(201, '202', 'Rasshashtra Bhaishjyakalpan Charts', '202', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(202, '203', 'Rasshashtra Bhaishjyakalpan Charts', '203', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(203, '204', 'Rasshashtra Bhaishjyakalpan Charts', '204', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(204, '205', 'Rasshashtra Bhaishjyakalpan Charts', '205', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(205, '206', 'Rasshashtra Bhaishjyakalpan Charts', '206', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(206, '207', 'Rasshashtra Bhaishjyakalpan Charts', '207', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(207, '208', 'Rasshashtra Bhaishjyakalpan Charts', '208', 'Vd.Sathe/Vd. Mangle', 'Rasshashtra Bhaishjyakalpan Charts', '130', 'Shantanu Prakashan', '93', 'Ahemadnagar', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'rasshashtra', 'Marathi', '6', 1, NULL, NULL),
(208, '209', 'Vyavharayurved evam vidhivaidyak', '209', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(209, '210', 'Vyavharayurved evam vidhivaidyak', '210', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(210, '211', 'Vyavharayurved evam vidhivaidyak', '211', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(211, '212', 'Vyavharayurved evam vidhivaidyak', '212', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(212, '213', 'Vyavharayurved evam vidhivaidyak', '213', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(213, '214', 'Vyavharayurved evam vidhivaidyak', '214', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(214, '215', 'Vyavharayurved evam vidhivaidyak', '215', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(215, '216', 'Vyavharayurved evam vidhivaidyak', '216', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(216, '217', 'Vyavharayurved evam vidhivaidyak', '217', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(217, '218', 'Vyavharayurved evam vidhivaidyak', '218', 'Dr.Ayodhyaprasad Achal', 'Vyavharayurved evam vidhivaidyak', '290', 'choukambba publishers', '464', 'Delhi', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Hindi', '6', 1, NULL, NULL),
(218, '219', 'Agadtantra Ayurvediya Vishavigyan', '219', 'Dr.Ayodhyaprasad Achal', 'Agadtantra Ayurvediya Vishavigyan', '160', 'Laxmi Bhargava', '97', '', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Marathi', '6', 1, NULL, NULL),
(219, '220', 'Agadtantra Ayurvediya Vishavigyan', '220', 'Dr.Ayodhyaprasad Achal', 'Agadtantra Ayurvediya Vishavigyan', '160', 'Laxmi Bhargava', '97', '', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Marathi', '6', 1, NULL, NULL),
(220, '221', 'Agadtantra Ayurvediya Vishavigyan', '221', 'Dr.Ayodhyaprasad Achal', 'Agadtantra Ayurvediya Vishavigyan', '160', 'Laxmi Bhargava', '97', '', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Marathi', '6', 1, NULL, NULL),
(221, '222', 'Agadtantra Ayurvediya Vishavigyan', '222', 'Dr.Ayodhyaprasad Achal', 'Agadtantra Ayurvediya Vishavigyan', '160', 'Laxmi Bhargava', '97', '', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Marathi', '6', 1, NULL, NULL),
(222, '223', 'Agadtantra Ayurvediya Vishavigyan', '223', 'Dr.Ayodhyaprasad Achal', 'Agadtantra Ayurvediya Vishavigyan', '160', 'Laxmi Bhargava', '97', '', 'CR 656', '5/27/2019', '37', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Agadtantra', 'Marathi', '6', 1, NULL, NULL),
(223, '224', 'Swasthvritta vigyan', '224', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(224, '225', 'Swasthvritta vigyan', '225', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(225, '226', 'Swasthvritta vigyan', '226', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(226, '227', 'Swasthvritta vigyan', '227', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(227, '228', 'Swasthvritta vigyan', '228', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(228, '229', 'Swasthvritta vigyan', '229', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(229, '230', 'Swasthvritta vigyan', '230', 'Dr.S.k. Agrawal', 'Swasthvritta vigyan', '315', 'choukambba publishers', '514', 'varanasi', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Hindi', '6', 1, NULL, NULL),
(230, '231', 'Sampoorna swasthvritta Vigyan', '231', 'Dr.Vijay Patrikar', 'Sampoorna swasthvritta Vigyan', '570', 'Dhanwantari Prakashan', '707', 'Nagpur', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Marathi', '6', 1, NULL, NULL),
(231, '232', 'Sampoorna swasthvritta Vigyan', '232', 'Dr.Vijay Patrikar', 'Sampoorna swasthvritta Vigyan', '570', 'Dhanwantari Prakashan', '707', 'Nagpur', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Marathi', '6', 1, NULL, NULL),
(232, '233', 'Sampoorna swasthvritta Vigyan', '233', 'Dr.Vijay Patrikar', 'Sampoorna swasthvritta Vigyan', '570', 'Dhanwantari Prakashan', '707', 'Nagpur', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Swastvritta', 'Marathi', '6', 1, NULL, NULL),
(233, '234', 'Kaumarbhrityatantra -stree vigyaniya', '234', 'Vd.N.S. Rajwade', 'Kaumarbhrityatantra -stree vigyaniya', '300', 'vaidyamitra prakashan', '694', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(234, '235', 'Kaumarbhrityatantra -stree vigyaniya', '235', 'Vd.N.S. Rajwade', 'Kaumarbhrityatantra -stree vigyaniya', '300', 'vaidyamitra prakashan', '694', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(235, '236', 'Kaumarbhrityatantra -stree vigyaniya', '236', 'Vd.N.S. Rajwade', 'Kaumarbhrityatantra -stree vigyaniya', '300', 'vaidyamitra prakashan', '694', 'Pune', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(236, '237', 'kaumarbhritya', '237', 'A.j. More', 'kaumarbhritya', '575', 'Adwet prakashan', '864', 'Sangamner', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(237, '238', 'kaumarbhritya', '238', 'A.j. More', 'kaumarbhritya', '575', 'Adwet prakashan', '864', 'Sangamner', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(238, '239', 'kaumarbhritya', '239', 'A.j. More', 'kaumarbhritya', '575', 'Adwet prakashan', '864', 'Sangamner', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(239, '240', 'Balchikitsa', '240', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(240, '241', 'Balchikitsa', '241', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(241, '242', 'Balchikitsa', '242', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(242, '243', 'Balchikitsa', '243', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(243, '244', 'Balchikitsa', '244', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(244, '245', 'Balchikitsa', '245', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(245, '246', 'Balchikitsa', '246', 'Dr.Dattatrya Lodhe', 'Balchikitsa', '500', 'Tatvamasi prakashan', '472', 'Ahemadnagar', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'Marathi', '6', 1, NULL, NULL),
(246, '247', 'Textbook of Gyneacology', '247', 'Hiralal Konar', 'Textbook of Gyneacology', '895', 'Health sciences publisher', '574', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(247, '248', 'Textbook of Gyneacology', '248', 'Hiralal Konar', 'Textbook of Gyneacology', '895', 'Health sciences publisher', '574', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(248, '249', 'Textbook of Gyneacology', '249', 'Hiralal Konar', 'Textbook of Gyneacology', '895', 'Health sciences publisher', '574', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(249, '250', 'Textbook of Gyneacology', '250', 'Hiralal Konar', 'Textbook of Gyneacology', '895', 'Health sciences publisher', '574', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(250, '251', 'Textbook of obstetrics', '251', 'Hiralal Konar', 'Textbook of obstetrics', '1150', 'Health sciences publisher', '659', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(251, '252', 'Textbook of obstetrics', '252', 'Hiralal Konar', 'Textbook of obstetrics', '1150', 'Health sciences publisher', '659', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(252, '253', 'Textbook of obstetrics', '253', 'Hiralal Konar', 'Textbook of obstetrics', '1150', 'Health sciences publisher', '659', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(253, '254', 'Textbook of obstetrics', '254', 'Hiralal Konar', 'Textbook of obstetrics', '1150', 'Health sciences publisher', '659', 'Nepal', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Stree-Prasutitantra', 'English', '6', 1, NULL, NULL),
(254, '255', 'Panchkarma Sangrah', '255', 'Dr.Manoj Shamkuwar', 'Panchkarma Sangrah', '360', 'Dhanwantari Prakashan', '391', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Marathi', '6', 1, NULL, NULL),
(255, '256', 'Panchkarma Sangrah', '256', 'Dr.Manoj Shamkuwar', 'Panchkarma Sangrah', '360', 'Dhanwantari Prakashan', '391', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Marathi', '6', 1, NULL, NULL),
(256, '257', 'Panchkarma Sangrah', '257', 'Dr.Manoj Shamkuwar', 'Panchkarma Sangrah', '360', 'Dhanwantari Prakashan', '391', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Marathi', '6', 1, NULL, NULL),
(257, '258', 'Ayurvaidiya Panchkarma Vigyan', '258', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(258, '259', 'Ayurvaidiya Panchkarma Vigyan', '259', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(259, '260', 'Ayurvaidiya Panchkarma Vigyan', '260', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(260, '261', 'Ayurvaidiya Panchkarma Vigyan', '261', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(261, '262', 'Ayurvaidiya Panchkarma Vigyan', '262', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(262, '263', 'Ayurvaidiya Panchkarma Vigyan', '263', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(263, '264', 'Ayurvaidiya Panchkarma Vigyan', '264', 'Vd. Shridhar Kasture', 'Ayurvaidiya Panchkarma Vigyan', '220', 'Baidhyanath publishers', '712', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Panchkarma', 'Hindi', '6', 1, NULL, NULL),
(264, '265', 'Charak Samhita part-2', '265', 'Vijayshankar Kade', 'Charak Samhita part-2', '450', 'choukambba publishers', '1036', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(265, '266', 'Charak Samhita part-2', '266', 'Vijayshankar Kade', 'Charak Samhita part-2', '450', 'choukambba publishers', '1036', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(266, '267', 'Charak Samhita part-2', '267', 'Vijayshankar Kade', 'Charak Samhita part-2', '450', 'choukambba publishers', '1036', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(267, '268', 'Charak Samhita part-2', '268', 'Vijayshankar Kade', 'Charak Samhita part-2', '450', 'choukambba publishers', '1036', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(268, '269', 'Charak Samhita part-2', '269', 'Vijayshankar Kade', 'Charak Samhita part-2', '450', 'choukambba publishers', '1036', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'Marathi', '6', 1, NULL, NULL),
(269, '270', 'GHAI Essentials Pedriatics', '270', 'Vinod Paul,Arvind Bagga', 'GHAI Essentials Pedriatics', '1095', 'CBS publishers', '798', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'English', '6', 1, NULL, NULL),
(270, '271', 'GHAI Essentials Pedriatics', '271', 'Vinod Paul,Arvind Bagga', 'GHAI Essentials Pedriatics', '1095', 'CBS publishers', '798', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'English', '6', 1, NULL, NULL),
(271, '272', 'GHAI Essentials Pedriatics', '272', 'Vinod Paul,Arvind Bagga', 'GHAI Essentials Pedriatics', '1095', 'CBS publishers', '798', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'English', '6', 1, NULL, NULL),
(272, '273', 'GHAI Essentials Pedriatics', '273', 'Vinod Paul,Arvind Bagga', 'GHAI Essentials Pedriatics', '1095', 'CBS publishers', '798', 'Mumbai', 'CR 656', '5/27/2019', '38', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaumarbhritya', 'English', '6', 1, NULL, NULL),
(273, '274', 'Kaychikitsa paper-1', '274', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(274, '275', 'Kaychikitsa paper-1', '275', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(275, '276', 'Kaychikitsa paper-1', '276', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(276, '277', 'Kaychikitsa paper-1', '277', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(277, '278', 'Kaychikitsa paper-1', '278', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(278, '279', 'Kaychikitsa paper-1', '279', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(279, '280', 'Kaychikitsa paper-1', '280', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(280, '281', 'Kaychikitsa paper-1', '281', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(281, '282', 'Kaychikitsa paper-1', '282', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(282, '283', 'Kaychikitsa paper-1', '283', 'Dr.S.K. jaiswal', 'Kaychikitsa paper-1', '250', 'Rashtrasant publishers', '422', 'Yawatmal', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(283, '284', 'Kayachikitsa', '284', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(284, '285', 'Kayachikitsa', '285', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(285, '286', 'Kayachikitsa', '286', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(286, '287', 'Kayachikitsa', '287', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(287, '288', 'Kayachikitsa', '288', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(288, '289', 'Kayachikitsa', '289', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(289, '290', 'Kayachikitsa', '290', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(290, '291', 'Kayachikitsa', '291', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(291, '292', 'Kayachikitsa', '292', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(292, '293', 'Kayachikitsa', '293', 'Vd.Y.G. Joshi', 'Kayachikitsa', '450', 'Sampada Publishers', '672', 'Pune', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'Marathi', '6', 1, NULL, NULL),
(293, '294', 'Netrarog Vigyan', '294', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(294, '295', 'Netrarog Vigyan', '295', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(295, '296', 'Netrarog Vigyan', '296', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(296, '297', 'Netrarog Vigyan', '297', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(297, '298', 'Netrarog Vigyan', '298', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(298, '299', 'Netrarog Vigyan', '299', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(299, '300', 'Netrarog Vigyan', '300', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(300, '301', 'Netrarog Vigyan', '301', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(301, '302', 'Netrarog Vigyan', '302', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(302, '303', 'Netrarog Vigyan', '303', 'Dr. N.Vidhvans', 'Netrarog Vigyan', '340', 'Vimal Publication', '436', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(303, '304', 'Shiro-Karna-Nasa,Mukhrog', '304', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(304, '305', 'Shiro-Karna-Nasa,Mukhrog', '305', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(305, '306', 'Shiro-Karna-Nasa,Mukhrog', '306', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(306, '307', 'Shiro-Karna-Nasa,Mukhrog', '307', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(307, '308', 'Shiro-Karna-Nasa,Mukhrog', '308', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(308, '309', 'Shiro-Karna-Nasa,Mukhrog', '309', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(309, '310', 'Shiro-Karna-Nasa,Mukhrog', '310', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(310, '311', 'Shiro-Karna-Nasa,Mukhrog', '311', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(311, '312', 'Shiro-Karna-Nasa,Mukhrog', '312', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(312, '313', 'Shiro-Karna-Nasa,Mukhrog', '313', 'Dr. N.Vidhvans', 'Shiro-Karna-Nasa,Mukhrog', '280', 'Vimal Publication', '343', 'Nashik', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'Marathi', '6', 1, NULL, NULL),
(313, '314', 'Shalayatantra Part-1', '314', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(314, '315', 'Shalayatantra Part-1', '315', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(315, '316', 'Shalayatantra Part-1', '316', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(316, '317', 'Shalayatantra Part-1', '317', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(317, '318', 'Shalayatantra Part-1', '318', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(318, '319', 'Shalayatantra Part-1', '319', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(319, '320', 'Shalayatantra Part-1', '320', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(320, '321', 'Shalayatantra Part-1', '321', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(321, '322', 'Shalayatantra Part-1', '322', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '280', 'Shantanu Prakashan', '540', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(322, '323', 'Shalayatantra Part-1', '323', 'Anantkumar Shekokar', 'Shalayatantra Part-1', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(323, '324', 'Shalyatantra part -2', '324', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(324, '325', 'Shalyatantra part -2', '325', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(325, '326', 'Shalyatantra part -2', '326', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(326, '327', 'Shalyatantra part -2', '327', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(327, '328', 'Shalyatantra part -2', '328', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(328, '329', 'Shalyatantra part -2', '329', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(329, '330', 'Shalyatantra part -2', '330', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(330, '331', 'Shalyatantra part -2', '331', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(331, '332', 'Shalyatantra part -2', '332', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(332, '333', 'Shalyatantra part -2', '333', 'Anantkumar Shekokar', 'Shalyatantra part -2', '200', 'Shantanu Prakashan', '374', 'Ahemadnagar', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'Hindi', '6', 1, NULL, NULL),
(333, '334', 'Research Methodology and Medical Satistics', '334', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(334, '335', 'Research Methodology and Medical Satistics', '335', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(335, '336', 'Research Methodology and Medical Satistics', '336', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(336, '337', 'Research Methodology and Medical Satistics', '337', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(337, '338', 'Research Methodology and Medical Satistics', '338', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(338, '339', 'Research Methodology and Medical Satistics', '339', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(339, '340', 'Research Methodology and Medical Satistics', '340', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(340, '341', 'Research Methodology and Medical Satistics', '341', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(341, '342', 'Research Methodology and Medical Satistics', '342', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(342, '343', 'Research Methodology and Medical Satistics', '343', 'Dr. Amol Velhal', 'Research Methodology and Medical Satistics', '200', 'Dhanwantari Prakashan', '362', 'Nagpur', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Samhita siddhant ', 'English', '6', 1, NULL, NULL),
(343, '344', 'ENT Diseases', '344', 'K.B.Bhargaw', 'ENT Diseases', '925', 'Usha publications', '478', 'Mumbai', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'English', '6', 1, NULL, NULL),
(344, '345', 'ENT Diseases', '345', 'K.B.Bhargaw', 'ENT Diseases', '925', 'Usha publications', '478', 'Mumbai', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'English', '6', 1, NULL, NULL),
(345, '346', 'ENT Diseases', '346', 'K.B.Bhargaw', 'ENT Diseases', '925', 'Usha publications', '478', 'Mumbai', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'English', '6', 1, NULL, NULL),
(346, '347', 'ENT Diseases', '347', 'K.B.Bhargaw', 'ENT Diseases', '925', 'Usha publications', '478', 'Mumbai', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'English', '6', 1, NULL, NULL),
(347, '348', 'ENT Diseases', '348', 'K.B.Bhargaw', 'ENT Diseases', '925', 'Usha publications', '478', 'Mumbai', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalakyatantra', 'English', '6', 1, NULL, NULL),
(348, '349', 'Manual on clinical Surgery', '349', 'S. Das', 'Manual on clinical Surgery', '1030', 'Das publishers', '648', 'kolkata', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'English', '6', 1, NULL, NULL),
(349, '350', 'Manual on clinical Surgery', '350', 'S. Das', 'Manual on clinical Surgery', '1030', 'Das publishers', '648', 'kolkata', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Shalyatantra', 'English', '6', 1, NULL, NULL),
(350, '351', 'Manual of practical Medicine', '351', 'R.Alagappan', 'Manual of practical Medicine', '1150', 'Health sciences publisher', '1018', 'Bangladesh', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(351, '352', 'Manual of practical Medicine', '352', 'R.Alagappan', 'Manual of practical Medicine', '1150', 'Health sciences publisher', '1018', 'Bangladesh', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(352, '353', 'Principle\'s and Practice of Medicine', '353', 'Davidsons\'s', 'Principle\'s and Practice of Medicine', '2395', 'Elsevier publiser', '1417', 'London', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(353, '354', 'Principle\'s and Practice of Medicine', '354', 'Davidsons\'s', 'Principle\'s and Practice of Medicine', '2395', 'Elsevier publiser', '1417', 'London', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(354, '355', 'Golwalla\'s medicine', '355', 'A.F.Golwalla', 'Golwalla\'s medicine', '1395', 'Jaypee Publishers', '1160', 'New Delhi', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(355, '356', 'Golwalla\'s medicine', '356', 'A.F.Golwalla', 'Golwalla\'s medicine', '1395', 'Jaypee Publishers', '1160', 'New Delhi', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(356, '357', 'Golwalla\'s medicine', '357', 'A.F.Golwalla', 'Golwalla\'s medicine', '1395', 'Jaypee Publishers', '1160', 'New Delhi', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL),
(357, '358', 'Golwalla\'s medicine', '358', 'A.F.Golwalla', 'Golwalla\'s medicine', '1395', 'Jaypee Publishers', '1160', 'New Delhi', 'CR 656', '5/27/2019', '39', 'CR 656', '5/27/2019', 'Pustak Pedhi', 'Available', 'Kaychikitsa', 'English', '6', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `library_journal`
--

DROP TABLE IF EXISTS `library_journal`;
CREATE TABLE IF NOT EXISTS `library_journal` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `library_journal`
--

INSERT INTO `library_journal` (`id`, `registration_no`, `author_name`, `name`, `price`, `pages`, `publisher`, `seller`, `date`, `bill_no`, `created_at`, `updated_at`) VALUES
(1, 'M1', 'Jayant Jahagirdar', 'Arogya chikitsa ( Sept 2007) ( ed -12)', '20', '31', 'Balchandra Prakashan', 'Jalgoan', '', '123', NULL, NULL),
(2, 'M2', 'Jayant Jahagirdar', 'Arogya chikitsa ( March 2008)(ed -6)', '20', '31', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(3, 'M3', 'Jayant Jahagirdar', 'Arogya chikitsa (June 2008 ) (ed-9)', '20', '31', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(4, 'M4', 'Jayant Jahagirdar', 'Arogya chikitsa (july 2008 ) ( ed-10)', '20', '31', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(5, 'M5', 'Jayant Jahagirdar', 'Arogya chikitsa ( Dem 2009 ) ( ed -3)', '20', '23', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(6, 'M6', 'Jayant Jahagirdar', 'Arogya chikitsa ( Nov 2010) ( ed -2)', '20', '27', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(7, 'M7', 'Jayant Jahagirdar', 'Arogya chikitsa ( Jan 2010 ) (ed - 4)', '20', '27', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(8, 'M8', 'Jayant Jahagirdar', 'Arogya chikitsa ( Jan 2011) ( ed -4)', '20', '23', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(9, 'M9', 'Jayant Jahagirdar', 'Arogya chikitsa (Feb 2011) ( ed -5)', '20', '23', 'Balchandra Prakashan', 'Jalgoan', '', '', NULL, NULL),
(10, 'M10', 'Anju G. Mamtani', 'Swasth vatika (ed 21)', '25', '82', 'Gkumar Prakashan', 'Jalgoan', '', '', NULL, NULL),
(11, 'M11', 'Harish Pharma', 'Dhanwantari ( Jan 2011) ', '', '38', 'Harish Pharma', '', '4/15/2011', '', NULL, NULL),
(12, 'M12', 'Dr. S.K. Maheshwari', 'Ayushman ( Grishma ritu 2011)', '25', '101', 'Ayushman Publisher', 'Bhopal', '4/15/2011', '', NULL, NULL),
(13, 'M13', 'Jayant Jahagirdar', 'Arogya chikitsa ( April 2011)', '20', '23', 'Bhalchandra Prakashan', 'Jalgoan', '5/2/2011', '', NULL, NULL),
(14, 'M14', 'Shri . Kuashikbhai P. Vani', 'Rishi Prasad PO. Vani', '6', '34', 'Asaram Publisher ', '', '5/2/2011', '', NULL, NULL),
(15, 'M15', 'Sawanad S. Pandit', 'Ayurved patrika ', '25', '46', 'Replica Printers', 'Nashik', '5/2/2011', '', NULL, NULL),
(16, 'M16', 'Swami Vedehatmaanand', 'Vivek jyoti', '8', '195', 'Sayog Publisher', 'Raipur', '5/2/2011', '', NULL, NULL),
(17, 'M17', 'Shrikany Mundadha ', 'Hruday Matri', '15', '32', 'Sudha nidhi Publisher', 'Aligarh', '', '', NULL, NULL),
(18, 'M18', 'Vd. Gopal Sharan Garag', 'Sudha nidhi ( june 2011 )', '10', '40', 'Sudha nidhi Publisher', 'Aligarh', '8/17/2011', '', NULL, NULL),
(19, 'M19', 'Vd. Gopal Sharan Garag', 'Sudha nidhi ( May 2011)', '10', '40', 'Sudha nidhi Publisher', 'Aligarh', '8/17/2011', '', NULL, NULL),
(20, 'M20', 'Vd. Gopal Sharan Garag', 'Sudha nidhi ( April 2011)', '10', '36', 'Sudha nidhi Publisher', 'Aligarh', '8/17/2011', '', NULL, NULL),
(21, 'M21', 'Vd. Gopal Sharan Garag', 'Sudha nidhi ( Jan 2011)', '10', '40', 'Sudha nidhi Publisher', 'Aligarh', '8/17/2011', '', NULL, NULL),
(22, 'M22', 'Tarachand Sharma', 'Ayurved Mahasammelan Patrika', '20', '50', 'A.B.Ayurved Mahasammelan', '', '', '', NULL, NULL),
(23, 'M23', 'Swami Vedehatmaanand', 'Vivek jyoti ( August - 2011 )', '8', '396', 'Sanyog Offset Publisher', 'Raipur', '5/25/2011', '', NULL, NULL),
(24, 'M24', 'Vandana Mule', 'Srujan Chikitsa ( Dvaimasik ) July - August 2011', '', '40', 'Mankarnika Publication', 'Pune', '5/25/2011', '', NULL, NULL),
(25, 'M25', 'Nandakumar Mule', 'Vaidya Raj ( May-June-July 2011 )', '20', '62', 'Aswad Prakashan', 'Mumbai', '5/25/2011', '', NULL, NULL),
(26, 'M26', 'Rajesh Sharma', 'Sanjivani Medical Times( August-2011)', '10', '11', '', 'Delhi', '9/23/2011', '', NULL, NULL),
(27, 'M27', 'Rajesh Sharma', 'Sanjivani Medical Times( July-2011)', '10', '11', '', 'Delhi', '9/20/2011', '', NULL, NULL),
(28, 'M28', 'Nandakumar Mule', 'Vaidya Raj ( August-September-October 2011 )', '20', '40', 'Aswad Prakashan', 'Mumbai', '9/28/2011', '', NULL, NULL),
(29, 'M29', 'Prakash Aathav', 'Patanjal Yogdarshan Sutre-Anvayarth-Artha v Yam Niyam', '150', '188', 'Jai Vyasanmukti Prakashan', '', '11/9/2011', '', NULL, NULL),
(30, 'M30', 'Priyanka Bhagat', 'Siddhankur ( Traimasik pratham varsh 2011 )', '', '78', 'Siddhakala Prakasha ', '', '11/9/2011', '', NULL, NULL),
(31, 'M31', 'Vinod Chaudhari', 'Aayujyot-2011', '', '49', '', '', '11/9/2011', '', NULL, NULL),
(32, 'M32', 'Anup Kumar Jha', 'Phytopharm', '', '55', 'Quality Creators', 'Karnataka', '11/5/2011', '', NULL, NULL),
(33, 'M33', 'Anju G. Mamtani', 'Swasth vatika ( Oct.- Dec. 2011 )', '25', '82', 'Jikumar Prakashan', 'Nagpur', '11/17/2011', '', NULL, NULL),
(34, 'M34', 'Govind prasad Upadhyay', 'Sachitra-Ayurved ( Oct.-Dec.- 2011 )', '40', '72', 'Baidyanath Publication', 'Nagpur', '11/23/2011', '', NULL, NULL),
(35, 'M35', 'Vinod Maheshwari', 'Navbharat Varshikank-2011', '150', '246', 'Navbharat Prakashan', '', '11/30/2011', '', NULL, NULL),
(36, 'M36', 'Swanand S. Pandit', 'Ayurved Patrika ( Dec. - 2011 )', '25', '50', 'K.M.Joshi Publication', 'Nashik', '12/12/2011', '', NULL, NULL),
(37, 'M37', 'Vandana Mule', 'Srujan Chikitsa ( Dvaimasik ) Sep.-Oct. 2011', '', '40', 'Mankarnika Publication', 'Pune', '12/12/2011', '', NULL, NULL),
(38, 'M38', 'Swami Vedehatmaanand', 'Vivek jyoti ( Dec. - 2011 )', '8', '596', 'Sanyog Offset Publisher', 'Raipur', '12/12/2011', '', NULL, NULL),
(39, 'M39', 'Vivek Ghalsasi', 'Tarun Bharat Dipawali-2000', '', '', 'Aaudyogik Prakashan ', '', '', '', NULL, NULL),
(40, 'M40', 'Satyanand Aarya', 'Jivan Sanchetna', '', '48', 'Radhelal Gupta Prakashan', 'Delhi', '', '', NULL, NULL),
(41, 'M41', 'Sada Dumbre', 'Saptahik Sakal ( Aug.-2004 )', '', '84', 'Sakal Printing Press', 'Pune', '', '', NULL, NULL),
(42, 'M42', 'Arun Bhasme', 'Homiodarpan', '', '73', 'Gopal Khetre Prakashan', '', '', '', NULL, NULL),
(43, 'M43', 'Radheshyam Khemka', 'Kalyan', '', '560', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(44, 'M44', 'Radheshyam Khemka', 'Kalyan', '', '608', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(45, 'M45', 'Radheshyam Khemka', 'Kalyan', '', '656', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(46, 'M46', 'Radheshyam Khemka', 'Kalyan', '', '652', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(47, 'M47', 'Radheshyam Khemka', 'Kalyan', '', '800', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(48, 'M48', 'Radheshyam Khemka', 'Kalyan', '', '848', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(49, 'M49', 'Radheshyam Khemka', 'Kalyan', '', '888', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(50, 'M50', 'Radheshyam Khemka', 'Kalyan', '', '936', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(51, 'M51', 'Radheshyam Khemka', 'Kalyan', '', '984', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(52, 'M52', 'Radheshyam Khemka', 'Kalyan', '', '604', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(53, 'M53', 'Radheshyam Khemka', 'Kalyan', '', '932', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(54, 'M54', 'Radheshyam Khemka', 'Kalyan', '', '652', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(55, 'M55', 'Radheshyam Khemka', 'Kalyan', '', '644', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(56, 'M56', 'Radheshyam Khemka', 'Kalyan', '', '836', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(57, 'M57', 'Radheshyam Khemka', 'Kalyan', '', '692', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(58, 'M58', 'Radheshyam Khemka', 'Kalyan', '', '596', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(59, 'M59', 'Radheshyam Khemka', 'Kalyan', '', '740', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(60, 'M60', 'Radheshyam Khemka', 'Kalyan', '', '788', 'Keshorame Agrawal Prakashan', '', '', '', NULL, NULL),
(61, 'M61', 'Subhash Ranade ', 'Shree Dhanvantari ( Dec.- 2011 )', '3', '18', 'Komt Print Prakashan', 'Pune', '12/17/2011', '', NULL, NULL),
(62, 'M62', 'Gopalsharan Garg', 'Sudha nidhi ( Nov.- 2011 )', '10', '36', 'Sudha nidhi Publisher', 'Vijaygarh', '12/22/2011', '', NULL, NULL),
(63, 'M63', 'Jayant Jahagirdar', 'Aarogya Chikitsa (Dec. - 2011 )', '20', '23', 'Aksharmudra Publisher', 'Jalgoan', '12/22/2011', '', NULL, NULL),
(64, 'M64', 'Swanand S. Pandit', 'Ayurved Patrika ( Dec. - 2011 )', '25', '50', 'Shri K.M.Joshi Seva  Sangh ', 'Nashik', '12/22/2011', '', NULL, NULL),
(65, 'M65', 'Vandana Mule', 'Srujan Chikitsa ( Dec. - 2011 )', '60', '40', 'Mankarnika Publication', 'Pune', '12/29/2011', '', NULL, NULL),
(66, 'M66', '', 'Varshik Ahvaal ( 2010 - 2011 )', '', '15', 'Sheth Govindji Mahavidyalaya', 'Solapur', '12/29/2011', '', NULL, NULL),
(67, 'M67', 'Radheshyam Khemka', 'Kalyan', '', '844', 'Govind Bhavan Publisher', '', '', '', NULL, NULL),
(68, 'M68', 'Subhash Ranade ', 'Shree Dhanvantari ( Jan. 2012 )', '3', '18', 'Compt Print Kalpana Publisher', 'Pune', '1/17/2012', '', NULL, NULL),
(69, 'M69', '', 'Sanjeevani Medical ( Dec. 2011 )', '10', '', 'Rajesh Sharma Publisher', 'Delhi', '1/18/2012', '', NULL, NULL),
(70, 'M70', 'Swami Satyaswarupanand', 'Vivek - Jyoti', '8', '95', 'Ramkrushna Mission Publisher', 'Raipur', '2/6/2012', '', NULL, NULL),
(71, 'M71', '', 'Catalouge ( 2012 )', '5', '73', 'Shri Satguru Publisher', 'Delhi', '2/6/2012', '', NULL, NULL),
(72, 'M72', '', 'Indian Medical Science Series ( 2011 )', '5', '15', 'Shri Satguru Publisher', 'Delhi', '2/6/2012', '', NULL, NULL),
(73, 'M73', '', 'Indian Medical Science Series ( 2011 )', '5', '15', 'Shri Satguru Publisher', 'Delhi', '2/6/2012', '', NULL, NULL),
(74, 'M74', '', 'Indian Medical Science Series ( 2011 )', '5', '15', 'Shri Satguru Publisher', 'Delhi', '2/6/2012', '', NULL, NULL),
(75, 'M75', 'Amita Kaushal', 'Blood And Blood Disorders', '', '45', 'Thummi Enterprises', 'Bangalore', '2/1/2012', '', NULL, NULL),
(76, 'M76', 'Kiran Jha', 'Phytopharm', '85', '71', 'Herbal Publisher', 'Delhi', '2/1/2012', '', NULL, NULL),
(77, 'M77', 'Subhash Ranade ', 'Shree Dhanvantari ( Feb. 2012 )', '3', '18', 'Compt Print Kalpana Publisher', 'Pune', '', '', NULL, NULL),
(78, 'M78', '', 'Catalouge ( 2012 )', '', '', 'Shri Satguru Publisher', 'Delhi', '', '', NULL, NULL),
(79, 'M79', '', 'Catalouge ( 2012 )', '', '72', 'Shri Satguru Publisher', 'Delhi', '', '', NULL, NULL),
(80, 'M80', '', 'Indian Medical Science Series ( 2011 )', '', '15', 'Shri Satguru Publisher', 'Delhi', '', '', NULL, NULL),
(81, 'M81', 'A.Amit', 'Journal of Natural Remedies ( Jan. 2012 )', '250', '91', 'R.K. Agarwal Publisher', 'Bangalore', '', '', NULL, NULL),
(82, 'M82', 'Anup Kumar Jha', 'Phytopharm ( Feb. 2012 )', '85', '64', 'Kiran Jha Publisher', 'Delhi', '', '', NULL, NULL),
(83, 'M83', 'Subhash Ranade ', 'Shree Dhanvantari ( Mar. 2012 )', '3', '18', 'Compt Print Kalpana Publisher', 'Pune', '3/2/2012', '', NULL, NULL),
(84, 'M84', 'Jayant Jahagirdar', 'Aarogya Chikitsa (Mar. - 2012 )', '20', '27', 'Bhalchandra Prakashan', 'Jalgoan', '3/14/2012', '', NULL, NULL),
(85, 'M85', 'Anup Kumar Jha', 'Phytopharm ( Mar. 2012 )', '85', '59', 'Krishna Publisher', 'Delhi', '4/2/2012', '', NULL, NULL),
(86, 'M86', 'Darshan Shankar ', 'Heritage Amruth', '40', '49', 'Medplan Conservatory Publisher', 'Bangalore', '4/28/2012', '', NULL, NULL),
(87, 'M87', 'Anup Kumar Jha', 'Phytopharm ( Feb. 2012 )', '85', '56', 'Krishna Publisher', 'Delhi', '5/3/2012', '', NULL, NULL),
(88, 'M88', 'Subhash Ranade ', 'Shree Dhanvantari ', '3', '18', 'Compt Print Kalpana Publisher', 'Pune', '4/18/2012', '', NULL, NULL),
(89, 'M89', 'Vandana Mule', 'Srujan Chikitsa ( Mar - April )', '', '40', 'Mankarnika Publication', 'Pune', '5/27/2012', '', NULL, NULL),
(90, 'M90', 'Anup Kumar Jha', 'Phytopharm ', '85', '54', 'Kiran Jha Publisher', 'Delhi', '6/2/2012', '', NULL, NULL),
(91, 'M91', 'Radhaballabh Agarwal', 'Dhanwantari ( April 2012 )', '3', '40', 'Harish Pharma', 'Aligarh', '6/5/2012', '', NULL, NULL),
(92, 'M92', 'Jayant Jahagirdar', 'Aarogya Chikitsa ( June 2012 )', '20', '23', 'Shanipeth Publisher', 'Jalgoan', '6/19/2012', '', NULL, NULL),
(93, 'M93', 'Gopalsharan Garg', 'Sudha nidhi ( May 2012 )', '10', '40', 'Sudha nidhi Publisher', 'Vijaygarh', '6/19/2012', '', NULL, NULL),
(94, 'M94', 'Subhash Ranade ', 'Shree Dhanvantari ( June 2012 )', '3', '18', 'Shree Dhanvantari  Prakashan', 'Pune', '6/21/2012', '', NULL, NULL),
(95, 'M95', 'Subhash Ranade ', 'Shree Dhanvantari ( May 2012 )', '3', '18', 'Shree Dhanvantari  Prakashan', 'Pune', '6/21/2012', '', NULL, NULL),
(96, 'M96', 'Anup Kumar Jha', 'Phytopharm', '85', '56', 'Kiran Jha Publisher', 'Delhi', '7/3/2012', '', NULL, NULL),
(97, 'M97', 'Vandana Mule', 'Srujan Chikitsa  ( May - June 2012 )', '', '40', 'Mankarnika Publication', 'Pune', '7/14/2012', '', NULL, NULL),
(98, 'M98', 'Radhaballabh Agarwal', 'Dhanwantari ( May 2012 )', '3', '40', 'Harish Pharma', 'Aligarh', '7/17/2012', '', NULL, NULL),
(99, 'M99', 'Radhaballabh Agarwal', 'Dhanwantari ( June 2012 )', '3', '40', 'Harish Pharma', 'Aligarh', '7/18/2012', '', NULL, NULL),
(100, 'M100', 'Mamtaani', 'Swastha Vatika', '25', '90', 'Jikumar Prakashan', 'Nagpur', '7/27/2012', '', NULL, NULL),
(101, 'M101', 'S.P. Kinjawadekar', 'Journal of NIMA', '15', '30', 'Bhupesh Gupta Publisher', 'Mumbai', '8/3/2012', '', NULL, NULL),
(102, 'M102', 'Radhaballabh Agarwal', 'Dhanwantari ', '10', '40', 'Harish Pharma', 'Aligarh', '8/16/2012', '', NULL, NULL),
(103, 'M103', '', 'Indian Medical Science Series ( 2012 )', '5', '15', 'Satguru Publication', 'Delhi', '8/19/2012', '', NULL, NULL),
(104, 'M104', '', 'Indian Medical Science Series ( 2012 )', '5', '15', 'Satguru Publication', 'Delhi', '8/19/2012', '', NULL, NULL),
(105, 'M105', '', 'Indian Medical Science Series ( 2012 )', '5', '15', 'Satguru Publication', 'Delhi', '8/19/2012', '', NULL, NULL),
(106, 'M106', '', 'Catalouge ( 2012 )', '5', '73', 'Satguru Publication', 'Delhi', '', '', NULL, NULL),
(107, 'M107', 'Jayant Jahagirdar', 'Aarogya Chikitsa ( Aug 2012 )', '20', '23', 'Jayant Jahagirdar Publisher', 'Jalgoan', '8/23/2012', '', NULL, NULL),
(108, 'M108', 'Anup Kumar Jha', 'Phytopharm ( Jul 2012 )', '85', '46', 'Kiran Jha Publisher', 'Delhi ', '8/28/2012', '', NULL, NULL),
(109, 'M109', 'A.Amit', 'Journal of Natural Remedies ( Jul. 2012 )', '250', '174', 'R.K. Agarwal Publisher', 'Bangalore', '8/28/2012', '', NULL, NULL),
(110, 'M110', 'Jayant Jahagirdar', 'Aarogya Chikitsa', '20', '23', 'Jayant Jahagirdar Publisher', 'Jalgoan', '7/27/2012', '', NULL, NULL),
(111, 'M111', 'R.H. Singh', 'Annals of Ayurvedic Medicine', 'Complimentary Copy', '55', '', 'Lucknow', '', '', NULL, NULL),
(112, 'M112', 'Vandana Mule', ' Srujan Chikitsa  ( Jul - Aug 2012 )', '', '40', 'Bhagyashri Printers', 'Pune', '9/5/2012', '', NULL, NULL),
(113, 'M113', 'Anup Kumar Jha', 'Phytopharm ( Aug 2012 )', '85', '52', 'Kiran Jha Publisher', 'Delhi ', '9/7/2012', '', NULL, NULL),
(114, 'M114', 'Swami Videhatmanand', 'Vivek Jyoti ( Sept 2012 )', '8', '445', 'Ramkrushna Mission Publisher', 'Raipur', '9/11/2012', '', NULL, NULL),
(115, 'M115', 'M.S. Nair', 'Glitters of Ayurveda', '', '36', 'Shree Narayana Publisher', 'Kollam', '9/12/2012', '', NULL, NULL),
(116, 'M116', 'Arun Jamkar', 'Varta Vishesh', '', '19', 'Suryakar Masrur Publisher', 'Nashik', '9/18/2012', '', NULL, NULL),
(117, 'M117', 'Subhash Ranade ', 'Shree Dhanvantari', '3', '18', 'Shree Dhanvantari  Prakashan', 'Pune', '9/18/2012', '', NULL, NULL),
(118, 'M118', 'Gopalsharan Garg', 'Sudha nidhi ( Jun.- 2012 )', '10', '40', 'Sudha nidhi Prakashan', 'Vijaygarh', '9/29/2012', '', NULL, NULL),
(119, 'M119', 'Jayant Jahagirdar', 'Aarogya Chikitsa ( Sept 2012 )', '20', '23', 'Aksharmudra Publisher', 'Jalgaon', '9/29/2012', '', NULL, NULL),
(120, 'M120', 'Gopalsharan Garg', 'Sudha nidhi ( Sept.- 2012 )', '10', '40', 'Sudha nidhi Prakashan', 'Aligarh', '10/5/2012', '', NULL, NULL),
(121, 'M121', 'Swanand S. Pandit', 'Ayurved Patrika', '25', '74', 'Joshi Karyalya Prakashan', 'Nashik', '10/13/2012', '', NULL, NULL),
(122, 'M122', 'Radhaballabh Agarwal', 'Dhanwantari ', '10', '40', 'Harish Pharma', 'Aligarh', '10/13/2012', '', NULL, NULL),
(123, 'M123', 'R.H. Singh', 'Annals of Ayurvedic Medicine', '', '57', 'Annals of Ayurvedic Medicine', 'Lucknow', '9/26/2012', '', NULL, NULL),
(124, 'M124', 'S.P. Kinjawadekar', 'Journal of NIMA ( Sept 2012 )', '15', '30', 'New Age Printing Press ', 'Mumbai', '', '', NULL, NULL),
(125, 'M125', 'Subhash Ranade ', 'Shree Dhanvantari ( Oct 2012 )', '3', '17', 'Compt Print Kalpana Publisher', 'Pune', '10/19/2012', '', NULL, NULL),
(126, 'M126', 'Vandana Mule', 'Srujan Chikitsa ( Sept - Oct 2012 )', '', '40', 'Mankarnika Publication', 'Pune', '10/31/2012', '', NULL, NULL),
(127, 'M127', 'Anup Kumar Jha', 'Phytopharm ( Sept 2012 )', '85', '48', 'Krishna Publisher', 'Delhi', '10/31/2012', '', NULL, NULL),
(128, 'M128', 'Rohini D. Bharadwaj', 'KVG Ayur New ( Sept - Nov 2012 )', '', '15', 'KVG Ayurved Publisher', 'Puttur', '10/31/2012', '', NULL, NULL),
(129, 'M129', 'Jayant Jahagirdar', 'Aarogya Chikitsa ( Oct 2012 )', '20', '', 'Jayant Jahagirdar Publisher', 'Jalgaon', '10/31/2012', '', NULL, NULL),
(130, 'M130', 'Anup Kumar Jha', 'Phytopharm ( Oct 2012 )', '85', '48', 'Krishna Publisher', 'Delhi', '11/2/2012', '', NULL, NULL),
(131, 'M131', 'S.P. Kinjawadekar', 'Journal of NIMA ( Oct 2012 )', '15', '', 'Bhupesh Gupta Publisher', 'Mumbai', '11/2/2012', '', NULL, NULL),
(132, 'M132', 'Gopalsharan Garg', 'Sudha nidhi ( Octt.- 2012 )', '10', '32', 'Sudha nidhi Publisher', 'Vijaygarh', '11/7/2012', '', NULL, NULL),
(133, 'M133', 'Swami Videhatmanand', 'Vivek Jyoti ( Oct 2012 )', '', '496', 'Ramkrushna Mission Publisher', 'Raipur', '', '', NULL, NULL),
(134, 'M134', 'Swami Videhatmanand', 'Vivek Jyoti ( Nov 2012 )', '8', '545', 'Ramkrushna Mission Publisher', 'Raipur', '11/7/2012', '', NULL, NULL),
(135, 'M135', 'Gopalsharan Garg', 'Sudha nidhi ( Oct.- 2012 )', '10', '40', 'Sudha nidhi Publisher', 'Aligarh', '11/2/2012', '', NULL, NULL),
(136, 'M136', 'Mamtaani', 'Swastha Vatika', '25', '', 'Jikumar Prakashan', 'Nagpur', '', '', NULL, NULL),
(137, 'M137', 'Swanand S. Pandit', 'Ayurved Patrika', '25', '52', 'Joshi Karyalya Prakashan', 'Nashik', '11/27/2012', '', NULL, NULL),
(138, 'M138', 'Radhaballabh Agarwal', 'Dhanwantari ( Oct 2012 )', '10', '40', 'Harish Pharma', 'Aligarh', '11/27/2012', '', NULL, NULL),
(139, 'M139', 'Nandakumar Mule', ' Vaidyaraj Deepavali 2012', '80', '154', 'Siddhi Offset Publication', 'Mumbai', '11/27/2012', '', NULL, NULL),
(140, 'M140', 'R.H. Singh', 'Annals of Ayurvedic Medicine', '', '122', 'Annals of Ayurvedic Medicine', 'Lucknow', '11/27/2012', '', NULL, NULL),
(141, 'M141', 'Anup Kumar Jha', 'Phytopharm ( Nov 2012 )', '85', '54', 'Krishna Publisher', 'Delhi', '12/1/2012', '', NULL, NULL),
(142, 'M142', 'Jayant Jahagirdar', 'Aarogya Chikitsa ( Nov 2012 )', '20', '23', 'Bhalchandra Prakashan', 'Jalgaon', '12/6/2012', '', NULL, NULL),
(143, 'M143', 'S.P. Kinjawadekar', 'Journal of NIMA ( Nov 2012 )', '15', '26', 'New Age Printing Press ', 'Mumbai', '12/6/2012', '', NULL, NULL),
(144, 'M144', 'Vinod Maheshwari', 'Navbharat Varshikank-2012', '150', '206', 'Navbharat Prakashan', 'Nagpur', '', '', NULL, NULL),
(145, 'M145', 'Vandana Mule', 'Srujan Chikitsa ( Nov - Dec 2012 )', '', '40', 'Mankarnika Publication', 'Pune', '12/20/2012', '', NULL, NULL),
(146, 'M146', 'Swanand S. Pandit', 'Ayurved Patrika 2012', '25', '48', 'Joshi Karyalya Prakashan', 'Nashik', '12/20/2012', '', NULL, NULL),
(147, 'M147', 'Subhash Ranade ', 'Shree Dhanwantari ( Dec 2012 )', '3', '18', 'Shree Dhanwantari Prakashan', 'Pune', '12/22/2012', '', NULL, NULL),
(148, 'M148', 'Swanand S. Pandit', 'Ayurved Patrika ( Dec. - 2012 )', '25', '60', 'Joshi Karyalya Prakashan', 'Nashik', '12/29/2012', '', NULL, NULL),
(149, 'M149', 'Jayant Jahagirdar', 'Aarogya Chikitsa ( Dec 2012 )', '20', '23', 'Bhalchandra Prakashan', 'Jalgaon ', '1/11/2013', '', NULL, NULL),
(150, 'M150', 'Anup Kumar Jha', 'Phytopharm ( Dec 2012 )', '85', '44', 'Kiran Jha Publisher', 'Delhi ', '1/3/2013', '', NULL, NULL),
(151, 'M151', 'Swami Videhatmanand', 'Vivek Jyoti January -2013', '81', '45', 'Ramkrushna Mission Publisher', 'Raipur', '1/4/2013', '', NULL, NULL),
(152, 'M152', 'Dr. S.P.Kinjawadekar', 'Journal Of National Integrated Medical Association2012', '15', '22', 'New Age Printing Press ', 'Mumbai', '1/4/2013', '', NULL, NULL),
(153, 'M153', 'Gopalsharan Garg', 'Sudhanidhi November 2012', '10', '40', 'Sudhanidhikaryalay', 'Vijaygadh', '12/11/2012', '', NULL, NULL),
(154, 'M154', 'Swami Videhatmanand', 'Vivek Jyoti December-2012', '81', '594', 'Ramkrushna Mission Publisher', 'Raipur', '', '', NULL, NULL),
(155, 'M155', 'Radhaballabh Agarwal', 'Dhanvantari November-2012', '3', '40', 'Harish Pharma', 'Aligarh', '1/15/2013', '', NULL, NULL),
(156, 'M156', 'Subhash Ranade ', 'Dhanwantari', '3', '18', 'Dhanvantari', 'Pune', '1/29/2013', '', NULL, NULL),
(157, 'M157', 'Dr. S.P.Kinjawadekar', 'Journal Of National Integrated Medical Association2013', '15', '26', 'New Age Printing Press ', 'Mumbai', '1/29/2013', '', NULL, NULL),
(158, 'M158', 'Jayant Jahagirdar', 'Arogya chikitsa January -2013', '20', '21', 'Jayant Jahagirdar Publisher', 'Jalgaon', '2/2/2013', '', NULL, NULL),
(159, 'M159', 'Radhaballabh Sati', 'Dhanwantari', '', '40', 'Harish Pharma', 'Aligarh', '2/3/2013', '', NULL, NULL),
(160, 'M160', 'Gopalsharan Garg', 'Sudhanidhi January 2012', '10', '40', 'Sudhanidhi karyalay', 'Aligarh', '2/8/2013', '', NULL, NULL),
(161, 'M161', 'Jayant Jahagirdar', 'Arogya chikitsa January -2013', '', '21', 'Bhalchandra Prakashan', 'Jalgaon', '2/20/2013', '', NULL, NULL),
(162, 'M162', 'Vandana Mule', 'Srujan Chikitsa Jan-Feb-2013', '', '40', 'Mankarnika Publication', 'Pune', '3/5/2013', '', NULL, NULL),
(163, 'M163', 'Swanand S. Pandit', 'Ayurved Patrika', '25', '50', 'Joshi Karyalya Prakashan', 'Nashik', '3/19/2013', '', NULL, NULL),
(164, 'M164', 'Subhash Ranade ', 'Dhanwantari', '3', '18', 'Dhanvantari', 'Pune', '3/19/2013', '', NULL, NULL),
(165, 'M165', 'Anup Kumar Jha', 'Phytopharm Feb 2013', '85', '44', 'Quality Creators', 'Delhi', '3/19/2013', '', NULL, NULL),
(166, 'M166', 'Prof .R.H.Singh ', 'Annals of Ayurvedic Medicine', '', '180', 'Annals of Ayurvedic Medicine', 'Lucknow', '3/19/2013', '', NULL, NULL),
(167, 'M167', 'Latik Kirmani', 'Herbal Chikitsa March -2013', '40', '76', 'Masik Herbal Chikitsalay', 'Delhi', '3/25/2013', '', NULL, NULL),
(168, 'M168', 'S.P. Kinjawadekar', 'Journal Of The NIMA March 2013', '15', '22', 'New Age Printing Press ', 'Mumbai', '4/2/2013', '', NULL, NULL),
(169, 'M169', 'Abhilash Gupta ', 'Bramha Ayurved March -May ', '40', '46', 'Mamta Printing Press', 'Delhi', '4/2/2013', '', NULL, NULL),
(170, 'M170', 'Bharat Chargade ', 'Journal Of Indian System Of Medicine Jan-june-2013', '', '52', 'Dutta Meghe Institute Of Medical sciences ,Nagpur', 'Wardha ', '4/4/2013', '', NULL, NULL),
(171, 'M171', 'Jayant Jahagirdar', 'Aarogya Chikitsa March-2013', '', '23', 'Aarogya Chikitsa Prakashan', 'Jalgaon', '4/17/2013', '', NULL, NULL),
(172, 'M172', 'Jayant Jahagirdar', 'Aarogya Chikitsa April-2013', '', '23', 'Aarogya Chikitsa Prakashan', 'Jalgaon', '4/20/2013', '', NULL, NULL),
(173, 'M173', 'Subhash Ranade ', 'Shree Dhanvantri April-2013', '3', '18', 'Dhanvantari Prakashan', 'Pune', '4/20/2013', '', NULL, NULL),
(174, 'M174', 'Swanand S. Pandit', 'Ayurved Patrika April -2013', '30', '48', 'K.M.Joshi Publication', 'Nashik', '4/23/2013', '', NULL, NULL),
(175, 'M175', 'Anup Kumar Jha', 'Phytopharm March-2013', '85', '52', 'Krishna Publisher', 'Delhi', '4/23/2013', '', NULL, NULL),
(176, 'M176', 'Swami Videhatmanand', 'Vivek Jyoti March-2013', '8', '96', 'Sanyog Offset Publisher', 'Raipur', '4/17/2013', '', NULL, NULL),
(177, 'M177', 'Swami Videhatmanand', 'Vivek Jyoti February-2013', '8', '96', 'Sanyog Offset Publisher', 'Raipur', '4/17/2013', '', NULL, NULL),
(178, 'M178', 'Swanand S. Pandit', 'Ayurved Patrika', '25', '52', 'K.M.Joshi Publication', 'Nashik', '', '', NULL, NULL),
(179, 'M179', 'Swami Videhatmanand', 'Vivek Jyoti May-2013', '87', '245', 'Sanyog Offset Publisher', 'Raipur', '5/9/2013', '', NULL, NULL),
(180, 'M180', 'Mamtaani', 'Swastha Vatika', '30', '90', 'Jikumar Prakashan', 'Nagpur', '5/16/2013', '', NULL, NULL),
(181, 'M181', 'Gopalsharan Garg', 'Sudha Nidhi April -2013', '10', '40', 'Sudha nidhi Prakashan', 'Aligarh', '5/18/2013', '', NULL, NULL),
(182, 'M182', 'Jayant Jahagirdar', 'Aarogya Chikitsa May-2013', '20', '23', 'Aarogya Chikitsa Prakashan', 'Jalgaon', '5/18/2013', '', NULL, NULL),
(183, 'M183', 'Suhas Joshi', 'Shree Dhanvantri May-2013', '3', '18', 'Vaidyamitra Prakashan', 'Pune', '5/30/2013', '', NULL, NULL),
(184, 'M184', 'Latif Kirmani', 'Herbal Chikitsa ', '40', '98', 'Swami Prakashan', 'Delhi', '5/30/2013', '', NULL, NULL),
(185, 'M185', 'Vandana Mule', 'Srujan Chikitsa Mar.-April-2013', '', '40', 'Mankarnika Publication', 'Pune', '5/30/2013', '', NULL, NULL),
(186, 'M186', 'Nandakumar Mule', 'Vaidyaraj ( May June July )', '25', '62', 'Siddhi Offset Publication', 'Mumbai', '5/31/2013', '', NULL, NULL),
(187, 'M187', 'Swanand S. Pandit', 'Ayurved Patrika May -2013', '30', '52', 'K.M.Joshi Publication', 'Nashik', '6/1/2013', '', NULL, NULL),
(188, 'M188', 'Anup Kumar Jha', 'Phytopharm April-2013', '85', '44', 'Kiran Jha Publisher', 'Delhi', '6/7/2013', '', NULL, NULL),
(189, 'M189', 'Balkrushna Kamble', 'Aarogya Patrika April-2013', '', '50', 'Balkrushna Kamble Publication', 'Pune', '', '', NULL, NULL),
(190, 'M190', 'S.P. Kinjawadekar', 'Journal Of The NIMA May- 2013', '15', '30', 'New Age Printing Press ', 'Mumbai', '7/2/2013', '', NULL, NULL),
(191, 'M191', 'Jayant Jahagirdar', 'Aarogya Chikitsa June-2013', '20', '23', 'Aarogya Chikitsa Prakashan', 'Jalgaon', '7/5/2013', '', NULL, NULL),
(192, 'M192', 'Swami Videhatmanand', 'Vivek Jyoti July-2013', '8', '', 'Sanyog Offset Publisher', 'Raipur', '7/5/2013', '', NULL, NULL),
(193, 'M193', 'Radhavallabh Agrawal', 'Dhanvantari May-2013', '', '39', 'Harish Pharma', 'Aligarh', '7/6/2013', '', NULL, NULL),
(194, 'M194', 'Radhavallabh Agrawal', 'Dhanvantari ', '', '39', 'Harish Pharma', 'Aligarh', '7/10/2013', '', NULL, NULL),
(195, 'M195', 'Gopalsharan Garg', 'Sudha Nidhi June-2013', '', '', 'Sudha nidhi Prakashan', 'Aligarh', '7/10/2013', '', NULL, NULL),
(196, 'M196', 'Latif Kirmani', 'Herbal Chikitsa ', '40', '98', 'Swami Prakashan', 'Delhi', '7/22/2013', '', NULL, NULL),
(197, 'M197', '', 'OMICS Group', '', '', '', '', '', '', NULL, NULL),
(198, 'M198', '', 'OMICS Group', '', '', '', '', '', '', NULL, NULL),
(199, 'M199', 'Vandana Mule', 'Srujan Chikitsa May- June-2013', '', '40', 'Mankarnika Publication', 'Pune', '7/27/2013', '', NULL, NULL),
(200, 'M200', 'Nandakumar Mule', 'Vaidyaraj  ( feb.,march,April-2013 )', '25', '62', 'Kamat Aaudyogik Prakashan', 'Mumbai', '', '', NULL, NULL),
(201, 'M201', 'S.P. Kinjawadekar', 'Journal Of The NIMA ', '15', '31', 'New Age Printing Press ', 'Mumbai', '8/6/2013', '', NULL, NULL),
(202, 'M202', 'Swami Videhatmanand', 'Vivek Jyoti August-2013', '8', '396', 'Ramkrushna Mission Publisher', 'Raipur', '8/6/2013', '', NULL, NULL),
(203, 'M203', 'Subhash Ranade ', 'Shree Dhanvantari August-2013', '3', '18', 'Shree Dhanvantari  Prakashan', 'Pune', '8/28/2013', '', NULL, NULL),
(204, 'M204', 'Swadesh Agrawal', 'Pranacharya Aarogyam July-2013', '10', '40', '', 'Aligarh', '8/30/2013', '', NULL, NULL),
(205, 'M205', 'Navinchandra Joshi', 'Ayush Darpan', '20', '44', 'Pritika Printers Prakashan', 'Uttarakhand', '8/30/2013', '', NULL, NULL),
(206, 'M206', 'Jayant Jahagirdar', 'Aarogya Chikitsa August-2013', '20', '23', 'Aarogya Chikitsa Prakashan', 'Jalgaon', '9/2/2013', '', NULL, NULL),
(207, 'M207', 'R.A.Chaudhari', 'Harbal Chikitsa', '40', '98', 'Vilis Offset Publisher', 'Delhi', '9/2/2013', '', NULL, NULL),
(208, 'M208', 'Vandana Mule', 'Srujan Chikitsa July - August-2013', '', '40', 'Mankarnika Publication', 'Pune', '9/7/2013', '', NULL, NULL),
(209, 'M209', 'Shantilal Agrawal', 'Niramay', '', '52', 'Ayurved Prakashan', 'Ahamdabad', '', '', NULL, NULL),
(210, 'M210', 'Gopalsharan Garg', 'Sudha Nidhi May-2013', '10', '40', 'Sudha nidhi Prakashan', 'Aligarh', '6/27/2013', '', NULL, NULL),
(211, 'M211', 'Suhas Joshi', 'Shree Dhanvantri ', '3', '18', 'Dhanvantari Prakashan', 'Pune', '9/18/2013', '', NULL, NULL),
(212, 'M212', 'Amita Kaushal', 'Heaitage Amruth', '40', '48', 'Jarukabande Prakashan', 'Bangalore', '9/25/2013', '', NULL, NULL),
(213, 'M213', 'R.A.Chaudhari', 'Harbal Chikitsa Sep.-2013', '40', '98', 'Vilis Offset Publisher', 'Delhi', '9/28/2013', '', NULL, NULL),
(214, 'M214', 'Tarachand Sharma', 'Ayurved Mahasammelan Patrika Sep.-2013', '20', '49', 'Akhil Bhartiya Prakashan', 'Delhi', '9/30/2013', '', NULL, NULL),
(215, 'M215', 'Swanand S. Pandit', 'Ayurved Patrika', '30', '48', 'K.M.Joshi Publication', 'Nashik', '10/18/2013', '', NULL, NULL),
(216, 'M216', 'Jayant Jahagirdar', 'Aarogya Chikitsa Sep.-2013', '20', '23', 'Aarogya Chikitsa Prakashan', 'Jalgaon', '10/4/2013', '', NULL, NULL),
(217, 'M217', 'Radhavallabh Agrawal', 'Dhanvantari ', '10', '40', 'Harish Pharma', 'Aligarh', '10/4/2013', '', NULL, NULL),
(218, 'M218', 'Subhash Ranade ', 'Shree Dhanvantari ', '3', '18', 'Shree Dhanvantari  Prakashan', 'Pune', '10/18/2013', '', NULL, NULL),
(219, 'M219', 'Prashant Shastri', 'Souvenir & Abstract', '', '60', 'Siddhakala Prakashan ', 'Sangamner', '', '', NULL, NULL),
(220, 'M220', 'Vishwanath Sharma', 'Sachitra-Ayurved ( Sep.- 2013 )', '40', '55', 'Baidyanath Publication', 'Nagpur', '10/18/2013', '', NULL, NULL),
(221, 'M221', 'S.P. Kinjawadekar', 'Journal Of The NIMA ( Oct.-2013 )', '15', '34', 'New Age Printing Press ', 'Mumbai', '10/25/2013', '', NULL, NULL),
(222, 'M222', 'Tarachand Sharma', 'Ayurved Mahasammelan Patrika Oct.-2013', '20', '50', 'Chanakya Mudra Prakashan', 'Delhi', '10/25/2013', '', NULL, NULL),
(223, 'M223', 'Radhavallabh Agrawal', 'Dhanvantari ', '10', '40', 'Harish Pharma', 'Aligarh', '10/24/2013', '', NULL, NULL),
(224, 'M224', 'Gopalsharan Garg', 'Sudha Nidhi Sep.-2013', '', '40', 'Sudha nidhi Prakashan', 'Aligarh', '11/6/2013', '', NULL, NULL),
(225, 'M225', 'Anju G. Mamtani', 'Swastha Vatika', '30', '90', 'Jikumar Prakashan', 'Nagpur', '11/6/2013', '', NULL, NULL),
(226, 'M226', 'Swanand S. Pandit', 'Ayurved Patrika', '30', '46', 'K.M.Joshi Publication', 'Nashik', '11/19/2013', '', NULL, NULL),
(227, 'M227', 'Tarachand Sharma', 'Ayurved Mahasammelan Patrika November-2013', '20', '50', 'Chanakya Mudra Prakashan', 'Delhi', '11/19/2013', '', NULL, NULL),
(228, 'M228', 'M.S.Bagh', 'Ayu ( Jan.-March-2013 )', '', '132', 'Kanara Business Centre', 'Gujrat', '11/16/2013', '', NULL, NULL),
(229, 'M229', 'Subhash Ranade ', 'Shree Dhanvantari Nov.-2013', '3', '18', 'Vaidyamitra  Prakashan', 'Pune', '11/19/2013', '', NULL, NULL),
(230, 'M230', 'Latif Kirmani', 'Herbal Chikitsa Oct.-2013', '40', '98', 'Masik Harbal Prakashan', 'Delhi', '10/25/2013', '', NULL, NULL),
(231, 'M231', 'S.K.Maheshwari', 'Ayushman', '30', '102', 'Rashtriya Hindi Prakashan', 'Bhopal', '10/25/2013', '', NULL, NULL),
(232, 'M232', 'Gopalsharan Garg', 'Sudha Nidhi Oct.-2013', '', '31', 'Sudha nidhi Prakashan', 'Aligarh', '11/23/2013', '', NULL, NULL),
(233, 'M233', 'Vandana Mule', 'Srujan Chikitsa Oct.-2013', '', '40', 'Bhagyashri Printers', 'Pune', '11/26/2013', '', NULL, NULL),
(234, 'M234', 'M.S.Bagh', 'Ayu ( April-June-2013 )', '', '232', 'Kanara Business Centre', 'Jamnagar', '', '', NULL, NULL),
(235, 'M235', 'Subhash Ranade ', 'Shree Dhanvantari ', '3', '18', 'Dhanvantari  Prakashan', 'Pune', '1/18/2014', '', NULL, NULL),
(236, 'M236', '', 'Evecare A Quarterly Punlication Of The Himalaya Drug Company', '', '32', 'Himalya drug  Company', '', '8/14/2013', '', NULL, NULL),
(237, 'M237', 'Rajan K.Pejver', 'Perinatology Journal Of Perinatal & Neonatal care', '', '42', 'Himalya drug  Company', '', '8/14/2013', '', NULL, NULL),
(238, 'M238', 'Pralhad S.Patki', 'Probe Exprloriing Ancient & Modern Medical Learning ', '', '68', 'Himalya drug  Company', '', '8/14/2013', '', NULL, NULL),
(239, 'M239', 'Philipe Haydon ', 'Infoline For The Doctors Of Tommoro', '', '19', 'Himalya drug  Company', '', '8/14/2013', '', NULL, NULL),
(240, 'M240', '', 'Capsule Himalaya Health Digest For You', '', '11', 'Himalya drug  Company', '', '8/14/2013', '', NULL, NULL),
(241, 'M241', 'Pralhad S.Patki', 'Probe Exprloriing Ancient & Modern Medical Learning ', '', '80', 'Himalya drug  Company', '', '8/14/2013', '', NULL, NULL),
(242, 'M242', 'Philipe Haydon ', 'Infoline For The Doctors Of Tommoro', '', '19', 'Himalya drug  Company', '', '10/12/2013', '', NULL, NULL),
(243, 'M243', 'Philipe Haydon ', 'Pediritz Dedicated To Pediatrics ', '', '11', 'Himalya drug  Company', '', '10/12/2013', '', NULL, NULL),
(244, 'M244', 'Dattatray Kharosekar', 'Dipastanmbha', '', '155', 'Indo Interprizes', 'Latur', '9/11/2013', '', NULL, NULL),
(245, 'M245', 'Latif Kirmani', 'Harbal Chikitsa ', '40', '98', 'Grifix Designer', '', '11/27/2013', '', NULL, NULL),
(246, 'M246', '', 'Ayurveda Rasashala House Of Quality Products', '15', '27', 'Ayurveda Rasashala', '', '12/3/2013', '', NULL, NULL),
(247, 'M247', 'Anju G. Mamtani', 'Swasth Watika ', '30', '90', 'Mamtani Dapatti Dwara Sampadit ', '', '12/12/2013', '', NULL, NULL),
(248, 'M248', '', 'AYU', '', '336', 'Gajral Ayurved University ', '', '1/13/2014', '', NULL, NULL),
(249, 'M249', 'Swanand S. Pandit', 'Ayurved Patrika ', '30', '46', 'Aushadhi bhawan ayurvedic Sevasanga ', 'Nashik', '', '', NULL, NULL),
(250, 'M250', 'Swanand S. Pandit', 'Ayurved Patrika ', '30', '106', 'Aushadhi bhawan ayurvedic Sevasanga ', 'Nashik', '1/15/2014', '', NULL, NULL),
(251, 'M251', 'Rasamrut Ayurved Niyatkalik', 'Ayurved', '', '', '', '', '', '', NULL, NULL),
(252, 'M252', '', 'Warta Vishesh 2012', '', '22', 'A.N.Suryakar ', 'Nashik', '', '', NULL, NULL),
(253, 'M253', 'Swanand . Pandit', 'Ayurved Patrika March 2014', '30', '52', 'Karyavah Ayuved Sewasanghrah', 'Nashik', '', '', NULL, NULL),
(254, 'M254', 'Mamatani', 'Swasthwatica', '30', '90', 'Jikumar Prakashan', 'Nagpur', '1/25/2014', '', NULL, NULL),
(255, 'M255', 'Latif Kirmani', 'Harbal Chikitsa', '40', '98', 'Karyalah, 3A ', 'Delhi', '1/24/2014', '', NULL, NULL),
(256, '', '', '', '', '', '', '', '', '', NULL, NULL),
(257, 'M256', 'Jayanta Jahagirdar', 'Arogya Chikitsa feb.2014', '20', '24', '192, Shanipet', 'Jalgaon', '', '', NULL, NULL),
(258, 'M258', 'Pralad S. Pataki', 'Capsule  ', '', '10', 'P.S.Pataki', 'Maheshwarm', '3/29/2014', '', NULL, NULL),
(259, 'M259', 'K.k. Shanmu Khan ', 'Netra Mitram', '', '14', 'Shrikant P. Kooyhattukulam', ' Kooyhattukulam', '3/22/2014', '', NULL, NULL),
(260, 'M260', 'Philipe Haydon ', 'Infoline ', '', '20', 'Philipe Haydon ', 'Bangalore', '5/24/2014', '', NULL, NULL),
(261, 'M261', 'Vandana Muley', 'Srujan chikitsa ', '', '40', 'Girish Dagadulal Gandhi', 'Pune', '6/17/2014', '', NULL, NULL),
(262, 'M262', 'K. R. Kohli', 'Ayurveda', '', '22', 'Association of Manufacturers of Ayurvedic Medicines ', 'Ghaziyabad', '7/5/2014', '', NULL, NULL),
(263, 'M263', 'Govind Upadhya', 'Sachitra Ayurved', '50', '64', 'Baidyanath Ayurved Bhavan ', 'Nagpur', '8/25/2014', '', NULL, NULL),
(264, 'M264', '', 'Ctalogue', '', '47', 'Chaukhambha ', 'Varanasi', '3/8/2014', '', NULL, NULL),
(265, 'M265', 'Latif Kirmani', 'Harbal Chikitsa', '40', '100', 'Lisis Ofset', 'Dehli', '9/30/2014', '', NULL, NULL),
(266, 'M266', 'Pankaj Agrawal', 'Pranacharya Arogyam', '12', '40', 'Pranacharya Bhavan', 'Vijaygadh', '9/30/2014', '', NULL, NULL),
(267, 'M267', 'Suhas Joshi', ' Shree Dhanwatari', '3', '20', ' Shree Dhanwatari ', 'Mumbai', '9/30/2014', '', NULL, NULL),
(268, 'M268', 'J. N. Sastry', 'Ayurveda', '', '24', 'Association of Manufacturers of Ayurvedic Medicines ', 'Dehli', '9/15/2014', '', NULL, NULL),
(269, 'M269', 'Jayshree  Keshav', 'Probe', '', '80', 'The Himalaya Drug Company', 'Bangalore', '12/27/2014', '', NULL, NULL),
(270, 'M270', 'Jayshree  Keshav', 'Probe', '', '80', 'The Himalaya Drug Company', 'Bangalore', '12/27/2014', '', NULL, NULL),
(271, 'M271', 'Jayshree  Keshav', 'Liv line', '', '4', 'The Himalaya Drug Company', 'Bangalore', '12/27/2014', '', NULL, NULL),
(272, 'M272', 'Swadesh Agrawal', 'Arogyam', '12', '40', 'Pranacharya  Arogyam', 'Mathura', '12/27/2014', '', NULL, NULL),
(273, 'M273', 'Latif Kirmani', 'Harbal Chikitsa', '40', '98', 'Bilis ofset', 'Dehli', '12/27/2014', '', NULL, NULL),
(274, 'M274', 'Surendran', 'Bhishan News', '', '', 'kerala Ayurvedic Studies Research', 'Kottakkal', '12/27/2014', '', NULL, NULL),
(275, 'M275', 'Ram Mohan', 'Treaties', '', '48', 'Ayurvedic Medical Association', '', '12/13/2014', '', NULL, NULL),
(276, 'M276', '', 'Sudhanidhi', '', '40', 'Sudhanidhi Dak', 'Aligadh', '12/29/2014', '', NULL, NULL),
(277, 'M277', 'Jayashree Koshav', 'Probe', '', '24', 'Association of Manufacturers of Ayurvedic Medicines ', 'Delhi', '8/25/2014', '', NULL, NULL),
(278, 'M278', 'Swanand Pandit', 'Ayurved Patrika', '30', '52', 'Ayurved Seva Sangh ', 'Nashik', '8/25/2014', '', NULL, NULL),
(279, 'M279', 'K. Tripathi', 'Journal of National Intigrated Association ', '15', '22', 'Journal of National Intigrated Association ', 'Mumbai', '2/1/2015', '', NULL, NULL),
(280, 'M280', 'Pankaj Agrawal', 'Arogyam', '12', '40', 'Nai chipeti', 'Mathura', '1/24/2015', '', NULL, NULL),
(281, 'M281', 'Anup Jha', 'Phytopharm', '170', '56', 'Herble Inf. Centre', 'Dehli', '1/24/2015', '', NULL, NULL),
(282, 'M282', 'Vandana Muley', 'Srujan chikitsa ', '', '40', 'Bhagyashree Printers ', 'Pune', '1/3/2014', '', NULL, NULL),
(283, 'M283', 'J. N. Sastry', 'Ayurveda', '', '38', 'Association of Manufacturers of Ayurvedic Medicines ', 'Ghaziyabad', '1/2/2015', '', NULL, NULL),
(284, 'M284', 'Ramesh Mehata', 'Journal of National Intigrated Association ', '15', '24', ' National Intigrated Association ', 'Mumbai', '1/2/2015', '', NULL, NULL),
(285, 'M285', 'V. P. Jogalekar', 'Shree Dhanwantari', '3', '18', 'Sadashiv', 'Pune', '2/20/2015', '', NULL, NULL),
(286, 'M286', 'Surendran', 'Bhishan News', '', '4', 'Bhishak Publication Division', 'Kottakkal', '2/20/2015', '', NULL, NULL),
(287, 'M287', 'Swadesh Agrawal', 'Pranacharya Arogyam Feb-2015', '12', '38', 'Pranacharya Arogyam', 'Mathura', '5/25/2015', '', NULL, NULL),
(288, 'M288', 'Gopal Garg', 'Sudhanidhi', '', '24', 'Sudhanidhi  Karyalay', 'Vijaygadh', '3/25/2015', '', NULL, NULL),
(289, 'M289', 'Shankar Kinjawadekar', 'Journal of National Intigrated Medical Association ', '15', '20', 'Journal of National Intigrated Medical Association ', 'Mumbai', '3/25/2015', '', NULL, NULL),
(290, 'M290', 'V. P. Jogalekar', 'Shree Dhanwantari', '3', '20', 'Com Print', 'Pune', '3/25/2015', '', NULL, NULL),
(291, 'M291', 'Swanand Pandit', 'Ayurved Patrika', '30', '52', 'Ayurved Seva Sangh ', 'Nashik', '3/30/2015', '', NULL, NULL),
(292, 'M292', '', 'Catlogue2015', '5', '80', 'Sree Satguru Publication', 'Delhi', '4/2/2015', '', NULL, NULL),
(293, 'M293', '', 'Catlogue2015', '5', '80', 'Sree Satguru Publication', 'Delhi', '4/2/2015', '', NULL, NULL),
(294, 'M294', 'Latif Kirmani', 'Harbal Chikitsa', '40', '98', 'Sawmi Prakashan', 'Dehli', '4/2/2015', '', NULL, NULL),
(295, 'M295', 'Pralad S. Pataki', 'Probe', '', '86', 'Himalaya Drug Company', 'Bangalore', '4/2/2015', '', NULL, NULL),
(296, 'M296', '', 'Pediritz Dedicated to Pediatrics', '', '11', 'Himalaya Drug Company', 'Bangalore', '4/2/2015', '', NULL, NULL),
(297, 'M297', 'Jayashree Koshav', 'Liv line', '', '3', 'Himalaya Drug Company', 'Bangalore', '4/2/2015', '', NULL, NULL),
(298, 'M298', 'K.K Agrawal', 'Alloveda', '', '8', 'IJCP Group Publication', 'Bangalore', '4/2/2015', '', NULL, NULL),
(299, 'M299', '', 'Indian Medical Science Seeies-2015', '5', '16', 'Sree Satguru Publication', 'Dehli', '4/2/2015', '', NULL, NULL),
(300, 'M300', 'Latif Kirmani', 'Harbal Chikitsa', '40', '98', 'Sawmi Prakashan', 'Dehli', '8/18/2014', '', NULL, NULL),
(301, 'M301', '', 'Indian Medical Science Seeies', '', '12', 'Sree Satguru Publication', 'Dehli', '18-4-1015', '', NULL, NULL),
(302, 'M302', 'Swanand Pandit', 'Ayurved Patrika', '30', '52', 'Ayurved Seva Sangh ', 'Nashik', '18-4-1015', '', NULL, NULL),
(303, 'M303', 'Swanand Pandit', 'Ayurved Patrika', '30', '52', 'Ayurved Seva Sangh ', 'Nashik', '18-4-1015', '', NULL, NULL),
(304, 'M304', '', 'Catologue -2015', '5', '80', 'Sree Satguru Publication', '', '18-4-1015', '', NULL, NULL),
(305, 'M305', 'Gopal Garg', 'Siddhaprayog Sangrah Evam Anubhut Ayu. Chikitsa', '', '', 'Grag Vanoaoushdhi Bhandar', 'Vijaygadh', '18-4-1016', '', NULL, NULL),
(306, 'M306', 'Latif Kirmani', 'Harbal Chikitsa', '40', '94', 'Sawmi Prakashan', 'Delhi', '4/21/2015', '', NULL, NULL),
(307, 'M307', 'Swanand Pandit', 'Ayurved Patrika', '30', '50', 'Sree Satguru Publication', 'Nahik', '4/22/2015', '', NULL, NULL),
(308, 'M308', 'Kinjwadekar', 'Journal of National Intigrated Medical Association ', '30', '18', 'New Age Printing ', '', '', '', NULL, NULL),
(309, 'M309', '', 'International Ayurveda Congess', '', '18', 'Gupta Bhavan', 'Mumbai', '', '', NULL, NULL),
(310, 'M310', 'Sheilesh Nadkarni', 'Arogyamandir', '', '8', 'Shree Dhuppapeshwar ', 'Mumbai', '', '', NULL, NULL),
(311, 'M311', 'Prakash Khaparde', 'Amruta 2015', '', '124', 'Akshar Julvani Design', 'Nagpur', '5/6/2015', '', NULL, NULL),
(312, 'M312', '', 'Sheth Govindaji Ayu. Varshik Visheshank', '', '45', 'Bhudhvar Peth Samrat ', 'Solapur', '5/6/2015', '', NULL, NULL),
(313, 'M313', 'Vandana Muley', 'Srujan chikitsa Traimasik', '', '40', 'Mankarnika Publication ', 'Pune', 'Mar-Apr 2015', '', NULL, NULL),
(314, 'M314', 'Latif Kirmani', 'Harbal Chikitsa', '', '', '', '', '', '', NULL, NULL),
(315, 'M315', '', 'Journals of Indian System Medicine ', '', '55', '', '', '15-May', '', NULL, NULL),
(316, 'M316', 'Gopal Garg', 'Sudhanidhi', '', '40', 'Sudhanidhi Karyalay', 'Vijaygadh', '5/25/2015', '', NULL, NULL),
(317, 'M317', 'V. P. Jogalekar', 'Shree Dhanwantari', '', '18', 'Vaimitra', 'Pune', '5/16/2015', '', NULL, NULL),
(318, 'M318', 'Pradip Upadhyay', 'Pavan Parampara', '25', '72', 'Arpit Prakashan ', 'Nagpur', 'Apr-June 2015', '', NULL, NULL),
(319, 'M319', 'Pradip Upadhyay', 'Pavan Parampara', '25', '72', 'Arpit Prakashan ', 'Nagpur', 'Oct-Dec 2016', '', NULL, NULL),
(320, 'M320', 'Pradip Upadhyay', 'Pavan Parampara', '25', '72', 'Arpit Prakashan ', 'Nagpur', 'Apr-June 2015', '', NULL, NULL),
(321, 'M321', 'Pradip Upadhyay', 'Pavan Parampara', '25', '72', 'Arpit Prakashan ', 'Nagpur', 'Apr-June 2018', '', NULL, NULL),
(322, 'M322', 'Pradip Upadhyay', 'Pavan Parampara', '25', '72', 'Arpit Prakashan ', 'Nagpur', 'Apr-June 2019', '', NULL, NULL),
(323, 'M323', 'Pradip Upadhyay', 'Pavan Parampara', '25', '72', 'Arpit Prakashan ', 'Nagpur', 'Apr-June 2020', '', NULL, NULL),
(324, 'M324', 'Jayanta Jahagirdar', 'Arogya Chikitsa ', '20', '23', 'Jayanta Jahagirdar', 'Jalgaon', '6/8/2015', '', NULL, NULL),
(325, 'M325', 'Swadesh Agrawal', 'Sudhanidhi', '20', '40', 'Sudhanidhi Karyalay', 'Vijaygadh', '6/15/2015', '', NULL, NULL),
(326, 'M326', 'Swadesh Agrawal', 'Pranacharya Arogyam  Mar-2015', '12', '40', 'Pranacharya Bhavan', 'Vijaygadh', '6/23/2015', '', NULL, NULL),
(327, 'M327', 'Swadesh Agrawal', 'Pranacharya Arogyam  May-2015', '12', '40', 'Pranacharya Bhavan', 'Vijaygadh', '6/24/2015', '', NULL, NULL),
(328, 'M328', 'V. P. Jogalekar', 'Shree Dhanwantari', '3', '18', 'Vaimitra Prakashan', 'Pune', '6/23/2015', '', NULL, NULL),
(329, 'M329', 'Swanand Pandit', 'Ayurved Patrika', '30', '52', ' Ayurved Seva Sangh', 'Nashik', '6/23/2015', '', NULL, NULL),
(330, 'M330', 'R Sudrashan ', 'Bhishak  News', '', '4', 'kerala Ayurvedic Studies Research', 'Kottakkal', '6/24/2015', '', NULL, NULL),
(331, 'M331', 'Vandana Muley', 'Srujan chikitsa ', '', '40', 'Mankarnika Publication ', 'Pune', 'May-June 2015', '', NULL, NULL),
(332, 'M332', 'Rajan Kumar ', 'Perinatology', '', '176', 'Himalaya Drug Company', 'Bangalore', '7/4/2015', '', NULL, NULL),
(333, 'M333', 'Gopal Garg', 'Sudhanidhi', '', '40', 'Sudhanidhi Karyalay', 'Vijaygadh', '7/5/2015', '', NULL, NULL),
(334, 'M334', 'Latif Kirmani', 'Harbal Chikitsa', '40', '98', 'Swami Prakashak', 'Vijaygadh', '7/13/2015', '', NULL, NULL),
(335, 'M335', 'Swadesh Agrawal', 'Pranacharya Arogyam June-2015', '12', '38', 'Pranacharya Bhavan', 'Vijaygadh', '7/11/2015', '', NULL, NULL),
(336, 'M336', 'Jayanta Jahagirdar', 'Arogya Chikitsa', '20', '23', 'Arogya Chikitsa', 'Jalgaon', '7/28/2015', '', NULL, NULL),
(337, 'M337', '', 'Catologue -2015', '5', '80', 'Shree Satguru Pubication ', 'Delhi', '7/23/2015', '', NULL, NULL),
(338, 'M338', '', 'Indian Medical Science Series 2015', '', '12', '', '', '', '', NULL, NULL),
(339, 'M339', 'Mamtani', 'Swasthvatika', '30', '90', 'Jeekumar Prakashan ', 'Nagpur', '8/3/2015', '', NULL, NULL),
(340, 'M340', 'Arun Jamkar ', 'Vali Vishesh', '19', '24', 'Arogya Vidya', 'Nashik', '7/21/2015', '', NULL, NULL),
(341, 'M 341', 'Sumintar Thakur', 'Skhayu', '', '38', 'Dhanwantari', 'Chandigad', '8/14/2015', '', NULL, NULL),
(342, 'M 342', 'Swanand Pandit', 'Ayurved Patrika', '30', '52', 'Ayurved Patrika', 'Nashik', '8/15/2015', '', NULL, NULL),
(343, 'M 343', 'Joglekar', 'Shree Dhanwantari', '', '90', 'Jeekumar  ', 'Pune', '8/1/2015', '', NULL, NULL),
(344, 'M 344', 'Anju Mamtani', 'swasth Vatika', '30', '9', '', '', '8/8/2015', '', NULL, NULL),
(345, 'M 345', '', 'Probe', '', '', 'The Himalaya Drug Company', 'Karnataka ', '4/15/2015', '', NULL, NULL),
(346, 'M 346', 'Philip Haydon', 'Himalaya Infine', '', '', 'Kalyani Gardens', '', '1/5/2015', '', NULL, NULL),
(347, 'M 347', 'Dr.Palani Yamma D', 'Liv Line ', '', '4', 'The Himalaya Drug Company', '', '8/14/2015', '', NULL, NULL),
(348, 'M 348', 'Dr.Yogesh Panndey', 'Newslwtter', '', '6', 'Chaudhary Brahmprakash', '', '1/5/2015', '', NULL, NULL),
(349, 'M 349', 'Vd.Swanand Pandit', 'Ayurved Patrika', '30', '50', 'Ayurved Patrika', 'Nashik', '8/14/2015', '', NULL, NULL),
(350, 'M 350', 'Vd.Swadesh Agrawal', 'Pranacharya arogyam', '12', '38', 'Swadesh Agrawal', '', '8/10/2015', '', NULL, NULL),
(351, 'M 351', 'Journal of National Integrated Medical Association', 'Integrated Journal', '', '', '', '', '', '', NULL, NULL),
(352, 'M 352', 'Swami Satyarupanand', 'Vivek Jyoti', '10', '398', 'Sanyog Of Set', 'Raipur', '8/19/2015', '', NULL, NULL),
(353, 'M 353', 'Amita Kaushal', 'Heritage Amruth(Back pain)', '60', '51', 'D.K.Ved', 'Bangluru', '8/19/2015', '', NULL, NULL),
(354, 'M 354', 'Amita Kaushal', 'Heritage Amruth(Back pain)', '60', '51', 'D.K.Ved', 'Bangluru', '8/19/2015', '', NULL, NULL),
(355, 'M 355', '', 'Catalogue', '', '80', 'Shri. Satguru Publication ', 'Delhi', '9/1/2015', '', NULL, NULL),
(356, 'M 356', 'Vd.Gopalsharan Garge', 'Siddha Prayog Sangraha', '110', '', 'Vd.Gopalsharan Garge', 'Aligadh', '9/1/2015', '', NULL, NULL),
(357, 'M 357', 'Vd.Nilkashi Pradhan', 'Satyanveshnam', '', '95', 'Mr.Anil Sitaram', '', '9/1/2015', '', NULL, NULL),
(358, 'M 358', 'Vd.Gopalsharan Garge', 'Sudhanidhi(jan 15)', '', '40', 'Vd.Gopalsharan Garge', 'Aligadh', '9/1/2015', '', NULL, NULL),
(359, 'M 359', 'Vd.Gopalsharan Garge', 'Sudhanidi(april 15)', '', '40', 'Vd.Gopalsharan Garge', 'Aligadh', '9/1/2015', '', NULL, NULL),
(360, 'M 360', 'Giridharlal Mishra', 'Sudhanidi(May 15)', '', '40', 'Sudhanidhi Karyalaya', 'Aligadh', '9/1/2015', '', NULL, NULL),
(361, 'M 361', 'Vd.Gopalsharan Garge', 'Sudhanidi(July)', '', '40', 'Sudhanidhi Karyalaya', 'Aligadh', '9/1/2015', '', NULL, NULL),
(362, 'M 362', 'Dr.S.K.Maheshwari', 'Ayushyaman', '30', '102', 'Balwant arked', 'Bhopal', '8/14/2015', '', NULL, NULL),
(363, 'M 363', 'Latif Kirmani', 'Harbal chikitsa', '40', '81', 'Swami Prakashak', 'Delhi', '9/4/2015', '', NULL, NULL),
(364, 'M 364', '', 'Skills Training Lab.', '', '35', 'All Edu need', 'hyderabad', '9/10/2015', '', NULL, NULL),
(365, 'M 365', '', 'Ayurveda& Sanskrit Samhita ', '', '48', 'Own Publication', 'Varanasi', '9/4/2015', '', NULL, NULL),
(366, 'M 366', 'Nandakumar Mulye', 'Vaidaraj(aug,sept,oct)', '25', '62', 'Aswad prakashan', 'Mumbai', '9/10/2015', '', NULL, NULL),
(367, 'M 367', 'Vd.V.P.Jogdekar', 'Shri. Dhanvantari', '3', '', 'Tilak Road ,sadashiv Peth', 'Pune', '9/10/2015', '', NULL, NULL),
(368, 'M 368', 'Rama Krishna Pillai', 'Yojana', '10', '', 'Govt.of India', 'Delhi', '9/15/2015', '', NULL, NULL),
(369, 'M 369', 'Dr.p.P.Kirathamoorthy', 'Baishak News', '', '', 'Division of Kerala ', 'Kottakkal', '9/18/2015', '', NULL, NULL),
(370, 'M 370', 'Vd.Gopalsharan Garge', 'Sudhanidhi', '', '40', 'Vd.Gopalsharan Garge', 'Aligadh', '9/8/2015', '', NULL, NULL),
(371, 'M 371', 'Swami Prapalanand', 'Vivek Jyoti', '10', '403-448', 'Ramkrushna Publication', 'Raipur', '9/18/2015', '', NULL, NULL),
(372, 'M 372', 'Swadesh Agrawal', 'Pranacharya arogyam(aug2015)', '12', '38', '', 'Vijaygadh', '9/21/2015', '', NULL, NULL),
(373, 'M 373', 'Vd.Swanand Pandit', 'Ayurved Patrika', '30', '54', 'Ayurved Patrika', 'Nashik', '9/30/2015', '', NULL, NULL),
(374, 'M 374', 'Latif Kirmani', 'Harbal chikitsa', '40', '81', 'Swami Prakashak', 'Delhi', '9/24/2015', '', NULL, NULL),
(375, 'M 375', 'Vd.Vandana Mule', 'Srujan Chikitsa', '', '40', 'Manikarnika Prakashan', 'Pune', '10/13/2015', '', NULL, NULL),
(376, 'M 376', 'Kinjawadekar', 'Journal of National Integrated Medical Association', '10', '30', 'Dr.Ramesh Mehata', 'NIMA', '10/14/2015', '', NULL, NULL),
(377, 'M 377', 'Swami Satyarupanand', 'Vivek Jyoti', '10', '530', 'Sanyog Of Set', 'Raipur', '10/14/2015', '', NULL, NULL),
(378, 'M 378', 'Vd.Gopalsharan Garge', 'Sudhanidhi', '', '40', 'Vd.Gopalsharan Garge', 'Aligadh', '10/14/2015', '', NULL, NULL),
(379, 'M 379', 'Vd.V.P.Jogdekar', 'Shri. Dhanvantari', '3', '', 'Tilak Road ,sadashiv Peth', 'Pune', '', '', NULL, NULL),
(380, 'M 380', 'Vd.Swanand Pandit', 'Ayurved Patrika', '30', '54', 'Ayurved Patrika', 'Nashik', '10/19/2015', '', NULL, NULL),
(381, 'M 381', 'Jayant Jahagirdar', 'Asrogya Chikitsa', '20', '24', 'Akshar mudra', 'Jalgaon', '10/19/2015', '', NULL, NULL),
(382, 'M 382', 'Swadesh Agraval', 'Aarogyam', '12', '38', '', 'Vijaygadh', '10/30/2015', '', NULL, NULL),
(383, 'M 383', 'Philipine Haydon', 'Infoline Himalaya', '', '19', 'Himalaya drug company', '', '10/30/2015', '', NULL, NULL),
(384, 'M 384', 'R A Choudhari', 'Herbal Chikitsa', '40', '82', 'Swami Prakashak', 'Delhi', '10/30/2015', '', NULL, NULL),
(385, 'M 385', 'Arun Jamkar', 'Varta Vishesh', '', '24', 'Dr Kashinath Garkal', 'Nashik', '10/30/2015', '', NULL, NULL),
(386, 'M 386', '', 'Longevity', '', '15', '', 'Bangluru', '10/30/2015', '', NULL, NULL),
(387, 'M 387', 'K K Agraval', 'Alloweda', '', '7', 'An IJCP Group publication', '', '10/30/2015', '', NULL, NULL);
INSERT INTO `library_journal` (`id`, `registration_no`, `author_name`, `name`, `price`, `pages`, `publisher`, `seller`, `date`, `bill_no`, `created_at`, `updated_at`) VALUES
(388, 'M 388', 'Gopalsharan garge', 'Siddha Prayog Sangraha', '', '320', 'Gopalsharan garge', 'Vijaygadh', '9/1/2015', '', NULL, NULL),
(389, 'M 389', 'Swami Satyarupanand', 'Vivek Jyoti', '80', '', '', 'Raypur', '11/7/2015', '', NULL, NULL),
(390, 'M 390', '', 'Journal of Indian System of Medicine', '', '116', 'Datta Meghe Institute of Medical sciences', '', '', '', NULL, NULL),
(391, 'M 391', '', 'Evecare', '', '32', 'Scientific Publications', 'Karnataka ', '11/20/2015', '', NULL, NULL),
(392, 'M 392', 'Palniyamma D.', 'Lie Lne', '', '4', 'Himalaya drug company', 'Karnataka ', '11/20/2015', '', NULL, NULL),
(393, 'M 393', '', 'Himalaya Infoline', '', '19', 'Himalaya drug company', 'bangluru', '', '', NULL, NULL),
(394, 'M 394', '', 'Ayurved Patrika', '', '58', 'K M Joshi', 'Nashik', '', '', NULL, NULL),
(395, 'M 395', 'Vandana Mule', 'Srujan Chikitsa', '', '40', 'Manikarnika Prakashan', 'Pune', '11/20/2015', '', NULL, NULL),
(396, 'M 396', '', 'Capsule', '', '11', 'Himalaya drug company', 'Bangluru', '11/20/2015', '', NULL, NULL),
(397, 'M 397', 'Jayant Jahagirdar', 'Aarogya Chikitsa', '20', '24', 'Akshar mudra', 'Jalgaon', '11/24/2015', '', NULL, NULL),
(398, 'M 398', '', 'Shri. Dhanvantari', '3', '20', 'Kalpana Prakashan', '', '11/24/2015', '', NULL, NULL),
(399, 'M 399', 'Anup Kumar Jha', 'Phytopharm (June 2015)', '170', '56', 'Quality creaters', 'Delhi', '12/4/2015', '', NULL, NULL),
(400, 'M 400', 'Anup Kumar Jha', 'Phytopharm (July 2015)', '170', '54', 'Quality creaters', 'Delhi', '12/4/2015', '', NULL, NULL),
(401, 'M 401', 'Anup Kumar Jha', 'Phytopharm (Aug 2015)', '170', '48', 'Quality creaters', 'Delhi', '12/4/2015', '', NULL, NULL),
(402, 'M 402', 'Anup Kumar Jha', 'Phytopharm (Sept 2015)', '170', '50', 'Quality creaters', 'Delhi', '12/4/2015', '', NULL, NULL),
(403, 'M 403', 'Anup Kumar Jha', 'Phytopharm (Oct 2015)', '170', '66', 'Quality creaters', 'Delhi', '12/4/2015', '', NULL, NULL),
(404, 'M 404', 'Gopalsharan garg', 'Sudhanidhi', '20', '40', 'Sudhanidhi Karyalaya', 'Mumbai', '12/5/2015', '', NULL, NULL),
(405, 'M 405', 'Nandkumar Mule', 'Vaidaraj', '100', '157', 'Kamat Audyogik Vasahat', 'Mumbai', '12/5/2015', '', NULL, NULL),
(406, 'M 406', 'Swadesh Agraval', 'Pranacharya Aarogyam', '12', '38', '', 'Vijaygadh', '12/10/2015', '', NULL, NULL),
(407, 'M 407', 'Anup Kumar Jha', 'Phytopharm', '170', '54', 'Herbal information centre', 'Delhi', '12/11/2015', '', NULL, NULL),
(408, 'M 408', 'Swami Prapalanand', 'Vivek Jyoti', '10', '585-632', 'Ramkrushna Publication', 'Raypur', '', '', NULL, NULL),
(409, 'M 409', 'Swanand Pandit', 'Aayurved Patrika', '30', '50', 'Aayurved Seva Sangh', 'Nashik', '12/14/2015', '', NULL, NULL),
(410, 'M 410', 'Swanand Pandit', 'Aayurved Patrika', '30', '50', 'Aayurved Seva Sangh', 'Nashik', '12/15/2015', '', NULL, NULL),
(411, 'M 411', 'H M Chandola', 'News Letter ', '', '5', 'Choudhari Beamha Prakash Ayurved', 'Charak Sansthan', '12/21/2015', '', NULL, NULL),
(412, 'M 412', 'P P Kirathamoorthy', 'Baishak News', '', '11', 'Kerala Ayurvedic studies & research society', 'M P Esward Sharma MD(Ayu)', '12/22/2015', '', NULL, NULL),
(413, 'M 413', 'P P Kirathamoorthy', 'Catalogue', '', '80', 'sri satguru prakashan', 'sri satguru prakashan', '12/22/2015', '', NULL, NULL),
(414, 'M 414', 'P P Kirathamoorthy', 'India Medical Science series', '', '', 'sri satguru prakashan', 'sri satguru prakashan', '12/22/2015', '', NULL, NULL),
(415, 'M 415', 'P P Kirathamoorthy', 'India Medical Science series', '', '', 'sri satguru prakashan', 'sri satguru prakashan', '12/22/2015', '', NULL, NULL),
(416, 'M 416', 'Anup Kumar Jha', 'Phyopharm', '170', '58', 'Mr Kiran Jha', 'Delhi', '1/6/2016', '', NULL, NULL),
(417, 'M 417', 'Swadesh Agraval', 'Pranavharya Arogyam', '12', '38', '', 'Aligadh', '1/6/2016', '', NULL, NULL),
(418, 'M 418', 'Swami Prapalanand', 'Vivek Jyoti', '12', '46', '', 'Raypur', '1/6/2016', '', NULL, NULL),
(419, 'M 419', 'Vandana Mule', 'Srujan Chikitsa', '', '40', 'Manikarnika Prakashan', 'Pune', '1/11/2016', '', NULL, NULL),
(420, 'M 420', 'V P Joglekar', 'Shri. Dhanvantari', '31', '20', 'Kalpana Prakashan', '', '1/16/2016', '', NULL, NULL),
(421, 'M 421', 'Swadesh Agraval', 'Pranacharya Arogyam', '12', '38', '', 'Vijaygadh', '1/16/2016', '', NULL, NULL),
(422, 'M 422', 'Gopalsharan Garg', 'Sudhanidi', '', '40', 'Sudhanidhi Karyalaya', 'Vijaygadh', '1/22/2016', '', NULL, NULL),
(423, 'M 423', 'Swanand Pandit', 'Ayurved Patrika', '50', '66', 'Ayued seva sangh', 'Nashik', '1/22/2016', '', NULL, NULL),
(424, 'M 424', '', 'Longevity( jul-sep 2015)', '', '14', 'Himalaya drug company', 'banglore', '1/22/2016', '', NULL, NULL),
(425, 'M 425', '', 'pedritz', '', '10', 'Himalaya drug company', 'banglore', '1/22/2016', '', NULL, NULL),
(426, 'M 426', 'K K Agraval', 'alioveda( july-sep 2015)', '', '7', 'himalaya herbal health care', '', '1/22/2016', '', NULL, NULL),
(427, 'M 427', 'Mamtani dampati', 'swasth Vatika', '30', '90', 'jikumar arogydham', '', '1/29/2016', '', NULL, NULL),
(428, 'M 428', '', 'CATLOGUE 2016', '', '80', 'INDIAN BOOKS CENTER', 'Shri satguru publication india', '1/29/2016', '', NULL, NULL),
(429, 'M 429', '', 'indian medical sciences series 2015', '', '24', 'INDIAN BOOKS CENTER', 'Shri satguru publication india', '1/29/2016', '', NULL, NULL),
(430, 'M 430', '', 'indian medical sciences series 2016', '', '24', 'INDIAN BOOKS CENTER', 'Shri satguru publication india', '1/29/2016', '', NULL, NULL),
(431, 'M 431', '', 'krida mahotsva', '', '66', 'maharashtra', 'nashik', '2/9/2016', '', NULL, NULL),
(432, 'M 432', 'Swami Prapalanand', 'Vivek Jyoti', '12', '98', 'Ramkrushna Publication', 'raypur', '2/1/2016', '', NULL, NULL),
(433, 'M 433', '', 'drishyam 2016', '12', '112', 'central council of indian medicine', '', '2/9/2016', '', NULL, NULL),
(434, 'M 434', 'Anup Kumar Jha', 'phytopharm', '3', '58', 'akshamudra prakashn', 'Jalgaon', '2/9/2016', '', NULL, NULL),
(435, 'M 435', 'jaynt bhalchandra jahagir', 'arogy chikitsa', '20', '24', '', '', '2/10/2012', '', NULL, NULL),
(436, 'M 436', '', 'shalakya manthan 2016', '', '63', 'shri B M wadi ayurved ', '', '2/10/2018', '', NULL, NULL),
(437, 'M 437', 'Amita Kaushal', 'Heritage Amruth', '', '51', 'Mediplan conventry society', 'Banglore', '2/10/2016', '', NULL, NULL),
(438, 'M 438', 'Swanand Pandit', 'Ayurved Patrika', '30', '54', 'Ayurved Seva Sangh', 'Nashik', '2/14/2016', '', NULL, NULL),
(439, 'M 439', 'Swanand Pandit', 'Ayurved Patrika', '30', '54', 'Ayurved Seva Sangh', 'Nashik', '2/16/2016', '', NULL, NULL),
(440, 'M 440', 'Jogalekar P. V. ', 'Shree Dhanwantari', '3', '16', 'Vaidhmitra Prakashan Pune', '', '2/16/2016', '', NULL, NULL),
(441, 'M 441', 'Palniyamma ', 'Probe', '', '82', 'Pallaniyamma Publication', 'Jamnagar', '2/16/2016', '', NULL, NULL),
(442, 'M 442', 'P.K.Prajapati', 'Ayu', '', '114', 'Medknow Publication', 'Jamnagar', '2/16/2016', '', NULL, NULL),
(443, 'M 443', 'Swadesh Agrval', 'Pranachary Arogyam', '25', '78', '', 'Vijaygadh', '2/20/2016', '', NULL, NULL),
(444, 'M 444', '', 'Journals of Ayurveda', '', '180', 'National Institute of Ayurveda Ministry & Ayush govt of India Publication', 'Vijaygadh', '2/20/2016', '', NULL, NULL),
(445, 'M 445', 'Latif Kirmani', 'Herbal Chikitsa', '40', '80', 'Swami Prakashak', 'Delhi', '2/25/2016', '', NULL, NULL),
(446, 'M 446', 'Mamtani ', 'Swasth Vatika (Jan - March 2016)', '30', '89', 'Jikumar Prakashan', 'Nagpur', '', '', NULL, NULL),
(447, 'M 447', 'J.L.N. Sastry', 'Ayurveda', '', '23', 'Association of Manufactures of Ayurvedic Medicine', 'Gaziabad', '3/3/2016', '', NULL, NULL),
(448, 'M 448', 'Swami Prapalanand', 'Vivek Jyoti', '12', '148', 'Sanyog Of Set', 'Raypur', '3/3/2016', '', NULL, NULL),
(449, 'M 449', '', 'Dbios Physiology Charts & Models', '', '', '', 'Haryana', '3/3/2016', '', NULL, NULL),
(450, 'M 450', 'Anup Kumar Jha', 'Phytopharm', '170', '58', 'Herbal information centre', 'Delhi', '3/3/2016', '', NULL, NULL),
(451, 'M 451', 'Gopalsharan Garge ', 'Sudhanidhi', '', '40', 'Sudhanidhi Karyalaya', 'Vijaygadh', '3/8/2016', '', NULL, NULL),
(452, 'M 452', 'Vandana Mule', 'Srujan Chikitsa(Jan-Feb 2016)', '', '40', 'Manikarnika Prakashan', 'Pune', '3/8/2016', '', NULL, NULL),
(453, 'M 453', 'Swanand Pandit', 'Ayurved Patrika (March 2016)', '30', '56', 'Ayurved Seva Sangh', 'Nashik', '3/15/2016', '', NULL, NULL),
(454, 'M 454', 'Nandkumar Mule', 'Vaidhraj(Feb March April Traimasik)', '25', '64', 'Kamat Audyogik Vasahat', 'Mumbai', '3/15/2016', '', NULL, NULL),
(455, 'M 455', 'P.K.Prajapati', 'Ayu Quarterly Journal (March 2016)', '', '230', 'Institute for Post graduate Teaching & res.', '', '3/15/2016', '', NULL, NULL),
(456, 'M 456', 'Vd. Jogdekar ', 'Shri Dhanwantari (10/3/16)', '3', '16', 'Vadya mitra Prakashan', '', '3/18/2016', '', NULL, NULL),
(457, 'M 457', 'Vd. Swanand ', 'Ayurved Patrika (March 2016)', '30', '56', 'Ayurved sevasangh', 'Nashik', '3/18/2016', '', NULL, NULL),
(458, 'M 458', '', 'Chaukhamba Ayurved Sahitya catalouge (2015-11)', '', '40', 'choukambha Publisher', '', '3/18/2016', '', NULL, NULL),
(459, 'M 459', 'Gopal sharan Garg', 'Sudhanidhi (feb2016)', '', '24', 'Sudhanidhi Karyalaya', 'Aligarh', '3/19/2016', '', NULL, NULL),
(460, 'M 460', 'Vd. Shila Yerne', 'Srujan 2016', '', '53', 'Nirmal Graphics', 'Solahpur', '3/23/2016', '', NULL, NULL),
(461, 'M 461', 'Latif Kirmani', 'Herbal Chikitsa (March 2016)', '40', '82', 'Swami Prakashsan ', 'Delhi', '3/22/2016', '', NULL, NULL),
(462, 'M 462', 'Vd. Rameshkumar Maheswari', 'Ayushman (Jan- March 2016)', '35', '102', 'Pruthvijay Prakashan', 'Bhopal', '3/22/2016', '', NULL, NULL),
(463, 'M 463', 'Vd. Rameshkumar Maheswari', 'Ayushman (Oct-Dec 2016)', '30', '102', 'Pruthvijay Prakashan', '', '3/22/2016', '', NULL, NULL),
(464, 'M 464', 'Swami Prapalanand', 'Vivek Jyoti (April 2016)', '12', '198', 'Ramkrushna Publication', '', '4/2/2016', '', NULL, NULL),
(465, 'M 465', 'Anup Kumar Jha', 'Phytopharam (March 2016)', '170', '47', 'Herbal information centre', 'New Delhi', '4/2/2016', '', NULL, NULL),
(466, 'M 466', 'Swadesh Agrawal ', 'Pranacharya Arogyam (March 2016)', '', '40', '', 'Vijaygarh', '4/12/2016', '', NULL, NULL),
(467, 'M 467', 'Dr. Palaniyama ', 'Liv Line  (Jan -March 2016)', '', '4', '', '', '4/12/2016', '', NULL, NULL),
(468, 'M 468', 'Dr. K.K.Agrawal', 'Alloveda (Oct-Dec2015)', '', '8', '', '', '4/12/2016', '', NULL, NULL),
(469, 'M 469', '', 'pedritz', '', '12', '', '', '4/12/2016', '', NULL, NULL),
(470, 'M 470', 'Dr. Ranjan kumar Pejawar', 'Perinatology ( Oct- Dec 2015)', '', '146', 'Scientific Publications', '', '4/12/2016', '', NULL, NULL),
(471, 'M 471', 'Dr. Palaniyama ', 'Eye care (Oct-Dec2015)', '', '32', 'Scientific Publications', '', '4/12/2016', '', NULL, NULL),
(472, 'M 472', 'Dr. Palaniyama ', 'Capsule (JAN -March 2016)', '', '11', 'Sudhilerd Publicaton', '', '4/12/2016', '', NULL, NULL),
(473, 'M 473', 'Vd. Jayant B. Jhahgirdar', 'Arogya Chikitsa (April2016)', '20', '24', 'Sanipeth Prakashan', '', '4/13/2016', '', NULL, NULL),
(474, 'M 474', 'Vd. Swanand S.Pandit', 'Ayurved Patrika (April2016)', '30', '54', 'Ayurved seva sangh', '', '4/13/2016', '', NULL, NULL),
(475, 'M 475', 'Vd. Swanand S.Pandit', 'Ayurved Patrika (April2016)', '30', '54', 'Ayurved seva sangh', '', '4/16/2016', '', NULL, NULL),
(476, 'M 476', 'Dr.S.P.Kinjawadekar', 'Journal of National Integrated Medical Association(Mar-16)', '', '22', '', '', '4/16/2016', '', NULL, NULL),
(477, 'M 477', 'Vd. Jogdekar ', 'Shri Dhanwantari (April2016)', '3', '20', 'Vaidhmitra Prakashan Pune', '', '4/16/2016', '', NULL, NULL),
(478, 'M 478', 'Swami Prapalanand', 'Vivek jyoti (May2016)', '12', '248', 'Ramkrushna Publication', '', '5/6/2016', '', NULL, NULL),
(479, 'M 479', 'Dr.S.P.Kinjawadekar', 'Journal of National Integrated Medical Association(Apr-16)', '15', '27', 'Ayurved Rasshala ', '', '5/6/2016', '', NULL, NULL),
(480, 'M 480', 'Anup Kumar Jha', 'Phytopharam (April 2016)', '170', '59', 'Herbal information centre', '', '5/6/2016', '', NULL, NULL),
(481, 'M 481', 'Latif Kirmani', 'Herbal Chikitsa (April 2016)', '40', '82', 'Swami Prakashan', '', '5/6/2016', '', NULL, NULL),
(482, 'M 482', 'Dr. Anju G. Mamtani', 'Swasth vatika (April2016)', '30', '90', 'Gkumar Prakashan', '', '5/6/2016', '', NULL, NULL),
(483, 'M 483', '', 'Catalouge 2016', '', '76', 'INDIAN BOOKS CENTER', '', '5/10/2016', '', NULL, NULL),
(484, 'M 484', 'Vd.Swanand Pandit', 'Ayurved Patrika (May 2016)', '30', '55', 'Ayurved seva sangh', '', '5/24/2016', '', NULL, NULL),
(485, 'M 485', 'Vd.Swanand Pandit', 'Ayurved Patrika (May 2016)', '30', '55', 'Ayurved seva sangh', '', '5/24/2016', '', NULL, NULL),
(486, 'M 486', 'Swadesh Agrawal ', 'Pranacharya Arogyam ( Jan 2015)', '25', '78', '', '', '', '', NULL, NULL),
(487, 'M 487', 'Vd. Jayant B. Jhahgirdar', 'Arogya Chikitsa (Dec2016)', '20', '24', 'Akshar mudra', '', '5/24/2016', '', NULL, NULL),
(488, 'M 488', 'Vd. V.P.Jogdewar', 'Shri Dhanwantari( May 2016)', '3', '18', 'Comprint Kalpana', '', '5/24/2016', '', NULL, NULL),
(489, 'M 489', 'Vd. Gopalsharan Grag ', 'Siddh Prayaog Sangrah (Feb- March 2016)', '120', '320', 'Sudhanidhi Karyalaya', '', '5/24/2016', '', NULL, NULL),
(490, 'M 490', '', 'Catalouge 2017', '', '76', 'sri satguru prakashan', '', '', '', NULL, NULL),
(491, 'M 491', '', 'Pediritz', '', '8', 'Himalaya drug company', '', '5/31/2016', '', NULL, NULL),
(492, 'M 492', '', 'Capsulle', '', '8', 'Himalaya drug company', '', '5/31/2016', '', NULL, NULL),
(493, 'M 493', 'Dr.Palani Yamma D', 'Live Line  ( 2016)', '', '4', 'The Himalaya Drug Company', '', '5/31/2016', '', NULL, NULL),
(494, 'M 494', '', 'Longevity', '', '14', 'The Himalaya Drug Company', '', '5/31/2016', '', NULL, NULL),
(495, 'M 495', '', 'Alloyeda', '', '7', 'The Himalaya Drug Company', '', '5/31/2016', '', NULL, NULL),
(496, 'M 496', '', 'Probe', '', '86', 'The Himalaya Drug Company', '', '5/31/2016', '', NULL, NULL),
(497, 'M 497', 'Anup Kumar Jha', 'Phytopharm', '', '58', 'Herbal information centre', 'New Delhi', '5/31/2016', '', NULL, NULL),
(498, 'M 498', 'Swami Prapalanand', 'vivek jyoti', '12', '298', 'Ramkrushna Publication', 'Rampur', '5/31/2016', '', NULL, NULL),
(499, 'M 499', 'Kinjawadekar', 'Journal of National Integreted Medical Association', '28', '27', 'Journal of National Integrated Medical Association', 'Rampur', '5/31/2016', '', NULL, NULL),
(500, 'M 500', 'Vd.Swadesh Agrawal', 'Pranacharya Arogyam', '12', '38', 'Vd.Swadesh Agrawal', '', '4/29/2016', '', NULL, NULL),
(501, 'M 501', 'Dr. R.S.Maheswari', 'Ayushman ( April-June 2016)', '35', '102', 'Balwant Prakashan', 'Bhopal', '4/30/2016', '', NULL, NULL),
(502, 'M 502', 'Vd. Devisaharan Garg', 'Sudhanidhi ( April 2016 )', '', '407', 'Sudhanidhi Karyalaya', 'Vijaygarh', '5/1/2016', '', NULL, NULL),
(503, 'M 503', 'Jyant Jhagirdar', 'Arogya Chikitsa (May 2016)', '20', '24', 'Akshar mudra prints', 'Jalgaon', '5/1/2016', '', NULL, NULL),
(504, 'M 504', 'Dr.Nilakshi Pradhan ', 'Satyanveshnam(may-July)', '', '62', 'Sumatibhai Shah ', '', '6/7/2016', '', NULL, NULL),
(505, 'M 505', 'Vd. Swanand Pandit', 'Ayurved Partrika june 2016', '30', '55', 'Ayurved Sewa Sangh', 'Nashik', '6/24/2016', '', NULL, NULL),
(506, 'M 506', '', 'Communique(june 16)', '', '35', '', '', '6/24/2016', '', NULL, NULL),
(507, 'M 507', 'Swadesh Agrawal ', 'Pranacharya Arogyam (May 16)', '12', '39', 'Pranacharya Bhavan ', '', '6/24/2016', '', NULL, NULL),
(508, 'M 508', '', 'Catalogue 2016', '', '64', 'Chaukhambha Prakashan ', '', '6/24/2016', '', NULL, NULL),
(509, 'M 509', '', 'Catalogue 2016', '', '64', 'Chaukhambha Prakashan ', '', '6/24/2016', '', NULL, NULL),
(510, 'M 510', 'Vandana Mule', 'Srujan Chikitsa May-June 2016 ', '', '40', 'Mankarnika Publication', '', '6/28/2016', '', NULL, NULL),
(511, 'M 511', 'Swami Prapalanand', 'vivek Jyoti 7 July 16', '12', '30', 'Ramkrushna Publication', 'Raipur', '7/4/2016', '', NULL, NULL),
(512, 'M 512', 'Dr.S.P.Kinjawadekar', 'Journal Of NIMA', '15', '28', 'Ramesh Mehata', 'Mumbai', '7/4/2016', '', NULL, NULL),
(513, 'M 513', 'Anup Kumar Jha', 'Phytopham', '170', '58', 'mr.Kriam Jha', 'Delhi', '7/4/2016', '', NULL, NULL),
(514, 'M 514', '', 'Evecare jan- March 16 ', '', '32', 'Himalaya drug company', 'Banglore', '7/4/2016', '', NULL, NULL),
(515, 'M 515', 'Dr.Palani Yamma D', 'Probe vol no.3(April-June 16)', '', '52', 'Himalaya drug company', 'Banglore', '7/4/2016', '', NULL, NULL),
(516, 'M 516', 'Himalaya Infolline ', '', '', '14', 'Himalaya drug company', 'Banglore', '7/4/2016', '', NULL, NULL),
(517, 'M 517', '', 'Probe (jul- Sep 16)', '', '', '', '', '', '', NULL, NULL),
(518, 'M 518', 'jayashree B. Keshav ', 'Pediritz volm 9', '', '58', 'Himalaya drug company', 'Banglore', '7/4/2016', '', NULL, NULL),
(519, 'M 519', 'Jayant Jahagirdar', 'Arogya Chikitsa ', '20', '26', 'Aksharmudra ', 'Jalgaon', '7/11/2016', '', NULL, NULL),
(520, 'M 520', 'Vd. Swanand Pandit', 'Ayurved Patrika ', '30', '', 'Abhay Kulkarni', 'Nashik', '7/11/2016', '', NULL, NULL),
(521, 'M 521', '', 'Campus Medicine ', '', '', '', '', '', '', NULL, NULL),
(522, 'M 522', 'Vd.Gopalsharan Garge', 'Sudhanidhi', '', '40', 'Sudhanidhi Karyalaya ', 'Aligadh', '7/23/2016', '', NULL, NULL),
(523, 'M 523', 'V.P.Jogdekar', 'Shri. Dhanvantari', '3', '18', 'Sanipeth Prakashan', 'Jalgaon', '', '', NULL, NULL),
(524, 'M 524', 'P.K.Prajapati', 'Ayu.(Jul-sep15)', '', '358', 'Medknow Publication', 'Gujrat', '7/23/2016', '', NULL, NULL),
(525, 'M 525', 'Anup Kumar Jha', 'Phytopharm ', '170', '54', 'Quality creaters', 'Delhi', '8/1/2016', '', NULL, NULL),
(526, 'M 526', 'Jayant Jahagirdar', 'Arogya chikitsa ', '20', '', 'Sanipeth Prakashan', 'Jalgaon', '8/13/2016', '', NULL, NULL),
(527, 'M 527', 'Anju Mamtani', 'Swastha Vatika ', '30', '90', 'Jikumar Prakashan', 'Delhi', '8/13/2016', '', NULL, NULL),
(528, 'M 528', 'Dr.p.P.Kirathamoorthy', 'Bhishak News ', '', '9', 'Publication Of Division ', 'Kottakkal', '8/16/2016', '', NULL, NULL),
(529, 'M 529', 'Vd.Gopalsharan Garge', 'Sudhanidhi', '', '40', 'Sudhanidhi Karyalaya ', 'Vijaygarh', '8/16/2016', '', NULL, NULL),
(530, 'M 530', 'Swadesh Agarwal ', 'Pranacharya Arogyam (July 16)', '12', '38', 'Swadesh Agrawal', 'Vijaygarh', '8/16/2016', '', NULL, NULL),
(531, 'M 531', 'S P Kinsawadekar', 'journal of national integrated medical association', '157', '24', 'Swadesh Agrawal', '', '8/16/2016', '', NULL, NULL),
(532, 'M 532', 'V P Joglekar', 'shri dhanvantari ', '3', '18', 'jethale N J ', '', '8/16/2016', '', NULL, NULL),
(533, 'M 533', 'Kamleshkumar dvivedi', 'visha ayureved parishad', '', '48', 'viramkhand gomati nagar', 'lakhnau', '9/1/2016', '', NULL, NULL),
(534, 'M 534', '', 'Chaukhamba Ayurved Sahita ( list of box )', '', '41', 'Chaukhambha Prakashan ', 'Varanasi', '9/1/2016', '', NULL, NULL),
(535, 'M 535', 'Nandakumar Mulye', 'vaidyaraj(aug.sep.oct.)', '25', '63', 'Kamat Audyogik Vasahat', 'Mumbai', '9/7/2016', '', NULL, NULL),
(536, 'M 536', 'S K Maheshwari', 'ayushaman sep.2016', '35', '102', 'corporate office', '', '', '', NULL, NULL),
(537, 'M 537', 'Dilip mhaisakar', 'Varta Vishesh', '7', '24', 'kalidas chavhan', 'nashik', '9/7/2016', '', NULL, NULL),
(538, 'M 538', 'Anup Kumar Jha', 'dhytopharm', '170', '54', 'quality creaters', 'delhi', '9/14/2016', '', NULL, NULL),
(539, 'M 539', 'gopalsharn garge ', 'sudhanidhi', '', '40', 'sudhanidhi karyalaya', 'aligadha', '9/14/2016', '', NULL, NULL),
(540, 'M 540', 'sanyogita londhe', 'dipstambha', '', '212', 'vabruvan vithalrav kale', 'latur', '9/14/2016', '', NULL, NULL),
(541, 'M 541', 'R S Chuadhari', 'harbal chikitsa sep.2016', '40', '78', 'swami prakashn', '', '9/27/2016', '', NULL, NULL),
(542, 'M 542', '', 'chaukhambha ayurved sahita', '', '50', 'Chaukhambha Prakashan ', '', '9/27/2016', '', NULL, NULL),
(543, 'M 543', 'V P Joglekar', 'shri dhanvantari sep.2016', '31', '18', 'camp print kalpana', '', '', '', NULL, NULL),
(544, 'M 544', 'swadesha aagraval', 'pranacharya arogyam aug.2016', '12', '38', 'Pranacharya Bhavan ', '', '9/27/2016', '', NULL, NULL),
(545, 'M 545', 'Swanand Pandit', 'ayurved patrika sep.2016', '30', '55', 'ayurved seva sangha ', '', '9/27/2016', '', NULL, NULL),
(546, 'M 546', 'Swami Prapalanand', 'vivek jyoti ', '12', '398', 'Ramkrushna Publication', '', '9/27/2016', '', NULL, NULL),
(547, 'M 547', 'S P Kinsawadekar', 'Jouranal of national intigrated medical association(sep.2016)', '15', '22', 'Ramesh Mehata', '', '10/4/2016', '', NULL, NULL),
(548, 'M 548', 'swadesha aagraval', 'Pranacharya Aarogyam sep.2016', '12', '38', 'Pranacharya Bhavan ', '', '10/4/2016', '', NULL, NULL),
(549, 'M 549', 'Amita Kaushal', 'heritage amruth july aug 2016', '80', '52', '74/2jarakabande kaval', '', '10/4/2016', '', NULL, NULL),
(550, 'M 550', 'Anup Kumar Jha', 'phytopharm sep.2016', '170', '54', 'Herbal information centre', '', '10/4/2016', '', NULL, NULL),
(551, 'M 551', 'jaynt jahagirdar      ', 'arogya chikitsa sep.2016', '20', '26', '152 shanipetha', 'Jalgaon', '9/17/2016', '', NULL, NULL),
(552, 'M 552', 'jaynt jahagirdar      ', 'arogya chikitsa oct.2016', '20', '26', '153 shanipetha', 'Jalgaon', '10/15/2016', '', NULL, NULL),
(553, 'M 553', 'priti ranjita zarbade ', 'akshay jivan ', '30', '64', 'thankamani dvara sagar printrs', 'bhilai', '10/7/2016', '', NULL, NULL),
(554, 'M 554', 'pavankumar godaturwar', 'jouranal of ayurveda', '', '184', 'shri J P Sharma', '', '10/14/2016', '', NULL, NULL),
(555, 'M 555', 'jayashree B. Keshav ', 'liv line oct.2016', '', '4', '', '', '10/22/2016', '', NULL, NULL),
(556, 'M 556', 'rajan kumar pejver', 'Perinatology ( Oct- Dec 2016)', '', '78', '', '', '10/22/2016', '', NULL, NULL),
(557, 'M 557', '', 'himalya intoline oct.2016', '', '', '', '', '10/22/2016', '', NULL, NULL),
(558, 'M 558', '', 'eveare oct.2016', '', '', '', '', '10/22/2016', '', NULL, NULL),
(559, 'M 559', 'K K Agraval', 'Alloveda( july to sep.2016)', '', '4', 'himalaya drug company', '', '10/22/2016', '', NULL, NULL),
(560, 'M 560', '', 'probe(oct.-dec.2016)', '', '94', 'himalaya drug company', '', '10/22/2016', '', NULL, NULL),
(561, 'M 561', 'K . Shankarrao', 'jouranal of ayurveda (jan.-march2015)', '', '184', 'national institue of ayurveda', '', '10/22/2016', '', NULL, NULL),
(562, 'M 562', 'Swanand Pandit', 'ayurveda patrika (oct.2016)', '30', '54', 'ayurved seva sangha ', '', '10/22/2016', '', NULL, NULL),
(563, 'M 563', 'Latif Kirmani', 'herbal chikitsa(oct.2016)', '40', '81', 'swami prakashan', 'Delhi', '10/22/2016', '', NULL, NULL),
(564, 'M 564', 'janadin hegade', 'sambhashan sandesha (nov.2016)', '10', '34', 'knarayan', 'Banglore', '11/3/2016', '', NULL, NULL),
(565, 'M 565', 'S P Kinsawadekar', 'Jouranal of national intigrated medical association(oct.2016)', '15', '27', 'ramesha mehata', 'pune', '11/3/2016', '', NULL, NULL),
(566, 'M 566', 'Swami Prapalanand', 'vivek jyoti(nov.2016)', '12', '548', 'Ramkrushna Publication', '', '11/3/2016', '', NULL, NULL),
(567, 'M 567', 'Anup Kumar Jha', 'phytopharm (oct2016)', '170', '55', 'flerbal information', '', '11/3/2016', '', NULL, NULL),
(568, 'M 568', 'swadesha aagraval', 'pranacharya aarogyam (oct2016)', '12', '38', 'Pranacharya Bhavan ', '', '11/4/2016', '', NULL, NULL),
(569, 'M 569', 'S P Kinsawadekar', 'Jouranal of integrated medical association (oct.2016)', '15', '27', 'ramesha mehata', 'pune', '11/4/2016', '', NULL, NULL),
(570, 'M 570', 'gopalsharan garge', 'sudha nidhi(oct2016)', '', '40', 'sudhanidhi karyalaya', 'aligadha', '11/9/2016', '', NULL, NULL),
(571, 'M 571', 'gopalsharan garge', 'sudha nidhi(sep2016)', '', '40', 'sudhanidhi karyalaya', 'aligadha', '11/9/2016', '', NULL, NULL),
(572, 'M 572', 'Swanand Pandit', 'ayurved patrika', '30', '54', 'ayurved seva sangha ', 'nashik', '11/15/2016', '', NULL, NULL),
(573, 'M 573', 'Amita Kaushal', 'heritage amruth', '30', '51', 'K Ved mediplan society', 'banglore', '11/15/2016', '', NULL, NULL),
(574, 'M 574', 'Anju Mamtani', 'swasthvatika', '30', '90', 'Jikumar Prakashan', 'Nagpur', '11/17/2016', '', NULL, NULL),
(575, 'M 575', 'jaynt jahagirdar      ', 'Aarogya Chikitsa', '20', '26', 'bhalchandra prakashan', 'Jalgaon', '11/17/2016', '', NULL, NULL),
(576, 'M 576', 'Swanand Pandit', 'ayurved patrika', '30', '52', 'ayurved seva sangha ', 'nashik', '11/17/2016', '', NULL, NULL),
(577, 'M 577', 'shri ramesh sharma', 'sachit ayurved(jan.-march2016)', '50', '52', 'baidyanath ayurved bhavan', 'Nagpur', '11/17/2016', '', NULL, NULL),
(578, 'M 578', 'shri ramesh sharma', 'sachit ayurved(jan.-march2016)', '50', '52', 'baidyanath ayurved bhavan', 'Nagpur', '11/17/2016', '', NULL, NULL),
(579, 'M 579', 'shri ramesh sharma', 'sachit ayurved(july-sep2016)', '50', '52', 'baidyanath ayurved bhavan', 'Nagpur', '11/17/2016', '', NULL, NULL),
(580, 'M 580', 'shri ramesh sharma', 'sachit ayurved(april-june2016)', '50', '52', 'baidyanath ayurved bhavan', 'Nagpur', '11/23/2016', '', NULL, NULL),
(581, 'M 581', 'shri ramesh sharma', 'sachitra ayurved(oct.-dec.2016)', '50', '52', 'baidyanath ayurved bhavan', '', '11/23/2016', '', NULL, NULL),
(582, 'M 582', 'shri ramesh sharma', 'sachitra ayurved(nov.2016)', '50', '52', 'baidyanath ayurved bhavan', '', '11/23/2016', '', NULL, NULL),
(583, 'M 583', 'V P Joglekar', 'Shri dhanvantari(nov.2016)', '31', '19', 'camp print kalpana', '', '11/23/2016', '', NULL, NULL),
(584, 'M 584', '', 'srujan chikitsa', '', '40', 'Mankarnika Publication', '', '11/23/2016', '', NULL, NULL),
(585, 'M 585', 'Amita Kaushal', 'heritage amruth(dec.2016)', '80', '53', '74/2 jarakabonde', '', '12/3/2016', '', NULL, NULL),
(586, 'M 586', 'S P Kinsawadekar', 'Jouranal of national intigrated medical association(nov.2016)', '15', '27', 'Ramesh Mehata', '', '3-12-0216', '', NULL, NULL),
(587, 'M 587', 'Swanand Pandit', 'ayurved patrika', '30', '84', 'ayurved seva sangha ', 'Nashik', '12/14/2016', '', NULL, NULL),
(588, 'M 588', 'Swanand Pandit', 'ayurved patrika', '30', '84', 'ayurved seva sangha ', 'Nashik', '12/14/2016', '', NULL, NULL),
(589, 'M 589', 'gopalsharan garge', 'sudhanidhi', '', '40', 'sudhanidhi karyalaya', 'aligadha', '12/14/2016', '', NULL, NULL),
(590, 'M 590', 'sanjeev sharma', 'jouranal of ayurved (april-june2015)', '', '144', 'National Institute of Ayurveda ', '', '12/21/2016', '', NULL, NULL),
(591, 'M 591', '', 'jouranal of ayurveda(april-june2015)', '', '144', 'National Institute of Ayurveda ', '', '12/21/2016', '', NULL, NULL),
(592, 'M 592', 'V P Joglekar', 'Shri dhanvantari(dec.2016)', '31', '18', 'Dhanwantari', '', '12/26/2016', '', NULL, NULL),
(593, 'M 593', 'Latif Kirmani', 'harbal chikitsa (dec.2016)', '40', '82', 'swami prakashan', 'Delhi', '12/26/2016', '', NULL, NULL),
(594, 'M 594', 'janadin hegade', 'sambhashan sandesha', '10', '34', 'k nrayan ', 'Banglore', '1/2/2017', '', NULL, NULL),
(595, 'M 595', 'swadesha aagraval', 'pranacharya aarogyam', '12', '39', '', '', '1/2/2017', '', NULL, NULL),
(596, 'M 596', 'Swami Prapalanand', 'vivek jyoti(jan.2017)', '12', '48', 'Ramkrushna Publication', 'raypur', '1/22/2017', '', NULL, NULL),
(597, 'M 597', 'Anup Kumar Jha', 'phytopharm(dec2016)', '170', '62', 'harbal information', 'Delhi', '1/2/2017', '', NULL, NULL),
(598, 'M 598', 'Janardan hegade', 'sambhashan sandesha(dec.2016)', '10', '34', 'k nrayan ', 'Banglore', '1/7/2017', '', NULL, NULL),
(599, 'M 599', 'Vandana Mule', 'Srujan chikitsa(nov.-dec.)', '', '40', 'Mankarnika Publication', '', '1/11/2017', '', NULL, NULL),
(600, 'M 600', 'pradeep multani', 'inf. Ayurveda(april-sep.)', '', '27', 'assoiatioon of manufracture of ayurvedic medicine', '', '1/11/2017', '', NULL, NULL),
(601, 'M 601', 'S P Kinsawadekar', 'Jouranal of national intigrated medical association (dec2016)', '15', '27', 'Ayurved Rasshala ', '', '1/11/2017', '', NULL, NULL),
(602, 'M 602', 'sanjeev sharma', 'jouranal of ayurveda', '', '144', 'national institute of ayurveda', '', '1/11/2017', '', NULL, NULL),
(603, 'M 603', 'Gopal sharan ', 'Sudhanidhi (Dec-2016)', '', '40', 'Garg Vanaushdhi Bhandar', '', '1/11/2017', '', NULL, NULL),
(604, 'M 604', 'Sanjeev sharma', 'Journal of Ayurveda (Jul-Sep 2015)', '', '144', 'National Institute of Aurved', 'Jaipur', '1/14/2017', '', NULL, NULL),
(605, 'M 605', 'Swadesh Agrwal', 'Pranachary Arogyam (Dec-16)', '12', '38', ' Vaidy Swadesh Agrwal', 'Aligadh', '1/14/2017', '', NULL, NULL),
(606, 'M 606', 'V.P.Jogdekar', 'Shree Dhanwantari ( Jan 2017)', '3', '18', 'Vaidhmitra Prakashan Pune', '', '1/23/2017', '', NULL, NULL),
(607, 'M 607', 'Swanand Pandit', 'Ayurved Patrika (Jan 2017)', '30', '56', 'Ayurved Seva Sangh', 'Nagpur', '1/23/2017', '', NULL, NULL),
(608, 'M 608', 'Swanand Pandit', 'Ayurved Patrika (Jan 2017)', '30', '56', 'Ayurved Seva Sangh', 'Nagpur', '1/23/2017', '', NULL, NULL),
(609, 'M 609', 'Latif Kirmani', 'Herbal Chikitsa', '40', '82', '', 'Delhi', '1/23/2017', '', NULL, NULL),
(610, 'M 610', 'A.K. Jha', 'Phytopharm (Jan 2017)', '170', '71', 'Herbal information centre', '', '2/6/2017', '', NULL, NULL),
(611, 'M 611', 'Swami Prapalanand', 'Vivek Jyoti (Feb 17)', '12', '98', 'Ramkrushna Publication', '', '2/6/2017', '', NULL, NULL),
(612, 'M 612', 'S.P. Kinjawadekar', 'Journal Of NIMA (jan 2017)', '15', '23', 'Ayurved Rasshala ', '', '2/6/2017', '', NULL, NULL),
(613, 'M 613', 'S.P. Kinjawadekar', 'Journal Of NIMA (jan 2017)', '15', '23', 'Ayurved Rasshala ', '', '2/6/2017', '', NULL, NULL),
(614, 'M 614', 'Anju Mamtani', 'Swasth Vatika', '30', '90', 'Jikumar Prakashan', '', '2/8/2017', '', NULL, NULL),
(615, 'M 615', 'Jandin Hegade', 'Sandeshsar', '10', '34', 'Aksharm Girinagaram', '', '2/8/2017', '', NULL, NULL),
(616, 'M 616', 'Ramesh Maheshwari', 'Ayushyaman', '35', '102', '', '', '2/8/2017', '', NULL, NULL),
(617, 'M 617', 'Jaynt jahagirdar      ', 'Arogy chikitsa (Feb 2017)', '20', '26', 'Bhalchandra prakashan', 'Jalgaon', '2/9/2017', '', NULL, NULL),
(618, 'M 618', 'V.P.Jogdekar', 'Shree Dhanwantari (Feb 2017)', '3', '20', 'Dhanwantari', '', '2/15/2017', '', NULL, NULL),
(619, 'M 619', 'Swanand Pandit', 'Ayurved Patrika ( Feb 2017)', '30', '54', 'Ayurved sevasangh', '', '2/15/2017', '', NULL, NULL),
(620, 'M 620', 'Swanand Pandit', 'Ayurved Patrika ( Feb 2017)', '30', '54', 'Ayurved sevasangh', '', '2/22/2017', '', NULL, NULL),
(621, 'M 621', 'sanjeev sharma', 'Journal of Ayurveda (oct -dec 2015)', '', '140', 'National Institute of Ayurved', '', '2/22/2017', '', NULL, NULL),
(622, 'M 622', 'sanjeev sharma', 'Journal of Ayurveda (oct -dec 2015)', '', '141', 'National Institute of Ayurved', '', '2/22/2017', '', NULL, NULL),
(623, 'M 623', 'sanjeev sharma', 'Journal of Ayurveda (oct -dec 2015)', '', '142', 'National Institute of Ayurved', '', '2/22/2017', '', NULL, NULL),
(624, 'M 624', 'Latif Kirmani', 'Herbal Chikitsa ( March 2017)', '40', '82', 'Swami Prakashak', '', '2/22/2017', '', NULL, NULL),
(625, 'M 625', '', 'Probe (jan March 2017)', '', '90', 'The Himalaya Drug Company', '', '2/22/2017', '', NULL, NULL),
(626, 'M 626', '', 'Evecare ( March 2017)', '', '28', '', '', '2/22/2017', '', NULL, NULL),
(627, 'M 627', '', 'Pediritz (March 2017)', '', '10', '', '', '2/22/2017', '', NULL, NULL),
(628, 'M 628', 'Janardan hegade', 'Sambhashan- Sandesh ( March2017)', '20', '42', 'Aksharm Girinagaram', '', '3/11/2017', '', NULL, NULL),
(629, 'M 629', 'S.Vembar', 'The Antiseptic ( March 17)', '100', '50', '', '', '3/11/2017', '', NULL, NULL),
(630, 'M 630', 'S.B. Thankmani', 'akshay jivan  ( Feb 2017) ', '30', '64', 'Sagar Printers', '', '3/11/2017', '', NULL, NULL),
(631, 'M 631', 'S.P. Kinjawadekar', 'Jornal of NIMA ( March 2017)', '', '27', 'Ramesh Mehata', '', '3/11/2017', '', NULL, NULL),
(632, 'M 632', 'S.P. Kinjawadekar', 'Jornal of NIMA ( March 2017)', '', '28', 'Ramesh Mehata', '', '3/11/2017', '', NULL, NULL),
(633, 'M 633', 'Vandana Mule', 'Srujan Chikitsa (Jan-Feb 2017)', '', '40', 'Mankarnika Publication', '', '3/11/2017', '', NULL, NULL),
(634, 'M 634', 'A.K. Jha', 'Phytopharm ( Feb 2017)', '170', '172', 'Herbal information centre', '', '3/11/2017', '', NULL, NULL),
(635, 'M 635', 'Kamleshkumar dvivedi', 'visha ayureved parishad Patrika ( Feb 17)', '', '48', '', '', '3/11/2017', '', NULL, NULL),
(636, 'M 636', 'Swami Prapalanand', 'Vivek Jyoti', '12', '148', 'Ramkrushna Publication', '', '3/11/2017', '', NULL, NULL),
(637, 'M 637', 'Gopalsharan Garg', 'Sudhanidhi (Feb 17)', '', '24', 'Sudhanidhi Karyalay', '', '3/11/2017', '', NULL, NULL),
(638, 'M 638', 'Pradeep Upadhyay', 'Pawan Parmpara (apr-jun 16)', '25', '72', 'Arpit Prakashn', '', '3/16/2017', '', NULL, NULL),
(639, 'M 639', 'Pradeep Upadhyay', 'Pawan Parmpara (apr-jun 16)', '25', '72', 'Arpit Prakashn', '', '3/16/2017', '', NULL, NULL),
(640, 'M 640', 'Pradeep Upadhyay', 'Pawan Parmpara (apr-jun 16)', '25', '72', 'Arpit Prakashn', '', '3/16/2017', '', NULL, NULL),
(641, 'M 641', 'Pradeep Upadhyay', 'Pawan Parmpara (apr-jun 16)', '25', '72', 'Arpit Prakashn', '', '3/16/2017', '', NULL, NULL),
(642, 'M 642', 'Jayant Jahagirdar', 'Arogy Chikitsa', '20', '26', 'Bhikamchand Jain', '', '3/18/2017', '', NULL, NULL),
(643, 'M 643', 'Mona Sharaf', 'Ayurved Partrika (march 2017)', '30', '56', 'Ayurved Sewa Sangh', '', '3/25/2017', '', NULL, NULL),
(644, 'M 644', 'Latif Kirmani', 'Herbal Chikitsa', '40', '81', 'Swami Prakashak', '', '3/25/2017', '', NULL, NULL),
(645, 'M 645', 'Swadesh Agrwal', 'Pranachary Arogym (Feb 17)', '12', '38', 'Pranacharya Bhavan ', '', '3/25/2017', '', NULL, NULL),
(646, 'M 646', 'S.P. Kinjawadekar', 'Journal of NIMA( March 2017)', '15', '28', 'Ramesh Mehata', '', '3/25/2017', '', NULL, NULL),
(647, 'M 647', 'S.P. Kinjawadekar', 'Journal of NIMA( March 2017)', '15', '28', 'Ramesh Mehata', '', '3/29/2017', '', NULL, NULL),
(648, 'M 648', 'Mona Sharaf', 'Ayurved Partrika (march 2017)', '30', '56', 'Ayurved Sewa Sangh', '', '3/29/2017', '', NULL, NULL),
(649, 'M 649', 'Ramesh Sharma', 'Sachitra Ayurved( Jan-March 16)', '50', '64', 'baidyanath ayurved bhavan', '', '3/31/2017', '', NULL, NULL),
(650, 'M 650', 'V.P.Jogdekar', 'Shree Dhanvantari (March 2017)', '3', '20', 'Shree Dhanvantari', '', '3/31/2017', '', NULL, NULL),
(651, 'M 651', 'Janardan hegade', 'Sambhashan Sandesh ', '20', '42', 'K Narayan', '', '3/31/2017', '', NULL, NULL),
(652, 'M 652', 'A.K. Jha', 'Phytopharm (March 2017)', '170', '71', 'Herbal information centre', '', '4/3/2017', '', NULL, NULL),
(653, 'M 653', 'Swami Prapalanand', 'Vivek Jyoti (April 2017)', '12', '198', 'Ramkrushna Publication', '', '4/3/2017', '', NULL, NULL),
(654, 'M 654', 'Amita Kaushal', 'Heritage Amruth (Jan -Feb 2017)', '80', '52', 'Jarakabande', '', '4/7/2017', '', NULL, NULL),
(655, 'M 655', 'Jayant Jahagirdar', 'Arogy Chikitsa', '20', '26', 'Aksharmudra ', 'Jalgaon', '4/8/2017', '', NULL, NULL),
(656, 'M 656', 'V.P.Jogdekar', 'Shree Dhanvantari (Apr 2017)', '3', '20', 'Vaidhmitra Prakashan Pune', '', '4/19/2017', '', NULL, NULL),
(657, 'M 657', 'Mona Sharaf', 'Ayurved Patrika ( Apr 17)', '50', '60', 'Ayurved Sewa Sangh', '', '4/19/2017', '', NULL, NULL),
(658, 'M 658', 'pradeep multani', 'Ayurveda ( Jan- March 2017)', '', '35', '', '', '4/24/2017', '', NULL, NULL),
(659, 'M 659', 'Ranjan Pejaver', 'Perinatology ( Jan-March 2017) ', '', '172', '', '', '4/24/2017', '', NULL, NULL),
(660, 'M 660', 'K.K. Aggarwal', 'Alloveda (Jan-March 2017)', '', '8', '', '', '4/24/2017', '', NULL, NULL),
(661, 'M 661', '', 'Longevity ( Jan-March 2017)', '', '15', '', '', '4/24/2017', '', NULL, NULL),
(662, 'M 662', 'Latif Kirmani', 'Herbal Chikitsa', '40', '81', 'R.A. Chaudhari', 'Delhi', '4/24/2017', '', NULL, NULL),
(663, 'M 663', 'S.P. Kinjawadekar', 'Journal Of NIMA ', '15', '22', 'Ayurveda Rasshala', 'Pune', '4/27/2017', '', NULL, NULL),
(664, 'M 664', 'Gopalsharan Garg', 'Siddh Prayaog Sangrah (Chaturth Bhag)', '', '319', 'Garg Vanaushdhi Bhandar', 'Aligadh', '4/27/2017', '', NULL, NULL),
(665, 'M 665', 'Swami Prapalanand', 'Vivek Jyoti (5 may 2017)', '12', '246', 'Ramkrushna Publication', '', '5/6/2017', '', NULL, NULL),
(666, 'M 666', 'A.K. Jha', 'Phytopharm ( Apr 2017)', '170', '71', 'Mrs. Kiran Jha', 'delhi', '5/6/2017', '', NULL, NULL),
(667, 'M 667', 'Vandana Mule', 'Srujan Chikitsa (March-Apr 2017)', '', '40', 'Mankarnika Publication', 'Pune', '5/9/2017', '', NULL, NULL),
(668, 'M 668', 'Jayant Jahagirdar', 'Arogy Chikitsa (May 2017)', '20', '', '', '', '', '', NULL, NULL),
(669, 'M 669', 'Latif Kirmani', 'Herbal Chikitsa', '40', '81', ' Swami Prakashak', 'Delhi', '5/24/2017', '', NULL, NULL),
(670, 'M 670', 'Gopalsharan Garg', 'Sudhanidhi (April 2017)', '', '40', 'Sudhanidhi Karyalay', 'Vijaygarh', '5/24/2017', '', NULL, NULL),
(671, 'M 671', 'Vishvnath Sharma', 'Sachitra Ayurved', '50', '64', 'baidyanath ayurved bhavan', '', '5/29/2017', '', NULL, NULL),
(672, 'M 672', 'S.P. Kinjawadekar', 'Journal of NIMA (May 2017)', '15', '27', '', '', '5/30/2017', '', NULL, NULL),
(673, 'M 673', 'P.P. Kirathamoorthy', 'Bhishak News  (oct- Dec 17)', '', '', '', '', '5/30/2017', '', NULL, NULL),
(674, 'M 674', 'Janardan hegade', 'Sambhashn Sandesh', '20', '', 'Aksharam girinagaram', '', '5/31/2017', '', NULL, NULL),
(675, 'M 675', 'sanjeev sharma', 'Jornal of Ayurveda ( Apr-Jun 2016)', '', '107', 'Ministry of Ayush', 'Jaipur', '6/8/2017', '', NULL, NULL),
(676, 'M 676', 'sanjeev sharma', 'Jornal of Ayurveda ( Apr-Jun 2016)', '', '108', 'Ministry of Ayush', 'Jaipur', '6/8/2017', '', NULL, NULL),
(677, 'M 677', 'sanjeev sharma', 'Jornal of Ayurveda ( Apr-Jun 2016)', '', '109', 'Ministry of Ayush', 'Jaipur', '6/8/2017', '', NULL, NULL),
(678, 'M 678', 'sanjeev sharma', 'Jornal of Ayurveda ( Jan -March 2016)', '', '110', 'Ministry of Ayush', 'Jaipur', '6/16/2017', '', NULL, NULL),
(679, 'M 679', 'sanjeev sharma', 'Jornal of Ayurveda ( Jan -March 2016)', '', '111', 'Ministry of Ayush', 'Jaipur', '6/16/2017', '', NULL, NULL),
(680, 'M 680', 'sanjeev sharma', 'Jornal of Ayurveda ( Jan -March 2016)', '', '112', 'Ministry of Ayush', 'Jaipur', '6/16/2017', '', NULL, NULL),
(681, 'M 681', 'sanjeev sharma', 'Jornal of Ayurveda ( Jan -March 2016)', '', '113', 'Ministry of Ayush', 'Jaipur', '6/16/2017', '', NULL, NULL),
(682, 'M 682', 'Nilakshi pradhan', 'Satyanveshanan ( May-Jul 2017)', '', '64', '', '', '6/16/2017', '', NULL, NULL),
(683, 'M 683', 'Mona Sharaf', 'Ayurved Patrika (10 Jun 2016)', '50', '58', 'Ayurved Sewa Sangh', '', '6/16/2017', '', NULL, NULL),
(684, 'M 684', 'V.P.Jogdekar', 'Shree Dhanvantari (jun 2017)', '3', '19', 'Vaidhmitra Prakashan Pune', '', '6/16/2017', '', NULL, NULL),
(685, 'M 685', 'sanjeev sharma', 'Jornal of Ayurveda ', '', '107', 'Ministry of Ayush', 'Jaipur', '6/18/2017', '', NULL, NULL),
(686, 'M 686', 'Gopalsharan Garg ', 'Sudhanidhi ( May 17)', '', '40', 'Sudhanidhi Karyalaya', 'Aligadh', '6/24/2017', '', NULL, NULL),
(687, 'M 687', 'Mona Sharaf', 'Ayurved Patrika (Jun )', '50', '58', 'Abhay Kulkarni', 'Nashik', '6/24/2017', '', NULL, NULL),
(688, 'M 688', '', 'Probe (April -Jun 2017)', '', '', 'The Himalaya Drug Company', '', '6/27/2017', '', NULL, NULL),
(689, 'M 689', 'Manasi Deshpande', 'IASTAM-News Letter', '6', '16', 'Vandana Kozarekar', 'Pune', '6/27/2017', '', NULL, NULL),
(690, 'M 690', 'Amita Kaushal', 'Heritage Amrut vetcare (Apr 2017)', '30', '55', 'Mediplan conventry society', 'Banglore', '6/27/2017', '', NULL, NULL),
(691, 'M 691', '', 'physiology Charts and Models', '', '6', 'Desh Biological works', 'Haryana', '6/27/2017', '', NULL, NULL),
(692, 'M 692', 'Govind Prasad Upadhayay', 'Pawan parampara', '25', '72', 'Arpit Prakashn', 'Nagpur', '6/27/2017', '', NULL, NULL),
(693, 'M 693', 'Satyandra Prasad Miashra ', 'Vishwa Ayu Patrika(june-2017)', '', '56', 'Nutan publications', '', '7/4/2017', '', NULL, NULL),
(694, 'M 694', 'R.K. Choudhri', 'Herbal Chikitsa(july-2017)', '40', '82', 'Herbal information centre', '', '7/4/2017', '', NULL, NULL),
(695, 'M 695', 'Dr.S.P.Kinjawadekar', 'Journel of National Integrated Medical association(jun-2017)', '15', '27', 'Ayurveda Rasshala', '', '7/4/2017', '', NULL, NULL),
(696, 'M 696', 'N.K.Jha', 'Phytophram(june-2017)', '170', '71', 'Herbal information centre', '', '7/5/2017', '', NULL, NULL),
(697, 'M 697', 'Vd.Vandana Mude', 'srujan Chikitsa(may,June-2017)', '', '40', 'Manikarnika Prakashan', '', '7/5/2017', '', NULL, NULL),
(698, 'M 698', 'Bhalcahndra Jhagirdar', 'arogya Chikitsa(july-2017)', '20', '26', 'Bhalchandra prakashan', '', '7/12/2017', '', NULL, NULL),
(699, 'M 699', '', 'Sudha Nidhi(june-2017)', '', '40', 'Sudhanidhi Karyalaya', '', '7/12/2017', '', NULL, NULL),
(700, 'M 700', 'V.P.Jogdekar', 'Shri Dhanwantari', '3', '18', 'Nandkishor Prakashan', 'Pune', '7/20/2017', '', NULL, NULL),
(701, 'M 701', 'Mona Sharaf', 'Ayurved Patrika', '', '58', 'Ayurved Seva Sangh', 'Nashik', '7/18/2017', '', NULL, NULL),
(702, 'M 702', 'Mona Sharaf', 'Ayurved Patrika ', '', '58', 'Ayurved Seva Sangh', 'Nashik', '7/18/2017', '', NULL, NULL),
(703, 'M 703', 'Ranjan Kumar Pejavar', 'Perinatology', '', '40', 'Scientific Publications', 'Banglore', '7/18/2017', '', NULL, NULL),
(704, 'M 704', '', 'The Educational Enterprises', '', '21', 'Eshwar publications', 'Hyderabad', '7/18/2017', '', NULL, NULL),
(705, 'M 705', 'Latif Kirmani', 'Herbal Chikitsa(Aug-2017)', '40', '81', 'Swami Prakashan', 'Delhi', '7/26/2017', '', NULL, NULL),
(706, 'M 706', 'Dr.S.P.Kinjawadekar', 'Journel of National Integrated Medical association(july-2017)', '15', '22', 'Mehta Publications ', 'Mumbai', '7/26/2017', '', NULL, NULL),
(707, 'M 707', 'Dr.S.P.Kinjawadekar', 'Journel of National Integrated Medical association(july-2017)', '15', '22', 'Mehta Publications ', 'Mumbai', '7/26/2017', '', NULL, NULL),
(708, 'M 708', 'IASTAM', 'Manasi Deshpande', '6', '', 'Indian Associations', 'Pune', '7/25/2017', '', NULL, NULL),
(709, 'M 709', 'Anup Kumar Jha', 'Phytopham ( july 2017)', '170', '71', 'Kiran Prakashan Delhi', '', '8/3/2017', '', NULL, NULL),
(710, 'M 710', 'Janardan hegade', 'Sambhasan Sandesh ( Aug 2017)', '20', '42', 'Aghram Prakashan', '', '8/8/2017', '', NULL, NULL),
(711, 'M 711', 'Vd. Devisaharan Garg', 'Sudhaneedhi ( july 2017)', '', '40', 'Sudhaneedhi Prakashan', '', '8/8/2017', '', NULL, NULL),
(712, 'M 712', 'Dr. Pradeep Upadhyay', 'Pawan Prampara( July- Sep 2017 ) ', '25', '17', 'Arpit Prakashn', 'Nagpur', '8/10/2017', '', NULL, NULL),
(713, 'M 713', 'Dr. V.P. Jogdekar', 'Shree Dhanwantari', '3', '18', 'Nandkishore Prakashan', 'Pune', '8/14/2017', '', NULL, NULL),
(714, 'M 714', 'Mona Sharaf', 'Ayurved Patrika ', '', '59', 'Abhay Prakashan', 'Nashik', '8/14/2017', '', NULL, NULL),
(715, 'M 715', 'Dr. Anju G. Mamtani', 'Swasthvatika (Jan-March 2017)', '30', '90', 'Gkumar Prakashan', 'Delhi', '8/14/2017', '', NULL, NULL),
(716, 'M 716', 'Vd. Jayant B. Jhahgirdar', 'Arogya Chikitsa ', '20', '27', 'Jyanat Prakashan', '', '8/16/2017', '', NULL, NULL),
(717, 'M 717', 'Pandit Vishwanath Sharma', 'Sachitra Ayurved ( july-sep 2017)', '50', '64', 'Badhyanath Prakashan', '', '8/22/2017', '', NULL, NULL),
(718, 'M 718', 'Latif Kirmani', 'Herbal Chikitsa (sep - 2017)', '40', '82', 'Swami Prakashan', '', '8/22/2017', '', NULL, NULL),
(719, 'M 719', 'Dr. Amita  Kaushal', 'Heritage Amruth ( May - June 20170', '80', '52', 'D.K. Ved Prakashan', '', '8/26/2017', '', NULL, NULL),
(720, 'M 720', 'Dr.S.P.Kinjawadekar', 'Journel of National Integrated Medical association', '15', '26', ' Mehta Publication', '', '8/29/2017', '', NULL, NULL),
(721, 'M 721', 'Janardhan Hegde', 'Sandesh sar', '20', '42', 'Akshram Prakashan', '', '9/4/2017', '', NULL, NULL),
(722, 'M 722', 'Anup Kumar Jha', 'Phytopham ', '170', '68', 'Kiran Prakashan Delhi', '', '9/12/2017', '', NULL, NULL),
(723, 'M 723', 'Vd. Gopalsharan Grag ', 'Sudhaneedhi ( Aug 2017)', '', '40', 'Sudhaneedhi Prakashan', '', '9/12/2017', '', NULL, NULL),
(724, 'M 724', 'Mona Sharaf', 'Ayurved Patrika ( Sep 2017)', '50', '59', 'Abhay Prakashan', '', '9/15/2017', '', NULL, NULL),
(725, 'M 725', 'Swami Prapalanand', 'Vivek jyoti ( Aug 2017)', '12', '50', 'Ramkrishn Prakashan', '', '9/15/2017', '', NULL, NULL),
(726, 'M 726', 'Dr. Anju G. Mamtani', 'Swasthvatika ( Oct- Dec 2016)', '30', '90', 'Gkumar Prakashan', '', '9/20/2017', '', NULL, NULL),
(727, 'M 727', 'Vd. P.Jodgekar', 'Shree Dhanwantari ( Sep 2017)', '3', '19', 'Nandkishore Prakashan', '', '9/20/2017', '', NULL, NULL),
(728, 'M 728', 'Latif Kirmani', 'Herbal Chikitsa ', '40', '81', 'swami prakashan ', '', '9/25/2017', '', NULL, NULL),
(729, 'M 729', 'Pawan kumar Godalwar', 'Journal Of Ayurveda ( Oct- Dec 2016)', '', '152', 'J.p. Prakashan', '', '9/29/2017', '', NULL, NULL),
(730, 'M 730', 'Pawan kumar Godalwar', 'Journal Of Ayurveda ( Jan- March 2017)', '', '160', 'J.p. Prakashan', '', '9/29/2017', '', NULL, NULL),
(731, 'M 731', 'Pawan kumar Godalwar', 'Journal Of Ayurveda ', '', '160', 'J.p. Prakashan', 'Jaipur', '9/29/2017', '', NULL, NULL),
(732, 'M 732', 'Manasi Deshpande', 'IASTAM News letter ( Sep 2017)', '6', '8', 'Bharti vidyapeeth ', 'Pune', '9/25/2017', '', NULL, NULL),
(733, 'M 733', 'Chhaiu Ram Yadav', 'NIA News letter ( Jan - March 2017)', '', '2', '', '', '9/29/2017', '', NULL, NULL),
(734, 'M 734', 'Anup Kumar Jha', 'Phytopham ( Sep-2017)', '170', '60', 'Kiran Prakashan Delhi', '', '10/7/2017', '', NULL, NULL),
(735, 'M 735', 'Anup Kumar Jha', 'Phytopham ( Sep-2017)', '170', '60', 'Kiran Prakashan Delhi', '', '10/7/2017', '', NULL, NULL),
(736, 'M 736', 'Anup Kumar Jha', 'Phytopham ( Sep-2017)', '170', '60', 'Kiran Prakashan Delhi', '', '10/9/2017', '', NULL, NULL),
(737, 'M 737', 'Dr. Amita  Kaushal', 'Heritage Amrut ( July- Aug 2017)', '80', '51', 'D.K. Ved Prakashan', '', '10/9/2017', '', NULL, NULL),
(738, 'M 738', 'Dr. Jayshree B. Keshav', 'Longivity ( April- June 2017)', '', '15', '', '', '10/9/2017', '', NULL, NULL),
(739, 'M 739', 'sanjeev sharma', 'Journal Of Ayurveda (Oct- Dec 2016)', '', '152', 'National Institute of Ayurveda', '', '10/9/2017', '', NULL, NULL),
(740, 'M 740', 'sanjeev sharma', 'Journal Of Ayurveda (Oct- Dec 2016)', '', '152', 'National Institute of Ayurveda', '', '10/9/2017', '', NULL, NULL),
(741, 'M 741', '', 'Infoline ( April - June 2017)', '', '24', 'Scientific Publications', '', '10/9/2017', '', NULL, NULL),
(742, 'M 742', '', 'Eye care ( April- June 2017)', '', '', '', '', '10/9/2017', '', NULL, NULL),
(743, 'M 743', 'Dr. Ranjan kumar Pejawar', 'Perinatology ( April-June 2017)', '', '', '', '', '10/9/2017', '', NULL, NULL),
(744, 'M 744', '', 'Probe ( july- sep 2017)', '', '', '', '', '10/9/2017', '', NULL, NULL),
(745, 'M 745', 'Dr. S.P. Kinjawadekar', 'Journel of National Integrated Medical association ( sep 2017)', '50', '19', 'Ayurveda Rasshala', '', '10/9/2017', '', NULL, NULL),
(746, 'M 746', 'Janardhan Hegde', 'Sambhasan sandesh ( Oct 2017)', '20', '42', 'Akshram Prakashan', '', '10/9/2017', '', NULL, NULL),
(747, 'M 747', 'Vd. Gopalsharan Grag ', 'Sudhaneedhi  ( Sep 2017)', '20', '40', 'Sudhaneedhi Prakashan', 'Aligarh', '10/10/2017', '', NULL, NULL),
(748, 'M 748', 'Mona Sharaf', 'Ayurved Patrika ( Oct 2017)', '50', '59', 'Ayurved seva sangh', '', '10/17/2017', '', NULL, NULL),
(749, 'M 749', 'Swami Prapalanand', 'Vivek jyoti ( oct 2017)', '25', '534', 'Ramkrishn Prakashan', '', '10/17/2017', '', NULL, NULL),
(750, 'M 750', 'Nandkumar Mule', 'Vaidya raj ( Aug - Sep - Oct 2017)', '25', '62', 'Aswad prakashan', '', '10/17/2017', '', NULL, NULL),
(751, 'M 751', 'Raghunandan Sharma ', 'Ayurved Mahasammelan Patrika ( SEP 2017)', '20', '52', 'Dhanwantari Prakashan', '', '10/17/2017', '', NULL, NULL),
(752, 'M 752', 'Dr. Premdat Pandey', 'Nirogdham ', '40', '106', 'Prabhu Krupa Prakashan ', '', '10/17/2017', '', NULL, NULL),
(753, 'M 753', 'Raghunandan Sharma ', 'Ayurved Mahasammelan Patrika', '20', '52', ' Chanakya Prakashan ', '', '10/23/2017', '', NULL, NULL),
(754, 'M 754', 'Swadesh Agrawal ', ' Pranacharya Arogyam', '12', '40', ' Agrawal Press House', 'Vijaygarh', '10/23/2017', '', NULL, NULL),
(755, 'M 755', 'Dr. V.P. Jogdekar', ' Shree Dhanwantari', '3', '18', 'Nandkishore Prakashan', '', '10/17/2017', '', NULL, NULL),
(756, 'M 756', 'Balchandra Jahagirdar', 'Arogya chikitsa ', '20', '26', 'Jain Prakashan', 'Jalgaon', '10/16/2017', '', NULL, NULL),
(757, 'M 757', 'Janardhan Hegde', 'Sambhshan sandesh(nov 2017)', '20', '42', 'Narayan Prakashan', '', '11/10/2017', '', NULL, NULL),
(758, 'M 758', 'Raghunandan Sharma ', 'Ayurveda Mahasammelan Patrika(oct 2017)', '20', '50', 'Ayurved Prakashan', '', '11/10/2017', '', NULL, NULL),
(759, 'M 759', 'Latif Kirmani', 'Herbal Chikitsa(nov-2017)', '40', '81', 'swami Prakashan ', '', '11/10/2017', '', NULL, NULL),
(760, 'M 760', 'Anup Kumar Jha', 'Phytopharm(oct 2017)', '170', '71', 'Kiran Prakashan Delhi', '', '11/10/2017', '', NULL, NULL),
(761, 'M 761', 'Dr. S.P. Kinjawadekar', 'Journal of National Integrated Medial Association (oct 2017)', '15', '18', '', '', '11/10/2017', '', NULL, NULL),
(762, 'M 762', 'Nandkumar Mule', 'Vaidya raj ( Nov-Dec-Jan2018)', '100', '142', 'aaswad Prakashan', 'Mumbai', '11/10/2017', '', NULL, NULL),
(763, 'M 763', 'Swami Prapalanand', 'Vivek Jyoti(Nov 2017)', '12', '50', 'Ramkrishn Prakashan', 'Raipur', '11/10/2017', '', NULL, NULL),
(764, 'M 764', 'Balchandra Jahagirdar', 'Arogya Chikitsa(Nov 2017)', '20', '28', 'akshmudra Printers', 'Jalgaon', '11/10/2017', '', NULL, NULL),
(765, 'M 765', 'Dr. S.P. Kinjawadekar', 'Journal of National Integrated Medial Association ', '15', '20', 'Mehta Publications ', '', '11/22/2017', '', NULL, NULL),
(766, 'M 766', 'Vd. Vandana Mule ', 'Srujan Chikitsa', '', '40', 'Manikarnika Publications', 'Pune', '11/25/2017', '', NULL, NULL),
(767, 'M 767', 'Swadesh Agrawal ', 'Pranacharya Arogyam', '12', '40', 'Agrawal Prakashan', 'Vijaygarh', '11/24/2017', '', NULL, NULL),
(768, 'M 768', 'Raghunandan Sharma ', 'Ayurved Mahasamelan Patrika', '20', '50', 'Chanakya prakashan', 'New Delhi', '11/24/2017', '', NULL, NULL),
(769, 'M 769', 'Raghunandan Sharma ', 'Ayurved Mahasamelan Patrika', '20', '50', 'Vishwas Publications', 'New Delhi', '11/24/2017', '', NULL, NULL),
(770, 'M 770', 'Latif Kirmani', 'Herbal Chikitsa', '40', '81', 'Ayurved Prakashan', 'Delhi', '11/22/2017', '', NULL, NULL),
(771, 'M 771', 'Mona Sharaf', 'Ayurved Patrika', '', '58', 'Ayurved Prakashan', 'Nashik', '11/22/2017', '', NULL, NULL),
(772, 'M 772', 'Vd. Devisaharan Garg', 'Sudhaneedhi', '', '40', 'Sudhaneedhi Prakashan', 'Aligarh', '11/14/2017', '', NULL, NULL),
(773, 'M 773', 'Dr. Jayshree B. Keshav', 'Eye care', '', '36', 'Himalaya drug company', 'Banglore', '11/13/2017', '', NULL, NULL),
(774, 'M 774', 'Dr.K.K. Agrawal', 'ALLOVEDA and Pediritz', '', '26', 'Himalaya drug company', '', '11/13/2017', '', NULL, NULL);
INSERT INTO `library_journal` (`id`, `registration_no`, `author_name`, `name`, `price`, `pages`, `publisher`, `seller`, `date`, `bill_no`, `created_at`, `updated_at`) VALUES
(775, 'M 775', 'Dr. S.P. Kinjawadekar', 'Journal of National Integrated Medial Association (Nov 2017)', '15', '42', 'National Integrated Medical Association', 'Mumbai', '12/4/2017', '', NULL, NULL),
(776, 'M 776', 'Janardhan Hegde', 'Sambhasan Sandesh (17)', '20', '54', 'K.Narayan Publication', 'Banglore', '12/4/2017', '', NULL, NULL),
(777, 'M 777', 'Anup Kumar Jha', 'Phytopharm (Nov 17)', '170', '54', 'Kiran Prakashan Delhi', 'New Delhi', '12/4/2017', '', NULL, NULL),
(778, 'M 778', 'Nelaksi Pradhan', 'Satyan veshanam today (Nov 17-Jan 18)', '', '128', 'Arogya Mandar Publication', 'Pune', '', '', NULL, NULL),
(779, 'M 779', 'Nelaksi Pradhan', 'Satyan veshanam today (Nov 17-Jan 18)', '', '128', '', '', '12/6/2017', '', NULL, NULL),
(780, 'M 780', 'Dr. Anju G. Mamtani', 'Swasth vatika ', '30', '90', 'Gkumar Publication', 'Nagpur', '12/4/2017', '', NULL, NULL),
(781, 'M 781', '', 'Educational Enterprises', '', '26', 'Eshwar publications', 'Hyderabad', '12/8/2017', '', NULL, NULL),
(782, 'M 782', 'Amita Kaushal', 'Heritage Amrut', '80', '51', 'Mediplan conventry society', '', '12/11/2017', '', NULL, NULL),
(783, 'M 783', 'Dr. Jayshree B. Keshav', 'Himalaya live line ( july -Sep 2017)', '', '20', '', '', '12/11/2017', '', NULL, NULL),
(784, 'M 784', 'Dr. Jayshree B. Keshav', 'Longevity ( July- sep 2017)', '', '14', '', '', '12/11/2017', '', NULL, NULL),
(785, 'M 785', 'Dr. Jayshree B. Keshav', 'Infoline ( July-sep 2017)', '', '24', '', '', '12/11/2017', '', NULL, NULL),
(786, 'M 786', 'Dr. Narendra Bhat', 'IASTAM News letter ( Nov 2017)', '6', '12', 'Bharti vidyapeeth ', '', '12/11/2017', '', NULL, NULL),
(787, 'M 787', 'Swami Satyarupanand', 'Vivek jyoti (12 Dec 2017)', '12', '60', 'Ramkrishn Prakashan', '', '12/11/2017', '', NULL, NULL),
(788, 'M 788', 'Prof. Sanjeev Sharma', 'Journal of Ayurveda ( April-June 2017)', '', '152', 'National Institute of Ayurveda ', '', '12/11/2017', '', NULL, NULL),
(789, 'M-789', 'Pradip Upadhyay', 'Pavan Parampara Oct.-Dec.-2017', '25', '72', 'Arpit Prakashan', 'Nagpur', '12/16/2017', '', NULL, NULL),
(790, 'M-790', 'Mona Saraf', 'Ayurved Patrika Dec.-2017', '50', '57', 'Ayurved Seva Sangh', 'Nashik', '12/16/2017', '', NULL, NULL),
(791, 'M-791', 'Dilip Mhesekar', 'Varta Vishesh Nov.- 2017', '7', '24', 'Kalidas Chavhan Prakashan', 'Nashik', '12/16/2017', '', NULL, NULL),
(792, 'M-792', 'Jayant Jahagirdar', 'Arogya Chikitsa Dec.-2017', '20', '26', 'Jahagirdar Prakashan', 'Jalgaon', '12/16/2017', '', NULL, NULL),
(793, 'M-793', 'Mansi Deshpande', 'IASTAM NEWSLETTER', '6', '7', '', '', '12/16/2017', '', NULL, NULL),
(794, 'M-794', 'Gopalsharan Garg', 'Sudha Nidhi Nov.- 2017', '', '40', 'Sudha Nidhi Prakashan', 'Aligadh', '12/18/2017', '', NULL, NULL),
(795, 'M-795', 'Asit Kumar Jha', 'Journal Of Ayurveda April-june-2017', '', '152', 'J.P.Sharma Prakashan', 'Jaipur', '12/18/2017', '', NULL, NULL),
(796, 'M-796', '', 'BhishekNews July-Sep. 2017', '', '12', 'Publication Division', 'Kottakkal', '12/22/2017', '', NULL, NULL),
(797, 'M-797', '', 'BhishekNews July-Sep. 2017', '', '11', 'P.S.Varier Prakashan', 'Kottakkal', '12/22/2017', '', NULL, NULL),
(798, 'M-798', '', 'International Conference On Ayurveda', '', '', 'D.Y.Patil Prakashan', '', '12/22/2017', '', NULL, NULL),
(799, 'M-799', 'Sanjeev Sharma', 'NIA Newsletter', '', '', '', '', '12/28/2017', '', NULL, NULL),
(800, 'M-800', 'Latif Kirmani', 'Harbal Chikitsa ', '40', '79', 'Swami Prakashan', 'Delhi', '12/30/2017', '', NULL, NULL),
(801, 'M-801', 'S.P.Kinjawadekar', 'Journal Of NIMA', '15', '22', 'Ramesh Mehta Prakashan', 'Mumbai', '12/30/2017', '', NULL, NULL),
(802, 'M-802', 'Raghunand Sharma', 'Ayurved Mahasammelan Patrika', '20', '52', 'Ayurved Mahasammelan Prakashan', 'Delhi', '12/30/2017', '', NULL, NULL),
(803, 'M-803', 'Rajankumar Pejaver', 'Perinatology ( Oct.- Dec. 2017 ) Capsule', '', '81-120', '', '', '12/30/2017', '', NULL, NULL),
(804, 'M-804', 'Gopalsharan Garg', 'Sudha Nidhi ', '', '40', 'Sudha Nidhi Prakashan', 'Aligadh', '1/9/2018', '', NULL, NULL),
(805, 'M-805', 'Vandana Mule', 'Srujan Chikitsa', '', '40', 'Mankarnika Prakashan', 'Pune', '1/9/2018', '', NULL, NULL),
(806, 'M-806', 'Swadesh Agrawal ', 'Pranacharya Arogyam Dec.-2017', '12', '38', 'Pranacharya Publication', 'Vijaygadh', '1/15/2018', '', NULL, NULL),
(807, 'M-807', 'Mona Saraf', 'Ayurved Patrika ', '', '72', 'Ayurved Seva Sangh', 'Nashik', '1/15/2018', '', NULL, NULL),
(808, 'M-808', 'Narendra Bhatt', 'IASTAM NEWSLETTER 2 Jan.-2017', '6', '12', 'Indian Association Publication', '', '1/19/2018', '', NULL, NULL),
(809, 'M-809', 'Pradeep Multani', 'Ayurveda July- Sep. 2017', '', '23', '', '', '1/19/2018', '', NULL, NULL),
(810, 'M-810', 'Santosh Kumar', 'Ayushya-Amritam 16-17 April 2017', '', '164', '', '', '1/19/2018', '', NULL, NULL),
(811, 'M-811', 'Premdatta Pandey', 'Nirogdham Jan.-2018', '40', '106', 'Ashok kumar Pandey Prakashan', '', '1/19/2018', '', NULL, NULL),
(812, 'M-812', 'Mona Saraf', 'Ayurved Patrika Jan-2018', '', '72', 'Ayurved Seva Sangh', 'Nashik', '1/19/2018', '', NULL, NULL),
(813, 'M-813', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika Jan.-2018', '', '50', 'Ayurved Mahasammelan Prakashan', 'New Delhi', '1/23/2018', '', NULL, NULL),
(814, 'M-814', '', 'Probe ( Oct.-Dec. 2017) Eva Care', '', '64', 'Himalaya Publication', 'Bengluru', '1/23/2018', '', NULL, NULL),
(815, 'M-815', 'Banwarilal Gaud', 'Ayurved Mahasammelan Patrika Jan.-2018', '20', '50', 'Ayurved Mahasammelan Prakashan', '', '1/29/2018', '', NULL, NULL),
(816, 'M-816', 'Swami Prapalanand', 'Vivek Jyoti ( Feb.-2018 )', '12', '96', 'Ramkrushna Mishan Prakashan', 'Bengluru', '2/5/2018', '', NULL, NULL),
(817, 'M-817', 'Janardan Hegde', 'Sambhashan Sandesh Feb.-2018', '10', '42', 'K.Narayan Prakashan', 'Bengluru', '2/6/2018', '', NULL, NULL),
(818, 'M-818', 'Anupkumar Jha', 'Phytopharm', '170', '100', 'Quality Creators', 'Delhi', '2/6/2018', '', NULL, NULL),
(819, 'M-819', 'Amita Kaushal', 'Heritage Amruth', '80', '47', 'D.K.Ved Prakashan', 'Bengluru', '2/6/2018', '', NULL, NULL),
(820, 'M-820', 'S.P.Kinjawadekar', 'Journal Of NIMA', '15', '22', 'Ayurveda Rasashala', '', '2/6/2018', '', NULL, NULL),
(821, 'M-821', 'Ramesh Sharma ', 'Sachitra Ayurved', '70', '64', 'Baidyanath Prakashan', '', '2/6/2018', '', NULL, NULL),
(822, 'M-822', 'Sanjeev Sharma', 'Journal Ayurveda July-Sep 2017', '', '136', 'J.P.Sharma Prakashan', '', '2/15/2018', '', NULL, NULL),
(823, 'M-823', 'S.P.Kinjawadekar', 'Journal Of NIMA Jan.-2018', '15', '23', 'Ayurveda Rasashala', '', '2/15/2018', '', NULL, NULL),
(824, 'M-824', '', 'Sudha Nidhi Jan.-2018', '', '40', 'Sudha Nidhi Prakashan', 'Aligadh', '2/15/2018', '', NULL, NULL),
(825, 'M-825', 'Mona Saraf', 'Ayurved Patrika Feb.-2018', '50', '59', 'Ayurved Seva Sangh', 'Nashik', '2/15/2018', '', NULL, NULL),
(826, 'M-826', 'Mona Saraf', 'Ayurved Patrika Feb.-2018', '50', '59', 'Ayurved Seva Sangh', 'Nashik', '2/15/2018', '', NULL, NULL),
(827, 'M-827', 'Nilakshi Pradhan', 'Santyanveshanam Today Feb.-2018', '', '32', 'Maharashtra Arogya Mandal', 'pune', '2/24/2018', '', NULL, NULL),
(828, 'M-828', '', 'Journal Of Ayurveda July-Sep.-2017', '', '136', '', '', '2/24/2018', '', NULL, NULL),
(829, 'M-829', '', 'Journal Of Ayurveda July-Sep.-2017', '', '136', '', '', '2/27/2018', '', NULL, NULL),
(830, 'M-830', 'Banwarilal Gaud', 'Ayurved Mahasammelan Patrika Feb.-2018', '20', '52', 'Ayurved Mahasammelan Prakashan', '', '2/27/2018', '', NULL, NULL),
(831, 'M-831', 'Banwarilal Gaud', 'Ayurved Mahasammelan Patrika Feb.-2018', '20', '52', 'Ayurved Mahasammelan Prakashan', '', '2/27/2018', '', NULL, NULL),
(832, 'M-832', '', 'The Educational Enterprises', '', '26', '', '', '2/27/2018', '', NULL, NULL),
(833, 'M-833', 'Nilakshi Pradhan', 'Santyanveshanam Today Feb.-2018', '', '32', 'Sumatibai Shah Prakashan', 'pune', '2/27/2018', '', NULL, NULL),
(834, 'M-834', 'S.P.Kinjawadekar', 'Journal Of NIMA', '15', '23', 'Ayurveda Rasashala', '', '2/27/2018', '', NULL, NULL),
(835, 'M-835', 'Pradip Upadhyay', 'Pavan Parampara Jan.- March 2018', '25', '72', 'Arpit Prakashan', 'Nagpur', '2/28/2018', '', NULL, NULL),
(836, 'M-836', 'Suresh Das', 'Journal Of Traditional & Folk Practices June 2017', '300', '122', '', '', '3/6/2018', '', NULL, NULL),
(837, 'M-837', 'Philipe Haydon', 'Infoline Oct.-Dec. 2017', '', '24', 'Scientific Publication', '', '3/6/2018', '', NULL, NULL),
(838, 'M-838', 'Anupkumar Jha', 'Phytopharm Dec.-2017', '170', '', 'Kiran Jha Publication', '', '3/6/2018', '', NULL, NULL),
(839, 'M-839', 'Janardan Hegde', 'Sambhashan Sandesh Jan.-2018', '20', '42', 'K.Narayan Prakashan', 'Bengluru', '3/6/2018', '', NULL, NULL),
(840, 'M-840', 'Swadesh Agrawal ', 'Pranacharya Arogyam Nov.-2017', '12', '38', 'Pranacharya Publication', 'Vijaygadh', '3/6/2018', '', NULL, NULL),
(841, 'M-841', 'Swami Pratyanand', 'Vivek Jyoti ( jan-2018 )', '12', '48', 'Ramkrushna Mishan Prakashan', 'Raipur', '3/6/2018', '', NULL, NULL),
(842, 'M-842', 'Nandakumar Mule', 'Vaidyaraj Feb -march April2018', '25', '62', 'Aswah Prakashan', 'Mumbai', '3/8/2018', '', NULL, NULL),
(843, 'M-843', 'N.S.Sigh ', 'Perfect Health Care Jan 2018', '30', '32', 'Dr.A P singh ', 'Indore', '3/8/2018', '', NULL, NULL),
(844, 'M-844', 'N.S.Sigh ', 'Perfect Health Care Jan 2019', '30', '32', 'Dr.A P singh ', 'Indore', '3/8/2018', '', NULL, NULL),
(845, 'M-845', 'Vandana  Mule', ' Srujan Chikitsa Jan Feb 2018', '', '40', 'Mankarnika Prakashan', 'Pune', '3/8/2018', '', NULL, NULL),
(846, 'M-846', 'Janardan Hegde', 'Sambhashana Sandesh March 2018 ', '20', '42', 'Akshram Prakashana', 'Bengluru', '3/8/2018', '', NULL, NULL),
(847, 'M-847', 'Rajeshkumar Sharma', 'Dr.Sarvpalli Radhakrushna Rajstan Vishwavidyalaya oct 2017', '', '15', 'Tulsidas Prakashna', 'Jodhpur', '3/8/2018', '', NULL, NULL),
(848, 'M-848', 'Rajeshkumar Sharma', 'Dr.Sarvpalli Radhakrushna Rajstan Vishwavidyalaya oct 2018', '', '15', 'Tulsidas Prakashna', 'Jodhpur', '3/8/2018', '', NULL, NULL),
(849, 'M-849', 'N.S.Sigh ', 'Perfect Health Care', '30', '32', 'S.P. Sigh', '', '3/13/2018', '', NULL, NULL),
(850, 'M-850', 'Swami Prapatyanand', 'Vivek Jyoti March 2018', '12', '144', 'Radhakrushna Mission Prakashna', 'Raipur', '3/13/2018', '', NULL, NULL),
(851, 'M-851', 'Sunil Borkar', 'Ayurved Darpan Journal Of Indian Medicine oct-dec 2017', '48', '194', 'Rasanrut Publication', 'Kolhapur', '3/13/2018', '', NULL, NULL),
(852, 'M-852', 'Anupkumar Jha', 'Phytopharma feb 2018', '170', '103', 'Kiran Jha Publication', 'Delhi', '3/13/2018', '', NULL, NULL),
(853, 'M-853', 'Mona Saraf', 'Ayurved Patrika', '50', '56', 'Abhay Kulkarni', '', '3/16/2018', '', NULL, NULL),
(854, 'M-854', 'Amita Kaushal', 'Heritage Amruth jan-feb 18', '100', '56', 'D.K.Ved', 'Bengluru', '3/23/2018', '', NULL, NULL),
(855, 'M-855', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika march -2018', '20', '50', 'Ayurved Mahasammelan Patrika ', 'Delhi', '3/23/2018', '', NULL, NULL),
(856, 'M-856', 'Swami Prapatyanand', 'Vivek Jyoti apr 2018', '12', '192', 'Ramkrushna Mishan Prakashan', 'Raipur', '4/5/2018', '', NULL, NULL),
(857, 'M-857', 'S.P.Kinjawadekar', 'Journal Of National Integral Medical Association March 2018', '15', '26', 'National Integral Medical Association', 'Mumbai', '', '', NULL, NULL),
(858, 'M-858', 'Jnaedhan Hedage ', 'Sandeshsar apr 18', '20', '', '', '', '', '', NULL, NULL),
(859, 'M-859', 'Rajankumar Pejaver', 'Perinatology ( jan -mar2018 )', '', '154', 'Himalaya Publication', 'Bengluru', '4/3/2018', '', NULL, NULL),
(860, 'M-860', '', 'Pediatry &Capsule ', '', '', 'Himalaya Publication', 'Bengluru', '4/3/2018', '', NULL, NULL),
(861, 'M-861', 'Anupkumar Jha', 'Phytopharm march 2018', '170', '99', 'Phytopharma publication', 'Delhi', '4/9/2018', '', NULL, NULL),
(862, 'M-862', 'Sheela B. Karlam', 'Treatise Dec 2017', '', '52', '', '', '4/9/2018', '', NULL, NULL),
(863, 'M-863', 'Sarita Pose ', 'The World Of NAMC 2016-2017', '', '', '', '', '4/13/2018', '', NULL, NULL),
(864, 'M-864', 'Premdatta Pandey', 'Nirogdham 2018', '40', '106', 'Ajeet Printers ', 'Indore', '4/19/2018', '', NULL, NULL),
(865, 'M-865', 'Gopalsharan Garg', 'Sidha Prayog Sangrah avum Anubhut Ayurved Chikitsank', '150', '320', 'Sudha Nidhi Prakashan', 'Vijaygadh', '4/19/2018', '', NULL, NULL),
(866, 'M-866', 'Mona Saraf', 'Ayurved Patrika apr 5', '50', '59', 'Ayurvedseva sangha ', 'Ganeshwadi', '4/19/2018', '', NULL, NULL),
(867, 'M-867', 'Mona Saraf', 'Ayurved Patrika apr 6', '50', '59', 'Ayurvedseva sangha ', 'Ganeshwadi', '4/19/2018', '', NULL, NULL),
(868, 'M-868', 'Narendra Bhatt', 'IASTAM apr 2018', '6', '8', 'Indian Association Publication', 'Pune', '4/21/2018', '', NULL, NULL),
(869, 'M-869', 'J.B Jaragirdar', 'Arogya Chikitsa apr-2018', '20', '27', 'Jayant Association ', 'Pune', '4/21/2018', '', NULL, NULL),
(870, 'M-870', 'Nanvarilal Gaug', 'Ayurved Mahasammelan Patrika apr -2018', '20', '50', 'Ayurved Mahasammelan Patrika ', 'Delhi', '4/21/2018', '', NULL, NULL),
(871, 'M-871', 'Swadesh Agrawal ', 'Pranachary Arogyam feb 2018', '12', '39', 'Pranacharya Publication', 'Vijaygadh', '4/26/2018', '', NULL, NULL),
(872, 'M-872', 'Shankar Kinjawadkar', 'Journal of National Integral Medical Associationapr 2018', '15', '15', 'Ramesh Mehta Prakashan', 'Mumbai', '4/26/2018', '', NULL, NULL),
(873, 'M-873', 'Shankar Kinjawadkar', 'Journal of National Integral Medical Associationapr 2018', '15', '15', 'Ramesh Mehta Prakashan', 'Mumbai', '4/26/2018', '', NULL, NULL),
(874, 'M-874', 'N.S.Sigh ', 'Perfect Health Care', '30', '32', 'Guru Aashish Education', 'Indore', '4/28/2018', '', NULL, NULL),
(875, 'M-875', 'Narendra Bhatt', 'INSTAM Mrch 2018', '6', '', 'Bharati Vidhyapit', 'pune', '4/28/2018', '', NULL, NULL),
(876, 'M-876', 'Janardhan Herade', 'Sambhashan Sandhesh', '20', '42', 'Akshram Prakashana', 'Bengluru', '5/4/2018', '', NULL, NULL),
(877, 'M-877', 'Vivek Joti', 'Svami Prapatyanand', '15', '193-240', 'Ramkrushna Mishan Prakashan', 'Raipur', '5/4/2018', '', NULL, NULL),
(878, 'M-878', 'Phytopharm', 'Anumkumar Za', '170', '99', 'Quality Creators', 'Delhi', '5/4/2018', '', NULL, NULL),
(879, 'M-879', 'Ramaji Singh', 'Perfect Health Care', '30', '32', 'S.P. Sigh', 'Indore', '5/14/2018', '', NULL, NULL),
(880, 'M-880', 'Gopalsharan Garge', 'Sudhanidhi', '', '40', 'Sudha Nidhi Prakashan', 'Aligadh', '5/18/2018', '', NULL, NULL),
(881, 'M-881', 'Vandhana mude ', 'Srujan Chikitsa', '', '40', 'Girish Gandhi Mankarnika Publication', 'Pune', '5/18/2018', '', NULL, NULL),
(882, 'M-882', 'Mona Saraf', 'Ayurveda Patrika ', '50', '56', 'Ayurveda Seva Sangh', 'Nashik', '5/16/2018', '', NULL, NULL),
(883, 'M-883', 'Mona Saraf', 'Ayurveda Patrika ', '50', '56', 'Ayurveda Seva Sangh', 'Nashik', '5/24/2018', '', NULL, NULL),
(884, 'M-884', 'Raghunand Sharma ', 'Ayurveda Mahasamelan Patrika ', '20', '50', 'Ayurveda Mahasamelan Patrika Karyalaya', 'Delhi', '5/24/2018', '', NULL, NULL),
(885, 'M-885', 'K.K.Agrawal ', 'ALLOVEDA ', '', '7', 'The Himalaya Drug Company', '', '7/5/2018', '', NULL, NULL),
(886, 'M-886', '', 'Evecare ', '', '32', 'The Himalaya Drug Company', '', '7/5/2018', '', NULL, NULL),
(887, 'M-887', 'Jayshee B Keshav ', 'Probe  Jan -March 2018', '', '82', 'The Himalaya Drug Company', '', '6/5/2018', '', NULL, NULL),
(888, 'M-888', '', 'Himalaya Live Line Jan - March 2018', '', '20', 'The Himalaya Drug Company', '', '6/5/2018', '', NULL, NULL),
(889, 'M-889', '', 'Infoline Jan -march 2018', '', '20', 'The Himalaya Drug Company', '', '6/5/2018', '', NULL, NULL),
(890, 'M-890', 'S.P.Kinjawadekar', 'Journal Of National Integrate Medical associaton', '', '22', 'Ayurveda rasashala', '', '6/5/2018', '', NULL, NULL),
(891, 'M-891', 'Janardan Hegde', 'Sambhashan Sandesh ', '20', '42', 'K.Narayan Prakashan', 'Bengluru', '6/6/2018', '', NULL, NULL),
(892, 'M-892', 'Anupkumar Jha', 'Phytopharm', '170', '102', 'Mrs. Kiran Za', 'Delhi', '6/6/2018', '', NULL, NULL),
(893, 'M-893', 'Swami Prapatyanand', 'Vivek Joti ', '15', '          241-288', 'Prapatyanand Mission ', 'Raipur', '6/7/2018', '', NULL, NULL),
(894, 'M-894', 'Jayant Jahagirdar', 'Aarogya Chikitsa ', '20', '26', 'Akshar Mudra Print ', 'Jalgoun', '6/7/2018', '', NULL, NULL),
(895, 'M-895', '', 'Education Enterprices', '', '20', 'Eeshu or Bharam Beside Hotel', 'Hydrabad', '6/7/2018', '', NULL, NULL),
(896, 'M-896', 'Devisharan Garg', 'Sudhanidhi', '', '40', 'Sudha Nidhi Prakashan', 'Vijaygadh', '6/12/2018', '', NULL, NULL),
(897, 'M-897', 'Jayant bhalchandra Jahagirdar', 'Aarogya Chikitsa ', '20', '26', 'Akshar Mudra Print ', 'Jalgoun', '6/12/2018', '', NULL, NULL),
(898, 'M-898', 'Ajaykumar Pande ', 'Vishva ayurveda Parishad Patrika ', '', '56', 'Vishva ayurveda Parishad Patrika ', 'Uttarpradesh', '6/12/2018', '', NULL, NULL),
(899, 'M-899', 'S.P.Kinjawadekar', 'Journal Of National Integrate Medical associaton', '15', '22', 'Ayurveda rasashala', 'Pune', '6/12/2018', '', NULL, NULL),
(900, 'M-900', 'Pradeep Multani', 'Ayurveda Jan-March 2018', '', '31', '', '', '6/12/2018', '', NULL, NULL),
(901, 'M-901', 'Mona Saraf', 'Ayurved Patrika June2018', '', '56', 'Ayuved Sevasang ', 'Nashik', '4/14/2018', '', NULL, NULL),
(902, 'M-902', 'Amita Kaushal', 'Heritage Amrut April 2018', '100', '54', 'D.K.Ved Made Plan Conservatory Society', 'Bengluru', '4/14/2018', '', NULL, NULL),
(903, 'M-903', 'Sandeev Sharma ', 'Journal Of Ayurveda Oct-Dec 2017', '', '164', 'Director Of National Institude Of india', 'Jaipur', '4/14/2018', '', NULL, NULL),
(904, 'M-904', 'Raghunandan Sharma', 'Ayurved Mahasmelan Patrika June 2018', '20', '50', 'Ayurved Mahasmelan Patrika ', 'Delhi', '6/19/2018', '', NULL, NULL),
(905, 'M-905', 'Nilakshi Pradhan', 'Satyanveshanam today ', '', '62', 'Maharashtra Arogya Mandal', 'Pune', '6/20/2018', '', NULL, NULL),
(906, 'M-906', 'Priti Kawthekar', 'Parfect health care june2018', '30', '32', 'S.P. Sigh', 'Indore', '6/26/2018', '', NULL, NULL),
(907, 'M-907', 'Ragunandan Sharma', 'Ayurved Mahasmelan Patrika May 2018', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '6/26/2018', '', NULL, NULL),
(908, 'M-908', 'Nandukumar Mule', 'Vaidyaraj may june julyl', '30', '63', 'Kamat Audhyoghik Wasahat ', 'Mumbai', '6/26/2018', '', NULL, NULL),
(909, 'M-909', 'Nilakshi Pradhan', 'Satyanveshanam today may 2018', '', '62', '', '', '6/26/2018', '', NULL, NULL),
(910, 'M-910', 'Sanju Sharma', 'Journal Of Ayurveda Oct-Dec 2017', '', '164', 'National Institude of  ayurveda  ', 'Jaipur', '6/26/2018', '', NULL, NULL),
(911, 'M-911', 'Sanju Sharma', 'Journal Of Ayurveda Oct-Dec 2018', '', '164', 'National Institude of  ayurveda  ', 'Jaipur', '6/26/2018', '', NULL, NULL),
(912, 'M-912', 'Sanju Sharma', 'Journal Of Ayurveda Oct-Dec 2019', '', '164', 'National Institude of  ayurveda  ', 'Jaipur', '6/26/2018', '', NULL, NULL),
(913, 'M-913', 'Raghunandan Sharma', 'Ayurved Mahasamhelan Patrika june2018', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '7/4/2018', '', NULL, NULL),
(914, 'M-914', 'Swami Prapanyanand', 'Vivek Jyoti 7 July', '15', '336', 'Ramkrushna Mishan Prakashan', 'Raipur', '7/4/2018', '', NULL, NULL),
(915, 'M-915', 'Janardan Hegde', 'Samhashan Sandesh July 2018', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '7/4/2018', '', NULL, NULL),
(916, 'M-916', 'Anupkumar Jha', 'Phytopharm june 2018', '170', '99', 'Phytopharma publication', 'Delhi', '7/4/2018', '', NULL, NULL),
(917, 'M-917', 'S.P.Kinjawadekar', 'Journal Of National Integrate Medical associaton', '15', '22', 'Ayurveda rasashala', 'Pune', '7/4/2018', '', NULL, NULL),
(918, 'M-918', 'Gopalsharan Garg', 'Sudhanidhi june2018', '', '40', 'Sudha Nidhi Prakashan', 'Vijaygadh', '7/14/2018', '', NULL, NULL),
(919, 'M-919', 'Vandana Mule', 'Srujan Chikitsa', '', '40', 'Manikarnika Publication ', 'pune', '7/18/2018', '', NULL, NULL),
(920, 'M-920', 'Mona Saraf', 'Ayurved Patrika july2018', '50', '59', 'Ayurved patrika ', 'Nashik', '7/18/2018', '', NULL, NULL),
(921, 'M-921', 'Mona Saraf', 'Ayurved Patrika july2019', '50', '59', 'Ayurved patrika ', 'Nashik', '7/18/2018', '', NULL, NULL),
(922, 'M-922', 'Premdatta Pandey', 'Nirogdham june 2018', '40', '106', 'Swami Ashokkumar Pande Prakashan', 'Indore', '7/18/2018', '', NULL, NULL),
(923, 'M-923', '', 'Refrence Manual on Oral Health', '', '36', 'Centre for Dental education  & Research', 'Delhi', '7/17/2018', '', NULL, NULL),
(924, 'M-924', 'Raghunandan Sharma', 'Ayurved Mahasamhelan Patrika july2018', '20', '50', 'Ayurved Mahasamhelan Patrika Karyalay ', 'Delhi', '7/25/2018', '', NULL, NULL),
(925, 'M-925', '', 'Probe April july 2018', '', '74', 'Himalaya Publication', 'Bengluru', '7/25/2018', '', NULL, NULL),
(926, 'M-926', 'Ranjankumar Pejaver', 'Peri natology ', '', '38', 'Palariyamma D . Himalya Publication ', '', '7/25/2018', '', NULL, NULL),
(927, 'M-927', '', 'Capsule Pediatricts Longevity jan march april june', '', '10', 'Himalaya Publication', 'Bengluru', '7/25/2018', '', NULL, NULL),
(928, 'M-928', '', 'Vivaranika ', '', '50', 'Rashtriya mukta Vidyali Shikshan Saunstha ', 'Noyela', '7/27/2018', '', NULL, NULL),
(929, 'M-929', 'Ajuji Mamatani ', 'Swastha Vatika  (Traymasik ) ', '30', '88', 'Ji Kumar Prakashan ', 'Nagpur ', '8/3/2018', '', NULL, NULL),
(930, 'M-930', 'Janardan Hegde', 'Sambhashan  Sandesh ', '20', '42', 'K. Narayan ', 'Bengluru', '8/3/2018', '', NULL, NULL),
(931, 'M-931', 'Kinjawadkar', 'Journal Of National Integrated Medical Association July 2018', '15', '18', 'Ayurved Rasashala ', 'Pune', '8/3/2018', '', NULL, NULL),
(932, 'M-932', 'Anupkumar Jha', 'Phytopharm July 2018', '170', '70', 'Kiran Jha Publication', 'Delhi', '8/3/2018', '', NULL, NULL),
(933, 'M-933', 'Anju Mamatani', 'Swastha Vatika  ', '40', '89', 'J.Kumar Publication', 'Nagpur', '8/7/2018', '', NULL, NULL),
(934, 'M-934', 'Amita Kaushal', 'Heritage Amarut', '100', '54', 'Shreenidhi Graphics', 'Bengluru', '8/7/2018', '', NULL, NULL),
(935, 'M-935', 'Pawankumar Godatwar', 'Journal Ayurveda jan-march 2018', '', '160', 'J.P.Sharma Prakashan', 'Jaipur', '8/13/2018', '', NULL, NULL),
(936, 'M-936', 'Gopalsharan Garg', 'Sudha Nidhi', '', '40', 'Sudha Nidhi Prakashan', 'Vijaygadh', '8/13/2018', '', NULL, NULL),
(937, 'M-937', 'Pawankumar Godatwar', 'Journal Ayurveda jan-march (3 copy)', '', '160', 'J.P.Sharma Prakashan', 'Jaipur', '8/14/2018', '', NULL, NULL),
(938, 'M-938', 'S.N.Sigh', 'Perfect Healthcare august 2018', '30', '32', 'A.P.Sigh', 'Indore', '8/14/2018', '', NULL, NULL),
(939, 'M-939', '', 'Ayurveda Charts &Models', '', '', '', '', '', '', NULL, NULL),
(940, 'M-940', '', 'Evecare ', '', '32', 'Jayshree Keshar', 'Bengluru', '8/25/2018', '', NULL, NULL),
(941, 'M-941', 'Jayashree Keshar ', 'Livline Apr-Jun 2018', '', '20', 'Himalaya Drug company', '', '8/25/2018', '', NULL, NULL),
(942, 'M-942', '', 'AllOVEDA apr -jun 2018', '', '7', 'Himalaya Drug company', '', '8/25/2018', '', NULL, NULL),
(943, 'M-943', '', 'Infoline apr-jun 2018', '', '24', '', '', '8/25/2018', '', NULL, NULL),
(944, 'M-944', '', 'Cassule july -sep 2018', '', '', '', '', '8/25/2018', '', NULL, NULL),
(945, 'M-945', 'Eknath Kulkarni', 'Ayurved Patrika (aug2018)', '50', '59', 'Abhay Kulkarni publication', 'Nashik', '8/25/2018', '', NULL, NULL),
(946, 'M-946', 'Eknath Kulkarni', 'Ayurved Patrika (aug2018)', '50', '59', 'Abhay Kulkarni publication', 'Nashik', '8/25/2018', '', NULL, NULL),
(947, 'M-947', 'Niraj Goyal', 'Pranachary  Arogyam mar 2018', '12', '39', 'Pranacharya Publication', 'Vijaygadh', '8/25/2018', '', NULL, NULL),
(948, 'M-948', 'Niraj Goyal', 'Pranachary  Arogyam apr 2018', '', '39', 'Pranacharya Publication', 'Vijaygadh', '8/25/2018', '', NULL, NULL),
(949, 'M-949', 'Niraj Goyal', 'Pranachary  Arogyam may 2018', '', '39', 'Pranacharya Publication', 'Vijaygadh', '8/25/2018', '', NULL, NULL),
(950, 'M-950', 'Niraj Goyal', 'Pranachary  Arogyam jun 2018', '12', '39', 'Pranacharya Publication', 'Vijaygadh', '8/25/2018', '', NULL, NULL),
(951, 'M-951', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika  aug 2018', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '8/25/2018', '', NULL, NULL),
(952, 'M-952', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika  aug 2019', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '8/25/2018', '', NULL, NULL),
(953, 'M-953', 'Janardhan Hegade', 'Sambhasha Sandesh sep2018', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '8/30/2018', '', NULL, NULL),
(954, 'M-954', 'S.P.Kinjawadekar', 'Journal Of National Intrgreted Medical Association', '15', '22', 'Ramesh Mehta Prakashan', 'Mumbai', '8/30/2018', '', NULL, NULL),
(955, 'M-955', 'Pradeep Upadyay ', 'Pawan Parampara (jul-sep 2018)', '25', '72', 'Arpit Prakashan', 'Nagpur', '9/6/2018', '', NULL, NULL),
(956, 'M-956', 'Swadesh Agrawal ', 'Pranachary arogyam jul 2018', '12', '38', 'Mayurvihar Publication', 'Delhi', '9/8/2018', '', NULL, NULL),
(957, 'M-957', 'Anupkumar Jha', 'Phytopharm aug 2018', '170', '100', 'Pranacharya Publication', 'Delhi', '9/8/2018', '', NULL, NULL),
(958, 'M-958', 'Gopalsharan Garg ', 'Sudhanidhi', '40', '40', 'Sudha Nidhi Prakashan', 'Vijaygadh', '9/8/2018', '', NULL, NULL),
(959, 'M-959', 'Nifakshi Pradhan ', 'Satya anveshnam Agu 2018', '', '94', 'Narmada publication', 'Pune', '9/6/2018', '', NULL, NULL),
(960, 'M-960', 'Mohan khamgaokar', 'Maharashtra Arogya Vidyapith ,Nahik May 2018', '', '28', 'Maharashtra Arogya vigyan', 'Nashik', '9/12/2018', '', NULL, NULL),
(961, 'M-961', 'Eknath Kulkarni', 'Ayurved Patrika Sep 2018', '50', '59', 'Ayurved Seva Sangh', 'Nashik', '9/12/2018', '', NULL, NULL),
(962, 'M-962', 'Eknath Kulkarni', 'Ayurved Patrika Sep 2019', '50', '59', 'Ayurved Seva Sangh', 'Nashik', '9/12/2018', '', NULL, NULL),
(963, 'M-963', 'Vandana Mule', 'Srujan Chikitsa', '', '', 'Manikarnika Publication ', 'Pune', '9/15/2018', '', NULL, NULL),
(964, 'M-964', 'Nilakshi Pradhan', 'Satyanveshan Today (Aug -Oct)', '', '94', 'Maharashtra Arogya Mandal', 'Pune', '9/15/2018', '', NULL, NULL),
(965, 'M-965', '', '', '', '16', 'Chaukhamba Ayuved Sahita ', '', '9/15/2018', '', NULL, NULL),
(966, 'M-966', 'S.K. Kinjawadekar ', 'Journal of National Intigrated Medical Association ', '15', '26', 'Ramesh Mehta Prakashan', 'Naigan', '9/28/2018', '', NULL, NULL),
(967, 'M-967', 'Jayashree Keshav', 'Pe Diritz', '', '10', 'Jayashree keshav Prakashan', 'Bengluru', '9/28/2018', '', NULL, NULL),
(968, 'M-968', 'Jayashree Keshav', 'Probe july - sep 2018', '', '64', 'Jayashree keshav Prakashan', 'Bengluru', '9/28/2018', '', NULL, NULL),
(969, 'M-969', 'Swadesh Agrawal ', 'Pranacharya arogyam Aug 2018', '12', '38', 'Pranacharya Publication', 'Vijaygadh', '9/28/2018', '', NULL, NULL),
(970, 'M-970', 'Banwarilal Gaud', 'Ayurved Mahasammelan Patrika', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '9/28/2018', '', NULL, NULL),
(971, 'M-971', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '10/3/2018', '', NULL, NULL),
(972, 'M-972', 'S.P.Kinjawadekar', 'Journal of NIMA ', '15', '26', 'Shankar Kinjwadekar Prakashan', '', '10/3/2018', '', NULL, NULL),
(973, 'M-973', 'Anupkumar Jha', 'Phytopharm ', '170', '74', 'Mayurvihar Publication', 'Delhi', '10/3/2018', '', NULL, NULL),
(974, 'M-974', 'Devisharan Garg', 'Sudhanidhi sep 2018', '', '40', 'Sunidhi Karyalay', 'Vijaygadh', '10/9/2018', '', NULL, NULL),
(975, 'M-975', 'N S Singh ', 'Perfect Health Care', '30', '32', 'Ashish Welfare Society', 'Indore', '10/15/2018', '', NULL, NULL),
(976, 'M-976', 'Eknath Kulkarni', 'Ayurved Patrika ', '50', '58', 'Sawahak Ayurved Publication', 'Nashik', '10/15/2018', '', NULL, NULL),
(977, 'M-977', 'Eknath Kulkarni', 'Ayurved Patrika ', '50', '58', 'Sawahak Ayurved Publication', 'Nashik', '10/15/2018', '', NULL, NULL),
(978, 'M-978', '', 'Syllabus Of Ayurveda Charya ', '', '114', 'Chaukhamba Ayuved Sahita ', '', '10/20/2018', '', NULL, NULL),
(979, 'M-979', 'Banwarilal Gaud', 'Mahasammelan Patrika ', '20', '50', '', '', '10/29/2018', '', NULL, NULL),
(980, 'M-980', 'Banwarilal Gaud', 'Mahasammelan Patrika ', '20', '50', '', '', '10/29/2018', '', NULL, NULL),
(981, 'M-981', 'Jayashree Keshav ', 'Himalaya Live Line', '', '20', 'Himalaya Drug company', 'Bengluru', '10/31/2018', '', NULL, NULL),
(982, 'M-982', 'Jayashree Keshav ', 'Himalaya Live Line', '', '20', 'Himalaya Drug company', 'Bengluru', '10/31/2018', '', NULL, NULL),
(983, 'M-983', 'Shivnath Sharma ', 'Sachitra Ayurved', '70', '64', '', '', '11/2/2018', '', NULL, NULL),
(984, 'M-984', 'Gopal Sharan Garg', 'Sudhanidhi Oct 18', '', '95', 'Quality Creaters', 'Vijaygadh', '11/12/2018', '', NULL, NULL),
(985, 'M-985', 'Anupkumar Jha', 'Phytopharm ', '335', '95', '', '', '11/12/2018', '', NULL, NULL),
(986, 'M-986', 'Eknath Kulkarni', 'Ayurved Patrika ', '50', '58', 'Ayurved Seva Sangh', 'Vijaygadh', '11/12/2018', '', NULL, NULL),
(987, 'M-987', 'Pawankumar Godatwar', 'Journal Of Ayurveda April-june-', '', '148', 'Ministry Of Ayush ,', 'Jaipur', '11/12/2018', '', NULL, NULL),
(988, 'M-988', 'Swadesh Agrawal ', 'Pranacharya Arogyam sep 2018', '12', '38', 'Pranacharya Publication', 'Vijaygadh', '11/12/2018', '', NULL, NULL),
(989, 'M-989', 'Ashok Pandey ', 'Nirogdham', '40', '106', 'Prabhukrupa Publication', 'Indore', '11/12/2018', '', NULL, NULL),
(990, 'M-990', 'Vandana Mule', 'Srujan Chikitsa', '', '40', 'Manikarnika Publication ', 'Bengluru', '11/26/2018', '', NULL, NULL),
(991, 'M-991', 'Janardhan Hegde', 'Sambhashan Sandesh Nov 2018', '20', '42', 'Sandesh Prakashan', 'Bengluru', '11/26/2018', '', NULL, NULL),
(992, 'M-992', 'Amita Kaushal', 'Heritage Amruth july Aug 2018', '100', '55', 'Mediplan Publication', 'Bengluru', '11/26/2018', '', NULL, NULL),
(993, 'M-993', 'S.P.Kinjawadekar', 'Journal Of NIMA Nov 2018', '15', '22', 'NIMA Association', 'Mumbai', '12/4/2018', '', NULL, NULL),
(994, 'M-994', 'Janardhan Hegde ', 'Sambhashan Sandesh dec 2018', '20', '42', 'Aksharam Girinagaram', 'Girinagar', '12/4/2018', '', NULL, NULL),
(995, 'M-995', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika', '20', '52', 'Ayurved Mahasammelan', 'Girinagar', '12/4/2018', '', NULL, NULL),
(996, 'M-996', 'Anupkumar Jha', 'Phytopharm Nov 18 Ramphal ', '335', '90', 'Phytopharma publication', 'Delhi', '12/4/2018', '', NULL, NULL),
(997, 'M-997', '', 'Infoline Jul -sep 2018', '', '24', 'Himalaya Drug company', 'Delhi', '12/4/2018', '', NULL, NULL),
(998, 'M-998', 'Amita Kaushal', 'Heritage Amruth Sep oct 2018', '100', '55', 'Himalaya Drug company', 'Delhi', '12/8/2018', '', NULL, NULL),
(999, 'M-999', 'Jayant bhalchandra Jahagirdar', 'Arogya Chikitsa dec 2018', '20', '26', 'Akshardham Printers', 'Jalgaon', '12/13/2018', '', NULL, NULL),
(1000, 'M-1000', 'Devisharan Garg', 'Sudhanidhi', '', '40', 'Sudha Nidhi Prakashan', '', '12/14/2018', '', NULL, NULL),
(1001, 'M-1001', 'Eknath Kulkarni', 'Ayurved Patrika dec 2017', '50', '58', 'Ayurved Seva Sangh', 'Nashik', '12/14/2018', '', NULL, NULL),
(1002, 'M-1002', 'Pradip Upadhyay', 'Pavan Parampara Oct Dec 2018', '25', '72', 'Arpit Prakashan', 'Nagpur ', '12/26/2018', '', NULL, NULL),
(1003, 'M-1003', 'Pradip Upadhyay', 'Pavan Parampara Oct Dec 2019', '25', '72', 'Arpit Prakashan', 'Nagpur ', '12/26/2018', '', NULL, NULL),
(1004, 'M-1004', 'S.P.Kinjawadekar', 'Journal Of NIMA Dec 2018', '15', '22', '', '', '12/31/2018', '', NULL, NULL),
(1005, 'M-1005', 'Janardhan Hegde ', 'Sambhashan Sandesh ', '20', '42', 'Aksharam Girinagaram', '', '12/31/2018', '', NULL, NULL),
(1006, 'M-1006', 'Nilakshi Pradhan', 'Satyanveshanam Today', '', '', '', '', '12/31/2018', '', NULL, NULL),
(1007, 'M-1007', 'S.P.Kinjawadekar', 'Journal Of National Integrated Medical Association Dec 2018', '15', '22', 'Ayurveda rasashala', 'Mumbai', '1/4/2019', '', NULL, NULL),
(1008, 'M-1008', 'Anupkumar Jha', 'Phytopharma dec 2018', '335', '80', 'Kiran Jha Publication', 'Nagpur', '1/9/2019', '', NULL, NULL),
(1009, 'M-1009', 'Swadesh Agrawal ', 'Pranacharya Arogyam', '12', '38', 'Pranacharya Publication', 'Vijaygadh', '1/9/2019', '', NULL, NULL),
(1010, 'M-1010', 'Jaishree D.Keshav', 'Probe(oct-Dec 2018)', '', '68', 'Himalaya Drug company', 'Bengluru', '1/9/2019', '', NULL, NULL),
(1011, 'M-1011', 'Shantilal Agraval', 'Niramaya', '25', '50', 'Niramaya Karyalaya', 'Ahamdabad', '1/9/2019', '', NULL, NULL),
(1012, 'M-1012', 'Eknath Kulkarni', 'Ayurved Patrika jan 19', '50', '58', 'Abhay Kulkarni publication', 'Nashik', '1/14/2019', '', NULL, NULL),
(1013, 'M-1013', 'Ashok Pandey ', 'Nirogdham jan 2019', '40', '104', 'Ashok kumar Pandey Prakashan', 'Indore', '1/14/2019', '', NULL, NULL),
(1014, 'M-1014', 'Amita Kaushal', 'Heritage Amruth', '100', '58', 'Mediplan Publication', 'Bengluru', '1/22/2019', '', NULL, NULL),
(1015, 'M-1015', 'Swadesh Agrawal ', 'Pranacharya Arogyam nov.-2018', '12', '38', 'Pranacharya Publication', 'Vijaygadh', '1/25/2019', '', NULL, NULL),
(1016, 'M-1016', 'Banwarilal Gaud', 'Ayurved Mahasammelan Patrika jan-2019', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Vijaygadh', '1/25/2019', '', NULL, NULL),
(1017, 'M-1017', 'Banwarilal Gaud', 'Ayurved Mahasammelan Patrika jan-2020', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Vijaygadh', '1/25/2019', '', NULL, NULL),
(1018, 'M-1018', 'Nilakshi Pradhan', 'Satyanveshanam Today Jan 19', '', '126', '', '', '1/25/2019', '', NULL, NULL),
(1019, 'M-1019', 'Janardhan Hedge', 'Sambhashan Sandesh Feb.-2019', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '2/1/2019', '', NULL, NULL),
(1020, 'M-1020', 'S.P.Kinjawadekar', 'Journal Of National Integrated Medical Association jan 2019', '15', '23', 'TNIMA', 'Bengluru', '2/1/2019', '', NULL, NULL),
(1021, 'M-1021', 'Anupkumar Jha', 'Phytopharm ', '335', '86', 'Phytopharma publication', 'Delhi', '2/1/2019', '', NULL, NULL),
(1022, 'M-1022', 'Vandana Mule', 'Srujan Chikitsa', '', '40', 'Mamikarnika Publication', 'Pune', '2/1/2019', '', NULL, NULL),
(1023, 'M-1023', 'Jayant Jahagirdar', 'Arogya Chikitsa feb 2019', '', '26', 'Shanipeth', 'Jalgoan', '2/12/2019', '', NULL, NULL),
(1024, 'M-1024', 'Shantilal Khagravat', 'Niramaya Feb 2018', '25', '52', '', '', '2/12/2019', '', NULL, NULL),
(1025, 'M-1025', 'Shantilal Khagravat', 'Niramaya Feb 2019', '25', '52', '', '', '2/12/2019', '', NULL, NULL),
(1026, 'M-1026', 'Veena Garg ', 'Sudhanidhi Jan 2019', '', '40', 'Sudha Nidhi Prakashan', 'Aligadh', '2/12/2019', '', NULL, NULL),
(1027, 'M-1027', 'Eknath Kulkarni', 'Ayurveda Patrika feb19', '50', '58', 'Ayurvedasevasangh Publication', 'Nashik', '2/12/2019', '', NULL, NULL),
(1028, 'M-1028', 'Raghunandan Sharma', 'Ayurvedmahasammelan Patrika Feb 2019', '20', '50', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '2/23/2019', '', NULL, NULL),
(1029, 'M-1029', 'Pawankumar Godatwar', 'Journal of Ayurveda july-Sep.-2018', '', '144', 'National Institude of  ayurveda  ', 'Jaipur', '3/1/2019', '', NULL, NULL),
(1030, 'M-1030', 'Sunil Bhakare', 'Ayurved Darpan  jan-mar 2018', '', '45', 'Rammert Publication', 'Kolhapur', '3/1/2019', '', NULL, NULL),
(1031, 'M-1031', 'Sunil Bhakare', 'Ayurved Darpan apr-jun 2018', '', '29', 'Rammert Publication', '', '3/1/2019', '', NULL, NULL),
(1032, 'M-1032', 'Sunil Bhakare', 'Ayurved Darpan  jul-sep 2018', '', '47', 'Rammert Publication', '', '3/1/2019', '', NULL, NULL),
(1033, 'M-1033', 'Sunil Bhakare', 'Ayurved Darpan  oct-dec 2028', '', '81', 'Rammert Publication', '', '', '', NULL, NULL),
(1034, 'M-1034', 'Pradeep Upadhyay ', 'Pawan Parampara jan-mar 2019', '23', '72', 'Arpeet Prakashan', 'Nagpur', '3/5/2019', '', NULL, NULL),
(1035, 'M-1035', 'Raghunandan Sharma', 'Ayurvedmahasammelan Patrika Feb 2019', '20', '52', 'Akhil bhartiya Ayurved Mahasambhelan Patrika', 'Delhi', '3/7/2019', '', NULL, NULL),
(1036, 'M-1036', 'Anupkumar Jha', 'Phytopharm feb 2019', '335', '90', 'Kiran Jha Publication', 'Delhi', '3/7/2019', '', NULL, NULL),
(1037, 'M-1037', 'Janardhan Hedge', 'Sambhasha Sandesh mar 2019', '20', '42', 'Aksharam Girinagaram', 'Delhi', '3/7/2019', '', NULL, NULL),
(1038, 'M-1038', 'Ramesh Sharma ', 'Sachitra Ayurved jan- mar 19', '70', '64', 'Baidyanath Prakashan', 'Nagpur', '3/7/2019', '', NULL, NULL),
(1039, 'M-1039', 'Pawankumar Godatwar', 'Journal Of Ayurveda jul -sep 2018', '', '144', 'National Institude of  ayurveda  ', 'Jaipur', '3/7/2019', '', NULL, NULL),
(1040, 'M-1040', 'Vinaya Dixit', 'Ayurvidya feb 19', '40', '34', '', 'Pune', '3/7/2019', '', NULL, NULL),
(1041, 'M-1041', 'Madhavprasad Achary', 'Niramaya mar 19', '25', '50', 'Niramaya Karyalaya', 'Ahamdabad', '3/7/2019', '', NULL, NULL),
(1042, 'M-1042', 'Deelip Mhaisekar', 'MUHS Health Science Review jul-sep 2018', '', '48', 'MUHS ', 'Nashik', '3/7/2019', '', NULL, NULL),
(1043, 'M-1043', 'Philipe Haydon', 'Himalaya Infoline oct-Dec 2018', '', '24', 'Himalaya Drug company', 'Makuli', '3/7/2019', '', NULL, NULL),
(1044, 'M-1044', 'Ranjan Pejaver', 'Perinatalogy oct-dec 2018', '', '122', 'Himalaya Drug company', 'Bengluru', '3/7/2019', '', NULL, NULL),
(1045, 'M-1045', '', 'Livline oct-dec 2018', '', '16', 'Himalaya Drug company', 'Bengluru', '3/7/2019', '', NULL, NULL),
(1046, 'M-1046', 'Jayshree Keshav ', 'Evecare oct-dec 2018', '', '25', 'Himalaya Drug company', 'Bengluru', '3/7/2019', '', NULL, NULL),
(1047, 'M-1047', 'Jayant Jahagirdar', 'Arogya Chikitsa march 2019', '20', '26', 'Jayant Jahagirdar ', 'Jalgoan', '3/11/2019', '', NULL, NULL),
(1048, 'M-1048', 'Sanjeev Sharma', 'Jornal Of Ayurveda jul-sep 2018', '150', '144', 'National Institude of  ayurveda  ', 'Jalgoan', '3/11/2019', '', NULL, NULL),
(1049, 'M-1049', 'Eknath Kulkarni', 'Ayurveda Patrika march 2019', '50', '58', 'Ayurvedasevasangh Publication', 'Nashik', '3/15/2019', '', NULL, NULL),
(1050, 'M-1050', 'Eknath Kulkarni', 'Ayurveda Patrika march 2019', '50', '58', 'Ayurvedasevasangh Publication', 'Nashik', '3/15/2019', '', NULL, NULL),
(1051, 'M-1051', 'Eknath Kulkarni', 'Ayurveda Patrika march 2019', '50', '58', 'Ayurvedasevasangh Publication', 'Nashik', '3/15/2019', '', NULL, NULL),
(1052, 'M-1052', 'Raghunandan Sharma', 'Ayurvedamahasammelan Patrika March 19', '20', '50', 'Chanakya Mudran', 'Delhi', '3/20/2019', '', NULL, NULL),
(1053, 'M-1053', 'J.M.Mamtani', 'Swasthawatika March 2019', '40', '90', 'Kumar Prakashan', 'Nagpur', '3/15/2019', '', NULL, NULL),
(1054, 'M-1054', 'S.N.Sigh', 'Perfect Health Care March 2019', '30', '32', 'S.P. Sigh', 'Indore', '3/15/2019', '', NULL, NULL),
(1055, 'M-1055', 'Janardan Hegde', 'Sambhashan Sandesh April 2019', '20', '42', 'K. Narayan ', 'Bengluru', '3/30/2019', '', NULL, NULL),
(1056, 'M-1056', 'Amita Kaushal', 'Heritage Amrut', '100', '58', 'Darshanshankar', 'Bengluru', '3/30/2019', '', NULL, NULL),
(1057, 'M-1057', 'Raghunandan Sharma', 'Ayurvedamahasammelan Patrika March 19', '20', '52', 'Journal of all Indian Ayurvedic Congress', 'Delhi', '3/30/2019', '', NULL, NULL),
(1058, 'M-1058', 'Gopal Sharan Garg', 'Sidha Prayog Sangrah Shashtam bhag feb.march 2019', '', '319', 'Sudha Nidhi Prakashan', 'Vijaygadh', '3/30/2019', '', NULL, NULL),
(1059, 'M-1059', 'Anupkumar Jha', 'Phytopharm', '335', '82', 'Quality Creaters', 'Delhi', '4/3/2019', '', NULL, NULL),
(1060, 'M-1060', 'Nandakumar Mule', 'Vaidyaraj ', '30', '', 'Nandakumar Mule', 'Mumbai', '4/3/2019', '', NULL, NULL),
(1061, 'M-1061', 'Jayshree Keshav ', 'Probe', '', '', 'Nandakumar Mule', 'Bengluru', '4/8/2019', '', NULL, NULL),
(1062, 'M-1062', 'Madhavprasad Achary', 'Niramay', '25', '50', 'Shantilal agrawal', 'Ahamdabad', '4/8/2019', '', NULL, NULL),
(1063, 'M-1063', 'Nilakshi Pradhan', 'Satyanveshnam ', '', '32', 'Maharashtra Arogya hadapsan ', 'Pune', '4/12/2019', '', NULL, NULL),
(1064, 'M-1064', 'S.N.Sigh', 'Perfect health care', '30', '32', 'S.P. Sigh', 'Indore', '4/12/2019', '', NULL, NULL),
(1065, 'M-1065', 'Eknath Kulkarni', 'Ayurved Patrika April 2019', '50', '58', 'Ayurved Seva Sangh', 'Nashik', '4/15/2019', '', NULL, NULL),
(1066, 'M-1066', 'Nilakshi Pradhan', 'Satyaveshanam Today April 2019', '', '32', '', '', '4/15/2019', '', NULL, NULL),
(1067, 'M-1067', 'Ragunandan Sharma', 'Ayurved mahasamelan patrika April 2019', '20', '50', 'Chanakya Mudran', 'Delhi', '4/23/2019', '', NULL, NULL),
(1068, 'M-1068', 'Mansi Deshpande', 'IASTAM News Letter', '', '8', 'Indian Association Publication', '', '4/23/2019', '', NULL, NULL),
(1069, 'M-1069', '', 'Anatomy Model Charts  Slides', '', '19', 'Desh Biological work', 'Hariyana', '4/23/2019', '', NULL, NULL),
(1070, 'M-1070', 'Ashok Pandey ', 'Nirogdham April 2019', '40', '106', 'Swami Ashokkumar Pande Prakashan', 'Indore', '4/25/2019', '', NULL, NULL),
(1071, 'M-1071', 'Vinaya Dixit', 'Ayurvidya April 19', '25', '34', 'D.P. Puranik Rasastreeya Shukshanmandal ', 'Pune', '4/25/2019', '', NULL, NULL),
(1072, 'M-1072', 'S.P.Kinjawadekar', 'Journal of National Integreated medical Assosiation', '15', '24', ' National Integreated medical Assosiation', 'Mumbai', '4/25/2019', '', NULL, NULL),
(1073, 'M-1073', 'Shantilal Agraval', 'Niramay', '31', '50', 'Shantilal Agraval', 'Ahamdabad', '4/25/2019', '', NULL, NULL),
(1074, 'M-1074', 'Rajkumar Sharma', 'Ayurveda Oct Nov 2016', '120', '44', 'Dayanand Ayurvedic College  & Hospital', 'Jalandar', '4/30/2019', '', NULL, NULL),
(1075, 'M-1075', 'Janardan Hegde', 'Sambhashan Sandesh May  2019', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '5/6/2019', '', NULL, NULL),
(1076, 'M-1076', 'Anupkumar Jha', 'Phytopharm April 2019', '335', '80', 'Kiran Jha Publication', 'Delhi', '5/6/2019', '', NULL, NULL),
(1077, 'M-1077', 'Swami Prapatyanand', 'Vivek Joshi 5 May 2019', '15', '           193-240', 'Ramkrushna Mishan vivekanad Ashram Prakashan', 'Raipur', '5/8/2019', '', NULL, NULL),
(1078, 'M-1078', 'Rajankumar Pejaver', 'Himalaya liveline Jan 2019', '', '', 'Himalaya Drug company', '', '5/8/2019', '', NULL, NULL),
(1079, 'M-1079', 'Akanath Kulkarni', 'Ayurved Patrika May 2019', '50', '58', 'Ayurved Seva Sangh', 'Nashik', '5/15/2019', '', NULL, NULL),
(1080, 'M-1080', 'Vandana Mule', 'Srujan Chikitsa mar April 2019', '', '40', 'Manikarnika Publication ', 'Pune', '5/15/2019', '', NULL, NULL),
(1081, 'M-1081', 'Amita Kaushal', 'Heritage Amrut 2019', '100', '58', 'Darshanshankar', 'Bengluru', '5/15/2019', '', NULL, NULL),
(1082, 'M-1082', 'Sandesh Agrawal ', 'Pranacharya Arogyam', '30', '79', 'Sandesh Prakashan', 'Vijaygadh', '5/16/2019', '', NULL, NULL),
(1083, 'M-1083', 'Gopal Sharan Garg', 'Sudhanidhi april 2019', '', '40', 'Sudha Nidhi Prakashan', 'Vijaygadh', '5/21/2019', '', NULL, NULL),
(1084, 'M-1084', 'Benny Thomas ', 'Ayurveda & Health Tourism April June 2019', '', '86', 'F.m. Media & Technology ', 'Kochi', '5/23/2019', '', NULL, NULL),
(1085, 'M1085', 'S. P. Kinjawadwkar', 'Journals of National Integrated Association', '15', '22', 'Ramesh Mehta ', 'Mumbai', '5/28/2019', '', NULL, NULL),
(1086, 'M1086', 'S.N Sinha', 'Parfect Health Care May-2019', '30', '32', 'S.N Sinha', 'Indor', '5/29/2019', '', NULL, NULL),
(1087, 'M1087', 'Jayant Bhalchandra Jahangirdar ', 'Arogya Chikitsa  May-2019', '20', '26', 'Jayant Bhalchandra Jahangirdar ', 'Jalgaon', '5/29/2019', '', NULL, NULL),
(1088, 'M1088', 'Ramesh Sharma', 'Sachirta Ayurved Apr.-June2019', '70', '64', 'Bharatbhushan Sheekhande', 'Nagpur', '5/29/2019', '', NULL, NULL),
(1089, 'M1089', 'Swami Swarupanand', 'Vivek Joyti June2019', '15', '50', 'Ramkrushn Mission Vivekanand Ashram', 'Chattisgrah', '6/12/2019', '', NULL, NULL),
(1090, 'M1090', 'S.N Sinha', 'Parfect Health Care ', '30', '32', 'S.N Sinha', 'Indor', '6/18/2019', '', NULL, NULL),
(1091, 'M1091', 'Swadesh Agrawal', 'Pranacharya Arogyam Mar-2019', '15', '38', 'Pranacharya Bhavan Ayurvedic Sansthan', 'Vijaygadh', '6/19/2019', '', NULL, NULL),
(1092, 'M1092', 'Swadesh Agrawal', 'Pranacharya Arogyam Mar-2019', '15', '38', 'Pranacharya Bhavan Ayurvedic Sansthan', 'Vijaygadh', '6/19/2019', '', NULL, NULL),
(1093, 'M1093', 'Eknath Kulkarni', 'Ayurvedic Patrika June 2019', '50', '58', 'Ayurved Seva Sangh', 'Nashik', '6/19/2019', '', NULL, NULL),
(1094, 'M1094', 'Nandkumar Muley', 'Vaidyaraj May-June-July2019', '30', '63', 'Ayurved Vigyan Madal', 'Mumbai', '6/19/2019', '', NULL, NULL),
(1095, 'M1095', 'Gopinath Patik ', 'Sudha Nidhi May-2019', '', '40', '', '', '6/19/2019', '', NULL, NULL),
(1096, 'M1096', 'Sunil Bakare', 'Ayurved Darpan Jan-March 2019', '48.65', '98', 'Rasamruth Publications ', 'Kolhapur', '6/24/2019', '', NULL, NULL),
(1097, 'M1097', 'Nilakshi Pradhan', 'Satyanveshnam May-July 2019', '', '64', 'Anil Gujar Prakashan ', 'Pune', '6/25/2019', '', NULL, NULL),
(1098, 'M1098', 'S. P. Kinjawadwkar', 'Journals of NIMA June-2019', '15', '22', 'Ramesh Mehta Prakashan', 'Mumbai', '6/25/2019', '', NULL, NULL),
(1099, 'M1099', 'Jaishree B. Keshav', 'Himalaya Infoline Jan.-March 2019', '', '20', 'Himalaya Publication ', 'Bengluru', '6/25/2019', '', NULL, NULL),
(1100, 'M1100', 'Jaishree B. Keshav', 'ALLOVEDA Jan-March 2019', '', '7', 'Himalaya Publication ', 'Bengluru', '6/25/2019', '', NULL, NULL),
(1101, 'M1101', 'Anup Kumar Jha', 'Phytopharm June-2019', '335', '98', 'Quality Creators ', 'Delhi', '7/9/2019', '', NULL, NULL),
(1102, 'M1102', 'Shantilal Agrawal', 'Niramay July-2019', '25', '50', 'Thakorbhai Shah Prakashan', 'Ahemdabad ', '7/9/2019', '', NULL, NULL),
(1103, 'M1103', 'Shantilal Agrawal', 'Niramay July-2019', '25', '50', 'Thakorbhai Shah Prakashan', 'Ahemdabad ', '7/9/2019', '', NULL, NULL),
(1104, 'M1104', 'Swadesh Agrawal', 'Pranacharya Arogyam April-2019', '15', '38', 'Pranacharya Bhavan Ayurvedic Sansthan', 'Vijaygadh', '7/9/2019', '', NULL, NULL),
(1105, 'M1105', 'Narayana K.', 'Sambhashan Sandesh July-2019', '', '', '', '', '7/9/2019', '', NULL, NULL),
(1106, 'M1106', 'Devisharan Grag ', 'Sudhanidhi June- 0219', '30', '', 'Devisharan Grag ', 'Aligadh', '7/9/2019', '', NULL, NULL),
(1107, 'M1107', 'Pradip Upadhyay ', 'Pawan Parampara ', '25', '48', 'Arpit Prakahan ', 'Nagpur', '7/15/2019', '', NULL, NULL),
(1108, 'M1108', 'Pradip Upadhyay ', 'Pawan Parampara Apr-June2019', '25', '48', 'Arpit Prakahan ', 'Nagpur', '7/16/2019', '', NULL, NULL),
(1109, 'M1109', 'Nilakshi Pradhan', 'Satyanveshnam May-July 2019', '70', '60', 'Mahatashtra Arogya Mandal', 'Pune', '7/16/2019', '', NULL, NULL),
(1110, 'M1110', 'S.P. Kinjawadekar ', 'Journals of National Integrated Association', '15', '35', 'Ramesh Mehata ', 'Mumbai', '7/16/2019', '', NULL, NULL),
(1111, 'M1111', 'Narendra Bhatt', 'IASTA Newsletter July-', '6', '20', 'Bharati Vidyapeeth Uni. ', 'Pune', '7/16/2019', '', NULL, NULL),
(1112, 'M1112', 'Jayant Bhalchandra Jahangirdar ', 'Arogya Chikitsa  Juli-2019', '20', '40', 'Jayant  Jahangirdar ', 'Jalgaon', '7/16/2019', '', NULL, NULL),
(1113, 'M1113', 'Swami Swarupanand', 'Vivek Joyti July2019', '15', '60', 'Ramkrushn Mission Vivekanand Ashram', 'Raipur', '7/16/2019', '', NULL, NULL),
(1114, 'M1114', 'Priti Kavathekar', 'Perfect Health July 2019', '30', '75', 'S. P. Sinha', 'Indor', '7/16/2019', '', NULL, NULL),
(1115, 'M1115', 'Amita Kaushal', 'Heritage Amrut ', '100', '100', 'Darshan Shankar', 'Bengluru', '7/17/2019', '', NULL, NULL),
(1116, 'M1116', 'Vandana Muley ', 'Srujan Chikitsa May-June2019', '', '80', 'Girish Gandhi', 'Pune', '7/17/2019', '', NULL, NULL),
(1117, 'M1117', 'Ranjan Kumar ', 'ProbApr-June2019', '', '40', 'Himalaya Publication ', 'Bengluru', '7/17/2019', '', NULL, NULL),
(1118, 'M1118', 'Sanjeev Sharma', 'Journal of Auyrveda Oct-Dec 2018', '', '35', 'National Institute of Ayurveda', 'Bengluru', '7/20/2019', '', NULL, NULL),
(1119, 'M1119', 'Raghunandan Sharma', 'Ayurvedic  Mahasammelan Patrika Julu 2019', '', '35', 'Journals of Ayurvedic ', '', '7/20/2019', '', NULL, NULL),
(1120, 'M1120', 'D. P. Puranic', 'Ayurvidya International Jan 2019', '255', '40', 'D. P. Puranic', 'Pune', '7/23/2019', '', NULL, NULL),
(1121, 'M1121', 'D. P. Puranic', 'Ayurvidya International Jan 2019 Vol.II', '255', '40', 'D. P. Puranic', 'Pune', '7/23/2019', '', NULL, NULL),
(1122, 'M1122', 'D. P. Puranic', 'Ayurvidya Masik', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1123, 'M1123', 'D. P. Puranic', 'Ayurvidya Masik Jan2019', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1124, 'M1124', 'D. P. Puranic', 'Ayurvidya Masik Feb 2019', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1125, 'M1125', 'D. P. Puranic', 'Ayurvidya Masik Feb 2019', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1126, 'M1126', 'D. P. Puranic', 'Ayurvidya Masik Mar 2019 ', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1127, 'M1127', 'D. P. Puranic', 'Ayurvidya Masik Apr 2019', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1128, 'M1128', 'D. P. Puranic', 'Ayurvidya Masik  May 2019', '25', '50', 'Rashtriy Shikshan Mandal', 'Pune', '7/23/2019', '', NULL, NULL),
(1129, 'M1129', 'Sanjeev Sharma', 'Journal of Auyrveda Oct-Dec 2018', '', '100', 'Ministary of Ayush', 'Jaipur', '7/26/2019', '', NULL, NULL),
(1130, 'M1130', 'Jarnadhan Hegade ', 'Sambhashan Sandesh Aug 2019', '20', '40', 'Aksharam Girinagaram', 'Bengluru', '31-Jul', '', NULL, NULL),
(1131, 'M1131', 'Pradeep Mulatani ', 'Info Ayurveda Apr-June 2019', '30', '', 'Association of Manufactures Medicine', 'Gaziyabad', '7/31/2019', '', NULL, NULL),
(1132, 'M1132', 'N. K. Jha ', 'Phytopharm Julu-2019', '335', '55', 'Kiran Jha', 'Delhi', '7/31/2019', '', NULL, NULL),
(1133, 'M1133', 'S.P. Kinjawadekar ', 'Journal of  National Intigrated Medical Association July-2019', '15', '85', 'Ramesh J Mehta', 'Mumbai', '7/31/2019', '', NULL, NULL),
(1134, 'M1134', 'Shantilal Agrawal', 'Niramay may-2019', '25', '100', 'Shantilal Agrawal', 'Ahemdabad ', '7/31/2019', '', NULL, NULL),
(1135, 'M1135', 'Premdatt Pandey', 'Nirogdham 19 July', '95', '', 'Swami  Ashok Kumar Pandey', 'Indor', '7/31/2019', '', NULL, NULL),
(1136, 'M1136', 'Anju G. Mamtani ', 'SasthvatikaApr-June 2019', '40', '65', 'Jeekumar Prakashan ', 'Nagpur', '8/10/2019', '', NULL, NULL),
(1137, 'M1137', 'Anju G. Mamtani ', 'SasthvatikaApr-July-Sep2019', '40', '65', 'Jeekumar Prakashan ', 'Nagpur', '8/10/2019', '', NULL, NULL),
(1138, 'M1138', 'Gopalsharan grag', 'Sudhanidhi July- 0219', '30', '45', 'Sudhanidhi  Karyalay', 'Aligadh', '8/10/2019', '', NULL, NULL),
(1139, 'M1139', 'Swami Praptyanand', 'Vivek  joyti Aug2019', '15', '90', 'Ramkrushn Mission Vivekanand Ashram', 'Raipur', '8/10/2019', '', NULL, NULL),
(1140, 'M1140', 'S.N Sinha', 'Perfect Health Care', '30', '32', 'S.N Sinha', '', '8/23/2019', '', NULL, NULL),
(1141, 'M1141', 'Hadorlam Khem Shah', 'Niramay', '31', '50', '', '', '8/23/2019', '', NULL, NULL);
INSERT INTO `library_journal` (`id`, `registration_no`, `author_name`, `name`, `price`, `pages`, `publisher`, `seller`, `date`, `bill_no`, `created_at`, `updated_at`) VALUES
(1142, 'M1142', 'Hadorlam Khem Shah', 'Niramay', '31', '50', '', '', '8/23/2019', '', NULL, NULL),
(1143, 'M1143', 'Shivanath  Sharma', 'Sachirta Ayurved ', '70', '64', 'Bharat  Bhushan Shreekhande', '', '8/23/2019', '', NULL, NULL),
(1144, 'M1144', 'Raghunandan Sharma', 'Ayurved Mahasammelan Patrika', '20', '52', 'Journals of all India ', '', '8/27/2019', '', NULL, NULL),
(1145, 'M1145', 'Jayshree B. Keshav', 'Infoline Himalaya Livline Evacare Apr-Junu2019', '', '32', 'Himalaya Publication ', 'Bengluru', '8/27/2019', '', NULL, NULL),
(1146, 'M1146', 'K.K. Agrawal', 'Alloveda  Jan-Apr-June2019', '', '8', 'IJCA Publucation ', 'Bengluru', '8/27/2019', '', NULL, NULL),
(1147, 'M1147', 'Swami Praptyanand', 'VivekJoyti Sep-2019', '30', '385', 'Ramkrushn Mission Vivekanand Ashram', 'Raipur', '9/3/2019', '', NULL, NULL),
(1148, 'M1148', 'Janardhan Hegade', 'Sambhashan Sandesh', '20', '', 'Aksharam Girinagaram', 'Bengluru', '9/3/2019', '', NULL, NULL),
(1149, 'M1149', 'Anup Kumar Jha', 'Phytopharm', '335', '104', 'Kiran Jha', '', '9/3/2019', '', NULL, NULL),
(1150, 'M1150', 'Pradip Upadhyay ', 'Pawan Parmpara July-Sep2019', '25', '72', 'Arpit Prakahan ', 'Nagpur', '5-Sep', '', NULL, NULL),
(1151, 'M1151', 'Swadesh Agrawal', 'Pranacharya Arogyam June2019', '15', '38', 'Pranacharya Bhavan Ayurvedic Sansthan', 'Vijaygadh', '9/14/2019', '', NULL, NULL),
(1152, 'M1152', 'Nandkumar Muley', 'Vaidyaraj  Aug-Sep- Oct 2019', '30', '62', 'Nandkumar Muley', 'Mumbai', '9/14/2019', '', NULL, NULL),
(1153, 'M1153', 'Shantilal Agrawal', 'Niramay Sep-2019', '25', '50', 'Shah', 'Ahemdanagar', '9/14/2019', '', NULL, NULL),
(1154, 'M1154', 'Dilip Mahisakar', 'Varta Vishesh June2019', '8', '24', 'Mahatashtra Arogya Vigyan Vidyapeeth ', 'Nashik', '9/14/2019', '', NULL, NULL),
(1155, 'M1155', 'Vimalkumar Modi', 'Arogya May-2019', '10', '26', 'Vimalkumar Modi', 'Gorkhapur', '9/14/2019', '', NULL, NULL),
(1156, 'M1156', 'Vimalkumar Modi', 'Arogya  June-2019 ', '10', '26', 'Vimalkumar Modi', 'Gorkhapur', '9/14/2019', '', NULL, NULL),
(1157, 'M1157', 'Vimalkumar Modi', 'Arogya July-2019', '10', '26', 'Vimalkumar Modi', 'Gorkhapur', '9/14/2019', '', NULL, NULL),
(1158, 'M1158', 'Vimalkumar Modi', 'Arogya Aug-2019', '10', '26', 'Vimalkumar Modi', 'Gorkhapur', '9/14/2019', '', NULL, NULL),
(1159, 'M1159', 'Vimalkumar Modi', 'Arogya Sep-2019', '10', '26', 'Vimalkumar Modi', 'Gorkhapur', '9/14/2019', '', NULL, NULL),
(1160, 'M1160', 'Anju G. Mamtani ', 'Swasthvatika Aug-Dec2018', '40', '87', 'Arogyashram Prakashan', 'Nagpur', '9/19/2019', '', NULL, NULL),
(1161, 'M1161', 'Gopalsharan grag', 'Sudhanidhi Aug-2019', '', '40', 'Sudhanidhi  Karyalay', 'Aligadh', '9/19/2019', '', NULL, NULL),
(1162, 'M1162', 'Ishawasinha  Rathor', 'Swasth Rakshak July-Aug2019', '40', '40', 'Ishawasinha  Rathor', 'Delhi', '9/21/2019', '', NULL, NULL),
(1163, 'M1163', 'Vandana Muley ', 'Srujan Chikitsa July Auge2019', '55', '40', 'Mankarnika Publication ', 'Pune', '9/21/2019', '', NULL, NULL),
(1164, 'M1164', 'Ramesh Kumar Maheshwari', 'Ayushman Jan-Mar2019', '35', '102', 'Ramesh Kumar Maheshwari', 'Bhopal', '9/21/2019', '', NULL, NULL),
(1165, 'M1165', 'Ramesh Kumar Maheshwari', 'Ayushman Jan-Mar2020', '35', '102', 'Ramesh Kumar Maheshwari', 'Bhopal', '9/21/2019', '', NULL, NULL),
(1166, 'M1166', 'Ramesh Kumar Maheshwari', 'Ayushman Jan-Mar2021', '35', '102', 'Ramesh Kumar Maheshwari', 'Bhopal', '9/21/2019', '', NULL, NULL),
(1167, 'M1167', 'Amita Kaushal', 'Heritage Amrut ', '100', '55', 'Medplan Conservary Society', '', '9/24/2019', '', NULL, NULL),
(1168, 'M1168', 'Neeraj  Chauhan ', 'Parmayu Oct2019', '35', '45', 'Jiva Institue ', 'Faridabad', '9/30/2019', '', NULL, NULL),
(1169, 'M1169', 'Bhalchandra Jahangirdar', 'Arogya Chikitsa Aug 2019', '20', '26', 'Aksharamudra Offset', 'Jalgaon', '30-Sep', '', NULL, NULL),
(1170, 'M1170', 'Manoj Kaloor ', 'Treaties Mar2018', '', '43', 'Ayurved Bhavan', 'Angamali', '30-9-0219', '', NULL, NULL),
(1171, 'M1171', 'Manoj Kaloor ', 'Treaties  Dec 2018', '', '43', 'Ayurved Bhavan', 'Angamali', '30-9-0219', '', NULL, NULL),
(1172, 'M1172', 'Anup Kumar Jha', 'Phytopharm sep-2019', '335', '98', 'Kiran Jha', 'Delhi', '10/31/2019', '', NULL, NULL),
(1173, 'M1173', 'Janardhan Hegade', 'Sambhashan Sandesh Oct 2019', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '10/31/2019', '', NULL, NULL),
(1174, 'M1174', 'Byju Aryad', 'Ayurveda', '100', '86', 'Bery Thomas', 'Kerala', '10/31/2019', '', NULL, NULL),
(1175, 'M1175', 'K. G. Palllose ', 'Aryavaidyan Feb- Apr 2019', '15', '63', 'Aryaraidya Sala', '', '10/5/2019', '', NULL, NULL),
(1176, 'M1176', 'Swami Praptyanand', 'Vivek Joyti Oct-2019', '15', '100', 'Ramkrushn Mission Vivekanand Ashram', 'Raipur', '10/7/2019', '', NULL, NULL),
(1177, 'M1177', 'Vimalkumar Modi', 'Arogya Aug-2019', '101', '26', 'Vimalkumar Modi', 'Gorkhapur', '10/14/2019', '', NULL, NULL),
(1178, 'M1178', 'Gopalsharan grag', 'Sudhanidhi Sep-2019', '', '', 'Sudhanidhi  Karyalay', 'Vijaygadh', '10/14/2019', '', NULL, NULL),
(1179, 'M1179', 'Shantilal Agrawal', 'Niramay Oct-2019', '52', '55', 'Thakorbhai Shah Prakashan', '', '10/14/2019', '', NULL, NULL),
(1180, 'M1180', 'Nilakshi Pradhan', 'Satyanveshnam Aug-Sep  2019', '', '96', 'Maharashtra Arogya  Mandal ', 'Pune', '10/15/2019', '', NULL, NULL),
(1181, 'M1181', 'Rajan Kumar ', 'Perinatology Julu-Sep 2019', '64', '', 'The Himalaya Drug Company ', 'Bengluru', '10/21/2019', '', NULL, NULL),
(1182, 'M1182', 'Jayshree B. Keshav', 'Pediritz', '', '11', 'The Himalaya Drug Company ', 'Bengluru', '10/21/2019', '', NULL, NULL),
(1183, 'M1183', 'Jayshree B. Keshav', 'Alloveda July-Sep2019', '20', '', 'The Himalaya Drug Company ', 'Bengluru', '10/21/2019', '', NULL, NULL),
(1184, 'M1184', 'Jayshree B. Keshav', 'Himalaya Iive line July- Sep2019', '', '', 'The Himalaya Drug Company ', 'Bengluru', '10/21/2019', '', NULL, NULL),
(1185, 'M1185', 'Jayshree B. Keshav', 'Capsule July-Sep 2019', '12', '', 'The Himalaya Drug Company ', 'Bengluru', '10/21/2019', '', NULL, NULL),
(1186, 'M1186', 'Jayshree B. Keshav', 'Probe July-Sep 2019', '', '80', 'The Himalaya Drug Company ', 'Bengluru', '10/21/2019', '', NULL, NULL),
(1187, 'M1187', 'Nilakshi Pradhan', 'Satyanveshanam', '96', '', 'Maharashtra Arogya  Mandal ', 'Pune', '10/21/2019', '', NULL, NULL),
(1188, 'M1188', 'Niraj Goyal', 'Pranacharya Arogyam July-2019', '15', '38', 'Pranacharya Arogyam  Bhavan', 'Vijaygadh', '10/21/2019', '', NULL, NULL),
(1189, 'M1189', '', 'Ayurvidya Oct2019', '25', '36', 'Rashtriy Shikshan Mandal', '', '10/21/2019', '', NULL, NULL),
(1190, 'M1190', 'Anup Kumar Jha', 'Phytopharm Oct-2019', '335', '100', 'Kiran Jha', 'Delhi', '11/2/2019', '', NULL, NULL),
(1191, 'M1191', 'Anup Kumar Jha', 'Phytopharm Oct-2019', '335', '100', 'Kiran Jha', 'Delhi', '11/2/2019', '', NULL, NULL),
(1192, 'M1192', 'Gopinath Parikh ', 'Sudhanidhi Oct-2019', '', '40', 'Sudhanidhi  Karyalay', 'Vijaygadh', '11/2/2019', '', NULL, NULL),
(1193, 'M1193', 'Ragini Rajan Patil ', 'PDEA\'S Intrenational Jouranal of Reasearch I Ayurveda & Allied Sceince', '', '', '', '', '11/2/2019', '', NULL, NULL),
(1194, 'M1194', '', 'Evecare', '', '', '', '', '4/2/2019', '', NULL, NULL),
(1195, 'M1195', 'Ramesh Sharma', 'Sachitra Ayurved', '70', '64', 'Bhaidhanath Ayurveda Prakashan', 'Nagpur', '11/7/2019', '', NULL, NULL),
(1196, 'M1196', 'D. P. Puranic', 'Ayurvedic August 2019', '25', '34', 'Ayurvedic Rasashala pune', 'Pune', '11/13/2019', '', NULL, NULL),
(1197, 'M1197', 'D. P. Puranic', 'Ayurvedic Sept.2019', '25', '34', 'Ayurvedic Rasashala pune', 'Pune', '11/13/2019', '', NULL, NULL),
(1198, 'M1198', 'D. P. Puranic', 'Ayurvedic Oct 2019', '25', '34', 'Ayurvedic Rasashala pune', 'Pune', '11/13/2019', '', NULL, NULL),
(1199, 'M1199', 'MadhavPrasad ji Kyayarth ', 'Niramaya Nov. 2019', '31', '50', 'Thakorbhai Shah Prakashan', 'Ahemadabad', '11/13/2019', '', NULL, NULL),
(1200, 'M1200', 'Swami Satyarupanand', 'Vivek Jyoti', '15', '50', 'Ramkrush Mission Vivekanand Aashram', 'Raipur', '11/13/2019', '', NULL, NULL),
(1201, 'M1201', 'D.P.Puranik ', 'Ayurvedic International Jan 2019', '255', '34', 'Ayurvedic Masik ', 'Pune', '11/13/2019', '', NULL, NULL),
(1202, 'M1202', 'D.P.Puranik ', 'Ayurvedic International July 2020', '255', '34', 'Ayurvedic Masik ', 'Pune', '11/13/2019', '', NULL, NULL),
(1203, 'M1203', 'Anup Thakar', 'Ayurvedic jan- mar. 2018', '110', '62', 'Institued Of Post Graduate Teaching &Reaserch In Ayurveda ', 'Gujarat', '11/16/2019', '', NULL, NULL),
(1204, 'M1204', 'Anup Thakar', 'Ayurvedic Apr. - Jun 2018', '110', '118', 'Institued Of Post Graduate Teaching &Reaserch In Ayurveda ', 'Gujarat', '11/16/2019', '', NULL, NULL),
(1205, 'M1205', 'Amit Thakar', 'Ayurvedic july -Sept. 2018', '110', '196', 'Institued Of Post Graduate Teaching &Reaserch In Ayurveda ', '', '11/16/2019', '', NULL, NULL),
(1206, 'M1206', 'Amit Thakar', 'Ayurvedic Oct. -Dec. 2018 ', '110', '258', 'Institued Of Post Graduate Teaching &Reaserch In Ayurveda ', '', '11/16/2019', '', NULL, NULL),
(1207, 'M1207', 'Vandana Muley ', 'Srujan Chikitsa Sept. - Oct. 2019', '', '40', 'Mankarnika Publication ', 'Pune', '11/19/2019', '', NULL, NULL),
(1208, 'M1208', 'Vimalkumar Modi', 'Aroghya Nov. ', '10', '26', 'Aroghya Mandir Prakashan ', 'Gorkhapur', '11/19/2019', '', NULL, NULL),
(1209, 'M1209', 'Philipe Haydon ', 'Infoline  July -Sept. 2019', '', '24', 'Himalaya Publication ', 'Bengluru', '11/19/2019', '', NULL, NULL),
(1210, 'M1210', 'Pradip Upadhyay ', 'Pawan Parmapara ', '25', '72', 'Arpit Prakahan ', 'Nagpur', '11/19/2019', '', NULL, NULL),
(1211, 'M1211', 'Nilam Agrawal ', 'Aroghyadham ', '40', '152', 'Aarya Samaj Prakashan ', 'Mujjafarnagar', '11/25/2019', '', NULL, NULL),
(1212, 'M1212', 'Nilam Agrawal ', 'Aroghyadham ', '40', '160', 'Aarya Samaj Prakashan ', 'Mujjafarnagar', '11/30/2019', '', NULL, NULL),
(1213, 'M1213', 'P.K Warrier ', 'Aryavaidyan ', '', '64', 'Aarrya vaidhya shala ', 'Kottalkkal', '11/30/2019', '', NULL, NULL),
(1214, 'M1214', 'Amita Kaushal', 'Heritage Amrut ', '100', '57', 'Medplan Conservary Society', 'Bengluru', '11/30/2019', '', NULL, NULL),
(1215, 'M1215', 'Anupkumar jha ', 'Phytopharm', '335', '96', 'Kiran jha ', '', '11/29/2019', '', NULL, NULL),
(1216, 'M1216', 'S.P. Kinjawadekar ', 'Jouranal Of National Integrated Medical Association Aug.- Sept. 2019', '15', '35', 'Ramesh Mehta ', 'Pune', '12/10/2019', '', NULL, NULL),
(1217, 'M1217', ' Premdatta Pandey', 'Nirogdham Oct. 2019', '40', '106', 'Ashokkumar Pandery ', 'Indor', '12/10/2019', '', NULL, NULL),
(1218, 'M1218', 'S.P. Kinjawadekar ', 'Jouranal Of National Integrated Medical Association Aug.- Sept. 2019', '15', '24', 'Ramesh Mehta ', 'Pune', '12/10/2019', '', NULL, NULL),
(1219, 'M1219', 'Swadesh Agrawal', 'Pranachari Aaroghyam Aug. 2019', '15', '38', 'Pranachari Aaroghya Bhavan', '', '12/10/2019', '', NULL, NULL),
(1220, 'M1220', 'Janardhan Hegade', 'Sambhashan Sandesh Dec. 2019', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '12/10/2019', '', NULL, NULL),
(1221, 'M1221', 'Eknath Kulkarni', 'Ayurved Pratika Nov. 2019', '50', '58', 'Ayurved Seva Sangh', ' Nashik', '12/10/2019', '', NULL, NULL),
(1222, 'M1222', 'Shantilal Agrawal', ' Niramay Dec. 2019 ', '25', '50', 'Niramay Karyalaya ', 'Ahemadabad', '12/10/2019', '', NULL, NULL),
(1223, 'M1223', 'Jayshree B. Keshav', 'Peadiatris ', '', '11', 'Himalaya Publication ', 'Bengluru', '12/10/2019', '', NULL, NULL),
(1224, 'M1224', 'Eknath Kulkarni', 'Ayurved Pratika Dec. 2019', '50', '59', 'Ayurved Seva Sangh', ' Nashik', '12/10/2019', '', NULL, NULL),
(1225, 'M1225', 'Vimalkumar Modi', 'Aroghya Dec. 2019', '10', '26', 'Vimalkumar Modi', 'Gorkhapur', '12/17/2019', '', NULL, NULL),
(1226, 'M1226', 'Ashokbhai Talaviya ', 'Sudhanidhi ', '22', '40', 'Sudhanidhi  Karyalay', 'Aligadh', '12/27/2019', '', NULL, NULL),
(1227, 'M1227', 'S.P. Kinjawadekar ', 'Jouranal Of National Integrated Medical Association Aug.- Sept. 2019', '15', '19', 'Ramesh Mehta ', 'Pune', '12/27/2019', '', NULL, NULL),
(1228, 'M1228', 'Arjunraj ', 'Aaroghyadham Vasant 2020', '40', '160', 'Aaroghyadham Aarya Samaj ', 'Mujjafarnagar', '1/7/2020', '', NULL, NULL),
(1229, 'M1229', 'Svadesh Agrawal ', 'Pranachari Aaroghyam Sept. 2019', '15', '38', 'Pranachari Aaroghya Bhavan', 'Vijaygadh', '1/7/2020', '', NULL, NULL),
(1230, 'M1230', 'Amita Kaushal', 'Heritage Amrut ', '100', '59', 'Darshan Shankar', 'Bengluru', '1/14/2020', '', NULL, NULL),
(1231, 'M1231', 'Vimalkumar Modi', 'Aaroghya Jan 2020', '10', '26', 'Aaroghya Mandhir Prakashan ', 'Gorkhapur', '1/14/2020', '', NULL, NULL),
(1232, 'M1232', 'Gopalsharan grag', 'Sudhanidhi Dec. 2019 ', '', '40', 'Sudhanidhi  Karyalay', 'Vijaygadh', '1/13/2020', '', NULL, NULL),
(1233, 'M1233', 'Shantilal Agrawal', 'Niramay ', '25', '50', 'Niramay Karyalaya ', 'Ahemadabad', '1/13/2020', '', NULL, NULL),
(1234, 'M1234', 'Bhalchandra Jahangirdar', 'Aarogya Chikitsa Jan 2020', '25', '50', 'Bhalchandra Jahangirdar Prakashan ', '', '1/13/2020', '', NULL, NULL),
(1235, 'M1235', 'S.N.Sinha ', 'Perfect Health Care', '20', '27', 'S.P.Sinha ', 'Indore', '1/17/2020', '', NULL, NULL),
(1236, 'M1236', 'Swami Prapatyananda ', 'Vivek Jyoti', '20', '27', 'Ramkrushna Mission Aashram ', 'Raipur', '1/17/2020', '', NULL, NULL),
(1237, 'M1237', 'Chandrakant Jadhav ', 'Santa Nirankari Aug. 2019', '', '30', 'Chandrakant Jadhav ', 'Mumbai', '1/17/2020', '', NULL, NULL),
(1238, 'M1238', '', 'Kruti 2018-2019 The World Of Name ', '17', '48', '', '', '1/17/2020', '', NULL, NULL),
(1239, 'M1239', 'Narendra Bhatt', 'IASTAM Jan.2020', '15', '42', 'Indian Association For Study Traditional Medicine', 'Pune', '1/17/2020', '', NULL, NULL),
(1240, 'M1240', 'Anup Kumar Jha', 'Phytopharm  Dec. 2019', '', '', 'Kiran Jha ', '', '1/17/2020', '', NULL, NULL),
(1241, 'M1241', 'Premdatt Pandey', 'Nirogdham Vasant 2020', '6', '8', 'Ashokkumar Pandery ', 'Indore', '1/17/2020', '', NULL, NULL),
(1242, 'M1242', 'Vandana Muley ', 'Srujan Chikitsa Nov.- Dec 2019', '335', '87', 'Mankarnika Publication ', 'Pune', '1/17/2020', '', NULL, NULL),
(1243, 'M1243', 'Pratap Chauhan ', 'Parmayu Jan. 2020', '40', '106', 'Rishipal Chauhan ', 'Faridabad', '1/24/2020', '', NULL, NULL),
(1244, 'M1244', 'S.P. Kinjawadekar ', 'Jouranal Of National Integrated Medical Association Jan. 2020', '', '40', 'Ramesh Mehta ', 'Pune', '1/24/2020', '', NULL, NULL),
(1245, 'M1245', 'Pratap Chauhan ', 'Parmayu Jan. 2020', '35', '46', 'Rishipal Chauhan ', 'Faridabad', '1/29/2020', '', NULL, NULL),
(1246, 'M1246', 'S.P. Kinjawadekar ', 'Jouranal Of National Integrated Medical Association Jan. 2020', '15', '30', 'Ramesh Mehta ', 'Pune', '1/29/2020', '', NULL, NULL),
(1247, 'M1247', 'Janardhan Hegade', 'Sambhashan Sandesah Feb. 2020', '', '42', 'Aksharam Girinagaram', 'Bengluru', '1/31/2020', '', NULL, NULL),
(1248, 'M1248', 'Jayshree B. Keshav', 'Evecare Oct. -Dec. 2020', '', '36', 'Himalaya Publication ', 'Bengluru', '1/31/2020', '', NULL, NULL),
(1249, 'M1249', 'Ramjana Kumar Rajvir ', 'Perinatology Oct- Dec 2019', '', '100', 'Himalaya Publication ', 'Bengluru', '1/31/2020', '', NULL, NULL),
(1250, 'M1250', 'Philipe Haydon ', 'Himalaya Infoline Oct. -Dec 2019', '', '24', 'Himalaya Publication ', 'Bengluru', '1/31/2020', '', NULL, NULL),
(1251, 'M1251', 'Jayshree B. Keshav', 'Himalaya Liveline ', '', '20', 'Himalaya Publication ', 'Bengluru', '2/6/2020', '', NULL, NULL),
(1252, 'M1252', 'Swami Prapatyananda ', ' Vivek Jyoti Feb 2020', '17', '96', 'Ramkrushna Mission Aashram ', 'Raipur', '2/10/2020', '', NULL, NULL),
(1253, 'M1253', 'Anupkumar jha ', 'Phytopharm Jan 2020', '335', '90', 'Kiran Jha ', 'Delhi', '2/10/2020', '', NULL, NULL),
(1254, 'M1254', 'Gopalsharan grag', 'Sudhanidhi Jan 2020', '', '40', 'Sudhanidhi  Karyalay', 'Vijaygadh', '2/10/2020', '', NULL, NULL),
(1255, 'M1255', 'Vimalkumar Modi', 'Aaroghya feb 2020', '10', '26', 'AaroghyaMandir ', 'Ghorakhpur ', '2/10/2020', '', NULL, NULL),
(1256, 'M1256', 'Jayshree B. Keshav', 'Capsule Jan -mar. 2020', '', '10', 'Himalaya Publication ', 'Bengluru', '2/10/2020', '', NULL, NULL),
(1257, 'M1257', '', 'The Educational Interprises ', '', '26', 'Educational art ', 'Hydrabad ', '2/14/2020', '', NULL, NULL),
(1258, 'M1258', 'Eknath Kulkarni', 'Ayurved Pratika Feb. 2020', '50', '58', 'Ayurved Seva Sangh', 'Nashik', '2/14/2020', '', NULL, NULL),
(1259, 'M1259', 'Shantilal Agrawal', 'Niramay Feb.2020 ', '25', '50', 'Niramay Karyalaya ', 'Ahemadabad', '2/15/2020', '', NULL, NULL),
(1260, 'M1260', 'Ramesh Sharma', 'Sachitra Ayurved Jan- Mar.2020', '70', '64', 'Bhaidhanath Ayurveda Bhavan ', 'Nagpur ', '2/26/2020', '', NULL, NULL),
(1261, 'M1261', 'S.P. Kinjawadekar ', 'Jouranal Of National Integrated Medical Association Feb. 2020', '15', '30', 'Ramesh Mehta ', 'Pune', '2/26/2020', '', NULL, NULL),
(1262, 'M1262', 'S. P. Kinjawadwkar', 'Probe Oct-Dec  2019', '', '60', 'The Himalaya Drug Company ', 'Pune', '2/27/2020', '', NULL, NULL),
(1263, 'M1263', 'Bhalchandra Jahangirdar', 'Arogya Chikitsa Feb-2020', '20', '26', ' Jayant  Jahangirdar', 'Jalgaon', '2/29/2020', '', NULL, NULL),
(1264, 'M1264', 'Sunil Bakare', 'Ayurved Darpan Apr-June2019', '65', '38', 'Rasamruth Publications ', 'Kolhapur', '2/29/2020', '', NULL, NULL),
(1265, 'M1265', 'Sunil Bakare', 'Ayurved Darpan  July-Sep 2019', '65', '60', 'Rasamruth Publications ', 'Kolhapur', '2/29/2020', '', NULL, NULL),
(1266, 'M1266', 'Sunil Bakare', 'Ayurved Darpan  July-Sep 2020', '65', '39', 'Rasamruth Publications ', 'Kolhapur', '3/3/2020', '', NULL, NULL),
(1267, 'M1267', ' D. P. Puranic ', 'Ayurvidya  Dec- 2019', '25', '34', 'Ayurved Rasshala', 'Pune', '3/3/2020', '', NULL, NULL),
(1268, 'M1268', ' D. P. Puranic ', 'Ayurvidya  Jan- 2020', '25', '36', 'Ayurved Rasshala', 'Pune', '3/3/2020', '', NULL, NULL),
(1269, 'M1269', ' D. P. Puranic ', 'Ayurvidya  Feb- 2020', '25', '36', 'Ayurved Rasshala', 'Pune', '3/3/2020', '', NULL, NULL),
(1270, 'M1270', 'Janardhan Hegade', 'Sambhashan Sandesh', '20', '42', 'Aksharam Girinagaram', 'Bengluru', '3/3/2020', '', NULL, NULL),
(1271, 'M1271', ' D. P. Puranic ', 'Ayurvidya  International Jan-2020', '255', '35', 'Ayurvidya  International ', 'Pune', '3/9/2020', '', NULL, NULL),
(1272, 'M1272', 'Anup Kumar Jha', 'Phytopharm Feb 2020', '335', '78', 'Phytopharm ', 'Delhi', '3/9/2020', '', NULL, NULL),
(1273, 'M1273', 'Swami Praptyanand', 'Vivek Jyoti Mar-2020', '17', '101', 'Ramkrushan Mission', 'Raipur', '3/9/2020', '', NULL, NULL),
(1274, 'M1274', ' D. P. Puranic ', 'Ayurvidya  International July-2020', '255', '34', 'Ayurvidya  International ', 'Pune', '3/9/2020', '', NULL, NULL),
(1275, 'M1275', 'Rajan Kumar  Rajveer', 'Perinatology Jan-Mar 2020', '', '', 'Himalaya Publication ', 'Bengluru', '3/9/2020', '', NULL, NULL),
(1276, 'M1276', 'Jaishree B. Keshav', 'Pediritz Jan-Mar2020', '20', '24', 'Himalaya Publication ', 'Bengluru', '3/9/2020', '', NULL, NULL),
(1277, 'M1277', 'Shantilal Agrawal', 'Niramay may-2020', '25', '55', 'Niramay Karyalaya ', 'Ahemadabad', '3/11/2020', '', NULL, NULL),
(1278, 'M1278', 'Vandana Muley ', 'Srujan Chikitsa Jan-Feb2020', '50', '40', 'Mankarnika Publication ', 'Pune', '3/11/2020', '', NULL, NULL),
(1279, 'M1279', 'Yashvant Vyas', 'Ayurved Sutra', '', '150', 'Antra Infonemedia', 'Jaipur', '3/21/2020', '', NULL, NULL),
(1280, 'M1280', 'Amita Kaushal', 'Heritage Amrut ', '100', '59', 'Darshan Shankar', '', '3/21/2020', '', NULL, NULL),
(1281, 'M1281', 'Swadesh Agrawal', 'Pranacharya Arogyam Oct2019', '15', '38', 'Pranacharya Arogyam  Bhavan', 'Vijaygadh', '3/21/2020', '', NULL, NULL),
(1282, 'M1282', 'Nandkumar Muley', 'Vaidyaraj Feb- Mar- Apr 2020', '30', '63', 'Nandkumar Muley', 'Mumbai', '3/21/2020', '', NULL, NULL),
(1283, 'M1283', 'Vimalkumar Modi', 'Arogya Mar2020', '10', '26', 'Arogya Mandir Prakashan ', 'Gorkhapur', '3/21/2020', '', NULL, NULL),
(1284, 'M1284', 'Gopalsharan grag', 'Rudyarog Nidan Chikitsa Feb-Mar ', '140', '320', 'Sudhanidhi  Karyalay', 'Aligadh', '3/21/2020', '', NULL, NULL),
(1285, 'M1285', 'Jaishree B. Keshav', 'Probe Jan-Mar 2020', '', '68', 'The Himalaya Drug Company ', 'Bengluru', '3/21/2020', '', NULL, NULL),
(1286, 'M1286', 'Jaishree B. Keshav', 'Himalaya Liveline Jan-Mar2020', '', '16', 'The Himalaya Drug Company ', 'Bengluru', '3/21/2020', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `magazines`
--

DROP TABLE IF EXISTS `magazines`;
CREATE TABLE IF NOT EXISTS `magazines` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `magazine_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `magazines`
--

INSERT INTO `magazines` (`id`, `magazine_name`, `created_at`, `updated_at`) VALUES
(1, 'ghj', '2020-10-17 07:46:56', '2020-10-17 07:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_12_050925_create_roles_table', 1),
(5, '2020_09_12_052911_create_role_user_table', 1),
(6, '2020_09_12_120006_create_users_info_table', 1),
(7, '2020_09_12_143420_create_categories_table', 1),
(8, '2020_09_14_084725_create_books_table', 1),
(9, '2020_09_19_081123_create_journals_table', 1),
(10, '2020_09_21_071920_create_videos_table', 1),
(11, '2020_10_02_110123_create_library_journal_table', 1),
(12, '2020_10_05_051701_create_academic_years_table', 2),
(13, '2020_10_05_084405_create_departments_table', 2),
(14, '2020_10_05_101605_create_courses_table', 2),
(15, '2020_10_05_111531_create_authors_table', 2),
(16, '2020_10_06_053035_create_sellers_table', 2),
(17, '2020_10_06_060716_create_publications_table', 2),
(18, '2020_10_06_070148_create_student_b_t_s_table', 2),
(43, '2020_10_07_073410_create_faculty_b_t_s_table', 3),
(44, '2020_10_07_093924_create_rack_wings_table', 3),
(45, '2020_10_07_104854_create_library_books_table', 3),
(46, '2020_10_09_084541_create_computers_table', 4),
(47, '2020_10_12_054456_create_book_transactions_table', 4),
(48, '2020_10_12_072733_create_library_accessions_table', 4),
(49, '2020_10_14_095913_create_student_book_issues_table', 5),
(50, '2020_10_15_084519_create_computer_accessions_table', 5),
(51, '2020_10_15_103207_create_department_libraries_table', 5),
(52, '2020_10_17_062628_create_magazines_table', 5),
(53, '2020_10_17_133149_add_book_bank_column', 6),
(58, '2020_10_17_135743_create_book_banks_table', 7),
(60, '2020_10_18_165537_create_faculty_book_issues_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
CREATE TABLE IF NOT EXISTS `publications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `publication_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rack_wings`
--

DROP TABLE IF EXISTS `rack_wings`;
CREATE TABLE IF NOT EXISTS `rack_wings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rack_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rack_wings`
--

INSERT INTO `rack_wings` (`id`, `rack_no`, `wing`, `created_at`, `updated_at`) VALUES
(1, '1', 'A', '2020-10-13 10:27:21', '2020-10-13 10:27:21'),
(2, '2', 'A', '2020-10-13 10:27:32', '2020-10-13 10:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acc_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `acc_type`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-10-02 10:49:02', '2020-10-02 10:49:02'),
(2, 'user', '2020-10-02 10:49:02', '2020-10-02 10:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_book_issues`
--

DROP TABLE IF EXISTS `student_book_issues`;
CREATE TABLE IF NOT EXISTS `student_book_issues` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bookTransaction_id` int(10) UNSIGNED NOT NULL,
  `book_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expected_return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `book_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `penalty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_book_issues_booktransaction_id_foreign` (`bookTransaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_book_issues`
--

INSERT INTO `student_book_issues` (`id`, `bookTransaction_id`, `book_no`, `issue_date`, `expected_return_date`, `actual_return_date`, `book_status`, `status`, `created_at`, `updated_at`, `penalty`) VALUES
(1, 1, '1', '2020-10-17', '2020-10-24', '2020-10-30', 'good', 1, '2020-10-17 07:47:49', '2020-10-18 11:13:05', '12');

-- --------------------------------------------------------

--
-- Table structure for table `student_b_t_s`
--

DROP TABLE IF EXISTS `student_b_t_s`;
CREATE TABLE IF NOT EXISTS `student_b_t_s` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BT_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `book_bank` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_b_t_s`
--

INSERT INTO `student_b_t_s` (`id`, `BT_no`, `name`, `class`, `department`, `session`, `created_at`, `updated_at`, `book_bank`) VALUES
(1, 'BTS482160', 'Divya Patange', '1', '1', '2', '2020-10-13 10:28:16', '2020-10-13 10:28:16', 0),
(2, 'BTS241181', 'Shreeya', '1', '2', '2', '2020-10-13 10:28:48', '2020-10-18 10:27:44', 0),
(3, 'BTS774532', 'Gaurav Patange', '1', '1', '1', '2020-10-13 10:29:51', '2020-10-13 10:29:51', 0),
(4, 'BTS517374', 'Samruddhi', '1', '2', '2', '2020-10-17 08:18:40', '2020-10-17 08:18:40', 1),
(5, 'BTS459567', 'Vrushabh Patange', '1', '2', '2', '2020-10-18 10:27:21', '2020-10-18 10:27:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `password_1`, `acc_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$Q66WOOEEDUvPiBbiNShOLORTT2gy1eo0g2ZqTPj4rbjohWGtKh8Vi', 'admin@admin.com', 'admin', NULL, '2020-10-02 10:49:02', '2020-10-02 10:49:02'),
(2, 'User', 'user@user.com', NULL, '$2y$10$OyroUVnSVNAfcu17eT82VuJamVavapxUdrYWxp7tFGKbamJ.ARKLC', 'user@user.com', 'user', NULL, '2020-10-02 10:49:03', '2020-10-02 10:49:03');

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
CREATE TABLE IF NOT EXISTS `users_info` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_info_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
