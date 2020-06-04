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

-- Volcando estructura para tabla soliris.rel_medico_documentos
CREATE TABLE IF NOT EXISTS `rel_medico_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medico_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_id` int(10) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id`),
  KEY `FK_rel_doc_medico` (`documento_id`),
  KEY `FK_rel_med_doc_estado` (`estado_id`),
  KEY `FK_rel_medico_doc` (`medico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=16384 COMMENT='Tabla de relacion entre los documentos y los registro de la venta';

-- Volcando datos para la tabla soliris.rel_medico_documentos: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_medico_documentos` DISABLE KEYS */;
INSERT INTO `rel_medico_documentos` (`id`, `medico_id`, `documento_id`, `fecha_creacion`, `estado_id`) VALUES
	(1, 1, 5, '2020-04-13 15:46:58', 16),
	(2, 2, 11, '2020-04-15 15:26:28', 15),
	(3, 3, 12, '2020-04-15 16:32:30', 15),
	(4, 4, 13, '2020-04-15 16:33:04', 15),
	(5, 16, 31, '2020-04-16 20:16:53', 16),
	(6, 1, 32, '2020-04-20 15:26:35', 16),
	(7, 1, 33, '2020-04-20 15:27:37', 16),
	(8, 1, 34, '2020-04-20 15:28:11', 16),
	(9, 1, 35, '2020-04-20 15:29:00', 16),
	(10, 1, 36, '2020-04-20 15:30:45', 16),
	(11, 1, 37, '2020-04-20 15:31:04', 16),
	(12, 1, 38, '2020-04-20 15:34:00', 16),
	(13, 1, 39, '2020-04-20 15:36:14', 16),
	(14, 1, 40, '2020-04-20 15:36:32', 16),
	(15, 1, 41, '2020-04-20 15:36:45', 16),
	(16, 1, 42, '2020-04-20 15:37:28', 16),
	(17, 1, 43, '2020-04-20 15:38:10', 16),
	(18, 1, 44, '2020-04-20 15:38:21', 16),
	(19, 1, 45, '2020-04-20 15:39:21', 16),
	(20, 16, 46, '2020-04-20 15:40:07', 15),
	(21, 1, 53, '2020-04-24 04:01:10', 15),
	(22, 17, 54, '2020-04-24 08:19:56', 15),
	(23, 274, 55, '2020-04-24 17:29:29', 15),
	(24, 334, 64, '2020-04-27 08:21:28', 15),
	(25, 335, 81, '2020-04-30 00:43:41', 16),
	(26, 335, 82, '2020-04-30 01:37:21', 16),
	(27, 335, 83, '2020-04-30 01:49:49', 16),
	(28, 335, 84, '2020-04-30 01:50:19', 16),
	(29, 335, 85, '2020-04-30 01:50:47', 16),
	(30, 335, 86, '2020-04-30 01:51:37', 16),
	(31, 335, 87, '2020-04-30 01:52:35', 16),
	(32, 335, 88, '2020-04-30 01:54:02', 16),
	(33, 335, 89, '2020-04-30 01:54:27', 16),
	(34, 335, 90, '2020-04-30 01:55:13', 16),
	(35, 335, 91, '2020-04-30 01:56:01', 16),
	(36, 335, 92, '2020-04-30 01:56:52', 15),
	(37, 336, 93, '2020-04-30 01:57:53', 15),
	(38, 337, 94, '2020-04-30 02:06:52', 15);
/*!40000 ALTER TABLE `rel_medico_documentos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
