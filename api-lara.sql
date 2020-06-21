-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2020 at 02:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api-lara`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nim`, `nama`, `foto`, `user_id`, `created_at`, `updated_at`) VALUES
(6, '1722498512', 'Jaya Setyo', '1592477467.jpg', 5, '2020-06-18 03:51:07', '2020-06-18 03:51:07'),
(7, '1722498513', 'Jaya Setyo', '1592479170.jpg', 5, '2020-06-18 04:19:30', '2020-06-18 04:19:30'),
(8, '2849398923', 'jajckekcowkgr', '1592479408.jpg', 7, '2020-06-18 04:23:28', '2020-06-18 04:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_06_15_041937_create_notes_table', 1),
(4, '2020_06_15_105136_create_mahasiswas_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ini Title 1', 'Ini Content 1', 1, '2020-06-15 03:15:48', '2020-06-15 03:15:48'),
(2, 'Ini Title 2', 'Ini Content 2', 1, '2020-06-15 03:16:15', '2020-06-15 03:16:15'),
(3, 'Ini Title 3', 'Ini Content 3', 1, '2020-06-15 03:16:19', '2020-06-15 03:16:19'),
(4, 'Ini Title 4', 'Ini Content 4', 1, '2020-06-15 03:16:24', '2020-06-15 03:16:24'),
(5, 'Ini Title 5', 'Ini Content 5', 1, '2020-06-15 03:16:28', '2020-06-15 03:16:28'),
(6, 'Ini Title 6', 'Ini Content 6', 1, '2020-06-15 03:16:33', '2020-06-15 03:16:33'),
(7, 'Ini Title 7', 'Ini Content 7', 1, '2020-06-15 03:16:38', '2020-06-15 03:16:38'),
(8, 'Ini Title 8', 'Ini Content 8', 1, '2020-06-15 03:16:40', '2020-06-15 03:20:43'),
(9, 'Ini Title 9', 'Ini Content 9', 1, '2020-06-15 03:16:43', '2020-06-15 03:21:11'),
(10, 'Ini Title 10', 'Ini Content 10', 1, '2020-06-15 03:16:47', '2020-06-15 03:21:32'),
(11, 'Ini Title 11', 'Ini Content 11', 1, '2020-06-15 03:16:55', '2020-06-15 03:22:11'),
(12, 'Ini Title 12', 'Ini Content 12', 1, '2020-06-15 03:17:02', '2020-06-15 03:22:19'),
(13, 'Ini Title 13', 'Ini Content 13', 1, '2020-06-15 03:17:06', '2020-06-15 03:21:54'),
(22, 'Ini Title 14 hapus aja', 'Ini Content 14 hapus aja', 5, '2020-06-17 04:10:03', '2020-06-17 04:10:03'),
(23, 'contoh aditya', 'congent punya aditya hehehe', 1, '2020-06-17 04:17:49', '2020-06-17 04:17:49'),
(24, 'ini punya jaya hapus aja', 'ini juga sama content punya jaya', 5, '2020-06-17 04:24:14', '2020-06-17 04:24:14'),
(25, 'title punya anak poris yaitu candra', 'content juga anak porissssssss ris ris risss porisss ccccokkkk', 7, '2020-06-18 03:44:15', '2020-06-18 03:44:15'),
(26, 'Ini Title 14 hapus aja', 'Ini Content 14 hapus aja', 5, '2020-06-18 04:19:48', '2020-06-18 04:19:48'),
(27, 'hehehekckwkc', 'jwkciekckskgt', 7, '2020-06-18 06:26:11', '2020-06-18 06:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aditya Agus Wisanto', 'aditya12@gmail.com', '$2y$10$tX81mvvsIdzozBtVA36HJehISnqc49eHIm11GsX/CRfbDV76vlJA6', '$2y$10$e5qdTyfHKRSrouUr1HpW0OKBSfIojc7pmaFnef02FLP9bNvxx13uS', NULL, '2020-06-14 21:30:57', '2020-06-14 21:30:57'),
(5, 'Jaya Setyo', 'jaya12@gmail.com', '$2y$10$.BnY7Wlbz7NexosPyHOk5.YFiccvzQzJWB3TEnzxc6ZrRLprRqiXu', '$2y$10$.Fcr/yl8.Wi2f0HfgG1hPOjFVZpKQP3Hc3a6VJffaOs.Qt2m.hfRy', NULL, '2020-06-16 02:26:20', '2020-06-16 02:26:20'),
(6, 'jskcjsif', 'kakcisjf@gmail.com', '$2y$10$3yZbpiUVfA6KqoBPhevrPeo1znnMAvQdufAtk2/ZgoKKmfwwi08Eu', '$2y$10$NmyY1h8ZhQ/DDGbeYOx3m.NKQCWDh58306kJTpiGfMY9EbttD63NC', NULL, '2020-06-16 02:30:33', '2020-06-16 02:30:33'),
(7, 'Candra Riyadi', 'candra12@gmail.com', '$2y$10$jZsa7mYAiXAI5da0woglN.ZLMXZj07uZ5A1b.gkTfZTRsBFylqJFG', '$2y$10$Ho6BthDyJ5b1YAmed/1fC.UgPDAQHJ.VCaaozoHR8Nl06fGEGpZSe', NULL, '2020-06-18 02:52:52', '2020-06-18 02:52:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswas_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD CONSTRAINT `mahasiswas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
