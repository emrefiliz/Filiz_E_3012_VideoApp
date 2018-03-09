SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_videoapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_age_rating`
--

CREATE TABLE `tbl_age_rating` (
  `age_rating_id` smallint(5) UNSIGNED NOT NULL,
  `age_rating_name` varchar(125) NOT NULL,
  `age_rating_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_age_rating`
--

INSERT INTO `tbl_age_rating` (`age_rating_id`, `age_rating_name`, `age_rating_description`) VALUES
(1, 'G', 'G – General Audiences\r\nAll ages admitted. Nothing that would offend parents for viewing by children. '),
(2, 'PG', 'PG – Parental Guidance Suggested\r\nSome material may not be suitable for children. Parents urged to give  	&ldquo;parental guidance&rdquo;. '),
(3, 'PG-13', 'PG-13 – Parents Strongly Cautioned\r\nSome material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.'),
(4, 'R', 'R – Restricted\r\nUnder 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them. '),
(5, 'NC-17', 'NC-17 – Adults Only\r\nNo One 17 and Under Admitted. Clearly adult. Children are not admitted. ');

--
-- Table structure for table `tbl_albums`
--

CREATE TABLE `tbl_albums` (
  `albums_id` mediumint(8) UNSIGNED NOT NULL,
  `albums_name` varchar(255) NOT NULL,
  `albums_cover` varchar(255) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `albums_year` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_albums`
--

INSERT INTO `tbl_albums` (`albums_id`, `albums_name`, `albums_cover`, `artist_id`, `albums_year`) VALUES
(1, 'Tattoo You', 'album_TattooYou.jpg', 1, 1981),
(2, 'Gideon', 'album_Gideon.jpg', 2, 1980),
(3, 'Computer World', 'album_ComputerWorld.jpg', 3, 1981),
(4, 'Creatures of the Night', 'album_CreaturesOfTheNight.jpg', 4, 1982),
(5, 'Straight Outta Compton', 'album_StraightOuttaCompton.jpg', 5, 1988),
(6, 'The Queen Is Dead', 'album_TheQueenIsDead.jpg', 6, 1986),
(7, 'Magnetic', 'album_Magnetic.jpg', 7, 1986);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_artist`
--

CREATE TABLE `tbl_artist` (
  `artist_id` mediumint(8) UNSIGNED NOT NULL,
  `artist_name` varchar(150) NOT NULL,
  `artist_photo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_artist`
--

INSERT INTO `tbl_artist` (`artist_id`, `artist_name`, `artist_photo`) VALUES
(1, 'The Rolling Stones', 'the_rolling_stones.jpg'),
(2, 'Kenny Rogers', 'kenny_rogers.jpg'),
(3, 'Kraftwerk', 'kraftwerk.jpg'),
(4, 'Kiss', 'kiss.jpg'),
(5, 'N.W.A', 'nwa.jpg'),
(6, 'The Smiths', 'the_smiths.jpg'),
(7, 'Steps Ahead', 'steps_ahead.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_art_gen`
--

CREATE TABLE `tbl_art_gen` (
  `art_gen_id` mediumint(8) UNSIGNED NOT NULL,
  `artists_id` mediumint(9) NOT NULL,
  `mus_gen_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_art_mgen`
--

CREATE TABLE `tbl_art_mgen` (
  `art_mgen_id` mediumint(8) UNSIGNED NOT NULL,
  `artist_id` int(10) UNSIGNED NOT NULL,
  `mus_gen_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_art_mgen`
--

INSERT INTO `tbl_art_mgen` (`art_mgen_id`, `artist_id`, `mus_gen_id`) VALUES
(1, 5, 3),
(2, 6, 3),
(3, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

CREATE TABLE `tbl_genre` (
  `genre_id` tinyint(3) UNSIGNED NOT NULL,
  `genre_name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_name`) VALUES
(1, 'Family'),
(2, 'Sci-Fi'),
(3, 'Action'),
(4, 'Adventure'),
(5, 'Drama'),
(6, 'Mystery'),
(7, 'Thriller'),
(9, 'Comedy'),
(10, 'Horror'),
(11, 'Crime'),
(12, 'Music');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mgenre`
--

CREATE TABLE `tbl_mgenre` (
  `mus_gen_id` mediumint(8) UNSIGNED NOT NULL,
  `mus_gen_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mgenre`
--

INSERT INTO `tbl_mgenre` (`mus_gen_id`, `mus_gen_name`) VALUES
(1, 'Rock'),
(2, 'Country'),
(3, 'Electronic'),
(4, 'Heavy Metal'),
(5, 'Hip Hop'),
(6, 'Indie Rock'),
(7, 'Jazz');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_cover` varchar(75) NOT NULL DEFAULT 'cover_default.jpg',
  `movies_title` varchar(125) NOT NULL,
  `movies_year` varchar(5) NOT NULL,
  `movies_storyline` text NOT NULL,
  `movies_trailer` varchar(75) NOT NULL DEFAULT 'trailer_default.jpg',
  `movies_rating` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_cover`, `movies_title`, `movies_year`, `movies_storyline`, `movies_trailer`, `movies_rating`) VALUES
(1, 'et.jpg', 'E.T.', '1982', 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.', 'et.mp4', 8),
(2, 'raidersOfTheLostArk.jpg', 'Raiders of the Lost Ark', '1981', 'Archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before the Nazis.', 'raidersOfTheLostArk.mp4', 9),
(3, 'blueVelvet.jpg', 'Blue Velvet', '1986', 'The discovery of a severed human ear found in a field leads a young man on an investigation related to a beautiful, mysterious nightclub singer and a group of psychopathic criminals who have kidnapped her child.', 'blueVelvet.mp4', 8),
(4, 'fastTimesAtRidgemontHigh.jpg', 'Fast Times at Ridgemont High', '1982', 'A group of Southern California high school students are enjoying their most important subjects: sex, drugs and rock n\' roll.', 'fastTimesAtRidgemontHigh.mp4', 7),
(5, 'aNightmareOnElmStreet.jpg', 'A Nightmare on Elm Street', '1984', 'Several people are hunted by a cruel serial killer who kills his victims in their dreams. While the survivors are trying to find the reason for being chosen, the murderer wont\' lose any chance to kill them as soon as they fall asleep.', 'aNightmareOnElmStreet.mp4', 7),
(6, 'theKarateKid.jpg', 'The Karate Kid', '1984', 'A martial arts master agrees to teach karate to a bullied teenager.', 'theKarateKid.mp4', 7),
(7, 'k9.jpg', 'K-9', '1989', 'To stop an elusive criminal, a maverick detective enlists the aid of a police dog who\'s an unusually intelligent smart alec.', 'k9.mp4', 6),
(8, 'hardRockZombies.jpg', 'Hard Rock Zombies', '1985', 'A freshly-out-of-the-grave band of Hard Rock Zombies is thirsting to take their sweet revenge, as they give the performance of a lifetime.', 'hardRockZombies.mp4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_ara`
--

CREATE TABLE `tbl_mov_ara` (
  `mov_ara_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_id` mediumint(8) UNSIGNED NOT NULL,
  `age_rating_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_ara`
--

INSERT INTO `tbl_mov_ara` (`mov_ara_id`, `movies_id`, `age_rating_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 4),
(4, 4, 4),
(5, 5, 5),
(6, 6, 2),
(7, 7, 3),
(8, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_gen`
--

CREATE TABLE `tbl_mov_gen` (
  `mov_genre_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_gen`
--

INSERT INTO `tbl_mov_gen` (`mov_genre_id`, `movies_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 4, 9),
(9, 4, 5),
(10, 5, 10),
(11, 6, 3),
(12, 6, 5),
(13, 6, 1),
(14, 7, 3),
(15, 7, 9),
(16, 7, 11),
(17, 8, 9),
(18, 8, 10),
(19, 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_musics`
--

CREATE TABLE `tbl_musics` (
  `musics_id` mediumint(8) UNSIGNED NOT NULL,
  `musics_name` varchar(150) NOT NULL,
  `musics_file` varchar(255) NOT NULL,
  `musics_position` tinyint(4) NOT NULL,
  `albums_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_musics`
--

INSERT INTO `tbl_musics` (`musics_id`, `musics_name`, `musics_file`, `musics_position`, `albums_id`) VALUES
(1, 'Start Me Up', 'Start Me Up.mp3', 1, 1),
(2, 'Hang Fire', 'Hang Fire.mp3', 2, 1),
(3, 'Slave', 'Slave.mp3', 3, 1),
(4, 'Intro: Goin\' Home To The Rock', 'Intro: Goin Home To The Rock.mp3', 1, 2),
(5, 'Gideon Tanner', 'Gideon Tanner.mp3', 2, 2),
(6, 'No Good Texas Rounder', 'No Good Texas Rounder', 3, 2),
(7, 'Computer World', 'Computer World.mp3', 1, 3),
(8, 'Pocket Calculator', 'Pocket Calculator.mp3', 2, 3),
(9, 'Numbers', 'Numbers.mp3', 3, 3),
(10, 'Creatures Of The Night', 'Creatures Of The Night.mp3', 1, 4),
(11, 'Saint And Sinner', 'Saint And Sinner.mp3', 2, 4),
(12, 'Keep Me Comin\'', 'Keep Me Comin.mp3', 3, 4),
(13, 'Straight Outta Compton', 'Straight Outta Compton.mp3', 1, 5),
(14, '_ _ _ _ Tha Police (Fill In The Blanks)', '_ _ _ _ Tha Police (Fill In The Blanks).mp3', 2, 5),
(15, 'Gangsta Gangsta', 'Gangsta Gangsta.mp3', 3, 5),
(16, 'The Queen Is Dead (Take Me Back To Dear Old Blighty (Medley))', 'The Queen Is Dead (Take Me Back To Dear Old Blighty (Medley)).mp3', 1, 6),
(17, 'Frankly, Mr. Shankly', 'Frankly, Mr. Shankly.mp3', 2, 6),
(18, 'I Know It\'s Over', 'I Know Its Over.mp3', 3, 6),
(19, 'Trains', 'Trains.mp3', 1, 7),
(20, 'Beirut', 'Beirut.mp3', 2, 7),
(21, 'Cajun', 'Cajun.mp3', 3, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_age_rating`
--
ALTER TABLE `tbl_age_rating`
  ADD PRIMARY KEY (`age_rating_id`);

--
-- Indexes for table `tbl_albums`
--
ALTER TABLE `tbl_albums`
  ADD PRIMARY KEY (`albums_id`);

--
-- Indexes for table `tbl_artist`
--
ALTER TABLE `tbl_artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `tbl_art_gen`
--
ALTER TABLE `tbl_art_gen`
  ADD PRIMARY KEY (`art_gen_id`);

--
-- Indexes for table `tbl_art_mgen`
--
ALTER TABLE `tbl_art_mgen`
  ADD PRIMARY KEY (`art_mgen_id`);

--
-- Indexes for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `tbl_mgenre`
--
ALTER TABLE `tbl_mgenre`
  ADD PRIMARY KEY (`mus_gen_id`);

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indexes for table `tbl_mov_ara`
--
ALTER TABLE `tbl_mov_ara`
  ADD PRIMARY KEY (`mov_ara_id`);

--
-- Indexes for table `tbl_mov_gen`
--
ALTER TABLE `tbl_mov_gen`
  ADD PRIMARY KEY (`mov_genre_id`);

--
-- Indexes for table `tbl_musics`
--
ALTER TABLE `tbl_musics`
  ADD PRIMARY KEY (`musics_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_age_rating`
--
ALTER TABLE `tbl_age_rating`
  MODIFY `age_rating_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_albums`
--
ALTER TABLE `tbl_albums`
  MODIFY `albums_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_artist`
--
ALTER TABLE `tbl_artist`
  MODIFY `artist_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_art_gen`
--
ALTER TABLE `tbl_art_gen`
  MODIFY `art_gen_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_art_mgen`
--
ALTER TABLE `tbl_art_mgen`
  MODIFY `art_mgen_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  MODIFY `genre_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_mgenre`
--
ALTER TABLE `tbl_mgenre`
  MODIFY `mus_gen_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_mov_ara`
--
ALTER TABLE `tbl_mov_ara`
  MODIFY `mov_ara_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_mov_gen`
--
ALTER TABLE `tbl_mov_gen`
  MODIFY `mov_genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_musics`
--
ALTER TABLE `tbl_musics`
  MODIFY `musics_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;