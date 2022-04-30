-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 30. 13:31
-- Kiszolgáló verziója: 10.4.19-MariaDB
-- PHP verzió: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `coworkers`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `coworker`
--

CREATE TABLE `coworker` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `coworker`
--

INSERT INTO `coworker` (`id`, `name`, `email`) VALUES
(1, 'Vaskó-Szedlár Tamás', 'vasko-szedlart@kkszki.hu'),
(2, 'Almási Milán', 'almasim@kkszki.hu'),
(3, 'Pap Dániel', 'papd@kkszki.hu'),
(4, 'Várdai Tamás', 'vardait@kkszki.hu'),
(5, 'Váradi Nikoletta Brigitta', 'varadin@kkszki.hu'),
(6, 'Pócs Márk', 'pocsm@kkszki.hu'),
(7, 'Sztrelcsik Zoltán', 'sztrelcsikz@kkszki.hu'),
(8, 'Kirsch Ádám Péter', 'kirscha@kkszki.hu');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `notebook`
--

CREATE TABLE `notebook` (
  `id` int(11) NOT NULL,
  `brand` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `type` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `coworkerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `notebook`
--

INSERT INTO `notebook` (`id`, `brand`, `type`, `coworkerid`) VALUES
(1, 'HP', 'Notebook 14s-dr1010tu', 2),
(2, 'HP', 'Notebook 14s-dr1010tu', 8),
(3, 'HP', 'Notebook 14s-dr1010tu', 3),
(4, 'HP', 'Notebook 14s-dr1010tu', 6),
(5, 'HP', 'Notebook 14s-dr1010tu', 7),
(6, 'HP', 'Notebook 14s-dr1010tu', 1),
(7, 'HP', 'Notebook 14s-dr1010tu', 5),
(8, 'HP', 'Notebook 14s-dr1010tu', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `brand` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `type` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `coworkerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `phone`
--

INSERT INTO `phone` (`id`, `brand`, `type`, `coworkerid`) VALUES
(1, 'Samsung', 'A50', 1),
(2, 'Samsung', 'J5 2017', 1),
(3, 'Samsung', 'A50', 5),
(4, 'Iphone', 'X', 5),
(5, 'Samsung', 'A70', 6),
(6, 'Nokia', '3310', 7),
(7, 'Samsung', 'A70', 2),
(8, 'LG', 'K92', 4),
(9, 'Sony', 'Xperia 5', 3),
(10, 'Samsung', 'A52', 3),
(11, 'Sony Ericsson', 'w300i', 8),
(12, 'Sony Ericsson', 'w200i', 8),
(13, 'Samsung', 'Galaxy Z Fold3 5G', 8);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `coworker`
--
ALTER TABLE `coworker`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coworkerid` (`coworkerid`);

--
-- A tábla indexei `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_ibfk_1` (`coworkerid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `coworker`
--
ALTER TABLE `coworker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `notebook`
--
ALTER TABLE `notebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `notebook`
--
ALTER TABLE `notebook`
  ADD CONSTRAINT `notebook_ibfk_1` FOREIGN KEY (`coworkerid`) REFERENCES `coworker` (`id`);

--
-- Megkötések a táblához `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`coworkerid`) REFERENCES `coworker` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
