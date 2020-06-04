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

-- Volcando estructura para tabla soliris.medico_matricula
CREATE TABLE IF NOT EXISTS `medico_matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_matricula_id` int(11) NOT NULL DEFAULT '0',
  `valor` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_matricula_tipo` (`tipo_matricula_id`),
  CONSTRAINT `FK_matricula_tipo` FOREIGN KEY (`tipo_matricula_id`) REFERENCES `medico_matricula_tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=682 COMMENT='Maestro de medicos y matriculas por provincia o Nacional';

-- Volcando datos para la tabla soliris.medico_matricula: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `medico_matricula` DISABLE KEYS */;
INSERT INTO `medico_matricula` (`id`, `tipo_matricula_id`, `valor`) VALUES
	(1, 2, 'BUENOS AIRES'),
	(2, 2, 'CATAMARCA'),
	(3, 2, 'CHACO'),
	(4, 2, 'CHUBUT'),
	(5, 2, 'CÓRDOBA'),
	(6, 2, 'CORRIENTES'),
	(7, 2, 'ENTRE RÍOS'),
	(8, 2, 'FORMOSA'),
	(9, 2, 'JUJUY'),
	(10, 2, 'LA PAMPA'),
	(11, 2, 'LA RIOJA'),
	(12, 2, 'MENDOZA'),
	(13, 2, 'MISIONES'),
	(14, 2, 'NEUQUÉN'),
	(15, 2, 'RÍO NEGRO'),
	(16, 2, 'SALTA'),
	(17, 2, 'SAN JUAN'),
	(18, 2, 'SAN LUIS'),
	(19, 2, 'SANTA CRUZ'),
	(20, 2, 'SANTA FÉ'),
	(21, 2, 'SANTIAGO DEL ESTERO'),
	(22, 2, 'TIERRA DEL FUEGO'),
	(23, 2, 'TUCUMÁN'),
	(24, 1, 'NACIONAL');
/*!40000 ALTER TABLE `medico_matricula` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
