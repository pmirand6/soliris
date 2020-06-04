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

-- Volcando estructura para tabla soliris.maestro_ventas_tipo
CREATE TABLE IF NOT EXISTS `maestro_ventas_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(2) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 COMMENT='Tipos de Venta';

-- Volcando datos para la tabla soliris.maestro_ventas_tipo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_tipo` DISABLE KEYS */;
INSERT INTO `maestro_ventas_tipo` (`id`, `valor`, `descripcion`) VALUES
	(1, 'RI', 'Registro Inicial'),
	(2, 'FU', 'Follow Up'),
	(3, 'CA', 'Cancelado');
/*!40000 ALTER TABLE `maestro_ventas_tipo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
