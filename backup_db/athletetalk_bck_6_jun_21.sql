-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 06, 2021 at 11:56 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `athletetalk`
--
CREATE DATABASE IF NOT EXISTS `athletetalk` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `athletetalk`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wellness Techniques', 1, NULL, NULL),
(2, 'Male Athletes', 1, NULL, NULL),
(3, 'Female Athletes', 1, NULL, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2020_11_21_100106_add_new_fields_to_users_table', 1),
(18, '2020_11_21_102652_create_school', 1),
(19, '2020_11_21_104223_create_categories', 1),
(20, '2020_11_21_115736_create_plans_table', 1),
(21, '2020_11_21_115816_create_plan_days_table', 1),
(22, '2020_11_21_115837_create_user_plans_table', 1),
(23, '2020_11_21_115858_create_user_plan_days_table', 1),
(24, '2020_11_21_115914_create_posts_table', 1),
(25, '2020_11_21_115925_create_post_likes_table', 1),
(26, '2020_11_21_115937_create_post_comments_table', 1),
(27, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(28, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(29, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(30, '2016_06_01_000004_create_oauth_clients_table', 2),
(31, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0482796ba1873723e1018d1c333596b5246d8e383c1cc6fa2adfbe0d8cb9817e3ace9890cea17f96', 1, 1, 'MyApp', '[]', 0, '2021-01-30 01:16:09', '2021-01-30 01:16:09', '2022-01-30 06:46:09'),
('1bc959b565b6ae7222f301c537b7fc4ea6167001101877e8c2e1eb589e9c9d68133a1f71af9762ea', 1, 1, 'MyApp', '[]', 0, '2020-11-27 04:57:02', '2020-11-27 04:57:02', '2021-11-27 10:27:02'),
('1e7e612385171395cf0f914d141270b23c79cf7d743c11e2ee5c1a02387219e92ee3784d06c44d1f', 1, 1, 'MyApp', '[]', 0, '2021-01-29 04:57:32', '2021-01-29 04:57:32', '2022-01-29 10:27:32'),
('2647c23214263bb9705caa034cf6823539f41a89a85e3890c4f7e52893cfebafe854972d0eb22b7e', 1, 1, 'MyApp', '[]', 0, '2020-11-26 05:01:34', '2020-11-26 05:01:34', '2021-11-26 10:31:34'),
('321788c5a0fdebcfd4a23db374d481e3481ad76ec9970aa2a2ad4d760712dde684cfb8357aefa3c5', 1, 1, 'MyApp', '[]', 0, '2021-01-30 01:39:32', '2021-01-30 01:39:32', '2022-01-30 07:09:32'),
('471a8c3d75e5f15881c111fb4109c3eaa8eb3df5554017065fd2ee0618e03f6ea0c79cf88c428217', 8, 1, 'MyApp', '[]', 0, '2021-06-03 01:06:22', '2021-06-03 01:06:22', '2022-06-03 06:36:22'),
('53686cc692f53a25ba3290596b902b9f2371b9c238c2ec6cb7e3cc2ac5b4bd505808318d1e3cdcf9', 8, 1, 'MyApp', '[]', 0, '2021-06-03 03:41:53', '2021-06-03 03:41:53', '2022-06-03 09:11:53'),
('57d3b000fc969dc15aea8c0ee0c140e9275421c6b65acc2eee87f85d3a6613b3951138f4d0aebbb5', 4, 1, 'MyApp', '[]', 0, '2021-02-06 04:09:12', '2021-02-06 04:09:12', '2022-02-06 09:39:12'),
('6415843f8b26b1e928ce2cb18b2d9c1d7b0f235fb260e2b777e00fdbd536e520df9db2e86912597c', 4, 1, 'MyApp', '[]', 0, '2020-11-28 05:47:40', '2020-11-28 05:47:40', '2021-11-28 11:17:40'),
('9081a51293168460704b0636bbb1f163c0081144a3048ea6264aa37f6af28405dddd963f277e8766', 1, 1, 'MyApp', '[]', 0, '2020-11-26 04:18:56', '2020-11-26 04:18:56', '2021-11-26 09:48:56'),
('9098ae91eec18d09280f8a724f4b7e4d7b299c04115c6ce71502a1e0691a207394d460145b8de193', 1, 1, 'MyApp', '[]', 0, '2021-01-27 01:47:03', '2021-01-27 01:47:03', '2022-01-27 07:17:03'),
('b2d44a23e4b237ba338b7982df2124c52b134ccf60aad364044a82ade35fbc34e9b11eb85cac883c', 8, 1, 'MyApp', '[]', 0, '2021-06-03 03:41:03', '2021-06-03 03:41:03', '2022-06-03 09:11:03'),
('c8a4cef88e5db46bcfcd14aa1cad37aa2672fd2c7864e4188cae6f58ba4c64786346db374cdeef3f', 1, 1, 'MyApp', '[]', 0, '2020-11-26 05:02:04', '2020-11-26 05:02:04', '2021-11-26 10:32:04'),
('e360b1322d3ad8c01c2e784894fe7c483156ead8d6d7483236407b5a49b4a64f53f3a96e31511bce', 1, 1, 'MyApp', '[]', 0, '2021-02-06 04:06:14', '2021-02-06 04:06:14', '2022-02-06 09:36:14'),
('f9a773ffd09ab4193d6acc07afc81310261117d93a79302efb36de7ca5e7b82a6f6d197a88c8a4de', 4, 1, 'MyApp', '[]', 0, '2021-04-28 00:54:45', '2021-04-28 00:54:45', '2022-04-28 06:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '4joArmu5kDfVjNmtCvX3AfvD5sZu5qBiCDDORVeh', 'http://localhost', 1, 0, 0, '2020-11-26 03:47:44', '2020-11-26 03:47:44'),
(2, NULL, 'Laravel Password Grant Client', 'DpXFqnhXAcGB6ict39uEAd58Jy1a1xihg8AZZpff', 'http://localhost', 0, 1, 0, '2020-11-26 03:47:44', '2020-11-26 03:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-11-26 03:47:44', '2020-11-26 03:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_count` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `category_id`, `user_id`, `name`, `thumb_img`, `video_url`, `description`, `short_description`, `day_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Take a moment', 'card-2.jpg', NULL, NULL, 'techniques for practicing mindfulness', 2, 1, NULL, NULL),
(2, 1, 3, 'Take a moment 2', 'card-2.jpg', NULL, NULL, 'techniques for practicing mindfulness', NULL, 1, NULL, NULL),
(3, 1, 3, 'Take a moment 3', 'card-3.jpg', NULL, NULL, 'techniques for practicing mindfulness', NULL, 1, NULL, NULL),
(12, 1, 3, 'Plan test', NULL, 'vt', 'Hello&nbsp;', 'SD', NULL, NULL, '2020-12-03 07:06:27', '2020-12-15 05:11:44'),
(13, 1, 3, 'tst', NULL, NULL, 'd', 'sd', NULL, NULL, '2020-12-03 07:21:56', '2020-12-03 07:56:19'),
(47, 1, 3, 'Plan 1', NULL, NULL, '<p><strong>Plan A<br />Details<br /><br /><br /></strong>paragraph</p>', 'short description', NULL, NULL, '2020-12-03 10:12:34', '2020-12-03 12:55:10'),
(48, 1, 3, 'test  ee', '', NULL, '<p>Zxzczxc<b>&nbsp;s<b>dcfds f&nbsp; &nbsp; dfsdfsfdfsdf&nbsp;&nbsp;</b></b></p>', 'test ee', NULL, NULL, '2020-12-15 05:27:24', '2020-12-15 05:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `plan_days`
--

DROP TABLE IF EXISTS `plan_days`;
CREATE TABLE IF NOT EXISTS `plan_days` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_days`
--

INSERT INTO `plan_days` (`id`, `plan_id`, `label`, `title`, `description`, `day`, `created_at`, `updated_at`, `thumb_img`) VALUES
(1, 1, 'Day 1', 'Behavioral health', 'techniques for practicing mindfulness lorem ipum', 1, NULL, NULL, NULL),
(2, 1, 'Day 2', 'Behavioral health issue 2', 'techniques for practicing mindfulness lorem ipum in more detail', 2, NULL, NULL, NULL),
(19, 12, 'Day 1', 'title d1', 'd d1', 1, '2020-12-03 07:06:27', '2020-12-15 05:11:44', ''),
(22, 13, 'd1', 'd1t', 'ddd', 1, '2020-12-03 07:21:56', '2020-12-03 07:21:56', NULL),
(23, 13, 'd2', 'd2t', 'ddd', 2, '2020-12-03 07:21:56', '2020-12-03 07:21:56', NULL),
(24, 13, 'd3', 'd3t', 'ddd', 3, '2020-12-03 07:21:56', '2020-12-03 07:21:56', NULL),
(25, 13, 'd4 u', 'd4t', NULL, 4, '2020-12-03 07:56:19', '2020-12-03 08:03:23', NULL),
(26, 13, 'd5 u', 'd5t', NULL, 5, '2020-12-03 07:56:19', '2020-12-03 08:03:23', NULL),
(27, 13, 'd8 up 2', 'd8', 'd6d', 8, '2020-12-03 08:03:23', '2020-12-03 08:08:40', NULL),
(28, 13, 'd6', 't', NULL, 7, '2020-12-03 08:03:23', '2020-12-03 08:03:23', NULL),
(29, 13, 'd6', 't', NULL, 6, '2020-12-03 08:03:23', '2020-12-03 08:03:23', NULL),
(31, 13, 'd9', NULL, NULL, 9, '2020-12-03 08:08:40', '2020-12-03 08:08:40', NULL),
(54, 47, 'day 1', 'd1t u', 'dd', 1, '2020-12-03 10:12:34', '2020-12-03 12:43:39', 'atp-11607019219.png'),
(55, 47, 'Day 2', 'd2t', 'cc', 2, '2020-12-03 10:12:34', '2020-12-03 12:44:11', 'atp-21607019251.png'),
(56, 47, 'day 3', 'dt3', 'dd', 3, '2020-12-03 10:12:34', '2020-12-03 12:42:36', ''),
(57, 47, 'day 4', 'd4t', 't', 4, '2020-12-03 12:42:36', '2020-12-03 12:42:36', ''),
(58, 47, 'day 5', 'd5t u', 'tu', 5, '2020-12-03 12:42:36', '2020-12-03 12:43:39', 'atp-51607019156.png'),
(59, 47, 'day 6', 'ttt', 'ttt', 6, '2020-12-03 12:44:37', '2020-12-03 12:44:37', ''),
(60, 12, '2', '2', '<p><b>fff</b></p>', 2, '2020-12-15 05:13:37', '2020-12-15 05:14:27', ''),
(61, 12, '3', '3', '<ul><li>fffff<span style=\"font-family: Verdana;\">﻿</span></li><li><span style=\"font-family: Verdana;\">jhjh</span></li><li><span style=\"font-family: Verdana;\">jfhghjghj</span></li></ul><p><span style=\"font-family: Verdana;\"><br></span></p>', 3, '2020-12-15 05:13:37', '2020-12-15 05:14:27', ''),
(62, 48, '1', '1', '<p>ddddd</p>', 1, '2020-12-15 05:27:24', '2020-12-15 05:27:24', ''),
(63, 48, '2', '2', '<p>sdf sfsdfsdfsdf</p>', 2, '2020-12-15 05:27:24', '2020-12-15 05:27:24', '');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `name`, `thumb_img`, `video_url`, `description`, `like_count`, `comment_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, '', 'video-pic.jpg', 'https://www.youtube.com/watch?v=Xj5oJvvXyrU', 'Check out this video.It really encourages me to overcome the barriers of injury.', 10, 15, 1, NULL, NULL),
(2, 3, '', 'video-pic.jpg', 'https://www.youtube.com/watch?v=Xj5oJvvXyrU', 'I found this video.Its really good.', 6, 6, 1, NULL, NULL),
(3, 8, '', 'card-2.jpg', '', 'Hey Everyone!I found this.Its really good.', 6, 6, 1, NULL, NULL),
(4, 5, '', 'card-1.jpg', '', 'Its really good.Something real big. only to show what can be there in text format.', 1, 2, 1, NULL, NULL),
(5, 10, 'good one', 'card-1.jpg', NULL, 'Its really good.Something real big. only to show what can be there in text format.', 1, 2, 1, NULL, '2020-12-24 02:40:34'),
(6, 13, 'Its really good', 'card-1.jpg', NULL, 'Its really good.Something real big. only to show what can be there in text format.', 1, 2, 1, NULL, '2020-12-24 06:35:26'),
(8, 3, 'This is a great post 1', NULL, NULL, 'This is a great post for my reference', 0, 0, NULL, '2020-11-28 02:21:00', '2021-02-15 06:23:21'),
(9, 3, 'Post name d', 'atp-1606556996.jpeg', 'd 2', 'descr d', 0, 0, 1, '2020-11-28 03:41:06', '2020-11-28 04:19:56'),
(12, 10, 'school 1 post 1 u', NULL, NULL, 'descrip u', 0, 0, 1, '2020-12-24 02:38:03', '2020-12-24 02:38:51'),
(13, 10, 'School 1 post 2', 'atp-1608797462.png', NULL, 'sd', 0, 0, 1, '2020-12-24 02:38:16', '2020-12-24 02:41:02'),
(15, 13, 'Its really good 2', '', NULL, 'Its really good', 0, 0, 1, '2020-12-24 06:35:35', '2020-12-24 06:35:35');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE IF NOT EXISTS `post_comments` (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` bigint(11) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'Simple comment example', 1, NULL, NULL),
(2, 5, 1, 'Simple comment example', 1, NULL, NULL),
(4, 4, 19, 'ans text day 1', 0, '2020-12-11 02:09:11', '2020-12-11 02:09:11'),
(5, 4, 19, 'comment 3', 0, '2020-12-13 08:07:47', '2020-12-13 08:07:47'),
(6, 4, 19, 'comment 4', 0, '2020-12-13 08:08:28', '2020-12-13 08:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
CREATE TABLE IF NOT EXISTS `post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 5, 1, NULL, NULL),
(3, 4, 2, NULL, NULL),
(4, 4, 8, '2020-12-11 02:11:01', '2020-12-11 02:11:01'),
(5, 4, 9, '2020-12-11 02:11:20', '2020-12-11 02:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `name`, `status`, `created_at`, `updated_at`, `school_id`) VALUES
(1, 'call at <br> 9879878788', 1, NULL, NULL, 19),
(2, 'cordinator number <br> 777777777', 1, NULL, NULL, 19),
(3, 'Female Athletes <br> 6767676777', 1, NULL, NULL, 19),
(6, 'a', 1, '2020-12-21 06:59:11', '2020-12-21 06:59:40', 3),
(7, 'A', 1, '2020-12-21 07:09:37', '2020-12-21 07:09:37', 1),
(8, 'B u', 1, '2020-12-21 07:09:44', '2020-12-24 05:11:27', 1),
(9, 'C', 1, '2020-12-21 07:09:50', '2020-12-21 07:09:50', 1),
(10, 'D', 1, '2020-12-24 03:44:22', '2020-12-24 03:44:22', 3),
(13, 'Du', 1, '2020-12-24 05:11:48', '2020-12-24 05:11:59', 1),
(14, 'E', 1, '2020-12-24 05:11:53', '2020-12-24 05:11:53', 1),
(15, 's2 r', 1, '2020-12-24 06:35:00', '2020-12-24 06:35:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
CREATE TABLE IF NOT EXISTS `schools` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `splash_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `splash_img`, `login_img`, `nav_img`, `status`, `created_at`, `updated_at`, `domain`) VALUES
(1, 'Wake Forest University', 'wf-spash.jpg', 'login.jpg', 'menu.jpg', 1, NULL, '2020-12-23 01:19:22', 'http://wakeforest.yourathletestalk.com/'),
(2, 'NCCU', 'wf-spash.jpg', 'login.jpg', 'menu.jpg', 1, NULL, '2020-12-23 01:19:00', 'https://nccu.yourathletestalk.com/'),
(3, 'Colgate', NULL, NULL, NULL, 1, '2020-12-04 03:41:11', '2020-12-23 01:19:11', 'https://colgate.yourathletestalk.com/'),
(4, 'School 4 1', NULL, NULL, NULL, 1, '2020-12-04 03:41:20', '2020-12-23 01:22:13', 'https://school41.at.com'),
(5, 'school3', NULL, NULL, NULL, 1, '2020-12-23 01:20:39', '2020-12-23 01:22:01', 'http://ddd.at.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student',
  `school_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `last_access` date DEFAULT NULL,
  `streak_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`, `profile_img`, `banner_img`, `phone`, `description`, `type`, `school_id`, `status`, `last_access`, `streak_count`) VALUES
(1, 'Dashrath Singh', 'dashrath009@gmail.com', NULL, '$2y$10$oF0Yhz8i4Onj9Y0MtCYbXO42QBGsZp95LOcxZxeG9zeFefmgHut1O', NULL, NULL, NULL, '2021-06-03 00:52:50', NULL, NULL, '7877188110', 'Admin Team', 'super-admin', NULL, 1, '2021-02-06', 2),
(3, 'Emmitt', 'emmitt@gmail.com', NULL, '$2y$10$AgVjMAO1SuqLec9H/BQwhe68yrmUr.bU8ProtQMJflDfNbXfIjbhK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Content Admin', 'content-admin', NULL, 1, NULL, 0),
(4, 'Student p1', 'st1@gmail.com', NULL, '$2y$10$7pibzPpp0oNd./vbDsmeK.o3QwGEi9nJqGiLY1Oi.VGdkbBKsv3eq', 'FuPcdGdnfmAkftrN8TIJBibOzFNEGJEX9s89aXxsdkv6nD7wI1QM6zKWihXFUFm5bx6xEkWsbYn2nq1V', NULL, NULL, '2021-04-28 01:09:41', 'atp-1606646759.jpeg', 'atb-1606646482.jpeg', NULL, 'Soccer Team', 'student', 1, 1, '2021-04-28', 7),
(5, 'NhO4bB0NOd', 'WsIRuYhRjN@gmail.com', NULL, '$2y$10$bSB5nXgInQf7Z/mcuBDueeYgOcPP6lQzEhdxEWqepWMG8KZPVq40a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Swimming Team', 'student', 1, 1, NULL, 0),
(6, 'F2tqChVtqw', 'jwTRVXCD3r@gmail.com', NULL, '$2y$10$uZfZsjp.Q577uI6I8Dsb7uS/lyfI.Ey6XnX6F5gxjgbywOVPnDajG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Swimming Team', 'student', 1, 1, NULL, 0),
(7, 'tmyE3zr5QV', 'L2iKqlc64O@gmail.com', NULL, '$2y$10$vKVDqruDRlar0POyGpWZZ.9IBZDu8HmEs0VbTgVHo9f.76kShcW8m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'student', 2, 1, NULL, 0),
(8, '1BUiTjhZnY', 'I3zXuUD4jd@gmail.com', NULL, '$2y$10$PhFkutGoih2DRjUEOUigxuJedU0TbZJyEyEhtsuKGEVw5kimnqUti', NULL, NULL, NULL, '2021-06-03 01:15:22', NULL, NULL, NULL, NULL, 'student', 2, 1, '2021-06-03', 1),
(10, 'School 1', 'school1@gmail.com', NULL, '$2y$10$yiRoBXVTS9xSgir2.rzGeeIwDrfGfPntA/5U8YYn7Eva77/wwBhVu', NULL, NULL, NULL, '2021-06-03 00:54:05', NULL, NULL, NULL, NULL, 'school-admin', 1, 1, NULL, 0),
(13, 'School 2', 'school2@gmail.com', NULL, '$2y$10$IPB3Oc8eNh3VUc.nn4cSGeo9KFBquTZMsYooBWNkygQ09m85dZi7e', NULL, NULL, NULL, '2021-06-03 00:54:26', NULL, NULL, NULL, NULL, 'school-admin', 2, 1, NULL, 0),
(32, 'Dashrath', 'dashrath1@gmail.com', NULL, '$2y$10$iJL5h7mrh9wKa2weF1dv4.exkCniNX3FZBhcTiOKzTAd7SN4Coo9m', 'I0Lq0WakEhivzZm0NjF9ej9lipTTir7V9OMdmhrcuuSO9gwPrtMd8Z78JnTodCjyM0p8fS7Wm01avgXN', NULL, '2020-12-08 13:21:18', '2020-12-08 13:21:18', NULL, NULL, '898989898', NULL, 'student', 1, 0, NULL, 0),
(33, 'Amit', 'amit@gmail.com', NULL, '$2y$10$8UCiA1BAtm9JAzxa1H60..wsvS5ch1KAaud2e6i7/Igr.oZk5N1Wi', 'IKc1KYpWIUIFIVYKaAASyZsxuQkR1BmELJTrb34FUtZ1fKx4VvIYmptCuCaiu8qc4nQ2P7pIdZqxXP2F', NULL, '2020-12-08 13:21:18', '2020-12-08 13:21:18', NULL, NULL, '7799988899', NULL, 'student', 1, 0, NULL, 0),
(34, 'Student 4', 'st4@gmail.com', NULL, '$2y$10$XWRMLO4mb02d.kkokN2feOAdxg.P8cnfn1t/wT4r5Au7awjCRqFKO', 'FXovpIYadn1w8r5ed7Orr2FUkXwyGe4d6I2V4lR8CIbCHqnhfgS5opxbNIxMA8xiZhvL8wi0Eo4O6WNI', NULL, '2020-12-08 13:21:18', '2020-12-08 13:21:18', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(35, NULL, 'aerickson@colgate.edu', NULL, '$2y$10$1xNdvELJUw93NVH6QmKkpu9NOI8eGeTn.5ywx4IJwddGNkMTL7AOK', '6oy7xIHigU2FIAlUsn649b9gX68eGME6dbpZGSfgjw9HCtt9oSNZxgSaXbrcUP6rc6R3SxtIZwaq4bAN', NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(36, NULL, 'fluo@colgate.edu', NULL, '$2y$10$I6NccqZSVp8iW8V3UC8gCeWhl2ygIiCK4weZaY/L8/jxTFGlMA3m6', '7vDOchfChlaTX5YH7tdBqioFTuB6k14ILOfCTDQaXz7G8dQhTB5atRIsSOCSsK810saH9U0YbBXXraCo', NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(37, NULL, 'krivassantiago@colgate.edu', NULL, '$2y$10$6we7EuFbaK8ufi1K54pNduBz2bv5g9t9RWwIJtXOZws.XUGGnTSNu', 'zGc0yqZXPsGNklxG2Eohmm8bNFJpzqaeTj1tMlxJzU3h8b5M0Zpk8vg2OBBwwPimDnyz6qhLjbgykpku', NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(38, NULL, 'aeallen@colgate.edu', NULL, '$2y$10$ctZ43HRA7aoxU3/8FAl9UO1l6mwiL71NiVrLRc127FfHj8xWmcxQO', 'meC0LwusLhzaD32CyjfOXb4YgWYW8etwGqtOMsD7Q8rFVVEWkefJWWxu80Ovqn73CzcUVVWcToTeTnfc', NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(39, NULL, 'egoldberg@colgate.edu', NULL, '$2y$10$Gw7J7N2EvYsoheUbWbN/7Okcw6T3qqnOa8A9myPoZWB58dXfOMhkG', 'iKP9WbLtM3NquXoLrksAQCciAyEVT47oblBo6XUPaPYBRb7Mm35V3qS4ftkOqE4SN39hJxrCagVCSIRT', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(40, NULL, 'rhance@colgate.edu', NULL, '$2y$10$qIdT7v0kx06YIGpwIMwlsO/A9KQjyk.H9SinP6iLej4UZy98ha.wS', 'ueUDX3cZ1OxoV0IjdXUEqPsEaCcjovqOPtqOOtEL7TKYB4CQNC42SB2Z0dh7o3NOXDm0xaJDSKk9XAYq', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(41, NULL, 'mkniezewski@colgate.edu', NULL, '$2y$10$fcidA.YA61BBdszEdWweLeWMobDC4jxwmVKGeD0b03iaxivmLpcAO', '8HsG2dIol1cwY5Ax7pKd846pGRNmZ8HBPy9zw9I3J4LLeZ8ojrJSBpw6N5DUiPZUTmEsqXyA3rcthwW9', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(42, NULL, 'mrappaport@colgate.edu', NULL, '$2y$10$IgMqiL.CE2hfAN/jjRTLdO/5Kf/5mGoOcdPATRhPKWSKSZhClT8.S', 'NIkN4p96exWZd6KpMXLuzNOPUVjIigcgkzgUftDNyhUyhcFpTNxENN2ynArO60bArhicTAAJi4BGT5C6', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(43, NULL, 'mbevino@colgate.edu', NULL, '$2y$10$BXp6Ia4IxyyaBEgs6ev/FupHWsolPoLC0ZBknXtWE5Xpm5GEbF4Ei', 'rwgMdiyRNyAK6XoXfk2OBCUwG5LQT3Nuc8Tdjsd9nBvh0YmeMrj5FCUvbnoevFsLl9NPdodzqO2wrLp0', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(44, NULL, 'ndraught@colgate.edu', NULL, '$2y$10$F6DXt8kpObqKtGXGHkHq.es2kKKjbKxFx2j9igHsZdTDmcTzONp1K', 'bSzrM87WzDvxV8biaUZBAV1GVR5IHun310JDBPzJXdIEdHL6eB0jFIpRqd1PwPSDGbrRIZ1vULWKyF54', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(45, NULL, 'tdunn@colgate.edu', NULL, '$2y$10$3uDx1wsm/QG6qj9h8It.M.lV/lsrshMNWpX/JEPP2lp3z7gqM3M4K', '4qmLPgOBVlkT1SKcHDi7J1YbV8BRw7HkgJuikj4IiNefQIZctfTpBTRCTQZUW3XIadGB4rrLicTYy9WR', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(46, NULL, 'nmarsh@colgate.edu', NULL, '$2y$10$MSsjEuj1zOQJLty3/wM/iuMFrcmb8UPBzHaShAHKW/N82dPm1N.N.', '6I9oTf0NZoYwsMeWnLnoxkxjXgq4FzCc7oDbSgZxgqbVi1Aq3Ht2unYhaKaHxRePfR5RslwyleEvFC0B', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(47, NULL, 'zpelland@colgate.edu', NULL, '$2y$10$ivwaMlxWSRIBdz2bkncaROKSTHd6ToloDNwyo6zo4GoxqH8lUD/ES', 'KYUt6UvdkMZ7pO2YZUe75nDF55NKYOwtxL0XeBI03V2gCLUeg5PzQqOrjcyafmcwYEc0BMB2zRsw5DHy', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(48, NULL, 'mtwyman@colgate.edu', NULL, '$2y$10$AfamQkU/VPmhZCmX0dj/3OdMA5amnB8Z2/Pqb2C79jIf5Dc6p/JkG', 'lVinfcFsbMPAoNzGS88N2H3k5jQvr29Sqmgs47XDX8mwIXpyt7uK8GKHsM447Q3KtDgQ7SfaPM0IlD0J', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(49, NULL, 'jcmaguire@colgate.edu', NULL, '$2y$10$zNyK7GW2ED25lrutSpDya.tLspQEF6AEd4QCPnoqSvMLQHO/r4r0e', 'DaZQ8pNBTGyuspsPsjgolkkmw67zysOUXoWT1Nnreh28vWpSLPPVeTeXpXJJbPKlJch4mDuoo7ZwngFa', NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(50, NULL, 'rmoffatt@colgate.edu', NULL, '$2y$10$/ChY/B9batON/z4qAV3No.UdhJsuOjzi7NUKNqZuO316sLG7ww40q', 'cctulms4JQOmKyq8uNjTphdrwLQlzYEoycp4taGeSx1SPOkUUhddYX6Lq6Vbf1JYJrEfsy2zR9CwdKAE', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(51, NULL, 'pmcavoy@colgate.edu', NULL, '$2y$10$zoTXAYs6vmkrows4EZgTWe8iXPOlY3xW81AJs2.yz7Dty8cZVSnAa', 'xjj6OiVJe6kUGhoXgXPONzePlzZBvXaBTkswJzSRGmYfmirrXj5FrCXVazrckLtaTx8GoMXGr6w3J7ht', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(52, NULL, 'jmckechney@colgate.edu', NULL, '$2y$10$Se2e/B0l9d0uY/Y64J9yH.kCxSraNt1RAb06wZKBMCJwIhIoEmgDm', 'rEQztnDt46gNOSACVmx9gs4Ap2WNoEvx2InTgHUpSWvYtmBX33uAxcKaFcrD5ql6sdz3saeSMVlLTBxQ', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(53, NULL, 'glunn@colgate.edu', NULL, '$2y$10$Ao0oAfkpzSX3NnaqVTBN2OeDQHv6c50FEcg9LpVE5txfiYnr0C7FC', 'CQmXiHEfgmZLCg6zJfjIj2DmxhF1YQDZwqZMRgRyJ02O1hVFNrk1l92CxlG6HhqrSTE2eU2p70HPW0MR', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(54, NULL, 'cpburns@colgate.edu', NULL, '$2y$10$AVEwrxfg7JLVigAyYAGMOer4YLN9jwyOSYL9Wx6BCoCh6CZYwHj9.', 'Ro4M2mLSYVOwBgkTw1wYFUsAY7xBcqLDPfubmuPSWsdxAqYBS0L1bxVbARD972aj30zNX8QgUqU6bUcg', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(55, NULL, 'cbrook@colgate.edu', NULL, '$2y$10$ably2pMwVhz1o1PPooHYa.A88P3jbCdfHGzTG3RGZZSaS3Djszy/O', 'WS9GClXdAmwSOc0J1hT5ikbU5nFyAMdJvVspBcQIJesrVV0OvVW144j4BK8pEkgml0PGeRK2cp4shIUM', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(56, NULL, 'jcaddigan@colgate.edu', NULL, '$2y$10$cbklK7pX48oB3kuJFC/Dz.KiaNnI7FPLqbuUnLQrUg9e2AjV5.dDS', 'tSbiZI68yC9DdYg6iDXCXuRBTprsArDmZWq9ihVYNoCvOf0SNA2m8pYE9ym7sv9LSxGtJDG0sK9CNhe4', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(57, NULL, 'rdecker@colgate.edu', NULL, '$2y$10$YKwC7MySr33sAGvpkkUKj.FRxeval.B8V9O9SexxAIwnFA6KFSzDm', 'PgFcuzueyA4wMXPmwmAqLa0vURPxc8THRWh1ZamyKcslJ7Aqce8XwLw1HBWYswH7d3F4WEBYZCoXaobo', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(58, NULL, 'nbarkoff@colgate.edu', NULL, '$2y$10$bY6MCFOdeXFseq5/Ar1G4.VpCJ93zlAr3msC7ZmX7J9KYKn7pJene', 'lJZvWT0oK215GfGzY27nTyHQwJBoJCiBbPwi1svZX51ys5ed6Z4rDu3k4nUW4wgJEGVZXctxbdHTAxl0', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(59, NULL, 'ajsmith@colgate.edu', NULL, '$2y$10$8N7UlSkJ7i078jZFP2y.8uKBOa9AULkhgUxaKftOCgjZ5nR9nS3PC', 'mNVS1LEp3Kvhy9JWZ5y238yawrMQ8DUnegMxlQNFrxtOZA2UORWT2AOcO6TWLcoYVmwd0fwjaCqElkDH', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(60, NULL, 'medelstein@colgate.edu', NULL, '$2y$10$ViJbkXSI7rS2T/KIhQ2QC.GZCV/2QlfOg1Fra/CwHbc1sYcrSe7xe', 'pGyg2UmbNNtEnAXmDPfckMJXYlfzAlanqTudwqdcVbPM9cOp5Dv6MXs3XfPkXppnjqKD672zQJL1C8ig', NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(61, NULL, 'rfoose@colgate.edu', NULL, '$2y$10$LMKG17Pydhi8ngV9cAH22uRzDjFETVmzER57qdYEBG2BvvC5I2H62', '1RybxP3iCcwBEXFpebkpM3COj9aXNfizfLyQpPoHL07AShpJVUtMsCE18JNOiEAu1kOT6TbGaarMouc6', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(62, NULL, 'mcaldwell@colgate.edu', NULL, '$2y$10$UZ9N3F2dghwJtK7VkaZbyea7CrRFA6SS4BuAsquFfD0STItwbi5h2', 'hO2apApYr9t8rJifMV3hy4cyEpHtohP6Q8PzhStbSq8bNa4jdJnquREqDhTwNZwTPAYlIniJHKSmH9BL', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(63, NULL, 'rcarney@colgate.edu', NULL, '$2y$10$7JbElzvwRilRTSKZeEl8m.tXBgRG1QXbL1zqjVHmy9Q10jMfgRiqW', 'ZNFBPYq1XYETNk8P5az5a7f35WtMtxAA6AOVGqmM42FLiapNeeRmHTjXtylBHeKSdVrM2kCrnagAcI5H', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(64, NULL, 'ccottrell@colgate.edu', NULL, '$2y$10$imzqEfTDKeS71D0z0WR3D.nDdH5W.VziekfQo590OsZRAuIV/McQO', 'DURGaKkXrV6KK2BwLOWtCDtItHhXLjx7CeCipMHOE5xTZeHdRjYdQVLFae1Du2X8cApahpjgvE8RMww8', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(65, NULL, 'kfusco@colgate.edu', NULL, '$2y$10$5.Yll9mJfCKUXKZ3jQomS.86TM.4aKIGRob8Zz4hz7YfNIyVXwHWG', 'bKcdlPCRKjvhxXnMWZUFs46KpJx2wmc5Zk3rIGzxFyZUmPoP3G5MrbsE8iAezIUTRo1uyqu4hBc8rDlO', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(66, NULL, 'jgeffert@colgate.edu', NULL, '$2y$10$Lu0eOfb/JuYlNpmlZf1d4OVCiEGwYIjyeSAC3oEzgfSsn70uuF4Em', 'AQJaDreNLBiK4KsgcGR2w2C5MgMT1Lx3tdvOe8b5UQFCJTuPiCdjzoaWp6rW9bJ36iclkwtlyxwL0tvb', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(67, NULL, 'rdjohnson@colgate.edu', NULL, '$2y$10$Wpn1eSVzJ5/vhODv6BEabOel7RXE1JZIEUYmD0FYB1BlEY3IppevW', 'Y7Zd03ToSXEPXd7TEGn4KZycCzy0HgYBppV6Cxw0gOeCj8tRne3yfuQLFf5re87RMGvdd8rYjyWJYu39', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(68, NULL, 'mguevarra@colgate.edu', NULL, '$2y$10$MxUb.3I5o.VwGHFvnp7/POFDXXzi0dxRGqQjs/d2kVXWHCTddBPsi', 'YhkcR6DRryUg20mXFqtl6HH7EsGuRoxZY5kHvjYeY9wgk4avCyfCQPVTa74OdoBHDyrC92rHhYxSGePo', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(69, NULL, 'tludwick@colgate.edu', NULL, '$2y$10$GIMuomL233UX4sBEAVyoVu4kCOwjdRiulFMUKGoNWK9yi67MGGPx.', 'In1b6Xm98Mo1YVRCkugIcMfstqIdRId8fVmb6dDrywCHCxaYpcH7nw2Tg17mK6rc2bcnPzG4A6nU6Tvy', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(70, NULL, 'sdutton@colgate.edu', NULL, '$2y$10$nVuxhlGv0jrAP18IFUT3c.S6aHdI.O9BfU/qLQS3y9/EMq8iei09e', '3ra0Rb9VSjtFjOYyyPeoqXdjhT3cevNWXiunK2huUt2EYOx6B1RrQrPbA7Ri1Wn1sV2Ce2iCFGXt9RmP', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(71, NULL, 'claplante@colgate.edu', NULL, '$2y$10$jPfd/KPqtgREAeexlemFWumeN8yL/UEwGhavr83HoyqXmVIrkC9Ri', 'PjW8BuhOWrzpQ72Gd9EoIX5fbeGWuVsetdOgpsXuzlwT9VIQlOQipkcGFXoaypxCEk0rjfzXsISXgANX', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(72, NULL, 'cosman@colgate.edu', NULL, '$2y$10$hEO9EV.zfYC6UV.LuhHP8ORwV1SDBga56PDaaalJC6h64HcEtES1m', 'VAUVyKr9VNohIYyHRNH25OHmfErGEC8ZqOtfrtyUurLVKqheuYMsdOw2ojydTfbiPQ6aAOKjGUVOEMIV', NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(73, NULL, 'erpeck@colgate.edu', NULL, '$2y$10$HNEo6tW89N2wD4G/fXk.QuGbuRzICGTpoM4u2IwkmjzMEYxWXA52S', 'TAJtopGiqs1FPkioy8SkBPub9cqUpCZoJTIxo0l0mzmxBWUBmZmfJIBKfcdJG1diPPRmcg2rbTDm8oZs', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(74, NULL, 'ehodes@colgate.edu', NULL, '$2y$10$HZ0Kh5jmsmXlxCU80amhYes4.oQTgwqY8SYjaMi6JlRHpJJF2XEaC', 'PpoW6Lz8yfA16MJpDFwREY2kO0BUciffkQsDdFMBnMf2T8hJKT1BRkqKuFOh3Tbr056zDjgu4rqMZSqW', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(75, NULL, 'jsong@colgate.edu', NULL, '$2y$10$W2ne1VF1ZRIcVXrJ4o41lOwfw9Bv5neoA96HMBPNK/M/9mu7yC716', 'bZmti6Jl5jxwi7Z0eW6V6KK6g7B7aozvRVJ0wlfymUxJDzR0uZJo6yaNo20pIEoX3GU637w1pj4QRYQf', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(76, NULL, 'nzeigler@colgate.edu', NULL, '$2y$10$TYPJnB56JVqpxOC39uvaJuyLWWpsiQDLP1oGtgu5ZQqLMBkkXhXey', 'QRGfbs87BVMh7FUx88cQ9SWiLjFcn9brzCZ57d8ry77lvQNB8j4KsGmzrPEq1ZRPJBHBbljmncd4SMQF', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(77, NULL, 'achow@colgate.edu', NULL, '$2y$10$epgdO0daQ//7/RGP9WgC5./YuPhMC7QLcTVHhjNxJEfrrgLIY4ruq', 'ibl9AA2hZ5nOlQzMn1h0RDljEyexsmf9Sx8tidnNf8uRTTCCnH21Mw5KJ6j1fZ6Umpa2vP83u0eQPOQt', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(78, NULL, 'tcigna@colgate.edu', NULL, '$2y$10$U/qv60gakCq33U/VEr56AOjfNIvTTpQjT1P835uNSVkBN8h02QAAe', 'zne1oHKNsDfKc0RANDhVBpXqT7mHcN18N0zfQgrsn97EfI6GtS1zCZWcW26SVUooqtY0BcHWGW5i5r4I', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(79, NULL, 'tdavis1@colgate.edu', NULL, '$2y$10$MJ9.As5uPCRsa7GXqFqC2eD8vPmWKpiQlcS6sLs8GWZuzLwxL3tyy', 'E46HWDKoTjsGTWCdDU1r5swbyNRrXERaRXsMpkmbleeZAMpLvzB0iNB0jqVwvpCAhSOgXuxpLemJERX2', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(80, NULL, 'ehamlin@colgate.edu', NULL, '$2y$10$xL16KF7SStd5.hG3JM3vLuugNYtdndSiq0copZRJHLEagH0gDVt4G', 'N6yxENcljB0a5sJYFlmMhU85m0LCSu7KeZVxIArWCOUdPHLZmRHRfBpCvab4KXpP47UNi1E7XT9d5C5v', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(81, NULL, 'ghauschild@colgate.edu', NULL, '$2y$10$SOoYZ1Tn1mI0DoksmNZorOUWAKgqs8p2Gi0MEjIZcmP29AaR3vHFe', 'NKRrF4lDudhC30d48JR0o6Wbwy8uneVJ0XLb2Tl0GENxa4lLrklzdgv6NsxOU4poMV1uinBrhaMCh7pT', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(82, NULL, 'hhornbostel@colgate.edu', NULL, '$2y$10$4zUwfFqYyVDezNT/Xoy8VuV7NC6qO5hplhE/hKJWGxjISZ3ymG6CS', 'QypuvFsOoQRaGzJKYhIPV5Yklopx0EN3a2iemQCUeruP39xGP4hOYjmHezjS16YT4ZRbuIWwKIAmH7N2', NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(83, NULL, 'jkurowski@colgate.edu', NULL, '$2y$10$evacolaeMYsaNmeyed6CMuwK4qp2Q4IW1bcCJnL9XSzmnzmp7IA5i', 'MGHB1NH5BgMBDu3oWT5yONLAkQ8L3hrhWMEoEdOI8FdwieJH9FxdNs4DR3DaWZlv1Pz3153TjuyEaA5R', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(84, NULL, 'kadixon@colgate.edu', NULL, '$2y$10$9K8jE2T4k2iwmIJCEnAnR.e.PklLhXT1bRiGVMQrMNHtu/Z1yFwnO', 'fYrCeINXrPbUpk7GtjJQBT8ioDFUWYzW8CADIz0i3G0AxJofuMFgQPD026AlUq9KoBPddzdr19aDToWg', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(85, NULL, 'dmackay@colgate.edu', NULL, '$2y$10$A5USjpgHttRzAKJX/7WRWe4Re9QvEXFRZspaKTSGZDSGzBnU1E9Cu', 'Zjb8ZwvyP553F2O4u4eJ6WgKAHerOzwbkcuXPPaMUuxm0i1v25fx4CDIJvzkJRNeQJb7fUtMSfNPOiOJ', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(86, NULL, 'mschneider@colgate.edu', NULL, '$2y$10$dtiU3QKtuVnJT814.9vwROfyQCYiiwdsH3QxRzbYO8PZTcWzYhSE.', 'sATyo3eeqUqNs42dGsEZjIYZ0wKikNcF5mQ6R50k6W8I6qahyfW7TbrUz2MOdIe6uXlmg115f3muwAQh', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(87, NULL, 'mandersen@colgate.edu', NULL, '$2y$10$J9YJAFK5FbONpcyCrRaRruBaG9ukCvhEVpYywieu0sFqLUyvCQOEy', '0TMGh2dqhl0IhzcnlEdtBgOmsJG3kgcSFQLEbLjWUaZlmuvvtetB4ubzLi5Ok0bX9A0xvSe5lHa8wz0K', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(88, NULL, 'hchristian@colgate.edu', NULL, '$2y$10$pSwsT6KRYfaKlsGrPteUnuoxBjYK8yJzLHBIVzdz7a5tt5dmS3Xji', 'AbD5RiDheIodN4G5Q3s2kRQHpJoxsigTFOYTyjacVzclGkqhl2yWF9XzzU2pALwR71VSwzFhPKvjZYgT', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(89, NULL, 'cday@colgate.edu', NULL, '$2y$10$Ljo2EXTB5NiivJOUvHS6auGNJRMBwCsGkGucsssA814NowzNGTiqm', '75SHTb30CvqjoJwGj9SS3umyesFLA6SIiqLrye0LVehxekRO9gDsePhJ1ky7n4Gpyv9AcyzhgJnyz8F0', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(90, NULL, 'oduarte@colgate.edu', NULL, '$2y$10$v7slTzEbGhU9rWc57dih2OUvMWJekxzabIadv4rv7XJ9lu97wtcVG', 'QysT6hTmu0ZyJ85n11utMRLHVWT0AboVOmaTbPBSF14QHA31tWZz7I0wHaJnVncelI2b04ucpw85p6E0', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(91, NULL, 'olynch@colgate.edu', NULL, '$2y$10$qslpDLMGEtPMeLMIT2eJMeh66IY43nHmYmQHcRBdkDkNngkkjA8kG', 'rYR7Zy1f2x8v7c6SgrqSFMpNt2zDdUwPSNGKiAXQ4Z7TAwdkgIhqIGJmRNZJMffqD9SwrOVC24gbgT9o', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(92, NULL, 'npatterson@colgate.edu', NULL, '$2y$10$G7VlAUkl4NOH7a5pYD.uZORrGDSARA/OrD.vzbUgxmD79LZrnowiG', '0LvTGpXa081XTshtdLqItmdvjkPSzpcVK5Yn7a1XzyVEPVPOJHF52l9fwEPoMALTxzE5wxs4Ph0r452k', NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(93, NULL, 'ktweiner@colgate.edu', NULL, '$2y$10$o.ST4GAsO6mjI3P42prpVeGF3ss0gyZGhoe30uQ6exLrYWzWZbnfe', '0yLhKdrGiFyjypOdSYwniK3gQzr4liyU3dmZPG77JoZX9v1BRYBWTcKNwBYCbZQPObOZUeOM51nXc2L6', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(94, NULL, 'rborkowski@colgate.edu', NULL, '$2y$10$u/9N66L7Z/Faa/zGJbeWSuAONT.hkQ4w3qjm52WkueNmuuPSw5a/u', 'LfH6vzax3PdtYqQJWc1470R2y4YyNehvQ8tkhtqeVwnzyfzf527z2byssqLlo22BufsR09pTOpK8ue9J', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(95, NULL, 'alewis@colgate.edu', NULL, '$2y$10$czIXl7JRC5gmdOORIazYUuTomjRde1qlnqS5nixPpQVgcR75SGEP6', 'E0tCZVMcu4Qsh6Cq0zxPdyCnOm709hArBgrjrD22czOAtcP6N6t3FMHdqIVBpRkCv9t8G9oJGTXOdkzw', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(96, NULL, 'eamano@colgate.edu', NULL, '$2y$10$l/aZu/uDHK5bZT6U9jxZ3ebxRICIFy87jyp6G.saItbtqf/O9uNc.', 'HG5OVsbJz5rFhxaCvwOCW3tz06SU21n8aCY5PTTuNubLEWNaZWoPapJTCRn0BAZEC0lH3ZLewijgCsrk', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(97, NULL, 'napuzzi@colgate.edu', NULL, '$2y$10$yjhB3E1o1H0CP1PL1tj5Qu2glK3rxtknvnS9L42PMzKrTK9VfB5h6', '00ZhLd09HurVb4KXR3xErGkHqn0cfKMWMe5B1uhm0Qq23FeywxF6Kg5vijF5ZzMY4LvNB0PwlmkJZ9Hs', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(98, NULL, 'mciardiello@colgate.edu', NULL, '$2y$10$zQWVj0zLL.sR2D6NiAOKz.hhAZMByJMFYiA2VoHVKU41.hAHaq/5K', 'qnuP4rL4hzVYufBpZsdxf1vNTsAVgxRPSw2fDPG3lMiKAs9LL7JYEvvD9skzUXDH1BZ8KhR1eSKIiqsq', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(99, NULL, 'edenunzio@colgate.edu', NULL, '$2y$10$NeE98jaAhyw25ulZB.bINePBWCr0yQCDsbxcC0IjYeStid0yhWsQi', 'ij04utEvTynzlPIfXxLiRxqrd9vg2DhrUJBvXCLkjclQCR9D1cyy2yOHVDmvjXcv1X9VpEVx7ZTVoYCS', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(100, NULL, 'masmith@colgate.edu', NULL, '$2y$10$nYAIdncuazWoSKDewJAu.eG/QBsLffw75Sh2CVrxzHOrcsoLn.tbi', '68PC7e9LMvgfebCjJ5zPNhNVEiPESM3CKO0fH53tpCeKl2mxfqcwic0AyeTgOnsOc9YA6uS8ta2CqUiZ', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(101, NULL, 'mdeeter@colgate.edu', NULL, '$2y$10$H1ykq8kQTXqYbASFtCSlhuTT47DkhlIUOHkE0pwD13UDRdMOx9J5G', '6N5qXIt6rgQpYS2kc3tCBj6SqSPiDWm4lLWShQkKhsm5KDB9ubMuYJmTmwYXubOwtLeDBrrs4UKvvlFD', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(102, NULL, 'elaub@colgate.edu', NULL, '$2y$10$26nNG6q1aJ02QIAYBctbS.JgHiYFLAL48jmzN9HRPKAiDvePKPWsq', 'Ij4niUT7yYoIKOMbAvKPL36vJKuqnbRIZlAVvCf4OVmbpxpkYImsQIlGnwpAyE9NXsyazrXZNAsF6y9K', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(103, NULL, 'blafleche@colgate.edu', NULL, '$2y$10$pNxUAnqWO6nkQhnnB6TjrOADVTIJhCgVpmihOC2vng4qXduzxMVzq', 'mhec1JNdOX0EzK2HD4CoLWdvgj1Pvt637kjBwQ4WABP12rjxNrj49GLqYmeyNwq2AxT8EV86B6MYrWKQ', NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(104, NULL, 'zmwilliams@colgate.edu', NULL, '$2y$10$sR4NWr97jBY3D/3usHMJROGFbpZcPNqCwHCVIuJiM.N7FastGfDA2', 'IZVjAKg3WdrRqNdhbRXJ9JAUEMj3qOFknOH4EECUXHIPaRJPopAovq4tJAQHNImRyXtSR4jz251vbrzw', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(105, NULL, 'icunio@colgate.edu', NULL, '$2y$10$NFBT0dzQonVqJEACiTTwBurwCtusedlXDz124e5zetvfm3VskPzbm', '7aYg1X5qJ35FpcnwoMGivBkvSlAck7Iwenq5d8QDnda8XeJAWMyQ4XuOIs9yZHMvc3E253tUNVZyBaz2', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(106, NULL, 'amelican@colgate.edu', NULL, '$2y$10$Kd9fSAGtYDk3HF0Ys/8km.9MwbhV7fktwMXLyathnIKRqpdvA7YAq', 'NDWruXssOwTjY6oyenA6GxBbc8wpKwvmAfzuT3UsDn9YWJ3UTGDf0jBV97APpR8c6Zdb9pwKR2fNaJ67', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(107, NULL, 'etimoney@colgate.edu', NULL, '$2y$10$GRjoEVlNRF/upEv2y32oqe6ducVGRzkBJmuzZKXgcYbyWy/0o4N8G', 'r9GHckXuEb81mfdQPKWvupPSgBeaRvmkRHESDtYk2wfTBEIwtnyN1jBkkbMi4zCya3mz5Q7DM3DBcSk5', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(108, NULL, 'kbeatty@colgate.edu', NULL, '$2y$10$NjEBuItwgxLvxws2dHmWpO/jePw0Pt.fEGyKBVzkvBu7KuzV5aFMm', 'jZEJG8hwPFtrgAgz044UZCLcHwGXALpD3wv2lej1oS738m9WPrRvXgJNBSmAFTXb39ghHu6Df4fFqSCQ', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(110, NULL, 'kanderson@colgate.edu', NULL, '$2y$10$PCw/YbsMVlyyWon/TUI0vOogvqFAgzGIaYN1wmKuHJ3FCtEgSBPQu', 'tXuYM5HQPRSUo0LsDft1DESYQHbnDT0b3gbSQ0nLb5p6z7THRCVSRr1fmminQsW3hoUl9YOSOgHxSd26', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(113, NULL, 'gbreneman@colgate.edu', NULL, '$2y$10$MfeR1T9VHKCL442rCCawre/vIefZE5sKpWKckgo3IVDMiQ0fSfZ1u', 'I7vz4WHa6l5GuQmazQAZsquZ3nEVX9baadlB5aqpJkv153WCBATauRtAzWOgvG0Dd891FguEFWeWlIAt', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(114, NULL, 'ctroup@colgate.edu', NULL, '$2y$10$o5w.y7g.AM0DZ/s.fOMpaOd66QwaXNfCTdniNFaHkZ./xLOGHUTdi', 'Os5GFuAywbOFOWH3cAe3PGCuiOyy4AAEqmHVmQaTLcByyKqTSJRqeDEdLeVI4K8ULjtyDCywU01ZDcEG', NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(115, NULL, 'mbraasch@colgate.edu', NULL, '$2y$10$AivMBDZnDv6kKOFHB5r7t.p9X3rmAvHXuGuly31DoJArjHkAC3Zea', 'fnvzGC00AWvZ8pI9OtRbsgqrqWxvk5sQw3eMphmlpYKQyx55WUz5F0M9mp06ehxZa1tK2t1xCWVzHZfX', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(116, NULL, 'mgertsen@colgate.edu', NULL, '$2y$10$B4eTKhc6afkh7utJSsUVLev0fOaEpJsyYhwoyFjsnVuRtiHKvQSvO', '4CMY8spgrzTrmHYTSKB6r32rzg2IflVzKNBvjBNiPqMxXcmIRBb61QVUCXtdBEmgYlfKAqQbnWBmSpnD', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(117, NULL, 'cgimeson@colgate.edu', NULL, '$2y$10$QiZ2NOsxVByTmMJBPZFThu.S4rUUIA.hiN4GprQakdZ1qjniJafou', 'XTMi6QuzMCYLwC1G3QSkhMScsS2kDI1vLAcHsGTQAOCKNC7F2L2kPTcByMvXP1IrhfY5JUwMBiGYxURC', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(118, NULL, 'dmaynard@colgate.edu', NULL, '$2y$10$sxZB2TtcNNrF1RmVdfms7uLXvna9Jn/IHIaNU0holEBzXnGtSFnUi', '83ki6rkShaJ0XOF3wMvW0GPs3DShNh4tmiOKaliPnrCvjYNogfXQHxBwqkc8Nf3qPPYCuI0xFiEWkeOJ', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(121, NULL, 'emanderville@colgate.edu', NULL, '$2y$10$vZmdiVNeWLrHTVJ/G9b6tuvxVofWjxZcqfTDKv7fXGgO.b3ElYx/C', 'kuayJuAUX4QslICmGYY4xVSh04TOjYtknJ26HB17gJFJHHf78N3Y449AmSGpWHxfE9dsS6cHfSTbxIji', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(122, NULL, 'bjordan@colgate.edu', NULL, '$2y$10$r4vS6yOK7pAbSBkDjPES1uUzsCtzT4niBi8DP8pDKuFoT.sRLk9Je', '6ah6infNXC9CnwMAnYeNISRFpndTPonCPikKWybmAMiZwtO3VSWrFgHzyDIHIzVBz8IEl1CBDZfFkPQQ', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(123, NULL, 'asalvaggio@colgate.edu', NULL, '$2y$10$I0o6XShsjmzGo2dU2VTnHOoShvpffASaKdcNap4tqTYZaf.1..qx6', 'EuAZ1xm2B9N9FTCfbo01wIcXbwERJchAbeocBkzDps9oxfRiBPJ4usOYe5NleOVa5XV5gcHbkHfuolV9', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(124, NULL, 'ocallahan@colgate.edu', NULL, '$2y$10$WGOn3to1XEI87iossgJSjePSlCoHK6CqZmRZ1Tq9XTlPf6W5oGCw.', 'Rzl9xLQKsFeIe9Llt4Xd4HuLh15muZDFK4n2zsmZqTq9YnplIeK07RaSUctuacTnoQ8iIj9C5aqJPvos', NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(126, NULL, 'ddmckay@colgate.edu', NULL, '$2y$10$5B3OZTXcebFNZXDuR5GniePbelkvvFQS0gw6bRU8BlOfiI.ZjQoVK', 'gyWO7IfvubnXHmp1T5DaS6PeFRNn45uNRbQb2azsjVyoq0KzcJsQ23l8662rAf9hjAlQ8NpjJmO1HcHF', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(127, NULL, 'dgalietta@colgate.edu', NULL, '$2y$10$NhL1K1UgpzmI07mFkiPit.bDIi93QhdchHClqrRoquqLNrBJjGLa6', 'yWb532RUnF2k5BJqStSwahtQLro5t8CcLSBYPk92b8P7IrezCdF4o0wO8CLQktFmD5HLPAMwYq6ihoeM', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(128, NULL, 'mmiller2@colgate.edu', NULL, '$2y$10$K92t/DUTR4ei/S.c8LEz.uy311C2OS4B6WP5nKWKkQbSYtfTOcK.u', 'laiiVs0hrGWoGdm0nKaXpzxTXkeucGBvuYbbPOikSDRx1ngQOqg6Ji31JdEjjWAbqQwfVo66mwzRrOeG', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(129, NULL, 'sbickel@colgate.edu', NULL, '$2y$10$CTDGyZ/h/lpvjnhQosvpDOarJ5LVRxugRAcFAshy9lZl/ARFnSWGm', 'lvonwNaOsN9XjYBEq5M88Mlkclfpc5AmnII4UAg9ovAJAJg3oNPbEFZoNmmRFdoAO0VowIVR6GopHZjw', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(130, NULL, 'npotter@colgate.edu', NULL, '$2y$10$Jky4nPE3dKwpn9f4OEkCY.WwSjGcmT1P0O8GbVWnMiNJ.8h/s8COy', 'hTSY7nYBJvAqum2BVVuC8eFRVMfH3L7eWOxkkyuDNBDPH3y6aza2fZf4XT38MeC2QUXIkEsBduOE3n4Y', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(131, NULL, 'mfarrah@colgate.edu', NULL, '$2y$10$lm7SoiW4qtiF.pjjWa0iMetrhK72HWUqNwfCKZKysYO.CYcJVl.Ey', 'CpOOAPcq1byKgjxhhpiQAjIJ0LoKxjGVnU06AuYLuTgyrUAfdxf8phaLW9PIcpbmeIeqeOfP06nPia0q', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(136, NULL, 'lcriqui@colgate.edu', NULL, '$2y$10$V9Ihe/HNhqKlDYn29I2nj.CDt/5/ZlkkOonTeFr8lnZThiFZks.AK', '3LbKGEGsvjhu6STR0iuT7da1fun8Fk5pe23Vnt8Z3cbX9E2cwdd5XaEiEezehtOjefNihAeAt6dD0L9b', NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(137, NULL, 'ejklein@colgate.edu', NULL, '$2y$10$KDZ4oKvMA0ulAiCy967LFe8XlOncRRVbjjwkC598XyC/btPkw9CJm', 'fWY1ZaHNiDQsBpT3gL3SDbDO5qAYvIa9BCorjf45scxctDYi7SwStPepc25JMZMNH97amBh7FroU41NP', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(138, NULL, 'alowe@colgate.edu', NULL, '$2y$10$F6eN/J4boQIBxhx6ke2WPOzhh.R0n7PVQjhJAfuoCAfBlv9KTZUtm', 'JjWcoV4Y6Lwj8vveKqL0jnHXFXMLk0xiKSOEwxzNhQmYjBgdZdjjNfIiFtyov9IHrWanlOfWoqzm4rHO', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(139, NULL, 'bkolsky@colgate.edu', NULL, '$2y$10$S5JLRI29yKKEk5BvpEvQXujNDfWS4Bo82pdOii.xFWE.fl5RJF.Pu', 'BibBSRmNGeGufx6k4K1OJnr7GIgdMUmvcl29KKkh2Y6HTuk40zuqOwydHmC3TxVYLfZhVoHasr6C0RMA', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(140, NULL, 'hlueken@colgate.edu', NULL, '$2y$10$MOBCR3i7LCF9JvCrXxK/Y.lGmzEZZ1w6yg/IhhHKHZHt8KjfZuTBO', 'ps8pTfWCaGvI2j6n1K3eXi2CidgG6yKsXejapi3DsBIErhNr4DoIQ7bKV1ib8PBmJ7Y1uyGCF22LSi6o', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(141, NULL, 'aswilliams@colgate.edu', NULL, '$2y$10$GeYrwWNwqnHbu/NtoB4hc.IRQM5HAyPaW2rc6zxMEAKHCgaJxiLa.', 'RoDhh2fluxoZ6mMH87s1jB38gz1zuDZ66FIuPhLRlolju5rYd40mzZk9JZsoO2KFZievIetJte1pKiYd', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(142, NULL, 'kghavidel@colgate.edu', NULL, '$2y$10$FTTLwYkYBAtoox4lQGfBKeP2BuXnXlgnDWbrX.CkqLBS5no9EqWt2', 'RGpd0XaqdI61OiE3glgZoU5viL2xtBtovAKiCzA7D54Ku8MFmAH6iHeF5Pzepfk50Y8Ni4Cj2Vr519lG', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(143, NULL, 'clarose@colgate.edu', NULL, '$2y$10$wmL/9ZuzoQ/Ys4TCNd7moOhqHswqHSwj9sML1ocXsnbpY.So.poim', 'xZalHNsxCodkLDuybKNYdkD4N0R2UbliYc1WSgkPn854wIzEiM8od6GdC9ZpC3w9Pl4WFG4dnYkWSBm3', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(144, NULL, 'emackay@colgate.edu', NULL, '$2y$10$jiFB.FJ5gRUSddpQeHsmkOF9UeXAle7nQJ00BsjHSP0gaHuvk4tlu', '3WQgXyG1gafRaxJYsKOlozzy54x1sPZpH1UnYFGzqSHoJ6wPM8WGwHSLDfrWBqne2BzawjqN50RJgpLz', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(146, NULL, 'cquirk@colgate.edu', NULL, '$2y$10$6H.1r0rx6/Qh0g1tcwSKb.K4E/ZT.TlN8oLM2Plr7WDC2iyafgCau', 'nURAzeOv8TNrtq32zTyywVZW0cjakKQKJCz7iZ6a2PoUIWChOS1kYn1vLCB5IfDgrA9KNTlxVozxfbXz', NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(147, NULL, 'jwmcqueen@colgate.edu', NULL, '$2y$10$Nn4cRfAalcoPyeryNU9aHuucSLm6BiCeBf6BJTmF5vR/xINmJsr.i', 'nKOvCQxLlgWrbi7iSN6G7zVmQC5UTTl2q9oWNeSfec5ulrjWS1Y2HsvDcuuNoLGyBB7fslBuSEZYC4m3', NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(148, NULL, 'klarsen@colgate.edu', NULL, '$2y$10$QK3PuscogH/hUdMrsat/deEm7FoN0oXaPqLxsWZZ5XV2sMbD8BxMm', 'yOOqdWrMc7AYhccuL2pgsKNOs0yGydUamz5d0Wtmjz9ejWR991TXvxsjnZoVqM1y6mvLWm4FRzO06qld', NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(154, NULL, 'rdarrah@colgate.edu', NULL, '$2y$10$Lz84//LR4AjI7FLxZbKVJ.OQoZhYtO4dv4j1PvFBNGX3LRc6S8q3C', 'BV0mx9KniIGz6719ty1HRc2zLXS2H89GWlBKI85PjngZYIi2MmCDI56ZkOslE5gvBVVgxWL762DISmNB', NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(155, NULL, 'bqian@colgate.edu', NULL, '$2y$10$Mz7mLE/p8ztsgMSJpHESduJmqN/1wT7qzOr1kwSx7H2w3M/dgHs1O', '5rOe0GiWOnPyafcVgD9oCQc9nWYL7a4McigErlIvJVjnlPUap2Dq55Gxa0b0T8xy9UfIdBHXBlOkiNkq', NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(157, NULL, 'zwilliams@colgate.edu', NULL, '$2y$10$l4FOl6d.ywp3lMdXSH8aXeHblQ56MHkEhzyfUPFHiaDpQPxG59W06', 'IG9Uieq64nUCSx4bWzW6LnOk7zQPhg6htl0CDouRavjDTHTK7KRPC9qVO4g9shT13Br05G5k1O6mFwU6', NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(158, NULL, 'jdavid@colgate.edu', NULL, '$2y$10$21RXXRSCrkLptl6tFSyDUedOFpP0qrLMkHhkBDAZL7GXE8NlJNFnK', '9qDJ5OTd8vfxcb78efluDDDCyErgLEmcmeJ2k1SJJairccsmkiC12yVsjGSDyLgn9Xf6wqywJEAEvGNP', NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06', NULL, NULL, NULL, NULL, 'student', 3, 0, NULL, 0),
(159, NULL, 'conwayr@wfu.edu', NULL, '$2y$10$bwp9kAtMBkpQ5tfDZjFev.PIEHEv.8oOiMKVxBWCqi.c68yeIQOBG', 'YVQNcZUI509LKFQlroZSyc2E6JnaIj0juobJRwSgmTlGutUN0If9A532O3wMkkqbXVH2vQupvwiXZvq1', NULL, '2020-12-23 12:24:46', '2020-12-23 12:24:46', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(160, NULL, 'adamfm20@wfu.edu', NULL, '$2y$10$cFuqxz4qvP8OpBEJ/y5T0unJzxz2ZEiYvqqBVkBTXFm0.RI.u4JtK', 'jtpBPk1j5UYmnDi5zS8WisUDuxRTHzT2dwsWvBPHyHjO23HJtSsAVwbVaqwrpgefMa6ETTkp0h95l9Hf', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(161, NULL, 'adamkt20@wfu.edu', NULL, '$2y$10$FQ869VUvn597Mx7QOR6Pje5rpd4cIqWQ686X7enUkdyczGQST7Iha', 'Fpl30pDaVWdXI4y0kq82YCU8coy4hj3uLrOz8YGjAAy39KGL6RzAlKCSeVSzYBhBVJkUrTy7LIxg0aG1', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(162, NULL, 'adamqe20@wfu.edu', NULL, '$2y$10$id6dEIkeWLN/39OpSO73WenIEZlOcM3NjSR26s1nJDK6/UqqJb2qW', 'SYMjwcyLQyzNyHTrXlzclqg2LFqlGNvsfpSphTYXwBzZHYSFw2Lri3nvlw4tI50IT1fBJd8aItAAVTjC', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(163, NULL, 'ahmamb20@wfu.edu', NULL, '$2y$10$6tl2q6z1PNayTF8K1M6DMeCTvqbqncn836oGbNDVS7UncFA8U71x6', '1NO6S6VaCOvevI4d3hGuUZfau9HkY40Rbdsn4awOOLN64rIvDnjWjtPEcTD2mBChagz3Ub73CBR0gg6N', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(164, NULL, 'ambra20@wfu.edu', NULL, '$2y$10$Us5QjnyMbwCptytgY2/kEuePzNxk2b0wWlKV5Ra1cnm6yMlF1D1g.', 'IhlFNyLFmD9NGLixK54QkOC5MEb9FUs6tFKMbDzscI4cb5JRcWvCTM6Q3dwzxuojJeUIaN06gSxooSuj', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(165, NULL, 'ampop20@wfu.edu', NULL, '$2y$10$ovnofV5VIBqVteECYMkhSeYWxLK/Hg.nSUajbqHpacQRDzpitKHlO', 'zttQEQicIgUYPsm8A7FLUroGxoE39far2DJox7NmBVaHw4LJLIv96UtvkopdlBVtiHdk5apnjVS5wj2m', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(166, NULL, 'anden20@wfu.edu', NULL, '$2y$10$ElXP8tWCQdX7zN6dvkO5auT/K0E5oumuUk3GT7W3bBP.CY5y7dZPW', '5y4DJHiI2nV5huHqzHZt0bYOJHuRADPGFRdNV7bB27QL2QzMn5aeTDwx5JjEu01HOxysAkyrXUeJGsFa', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(167, NULL, 'andrwt20@wfu.edu', NULL, '$2y$10$QNZ4Edgqlg1TB0nQtsKXrOlMtN4satMZN0jBYwxKZJaekGYhg8z3S', 's0dbQzGnSHK2iY7LLFEzvHgxH2OU1P4VNJ1m8cu0zLYfLQKqu3mLDagHmEVXPaBgLAXPIL3ShNm6opkR', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(168, NULL, 'antojt20@wfu.edu', NULL, '$2y$10$x4yCmSIo1hiOYuFHMLVy/ubIK2aJgg4SeNmzQr5RPflrt/Rjg1tLy', '2TZjdDBXzxSyW810nmKQ2dDZPoAJTIpBaFD45WkZeHa2VhJJxW0gieW5nTjswsqeJspKEWBvTD6Gdhyj', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(169, NULL, 'ashj20@wfu.edu', NULL, '$2y$10$NOjHtjJcO53vG2xZ2bfe2.4vpMVDlOlEnRp2fe7fCuYNCa.dAqSw6', 'mxCi8haQYKMjVJoD8aGHoJKhpSkJqgDyQt46KFLhfFVdM0HZiQ5ozQaEbkSrI149C6DwDrEm60xEP79Y', NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(170, NULL, 'baadt20@wfu.edu', NULL, '$2y$10$4/c3cSpzY74sIwI09Z.9AOQe3m2t3MumjjEns0eyUJXNwxeTVmqHm', 'icLPS2leHa8HKezmjBIrC4DUzuyAnADmzlbhpBaAS6fyWgCvqFLGWVYjYgAdrT6hUVh65gTN8CroVKkv', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(171, NULL, 'balbme20@wfu.edu', NULL, '$2y$10$QH2pTTBrcGNuySnA0A37JOVk6TLbgw2EUxVq.QuJK7MxU29lUE45m', 'ar0ALCTN2CFunTY8Lh0lAQet7XClgaJhyI91L9koPu2e7nUW1qlJvjLif5VGhATSunSnQRJnLSSkBbSV', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(172, NULL, 'bankjk20@wfu.edu', NULL, '$2y$10$GaCmAdzxEfEOcUlUBMSBw.YUTxVvAuDvUnluASqCODmC.apEFNvU.', 'RAlTxD4bnw2MuEn96nnueyxjhW8aganJ1xVzIqyOIbzMWKOYyhNjxIj4qnNfW3cWrCTb869PbmDmb6Ic', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(173, NULL, 'berraf20@wfu.edu', NULL, '$2y$10$/BylFH/IDDlDF/EF/vehxe2KfegdPEi9y0OmEGNeyujSOev114Zb2', '79j2aRM79dgJnPM65BaBwMfpnsBww9jCPAKFUDy8mincWLq36Q3gNjeXIu3DuYxc1wVFYwtG8PbbpcDB', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(174, NULL, 'boehap20@wfu.edu', NULL, '$2y$10$9csoEdjJ5oS8NzjL0/mIound0cT/Vcuh94dscTxvDwc.ixX4os43u', 'd07bijRklw1qa7hl8oZ0UtpqxoPnMfEiJF5y0GflBwTK9j8CpUnXNODGNhB4QGm4Awj2OTk9MzpL2wGB', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(175, NULL, 'boehce20@wfu.edu', NULL, '$2y$10$n3lCXGJoDCL0M8aWj1NabuR5rBhll.pkXJHe/ubZvdrgIR.FpzHHm', 'bFnKwedfGj73Zvihbk02282pUuylppV6AVfrtCFwUQqVS1BEN2Z9H4gG0WKJcuZFXNC0xswVJZtdLqdI', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(176, NULL, 'bollkg20@wfu.edu', NULL, '$2y$10$9nn4lWH472XRg4fV7wvFieDbRMo4Dg5RfQ5ZvVT762EY.LCS6/KhG', '4ljfnf1C5a3GuwGB2GdyUK9zDmzyktdVh3UB6hcOlsNsSmKkxbdn4DK4x7WvslGU4uZyAv8gdXRarIKo', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(177, NULL, 'bragcm20@wfu.edu', NULL, '$2y$10$lvrs5pjeaC.HHRmgVSSTguRVxFljs3aSoJ7UqMZibiSNZ8rs3.W0.', 'pGT8y6DxpOZRc5K29I2elC5ikjuVj8OmJ4zBbddII5EtxFoQfAlpUuPJ6ykce80eE6rYfjEzk2ccDntN', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(178, NULL, 'bravpj20@wfu.edu', NULL, '$2y$10$zJgUO1N94sKDOwK5C4I0p.5axR6kcuN6RcsrYh83ANCFmfnu8vBa2', 'povo4gDMHIqh97O0hXU21tynS324YqJ5N70NjSuDOJjokwy1iVIMFoJ7asSWcuGdCOJpc6b4NYON8urB', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(179, NULL, 'brecpc20@wfu.edu', NULL, '$2y$10$2JhIGZ07kXD.CgntSE7icuFXVrYn8jMstRrYDnZ8B5Ca4SUk7ZdPu', '76KY0fO1F9vp7BNmUNbY8BaYKZ8w3DTwWfB8zlzk3GLCZpMHumfQkDC0a3KfPiQGx0DroK0u8XPdYC7O', NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(180, NULL, 'brenmf20@wfu.edu', NULL, '$2y$10$rpXeEeJ7.iS/IVqrAHVdie9bf/OZ./ErQXSvica.U.m/TX8P/RrO2', 'pe6YhiUswQr9B7RMTbWHGWVqWJobHdZmDJly8IzMiV6Pu9HCw357k9mjOoiZyyCE9gvW5ZcndopBji7v', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(181, NULL, 'brodjw20@wfu.edu', NULL, '$2y$10$QrBfUQeau0HNB7XC80PaOeeWpLDMeWI8FEKDe/Q3vtg1d8ExuNfYW', 'kj18rJDiSsq1NaTdSPDiq40uxuCb9VbiWzLTm9hzhkWMUE6xADkki92w52v6ZLjqUpK3dCUit5H88AZ0', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(182, NULL, 'browna20@wfu.edu', NULL, '$2y$10$GJuBaIsShZmu/dT9lfy0kO9ybj5VudnMvM8s/JC9lfFdQ5NyEPqYC', '1YgLZjUUWaeYmUJ3m014V6nFjRmYMsNhzFkYE4YvV6hodb7yelXl8u8HZr360U1exYsxTdJlCRmbc4Jr', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(183, NULL, 'butlas20@wfu.edu', NULL, '$2y$10$ID7.To54uHYhngh3ehDYdus6vzrxOC5/5kAAFR1v4MRiPrXtaLl8W', 'y6GgvsvoVb7UYdAT8DlEFqDIIhmpdEn0GE8W1OTSKwqcBJG5FPIrP0HiAtPqHrgP1WPtE2IJFQd2hHvk', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(184, NULL, 'cairer20@wfu.edu', NULL, '$2y$10$YleSB0PgYIK5bD8Nr34e/uGXw4KPNBd/9WqUSbTNtyFLVj7ODJFrm', '2KdpIYKHv3toTZH6c599B4dRbftJAhP6vxsk3R7OSITLANxFEA2bUGQuOUV9XAs9Yg9EgvMeyom7B9es', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(185, NULL, 'carscd20@wfu.edu', NULL, '$2y$10$eLVZ3xvEbNPbEcaOywTfvOGpXZBvAFLpm6XvWu0vDYWRL.Mqz/Glm', 'wdd762L2wLS84KSLlFB26QdCusd7QkUugrzVFRcdy9go8nh6n81ahrsShCtrTTYUzEf48vV4od5BMAYT', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(186, NULL, 'castga20@wfu.edu', NULL, '$2y$10$UiqBDgFZh.RgLk0rjIjGPey1x1CewIGk7.5pvNsZllNvebXnVd8Ki', 'ZQCkTXFoLRyBLTX0h21UaVAwDQyx4qI6XCuO0rpERiPYFGymIDs3ZUaQHYCeEaMkdqTdqZDlCJxp51ml', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(187, NULL, 'cateca20@wfu.edu', NULL, '$2y$10$GqRRObTlGj7ieEmIQ/SQseipsnLFyv8H2aArktLD7sfjRNtCLF0zK', '8aZ3pL5z1vA2JQgu7KdAuANEFYXdUUBjtBxZprjXY7fF7lIvyEscVVxKftVYjeJVFp80cM6wikhcl6Ru', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(188, NULL, 'catshj20@wfu.edu', NULL, '$2y$10$LFIjxVu9iEIvpMNftuv6IOZDpIa9SdUSiOKMRpe8400RCUmBebJ4y', 'uQqSvIMsWKZGqMgvse60Dzezy6zUWLfhAIBXPbdLCtF0AscZxMR7slcqzhC2cHJjaKir6WiBGf0kFwU8', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(189, NULL, 'cobbwt20@wfu.edu', NULL, '$2y$10$vW8XqIcgT3ntYBtNgB4iSezsvNWdYDEMamG9k9Iq.pIZureOY7MlK', 'LopImuBP9xZelpifVSruMYhpRS089zK9x7A3YZ7zurdVlfE2WsaA6Wvy6DxzHzOlEklNl8CqRreJt4qx', NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(190, NULL, 'coolqj20@wfu.edu', NULL, '$2y$10$E2J0A0hrS8oW0I5vkFD7OOKGNfiZd/.6xzwZrFYYsdHp0lOW5Z0my', 'bMCDBwlrAM8buvHBCiuYHtuB0KL5L87rTuXO4QMyg4ZJMMBTNtNaTW0ahXOeOaLOVTPiqKzZQx7Jthmt', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(191, NULL, 'costl20@wfu.edu', NULL, '$2y$10$V./Qcl5Y0/TBN3jt8R2gme..mjSvD5Gfy6Wd1usfq/V6xU28kadl6', 'oADUL3E1tJQVeqSbkIYwFYezwOfPilVzuw5ffwTS7FoQhzzrVSz9HbPVLOxLjTztS3KRAEQHUXrcIt7y', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(192, NULL, 'cranjl20@wfu.edu', NULL, '$2y$10$ew6.1Qg1KnheX4vhCq.y0OAp.9wNB7ZWDkHzMnesD.5juvb6QUHMS', 'hF85o0nLeiliuozhR69CTZnGLqJWYYRayDBoIhXKOJUhJDL8ACZNAy9hpvF176oHxOoMGUcXLCRT2PxF', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(193, NULL, 'crescw20@wfu.edu', NULL, '$2y$10$OzeOFc..Egi2wYs1yDKwIOal4hrbS97eLpgto7d.uc9S/a1iPWnAm', 'H2JY8mPpdA0PPBdI8hlSwQTo2IoLSYNAIDCPy6QqOIkrbkSBNgwOLWs5gYbFfe3BB9kfo3uMIVnmcmtk', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(194, NULL, 'dalyag20@wfu.edu', NULL, '$2y$10$uRwfhzMlbcHN4rOSfqPwqudst6QEI9FwqQPlTeSkf3em3a7Krho5W', 'XmC9wegha4ocax6MKIYCOGc5rcCvjsw24I26oopoiB0fk9QPVGxCNOaA5h41hDzCRwk9IF9gyNxFQ8W5', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(195, NULL, 'davijd20@wfu.edu', NULL, '$2y$10$jqSbibexvenuqL7s7iOMDuU.4vPklNIzMXDl.RULsNiIK6Gv/C/Ui', 'cgbracmOgJiyXHDsSmpWzRXNCzuLXlL1b5qtUk1k0Wj0xkqcWonpKAkW5a4Pst02idTcAYlquQk3nvKe', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(196, NULL, 'davit20@wfu.edu', NULL, '$2y$10$0TRRhZD8QENifccEXm44duc0wjEGXGXjpovSr9lr551vHNh2FrY3C', 'quCwkNi53Mko7BoXj6C3GOrjLoBuKZMJFH04cNBuJ2rQ9pD3EG5CpNuADUU28dYmh2EaCq9BK15gsgty', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(197, NULL, 'delmgf20@wfu.edu', NULL, '$2y$10$rgcyQg9iH7f/Uu1.WOJc6uwVJ53VyASiCXW8J7o8qHtWKZf50Qe6a', 'tK3r702I6vIONcR9uUJIurSRUH71TQC5iDYFXn8ltFi3ZuwDYGfyayP9e8DtTHNnd42hw2fGlOZTl4EJ', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(198, NULL, 'duboir20@wfu.edu', NULL, '$2y$10$vrrz.aZUiGCwDGWEshtatOMoB3GVZKGsMrvtnYpTjBUt2ZHTakZhe', 'GpSUCsuI1Klevms36bZSuFoFUKjaLVz8DbI9COBMJPxN79FWlaqBJUeaHa79U3nBvFiQ7TiGOi9CVVI8', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(199, NULL, 'ellijd20@wfu.edu', NULL, '$2y$10$N27L6UxENJKm1daRCwmmk..lNbfyUC7DUaTcekk3CT4Tho8Lcs/ZW', 'ilfJa50Azbl0d483iTUrd0kDSuEn7YFc4n1iXFlzKyagk65olLOmGzeaRzxaSnvBxVd4ZOWLGCOs5DlP', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(200, NULL, 'ellimr20@wfu.edu', NULL, '$2y$10$rLvJVjyoqRJ9890ndDcRFO.iv00l461kMV8s5JpA8YhJ.9BizXfrK', 'xV2jfGMx9krQimaEsBNPVsmbMQ8YEIUiksE4qg16Obf9wzjduljogU502mGiAaG7Y3Xp9iKBAZzMlfm2', NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(201, NULL, 'escrcj20@wfu.edu', NULL, '$2y$10$S.jWYSe9RwD5krfXJ3Z/bOCMl67b5B/LKMzDcZyHB1zKInFiXjSZ.', 'euOGqwq7nzRH7UMQvCntRNpwJLc6XSnxax3wUSPuFrp9xbAZQNE5QR62jMxsSaCKaPr8xXVrhXEJmDcR', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(202, NULL, 'everjd20@wfu.edu', NULL, '$2y$10$SifjBHcRSLljcgFpOdMmtuLVzWX4LlHYlmqMOKfQmbLw8h6/..gee', 'DQ9nP8ZQ1zNBGNCqrVB7htnehCh9TK2z8xLExT0ahJ9Kq3MEMJQ8MHXtbom9zBHCwqK7AQDoItUlCHyY', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(203, NULL, 'fairse20@wfu.edu', NULL, '$2y$10$WYk5pAuMzTmz8D4Rb.qQ7.WP0GmF2tyne4XfdoucQsTtNHHkrgOqG', 'ih3opRS8hguHAJAG1bcD1tjIKaycJDHsdaGwoTHFOWBPxIdjx8RTGuTDiVx1JjyzCpKLOGQgj8eRFwjs', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(204, NULL, 'forbcd20@wfu.edu', NULL, '$2y$10$X7xWi2T7eq1Ufy901rfhGuhntDmAbpwKdSkThuzqtPkng07KCP1gK', 'z60igETljYywDs6XI8sOkEvplCQ4L2Zd1jCWoQE6CoVKTT9YIlGQp6zfVTIiO6K0SelgI9IsIV1SU5QT', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(205, NULL, 'forbjm20@wfu.edu', NULL, '$2y$10$BZN5lV2samxIEph93b8WkuqIxu8H35S3iNrBqUN04MZSx1K5ZDDn2', 'Eg9CTklqkKq4e3DjVa7G8B1A018nCB5zYItHoFLffILG1hPvFEMFSKn5GKZxh55N766wDtAN06CnDgWo', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(206, NULL, 'franor20@wfu.edu', NULL, '$2y$10$ZhptR5VpMMubC4/dBKIyOu7ttvvfJ2PHEU754k3Np90sDgqmOtfKS', 'bWsgHNFkLf7127W9da0PIo6i4EDBGaMPHv5AO56CaFt4hNjM3whD5l036dT6y6YnQomiGvCsTgqUUjc3', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(207, NULL, 'frogms20@wfu.edu', NULL, '$2y$10$rXS.lwGWQEHNzhsq2s9n/Oig/7xoP89L20WT0oUWf8xVPLKQtF4RG', 'xXlPHEy4su3bdgcKHVAmlGQE0hTg2m5MRHvO703ewSecczz7xepTUlLxEhykFB8WlQAxw5b9ZGjRuX7r', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(208, NULL, 'furtdh20@wfu.edu', NULL, '$2y$10$Zj7kgyznEx.k5yIf6tiucO4mZMQCUvLxbH/EmLnMsVj4jlLdnf8cK', 'BZT1g1alZ3UhERT3F5wR8cJuyreG5p6ws3gfuN4MkUFWEVVVpGxYSTxmyE9Qhtzw1TzSUnwDdRXAOpgf', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(209, NULL, 'garnca20@wfu.edu', NULL, '$2y$10$TrjLvQEqZq6BCDgAtGDy3uXdDt6Rb3FTmkxGrlKWhrJ5RcuO3rVMy', 'A8I38RLPWoMmhfGvF13xzaaJ8tAJYf8v1kThEGak9gtCoVgqfyKgayg54wKeMCCRwBOqJLmFju589ePu', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(210, NULL, 'gillif20@wfu.edu', NULL, '$2y$10$fKtd4.rdXXPLgagXNqddAOJ2fZYEiBi75dyPKk1ZT4GQQ9.2t3Nim', 'himV8NTAtGodHXnFGxDnMdFpAXoYklpZcyTVTNqwxREwxEDxaCVxRl20obSYuuYtLv4L1rLceR2ZHN9c', NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(211, NULL, 'glaivb20@wfu.edu', NULL, '$2y$10$1QC6ANUINIz6GDmCTxcPZ.W23P2xmLFpYag1osN5Yx9rGAL8vUA0u', 'N7icyHOu4ktvbDV0v6eF0vwldipoK5pyFrlmqQobKQWlAhsESveUFH1mPwChXsjCDkcU1R2W20DPw7X7', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(212, NULL, 'glanrh20@wfu.edu', NULL, '$2y$10$L60X0xf/rJvAzZdCCqEO3OqMRMR.sRLas5EI42IE7F7XFxgDQkNsu', 'FH3GAqWU30qDHd4PjGpSNA3bWuKrJUXDUcRLfA0j2DTtVdWTufS4OFkWP4893dWLgvKD92dyP0fFjGWj', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(213, NULL, 'goldja20@wfu.edu', NULL, '$2y$10$iCwLDL1pNBkEPDh7AN47/ug5cBqi3jd6F3QTIgkm/UewpE.ZcW0Zm', 'ltkUgxSgYZqiDOk2coigWjLxVfiuLGVwlCIex4j7kJ7aVxAcciOtM1Zyo1HBwy5bim8mtM4HiPljxKoA', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`, `profile_img`, `banner_img`, `phone`, `description`, `type`, `school_id`, `status`, `last_access`, `streak_count`) VALUES
(214, NULL, 'goldjr20@wfu.edu', NULL, '$2y$10$v6kxxzLqFH60tgcRJ64NzOLDcrPp0ruiuLR9cx3x4JO9g9bhQYagG', 'guWVUmPXNaRO4HMxndc8c06PmlH5DvCH2BzDX7n6LTAFvGa3DCM5Z2L9DUIAQf5fARm9bXIhXoM8TuX3', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(215, NULL, 'gordla20@wfu.edu', NULL, '$2y$10$v/JVdDtt2Dgr0MIyjD.u5OczTqcIcT3TALSLOETgjj6x2YvfhHkIq', 'RVSigp6IA6uoIRkz7nYt53cuxxfD55WFFDwA2QmWNRW6HwGIK6QqzTViIM9EshJaMQin4o8Nh842HezG', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(216, NULL, 'grahsc20@wfu.edu', NULL, '$2y$10$Q0GSFfy6nkSe3cHW.O2KEer4fQJNUqS5VZhSMapHigE3YJW/ZbL1u', 'bXqiy84qws1R0MYRfKKUvmq1uh5wdMWGaHOEpavX64j2qavciUfVRpiAPP65tnYichVii8mOKiwV7uVV', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(217, NULL, 'grifmm20@wfu.edu', NULL, '$2y$10$6ohKy2Zq5ytFGG/dxapewOAqzbGQVJuw5aeY5GpTtxk1Q77Kzf7ie', '0dvQ2yivOWwBLLpM8Hep6xHiCObdG35osdgMX6nbNnqKpKiRw0wNW2QfkvXyKYRu3UdKX72bbtIQJZVO', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(218, NULL, 'gript20@wfu.edu', NULL, '$2y$10$NJSctTcUZqethqeIHtjSUOLBC.FMJrQCME3LSY5koMEnhlhI.wOkC', 'y3gljDAhvwLHa8auZKgQaimnUZcs20Fv1vxPFmcWsA0iav2Whkpjyxny2xpbBAHLhAt75HzgO0c6mokj', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(219, NULL, 'grovam20@wfu.edu', NULL, '$2y$10$Iu6necUl/8yC39xX.Jh.aejMbEYGzIJdhJYy5Piv20KVNJHAIA/ym', 'btXu2wym1aeBvSUWey7reCoemHYhjDXk0Aa2ngTnIwdD6Kt9yrRB4X3MqNJiI4vf23EipLMgklGxZ77e', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(220, NULL, 'hensjs20@wfu.edu', NULL, '$2y$10$eJ24JJw2EoAXNw2syXUmzeATnmuaibFZnKB1AgsgBw1b604DfQavC', 'g1Gd9742uFfLpkWxpLCvkukaisLlT3tAfwaFU8IYsGCs4uivSNouaM7GzyOhmJoyTuMoys83SeyMgnic', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(221, NULL, 'hillbf20@wfu.edu', NULL, '$2y$10$FbLmiMPvmAcsc8Hdo0dZu.O85K308fE3w.K5pjD9i4T.kkzOtcbqW', 'ai3e6an58GKO37d0Wd8N1oIp2zXGT292Y3ratPljqDTcP3Xnc0Kqiw0D1Ci4WPI7wJXykAMfMFi2fHkm', NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(222, NULL, 'hindda20@wfu.edu', NULL, '$2y$10$a6HLVGCjHsVwevG42kpN8.wHOhzTDM7VWMrN5JMTCxWJixhaKWCrS', 'nKV9C5e2o8sYlb3njRT1UqVDyAfvuTVgjHabCfkmOrHMGdiI5YTfl6ihUPVX13ppdlMzC1Hne9yaZjRA', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(223, NULL, 'holmgl20@wfu.edu', NULL, '$2y$10$HpbkprVp6g50H1rMn2ANmO/ZrQZiO/UqRNJp1P2n.572kZv.6HGKW', 'mDbIepjskZw62sbQIDcafpkfC7nGbeE7IqJB5aknvHT6crS3BRUYWj45FeQlKy99fxzgTBTTVadZWTlD', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(224, NULL, 'holtmk20@wfu.edu', NULL, '$2y$10$QpbDJHRjy2Yyk.e25cSkvOMIkTGCAg9oecofkLpvpHYfY826N6KWK', 'tsvFiqJoew4gqAEAWV731EfFKkW8RfmCm6uGcAhxzRWHyf55oHFntzt9KQSCyMWqakfvgh4bpHRv7pBO', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(225, NULL, 'howamr20@wfu.edu', NULL, '$2y$10$3HOngQfzMwRVNXigIdeSYujBzujxv9qLDUVjOduOCBRI/OqN3jZei', 'eadPjDKp3i5GtfQZ9gtYbvq3jnNFT3pmWa353kDY1OZFIctWB2VqmIr8ds7D9m76Q6bqGS1vdWN2xZrD', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(226, NULL, 'husipw20@wfu.edu', NULL, '$2y$10$NUyqi14SAEi57pcpnSsmGe3BTXX2e3wZlB/vf5/h9nbHLpI7wiiJi', 'M4vrCewLVJ74nyCX6rOTcQiL3QalK7I0UELR0UMlLVUVgNkmhFiOOz3xRn89iqXbArIc6iiCmat0Jh8l', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(227, NULL, 'johnjd20@wfu.edu', NULL, '$2y$10$TkqcFuSlfSw48bMCcLog.eoNTQ58QLGbITGNjqkZdCOKKWyVw5VRO', 'CYjXS7yh2Q3jDgde7Y3nuWtHMaM9XCoZJanRdFbhQvCOrOmTMNdPrU25RLhIMbDxwXMugyNVQAIY0lfJ', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(228, NULL, 'kahltc20@wfu.edu', NULL, '$2y$10$C29y9f2qRUu2OvtgJp93Vu3vLx65PwtmJiSdW9ek8gXnmDF6Pldy2', 'yDUMcXF285t35X0MrkxISoOIHRzPRG4MknEEeIl8hMW2atbIRXbw4Iwpd3Rf9cadYorR1cuIWqTjV6uN', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(229, NULL, 'keensm20@wfu.edu', NULL, '$2y$10$Ws.aMhlOC14rEh/kQAFxKO4c8jD31LxpIznT3efnxLzgUeOVdOMy2', 'uDQyKaRH6sYEqvXc8sKpFfmOnOKsXYkvNNkrBF1ksPIJq2L0YkbapVCuboGQtbEffpjAHubcmtNLD2M2', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(230, NULL, 'kijih20@wfu.edu', NULL, '$2y$10$VgxQxWRDxNazhnLJfcEO9.Tf15y79S1cmy2jmLGeen4h4UXB8zT5K', 'ZhzQmMUr0PW85d1XMRZOf2WAiF154HGDCxT7ipyO0HgD56rR604agqAM1Yx9gVEy8hkBHCLcJtrsr2V3', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(231, NULL, 'killbe20@wfu.edu', NULL, '$2y$10$R9TIdMyjrkGZS7/RkMZo7eVWS4U83KV1u4GZTJzae9bZPAhue.77C', 'DUvnbiQ5601WD6JJ2bzTJmrq2zkiDJC3lB5JpzEtTdB30NeL1DX8QNlxMGGaWwcxeC4TXZmQag5V3asB', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(232, NULL, 'kimro20@wfu.edu', NULL, '$2y$10$DYytWS0jdMb0veUPLIBN5eoiBUK3i46HiVf/.1keY7IkcRod0zeL.', '6ZmnMpaL47rx6a5QDpaoF0o2TPDUWrrrVHfwwBqm429hCq6e0R7gj7ALyYEp9NTiBh9ILlOiqBGzsK4i', NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(233, NULL, 'kitctj20@wfu.edu', NULL, '$2y$10$rtm1dtdPE9qno66s17Dwf.syDJq6Q9WrQPWZbfQjN/ndgZd1wqt0q', 'LAdDm5twwY2AB3IszAzkXpmIJrWmzRJx7T29EVH51nFdTxf5sFdiWRBtIX6GnBj9vQmd3HFNyH3SRgpC', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(234, NULL, 'lanclh20@wfu.edu', NULL, '$2y$10$MXuIFePmj5u5x9xJu0hJ6ek0mTdpwZKTtGhPcuyUIKi.oUjGwNyoe', 'eDwEhe6uqpYpNuykUIJVIHd3ohvuKykxZF3y8wXJwHxf7ellTe5LfNotNZq6rsv0NWNgfdaoTMkENqCP', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(235, NULL, 'layan20@wfu.edu', NULL, '$2y$10$X9SsWoMJSkrYYDmkF6sd/uCU19BPVml6NTlTifoyAk6.R0QankDUC', 'g6kSwegYoemSZI8yTYhOiabI0QcBY47c9v23pLt4QQiw02OH5bhAcsPN6TtisW1J6HiF8p9XivN4JBOv', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(236, NULL, 'lowdrh20@wfu.edu', NULL, '$2y$10$LV6xswn08Yh6EYVQOMF0ceMcjYtOg1PKFXMx9JV3eqBYPy4ZvbBpS', 'yQ21qtlMFIMdhCIsjTF39yLWksOKMd68h8Ge8aJzpC18UE3v71wKxmUmD0WKbrEHC87cLMcivmtfyMW1', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(237, NULL, 'marmcs20@wfu.edu', NULL, '$2y$10$yQQYztcsyvBCKtDmF8gHv.tN82m85Y5srjf7ILibboysxEk2OHSBO', 'LrDtem1AUrLyvjSnBi58J3eEE96GNsI7qvalWmXRYkTsRHyJBjubTNXb3FfDLqiOlAy6rjEI9otF3aWN', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(238, NULL, 'marsaj20@wfu.edu', NULL, '$2y$10$FkXMjlLZ14tmgzi2nx9NyOgVuN.d23i9eo1jN7MX0Iy9NtfIohImG', 'LWSNdqoB2M1cE8GkB4XXtJKD5Fgn7imAFfG1rHbPGayfSGOsqgElr8BT3uiYDWZGwYUiZTduw2wGEUfU', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(239, NULL, 'martce20@wfu.edu', NULL, '$2y$10$ax0oS5KDP.UZZnpSRRfmd.MFhpgKgLf7PD4ifBEFA8Fe68tWO58lW', 'JQWTAKkejXaa68rpP1ngYuuQOzEYIqKTqQ743ISDORxARiVxmKD0qAkKSTEVR5n1QYWIGMknVHlQF1Ys', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(240, NULL, 'mascre20@wfu.edu', NULL, '$2y$10$aLHwSGdajVcSGnhf.VIlauGiG3NJdmufq/PzJCXNVkN81aU5smW5O', 'X3MR4r1aeOGcQ878PMH1fZd5O3CROEbL0nz4VQYlqU5FofIH0eWIJbLJAYqCDH9h4fdzotqRtGnhW9k3', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(241, NULL, 'maxwhp20@wfu.edu', NULL, '$2y$10$fM9ROYMtYFmIH3hBVo3UXOV/NhJ8bMb/OjTJmLw9/jtSD/K2IsTSG', 'AqPc4hEvlDOQo7yRpkfLp7HstN1ZSF9hGvLk9uVde37At9JWZIbTkGROApVOYpVzxSj1bdy2TWtkAWY0', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(242, NULL, 'mcgret20@wfu.edu', NULL, '$2y$10$./zh.gp35pwB6hQ2T/QJ4eL8go3Tq.Zxg9PCBmUWVVSf1dugC3a/C', 'WYf07SBzKi16skZ1MEHr3qOFx2x2xrf8tIZbHQ8bRUPcrDWWGM4cxVBCqwKBg6VZUlzlp6AWXprDgXut', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(243, NULL, 'mcinca20@wfu.edu', NULL, '$2y$10$mZKBmkTppJNRLTHnrZsRNe0JnxBR5J10BNYceik67DNo/Z3fSLfPG', 'xez0881amJp0GUQtbpjLfbr8Tz2fGXjBGhi9dvrsnsTdacziMjuAKOfoQhn3KEw3IHkdSZNF3cGmJMhL', NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(244, NULL, 'mcwhaj20@wfu.edu', NULL, '$2y$10$aQDfXn1Kwl8V/3n49n7c.uIVGJVELhwGYMd5FPBzgh1ec5bSEb.tS', 'HvyDy6022QkjtKyLbnkj2MIo53MYaXEh20cj4Zj4S6E1oZLlim2JpflT5a5LCfbbYliXlSdlTqzFKMRm', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(245, NULL, 'medvml20@wfu.edu', NULL, '$2y$10$ly2Y7KdXpokuVEeLH5e8XOt0UwaRyBuSRyxmv2qAszfOJDmUvcsdG', 'vP7Cn75LpVVV3mB8nawJcpCG1tK9hOa7FlqDiyiuCxdGJzEUmoiNTuX1WLLsatJi5sP9twBYZhpFV18t', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(246, NULL, 'merrmm20@wfu.edu', NULL, '$2y$10$zdCVdZIxNE2XJ8JrpZ8poec0LFoXP/q8nGw/ub1zDhcMWXXqt.lLO', 'o9jZ34yz3wqm1HaWDqy91X49JlwljwgwiiJK2W086ECFvWmiUdpt0rT0qoB5qdL8VshLXri5gfyb9VIB', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(247, NULL, 'minacd20@wfu.edu', NULL, '$2y$10$4Gt41H1cIn2.M4iaCfNRXujUGHukxcghaXCc9XDNs40yWXlMml.ZK', 'SCUOZTqgjo9lEYvgQEbXBaBMFDHZ2cwmmFJawC6Snv3eTvZdFlUC5eh20UhRfXklQj4rUjx2Ds1GO2l5', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(248, NULL, 'montbj20@wfu.edu', NULL, '$2y$10$JLMWCCQqZJ0SOXlBTOiBN.NavIHsUsFgU7r4hKPgJnzzWFmU95.py', 'jsZgf1FjuUwJsEohawlkkzvOnzW075bWGT5s6zK67vVJswEgFR7nXLubOiQd6nGdWOtCuWmwz7JAhHOl', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(249, NULL, 'mundsa20@wfu.edu', NULL, '$2y$10$Cl7AKnQFAeL2D9OGiCsaNeBZENsgvGBOUvaEP4PS/D3BGn9.teA5W', 'lDFA6BmLPAYeE7XyaOFPtgJOI5UuLN0l1qMpzRGYMVHAuQQW2qkG1p9eN5pcoDD6gq66ETn7oNw3yOPR', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(250, NULL, 'murpge20@wfu.edu', NULL, '$2y$10$PSuK11Rsqhc4Qc15iKrjoOaxxzLk8JbZuQ9ZnTf.yNFtFVLo3KOVC', 'N9gVeHLvsbHVh4ycVBGP8iOjJJfMaTNlY43zsAgqHojFkPOimnZ1vlB56BW22XBdWggZSnnP3KQlFqsg', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(251, NULL, 'okpoe20@wfu.edu', NULL, '$2y$10$1J9r6s9OL7cG/RZivlEwve8aqJZZx0incHzWUB.PZBN99LKeyCOGa', '6vvZxXDRDMh2YeZ55je4ixkWISsJO7FpRU2YVbI5Us5tU2xk5CKFb78kLFBEb56dWkWZpOI7kM7joosC', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(252, NULL, 'olivcg20@wfu.edu', NULL, '$2y$10$xq/.ZOdbpVXMwYiVfrrfmOIW3Y6lzwUSJAG98YAXBt.0NvggIOL8e', 'hVJvT7e5OthUZYBEK4Vrr1M41PhYGpNkV8JG9t0gIozAFFZvShI5HpySxIuwvVvr2j2AeW9f2N1Czi0V', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(253, NULL, 'peteja20@wfu.edu', NULL, '$2y$10$urgNDSZDLYZ3uvoNjFKCqe2TSx0B9zQWCKDohw9HJ0uSdR6MQ1VMy', 'BGtuS7kFYbFU9py8jAGPWhAioiPm6ecaK3nCvFgHklXEnudANgmkpFoQYQPzswNZvoQKJW4qgRbnoOOO', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(254, NULL, 'petila20@wfu.edu', NULL, '$2y$10$vZ2tRlMlwX4Z8jurfsftQ.Dc4u0Ioh13Gx8slt5l/0BbqlYFXneeK', 'nk3KTooqc0KytnLaFj5gJXvSbNM2ijWwdpz8xLdSKL2fbBHcXioFCpBc9tGSyxlRlplvi3mXn2Da0ieG', NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(255, NULL, 'petocj20@wfu.edu', NULL, '$2y$10$GQwfHl8ZDNhOnRA0FPtHEOsUGloWIQlQhieNb2wLVszd50mIyeeS.', 'gnmwWqXPETIxbwEzOMQBYrhqAs6Rsnc3GW1OrKnuDvES8tWQHq03XdUMcEW49s9qxN8OuyUNzrdSQVW4', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(256, NULL, 'pilapj20@wfu.edu', NULL, '$2y$10$kvyHReBna0Qf.0O7LkCp7uRATgFn2e4k.u6XMqKUEO0kOz51G57h6', '9TEwyoEinizkWkiG2fICJytceiPmfA3VFrcGybciQAZMWI0Ap7Sa85wqany0lVxNdw2qHvUfi6X0TbJG', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(257, NULL, 'portjf20@wfu.edu', NULL, '$2y$10$xZpwEx5uUvHdC/nu0.1QHOhgX3J9Jkva389VGwYqvYNGr6lGGUPYy', 'jnL5uFHAnEJCLgGAayBUoUEbzatUkgkxC8uuinIO0EI14RA4Cf4bCySVl3bMzfcugUGZ9E4Ugq2qfM3Y', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(258, NULL, 'puryma20@wfu.edu', NULL, '$2y$10$Lq7ZbW5TO9EqrkgIAxilQ.D6qHPRXUG0nAFdt4jfspsq4Le/Gj1Z6', 'AR25hVR3FbPUjuPuTZCNhzAvuxNRXrzjfvsYfwuZriiuL2AtvfclPxUXp0mtFpsSC08tvLamLjrLImCT', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(259, NULL, 'raimtp20@wfu.edu', NULL, '$2y$10$iH8RVywOvTDvUKFDLV7zV.UE38XkduzvSb/OuaRUf/M46bHxTyMlG', 'NuLSzl32Ju59fPeEuJFqk8SbkO5RNT1a6mfXDDXVoeqgL5eqAsf61YL8BHlAsf1xBW8hjw8o7FxEMk4l', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(260, NULL, 'reinjs20@wfu.edu', NULL, '$2y$10$XNxCxWZiI9duL.4QiuDmVeyX.594OEOq6LbcBoXTsg0U13ynVkD1u', '31JB39RG8T7wQXMGShspRP0PTnzaUimY1t3Lq3PVjVtsIg9aP9jcre2Koj00SWY1n0xgNCI2DwqX3Z8G', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(261, NULL, 'rhodec20@wfu.edu', NULL, '$2y$10$qfSXhUrM26t9srJChmXtbeJUH742l..4ts2ISxNZ2EUk4lrr08Q9i', 'zF5h0FI62AQVuL4t24TCrANABXEcb5d6oIv1aWMTzfEVgSUFvTCTcVtA7Hw8XyrXpD7vFxmMpYbYhitI', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(262, NULL, 'robecb20@wfu.edu', NULL, '$2y$10$ziGx6dV1wfSA5UtJlkYQHeYGa9JYFiv.bMJD.KxtE1xrBdSzFQVK6', 'pM3UUEqS7fI9Y5GtszyFoZVg8ogDSWUpBf3yXkYcMNuQSpejpMwNtYF9f2GJqpC56BfF9ffaFGc9Zo7h', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(263, NULL, 'robeja20@wfu.edu', NULL, '$2y$10$NQvzJIVnPlyzAafMXH4udeGK9A1Arv8HH4EuLNlcoOrEQhoMPLdOu', 'IX4nX6HCQrsYeQylBowTqHwaQqdDuku9pmoUNWwIyK9FOofz9wtDf9Ey7EdzOtuA8EMrNrT2yH8Coohy', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(264, NULL, 'rogibw20@wfu.edu', NULL, '$2y$10$FuQkqFdA5Dtx8Nq3xGLe.uGazuNXbewGsqEiemF8M3qXhgMuc..MK', 'nbVQIc874ISrB9O2BtYQlW8OmMt4K1JjPuKvlPLF4IPc5SJ4KEfqsBnqqhkwWiatKngbD27jOFw07FTY', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(265, NULL, 'ruffgm20@wfu.edu', NULL, '$2y$10$AXZHLrvFc8cJ7PNBAFfktOn4RWNpL0m95leI3K1u4nj/vg27U59Jy', 'kCWadgrVT6BuU8bGWVuMVxILxYjFTcUREOXlmCDTaKsW0rP6l0ETeGSKio2bE85iB4jZGwxlhPHZIMSi', NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(266, NULL, 'ryannp20@wfu.edu', NULL, '$2y$10$iSo87XYHxfxfqwWhEVJrHuSyLB4y6Fqp/s62qJUXcZ6QSNYBFEOBK', '8CYJx49G6AEMTW97WLaNUnk51lfwG2nsWT5w4eS9oUs0yfrmXHqNk6ukBpg8Nv6ODaM8ES3yjbZ11hdB', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(267, NULL, 'saklje20@wfu.edu', NULL, '$2y$10$nNwhexQRDxf1lFBWxGqKfO14PGAzssGJ7uyJQLraOkmlhXjzaLFFS', 'sWjFlljqeeo7ckcM2rhbjn0FZRyKPp9OvJEmpTBfHCmmgIhRdORD0SS6CjZFjV0yHRuaWiMKcuuYDiMr', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(268, NULL, 'schwsr20@wfu.edu', NULL, '$2y$10$xtBNEL.VxkYSHoYuO4Jm.ezwvtMrEFECNMI/FwTvbORk5nw0QBVhe', 'gCbni1o5O9yceOVgSBm4g7SZQinNtJpffLnKeEQKCPiFuKpC6VwVAPJilWXx20j0fZrl2pbnykrroRHE', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(269, NULL, 'searoa20@wfu.edu', NULL, '$2y$10$UN7nYOqjmh1l/zjzWoSr8.c13BIt1OAG.h0sMPMQqCOOeTOlzTnlW', 'yAUlMZoGaMGVzo0TwdqudJtJzOnTwvQ5sLxfq9oLAN2HQOtmq0B36pIJ2MPVqieDawzDyq6i16RAZpaF', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(270, NULL, 'sellgk20@wfu.edu', NULL, '$2y$10$cxsCvJbFKH8xrhIQXCzweOj1gQ/zDafnE/OzYuLOW4CjkLn6Iuhk6', 'WeF9iGcM3cYrvuNOUwWs9Q85flnincEpM2PyTkr2OgFB6IeNtnad08SZZvZJBPY7rhwXdnje8oMJBZSb', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(271, NULL, 'slatap20@wfu.edu', NULL, '$2y$10$4XtmbYeBJLHVK/sJsT3hte62.fOlBUvLQafp5g0DRVDw5LzrBiU1K', '3msAPJ0oMP4UYFrUOnsMeblnrZpLLrH0cNFGw90xJSwfHpZONYLe5rp4q9uIgZJAtKN4vjJgOCznIGIF', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(272, NULL, 'smitce20@wfu.edu', NULL, '$2y$10$0r5o55Q36sRF1xUTIyN7LeV4nPsp7IqsO1P0E3NjjZ4sNTo/ADe8G', 'Ok4tcbXJeFQ1DPNwZrDUC63p1Jbosjg8bWGLsn2ceOdpgotVPryeykCfDF4YmAOpnFddSb9NQQ6frTGs', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(273, NULL, 'smoone20@wfu.edu', NULL, '$2y$10$On5v5ozlc7s4SJEHiMK8jeNRopnSC4Bj3EDac1P.56l4E1.rw.dam', 'jCm7elA2kniVqWBVqY0RG8mXhuNH5AIFM6HT2743jeK3L3tHwZfJ6UjolGYUmKBvvMkBT9iUyY3k0yPm', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(274, NULL, 'speaja20@wfu.edu', NULL, '$2y$10$ey1qIbFhqqRNlDEl5uG59.164iMB1CSXLlZx.T/IJJIWnu8987w5a', 'J8g9Ner1nCIO6tqBdr2btuTHJ8NJ7InV29YeEOFkmqEERQFG7jN9TTOXkocBKg0jR1KhsWQ7tFXUbRyb', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(275, NULL, 'squihn20@wfu.edu', NULL, '$2y$10$Cy9j/uJ3FhcNWQ/Hc.w6ie075BagZRXomnYcqiUXEbW5XIV6AMmSa', 'vuRuvUwHbjjUErAmfGov8x3j2Rson7RFHC4QcX8tMuG0mMFwXX5SmPlIanx5CNPRQOD8PGMvm0pnAqrE', NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(276, NULL, 'stewdc20@wfu.edu', NULL, '$2y$10$jqSCWVkqOpC5MbgNH0bOVO0md4iJ8vSRjNfqTi0emYt0igqS5bEZ.', 'kr9Jk9hweNkNEHQ12NrlVEohLpTrVyUb8ujmPxlWzVdSZ4L2Do4nt1USEfMKegxGywX6RGpbRUOgTo1J', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(277, NULL, 'stewdj20@wfu.edu', NULL, '$2y$10$mm3OLlPcrjuf5GWo9ozKweyWa62RUksUYw5QPuXnBbKc7kO/MxxDS', 'Rvy0lZZirvpJmQe3uTzKn4GwwhCSVpYR71Qa43oTzuFNqt6Xoy1crSGSCvt8htwnlHnTdkOwtccLMLoW', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(278, NULL, 'stirca20@wfu.edu', NULL, '$2y$10$/cYeMlc6rm4uOGOfxkwozeYD1VlXu7jz8xJtzsx3ElnP6nLnDt0y6', 'B3R8TpJwNRuF1ZZDPG6N1nucwk1DMt8dKD4TUx0WXZz6OtitL9RQhA9rcEtS5VqYk5TrOBsacG6UM9V2', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(279, NULL, 'stontm20@wfu.edu', NULL, '$2y$10$XbJJ27nANM9NKITaSCVnPe/MGokT9IGRgRCnClL43f7btyDWNY1Ay', 'EVUFiEyn1W4bZzyVCK0yQJ6flpmzpCNihNSrZ0oFMKTOM1KAfZ4pzOn0cyAvHqvQntuNGI1RbP8KAizD', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(280, NULL, 'stowok20@wfu.edu', NULL, '$2y$10$zvP.YDNP2kgxhM8J0I1bxORXmssWQK93.Ex5gpxrVKzxgV6gy0p5K', '3eraGSo5mmmqdGK6zokSY7XP1oTYdVbrvkShxCMjxF4dfvZA6KXPzJY7157yV7PeFVH7xwZ0EH9JcxIV', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(281, NULL, 'stros20@wfu.edu', NULL, '$2y$10$HK/k9vfEYtGAERmXBDY4KeynAZV83iSjN6cVJ9.CSKIKp/DpeeNuK', 'Gay1eR192qsfactwuZFTYFSxpEZJYXV8Qkz6qAxDWTJjbqPEaWXzXvFegfV4vZfQaLyA9q2YDVpyNUpf', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(282, NULL, 'tewam20@wfu.edu', NULL, '$2y$10$c.0BAqM8RscqMtNgsl3ajO1udWxMBx9C33GFpji95gHprZPdVxria', 'hfCrdjGjKXp6uiCx9NwRbEJqKoLwHXkRSYhEYkNq5nzYjhG1w3XyIrricGNSsz2HcLL1zD6vD9BqslIG', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(283, NULL, 'thomcj20@wfu.edu', NULL, '$2y$10$.D4FJWkRvT0W7/h2dU3dou/PCo/s/tJiVwIV8fFVaGdeV4g0yL6LS', 'FBsjRlzuu3NRNqhZ4vWVNr6dbiR0pA2g0273ApX1D9h19IYamtDiG7YGnVHv9IIf5wIYwQOkxKMLjZEw', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(284, NULL, 'tightn20@wfu.edu', NULL, '$2y$10$5BEnnHt4Tfruv1PEh5H6N.t7VrdnUhl4717NRi5Qzw8t94hva7G.2', 'wFAzccf6Ktl2wl5OgumnqDKwv4vr7eODwi4EiMnB8G2G7bXIBnAOx2vA5P1pJ7LuN3g0f0PHUyEpWrlc', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(285, NULL, 'tubbgi20@wfu.edu', NULL, '$2y$10$1mgO3Tb54kCl6fGJGTEXi.dK3miev1CsLy2HE4250KmehraTCwMlS', 'NQmBW6m6ycmRU6gjqe8NcuzyLID0XoiiBWIm0hzpnymZN6Y3JkfSTjFYm23Xg0AxJcyqsBd6dVZnfkSn', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(286, NULL, 'vaugzg20@wfu.edu', NULL, '$2y$10$ZGe19N1Jj1lm05A5I4heWOlXOIRU7UtMD/lAoLS740oJRPpPvVUiG', 'FrZuPRAzVfJREWeVbFRpPc2Ist5mKY7pqQLGaqO6ZhqT2zcBq9TbY8TGfHKvvcbhfCBiJSaDPN2fS65S', NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(287, NULL, 'vierkm20@wfu.edu', NULL, '$2y$10$Vb.Sj0xf2T14i8EntrJ19.S44mxk5dLPiSEcdN7p1j1LK2AX7jEHG', 'Tf7nXJWgs28ELMAwhbSiO888knLW3zrc1ky6FK1jVMexfHY6HoUk9dogV67pLD3ghvLJbFlT0xnchy3C', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(288, NULL, 'wadecs20@wfu.edu', NULL, '$2y$10$Lh0XscZq2vB2MTuOpLJ71Ob6pmYcH84brNO6tLi5z46sY8HmjwcKC', 'IC1plgSqPOETb1Ot3OjrlzImh9myEFoa0oQkuhP2O0FFGWkGdgUaG4aA4qoQoSD3sDCeewdJc68U0gjN', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(289, NULL, 'waymkr20@wfu.edu', NULL, '$2y$10$FYD9oRSYTpnRvzl1c1nW6.ZfrtNcdDsdytKSYJg2/WzwWnyy.d8tS', '02W1NXyYqflmTU5ucmTmc7nSRGGLvdrU3WsiKzfpDvpFcBKSHcw5RqIIGTzVRkPwVe7eJxnXSmJYPIKO', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(290, NULL, 'wilkbc20@wfu.edu', NULL, '$2y$10$5/WJO97Co6064P9JxLOds.hof/lI4DjB.O298s8SMuh81Q9.gATVC', 'JGcRFITHSFPjHlg0psunaA3IA5A6TCXTybOyJ3k2EoPeDZeEUNWYppQSPPg5xdOfEStSXbBd2DKsUWKY', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(291, NULL, 'wilkim20@wfu.edu', NULL, '$2y$10$xP.j8N0lr.YFRygcK8oe8ezRgiqyPouFlDKXeaxMF2hsiVBBBw/uW', 'HWWYnJN8wjE1VQ8p7syE4abONU5odk4VE5szJqEUI1BgoylD8mSwloZScfe4u9gKK0Fp8GJPB8U5DFNl', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(292, NULL, 'willdl20@wfu.edu', NULL, '$2y$10$gyDmmxHuHB/gPwgKvzvM2u/vq/JwiGqoFcJ5511AvsgLJ7j8UYJ8y', 'RbIcrfM0JCWyM875jbVTbf678YBMUWVzt3DWMAteUOcys2OTBqAD3rOQ7SVkc0Ng745qQDSgLl7fzzAi', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(293, NULL, 'willkt20@wfu.edu', NULL, '$2y$10$03k9DpKkm952y0vilP5qY.7YeIxw6nEOzErhI95wXjWiyaflXoI4G', 'mVGqGjfcmIWtuPdnUzZSammfD2egUuknENB7qxycnLbCiaAvbtJcFUEZBdjm0v18dktQWLvGRzLsjJOH', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(294, NULL, 'wilsck20@wfu.edu', NULL, '$2y$10$enBXXDk8TpJCvBPq3O561eEGbh/bCoRAH3T.hOeoME569CgUFFNYy', 'LsI0zL8adbFJXQKCdsfQHZReU60hIUX70nYoQjHP3qzBqsKz47gcGWiijpzi8PyIYLjmuxt8XLr1BpAe', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(295, NULL, 'woodrr20@wfu.edu', NULL, '$2y$10$o77/0rj7AClrfS2jbUsUsO4xEEcfw4JvlXzCXbC9m4ogVOZVbqfbK', 'sINmLzCODDbdrzLEa4rUPGvcdYRhRAIceyYzfaCb2NkFBFfUxR0sVeiLqltkCOm0kHtBP8qOOGWx4TmI', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(296, NULL, 'wootcc20@wfu.edu', NULL, '$2y$10$DsTijYyDSSAs.ffb0PjYR.n/4x6//PHqvU182FlkVzjktXRcoiDy.', 'nRaCMbNvRvmRDOF8arbgO31OcSqOKWjpM8o1MTzPaJAlx8Jyq2Cc7TR4GMEDdATiIOMlZdkQB6ZS0cg6', NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(297, NULL, 'yowm20@wfu.edu', NULL, '$2y$10$JUAsugAiBja9ndeWL4dg0ecKm0vT/86aTZO5d1EuMCPljAxsu5K2q', 'FtpqL038e5pEFHAN4Ome5VKvUkWXnIg8K4nV74QSYNZn1t3FE3ZqJlMlossWKHoOrTEigkpudWpXxel8', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(298, NULL, 'zuhrjr20@wfu.edu', NULL, '$2y$10$UEWveAg.gmQAYEkH3dHPqOR9gEfqZoDAgm9COh6U7TtH.CN9mx3lO', 's0zivO6sjZh0etuSV5jKIqNxT8BQdcfQAsoW4rdGW84HahNcStAB7bCmK9xlFXc6ZnOYgA2qyvvQtdn7', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(299, NULL, 'adleem19@wfu.edu', NULL, '$2y$10$iBLsrNks7tGl6ZiJjJFtdeZK1qs2oT/hSBSZ04uDcEtn2UuYR9Uay', 'DKn4GCsAG8gnYdxkN8CuZjDL1BffZ7VhpQEpufBIeQ2HPiQvFVA108x1J5Ps1vpE9HtqoZMDkqh7jcKx', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(300, NULL, 'allbmt19@wfu.edu', NULL, '$2y$10$IH2Sss9UPRyYKejyqJX9A.13l5eZlKZaH2VUHsfn4rXbWaIATDzva', 'wjyYb2lta6t1BBOyBoKhN1kNW6sTHnPNUnsLo2Hcg5WnrBmjvTqYnWRyihalOWwhM9RgzHiw8sJaGTRa', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(301, NULL, 'alstj19@wfu.edu', NULL, '$2y$10$KwKHVDq.TgDdiYUvPOzpHe.NWbY..l7qxf0an/Bt10OJQrViL4LT.', 'IkA1Xgg06GcSmr0h8USvC1nD7dAMK0vd49EkLkvNzauxndnldKm8A12yqWB5gsnjK83dRgVESYir6xBU', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(302, NULL, 'andrkl19@wfu.edu', NULL, '$2y$10$vZGXRyLV1sGHQKczrVOoceO61Vh04cKJoKjlDxOM/lbcZDtIS8C.S', 'WCrGMlowhx6kUrFo50qotEhFQN7LulVpCIul9EDeAZxVwPdvd1GIrmIJlvCUATxMIONSlwxdiHyOdjPm', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(303, NULL, 'ashcaj19@wfu.edu', NULL, '$2y$10$BM5Y3vCHfHIkrbZqot.JeOFTAKFwt0lAqiALg230bmq5j4pNbEtlK', 'p2IvE1qKU43z5coY68PbtMgGpwu6DN1pZEL3onoL9nYjwsn5A9id7Hpwnss3MuazNFw5ehvtEZBFymwF', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(304, NULL, 'baciml19@wfu.edu', NULL, '$2y$10$9j5VCyZCPqRzkvcVn2JN4uqm.6qs4oWG7QySvwJuA4g/vNsEA/5TK', 'XZDZ8jSQxvJ9pNwDWk2j0OVnnwrJBIHzK8Bfk9Xrsx1KFjLdmQvgrrVWZsTCxvSQFP1u1cLMzUBVObo4', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(305, NULL, 'bantsj19@wfu.edu', NULL, '$2y$10$C88l0aj0EvnLtPRLCE21y.yNhsMVHRHNW9aCkKXFoAkKepaOmC2Eq', 'trg2aWML9eKEOzaId5VoCUTnzdEGjtGkHSMRuUOBUcJ3tRPGhh08YAs9KS46oRI8YtDp9Cn0kAfEoib8', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(306, NULL, 'benane19@wfu.edu', NULL, '$2y$10$ODMPiu9kM.iZ/MY3Q/oBme2ubh3LoKFxa8rBLxYWK1bd.IELgdTBG', 'qw9g2IWcvpYUqcT9gSh7swXsFBm7FARGioAncwX9kTzJkANPTTHtvU6qmpmBJ79y65OMCuO3H15gUMYV', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(307, NULL, 'beniaa19@wfu.edu', NULL, '$2y$10$v.pMUueVzyvEQ0PQvPG63eorFAg5GYzqqcU7mJzuIoHZdC9svak4y', 'CWqLHHhFx26M2tCFKYwG3p2PNPQDE85M1ug7Tv0NlRKJLGsldPRdJgJoMLX8V0DUtHqtgaoMfwGsCNSh', NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(308, NULL, 'bennpr19@wfu.edu', NULL, '$2y$10$dKE1ukm98HAP5fxWLbTxk.J6k5OIkTYd5kHHvMLq8j8FSUG9POtIW', 'gRjxOMhkbSxhOUQVNPbsv0ZcVjh0tfCHrFoDIwylxi0LQz6csg8F2GIqsqOVyjdFYyqT8pI45jp3yrGu', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(309, NULL, 'browjt19@wfu.edu', NULL, '$2y$10$R9DISgYuAEmtgYLX1JjcAuC.S9XICETxMPHiZ0hkwXzTpTR7fswhO', 'u09i4OzAGFbebVVeJzar0l3WkGbXSjT0OtvCBA8nGEdhklrIsqT4hQQJ3Dd5IWIMX1GonEWRk8lhM53Y', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(310, NULL, 'campam19@wfu.edu', NULL, '$2y$10$EnwuzRcC86vukLB/b7rwnul7Twi7bazgQIYLAVLeLFmFQrMbCVjHy', 'O7pLgezhHnbazaNhYnyc3F1dWDarZvCJNbDXnoVeVOwfd3NXzkl9vwgtTm5C19lR0Uyiv0dend3Xop6V', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(311, NULL, 'campce19@wfu.edu', NULL, '$2y$10$rxcfJ.sQlI2wVgqt52p9n.39BljMZqfeRm6lTlpCjU3MxMzQlF5gu', '0nUF84fM51mt2I5yTcb5cza3GXnqlWMHWhp8vzdfJ7lUlj3ahnirFOeHc9yrOxgPaKGUiVMCxT0xB2uw', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(312, NULL, 'ceceaj19@wfu.edu', NULL, '$2y$10$ljshAA3eNynbNLs9Qi2Nt.7iMQlpmrosTqqWgFlIqu4EXtPbPXsgW', '32ztKChX2HaJzkuFQvJI294BaH9dlBPenL42rKNknx4xQpsofr8vmqJwHWIvIHk49vhobZXLi2IUvxn6', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(313, NULL, 'chanid19@wfu.edu', NULL, '$2y$10$K7NpUuUk1UYEgnUnENHHaeobsIDUiIgydgSEczuB6FYNVMizWk0BO', 'Jj9JEwg0AMJmWyuV4dynN8SlxGevDQh5qTSXEu99PliMRXpQcvVvFFy68mPpp8nHmxpujhI5KAyXjjyM', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(314, NULL, 'connjm19@wfu.edu', NULL, '$2y$10$9UyALjVmA/2GjUxVEUrhmuqsG/qfUp8SzzA3quoyi7Tb.GCUR2GBy', 'KHhsRrsE9OsLn7ZJ0kMIq9Q3d3F7c6oFMlPcwxzNdxwro2PDih1EP8rbCrO0cA7SfA52zOVtUBX0215w', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(315, NULL, 'crumdl19@wfu.edu', NULL, '$2y$10$axpApnhVDMTk1bOxxhtQsOMegleE4CnrTNjdXHwPeulnMnFV7Ov.i', 'p7QtzDTbScXuVSAUArreiQgvbOM7FW4N7Mnl4vzR5NmSLmZAsqDV6gmal3mUSkzzcmE4kow51bHIF0fH', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(316, NULL, 'dailjr19@wfu.edu', NULL, '$2y$10$bDStu2BZKkVnQq5GEnF4EO54miov4e3UZWTCPpHGaLWQN6XYoIPja', 'f1EWVDul5reQutQf8QuxPuUoMyj3PjE3LfKPp45IeGuTXoM0LO8xEuo1jnZAZs7eaqSOnCnffziVFCqj', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(317, NULL, 'dickmd19@wfu.edu', NULL, '$2y$10$i67v.lLl.2i/Adogj5txAOAMpN7JS2G2hnJKD1IjJmG4bI3wFSaYW', 'NTiRM4NAnQPF0wMhVxaUdmdk7UcW3kHBnnBnf0160UVuoX3fRvuwlJUOm14yoNOIUWfrL3pfVAjne7Fd', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(318, NULL, 'dutris19@wfu.edu', NULL, '$2y$10$MIhNhHZEbJceJX3mUMlow.8pkBMfWv/m4GNK8ELDrO9D1gzX0LoSW', 'R4E61Scd7PU7pkKLS9lPfvQo8XiH3qH0tg5yVwPGnPk4KVAF6OhSUhhiRdcz4SG9QbWdrEO6SdcoHrNt', NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(319, NULL, 'elkiab19@wfu.edu', NULL, '$2y$10$OUwOWnV9EMwBosk5.8hPtuz7p8ZO1U11MjjyJzs9dtHkto6xdliiu', 'BPdcujsFfjvcYBa7YuGQKeSkXEbBKZ3qexidKut6TPpELVflkW61rQZoWYSAkAfsZll0LA8QTi3CvYE5', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(320, NULL, 'elmocj19@wfu.edu', NULL, '$2y$10$Vexv2Tfdcpd3ZZ.DQ.Xdbe58ecrUIMIwnDhuXvbvrcdlDRiPvO.zC', '3MdSC3ZBdBCewxlynt8YdWoGKTNfU8LMeKVu5G0Xze85s081sI9aC1NE4dBmgd22bASeDkd7C7shydEs', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(321, NULL, 'essiin19@wfu.edu', NULL, '$2y$10$LAz4erVszsjN9TUcoD/gfu6LBLlNIAAAcwAfI4oF1DxRaU7dswSaq', 'QELUzzrW328u71fDfoERGhkcQUQ9GpEXv9kgYEYUROI1BcTYj2FEG6plZayDc09RZKxPhmvLEPoSQWJo', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(322, NULL, 'flowkt19@wfu.edu', NULL, '$2y$10$3RnYIU46UJUde1NryQ/Bou/156kef9C8Aw8GZKi3UzBT6Gsn6AEK.', 'CJnVkAnRAq1YyQkfRRlMFYqyTrOumaxWMsAhM9Rh2pyhmbfnkv0m6psoYdHPPtkN6ubJJRLkE2ewCOQD', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(323, NULL, 'forddl19@wfu.edu', NULL, '$2y$10$ubIcpcyioKMH9IUq9TareeSLLKL9RqfzDkIsmnVD5UGbr7Vg9x89e', 'Rbqdcl7oJ02OW72YrGSaGYHHvqRA7ZIUSw2u2ZmCFjesxPcysAS9u7VykOKcFV55DckIT9SuwRwQwnWL', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(324, NULL, 'foxmr19@wfu.edu', NULL, '$2y$10$znvKTwAxzbJrs92Q2IUJmezQ2WF5Ap9ejlPwDxScm7/lfBxFZi84u', 'USLtDp0ou031vfqtT5vLk5cfz8R8ypCTb1ubczzAHuhP3nM2JFXn3KqpmNWRZsBA3AGpYsF2U8zLdSsE', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(325, NULL, 'frienl19@wfu.edu', NULL, '$2y$10$ZLY4YMX9DsQJUCFwka5QFOpe10yCiICVlUeoqZgr7naMpVi0Uo4I6', 'jLwwqMXAplDcqjshJJ43Ssp1QE21dDDhfIkCSpvalfMs3EP4ILkENOKVFOI5OiWSKhEkyJGez0S27Lzo', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(326, NULL, 'garrmc19@wfu.edu', NULL, '$2y$10$MRyc9mDb5EZ8vFgr3ilXteWsYut0icvz6pOP5qkXRI8BhRQSv9IZu', 'SfQblRtQojPVRq1fNS4nF6LdFFUzNSaYE5lAGMW1VlS44YCwcZ4u4JAV7N94h9TFjkfpvNJDCcSx8nHp', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(327, NULL, 'gonzzr19@wfu.edu', NULL, '$2y$10$SxqMFStx4Cf5UwybopwASutUwuRyZ9kFkiiXvPGa3fJTpxfk1x/kq', 'yCcvB5kN7Jr0sMcTNv3HtPeeg65kp8UP8HuhRasJfeNMD5l7SUZGfg3vg8Uo2B2471iGvOD6VsmKMq60', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(328, NULL, 'gordda19@wfu.edu', NULL, '$2y$10$zBfY2.g3s2HohpB/MNQ0W.qZoPkNzsKCLs2h7EGv8SbxZj4akmNkW', 'piQbqwux0bQW30QYre3KHBoJdxAqb3ywjZccNe2dudHFuJ2QVMshtPzrLPaXrWMMWP6TxIcrKO4k3M09', NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(329, NULL, 'gracrl19@wfu.edu', NULL, '$2y$10$1Mlpcxo3XM94SC5YCKEWv.aM0KvBRrRSC/zqxAuUE42Ew3gJkWpW6', 'L6Au7bCbvSAr26iMaTn5V0rv00PUPdRgYlQU5PGmRC8EJrJ2Ph114qpvrenaVOr8Du2JaFApaIenyprp', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(330, NULL, 'greedw19@wfu.edu', NULL, '$2y$10$mDSNA74hdLXZURyAzNXe4eU5qTZW9cukF269wZkn22/gIn/IL0SkC', 'zV7cNPAzBcX9wokcddQjz6IoKreVNUCEn6keWjEo4Ibf5OI23RYpmxLT1hq4CAlf5qiV3aM9J5MvL2Xy', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(331, NULL, 'grounm19@wfu.edu', NULL, '$2y$10$PCIR9/eojdhYYHgJmRZo0.0KWS77DvYK0rM4P5nT9vTIPfoNwoaKy', 'Vfq3i7dPLMyzM71uOuFz3JkP3oy7xp0AvMxOOHb8P6y9fHUkwG7mESmQ3izxYGnxcGq09IHw062BPxuR', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(332, NULL, 'harrcw19@wfu.edu', NULL, '$2y$10$1BW7qwHqMkWDrqE7lkMmhOilvkxsB76aw8mTjJDIwAjsYgwbxOjkS', 'zC62YJMG13I3Bx95YlzA745Xa2nInmBcGTWTfDaXCnjpZGEsVoSPLBhtHV2Ri7svDpLds0UsoFMPczbH', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(333, NULL, 'harrk19@wfu.edu', NULL, '$2y$10$zYIspVpKf08NCCrb2gEC0u.UUoa/cIi6JkkKUPjRfhkiGxEbloPXK', 'AW6ivMUjM7vwVGhKO1jqcHDtnjEDqqu3r7iPjYrc6iegpGqn8MNi8s2c1QoT8oNd6Z4IbUejYIA2mAPg', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(334, NULL, 'hayskf19@wfu.edu', NULL, '$2y$10$m.f.HzorOCIy386KjjHKzON1s.aAsv2mR3MrCuqHICjDTKXQzzRTu', 'N13zWlv1VDhFrAlJfPEFsEU1glulPaB68vBgPMHUt1JPZ7RBKHoMVISggyGz6qBgA6514vlbuBtD3eIM', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(335, NULL, 'herno19@wfu.edu', NULL, '$2y$10$2FX9zORycHdm/F2ZCfjGDepf6uMFJjoXZeLpTFgT8yAOJwZxSFmZa', 'DRDhVELwUimihwb9RKFJgVf9UNDatD42L1ngAHMMm4MSi94tILjLXKtTaSaDp3L0FDZcoUXamQeLNMY4', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(336, NULL, 'hitecb19@wfu.edu', NULL, '$2y$10$oi/2dH1ysXwGB76xr85SFe8eyymQ5kH0Y0H5INI6/yO02rJdqvT1m', 'vvsV5lxC4QVEq6AbCjyqIHZMUIFlT4wi13abDthG8mcJX3GWLw5u48rZGlAiULIrv9VD7gwk7fMgDjur', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(337, NULL, 'hoara19@wfu.edu', NULL, '$2y$10$XMaKwvnv7P6oA/rp3jtMBeFsoD0AN1RV2flftvzBmedtbnmzVlmgy', 'g6ZMK4GAXBgRlHwbAw4ZIZqbL9WLtNnnIx6BkAYG4mjGAGgAoS6fSDHOTYpYoFop3U0ieQgrURfFk2jh', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(338, NULL, 'hudsjj19@wfu.edu', NULL, '$2y$10$g3uiV4rzG0rtxD9RwQASVueuAG.DqUNbGb4l7bogPwLZN0dkDAg2S', 'pegR9Jp8M4zCI2FlONIdH7e6OIRGHHWzlO5WXWv7FUFW3Pk8mSWDS1FovEP7Z1WFk8ueIZ5bKgEP5UAY', NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(339, NULL, 'hutcan19@wfu.edu', NULL, '$2y$10$BPKReYMEnIS2hSDnjKTz1uWPnzSQgeo7O5mWRLlupb4zY6iFqmLju', 'hfY2cfUf9r6xgGNGR63EnFPAnUwbqIpTjRlHTnbrpDzBz2wRmIAaxKdmhr9n9LzBMxm21RtRvCNQoHcy', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(340, NULL, 'ingrti19@wfu.edu', NULL, '$2y$10$bU2QDaerYAWatED57UGyjeDzK.pr98XeBigP2dhVW7xzWsQXfNOE.', 'F0UOx5o9fWYkVHm3psBMZEFx9PC3ADSvPGz2iuQcJocncEFmE7QuRyRjZQzZSbo5Kz4LOdrUi0QK7bJf', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(341, NULL, 'jalegj19@wfu.edu', NULL, '$2y$10$OLaHavv5jm6FL.KUtSOXNeNiYTh9OIhw7vypcfpmigxiRQEuAlX.q', 'yZz0DDbpQXIWsxP5uFLbQO62ZMXWz9haFMwLk3piug154JCdGiBJZzOJPvXiGEdNm55xAo9RlGbhX5X5', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(342, NULL, 'jonecd19@wfu.edu', NULL, '$2y$10$oIOjmaPGSjAhAGEdr/FX/OzjcGU22zNtwDps1qLkSBx5CFsOMCHnu', '7dZPGMjWMr60xasSJnjqUIQF3W2srqc7gP8SL5KAhIIVhz3pA1185M4MiBnCXSrFRIyOUftgveg6z8xw', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(343, NULL, 'kavejd19@wfu.edu', NULL, '$2y$10$oUi0dNtGM0Ayykqr1oUFt.eMPKxHVWCpvAHDtnLuovA0PCS6MEw.u', 'y7BFgq166uT6kGGrn1VaRXr6IVoaGIJ8fUsE6V18l1ew5CNRTQWsCJTVjUqwohAIhGWjOgwXeMPaLLXZ', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(344, NULL, 'kelllj19@wfu.edu', NULL, '$2y$10$AJtiYjSgBzofC4d4cAwTju8T2QaDBdMImFuGCxY7Id9rnuI/Hrqlu', 'PN0svneHubsLDWszNiiTtTHlmmYbxzdiHIQg1rmjrJ0hrhOblVS1tjeHnaGHEUjl2ckOUBfS8Kz2h4wC', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(345, NULL, 'kernmj19@wfu.edu', NULL, '$2y$10$GC7uJL9V5A/99lSmW.I6YOslWmd/BkDZu3m16/yDHURmFB.sQso0q', 'GNz7tXu7wgNDIUzfBkxyS4cdS9sUFfOQ8bzN5DIrjzvhoU5EtciYRLmO1B0m1PKD7WsYQHvmF4FrLAgH', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(346, NULL, 'kuehrs19@wfu.edu', NULL, '$2y$10$gyZZmAYoRhV5Inq/.L/s2eWWWGuBSt44cxIWat6A63k0bzDKpW9me', '2IKwD4b4fQAsyKQUMS84IboQCjB2W3hjEpUOEwQhGdzHkQX02498jZoBQxeuxpntaEAOcd08VW8q89cL', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(347, NULL, 'kwiapm19@wfu.edu', NULL, '$2y$10$p2VDrbI0EFEJRto2vQGe.ukLbusj4QqOCN8XDP8iMpzdWYmoohXJO', 'OFiYC9TWSDsAZboN3x7s9M2yEZpwGw6RBJ9SCDomgG2ZfqUst0YDtCAAU4HZfx0ExUeneLr7ORS2viVU', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(348, NULL, 'lancm19@wfu.edu', NULL, '$2y$10$l2QUb2iZhdZ62laVXaxH6O4IK3MCBnM6jFb4q6aieSljXMSPbcPUe', 'q4fCCcwmYE7b9QgFE6bpkpSsVLhXROVZWDEvOrDletUXpqdTjwFkuSk2QtQj5FneSW7hzBqkCrYTvG9v', NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(349, NULL, 'lopejm19@wfu.edu', NULL, '$2y$10$V2jN1SBzGIzmpi1QGc89DOpNbiheD4KCFE5PX8d8XppfwLrxxRB72', 'n7OK7rtmlWLmZDzukSzvUiJQgsyDLRDl5gr9grHcFMHYM9ESwdzz21PixlxRK9AXbuTeriWNVCdehc2g', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(350, NULL, 'lyncmm19@wfu.edu', NULL, '$2y$10$.DJCuPvrRYpq7x9WxveWUeL9WO99ug0FKXY5Pbqi3AGCvu0Z0r3NO', 'aPbbSyfWeO775uMcSvMYBPBT6qvjGu1mcxVYDWj6czkbEAuzwffr46nOV6LyexWMuYcd6rzVd8gAGPVh', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(351, NULL, 'macir19@wfu.edu', NULL, '$2y$10$r/SgP9v5PtLgJWFrFe5ddOBs4aSvIzyGcSxu.MPUEKHkZEcWdFb.q', 'bt4ZBcEcLdokCn4IU8cXpAWiGWzRbSoPbxpzlnNdUoAR6oMf6t69VGqY1bd78QZBHlJbv0tpSEVQArNK', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(352, NULL, 'maiemm19@wfu.edu', NULL, '$2y$10$ROgpUPTar/yDY.JzL.3TF.bb/lccCBMwdKHM7xyRgtS.WmbSHNVyy', 'OOWjfYZMbDtAeZrhdGHv3NYzwdDLkz1AIZBUq7nihjPlQXyn7eXxAcEdsGdX5jVM6PYVxBydKiBVf1ju', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(353, NULL, 'massih19@wfu.edu', NULL, '$2y$10$u8X48bvijvCZ90UyDZaor.cngl39Mnd4YdzxBOFTS5kAx7svXfsd.', 'n3vYOlXo27Wf4jAi4zD1kv7A4EAz3LEsr9LGJzEsGzx2VVurnl3H4D7xnigq6JnrLRb8wBhBxFp4xnkJ', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(354, NULL, 'mathce19@wfu.edu', NULL, '$2y$10$iI3zIa2yjQsUFIY2NNiFmOuMbvCJ.8c36uPXtiOQ4Wdn2ThlokyQG', 'mTinGRscpGzYfBXXfQHxzVrxu3PxCjyLciVvTPxvWhptcDdClscsu0iYGGYChW7lLMwwVFoie4atwpir', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(355, NULL, 'mccosd19@wfu.edu', NULL, '$2y$10$TZ0g1dElfJGZoKjCG47v8etDC2ClsvvcamA3LFd5ukSmgw9mwhFk6', 'hjFDx6TsSlriW20DzOzhDiLE0IHdtu9wLSEzeMGUB4qpY1DocEoMiNILRTQz08jp9hHT2jGzhLylF1Df', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(356, NULL, 'mclaje19@wfu.edu', NULL, '$2y$10$cWCnCvJ/b9EMq8vBKsdBMOWEj/PZ/MZrr88JqteE9wl6//68R0p1G', 'nsm8PvmzzwfoJJBVlWGazLiwWATiE3laOqaWtsdIbcMdYcjgq4VEybM96zsn2XnXiub0nLEHi3K7m4uO', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0),
(357, NULL, 'school1last@wfu.edu', NULL, '$2y$10$J5nRbGGPfnqW6brKiSZ0zOj08DjaOhxKosCbZG3UCjPIEr1z/euRq', '8n37yHNuZsrWyfrUiNaPWcBj0oW1B1nGvWS5oNbqTlOqrtcrG8BS3wqp0p9a3kTlexXrqrsrWkD95zy3', NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05', NULL, NULL, NULL, NULL, 'student', 1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_bulk`
--

DROP TABLE IF EXISTS `user_bulk`;
CREATE TABLE IF NOT EXISTS `user_bulk` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `email_sent` tinyint(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_bulk`
--

INSERT INTO `user_bulk` (`user_id`, `password`, `email_date`, `email_sent`, `created_at`, `updated_at`) VALUES
(19, 'HrkSdyaTUY', NULL, NULL, '2020-12-08 13:02:13', '2020-12-08 13:02:13'),
(20, 'saWXFvzj8s', NULL, NULL, '2020-12-08 13:02:13', '2020-12-08 13:02:13'),
(23, 'T3bElBRHQU', NULL, NULL, '2020-12-08 13:09:34', '2020-12-08 13:09:34'),
(24, 's6xT8u7yOU', NULL, NULL, '2020-12-08 13:09:34', '2020-12-08 13:09:34'),
(32, 'Agk1e6fsTX', NULL, NULL, '2020-12-08 13:21:18', '2020-12-08 13:21:18'),
(33, 'RdZ6zAjb3t', NULL, NULL, '2020-12-08 13:21:18', '2020-12-08 13:21:18'),
(34, 'QbPHSyj7hS', NULL, NULL, '2020-12-08 13:21:18', '2020-12-08 13:21:18'),
(35, '632272', NULL, NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55'),
(36, '403464', NULL, NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55'),
(37, '243101', NULL, NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55'),
(38, '871635', NULL, NULL, '2020-12-23 02:40:55', '2020-12-23 02:40:55'),
(39, '470191', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(40, '533035', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(41, '410860', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(42, '687896', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(43, '780183', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(44, '390390', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(45, '215037', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(46, '449846', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(47, '966266', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(48, '842124', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(49, '993600', NULL, NULL, '2020-12-23 02:40:56', '2020-12-23 02:40:56'),
(50, '790992', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(51, '371219', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(52, '878063', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(53, '270092', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(54, '122389', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(55, '376594', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(56, '560976', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(57, '114579', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(58, '923726', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(59, '442997', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(60, '778445', NULL, NULL, '2020-12-23 02:40:57', '2020-12-23 02:40:57'),
(61, '719779', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(62, '379374', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(63, '189799', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(64, '836721', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(65, '404416', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(66, '465090', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(67, '354496', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(68, '451256', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(69, '703326', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(70, '969511', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(71, '902957', NULL, NULL, '2020-12-23 02:40:58', '2020-12-23 02:40:58'),
(72, '183043', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(73, '287338', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(74, '923078', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(75, '308813', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(76, '515736', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(77, '856300', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(78, '442480', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(79, '625491', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(80, '301152', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(81, '404131', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(82, '204308', NULL, NULL, '2020-12-23 02:40:59', '2020-12-23 02:40:59'),
(83, '812572', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(84, '155359', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(85, '898443', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(86, '324433', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(87, '334026', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(88, '869356', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(89, '393326', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(90, '468350', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(91, '776192', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(92, '256458', NULL, NULL, '2020-12-23 02:41:00', '2020-12-23 02:41:00'),
(93, '348265', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(94, '994958', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(95, '446987', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(96, '586577', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(97, '605576', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(98, '239771', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(99, '469563', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(100, '408375', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(101, '640349', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(102, '489406', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(103, '819115', NULL, NULL, '2020-12-23 02:41:01', '2020-12-23 02:41:01'),
(104, '858256', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(105, '857264', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(106, '317320', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(107, '454580', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(108, '354768', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(110, '440106', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(113, '436794', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(114, '633377', NULL, NULL, '2020-12-23 02:41:02', '2020-12-23 02:41:02'),
(115, '900953', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(116, '774382', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(117, '743606', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(118, '207966', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(121, '184274', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(122, '803442', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(123, '436990', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(124, '292503', NULL, NULL, '2020-12-23 02:41:03', '2020-12-23 02:41:03'),
(126, '443807', NULL, NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04'),
(127, '374224', NULL, NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04'),
(128, '781338', NULL, NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04'),
(129, '424419', NULL, NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04'),
(130, '127272', NULL, NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04'),
(131, '145906', NULL, NULL, '2020-12-23 02:41:04', '2020-12-23 02:41:04'),
(136, '665797', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(137, '240620', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(138, '411712', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(139, '149498', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(140, '465795', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(141, '325659', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(142, '247476', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(143, '231761', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(144, '344560', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(146, '741096', NULL, NULL, '2020-12-23 02:41:05', '2020-12-23 02:41:05'),
(147, '993349', NULL, NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06'),
(148, '557906', NULL, NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06'),
(154, '688086', NULL, NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06'),
(155, '545874', NULL, NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06'),
(157, '592246', NULL, NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06'),
(158, '741145', NULL, NULL, '2020-12-23 02:41:06', '2020-12-23 02:41:06'),
(159, '682694', NULL, NULL, '2020-12-23 12:24:46', '2020-12-23 12:24:46'),
(160, '528495', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(161, '780517', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(162, '660210', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(163, '700512', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(164, '508901', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(165, '508029', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(166, '474324', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(167, '783558', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(168, '441034', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(169, '814951', NULL, NULL, '2020-12-23 12:24:47', '2020-12-23 12:24:47'),
(170, '194591', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(171, '644644', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(172, '625477', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(173, '947386', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(174, '186178', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(175, '912252', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(176, '140522', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(177, '137818', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(178, '482754', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(179, '973767', NULL, NULL, '2020-12-23 12:24:48', '2020-12-23 12:24:48'),
(180, '429509', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(181, '364169', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(182, '990963', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(183, '283578', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(184, '496939', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(185, '123386', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(186, '918691', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(187, '246054', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(188, '318256', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(189, '289159', NULL, NULL, '2020-12-23 12:24:49', '2020-12-23 12:24:49'),
(190, '266009', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(191, '964536', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(192, '364512', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(193, '705967', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(194, '462957', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(195, '670862', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(196, '584736', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(197, '782214', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(198, '248332', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(199, '142136', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(200, '583099', NULL, NULL, '2020-12-23 12:24:50', '2020-12-23 12:24:50'),
(201, '414573', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(202, '664575', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(203, '107199', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(204, '183355', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(205, '849311', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(206, '465033', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(207, '134071', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(208, '599079', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(209, '317167', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(210, '146552', NULL, NULL, '2020-12-23 12:24:51', '2020-12-23 12:24:51'),
(211, '856159', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(212, '151598', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(213, '481859', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(214, '314678', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(215, '180320', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(216, '246256', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(217, '845263', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(218, '730649', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(219, '266482', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(220, '700344', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(221, '308493', NULL, NULL, '2020-12-23 12:24:52', '2020-12-23 12:24:52'),
(222, '469589', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(223, '646711', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(224, '481647', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(225, '812565', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(226, '472931', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(227, '140751', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(228, '136572', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(229, '934736', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(230, '936073', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(231, '426184', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(232, '110395', NULL, NULL, '2020-12-23 12:24:53', '2020-12-23 12:24:53'),
(233, '483384', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(234, '545109', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(235, '485804', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(236, '877897', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(237, '872958', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(238, '170098', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(239, '911654', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(240, '854112', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(241, '349489', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(242, '614579', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(243, '702208', NULL, NULL, '2020-12-23 12:24:54', '2020-12-23 12:24:54'),
(244, '713146', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(245, '308397', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(246, '694050', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(247, '485467', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(248, '291530', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(249, '863533', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(250, '141338', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(251, '934569', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(252, '795394', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(253, '839191', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(254, '659860', NULL, NULL, '2020-12-23 12:24:55', '2020-12-23 12:24:55'),
(255, '741981', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(256, '461666', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(257, '484594', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(258, '998441', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(259, '959520', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(260, '411549', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(261, '371166', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(262, '844905', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(263, '722314', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(264, '197501', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(265, '264449', NULL, NULL, '2020-12-23 12:24:56', '2020-12-23 12:24:56'),
(266, '949892', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(267, '626271', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(268, '493606', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(269, '995009', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(270, '817093', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(271, '945698', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(272, '772997', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(273, '551235', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(274, '658756', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(275, '426513', NULL, NULL, '2020-12-23 12:24:57', '2020-12-23 12:24:57'),
(276, '334199', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(277, '220363', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(278, '915160', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(279, '365186', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(280, '561348', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(281, '126115', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(282, '169381', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(283, '655030', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(284, '989244', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(285, '945917', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(286, '822754', NULL, NULL, '2020-12-23 12:24:58', '2020-12-23 12:24:58'),
(287, '429702', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(288, '843206', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(289, '768793', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(290, '673419', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(291, '899083', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(292, '387603', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(293, '704333', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(294, '291590', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(295, '876868', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(296, '886546', NULL, NULL, '2020-12-23 12:24:59', '2020-12-23 12:24:59'),
(297, '250288', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(298, '707639', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(299, '375438', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(300, '922198', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(301, '877364', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(302, '642732', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(303, '441014', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(304, '763444', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(305, '167026', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(306, '111736', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(307, '318045', NULL, NULL, '2020-12-23 12:25:00', '2020-12-23 12:25:00'),
(308, '883067', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(309, '400504', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(310, '458824', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(311, '167217', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(312, '781680', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(313, '341736', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(314, '308145', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(315, '297365', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(316, '955877', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(317, '387286', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(318, '289373', NULL, NULL, '2020-12-23 12:25:01', '2020-12-23 12:25:01'),
(319, '916878', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(320, '571493', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(321, '885393', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(322, '304049', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(323, '743612', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(324, '934420', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(325, '217835', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(326, '379949', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(327, '484069', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(328, '167509', NULL, NULL, '2020-12-23 12:25:02', '2020-12-23 12:25:02'),
(329, '192128', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(330, '203712', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(331, '818542', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(332, '102989', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(333, '629227', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(334, '836718', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(335, '421061', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(336, '543017', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(337, '842095', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(338, '271859', NULL, NULL, '2020-12-23 12:25:03', '2020-12-23 12:25:03'),
(339, '484189', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(340, '308515', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(341, '523415', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(342, '389091', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(343, '494475', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(344, '580094', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(345, '854056', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(346, '337841', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(347, '942077', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(348, '532891', NULL, NULL, '2020-12-23 12:25:04', '2020-12-23 12:25:04'),
(349, '798410', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(350, '483941', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(351, '456884', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(352, '228237', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(353, '364231', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(354, '362595', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(355, '640839', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(356, '436163', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05'),
(357, '569779', NULL, NULL, '2020-12-23 12:25:05', '2020-12-23 12:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

DROP TABLE IF EXISTS `user_plans`;
CREATE TABLE IF NOT EXISTS `user_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'progress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_plans`
--

INSERT INTO `user_plans` (`id`, `plan_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(8, 12, 4, 'complete', '2020-12-07 07:07:03', '2020-12-07 07:10:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_plan_days`
--

DROP TABLE IF EXISTS `user_plan_days`;
CREATE TABLE IF NOT EXISTS `user_plan_days` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_day_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'progress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_plan_days`
--

INSERT INTO `user_plan_days` (`id`, `plan_day_id`, `user_id`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(22, 19, 4, NULL, 'complete', '2020-12-07 07:07:03', '2020-12-07 07:07:03');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
