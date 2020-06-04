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

-- Volcando estructura para tabla soliris.mail_configuracion
CREATE TABLE IF NOT EXISTS `mail_configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL DEFAULT '',
  `estado_id` int(11) NOT NULL DEFAULT '0',
  `familia` varchar(50) NOT NULL DEFAULT '0',
  `tabla_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tabla_audit` (`tabla_id`),
  CONSTRAINT `FK_tabla_audit` FOREIGN KEY (`tabla_id`) REFERENCES `audit_tablas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192 COMMENT='Esta tabla va a contener los avisos que tiene el sistema';

-- Volcando datos para la tabla soliris.mail_configuracion: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mail_configuracion` DISABLE KEYS */;
INSERT INTO `mail_configuracion` (`id`, `descripcion`, `estado_id`, `familia`, `tabla_id`) VALUES
	(1, 'Alta de Venta', 1, '1', 2),
	(2, 'Cancelacion Paciente', 1, '0', 1),
	(3, 'Alta de Medico', 1, '0', 11),
	(4, 'Modificacion Medico', 1, '0', 11),
	(5, 'Baja Medico', 1, '0', 11),
	(6, 'Modificacion de Venta', 1, '0', 2),
	(7, 'Alta de Paciente', 1, '0', 1),
	(8, 'Modificacion Paciente', 1, '0', 1),
	(9, 'Dictamen Paciente', 1, '1', 1);
/*!40000 ALTER TABLE `mail_configuracion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
