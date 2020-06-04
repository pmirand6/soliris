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

-- Volcando estructura para tabla soliris.maestro_ventas_lockeo
CREATE TABLE IF NOT EXISTS `maestro_ventas_lockeo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) unsigned NOT NULL DEFAULT '0',
  `usuario_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fecha_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192 COMMENT='Tabla que gestiona los lockeo de registros de venta para su modificacion o creacion de NP';

-- Volcando datos para la tabla soliris.maestro_ventas_lockeo: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_lockeo` DISABLE KEYS */;
INSERT INTO `maestro_ventas_lockeo` (`id`, `venta_id`, `usuario_id`, `fecha_stamp`) VALUES
	(4, 6, 50, '2020-04-14 16:39:28'),
	(6, 47, 50, '2020-04-21 14:31:46'),
	(18, 48, 50, '2020-04-27 00:42:43'),
	(29, 55, 50, '2020-04-27 11:26:18'),
	(32, 72, 34, '2020-05-06 10:35:41'),
	(37, 53, 50, '2020-05-25 21:12:41'),
	(49, 69, 50, '2020-05-31 23:02:27'),
	(58, 54, 34, '2020-05-31 23:12:05');
/*!40000 ALTER TABLE `maestro_ventas_lockeo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
