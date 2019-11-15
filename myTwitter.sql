-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 03 2019 г., 16:53
-- Версия сервера: 10.4.6-MariaDB
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `group20db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `short_content` text NOT NULL,
  `content` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `short_content`, `content`, `post_date`) VALUES
(1, 1, 'Man shot dead after knife attack on Paris police', 'A man has been shot dead by French police after attacking officers with a knife outside Paris police headquarters.\r\n', 'The man was trying to enter the building before being stopped by an officer, who was seriously wounded in the attack.\r\nTwo other people have been injured in the attack.\r\nThere is no official police comment. French Interior Minister Christophe Castaner has gone to the scene.\r\nThe area in the Ã®le de la CitÃ© - in the centre of Paris - has been cordoned off.', '2019-10-03 14:12:00'),
(2, 2, 'Boris Johnson: Brexit plan \'genuine attempt to bridge chasm\'', 'Prime Minister Boris Johnson has said he has made a \"genuine attempt to bridge the chasm\" in order to get a fresh Brexit deal with the EU.', 'He told MPs his plan - which would see Northern Ireland stay in the European single market for goods but leave the customs union - were a \"compromise\".\r\n\r\nBut Jeremy Corbyn criticised the \"unrealistic and damaging proposals\".\r\n\r\nIrish PM Leo Varadkar said the new plans were welcome, but \"fall short in a number of aspects\".\r\n\r\nBut his Swedish counterpart Stefan Lofven said that, despite \"question marks\" over the proposals, they represented a \"good start for negotiations\".\r\n\r\nThe European Commission said there were \"problematic points\" in the UK\'s proposal and \"further work is needed\".\r\n\r\nAnd the main Brexit-focused group at the European Parliament said the plans \"in their current form\" did not represent a deal MEPs could ratify.\r\n\r\n\"The proposals do not address the real issues that need to be resolved if the backstop were to be removed,\" the group added.', '2019-10-03 14:12:45'),
(3, 5, 'Hidden part of Versallies', 'Nobility travelled from all over the world to Versailles to learn a mixture of dressage, ballet and fencing â?? highly refined arts that paved the way for classical dance.', 'The opulent furnishings, gilded halls and scenic gardens of Versailles are legendary. Less known is La Grande Ã?curie, one of the royal stables that once housed more than 2,000 horses for the court of Louis XIV.\r\n\r\nDesigned by Jules Hardouin-Mansart, the royal architect responsible for Versaillesâ?? Hall of Mirrors, the Ã?curies were one of the most ambitious livery construction projects ever undertaken by a monarch. Commissioned by the king and constructed over three short years, from 1679 to 1682, this magnificent horse arena became one of the most important features of the court â?? a place where the arts truly flourished, paving the way for classical dance as we know it today.', '2019-10-03 14:52:49');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `name`, `model`, `price`) VALUES
(1, 'Toyota', 'Camry', 20000),
(3, 'VAZ', '2107', 2000);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `full_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `full_name`) VALUES
(1, 'ilyas', 'qwerty', 'Ilyas Zhuanyshev'),
(2, 'arman', 'qweqwe', 'Arman Derzki'),
(4, 'ilyasbek', 'qweqwe', 'Ilyasbek Armanov'),
(5, 'erbol', 'qweqwe', 'Erbol Erbolov');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
