-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 09:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartbudgetmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(255) NOT NULL DEFAULT 'USD',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `name`, `type`, `balance`, `currency`, `notes`, `created_at`, `updated_at`) VALUES
(1, 2, 'Main Checking Account', 'bank', 1500.75, 'USD', 'Primary account for monthly expenses', '2025-05-05 23:29:32', '2025-05-05 23:40:02'),
(3, 2, 'Main CARD', 'card', 1500.00, 'EGP', 'Primary account for monthly expenses', '2025-05-06 00:24:51', '2025-05-07 09:07:34'),
(5, 2, 'Main CARD', 'bank', 1500.75, 'USD', 'Primary account for monthly expenses', '2025-05-07 09:09:08', '2025-05-07 09:35:52'),
(6, 2, 'Main CARD', 'card', 1500.75, 'USD', 'Primary account for monthly expenses', '2025-05-07 09:22:58', '2025-05-07 09:22:58'),
(7, 2, 'Miza Card', 'card', 200.00, 'EGP', NULL, '2025-05-07 09:35:25', '2025-05-07 11:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `budgets`
--

INSERT INTO `budgets` (`id`, `user_id`, `category_id`, `amount`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(3, 2, 2, 1625.00, '2025-05-01', '2025-05-30', '2025-05-06 08:53:39', '2025-05-06 10:22:06'),
(4, 2, 4, 2000.00, '2025-05-08', '2025-05-30', '2025-05-06 10:14:26', '2025-05-08 10:45:57'),
(5, 2, 7, 1000.00, '2025-05-07', '2025-05-17', '2025-05-07 09:58:12', '2025-05-07 09:58:12'),
(6, 2, 2, 6000.00, '2025-05-22', '2025-05-30', '2025-05-08 10:46:40', '2025-05-08 10:46:40'),
(7, 2, 9, 10000.00, '2025-05-24', '2025-06-14', '2025-05-08 10:49:17', '2025-05-08 10:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('smart_budget_manager_cache_hassan@exampl.com|127.0.0.1', 'i:1;', 1746447038),
('smart_budget_manager_cache_hassan@exampl.com|127.0.0.1:timer', 'i:1746447038;', 1746447038);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#3b82f6',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `type`, `color`, `created_at`, `updated_at`) VALUES
(1, 2, 'Entertainment', 'expense', '#ff0000', '2025-05-06 08:51:43', '2025-05-06 08:51:43'),
(2, 2, 'Salary', 'income', '#10b981', '2025-05-06 08:53:39', '2025-05-06 08:53:39'),
(3, 2, 'Shopping', 'expense', '#00ff00', '2025-05-06 08:56:11', '2025-05-06 08:56:11'),
(4, 2, 'Updated Category', 'expense', '#10b981', '2025-05-06 10:14:26', '2025-05-08 10:45:57'),
(5, 2, 'Shopping', 'expense', '#00ff00', '2025-05-06 10:14:30', '2025-05-06 10:14:30'),
(6, 2, 'Shopping', 'expense', '#00ff00', '2025-05-06 10:14:37', '2025-05-06 10:14:37'),
(7, 2, 'Rent', 'expense', '#102cb7', '2025-05-07 09:58:12', '2025-05-07 09:58:12'),
(8, 2, 'gjf', 'expense', '#10b981', '2025-05-08 10:35:37', '2025-05-08 10:35:37'),
(9, 2, 'New', 'income', '#b71018', '2025-05-08 10:49:17', '2025-05-08 10:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_05_111944_create_personal_access_tokens_table', 1),
(5, '2025_05_05_124525_create_accounts_table', 2),
(6, '2025_05_05_124738_create_categories_table', 2),
(7, '2025_05_05_124912_create_transactions_table', 2),
(8, '2025_05_05_125101_create_budgets_table', 2),
(9, '2025_05_05_125159_create_recurring_transactions_table', 2),
(10, '2025_05_06_125507_create_reports_table', 3),
(11, '2025_05_06_132850_add_frequency_and_end_date_to_transactions_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '82907aedb90a98b6d2a5724bb9602da97fab9e8edad8fae24ebfa7c7587f59e2', '[\"*\"]', NULL, NULL, '2025-05-05 09:09:28', '2025-05-05 09:09:28'),
(2, 'App\\Models\\User', 1, 'auth_token', 'd76ed9216bae7c87a98863a6a1fec9232526506dd06873e8d9e39f49437e5e60', '[\"*\"]', NULL, NULL, '2025-05-05 09:09:54', '2025-05-05 09:09:54'),
(3, 'App\\Models\\User', 2, 'auth_token', '2995b251174f2f0a25519af95245095f3f3a9fab0191cf725bfa7c93a8b2505a', '[\"*\"]', NULL, NULL, '2025-05-05 09:10:16', '2025-05-05 09:10:16'),
(4, 'App\\Models\\User', 2, 'auth_token', '5f7bb49c7f24bd99346f7a640f1d50ed389bcadbf5111dca87328c74b441b2b9', '[\"*\"]', NULL, NULL, '2025-05-05 09:13:11', '2025-05-05 09:13:11'),
(6, 'App\\Models\\User', 2, 'auth_token', '3ade7fa980ad2c78d305b1931e7f6ef618db98c724fc721e844a10c11bbf0d7a', '[\"*\"]', NULL, NULL, '2025-05-05 09:18:15', '2025-05-05 09:18:15'),
(7, 'App\\Models\\User', 2, 'auth_token', 'd0e5796ebc71470ce2a6b131dedc76da5518063b7903b9c11d3d16736c6c5c68', '[\"*\"]', NULL, NULL, '2025-05-05 23:06:07', '2025-05-05 23:06:07'),
(8, 'App\\Models\\User', 2, 'auth_token', '9a9228d647343c6b3ccb9f038381881f5fd400499f40f13b676284401a557f39', '[\"*\"]', '2025-05-07 09:22:58', NULL, '2025-05-05 23:23:53', '2025-05-07 09:22:58'),
(9, 'App\\Models\\User', 2, 'auth_token', '387e9d014af4a7a3f336541a6e8afac0c35ceefab36dc55eaa0a58956d58e579', '[\"*\"]', '2025-05-06 00:02:26', NULL, '2025-05-05 23:52:25', '2025-05-06 00:02:26'),
(10, 'App\\Models\\User', 1, 'auth_token', '363382340830dc250731194bbb0e42aaa9b34a9440fafbc2d84e89f6413b3db1', '[\"*\"]', '2025-05-06 00:02:44', NULL, '2025-05-06 00:02:36', '2025-05-06 00:02:44'),
(11, 'App\\Models\\User', 2, 'auth_token', '8487db07f3a4fcb6b9a01411d887381229cdfa543e09254afcf942b38ac72d63', '[\"*\"]', '2025-05-06 00:25:24', NULL, '2025-05-06 00:03:16', '2025-05-06 00:25:24'),
(12, 'App\\Models\\User', 1, 'auth_token', '5069c2d2b0a08487e5e6f5c33d769c4abbd4fd74a8f9d9bef8f6d58aac371959', '[\"*\"]', '2025-05-06 00:29:07', NULL, '2025-05-06 00:25:31', '2025-05-06 00:29:07'),
(13, 'App\\Models\\User', 2, 'auth_token', '7b22075bd5ce03d46434450ea70e6d9743f9c9b1c04c3481ca9553f7742ca913', '[\"*\"]', '2025-05-08 10:51:39', NULL, '2025-05-06 00:29:18', '2025-05-08 10:51:39'),
(14, 'App\\Models\\User', 2, 'auth_token', '6d5078a647fbd218eb6cff86b0a4bea9133fa6641ed1437c8ae9d8c074784b57', '[\"*\"]', NULL, NULL, '2025-05-06 08:26:07', '2025-05-06 08:26:07'),
(15, 'App\\Models\\User', 2, 'auth_token', '48c010c7fc820391987faae457b722995a37ccd5b7c29c99838ea9a7b0408861', '[\"*\"]', '2025-05-07 06:47:36', NULL, '2025-05-07 06:43:16', '2025-05-07 06:47:36'),
(16, 'App\\Models\\User', 2, 'auth_token', 'b13f054096c2a1d832369f1acf8b473bcdcf5a5c6ec7386bc4219da827124eeb', '[\"*\"]', '2025-05-07 08:52:34', NULL, '2025-05-07 08:47:54', '2025-05-07 08:52:34'),
(17, 'App\\Models\\User', 2, 'auth_token', '192e8e1dc3522486c64e68759a56edbaa53a40e9d56ec7d76e936a42a6479ec8', '[\"*\"]', '2025-05-07 09:23:18', NULL, '2025-05-07 08:59:00', '2025-05-07 09:23:18'),
(18, 'App\\Models\\User', 2, 'auth_token', '04d74557773fbf8ac770161c407c34811f21942cf82efa512786247c5cde2fe1', '[\"*\"]', '2025-05-07 09:35:52', NULL, '2025-05-07 09:28:36', '2025-05-07 09:35:52'),
(19, 'App\\Models\\User', 1, 'auth_token', 'ed8a66ed2d56ac67f94762cee6406e4bcad18a78647bfcace800b61b5c63ef4a', '[\"*\"]', '2025-05-07 09:54:06', NULL, '2025-05-07 09:53:41', '2025-05-07 09:54:06'),
(20, 'App\\Models\\User', 2, 'auth_token', 'ca9c5adb8cf5871f775d7e8742d163fc135671e82922cfeb76ec30a978b7b931', '[\"*\"]', '2025-05-07 09:58:38', NULL, '2025-05-07 09:56:31', '2025-05-07 09:58:38'),
(21, 'App\\Models\\User', 2, 'auth_token', '0c6637ef543a6f510c3aaa24b7e64826f93f92d05dfc64f1da8a1bbcdd5b9e21', '[\"*\"]', '2025-05-07 11:08:32', NULL, '2025-05-07 11:08:09', '2025-05-07 11:08:32'),
(22, 'App\\Models\\User', 2, 'auth_token', 'fe9865d004a3daca6da71285dfe1c5b765f4fdc547f0382b0af41587dfe18701', '[\"*\"]', '2025-05-07 11:16:27', NULL, '2025-05-07 11:16:25', '2025-05-07 11:16:27'),
(23, 'App\\Models\\User', 2, 'auth_token', '7ab0922393b3a2e25f476e0c0ea4b8ce389aecd4b05201968123e23248553012', '[\"*\"]', '2025-05-08 01:27:11', NULL, '2025-05-08 01:09:08', '2025-05-08 01:27:11'),
(24, 'App\\Models\\User', 2, 'auth_token', '6f978c8c68fbc5d0a5cfb97870368ce9ac806a525fea6a45c03783b1aeb50d4b', '[\"*\"]', '2025-05-08 02:18:18', NULL, '2025-05-08 01:27:33', '2025-05-08 02:18:18'),
(25, 'App\\Models\\User', 2, 'auth_token', '0340e19c73a47f456e3c56289a27b324be807caf4aa1a35eac07dc8ca5aaab64', '[\"*\"]', '2025-05-08 10:37:33', NULL, '2025-05-08 01:43:21', '2025-05-08 10:37:33'),
(26, 'App\\Models\\User', 2, 'auth_token', '7f117c77751c164c58032847c4d5c8dd0d575f461f71feb09d4bb3229b4cbc3d', '[\"*\"]', '2025-05-08 02:31:31', NULL, '2025-05-08 02:27:11', '2025-05-08 02:31:31'),
(27, 'App\\Models\\User', 2, 'auth_token', '21d6e426b191752fe580ad6530de449097dc3b947dde56ff653259e3e9b109c5', '[\"*\"]', '2025-05-08 10:56:20', NULL, '2025-05-08 10:18:33', '2025-05-08 10:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `recurring_transactions`
--

CREATE TABLE `recurring_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rZdlGxjX13ExHsuwOqNOLQQE2DB7Rq6fkn24nvRn', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDBYNDdlSENUelNEMmFGc2g4clNCdGFibGFnaWh0MDczYlZ4ZFQwZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746619616),
('YyGaj6cq6qeCR3KIkoTld4GY0vvlYwqqeuwSaej3', NULL, '127.0.0.1', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWZUWXNHY3U1dFBEMkllQW1RZWhnTjBqSWJpQVZsQm9BRVhkNFU0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1746445962);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `payee` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `account_id`, `category_id`, `amount`, `type`, `date`, `payee`, `notes`, `frequency`, `end_date`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 3, 75.00, 'expense', '2025-05-07', 'hassan', NULL, NULL, NULL, '2025-05-06 09:18:49', '2025-05-08 01:53:04'),
(9, 2, 3, 3, 100.00, 'expense', '2025-05-06', NULL, NULL, 'monthly', '2025-12-31', '2025-05-06 10:30:09', '2025-05-06 10:30:09'),
(10, 2, 1, 4, 50.00, 'income', '2025-05-08', 'gdn', NULL, NULL, NULL, '2025-05-08 01:41:38', '2025-05-08 01:41:38'),
(11, 2, 1, 5, 25.00, 'expense', '2025-05-08', 'sg', NULL, NULL, NULL, '2025-05-08 02:30:59', '2025-05-08 02:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hassan', 'hassan@example.com', NULL, '$2y$12$75F8nikPtr2QNwZ0LIxfuekJ/ZRc2T1WyAhUgA9zRx9Hf2Br0SBWa', NULL, '2025-05-05 08:41:14', '2025-05-05 08:41:14'),
(2, 'Ahmed', 'ahmed@example.com', NULL, '$2y$12$HblcGga8pfqNDrOlLNW9YOedkHmtuGGmBH6bD546l/6yT/F2t.HpW', NULL, '2025-05-05 08:57:26', '2025-05-05 08:57:26'),
(3, 'Ali', 'ali@example.com', NULL, '$2y$12$V5XkEg8.no28MiGp0Ea/HOJDGEzrAeABCQRjxkg.kWLkJG12Vgvp6', NULL, '2025-05-05 10:56:24', '2025-05-05 10:56:24'),
(4, 'Mazen', 'mazen@example.com', NULL, '$2y$12$ov46hzO9/dGYJdI55Mp0aOzT9pS92a6V0JfBsSJhHQevttrOnl5lq', NULL, '2025-05-05 23:06:01', '2025-05-05 23:06:01'),
(5, 'hazem', 'hazem@gmail.com', NULL, '$2y$12$pwoGTX1H/Zq1txxbJn76Ruiliu4hXte1yNhSVFQqG2WV5uAyt89be', NULL, '2025-05-07 09:59:33', '2025-05-07 09:59:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `budgets_user_id_foreign` (`user_id`),
  ADD KEY `budgets_category_id_foreign` (`category_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `recurring_transactions`
--
ALTER TABLE `recurring_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurring_transactions_user_id_foreign` (`user_id`),
  ADD KEY `recurring_transactions_category_id_foreign` (`category_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_account_id_foreign` (`account_id`),
  ADD KEY `transactions_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `recurring_transactions`
--
ALTER TABLE `recurring_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `budgets`
--
ALTER TABLE `budgets`
  ADD CONSTRAINT `budgets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `budgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recurring_transactions`
--
ALTER TABLE `recurring_transactions`
  ADD CONSTRAINT `recurring_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recurring_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
