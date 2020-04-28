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

-- Volcando estructura para tabla soliris.patologia
CREATE TABLE IF NOT EXISTS `patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patologia_nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `estado_id` int(11) DEFAULT '5' COMMENT 'ID de Estado',
  `familia` varchar(3) CHARACTER SET latin1 DEFAULT 'SOL',
  `usuario_audit` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pat_estado` (`estado_id`),
  CONSTRAINT `FK_pat_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=2730 COMMENT='Tabla de patologias';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
