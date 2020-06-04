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

-- Volcando estructura para tabla soliris.maestro_ventas_transaccion
CREATE TABLE IF NOT EXISTS `maestro_ventas_transaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) NOT NULL,
  `usuario_id` int(11) unsigned NOT NULL,
  `maestro_id` int(11) unsigned NOT NULL,
  `tipo_venta_id` int(11) NOT NULL,
  `fecha_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_venta_tipo_transaccion` (`tipo_venta_id`),
  KEY `FK_estado_venta` (`estado_id`),
  KEY `FK_usuario_venta` (`usuario_id`),
  KEY `FK_venta_id` (`maestro_id`),
  CONSTRAINT `FK_estado_venta` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_usuario_venta` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_venta_id` FOREIGN KEY (`maestro_id`) REFERENCES `maestro_ventas` (`id`),
  CONSTRAINT `FK_venta_tipo_transaccion` FOREIGN KEY (`tipo_venta_id`) REFERENCES `maestro_ventas_tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2340 COMMENT='Tabla que muestra el historial de estados de las transacciones realizadas sobre una venta';

-- Volcando datos para la tabla soliris.maestro_ventas_transaccion: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_transaccion` DISABLE KEYS */;
INSERT INTO `maestro_ventas_transaccion` (`id`, `estado_id`, `usuario_id`, `maestro_id`, `tipo_venta_id`, `fecha_stamp`) VALUES
	(1, 22, 34, 45, 2, '2020-04-21 13:18:26'),
	(2, 22, 34, 46, 2, '2020-04-21 13:18:53'),
	(3, 22, 50, 47, 2, '2020-04-21 14:31:22'),
	(4, 22, 34, 48, 1, '2020-04-21 15:21:59'),
	(5, 22, 34, 49, 2, '2020-04-23 14:29:43'),
	(6, 22, 34, 50, 1, '2020-04-23 15:18:09'),
	(7, 22, 34, 51, 1, '2020-04-24 19:17:45'),
	(8, 22, 50, 52, 2, '2020-04-27 01:47:27'),
	(9, 22, 34, 53, 2, '2020-04-27 09:51:10'),
	(10, 22, 34, 54, 1, '2020-04-27 09:54:27'),
	(11, 22, 34, 55, 1, '2020-04-27 11:22:03'),
	(12, 22, 34, 56, 2, '2020-04-27 11:29:17'),
	(13, 22, 50, 57, 2, '2020-04-28 01:50:51'),
	(14, 22, 50, 58, 2, '2020-04-28 01:55:14'),
	(15, 22, 50, 59, 2, '2020-04-28 01:56:32'),
	(16, 22, 50, 60, 2, '2020-04-28 01:56:42'),
	(17, 22, 50, 61, 2, '2020-04-28 01:59:42'),
	(18, 22, 50, 62, 2, '2020-04-28 02:02:16'),
	(19, 22, 50, 63, 2, '2020-04-28 02:05:34'),
	(20, 22, 50, 64, 2, '2020-04-28 02:06:28'),
	(21, 22, 50, 65, 2, '2020-04-28 02:07:13'),
	(22, 22, 50, 66, 2, '2020-04-28 02:07:59'),
	(23, 22, 50, 67, 2, '2020-04-28 02:11:29'),
	(24, 22, 34, 68, 1, '2020-05-05 11:26:47'),
	(25, 22, 34, 69, 1, '2020-05-05 11:28:13'),
	(26, 22, 34, 70, 1, '2020-05-06 10:11:36'),
	(27, 22, 34, 71, 1, '2020-05-06 10:22:04'),
	(28, 22, 34, 72, 2, '2020-05-06 10:28:26');
/*!40000 ALTER TABLE `maestro_ventas_transaccion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
