-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 05:52 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Smart Door', 1, 5, NULL, '2023-02-10 10:13:48', NULL),
(2, 'Switch', 1, 5, 5, '2023-02-10 10:16:50', '2023-02-10 10:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `customer_image` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `customer_image`, `mobile_no`, `email`, `address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Customer 1', 'upload/customer/1757188659049646.jpg', '01544855022', 'customer1@gmail.com', 'London', 1, 5, NULL, '2023-02-07 10:01:33', NULL),
(2, 'Jack', 'upload/customer/1757195092156390.jpg', '01842057354', 'jack@gmail.com', 'Texas', 1, 5, 5, '2023-02-07 10:03:34', '2023-02-07 11:43:48'),
(3, 'Hasina', 'upload/customer/1757188830534636.png', '01937205728', 'hasina@gmail.com', 'India', 1, 5, NULL, '2023-02-07 10:04:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_05_212707_create_suppliers_table', 2),
(6, '2023_02_07_111750_create_customers_table', 3),
(7, '2023_02_10_160021_create_categories_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('third@gmail.com', '$2y$10$/BtYh1nXKk2862EicEsXBe5vH74.OHHOYkI.PYChgI3PtJTENIPsW', '2023-01-29 15:04:42'),
('fourth@gmail.com', '$2y$10$VSLbeNqMdHIFWEwQaXktQegK9qBISyKL6SR4qCr7CghgG/2Yu9qHG', '2023-02-10 14:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `mobile_no`, `email`, `address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Supplier 1', '01715397954', 'supplier1@gmail.com', 'Badda', 1, 5, 5, '2023-02-05 16:56:18', '2023-02-05 17:06:28'),
(2, 'Supplier 2', '01925391954', 'supplier2@gmail.com', 'Moghbazar', 1, 5, 5, '2023-02-05 16:57:57', '2023-02-05 17:09:56'),
(3, 'Robin', '01724862051', 'robin@gmail.com', 'USA', 1, 5, NULL, '2023-02-05 17:25:25', NULL),
(6, 'eef', '5', 'sut@gmail.com', 'London', 1, 5, 5, '2023-02-10 11:37:30', '2023-02-11 08:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `username`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'first', 'first@gmail.com', '2023-01-24 03:32:11', '$2y$10$.wN2Vtf74oEv5qoEp4ISIexHxPnItb2CuIxyhNF5xJyDuhqfgLhDC', NULL, NULL, 'vzcB7aR5GrUhqfzh5kd6F6X2WByflSTiTbc5EO5a2N2VRBDZbrjTEqtIQ4kS', '2023-01-17 05:38:03', '2023-02-07 16:10:28'),
(2, 'second', 'second@gmail.com', '2023-01-24 10:31:59', '$2y$10$khP11mBBnmCO8ei5DUso7.zOp1DgqZp8pO8lldZ6OMwWhc2aTefk.', 'second', '202301301141azeen-id-ImResizer-single.jpg', NULL, '2023-01-24 10:31:41', '2023-01-30 07:19:34'),
(3, 'third', 'third@gmail.com', '2023-01-29 12:57:21', '$2y$10$rXzfsTtLWehquA621U/irO//NA/n8BhbsCkTH.6G4s9ZIiIIBIoYy', 'third', NULL, NULL, '2023-01-29 12:56:51', '2023-01-29 12:57:21'),
(4, 'fourth', 'fourth@gmail.com', '2023-01-29 13:51:36', '$2y$10$dDcFc54ecNfpoinVGNUOJumEpIUgMpzwW2Mv0t8KosDijKbSrxr4.', 'fourth', '202301301053D-64989 (1).jpg', 'RSHA9VHbHrKOC80SgzDJnEthH6px2t5zNHZREpIVxEKvXd3aX1ApIoVKE0qG', '2023-01-29 13:51:24', '2023-02-10 14:53:10'),
(5, 'Richana', 'richana@gmail.com', '2023-02-05 16:04:37', '$2y$10$x72ZNcL1VoqhUcNeDavXcesvzxojhEJ63jKx3oKtA4P1KqyqLlWgy', 'richana', '202302110422images.png', NULL, '2023-02-05 16:04:04', '2023-02-10 22:22:22'),
(6, 'fifth', 'fifth@gmail.com', NULL, '$2y$10$apEZ1pIM.xsw3tyRflBiYeIlA0riSjVc/tblZXADtk/rM8w89mHEa', 'fifth', NULL, NULL, '2023-02-10 09:46:04', '2023-02-10 09:46:04'),
(7, 'abc', 'abc@email.com', '2023-02-10 11:32:08', '$2y$10$AQm4vYbvzR94AFBC3AxcMudsGDxdByImnei14VAtnZ7d/hvSfwoIa', 'abc', NULL, NULL, '2023-02-10 11:31:34', '2023-02-10 11:32:08'),
(8, 'bcd', 'bcd@gmail.com', '2023-02-11 14:47:06', '$2y$10$bzHVt1VhNicNKMiUSdaDv.0XBlTu5BYJ50mxk4qto1nWoMdqc4kiO', 'bcd', NULL, NULL, '2023-02-11 14:06:01', '2023-02-11 14:47:06');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
