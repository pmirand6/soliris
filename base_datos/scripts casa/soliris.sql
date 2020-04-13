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


-- Volcando estructura de base de datos para soliris
CREATE DATABASE IF NOT EXISTS `soliris` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `soliris`;

-- Volcando estructura para tabla soliris.apm
CREATE TABLE IF NOT EXISTS `apm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_apm_np` int(10) unsigned NOT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '17',
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nombre_completo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.apm: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `apm` DISABLE KEYS */;
INSERT INTO `apm` (`id`, `codigo_apm_np`, `estado_id`, `usuario_audit`, `fecha_audit`, `username`, `email`, `nombre_completo`) VALUES
	(1, 10047, 17, NULL, '2020-04-07 22:04:14', 'jvidela', NULL, 'VIDELA JUAN IGNACIO'),
	(3, 10245, 17, NULL, '2020-03-16 13:14:20', 'mparamo', NULL, 'PARAMO MARTIN GUSTAVO'),
	(4, 5001, 17, NULL, '2020-03-16 13:14:20', 'goldani', NULL, 'OLDANI GUSTAVO ALBERTO'),
	(5, 10202, 17, NULL, '2020-03-16 13:14:20', 'dmartinez', NULL, 'MARTINEZ DANIELA FERNANDA'),
	(7, 10239, 17, NULL, '2020-03-16 13:14:20', 'vlorenzo', NULL, 'LORENZO VALERIA PAULA'),
	(8, 10282, 17, NULL, '2020-03-16 13:14:20', 'ufernandez', NULL, 'FERNANDEZ URIEL LUIS'),
	(9, 11745, 17, NULL, '2020-03-16 13:14:20', 'ccattaneo', NULL, 'CATTANEO CARLA'),
	(10, 10142, 17, NULL, '2020-03-16 13:14:20', 'galbiero', NULL, 'ALBIERO GASTON FRANCO JESUS ');
/*!40000 ALTER TABLE `apm` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- Volcando estructura para tabla soliris.aux_old
CREATE TABLE IF NOT EXISTS `aux_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `familia` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.aux_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aux_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `aux_old` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.canales
CREATE TABLE IF NOT EXISTS `canales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canal` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `familia` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `mail` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `dir_tec` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `cont_venta` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `cont_otro` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `puntos_entrega` longtext CHARACTER SET latin1,
  `documentacion` varchar(255) DEFAULT NULL,
  `usuario_audit` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.canales: ~55 rows (aproximadamente)
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` (`id`, `canal`, `familia`, `direccion`, `mail`, `dir_tec`, `cont_venta`, `cont_otro`, `puntos_entrega`, `documentacion`, `usuario_audit`, `fecha_audit`, `estado`, `estado_id`) VALUES
	(75, 'Scienza', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:31', 'Activo', 24),
	(76, 'ROS FAR', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:35', 'Activo', 24),
	(77, 'META', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:39', 'Activo', 24),
	(78, 'Medicus', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:43', 'Activo', 24),
	(79, 'SMG', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:47', 'Activo', 24),
	(80, 'Hospital Italiano', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:00', 'Activo', 24),
	(81, 'OMINT', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:12', 'Activo', 24),
	(82, 'Hospital Churruca', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:18', 'Activo', 24),
	(83, 'DroFar', 'RVL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-08-15 09:01:24', 'Activo', 24),
	(84, 'Hospital Aleman', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:30', 'Activo', 24),
	(85, 'Hospital Britanico', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:37', 'Activo', 24),
	(86, 'IOSE', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:42', 'Activo', 24),
	(87, 'ONCOFARMA', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:46', 'Activo', 24),
	(88, 'REDFARM', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:53', 'Activo', 24),
	(89, 'MONUMENTO', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:59', 'Activo', 24),
	(90, 'AVANTFAR', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:04', 'Activo', 24),
	(91, 'WENT', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:08', 'Activo', 24),
	(92, 'ORIEN', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:13', 'Activo', 24),
	(93, 'FARMA KD', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:17', 'Activo', 24),
	(94, 'MEDITERRANEA', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:22', 'Activo', 24),
	(95, 'EXCELL PHARMA', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:28', 'Activo', 24),
	(96, 'CICLOFAR', 'RVL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-08-15 09:02:37', 'Activo', 24),
	(97, 'CITY PHARMA GROUP', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:44', 'Activo', 24),
	(98, 'In.S.S.Se.P', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:59', 'Activo', 24),
	(99, 'SIFAR', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:31', 'Activo', 24),
	(100, 'ONCOLIFE', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:36', 'Activo', 24),
	(101, 'ABC', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:52', 'Activo', 24),
	(102, 'MEDIFAR', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:58', 'Activo', 24),
	(103, 'AUDIFARM', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:05', 'Activo', 24),
	(104, 'NEO SALUD', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:12', 'Activo', 24),
	(105, 'SUIZO', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:15', 'Activo', 24),
	(106, 'METRO KD', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:21', 'Activo', 24),
	(107, 'PROV HOSPITALARIOS', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:30', 'Activo', 24),
	(108, 'SOLS', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:35', 'Activo', 24),
	(109, 'ZBC', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:41', 'Activo', 24),
	(110, 'DIGMA', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:44', 'Activo', 24),
	(111, 'GLOBAL MED', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:48', 'Activo', 24),
	(112, 'CSF-COMPAÑIA DE SERVICIOS FARMACEUTICOS', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:08:13', 'Activo', 24),
	(113, 'OSECAC (SEGURMED)', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:08:31', 'Activo', 24),
	(114, 'DOSPU', 'rvl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:08:36', 'Activo', 24),
	(115, 'Medical Pro', 'RVL', '', '', '', '', '', '', NULL, 'agonzalez', '2017-11-03 15:54:04', 'Activo', 24),
	(116, 'LOGISTICA MEDICA', 'RVL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-11-22 15:37:26', 'Activo', 24),
	(117, 'C&C Medicals', 'RVL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-12-20 08:18:40', 'Activo', 24),
	(118, 'Alexander Fleming', 'RVL', 'Zabala 2836, CABA', '', '', '', '', 'Zabala 2836, CABA', NULL, 'agonzalez', '2018-07-30 14:04:15', 'Activo', 24),
	(119, 'COFARMA', 'RVL', '', '', '', '', '', 'SAN JOSÉ 1747, SANTA FE', NULL, 'agonzalez', '2018-08-15 13:17:59', 'Activo', 24),
	(120, 'CEMIC', 'RVL', 'Av. Galván 4102 – CABA ', '', '', '', '', '', NULL, 'jkiprizlian', '2018-09-12 08:33:06', 'Activo', 24),
	(121, 'PSCOFARM', 'RVL', '', '', '', '', '', '', NULL, 'agonzalez', '2018-09-14 10:50:40', 'Activo', 24),
	(122, 'Sitio Salud', 'RVL', '', '', '', '', '', 'HIPOLITO YRIGOYEN 5263/67/69, lanus', NULL, 'agonzalez', '2018-09-20 13:15:46', 'Activo', 24),
	(123, 'Lider SA', 'RVL', 'Av O Higgins 5591 B', '', '', '', '', 'Av O Higgins 5591 B', NULL, 'eala', '2018-10-26 13:41:09', 'Activo', 24),
	(124, 'Drogueria Psicofarm SA', 'RVL', 'Condor 1851 ', '', '', '', '', 'Condor 1851 ', NULL, 'eala', '2018-11-02 10:06:55', 'Activo', 24),
	(125, 'Femani Medical SRL', 'RVL', '', '', '', '', '', '', NULL, 'agonzalez', '2019-02-11 10:20:39', 'Activo', 24),
	(126, 'Disval', 'RVL', '', '', '', '', '', '', NULL, 'agonzalez', '2019-03-21 08:37:42', 'Activo', 24),
	(127, 'Drogueria y Distribuidora del Valle SC', 'RVL', '24 de Septiembre 725 - Santiago del Estero', '', 'Valeria Liz Argibay', '', '', '24 de Septiembre 725 - Santiago del Estero', NULL, 'eala', '2019-05-24 09:35:21', 'Activo', 24),
	(128, 'Drogueria Del Pueblo', 'RVL', 'Jose Rosas 589 - Neuquen ', '', '', '', '', 'Jose Rosas 589 - Neuquen ', NULL, 'eala', '2019-06-26 09:58:06', 'Activo', 24),
	(129, 'Farma S.R.L.', 'RVL', 'Av. Hipolito Yrigoyen 2972 - Trelew', '', 'Graciela Berta Montangie', '', 'Sergio Oscar Amoroso (Socio Gerente)', 'Av. Hipolito Yrigoyen 2972 - Trelew', NULL, 'eala', '2019-09-03 11:44:59', 'Activo', 24);
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL DEFAULT '',
  `valor` int(10) unsigned NOT NULL DEFAULT '0',
  `flia` varchar(3) NOT NULL DEFAULT '',
  `descripcion` varchar(255) DEFAULT NULL,
  `aux_1` varchar(255) DEFAULT NULL,
  `aux_2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.configuracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.cp
CREATE TABLE IF NOT EXISTS `cp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CP` double DEFAULT NULL,
  `Localidad` varchar(255) DEFAULT NULL,
  `Provincia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.cp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cp` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL COMMENT 'Nombre o referencia del documento',
  `documentos_tipo_id` int(11) NOT NULL COMMENT 'ID del tipo de documento',
  `fecha_creacion` datetime NOT NULL COMMENT 'fecha de creacion del registro',
  `fecha_documento` date NOT NULL COMMENT 'fecha del documento',
  `estado_id` int(11) NOT NULL DEFAULT '15',
  `usuario_id` int(11) unsigned NOT NULL COMMENT 'id del usuario que creó el registro',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL' COMMENT 'familia del sistema',
  PRIMARY KEY (`id`),
  KEY `FK_doc_tipo` (`documentos_tipo_id`),
  KEY `FK_doc_usuario` (`usuario_id`),
  KEY `FK_doc_estado` (`estado_id`),
  CONSTRAINT `FK_doc_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_doc_tipo` FOREIGN KEY (`documentos_tipo_id`) REFERENCES `documentos_tipo` (`id`),
  CONSTRAINT `FK_doc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenan las referencias a los documentos del sistema';

-- Volcando datos para la tabla soliris.documentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.documentos_error
CREATE TABLE IF NOT EXISTS `documentos_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operacion` varchar(45) NOT NULL DEFAULT '',
  `id_operacion` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre_doc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Log de error de subida de documentos';

-- Volcando datos para la tabla soliris.documentos_error: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos_error` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.documentos_tipo
CREATE TABLE IF NOT EXISTS `documentos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='referencia de tipos de documentos del sistema';

-- Volcando datos para la tabla soliris.documentos_tipo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos_tipo` DISABLE KEYS */;
INSERT INTO `documentos_tipo` (`id`, `tipo`, `referencia`) VALUES
	(1, 'Vacunacion', 'Paciente'),
	(2, 'Otro', 'Paciente'),
	(3, 'Receta', 'Venta'),
	(4, 'Otro', 'Venta'),
	(5, 'Certificado Calidad', 'Venta'),
	(6, 'Capacitación', 'Medico');
/*!40000 ALTER TABLE `documentos_tipo` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.especialidad
CREATE TABLE IF NOT EXISTS `especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(100) DEFAULT NULL,
  `familia` varchar(3) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.especialidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` (`id`, `especialidad`, `familia`, `estado_id`, `usuario_audit`, `fecha_audit`) VALUES
	(1, 'especialidad prueba', 'SOL', 28, 'pmiranda', '2020-04-07 21:50:38'),
	(2, 'especialidad pruebas', 'SOL', 28, 'pmiranda', '2020-04-07 21:50:53');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.hist_paciente
CREATE TABLE IF NOT EXISTS `hist_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cambios de Estado sobre Paciente';

-- Volcando datos para la tabla soliris.hist_paciente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `hist_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `hist_paciente` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.institucion
CREATE TABLE IF NOT EXISTS `institucion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `altura` int(10) unsigned DEFAULT '0',
  `localidad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `notas` longtext,
  `tipo` varchar(10) DEFAULT NULL,
  `familia` varchar(3) DEFAULT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reporte` int(11) NOT NULL DEFAULT '0',
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.institucion: ~269 rows (aproximadamente)
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` (`id`, `nombre`, `direccion`, `altura`, `localidad`, `provincia`, `contacto`, `mail`, `telefono`, `notas`, `tipo`, `familia`, `usuario_audit`, `fecha_audit`, `reporte`, `estado_id`) VALUES
	(1025, 'Aca Salud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1026, 'Aca Salud- Hospital Privado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1027, 'Accord Salud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1028, 'Accord Salud - Hospital Britanico', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1029, 'AMEBPBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1030, 'AMR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1031, 'ANDAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1032, 'ANM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1033, 'APRES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1034, 'APROSS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convenio', 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1035, 'APROSS-Drog Mediterranea', '', 0, '', '', '', '', '', '', 'Convenio', 'SOL', 'dcilveti', '2020-04-07 22:29:02', 0, 26),
	(1036, 'Ase. Policia de Formosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1037, 'ASOC. MEDICA DPTO CASTELLANOS – RAFAELA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1038, 'ASUNT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1039, 'Bancarios', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1040, 'Banco de Drogas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convenio', 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1041, 'C.A.S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1042, 'CEMIC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1043, 'centro de mezclas intravenosas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1044, 'cimesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1045, 'Circulo de Ingenieros', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1046, 'Circulo de San Isidro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1047, 'CM SALUD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1048, 'Consolidar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1049, 'DAMSU MENDOZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1050, 'DAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1051, 'Desarrollo Social', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1052, 'DIBPFA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1053, 'DIRECCION DE SERVICIOS DIRECTOS INSSSEP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1054, 'Dosen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1055, 'DOSPU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1056, 'DOSUBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1057, 'Escribanos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1058, 'Escribanos de La Plata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1059, 'Fleming', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1060, 'Fundaleu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1061, 'GALENO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1062, 'Hospital Aleman', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1063, 'Hospital Aleman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1064, 'Hospital Británico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1065, 'Hospital Central', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1066, 'Hospital Churruca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1067, 'Hospital Italiano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1068, 'I.A.P.O.S.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1069, 'IAPOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1070, 'INSSP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1072, 'INSSSEP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1073, 'INSSSEP-Hospital Italiano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1074, 'Inst. Prev y Seguro Tucuman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1075, 'Instituto de Seguridad Social de Neuquen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1076, 'IOMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convenio', 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1078, 'IOSCOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1079, 'IOSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1080, 'IOSE campo de mayo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1081, 'IOSE Matienzo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1082, 'IProSS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1083, 'IPS TUCUMAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1084, 'IPSST SEGURIDAD SOCIAL TUCUMAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1085, 'ISSN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1086, 'ISSP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1087, 'Jerarquicos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1088, 'Luis Pasteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1089, 'MAPFRE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1090, 'Medicus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1091, 'MEDICUS- Austral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1092, 'MEDICUS_ Fleming', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1093, 'MEDIFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1094, 'META', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1095, 'Min. Desarrollo Social', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1096, 'Ministerio de Desarrollo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1097, 'Ministerio de la provincia de Rio Negro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1098, 'Ministerio de Salud. (PROFE)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1099, 'MOA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1100, 'Mutual Federada 25 de Junio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1101, 'O.S.C.T.C.P.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1102, 'O.S.E.C.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1103, 'Ob Soc de los empreadores Publicos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1104, 'Ob. SBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1105, 'Ob. Social del Servicio Penitenciario', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1106, 'OBSBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convenio', 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1107, 'OMINT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1108, 'OPSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1109, 'OSAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1110, 'OSDE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1111, 'OSDE - Hospital Británico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1112, 'OSDE Hospital Italiano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1113, 'OSDE _ANM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1114, 'OSDE- Fleming', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1115, 'OSDE-CEMIC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1116, 'OSDE-Hospital Alemán', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1117, 'osdepym', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1118, 'osecac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1119, 'OSEP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convenio', 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1120, 'OSER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1121, 'OSFATLYF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1122, 'OSIMRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1123, 'OSMECOM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1124, 'OSMECON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1125, 'Ospac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1126, 'OSPAGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1127, 'OSPIPRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1128, 'Osplad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1129, 'OSPOCE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1130, 'OSPRERA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1131, 'ostatlyf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1132, 'OSTEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1133, 'OSTEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1134, 'OSTIG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1135, 'OSUNER-Hospital Italiano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1136, 'PAMI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Convenio', 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1141, 'PAPO MONOCLONAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1142, 'poder judicial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1143, 'Policlínico Neuquén', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1144, 'Privado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1145, 'PROFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1146, 'PS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1147, 'RosFar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1148, 'SAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1149, 'SANCOR SALUD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1150, 'Scienza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1151, 'Seros Chubut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1152, 'SMG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1153, 'SMG(cemic)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1154, 'SMG-Fundaleu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1155, 'Solidaridad (Bancaria)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1156, 'Subsidio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1157, 'Sutiaga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1158, 'U.P.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1159, 'U.T.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1160, 'UAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1161, 'UNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1162, 'UOM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1163, 'UOMM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1164, 'UP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1165, 'UTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1166, 'Damsu', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1167, 'Oseg', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1168, 'Ospia', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1169, 'Osseg', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1170, 'Apdis', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1171, 'Centro Gallegos', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1172, 'Ips', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1173, 'Hospital Privado', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1174, 'Samo', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1175, 'Ospip', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1176, 'Ipauss', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1177, 'Iosper', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1178, 'Plan de Salud', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1179, 'Britanico', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1180, 'I.A.S.E.P', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1181, 'Osetya', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1182, 'ASPURC', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1183, 'OSPIA PROVINCIA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1184, 'Ospecom', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1185, 'OSA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1186, 'FATSO', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1187, 'Hospital Central Mendoza', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1188, 'Docthos', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1189, 'Ospadep', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1190, 'Ospedyc', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1191, 'Hospital Ramos Mejia', 'ohiggins', 0, 'Tigre', 'Buenos Aires', '', 'pmirand6@gmail.com', '01131218333', '', '', 'SOL', 'pmiranda', '2020-04-07 22:55:51', 0, 26),
	(1192, 'Hope', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1193, 'OSADEF', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1194, 'SS', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1195, 'Mutual SADAIC', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1196, 'OSUTHGRA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1197, 'DASU', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1198, 'POLICLINICO', 'Av. S. Martin', 326, 'Rafaela', 'Sta. Fe', NULL, NULL, '03492 425087', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1199, 'LUZ Y FUERZA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1200, 'oncofarma', 'CHACABUCO', 2069, 'S.M.DE TUCUMAN ', 'TUCUMAN ', NULL, NULL, '0381-4310011', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1201, 'CIRME', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1202, 'Hospital Juan A. Fernandez', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1203, 'Ospil', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1204, 'Dir. de Obra Social Prov.', '', 0, '', 'san juan', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1205, 'OSPAV', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1206, 'IPS Misiones', '', 0, '', 'Misiones', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1207, 'Federada Salud', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1208, 'Obra Social del P Maritimo', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1209, 'Policia Federal', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1210, 'Hospital Santojanni', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1211, 'OSPESGyPE', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1212, 'Conet Plan', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1213, 'SIMECO', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1214, 'OSUOMRA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1215, 'CAIPO', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1216, 'TV SALUD', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1217, 'O S San Juan', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1218, 'OSPIC', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1219, 'Hospital Schestakow', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1220, 'OSCCPTAC', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1221, 'OSSIMRA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1222, 'OSPERYH', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1223, 'SADAIC', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1224, 'AXXA pharma', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1225, 'Caja de Servicios Sociales', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1226, 'OSMATA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1227, 'SEMPRE', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1228, 'OSDOP', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1229, 'Prensa Salud', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1230, 'DIBA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1231, 'OSOSS', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1232, 'daspu', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1233, 'OSRAC Arte de Curar', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1234, 'FEMEBA SALUD', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1235, 'APSOT', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1236, 'OSDIPP', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1237, 'Medicina Privada', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1238, 'Nativa Salud', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1239, 'Programas Medicos', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1240, 'OSCHOCA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1241, 'IPAM', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1242, 'Red Arg Salud', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1243, 'OSPEGAP', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1244, 'SUMA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1245, 'Fundacion COMEI', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1246, 'SIMEPA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1247, 'UNIMEDICA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1248, 'San Pedro', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1249, 'ELEVAR', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1250, 'Arte de Curar', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1251, 'Inst Seguros Jujuy', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1252, 'osmeba', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1253, 'MUPAYE', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1254, 'AMFFA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1255, 'OSFE', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1256, 'FEMESA San Luis', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1257, 'Sanatorio Adventista del Plata', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1258, 'OS Personal TV', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1259, 'IOSEP', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1260, 'HOSP ARGERICH', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1261, 'INCLUIR SALUD', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1262, 'FEMEDICA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1263, 'CSF', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1264, 'PASTELEROS', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1265, 'Caja Forense', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1266, 'OSSSB', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1267, 'Caja de Ingenieros', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1268, 'ODPF', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1269, 'OSPF', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1270, 'IOSFA', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1271, 'TUCUMAN', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1272, 'Caja Notarial', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1273, '', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1274, 'SANIDAD', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1275, 'OSPM', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1276, 'ISSINNE', '', 0, '', '', NULL, NULL, '', NULL, NULL, 'SOL', NULL, '2020-04-07 22:29:02', 0, 26),
	(1277, 'CONSEJO PROF.CS.ECONOMICAS', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1278, 'OSAP', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1279, 'OSFATUM', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1280, 'UNR ', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1281, 'AGM', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1282, 'APTM', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1283, 'OBRA SOCIAL DEL MINISTERIO ECONOMIA', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1284, 'OSPEPRI', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1285, 'OSPE', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1286, 'O.S.A.R.P.Y.H', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1287, 'Ministerio de Chaco', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1288, 'OSEF', '', 0, '', '', '', '', '', '', '', 'SOL', 'mnorris', '2020-04-07 22:29:02', 0, 26),
	(1289, 'UOCRA', '', 0, '', '', '', '', '', '', '', 'SOL', 'eala', '2020-04-07 22:29:02', 0, 26),
	(1290, 'Salud Total', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1291, 'Hospital Pablo Soria', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1292, 'Caja de Escribanos', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1293, 'Hospital Lagomaggiore', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1294, 'IASEP', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1295, 'OSPTF (OS tierra del Fuego)', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1296, 'Mi. de Desarollo Formosa', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1297, 'Ministerio de desarrollo Formosa', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1298, 'OSCA', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1299, 'Caja de Sta. Cruz', '', 0, '', '', '', '', '', '', '', 'SOL', 'sbisceglia', '2020-04-07 22:29:02', 0, 26),
	(1302, 'Institucion Prueba2', 'Gelly y Obe', NULL, 'Tigre', 'Claro', '', '', '', '', 'Erro', 'SOL', 'pmiranda', '2020-04-07 23:22:59', 0, 26),
	(1303, 'Institucion Prueba2', 'Gelly y Obe', NULL, 'Tigre', 'Claro', '', '', '', '', 'Erro', 'SOL', 'pmiranda', '2020-04-07 23:23:03', 0, 26),
	(1304, 'Institucion Prueba2', 'Gelly y Obe', NULL, 'Tigre', 'Claro', '', '', '', '', 'Erro', 'SOL', 'pmiranda', '2020-04-07 23:23:05', 0, 26),
	(1305, 'Institucion Prueba2', 'Gelly y Obe', NULL, 'Tigre', 'Claro', '', '', '', '', 'Erro', 'SOL', 'pmiranda', '2020-04-07 23:24:27', 0, 26);
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.localidades
CREATE TABLE IF NOT EXISTS `localidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provincia` int(11) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.localidades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.log_accesos
CREATE TABLE IF NOT EXISTS `log_accesos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aplicacion` varchar(100) NOT NULL DEFAULT '',
  `usuario` varchar(100) NOT NULL DEFAULT '',
  `fecha` varchar(50) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.log_accesos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `log_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_accesos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_estado
CREATE TABLE IF NOT EXISTS `maestro_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL COMMENT 'Ejemplos: Activo, Inactivo, Baja',
  `tipo` varchar(255) DEFAULT NULL COMMENT 'Ejemplo: Paciente, Venta, Documento',
  `referencia` varchar(255) DEFAULT NULL COMMENT 'Notas al estado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.maestro_estado: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_estado` DISABLE KEYS */;
INSERT INTO `maestro_estado` (`id`, `valor`, `tipo`, `referencia`) VALUES
	(1, 'Activo', 'estado', 'usuario'),
	(2, 'Inactivo', 'estado', 'usuario'),
	(3, 'Activo', 'estado', 'rol'),
	(4, 'Inactivo', 'estado', 'rol'),
	(5, 'Activo', 'estado', 'patologia'),
	(6, 'Inactivo', 'estado', 'patologia'),
	(7, 'Pendiente', 'estado', 'paciente'),
	(8, 'Activo', 'sub_estado', 'paciente'),
	(9, 'Discontinuó', 'sub_estado', 'paciente'),
	(10, 'Falleció', 'sub_estado', 'paciente'),
	(11, 'Aprobado', 'estado', 'paciente'),
	(12, 'Baja', 'estado', 'paciente'),
	(13, 'Rechazado', 'estado', 'paciente'),
	(14, 'Eliminado', 'estado', 'venta'),
	(15, 'Activo', 'estado', 'documento'),
	(16, 'Inactivo', 'estado', 'documento'),
	(17, 'Activo', 'estado', 'apm'),
	(18, 'Inactivo', 'estado', 'apm'),
	(19, 'Activo', 'estado', 'medico'),
	(20, 'Inactivo', 'estado', 'medico'),
	(21, 'Activo', 'estado', 'producto'),
	(22, 'Venta Registrada', 'estado', 'venta'),
	(23, 'NP Generada', 'estado', 'venta'),
	(24, 'Activo', 'estado', 'canales'),
	(25, 'Inactivo', 'estado', 'canales'),
	(26, 'Activo', 'estado', 'institucion'),
	(27, 'Inactivo', 'estado', 'institucion'),
	(28, 'Activo', 'estado', 'especialidad'),
	(29, 'Inactivo', 'estado', 'especialidad'),
	(30, 'Sin Capacitacion', 'estado', 'medico');
/*!40000 ALTER TABLE `maestro_estado` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_ventas
CREATE TABLE IF NOT EXISTS `maestro_ventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paciente_id` int(10) unsigned DEFAULT NULL,
  `edad` varchar(10) DEFAULT NULL,
  `presentacion_id` int(10) NOT NULL,
  `venta_tipo_id` int(10) NOT NULL,
  `medico_id` int(11) unsigned NOT NULL,
  `producto_id` int(11) unsigned NOT NULL,
  `unidades` int(10) unsigned NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patologia_id` int(11) NOT NULL,
  `sub_patologia_id` int(11) NOT NULL,
  `institucion_id` int(11) unsigned NOT NULL,
  `canal_id` int(11) NOT NULL,
  `estado_id` int(11) DEFAULT '22',
  `usuario_id` int(11) unsigned NOT NULL,
  `cod_reasignacion` int(10) unsigned DEFAULT NULL,
  `crm_id` int(10) DEFAULT NULL,
  `nota` longtext,
  `nbr` varchar(45) DEFAULT NULL COMMENT 'Numero de NP generada',
  `fecha_stamp` timestamp NOT NULL,
  `usuario_mod_id` int(10) unsigned NOT NULL,
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_venta_paciente` (`paciente_id`),
  KEY `FK_venta_medico` (`medico_id`),
  KEY `FK_venta_patologia` (`patologia_id`),
  KEY `FK_venta_institucion` (`institucion_id`),
  KEY `FK_venta_sub_patologia` (`sub_patologia_id`),
  KEY `FK_venta_estado` (`estado_id`),
  KEY `FK_venta_usuario` (`usuario_id`),
  KEY `FK_venta_canal` (`canal_id`),
  KEY `FK_venta_producto` (`producto_id`),
  KEY `FK_venta_tipo` (`venta_tipo_id`),
  KEY `FK_venta_presentacion` (`presentacion_id`),
  KEY `FK_venta_usuario_mod` (`usuario_mod_id`),
  CONSTRAINT `FK_venta_canal` FOREIGN KEY (`canal_id`) REFERENCES `canales` (`id`),
  CONSTRAINT `FK_venta_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_venta_institucion` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `FK_venta_medico` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `FK_venta_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `FK_venta_patologia` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`),
  CONSTRAINT `FK_venta_presentacion` FOREIGN KEY (`presentacion_id`) REFERENCES `presentacion` (`id`),
  CONSTRAINT `FK_venta_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `FK_venta_sub_patologia` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`),
  CONSTRAINT `FK_venta_tipo` FOREIGN KEY (`venta_tipo_id`) REFERENCES `maestro_ventas_tipo` (`id`),
  CONSTRAINT `FK_venta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_venta_usuario_mod` FOREIGN KEY (`usuario_mod_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maestro de las ventas efectuadas al paciente';

-- Volcando datos para la tabla soliris.maestro_ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestro_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_ventas_lockeo
CREATE TABLE IF NOT EXISTS `maestro_ventas_lockeo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) unsigned NOT NULL DEFAULT '0',
  `usuario_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fecha_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que gestiona los lockeo de registros de venta para su modificacion o creacion de NP';

-- Volcando datos para la tabla soliris.maestro_ventas_lockeo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_lockeo` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestro_ventas_lockeo` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_ventas_tipo
CREATE TABLE IF NOT EXISTS `maestro_ventas_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(2) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tipos de Venta';

-- Volcando datos para la tabla soliris.maestro_ventas_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_tipo` DISABLE KEYS */;
INSERT INTO `maestro_ventas_tipo` (`id`, `valor`, `descripcion`) VALUES
	(1, 'RI', 'Registro Inicial'),
	(2, 'FU', 'Follow Up'),
	(3, 'CA', 'Cancelado');
/*!40000 ALTER TABLE `maestro_ventas_tipo` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_ventas_transaccion
CREATE TABLE IF NOT EXISTS `maestro_ventas_transaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) NOT NULL,
  `usuario_id` int(11) unsigned NOT NULL,
  `maestro_id` int(11) unsigned NOT NULL,
  `tipo_venta_id` int(11) NOT NULL,
  `fecha_stamp` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_estado_venta` (`estado_id`),
  KEY `FK_usuario_venta` (`usuario_id`),
  KEY `FK_venta_id` (`maestro_id`),
  KEY `FK_venta_tipo_transaccion` (`tipo_venta_id`),
  CONSTRAINT `FK_estado_venta` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_usuario_venta` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_venta_id` FOREIGN KEY (`maestro_id`) REFERENCES `maestro_ventas` (`id`),
  CONSTRAINT `FK_venta_tipo_transaccion` FOREIGN KEY (`tipo_venta_id`) REFERENCES `maestro_ventas_tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que muestra el historial de estados de las transacciones realizadas sobre una venta';

-- Volcando datos para la tabla soliris.maestro_ventas_transaccion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestro_ventas_transaccion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.mail_configuracion
CREATE TABLE IF NOT EXISTS `mail_configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL DEFAULT '',
  `estado_id` int(11) NOT NULL DEFAULT '0',
  `familia` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabla va a contener los avisos que tiene el sistema';

-- Volcando datos para la tabla soliris.mail_configuracion: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mail_configuracion` DISABLE KEYS */;
INSERT INTO `mail_configuracion` (`id`, `descripcion`, `estado_id`, `familia`) VALUES
	(1, 'Alta de Venta', 1, '1'),
	(2, 'Cancelacion Paciente', 1, '0');
/*!40000 ALTER TABLE `mail_configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `matricula_tipo_id` int(11) NOT NULL,
  `matricula_numero` varchar(45) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `apm_id` int(10) unsigned NOT NULL,
  `c_atencion` varchar(255) DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nacimiento` varchar(20) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `fecha_cap` date DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '30',
  `fecha_aprobado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_inac` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `familia` varchar(4) NOT NULL DEFAULT 'SOL' COMMENT 'familia de medicamento',
  `usuario_creador` int(11) unsigned NOT NULL,
  `usuario_mod` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apellido_nombre_matricula_tipo_id_matricula_numero` (`apellido`,`nombre`,`matricula_tipo_id`,`matricula_numero`),
  KEY `FK_estado_medico` (`estado_id`),
  KEY `FK_apm_medico` (`apm_id`),
  KEY `FK_medico_usuario_creador` (`usuario_creador`),
  KEY `FK_medico_usuario_mod` (`usuario_mod`),
  KEY `FK_medico_matricula` (`matricula_tipo_id`),
  CONSTRAINT `FK_apm_medico` FOREIGN KEY (`apm_id`) REFERENCES `apm` (`id`),
  CONSTRAINT `FK_estado_medico` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_medico_matricula` FOREIGN KEY (`matricula_tipo_id`) REFERENCES `medico_matricula` (`id`),
  CONSTRAINT `FK_medico_usuario_creador` FOREIGN KEY (`usuario_creador`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_medico_usuario_mod` FOREIGN KEY (`usuario_mod`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 351232 kB';

-- Volcando datos para la tabla soliris.medico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.medico_matricula
CREATE TABLE IF NOT EXISTS `medico_matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_matricula_id` int(11) NOT NULL DEFAULT '0',
  `valor` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_matricula_tipo` (`tipo_matricula_id`),
  CONSTRAINT `FK_matricula_tipo` FOREIGN KEY (`tipo_matricula_id`) REFERENCES `medico_matricula_tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maestro de medicos y matriculas por provincia o Nacional';

-- Volcando datos para la tabla soliris.medico_matricula: ~23 rows (aproximadamente)
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

-- Volcando estructura para tabla soliris.medico_matricula_tipo
CREATE TABLE IF NOT EXISTS `medico_matricula_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.medico_matricula_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `medico_matricula_tipo` DISABLE KEYS */;
INSERT INTO `medico_matricula_tipo` (`id`, `valor`) VALUES
	(1, 'Nacional'),
	(2, 'Provincial');
/*!40000 ALTER TABLE `medico_matricula_tipo` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.os
CREATE TABLE IF NOT EXISTS `os` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `descripcion` varchar(255) DEFAULT NULL,
  `aux_1` varchar(255) DEFAULT NULL,
  `aux_2` varchar(255) DEFAULT NULL,
  `u_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'fecha del cambio',
  `usuario` varchar(50) NOT NULL DEFAULT '' COMMENT 'ultimo usuario cambio',
  `estado` varchar(2) NOT NULL DEFAULT 'AC' COMMENT 'activo:1, inactivo:0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Obras Sociales';

-- Volcando datos para la tabla soliris.os: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` (`id`, `nombre`, `descripcion`, `aux_1`, `aux_2`, `u_modificacion`, `usuario`, `estado`) VALUES
	(1, 'AMEPBA', 'Obra social de empleados del Banco Provincia de Buenos Aires', NULL, NULL, '0000-00-00 00:00:00', '', 'AC'),
	(2, 'OSCHOCA', 'Obra Social de Choferes de Camiones', '', '', '2019-11-13 16:59:53', 'np_dcilveti@arndp.raffo.local', 'AC'),
	(3, 'OSGEGYPE', 'Sindicato de obreros y empleados de estaciones de servicio', '', '', '2019-12-06 10:53:27', 'np_dcilveti@arndp.raffo.local', 'AC'),
	(4, 'SIN OBRA SOCIAL', NULL, NULL, NULL, '2020-02-26 00:00:00', '', 'AC');
/*!40000 ALTER TABLE `os` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `nombre_completo` varchar(200) NOT NULL,
  `fecha_nac` date NOT NULL,
  `sexo` varchar(2) NOT NULL DEFAULT '',
  `telefono` varchar(45) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais_id` int(11) NOT NULL COMMENT 'ID de Pais',
  `mail` varchar(100) DEFAULT NULL,
  `patologia_id` int(11) NOT NULL COMMENT 'ID Patologia',
  `sub_patologia_id` int(11) NOT NULL,
  `os_id` int(11) unsigned NOT NULL COMMENT 'ID de la Obra Social',
  `notas` longtext,
  `usuario_id` int(11) unsigned NOT NULL,
  `c_gestar` varchar(2) DEFAULT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '7' COMMENT 'ID de Estado',
  `sub_estado_id` int(11) NOT NULL DEFAULT '8' COMMENT 'ID de Sub Estado',
  `fecha_creacion` datetime DEFAULT NULL,
  `familia` varchar(3) NOT NULL DEFAULT 'SOL' COMMENT 'rvl/tali/---',
  `fecha_modificacion` datetime NOT NULL,
  `usuario_mod_id` int(11) unsigned NOT NULL DEFAULT '0',
  `crm_id` int(11) unsigned DEFAULT NULL COMMENT 'ID del Sisitema Con Vos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `apellido_nombre_fecha_nac` (`apellido`,`nombre`,`fecha_nac`),
  KEY `FK_pais_pac` (`pais_id`),
  KEY `FK_patologia_pac` (`patologia_id`),
  KEY `FK_usuario_pac` (`usuario_id`),
  KEY `FK_estado_pac` (`estado_id`),
  KEY `FK_sub_estado_pac` (`sub_patologia_id`),
  KEY `FK_sub_estado_paciente` (`sub_estado_id`),
  KEY `FK_os_pac` (`os_id`),
  KEY `FK_usuario_mod_pac` (`usuario_mod_id`),
  CONSTRAINT `FK_estado_pac` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_os_pac` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`),
  CONSTRAINT `FK_pais_pac` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`ID`),
  CONSTRAINT `FK_patologia_pac` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`),
  CONSTRAINT `FK_sub_estado_paciente` FOREIGN KEY (`sub_estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_sub_patologia_pac` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`),
  CONSTRAINT `FK_usuario_mod_pac` FOREIGN KEY (`usuario_mod_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_usuario_pac` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de Pacientes';

-- Volcando datos para la tabla soliris.paciente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `code` smallint(6) DEFAULT NULL,
  `iso3166a1` char(2) DEFAULT NULL,
  `iso3166a2` char(3) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.paises: ~240 rows (aproximadamente)
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` (`ID`, `code`, `iso3166a1`, `iso3166a2`, `nombre`) VALUES
	(1, 4, 'AF', 'AFG', 'Afganistán'),
	(2, 248, 'AX', 'ALA', 'Islas Gland'),
	(3, 8, 'AL', 'ALB', 'Albania'),
	(4, 276, 'DE', 'DEU', 'Alemania'),
	(5, 20, 'AD', 'AND', 'Andorra'),
	(6, 24, 'AO', 'AGO', 'Angola'),
	(7, 660, 'AI', 'AIA', 'Anguilla'),
	(8, 10, 'AQ', 'ATA', 'Antártida'),
	(9, 28, 'AG', 'ATG', 'Antigua y Barbuda'),
	(10, 530, 'AN', 'ANT', 'Antillas Holandesas'),
	(11, 682, 'SA', 'SAU', 'Arabia Saudí'),
	(12, 12, 'DZ', 'DZA', 'Argelia'),
	(13, 32, 'AR', 'ARG', 'Argentina'),
	(14, 51, 'AM', 'ARM', 'Armenia'),
	(15, 533, 'AW', 'ABW', 'Aruba'),
	(16, 36, 'AU', 'AUS', 'Australia'),
	(17, 40, 'AT', 'AUT', 'Austria'),
	(18, 31, 'AZ', 'AZE', 'Azerbaiyán'),
	(19, 44, 'BS', 'BHS', 'Bahamas'),
	(20, 48, 'BH', 'BHR', 'Bahréin'),
	(21, 50, 'BD', 'BGD', 'Bangladesh'),
	(22, 52, 'BB', 'BRB', 'Barbados'),
	(23, 112, 'BY', 'BLR', 'Bielorrusia'),
	(24, 56, 'BE', 'BEL', 'Bélgica'),
	(25, 84, 'BZ', 'BLZ', 'Belice'),
	(26, 204, 'BJ', 'BEN', 'Benin'),
	(27, 60, 'BM', 'BMU', 'Bermudas'),
	(28, 64, 'BT', 'BTN', 'Bhután'),
	(29, 68, 'BO', 'BOL', 'Bolivia'),
	(30, 70, 'BA', 'BIH', 'Bosnia y Herzegovina'),
	(31, 72, 'BW', 'BWA', 'Botsuana'),
	(32, 74, 'BV', 'BVT', 'Isla Bouvet'),
	(33, 76, 'BR', 'BRA', 'Brasil'),
	(34, 96, 'BN', 'BRN', 'Brunéi'),
	(35, 100, 'BG', 'BGR', 'Bulgaria'),
	(36, 854, 'BF', 'BFA', 'Burkina Faso'),
	(37, 108, 'BI', 'BDI', 'Burundi'),
	(38, 132, 'CV', 'CPV', 'Cabo Verde'),
	(39, 136, 'KY', 'CYM', 'Islas Caimán'),
	(40, 116, 'KH', 'KHM', 'Camboya'),
	(41, 120, 'CM', 'CMR', 'Camerún'),
	(42, 124, 'CA', 'CAN', 'Canadá'),
	(43, 140, 'CF', 'CAF', 'República Centroafricana'),
	(44, 148, 'TD', 'TCD', 'Chad'),
	(45, 203, 'CZ', 'CZE', 'República Checa'),
	(46, 152, 'CL', 'CHL', 'Chile'),
	(47, 156, 'CN', 'CHN', 'China'),
	(48, 196, 'CY', 'CYP', 'Chipre'),
	(49, 162, 'CX', 'CXR', 'Isla de Navidad'),
	(50, 336, 'VA', 'VAT', 'Ciudad del Vaticano'),
	(51, 166, 'CC', 'CCK', 'Islas Cocos'),
	(52, 170, 'CO', 'COL', 'Colombia'),
	(53, 174, 'KM', 'COM', 'Comoras'),
	(54, 180, 'CD', 'COD', 'República Democrática del Congo'),
	(55, 178, 'CG', 'COG', 'Congo'),
	(56, 184, 'CK', 'COK', 'Islas Cook'),
	(57, 408, 'KP', 'PRK', 'Corea del Norte'),
	(58, 410, 'KR', 'KOR', 'Corea del Sur'),
	(59, 384, 'CI', 'CIV', 'Costa de Marfil'),
	(60, 188, 'CR', 'CRI', 'Costa Rica'),
	(61, 191, 'HR', 'HRV', 'Croacia'),
	(62, 192, 'CU', 'CUB', 'Cuba'),
	(63, 208, 'DK', 'DNK', 'Dinamarca'),
	(64, 212, 'DM', 'DMA', 'Dominica'),
	(65, 214, 'DO', 'DOM', 'República Dominicana'),
	(66, 218, 'EC', 'ECU', 'Ecuador'),
	(67, 818, 'EG', 'EGY', 'Egipto'),
	(68, 222, 'SV', 'SLV', 'El Salvador'),
	(69, 784, 'AE', 'ARE', 'Emiratos Árabes Unidos'),
	(70, 232, 'ER', 'ERI', 'Eritrea'),
	(71, 703, 'SK', 'SVK', 'Eslovaquia'),
	(72, 705, 'SI', 'SVN', 'Eslovenia'),
	(73, 724, 'ES', 'ESP', 'España'),
	(74, 581, 'UM', 'UMI', 'Islas ultramarinas de Estados Unidos'),
	(75, 840, 'US', 'USA', 'Estados Unidos'),
	(76, 233, 'EE', 'EST', 'Estonia'),
	(77, 231, 'ET', 'ETH', 'Etiopía'),
	(78, 234, 'FO', 'FRO', 'Islas Feroe'),
	(79, 608, 'PH', 'PHL', 'Filipinas'),
	(80, 246, 'FI', 'FIN', 'Finlandia'),
	(81, 242, 'FJ', 'FJI', 'Fiyi'),
	(82, 250, 'FR', 'FRA', 'Francia'),
	(83, 266, 'GA', 'GAB', 'Gabón'),
	(84, 270, 'GM', 'GMB', 'Gambia'),
	(85, 268, 'GE', 'GEO', 'Georgia'),
	(86, 239, 'GS', 'SGS', 'Islas Georgias del Sur y Sandwich del Sur'),
	(87, 288, 'GH', 'GHA', 'Ghana'),
	(88, 292, 'GI', 'GIB', 'Gibraltar'),
	(89, 308, 'GD', 'GRD', 'Granada'),
	(90, 300, 'GR', 'GRC', 'Grecia'),
	(91, 304, 'GL', 'GRL', 'Groenlandia'),
	(92, 312, 'GP', 'GLP', 'Guadalupe'),
	(93, 316, 'GU', 'GUM', 'Guam'),
	(94, 320, 'GT', 'GTM', 'Guatemala'),
	(95, 254, 'GF', 'GUF', 'Guayana Francesa'),
	(96, 324, 'GN', 'GIN', 'Guinea'),
	(97, 226, 'GQ', 'GNQ', 'Guinea Ecuatorial'),
	(98, 624, 'GW', 'GNB', 'Guinea-Bissau'),
	(99, 328, 'GY', 'GUY', 'Guyana'),
	(100, 332, 'HT', 'HTI', 'Haití'),
	(101, 334, 'HM', 'HMD', 'Islas Heard y McDonald'),
	(102, 340, 'HN', 'HND', 'Honduras'),
	(103, 344, 'HK', 'HKG', 'Hong Kong'),
	(104, 348, 'HU', 'HUN', 'Hungría'),
	(105, 356, 'IN', 'IND', 'India'),
	(106, 360, 'ID', 'IDN', 'Indonesia'),
	(107, 364, 'IR', 'IRN', 'Irán'),
	(108, 368, 'IQ', 'IRQ', 'Iraq'),
	(109, 372, 'IE', 'IRL', 'Irlanda'),
	(110, 352, 'IS', 'ISL', 'Islandia'),
	(111, 376, 'IL', 'ISR', 'Israel'),
	(112, 380, 'IT', 'ITA', 'Italia'),
	(113, 388, 'JM', 'JAM', 'Jamaica'),
	(114, 392, 'JP', 'JPN', 'Japón'),
	(115, 400, 'JO', 'JOR', 'Jordania'),
	(116, 398, 'KZ', 'KAZ', 'Kazajstán'),
	(117, 404, 'KE', 'KEN', 'Kenia'),
	(118, 417, 'KG', 'KGZ', 'Kirguistán'),
	(119, 296, 'KI', 'KIR', 'Kiribati'),
	(120, 414, 'KW', 'KWT', 'Kuwait'),
	(121, 418, 'LA', 'LAO', 'Laos'),
	(122, 426, 'LS', 'LSO', 'Lesotho'),
	(123, 428, 'LV', 'LVA', 'Letonia'),
	(124, 422, 'LB', 'LBN', 'Líbano'),
	(125, 430, 'LR', 'LBR', 'Liberia'),
	(126, 434, 'LY', 'LBY', 'Libia'),
	(127, 438, 'LI', 'LIE', 'Liechtenstein'),
	(128, 440, 'LT', 'LTU', 'Lituania'),
	(129, 442, 'LU', 'LUX', 'Luxemburgo'),
	(130, 446, 'MO', 'MAC', 'Macao'),
	(131, 807, 'MK', 'MKD', 'ARY Macedonia'),
	(132, 450, 'MG', 'MDG', 'Madagascar'),
	(133, 458, 'MY', 'MYS', 'Malasia'),
	(134, 454, 'MW', 'MWI', 'Malawi'),
	(135, 462, 'MV', 'MDV', 'Maldivas'),
	(136, 466, 'ML', 'MLI', 'Malí'),
	(137, 470, 'MT', 'MLT', 'Malta'),
	(138, 238, 'FK', 'FLK', 'Islas Malvinas'),
	(139, 580, 'MP', 'MNP', 'Islas Marianas del Norte'),
	(140, 504, 'MA', 'MAR', 'Marruecos'),
	(141, 584, 'MH', 'MHL', 'Islas Marshall'),
	(142, 474, 'MQ', 'MTQ', 'Martinica'),
	(143, 480, 'MU', 'MUS', 'Mauricio'),
	(144, 478, 'MR', 'MRT', 'Mauritania'),
	(145, 175, 'YT', 'MYT', 'Mayotte'),
	(146, 484, 'MX', 'MEX', 'México'),
	(147, 583, 'FM', 'FSM', 'Micronesia'),
	(148, 498, 'MD', 'MDA', 'Moldavia'),
	(149, 492, 'MC', 'MCO', 'Mónaco'),
	(150, 496, 'MN', 'MNG', 'Mongolia'),
	(151, 500, 'MS', 'MSR', 'Montserrat'),
	(152, 508, 'MZ', 'MOZ', 'Mozambique'),
	(153, 104, 'MM', 'MMR', 'Myanmar'),
	(154, 516, 'NA', 'NAM', 'Namibia'),
	(155, 520, 'NR', 'NRU', 'Nauru'),
	(156, 524, 'NP', 'NPL', 'Nepal'),
	(157, 558, 'NI', 'NIC', 'Nicaragua'),
	(158, 562, 'NE', 'NER', 'Níger'),
	(159, 566, 'NG', 'NGA', 'Nigeria'),
	(160, 570, 'NU', 'NIU', 'Niue'),
	(161, 574, 'NF', 'NFK', 'Isla Norfolk'),
	(162, 578, 'NO', 'NOR', 'Noruega'),
	(163, 540, 'NC', 'NCL', 'Nueva Caledonia'),
	(164, 554, 'NZ', 'NZL', 'Nueva Zelanda'),
	(165, 512, 'OM', 'OMN', 'Omán'),
	(166, 528, 'NL', 'NLD', 'Países Bajos'),
	(167, 586, 'PK', 'PAK', 'Pakistán'),
	(168, 585, 'PW', 'PLW', 'Palau'),
	(169, 275, 'PS', 'PSE', 'Palestina'),
	(170, 591, 'PA', 'PAN', 'Panamá'),
	(171, 598, 'PG', 'PNG', 'Papúa Nueva Guinea'),
	(172, 600, 'PY', 'PRY', 'Paraguay'),
	(173, 604, 'PE', 'PER', 'Perú'),
	(174, 612, 'PN', 'PCN', 'Islas Pitcairn'),
	(175, 258, 'PF', 'PYF', 'Polinesia Francesa'),
	(176, 616, 'PL', 'POL', 'Polonia'),
	(177, 620, 'PT', 'PRT', 'Portugal'),
	(178, 630, 'PR', 'PRI', 'Puerto Rico'),
	(179, 634, 'QA', 'QAT', 'Qatar'),
	(180, 826, 'GB', 'GBR', 'Reino Unido'),
	(181, 638, 'RE', 'REU', 'Reunión'),
	(182, 646, 'RW', 'RWA', 'Ruanda'),
	(183, 642, 'RO', 'ROU', 'Rumania'),
	(184, 643, 'RU', 'RUS', 'Rusia'),
	(185, 732, 'EH', 'ESH', 'Sahara Occidental'),
	(186, 90, 'SB', 'SLB', 'Islas Salomón'),
	(187, 882, 'WS', 'WSM', 'Samoa'),
	(188, 16, 'AS', 'ASM', 'Samoa Americana'),
	(189, 659, 'KN', 'KNA', 'San Cristóbal y Nevis'),
	(190, 674, 'SM', 'SMR', 'San Marino'),
	(191, 666, 'PM', 'SPM', 'San Pedro y Miquelón'),
	(192, 670, 'VC', 'VCT', 'San Vicente y las Granadinas'),
	(193, 654, 'SH', 'SHN', 'Santa Helena'),
	(194, 662, 'LC', 'LCA', 'Santa Lucía'),
	(195, 678, 'ST', 'STP', 'Santo Tomé y Príncipe'),
	(196, 686, 'SN', 'SEN', 'Senegal'),
	(197, 891, 'CS', 'SCG', 'Serbia y Montenegro'),
	(198, 690, 'SC', 'SYC', 'Seychelles'),
	(199, 694, 'SL', 'SLE', 'Sierra Leona'),
	(200, 702, 'SG', 'SGP', 'Singapur'),
	(201, 760, 'SY', 'SYR', 'Siria'),
	(202, 706, 'SO', 'SOM', 'Somalia'),
	(203, 144, 'LK', 'LKA', 'Sri Lanka'),
	(204, 748, 'SZ', 'SWZ', 'Suazilandia'),
	(205, 710, 'ZA', 'ZAF', 'Sudáfrica'),
	(206, 736, 'SD', 'SDN', 'Sudán'),
	(207, 752, 'SE', 'SWE', 'Suecia'),
	(208, 756, 'CH', 'CHE', 'Suiza'),
	(209, 740, 'SR', 'SUR', 'Surinam'),
	(210, 744, 'SJ', 'SJM', 'Svalbard y Jan Mayen'),
	(211, 764, 'TH', 'THA', 'Tailandia'),
	(212, 158, 'TW', 'TWN', 'Taiwán'),
	(213, 834, 'TZ', 'TZA', 'Tanzania'),
	(214, 762, 'TJ', 'TJK', 'Tayikistán'),
	(215, 86, 'IO', 'IOT', 'Territorio Británico del Océano Índico'),
	(216, 260, 'TF', 'ATF', 'Territorios Australes Franceses'),
	(217, 626, 'TL', 'TLS', 'Timor Oriental'),
	(218, 768, 'TG', 'TGO', 'Togo'),
	(219, 772, 'TK', 'TKL', 'Tokelau'),
	(220, 776, 'TO', 'TON', 'Tonga'),
	(221, 780, 'TT', 'TTO', 'Trinidad y Tobago'),
	(222, 788, 'TN', 'TUN', 'Túnez'),
	(223, 796, 'TC', 'TCA', 'Islas Turcas y Caicos'),
	(224, 795, 'TM', 'TKM', 'Turkmenistán'),
	(225, 792, 'TR', 'TUR', 'Turquía'),
	(226, 798, 'TV', 'TUV', 'Tuvalu'),
	(227, 804, 'UA', 'UKR', 'Ucrania'),
	(228, 800, 'UG', 'UGA', 'Uganda'),
	(229, 858, 'UY', 'URY', 'Uruguay'),
	(230, 860, 'UZ', 'UZB', 'Uzbekistán'),
	(231, 548, 'VU', 'VUT', 'Vanuatu'),
	(232, 862, 'VE', 'VEN', 'Venezuela'),
	(233, 704, 'VN', 'VNM', 'Vietnam'),
	(234, 92, 'VG', 'VGB', 'Islas Vírgenes Británicas'),
	(235, 850, 'VI', 'VIR', 'Islas Vírgenes de los Estados Unidos'),
	(236, 876, 'WF', 'WLF', 'Wallis y Futuna'),
	(237, 887, 'YE', 'YEM', 'Yemen'),
	(238, 262, 'DJ', 'DJI', 'Yibuti'),
	(239, 894, 'ZM', 'ZMB', 'Zambia'),
	(240, 716, 'ZW', 'ZWE', 'Zimbabue');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.patologia
CREATE TABLE IF NOT EXISTS `patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patologia_nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `estado_id` int(11) DEFAULT '5' COMMENT 'ID de Estado',
  `familia` varchar(3) CHARACTER SET latin1 DEFAULT 'SOL',
  `usuario_audit` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pat_estado` (`estado_id`),
  CONSTRAINT `FK_pat_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de patologias';

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

-- Volcando estructura para tabla soliris.presentacion
CREATE TABLE IF NOT EXISTS `presentacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL DEFAULT '',
  `producto_id` int(11) unsigned NOT NULL,
  `codigo_np` int(123) DEFAULT NULL,
  `familia` varchar(3) DEFAULT 'SOL',
  PRIMARY KEY (`id`),
  KEY `FK_presentacion_producto` (`producto_id`),
  CONSTRAINT `FK_presentacion_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de dosis de presentaciones';

-- Volcando datos para la tabla soliris.presentacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` (`id`, `valor`, `producto_id`, `codigo_np`, `familia`) VALUES
	(1, 'SOLIRIS 10 MG', 1, NULL, 'SOL'),
	(2, 'SOLIRIS 25 Mg', 1, NULL, 'SOL'),
	(3, 'SOLIRIS 20 Mg', 1, NULL, 'SOL'),
	(4, 'SOLIRIS 5 Mg', 1, NULL, 'SOL');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_np` varchar(255) NOT NULL DEFAULT '0',
  `familia` varchar(3) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_producto_estado` (`estado_id`),
  CONSTRAINT `FK_producto_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `codigo_np`, `familia`, `valor`, `estado_id`) VALUES
	(1, '123', 'SOL', 'Soliris', 21);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.provincias
CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.provincias: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` (`id`, `provincia`) VALUES
	(1, 'BUENOS AIRES'),
	(2, 'CATAMARCA'),
	(3, 'CHACO'),
	(4, 'CHUBUT'),
	(5, 'CÓRDOBA'),
	(6, 'CORRIENTES'),
	(7, 'ENTRE RÍOS'),
	(8, 'FORMOSA'),
	(9, 'JUJUY'),
	(10, 'LA PAMPA'),
	(11, 'LA RIOJA'),
	(12, 'MENDOZA'),
	(13, 'MISIONES'),
	(14, 'NEUQUÉN'),
	(15, 'RÍO NEGRO'),
	(16, 'SALTA'),
	(17, 'SAN JUAN'),
	(18, 'SAN LUIS'),
	(19, 'SANTA CRUZ'),
	(20, 'SANTA FÉ'),
	(21, 'SANTIAGO DEL ESTERO'),
	(22, 'TIERRA DEL FUEGO'),
	(23, 'TUCUMÁN');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_mail_rol
CREATE TABLE IF NOT EXISTS `rel_mail_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_configuracion_id` int(11) NOT NULL DEFAULT '0',
  `rol_id` int(11) NOT NULL DEFAULT '0',
  `estado_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion de avisos de mail en base al rol';

-- Volcando datos para la tabla soliris.rel_mail_rol: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_mail_rol` DISABLE KEYS */;
INSERT INTO `rel_mail_rol` (`id`, `mail_configuracion_id`, `rol_id`, `estado_id`) VALUES
	(1, 1, 1, 0),
	(3, 2, 1, 0),
	(4, 2, 2, 0);
/*!40000 ALTER TABLE `rel_mail_rol` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_medico_documentos
CREATE TABLE IF NOT EXISTS `rel_medico_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medico_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_id` int(10) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id`),
  KEY `FK_rel_medico_doc` (`medico_id`),
  KEY `FK_rel_doc_medico` (`documento_id`),
  KEY `FK_rel_med_doc_estado` (`estado_id`),
  CONSTRAINT `FK_rel_doc_medico` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  CONSTRAINT `FK_rel_med_doc_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_rel_medico_doc` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion entre los documentos y los registro de la venta';

-- Volcando datos para la tabla soliris.rel_medico_documentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_medico_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_medico_documentos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_medico_especialidad
CREATE TABLE IF NOT EXISTS `rel_medico_especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medico_id` int(11) unsigned NOT NULL DEFAULT '0',
  `especialidad_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_rel_medico` (`medico_id`),
  KEY `FK_rel_esp` (`especialidad_id`),
  CONSTRAINT `FK_rel_esp` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id`),
  CONSTRAINT `FK_rel_medico` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.rel_medico_especialidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_medico_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_medico_especialidad` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_paciente_documentos
CREATE TABLE IF NOT EXISTS `rel_paciente_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_doc_pac` (`paciente_id`),
  KEY `FK_doc_doc` (`documento_id`),
  CONSTRAINT `FK_doc_doc` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  CONSTRAINT `FK_doc_pac` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion de los documentos de los pacientes en el sistema';

-- Volcando datos para la tabla soliris.rel_paciente_documentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_paciente_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_paciente_documentos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_patologia_sub_patologia
CREATE TABLE IF NOT EXISTS `rel_patologia_sub_patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patologia_id` int(11) DEFAULT NULL,
  `sub_patologia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_patologia` (`patologia_id`),
  KEY `FK_sub_patologia` (`sub_patologia_id`),
  CONSTRAINT `FK_patologia` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_sub_patologia` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de relacion entre patologia y subpatologia';

-- Volcando datos para la tabla soliris.rel_patologia_sub_patologia: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_patologia_sub_patologia` DISABLE KEYS */;
INSERT INTO `rel_patologia_sub_patologia` (`id`, `patologia_id`, `sub_patologia_id`) VALUES
	(1, 21, 1),
	(2, 21, 2),
	(3, 21, 3);
/*!40000 ALTER TABLE `rel_patologia_sub_patologia` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_seguridad_rol
CREATE TABLE IF NOT EXISTS `rel_seguridad_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seguridad_id` int(11) NOT NULL DEFAULT '0',
  `rol_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_seguridad_rol` (`seguridad_id`),
  KEY `FK_rol_seguridad` (`rol_id`),
  CONSTRAINT `FK_rol_seguridad` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `FK_seguridad_rol` FOREIGN KEY (`seguridad_id`) REFERENCES `soliris_seguridad` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que vincula las paginas y los roles admitidos para esta';

-- Volcando datos para la tabla soliris.rel_seguridad_rol: ~181 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_seguridad_rol` DISABLE KEYS */;
INSERT INTO `rel_seguridad_rol` (`id`, `seguridad_id`, `rol_id`, `fecha`) VALUES
	(1, 70, 1, '2020-02-07 14:52:25'),
	(2, 71, 1, '2020-02-07 14:52:25'),
	(3, 72, 1, '2020-02-07 14:52:25'),
	(4, 73, 1, '2020-02-07 14:52:25'),
	(5, 74, 1, '2020-02-07 14:52:25'),
	(6, 75, 1, '2020-02-07 14:52:25'),
	(7, 76, 1, '2020-02-07 14:52:25'),
	(8, 77, 1, '2020-02-07 14:52:25'),
	(9, 78, 1, '2020-02-07 14:52:25'),
	(10, 79, 1, '2020-02-07 14:52:25'),
	(11, 80, 1, '2020-02-07 14:52:25'),
	(12, 81, 1, '2020-02-07 14:52:25'),
	(13, 82, 1, '2020-02-07 14:52:25'),
	(14, 83, 1, '2020-02-07 14:52:25'),
	(15, 84, 1, '2020-02-07 14:52:25'),
	(16, 85, 1, '2020-02-07 14:52:25'),
	(17, 86, 1, '2020-02-07 14:52:25'),
	(18, 87, 1, '2020-02-07 14:52:25'),
	(19, 88, 1, '2020-02-07 14:52:25'),
	(20, 89, 1, '2020-02-07 14:52:25'),
	(21, 90, 1, '2020-02-07 14:52:25'),
	(22, 91, 1, '2020-02-07 14:52:25'),
	(23, 92, 1, '2020-02-07 14:52:25'),
	(24, 93, 1, '2020-02-07 14:52:25'),
	(25, 94, 1, '2020-02-07 14:52:25'),
	(26, 95, 1, '2020-02-07 14:52:25'),
	(27, 96, 1, '2020-02-07 14:52:25'),
	(28, 97, 1, '2020-02-07 14:52:25'),
	(29, 98, 1, '2020-02-07 14:52:25'),
	(30, 99, 1, '2020-02-07 14:52:25'),
	(31, 100, 1, '2020-02-07 14:52:25'),
	(32, 101, 1, '2020-02-07 14:52:25'),
	(33, 102, 1, '2020-02-07 14:52:25'),
	(34, 103, 1, '2020-02-07 14:52:25'),
	(35, 104, 1, '2020-02-07 14:52:25'),
	(36, 105, 1, '2020-02-10 11:56:39'),
	(37, 106, 1, '2020-02-07 14:52:25'),
	(38, 107, 1, '2020-02-07 14:52:25'),
	(39, 108, 1, '2020-02-07 14:52:25'),
	(40, 109, 1, '2020-02-07 14:52:25'),
	(41, 110, 1, '2020-02-07 14:52:25'),
	(42, 111, 1, '2020-02-07 14:52:25'),
	(43, 112, 1, '2020-02-07 14:52:25'),
	(44, 113, 1, '2020-02-07 14:52:25'),
	(45, 114, 1, '2020-02-07 14:52:25'),
	(46, 115, 1, '2020-02-07 14:52:25'),
	(47, 116, 1, '2020-02-07 14:52:25'),
	(48, 117, 1, '2020-02-07 14:52:25'),
	(49, 118, 1, '2020-02-07 14:52:25'),
	(50, 119, 1, '2020-02-07 14:52:25'),
	(51, 120, 1, '2020-02-07 14:52:25'),
	(52, 121, 1, '2020-02-07 14:52:25'),
	(53, 123, 1, '2020-02-07 14:52:25'),
	(54, 124, 1, '2020-02-07 14:52:25'),
	(64, 70, 2, '2020-02-07 14:52:38'),
	(65, 71, 2, '2020-02-07 14:52:38'),
	(66, 72, 2, '2020-02-07 14:52:38'),
	(67, 73, 2, '2020-02-07 14:52:38'),
	(68, 74, 2, '2020-02-07 14:52:38'),
	(69, 75, 2, '2020-02-07 14:52:38'),
	(70, 76, 2, '2020-02-07 14:52:38'),
	(71, 77, 2, '2020-02-07 14:52:38'),
	(72, 78, 2, '2020-02-07 14:52:38'),
	(73, 79, 2, '2020-02-07 14:52:38'),
	(74, 83, 2, '2020-02-07 14:52:38'),
	(75, 84, 2, '2020-02-07 14:52:38'),
	(76, 85, 2, '2020-02-07 14:52:38'),
	(77, 86, 2, '2020-02-07 14:52:38'),
	(78, 87, 2, '2020-02-07 14:52:38'),
	(79, 88, 2, '2020-02-07 14:52:38'),
	(80, 89, 2, '2020-02-07 14:52:38'),
	(81, 90, 2, '2020-02-07 14:52:38'),
	(82, 91, 2, '2020-02-07 14:52:38'),
	(83, 92, 2, '2020-02-07 14:52:38'),
	(84, 93, 2, '2020-02-07 14:52:38'),
	(85, 94, 2, '2020-02-07 14:52:38'),
	(86, 95, 2, '2020-02-07 14:52:38'),
	(87, 96, 2, '2020-02-07 14:52:38'),
	(88, 97, 2, '2020-02-07 14:52:38'),
	(89, 98, 2, '2020-02-07 14:52:38'),
	(90, 99, 2, '2020-02-07 14:52:38'),
	(91, 100, 2, '2020-02-07 14:52:38'),
	(92, 101, 2, '2020-02-07 14:52:38'),
	(93, 102, 2, '2020-02-07 14:52:38'),
	(94, 103, 2, '2020-02-07 14:52:38'),
	(95, 104, 2, '2020-02-07 14:52:38'),
	(96, 105, 2, '2020-02-07 14:52:38'),
	(97, 106, 2, '2020-02-07 14:52:38'),
	(98, 108, 2, '2020-02-07 14:52:38'),
	(99, 109, 2, '2020-02-07 14:52:38'),
	(100, 110, 2, '2020-02-07 14:52:38'),
	(101, 111, 2, '2020-02-07 14:52:38'),
	(102, 112, 2, '2020-02-07 14:52:38'),
	(103, 113, 2, '2020-02-07 14:52:38'),
	(104, 114, 2, '2020-02-07 14:52:38'),
	(105, 115, 2, '2020-02-07 14:52:38'),
	(106, 116, 2, '2020-02-07 14:52:38'),
	(107, 117, 2, '2020-02-07 14:52:38'),
	(108, 118, 2, '2020-02-07 14:52:38'),
	(109, 119, 2, '2020-02-07 14:52:38'),
	(110, 120, 2, '2020-02-07 14:52:38'),
	(111, 121, 2, '2020-02-07 14:52:38'),
	(112, 123, 2, '2020-02-07 14:52:38'),
	(113, 124, 2, '2020-02-07 14:52:38'),
	(127, 70, 3, '2020-02-07 14:52:50'),
	(128, 72, 3, '2020-02-07 14:52:50'),
	(129, 74, 3, '2020-02-07 14:52:50'),
	(130, 75, 3, '2020-02-07 14:52:50'),
	(131, 77, 3, '2020-02-07 14:52:50'),
	(132, 78, 3, '2020-02-07 14:52:50'),
	(133, 79, 3, '2020-02-07 14:52:50'),
	(134, 82, 3, '2020-02-07 14:52:50'),
	(135, 83, 3, '2020-02-07 14:52:50'),
	(136, 84, 3, '2020-02-07 14:52:50'),
	(137, 90, 3, '2020-02-07 14:52:50'),
	(138, 91, 3, '2020-02-07 14:52:50'),
	(139, 92, 3, '2020-02-07 14:52:50'),
	(140, 93, 3, '2020-02-07 14:52:50'),
	(141, 95, 3, '2020-02-07 14:52:50'),
	(142, 96, 3, '2020-02-07 14:52:50'),
	(143, 97, 3, '2020-02-07 14:52:50'),
	(144, 98, 3, '2020-02-07 14:52:50'),
	(145, 99, 3, '2020-02-07 14:52:50'),
	(146, 100, 3, '2020-02-07 14:52:50'),
	(147, 101, 3, '2020-02-07 14:52:50'),
	(148, 103, 3, '2020-02-07 14:52:50'),
	(149, 104, 3, '2020-02-07 14:52:50'),
	(150, 105, 3, '2020-02-07 14:52:50'),
	(151, 109, 3, '2020-02-07 14:52:50'),
	(152, 111, 3, '2020-02-07 14:52:50'),
	(153, 114, 3, '2020-02-07 14:52:50'),
	(154, 115, 3, '2020-02-07 14:52:50'),
	(155, 118, 3, '2020-02-07 14:52:50'),
	(156, 119, 3, '2020-02-07 14:52:50'),
	(157, 120, 3, '2020-02-07 14:52:50'),
	(158, 124, 3, '2020-02-07 14:52:50'),
	(190, 70, 4, '2020-02-07 14:52:59'),
	(191, 76, 4, '2020-02-07 14:52:59'),
	(192, 77, 4, '2020-02-07 14:52:59'),
	(193, 79, 4, '2020-02-07 14:52:59'),
	(194, 83, 4, '2020-02-07 14:52:59'),
	(195, 89, 4, '2020-02-07 14:52:59'),
	(196, 98, 4, '2020-02-07 14:52:59'),
	(197, 100, 4, '2020-02-07 14:52:59'),
	(198, 103, 4, '2020-02-07 14:52:59'),
	(199, 104, 4, '2020-02-07 14:52:59'),
	(200, 105, 4, '2020-02-07 14:52:59'),
	(201, 107, 4, '2020-02-07 14:52:59'),
	(202, 108, 4, '2020-02-07 14:52:59'),
	(203, 109, 4, '2020-02-07 14:52:59'),
	(204, 124, 4, '2020-02-07 14:52:59'),
	(205, 70, 6, '2020-02-07 14:53:11'),
	(206, 72, 6, '2020-02-07 14:53:11'),
	(207, 77, 6, '2020-02-07 14:53:11'),
	(208, 79, 6, '2020-02-07 14:53:11'),
	(209, 80, 6, '2020-02-07 14:53:11'),
	(210, 82, 6, '2020-02-07 14:53:11'),
	(211, 84, 6, '2020-02-07 14:53:11'),
	(212, 89, 6, '2020-02-07 14:53:11'),
	(213, 90, 6, '2020-02-07 14:53:11'),
	(214, 91, 6, '2020-02-07 14:53:11'),
	(215, 92, 6, '2020-02-07 14:53:11'),
	(216, 93, 6, '2020-02-07 14:53:11'),
	(217, 94, 6, '2020-02-07 14:53:11'),
	(218, 95, 6, '2020-02-07 14:53:11'),
	(219, 96, 6, '2020-02-07 14:53:11'),
	(220, 97, 6, '2020-02-07 14:53:11'),
	(221, 98, 6, '2020-02-07 14:53:11'),
	(222, 99, 6, '2020-02-07 14:53:11'),
	(223, 101, 6, '2020-02-07 14:53:11'),
	(224, 103, 6, '2020-02-07 14:53:11'),
	(225, 104, 6, '2020-02-07 14:53:11'),
	(226, 105, 6, '2020-02-07 14:53:11'),
	(227, 109, 6, '2020-02-07 14:53:11'),
	(228, 111, 6, '2020-02-07 14:53:11'),
	(229, 114, 6, '2020-02-07 14:53:11'),
	(230, 115, 6, '2020-02-07 14:53:11'),
	(231, 118, 6, '2020-02-07 14:53:11'),
	(232, 119, 6, '2020-02-07 14:53:11'),
	(233, 120, 6, '2020-02-07 14:53:11'),
	(234, 124, 6, '2020-02-07 14:53:11'),
	(235, 125, 4, '2020-03-26 00:36:40'),
	(236, 126, 4, '2020-03-27 10:39:44'),
	(237, 127, 4, '2020-03-31 02:49:12'),
	(238, 128, 1, '2020-04-01 00:06:36'),
	(239, 128, 4, '2020-04-01 00:06:36'),
	(240, 128, 2, '2020-04-01 00:06:36');
/*!40000 ALTER TABLE `rel_seguridad_rol` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rel_venta_documentos
CREATE TABLE IF NOT EXISTS `rel_venta_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) unsigned NOT NULL,
  `documento_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_venta_id_rel` (`venta_id`),
  KEY `FK_documento_venta` (`documento_id`),
  CONSTRAINT `FK_documento_venta` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  CONSTRAINT `FK_venta_id_rel` FOREIGN KEY (`venta_id`) REFERENCES `maestro_ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion entre los documentos y los registro de la venta';

-- Volcando datos para la tabla soliris.rel_venta_documentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_venta_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_venta_documentos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estado_id` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `FK_rol_estado` (`estado_id`),
  CONSTRAINT `FK_rol_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.rol: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`, `nombre`, `estado_id`) VALUES
	(1, 'admin', 3),
	(2, 'fv', 3),
	(3, 'marketing', 3),
	(4, 'ventas', 3),
	(5, 'atencion_paciente', 3),
	(6, 'auditor', 3),
	(7, 'apm', 3);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.soliris_consultas
CREATE TABLE IF NOT EXISTS `soliris_consultas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(10) NOT NULL DEFAULT '',
  `consulta` longtext NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.soliris_consultas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `soliris_consultas` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.soliris_documentacion
CREATE TABLE IF NOT EXISTS `soliris_documentacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `maestro_id` int(10) unsigned NOT NULL DEFAULT '0',
  `referencia` varchar(45) NOT NULL DEFAULT '0',
  `documento` varchar(255) NOT NULL DEFAULT '',
  `tipo` varchar(45) NOT NULL DEFAULT '',
  `fecha` date NOT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referencia` (`referencia`),
  KEY `idMstr` (`maestro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.soliris_documentacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_documentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `soliris_documentacion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.soliris_log
CREATE TABLE IF NOT EXISTS `soliris_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL DEFAULT '',
  `fecha` varchar(45) NOT NULL DEFAULT '',
  `accion` longtext,
  `registro` longtext,
  `notas` longtext,
  `tabla` varchar(45) DEFAULT NULL,
  `id_registro` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.soliris_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `soliris_log` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.soliris_seguridad
CREATE TABLE IF NOT EXISTS `soliris_seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pagina` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.soliris_seguridad: ~55 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_seguridad` DISABLE KEYS */;
INSERT INTO `soliris_seguridad` (`id`, `pagina`, `descripcion`) VALUES
	(70, 'pacientes.php', 'Listado de Pacientes'),
	(71, 'canal.php', 'ABM Canal'),
	(72, 'canales.php', 'Listado de Canales'),
	(73, 'docs_hist_medico.php', 'ABM Documentación Cap Medicos'),
	(74, 'docs_medico.php', 'ABM Documentación Medicos'),
	(75, 'docs_pacientes.php', 'ABM Documentación Paciente'),
	(76, 'institucion.php', 'ABM Institución'),
	(77, 'instituciones.php', 'Listado de Instituciones'),
	(78, 'medico.php', 'ABM Medico'),
	(79, 'medicos.php', 'Listado de Medicos'),
	(80, 'seguridad.php', 'Listado y ABM de Seguridad'),
	(81, 'usuario.php', 'ABM Usuarios'),
	(82, 'usuarios.php', 'Listado de Usuarios'),
	(83, 'paciente.php', 'ABM Paciente'),
	(84, 'dosis.php', 'Listado de Dosis'),
	(85, 'a_dosis.php', 'ABM Dosis'),
	(86, 'adm_regs.php', 'Administrador de Registros'),
	(87, 'adm_regs_edit.php', 'Administrador de Registros - Editor de Registros'),
	(88, 'adm_regs_docsedit.php', 'Administrador de Registros - Editor de Documentos'),
	(89, 'log.php', 'Visor de Log'),
	(90, 'reporte_ventas_apm.php', 'Reportes - Ventas por APM'),
	(91, 'reporte_ventas_paciente.php', 'Reporte de Ventas a Pacientes'),
	(92, 'reporte_docs_paciente.php', 'Reporte de Ventas (Documentación)'),
	(93, 'reporte_ventas.php', 'Reporte de Ventas por periodo'),
	(94, 'reporte_anmat.php', 'Reporte Semestral de ANMAT'),
	(95, 'reporte_ventas_convenios.php', 'Reporte de Ventas por Convenios'),
	(96, 'reportes_panel.php', 'Reporte Panel General'),
	(97, 'reporte_grilla.php', 'Reporte Grilla'),
	(98, 'reporte_filtros.php', 'Reporte por Filtros'),
	(99, 'reporte_panel.php', 'Reporte Panel'),
	(100, 'docs_paciente.php', 'Documentación del Paciente'),
	(101, 'patologias.php', 'Listado de Patologías'),
	(102, 'patologia.php', 'ABM Patologías'),
	(103, 'listado.php', 'Listado de Historial de Ventas'),
	(104, 'listado_details.php', 'Detalle del Historial de Ventas'),
	(105, 'panel.php', 'Principal'),
	(106, 'panel_mod.php', 'Administrador de Registros FV'),
	(107, 'informes.php', 'Alta de Venta'),
	(108, 'docs_nueva_venta.php', 'Docs Nueva Venta'),
	(109, 'apms.php', 'Listado de APMs'),
	(110, 'apm.php', 'ABM de APMs'),
	(111, 'especialidades.php', 'Listado de Especialidades'),
	(112, 'a_esp.php', 'ABM de Especialidades'),
	(113, 'docs_canales.php', 'Documentación de los Canales'),
	(114, 'reporte_productos.php', 'Reporte por dosis'),
	(115, 'unidades.php', 'Listado de Unidades'),
	(116, 'a_unidad.php', 'ABM de Unidad'),
	(117, 'adm_reasignar.php', 'Reasignación de Venta'),
	(118, 'reasignar.php', 'Listado de Ventas con posible reasignación'),
	(119, 'reasignados.php', 'Listado de Venta para vincular'),
	(120, 'reporte_reasignaciones.php', 'Reporte de Reasignaciones'),
	(121, 'prueba.php', 'prueba'),
	(122, 'prueba2.php', ''),
	(123, 'docs_hist_paciente.php', 'Historico Documentacion Paciente'),
	(124, 'diff_med.php', 'Diferencias de Medicos Meditec'),
	(125, 'nueva_venta.php', 'Nueva Venta'),
	(126, 'generar_venta.php', 'Generación de Venta'),
	(127, 'modificar_venta.php', 'Modificación de Venta'),
	(128, 'historial_ventas.php', 'Historial de Ventas');
/*!40000 ALTER TABLE `soliris_seguridad` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.sub_patologia
CREATE TABLE IF NOT EXISTS `sub_patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_patologia_nombre` varchar(50) NOT NULL DEFAULT '',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL',
  `usuario_audit` varchar(45) NOT NULL DEFAULT '',
  `fecha_audit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tablas de Sub Patoligias';

-- Volcando datos para la tabla soliris.sub_patologia: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `sub_patologia` DISABLE KEYS */;
INSERT INTO `sub_patologia` (`id`, `sub_patologia_nombre`, `familia`, `usuario_audit`, `fecha_audit`) VALUES
	(1, 'C3GN', 'SOL', '', '2020-02-10 16:05:32'),
	(2, 'EDD', 'SOL', '', '2020-02-10 16:05:44'),
	(3, 'CFHR5GP', 'SOL', '', '2020-02-10 16:05:54'),
	(4, 'N/A', 'SOL', '', '2020-02-26 16:10:02');
/*!40000 ALTER TABLE `sub_patologia` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `estado_id` int(11) DEFAULT NULL,
  `rol_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_rol` (`rol_id`),
  KEY `FK_usuario_estado` (`estado_id`),
  CONSTRAINT `FK_usuario_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.usuario: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `username`, `email`, `estado_id`, `rol_id`) VALUES
	(34, 'dcilveti', 'pmiranda@raffo.com.ar', 1, 1),
	(35, 'gpardo', 'pmiranda@raffo.com.ar', 1, 1),
	(36, 'mnakatsuno', 'pmiranda@raffo.com.ar', 1, 1),
	(37, 'lliloia', 'pmiranda@raffo.com.ar', 1, 1),
	(38, 'msadouet', 'pmiranda@raffo.com.ar', 1, 1),
	(39, 'agonzalez', 'pmiranda@raffo.com.ar', 1, 1),
	(40, 'mcavagion', 'pmiranda@raffo.com.ar', 1, 1),
	(41, 'jkiprizlian', 'pmiranda@raffo.com.ar', 1, 1),
	(42, 'cburgues', 'pmiranda@raffo.com.ar', 1, 1),
	(43, 'marruzazabala', 'pmiranda@raffo.com.ar', 1, 1),
	(44, 'fcastro', 'pmiranda@raffo.com.ar', 1, 1),
	(45, 'aheredia', 'pmiranda@raffo.com.ar', 1, 1),
	(46, 'cbento', 'pmiranda@raffo.com.ar', 1, 1),
	(47, 'splatero', 'pmiranda@raffo.com.ar', 1, 1),
	(48, 'mnorris', 'pmiranda@raffo.com.ar', 1, 1),
	(49, 'dmartinez', 'pmiranda@raffo.com.ar', 1, 1),
	(50, 'pmiranda', 'pmiranda@raffo.com.ar', 1, 1),
	(51, 'sdiazbancalari', 'pmiranda@raffo.com.ar', 1, 1),
	(52, 'rjfernandez', 'pmiranda@raffo.com.ar', 1, 1),
	(53, 'eala', 'pmiranda@raffo.com.ar', 1, 1),
	(54, 'cpalomeque', 'pmiranda@raffo.com.ar', 1, 1),
	(55, 'fzapata', 'pmiranda@raffo.com.ar', 1, 1),
	(56, 'cpenela', 'pmiranda@raffo.com.ar', 1, 1),
	(57, 'sbisceglia', 'pmiranda@raffo.com.ar', 1, 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para procedimiento soliris.FU_SET_MED_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FU_SET_MED_VENTA`(
	IN `v_idVenta` INT
)
    COMMENT 'Actualiza el registro de venta con el nombre del medico correcto de meditec'
BEGIN


UPDATE soliris_maestro im
	SET
		medico= (SELECT a.id
					FROM soliris_maestro   AS imn
					INNER JOIN medicos AS m ON m.id = imn.id_medico
					INNER JOIN
					(    SELECT tm.id, tm.nombre, tm.apellido
					    FROM tmp_med tm
					)AS a  
					ON m.id_meditec = a.id)
	WHERE 
		im.id = v_idVenta;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.FU_SET_TMP_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FU_SET_TMP_MED`(
	IN `v_apellido` VARCHAR(100),
	IN `v_nombre` VARCHAR(100),
	IN `v_m_nac` VARCHAR(50),
	IN `v_m_prov` VARCHAR(50),
	IN `v_email` VARCHAR(100),
	IN `v_especialidad` VARCHAR(50),
	IN `v_visitador` VARCHAR(100),
	IN `v_telefono` VARCHAR(100),
	IN `v_provincia` VARCHAR(100),
	IN `v_localidad` VARCHAR(100),
	IN `v_calle` VARCHAR(100),
	IN `v_n_dom` VARCHAR(50),
	IN `v_t_c_ate` VARCHAR(50),
	IN `v_n_c_ate` VARCHAR(255)
)
    COMMENT 'Carga de Medicos desde Excel Meditec'
BEGIN

DECLARE c_m_tipo VARCHAR(30);
DECLARE c_esp_id INT;
DECLARE c_apm_id INT;
DECLARE c_prov_id INT;
DECLARE c_id_med INT; /* ID DEL MEDICO YA CARGADO EN TMP_MED*/
DECLARE c_id_med_prod INT; /* ID DEL MEDICO YA CARGADO EN MEDICOS*/



SET @apm_v = v_visitador;
set @apm_v = CONCAT('%',@apm_v,'%');

SET c_apm_id = (SELECT a.id FROM apm a WHERE a.nombre like @apm_v);
SET c_esp_id = (SELECT IFNULL((SELECT e.id from especialidad e where e.med_siglas = v_especialidad), 99));
SET c_prov_id = (SELECT p.id from provincias p where p.provincia = v_provincia);



IF(v_m_nac = 0)THEN
	SET c_m_tipo = 'Provincial';
ELSE
 IF (v_m_prov = 0) THEN
	SET c_m_tipo = 'Nacional';
 ELSE
	SET c_m_tipo = 'Nacional';
 END IF;
END IF;

SET c_id_med = (SELECT IFNULL((SELECT id FROM tmp_med where apellido = v_apellido and m_nac = v_m_nac and m_prov = v_m_prov and m_tipo = c_m_tipo), 0));
SET c_id_med_prod = (SELECT COUNT(*) FROM medicos m where m_nac = v_m_nac and m_prov = v_m_prov and m.matricula_tipo = c_m_tipo);

IF (c_id_med_prod = 0) THEN

	SELECT `FU_NEW_MED`(v_apellido, v_nombre, v_m_nac, v_m_prov, v_t_c_ate, v_n_c_ate, v_telefono, '', '', c_prov_id, CONCAT(v_calle, ' ',v_n_dom), v_localidad, '', '', c_apm_id, 'Inactivo', v_email, c_esp_id);

END IF;


IF(c_id_med=0) THEN

	INSERT INTO 
		tmp_med
	SET
		apellido = v_apellido,
		nombre = v_nombre,
		m_nac = v_m_nac,
		m_prov = v_m_prov,
		email = v_email,
		esp_id = c_esp_id,
		apm_id = c_apm_id,
		telefono = v_telefono,
		prov_id = c_prov_id,
		localidad = v_localidad,
		calle = v_calle,
		n_dom = v_n_dom,
		t_c_ate = v_t_c_ate,
		n_c_ate = v_n_c_ate,
		m_tipo = c_m_tipo;

elseif (c_id_med > 0) THEN

	UPDATE tmp_med
		SET
		apellido = v_apellido,
		nombre = v_nombre,
		m_nac = v_m_nac,
		m_prov = v_m_prov,
		email = v_email,
		esp_id = c_esp_id,
		apm_id = c_apm_id,
		telefono = v_telefono,
		prov_id = c_prov_id,
		localidad = v_localidad,
		calle = v_calle,
		n_dom = v_n_dom,
		t_c_ate = v_t_c_ate,
		n_c_ate = v_n_c_ate,
		m_tipo = c_m_tipo
		
	where id = c_id_med;

end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.put_log
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `put_log`(
	IN `v_usuario` VARCHAR(50),
	IN `v_id` INT,
	IN `v_tabla` VARCHAR(50),
	IN `v_notas` LONGTEXT
)
    COMMENT 'Carga informacion al log de la app'
BEGIN

declare d_values longtext;

set d_values=(SELECT group_concat(column_name) FROM information_schema.COLUMNS where TABLE_SCHEMA='soliris' and TABLE_NAME=v_tabla);



insert into soliris_log (usuario,fecha, accion, registro, tabla, notas) (select d_values from v_tabla where id=v_id) ;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_CONTROL_MODIFICAR_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_CONTROL_MODIFICAR_VENTA`(
	IN `v_idVenta` INT
,
	IN `v_userName` VARCHAR(50)








)
    COMMENT 'DEVUELVE EL ESTADO DE LA VENTA, SI ESTA SIENDO MODIFICADA O TOMADA POR NP'
BEGIN

-- verificar si es el mismo usuario actualizar fecha y no lockear al usuario

-- CONTROLA:
-- SI LA VENTA TIENE UNA NP ASOCIADA
-- SI LA VENTA ESTA SIENDO MODIFICADA
-- 	- SI LA VENTA ESTA MODIFICADA DEVUELVE EL USUARIO QUE TIENE BLOQUEADO EL REGISTRO
		SET @countLockeo := (SELECT COUNT(*) FROM maestro_ventas_lockeo mvl WHERE mvl.venta_id = v_idVenta);
SET @userLockeo := (SELECT mvl.usuario_id from maestro_ventas_lockeo mvl where mvl.venta_id = v_idVenta);
SET @userId := (SELECT FU_GET_ID_USUARIO(v_userName));
/** Verifico que el registro de venta no este en NP **/
SET @countNp := (SELECT COUNT(*) FROM maestro_ventas mv where mv.id = v_idVenta and mv.estado_id = 23);

IF (@countNp > 0) THEN
	SELECT 
	(SELECT 'Venta con NP Asociada!') as title, 
	(SELECT CONCAT('La venta <b>', v_idVenta , '</b> esta asociado con la NP <b>',mv.nbr,'</b>. <br/> No se podrán realizar modificaciones al registro')) AS text
	FROM 
	maestro_ventas mv where mv.id = v_idVenta ;
ELSE 
	IF(@userLockeo = @userId) THEN
		DELETE FROM maestro_ventas_lockeo WHERE venta_id = v_idVenta and usuario_id = @userLockeo;
		INSERT INTO maestro_ventas_lockeo SET venta_id = v_idVenta, usuario_id = (SELECT FU_GET_ID_USUARIO(v_userName));
		SELECT true as mensaje;
	ELSE
		IF (@countLockeo > 0) THEN 
			SELECT	
			(SELECT 'Registro Bloqueado!') as title,
			(SELECT CONCAT('El registro esta siendo modificado por el usuario: <b>', UPPER((SELECT FU_GET_USERNAME_USUARIO(m.usuario_id))), '</b>.<br/>  No se podrán realizar modificaciones al registro' )) AS text
			FROM maestro_ventas_lockeo m where venta_id = v_idVenta;
		end if;
	END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_DELETE_CONTROL_MODIFICAR_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_DELETE_CONTROL_MODIFICAR_VENTA`(
	IN `v_idVenta` INT,
	IN `v_idUsuario` INT,
	IN `v_idEstado` INT
)
    COMMENT 'borrar el registro asociado con el lockeo de la modificacion de la venta'
BEGIN

IF (v_idEstado <> 23) THEN

	DELETE FROM maestro_ventas_lockeo where venta_id = v_idVenta and usuario_id;

END IF;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_DISABLE_OLD_DOC_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_DISABLE_OLD_DOC_PAC`(
	IN `v_idPac` INT,
	IN `v_idTipoDoc` INT



)
    COMMENT 'Coloca el estado inactivo a los documentos de un paciente'
BEGIN

DECLARE counter INT;

SET counter = (SELECT COUNT(*) FROM rel_paciente_documentos rel INNER JOIN documentos d ON d.documentos_tipo_id = v_idTipoDoc WHERE rel.paciente_id = v_idPac);

IF( counter > 0 ) THEN

	UPDATE documentos 
	INNER JOIN rel_paciente_documentos ON rel_paciente_documentos.documento_id = documentos.id
	INNER JOIN paciente ON rel_paciente_documentos.paciente_id = paciente.id 
	INNER JOIN documentos_tipo ON documentos.documentos_tipo_id = documentos_tipo.id
	SET documentos.estado_id = 16 
	WHERE paciente.id = v_idPac 
	AND documentos_tipo.id = v_idTipoDoc;

END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_DOC_PAC_MODIFIED
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_DOC_PAC_MODIFIED`(
	IN `v_id` INT,
	IN `v_usuario` VARCHAR(50)
)
    COMMENT 'Actualiza el estado del paciente a Pendiente debido a que su documentacion fue modificada'
BEGIN

UPDATE paciente
	SET
		estado_id= 7, -- se setea el usuario en estado Pendiente
		fecha_modificacion=NOW(),
		usuario_mod_id=(SELECT u.id FROM usuario u WHERE u.username = v_usuario)
	WHERE 
		id = v_id;


SELECT "Se registra correctamente el cambio de la documentacion, el paciente quedó en estado pendiente" AS mensaje, (SELECT me.valor FROM maestro_estado me WHERE me.id = 7) AS estado;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_ACCESS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GET_ACCESS`(
	IN `v_pagina` VARCHAR(50),
	IN `v_grupo` VARCHAR(50)
)
    COMMENT 'Detecta si el rol del usuario tiene permisos a la pagina solicitada'
BEGIN

DECLARE pagina_id INT;
DECLARE grupo_id INT;


SET pagina_id = (SELECT id FROM soliris_seguridad s WHERE s.pagina = v_pagina);
SET grupo_id = (SELECT id FROM rol r WHERE r.nombre = v_grupo);

SELECT COUNT(*) FROM rel_seguridad_rol rsr WHERE rsr.seguridad_id = pagina_id AND rsr.rol_id = grupo_id;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_CANAL
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GET_CANAL`(
	IN `v_filtro` VARCHAR(50)
)
    COMMENT 'Obtiene los canales en base a un filtro pasado por parametro'
BEGIN

SELECT * from canales c where c.estado_id = 24 AND c.canal like CONCAT('%', v_filtro, '%');

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_MAESTRO_ESTADO_ACTIVO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GET_MAESTRO_ESTADO_ACTIVO`(
	IN `v_referencia` VARCHAR(50),
	OUT `v_res` INT
)
    COMMENT 'Obtiene el ID del valor activo para la referencia pasada por parametro'
BEGIN

SELECT m.id FROM maestro_estado m WHERE m.referencia = v_referencia AND m.valor = 'Activo' INTO v_res;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_PAC_ULTIMA_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GET_PAC_ULTIMA_VENTA`(
	IN `v_idPac` INT
,
	OUT `o_fecha_venta` DATE,
	OUT `o_estado_id` INT,
	OUT `o_venta_id` INT
)
    COMMENT 'Obtiene la ultima fecha y el estado de la venta con estado NP Generada o Venta Generada'
BEGIN
-- SE OBTIENE LA FECHA DE VENTA DE LA ULTIMA VENTA EN ESTADO NP O VENTA GENERADA 
-- ADEMAS SE FILTRA POR EL TIPO DE VENTA EN RI O FU

SELECT m.fecha_venta, m.estado_id, m.id
FROM maestro_ventas m
WHERE m.paciente_id = v_idPac AND m.estado_id IN (22, 23) AND m.venta_tipo_id IN (1, 2) 
ORDER BY m.id DESC  LIMIT 0,1;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_PATOLOGIAS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GET_PATOLOGIAS`()
    COMMENT 'Devuelve todas las patologias activas'
BEGIN

SELECT p.id, p.patologia_nombre FROM patologia p WHERE p.estado_id = (SELECT m.id FROM maestro_estado m WHERE m.referencia = 'patologia' AND m.valor = 'Activo');

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_SUB_PATOLOGIA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GET_SUB_PATOLOGIA`(
	IN `v_patologia_id` INT
)
    COMMENT 'Obtiene las subpatologias en base a la patologia pasada por parametro'
BEGIN

CALL `ST_GET_MAESTRO_ESTADO_ACTIVO`('patologia', @id_estado);

SELECT 
	sp.id, sp.sub_patologia_nombre
FROM 
	sub_patologia sp 
INNER JOIN 
	rel_patologia_sub_patologia rp 
ON 
	sp.id = rp.sub_patologia_id 
INNER JOIN patologia p 
ON 
	rp.patologia_id = p.id 
WHERE 
	p.id = v_patologia_id
AND 
  p.estado_id = (SELECT @id_estado);



END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_MEDICO_DOCS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GUARDAR_MEDICO_DOCS`(
	IN `v_idMedico` INT,
	IN `v_tipoDoc` INT,
	IN `v_nombreDoc` VARCHAR(255),
	IN `v_usuario` VARCHAR(50),
	IN `v_fecha_doc` DATE





)
    COMMENT 'Store que guarda la documentacion de la capacitacion del médico'
BEGIN


  SET @p_nombre_doc := v_nombreDoc;
  SET @p_doc_tipo := v_tipoDoc;
  SET @p_username := v_usuario;
  SET @fecha_doc := v_fecha_doc;
  SET @p_idMedico := v_idMedico;

  SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
  PREPARE statement_usuario_id FROM @usuario_id;
  EXECUTE statement_usuario_id USING @p_username;
  DEALLOCATE PREPARE statement_usuario_id;

  SET @count_med_docs = CONCAT("SELECT count(*) into @count_med FROM rel_medico_documentos  where medico_id = ?");
  PREPARE stmt_count_med FROM @count_med_docs;
  EXECUTE stmt_count_med USING @p_idMedico;
  DEALLOCATE PREPARE stmt_count_med;

-- Deshabilito todos los documentos anteriores de capacitación
if(@count_med > 0 ) then
  
  SET @up_med_docs = CONCAT("update rel_medico_documentos set estado_id = 16 where medico_id = ?");
  PREPARE stmt_up_med FROM @up_med_docs;
  EXECUTE stmt_up_med USING @p_idMedico;
  DEALLOCATE PREPARE stmt_up_med;

	
end if;

-- Inserto los datos del documento

  SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), @fecha_doc, ?, 'SOL')");
  PREPARE statement_query_documentos FROM @query_documentos;
  EXECUTE statement_query_documentos USING @p_nombre_doc, @p_doc_tipo, @p_usuario_id;
  DEALLOCATE PREPARE statement_query_documentos;

-- Establezco la relación entre el medico y el documento
  SET @query_rel_venta_documentos = CONCAT("INSERT INTO rel_medico_documentos (medico_id, documento_id, fecha_creacion) VALUES (?, LAST_INSERT_ID(), NOW())");
  PREPARE statement_query_rel_venta_documentos FROM @query_rel_venta_documentos;
  EXECUTE statement_query_rel_venta_documentos USING @p_idMedico;
  DEALLOCATE PREPARE statement_query_rel_venta_documentos;
  
-- Actualizo la fecha de capacitación en la tabla medico y habilito al medico
  SET @up_med = CONCAT("UPDATE medico SET fecha_cap = @fecha_doc, estado_id = 19 where id = ?");
  PREPARE stmt_up_med FROM @up_med;
  EXECUTE stmt_up_med USING @p_idMedico;
  DEALLOCATE PREPARE stmt_up_med;



  SELECT
    "SE CREO EL REGISTRO CORRECTAMENTE" AS mensaje;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GUARDAR_VENTA`(
	IN `v_id_paciente` INT,
	IN `v_medico_id` INT,
	IN `v_producto_id` INT,
	IN `v_presentacion_id` INT,
	IN `v_unidades` INT,
	IN `v_institucion_id` INT,
	IN `v_canal_id` INT,
	IN `v_usuario` VARCHAR(50)













)
    COMMENT 'store que guarda la venta asignada a un paciente'
BEGIN

	 SET @p_username := v_usuario;
    SET @id_paciente := v_id_paciente;
    SET @v_medico_id := v_medico_id;
    SET @v_producto_id := v_producto_id;
    SET @v_unidades := v_unidades;
    SET @v_institucion_id := v_institucion_id;
	 SET @v_canal_id := v_canal_id;
	 SET @v_presentacion_id := v_presentacion_id;
    
    SET @paciente_venta_ri = CONCAT("SELECT COUNT(*) AS ri INTO @p_venta_ri FROM maestro_ventas m WHERE m.paciente_id = ? AND m.venta_tipo_id = 1");
    PREPARE statement_paciente_venta_ri FROM @paciente_venta_ri;
    EXECUTE statement_paciente_venta_ri USING @id_paciente;
    DEALLOCATE PREPARE statement_paciente_venta_ri;
    
    IF(@p_venta_ri > 0) THEN
    	SET @p_tipo_venta_id = 2;
	 ELSE
	 	SET @p_tipo_venta_id = 1;
    END IF;
    
    
    SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
    PREPARE statement_usuario_id FROM @usuario_id;
    EXECUTE statement_usuario_id USING @p_username;
    DEALLOCATE PREPARE statement_usuario_id;
    
    SET @query_edad = CONCAT("SELECT `FU_GET_PACIENTE_EDAD`(?) INTO @edad_paciente");
    PREPARE statement_edad_pac FROM @query_edad;
    EXECUTE statement_edad_pac USING @id_paciente;
    DEALLOCATE PREPARE statement_edad_pac;
    

	 SET @paciente_patologia = CONCAT("SELECT p.patologia_id, p.sub_patologia_id INTO @patologia_id, @sub_patologia_id FROM paciente p WHERE p.id =?");
    PREPARE statement_paciente_patologia FROM @paciente_patologia;
    EXECUTE statement_paciente_patologia USING @id_paciente;
    DEALLOCATE PREPARE statement_paciente_patologia;

	 -- BuildMyString.com generated SQL. Please enjoy your string responsibly.

	SET @query_insert_venta = CONCAT('INSERT INTO maestro_ventas',
	'	(paciente_id,',
	'	 edad, ',
	'	 medico_id, ',
	'	 producto_id, ',
	'	 presentacion_id, ',
	'	 venta_tipo_id, ',
	'	 unidades, ',
	'	 patologia_id, ',
	'	 sub_patologia_id, ',
	'	 institucion_id, ',
	'	 canal_id, ',
	'	 usuario_id, ',
	'	 fecha_stamp) ',
	'	 VALUES ',
	'	 (',
	'	 @id_paciente,',
	'	  @edad_paciente,',
	'	  @v_medico_id, ',
	'	  @v_producto_id, ',
	'	  @v_presentacion_id, ',
	'	  @p_tipo_venta_id, ',
	'	  @v_unidades, ',
	'	 	@patologia_id,',
	'	 @sub_patologia_id,',
	'	 @v_institucion_id, ',
	'	 @v_canal_id, ',
	'	 @p_usuario_id,',
	'	 NOW())',
	';');

	
    PREPARE statement_documento_tipo_id FROM @query_insert_venta;
    EXECUTE statement_documento_tipo_id;
    DEALLOCATE PREPARE statement_documento_tipo_id;
    

    SELECT LAST_INSERT_ID() AS mensaje;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_VENTA_DOCUMENTACION
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GUARDAR_VENTA_DOCUMENTACION`(
	IN `v_idVenta` INT,
	IN `v_tipoDoc` INT,
	IN `v_nombreDoc` VARCHAR(255)
,
	IN `v_usuario` VARCHAR(50),
	IN `v_fecha_doc` DATE




)
    COMMENT 'Store que guarda la documentacion de la venta y la asocia al registro de venta'
BEGIN


SET @p_nombre_doc := v_nombreDoc;
SET @p_doc_tipo := v_tipoDoc;
SET @p_username := v_usuario;
SET @fecha_doc := v_fecha_doc;
SET @p_idVenta := v_idVenta;

  	SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
    PREPARE statement_usuario_id FROM @usuario_id;
    EXECUTE statement_usuario_id USING @p_username;
    DEALLOCATE PREPARE statement_usuario_id;
    


SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), @fecha_doc, ?, 'SOL')");
PREPARE statement_query_documentos FROM @query_documentos;
EXECUTE statement_query_documentos USING @p_nombre_doc, @p_doc_tipo, @p_usuario_id;
DEALLOCATE PREPARE statement_query_documentos;

SET @query_rel_venta_documentos = CONCAT("INSERT INTO rel_venta_documentos (venta_id, documento_id, fecha_creacion) VALUES (?, LAST_INSERT_ID(), NOW())");
PREPARE statement_query_rel_venta_documentos FROM @query_rel_venta_documentos;
EXECUTE statement_query_rel_venta_documentos USING @p_idVenta;
DEALLOCATE PREPARE statement_query_rel_venta_documentos;

SELECT "SE CREO EL REGISTRO CORRECTAMENTE" AS mensaje;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_inact_medico
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_inact_medico`()
BEGIN
declare d_id_med int;
declare d_fecha date;
declare d_limite int;
declare d_const varchar(50);


set d_limite=(select valor from configuracion where id=8);
insert into soliris_log set usuario='sistema', fecha=now(), accion='Inactivacion medicos', notas=(select concat(estado,'=',count(*)) from medicos where estado='Inactivo');
update 
	medicos as m
		set 
			m.estado='Inactivo',
			m.fecha_inac=now()
		where
				coalesce((select
					datediff(now(),t.fecha)
				from 
					soliris_maestro as t 
				where 
					t.medico=m.nombre 
				order by t.id 
				desc limit 1),datediff(now(),m.fecha_alta))>d_limite 
				and
				m.estado='Activo'

				;
insert into soliris_log set usuario='sistema', fecha=now(), accion='Inactivacion medicos', notas=(select concat(estado,'=',count(*)) from medicos where estado='Inactivo');
END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_APM
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_APM`()
    COMMENT 'Lista los apm del sistema'
BEGIN

SELECT a.*, m.valor as estado FROM apm a INNER JOIN maestro_estado m on m.id = a.estado_id order BY a.nombre_completo DESC;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_APM_ACTIVOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_APM_ACTIVOS`()
    COMMENT 'Lista los APM activos'
BEGIN

SELECT a.*, m.valor as estado FROM apm a INNER JOIN maestro_estado m on m.id = a.estado_id  where a.estado_id = 17 order BY a.nombre_completo DESC;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_CANALES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_CANALES`()
    COMMENT 'Lista los canales del sistema'
BEGIN

-- verificar el muestreo de documentacion de los canales

SELECT
 C.id AS id, 
 C.canal AS canal, 
 C.familia AS familia, 
 C.direccion AS direccion, 
 C.mail AS mail, 
 C.dir_tec AS dir_tec, 
 C.cont_venta AS cont_venta, 
 C.cont_otro AS cont_otro, 
 C.puntos_entrega AS puntos_entrega,
 m.valor AS estado,
 (SELECT 'sin documentos') as documentos /*(
SELECT GROUP_CONCAT(RD.documento)
FROM soliris_documentacion AS RD
WHERE RD.referencia = 'canales' AND RD.id_maestro = C.id
ORDER BY RD.id DESC
LIMIT 1) AS documentos*/
FROM
 canales AS C
INNER JOIN maestro_estado m on m.id = C.estado_id
ORDER BY C.canal DESC;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_ACTIVOS_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_DOCS_ACTIVOS_PAC`(
	IN `v_idPac` INT

)
BEGIN

SELECT 
	d.valor AS documento, 
	dt.tipo,
	DATE_FORMAT(d.fecha_documento, '%d/%m/%Y') as fecha_documento,
	DATE_FORMAT(d.fecha_creacion, '%d/%m/%Y %H:%i:%s') AS fecha_creacion
FROM documentos as d
LEFT OUTER JOIN documentos_tipo as dt ON d.documentos_tipo_id = dt.id
INNER JOIN rel_paciente_documentos rel ON d.id = rel.documento_id
WHERE rel.paciente_id = v_idPac AND d.estado_id = 15;
-- GROUP BY d.valor, dt.tipo ORDER BY d.id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_DOCS_MED`(
	IN `v_idMedico` INT
)
    COMMENT 'Lista los documentos del medico'
BEGIN

SELECT 
	d.valor AS documento, 
	dt.tipo,
	m.valor as estado,
	date_format(d.fecha_documento, '%d/%m/%Y') AS fecha_documento
FROM documentos as d
LEFT OUTER JOIN documentos_tipo as dt ON d.documentos_tipo_id = dt.id
INNER JOIN rel_medico_documentos rel ON d.id = rel.documento_id
INNER JOIN maestro_estado m ON m.id = d.estado_id
WHERE rel.medico_id = v_idMedico
ORDER BY d.id DESC;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_DOCS_PAC`(
	IN `v_id` INT
)
    COMMENT 'Lista los documentos del paciente'
BEGIN

-- SELECT d.valor AS documento, dt.tipo FROM rel_paciente_documentos rel
-- INNER JOIN paciente p ON rel.paciente_id = p.id
-- INNER JOIN documentos d ON rel.documento_id = d.id
-- INNER JOIN documentos_tipo dt ON dt.id = d.documentos_tipo_id
-- WHERE dt.referencia = 'Paciente' and
-- p.id = 4
-- GROUP BY dt.tipo ORDER BY rel.id DESC LIMIT 0,2;


SELECT 
	d.valor AS documento, 
	dt.tipo,
	MAX(d.id)
FROM documentos as d
LEFT OUTER JOIN documentos_tipo as dt ON d.documentos_tipo_id = dt.id
INNER JOIN rel_paciente_documentos rel ON d.id = rel.documento_id
WHERE rel.paciente_id = v_id
GROUP BY d.valor, dt.tipo ORDER BY d.id DESC LIMIT 0, 2;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_ESPECIALIDADES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_ESPECIALIDADES`()
    COMMENT 'Devuelve el listado de especialidades'
BEGIN


SELECT 
e.id,
m.valor as estado,
e.especialidad,
e.familia
FROM especialidad e 
INNER JOIN maestro_estado m on m.id = e.estado_id;



END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_ESTADOS_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_ESTADOS_PACIENTE`()
    COMMENT 'LISTA LOS ESTADO DEL PACIENTE'
BEGIN

SELECT id, valor FROM maestro_estado e WHERE e.referencia = 'paciente' AND e.tipo = 'estado';

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_INSTITUCIONES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_INSTITUCIONES`()
    COMMENT 'Lista las instituciones del sistema'
BEGIN

SELECT i.*, m.valor as estado from institucion i INNER JOIN maestro_estado m on m.id = i.estado_id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_INSTITUCIONES_HABILITADAS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_INSTITUCIONES_HABILITADAS`(
	IN `v_filtro` VARCHAR(50)


)
    COMMENT 'Obtiene las instituciones habilitadas en base a un filtro pasado por parametro'
BEGIN
SELECT 
	i.*, 
	m.valor AS estado
FROM institucion i
INNER JOIN maestro_estado m ON m.id = i.estado_id
WHERE i.nombre LIKE CONCAT('%', v_filtro, '%') AND i.estado_id = 26; END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_MEDICOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_MEDICOS`(
	IN `v_filtro` VARCHAR(50)





)
    COMMENT 'Filtro de medicos activos'
BEGIN
SELECT 
	m.id, 
	CONCAT(m.apellido,',',m.nombre) AS nombre,
mmt.valor as matricula_tipo,
	m.matricula_numero,
	m.c_atencion,
	me.valor,
	(SELECT `FU_GET_ESP_MEDICO`(m.id)) as especialidad,
	a.nombre_completo as apm_nombre,
	me.valor as estado,
	m.telefono,
	m.fax,
	m.mail,
	date_format(m.fecha_cap, '%d/%m/%Y') as fecha_cap
	
FROM medico m
INNER JOIN medico_matricula mm on mm.id = m.matricula_tipo_id
INNER JOIN medico_matricula_tipo mmt on mmt.id = mm.tipo_matricula_id
INNER JOIN maestro_estado me on me.id = m.estado_id
INNER JOIN apm a on a.id = m.apm_id
WHERE LEFT(m.apellido, 1) like CONCAT('%', v_filtro, '%')
ORDER BY nombre ASC; 
END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_MEDICOS_ACTIVOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_MEDICOS_ACTIVOS`(
	IN `v_filtro` VARCHAR(50)


)
    COMMENT 'Filtro de medicos activos'
BEGIN
SELECT 
	m.id, CONCAT(m.apellido,',',m.nombre) AS nombre
FROM medico m
WHERE m.estado_id IN (19) AND CONCAT(m.apellido,',',m.nombre) like CONCAT('%', v_filtro, '%')
ORDER BY nombre ASC; 
END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_MEDICO_TIPO_MATRICULA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_MEDICO_TIPO_MATRICULA`()
BEGIN

SELECT mm.id, mm.valor, mt.valor as tipo FROM medico_matricula mm inner join medico_matricula_tipo mt on mt.id = mm.tipo_matricula_id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PACIENTES`(
	IN `v_filtro` INT,
	IN `v_ini` VARCHAR(1)



)
    COMMENT 'Crea la tabla temporal del listado de pacientes que luego puede ser filtrada'
BEGIN




DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = 'TEMPORARY_LIST_PACIENTES';
    SET @sql_query = CONCAT('SELECT NULL FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 0) THEN
        DROP TABLE TEMPORARY_LIST_PACIENTES;
        DEALLOCATE PREPARE stmt1;
    END IF;
SET @p_u_venta := (SELECT date_format(mv.fecha_venta, '%d/%m/%Y') AS uventa FROM maestro_ventas mv WHERE mv.paciente_id = 1 ORDER BY mv.id DESC LIMIT 0,1);
CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES(
			SELECT
	  		  P.id AS id, 
			  concat(P.apellido, ', ', P.nombre) AS name, 
	  		  P.sexo AS sexo, 
	  		  P.c_gestar AS cgestar, 
			  date_format(P.fecha_nac, '%d/%m/%Y') AS fnac, 
			  (SELECT FU_GET_PACIENTE_EDAD(P.id)) as edad,
			  (SELECT pat.patologia_nombre FROM  patologia pat WHERE pat.id = P.patologia_id) AS patologia, 
	  		  (SELECT spat.sub_patologia_nombre FROM sub_patologia spat WHERE spat.id = P.sub_patologia_id) AS subPatologia, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) as fecha_con,
				IFNULL(P.mail, '-') AS email, 
				IFNULL(P.telefono, '-') AS telefono, 
	  		  IFNULL(P.notas, 'Sin Notas') AS notas, 
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.estado_id = me.id) AS estado,
				(SELECT date_format(mv.fecha_venta, '%d/%m/%Y') AS uventa FROM maestro_ventas mv WHERE mv.paciente_id = P.id ORDER BY mv.id DESC LIMIT 0,1) as uventa,
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
			/*LEFT JOIN 
				vw_lastsale_rm AS vRM 
			ON (P.id = vRM.pid)*/);
			
if(v_filtro = 0) then
	SELECT * FROM TEMPORARY_LIST_PACIENTES;
else
	SELECT * FROM TEMPORARY_LIST_PACIENTES WHERE LEFT(name,1) = v_ini;
end if;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_CON_VENTAS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PACIENTES_CON_VENTAS`()
    COMMENT 'Lista los datos de los pacientes con ventas realizadas'
BEGIN


SELECT
	  		  P.id AS idPac, 
			  (SELECT me.valor FROM maestro_estado me WHERE me.id = P.estado_id) as estadoPac,
			  P.nombre_completo AS name, 
	  		  P.sexo AS sexo, 
	  		  P.c_gestar AS cgestar, 
	  		  (SELECT FU_GET_PACIENTE_EDAD(P.id)) as edad,
			  date_format(P.fecha_nac, '%d/%m/%Y') AS fnac, 
			  (SELECT pat.patologia_nombre FROM  patologia pat WHERE pat.id = P.patologia_id) AS patologia, 
	  		  (SELECT spat.sub_patologia_nombre FROM sub_patologia spat WHERE spat.id = P.sub_patologia_id) AS subPatologia, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) as fecha_con,
				IFNULL(P.mail, '-') AS email, 
				IFNULL(P.telefono, '-') AS telefono, 
	  		  IFNULL(P.notas, 'Sin Notas') AS notas, 
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
  			INNER JOIN maestro_ventas m ON m.paciente_id = P.id
			GROUP BY P.id HAVING COUNT(*) > 0;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_HABILITADOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PACIENTES_HABILITADOS`(
	IN `v_filtro` INT,
	IN `v_ini` VARCHAR(50)











)
    COMMENT 'Lista los pacientes habilitados para la venta'
BEGIN


DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = 'TEMPORARY_LIST_PACIENTES_HABILITADOS';
    SET @sql_query = CONCAT('SELECT NULL FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 0) THEN
        DROP TABLE TEMPORARY_LIST_PACIENTES_HABILITADOS;
        DEALLOCATE PREPARE stmt1;
    END IF;
    


CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES_HABILITADOS(
			SELECT
			  (SELECT 
					mv.id
					FROM maestro_ventas mv 
					where mv.paciente_id = P.id
					AND mv.estado_id IN (22, 23) 
					and mv.venta_tipo_id in (1, 2) 
					ORDER by mv.id desc limit 0,1)
					as u_idVenta, 
	  		  P.id AS idPac, 
			  (SELECT me.valor FROM maestro_estado me WHERE me.id = P.estado_id) as estadoPac,
			  concat(P.apellido, ', ', P.nombre) AS name, 
	  		  P.sexo AS sexo, 
	  		  P.c_gestar AS cgestar, 
			  date_format(P.fecha_nac, '%d/%m/%Y') AS fnac, 
			  (SELECT pat.patologia_nombre FROM  patologia pat WHERE pat.id = P.patologia_id) AS patologia, 
	  		  (SELECT spat.sub_patologia_nombre FROM sub_patologia spat WHERE spat.id = P.sub_patologia_id) AS subPatologia, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) as fecha_con,
				IFNULL(P.mail, '-') AS email, 
				IFNULL(P.telefono, '-') AS telefono, 
	  		  IFNULL(P.notas, 'Sin Notas') AS notas, 
	  		  (SELECT 
					date_format(mv.fecha_venta, '%d/%m/%Y')
					FROM maestro_ventas mv 
					where mv.paciente_id = P.id
					AND mv.estado_id IN (22, 23) 
					and mv.venta_tipo_id in (1, 2) 
					ORDER by mv.id desc limit 0,1)
					 as u_fecha_venta,
				(SELECT 
					me.valor 
					FROM maestro_estado me 
					left join maestro_ventas mv on mv.estado_id = me.id 
					where mv.paciente_id = P.id
					AND mv.estado_id IN (22, 23) 
					and mv.venta_tipo_id in (1, 2) 
					ORDER by mv.id desc limit 0,1)
					 as u_venta_estado,
				 (SELECT 
					me.id
					FROM maestro_estado me 
					left join maestro_ventas mv on mv.estado_id = me.id 
					where mv.paciente_id = P.id
					AND mv.estado_id IN (22, 23) 
					and mv.venta_tipo_id in (1, 2) 
					ORDER by mv.id desc limit 0,1)
					 as u_venta_estado_id,
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
/*	  			LEFT JOIN maestro_ventas mv ON mv.paciente_id = P.id
	  			LEFT JOIN maestro_estado mev ON mev.id = mv.estado_id
	  			LEFT JOIN maestro_estado mep ON mep.id = P.estado_id*/
			WHERE
			P.estado_id IN (11) -- Se verifica el estado 11 = Aprobado 
			AND 
				P.sub_estado_id IN (8) -- Se verifica el sub estado 8 = Activo );
			group by P.id);

if(v_filtro = 0) then
	SELECT * FROM TEMPORARY_LIST_PACIENTES_HABILITADOS;
else
	SELECT * FROM TEMPORARY_LIST_PACIENTES_HABILITADOS WHERE LEFT(name,1) = v_ini;
end if;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_NO_APROBADOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PACIENTES_NO_APROBADOS`()
BEGIN


DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;

SET @err = 0;
SET @table_name = 'TEMPORARY_LIST_PACIENTES_NO_APROBADOS';
SET @sql_query = CONCAT('SELECT NULL FROM ',@table_name);
PREPARE stmt1 FROM @sql_query;

IF (@err = 0) THEN
  DROP TABLE TEMPORARY_LIST_PACIENTES_NO_APROBADOS;
  DEALLOCATE PREPARE stmt1;
END IF;

CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES_NO_APROBADOS(
			SELECT
	  		  P.id AS id, 
			  concat(P.apellido, ', ', P.nombre) AS name, 
	  		  P.sexo AS sexo, 
	  		  P.c_gestar AS cgestar, 
			  date_format(P.fecha_nac, '%d/%m/%Y') AS fnac, 
	  		  P.patologia_id AS patologia, 
  	  		  (SELECT patologia_nombre FROM patologia where id = P.patologia_id) AS patologia_nombre, 
	  		  P.sub_patologia_id AS subPatologia, 
  	  		  (SELECT sub_patologia_nombre from sub_patologia where id = P.sub_patologia_id) AS sub_patologia_nombre, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) as fecha_con,
		     P.mail AS email, 
	  		  P.telefono AS telefono, 
	  		  P.notas AS notas,
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.estado_id = me.id) AS estado,
  	  		  P.estado_id AS estado_id,
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
			WHERE P.estado_id NOT IN (11,12));
			
SELECT * FROM TEMPORARY_LIST_PACIENTES_NO_APROBADOS;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_PENDIENTES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PACIENTES_PENDIENTES`()
    COMMENT 'LISTADO DE PACIENTES PENDIENTES'
BEGIN


DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;

SET @err = 0;
SET @table_name = 'TEMPORARY_LIST_PACIENTES_PENDIENTES';
SET @sql_query = CONCAT('SELECT NULL FROM ',@table_name);
PREPARE stmt1 FROM @sql_query;

IF (@err = 0) THEN
  DROP TABLE TEMPORARY_LIST_PACIENTES_PENDIENTES;
  DEALLOCATE PREPARE stmt1;
END IF;

CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES_PENDIENTES(
			SELECT
	  		  P.id AS id, 
			  concat(P.apellido, ', ', P.nombre) AS name, 
	  		  P.sexo AS sexo, 
	  		  P.c_gestar AS cgestar, 
			  date_format(P.fecha_nac, '%d/%m/%Y') AS fnac, 
	  		  P.patologia_id AS patologia, 
  	  		  (SELECT patologia_nombre FROM patologia where id = P.patologia_id) AS patologia_nombre, 
	  		  P.sub_patologia_id AS subPatologia, 
  	  		  (SELECT sub_patologia_nombre from sub_patologia where id = P.sub_patologia_id) AS sub_patologia_nombre, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) as fecha_con,
		     P.mail AS email, 
	  		  P.telefono AS telefono, 
	  		  P.notas AS notas, 
	  		  (SELECT me.valor FROM maestro_estado me where P.estado_id = me.id) AS estado,
  	  		  P.estado_id AS estado_id,
				(SELECT mes.valor FROM maestro_estado mes where P.sub_estado_id = mes.id) AS sub_estado
			FROM
	  			paciente AS P WHERE P.estado_id = 7);
			
SELECT * FROM TEMPORARY_LIST_PACIENTES_PENDIENTES;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PATOLOGIAS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PATOLOGIAS`()
    COMMENT 'Lista las patologias del sistema'
BEGIN

SELECT p.*, m.valor as estado from patologia p inner join maestro_estado m on m.id = p.estado_id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PRESENTACION
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PRESENTACION`()
    COMMENT 'Lista las dosis del sistema'
BEGIN

SELECT * FROM presentacion;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_SUB_ESTADOS_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_SUB_ESTADOS_PACIENTE`()
    COMMENT 'Lista los subestados del paciente'
BEGIN

SELECT id, valor FROM maestro_estado e WHERE e.referencia = 'paciente' AND e.tipo = 'sub_estado';

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_USUARIOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_USUARIOS`()
    COMMENT 'Lista los usuarios del sistema'
BEGIN

SELECT 
u.id,
u.username,
u.email,
m.valor as estado,
r.nombre AS rol_nombre
FROM usuario u
INNER JOIN maestro_estado m ON m.id = u.estado_id
INNER JOIN rol r ON r.id = u.rol_id
ORDER BY username desc;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_NEW_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_NEW_MEDICO`(
	IN `v_nombre` VARCHAR(200),
	IN `v_apellido` VARCHAR(50),
	IN `v_matricula_tipo_id` INT,
	IN `v_matricula_numero` VARCHAR(45),
	IN `v_lugar` VARCHAR(45),
	IN `v_c_atencion` VARCHAR(255),
	IN `v_telefono` VARCHAR(45),
	IN `v_fax` VARCHAR(45),
	IN `v_domicilio` VARCHAR(255),
	IN `v_localidad` VARCHAR(255),
	IN `v_apm_id` INT,
	IN `v_email` VARCHAR(255)

,
	IN `v_usuario` VARCHAR(50)


)
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Creacion de un nuevo medico'
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	
	-- devolvemos el error que ya existe un medico con la combinacion de apellido, nombre, matricula_tipo y numero de matricula
    declare exit handler FOR 1062
    begin
    	  
        SELECT CONCAT('ERROR: Ya existe el medico ', CONCAT(v_apellido, ', ', v_nombre), ' con el numero de matricula: ', v_matricula_numero) AS mensaje;
    end;
	
	SET @count_med = (SELECT COUNT(*) FROM medico m where m.apellido = v_apellido and m.nombre = v_nombre and m.matricula_numero = v_matricula_numero);
		
	SET id_1 := (SELECT LAST_INSERT_ID());
	SET @usuario_id := (SELECT u.id FROM usuario u WHERE v_usuario = u.username);


  INSERT INTO medico 
  	(apellido, 
	  nombre, 
	  matricula_tipo_id, 
	  matricula_numero, 
	  fecha_alta, 
	  apm_id, 
	  c_atencion, 
	  lugar, 
	  mail, 
	  telefono, 
	  fax, 
	  domicilio, 
	  localidad, 
	  fecha_aprobado,
	  usuario_creador,
	  usuario_mod,
	  estado_id)
  VALUES 
  	(v_apellido, 
	  v_nombre, 
	  v_matricula_tipo_id, 
	  v_matricula_numero, 
	  NOW(), 
	  v_apm_id, 
	  v_c_atencion, 
	  v_lugar, 
	  v_email, 
	  v_telefono, 
	  v_fax, 
	  v_domicilio, 
	  v_localidad, 
	  NOW(),
	  @usuario_id,
	  @usuario_id,
	  30);
	
	
	SET id_2 := (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		SELECT id_2 as mensaje;
	END IF;
	
	SELECT 'ERROR NO_INSERT' AS mensaje;
END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_NEW_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_NEW_PACIENTE`(
	IN `v_apellido` VARCHAR(100),
	IN `v_nombre` VARCHAR(100),
	IN `v_fecha_nac` DATE,
	IN `v_sexo` VARCHAR(2),
	IN `v_telefono` VARCHAR(45),
	IN `v_ciudad` VARCHAR(100),
	IN `v_pais_id` INT,
	IN `v_mail` VARCHAR(100),
	IN `v_patologia_id` INT,
	IN `v_sub_patologia_id` INT,
	IN `v_os_id` INT,
	IN `v_usuario` VARCHAR(50),
	IN `v_sub_estado_id` INT,
	IN `v_crm_id` INT


)
    COMMENT 'Creacion del nuevo paciente'
BEGIN

DECLARE c_usuario_id INT;
DECLARE c_sub_estado INT;

	 -- devolvemos el error que ya existe un paciente con la combinacion de apellido, nombre y fecha de nacimiento
    declare exit handler FOR 1062
    begin
        SELECT CONCAT('ERROR: Ya existe el paciente ', CONCAT(v_apellido, ', ', v_nombre), ' con fecha de nacimiento: ', v_fecha_nac) AS mensaje;
    end;
   

-- SET c_sub_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'sub_estado' AND valor = 'v_sub_estado');

SET c_usuario_id = (SELECT u.id FROM usuario u WHERE v_usuario = u.username);

INSERT INTO paciente
	(
		apellido,
		nombre,
		nombre_completo, 
		fecha_nac, 
		sexo, 
		telefono, 
		ciudad, 
		pais_id, 
		mail, 
		patologia_id, 
		sub_patologia_id, 
		os_id, 
		usuario_id,
		usuario_mod_id, 		
		estado_id, 
		sub_estado_id, 
		fecha_creacion,
		fecha_modificacion, 
		familia, 
		crm_id
		)
	VALUES 
	(
		v_apellido, 
		v_nombre, 
		CONCAT(v_apellido, ', ', nombre), 
		v_fecha_nac, 
		v_sexo, 
		v_telefono, 
		v_ciudad, 
		v_pais_id, 
		v_mail, 
		v_patologia_id, 
		v_sub_patologia_id, 
		v_os_id, 
		c_usuario_id, 
		c_usuario_id, 
		7, 
		v_sub_estado_id, 
		NOW(),
		NOW(), 
		'SOL', 
		v_crm_id
		);

SELECT LAST_INSERT_ID() AS mensaje;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.st_reg_faltante
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `st_reg_faltante`(IN `v_operacion` VARCHAR(50), IN `v_idoperacion` INT, IN `v_iddocumento` INT, IN `v_nombre` VARCHAR(255))
BEGIN

declare d_count int;


set d_count=(select count(id) from doc_error where id_documento=v_iddocumento);


if (d_count=0) then

	insert into doc_error set operacion=v_operacion, id_operacion=v_idoperacion, id_documento=v_iddocumento, nombre_doc=v_nombre, estado=0, fe_actualizacion=now();

end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_REL_ESP_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_REL_ESP_MED`(
	IN `v_medico_id` INT,
	IN `v_especialidad` VARCHAR(255)
)
    COMMENT 'Establece la relacion entre medico y especialidad/es'
BEGIN

  SET @esp_id := (SELECT e.id FROM especialidad e WHERE e.especialidad = v_especialidad);
  SET @count_medico := (SELECT COUNT(*) FROM rel_medico_especialidad rme WHERE rme.medico_id = v_medico_id);

IF (@count_medico > 0) THEN
	delete from rel_medico_especialidad where medico_id = v_medico_id and especialidad_id = @esp_id;
 
    END IF;
	INSERT INTO rel_medico_especialidad (medico_id, especialidad_id)
  	VALUES (v_medico_id,@esp_id);

  

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.st_set_id_medico
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `st_set_id_medico`()
BEGIN

update soliris_maestro set id_medico=(select m.id from medicos as m where m.nombre=medico);


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_APM
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_APM`(
	IN `v_idApm` INT
)
    COMMENT 'Muestra la informacion de un apm '
BEGIN

SELECT a.*, m.valor as estado FROM apm a INNER JOIN maestro_estado m ON m.id = a.estado_id where a.id = v_idApm ORDER BY id DESC;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_ESPECIALIDAD
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_ESPECIALIDAD`(
	IN `v_idEspecialidad` INT

)
    COMMENT 'devuelve los datos de una especialidad'
BEGIN
SELECT e.id, m.valor AS estado, e.especialidad, e.familia
FROM especialidad e
INNER JOIN maestro_estado m ON m.id = e.estado_id
WHERE e.id = v_idEspecialidad; END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_INSTITUCION
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_INSTITUCION`(
	IN `v_idInstitucion` INT
)
    COMMENT 'Muestra los datos de una institucion'
BEGIN

SELECT i.*, m.valor as estado from institucion i inner join maestro_estado m on m.id = i.estado_id where i.id = v_idInstitucion;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_MEDICO`(
	IN `v_idMedico` INT


)
    COMMENT 'Muestra los datos de un medico'
BEGIN

SELECT 
	m.id,
	m.nombre,
	m.apellido,
	m.lugar,
	m.c_atencion,
	m.telefono,
	m.fax,
	m.mail,
	m.domicilio,
	m.localidad,
	m.fecha_cap,
	me.valor as estado,
	m.matricula_numero,
	(SELECT date_format(m.fecha_venta, '%d/%m/%Y') FROM maestro_ventas m WHERE m.medico_id = v_idMedico ORDER BY m.id DESC LIMIT 0, 1) as u_venta,
   group_concat(e.especialidad) as especialidad_nombre,
	a.id as apm_id,
	mmat.id as matricula_tipo
FROM medico m 
INNER JOIN rel_medico_especialidad rme on rme.medico_id = m.id
INNER JOIN especialidad e on e.id = rme.especialidad_id
INNER JOIN apm a on a.id = m.apm_id
INNER JOIN medico_matricula mmat on mmat.id = m.matricula_tipo_id
INNER JOin medico_matricula_tipo mmt on mmt.id = mmat.tipo_matricula_id
INNER JOIN maestro_estado me on me.id = m.estado_id
where m.id = v_idMedico;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_PACIENTE`(
	IN `v_id` INT















)
    COMMENT 'Muestra la informacion del paciente'
BEGIN



SELECT 
	p.id as id, 
	p.apellido as apellido, 
	p.nombre as nombre, 
	p.nombre_completo,
	p.usuario_id AS usuario_creador_id,
	(SELECT u.username FROM usuario u WHERE u.id = p.usuario_id) AS usuario_creador,
	p.usuario_mod_id AS usuario_mod_id,
	(SELECT FU_GET_PACIENTE_EDAD(v_id)) as edad,
	(SELECT u.username FROM usuario u WHERE u.id = p.usuario_mod_id) AS usuario_mod,
	(select me.id from maestro_estado me where me.id = p.estado_id) as estado_id,
	(select me.valor from maestro_estado me where me.id = p.estado_id) as estado_valor,
	(select me.id from maestro_estado me where me.id = p.sub_estado_id) as sub_estado_id,
	(select me.valor from maestro_estado me where me.id = p.estado_id) as sub_estado_valor,
	p.fecha_nac as fecha_nac,
	DATE_FORMAT(p.fecha_nac, '%d-%m-%Y') as fecha_nac_formateada,
	(select pat.id from patologia pat where pat.id = p.patologia_id) as patologia_id,
	(select pat.patologia_nombre from patologia pat where pat.id = p.patologia_id) as patologiaNombre,
	(select sub_pat.id from sub_patologia sub_pat where sub_pat.id = p.sub_patologia_id) as sub_patologia_id,
	(select sub_pat.sub_patologia_nombre from sub_patologia sub_pat where sub_pat.id = p.sub_patologia_id) as subPatologiaNombre,
	(SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(v_id), '%d/%m/%Y')) as fecha_con,
	(SELECT DATE_FORMAT (p.fecha_creacion, '%d/%m/%Y %H:%i:%s')) AS fecha_creacion,
	(SELECT DATE_FORMAT (p.fecha_modificacion, '%d/%m/%Y %H:%i:%s')) AS fecha_modificacion,
	p.telefono as telefono,
	p.ciudad as ciudad,
	p.pais_id as pais_id,
	(select pai.nombre from paises pai where pai.id = p.pais_id) as pais_nombre,
	p.mail as mail,
	p.sexo as sexo,
	p.os_id as os_id,
	(select os.nombre from os where os.id = p.os_id) as os_nombre,
	p.notas as notas,
	p.crm_id as crm_id,
	p.c_gestar as c_gestar
FROM 
	paciente p
WHERE 
	p.id = v_id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_PATOLOGIA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_PATOLOGIA`(
	IN `v_id` INT
)
    COMMENT 'Muestra la patologia'
BEGIN

SELECT p.*, m.valor as estado from patologia p inner join maestro_estado m on m.id = p.estado_id where p.id = v_id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_USUARIO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_USUARIO`(
	IN `v_id` INT

)
    COMMENT 'Muestra los datos del usuario'
BEGIN

SELECT 
u.id,
u.username,
u.email,
m.valor as estado,
r.nombre AS rol_nombre
FROM usuario u
INNER JOIN maestro_estado m ON m.id = u.estado_id
INNER JOIN rol r ON r.id = u.rol_id
where u.id = v_id;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_VENTA`(
	IN `v_idVenta` INT








)
    COMMENT 'Muestra los datos de la venta'
BEGIN

SET @fecha_otro := (SELECT 
	DATE_FORMAT(doc.fecha_documento, '%d-%m-%Y') 
	FROM documentos doc 
	INNER JOIN rel_venta_documentos rvd ON rvd.documento_id = doc.id 
	INNER JOIN maestro_ventas m ON m.id = rvd.venta_id 
	WHERE doc.documentos_tipo_id = 4 AND m.id = v_idVenta);

SET @doc_receta = (SELECT 
		d.valor
	FROM rel_venta_documentos rel 
	INNER JOIN documentos d ON d.id = rel.documento_id
	WHERE rel.venta_id = v_idVenta and d.documentos_tipo_id = 3

);

SET @doc_otro = (SELECT 
		d.valor
	FROM rel_venta_documentos rel 
	INNER JOIN documentos d ON d.id = rel.documento_id
	WHERE rel.venta_id = v_idVenta and d.documentos_tipo_id = 4

);



SELECT 
	mv.id,
	p.id as paciente_id,
	p.nombre_completo as paciente_nombre,
	prod.valor as producto,
	med.id as medico_id,
	CONCAT(med.apellido, ',', med.nombre) AS medico_nombre,
	(SELECT FU_GET_PACIENTE_EDAD(p.id)) AS edad,
	d.valor AS presentacion,
	d.id as presentacion_id,
	mv.unidades,
	date_format(mv.fecha_venta, '%d-%m-%Y') AS fecha_venta,
	mv.fecha_venta as f_venta, 
	mv.fecha_mod as f_mod,
	(SELECT FU_GET_USERNAME_USUARIO(mv.usuario_id)) as usuario_creador,
	(SELECT FU_GET_USERNAME_USUARIO(mv.usuario_mod_id)) as usuario_mod,
	date_format(mv.fecha_mod, '%d-%m-%Y') as fecha_mod,
	@doc_receta as doc_receta,
	(SELECT DATE_FORMAT(`FU_GET_FECHA_RECETA`(mv.id), '%d-%m-%Y'))AS fecha_receta,
	@doc_otro as doc_otro,
	@fecha_otro as fecha_otro,
	c.id AS canal_id,
	c.canal AS canal,
	i.id AS institucion_id,
	i.nombre AS institucion,
	me.valor as estado,
	mv.nbr as nbr
 FROM maestro_ventas mv
 INNER JOIN paciente p ON p.id = mv.paciente_id
 INNER JOIN producto prod on prod.id = mv.producto_id
 INNER JOIN medico med ON med.id = mv.medico_id
 LEFT JOIN apm ON apm.id = med.apm_id
 INNER JOIN presentacion d ON d.id = mv.presentacion_id
 INNER JOIN canales c ON c.id = mv.canal_id
 INNER JOIN institucion i ON i.id = mv.institucion_id
 INNER JOIN maestro_estado me on me.id = mv.estado_id
WHERE mv.id = v_idVenta;



END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_VENTAS_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_VENTAS_PACIENTE`(
	IN `v_idPac` INT



)
    COMMENT 'Devuelve las ventas relacionadas con el paciente'
BEGIN

SELECT 
	mv.id,
	CONCAT(med.apellido, ',', med.nombre) AS medico_nombre,
	(SELECT FU_GET_PACIENTE_EDAD(p.id)) AS edad,
	d.valor AS presentacion,
	mv.unidades,
	date_format(mv.fecha_venta, '%d/%m/%Y') AS fecha_venta,
	(SELECT DATE_FORMAT(`FU_GET_FECHA_RECETA`(mv.id), '%d/%m/%Y'))AS fecha_receta,
	c.canal AS canal,
	i.nombre AS institucion,
	apm.nombre_completo AS apm,
	me.valor as estado,
	(SELECT `FU_GET_DOCUMENTS_VENTA`(mv.id)) AS documentos
 FROM maestro_ventas mv
 INNER JOIN paciente p ON p.id = mv.paciente_id
 INNER JOIN rel_venta_documentos rvd ON rvd.venta_id = mv.id
 INNER JOIN documentos doc ON doc.id = rvd.documento_id
 INNER JOIN medico med ON med.id = mv.medico_id
 LEFT JOIN apm ON apm.id = med.apm_id
 INNER JOIN presentacion d ON d.id = mv.presentacion_id
 INNER JOIN canales c ON c.id = mv.canal_id
 INNER JOIN institucion i ON i.id = mv.institucion_id
 INNER JOIN maestro_estado me on me.id = mv.estado_id
WHERE p.id = v_idPac 
GROUP BY mv.id
ORDER BY mv.id desc


;




END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_UP_DOC_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_UP_DOC_PACIENTE`(
	IN `v_idPac` INT,
	IN `v_tipoDoc` VARCHAR(50),
	IN `v_nombreDoc` VARCHAR(255),
	IN `v_usuario` VARCHAR(50)
,
	IN `v_fecha_doc` DATE



)
    COMMENT 'Datos de la documentación subida del paciente'
BEGIN


SET @p_nombre_doc := v_nombreDoc;
SET @p_doc_tipo := 0;
SET @p_usuario_id := 0;
SET @p_id_paciente = v_idPac;
SET @fecha_doc = v_fecha_doc;


SET @documento_tipo_id = CONCAT("SELECT dt.id INTO @p_doc_tipo FROM documentos_tipo dt WHERE dt.tipo = ? AND dt.referencia = 'Paciente'");
PREPARE statement_documento_tipo_id FROM @documento_tipo_id;
SET @p_tipo = v_tipoDoc;
EXECUTE statement_documento_tipo_id USING @p_tipo;
DEALLOCATE PREPARE statement_documento_tipo_id;

SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
PREPARE statement_usuario_id FROM @usuario_id;
SET @p_username = v_usuario;
EXECUTE statement_usuario_id USING @p_username;
DEALLOCATE PREPARE statement_usuario_id;


SET @query_disable_docs = CONCAT("CALL `ST_DISABLE_OLD_DOC_PAC`(?, ?)");
PREPARE statement_query_disable_docs FROM @query_disable_docs;
EXECUTE statement_query_disable_docs USING @p_id_paciente, @p_doc_tipo;
DEALLOCATE PREPARE statement_query_disable_docs;


SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), @fecha_doc, ?, 'SOL')");
PREPARE statement_query_documentos FROM @query_documentos;
EXECUTE statement_query_documentos USING @p_nombre_doc, @p_doc_tipo, @p_usuario_id;
DEALLOCATE PREPARE statement_query_documentos;

SET @query_rel_paciente_documentos = CONCAT("INSERT INTO rel_paciente_documentos (paciente_id, documento_id, fecha_creacion) VALUES (?, LAST_INSERT_ID(), NOW())");
PREPARE statement_query_rel_paciente_documentos FROM @query_rel_paciente_documentos;
EXECUTE statement_query_rel_paciente_documentos USING @p_id_paciente;
DEALLOCATE PREPARE statement_query_rel_paciente_documentos;

SELECT "SE CREO EL REGISTRO CORRECTAMENTE" AS mensaje;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_UP_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_UP_PACIENTE`(
	IN `v_id` INT,
	IN `v_apellido` VARCHAR(100),
	IN `v_nombre` VARCHAR(100),
	IN `v_fecha_nac` DATE,
	IN `v_sexo` VARCHAR(2),
	IN `v_telefono` VARCHAR(45),
	IN `v_ciudad` VARCHAR(100),
	IN `v_pais_id` INT,
	IN `v_mail` VARCHAR(100),
	IN `v_patologia_id` INT,
	IN `v_sub_patologia_id` INT,
	IN `v_os_id` INT,
	IN `v_usuario` VARCHAR(50),
	IN `v_sub_estado_id` VARCHAR(50),
	IN `v_estado_id` INT,
	IN `v_crm_id` INT
)
    COMMENT 'Actualizacion de paciente'
BEGIN

DECLARE c_usuario_mod_id INT;

declare exit handler FOR SQLWARNING
    begin
        SELECT 'ERROR: HA OCURRIDO UN ERROR AL ACTUALIZAR EL PACIENTE' AS mensaje;
    end;

SET c_usuario_mod_id = (SELECT u.id FROM usuario u WHERE v_usuario = u.username);





UPDATE paciente
	SET
		apellido=v_apellido,
		nombre=v_nombre,
		nombre_completo=CONCAT(v_apellido, ', ', v_nombre),
		fecha_nac=v_fecha_nac,
		sexo=v_sexo,
		telefono=v_telefono,
		ciudad=v_ciudad,
		pais_id=v_pais_id,
		mail=v_mail,
		patologia_id=v_patologia_id,
		sub_patologia_id=v_sub_patologia_id,
		os_id=v_os_id,
		c_gestar='',
		estado_id=v_estado_id,
		sub_estado_id=v_sub_estado_id,
		familia='SOL',
		fecha_modificacion=NOW(),
		usuario_mod_id=c_usuario_mod_id,
		crm_id=v_crm_id
	WHERE 
	  id = v_id;

SELECT 'ACTUALIZACION CORRECTA' AS mensaje;
	  
END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_UserAccess
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_UserAccess`(
	IN `v_usuario` VARCHAR(50)
)
    COMMENT 'valida el estado y la existencia del usuario en el sistema. Devuelve las propiedades de grupo y la familia'
BEGIN

DECLARE res INT;

SET res = (SELECT COUNT(*) FROM usuario WHERE username = v_usuario AND estado_id = (SELECT id from maestro_estado where tipo = 'Estado' and referencia = 'usuario' and valor = 'Activo'));

if(res > 0) then 
	SELECT u.id, u.username, r.nombre AS 'grupo' FROM usuario u INNER JOIN rol r ON u.rol_id = r.id WHERE username = v_usuario;
ELSE 
	-- Trabajar con la tabla de mensajes
	SELECT "Mensaje de error";
	
END if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_VAL_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_VAL_PAC`(
	IN `v_idPac` INT,
	IN `v_comentario` LONGTEXT,
	IN `v_estado` INT,
	IN `v_usuario` VARCHAR(45)
)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN

-- SETEO DE VARIABLES UTILIZADAS EN EL STORE PROCEDURED
SET @p_usuario_id := 0; -- VARIABLE QUE CONTENDRA EL ID DEL USUARIO QUE REALIZA LA ACCION
SET @p_id_pac = v_idPac;
SET @p_comentario = v_comentario;
SET @p_estado = v_estado;

-- OBTENGO EL ID DEL USUARIO QUE ESTA HACIENDO LA ACCION
SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
PREPARE statement_usuario_id FROM @usuario_id;
SET @p_username = v_usuario;
EXECUTE statement_usuario_id USING @p_username;
DEALLOCATE PREPARE statement_usuario_id;

SET @query_update_paciente = CONCAT("UPDATE paciente p SET p.estado_id = ?, p.notas = ?, p.usuario_mod_id = ?, p.fecha_modificacion = NOW() WHERE p.id = ?");
PREPARE statement_update_paciente FROM @query_update_paciente;
EXECUTE statement_update_paciente USING @p_estado, @p_comentario, @p_usuario_id, @p_id_pac;
DEALLOCATE PREPARE statement_update_paciente;

-- RETORNO EL MENSAJE AL BACKEND
SELECT "SE ACTUALIZO EL PACIENTE CORRECTAMENTE" AS mensaje;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_ADJ_FILES
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_ADJ_FILES`(
	`v_id_maestro` INT,
	`v_numero_reg` VARCHAR(50),
	`v_referencia` VARCHAR(45),
	`v_tipo` VARCHAR(45),
	`v_fecha` VARCHAR(45),
	`v_documento` VARCHAR(255)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());

	IF v_numero_reg=0 THEN
		INSERT INTO soliris_documentacion SET
			id_maestro = v_id_maestro,
			referencia = v_referencia, 
			documento = v_documento,
			tipo = v_tipo,
			fecha = v_fecha;
		ELSE
			update  soliris_documentacion SET
			id_maestro = v_id_maestro,
			referencia = v_referencia, 
			documento = v_documento,
			tipo = v_tipo,
			fecha = v_fecha
			where id=v_numero_reg;
		END IF;
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_CLE_TAGS
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_CLE_TAGS`(
	`$str` TEXT

) RETURNS text CHARSET latin1
    COMMENT 'Limpia los tags HTML'
BEGIN

DECLARE $start, $end INT DEFAULT 1;
    LOOP
        SET $start = LOCATE("<", $str, $start);
        IF (!$start) THEN RETURN $str; END IF;
        SET $end = LOCATE(">", $str, $start);
        IF (!$end) THEN SET $end = $start; END IF;
        SET $str = INSERT($str, $start, $end - $start + 1, "");
END LOOP;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_CONVEN_PANEL_MOD
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_CONVEN_PANEL_MOD`(
	`v_id` INT,
	`v_usuairo` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE devolucion LONGTEXT;
	UPDATE soliris_maestro SET estado = 'NP', fecha_venta = now() WHERE id = v_id;
	
	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
  RETURN devolucion;
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_DOCUMENTS_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_DOCUMENTS_VENTA`(
	`v_id` INT
) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
    COMMENT 'devuelve un array con los documentos de la venta'
BEGIN

declare s_response varchar(255);

set s_response=(
	SELECT 
		GROUP_CONCAT(d.valor)
	FROM rel_venta_documentos rel 
	INNER JOIN documentos d ON d.id = rel.documento_id
	WHERE rel.venta_id = v_id

);

if s_response is null  then 
	set s_response="Sin Documentación";
end if;
	

return s_response;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_ESP_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_ESP_MEDICO`(
	`v_idMedico` INT
) RETURNS varchar(50) CHARSET latin1
    COMMENT 'Obtiene las especialidades de un medico'
BEGIN

return  (
SELECT 
	GROUP_CONCAT(e.especialidad) 
FROM especialidad e
INNER JOIN rel_medico_especialidad r ON r.especialidad_id = e.id
INNER JOIN medico m ON m.id = r.medico_id
WHERE m.id = v_idMedico);

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_FECHA_RECETA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_FECHA_RECETA`(
	`v_id` INT
) RETURNS date
    COMMENT 'Obtiene la fecha de la receta de la venta'
BEGIN

return (
	SELECT
		doc.fecha_documento 
	FROM 
		documentos doc
	INNER JOIN rel_venta_documentos rvd
	ON rvd.documento_id = doc.id
	INNER JOIN maestro_ventas m
	ON m.id = rvd.venta_id
	WHERE 
		doc.documentos_tipo_id = 3 
	AND 
		m.id = v_id);

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_ID_USUARIO
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_ID_USUARIO`(
	`v_username` VARCHAR(50)
) RETURNS int(11)
    COMMENT 'devuelve el id del usuario'
BEGIN

RETURN (SELECT u.id AS id_usuario FROM usuario u WHERE u.username = v_username ) ;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_MED_NAME
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_MED_NAME`(
	`v_medico` INT
) RETURNS varchar(100) CHARSET latin1
    COMMENT 'Obtiene el nombre del Médico'
BEGIN
declare nombre varchar(255);
set nombre = (SELECT GROUP_CONCAT(M.Apellido, ' ', M.Nombre) FROM medicos as M WHERE M.id = v_medico);

RETURN nombre;
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_PACIENTE_EDAD
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_PACIENTE_EDAD`(
	`v_id_paciente` INT

) RETURNS int(11)
    COMMENT 'DEVUELVE LA EDAD DEL PACIENTE'
BEGIN

return (SELECT 
	YEAR(CURDATE()) - YEAR(p.fecha_nac) - IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(p.fecha_nac), '-', DAY(p.fecha_nac)) ,'%Y-%c-%e') > CURDATE(), 1, 0) AS edad
FROM paciente p where p.id = v_id_paciente);


END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_USERNAME_USUARIO
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_USERNAME_USUARIO`(
	`v_idUsuario` INT
) RETURNS varchar(50) CHARSET latin1
    COMMENT 'devuelve el username del id del usuario'
BEGIN

return (SELECT u.username FROM usuario u where u.id = v_idUsuario);

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_VENTA_MOD
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_VENTA_MOD`(
	`v_idMstr` INT,
	`v_fechas` INT



) RETURNS varchar(100) CHARSET latin1
    COMMENT 'Funcion para obternet los datos de la venta'
BEGIN

declare dev varchar(100);

IF (v_fechas = 0) THEN 
	set dev = (
			SELECT
				concat (rv.id, "|", (SUBSTRING_INDEX((get_paciente(rv.nombre)), '|', 1)), "|", rv.medico, "|", rv.presentacion, "|", rv.unidades, "|", rv.estado) as datosVenta
			FROM soliris_maestro rv where rv.id = v_idMstr);
ELSE
	SET dev = (
		select 
			concat (IFNULL(rv.fecha_venta, "Sin Fecha de Venta"), "|", (IFNULL(rv.fecha_receta, "Sin Fecha Receta")), "|", IFNULL(rv.fecha_test, "Sin Fecha de Test"), "|", IFNULL(rv.fecha_otro, "Sin Fecha")) as datosFechas
		FROM soliris_maestro rv where rv.id = v_idMstr);

END IF;

IF(FOUND_ROWS() = 0) THEN
	return FOUND_ROWS();
ELSE 
	return dev;
END IF;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_MOD_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_MOD_VENTA`(
	`v_idMst` INT,
	`v_f_venta` DATE,
	`v_patologia` LONGTEXT,
	`v_presentacion` VARCHAR(200),
	`v_unidades` INT,
	`v_institucion` LONGTEXT,
	`v_canal` VARCHAR(200),
	`v_medico` VARCHAR(200),
	`v_usuario` VARCHAR(45)


) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE devolucion LONGTEXT;
	
UPDATE soliris_maestro SET 
	medico = (SELECT M.Nombre FROM medicos as M WHERE M.id = v_medico),
	presentacion = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_presentacion),
	unidades = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_unidades),
	fecha_venta = now(),
	patologia = v_patologia,
	institucion = (SELECT I.nombre FROM institucion as I WHERE I.id = v_institucion),
	canal = (SELECT C.canal FROM canales as C WHERE C.id = v_canal),
	cargado = v_usuario,
	fecha = now(),
	APM = (SELECT A.nombre FROM medicos AS M LEFT JOIN apm AS A ON (M.apm = A.id) WHERE M.id = v_medico)
WHERE id = v_idMst;

	
	IF (SELECT ROW_COUNT() > 0)  THEN
		SET devolucion = v_idMst;
	ELSE
		SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_APM
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_APM`(
	`v_nombre` VARCHAR(100),
	`v_usuario` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO apm (
	nombre,
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM apm WHERE 
	nombre = v_nombre
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_CANAL
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_CANAL`(
	`v_nombre` VARCHAR(100),
	`v_familia` VARCHAR(45),
	`v_direccion` LONGTEXT,
	`v_mail` VARCHAR(200),
	`v_dir_tec` VARCHAR(200),
	`v_cont_venta` LONGTEXT,
	`v_cont_otro` LONGTEXT,
	`v_puntos_entrega` LONGTEXT,
	`v_usuario` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO canales (
	canal,
	familia,
	direccion,
	mail,
	dir_tec,
	cont_venta,
	cont_otro,
	puntos_entrega,
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	v_familia,
	v_direccion,
	v_mail,
	v_dir_tec,
	v_cont_venta,
	v_cont_otro,
	v_puntos_entrega,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM canales WHERE 
	canal = v_nombre AND
	familia = v_familia AND
	direccion = v_direccion AND
	mail = v_mail AND
	dir_tec = v_dir_tec AND
	cont_venta = v_cont_venta AND
	cont_otro = v_cont_otro AND
	puntos_entrega = v_puntos_entrega
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_DOSIS
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_DOSIS`(
	`v_nombre` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45)


) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO auxiliar (
	valor,
	tipo,
	familia,
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	'dosis',
	v_familia,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM auxiliar WHERE 
	valor = v_nombre AND
	tipo = 'dosis' AND
	familia = v_familia AND 
	usuario_audit = v_usuario
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_ESP
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_ESP`(
	`v_nombre` VARCHAR(100),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO especialidad (
	especialidad,
	familia,
	estado_id,
	usuario_audit
) 
SELECT 
	v_nombre,
	v_familia,
	28,
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM especialidad WHERE 
	especialidad = v_nombre AND
	familia = v_familia AND 
	usuario_audit = v_usuario
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_INST
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_INST`(
	`v_nombre` VARCHAR(250),
	`v_direccion` VARCHAR(250),
	`v_altura` INT,
	`v_localidad` VARCHAR(100),
	`v_provincia` VARCHAR(100),
	`v_contacto` VARCHAR(100),
	`v_mail` VARCHAR(100),
	`v_telefono` VARCHAR(45),
	`v_notas` LONGTEXT,
	`v_tipo` VARCHAR(10),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45)


) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO institucion (
	nombre,
	direccion,
	altura,
	localidad,
	provincia,
	contacto,
	mail,
	telefono,
	notas,
	tipo,
	familia,
	estado_id,
	usuario_audit
) 
SELECT 
	v_nombre,
	v_direccion,
	v_altura,
	v_localidad,
	v_provincia,
	v_contacto,
	v_mail,
	v_telefono,
	v_notas,
	v_tipo,
	v_familia,
	26,
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM institucion WHERE 
	nombre = v_nombre AND
	direccion = v_direccion AND
	altura = v_altura AND
	localidad = v_localidad AND
	provincia = v_provincia AND
	contacto = v_contacto AND
	mail = v_mail AND
	telefono = v_telefono AND
	notas = v_notas AND
	tipo = v_tipo AND
	familia = v_familia AND
	usuario_audit = v_usuario
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_PAC`(`v_nombre` VARCHAR(200), `v_estado` VARCHAR(45), `v_sub_estado` VARCHAR(45), `v_sexo` VARCHAR(2), `v_c_gestar` VARCHAR(2), `v_patologia` VARCHAR(250), `v_fecha_nac` DATE, `v_telefono` VARCHAR(45), `v_ciudad` VARCHAR(100), `v_mail` VARCHAR(100), `v_fecha_con` DATE, `v_usuario` VARCHAR(45), `v_fv` INT) RETURNS longtext CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO pacientes (
	Nombre, 
	estado, 
	sub_estado,
	sexo, 
	c_gestar, 
	Patologia, 
	fecha_nac, 
	telefono, 
	Ciudad, 
	mail, 
	Fecha_Con, 
	usuario, 
	fecha_alta, 
	fv, 
	fecha_stamp) 
SELECT v_nombre, v_estado, v_sub_estado, v_sexo, v_c_gestar, v_Patologia, v_fecha_nac, v_telefono, v_Ciudad, v_mail, v_Fecha_Con, v_usuario, now(), v_fv, now() 
FROM dual WHERE NOT EXISTS (
  SELECT * FROM pacientes WHERE 
  Nombre = v_nombre AND 
  estado = v_estado AND 
  sub_estado = v_sub_estado AND
  sexo = v_sexo AND 
  c_gestar = v_c_gestar AND 
  Patologia = v_patologia AND 
  fecha_nac = v_fecha_nac AND 
  telefono = v_telefono AND 
  Ciudad = v_ciudad AND 
  mail = v_mail AND 
  Fecha_Con = v_fecha_con AND 
  usuario = v_usuario AND 
  fecha_alta = now() AND 
  fv = v_fv AND 
  fecha_stamp = now()
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_PATOLOGIA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_PATOLOGIA`(
	`v_patologia` VARCHAR(100),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45)






) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO patologia (
	patologia_nombre,
	familia,
	estado_id,
	usuario_audit
) 
SELECT 
	v_patologia,
	v_familia,
5,
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM patologia WHERE 
	patologia_nombre = v_patologia AND
	familia = v_familia AND 
	usuario_audit = v_usuario
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2; 
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_UNIDADES
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_UNIDADES`(
	`v_nombre` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO auxiliar (
	valor,
	tipo,
	familia,
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	'unidades',
	v_familia,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM auxiliar WHERE 
	valor = v_nombre AND
	tipo = 'unidades' AND
	familia = v_familia AND 
	usuario_audit = v_usuario
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2; 
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_USR
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_USR`(
	`v_usuario` VARCHAR(45),
	`v_grupo` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_mail` VARCHAR(90)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO soliris_usuarios (
	usuario,
	grupo,
  familia,
	mail,
	estado
) 
SELECT 
	v_usuario,
	v_grupo,
	v_familia,
	v_mail,
	'Activo'
FROM dual WHERE NOT EXISTS (
  SELECT * FROM soliris_usuarios WHERE 
	usuario = v_usuario AND
	grupo = v_grupo AND
	familia = v_familia AND
	mail = v_mail
);
	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_NEW_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_VENTA`(
	`v_id_paciente` INT,
	`v_f_venta` DATE,
	`v_patologia` LONGTEXT,
	`v_dosis` VARCHAR(200),
	`v_unidades` INT,
	`v_institucion` LONGTEXT,
	`v_canal` VARCHAR(200),
	`v_medico` VARCHAR(200),
	`v_usuario` VARCHAR(45)


) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	DECLARE c_tipo VARCHAR(2);
	DECLARE c_padre INT;
	
	DECLARE devolucion LONGTEXT;
	
	SET c_padre = null;
	SET c_tipo = 'RI';

	SET c_padre = (SELECT RM.id FROM soliris_maestro as RM WHERE RM.nombre = v_id_paciente ORDER BY RM.id DESC LIMIT 1);

	IF (SELECT LENGTH(c_padre) > 0) THEN
		SET c_tipo = 'FU';
	END IF;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO soliris_maestro SET 
	nombre = v_id_paciente, 
	sexo = (SELECT sexo FROM pacientes as P WHERE P.id = v_id_paciente),
	fecha_nac = (SELECT fecha_nac FROM pacientes as P WHERE P.id = v_id_paciente),
/*	edad = (SELECT YEAR(CURDATE())- YEAR(STR_TO_DATE(P.fecha_nac, '%Y-%c-%e')) FROM pacientes as P WHERE P.id = v_id_paciente), PMIRANDA*/
  edad = (SELECT TIMESTAMPDIFF(YEAR,STR_TO_DATE(P.fecha_nac, '%Y-%c-%e'),CURDATE()) FROM pacientes as P WHERE P.id = v_id_paciente),
/* 	edad = (SELECT YEAR(CURDATE())- YEAR(STR_TO_DATE(P.fecha_nac, '%e-%c-%Y')) FROM pacientes as P WHERE P.id = v_id_paciente), */
	medico = (SELECT M.Nombre FROM medicos as M WHERE M.id = v_medico),
	id_medico = (SELECT M.id FROM medicos as M WHERE M.id = v_medico),
	dosis = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_dosis),
	unidades = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_unidades),
	fecha_venta = v_f_venta,
	consentimiento = (SELECT P.Fecha_Con FROM pacientes as P WHERE P.id = v_id_paciente),
	patologia = v_patologia,
	institucion = (SELECT I.nombre FROM institucion as I WHERE I.id = v_institucion),
	canal = (SELECT C.canal FROM canales as C WHERE C.id = v_canal),
	cargado = v_usuario,
	fecha = now(),
	tipo = c_tipo,
	padre = c_padre,
	estado = 'Documentacion',
	APM = (SELECT A.nombre FROM medicos AS M LEFT JOIN apm AS A ON (M.apm = A.id) WHERE M.id = v_medico);

	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_SHOW_FECHA_CONS_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_SHOW_FECHA_CONS_PAC`(
	`v_id` INT


) RETURNS date
    COMMENT 'Devuelve la fecha del consentimiento del paciente'
BEGIN

return (
SELECT 
--	date_format(d.fecha_documento, '%d/%m/%Y') as fconsen
	d.fecha_documento
FROM 
	rel_paciente_documentos r 
INNER JOIN 
	paciente p 
ON 
	r.paciente_id = v_id
INNER JOIN 
	documentos d 
ON 
	r.documento_id = d.id
WHERE 
	d.documentos_tipo_id = 1 -- ID del consentimiento de vacunacion de la tabla documentos_id
and
	d.estado_id = 15
	ORDER BY 
	r.id 
DESC LIMIT 0, 1); -- estado activo del documento en el maestro de estados

				
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_APM
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_APM`(
	`v_nombre` VARCHAR(100),
	`v_estado` VARCHAR(45),
	`v_usuario` VARCHAR(45)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE apm SET 
			nombre = v_nombre, 
			estado_id = (SELECT * FROM maestro_estado m where m.valor = v_estado and m.referencia = 'apm'), 
			usuario_audit = v_usuario
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_CANAL
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_CANAL`(
	`v_nombre` VARCHAR(100),
	`v_familia` VARCHAR(45),
	`v_direccion` LONGTEXT,
	`v_mail` VARCHAR(200),
	`v_dir_tec` VARCHAR(200),
	`v_cont_venta` LONGTEXT,
	`v_cont_otro` LONGTEXT,
	`v_puntos_entrega` LONGTEXT,
	`v_estado` VARCHAR(45),
	`v_usuario` VARCHAR(45),
	`v_id` INT
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE canales SET 
			canal = v_nombre, 
			familia = v_familia, 
			direccion = v_direccion,
			mail = v_mail,
			dir_tec = v_dir_tec,
			cont_venta = v_cont_venta,
			cont_otro = v_cont_otro,
			puntos_entrega = v_puntos_entrega,
			estado = v_estado, 
			usuario_audit = v_usuario
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_DOSIS
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_DOSIS`(
	`v_nombre` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45),
	`v_id` INT
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE auxiliar SET 
			valor = v_nombre, 
			familia = v_familia,
			usuario_audit = v_usuario
		WHERE 
			tipo = 'dosis' AND 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_ESP
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_ESP`(
	`v_nombre` VARCHAR(100),
	`v_familia` VARCHAR(3),
	`v_estado` VARCHAR(45),
	`v_usuario` VARCHAR(45),
	`v_id` INT


) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE especialidad e SET 
			e.especialidad = v_nombre, 
			e.familia = v_familia,
			e.estado_id = (SELECT m.id FROM maestro_estado m where m.valor = v_estado and m.referencia = 'especialidad'), 
			usuario_audit = v_usuario
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_INST
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_INST`(
	`v_nombre` VARCHAR(250),
	`v_direccion` VARCHAR(250),
	`v_altura` INT,
	`v_localidad` VARCHAR(100),
	`v_provincia` VARCHAR(100),
	`v_contacto` VARCHAR(100),
	`v_mail` VARCHAR(100),
	`v_telefono` VARCHAR(45),
	`v_notas` LONGTEXT,
	`v_tipo` VARCHAR(10),
	`v_estado` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45),
	`v_id` INT

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE institucion SET 
			nombre = v_nombre, 
			direccion = v_direccion, 
			altura = v_altura, 
			localidad = v_localidad, 
			provincia = v_provincia, 
			contacto = v_contacto, 
			mail = v_mail, 
			telefono = v_telefono, 
			notas = v_notas, 
			tipo = v_tipo, 
			familia = v_familia, 
  			estado_id = (SELECT m.id from maestro_estado m where m.valor = v_estado and m.referencia = 'institucion'), 
			usuario_audit = v_usuario
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_MED`(`v_nombre` VARCHAR(200), `v_matricula_tipo` VARCHAR(45), `v_matricula_numero` VARCHAR(45), `v_Lugar` VARCHAR(45), `v_C_Atencion` VARCHAR(255), `v_telefono` VARCHAR(45), `v_Fax` VARCHAR(45), `v_nacimiento` VARCHAR(20), `v_domicilio` VARCHAR(255), `v_localidad` VARCHAR(255), `v_fecha_cap` VARCHAR(20), `v_especialidad` VARCHAR(255), `v_apm` INT, `v_estado` VARCHAR(15), `v_usuario` VARCHAR(45), `v_id` INT
, `v_email` VARCHAR(255)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
	IF v_estado = 'Activo' THEN
		UPDATE medicos SET 
			Aprobado = v_usuario,
			Fecha_Aprobado = now()
		WHERE 
			id = v_id;
	END IF;

		UPDATE medicos SET 
				Nombre = v_nombre,
		    matricula_tipo = v_matricula_tipo,
		    matricula_numero = v_matricula_numero,
		    Lugar = v_Lugar,
		    C_Atencion = v_C_Atencion,
		    telefono = v_telefono,
		    Fax = v_Fax,
		    nacimiento = v_nacimiento,
		    domicilio = v_domicilio,
		    localidad = v_localidad,
		    fecha_cap = v_fecha_cap,
		    especialidad = v_especialidad,
		    apm = v_apm,
		    estado = v_estado,
  		    mail = v_email
		WHERE 
			id = v_id;

	

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_PAC`(
	`v_nombre` VARCHAR(200),
	`v_estado` VARCHAR(45),
	`v_sub_estado` VARCHAR(45),
	`v_sexo` VARCHAR(2),
	`v_c_gestar` VARCHAR(2),
	`v_patologia` VARCHAR(250),
	`v_fecha_nac` DATE,
	`v_telefono` VARCHAR(45),
	`v_ciudad` VARCHAR(100),
	`v_mail` VARCHAR(100),
	`v_fecha_con` DATE,
	`v_usuario` VARCHAR(45),
	`v_fv` INT,
	`v_aprobado` VARCHAR(45),
	`v_id` INT
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
	IF v_aprobado <> '' THEN
		UPDATE pacientes SET 
			aprobado = v_aprobado,
			fecha_aprobado = now()
		WHERE 
			id = v_id;
	END IF;

		UPDATE pacientes SET 
			Nombre = v_nombre,
	    estado = v_estado,
 	    sub_estado = v_sub_estado,
	    sexo = v_sexo,
	    c_gestar = v_c_gestar,
	    Patologia = v_patologia,
	    fecha_nac = v_fecha_nac,
	    telefono = v_telefono,
	    Ciudad = v_ciudad,
	    mail = v_mail,
	    Fecha_Con = v_fecha_con,
	    usuario = v_usuario,
	    fv = v_fv,
	    fecha_stamp = now()
		WHERE 
			id = v_id;



	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_PANEL_MOD
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_PANEL_MOD`(
	`v_id` INT,
	`v_comentario` VARCHAR(255),
	`v_estado` VARCHAR(45),
	`v_grupo` VARCHAR(45),
	`v_validacion` VARCHAR(5),
	`v_usuario` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE devolucion LONGTEXT;
	UPDATE soliris_maestro SET 
		autoriza = v_usuario, autoriza_fecha = now(), 
		autoriza_nota = v_comentario, 
		estado = v_estado, 
		validacion = v_validacion,
		grupo = 'ventas' 
	WHERE id = v_id;
	
	INSERT INTO soliris_notas 
		SET tabla = 'soliris_maestro', registro = v_id, 
		notas = v_comentario, fecha = now(), 
		usuario = v_usuario, grupo = v_grupo, 
		estado = v_estado;
	
	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;	
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_PATOLOGIA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_PATOLOGIA`(
	`v_patologia` VARCHAR(100),
	`v_familia` VARCHAR(3),
	`v_estado` VARCHAR(45)
,
	`v_usuario` VARCHAR(45)

,
	`v_id` INT



) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE patologia SET 
			patologia_nombre = v_patologia, 
			familia = v_familia,
			estado_id = (SELECT m.id from maestro_estado m where m.valor = v_estado and m.referencia = 'patologia'),
			usuario_audit = v_usuario
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
 	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_UNIDADES
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_UNIDADES`(
	`v_nombre` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45),
	`v_id` INT
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE auxiliar SET 
			valor = v_nombre, 
			familia = v_familia,
			usuario_audit = v_usuario
		WHERE 
			tipo = 'unidades' AND 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
 	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_USR
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_USR`(
	`v_usuario` VARCHAR(45),
	`v_grupo` VARCHAR(45),
	`v_familia` VARCHAR(3),
	`v_mail` VARCHAR(90),
	`v_estado` VARCHAR(45),
	`v_id` INT
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE soliris_usuarios SET 
			usuario = v_usuario, 
			grupo = v_grupo, 
			familia = v_familia, 
			mail = v_mail,
			estado = v_estado
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_VAL_FEC_REC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_VAL_FEC_REC`(
	`v_id` INT,
	`v_pac` INT,
	`v_fec_rec` DATE

) RETURNS varchar(50) CHARSET latin1
    COMMENT 'Funcion que valida la fecha de receta'
BEGIN
DECLARE res_receta DATE;

SET res_receta = (SELECT 
	im.fecha_receta
FROM 
	soliris_maestro im 
WHERE 
	im.id NOT IN ('v_id') 
AND 
	im.nombre = 'v_pac '
AND 
	im.fecha_receta = 'v_fec_rec' 
AND 
	im.estado IN('FV', 'Documentacion', 'NP')
LIMIT 1);
	
	RETURN res_receta;
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_VAL_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_VAL_MED`(
	`v_ape` VARCHAR(50),
	`v_nom` VARCHAR(50),
	`v_prov_id` INT,
	`v_mat_n` INT,
	`v_mat_p` INT

) RETURNS varchar(100) CHARSET latin1
    COMMENT 'VALIDACION DEL MEDICO'
BEGIN

IF (v_mat_n > 0 AND v_mat_n != "") THEN
	IF (SELECT count(*) FROM medicos M WHERE (M.apellido NOT IN('v_ape') AND M.nombre NOT IN('v_nom')) AND (M.m_nac = v_mat_n)) THEN
			RETURN "ERROR - YA HAY UN MÉDICO CON ESA MATRICULA NACIONAL";
		ELSE
			RETURN "OK";
	END IF;

ELSE 
	IF (v_mat_p > 0 AND v_mat_p != "") THEN
		IF (SELECT count(*) FROM medicos M WHERE (M.apellido NOT IN('v_ape') AND M.nombre NOT IN('v_nom')) AND (M.m_prov = v_mat_n AND M.prov_id = v_prov_id)) THEN
			RETURN "ERROR - YA HAY UN MÉDICO CON ESA MATRICULA PROVINCIAL";
		ELSE
	      RETURN "OK";
		END IF;
	END IF;
END IF;
	
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_VAL_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_VAL_PAC`(
	`v_id` INT,
	`v_comentario` LONGTEXT,
	`v_estado` INT,
	`v_usuario` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
 
		UPDATE paciente SET 
			notas = v_comentario,
	      estado = v_estado,
 	      fecha_stamp = now()
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			
		IF (v_estado = 'Aprobado') THEN
			UPDATE pacientes SET 
		    aprobado = v_usuario,
		    fecha_aprobado = now(),
		    fecha_stamp = now()
			WHERE 
				id = v_id;
		else
			UPDATE pacientes SET 
		    aprobado = NULL,
		    fecha_aprobado = NULL
		   WHERE 
			 id = v_id;
				
		END IF;
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;

	
	RETURN devolucion;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_VAL_PAC_EDAD
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_VAL_PAC_EDAD`(
	`v_edad` INT,
	`v_sexo` VARCHAR(5)
) RETURNS text CHARSET latin1
BEGIN

DECLARE res TEXT;
DECLARE edad_ped int;
DECLARE edad_c_g int;

set edad_ped = (SELECT SUBSTRING_INDEX(GROUP_CONCAT(valor),',',1) as e_ped FROM configuracion where tipo = 'edad_paciente'); 
set edad_c_g = (SELECT SUBSTRING_INDEX(GROUP_CONCAT(valor),',',-1) as e_c_ges FROM configuracion where tipo = 'edad_paciente');

CASE  
 WHEN (v_edad <= edad_ped) THEN 
    SET res = (SELECT CONCAT_WS(',', nota, FU_CLE_TAGS(nota)) FROM configuracion WHERE valor = edad_ped);
 WHEN ((v_edad > edad_ped AND v_edad <= edad_c_g) AND (v_sexo = 'F')) THEN
    SET res = (SELECT CONCAT_WS(',', nota, FU_CLE_TAGS(nota)) FROM configuracion WHERE valor = edad_c_g);
 END CASE;
return res;


END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_VAL_UNI
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_VAL_UNI`(
	`v_id_pac` INT,
	`v_diff_u_v` INT,
	`v_id_mst` INT

) RETURNS int(11)
BEGIN

DECLARE cant_hist INT;
DECLARE cant_venta INT;
DECLARE res INT;

SET cant_hist = (SELECT IFNULL((SELECT SUM(unidades) as CANT_uni FROM soliris_maestro as RM WHERE RM.nombre = v_id_pac AND DATE(RM.fecha_venta) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL v_diff_u_v DAY) AND DATE(NOW()) and RM.estado IN('NP', 'FV') and RM.id not in (v_id_mst)) , 0));

SET cant_venta = (SELECT unidades from soliris_maestro where id = v_id_mst);

SET res = (select cant_hist + cant_venta);

RETURN res;

END//
DELIMITER ;

-- Volcando estructura para función soliris.GET_NOM_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_NOM_PAC`(
	`v_id` INT
) RETURNS varchar(250) CHARSET latin1
    COMMENT 'Obtiene el nombre del paciente en base al ID'
BEGIN

DECLARE d_salida VARCHAR(250);

set d_salida = (SELECT nombre from pacientes where id = v_id);
return d_salida;
END//
DELIMITER ;

-- Volcando estructura para función soliris.get_paciente
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_paciente`(`v_id` INT) RETURNS longtext CHARSET latin1
    COMMENT 'devuelve el nombre del paciente en base a su id'
BEGIN

declare d_resp longtext;


set d_resp = (select concat(nombre,"|",sexo,"|",patologia,"|",c_gestar) from pacientes where id=v_id);

return d_resp;

END//
DELIMITER ;

-- Volcando estructura para disparador soliris.maestro_ventas_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `maestro_ventas_after_insert` AFTER INSERT ON `maestro_ventas` FOR EACH ROW BEGIN

INSERT INTO maestro_ventas_transaccion
	(estado_id, usuario_id, maestro_id, tipo_venta_id, fecha_stamp)
	VALUES (NEW.estado_id, NEW.usuario_id, NEW.id, NEW.venta_tipo_id, NOW());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador soliris.maestro_ventas_ususario_mod
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `maestro_ventas_ususario_mod` BEFORE INSERT ON `maestro_ventas` FOR EACH ROW BEGIN

-- Al generarse una venta, el usuario modificador es el mismo que el usuario creador

SET NEW.usuario_mod_id = NEW.usuario_id;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
