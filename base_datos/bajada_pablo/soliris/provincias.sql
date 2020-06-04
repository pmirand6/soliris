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

-- Volcando estructura para tabla soliris.provincias
CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) NOT NULL,
  `pais_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pais_prov` (`pais_id`),
  CONSTRAINT `FK_pais_prov` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=712;

-- Volcando datos para la tabla soliris.provincias: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` (`id`, `provincia`, `pais_id`) VALUES
	(1, 'BUENOS AIRES', 13),
	(2, 'CATAMARCA', 13),
	(3, 'CHACO', 13),
	(4, 'CHUBUT', 13),
	(5, 'CÓRDOBA', 13),
	(6, 'CORRIENTES', 13),
	(7, 'ENTRE RÍOS', 13),
	(8, 'FORMOSA', 13),
	(9, 'JUJUY', 13),
	(10, 'LA PAMPA', 13),
	(11, 'LA RIOJA', 13),
	(12, 'MENDOZA', 13),
	(13, 'MISIONES', 13),
	(14, 'NEUQUÉN', 13),
	(15, 'RÍO NEGRO', 13),
	(16, 'SALTA', 13),
	(17, 'SAN JUAN', 13),
	(18, 'SAN LUIS', 13),
	(19, 'SANTA CRUZ', 13),
	(20, 'SANTA FÉ', 13),
	(21, 'SANTIAGO DEL ESTERO', 13),
	(22, 'TIERRA DEL FUEGO', 13),
	(23, 'TUCUMÁN', 13),
	(24, 'CABA', 13);
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
