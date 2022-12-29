-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2022-12-29 23:43:45
-- サーバのバージョン： 10.4.27-MariaDB
-- PHP のバージョン: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `morio_pension`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_telno` char(11) NOT NULL,
  `customer_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- テーブルのデータのダンプ `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_telno`, `customer_address`) VALUES
(15, '森貴規', '090-5078-38', ''),
(16, '森貴規', '090-5078-38', ''),
(17, '森貴規', '090-5078-38', ''),
(18, '森貴規', '090-5078-38', ''),
(19, '森貴規', '090-5078-38', ''),
(20, '森貴規', '090-5078-38', ''),
(21, '森貴規', '090-5078-38', ''),
(22, '森貴規', '090-5078-38', ''),
(24, '森貴規', '090-5078-38', ''),
(25, 'mori', '00000000', 't-mori@satsudora.jp'),
(26, '森貴規', '090-5078-38', ''),
(27, '森貴規', '090-5078-38', ''),
(28, '竹内健吾', '090-5078-38', ''),
(29, 'mori', '090-5078-38', 't-mori@satsudora.jp'),
(30, '森貴規', '090-5078-38', ''),
(31, '森貴規', '090-5078-38', 't-mori@satsudora.jp'),
(32, '森貴規', '090-5078-38', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `reserve`
--

CREATE TABLE `reserve` (
  `reserve_no` int(11) NOT NULL,
  `reserve_date` datetime NOT NULL,
  `room_no` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `numbers` int(11) NOT NULL,
  `checkin_time` char(5) NOT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- テーブルのデータのダンプ `reserve`
--

INSERT INTO `reserve` (`reserve_no`, `reserve_date`, `room_no`, `customer_id`, `numbers`, `checkin_time`, `message`) VALUES
(2022122902, '2022-12-29 00:00:00', 1, 24, 2, '9:00', ''),
(2022123001, '2022-12-30 00:00:00', 1, 25, 4, '16:00', ''),
(2022123101, '2022-12-31 00:00:00', 1, 26, 4, '10:00', ''),
(2023010301, '2023-01-03 00:00:00', 1, 30, 2, '11:00', ''),
(2023010501, '2023-01-05 00:00:00', 1, 27, 4, '9:00', ''),
(2023010701, '2023-01-07 00:00:00', 101, 21, 2, '10:00', 'よろしくお願い致します。'),
(2023010702, '2023-01-07 00:00:00', 1, 32, 2, '10:00', ''),
(2023011901, '2023-01-19 00:00:00', 1, 31, 2, '11:00', 'よろしくお願い致します'),
(2024102901, '2024-10-29 00:00:00', 101, 22, 2, '10:00', ''),
(2024102902, '2024-10-29 00:00:00', 1, 28, 2, '15:00', ''),
(2025112901, '2025-11-29 00:00:00', 1, 29, 4, '13:00', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `room`
--

CREATE TABLE `room` (
  `room_no` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `information` varchar(255) DEFAULT NULL,
  `main_image` varchar(50) NOT NULL,
  `image1` varchar(50) DEFAULT NULL,
  `image2` varchar(50) DEFAULT NULL,
  `image3` varchar(50) DEFAULT NULL,
  `amenity` varchar(255) DEFAULT NULL,
  `dayfee` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- テーブルのデータのダンプ `room`
--

INSERT INTO `room` (`room_no`, `room_name`, `information`, `main_image`, `image1`, `image2`, `image3`, `amenity`, `dayfee`, `capacity`, `type_id`) VALUES
(1, 'パークハイアッドニセコ', 'ニセコで最高のホテルです。', 'room_01.jpg', 'room_01_02.jpg.png', 'room_01_03.jpg.png', 'room_01_04.jpg.png', 'プール、暖炉もございます', 9000, 4, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `room_type`
--

CREATE TABLE `room_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- テーブルのデータのダンプ `room_type`
--

INSERT INTO `room_type` (`type_id`, `type_name`) VALUES
(1, 'パークハイアット'),
(2, '綾'),
(3, 'ヒルトンニセコビレッジ'),
(4, 'ニセコノーザンリゾート');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- テーブルのインデックス `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`reserve_no`),
  ADD KEY `FK_reserve_0` (`room_no`),
  ADD KEY `FK_reserve_1` (`customer_id`);

--
-- テーブルのインデックス `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`),
  ADD KEY `FK_room_0` (`type_id`);

--
-- テーブルのインデックス `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`type_id`);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `FK_reserve_0` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`),
  ADD CONSTRAINT `FK_reserve_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- テーブルの制約 `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FK_room_0` FOREIGN KEY (`type_id`) REFERENCES `room_type` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
