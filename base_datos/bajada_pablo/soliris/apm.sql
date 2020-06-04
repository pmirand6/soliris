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

-- Volcando estructura para tabla soliris.apm
CREATE TABLE IF NOT EXISTS `apm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_apm_np` int(10) unsigned NOT NULL DEFAULT '0',
  `estado_id` int(11) NOT NULL DEFAULT '17',
  `usuario_audit` int(11) unsigned NOT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nombre_completo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_estado_apm` (`estado_id`),
  KEY `FK_usuario_apm` (`usuario_audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=2048;

-- Volcando datos para la tabla soliris.apm: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `apm` DISABLE KEYS */;
INSERT INTO `apm` (`id`, `codigo_apm_np`, `estado_id`, `usuario_audit`, `fecha_audit`, `username`, `email`, `nombre_completo`) VALUES
	(1, 10047, 17, 50, '2020-04-20 19:37:20', 'jvidela', NULL, 'VIDELA JUAN IGNACIO'),
	(2, 5001, 17, 50, '2020-04-24 14:26:58', 'goldani', NULL, 'OLDANI GUSTAVO ALBERTO'),
	(3, 10245, 17, 50, '2020-04-20 19:37:20', 'mparamo', NULL, 'PARAMO MARTIN GUSTAVO'),
	(4, 0, 17, 50, '2020-04-24 14:27:59', 'vlorenzo', NULL, 'LORENZO VALERIA PAULA'),
	(5, 10202, 17, 50, '2020-04-20 19:37:20', 'dmartinez', NULL, 'MARTINEZ DANIELA FERNANDA'),
	(6, 0, 17, 50, '2020-04-24 14:28:47', NULL, NULL, 'MANZANARES GUSTAVO ALFERTO'),
	(7, 10239, 17, 50, '2020-04-20 19:37:20', 'vlorenzo', NULL, 'LORENZO VALERIA PAULA'),
	(8, 10282, 17, 50, '2020-04-20 19:37:20', 'ufernandez', NULL, 'FERNANDEZ URIEL LUIS'),
	(9, 11745, 17, 50, '2020-04-24 14:29:25', 'ccattaneo', NULL, 'ALBIERO GASTON FRANCO JESUS '),
	(10, 10142, 17, 50, '2020-04-24 14:29:11', 'galbiero', NULL, 'CATTANEO CARLA'),
	(11, 0, 18, 50, '2020-04-20 20:18:08', 'pmiranda', 'pmiranda@raffo.com.ar', 'Miranda, Pablo'),
	(12, 0, 17, 50, '2020-04-20 20:24:35', 'dcilveti', 'dcilveti@raffo.com.ar', 'Cilveti, Diego'),
	(13, 0, 18, 50, '2020-04-20 21:08:14', 'mcarretero', 'mcarretero@raffo.com.ar', 'Carretero, Monica');
/*!40000 ALTER TABLE `apm` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
