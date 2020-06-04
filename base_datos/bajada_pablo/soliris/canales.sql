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
  `convenio` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=297;

-- Volcando datos para la tabla soliris.canales: ~57 rows (aproximadamente)
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` (`id`, `canal`, `familia`, `direccion`, `mail`, `dir_tec`, `cont_venta`, `cont_otro`, `puntos_entrega`, `documentacion`, `usuario_audit`, `fecha_audit`, `estado`, `estado_id`, `convenio`) VALUES
	(75, 'Scienza', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:31', 'Activo', 24, 0),
	(76, 'ROS FAR', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:35', 'Activo', 24, 0),
	(77, 'META', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:39', 'Activo', 24, 0),
	(78, 'Medicus', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:43', 'Activo', 24, 0),
	(79, 'SMG', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:00:47', 'Activo', 24, 0),
	(80, 'Hospital Italiano', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:00', 'Activo', 24, 0),
	(81, 'OMINT', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:12', 'Activo', 24, 0),
	(82, 'Hospital Churruca', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:18', 'Activo', 24, 0),
	(83, 'DroFar', 'SOL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-08-15 09:01:24', 'Activo', 24, 0),
	(84, 'Hospital Aleman', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:30', 'Activo', 24, 0),
	(85, 'Hospital Britanico', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:37', 'Activo', 24, 0),
	(86, 'IOSE', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:42', 'Activo', 24, 0),
	(87, 'ONCOFARMA', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:46', 'Activo', 24, 0),
	(88, 'REDFARM', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:53', 'Activo', 24, 0),
	(89, 'MONUMENTO', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:01:59', 'Activo', 24, 0),
	(90, 'AVANTFAR', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:04', 'Activo', 24, 0),
	(91, 'WENT', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:08', 'Activo', 24, 0),
	(92, 'ORIEN', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:13', 'Activo', 24, 0),
	(93, 'FARMA KD', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:17', 'Activo', 24, 0),
	(94, 'MEDITERRANEA', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:22', 'Activo', 24, 0),
	(95, 'EXCELL PHARMA', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:28', 'Activo', 24, 0),
	(96, 'CICLOFAR', 'SOL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-08-15 09:02:37', 'Activo', 24, 0),
	(97, 'CITY PHARMA GROUP', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:44', 'Activo', 24, 0),
	(98, 'In.S.S.Se.P', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:02:59', 'Activo', 24, 0),
	(99, 'SIFAR', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:31', 'Activo', 24, 0),
	(100, 'ONCOLIFE', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:36', 'Activo', 24, 0),
	(101, 'ABC', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:52', 'Activo', 24, 0),
	(102, 'MEDIFAR', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:06:58', 'Activo', 24, 0),
	(103, 'AUDIFARM', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:05', 'Activo', 24, 0),
	(104, 'NEO SALUD', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:12', 'Activo', 24, 0),
	(105, 'SUIZO', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:15', 'Activo', 24, 0),
	(106, 'METRO KD', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:21', 'Activo', 24, 0),
	(107, 'PROV HOSPITALARIOS', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:30', 'Activo', 24, 0),
	(108, 'SOLS', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:35', 'Activo', 24, 0),
	(109, 'ZBC', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:41', 'Activo', 24, 0),
	(110, 'DIGMA', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:44', 'Activo', 24, 0),
	(111, 'GLOBAL MED', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:07:48', 'Activo', 24, 0),
	(112, 'CSF-COMPAÑIA DE SERVICIOS FARMACEUTICOS', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:08:13', 'Activo', 24, 0),
	(113, 'OSECAC (SEGURMED)', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:08:31', 'Activo', 24, 0),
	(114, 'DOSPU', 'SOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sistemas', '2017-08-15 09:08:36', 'Activo', 24, 0),
	(115, 'Medical Pro', 'SOL', '', '', '', '', '', '', NULL, 'agonzalez', '2017-11-03 15:54:04', 'Activo', 24, 0),
	(116, 'LOGISTICA MEDICA', 'SOL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-11-22 15:37:26', 'Activo', 24, 0),
	(117, 'C&C Medicals', 'SOL', '', '', '', '', '', '', NULL, 'jkiprizlian', '2017-12-20 08:18:40', 'Activo', 24, 0),
	(118, 'Alexander Fleming', 'SOL', 'Zabala 2836, CABA', '', '', '', '', 'Zabala 2836, CABA', NULL, 'agonzalez', '2018-07-30 14:04:15', 'Activo', 24, 0),
	(119, 'COFARMA', 'SOL', '', '', '', '', '', 'SAN JOSÉ 1747, SANTA FE', NULL, 'agonzalez', '2018-08-15 13:17:59', 'Activo', 24, 0),
	(120, 'CEMIC', 'SOL', 'Av. Galván 4102 – CABA ', '', '', '', '', '', NULL, 'jkiprizlian', '2018-09-12 08:33:06', 'Activo', 24, 0),
	(121, 'PSCOFARM', 'SOL', '', '', '', '', '', '', NULL, 'agonzalez', '2018-09-14 10:50:40', 'Activo', 24, 0),
	(122, 'Sitio Salud', 'SOL', '', '', '', '', '', 'HIPOLITO YRIGOYEN 5263/67/69, lanus', NULL, 'agonzalez', '2018-09-20 13:15:46', 'Activo', 24, 0),
	(123, 'Lider SA', 'SOL', 'Av O Higgins 5591 B', '', '', '', '', 'Av O Higgins 5591 B', NULL, 'eala', '2018-10-26 13:41:09', 'Activo', 24, 0),
	(124, 'Drogueria Psicofarm SA', 'SOL', 'Condor 1851 ', '', '', '', '', 'Condor 1851 ', NULL, 'eala', '2018-11-02 10:06:55', 'Activo', 24, 0),
	(125, 'Femani Medical SRL', 'SOL', '', '', '', '', '', '', NULL, 'agonzalez', '2019-02-11 10:20:39', 'Activo', 24, 0),
	(126, 'Disval', 'SOL', '', '', '', '', '', '', NULL, 'agonzalez', '2019-03-21 08:37:42', 'Activo', 24, 0),
	(127, 'Drogueria y Distribuidora del Valle SC', 'SOL', '24 de Septiembre 725 - Santiago del Estero', '', 'Valeria Liz Argibay', '', '', '24 de Septiembre 725 - Santiago del Estero', NULL, 'eala', '2019-05-24 09:35:21', 'Activo', 24, 0),
	(128, 'Drogueria Del Pueblo', 'SOL', 'Jose Rosas 589 - Neuquen ', '', '', '', '', 'Jose Rosas 589 - Neuquen ', NULL, 'eala', '2019-06-26 09:58:06', 'Activo', 24, 0),
	(129, 'Farma S.R.L.', 'SOL', 'Av. Hipolito Yrigoyen 2972 - Trelew', '', 'Graciela Berta Montangie', '', 'Sergio Oscar Amoroso (Socio Gerente)', 'Av. Hipolito Yrigoyen 2972 - Trelew', NULL, 'eala', '2019-09-03 11:44:59', 'Activo', 24, 0),
	(130, 'prueba canal', 'SOL', '', '', '', '', '', NULL, NULL, 'pmiranda', '2020-04-20 13:19:06', NULL, 24, 0),
	(131, 'prueba canal 2', 'SOL', 'direccion de canal', 'mail@mail.com', '', '', '', NULL, NULL, 'pmiranda', '2020-04-20 13:19:14', 'Inactivo', 25, 0);
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
