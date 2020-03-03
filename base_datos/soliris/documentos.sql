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

-- Volcando estructura para tabla soliris.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL COMMENT 'Nombre o referencia del documento',
  `tipo_id` int(11) NOT NULL COMMENT 'ID del tipo de documento',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de creacion del registro',
  `fecha_documento` date NOT NULL COMMENT 'fecha del documento',
  `usuario_id` int(11) unsigned NOT NULL COMMENT 'id del usuario que creó el registro',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL' COMMENT 'familia del sistema',
  PRIMARY KEY (`id`),
  KEY `FK_doc_tipo` (`tipo_id`),
  KEY `FK_doc_usuario` (`usuario_id`),
  CONSTRAINT `FK_doc_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `documentos_tipo` (`id`),
  CONSTRAINT `FK_doc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenan las referencias a los documentos del sistema';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
