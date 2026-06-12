-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : ven. 12 juin 2026 à 12:31
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
-- Base de données : `hotel_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id_chambre` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `statut` varchar(20) DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id_chambre`, `numero`, `type`, `prix`, `statut`) VALUES
(1, 101, 'Simple', 350.00, 'Occupée'),
(2, 102, 'Double', 500.00, 'Disponible');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `telephone`, `email`) VALUES
(1, 'BOUTA', 'NADA', '0611111111', 'NADA@gmail.com'),
(2, 'AAAA', 'Ahmed', '0622222222', 'ahmed@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `mode_paiement` varchar(30) DEFAULT NULL,
  `id_reservation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id_paiement`, `montant`, `date_paiement`, `mode_paiement`, `id_reservation`) VALUES
(11, 350.00, '2026-06-01', 'Espèces', 21),
(12, 500.00, '2026-06-02', 'Carte bancaire', 22),
(13, 700.00, '2026-06-03', 'Espèces', 23),
(14, 350.00, '2026-06-04', 'Carte bancaire', 24),
(15, 350.00, '2026-06-05', 'Espèces', 25),
(16, 500.00, '2026-06-06', 'Carte bancaire', 26),
(17, 500.00, '2026-06-07', 'Espèces', 27),
(18, 350.00, '2026-06-08', 'Carte bancaire', 28),
(19, 700.00, '2026-06-09', 'Espèces', 29),
(20, 500.00, '2026-06-10', 'Carte bancaire', 30);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `date_arrivee` date DEFAULT NULL,
  `date_depart` date DEFAULT NULL,
  `statut` varchar(20) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_chambre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `date_arrivee`, `date_depart`, `statut`, `id_client`, `id_chambre`) VALUES
(21, '2026-06-01', '2026-06-10', '2026-06-12', 'Confirmée', 1, 1),
(22, '2026-06-02', '2026-06-11', '2026-06-13', 'Confirmée', 2, 2),
(23, '2026-06-03', '2026-06-12', '2026-06-14', 'Annulée', 1, 2),
(24, '2026-06-04', '2026-06-15', '2026-06-18', 'Confirmée', 2, 1),
(25, '2026-06-05', '2026-06-20', '2026-06-22', 'Confirmée', 1, 1),
(26, '2026-06-06', '2026-06-21', '2026-06-23', 'En attente', 2, 2),
(27, '2026-06-07', '2026-06-22', '2026-06-25', 'Confirmée', 1, 2),
(28, '2026-06-08', '2026-06-23', '2026-06-26', 'Confirmée', 2, 1),
(29, '2026-06-09', '2026-06-24', '2026-06-27', 'En attente', 1, 1),
(30, '2026-06-10', '2026-06-25', '2026-06-28', 'Confirmée', 2, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id_chambre`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id_paiement`),
  ADD UNIQUE KEY `id_reservation` (`id_reservation`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_chambre` (`id_chambre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id_chambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_chambre`) REFERENCES `chambre` (`id_chambre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
