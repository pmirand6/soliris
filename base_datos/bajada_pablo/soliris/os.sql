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

-- Volcando estructura para tabla soliris.os
CREATE TABLE IF NOT EXISTS `os` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `descripcion` varchar(255) DEFAULT NULL,
  `aux_1` varchar(255) DEFAULT NULL,
  `aux_2` varchar(255) DEFAULT NULL,
  `u_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'fecha del cambio',
  `usuario` varchar(50) NOT NULL DEFAULT '' COMMENT 'ultimo usuario cambio',
  `estado` varchar(2) NOT NULL DEFAULT 'AC' COMMENT 'activo:1, inactivo:0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='Tabla de Obras Sociales';

-- Volcando datos para la tabla soliris.os: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` (`id`, `nombre`, `descripcion`, `aux_1`, `aux_2`, `u_modificacion`, `usuario`, `estado`) VALUES
	(1, 'AMEPBA', 'Obra social de empleados del Banco Provincia de Buenos Aires', NULL, NULL, '0000-00-00 00:00:00', '', 'AC'),
	(2, 'OSCHOCA', 'Obra Social de Choferes de Camiones', '', '', '2019-11-13 16:59:53', 'np_dcilveti@arndp.raffo.local', 'AC'),
	(3, 'OSGEGYPE', 'Sindicato de obreros y empleados de estaciones de servicio', '', '', '2019-12-06 10:53:27', 'np_dcilveti@arndp.raffo.local', 'AC'),
	(4, 'SIN OBRA SOCIAL', NULL, NULL, NULL, '2020-02-26 00:00:00', '', 'AC'),
	(5, 'IOMA', 'Instituco de Obra Médico Asistencial', NULL, NULL, '0000-00-00 00:00:00', '', 'AC');
/*!40000 ALTER TABLE `os` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
