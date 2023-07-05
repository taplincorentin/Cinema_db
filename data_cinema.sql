-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cinema`;

-- Listage de la structure de la table cinema. actor
CREATE TABLE IF NOT EXISTS `actor` (
  `id_actor` int(11) NOT NULL AUTO_INCREMENT,
  `id_person` int(11) NOT NULL,
  PRIMARY KEY (`id_actor`),
  UNIQUE KEY `id_person` (`id_person`),
  CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.actor : ~12 rows (environ)
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` (`id_actor`, `id_person`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 16);
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- Listage de la structure de la table cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_movie` int(11) NOT NULL,
  `id_actor` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_movie`,`id_actor`,`id_role`),
  KEY `id_actor` (`id_actor`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `casting_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`),
  CONSTRAINT `casting_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`),
  CONSTRAINT `casting_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.casting : ~16 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
INSERT INTO `casting` (`id_movie`, `id_actor`, `id_role`) VALUES
	(1, 1, 3),
	(4, 1, 10),
	(8, 1, 8),
	(9, 1, 14),
	(3, 2, 2),
	(3, 3, 1),
	(6, 4, 6),
	(6, 5, 7),
	(8, 5, 9),
	(8, 6, 12),
	(1, 7, 3),
	(2, 7, 2),
	(1, 9, 4),
	(7, 9, 5),
	(5, 10, 11),
	(5, 11, 1);
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table cinema. director
CREATE TABLE IF NOT EXISTS `director` (
  `id_director` int(11) NOT NULL AUTO_INCREMENT,
  `id_person` int(11) NOT NULL,
  PRIMARY KEY (`id_director`),
  UNIQUE KEY `id_person` (`id_person`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.director : ~8 rows (environ)
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` (`id_director`, `id_person`) VALUES
	(1, 8),
	(6, 10),
	(3, 12),
	(2, 13),
	(4, 14),
	(5, 15),
	(7, 17),
	(8, 18);
/*!40000 ALTER TABLE `director` ENABLE KEYS */;

-- Listage de la structure de la table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.genre : ~8 rows (environ)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id_genre`, `genre_name`) VALUES
	(1, 'Comedy'),
	(2, 'Adventure'),
	(3, 'Fantasy'),
	(4, 'Superhero'),
	(5, 'Drama'),
	(6, 'Action'),
	(7, 'Romance'),
	(12, 'Horror');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Listage de la structure de la table cinema. movie
CREATE TABLE IF NOT EXISTS `movie` (
  `id_movie` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `f_release_date` date NOT NULL,
  `length` int(11) DEFAULT NULL,
  `synopsis` text COLLATE utf8mb4_bin,
  `rating` int(11) DEFAULT NULL,
  `poster` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_director` int(11) NOT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.movie : ~9 rows (environ)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`id_movie`, `title`, `f_release_date`, `length`, `synopsis`, `rating`, `poster`, `id_director`) VALUES
	(1, 'The Imaginarium of Doctor Parnassus', '2009-11-11', 122, '', NULL, '64a52af730e026.34900708.jpg', 1),
	(2, 'The Dark Knight', '2008-08-13', 152, '', NULL, '64a52b03a3b6a8.97768462.jpg', 2),
	(3, 'Batman', '1989-09-01', 126, '', NULL, '64a52b3aa18fa1.55325493.jpg', 3),
	(4, 'Fear and Loathing in Las Vegas', '1998-08-19', 118, '', NULL, '64a52b2c821db1.99243583.jpg', 1),
	(5, 'The Batman', '2022-03-02', 176, '', NULL, '64a52b718debd5.78655407.jpg', 4),
	(6, 'Harry Potter and the Order of the Phoenix', '2007-07-11', 138, '', NULL, '64a52b62cb8288.72065012.jpg', 5),
	(7, 'Breathe', '2018-11-01', 117, '', NULL, '64a52b7d05eaf3.28058059.jpg', 6),
	(8, 'Alice in Wonderland', '2010-03-24', 109, '', NULL, '64a52b885093d5.09898348.jpg', 3),
	(9, 'What\'s eating Gilbert Grape?', '1994-04-06', 118, '', NULL, '64a52ba4593c97.54801399.jpg', 8);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Listage de la structure de la table cinema. movie_genre
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `id_movie` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  PRIMARY KEY (`id_movie`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`),
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.movie_genre : ~21 rows (environ)
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` (`id_movie`, `id_genre`) VALUES
	(1, 1),
	(4, 1),
	(1, 2),
	(4, 2),
	(6, 2),
	(8, 2),
	(1, 3),
	(6, 3),
	(8, 3),
	(2, 4),
	(3, 4),
	(5, 4),
	(4, 5),
	(5, 5),
	(7, 5),
	(9, 5),
	(2, 6),
	(3, 6),
	(5, 6),
	(6, 6),
	(7, 7);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;

-- Listage de la structure de la table cinema. person
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.person : ~18 rows (environ)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id_person`, `name`, `first_name`, `date_of_birth`, `sex`, `picture`) VALUES
	(1, 'DEPP', 'Johnny', '1963-06-09', 'M', '64a521c43d88a1.96760264.jpg'),
	(2, 'NICHOLSON', 'Jack', '1937-04-22', 'M', '64a521e0012c80.62059202.jpg'),
	(3, 'KEATON', 'Michael', '1951-09-05', 'M', '64a522007029d0.55124146.jpg'),
	(4, 'WATSON', 'Emma', '1990-04-15', 'F', '64a5221eb00ba9.54277833.jpg'),
	(5, 'BONHAM CARTER', 'Helena', '1966-05-26', 'F', '64a52240b8bf46.34206741.jpg'),
	(6, 'LEE', 'Christopher', '1922-05-27', 'M', '64a522657137c6.52521395.jpg'),
	(7, 'LEDGER', 'Heath', '1979-04-04', 'M', '64a5227f5d9627.73967847.jpg'),
	(8, 'GILLIAM', 'Terry', '1940-11-22', 'M', '64a5229c424a26.53140661.jpg'),
	(9, 'GARFIELD', 'Andrew', '1983-08-20', 'M', '64a522baa86b09.53792251.jpg'),
	(10, 'SERKIS', 'Andrew', '1963-04-20', 'M', '64a522d08967c4.64720182.jpg'),
	(11, 'PATTINSON', 'Robert', '1986-05-13', 'M', '64a522ea4ee7e4.52243485.jpg'),
	(12, 'BURTON', 'Tim', '1958-08-25', 'M', '64a5230b427d81.22229916.jpg'),
	(13, 'NOLAN', 'Christopher', '1970-07-30', 'M', '64a52327d7a4d9.40128356.jpg'),
	(14, 'REEVES', 'Matt', '1966-04-27', 'M', '64a52a6475d584.88280947.jpg'),
	(15, 'YATES', 'David', '1963-10-08', 'M', '64a52ab707bb12.03472632.jpg'),
	(16, 'DICAPRIO', 'Leonardo', '1974-11-11', 'M', '64a52ac48d4570.63255234.jpg'),
	(17, 'KUBRICK', 'Stanley', '1928-07-26', 'M', '64a52adcad3cc7.47454184.jpg'),
	(18, 'HALLSTROM', 'Lasse', '1946-06-02', 'M', '64a52aea512074.80018215.jpg');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Listage de la structure de la table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.role : ~14 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id_role`, `role_name`) VALUES
	(1, 'Batman'),
	(2, 'Joker'),
	(3, 'Tony Shepard'),
	(4, 'Anton'),
	(5, 'Robin Cavendish'),
	(6, 'Hermione Granger'),
	(7, 'Bellatrix Lestrange'),
	(8, 'Tarrant Hightopp'),
	(9, 'Red Queen'),
	(10, 'Raoul Duke'),
	(11, 'Alfred Pennyworth'),
	(12, 'Jabberwock'),
	(13, 'Arnold Grape'),
	(14, 'Gilbert Grape');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
