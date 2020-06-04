-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5965
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla soliris.rel_venta_documentos
CREATE TABLE IF NOT EXISTS `rel_venta_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_documento_venta` (`documento_id`),
  KEY `FK_venta_id_rel` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=16384 COMMENT='Tabla de relacion entre los documentos y los registro de la venta';

-- Volcando datos para la tabla soliris.rel_venta_documentos: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_venta_documentos` DISABLE KEYS */;
INSERT INTO `rel_venta_documentos` (`id`, `venta_id`, `documento_id`, `fecha_creacion`) VALUES
	(1, 6, 7, '2020-04-13 15:59:51'),
	(2, 6, 8, '2020-04-14 15:38:40'),
	(3, 6, 9, '2020-04-14 15:46:11'),
	(4, 6, 10, '2020-04-14 15:51:39'),
	(5, 7, 14, '2020-04-15 21:49:23'),
	(6, 8, 15, '2020-04-15 21:51:38'),
	(7, 9, 16, '2020-04-15 21:52:20'),
	(8, 10, 26, '2020-04-15 22:29:06'),
	(9, 11, 27, '2020-04-15 22:29:28'),
	(10, 12, 28, '2020-04-15 22:29:51'),
	(11, 13, 30, '2020-04-15 22:31:00'),
	(12, 45, 47, '2020-04-21 13:18:26'),
	(13, 46, 48, '2020-04-21 13:18:53'),
	(14, 47, 49, '2020-04-21 14:31:22'),
	(15, 48, 51, '2020-04-21 15:21:59'),
	(16, 50, 52, '2020-04-23 15:18:09'),
	(17, 51, 57, '2020-04-24 19:17:45'),
	(18, 51, 58, '2020-04-24 19:19:01'),
	(19, 51, 59, '2020-04-24 19:20:38'),
	(20, 51, 60, '2020-04-24 19:46:54'),
	(21, 52, 61, '2020-04-27 01:47:28'),
	(22, 53, 66, '2020-04-27 09:51:10'),
	(23, 54, 68, '2020-04-27 09:54:27'),
	(24, 55, 71, '2020-04-27 11:22:04'),
	(25, 56, 72, '2020-04-27 11:29:17'),
	(26, 60, 73, '2020-04-28 01:56:42'),
	(27, 61, 74, '2020-04-28 01:59:42'),
	(28, 62, 75, '2020-04-28 02:02:16'),
	(29, 63, 76, '2020-04-28 02:05:34'),
	(30, 64, 77, '2020-04-28 02:06:28'),
	(31, 65, 78, '2020-04-28 02:07:13'),
	(32, 66, 79, '2020-04-28 02:07:59'),
	(33, 67, 80, '2020-04-28 02:11:29'),
	(34, 68, 96, '2020-05-05 11:26:47'),
	(35, 69, 97, '2020-05-05 11:28:13'),
	(36, 70, 99, '2020-05-06 10:11:36'),
	(37, 71, 100, '2020-05-06 10:22:04'),
	(38, 72, 101, '2020-05-06 10:28:26'),
	(39, 72, 102, '2020-05-06 10:29:45'),
	(40, 72, 103, '2020-05-06 10:30:35');
/*!40000 ALTER TABLE `rel_venta_documentos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
