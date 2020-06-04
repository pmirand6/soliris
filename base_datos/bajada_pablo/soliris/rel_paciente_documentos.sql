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

-- Volcando estructura para tabla soliris.rel_paciente_documentos
CREATE TABLE IF NOT EXISTS `rel_paciente_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_doc_doc` (`documento_id`),
  KEY `FK_doc_pac` (`paciente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 COMMENT='Tabla de relacion de los documentos de los pacientes en el sistema';

-- Volcando datos para la tabla soliris.rel_paciente_documentos: ~29 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_paciente_documentos` DISABLE KEYS */;
INSERT INTO `rel_paciente_documentos` (`id`, `paciente_id`, `documento_id`, `fecha_creacion`) VALUES
	(1, 1, 1, '2020-04-13 15:32:13'),
	(2, 1, 2, '2020-04-13 15:32:13'),
	(3, 1, 3, '2020-04-13 15:33:29'),
	(4, 1, 4, '2020-04-13 15:33:29'),
	(5, 2, 6, '2020-04-13 15:57:09'),
	(6, 3, 17, '2020-04-15 22:24:10'),
	(7, 4, 18, '2020-04-15 22:24:16'),
	(8, 5, 19, '2020-04-15 22:24:24'),
	(9, 6, 20, '2020-04-15 22:24:32'),
	(10, 7, 21, '2020-04-15 22:24:39'),
	(11, 8, 22, '2020-04-15 22:24:45'),
	(12, 9, 23, '2020-04-15 22:24:54'),
	(13, 10, 24, '2020-04-15 22:25:00'),
	(14, 11, 25, '2020-04-15 22:25:05'),
	(15, 13, 50, '2020-04-21 14:35:40'),
	(16, 15, 56, '2020-04-24 17:39:36'),
	(17, 16, 62, '2020-04-27 01:49:58'),
	(18, 17, 63, '2020-04-27 01:52:34'),
	(19, 18, 65, '2020-04-27 09:26:24'),
	(20, 19, 67, '2020-04-27 09:52:46'),
	(21, 20, 69, '2020-04-27 10:32:42'),
	(22, 20, 70, '2020-04-27 10:32:42'),
	(23, 21, 95, '2020-05-05 11:18:51'),
	(24, 22, 98, '2020-05-05 14:33:27'),
	(25, 23, 104, '2020-05-07 10:15:05'),
	(26, 23, 105, '2020-05-07 10:38:06'),
	(27, 1, 106, '2020-05-10 19:54:00'),
	(28, 24, 107, '2020-05-11 00:17:50'),
	(29, 2, 108, '2020-05-11 10:48:18');
/*!40000 ALTER TABLE `rel_paciente_documentos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
