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

-- Volcando estructura para tabla soliris.patologia
CREATE TABLE IF NOT EXISTS `patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patologia_nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `estado_id` int(11) DEFAULT '5' COMMENT 'ID de Estado',
  `familia` varchar(3) CHARACTER SET latin1 DEFAULT 'SOL',
  `usuario_audit` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pat_estado` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=2730 COMMENT='Tabla de patologias';

-- Volcando datos para la tabla soliris.patologia: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `patologia` DISABLE KEYS */;
INSERT INTO `patologia` (`id`, `patologia_nombre`, `estado_id`, `familia`, `usuario_audit`, `fecha_audit`) VALUES
	(17, 'HPN', 5, 'SOL', NULL, '2020-02-10 15:52:49'),
	(18, 'SUHa', 5, 'SOL', NULL, '2020-02-10 15:53:04'),
	(19, 'gMGr', 5, 'SOL', NULL, '2020-02-10 15:53:12'),
	(20, 'NMOSD', 5, 'SOL', NULL, '2020-02-10 15:53:30'),
	(21, 'Glomerulospatias ', 5, 'SOL', NULL, '2020-02-10 15:53:38'),
	(22, 'patologia pruebas', 6, 'SOL', 'pmiranda', '2020-04-08 00:36:45');
/*!40000 ALTER TABLE `patologia` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
