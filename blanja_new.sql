-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Feb 2021 pada 03.53
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blanja_new`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `address`
--

INSERT INTO `address` (`id`, `address_type`, `recipient_name`, `address`, `city`, `postal`, `phone`, `user_id`) VALUES
(1, 'Kos', 'Arief Widiyatmoko', 'Jl. Mayjen Panjaitan gang 19 no 43, Rt.09/06, Kelurahan Penanggungan, Klojen', 'Malang, Jawa Timur', '65113', '085755278932', 35),
(2, 'Rumah', 'Firmanda Mulyawan', 'Graha Handaya, Unit Q-S, Jl. Raya Perjuangan No.12A, Kebon Jeruk', 'Jakarta Timur, Jakarta', '11530', '088888888888', 35),
(4, 'Kost', 'Arif Nur Agung', 'Jl.Mayjen Panjaitan gg. 19, no.43', 'Kota Malang, Jatim', '65113', '0895379157496', 35),
(5, 'Arkademy', 'Wina Klarisa', 'Jl. Petamboran no.42', 'Jaksel, DKI Jakarta', '11098', '00892', 35),
(6, 'Kos', 'Sumawijaya', 'Jl.Mayjen Panjaitan gg19, no.43', 'Malang, Jatim', '65113', '0857xxxx', 35),
(7, 'GrabToko', 'Uncle Roger', 'Sidoharum, Sempor', 'Kebumen, Jateng', '54471', '085842622017', 41),
(8, 'Rumah', 'Arief Widiyatmoko', 'Mayjen Panjaitan gang 19', 'Malang, Jatim', '65113', '085755278932', 35),
(9, 'School', 'Seele', 'Sea of Quanta', 'St.Freya', '180820', '085842622017', 43),
(11, 'Kost', 'Arief Moko', 'Jl. Panjaitan ', 'Malang, Jatim', '54471', '085755278932', 43),
(12, 'RUmah', 'asdas', 'asdasd', 'asdasd', '54471', '08576629321', 43),
(14, 'Rumah', 'Agung', 'Malang', 'Malang', '65113', '085755278932', 35),
(15, 'Rumah', 'Agung', 'Malang', 'Malang', '65113', '085755278932', 35),
(16, 'Rumah saya', 'Agung', 'Jl. Panjaitam', 'Malamg', '65113', '085755555555', 46),
(17, 'Rumaj', 'Agung', 'malamg', 'malamg', '65113', '08888888888', 46),
(18, 'Rumaj', 'Agung', 'malamg', 'malamg', '65113', '08888888888', 46),
(19, 'Kantor', 'Sumawijaya', 'Graha Handaya, Unit Q-S, Jl. Raya Perjuangan No.12A, Kebon Jeruk', 'Jakarta Barat, Jakarta', '11530', '08888888', 35);

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
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0OSwiZW1haWwiOiJ6d2FsbGV0LmFya2FkZW15QGdtYWlsLmNvbSIsImZ1bGxuYW1lIjoiWi1XYWxsZXQgQ2xpZW50IiwibGV2ZWwiOjEsImlhdCI6MTYxMjgyNDExOSwiZXhwIjoxNjEzMDgzMzE5fQ.NOOR_2sJSdtQMjzd3idg5QSf_q4MC5QqWBUx2aix_ao', '2021-02-09 05:53:09');

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
-- Struktur dari tabel `jenis_pengiriman`
--

CREATE TABLE `jenis_pengiriman` (
  `id` int(11) NOT NULL,
  `nama_kurir` varchar(255) NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `tarif` int(11) NOT NULL,
  `regex` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_pengiriman`
--

INSERT INTO `jenis_pengiriman` (`id`, `nama_kurir`, `waktu`, `tarif`, `regex`) VALUES
(1, 'SiLambat', '3 Hari', 15000, 'SLT'),
(2, 'EntarAja', '4 Hari', 10000, 'ETA'),
(3, 'JuNeT', '2 Hari', 20000, 'TEJ'),
(4, 'ENJ', '3 Hari', 17000, 'CGK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`id`, `payment`) VALUES
(1, 'MasterCard'),
(2, 'Pos Indonesia'),
(3, 'Gopay');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_img` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `user_id`, `product_name`, `category_id`, `color_id`, `size_id`, `condition_id`, `product_price`, `product_desc`, `product_img`, `created_at`) VALUES
(80, 41, 'Tshirt BMTH', 1, 3, 3, 1, 99000, 'Kaos unofficial BMTH\r\nBahan Kaos : New States Apparel - Premium (Build up - tanpa jahitan samping)\r\n.\r\nSablon : DTG brother GTX (original print)\r\n-------------------------------------------\r\nUnisex Cowok & Cewek\r\nLebar x Panjang\r\nSize Chart NSA & GILDAN\r\nS = (Lebar 47 cm x Tinggi 66 cm)\r\nM = (Lebar 50 cm x Tinggi 69 cm)\r\nL = (Lebar 53 cm x Tinggi 72 cm)\r\nXL = (Lebar 56 cm x Tinggi 74 cm)\r\n2XL (Lebar 59cm x Tinggi 78 ) - chat untuk ketersediaan size', '/images/img-1611539288667.jpg,/images/img-1611539288672.jpg', '2021-01-25 08:48:08'),
(81, 41, 'Tshirt 3second', 1, 4, 1, 1, 89000, 'Kaos 3second ORIGINAL', '/images/img-1611539317380.jpg,/images/img-1611539317382.jpg', '2021-01-25 08:48:37'),
(84, 41, 'Celana Pendek Santai', 2, 3, 4, 1, 35000, 'Celana kolor pendek. Cocok untuk bersantai', '/images/img-1611539454702.jpg', '2021-01-25 08:50:54'),
(85, 41, 'Celana Jeans RIPCURL', 4, 2, 5, 1, 35000, 'Jeans RIPCURL. Original', '/images/img-1611539527237.jpg,/images/img-1611539527239.png', '2021-01-25 08:52:07'),
(90, 41, 'Jacket Esport', 3, 1, 3, 2, 150000, 'Jacket lorem Ipsum dolor sit amet', '/images/img-1611626398243.jpg,/images/img-1611626398817.jpg,/images/img-1611626398818.jpg', '2021-01-26 08:59:58'),
(93, 45, 'Sepatu Nike Merah', 5, 1, 3, 1, 190000, 'Produk baru', '/images/img-1613041276093.jpg', '2021-01-28 05:50:47'),
(96, 45, 'Army Short', 2, 2, 3, 1, 98900, 'Army short camouflage', '/images/img-1613097512408.jpg', '2021-02-12 09:38:32'),
(98, 45, 'Nike Black', 5, 4, 4, 1, 250000, 'Nike Black Original', '/images/img-1613097663268.jpg', '2021-02-12 09:41:03');

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
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pengiriman`
--

CREATE TABLE `status_pengiriman` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `status_pengiriman`
--

INSERT INTO `status_pengiriman` (`id`, `status`) VALUES
(1, 'ORDER PLACED'),
(2, 'ON PROCCESS'),
(3, 'DELIVERING'),
(4, 'DELIVERED');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_chat`
--

CREATE TABLE `tb_chat` (
  `id` int(11) NOT NULL,
  `seller` int(11) NOT NULL,
  `buyer` int(11) NOT NULL,
  `chatroom` varchar(15) NOT NULL,
  `sender` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_chat`
--

INSERT INTO `tb_chat` (`id`, `seller`, `buyer`, `chatroom`, `sender`, `message`, `created_at`) VALUES
(1, 45, 46, 'S45B46', 45, 'Halo gan', '2021-02-11 02:38:45'),
(21, 45, 46, 'S45B46', 46, 'Halo', '2021-02-11 04:16:54'),
(22, 45, 46, 'S45B46', 45, 'Kosong gan', '2021-02-11 04:17:41'),
(23, 45, 46, 'S45B46', 46, 'apanya?', '2021-02-11 04:18:05'),
(24, 45, 46, 'S45B46', 45, 'Barangnya', '2021-02-11 04:18:18'),
(27, 41, 46, 'S41B46', 46, 'Barangnya ada?', '2021-02-11 04:37:31'),
(28, 41, 46, 'S41B46', 46, 'ada ga?', '2021-02-11 04:41:26'),
(29, 41, 46, 'S41B46', 41, 'Kosong', '2021-02-11 04:42:34'),
(30, 41, 46, 'S41B46', 46, 'masa sih?', '2021-02-11 04:44:10'),
(31, 41, 46, 'S41B46', 41, 'Kosong', '2021-02-11 04:44:50'),
(32, 41, 46, 'S41B46', 46, 'serius?', '2021-02-11 04:45:39'),
(33, 41, 46, 'S41B46', 46, 'ya?', '2021-02-11 04:45:51'),
(34, 41, 46, 'S41B46', 41, 'Hooh', '2021-02-11 04:46:03'),
(35, 41, 46, 'S41B46', 41, 'Hooh', '2021-02-11 05:08:05'),
(36, 41, 46, 'S41B46', 41, 'ya', '2021-02-11 05:08:37'),
(37, 41, 46, 'S41B46', 41, 'wkwk', '2021-02-11 05:09:15'),
(38, 41, 46, 'S41B46', 46, 'woi', '2021-02-11 05:12:33'),
(39, 41, 46, 'S41B46', 41, 'test origin', '2021-02-11 05:26:00'),
(40, 41, 46, 'S41B46', 46, 'masuk', '2021-02-11 05:26:12'),
(41, 41, 46, 'S41B46', 46, 'ngentod kau', '2021-02-11 05:35:51'),
(42, 41, 35, 'S41B35', 35, 'Brangnya ada ?', '2021-02-11 10:15:56'),
(43, 45, 46, 'S45B46', 46, '50 ribu boleh?', '2021-02-11 10:44:16'),
(44, 45, 46, 'S45B46', 45, 'Maaf pas bang', '2021-02-11 10:46:35'),
(45, 45, 46, 'S45B46', 46, '45k deh', '2021-02-11 10:46:55'),
(46, 45, 46, 'S45B46', 45, 'Skip', '2021-02-11 10:48:12'),
(47, 45, 46, 'S45B46', 46, 'Ready gan ?', '2021-02-11 18:42:27'),
(48, 45, 46, 'S45B46', 45, 'Kosong', '2021-02-11 18:42:47'),
(49, 45, 46, 'S45B46', 45, 'Oke gan', '2021-02-11 22:19:02'),
(50, 45, 46, 'S45B46', 46, '', '2021-02-11 22:20:47'),
(51, 45, 46, 'S45B46', 46, 'jsjshdhdgddhhdhdjajsskhdkksdhdhsksjhsjskskshdhsjdbrjwkdhdhejdjskfkhskdkdhrnkwskhrkskskjrrktjsj', '2021-02-11 22:37:37'),
(52, 45, 46, 'S45B46', 45, 'asdadadasdasdjhabsdjjakbsdkjabsdkasbdkajsbdkajsdbakjsdbakjsdbakjsdbakjsdasdasd', '2021-02-11 22:43:07'),
(53, 45, 46, 'S45B46', 45, 'jadi order gan ?', '2021-02-11 23:27:00'),
(54, 45, 46, 'S45B46', 46, 'gajadi, mahal', '2021-02-11 23:27:25'),
(55, 45, 46, 'S45B46', 46, 'oke', '2021-02-11 23:28:09'),
(56, 45, 46, 'S45B46', 46, 'Ngav', '2021-02-12 07:28:00'),
(57, 45, 46, 'S45B46', 45, 'oi', '2021-02-12 07:28:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_favourite`
--

CREATE TABLE `tb_favourite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_item_order`
--

CREATE TABLE `tb_item_order` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `trxId` varchar(255) NOT NULL,
  `payment` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isReviewed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_item_order`
--

INSERT INTO `tb_item_order` (`id`, `product_id`, `product_name`, `color`, `size`, `qty`, `price`, `product_img`, `trxId`, `payment`, `address`, `user_id`, `isReviewed`) VALUES
(26, 90, 'Jacket Esport', 'Red', 'M', 2, 150000, '/images/img-1611626398243.jpg', 'TRX9464204', 2, 9, 43, 0),
(27, 85, 'Celana Jeans RIPCURL', 'Red', 'XS', 1, 35000, '/images/img-1611539527237.jpg', 'TRX1638681', 1, 9, 43, 0),
(28, 84, 'Celana Pendek Santai', 'Blue', 'L', 2, 35000, '/images/img-1611539454702.jpg', 'TRX1638681', 1, 9, 43, 0),
(29, 80, 'Tshirt BMTH', 'Red', 'XS', 1, 99000, '/images/img-1611539288667.jpg', 'TRX1638681', 1, 9, 43, 0),
(30, 90, 'Jacket Esport', 'Red', 'M', 1, 150000, '/images/img-1611626398243.jpg', 'TRX7306038', 2, 9, 43, 0),
(31, 81, 'Tshirt 3second', 'Red', 'XS', 2, 89000, '/images/img-1611539317380.jpg', 'TRX7306038', 2, 9, 43, 0),
(32, 93, 'Porudk baru', 'Green', 'M', 1, 9000, '/images/img-1611787846068.jpg', 'TRX6472751', 2, 9, 43, 0),
(33, 93, 'Porudk baru', 'Green', 'M', 2, 9000, '/images/img-1611787846068.jpg', 'TRX6472752', 1, 11, 43, 0),
(34, 91, 'Celana Jeans RIPCURL', 'Red', 'XS', 1, 35000, '/images/img-1611786903667.jpg', 'TRX6472753', 2, 11, 43, 0),
(35, 91, 'Celana Jeans RIPCURL', 'Red', 'XS', 1, 35000, '/images/img-1611786903667.jpg', 'TRX258350', 2, 16, 46, 0),
(36, 93, 'Sepatu Nike Merah', 'Red', 'M', 1, 9000, '/images/img-1613041276093.jpg', 'TRX711439', 1, 16, 46, 0),
(40, 93, 'Sepatu Nike Merah', 'Red', 'M', 2, 9000, '/images/img-1613041276093.jpg', 'TRX1204172', 3, 16, 46, 0),
(41, 93, 'Sepatu Nike Merah', 'Red', 'M', 1, 9000, '/images/img-1613041276093.jpg', 'TRX1204173', 1, 16, 46, 0),
(42, 93, 'Sepatu Nike Merah', 'Red', 'M', 1, 9000, '/images/img-1613041276093.jpg', 'TRX1204174', 2, 16, 46, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_notification`
--

CREATE TABLE `tb_notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_notification`
--

INSERT INTO `tb_notification` (`id`, `user_id`, `level`, `title`, `message`) VALUES
(1, 45, 2, 'Horee~', 'Ada order masuk nich~'),
(2, 46, 1, 'Checkout berhasil pada transaksi', 'Hore checkout kamu berhasil, share ke temenmu dan dapetin kupon cashbacknya'),
(3, 46, 1, 'Horee~', 'Pesanan kamu dengan no transaksi TRX1204170 sedang dikemas~'),
(4, 46, 1, 'Horee~', 'Pesanan kamu dengan no transaksi TRX1204170 sudah dikirim sama seller~'),
(5, 45, 2, 'Horee~', 'Pesanan sudah dengan no transaksi TRX1204170 diterima oleh pembeli~'),
(6, 45, 2, 'Horee~', 'Ada order masuk nich~'),
(7, 46, 1, 'Checkout berhasil TRX1204171', 'Hore checkout kamu berhasil, share ke temenmu dan dapetin kupon cashbacknya'),
(8, 46, 1, 'Horee~', 'Pesanan kamu dengan no transaksi TRX711439 sudah dikirim sama seller~'),
(9, 45, 2, 'Horee~', 'Pesanan sudah dengan no transaksi TRX711439 diterima oleh pembeli~'),
(10, 46, 1, 'Checkout berhasil TRX1204172', 'Hore checkout kamu berhasil, share ke temenmu dan dapetin kupon cashbacknya'),
(12, 45, 2, 'Horee~', 'Order masuk dengan no. Transaksi undefined '),
(13, 46, 1, 'Checkout berhasil TRX1204173', 'Hore checkout kamu berhasil, share ke temenmu dan dapetin kupon cashbacknya'),
(14, 45, 2, 'Horee~', 'Order masuk dengan no. Transaksi undefined '),
(15, 46, 1, 'Checkout berhasil TRX1204174', 'Hore checkout kamu berhasil, share ke temenmu dan dapetin kupon cashbacknya'),
(16, 45, 2, 'Horee~', 'Order masuk dengan no. Transaksi undefined '),
(17, 46, 1, 'Checkout berhasil TRX1204175', 'Hore checkout kamu berhasil, share ke temenmu dan dapetin kupon cashbacknya'),
(18, 45, 2, 'Horee~', 'Order masuk dengan no. Transaksi undefined '),
(24, 46, 1, 'Horee~', 'Pesanan kamu dengan no transaksi TRX1204172 sedang dikemas~'),
(25, 46, 1, 'Horee~', 'Pesanan kamu dengan no transaksi TRX1204173 sedang dikemas~'),
(26, 46, 1, 'Horee~', 'Pesanan kamu dengan no transaksi TRX1204173 sudah dikirim sama seller~');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_otp`
--

CREATE TABLE `tb_otp` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_otp`
--

INSERT INTO `tb_otp` (`id`, `email`, `otp`) VALUES
(22, 'fovaxac192@sofiarae.com', 'C8LyuV');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_otp_activation`
--

CREATE TABLE `tb_otp_activation` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_otp_activation`
--

INSERT INTO `tb_otp_activation` (`id`, `email`, `otp`) VALUES
(1, 'ariefwidiyatmoko39@gmail.com', 'KTi9kv'),
(7, 'ariefwidiyatmoko38@gmail.com', '5o5KT7'),
(16, 'admin@grabtoko.mail.com', 'GPgwIE'),
(17, 'zaloraclothx2@mail.com', '011BOe'),
(18, 'seelechan01@honkai.mail.com', 'cSW1gI'),
(20, 'zalora@mail.com', 'KUf6v0'),
(26, 'zwallet.arkademy@gmail.com', 'UL22nK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_review`
--

CREATE TABLE `tb_review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_review`
--

INSERT INTO `tb_review` (`id`, `user_id`, `product_id`, `rating`, `review`, `created_at`) VALUES
(12, 41, 85, 4, 'Hehe', '2021-01-25 16:49:59'),
(13, 42, 85, 1, 'Heheh 2', '2021-01-25 16:50:13'),
(15, 43, 90, 4, 'Jaketnya bagus, adem dipakai', '2021-01-27 08:42:22'),
(16, 43, 93, 4, 'Jacketnya bagus', '2021-01-28 10:29:18'),
(17, 43, 93, 3, 'Wah barangnya bagus , cuma seller kurang sopan', '2021-01-28 10:49:35'),
(19, 46, 93, 3, 'Bagus sekali', '2021-02-09 06:35:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `TrxId` varchar(255) NOT NULL,
  `payment` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `kurir` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trackingNumber` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `user_id`, `TrxId`, `payment`, `address`, `kurir`, `total`, `qty`, `trackingNumber`, `status`, `created_at`) VALUES
(21, 43, 'TRX9464204', 2, 9, 1, 315000, 1, 'CGKAA77209128', 4, '2021-01-27 02:50:42'),
(22, 43, 'TRX1638681', 1, 9, 2, 219000, 3, 'ETA8078110', 4, '2021-01-27 03:12:57'),
(24, 43, 'TRX7306038', 2, 9, 2, 338000, 2, 'CGKA72778025989', 4, '2021-01-27 07:59:15'),
(25, 43, 'TRX6472751', 2, 9, 4, 26000, 1, 'CGK0000001', 4, '2021-01-28 10:27:25'),
(26, 43, 'TRX6472752', 1, 11, 2, 28000, 1, 'ETA0000000', 4, '2021-01-28 10:45:01'),
(27, 43, 'TRX6472753', 2, 11, 4, 52000, 1, 'BELUM ADA DATA', 1, '2021-01-28 10:45:41'),
(28, 46, 'TRX258350', 2, 16, 3, 55000, 1, 'TEJxxxxxxx', 4, '2021-02-11 11:29:33'),
(29, 46, 'TRX711439', 1, 16, 1, 24000, 1, 'SLT001002003', 4, '2021-02-11 18:49:51'),
(33, 46, 'TRX1204172', 3, 16, 4, 35000, 1, 'BELUM ADA DATA', 2, '2021-02-12 08:55:57'),
(34, 46, 'TRX1204173', 1, 16, 3, 29000, 1, 'TEJ0000000X', 3, '2021-02-12 08:57:56'),
(35, 46, 'TRX1204174', 2, 16, 4, 26000, 1, 'BELUM ADA DATA', 1, '2021-02-12 08:58:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT '/images/default.jpg',
  `storeName` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `email`, `password`, `fullname`, `level_id`, `photo`, `storeName`, `isActive`) VALUES
(35, 'ariefwidiyatmoko38@gmail.com', '$2b$08$ydMF/6rRKK7wFEvE3YK7DuxQW7nIY99Vinve5ThPnxZX9Cjlfi7ZS', 'Arief Widiyatmoko', 1, '/images/default.jpg', '', 1),
(40, 'fovaxac192@sofiarae.com', '$2b$04$6DA0zQT6dSNRp1jx95NMLeiE3qFOv0L7A6rYEYVO5Kj/WUgCUiFEW', 'Sofa', 1, '/images/default.jpg', '', 1),
(41, 'admin@grabtoko.mail.com', '$2b$06$DkBHRmZGK/e7rlP9ZPuisOLrInxuX/B9qmnpJvfwmqGboIxwOPV1.', 'Admin GrabToko', 2, '/images/default.jpg', 'GrabToko', 1),
(42, 'zaloraclothx2@mail.com', '$2b$04$fxO/mq/it7XqGDrsjq.64eBxkL/lhlxYHY1rDK9V/6oiDqbNTQQPa', 'Muhammad Shadow', 2, '/images/default.jpg', 'Zalora@', 1),
(43, 'seelechan01@mail.com', '$2b$08$LwRyRnB3tJJFPIkhqIRY6.xlLrjp/YSW6t4/UKNW0cBfz5z.7lmlu', 'Seele Vollerei', 1, '/images/default.jpg', '', 1),
(44, '1910cde@gmail.com', '$2b$06$wRbOeXu/W.kWuvq.zoVPmuYdsnRzfQXW60plLBfBiqGvYQDtTKBtq', 'Awank', 1, '/images/default.jpg', '', 1),
(45, 'zalora@mail.com', '$2b$04$pGxI2TXXr04bBwoZVxfNCuj2UTp3Y5sDy84oNvSykX7xwUM73dDF6', 'Zalora ', 2, '/images/default.jpg', 'Zalora Store', 1),
(46, 'bronyazaychik96@gmail.com', '$2b$04$aJtnZ/CL8PVDTVHp9HZFFOgqZZMlGQfdOeNWn7Z78ZU5sJ979dccy', 'Arief Widiyatmoko', 1, '/images/default.jpg', '', 1),
(51, 'zwallet.arkademy@gmail.com', '$2b$09$HNVa6ATI7Pq66MIEu.owN.gqWsUtubRJhP3.mJ/fDvXgZGs0EI81m', 'Arka Demy', 1, '/images/default.jpg', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indeks untuk tabel `jenis_pengiriman`
--
ALTER TABLE `jenis_pengiriman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `size_id` (`size_id`),
  ADD KEY `condition_id` (`condition_id`);

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
-- Indeks untuk tabel `status_pengiriman`
--
ALTER TABLE `status_pengiriman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`);

--
-- Indeks untuk tabel `tb_favourite`
--
ALTER TABLE `tb_favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_item_order`
--
ALTER TABLE `tb_item_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_notification`
--
ALTER TABLE `tb_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_otp`
--
ALTER TABLE `tb_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_otp_activation`
--
ALTER TABLE `tb_otp_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_review`
--
ALTER TABLE `tb_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
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
-- AUTO_INCREMENT untuk tabel `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `auth_level`
--
ALTER TABLE `auth_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `blacklist_token`
--
ALTER TABLE `blacklist_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- AUTO_INCREMENT untuk tabel `jenis_pengiriman`
--
ALTER TABLE `jenis_pengiriman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

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
-- AUTO_INCREMENT untuk tabel `status_pengiriman`
--
ALTER TABLE `status_pengiriman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_chat`
--
ALTER TABLE `tb_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `tb_favourite`
--
ALTER TABLE `tb_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_item_order`
--
ALTER TABLE `tb_item_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `tb_notification`
--
ALTER TABLE `tb_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tb_otp`
--
ALTER TABLE `tb_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `tb_otp_activation`
--
ALTER TABLE `tb_otp_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tb_review`
--
ALTER TABLE `tb_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`condition_id`) REFERENCES `conditions` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD CONSTRAINT `tb_chat_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `tb_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_review`
--
ALTER TABLE `tb_review`
  ADD CONSTRAINT `tb_review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `tb_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `auth_level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
