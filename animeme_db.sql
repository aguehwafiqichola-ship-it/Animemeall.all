-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 28 mars 2026 à 19:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `animeme_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `meme_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `meme_id`, `user_id`, `content`, `created_at`) VALUES
(1, 7, 4, 'cool', '2026-03-28 16:28:47'),
(2, 7, 4, 'cool', '2026-03-28 16:28:53');

-- --------------------------------------------------------

--
-- Structure de la table `fires`
--

CREATE TABLE `fires` (
  `id` int(11) NOT NULL,
  `meme_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fires`
--

INSERT INTO `fires` (`id`, `meme_id`, `user_id`, `created_at`) VALUES
(6, 7, 4, '2026-03-28 16:28:30'),
(8, 7, 5, '2026-03-28 16:31:53'),
(9, 8, 4, '2026-03-28 18:14:18');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `meme_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `meme_id`, `user_id`, `created_at`) VALUES
(7, 7, 4, '2026-03-28 16:28:27'),
(9, 7, 5, '2026-03-28 16:31:52'),
(10, 8, 4, '2026-03-28 18:14:17');

-- --------------------------------------------------------

--
-- Structure de la table `memes`
--

CREATE TABLE `memes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `top_text` varchar(200) DEFAULT '',
  `bot_text` varchar(200) DEFAULT '',
  `emoji` varchar(20) DEFAULT '?',
  `category` varchar(20) DEFAULT 'all',
  `image_url` varchar(500) DEFAULT NULL,
  `bg_color` varchar(100) DEFAULT 'linear-gradient(135deg,#0d0d30,#1a0a20)',
  `views` int(11) DEFAULT 0,
  `is_trending` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `memes`
--

INSERT INTO `memes` (`id`, `user_id`, `title`, `top_text`, `bot_text`, `emoji`, `category`, `image_url`, `bg_color`, `views`, `is_trending`, `created_at`) VALUES
(7, 4, 'n', '', '', '🎌', 'all', 'http://localhost/animeme/uploads/meme_69c80194a893c5.36122505.jpg', 'linear-gradient(135deg,#0d0d30,#1a0a20)', 77, 0, '2026-03-28 16:28:04'),
(8, 4, 'cool', '', '', '🎌', 'all', 'http://localhost/animeme/uploads/meme_69c814f7d85207.13007997.jpg', 'linear-gradient(135deg,#0a2010,#0d1a30)', 17, 0, '2026-03-28 17:50:47');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `bio`, `role`, `created_at`) VALUES
(4, 'KRISAIDER', 'aguehwafiqichola@gmail.com', '$2y$10$4VCxgt88PnUto1wrl1uBOeTOkKYXoWPIH0idqUy8EFspbMyskkNBW', NULL, NULL, 'admin', '2026-03-28 16:19:37'),
(5, 'admin', 'carloscon@gmail.com', '$2y$10$eSeon3aAuE.b0DD4.Ez.0eBhKuFkLD40yXjuOv4c7gfjetC.uIfsW', NULL, NULL, 'user', '2026-03-28 16:31:18');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_meme` (`meme_id`);

--
-- Index pour la table `fires`
--
ALTER TABLE `fires`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_fire` (`meme_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_like` (`meme_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `memes`
--
ALTER TABLE `memes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_trending` (`is_trending`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `fires`
--
ALTER TABLE `fires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `memes`
--
ALTER TABLE `memes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`meme_id`) REFERENCES `memes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fires`
--
ALTER TABLE `fires`
  ADD CONSTRAINT `fires_ibfk_1` FOREIGN KEY (`meme_id`) REFERENCES `memes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fires_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`meme_id`) REFERENCES `memes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `memes`
--
ALTER TABLE `memes`
  ADD CONSTRAINT `memes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
