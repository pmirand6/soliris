-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.11-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
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
  KEY `FK_estado_venta` (`estado_id`),
  KEY `FK_usuario_venta` (`usuario_id`),
  KEY `FK_venta_id` (`maestro_id`),
  KEY `FK_venta_tipo_transaccion` (`tipo_venta_id`),
  CONSTRAINT `FK_estado_venta` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_usuario_venta` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_venta_id` FOREIGN KEY (`maestro_id`) REFERENCES `maestro_ventas` (`id`),
  CONSTRAINT `FK_venta_tipo_transaccion` FOREIGN KEY (`tipo_venta_id`) REFERENCES `maestro_ventas_tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que muestra el historial de estados de las transacciones realizadas sobre una venta';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
