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

-- Volcando estructura para tabla soliris.rel_medico_especialidad
CREATE TABLE IF NOT EXISTS `rel_medico_especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medico_id` int(11) unsigned NOT NULL DEFAULT '0',
  `especialidad_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_rel_esp` (`especialidad_id`),
  KEY `FK_rel_medico` (`medico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=16384;

-- Volcando datos para la tabla soliris.rel_medico_especialidad: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_medico_especialidad` DISABLE KEYS */;
INSERT INTO `rel_medico_especialidad` (`id`, `medico_id`, `especialidad_id`) VALUES
	(2, 2, 2),
	(3, 3, 1),
	(4, 3, 2),
	(5, 4, 1),
	(6, 4, 2),
	(7, 5, 1),
	(8, 5, 2),
	(9, 6, 1),
	(10, 6, 2),
	(11, 8, 1),
	(12, 8, 2),
	(40, 15, 1),
	(41, 15, 2),
	(42, 16, 1),
	(43, 16, 2),
	(44, 1, 2),
	(45, 17, 1),
	(46, 17, 2),
	(50, 274, 1),
	(51, 334, 5),
	(62, 335, 4),
	(69, 336, 8),
	(70, 336, 9),
	(71, 337, 10);
/*!40000 ALTER TABLE `rel_medico_especialidad` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
