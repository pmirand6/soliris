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

-- Volcando estructura para tabla soliris.presentacion
CREATE TABLE IF NOT EXISTS `presentacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL DEFAULT '',
  `producto_id` int(11) unsigned NOT NULL,
  `codigo_np` int(123) DEFAULT NULL,
  `familia` varchar(3) DEFAULT 'SOL',
  `usuario_audit` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pres_usuario` (`usuario_audit`),
  KEY `FK_presentacion_producto` (`producto_id`),
  CONSTRAINT `FK_presentacion_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `FK_pres_usuario` FOREIGN KEY (`usuario_audit`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 COMMENT='Tabla de dosis de presentaciones';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
