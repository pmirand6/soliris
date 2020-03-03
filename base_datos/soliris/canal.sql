-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla soliris.canal
CREATE TABLE IF NOT EXISTS `canal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canal_nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `familia` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `mail` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `dir_tec` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `cont_venta` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `cont_otro` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `puntos_entrega` longtext CHARACTER SET latin1,
  `documentacion` varchar(255) DEFAULT NULL,
  `usuario_audit` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `canal_np_id` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
