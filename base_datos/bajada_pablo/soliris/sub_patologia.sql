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

-- Volcando estructura para tabla soliris.sub_patologia
CREATE TABLE IF NOT EXISTS `sub_patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_patologia_nombre` varchar(50) NOT NULL DEFAULT '',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL',
  `usuario_audit` varchar(45) NOT NULL DEFAULT '',
  `fecha_audit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 COMMENT='Tablas de Sub Patoligias';

-- Volcando datos para la tabla soliris.sub_patologia: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `sub_patologia` DISABLE KEYS */;
INSERT INTO `sub_patologia` (`id`, `sub_patologia_nombre`, `familia`, `usuario_audit`, `fecha_audit`) VALUES
	(1, 'C3GN', 'SOL', '', '2020-02-10 16:05:32'),
	(2, 'EDD', 'SOL', '', '2020-02-10 16:05:44'),
	(3, 'CFHR5GP', 'SOL', '', '2020-02-10 16:05:54'),
	(4, 'N/A', 'SOL', '', '2020-02-26 16:10:02');
/*!40000 ALTER TABLE `sub_patologia` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
