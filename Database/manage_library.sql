-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 21, 2022 lúc 06:07 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `manage_library`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_day` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `name`, `category_id`, `amount`, `image`, `filename`, `create_day`) VALUES
(36, 'Đắc Nhân Tâm', 22, 5, 'Dac-nhan-tam.jpg', 'dac-nhan-tam.pdf', '2020-11-19 14:30:06'),
(37, 'Dám uoc mo', 22, 6, 'dam-uoc-mo.jpg', '', '2020-11-19 14:30:36'),
(38, 'Nghĩ Lớn Để Thành Công', 23, 4, 'nghi-lon-de-thanh-cong.jpg', 'nghi-lon-de-thanh-cong.pdf', '2020-11-19 14:30:49'),
(39, '360 Động Từ Bất Quy Tắc Đầy Đủ', 24, 5, '360-dong-tu-bat-quy-tac-day-du.jpg', '', '2020-11-19 14:31:01'),
(40, 'Khi Người Ta Tư Duy', 22, 5, 'khi-nguoi-ta-tu-duy.jpg', 'khi-nguoi-ta-tu-duy.pdf', '2020-11-19 14:32:05'),
(41, 'Chiêu Bài Quản Lý Vàng Của Bill Gates ', 23, 6, 'chieu-bai-quan-ly-vang-cua-bill-gates.jpg', '', '2020-11-19 14:33:23'),
(42, 'Tự Học Tiếng Anh Hiệu Quả', 24, 5, 'tu-hoc-tieng-anh-hieu-qua.jpg', '', '2020-11-19 14:35:14'),
(43, 'Hands on machine learning with scikit learn and tensorflow', 25, 2, 'hands on machine learning with scikit learn and tensorflow.jpg', '', '2020-11-19 14:38:54'),
(44, 'Mặt Trời Và Con Người', 22, 1, 'mat-troi-va-con-nguoi.jpg', '', '2020-11-19 14:41:28'),
(45, 'Từ Tốt Đến Vĩ Đại', 23, 4, 'tu-tot-den-vi-dai.jpg', '', '2020-11-19 14:42:13'),
(46, 'Hạnh Phúc Thật Giản Đơn', 22, 1, 'hanh-phuc-that-gian-don.jpg', '', '2020-11-19 14:43:14'),
(52, 'Mật thư', 29, 4, 'mat-thu.jpg', '', '2020-11-26 12:34:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(22, 'Tâm Lý - Kỹ Năng Sống'),
(23, 'Kinh Tế Quản Lý'),
(24, 'Ngoại Ngữ'),
(25, 'Lập Trình'),
(29, 'Khoa học kỹ thuật'),
(30, 'Tình cảm'),
(31, 'Viễn  tưởng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '123456');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
