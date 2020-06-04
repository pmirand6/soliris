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

-- Volcando estructura para tabla soliris.auxiliar
CREATE TABLE IF NOT EXISTS `auxiliar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `familia` varchar(3) NOT NULL DEFAULT '',
  `estado` varchar(45) DEFAULT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=264;

-- Volcando datos para la tabla soliris.auxiliar: ~62 rows (aproximadamente)
/*!40000 ALTER TABLE `auxiliar` DISABLE KEYS */;
INSERT INTO `auxiliar` (`id`, `valor`, `tipo`, `familia`, `estado`, `usuario_audit`, `fecha_audit`) VALUES
	(3, '10 Mg', 'dosis', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(4, '25 Mg', 'dosis', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(5, '21', 'unidades', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(6, '42', 'unidades', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(7, '63', 'unidades', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(8, 'Scienza', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(9, 'ROS FAR', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(11, 'META', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(13, 'MEDICUS', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(16, 'SMG', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(18, 'Hospital Italiano', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(19, 'OMINT', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(21, 'Hospital Churruca', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(22, 'DRO FAR', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(33, 'Hospital Aleman', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(34, 'Hospital Britanico', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(35, 'IOSE', 'canal', '---', 'Activo', NULL, '2017-08-15 08:33:16'),
	(44, 'Mieloma Múltiple', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(45, 'Gamapatia monoclonal', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(46, 'Linfoma no Hodgkin', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(47, '15 Mg', 'dosis', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(48, 'Mielodisplasia', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(49, 'Mielofibrosis', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(50, 'LLC', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(51, 'Linfoma de manto', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(52, 'Amiloidosis', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(53, 'Plasmocitoma multiporal', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(54, 'POEMS', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(55, '5 Mg', 'dosis', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(56, 'Linfoma', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(57, 'Linfoma Hodgkin', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(60, 'ONCOFARMA', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(61, 'REDFARM', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(62, 'MONUMENTO', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(64, 'AVANTFAR', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(65, 'WENT', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(67, 'Orien', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(68, 'FARMA KD', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(72, 'MEDITERRANEA', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(73, 'EXCELL PHARMA', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(81, 'CICLOFAR', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(83, 'CITY PHARMA GROUP', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(87, 'In.S.S.Se.P', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(89, 'LPC', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(90, 'SIFAR', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(91, 'Anemia', 'patologia', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(92, 'ONCOLIFE', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(93, 'ABC', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(94, 'MEDIFAR', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(96, 'AUDIFARM', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(98, 'Activo', 'Controles_Farmacologicos', 'RVL', 'Activo', NULL, '2017-08-15 08:33:16'),
	(99, 'NEO SALUD', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(100, 'SUIZO', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(101, 'METRO KD', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(102, 'PROV HOSPITALARIOS', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(103, 'SOLS', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(104, 'zbc', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(105, 'DIGMA', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(106, 'GLOBAL MED', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(108, 'CSF - Compañia de Servicios Farmaceuticos', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(109, 'OSECAC ( SEGUERMED)', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16'),
	(110, 'Dospu', 'canal', '', 'Activo', NULL, '2017-08-15 08:33:16');
/*!40000 ALTER TABLE `auxiliar` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
