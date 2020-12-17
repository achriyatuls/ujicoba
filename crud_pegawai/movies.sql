-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2020 pada 09.40
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udacoding`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `movies`
--

CREATE TABLE `movies` (
  `id` varchar(3) NOT NULL,
  `title` varchar(50) NOT NULL,
  `imageurl` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `rating` varchar(3) NOT NULL,
  `year` varchar(4) NOT NULL,
  `duration` varchar(4) NOT NULL,
  `favorite` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `movies`
--

INSERT INTO `movies` (`id`, `title`, `imageurl`, `description`, `rating`, `year`, `duration`, `favorite`) VALUES
('002', 'startup', 'startup.png', 'drama nam dosan', '12', '2020', '16', 0),
('003', 'its okay not to be okay', 'its_okay.jpg', 'Drama ini menceritakan seorang pria yang tidak percaya cinta bekerja di bangsal psikiatris sebagai pengasuh bernama Moon Kang Tae (Kim Soo Hyun).\r\nIa bertugas untuk menulis kondisi pasien seperti jika pasien berkelahi atau kabur, ia mendapat penghasilan', '', '2020', '95', 0),
('1', 'satu', '18_again.jpeg', 'sastu satu ', '1', '2020', '95', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
