SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `sportevents` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sportevents`;

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_name` varchar(80) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `event_img` longtext NOT NULL,
  `event_description` mediumtext NOT NULL,
  `_FK_Location_id` int(11) NOT NULL,
  `_FK_Team_id` int(11) NOT NULL,
  `_FK_Player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `event` (`event_id`, `event_type`, `event_name`, `event_date`, `event_time`, `event_img`, `event_description`, `_FK_Location_id`, `_FK_Team_id`, `_FK_Player_id`) VALUES
(1, 'Soccer', 'Salzburg - Sturm', '2021-02-12', '14:30:00', 'https://cdn.pixabay.com/photo/2015/01/21/00/56/football-606235_960_720.jpg', 'Final Game of Top League Teams!', 0, 0, 0),
(2, 'Ice Hockey', 'KAC - Capitals', '2019-10-23', '09:45:00', '', '', 2, 2, 1),
(3, 'Soccer', 'Sturm - Salzburg', '2019-07-18', '18:30:00', '', '', 3, 3, 1),
(4, 'Basketball', 'Chicago Bulls - LA Lakers', '2021-03-23', '16:15:00', '', '', 4, 4, 1),
(5, 'NFL Football', 'Kansas City Chiefs - Tampa Bay Bucaneers', '2021-02-07', '21:00:00', '', '', 5, 5, 1),
(6, 'Ice Hockey', 'KAC - Capitals', '2019-10-23', '09:45:00', '', '', 6, 6, 1),
(7, 'Soccer', 'Sturm - Salzburg', '2019-07-18', '18:30:00', '', '', 7, 7, 1),
(8, 'Basketball', 'Chicago Bulls - LA Lakers', '2021-03-23', '16:15:00', '', '', 8, 8, 1),
(9, 'NFL Football', 'Kansas City Chiefs - Tampa Bay Bucaneers', '2021-02-07', '21:00:00', '', '', 9, 9, 1);

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `playground` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `location` (`location_id`, `playground`, `address`, `country`) VALUES
(1, 'Ernst-Happel-Stadion', ' Meiereistraße 7, 1020 Wien', 'Austria'),
(2, 'Ice-Palace', 'Eisstrasse 7', 'Klagenfurt'),
(3, 'Hanapi-Stadion', 'Ballstrasse 70', 'Vienna'),
(4, 'Jersey-Gardens', 'Manhattan 17-3', 'New York City'),
(5, 'Sofi-Stadium', 'Football-Lane 777', 'Los Angeles'),
(6, 'Ice-Palace', 'Eisstrasse 7', 'Klagenfurt'),
(7, 'Hanapi-Stadion', 'Ballstrasse 70', 'Vienna'),
(8, 'Jersey-Gardens', 'Manhattan 17-3', 'New York City'),
(9, 'Sofi-Stadium', 'Football-Lane 777', 'Los Angeles');

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(80) NOT NULL,
  `sports_type` varchar(100) NOT NULL,
  `team_size` int(11) NOT NULL,
  `performance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `team` (`team_id`, `team_name`, `sports_type`, `team_size`, `performance`) VALUES
(1, 'Red Bull Salzburg', 'Soccer', 50, 0),
(2, 'Vienna Capitals', 'Ice-Hockey', 0, 0),
(3, 'Sturm Graz', 'Soccer', 0, 0),
(4, 'Chicago Bulls', 'Basketball', 0, 0),
(5, 'Kansas City Chiefs', 'Football', 0, 0),
(6, 'KAC', 'Ice-Hockey', 0, 0),
(7, 'Sturm Graz', 'Soccer', 0, 0),
(8, 'LA Lakers', 'Basketball', 0, 0),
(9, 'Tampa Bay Bucaneers', 'Football', 0, 0);


ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_location` (`_FK_Location_id`),
  ADD KEY `event_team` (`_FK_Team_id`),
  ADD KEY `event_player` (`_FK_Player_id`);

ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);


ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `event`
  ADD CONSTRAINT `event_location` FOREIGN KEY (`_FK_Location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `event_team` FOREIGN KEY (`_FK_Team_id`) REFERENCES `team` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
