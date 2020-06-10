-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2020 at 11:18 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multimedios`
--

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  `contenido` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `titulo`, `likes`, `foto`, `fecha_publicacion`, `contenido`, `user_id`) VALUES
(4, 'Como', NULL, 'lo mueve', NULL, 'esa muchachota', NULL),
(6, 'asdfga', NULL, 'asdg', NULL, 'asdg', NULL),
(7, 'asf', NULL, 'asdf', NULL, 'asdf', NULL),
(8, 'asf', NULL, 'asdf', NULL, 'asdf', NULL),
(9, 'dhhf', NULL, 'mdgf', NULL, 'mdghf', NULL),
(10, 'dhhf', NULL, 'mdgf', NULL, 'mdghf', NULL),
(11, 'hfgjf', NULL, 'fghj', NULL, 'fghjf', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profesion`
--

CREATE TABLE `profesion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `baneado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `baneado`, `nombre`) VALUES
(1, 'kimcho', '[]', '1234', 0, 'Kimchi'),
(2, 'Quien', '[]', 'soy', 0, 'yo'),
(3, 'yo', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Q0hHdjVFMHlEZ0I3NkVVUA$9YRYKCpA417nMci2D4YMgiIamYEnctI7lgyO5kmtUkg', 0, 'vez'),
(4, 'kimDios', '[]', '$argon2id$v=19$m=65536,t=4,p=1$MjlGWWd2cEZ0TnZSMU53SA$0MZqpHk0irUir3SBIVveEGuRmlAVD8Y9mipTn5UHd8s', 0, 'Diosito'),
(5, 'Arturo', '[]', '$argon2id$v=19$m=65536,t=4,p=1$SUYxM1Voa2tuYjB4WlJuYQ$X4qC5MkN18rh7dSy7yRFnlr+x9SGyZuoXxif391VHXg', NULL, 'Arturito'),
(9, 'Artur2', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Qk12cTdmSUFjRE1PUG9DdQ$uAS6a/5LLfZxnJnmUvpSwj6w2+x2lICW4Ld3iWZiM7M', NULL, 'Arturito'),
(10, 'hola', '[]', '$argon2id$v=19$m=65536,t=4,p=1$QmxEUmNEeWVNejYvWjJLUg$YccW+cOlN0mr8QJPC7c3Vu+BjN3+b3qCvGjO0GjTnK8', NULL, 'holo'),
(11, 'parra', '[]', '$argon2id$v=19$m=65536,t=4,p=1$MTFVQUpqZGlVVEtZUTBTbw$RpWGBjilr2Rg3CRRbH3sJg03Oyl1QglwnYdIqtizNRY', NULL, 'Se la come');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4B91E702A76ED395` (`user_id`),
  ADD KEY `IDX_4B91E7024B89032C` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_885DBAFAA76ED395` (`user_id`);

--
-- Indexes for table `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CBDAD0AA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `profesion`
--
ALTER TABLE `profesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK_4B91E7024B89032C` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `FK_4B91E702A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_885DBAFAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `profesion`
--
ALTER TABLE `profesion`
  ADD CONSTRAINT `FK_7CBDAD0AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
