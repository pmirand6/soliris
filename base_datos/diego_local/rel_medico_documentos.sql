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

-- Volcando estructura para tabla soliris.rel_medico_documentos
CREATE TABLE IF NOT EXISTS `rel_medico_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medico_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_id` int(10) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id`),
  KEY `FK_rel_doc_medico` (`documento_id`),
  KEY `FK_rel_med_doc_estado` (`estado_id`),
  KEY `FK_rel_medico_doc` (`medico_id`),
  CONSTRAINT `FK_rel_doc_medico` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  CONSTRAINT `FK_rel_medico_doc` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `FK_rel_med_doc_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=16384 COMMENT='Tabla de relacion entre los documentos y los registro de la venta';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
