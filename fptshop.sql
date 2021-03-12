-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 16, 2020 lúc 05:40 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fptshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên danh mục',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `icon`) VALUES
(21, 'Điện Thoại ', 'dien-thoai.png', 'fa fa-mobile '),
(22, 'Laptop', 'laptop.png', 'fa fa-laptop'),
(23, 'Apple', 'apple.png', 'fa fa-apple'),
(24, 'Máy tính bảng', 'tablet.png', 'fa fa-tablet'),
(25, 'Đồng hồ thông minh', 'smart-watch.png', 'fa fa-clock-o'),
(26, 'Ốp lưng điện thoại', 'op-lung.png', 'fa fa-floppy-o'),
(27, 'Máy cũ', 'may_cu.png', 'fa fa-repeat'),
(28, 'Màn hình', 'monitor2x.png', ''),
(29, 'Máy lọc không khí', 'may_loc_khong_khi.png', ''),
(30, 'Sạc cáp', 'cap-sac.png', ''),
(31, 'Máy tính để bàn', 'may-tinh-de-ban.png', ''),
(32, 'Máy in', 'may-in.png', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(5) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nội dung comment',
  `product_id` int(5) UNSIGNED NOT NULL COMMENT 'ID sản phẩm',
  `user_id` int(5) UNSIGNED NOT NULL COMMENT 'ID người comment',
  `created_at` datetime NOT NULL COMMENT 'Thời gian tạo comment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info`
--

CREATE TABLE `info` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `coppyright` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `info`
--

INSERT INTO `info` (`id`, `name`, `address`, `email`, `logo`, `coppyright`, `phone`) VALUES
(1, 'Công ty cổ phần TV Shop', 'Tòa nhà FPT Polytechnic,Phố Trịnh Văn Bô,Nam Từ Liêm,Hà Nội', 'tvshop.contact@gmail.com', 'logo.png', '© 2001 - 2020 Developer ', '08 6868 99');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oder`
--

CREATE TABLE `oder` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_user` int(5) UNSIGNED NOT NULL,
  `time_oder` datetime NOT NULL,
  `satatus` int(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `oder`
--

INSERT INTO `oder` (`id`, `id_user`, `time_oder`, `satatus`, `address`, `phone`, `total`) VALUES
(59, 14, '2020-12-16 09:51:52', 0, 'Ninh Bình', '123', 160000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oder_details`
--

CREATE TABLE `oder_details` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_oder` int(5) UNSIGNED NOT NULL,
  `id_prd` int(5) UNSIGNED NOT NULL,
  `quantily` int(5) NOT NULL,
  `price` int(10) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `oder_details`
--

INSERT INTO `oder_details` (`id`, `id_oder`, `id_prd`, `quantily`, `price`, `created_at`) VALUES
(48, 59, 6, 5, 12000000, '2020-12-16 09:51:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('buithanh2001nb@gmail.com', '037c60027d8fd8b8221d2a4ecc8035745fd78ac361118', '2020-12-14 09:54:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_price` double NOT NULL,
  `price` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lưu ý: khuyến mãi ...',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ảnh sản phẩm',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mô tả',
  `parameter` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Thông số kỹ thuật',
  `category_id` int(5) UNSIGNED NOT NULL,
  `views` int(5) NOT NULL,
  `total` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `origin_price`, `price`, `note`, `image`, `description`, `parameter`, `category_id`, `views`, `total`) VALUES
(2, 'Điện thoại test 11', 330000001, 25000000, 'áddas 1', '11-pro-max.png', 'ádas 1', 'ádads 1', 21, 20, 10),
(6, 'Điện thoại 1', 10000000, 12000000, '<p>Khuyến Mại 1</p>', 'ip-12.png', '<p>Mô tả điện thoại 1</p>', 'parameter', 21, 3, 99),
(9, 'Áo Thun Cổ Lọ', 111123, 11111, '<p>ádasd</p>', 'ip-12.png', '<p>123dsdf</p>', '<p>ssdfsdfs555</p>', 21, 3, 111),
(10, 'Laptop', 4445445, 565656, '<p>ssdsfd7556</p>', '11-pro-max.png', '<p>56577rsdf</p>', '<p>ssdfsd45345</p>', 22, 1, 44);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ảnh slide',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `created_at`, `updated_at`, `link`) VALUES
(1, 'SLide Iphone new', 'sliderIphone.png', '2020-11-27 03:35:17', '2020-12-16 03:42:25', 'productall.php?id=21'),
(2, 'Slide Vivo', 'sliderVivo.png', '2020-11-27 03:36:49', '2020-12-16 03:42:54', 'productall.php?id=21'),
(3, 'Slide Black', 'sliderBlack.png', '2020-11-27 03:37:21', '2020-12-16 03:42:57', 'productall.php?id=21'),
(4, 'Banner 1 top right', 'Banner1.png', '2020-11-27 03:37:40', '2020-12-16 03:43:01', 'productall.php?id=21'),
(5, 'Banner 2 top right', 'Banner2.png', '2020-11-27 03:38:01', '2020-12-16 03:42:49', 'productall.php?id=21'),
(6, 'Vsmart small', 'Vsmart.png', '2020-11-27 03:38:21', '2020-12-16 03:43:10', 'productall.php?id=21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên người dùng',
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số điện thoại',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` int(1) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `address`, `created_at`, `updated_at`, `permission`, `active`) VALUES
(14, 'Acc Clone', '123', 'Acc@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'Ninh Bình', '2020-12-14 04:55:35', NULL, 0, 1),
(15, 'Bùi Xuân Thành', '0399372610', 'buithanh2001nb@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'Vinhome Smart City', '2020-12-14 04:56:18', NULL, 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oder`
--
ALTER TABLE `oder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `oder_details`
--
ALTER TABLE `oder_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_oder` (`id_oder`),
  ADD KEY `id_prd` (`id_prd`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `info`
--
ALTER TABLE `info`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oder`
--
ALTER TABLE `oder`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `oder_details`
--
ALTER TABLE `oder_details`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `oder`
--
ALTER TABLE `oder`
  ADD CONSTRAINT `oder_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `oder_details`
--
ALTER TABLE `oder_details`
  ADD CONSTRAINT `oder_details_ibfk_1` FOREIGN KEY (`id_oder`) REFERENCES `oder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oder_details_ibfk_2` FOREIGN KEY (`id_prd`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
