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

-- Volcando estructura para tabla soliris.rel_patologia_sub_patologia
CREATE TABLE IF NOT EXISTS `rel_patologia_sub_patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patologia_id` int(11) DEFAULT NULL,
  `sub_patologia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_patologia` (`patologia_id`),
  KEY `FK_sub_patologia` (`sub_patologia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 COMMENT='tabla de relacion entre patologia y subpatologia';

-- Volcando datos para la tabla soliris.rel_patologia_sub_patologia: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_patologia_sub_patologia` DISABLE KEYS */;
INSERT INTO `rel_patologia_sub_patologia` (`id`, `patologia_id`, `sub_patologia_id`) VALUES
	(1, 21, 1),
	(2, 21, 2),
	(3, 21, 3);
/*!40000 ALTER TABLE `rel_patologia_sub_patologia` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
