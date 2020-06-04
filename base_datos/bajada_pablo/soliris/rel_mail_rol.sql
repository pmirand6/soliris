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

-- Volcando estructura para tabla soliris.rel_mail_rol
CREATE TABLE IF NOT EXISTS `rel_mail_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_configuracion_id` int(11) NOT NULL DEFAULT '0',
  `rol_id` int(11) unsigned NOT NULL DEFAULT '0',
  `estado_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_mail_rol_id` (`rol_id`),
  KEY `FK_mail_configuracion_id` (`mail_configuracion_id`),
  CONSTRAINT `FK_mail_configuracion_id` FOREIGN KEY (`mail_configuracion_id`) REFERENCES `mail_configuracion` (`id`),
  CONSTRAINT `FK_mail_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 COMMENT='Tabla de relacion de avisos de mail en base al rol';

-- Volcando datos para la tabla soliris.rel_mail_rol: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_mail_rol` DISABLE KEYS */;
INSERT INTO `rel_mail_rol` (`id`, `mail_configuracion_id`, `rol_id`, `estado_id`) VALUES
	(1, 1, 1, 0),
	(3, 2, 5, 0),
	(4, 2, 2, 0),
	(5, 3, 5, 1),
	(6, 4, 5, 1),
	(7, 5, 5, 0),
	(8, 1, 5, 0),
	(9, 6, 5, 0),
	(10, 7, 5, 0),
	(11, 8, 2, 1),
	(12, 9, 2, 1),
	(13, 9, 5, 1),
	(14, 8, 5, 1),
	(15, 7, 1, 0),
	(16, 9, 1, 0);
/*!40000 ALTER TABLE `rel_mail_rol` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
