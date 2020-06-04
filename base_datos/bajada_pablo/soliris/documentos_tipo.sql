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

-- Volcando estructura para tabla soliris.documentos_tipo
CREATE TABLE IF NOT EXISTS `documentos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 COMMENT='referencia de tipos de documentos del sistema';

-- Volcando datos para la tabla soliris.documentos_tipo: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos_tipo` DISABLE KEYS */;
INSERT INTO `documentos_tipo` (`id`, `tipo`, `referencia`) VALUES
	(1, 'Vacunacion', 'Paciente'),
	(2, 'Otro', 'Paciente'),
	(3, 'Receta', 'Venta'),
	(4, 'Otro', 'Venta'),
	(5, 'Certificado Calidad', 'Venta'),
	(6, 'Capacitación', 'Medico');
/*!40000 ALTER TABLE `documentos_tipo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
