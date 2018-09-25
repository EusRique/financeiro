-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25-Set-2018 às 03:45
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 7.0.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `balances`
--

CREATE TABLE `balances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `balances`
--

INSERT INTO `balances` (`id`, `user_id`, `amount`) VALUES
(1, 1, 300.00),
(4, 2, 100.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historics`
--

CREATE TABLE `historics` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('I','O','T') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `total_before` double(10,2) NOT NULL,
  `total_after` double(10,2) NOT NULL,
  `user_id_transaction` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `historics`
--

INSERT INTO `historics` (`id`, `user_id`, `type`, `amount`, `total_before`, `total_after`, `user_id_transaction`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 'I', 100.00, 190.00, 290.00, NULL, '2018-09-06', '2018-09-06 04:08:34', '2018-09-06 04:08:34'),
(2, 1, 'I', 20.00, 290.00, 310.00, NULL, '2018-09-06', '2018-09-06 04:48:25', '2018-09-06 04:48:25'),
(3, 1, 'I', 10.00, 310.00, 320.00, NULL, '2018-09-06', '2018-09-06 04:49:24', '2018-09-06 04:49:24'),
(4, 1, 'O', 20.00, 320.00, 300.00, NULL, '2018-09-07', '2018-09-07 17:46:32', '2018-09-07 17:46:32'),
(7, 1, 'T', 100.00, 300.00, 200.00, 2, '2018-09-07', '2018-09-07 19:37:17', '2018-09-07 19:37:17'),
(8, 2, 'I', 100.00, 0.00, 100.00, 1, '2018-09-07', '2018-09-07 19:37:18', '2018-09-07 19:37:18'),
(9, 2, 'I', 100.00, 100.00, 200.00, NULL, '2018-09-07', '2018-09-07 19:38:46', '2018-09-07 19:38:46'),
(11, 2, 'T', 50.00, 200.00, 150.00, 1, '2018-09-07', '2018-09-07 19:40:47', '2018-09-07 19:40:47'),
(12, 1, 'I', 50.00, 200.00, 250.00, 2, '2018-09-07', '2018-09-07 19:40:47', '2018-09-07 19:40:47'),
(13, 2, 'T', 50.00, 150.00, 100.00, 1, '2018-09-07', '2018-09-07 19:41:22', '2018-09-07 19:41:22'),
(14, 1, 'I', 50.00, 250.00, 300.00, 2, '2018-09-07', '2018-09-07 19:41:22', '2018-09-07 19:41:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2018_09_04_000405_create_balances_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Henrique Camargo', 'h.camargo91@gmail.com', '$2y$10$YpYY7ow0nBMzh5BxniLC0ePsXXX4sEeoW1cG/37Nq2AplFf4TtdHm', '1henrique-camargo.jpeg', '7lN0vaSYNPOWFvwTqRtJLgodPUXSFZWPrEhh9IZn478g4UN1EpRxwrFS9diO', '2018-09-06 03:17:40', '2018-09-08 19:31:14'),
(2, 'Amanda Camargo', 'hiquesc_@hotmail.com', '$2y$10$IoaYlB7lti7QbUJmIpPbP.s0kGuae5XGHq/cWEqKsccB/D87MVyBy', NULL, 'n9mn6G0pvEpEvYB7TKCv354NQyYMWI6r2nXbQBmm4qmABhP399hx5RsRMLlb', '2018-09-06 03:17:40', '2018-09-06 03:17:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balances_user_id_foreign` (`user_id`);

--
-- Indexes for table `historics`
--
ALTER TABLE `historics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `historics`
--
ALTER TABLE `historics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
