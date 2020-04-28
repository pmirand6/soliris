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

-- Volcando estructura para tabla soliris.medico_matricula
CREATE TABLE IF NOT EXISTS `medico_matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_matricula_id` int(11) NOT NULL DEFAULT '0',
  `valor` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_matricula_tipo` (`tipo_matricula_id`),
  CONSTRAINT `FK_matricula_tipo` FOREIGN KEY (`tipo_matricula_id`) REFERENCES `medico_matricula_tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=682 COMMENT='Maestro de medicos y matriculas por provincia o Nacional';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
