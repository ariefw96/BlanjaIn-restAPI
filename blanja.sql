-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Des 2020 pada 23.14
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blanja`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_level`
--

CREATE TABLE `auth_level` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_level`
--

INSERT INTO `auth_level` (`id`, `type`) VALUES
(1, 'Customer'),
(2, 'Seller'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `blacklist_token`
--

CREATE TABLE `blacklist_token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `blacklist_token`
--

INSERT INTO `blacklist_token` (`id`, `token`, `created_at`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im1vbmEiLCJsZXZlbCI6MSwiaWF0IjoxNjA3MzI3MDM2fQ.o92ldJ3NBR2pEZRSwyTP14LGShkejt1QQlI82-JM9DY', '2020-12-07 14:44:45'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im1vbmEiLCJsZXZlbCI6MSwiaWF0IjoxNjA3MzI4MTYwfQ.8MXoAZHaRoSsxxkYZx_XeD5xYlOfARgb6cQBQPXGgSE', '2020-12-07 15:03:27'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNlZWxlIiwibGV2ZWwiOjEsImlhdCI6MTYwNzM4MzYzMn0.n-aGPKklSUeCXCAEcXQ6Yik6wJ2ba4VogSiJ-8gORpk', '2020-12-08 06:30:27'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo5LCJ1c2VybmFtZSI6InNlbGxlciIsImxldmVsIjoyLCJpYXQiOjE2MDc0Njc1MzJ9.UY0Ga4lGTjf9VKX9V0lJt9Bep312GhClveyXHddl-nw', '2020-12-09 06:17:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'T-shirt'),
(2, 'Short'),
(3, 'Jacket'),
(4, 'Pants'),
(5, 'Shoes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `color`
--

INSERT INTO `color` (`id`, `color_name`) VALUES
(1, 'Red'),
(2, 'Green'),
(3, 'Blue'),
(4, 'Black');

-- --------------------------------------------------------

--
-- Struktur dari tabel `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `condition_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `conditions`
--

INSERT INTO `conditions` (`id`, `condition_name`) VALUES
(1, 'New'),
(2, 'Second');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` int(11) NOT NULL,
  `product_color` int(11) NOT NULL,
  `product_size` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id`, `user_id`, `product_name`, `product_color`, `product_size`, `product_qty`, `created_at`) VALUES
(15, 1, 30, 1, 2, 10, '2020-12-08 14:20:55'),
(16, 1, 25, 1, 1, 10, '2020-12-08 15:11:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master`
--

CREATE TABLE `master` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master`
--

INSERT INTO `master` (`id`, `product_id`, `size_id`, `color_id`, `condition_id`, `qty`, `created_at`, `updated_at`) VALUES
(3, 3, 7, 4, 1, 1, '2020-11-21 18:01:57', '2020-11-21 18:01:57'),
(4, 4, 3, 3, 1, 1, '2020-11-21 21:04:15', '2020-11-21 21:04:15'),
(8, 6, 2, 4, 1, 10, '2020-11-23 19:43:02', '2020-11-24 00:13:01'),
(10, 6, 6, 3, 2, 2, '2020-11-23 21:12:14', '2020-11-23 21:12:14'),
(13, 13, 6, 3, 2, 2, '2020-11-24 01:59:16', '2020-11-24 01:59:16'),
(14, 14, 6, 3, 2, 2, '2020-11-24 02:02:43', '2020-11-24 02:02:43'),
(17, 17, 3, 3, 1, 2, '2020-11-24 13:42:58', '2020-11-24 13:42:58'),
(19, 18, 10, 2, 1, 2, '2020-11-29 13:49:49', '2020-11-29 14:03:16'),
(20, 10, 1, 2, 1, 2, '2020-11-29 15:18:40', '2020-11-29 15:18:40'),
(30, 23, 12, 1, 1, 1, '2020-12-03 03:45:30', '2020-12-03 03:45:49'),
(31, 24, 2, 3, 1, 10, '2020-12-03 04:07:27', '2020-12-03 04:07:27'),
(32, 25, 3, 3, 1, 5, '2020-12-03 06:49:25', '2020-12-03 06:49:25'),
(34, 3, 3, 3, 1, 10, '2020-12-07 11:42:57', '2020-12-07 11:42:57'),
(35, 29, 3, 3, 1, 10, '2020-12-07 11:46:16', '2020-12-07 11:46:16'),
(37, 30, 1, 1, 1, 10, '2020-12-08 06:56:37', '2020-12-09 06:50:01'),
(38, 43, 2, 1, 1, 10, '2020-12-09 06:45:13', '2020-12-09 06:45:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_img` longtext NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `product_price`, `product_desc`, `product_img`, `rating`) VALUES
(3, 'Jeans levi\'s', 3, 250000, 'Celana Jeans levi\'s unisex', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/2/20/17121074/17121074_987709c3-9bc8-4ea7-ac07-b543ba9b1b76_300_300.png.webp', 3.3),
(4, 'Trunks men', 2, 20000, 'mens trunks nyaman dipakai tidur', 'https://images-na.ssl-images-amazon.com/images/I/71WK1CgeaUL._AC_UX385_.jpg', 3.6),
(6, 'Kaos Gundam Astray Red Frame', 1, 15000, 'kaos gambar gundam astray red frame kai nyaman dipakai ngewibu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIUfIyhykqnSMh1hksGzpmDA492gUtkigbJw&usqp=CAU', 3.7),
(9, 'sepatu doc mart', 5, 500000, 'sepatu casual dr marten', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTVqfPujNJ13MVGbCu0cHVxbUCCDJNoaaHEGR7f4z0sdvsy7mivuzmaQJXut5uQ5xXEnqKBHu33K_rPtIM4OO9dem4xuIzudGOm5u1sl5b7SCBOYZQe_Jhq&usqp=CAE', 3.76),
(10, 'sepatu doc mart', 5, 500000, 'sepatu casual dr marten', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTVqfPujNJ13MVGbCu0cHVxbUCCDJNoaaHEGR7f4z0sdvsy7mivuzmaQJXut5uQ5xXEnqKBHu33K_rPtIM4OO9dem4xuIzudGOm5u1sl5b7SCBOYZQe_Jhq&usqp=CAE', 3.23),
(13, 'Kaos gundam barbatos', 1, 50000, 'kaos gambar gundam barbatos', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/4/18/13055989/13055989_f0c28e94-20d8-41c1-a69e-fa9caf031785_1120_701.jpg.webp', 4.32),
(14, 'Kaos gundam barbatos lupus rex', 1, 50000, 'kaos gambar gundam barbatos', 'https://ecs7.tokopedia.net/img/cache/900/product-1/2019/8/19/47820781/47820781_74ccf0db-5dbd-4a3c-bdab-92b4ea7b9496_800_800', 3.75),
(16, 'Baju muslim pria', 1, 150000, 'baju muslim pria dewasa dan anak-anak', 'https://i.imgur.com/9oVl20a.jpg', 2.71),
(17, 'kemeja pria calvin klein', 1, 150000, 'Kaemeja pria calvin klein ukuran besar', 'http://zalora-media-live-id.s3.amazonaws.com/product/14/53852/1.jpg', 3.4),
(18, 'kemeja pria ', 1, 150000, 'Kaemeja pria calvin klein ukuran besar', 'http://zalora-media-live-id.s3.amazonaws.com/product/14/53852/1.jpg', 4.1),
(23, 'Kokusei', 3, 999000, 'Keqing waifu saya', 'https://noisypixel.net/wp-content/uploads/2020/09/Genshin-Impact-2-800x445.jpg', 5),
(24, 'Keqing', 1, 75000, 'Poster Genshin Impact', 'https://noisypixel.net/wp-content/uploads/2020/09/Genshin-Impact-2-800x445.jpg', 4.76),
(25, 'Jacket Paimon', 3, 249000, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'https://tokoanime.myhobbytown.com/wp-content/uploads/2020/10/genshin-impact-jacket-paimon4.jpg', 4.03),
(29, 'Hape realme 5 pro', 3, 2990000, 'Hape murah meriah bisa buat BBan', 'thumbnail.jpg', 4),
(30, 'Kaos Genshin Impact', 1, 299000, 'Kaos Genshin Impact. Bahan cotton combed 20s. Nyaman dipakai', 'https://tokoanime.myhobbytown.com/wp-content/uploads/2020/10/genshin-impact-jacket-paimon6.jpg', 0),
(43, 'Klee, Qiqi Genshin Impact', 1, 99000, 'Knights of Favonius Spark Knight! Forever with a bang and a flash! —And then disappearing from the stern gaze of Acting Grand Master Jean. Sure, time in solitary confinement gives lots of time to think about new gunpowder formulas...But it\'d still be better to not be in solitary in the first place.', '/images/img-1607471027114.jpg,/images/img-1607471027117.jpg', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `size`
--

INSERT INTO `size` (`id`, `size_name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, '28'),
(5, '29'),
(6, '30'),
(7, '31'),
(8, '32'),
(9, '33'),
(10, '34'),
(11, '35'),
(12, '36'),
(13, '37'),
(14, '38'),
(15, '39'),
(16, '40'),
(17, '41'),
(18, '42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `level_id`, `firstname`, `lastname`, `email`) VALUES
(1, 'mona', '$2b$05$45vQrBDIU158E4/i9XKh2esB1beUwj/BEoLsbbDdSC/B3RjtmVmEi', 1, 'Mona', 'Megistus', 'MonaMegistus02@tevyat.mail.com'),
(7, 'seele', '$2b$05$z9cass0mISH.skB5S4qybO4CXIoPGfoThCP4apuWtwdsCEXCo25Da', 1, 'Seele', 'Vollerei', 'seelechan01@honkai.mail.com'),
(8, 'keqing08', '$2b$05$.wekC2y45HMc18hOFjTxiOEYRaVTI/5Z4BnHwIfpBQlA5JkS13pDO', 2, 'Kokusei', 'Xiqing', 'keqing08@liyue.mail.com'),
(9, 'seller', '$2b$06$ZU/Gb.vkeczTzcwcckTyPOAqCDMImSdbQXMBw.Fl6c06DNLpO./P2', 2, 'Seller', 'Admin', 'admin@mail.com');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_level`
--
ALTER TABLE `auth_level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `blacklist_token`
--
ALTER TABLE `blacklist_token`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product` (`product_name`),
  ADD KEY `product_color` (`product_color`),
  ADD KEY `product_size` (`product_size`);

--
-- Indeks untuk tabel `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `condition_id` (`condition_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_level`
--
ALTER TABLE `auth_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `blacklist_token`
--
ALTER TABLE `blacklist_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `master`
--
ALTER TABLE `master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`product_name`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`product_color`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `history_ibfk_4` FOREIGN KEY (`product_size`) REFERENCES `size` (`id`);

--
-- Ketidakleluasaan untuk tabel `master`
--
ALTER TABLE `master`
  ADD CONSTRAINT `master_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `master_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `master_ibfk_3` FOREIGN KEY (`condition_id`) REFERENCES `conditions` (`id`),
  ADD CONSTRAINT `master_ibfk_4` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`);

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Ketidakleluasaan untuk tabel `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `auth_level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
