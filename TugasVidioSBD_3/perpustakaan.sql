-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Waktu pembuatan: 27 Bulan Mei 2025 pada 18.35
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--
CREATE DATABASE IF NOT EXISTS `perpustakaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `perpustakaan`;

DELIMITER $$
--
-- Prosedur
--
DROP PROCEDURE IF EXISTS `kembalikan_buku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `kembalikan_buku` (IN `p_id_peminjaman` INT(10))   BEGIN 
	DECLARE p_id_buku INT;
    DECLARE current_status ENUM('pinjam', 'kembali');
    
    SELECT id_buku, status INTO p_id_buku, current_status
    FROM peminjaman
    WHERE id_peminjaman = p_id_peminjaman;
    
    IF current_status = 'pinjam' THEN
    	UPDATE peminjaman
        SET tanggal_kembali = NOW(),
        	status = 'kembali'
        WHERE id_peminjaman = p_id_peminjaman;
        CALL update_jumlah_buku(p_id_buku, 1, 'beli');
    ELSE 
    	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Buku yang anda pinjam telah dikembalikan sebelumnya✨';
    END IF;
END$$

DROP PROCEDURE IF EXISTS `pinjam_buku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pinjam_buku` (IN `p_id_buku` INT(10), IN `p_id_anggota` INT(10))   BEGIN
	DECLARE stok INT;
    SELECT jumlah INTO stok FROM buku WHERE id_buku = p_id_buku;
    IF stok > 0 THEN
    	INSERT INTO peminjaman(id_buku, id_anggota, status)
        VALUES(p_id_buku, p_id_anggota, 'pinjam');
        
        CALL update_jumlah_buku(p_id_buku, 1, 'pinjam');
    ELSE
    	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mohon maaf buku yang anda cari sedang tidak tersedia';
    END IF;
END$$

DROP PROCEDURE IF EXISTS `update_jumlah_buku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_jumlah_buku` (IN `p_id_buku` INT(10), IN `p_jumlah` INT(10), IN `p_aksi` ENUM('beli','pinjam'))   BEGIN 
	IF p_aksi = 'beli' THEN
    	UPDATE buku
        SET jumlah = jumlah + p_jumlah
        WHERE id_buku = p_id_buku;
    ELSEIF p_aksi = 'pinjam' THEN
    	UPDATE buku
        SET jumlah = jumlah - p_jumlah
        WHERE id_buku = p_id_buku AND jumlah >= p_jumlah;
    END IF;
END$$

--
-- Fungsi
--
DROP FUNCTION IF EXISTS `stok_buku_perpustakaan`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `stok_buku_perpustakaan` () RETURNS INT(11)  BEGIN
	DECLARE total INT;
    SELECT SUM(jumlah) INTO total FROM buku;
    RETURN total;
END$$

DROP FUNCTION IF EXISTS `stok_penulis_buku`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `stok_penulis_buku` (`p_penulis` VARCHAR(100)) RETURNS INT(11)  BEGIN
	DECLARE total INT;
    SELECT SUM(jumlah) INTO total
    FROM buku
    WHERE LOWER(penulis) = LOWER(p_penulis);
    RETURN total;
END$$

DROP FUNCTION IF EXISTS `Total_peminajaman_buku`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Total_peminajaman_buku` (`p_id_anggota` INT(10)) RETURNS INT(11)  BEGIN
	DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM peminjaman
    WHERE id_anggota = p_id_anggota AND status = 'pinjam';
    
    RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

DROP TABLE IF EXISTS `anggota`;
CREATE TABLE `anggota` (
  `id_anggota` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `email`) VALUES
(1, 'Dodi susanto', 'dodi@manusia.com'),
(2, 'Ranti', 'Ranti@manusia.com'),
(3, 'Joana', 'Joana@manusia.com'),
(4, 'gina', 'gina@manusia.com'),
(5, 'algiano', 'algiano@manusia.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku` (
  `id_buku` int(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `jumlah` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `jumlah`) VALUES
(1, 'Laskar Pelangi', 'Andrea Hirata', 13),
(2, 'Negeri 5 Menara', 'Ahmad Faudi', 5),
(3, 'Bumi', 'Tere Liye', 15),
(4, 'Hujan', 'Tere Liye', 3),
(5, 'Pulang', 'Leila S. Chudori', 10),
(6, 'Dilan: Dia adalah Dilanku Tahun 1990', 'Pidi Baiq', 10),
(7, 'Ayat - Ayat Cinta', 'Habiburrahman El Shirazy', 5),
(8, 'Perahu Kertas', 'Dewi Lestari', 10),
(9, 'Rantau 1 Muara', 'Ahmad Faudi', 10),
(10, 'Rembulan Tenggelam di wajahmu', 'Tere Liye', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman` (
  `id_peminjaman` int(10) NOT NULL,
  `id_buku` int(10) NOT NULL,
  `id_anggota` int(10) NOT NULL,
  `status` enum('pinjam','kembali') NOT NULL,
  `tanggal_pinjam` timestamp NULL DEFAULT current_timestamp(),
  `tanggal_kembali` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_buku`, `id_anggota`, `status`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(1, 2, 1, 'kembali', '2025-05-27 06:29:30', '2025-05-27 06:31:30'),
(2, 1, 2, 'kembali', '2025-05-27 06:30:25', '2025-05-27 06:32:45'),
(3, 1, 2, 'pinjam', '2025-05-27 06:30:53', NULL),
(4, 5, 2, 'pinjam', '2025-05-27 06:32:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
