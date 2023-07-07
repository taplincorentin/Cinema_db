-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;

-- Listage de la structure de table cinema. actor
CREATE TABLE IF NOT EXISTS `actor` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  PRIMARY KEY (`id_actor`),
  UNIQUE KEY `id_person` (`id_person`),
  CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.actor : ~12 rows (environ)
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
	(12, 16),
	(13, 21),
	(14, 23);

-- Listage de la structure de table cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_movie` int NOT NULL,
  `id_actor` int NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_movie`,`id_actor`,`id_role`),
  KEY `id_actor` (`id_actor`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `casting_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`),
  CONSTRAINT `casting_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`),
  CONSTRAINT `casting_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.casting : ~16 rows (environ)
INSERT INTO `casting` (`id_movie`, `id_actor`, `id_role`) VALUES
	(1, 1, 3),
	(4, 1, 10),
	(8, 1, 8),
	(9, 1, 14),
	(12, 1, 17),
	(3, 2, 2),
	(10, 2, 15),
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
	(5, 11, 1),
	(9, 12, 13),
	(11, 12, 16),
	(12, 13, 18),
	(13, 13, 20),
	(13, 14, 19);

-- Listage de la structure de table cinema. director
CREATE TABLE IF NOT EXISTS `director` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  PRIMARY KEY (`id_director`),
  UNIQUE KEY `id_person` (`id_person`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.director : ~8 rows (environ)
INSERT INTO `director` (`id_director`, `id_person`) VALUES
	(1, 8),
	(6, 10),
	(3, 12),
	(2, 13),
	(4, 14),
	(5, 15),
	(7, 17),
	(8, 18),
	(9, 19),
	(10, 20),
	(11, 22);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.genre : ~8 rows (environ)
INSERT INTO `genre` (`id_genre`, `genre_name`) VALUES
	(1, 'Comedy'),
	(2, 'Adventure'),
	(3, 'Fantasy'),
	(4, 'Superhero'),
	(5, 'Drama'),
	(6, 'Action'),
	(7, 'Romance'),
	(12, 'Horror'),
	(13, 'Thriller'),
	(14, 'Historical');

-- Listage de la structure de table cinema. movie
CREATE TABLE IF NOT EXISTS `movie` (
  `id_movie` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `f_release_date` date NOT NULL,
  `length` int DEFAULT NULL,
  `synopsis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `rating` int DEFAULT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_director` int NOT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.movie : ~13 rows (environ)
INSERT INTO `movie` (`id_movie`, `title`, `f_release_date`, `length`, `synopsis`, `rating`, `poster`, `id_director`) VALUES
	(1, 'The Imaginarium of Doctor Parnassus', '2009-11-11', 122, ' In London, the sideshow troupe of Doctor Parnassus promises the audience a journey to the "Imaginarium", an imaginary world commanded by the mind of Doctor Parnassus, where dreams come true. In the stories that Doctor Parnassus tells to his daughter Valentina, the midget Percy, and his assistant Anton, he claims to have lived for more than one thousand years; However, when he fell in love with a mortal woman, he made a deal with the devil (Mr. Nick), trading his immortality for youth. As part of the bargain, he promised his son or daughter to Mr. Nick on their sixteenth birthday. Valentina is now almost to the doomed age and Doctor Parnassus makes a new bet with Mr. Nick, whoever seduces five souls in the Imaginarium will have Valentina as a prize. Meanwhile the troupe rescues Tony, a young man that was hanged on a bridge by the Russians. Tony was chased until he finds and joins the group. Tony and Valentina fall in love with each other and the jealous Anton discovers that his competition may be a liar.', NULL, '64a7b6a1287bc3.63303822.jpg', 1),
	(2, 'The Dark Knight', '2008-08-13', 152, 'Following the events of Batman Begins (2005), mighty Batman, Lieutenant James Gordon, and District Attorney Harvey Dent plan to arrest shady mob accountant Lau to bring down the mob. But Lau\'s detailed disclosures threaten Gotham\'s organised crime. As a result, the city\'s desperate mob bosses turn to The Joker, a sadistic, green-haired psychopath in a purple suit with a flair for crime. As the unstoppable criminal mastermind wreaks havoc, bringing Gotham to its knees with widespread anarchy and chaos, Batman must face his greatest challenge to battle injustice. However, is the Dark Knight prepared to walk the fine line between defender and avenger, hero and vigilante?', NULL, '64a52b03a3b6a8.97768462.jpg', 2),
	(3, 'Batman', '1989-09-01', 126, 'Having witnessed his parents\' brutal murder as a child, millionaire philanthropist Bruce Wayne (Michael Keaton) fights crime in Gotham City disguised as Batman, a costumed hero who strikes fear into the hearts of villains. But when a deformed madman who calls himself "The Joker" (Jack Nicholson) seizes control of Gotham\'s criminal underworld, Batman must face his most ruthless nemesis ever while protecting both his identity and his love interest, reporter Vicki Vale (Kim Basinger).', NULL, '64a52b3aa18fa1.55325493.jpg', 3),
	(4, 'Fear and Loathing in Las Vegas', '1998-08-19', 118, 'Raoul Duke (Johnny Depp) and his attorney Dr. Gonzo (Benicio del Toro) drive a red convertible across the Mojave desert to Las Vegas with a suitcase full of drugs to cover a motorcycle race. As their consumption of drugs increases at an alarming rate, the stoned duo trash their hotel room and fear legal repercussions. Duke begins to drive back to L.A., but after an odd run-in with a cop (Gary Busey), he returns to Sin City and continues his wild drug binge.', NULL, '64a52b2c821db1.99243583.jpg', 1),
	(5, 'The Batman', '2022-03-02', 176, 'Two years of nights have turned Bruce Wayne into a nocturnal animal. But as he continues to find his way as Gotham\'s dark knight Bruce is forced into a game of cat and mouse with his biggest threat so far, a manic killer known as "The Riddler" who is filled with rage and determined to expose the corrupt system whilst picking off all of Gotham\'s key political figures. Working with both established and new allies, Bruce must track down the killer and see him brought to justice, while investigating his father\'s true legacy and questioning the effect that he has had on Gotham so far as "The Batman."', NULL, '64a7b725c85e81.74741663.jpg', 4),
	(6, 'Harry Potter and the Order of the Phoenix', '2007-07-11', 138, 'Now in his fifth year at Hogwarts, Harry (Daniel Radcliffe) learns that many in the wizarding community do not know the truth of his encounter with Lord Voldemort. Cornelius Fudge, minister of Magic, appoints his toady, Dolores Umbridge, as Defense Against the Dark Arts teacher, for he fears that professor Dumbledore will take his job. But her teaching is deficient and her methods, cruel, so Harry prepares a group of students to defend the school against a rising tide of evil.', NULL, '64a52b62cb8288.72065012.jpg', 5),
	(7, 'Breathe', '2018-11-01', 117, 'After contracting polio at the age of 28, Robin Cavendish is confined to bed and given only months to live. But with the help of his wife Diana and her twin brothers, and the groundbreaking ideas of inventor Teddy Hall, Cavendish emerges from the hospital ward and devotes the rest of his life to helping fellow patients and the disabled.', NULL, '64a52b7d05eaf3.28058059.jpg', 6),
	(8, 'Alice in Wonderland', '2010-03-24', 109, 'A young girl when she first visited magical Underland, Alice Kingsleigh (Mia Wasikowska) is now a teenager with no memory of the place -- except in her dreams. Her life takes a turn for the unexpected when, at a garden party for her fiance and herself, she spots a certain white rabbit and tumbles down a hole after him. Reunited with her friends the Mad Hatter (Johnny Depp), the Cheshire Cat and others, Alice learns it is her destiny to end the Red Queen\'s (Helena Bonham Carter) reign of terror.', NULL, '64a52b885093d5.09898348.jpg', 3),
	(9, 'What\'s eating Gilbert Grape?', '1994-04-06', 118, 'Gilbert Grape (Johnny Depp) is a small-town young man with a lot of responsibility. Chief among his concerns are his mother (Darlene Cates), who is so overweight that she can\'t leave the house, and his mentally impaired younger brother, Arnie (Leonardo DiCaprio), who has a knack for finding trouble. Settled into a job at a grocery store and an ongoing affair with local woman Betty Carver (Mary Steenburgen), Gilbert finally has his life shaken up by the free-spirited Becky (Juliette Lewis).', NULL, '64a52ba4593c97.54801399.jpg', 8),
	(10, 'The Shining', '1980-10-16', 119, 'Haunted by a persistent writer\'s block, the aspiring author and recovering alcoholic, Jack Torrance, drags his wife, Wendy, and his gifted son, Danny, up snow-capped Colorado\'s secluded Overlook Hotel after taking up a job as an off-season caretaker. As the cavernous hotel shuts down for the season, the manager gives Jack a grand tour, and the facility\'s chef, the ageing Mr Hallorann, has a fascinating chat with Danny about a rare psychic gift called "The Shining", making sure to warn him about the hotel\'s abandoned rooms, and, in particular, the off-limits Room 237. However, instead of overcoming the dismal creative rut, little by little, Jack starts losing his mind, trapped in an unforgiving environment of seemingly endless snowstorms, and a gargantuan silent prison riddled with strange occurrences and eerie visions. Now, the incessant voices inside Jack\'s head demand sacrifice. Is Jack capable of murder?', NULL, '64a81d39c377b9.54384064.jpg', 7),
	(11, 'Once Upon a Time in Hollywood', '2019-08-14', 161, 'Actor Rick Dalton gained fame and fortune by starring in a 1950s television Western, but is now struggling to find meaningful work in a Hollywood that he doesn\'t recognize anymore. He spends most of his time drinking and palling around with Cliff Booth, his easygoing best friend and longtime stunt double. Rick also happens to live next door to Roman Polanski and Sharon Tate -- the filmmaker and budding actress whose futures will forever be altered by members of the Manson Family.', NULL, '64a8241e6a6033.20539934.jpg', 9),
	(12, 'Pirates of the Caribbean: The Curse of the Black Pearl', '2003-08-13', 143, 'Capt. Jack Sparrow (Johnny Depp) arrives at Port Royal in the Caribbean without a ship or crew. His timing is inopportune, however, because later that evening the town is besieged by a pirate ship. The pirates kidnap the governor\'s daughter, Elizabeth (Keira Knightley), who\'s in possession of a valuable coin that is linked to a curse that has transformed the pirates into the undead. A gallant blacksmith (Orlando Bloom) in love with Elizabeth allies with Sparrow in pursuit of the pirates.', NULL, '64a825c0b23ec9.41541346.jpg', 10),
	(13, 'The Imitation Game', '2015-01-28', 114, 'In 1939, newly created British intelligence agency MI6 recruits Cambridge mathematics alumnus Alan Turing (Benedict Cumberbatch) to crack Nazi codes, including Enigma -- which cryptanalysts had thought unbreakable. Turing\'s team, including Joan Clarke (Keira Knightley), analyze Enigma messages while he builds a machine to decipher them. Turing and team finally succeed and become heroes, but in 1952, the quiet genius encounters disgrace when authorities reveal he is gay and send him to prison.', NULL, '64a82a40e24225.46594770.jpg', 11);

-- Listage de la structure de table cinema. movie_genre
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `id_movie` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_movie`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`),
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.movie_genre : ~0 rows (environ)
INSERT INTO `movie_genre` (`id_movie`, `id_genre`) VALUES
	(1, 1),
	(4, 1),
	(11, 1),
	(1, 2),
	(4, 2),
	(6, 2),
	(8, 2),
	(12, 2),
	(1, 3),
	(6, 3),
	(8, 3),
	(12, 3),
	(2, 4),
	(3, 4),
	(5, 4),
	(4, 5),
	(5, 5),
	(7, 5),
	(9, 5),
	(11, 5),
	(13, 5),
	(2, 6),
	(3, 6),
	(5, 6),
	(6, 6),
	(12, 6),
	(7, 7),
	(10, 12),
	(10, 13),
	(13, 14);

-- Listage de la structure de table cinema. person
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.person : ~18 rows (environ)
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
	(18, 'HALLSTROM', 'Lasse', '1946-06-02', 'M', '64a52aea512074.80018215.jpg'),
	(19, 'TARANTINO', 'Quentin', '1963-03-27', 'M', '64a82356728a82.79587423.jpg'),
	(20, 'VERBINSKI', 'Gore', '1964-03-16', 'M', '64a8251d857ed2.84348991.jpg'),
	(21, 'KNIGHTLEY', 'Keira', '1985-03-26', 'F', '64a82815c5a597.22211236.jpg'),
	(22, 'TYLDUM', 'Morten', '1967-05-19', 'M', '64a8294ca861f9.46318257.jpg'),
	(23, 'CUMBERBATCH', 'Benedict', '1976-07-19', 'M', '64a82b6d987496.04882570.jpg');

-- Listage de la structure de table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema.role : ~0 rows (environ)
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
	(14, 'Gilbert Grape'),
	(15, 'Jack Torrance'),
	(16, 'Rick Dalton'),
	(17, 'Captain Jack Sparrow'),
	(18, 'Elizabeth Swann'),
	(19, 'Alan Turing'),
	(20, 'Joan Clarke');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
