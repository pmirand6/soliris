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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.apm: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `apm` DISABLE KEYS */;
INSERT INTO `apm` (`id`, `codigo_apm_np`, `estado_id`, `usuario_audit`, `fecha_audit`, `username`, `email`, `nombre_completo`) VALUES
	(1, 10047, 17, NULL, '2020-03-16 13:14:20', 'jvidela', NULL, 'VIDELA JUAN IGNACIO'),
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
  `estado` varchar(45) NOT NULL DEFAULT '',
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.auxiliar: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auxiliar` DISABLE KEYS */;
INSERT INTO `auxiliar` (`id`, `valor`, `tipo`, `familia`, `estado`, `usuario_audit`, `fecha_audit`) VALUES
	(1, '', NULL, '', '', NULL, '2020-03-05 13:42:52'),
	(2, 'bar', NULL, '', '', NULL, '2020-03-05 14:05:31');
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

-- Volcando estructura para tabla soliris.canal
CREATE TABLE IF NOT EXISTS `canal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canal_nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
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
  `canal_np_id` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.canal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` (`id`, `canal_nombre`, `familia`, `direccion`, `mail`, `dir_tec`, `cont_venta`, `cont_otro`, `puntos_entrega`, `documentacion`, `usuario_audit`, `fecha_audit`, `estado`, `canal_np_id`) VALUES
	(59, 'Canal Test', 'SOL', '', '', '', '', '', '', NULL, 'pmiranda', '2019-12-10 16:19:29', 'Activo', NULL);
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenan las referencias a los documentos del sistema';

-- Volcando datos para la tabla soliris.documentos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` (`id`, `valor`, `documentos_tipo_id`, `fecha_creacion`, `fecha_documento`, `estado_id`, `usuario_id`, `familia`) VALUES
	(1, 'Vacunacion_1_2020-03-20_test.jpg', 1, '2020-03-20 12:15:13', '2020-03-04', 15, 50, 'SOL'),
	(2, 'Otro_2_2020-03-20_WIN_20170825_12_07_10_Pro.jpg', 2, '2020-03-20 12:21:05', '2020-03-17', 15, 50, 'SOL'),
	(3, 'Vacunacion_2_2020-03-20_WIN_20170825_12_07_41_Pro.jpg', 1, '2020-03-20 12:21:05', '2020-03-11', 15, 50, 'SOL'),
	(4, 'Vacunacion_3_2020-03-25_test.jpg', 1, '2020-03-25 10:11:19', '2020-03-10', 15, 50, 'SOL');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.documentos_tipo
CREATE TABLE IF NOT EXISTS `documentos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='referencia de tipos de documentos del sistema';

-- Volcando datos para la tabla soliris.documentos_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos_tipo` DISABLE KEYS */;
INSERT INTO `documentos_tipo` (`id`, `tipo`, `referencia`) VALUES
	(1, 'Vacunacion', 'Paciente'),
	(2, 'Otro', 'Paciente');
/*!40000 ALTER TABLE `documentos_tipo` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.doc_error
CREATE TABLE IF NOT EXISTS `doc_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operacion` varchar(45) NOT NULL DEFAULT '',
  `id_operacion` int(10) unsigned NOT NULL DEFAULT '0',
  `id_documento` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre_doc` varchar(255) NOT NULL DEFAULT '',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `fe_actualizacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.doc_error: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `doc_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_error` ENABLE KEYS */;

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
  `altura` int(10) unsigned DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `notas` longtext,
  `tipo` varchar(10) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `familia` varchar(3) DEFAULT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `codigo_np` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1271 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.institucion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` (`id`, `nombre`, `direccion`, `altura`, `localidad`, `provincia`, `contacto`, `mail`, `telefono`, `notas`, `tipo`, `estado_id`, `familia`, `usuario_audit`, `fecha_audit`, `codigo_np`) VALUES
	(1270, 'Institucion Test', '', 0, '', '', '', '', '', '', '', NULL, 'SOL', 'pmiranda', '2019-12-10 16:19:17', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.maestro_estado: ~20 rows (aproximadamente)
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
	(21, 'Activo', 'estado', 'presentacion'),
	(22, 'Venta Registrada', 'estado', 'venta'),
	(23, 'NP Generada', 'estado', 'venta');
/*!40000 ALTER TABLE `maestro_estado` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_ventas
CREATE TABLE IF NOT EXISTS `maestro_ventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paciente_id` int(10) unsigned DEFAULT NULL,
  `edad` varchar(10) DEFAULT NULL,
  `medico_id` int(11) unsigned NOT NULL,
  `presentacion_id` int(11) unsigned NOT NULL,
  `unidades` int(10) unsigned NOT NULL,
  `fecha_venta` date NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `FK_venta_paciente` (`paciente_id`),
  KEY `FK_venta_medico` (`medico_id`),
  KEY `FK_venta_presentacion` (`presentacion_id`),
  KEY `FK_venta_patologia` (`patologia_id`),
  KEY `FK_venta_institucion` (`institucion_id`),
  KEY `FK_venta_sub_patologia` (`sub_patologia_id`),
  KEY `FK_venta_canal` (`canal_id`),
  KEY `FK_venta_estado` (`estado_id`),
  KEY `FK_venta_usuario` (`usuario_id`),
  CONSTRAINT `FK_venta_canal` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`),
  CONSTRAINT `FK_venta_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_venta_institucion` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `FK_venta_medico` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `FK_venta_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `FK_venta_patologia` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`),
  CONSTRAINT `FK_venta_presentacion` FOREIGN KEY (`presentacion_id`) REFERENCES `presentacion` (`id`),
  CONSTRAINT `FK_venta_sub_patologia` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`),
  CONSTRAINT `FK_venta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maestro de las ventas efectuadas al paciente';

-- Volcando datos para la tabla soliris.maestro_ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestro_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.maestro_ventas_transaccion
CREATE TABLE IF NOT EXISTS `maestro_ventas_transaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) NOT NULL,
  `usuario_id` int(11) unsigned NOT NULL,
  `maestro_id` int(11) unsigned NOT NULL,
  `fecha_stamp` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_estado_venta` (`estado_id`),
  KEY `FK_usuario_venta` (`usuario_id`),
  KEY `FK_venta_id` (`maestro_id`),
  CONSTRAINT `FK_estado_venta` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_usuario_venta` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_venta_id` FOREIGN KEY (`maestro_id`) REFERENCES `maestro_ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que muestra el historial de estados de las transacciones realizadas sobre una venta';

-- Volcando datos para la tabla soliris.maestro_ventas_transaccion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_ventas_transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestro_ventas_transaccion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `matricula_tipo` varchar(45) DEFAULT NULL,
  `matricula_numero` varchar(45) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `apm_id` int(10) unsigned DEFAULT NULL,
  `c_atencion` varchar(255) DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `u_mod` varchar(45) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nacimiento` varchar(20) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `fecha_cap` date DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `estado` varchar(15) NOT NULL,
  `aprobado` varchar(45) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `fecha_aprobado` date NOT NULL,
  `id_meditec` int(10) unsigned DEFAULT NULL,
  `fecha_inac` datetime DEFAULT NULL,
  `familia` varchar(4) NOT NULL DEFAULT 'SOL' COMMENT 'familia de medicamento',
  PRIMARY KEY (`id`),
  KEY `FK_estado_medico` (`estado_id`),
  CONSTRAINT `FK_estado_medico` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 351232 kB';

-- Volcando datos para la tabla soliris.medico: ~1.041 rows (aproximadamente)
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` (`id`, `apellido`, `nombre`, `matricula_tipo`, `matricula_numero`, `fecha_alta`, `apm_id`, `c_atencion`, `lugar`, `u_mod`, `mail`, `telefono`, `fax`, `nacimiento`, `domicilio`, `fecha_cap`, `localidad`, `especialidad`, `estado`, `aprobado`, `estado_id`, `fecha_aprobado`, `id_meditec`, `fecha_inac`, `familia`) VALUES
	(1, 'ROSENDE', ' SILVINA', 'Provincial', '115407', '2017-01-11 12:48:31', 1, 'HOSPITAL MUNICIPAL CNEL OLAVARRIA', 'CONSULTORIO', 'MARRUZAZABALA', 'silvirosende23@yahoo.com.ar', '0221-156155244', '02214251717', '26 Mayo', '1 y 69 subsuelo ', '2019-09-03', 'Olavarria', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-09-03', NULL, '2018-10-23 12:24:32', ''),
	(2, 'ROMERO', ' NATALIA', 'Provincial', '124466', '2012-11-23 11:53:31', 9, 'MENDOZA', 'HOSPITAL', 'MNAKATSUNO', 'nataliasoledadromero@gmail.com', '261-4241029 o 261-15-5984871', '', '', 'Patricias Mendocinas 248', '2012-10-10', 'Godoy Cruz, Mendoza', 'Hemtaloga', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(3, 'RAÑA', ' PABLO ANDRES', 'Provincial', '2033', '2012-11-23 11:50:30', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'pablor@neunet.com.ar', '0299-4424729', '02994433998', '', 'Ministro gonzalez 426', '2008-03-26', 'Neuquen', 'Hematológa/o', 'Activo', 'jkiprizlian', 19, '2018-04-11', 369, '0000-00-00 00:00:00', ''),
	(4, 'PIZZINO', ' ROSANA', 'Nacional', '77888', '2016-05-18 10:34:13', 3, 'RIO GRANDE  HOSPITAL REGIONAL (RIO GRANDE)', 'HOSPITAL', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', 'RIO GRANDE', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(5, 'PISANI', ' ALEJANDRA', 'Provincial', '3898', '2012-11-23 11:47:51', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'alepisanisma@gmail.com', '02944-15312772', '2972410500', '', 'Los alamos 249', '2018-02-27', 'Neuquen', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-02-27', NULL, '0000-00-00 00:00:00', ''),
	(6, 'PEROZZI', ' AURA', 'Provincial', '93060', '2017-01-11 12:44:52', 1, 'HOSP AGUDOS MAR DEL PLATA', 'HOSPITAL', 'MARRUZAZABALA', 'perozziaura@yahoo.com.ar', '0223-5641539', '', '', 'neuquen 4080', '0000-00-00', 'MAR DEL PLATA ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(7, 'PASSANISI', ' MANUEL', 'Provincial', '768', '2012-11-23 11:44:57', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'passanisim@speedy.com.ar', '5411-2994487752', '5411-2994487752', '9 Enero', 'Alberdi 269', '2008-04-10', 'Neuquen', 'Medico', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(8, 'PASQUALI', ' JULIETA', 'Provincial', '4114', '2015-11-20 08:23:31', 1, 'BARILOCHE CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'pasqualij@hotmail.com', '0294-15-420-3949', '', '', 'segunda cortada 11481, bariloche', '2015-11-19', 'BARILOCHE', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(9, 'PAOLETTI', ' MARIANO', 'Provincial', '93918', '2017-01-16 16:00:27', 1, 'MAR DEL PLATA HOSP AGUDOS', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MAR DEL PLATA ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(10, 'PAOLETTI', ' EDUARDO', 'Provincial', '42509', '2012-11-23 11:44:19', 1, 'MAR DEL PLATA CLINICA 25 DE MAYO', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '10 Julio', '25 de Mayo3558', '0000-00-00', 'Mar del Plata', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(11, 'PAGANI', ' FERNANDO PEDRO', 'Provincial', '91315', '2017-01-11 12:49:27', 1, 'CLINICA COLON MAR DEL PLATA', 'INSTITUCION', 'MARRUZAZABALA', 'hematologiapagani@speedy.com.ar', '0223-4913303', '', '', 'Colon 3635', '0000-00-00', 'Mar del Plata', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(12, 'NIEVAS', ' LUIS VICENTE', 'Provincial', '1167', '2013-01-15 11:30:21', 1, 'VIEDMA CLINICA VIEDMA', 'INSTITUCION', 'AGONZALEZ', 'nievas2007@yahoo.com.ar', '02920 15646285', '', '', 'sarmiento 253', '2011-09-19', 'VIEDMA', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(13, 'NIBORSKI', ' RICARDO CARLOS', 'Provincial', '3188', '2012-11-23 11:41:24', 1, 'BARILOCHE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'ricardocnibo@yahoo.com.ar', '(02944)15587297', '(02944)529878', '', '', '2009-05-04', 'BARILOCHE', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(14, 'NENKIES', ' MARCELO', 'Provincial', '443650', '2016-04-25 15:06:21', 1, 'TANDIL CONSULTORIO', 'CONSULTORIO', 'FCASTRO', 'nenkies@hotmail.com', '02293-15464657', '', '', 'Sarmiento 333', '0000-00-00', 'Tandil', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(15, 'NAKASCHIAN', ' PABLO', 'Provincial', '4382', '2012-11-23 11:40:09', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'nakashianpablo@yahoo.com.ar', '0299-154714111', '0299-4487752', '', '', '2010-10-23', 'Neuquen', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(16, 'MÜLLER', ' KATJA', 'Provincial', '81427', '2015-01-12 16:03:51', 1, 'TANDIL CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'katjatandil@hotmail.com', '02293-15692686', '', '', 'España 799, Tandil', '2011-08-31', 'Tandil', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(17, 'MURRAY', ' CECILIA', 'Provincial', '111438', '2012-11-23 11:39:25', 1, 'MAR DEL PLATA HOSPITAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MAR DEL PLATA ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(18, 'MUR', ' NORA', 'Provincial', '2342', '2012-11-23 11:39:03', 1, 'NEUQUEN HOSPITAL REGIONAL CASTRO RENDON', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'NEUQUEN ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(19, 'MORELLO', ' NANCY LETICIA', 'Provincial', '18596', '2012-11-23 11:36:38', 1, 'TREAS ARROYOS HOSPITAL DR IGNACIO PIROVANO', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TRES ARROYOS', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(20, 'MIERI', ' MATILDE', 'Provincial', '81443', '2017-01-11 12:47:46', 1, 'HOSPITAL MUNICIPAL CNEL OLAVARRIA', 'HOSPITAL', 'MARRUZAZABALA', 'matimieri@hotmail.com', '02284 15650243', '', '', 'Rivadavia 4057', '0000-00-00', 'Olavarria', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(21, 'MELILLO', ' LUCIANA', 'Nacional', '103095', '2014-07-11 16:23:51', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'GPARDO', '', '5039-5483', '', '', 'Av san martín 2082', '2014-07-11', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(22, 'MERIÑO ROJEL', ' FABIAN ERNESTO', 'Provincial', '3070', '2012-11-23 11:32:56', 1, 'RIO NEGRO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'RIO NEGRO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(23, 'MARTIN', ' NORA', 'Provincial', '918', '2017-01-11 12:46:27', 1, 'LA PAMPA HOSPITAL LUCIO MOLAS', 'HOSPITAL', 'MARRUZAZABALA', 'cldezoo@apemet.com.ar', '0295415516394', '', '14 Octubre', 'san martin 391, santa rosa', '0000-00-00', 'la pampa', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(24, 'MARTIN', ' NAZARENA', 'Provincial', '93755', '2017-01-11 12:49:10', 1, 'CLINICA COLON MAR DEL PLATA', 'HOSPITAL', 'MARRUZAZABALA', 'nazarenamartin@hotmail.com', '02234992620', '', '', 'Colon 3629', '2019-01-03', 'Mar del plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-01-03', NULL, '2018-10-23 12:24:32', ''),
	(25, 'MARQUESONI', ' EDUARDO', 'Nacional', '106613', '2013-01-15 11:28:45', 1, 'LA PAMPA HOSPITAL GOBERNADOR CENTENO', 'HOSPITAL', 'AGONZALEZ', '', '02302 156199471', '', '', '', '2011-09-28', 'LA PAMPA ', 'inmunohematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(26, 'MANDACHAIN', ' MARIANO', 'Provincial', '894', '2014-11-17 08:48:21', 1, 'LA PAMPA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'mandachain@hotmail.com', '(02302)15416243', '', '', '', '2014-11-11', 'LA PAMPA', 'Oncologia Clinica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(27, 'LARREGINA', ' ALEJANDRA', 'Provincial', '1450', '2012-11-23 11:24:50', 1, 'BAHIA BLANCA HOSPITAL MUNICIPAL LUCERO', 'HOSPITAL', 'MNAKATSUNO', 'hemato@hmabb.gov.ar', '0291-4598484 int. 2313', '', '', '', '2009-03-30', 'Bahia Blanca', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(28, 'LANZA', ' VICTORIA', 'Provincial', '92726', '2012-11-23 11:24:30', 1, 'MAR DEL PLATA HOSPITAL MATERNO INFANTIL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MAR DEL PLATA ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(29, 'KURCHAN', ' ALEJANDRA', 'Provincial', '1750', '2017-01-11 12:43:55', 1, 'NEUQUEN CONSULTORIO', 'HOSPITAL', 'MARRUZAZABALA', 'alejandrakurchan@gmail.com', '0299-5777027', '02994490812', '', 'Buenos aires 425', '2019-02-28', 'Neuquen', 'Hematológa/o', 'Activo', 'eala', 19, '2019-02-28', NULL, '2018-10-23 12:24:32', ''),
	(30, 'KOWALYSZYN', ' RUBEN DARIO', 'Provincial', '111369', '2012-11-23 11:23:23', 1, 'VIEDMA HOSPITAL', 'HOSPITAL', 'MNAKATSUNO', '', '2920424417/429833', '2920424417', '', 'Dorrego 508', '2018-12-10', 'Viedma ', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-12-12', NULL, '2018-10-23 12:24:32', ''),
	(31, 'HERNANDEZ', ' MONICA', 'Provincial', '1746', '2012-11-23 11:20:49', 1, 'BAHIA BLANCACONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'BAHIA BLANCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(32, 'GINESTET', ' PAUL', 'Provincial', '2033', '2012-11-23 11:14:38', 1, 'PIHUE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'PIHUE', '', 'Inactivo', '', 20, '0000-00-00', 0, '0000-00-00 00:00:00', ''),
	(33, 'GARBIERO', ' SUSANA', 'Provincial', '1383', '2017-01-11 12:53:04', 1, 'BAHIA BLANCA HOSP PENNA', 'CONSULTORIO', 'MARRUZAZABALA', 'sugar@infovia.com.ar  sugarjp@gmail.com', '54-291-4522646', '54-291-4522646', '31 Mayo', 'Catamarca 61 (Bahia Blanca)', '0000-00-00', 'Bahia Blanca', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(34, 'FURQUE', ' MARCELO.L', 'Provincial', '1442', '2012-11-23 11:10:33', 1, 'BARILOCHE HOSPITAL ZONAL DE ONCOLOGIA', 'HOSPITAL', 'MNAKATSUNO', 'furque@speedy.com.ar', '02944-15601043', '', '1 Mayo', '', '2008-03-26', '', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(35, 'FURQUE', ' MARCELO', 'Provincial', '1442', '2012-11-23 11:10:21', 1, 'BARILOCHE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'furque@speedy.com.ar', '02944-15601043', '', '', 'Lagos del Sur', '2008-03-26', 'Bariloche', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(36, 'FERRERAS', ' ROBERTO ANIBAL', 'Provincial', '92693', '2017-01-11 12:44:31', 1, 'HOSP AGUDOS MAR DEL PLATA', 'CONSULTORIO', 'MARRUZAZABALA', 'mtferreras@gmail.com', '2235259606', '', '', 'jb justo y 164', '0000-00-00', 'Mar del Plata', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(37, 'FERRANDO', ' PABLO RAMON', 'Provincial', '1294', '2012-11-23 11:04:16', 1, 'RIO NEGRO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '0294115500839', '', '', '', '2017-01-19', 'Rio negro ', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-01-18', NULL, '2018-10-23 12:24:32', ''),
	(38, 'FERNANDEZ LOVELL', ' JORGE', 'Provincial', '26205', '2012-11-23 11:03:57', 1, 'BAHIA BLANCAHOSPITAL REGIONAL ESPAÑOL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'BAHIA BLANCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(39, 'FERNANDEZ', ' VANESA VERA', 'Provincial', '1583', '2017-04-10 15:55:36', 8, 'HOSPITAL DR JOSE M PENNA', 'HOSPITAL', 'MNAKATSUNO', 'vaneveronica@hotmail.com', '02911561892894', '', '', '', '0000-00-00', '', 'Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(40, 'FELDMAN', ' LEONARDO JULIO', 'Provincial', '80753', '2012-11-23 11:03:18', 1, 'TANDIL CLINICA MODELO', 'CONSULTORIO', 'MNAKATSUNO', 'lfeldman@speedy.com.ar', '011-1553328590', '02293-445004', '20 Septiembre', '', '2009-03-19', 'Tandil', 'Onco-Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(41, 'ESPINA', ' BIBIANA', 'Provincial', '1048', '2017-01-11 12:46:52', 1, 'LA PAMPA HOSPITAL LUCIO MOLAS', 'CONSULTORIO', 'MARRUZAZABALA', 'hematologialomas@gmail.com', '02954-15478964/ 455000', '', '', '', '2017-01-12', 'La pampa', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-18', NULL, '0000-00-00 00:00:00', ''),
	(42, 'DOMINGUEZ', ' MARIA ESTER', 'Provincial', '49137', '2013-01-15 11:35:13', 1, 'TRES ARROYOS HOSPITAL DR IGNACIO PIROVANO', 'CONSULTORIO', 'AGONZALEZ', 'medominguez@eternet.com', '02983-15648193', '', '', 'brown 450', '2011-08-30', 'TRES ARROYOS', 'Oncologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(43, 'DIAZ', ' GRACIELA ESTER', 'Nacional', '91084', '2017-02-06 10:03:11', 1, 'NEUQUEN HOSPITAL REGIONAL CASTRO RENDON', 'HOSPITAL', 'AGONZALEZ', 'gdiaz@hospitalneuquen.org.ar', '0299154151785', '', '', 'bs as 450', '2016-12-12', 'NEUQUEN', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(44, 'DI PAOLO', ' DANIEL', 'Provincial', '1285', '2011-10-17 08:28:20', 1, 'HOSPITAL DR JOSE M PENNA', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(45, 'DI CHIARA', ' RUBEN', 'Provincial', '16167', '2017-01-11 12:48:14', 1, 'HOSPITAL MUNICIPAL CNEL OLAVARRIA', 'HOSPITAL', 'MARRUZAZABALA', 'ruben.di1247@speedy.com.ar', '', '', '28 Octubre', 'Lamadrid 3368', '0000-00-00', 'OLAVARRIA', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(46, 'CROSTA', ' CLAUDIA GABRIELA', 'Provincial', '92482', '2014-10-21 10:39:44', 1, 'MAR DEL PLATA HOSPITAL PRIVADO DE COMUNIDAD', 'HOSPITAL', 'AGONZALEZ', 'garciacrosta@coperfer.com.ar', '0223-154216071/02234990000', '', '30 Enero', '', '2014-09-29', 'Mar del Plata', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(47, 'CONTIN', ' MARIA CECILIA', 'Provincial', '94097', '2013-05-14 14:29:41', 1, 'NECOCHEA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'mariaceciliacontin@hotmail.com', '(02262) 15635228', '', '', 'Calle 91_1034', '2010-08-06', 'NECOCHEA', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(48, 'COCCO', ' GLORIA.ESTELA', 'Provincial', '91038', '2012-11-23 10:54:53', 1, 'MAR DEL PLATA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gloriacocco@hotmail.com', '', '', '', 'España 2020', '2018-06-27', 'Mar del plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-07-02', NULL, '0000-00-00 00:00:00', ''),
	(49, 'CEDOLA', ' ALEJANDRA', 'Provincial', '1387', '2012-11-23 10:51:12', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'cedola @speddy.com.ar', '0299-155801058', '', '', 'Moreno 719', '0000-00-00', 'NEUQUEN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(50, 'CAFERRI', ' HORACIO', 'Provincial', '1497', '2012-11-23 10:34:49', 1, 'BAHIA BLANCA HOSPITAL DR JOSE M PENNA', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'BAHIA BLANCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(51, 'CABANNE', ' VANINA', 'Provincial', '3748', '2013-12-06 11:52:22', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'vaninacabanne@hotmail.com', '0299-155809409', '0299-442-4729', '', 'Ministro Gonzalez 426', '2013-12-02', 'NEUQUEN', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(52, 'CABALLERO', ' EMILSE', 'Provincial', '93830', '2012-11-23 10:34:06', 1, 'MAR DEL PLATA HOSPITAL MATERNO INFANTIL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MAR DEL PLATA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(53, 'BRANDT', ' MARTIN IGNACIO', 'Provincial', '1607', '2017-01-11 12:52:09', 1, 'BAHIA BLANCA HOSP PENNA', 'HOSPITAL', 'MARRUZAZABALA', 'mibrandt@hotmail.com', '0291-4555600', '02914517864', '', '', '2017-01-03', 'Bahia blanca', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-18', NULL, '0000-00-00 00:00:00', ''),
	(54, 'BOLO', ' HORACIO', 'Provincial', '91184', '2012-11-23 10:31:19', 1, 'AZUL HOSPITAL MUNICIPAL ANGEL PINTOS', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'AZUL', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(55, 'BATTISTELLI', ' SUSANA', 'Provincial', '17662', '2012-11-23 10:25:58', 1, 'TANDIL HOSPITAL RAMON SANTAMARINA', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TANDIL', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(56, 'BARTOMIOLI', ' MIGUEL ANGEL', 'Provincial', '46764', '2012-11-23 10:25:17', 1, 'BAHIA BLANCACONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'miguelbartomioli@yahoo.com.ar', '(0291)155704218', '(0291) 4550270', '', '', '2009-03-18', 'Bahia Blanca', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(57, 'BARRAL', ' PABLO AUGUSTO', 'Provincial', '91779', '2013-06-28 15:33:29', 1, 'MAR DEL PLATA CLINICA PUEYRREDON', 'INSTITUCION', 'AGONZALEZ', 'pabarral@clinicapueyrredon.com.ar', '0223-4992400', '0223-491-8927', '', 'jujuy 2176', '2013-06-10', 'MAR DEL PLATA', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(58, 'ALZUETA', ' ABEL ESTEBAN', 'Provincial', '762', '2012-11-23 10:16:06', 1, 'LA PAMPA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'aealzueta@ar.inter.net', '02954-15550449', '02954454555', '', 'Santa rosa 330', '2017-01-13', 'La pampa', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-09-07', NULL, '0000-00-00 00:00:00', ''),
	(59, 'ALMAR', ' MARIANA', 'Provincial', '18413', '2013-08-08 10:42:13', 1, 'NECOCHEA HOSPITAL', 'HOSPITAL', 'AGONZALEZ', 'mhalmar@infovia.com.ar', '02262-428663', '', '', 'Calle 57 n°2320', '2013-07-11', 'Necochea', 'Hematológa/o', 'Inactivo', '', 20, '2017-08-24', NULL, '0000-00-00 00:00:00', ''),
	(60, 'ALETTI', ' GUSTAVO ALBERTO', 'Provincial', '443587', '2012-11-23 10:13:41', 1, 'OLAVARRIA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'galetti@fibertel.com.ar', '02284-425684', '', '', 'Rivadavia 2635', '2017-01-20', 'Olavarria; buenos aires', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-01-18', NULL, '2018-10-23 12:24:32', ''),
	(61, 'ALBINA', ' ROBERTO', 'Provincial', '14652', '2012-11-23 10:13:21', 1, 'MAR DEL PLATA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'hemomdp@hotmail.com', '0223 493-9202//CEL.15 5291594', '', '', 'Buenos aires 2854', '2008-12-02', 'Mar del plata', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(62, 'AGGIO', ' MARIO CARLOS', 'Provincial', '447', '2015-01-12 15:24:05', 1, 'BAHIA BLANCACONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'ilavalle@bblanca.com.ar', '0291-4555600', '', '', 'Lavalle 259', '2008-11-24', 'Bahia blanca, buenos aires', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-08-23', NULL, '0000-00-00 00:00:00', ''),
	(63, 'TEZANOS PINTO', ' MIGUEL', 'Provincial', '17536', '2015-08-25 13:49:55', 10, 'ANM', '', 'MNAKATSUNO', 'mtezanos@hematologia.anm.edu.ar', '4805-6890', '4806-6638', '13 Diciembre', 'Pacheco de Melo3081', '0000-00-00', 'Buenos Aires', 'Director Cientifico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(64, 'SORRENTINO', ' MIGUEL ANGEL', 'Nacional', '54802', '2017-01-24 10:24:27', 4, 'Sagrado Corazón', 'HOSPITAL', 'MARRUZAZABALA', 'sorrentinoma54@yahoo.com.ar', '1564476312', '', '1 junio', '', '0000-00-00', 'CABA', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(65, 'SCALBI', ' SILVIA', 'Provincial', '62957', '2011-11-03 15:23:36', 5, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', 'capsis@steel.com.ar', '0241-156354005', '03461-426057', '', 'Belgrano 477', '2009-01-15', 'San Nicolas', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(66, 'SIROLLI', ' DANIEL', 'Nacional', '87418', '2017-04-10 16:14:19', 4, 'Sanatorio GUEMES', 'SANATORIO', 'MNAKATSUNO', '', '1549745360', '', '', '', '0000-00-00', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(67, 'SORIA', ' MARIEL', 'Nacional', '91159', '2012-09-14 11:56:29', 4, 'HOSPITAL MILITAR CENTRAL', 'CONSULTORIO', 'AGONZALEZ', 'mariellesoria@yahoo.com.ar', '1164283382', '', '4 Junio', 'Av saenz 1165 4d', '2017-09-11', 'Buenos aires ', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-05-02', NULL, '0000-00-00 00:00:00', ''),
	(68, 'SANTOS', ' MARIA JULIA', 'Nacional', '30038', '2011-11-03 11:29:30', 5, '', '', 'YAREVALO', 'rmachado@sinectis.com.ar', '4876-5736/37 int 291/311', '', '27 Julio', 'L.M.Campos 726', '2011-07-24', 'Capital Federal', 'Jefa del Servicio Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(69, 'SANTARELLI', ' ADELA ROSA', 'Nacional', '46750', '2015-08-25 13:48:25', 10, 'HOSPITAL DR IGNACIO PIROVANO', 'HOSPITAL', 'MNAKATSUNO', 'rositasantarelli@ciudad.com.ar', '1530133790', '', '7 Marzo', 'Combatientes de Malvinas 3411', '0000-00-00', 'Capital Federal', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(70, 'SAIDON', ' GUILLERMO', 'Provincial', '29295', '2017-04-10 16:11:47', 3, 'CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'guillermoserdon@yahoo.com.ar', '1544475199', '45545576', '28 Noviembre', 'El Cano 3557', '0000-00-00', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(71, 'ROMERO', ' LUCILA', 'Nacional', '119638', '2015-08-25 13:47:05', 10, 'ANM', 'INSTITUCION', 'MNAKATSUNO', 'mlucilar@yahoo.com.ar', '4805-5759', '4805-0712', '17 Febrero', 'Pacheco de Melo3081', '0000-00-00', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(72, 'ROSENHAIN', ' MARIANA', 'Nacional', '100335', '2017-04-10 16:11:12', 8, 'HOSPITAL DR ENRIQUE TORNU', 'HOSPITAL', 'MNAKATSUNO', 'mrosenhain@yahoo.com', '4521-1236 int 116', '45211236', '3 Octubre', 'Combatientes de malvinas 302', '2020-02-10', 'Capital federal', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2020-02-10', NULL, '2018-10-24 08:42:42', ''),
	(73, 'RODRIGUEZ PELLIZA', ' EDUARDO', 'Nacional', '45537', '2012-01-26 11:22:06', 4, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', 'bzemrrp@ciudad.com.ar', '1532347389', '', '8/01', 'Maipu 1389', '0000-00-00', '', 'Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(74, 'RODRIGUEZ', ' ANDREA', 'Nacional', '77536', '2016-04-29 15:56:44', 10, 'ANM', 'INSTITUCION', 'MNAKATSUNO', 'rodriguezdilucente@yahoo.com.ar', '4805-5759 int 230 o 260', '', '', 'Pacheco de Melo3081', '0000-00-00', 'Buenos Aires', 'Subjefa Oncologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(75, 'ROCCA', ' PAULA SABRINA', 'Nacional', '114087', '2017-04-10 16:10:42', 10, 'Churruca', 'HOSPITAL', 'MNAKATSUNO', 'paulasrocca@hotmail.com', '1165268704', '', '1 Junio', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(76, 'RIVAS', ' MARIA MARTA', 'Nacional', '97396', '2017-04-10 16:10:07', 8, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'mrivas@cas.austral.edu.ar', '02322 482857', '02322 482214', '12 Abril', '', '0000-00-00', 'Pilar', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(77, 'ROBBIO', ' ENRIQUE', 'Nacional', '45249', '2012-01-26 11:21:12', 4, 'HOSPITAL RIVADAVIA', 'HOSPITAL', 'MSADOUET', 'enriquerobbio@hotmail.com', '1540668888', '', '3 Abril', 'Av. Las Heras', '0000-00-00', '', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(78, 'REAL', ' JUAN JOSE', 'Nacional', '93806', '2017-04-10 16:43:17', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'jjreal@intramed.net.ar', '1540660500', '', '18 Julio', 'Av. Pueyrredon 1640', '0000-00-00', 'Capital Federal', 'Unidad de tranplante de MAEDICINA OSEA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(79, 'POSE CABARCOS', ' JULIO', 'Nacional', '89769', '2012-05-24 10:41:45', 4, 'TORRE MEDICUS', 'CONSULTORIO', 'MSADOUET', 'julioposie@hotmail.com', '1544738298', '02322482214', '23 Julio', 'Pte peron 1501', '2008-07-21', '', 'Hematológa/o', 'Activo', 'mnakatsuno', 19, '2018-02-16', NULL, '0000-00-00 00:00:00', ''),
	(80, 'PAVLOVE', ' MAXIMILIANO', 'Nacional', '108072', '2017-04-10 16:06:59', 10, 'Hosp. Militar', 'HOSPITAL', 'MNAKATSUNO', 'maxipavlove@yahoo.com.ar', '1567190001', '', '11 Septiembre', 'Luis Maria Ocampo', '0000-00-00', '', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(81, 'PINTOS', ' NOEMI', 'Nacional', '101162', '2012-01-26 15:38:35', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', 'noemipintos@yahoo.com.ar', '1535706839', '4831-0409', '', '', '2009-08-25', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(82, 'MUSSO', ' ARTURO', 'Nacional', '23623', '2017-04-11 16:11:22', 5, 'HOSPITAL MILITAR CENTRAL', 'HOSPITAL', 'GPARDO', 'arturomusso@yahoo.com.ar', '4833-2564', '', '8 Septiembre', 'Santa Fe 3942 4B', '0000-00-00', 'Capital Federal', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(83, 'MORAN', ' LORENA', 'Nacional', '99426', '2011-11-07 10:26:18', 5, 'HOSPITAL NIÑOS RICARDO GUTIERREZ', 'HOSPITAL', 'YAREVALO', 'lorenaemoran@hotmail.com', '1554993943', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(84, 'MUGGERI', ' ALEJANDRO', 'Nacional', '78888', '2017-04-10 16:05:14', 10, 'FLENI', 'CONSULTORIO', 'MNAKATSUNO', 'amuggeri@fleni.org.ar', '1554685717', '57773200', '9 Agosto', 'Montañeses 2325', '2008-03-26', 'Capital federal', 'Hematológa/o', 'Activo', 'gpardo', 19, '2018-01-05', NULL, '0000-00-00 00:00:00', ''),
	(85, 'MILOVIC', ' VERA', 'Nacional', '58352', '2017-04-10 16:43:38', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'vmiiovic@hospitalaleman.com', '4827-7000 int 2445', '', '5Agosto', 'Av Puyrredon 1640', '0000-00-00', '', 'Jefa de Transplante de Medula', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(86, 'MACCIONE', ' ENRIQUE', 'Nacional', '28714', '2017-04-11 16:10:59', 5, 'Clinica Bazterrica', 'CONSULTORIO', 'GPARDO', 'emaccione@intramed.net', '48071027', '48071027', 'fallecido', 'Pacheco de Melo 1929', '0000-00-00', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(87, 'MI?O', 'MIÑO ALEJANDRA', 'Nacional', '95507', '2017-01-23 10:45:02', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'CONSULTORIO', 'MARRUZAZABALA', 'aleminio@yahoo.com.ar', '1558088365', '0541148310409', '22 Mayo', 'Santa Fe 3711 3º A', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(88, 'MAHUAD', ' CAROLINA', 'Nacional', '117083', '2017-04-10 16:43:04', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'carolinamahuad@lycos.com', '4827-7000 int 2929', '', '2 Julio', 'Puyrredon 1640', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(89, 'LARGHI', ' ADRIANA', 'Nacional', '67998', '2017-04-10 16:01:59', 2, 'Hosp. San Pedro', 'HOSPITAL', 'MNAKATSUNO', 'adrianalargui@hotmail.com', '03329-482211', '', '2 Enero', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(90, 'IANTRIA', ' SELENE', 'Nacional', '82973', '2017-04-10 08:15:31', 4, 'HOSPITAL RIVADAVIA', 'HOSPITAL', 'AGONZALEZ', 'sele-zoe@hotmail.com', '1545697476', '', '29 Marzo', 'Av. Las Heras', '2017-04-10', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(91, 'JAIT', ' CECILIO', 'Provincial', '32388', '2017-04-10 16:00:07', 4, 'Clinica Roche Escobar', 'CONSULTORIO', 'MNAKATSUNO', '', '3488-420614', '', '', 'Sarmiento 439', '0000-00-00', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(92, 'KUSMINSKY', ' GUSTAVO', 'Nacional', '65911', '2017-04-10 16:01:22', 8, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'gkusminsky@cas.austral.edu.ar', '0054-2322482000', '0054-2322482214', '', 'Loyola 90', '0000-00-00', 'Capital Federal', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(93, 'HENDLER', ' HECTOR', 'Nacional', '31692', '2017-04-10 15:59:49', 10, 'SANATORIO MITRE', 'SANATORIO', 'MNAKATSUNO', 'hectorhendler@fibertel.com.ar', '4822-9485', '', '5 Octubre', 'Sanchez de Bustamante 1818', '0000-00-00', '', 'Hematologo ', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(94, 'HANSSON', ' SILVIA BIBIANA', 'Nacional', '71170', '2017-04-10 15:59:34', 3, 'HOSP. HOUSSAY', 'HOSPITAL', 'MNAKATSUNO', 'bibianahansson@yahoo.com.ar', '1559527333', '47976796', '', 'Irigoyen 1761', '0000-00-00', 'Buenos Aires ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(95, 'GUTIERREZ', ' MARCELA EMA', 'Nacional', '54720', '2011-11-07 15:58:21', 5, 'HOSPITAL NIÑOS RICARDO GUTIERREZ', 'HOSPITAL', 'YAREVALO', 'megutierrez@gmail.com', '1551589322', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(96, 'GUERRERO', ' GABRIELA', 'Nacional', '118922', '2012-01-26 11:08:15', 4, 'INSTITUCION ACADEMIA NAC DE MEDICINA', 'INSTITUCION', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(97, 'GONZALEZ', ' MIGUEL', 'Nacional', '102272', '2015-08-24 15:12:22', 10, 'ANM', '', 'MNAKATSUNO', 'carlosmiguelgonzalez@yahoo.com.ar', '155247-6553', '', '', 'Freire 2204', '0000-00-00', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(98, 'GONZALEZ', ' GRACIELA', 'Nacional', '71298', '2017-01-17 16:25:13', 10, 'HOSPITAL DR IGNACIO PIROVANO', 'CONSULTORIO', 'FCASTRO', 'gra.gonz@hotmail.com', '4542-7623', '', '', 'Monroe 3550', '2017-01-17', 'Buenos aires ', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-03-28', NULL, '0000-00-00 00:00:00', ''),
	(99, 'GARATE', ' GONZALO MARTIN', 'Nacional', '90063', '2017-04-10 16:42:26', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'mparate@hospitalaleman.com', '4827-7000', '', '222 Septiembre', 'Av. Pueyrredon 1640', '0000-00-00', 'Capital Federal', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(100, 'GARATE', ' GONZALO ALBERTO', 'Nacional', '29449', '2017-04-10 16:42:20', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'shematologia@hospitalaleman.com', '4813-4087', '4813-4087', '', 'Av. Pueyrredon 1640', '0000-00-00', 'Capital Federal', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(101, 'FLORES', ' ALEJANDRO', 'Nacional', '70560', '2012-07-17 10:22:16', 4, 'ERITROFERON', 'CONSULTORIO', 'MNAKATSUNO', 'llanza@intramed.net.ar', '4127-5500', '', '2 Abril', '', '2009-07-10', 'Capital Federal', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(102, 'FISHER', 'FISCHER MA. LAURA', 'Nacional', '86924', '2017-04-10 15:56:25', 4, 'HOSPITAL FERNANDEZ', 'HOSPITAL', 'MNAKATSUNO', 'malalafischer@yahoo.com', '1550632575', '', '11 Abril', 'Potosií 4416', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(103, 'FERNANDEZ ESCOBAR', ' NICOLAS', 'Nacional', '119530', '2017-04-10 15:54:52', 10, 'HOSPITAL NIÑOS RICARDO GUTIERREZ', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(104, 'FERNANDEZ BURDAIN', ' JOSE', 'Provincial', '19385', '2012-11-23 11:03:36', 4, 'PERGAMINO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'burdainhemato@yahoo.com.ar', '02477429792', '', '4 Agosto', 'Rivadavia 688', '0000-00-00', 'Pergamino', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(105, 'FERNANDEZ', ' VANESA', 'Nacional', '116350', '2017-01-23 10:43:51', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'CONSULTORIO', 'MARRUZAZABALA', 'vanefernandez@velostar.com.ar', '011-61892894', '', '10 Junio', '', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(106, 'FERNANDEZ', ' RODOLFO GABRIEL', 'Nacional', '62644', '2017-01-03 16:42:38', 10, 'HOSPITAL DR IGNACIO PIROVANO', 'CONSULTORIO', 'AGONZALEZ', 'fernandezgabriel@gmail.com', '4542-7623', '', '22 Agosto', 'Monroe 3550', '0000-00-00', 'Buenos Aires', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(107, 'ENGELBERGER', ' MA. INES', 'Nacional', '84621', '2017-04-10 15:54:30', 4, 'HOSPITAL FERNANDEZ', 'HOSPITAL', 'MNAKATSUNO', 'miengalberger@fibertel.com.ar', '1556063655', '', '3 Agosto', 'Cerviño 3356', '0000-00-00', '', 'Hematologo ', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(108, 'DRELICHMAN', ' GUILLERMO', 'Nacional', '56803', '2011-11-08 11:54:21', 5, 'HOSPITAL NIÑOS RICARDO GUTIERREZ', 'HOSPITAL', 'YAREVALO', 'drgdrelichman@yahoo.com.ar', '1541735613', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(109, 'DINARDO', ' PABLO', 'Nacional', '111991', '2017-01-19 10:15:57', 3, 'FINOCHIETTO (PTE PERON)', 'CONSULTORIO', 'MARRUZAZABALA', 'gpdinardo@hotmail.com', '1544191526', '', '10 Agosto', 'Medrano 574 1ºe', '2019-02-11', 'Capital federal', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-02-11', NULL, '2018-10-23 12:24:32', ''),
	(110, 'DIMASE', ' FEDERICO', 'Nacional', '95334', '2017-04-10 15:53:34', 10, 'HOSPITAL MILITAR CENTRAL', 'HOSPITAL', 'MNAKATSUNO', 'transfusiones-hmc@yahoo.com.ar', '1544486725', '', '29 Agosto', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(111, 'DIEZ', ' BLANCA DELIA', 'Nacional', '41868', '2011-11-09 10:01:52', 5, 'INSTITUCION FLENI', 'INSTITUCION', 'YAREVALO', 'bdiez@fleni.org.ar', '57773200 radio459911 cod 0677', '', '30 Marzo', 'Montañeses 2325', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(112, 'DIAZ', ' LILIANA', 'Nacional', '107283', '2017-04-10 15:53:07', 3, 'LA PLATA', 'CONSULTORIO', 'MNAKATSUNO', 'lilianadiez30@yahoo.com.ar', '01165262191', '', '19 Marzo', 'Calle 44 nro 1072 1a', '2018-06-29', 'La plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-07-03', NULL, '0000-00-00 00:00:00', ''),
	(114, 'CRAVERO', ' PATRICIA', 'Nacional', '105308', '2017-01-24 10:25:43', 4, 'Argerich', 'INSTITUCION', 'MARRUZAZABALA', 'craveropato@yahoo.com.ar', '47877500', '', '', 'Sucre 1525', '0000-00-00', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(115, 'CORTES GUERRIERI', ' VERONICA', 'Nacional', '87777', '2017-04-10 15:50:10', 8, 'Instituto Lanari', 'CONSULTORIO', 'MNAKATSUNO', 'vcortes@arnet.com.ar', '4787-7500', '4787-7500', '', 'Capital Federal', '0000-00-00', 'Buenos Aires', 'MD', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(116, 'COPES', ' GABRIELA', 'Provincial', '15427', '2012-05-04 11:14:25', 5, 'HOSP. CAMPANA', 'HOSPITAL', 'MSADOUET', 'mgcopes@hotmail.com', '03489-15485962', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(117, 'COLIMODIO', ' PAULO', 'Nacional', '110632', '2017-04-10 15:49:13', 8, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'colimodio5@gmail.com', '02324-15582135', '', '23 Octubre', 'Juan D. Peron 1500', '0000-00-00', 'Buenos Aires', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(118, 'CICCO', ' JUAN ALBERTO', 'Nacional', '34469', '2017-04-10 16:42:52', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'jciclo@intramed.com', '48040655', '48134087', '', 'Av. Pueyrredon 1640', '0000-00-00', 'Capital Federal', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(119, 'CICCHINI', ' SILVINA', 'Nacional', '101010', '2017-04-10 15:48:55', 3, 'HOSP. HOUSSAY', 'HOSPITAL', 'MNAKATSUNO', 'silvinacicchini@yahoo.com.ar', '47905400/1550388157', '47905400', '19 Julio', 'J. B. Alberdi 1995', '0000-00-00', 'Olivos', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(120, 'CASALI', ' CLAUDIA', 'Nacional', '93267', '2017-04-10 16:42:06', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'chematologia@hospitalaleman.com', '4827-7000 int2929 o 2433', '', '28 Junio', 'Av. Pueyrredon 1640', '0000-00-00', 'Capital Federal', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(121, 'CASAIS', ' PATRICIA', 'Nacional', '81968', '2012-05-24 10:46:32', 5, 'Centro Medico Pavlovsky', 'INSTITUCION', 'MSADOUET', 'casais@hematologia.anm.edu.ar', '1553224326', '', '', 'Las Heras 3092', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(122, 'CAMPESTRI', ' REINALDO', 'Nacional', '66352', '2013-06-18 15:48:53', 4, 'CONSULTORIO CAMPESTRI', 'CONSULTORIO', 'AGONZALEZ', 'reinaldocampestri@yahoo.com.ar', '(5411) 4831-0409', '48310409', '', 'Santa fe 3711 3º a', '2018-01-08', 'Caba', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-01-08', NULL, '2018-10-23 12:24:32', ''),
	(123, 'CAFFARO', ' JULIO', 'Nacional', '30862', '2017-04-10 15:46:59', 3, 'ZARATE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'juliocaffaro@gmail.com', '03487-422969-03487-15530238', '03487-438671', '', '', '0000-00-00', 'Zarate', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(124, 'BETTELLI', ' CARINA', 'Nacional', '83122', '2014-08-25 11:41:16', 4, 'PERGAMINO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'carinabetelli@hotmail.com', '02477-432004 int. 351/210', '02477-15666464', '', 'Pergamino', '2014-08-01', 'Argentina', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(125, 'BONETTI', ' ALEJANDRA', 'Provincial', '62930', '2017-04-10 15:46:28', 2, 'SAN NICOLAS CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'alebonetti@intercom.com.ar', '03461-15628767', '03461-426488', '', 'Avda. Falcón 723', '0000-00-00', 'San Nicolás', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(126, 'BERRO', ' MARIANO', 'Nacional', '113212', '2017-04-10 15:46:00', 8, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(127, 'BENGIO', ' RAQUEL MARIA', 'Nacional', '41661', '2015-08-25 13:33:49', 10, 'ANM', 'HOSPITAL', 'MNAKATSUNO', 'raquelbengio@hotmail.com', '4805-5759 ext.220', '', '', 'Pacheco de Melo3081', '0000-00-00', 'Buenos Aires ', 'MD ', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(128, 'BELAUSTEGUI', ' SUSANA', 'Nacional', '107550', '2011-10-31 09:52:06', 5, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'YAREVALO', 'sbelaust@cas.austral.edu.ar', '02322-482857', '02322 482214', '', 'Pte Peron 1500', '2008-07-21', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(129, 'BEGUELIN', ' RAUL', 'Provincial', '61443', '2017-04-10 15:44:33', 2, 'SAN NICOLAS CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'raulbeguelin@gmail.com', '03461-15523074', '03461-426488', '', '25 de mayo 36', '0000-00-00', 'San Nicolas', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(130, 'BEGUE', ' GISELLE', 'Nacional', '114006', '2017-04-10 15:44:08', 8, 'Sanatorio San Camilo', '', 'MNAKATSUNO', 'gisellebegue@hotmail.com', '4805-5759', '4805-5712', '', 'Pacheco de Melo3081', '0000-00-00', 'Buenos Aires', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(131, 'BARREYRO', ' PAULA', 'Nacional', '101465', '2017-04-24 11:44:34', 3, 'CONSULTORIO', 'CONSULTORIO', 'FCASTRO', 'paula.barreyro@fibertel.com.ar', '4805-5759//1554722121', '48047869', '', 'Pacheco de melo3081', '2017-03-17', 'Buenos aires', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-31', NULL, '0000-00-00 00:00:00', ''),
	(132, 'BARRAGAN', ' CARLOS', 'Nacional', '75681', '2017-04-10 15:37:07', 3, 'HOSP. HOUSSAY', 'HOSPITAL', 'MNAKATSUNO', '', '47976694', '', '', 'yrigoyen 1757', '0000-00-00', 'pcia bs as', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(133, 'BARGIANO', ' MA.SUSANA', 'Provincial', '62697', '2013-05-06 12:47:30', 4, 'PERGAMINO CONSULTORIO', 'CONSULTORIO', 'MSADOUET', 'delfi03su03@hotmail.com', '02477-15592357', '02477-430010', '', 'Florida 858', '2009-08-27', 'Buenos Aires ', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(134, 'BADUEL', ' CECILIA', 'Nacional', '118861', '2015-09-28 10:06:25', 4, 'Argerich', 'HOSPITAL', 'AGONZALEZ', 'cecibaduel@yahoo.com.ar', '4805-5759', '', '', 'Pacheco de Melo 3051', '0000-00-00', 'Buenos Aires', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(135, 'AVERSA', ' LUIS', 'Nacional', '53553', '2011-10-13 13:14:55', 5, 'HOSPITAL NIÑOS RICARDO GUTIERREZ', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(136, 'ASIS', ' MA.SUSANA', 'Nacional', '52610', '2017-04-10 15:36:13', 3, 'CONSULTORIO SAN CAMILO', 'CONSULTORIO', 'MNAKATSUNO', 'susana.asis@hotmail.com', '03487-430949', '', '', '', '0000-00-00', 'Zarate', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(137, 'ARROSAGARAY', ' GUILLERMO', 'Nacional', '62204', '2011-10-31 08:51:16', 5, 'HOSPITAL', 'HOSPITAL', 'YAREVALO', 'garrossagaray@hematologia.anm.edu.ar', '541148055759', '', '', 'Pacheco de Melo3081', '2008-08-07', 'Buenos Aires', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(138, 'ARIS CANCELA', ' MARIA', 'Nacional', '68342', '2017-04-10 15:35:26', 8, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'ariscancela@sion.com', '02322-482000', '02322-482214', '', 'Pte Peron 1500', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(139, 'ALCON ALVAREZ', ' MIGUEL', 'Nacional', '58041', '2017-04-10 15:35:52', 5, 'HOSPITAL MILITAR CENTRAL', 'CONSULTORIO', 'GPARDO', '', '', '', '', '', '2009-08-03', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(140, 'AGRA', ' MARCELA', 'Nacional', '86592', '2017-04-10 15:32:27', 8, 'HOSPITAL DR ENRIQUE TORNU', 'HOSPITAL', 'MNAKATSUNO', 'marcelagra@gmail.com', '4521-1236 int 116', '', '', 'Combatientes de malvinas 3002', '2019-05-07', 'Capital federal', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-05-07', NULL, '2018-10-23 12:24:32', ''),
	(141, 'ROSALES OSTRIZ', ' BELEN', 'Nacional', '110780', '2017-01-24 10:27:53', 4, 'TRASPLANTE HOSP. CLINICAS', 'CONSULTORIO', 'MARRUZAZABALA', 'belenortiz@yahoo.com.ar', '59508760', '', '', '', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(142, 'FONDEVILA', ' CARLOS', 'Nacional', '64075', '2017-04-10 15:57:10', 10, 'CLINICA BAZTERRICA', 'CONSULTORIO', 'MNAKATSUNO', 'c_fondevila@hotmail.com', '4823-3181', '4823-3181', '25 Mayo', 'Juncal 2990 2ºf', '0000-00-00', 'Buenos Aires ', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(143, 'CELEBRIN', ' LUCIA', 'Nacional', '62542', '2017-04-10 15:48:21', 8, 'HOSPITAL DR ENRIQUE TORNU', 'HOSPITAL', 'MNAKATSUNO', 'lcelebrin@intramed.net', '4521-1236 int 116', '4521-1236 int 184', '14 Diciembre', 'Combatientes de Malvinas 302', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(144, 'RUBIN', ' MARISA', 'Provincial', '11293', '2012-11-23 11:55:02', 2, 'RAFAELA INSTITUCION', 'INSTITUCION', 'MNAKATSUNO', 'drtrevisonnoalberto@arnet.com.ar', '3492433083', '', '', 'Pueyrredon 326', '2009-11-25', 'Rafaela santa fe', 'Hematológa/o', 'Activo', 'eala', 19, '2019-03-21', NULL, '2018-10-23 12:24:32', ''),
	(145, 'ROVERI', ' ERIBERTO', 'Provincial', '7747', '2017-01-19 11:25:08', 2, 'HOSP. CENTENARIO', 'CONSULTORIO', 'MARRUZAZABALA', 'eroveri@arnet.com.ar', '54-0341153599361', '', '', 'Pellegrini 1981 6 A', '0000-00-00', 'Rosario', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(146, 'ROSSO', ' FERNANDO ANTONIO', 'Provincial', '11621', '2014-06-02 16:15:39', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'fernandorosso815@hotmail.com', '0341-153102102', '', '', 'zeballos 1460', '2014-05-06', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(147, 'ROSSO', ' AMADEO', 'Provincial', '6241', '2012-11-23 11:54:30', 2, 'ROSARIOINSTITUCION', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(148, 'ROSSI', ' NESTOR', 'Provincial', '2060', '2012-11-23 11:54:19', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'SANTA FE', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(149, 'ROMERO MACIEL', ' M. DE LOS ANGELES', 'Nacional', '100709', '2014-02-05 16:03:06', 8, 'CORRIENTES', 'CONSULTORIO', 'AGONZALEZ', 'angelesromeromaciel@hotmail.com', '03783-15833851', '', '', 'Bolivar 667', '2008-06-20', 'Corrientes', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(150, 'ROJO PISARELLO', ' EDUARDO', 'Provincial', '2142', '2017-03-23 11:31:03', 8, 'FORMOSA CONSULTORIO', 'INSTITUCION', 'AGONZALEZ', 'pisarellodoc@hotmail.com', '03732-420197', '', '', 'Kennedy nº37 Sanez Peña', '2017-02-17', 'formosa', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(151, 'ROCASPANA', ' ADRIANA EUGENIA', 'Provincial', '10338', '2017-01-19 11:24:39', 2, 'HOSP. CENTENARIO', 'CONSULTORIO', 'MARRUZAZABALA', '', '0341-5153410', '', '', '', '0000-00-00', 'ROSARIO ', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(152, 'RESCIA', ' MARIA VIRGINIA', 'Provincial', '12962', '2017-01-19 11:31:54', 2, 'CONS DAVOLI ROSARIO', 'CONSULTORIO', 'MARRUZAZABALA', 'vrescia@fibertel.com.ar', '0341-155413293', '0341-4219426', '1 Marzo', 'Oroño 252 8ºB', '0000-00-00', 'Rosario', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(153, 'RAILLON', ' MIGUEL', 'Provincial', '3337', '2014-10-27 14:51:52', 2, 'ROSARIO HOSPITAL ITALIANO GARIBALDI', 'CONSULTORIO', 'AGONZALEZ', 'miguelraillon402@hotmail.com', '(0341) 4400617-4484830', '(0341) 4400617 - 4484830', '', 'Cordoba 2457', '2014-10-10', 'Rosario', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(154, 'QUARTARA', ' ALICIA', 'Provincial', '10297', '2017-01-19 11:24:53', 2, 'HOSP. CENTENARIO', 'CONSULTORIO', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(155, 'PUJOL', ' MARCELO', 'Provincial', '4441', '2013-06-12 14:52:09', 8, 'CORRIENTES', 'CONSULTORIO', 'AGONZALEZ', '', '03783-15657579', '', '', 'salta 1043, corrientes', '2013-05-05', 'Corrientes', 'hemtaologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(156, 'PUJAL', ' GRACIELA', 'Provincial', '1108', '2012-04-26 11:35:01', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gracielapujal@yahoo.com.ar', '03722-429460', '03722-429460', '23 Noviembre', '', '2009-04-27', 'Chaco', 'MD ', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(157, 'PROSS', ' MARIA CELESTE', 'Provincial', '9355', '2012-11-23 11:49:15', 2, 'PARANA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '0343-156117668', '', '7 Marzo', 'Juan Domingo Peron 450                                                           Galvan 4102               ', '0000-00-00', 'Parana, Entre Rios', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(158, 'PLAZA', ' ILEANA', 'Nacional', '10568', '2017-01-19 11:34:27', 2, 'ROSARIO SANATORIO BRITANICO', 'INSTITUCION', 'MARRUZAZABALA', 'ilianaplaza@yahoo.com.ar', '0341-5410541', '', '', 'Jujuy 1840', '2017-11-23', 'Rosario', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-10', NULL, '0000-00-00 00:00:00', ''),
	(159, 'PERINOTTO', ' GABRIELA', 'Provincial', '7554', '2015-01-12 16:06:51', 2, 'CONCEPCION DEL URUGUAY CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gabiperinotto@hotmail.com', '03442-15648767', '', '', '', '2009-11-10', 'concepcion del uruguay', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(160, 'PERETTE', ' CLAUDIA', 'Provincial', '11549', '2012-11-23 11:45:48', 2, 'SAN JUSTO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '03498-421165', '', '', 'Italia 2566', '2011-05-23', 'SAN JUSTO Santa Fe', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(161, 'PEREIRA', ' MARIANA', 'Provincial', '17979', '2017-01-19 11:30:47', 2, 'ROSARIO HOSPITAL PROVINCIAL', 'CONSULTORIO', 'MARRUZAZABALA', 'marianaleticiaferreira@hotmail.com', '0341-156589734', '', '', 'Alem 1450', '0000-00-00', 'Rosario', 'MD Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(162, 'ORTIZ', ' SERGIO', 'Provincial', '3059', '2013-09-19 14:55:24', 2, 'RAFAELA INSTITUCION', 'INSTITUCION', 'AGONZALEZ', 'sergio_ortiz@arnet.com.ar', '03492-15565470', '03492-435930', '', 'Las Calandrias 191', '2013-08-13', 'RAFAELA Santa Fe', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(163, 'ORLANDO', ' ANA GABRIELA', 'Provincial', '3703', '2012-11-23 11:42:28', 2, 'RECONQUISTA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '03482-15605818', '', '', ' 9 Julio 1035', '0000-00-00', 'RECONQUISTA SANTA FE', 'Oncologia clinica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(164, 'NOVIELLO', ' VICENTA', 'Provincial', '7667', '2012-11-23 11:41:59', 2, 'ROSARIO HOSPITAL PROVINCIAL', 'CONSULTORIO', 'MNAKATSUNO', 'vinkanoviello@hotmail.com', '54-341-4246115', '54-341-4246115', '29 Abril', '9 de Julio 2ºB', '2008-03-26', 'Rosario', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(165, 'NEGRI ARANGUREN', ' PEDRO', 'Provincial', '6426', '2014-10-03 15:56:17', 2, 'PARANA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'megrip@arnet.com.ar', '0343-4310144', '0343-4310144', '', 'Rivadavia 339', '2008-03-26', 'Parana, Entre Rios', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(166, 'MURTAGH', ' MONICA', 'Provincial', '6511', '2013-10-31 08:34:35', 2, 'CONCORDIA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'MMURTAGH@ARNET.COM.AR', '0345-4225144', '', '', '', '2013-10-21', 'CONCORDIA ENTRE RIOS ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(167, 'MOSCATELLI', ' MALENA', 'Provincial', '5199', '2017-01-23 10:45:37', 8, 'HOSP. CHACO', 'CONSULTORIO', 'MARRUZAZABALA', 'malenamoscatelli@gmail.com', '4805-5759', '', '18 Enero', '9 DE JULIO 1100', '0000-00-00', 'CHACO', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(168, 'MONTI', ' ADRIAN', 'Provincial', '3121', '2013-07-26 15:36:21', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'mondrial@hotmail.com', '0342-4524820', '', '', '4 de enero 3041', '2009-11-24', 'SANTA FE', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(169, 'MEGA', ' MARIA PAULA', 'Provincial', '4581', '2012-11-23 11:32:36', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'paulamega@hotmail.com', '1536690932', '', '14 Marzo', 'Las Heras 3092', '0000-00-00', 'SANTA FE', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(170, 'MATUS', ' MONICA', 'Provincial', '5554', '2012-11-23 11:31:02', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(171, 'MARULL', ' JORGE', 'Provincial', '940', '2012-11-23 11:29:49', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '03722-413020', '', '', 'Italia 351', '2009-11-17', 'Chaco', 'Hematológa/o', 'Activo', 'eala', 19, '2019-11-07', NULL, '2018-10-23 12:24:32', ''),
	(172, 'MARONI', ' MARIA SOLEDAD', 'Provincial', '15660', '2014-06-04 10:30:06', 2, 'ROSARIO INSTITUCION', 'INSTITUCION', 'AGONZALEZ', 'fliaronco@yahoo.com.ar', '0341-155854487', '-', '', 'zeballos 1460', '2014-06-03', 'ROSARIO ', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(173, 'MARIANO', ' ROMINA', 'Provincial', '7668', '2012-11-23 11:28:35', 2, 'PARANA HOSPITAL GENERAL SAN MARTIN', 'CONSULTORIO', 'MNAKATSUNO', 'romimariano@hotmail.com', '3434236334', '3434236334', '', '', '2009-03-26', 'PARANA ENTRE RIOS ', 'Medical Doctor', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(174, 'MANNI', ' FEDERICO', 'Provincial', '3995', '2012-11-23 11:28:18', 2, 'SANTA FE CLINICA', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'SANTA FE', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(175, 'MACARIO', ' JORGE OMAR', 'Provincial', '9794', '2015-02-11 16:41:50', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', '', '156182927', '', '', 'Salta 2668', '2015-01-13', 'Rosario', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(176, 'LOTERO', ' DIANA', 'Provincial', '2426', '2012-11-23 11:27:02', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'dianachaco@hotmail.com', '03722-427237', '', '', 'Av Italia 635', '2008-06-20', 'Chaco', 'E.M', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(177, 'LEIVA', ' MARTIN', 'Provincial', '5148', '2012-11-23 11:26:17', 2, 'GUALEGUAY CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'GUALEGUAY ENTR RIOS', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(178, 'LEIN', ' VANESA', 'Provincial', '15501', '2017-01-24 16:38:29', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'vanesalein@hotmail.com', '341-156401776', '5411-4877-1000', '22 Marzo', 'Laprida 1525 4ºA', '2017-11-10', 'ROSARIO ', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(179, 'LEIN', ' JOSE MARIO', 'Provincial', '3806', '2012-11-23 11:25:30', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'josemariolein@arnet.com.ar', '4488315', '', '11 Mayo', 'Montevideo 312', '2008-07-25', 'Santa Fe', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(180, 'LANARI ZUBIAUR', ' EMILIO', 'Provincial', '1101', '2012-07-17 09:48:58', 8, 'CORRIENTES', 'CONSULTORIO', 'MNAKATSUNO', 'ealz@arnet.com.ar', '54-0378315600575', '54-3783-435955', '', 'P Martínez 1340', '2008-03-26', 'Corrientes', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(181, 'LAGORIO', ' SERGIO GABRIEL', 'Provincial', '11337', '2015-11-23 14:01:21', 2, 'ROSARIO SANATORIO LAPRIDA', 'CONSULTORIO', 'FCASTRO', '', '0341-1564124330', '', '', 'Laprida 1000', '0000-00-00', 'ROSARIO ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(182, 'KURGANSKY', ' NICOLAS', 'Provincial', '4408', '2017-01-19 11:29:22', 2, 'SANTA FE CLIN PRIVADA', 'CONSULTORIO', 'MARRUZAZABALA', 'mkurgansky@yahoo.com.ar', '0342-4561671', '03424561671', '', 'San lorenzo 3214', '2017-05-23', 'Santa fe', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-08-15', NULL, '0000-00-00 00:00:00', ''),
	(183, 'HUTTES', ' LIDIA', 'Provincial', '999', '2012-11-23 11:21:22', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'lhuttes@hotmail.com', '+543424551200', '', '24 Enero', 'San Martin 3429', '2008-07-25', 'Santa Fe', 'MD', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(184, 'GUMPEL', ' CARINA', 'Provincial', '13315', '2013-05-22 12:11:28', 2, 'ROSARIO SANATORIO PLAZA', 'CONSULTORIO', 'AGONZALEZ', 'carinagumpel@yahoo.com.ar', '0341-156919790', '', '10 Febrero', '', '2013-05-17', 'ROSARIO', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(185, 'GRANERO', ' GONZALO', 'Provincial', '3440', '2017-01-19 11:29:09', 2, 'SANTA FE CLIN PRIVADA', 'CONSULTORIO', 'MARRUZAZABALA', 'gongranero@gmail.com', '0342-154055392', '03424561671', '', 'San lorenzo 3214', '2020-02-04', 'Santa fe', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2020-02-04', NULL, '0000-00-00 00:00:00', ''),
	(186, 'GONZALEZ MERCADO', ' GRACIELA FLORENCIA', 'Provincial', '5639', '2012-11-23 11:18:30', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gra.gonz@hotmail.com', '4542-7623', '', '27 Abril', 'Monroe 3351', '2008-08-08', 'SANTA FE', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(187, 'GONZALEZ', ' LILIANA', 'Provincial', '10383', '2013-03-06 11:41:12', 2, 'ROSARIO ISTITUCION', 'INSTITUCION', 'AGONZALEZ', 'rolg2003@yahoo.com.ar', '0341 437-7620 al 26 int 273 o 0341-439-6158 o', '', '', 'Olive 1159', '2013-02-26', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(188, 'GOMEZ WUX', 'GOMEZ NUX LILIANA', 'Provincial', '6333', '2012-11-23 11:17:08', 2, 'PARANA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'PARANA ENTRE RIOS ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(189, 'GIUNTA', ' MARIO', 'Provincial', '5346', '2017-01-19 11:28:10', 2, 'PARANA CONSULTORIO', 'CONSULTORIO', 'MARRUZAZABALA', '', '0343-156220996', '', '', 'Italia 100', '0000-00-00', 'PARANA ENTRE RIOS ', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(190, 'GATTO', ' PAOLA', 'Nacional', '999', '2012-11-23 11:13:16', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'paocat@hotmail.com', '0342-4552767-4553440', '0342-4552767-4553440', '28 Abril', 'Crespo 2633', '2008-10-02', 'Santa Fe', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(191, 'GARCIA', ' FABIANA', 'Provincial', '13705', '2012-11-23 11:12:20', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(192, 'GALVAN', ' GRACIELA', 'Provincial', '1979', '2017-01-30 16:17:41', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'gachi33@hotmail.com', '03722-15683570', '', '', 'salta 1525', '2016-12-21', 'CHACO', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(193, 'GALLO', ' ROSANA', 'Provincial', '13906', '2011-10-17 10:46:45', 2, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(194, 'GALEAZZI', ' ANA', 'Provincial', '10055', '2015-01-12 15:49:56', 2, 'VENADO TUERTO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'avgaleazzi@hotmail.com', '3462421002', '3462421002', '', 'Saavedra 843', '2008-10-10', 'Venado Tuerto', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(195, 'GABRIEL', ' ANGEL', 'Provincial', '7883', '2017-01-19 11:14:36', 2, 'SANAT. PARQUE ROSARIO', 'CONSULTORIO', 'MARRUZAZABALA', '', '0341-4200286', '', '', 'Bv. Oroño 860 1 piso', '0000-00-00', 'Rosario', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(196, 'FUNES', ' MARIA EUGENIA', 'Provincial', '15084', '2017-01-19 11:33:55', 2, 'ROSARIO SANATORIO BRITANICO', 'INSTITUCION', 'MARRUZAZABALA', 'marufunes1@gmail.com', '0341-156287260', '', '', 'paraguay 40', '0000-00-00', 'ROSARIO ', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(197, 'FEDELE', ' JOSE LUIS', 'Provincial', '12136', '2017-01-19 11:27:05', 2, 'SANAT. LOS ARROYOS FEDELE', 'CONSULTORIO', 'MARRUZAZABALA', '', '0341-1551513469', '', '', 'Cordoba 2457', '0000-00-00', 'ROSARIO ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(198, 'COY FAJARDO', ' GUILLERMO ALFONSO', 'Provincial', '10407', '2017-01-19 11:25:34', 2, 'PAMI 1', 'CONSULTORIO', 'MARRUZAZABALA', 'guillermocoyf@hotmail.com', '4255517', '', '', '', '0000-00-00', 'Rosario', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(199, 'CORRALES', ' MARCELA', 'Nacional', '115105', '2012-11-23 10:56:39', 8, 'FORMOSA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'marcecorrales@hotmail.com', '03717-155225925', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(200, 'CONTINO', ' ALEJANDRA', 'Provincial', '12003', '2012-11-23 10:56:11', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'alejandracontino@ciudad.com.ar', '0341-4200286/0341155006591', '', '', '', '2010-05-05', 'Rosario', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(201, 'COLOMBO BERRA', ' ALEJANDRO', 'Provincial', '9075', '2012-11-23 10:55:46', 2, 'ROSARIO HOSPITAL PROVINCIAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(202, 'CIARLO', ' SERGIO', 'Provincial', '8446', '2017-01-19 11:46:47', 2, 'CONSULTORIO ROSARIO ciarlo', 'CONSULTORIO', 'MARRUZAZABALA', 'sgabrielciarlo@hotmail.com', '4263097', '4263097', '', 'Zeballos 1460', '0000-00-00', 'Rosario', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(203, 'CHIERICHIETTI', ' MARIA ANGELA', 'Provincial', '10047', '2012-11-23 10:53:37', 2, 'ROSARIO INSTITUCION', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(204, 'CHIALVO', ' LUCRECIA', 'Provincial', '15000', '2017-01-19 11:34:51', 2, 'ICR ROSARIO', 'INSTITUCION', 'MARRUZAZABALA', '', '155823174', '4858824', '', '', '0000-00-00', 'Rosario', 'Residente de Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(205, 'CHEMES', ' CRISTINA ARACELI', 'Provincial', '2823', '2012-11-23 10:52:59', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'CRISARCHEMES@HOTMAIL.COM', '03722-422229-03722 15604106', '', '', '', '2009-10-27', 'Chaco', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(206, 'CERUTTI', ' IDER', 'Provincial', '6733', '2014-11-19 14:21:31', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'idercerutti@steel.com.ar', '543414390108', '', '', 'Rioja 2120', '2014-11-13', 'Rosario', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(207, 'CERANA', ' SUSANA', 'Provincial', '7271', '2012-11-23 10:51:29', 2, 'ROSARIO SANATORIO BRITANICO', 'CONSULTORIO', 'MNAKATSUNO', 'sucerana@yahoo.com.ar', '341-4205571', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(208, 'CASTANO', ' VANESA', 'Provincial', '14676', '2016-12-20 17:12:08', 1, 'HOSP DE NECOCHEA', 'CONSULTORIO', 'MARRUZAZABALA', 'vanesacastone@hotmail.com', '02262316781', '', '', '', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(209, 'CAMPO', ' CESAR', 'Provincial', '999', '2016-03-09 16:39:16', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'FCASTRO', '', '', '', '', '', '2019-02-27', 'Santa fe', 'Hematológa/o', 'Activo', 'eala', 19, '2019-02-27', NULL, '2018-10-23 12:24:32', ''),
	(210, 'CALDERONE', ' PATRICIA', 'Provincial', '12408', '2012-11-23 10:48:12', 2, 'ROSARIO INSTITUCION', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(211, 'CAISSON', ' GRETEL', 'Provincial', '15861', '2012-11-23 10:47:54', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(212, 'BRICAS', ' CLAUDIA', 'Provincial', '9481', '2012-11-23 10:33:17', 2, 'ROSARIO INSTITUCION', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(213, 'BIETTI', ' JULIETA', 'Provincial', '3686', '2012-11-23 10:30:52', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'SANTA FE', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(214, 'BELTRAMINO', ' MARIA PAULA', 'Provincial', '3741', '2012-11-23 10:28:56', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'SANTA FE', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(215, 'BELIGOY', ' LUIS ENZO', 'Provincial', '2957', '2017-01-23 10:45:50', 8, 'HOSP. CHACO', 'CONSULTORIO', 'MARRUZAZABALA', '', '03722-15548357', '', '', '', '0000-00-00', 'Chaco', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(216, 'BASSO', ' ALFREDO', 'Provincial', '5083', '2017-01-19 11:13:49', 2, 'SANAT. PARQUE ROSARIO', 'CONSULTORIO', 'MARRUZAZABALA', 'titobas@satlink.com', '0054-3414255517', '0054341-4406969', '', 'Dorrego 336', '0000-00-00', 'Rosario', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(217, 'BAR', ' DANIEL', 'Provincial', '2263', '2017-01-19 11:29:37', 2, 'SANTA FE CLIN PRIVADA', 'CONSULTORIO', 'MARRUZAZABALA', 'danieloscarbar@hotmail.com', '0342-4561671', '03424561671', '', 'San lorenzo 3214', '2020-03-05', 'Santa fe', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2020-03-05', NULL, '0000-00-00 00:00:00', ''),
	(218, 'AROCENA', ' HECTOR', 'Provincial', '6543', '2013-05-24 14:42:38', 2, 'GUALEGUAY CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', '', '', '', '', '', '2013-05-02', 'GUALEGUAY ENTR RIOS', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(219, 'ARIZO', ' ADRIANA', 'Provincial', '3107', '2012-11-23 10:20:08', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'ariadi@yahoo.com.ar', '0342-155175286', '0342 4551200', '', 'San Martin 3429', '2011-11-24', 'SANTA FE', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(220, 'AREVALO', ' ALEJANDRO', 'Provincial', '2879', '2012-11-23 10:19:18', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'SANTA FE', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(221, 'ANTONIONE', ' FRANCA', 'Provincial', '17000', '2017-01-19 11:35:20', 2, 'ICR ROSARIO', 'INSTITUCION', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(222, 'ANICH', ' ELEN', 'Provincial', '1823', '2014-08-08 14:18:26', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', '', '0364-463 6510', '', '', 'Sarmiento 35, Saenz Peña ', '2014-07-30', 'Chaco', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(223, 'ABRAMOVICH', ' CATALINA', 'Provincial', '7172', '2017-01-19 11:35:54', 2, 'CONSULTORIO ROSARIO', 'INSTITUCION', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(224, 'AMOROSO COPELLO', ' MARIA PIA', 'Nacional', '54792', '2016-04-05 16:20:14', 4, 'CONSULTORIO', 'CONSULTORIO', 'GPARDO', 'mpcopello@arnet.com.ar', '15-4158-7479', '', '', 'Sarmiento 4445', '2016-04-05', '', 'Médica/o', 'Activo', 'agonzalez', 19, '2019-08-06', NULL, '2018-10-23 12:24:32', ''),
	(225, 'ANSELMO', ' ARMANDO', 'Nacional', '45110', '2012-03-09 10:01:08', 8, 'CONSULTORIO', 'CONSULTORIO', 'DCILVETI', 'anselmo@lebbyac.com', '4292-6993', '4244-9606', '0000-00-00', 'H Yrigoyen 8366 1°', '2008-10-21', 'Lomas de Zamora', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(226, 'ANTONIETA', 'ANTONIETTA CARLOS', 'Nacional', '51473', '2014-05-19 09:23:52', 3, 'HOSPITAL MATERNO INFANTIL', 'HOSPITAL', 'AGONZALEZ', 'carlosantonietta@hotmail.com', '42514154 o 1554545265', '', '', 'Rivadavia 437', '2014-05-06', 'Quilmes', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(227, 'ARBELBIDE', ' JORGE', 'Nacional', '80377', '2015-08-11 14:37:36', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'MNAKATSUNO', 'jorge.arbelbide@hospitalitaliano.org.ar', '4958-2463', '49582463', '', 'Capital federal', '2019-02-07', 'Buenos aires', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-02-07', NULL, '0000-00-00 00:00:00', ''),
	(228, 'ARDAIZ', ' MARIA DEL CARMEN', 'Nacional', '59359', '2017-01-24 10:29:15', 4, 'CONSULTORIO', 'CONSULTORIO', 'MARRUZAZABALA', 'mariaardaiz@netscape.net', '154415928', '4931-6844', '', 'Urquiza 600', '0000-00-00', 'Capital Federal', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(229, 'BALLADARES', ' GRACIELA', 'Nacional', '9999', '2015-02-03 11:15:39', 3, 'HOSPITAL DE RODOLFO ROSSI', 'HOSPITAL', 'FCASTRO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(230, 'BISTMANS', ' ALICIA', 'Nacional', '58078', '2015-08-11 14:43:55', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'abistmans@intramed.net', '46561150 o 1540220574', '', '', 'urquiza 609', '0000-00-00', 'caba', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(231, 'BOLESINA', ' MOIRA', 'Nacional', '120752', '2017-01-19 10:26:49', 3, 'HOSPITAL CENTRAL DE SAN ISIDRO', 'HOSPITAL', 'MARRUZAZABALA', 'moirabolesina@hotmail.com', '1551617654', '', '', 'Urquiza 609', '2019-02-21', 'Buenos aires', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-02-21', NULL, '2018-10-23 12:24:32', ''),
	(232, 'BOLOGNANI', ' MERCEDES', 'Provincial', '111671', '2015-05-06 12:02:11', 3, 'HOSPITAL SAN ROQUE', 'HOSPITAL', 'AGONZALEZ', 'mariamerbol@gmail.com', '54 9 221 576-6992', '', '', '136 bis N°390 entre 472 y 473', '2015-02-25', 'City Bell', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(233, 'BORDONE', ' JAVIER', 'Nacional', '9', '2012-11-23 10:31:53', 3, 'LA PLATA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'jbordone@netverk.com.ar', '0221-154858710', '', '', 'Calle 60 # 480', '2008-03-26', 'La Plata', 'Medico', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(234, 'BRUNO', ' DANIELA', 'Nacional', '123764', '2017-01-19 10:15:23', 3, 'CONSULTORIO SAN ISIDRO', 'CONSULTORIO', 'MARRUZAZABALA', 'dani_bruno@hotmail.com', '1533310773', '', '', 'las heras 3767', '0000-00-00', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(235, 'BULLORSKY', ' EDUARDO', 'Nacional', '42472', '2012-09-14 10:33:18', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'AGONZALEZ', 'eduardo.bullosky@fibertel.com.ar', '4997-8682', '4304-1081 ext. 2560', '', 'Perdriel 74', '2008-08-15', 'Buenos Aires ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(236, 'BUNZEL', ' SUSANA', 'Provincial', '15405', '2011-10-26 13:55:52', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'bunzelsu@hotmail.com', '0221-155074356', '02214251717', '', '1 y 69 subsuelo ', '2008-02-26', 'La plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-03-08', NULL, '0000-00-00 00:00:00', ''),
	(237, 'CAICEDO', ' LILIA', 'Nacional', '90660', '2012-01-02 11:25:46', 8, 'HOSPITAL ESPAÑOL', 'HOSPITAL', 'MSADOUET', 'liliacaicedomd@hotmail.com', '1535649015', '46357891', '01/04', '', '2010-08-10', 'Capital federal', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(238, 'CANESSA', ' VICTORIA', 'Nacional', '120155', '2014-12-23 08:08:34', 3, 'HOSPITAL SAN ROQUE', 'HOSPITAL', 'FCASTRO', 'victoriamcanessa@gmail.com', '4805-5759', '', '', 'Pacheco de Melo3081', '2008-08-07', 'Buenos Aires ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(239, 'CARRARA', ' NORA', 'Nacional', '73307', '2017-01-23 10:58:06', 5, '', 'HOSPITAL', 'MARRUZAZABALA', 'ncarrara@intramed.net.ar', '1550256917', '', '11 Julio', '', '2010-01-01', '', 'Médica/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(240, 'CASTRO RIOS', ' MIGUEL', 'Nacional', '39489', '2011-10-26 14:10:33', 3, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', 'mcastrorios@fibertel.com.ar', '4743-2560', '4743-2560', '', '', '2009-04-27', 'Buenos Aires', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(241, 'CAVIGLIA', ' DANIEL', 'Nacional', '76276', '2017-01-03 16:41:21', 10, 'HOSPITAL AERONAUTICO CENTRAL', 'HOSPITAL', 'AGONZALEZ', '', '4798-3311', '', '', 'Vega Ventura 3697', '0000-00-00', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(242, 'CAZAP', ' NICOLAS', 'Nacional', '105206', '2015-01-12 15:43:08', 3, 'CENTRO CEMIC', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CAPITAL FEDERAL', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(243, 'CERESETTO', ' JOSE', 'Nacional', '74596', '2011-11-07 17:08:01', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'YAREVALO', 'jceresetto@intramed.net', '1567262574', '43041081', '', 'jceresetto@intramed.net.ar', '2008-05-28', 'Buenos Aires ', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(244, 'CICCHETTI', ' ALEJANDRO', 'Provincial', '19137', '2011-11-08 08:34:15', 3, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', 'a.cicchetti@hotmail.com', '54-02214722582', '54-02214530046', '', '473 bis 1619 City Bell', '2008-03-26', 'La Plata', 'Medico', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(245, 'CIGLIANO', ' SILVIA', 'Nacional', '56053', '2012-09-14 10:50:48', 3, 'HOSPITAL DR PEDRO FIORITO', 'HOSPITAL', 'AGONZALEZ', 'silcigliano@yahoo.com.ar', '42223998 o 42014469', '', '', '', '2013-12-13', '', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(246, 'DALMARONI', ' JULIETA', 'Nacional', '122973', '2017-01-19 10:18:07', 3, 'HOSPITAL DR RODOLFO ROSSI', 'SANATORIO', 'MARRUZAZABALA', 'julietadalmaroni@hotmail.com', '(221). 15.6318318 o (0221) 9 154978318', '', '', 'Calle 12 Nº36 4º A', '0000-00-00', 'La Plata', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(247, 'DAVICO', ' STELLA MARIS', 'Nacional', '73642', '2015-08-11 14:49:34', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', '', '1556360605', '', '6 Agosto', 'Urquiza 609', '0000-00-00', '', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(248, 'DE ROSA', ' PATRICIA', 'Nacional', '96191', '2011-07-11 14:54:16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(249, 'DI CIACCIO', ' ELIDA', 'Nacional', '66721', '2015-05-15 11:42:24', 3, 'HOSPITAL CENTRAL DE SAN ISIDRO', 'HOSPITAL', 'AGONZALEZ', '', '', '', '', '', '2015-04-14', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-11-05', NULL, '0000-00-00 00:00:00', ''),
	(250, 'DIAZ VELEZ', ' NAZARIO', 'Nacional', '115135', '2017-01-09 08:01:32', 8, 'HOSPITAL ESPAÑOL', 'HOSPITAL', 'FCASTRO', 'nazadiazvelez@yahoo.com.ar', '5411-48644784', '', '', 'Uspallata 3200', '2016-11-14', 'Capital federal', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(251, 'DIBAR', ' EDUARDO', 'Nacional', '30827', '2015-08-11 14:50:12', 10, 'HOSPITAL ITALIANO', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(252, 'DURE', ' GUILLERMO', 'Nacional', '64329', '2017-01-19 10:16:13', 3, 'FINOCHIETTO (PTE PERON)', 'HOSPITAL', 'MARRUZAZABALA', 'gcdure@hotmail.com', '4204-1021/1029 int 279', '', '', '', '2019-05-09', 'Avellaneda', 'Hematológa/o', 'Activo', 'eala', 19, '2019-05-09', NULL, '2018-10-23 12:24:32', ''),
	(253, 'ENRICO', ' ALICIA', 'Provincial', '18792', '2012-10-02 14:59:02', 3, 'HOSPITAL ITALIANO LP', 'HOSPITAL', 'AGONZALEZ', 'enrico@netverk.com.ar', '00542214226823', '00542214714744', '3 Diciembre', '10 H 81 20 F 1900', '2008-05-12', 'La Plata', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(254, 'FANTL', ' DOROTEA', 'Nacional', '44461', '2015-08-11 14:52:37', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'MNAKATSUNO', 'dorotea.fantl@hospitalitaliano.org.ar', '(5411) 4958-2463', '(5411) 4958-2463', '5 Mayo', 'Zuviria 980', '0000-00-00', 'Capital Federal', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(255, 'FAZIO', ' PATRICIA', 'Provincial', '1748', '2017-02-23 15:37:47', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'JKIPRIZLIAN', 'patriciagfazio@yahoo.com.ar', '0221-4251717', '0221-4251717', '', '1 y 69 subsuelo ', '2017-02-23', 'La Plata', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(256, 'FERIOLI', ' MARIA', 'Nacional', '66920', '2011-10-26 16:54:55', 3, 'HOSPITAL DR ISIDRO IRIARTE', 'HOSPITAL', 'YAREVALO', 'martaferioli@live.com.ar', '4252-1086', '1555634191', '', '', '2010-04-20', 'Quilmes', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(257, 'FERRARI', ' DAVID', 'Nacional', '99593', '2014-09-29 16:47:23', 3, 'HOSPITAL DR PEDRO FIORITO', 'HOSPITAL', 'AGONZALEZ', 'davidmartinferrari@gmail.com', '4225-2046 1554168333', '', '', 'Remedios de escalada', '2014-08-15', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-05-10', NULL, '2018-10-23 12:24:32', ''),
	(258, 'GARCIA', ' EIHSCHLAG CECILIA', 'Nacional', '111965', '2017-01-19 10:28:40', 3, 'HOSPITAL ITALIANO LP', 'HOSPITAL', 'MARRUZAZABALA', 'cgarciae1075@gmail.com', '542214535000', '542214176702', '', 'Calle 52 e 29 y 30 ', '2018-11-17', 'La plata', 'Hematológa/o', 'Activo', 'eala', 19, '2020-01-30', NULL, '2018-10-23 12:24:32', ''),
	(259, 'GAREIS', ' LORENA VERONICA', 'Nacional', '113913', '2015-08-11 14:56:13', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'LVG212@HOTMAIL.COM', '1569348961', '', '2 Diciembre', 'Urquiza 609', '0000-00-00', 'Buenos Aires', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(260, 'GELEMUR', ' MARTA ALICIA', 'Provincial', '15406', '2011-10-26 17:17:23', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'chopita@netverk.com.ar; martagelemur@hotmail.com', '0221-154658125', '0221-4251717', '', '', '2008-02-18', 'La Plata', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(261, 'GIL', ' JULIETA', 'Provincial', '110304', '2014-04-08 15:27:36', 3, 'HOSPITAL SAN ROQUE', 'HOSPITAL', 'AGONZALEZ', 'giljulieta@gmail.com', '(0221)155256355 ', '', '8 Enero', 'calle 49 N°1777', '2014-03-27', 'GONNET', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(262, 'HANONO', ' ISABEL', 'Nacional', '100150', '2011-11-07 15:55:27', 4, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', 'jryb@intramed.net.ar', '54011 6323 2930', '5401163232930', '29 Noviembre', 'Cramer 1180', '2018-11-07', 'Capital federal', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-11-07', NULL, '2018-11-07 23:50:00', ''),
	(263, 'IMMUTABILE', ' MURIEL', 'Nacional', '97997', '2015-08-11 14:59:08', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'murieldelvalle@hotmail.com', '1545348725', '', '1 Agosto', 'Urquiza 609', '0000-00-00', 'Capital Federal', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(264, 'ISNARDI', ' SEBASTIAN', 'Provincial', '114182', '2013-08-13 09:19:13', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'AGONZALEZ', 'sebastianisnardi@hotmail.com', '(0221)4251717 int 306', '0221154087041', '1 Julio', '62 nº 311', '2019-04-08', 'La plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-04-08', NULL, '2018-10-23 12:24:32', ''),
	(265, 'JAOE', 'JAGOE  MARIA CELESTE', 'Nacional', '112002', '2015-08-25 13:40:58', 1, 'PRIVADO', 'HOSPITAL', 'MNAKATSUNO', 'celestejagoe@gmail.com', '02494433390', '', '', 'San lorenzo 869', '2018-04-05', 'Buenos aires ', 'Hematológa/o', 'Activo', 'mnakatsuno', 19, '2019-01-11', NULL, '0000-00-00 00:00:00', ''),
	(266, 'JAUREGUIBERRY', ' ROSANA', 'Provincial', '111021', '2011-10-17 12:03:22', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(267, 'KLEIN', ' GRACIELA', 'Nacional', '112308', '2014-04-25 10:53:35', 3, 'HOSPITAL DR RODOLFO ROSSI', 'HOSPITAL', 'AGONZALEZ', 'kleingra@speedy.com.ar', '(0221) 4271114', '(0221)4257226', '21 Diciembre', '37 Nº183 ', '2014-04-01', 'La Plata', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(268, 'LABRA', ' LISA', 'Nacional', '90400', '2012-09-14 11:17:14', 3, 'HOSPITAL CENTRAL DE SAN ISIDRO', 'HOSPITAL', 'AGONZALEZ', 'lisalabra@ciudad.com.ar', '4512-3720', '4964-0984', '', '', '2009-04-29', 'Capital Federal', 'MD', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(269, 'LAMPI', ' SUSANA', 'Nacional', '104568', '2017-01-19 10:16:31', 3, 'FINOCHIETTO (PTE PERON)', 'HOSPITAL', 'MARRUZAZABALA', 'susanamlampi@hotmail.com', '4204-2080/81 int 279', '', '', '', '2018-11-01', '', 'Hematológa/o', 'Activo', 'gpardo', 19, '2018-12-19', NULL, '2018-10-23 12:24:32', ''),
	(270, 'LLUESMA', ' MOIRA', 'Nacional', '60201', '2011-11-01 11:04:36', 3, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'YAREVALO', 'moiranomm@hotmail.com.ar', '1556998214', '', '8-marzo', 'Emilio Berisso 1122', '0000-00-00', '', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(271, 'MAKIYA', ' MONICA', 'Nacional', '68728', '2015-08-11 15:02:11', 10, 'HOSPITAL ITALIANO', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(272, 'MANEYRO', ' ALBERTO', 'Nacional', '63120', '2017-03-01 12:03:06', 10, 'HOSPITAL DR JOSE M PENNA', 'HOSPITAL', 'FCASTRO', 'amaneyro@speedy.com', '4909-4132', '', '', 'Uspallata 3200', '2017-02-14', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-24', NULL, '0000-00-00 00:00:00', ''),
	(273, 'MARQUEZ', ' ALEJANDRA', 'Nacional', '82114', '2012-01-26 15:25:17', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', '', '1540945449', '', '', '', '2018-02-01', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-02-14', NULL, '0000-00-00 00:00:00', ''),
	(274, 'MARTINEZ', ' STELLA', 'Provincial', '17237', '2011-10-27 10:08:25', 3, 'SANATORIO MODELO QUILMES', 'SANATORIO', 'YAREVALO', 'stellamar2006@yahoo.com.ar', '40021100', '', '', '', '2009-07-20', '', 'MD', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(275, 'MARTORELLI', ' DANIEL', 'Nacional', '89091', '2017-01-19 10:17:02', 3, 'CONSULTORIO MARTORELLI', 'SANATORIO', 'MARRUZAZABALA', 'danielmartorelli@fibertel.com.ar', '4797 1995', '', '', 'Av. San Martin 2142', '0000-00-00', '', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(276, 'MAZZEO', ' MARIA', 'Nacional', '80590', '2015-08-11 15:04:43', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'mzzeo@hotmail.com', '154498547', '', '3 Septiembre', 'Urquiza 609', '2019-05-23', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-05-23', NULL, '2018-10-23 12:24:32', ''),
	(277, 'MICUCCI', ' CARLOS', 'Provincial', '26990', '2011-11-07 10:40:15', 3, 'HOSPITAL PTE. PERON (SARANDI)', 'HOSPITAL', 'YAREVALO', 'hppshemato@ciudad.com.ar', '4204-1021-29 int 279', '4204-0133', '17 Agosto', 'Sarandi, Avellaneda', '2011-01-25', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(278, 'MILONE', ' JORGE', 'Provincial', '15578', '2012-07-31 10:33:26', 3, 'HOSPITAL ITALIANO LP', 'HOSPITAL', 'AGONZALEZ', 'milonejh@netverk.com.ar', '0054-221-4176702', '0054-221-4176702', '11 Marzo', 'calle 51 e 29 y 30 1900', '2008-05-12', 'La Plata', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(279, 'MINUE', ' GONZALO', 'Nacional', '86465', '2015-09-02 16:59:25', 3, 'HOSPITAL ESPAÑOL', 'HOSPITAL', 'AGONZALEZ', '', '1550116952', '', '', 'Belgrano 2975', '2015-09-02', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-11-16', NULL, '0000-00-00 00:00:00', ''),
	(280, 'MIROLI', ' AUGUSTO', 'Nacional', '114134', '2017-02-06 11:43:33', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'AGONZALEZ', 'augustomirilo@hotmail.com', '011-1558213328', '', '', 'Urquiza 609', '2017-01-11', 'Buenos Aires', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(281, 'MOIRAGHI', ' BEATRIZ ELENA', 'Nacional', '67626', '2015-08-11 15:06:09', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'emoiraghu@fibertel.com.ar', '49570182', '49570182', '19 Julio', 'Avellaneda 1863 9ºG', '0000-00-00', 'Capital Federal', 'Medica de planta', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(282, 'MOIRANO', ' MARIA', 'Nacional', '112571', '2013-05-09 16:02:52', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'AGONZALEZ', 'moiranomm@hotmail.com.ar', '0221-4251717', '0221-15-594 1222', '', '1 y 69 subsuelo ', '2008-02-18', 'La Plata', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(283, 'MORGA', ' EDUARDO', 'Provincial', '28407', '2017-01-23 10:38:59', 8, 'LOMAS DE ZAMORA CONSULTORIO', 'CONSULTORIO', 'MARRUZAZABALA', 'edmorga@hotmail.com', '1544207660', '', '', '', '2018-05-16', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-05-18', NULL, '0000-00-00 00:00:00', ''),
	(284, 'MURUA', ' ALICIA', 'Nacional', '72893', '2011-10-17 17:09:23', 3, 'HOSPITAL FRANCES', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(285, 'NU?EZ', 'NUÑEZ GABRIELA', 'Nacional', '80764', '2017-01-24 10:25:13', 4, 'Argerich', 'HOSPITAL', 'MARRUZAZABALA', 'gabymnuñez@hotmail.com', '41210850', '43626136', '24 Enero', 'Alte. Brown 240', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(286, 'NUCIFORA', ' ELSA', 'Nacional', '9911', '2015-08-11 15:07:24', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'MNAKATSUNO', 'elsa.nucifora@hospitalitaliano.org.ar', '(5411) 4958-2463', '49582463', '9 Diciembre', 'Pumacahua 34 1º a', '2019-10-09', 'Capital federal', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-10-09', NULL, '2018-10-28 23:50:00', ''),
	(287, 'ORLANDO', ' SERGIO', 'Nacional', '62310', '2011-11-07 08:37:23', 3, 'HOSPITAL DR RODOLFO ROSSI', 'HOSPITAL', 'YAREVALO', 'orlando@way.com.ar', '(0221)4271114', '(0221)4223141', '30 Septiembre', '37 Nº 183', '2008-08-27', 'La Plata', 'MD', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(288, 'ORSINI', ' OSCAR', 'Nacional', '37507', '2012-01-26 15:38:01', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(289, 'OTARAN', ' MARIA DEL CARMEN', 'Nacional', '75601', '2015-08-11 15:07:57', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'maritar@yahoo.com.ar', '4924-8783', '49248783', '', 'Urquiza 609', '0000-00-00', 'Capital Federal', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(290, 'PALMER', ' LUIS', 'Nacional', '44901', '2016-03-21 09:13:32', 10, 'HOSPITAL DR CHURRUCA VISCA', 'HOSPITAL', 'AGONZALEZ', 'luispalmer549@gmail.com', '1562080101', '', '', 'uspallata 3400', '2016-03-16', 'caba', 'hematología', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(291, 'PALMER', ' SILVINA', 'Nacional', '112509', '2012-08-24 16:09:29', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'AGONZALEZ', 'silpalmer@gmail.com', '4832-6347', '', '', 'Malabia 2215', '2008-08-15', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(292, 'PALOMINO', ' ELSA', 'Nacional', '16087', '2017-01-19 10:13:16', 3, 'HOSP. SAN JUAN DE DIOS', 'CONSULTORIO', 'MARRUZAZABALA', 'elsapalomino@yahoo.com.ar', '0221-1548500254', '', '8 Noviembre', '27 y 70 , la plata', '0000-00-00', 'pcia de bs as', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(293, 'PEIRO', ' ALEJANDRA', 'Nacional', '83355', '2015-11-26 11:36:35', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'FCASTRO', 'alepeiro@yahoo.com.ar', '011-4777-8376', '', '22 Julio', 'I. Chenaut 1863 P.11 Dpto A', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(294, 'PENCHASKY', ' DIANA', 'Nacional', '99', '2017-01-11 16:38:22', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'JKIPRIZLIAN', 'dianapenchasky@hospitalitaliano.org.ar', '154493296', '', '', 'angel gallardo 525 4 piso', '0000-00-00', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(295, 'PEREZ', ' MARIEL', 'Provincial', '19729', '2015-05-14 12:34:58', 3, 'HOSPITAL DR RODOLFO ROSSI', 'HOSPITAL', 'FCASTRO', 'marielana@ciudad.com.ar', '(0221)5255446', '(022194257226', '30 octubre', '37 Nº 183', '0000-00-00', 'La Plata', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(296, 'PIERDOMINICI', ' MARTA S', 'Nacional', '71315', '2015-08-11 15:10:30', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'docmortapierdo@yahoo.com.ar', '47865948 / 1556430632', '', '16 Marzo', 'Amenabar 2274 2º A', '0000-00-00', 'Capital Federal', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(297, 'PINTOS', ' LUIS FABIAN', 'Nacional', '77540', '2017-01-19 10:18:54', 3, 'HOSP. ESPAÑOL LA PLATA', 'HOSPITAL', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(298, 'PONZINIBBIO', ' CARLOS', 'Nacional', '49045', '2012-05-11 16:16:00', 3, 'HOSPITAL ITALIANO LP', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(299, 'PRATES', ' MARIA VIRGINIA', 'Provincial', '110418', '2015-03-19 11:34:23', 3, 'HOSPITAL ITALIANO LP', 'HOSPITAL', 'FCASTRO', 'muprates@hilp.org.ar', '5402215928023', '542214176702', '7 Abril', '21 C b 1623, City Bell (1896)', '2015-01-20', 'La Plata', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(300, 'PREITI', ' VERONICA', 'Nacional', '107206', '2017-04-10 16:08:54', 3, 'HOSP HOUSSAY', 'HOSPITAL', 'MNAKATSUNO', 'veronicapreiti@hotmail.com', '1536153837', '45123720', '', 'Santa Fe 421', '0000-00-00', 'San Isidro', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(301, 'QUIROGA', ' LUIS', 'Provincial', '440038', '2017-01-03 16:43:30', 10, 'HOSPITAL DR CHURRUCA VISCA', 'HOSPITAL', 'AGONZALEZ', 'luisquiroga47@hotmail.com', '155137-3850', '', '', 'Uspalla 3200', '0000-00-00', 'caba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(302, 'RABINOVICH', ' OSCAR', 'Nacional', '52542', '2015-08-27 08:49:10', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'AGONZALEZ', 'oscarrabinovich@yahoo.com.ar', '4076-8883', '4304-1081', '', 'Pedriel 74', '2015-08-24', '', 'Staff Medico', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(303, 'REY', ' IRENE', 'Nacional', '61752', '2015-08-11 15:11:48', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'MNAKATSUNO', 'irenerey@fibertel.com.ar', '1550943195', '', '', 'Jose P. Varela 3736', '0000-00-00', 'Capital Federal', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(304, 'RIVA', ' JORGE', 'Nacional', '29857', '2011-10-18 10:22:35', 3, 'HOSPITAL DR PEDRO FIORITO', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(305, 'RIVA', ' MARIA ELISA', 'Provincial', '19158', '2016-04-29 16:01:58', 3, 'HOSPITAL GENERAL SAN MARTIN LP', 'HOSPITAL', 'MNAKATSUNO', 'meriva@netverk.com.ar', '0221-155249999', '0221-4251717', '6 Enero', '1 y 69 subsuelo ', '0000-00-00', 'La Plata', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(306, 'RIVA', 'NATALIA', 'Nacional', '1', '2012-01-26 15:40:28', 5, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', 290, '0000-00-00 00:00:00', ''),
	(307, 'RUBBO', ' SANDRA', 'Provincial', '113796', '2014-05-19 16:55:27', 3, 'HOSPITAL SAN ROQUE', 'HOSPITAL', 'AGONZALEZ', '', '0221 4840290', '', '', 'gonnet 508 entre 19 y 20', '2014-04-07', 'la plata', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(308, 'SABA', ' SILVIA', 'Provincial', '16658', '2011-11-03 16:38:53', 3, 'HOSPITAL DR RODOLFO ROSSI', 'HOSPITAL', 'YAREVALO', 'sabasilvia@hotmail.com', '(0221)156014326', '(0221)4257226', '22 Febrero', '37 Nº 183', '2008-08-27', 'La Plata', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(309, 'SCHIME', ' PABLO', 'Nacional', '120167', '2014-09-18 15:25:52', 8, 'CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'pabloschime@hotmail.com', '', '', '', 'balcarse 351', '2014-08-29', '', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(310, 'SCHUTZ', ' NATALIA', 'Nacional', '101858', '2015-11-26 11:35:59', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'FCASTRO', 'natyschÛtz@yahoo.com.ar', '1562028478', '', '2 Abril', 'Gascon 450', '0000-00-00', 'Capital Federal', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(311, 'SCOLES', ' ALBA GRACIELA', 'Nacional', '73729', '2011-11-03 14:02:13', 3, 'HOSPITAL FRANCES', 'HOSPITAL', 'YAREVALO', 'gracielascoles@yahoo.com.ar', '1551369949', '', '14 Julio', 'La Rioja 951', '2008-11-13', 'Capital Federal', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(312, 'SHANLEY', ' CLAUDIA', 'Nacional', '57956', '2011-11-03 11:56:20', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'YAREVALO', 'claudiashanley@fibertel.com.ar', '4304-0241', '', '10 Octubre', 'Pedriel 74', '2008-08-15', 'Buenos Aires', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(313, 'STEMMELIN', ' GERMAN', 'Nacional', '69770', '2011-10-18 11:20:24', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'YAREVALO', '', '', '', '', '', '2019-06-07', '', 'Hematológa/o', 'Activo', '', 19, '2019-06-07', NULL, '0000-00-00 00:00:00', ''),
	(314, 'TITTARELLI', ' MARCELA', 'Provincial', '16503', '2011-10-18 11:33:35', 3, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(315, 'VARELA', ' ANA', 'Nacional', '101936', '2013-05-14 14:26:59', 3, 'Sanatorio Las lomas', 'HOSPITAL', 'AGONZALEZ', '', '155332-4743', '', '', 'Diego Carman 555, San isidro', '2013-04-29', 'Pcia bs as', 'MD Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(316, 'VASSALLU', 'VASSALLO PATRICIA', 'Nacional', '75263', '2011-11-02 11:50:29', 3, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', 'trizia@arnet.com.ar', '1544201744', '', '21 Enero', 'Combatientes de Malvinas 3150', '2008-07-30', 'Buenos Aires', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(317, 'VAZQUEZ', ' VICENTE', 'Nacional', '79037', '2017-06-27 15:37:50', 8, 'HOSPITAL SAN JUAN DE DIOS', 'HOSPITAL', 'MNAKATSUNO', 'quezet@yahoo.com.ar', '3932-4669 o 4959-6100 int 8396', '4959-6100 int 8297', '', 'Ardoino 714, Ramos mejia', '0000-00-00', 'PCIA DE BS AS', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(318, 'VIZHÑAY', ' JACQUELINE', 'Nacional', '93801', '2017-01-24 10:27:06', 4, 'TRASPLANTE HOSP. CLINICAS', 'CONSULTORIO', 'MARRUZAZABALA', 'jacqueline99@hotmail.com', '1534757671', '', '0000-00-00', 'Belgrano 2199', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(319, 'VUKOVIC', 'GONZALEZ  MATIAS', 'Nacional', '105767', '2011-11-02 09:56:51', 3, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', 'matiasvukovic@hotmail.com', '0221-4233659', '', '', 'Calchaqui 5401', '0000-00-00', 'La Plata', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(320, 'WATMAN', ' NORA', 'Nacional', '58286', '2017-01-24 14:45:14', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'FCASTRO', 'npwatman@yahoo.com.ar', '4127-0272', '4956-2118', '0000-00-00', 'Capital Federal', '2017-01-02', 'Argentina', 'MD', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(321, 'WILSON', ' RICARDO', 'Nacional', '50529', '2017-01-24 10:31:10', 4, 'PAROISSIEN', 'CONSULTORIO', 'MARRUZAZABALA', 'ricardowilson@gmail.com', '1541954052', '', '31/01', 'Hipolito Irigoyen 3366', '0000-00-00', 'Lomas de Zamora', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(322, 'YANTORNO', ' SEBASTIAN', 'Provincial', '114197', '2012-05-11 16:15:37', 3, 'HOSPITAL ITALIANO LP', 'HOSPITAL', 'MNAKATSUNO', 'sebastianyantorno@gmail.com', '542214535000', '', '0000-00-00', 'calle 53 e 29 y 30 ', '2008-05-12', 'La Plata', 'MD', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(323, 'ZANI', ' CECILIA', 'Nacional', '104307', '2012-01-26 15:44:56', 8, 'HOSPITAL INTERZONAL AGUDOS EVITA (LANUS)', 'HOSPITAL', 'MSADOUET', 'ceciliazani@hotmail.com', '1551798280', '', '19/06', '', '0000-00-00', '', 'Hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(324, 'ZARATE', ' TAMARA', 'Nacional', '116853', '2017-01-03 16:45:22', 10, 'HOSPITAL DR CHURRUCA VISCA', 'HOSPITAL', 'AGONZALEZ', 'tamarazarate@hotmail.com', '1555691798', '', '1980-07-30', 'Urquiza 609', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(325, 'ZIMERMAN', ' JULIANA', 'Nacional', '114692', '2017-01-23 10:57:27', 8, 'HOSPITAL DR ANGEL ROFFO', 'HOSPITAL', 'MARRUZAZABALA', 'julianazimerman@hotmail.com', '1551040209', '', '6 Diciembre', 'Gascon 450', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(326, 'ZOPEGNO', ' LUCIA', 'Provincial', '16091', '2011-11-02 10:34:00', 3, 'HOSPITAL GENERAL SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'hemato_sm@yahoo.com.ar', '0221-4251717', '0221-4251717', '0000-00-00', '1 y 69 subsuelo ', '2008-02-18', 'La Plata', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(327, 'ALCARAZ', ' SUSANA', 'Nacional', '64985', '2015-09-28 09:51:28', 10, 'HOSPITAL MUNIC DE ONC MARIE CURIE', 'HOSPITAL', 'AGONZALEZ', 'sbalcaraz@hotmail.com', '64828264', '', '', 'Patricias argentinas 750', '2010-05-15', 'Caba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(328, 'ALFONSO', ' GRACIELA', 'Nacional', '61033', '2016-06-01 09:48:18', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'AGONZALEZ', 'galfonso@intramed.net.ar', '1551022045', '44699204', '', 'Illia 999', '2016-05-09', 'Haedo, buenos aires', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-08-24', NULL, '0000-00-00 00:00:00', ''),
	(329, 'ANNETTA', ' ISABEL', 'Nacional', '54453', '2015-09-28 09:54:23', 10, 'Hospital Municipal M Curie', 'HOSPITAL', 'AGONZALEZ', 'iannetta@fibertel.com.ar', '4982-1731 O 41583900', '', '', 'Patricias Argentinas 750', '0000-00-00', 'CABA', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(330, 'ARGENTIERI', ' DANIEL', 'Provincial', '19438', '2015-06-19 15:41:53', 4, 'JUNIN SANATORIO JUNIN', 'CONSULTORIO', 'AGONZALEZ', 'dlargentieri@yahoo.com.ar', '0236215643311 / 02364444601', '', '', 'Francia 59', '2015-06-17', 'Junin', 'Hematológa/o', 'Activo', 'eala', 19, '2020-03-05', NULL, '2018-10-23 12:24:32', ''),
	(331, 'PAVLOVSKY', ' ASTRID', 'Nacional', '96947', '2017-04-10 16:07:07', 3, 'FUNDALEU', 'INSTITUCION', 'MNAKATSUNO', 'astridp@intramed.net', '4821-2802', '4821-2802', '16/04', '', '0000-00-00', 'Buenos Aires', 'Hematola', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(332, 'AVILA', ' GRACIELA', 'Nacional', '60458', '2014-11-28 08:29:03', 8, 'HOSPITAL DR SANTOJANNI', 'HOSPITAL', 'AGONZALEZ', 'santojani_hematologia@yahoo.com.ar', '49694218', '', '', 'Pilar 950', '2014-11-27', '', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(333, 'BANCHIERI', ' ALEJANDRA', 'Nacional', '92729', '2017-01-24 10:27:36', 4, 'TRASPLANTE HOSP. CLINICAS', 'HOSPITAL', 'MARRUZAZABALA', 'alebanchieri@yahoo.com.ar', '5950-9009/9005 x la mañana', '1554681242 0 1549808942', '13/12', 'Cordoba 2351', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(334, 'BARAZZUTI', ' LUCIA', 'Nacional', '47679', '2014-07-31 16:51:55', 4, 'CONSULTORIOS CORDOBA', 'CONSULTORIO', 'AGONZALEZ', 'cehematologicos@yahoo.com.ar', '011-4963-0120', '011-48630120', '', 'Cordoba 3515 8ºA', '2014-07-17', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(335, 'BARROS', ' CARLOS ALBERTO', 'Nacional', '20145', '2014-12-22 14:07:31', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'GPARDO', '', '49517871', '', '', 'Uriburu 692', '2010-03-08', 'Capital Federal', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(336, 'BARROSO', ' ALEJANDRA', 'Nacional', '104313', '2013-06-28 10:20:17', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MSADOUET', 'alejaleja46@yahoo.com.ar', '1530091306', '', '', '', '0000-00-00', 'General Rodriguez', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(337, 'BELIGOY', ' MARCELA', 'Provincial', '3799', '2014-01-17 09:56:44', 3, 'POSADAS CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'medigos@yahoo.com.ar', '4805-5759', '', '', 'Pacheco de Melo3081', '2014-01-06', 'POSADAS', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(338, 'BENZADON', ' RICARDO', 'Nacional', '47121', '2011-11-09 09:35:24', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'hematologiabenzadon@fibertel.com.ar', '4822-5781', '4822-5781', '', 'Santa Fe 2036', '2008-05-12', 'Capital Federal', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(339, 'BERNARD', ' HAYDEE', 'Nacional', '103035', '2017-01-19 10:30:26', 3, 'POSADAS HOSP RAMON MADARIAGA', 'HOSPITAL', 'MARRUZAZABALA', 'haydeebernard@yahoo.com.ar', '03752-440540', '', '', '', '0000-00-00', 'Posadas-Misiones ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(340, 'BEZARES', ' FERNANDO RAIMUNDO', 'Nacional', '38925', '2017-01-23 10:47:59', 8, 'HOSPITAL ALVAREZ', 'HOSPITAL', 'MARRUZAZABALA', '', '46116666', '', '', 'Humahuaca 311 3C', '0000-00-00', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(341, 'BONACORSO', ' SILVINA', 'Nacional', '85154', '2011-10-26 09:14:49', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'silvinabonaccorso@yahoo.com.ar', '4804-0486', '', '', '', '2009-04-23', 'Argentina', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(342, 'BOUBETA', ' HECTOR', 'Nacional', '54621', '2016-06-01 09:47:13', 8, 'POLICLINICO BANCARIO', '', 'AGONZALEZ', '', '45868888', '', '', 'gaona 2197', '2016-06-01', 'caba', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(343, 'BROSKY', 'BRODSKY ANDRES', 'Nacional', '70879', '2015-01-22 12:30:46', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'AGONZALEZ', 'albrodsky@yahoo.com.ar', '5950-8492', '5950-8754', '', 'Cordoba 2351', '2015-01-08', 'Buenos Aires', 'Hematologo ', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(344, 'BURGOS', ' RUBEN', 'Nacional', '89103', '2017-01-11 12:54:59', 1, 'NEUQUEN CONSULTORIO', 'INSTITUCION', 'MARRUZAZABALA', 'rburgos@afleming.com.ar', '54011 6323 2930', '54011 6323 2930', '', 'Cramer 1180', '0000-00-00', 'Capital Federal', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(345, 'CABREJO', ' MARIA', 'Nacional', '80767', '2012-07-31 11:02:20', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', '', 'AGONZALEZ', 'mariacabrejo@fibertel.com.ar', '45662217/1565083012', '', '16/9', '', '2009-09-28', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(346, 'CACHIONE', ' ROBERTO', 'Nacional', '32356', '2011-11-09 09:36:10', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(347, 'CAFFARO', ' MARIA JULIA', 'Nacional', '97597', '2017-04-10 15:47:25', 10, 'HOSPITAL DR ANGEL ROFFO', 'HOSPITAL', 'MNAKATSUNO', 'caffaromj@hotmail.com', '1564245526', '45802800', '', 'San martin 5481', '2010-03-10', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(348, 'CALAHONRRA', ' RAFAEL', 'Nacional', '30955', '2011-10-31 10:48:19', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'CONSULTORIO', 'YAREVALO', '', '5950-8759', '5950-8759', '', 'Cordoba 2351', '2008-05-08', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(349, 'CAPPELLINO', ' ALFREDO', 'Nacional', '91469', '2012-08-01 14:16:14', 4, 'CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'acappellino@yahoo.com.ar', '1549175229', '', '', '', '2008-10-30', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(350, 'CARBIA', ' CARLOS', 'Nacional', '71467', '2011-11-07 16:34:22', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'carloscarbia@fullzero.com.ar', '4544-8576', '', '', 'Monroe 3619 1*6', '2008-05-08', 'Buenos Aires', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(351, 'CARVANI', ' ANALIA', 'Nacional', '52436', '2017-01-24 10:23:18', 4, 'PAROISSIEN', 'CONSULTORIO', 'MARRUZAZABALA', 'acarvani@hotmail.com', '1532023486', '48326468', '', 'Beruti 3657, 8ºA CABA', '0000-00-00', 'Capital Federal', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(353, 'CHEMES', ' JORGE', 'Nacional', '92605', '2012-09-14 09:51:47', 4, 'CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(354, 'CHIAPPE', ' GUSTAVO', 'Nacional', '37633', '2012-01-26 15:08:23', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(355, 'COLIMODIO', ' RUBEN', 'Provincial', '15489', '2012-11-23 10:55:32', 8, 'MERCEDES CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'recolimodio2@yahoo.com', '02324-433538', '', '30 Abril', '', '0000-00-00', 'MERCEDES', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(356, 'CONTI', ' RAFAEL', 'Nacional', '110415', '2017-04-11 16:10:00', 5, 'ALEXANDER FLEMING', 'INSTITUCION', 'GPARDO', 'rafaelconti34@gmail.com', '011-6323-2900', '', '22 Julio', 'Av. Cramer1180', '0000-00-00', '', 'MD ', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(357, 'CORZO', ' ARIEL', 'Nacional', '104686', '2011-11-08 09:19:32', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'corzoar@hotmail.com', '5950-8760', '5950-8754', '2 Junio', 'Cordoba 2351', '2008-05-08', 'Buenos Aires ', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(358, 'CUGLIARA', 'CUGLIARI MARIA SILVANA', 'Nacional', '97449', '2015-03-10 11:10:59', 8, 'HOSPITAL DR ANGEL ROFFO', 'HOSPITAL', 'FCASTRO', 'dracugliari@ciudad.com.ar', '5411-4580-2800 int 246', '5411-4432-7452', '', 'Avda. San Martín 5481', '2015-03-10', 'Capital Federal', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(359, 'CULARIATI', 'CULACIATI AIDA', 'Nacional', '61635', '2013-10-16 14:58:59', 4, 'JUNIN CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'maritahematologia@hotmail.com', '02362-15535373', '02362431985', '', '', '2013-10-01', 'Junin', 'Hematológa/o', 'Activo', 'eala', 19, '2019-02-19', NULL, '2018-10-23 12:24:32', ''),
	(360, 'CURUTCHET RAGUSIN', ' MARIA DEL CARMEN', 'Nacional', '38186', '2012-05-04 09:42:22', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'MSADOUET', 'divhematologia@hospitaldeclinicas.uba.ar', '5950-8754', '5950-8754', '20  Abril', 'Cordoba 2351', '2008-05-08', 'Buenos Aires ', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(361, 'D ANTONIO', ' CLAUDIO', 'Nacional', '66747', '2017-04-10 15:52:14', 8, 'SAN CAMILO', 'INSTITUCION', 'MNAKATSUNO', 'ccdantonio@yahoo.com.ar', '4571-0905//1544236366', '', '27 Agosto', 'Angel gallardo 899', '2018-12-10', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-12-12', NULL, '2018-10-23 12:24:32', ''),
	(362, 'DAMIANI', ' GERMAN', 'Nacional', '102944', '2015-06-22 16:24:37', 8, '', '', 'AGONZALEZ', '', '4611-6666 int2276', '', '', 'aranguren 2701', '2015-06-11', 'caba', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(363, 'DE STEFANO', ' GISELDA', 'Nacional', '94885', '2013-10-03 10:42:43', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'CONSULTORIO', 'AGONZALEZ', 'porto@arnet.com.ar', '5411-4580-2800 int 246', '5411-4432-7452', '20 Febrero', 'Avda. San Martín 5481', '2013-09-12', 'Capital Federal', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(364, 'DELIA', ' ANDREA', 'Provincial', '4799', '2017-01-19 10:29:52', 3, 'POSADAS HOSP RAMON MADARIAGA', 'HOSPITAL', 'MARRUZAZABALA', '', '3764217520', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(365, 'DEVECCHI', ' CARMEN', 'Provincial', '1277', '2017-01-19 10:17:30', 3, 'POSADAS CONSULTORIO', 'HOSPITAL', 'MARRUZAZABALA', 'amaliadevecchi@hotmail.com', '03752-15606139', '', '', '22 de diciembre 3257', '0000-00-00', 'Posadas-Misiones ', 'Hematologa', 'Activo', 'Activo', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(366, 'DIAZ', ' ALICIA', 'Nacional', '57664', '2017-01-23 10:47:48', 8, 'HOSPITAL ALVAREZ', 'HOSPITAL', 'MARRUZAZABALA', '', '46116666/1561611536', '', '', '', '0000-00-00', 'Capital Federal', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(367, 'DOMINGUEZ', ' ROBERTO', 'Nacional', '61271', '2011-10-14 16:51:24', 4, 'HOSPITAL EVA PERON (CASTEX)', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(368, 'DRAGOSKY', ' MARTA', 'Nacional', '27411', '2017-01-09 10:48:59', 8, 'HOSPITAL MUNIC DE ONC MARIE CURIE', 'HOSPITAL', 'AGONZALEZ', 'marta@dragosky.com.ar', '4864-0709', '48640709', '', 'Patricias argentinas 750', '2016-11-17', 'Caba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(369, 'DUARTE', ' PATRICIO', 'Nacional', '97608', '2011-11-09 09:37:02', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'pduarte@cemic.edu.ar', '4546-8285', '4546-8285', '9 Octubre', 'Galván 4102', '2008-05-02', 'Capital Federal', 'Hematologo Oncólogo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(370, 'DUFOUR', ' CLAUDIO', 'Nacional', '70466', '2012-09-14 10:55:50', 8, 'HOSPITAL NAVAL DR PEDRO MALLO', 'HOSPITAL', 'AGONZALEZ', 'claudiodufour@yahoo.com.ar', '41035300 int. 5446///1544004148', '4103-5300 int. 5387', '', 'P. ARGENTINAS 351', '2011-05-12', 'CABA', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(371, 'DUPONT', ' JUAN', 'Nacional', '43980', '2017-01-09 11:54:52', 3, 'CENTRO CEMIC', 'INSTITUCION', 'AGONZALEZ', 'jcdupont@yahoo.com', '4546-8285', '4546-8285', '17 Diciembre', 'Galván 4102', '2016-11-17', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(372, 'DUPONT', ' LAURA', 'Nacional', '113769', '2011-10-14 16:43:08', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(373, 'EGOZCUE', ' JOSE', 'Nacional', '40738', '2011-11-09 09:38:08', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'josecveaintovca.com.ar', '48133311', '4546-8285', '8 Agosto', 'Uruguay 1280', '2008-05-02', 'Capital Federal', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(374, 'FERNANDEZ', ' ISOLDA', 'Nacional', '69088', '2017-04-10 15:55:10', 3, 'FUNDALEU', 'SANATORIO', 'MNAKATSUNO', 'ifernandez@fundaleu.org.ar', '5411-4877-1000', '5411-4877-1000', '', 'Uriburu 1450 ', '0000-00-00', 'Capital Federal', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(375, 'FERNANDEZ', ' JOSE', 'Nacional', '48795', '2011-11-09 09:39:47', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'pepefernandezgrande@yahoo.com/ docfernandez@hotmail.com', '1545346155', '', '27 Marzo', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(376, 'FERRO', ' HUGO', 'Nacional', '680800', '2015-09-28 09:43:32', 4, 'CONSULTORIOS CORDOBA', 'CONSULTORIO', 'AGONZALEZ', 'hhferro@gmail.com', '4963-0120', '4963-0120', '', 'Cordoba 3515 8ºA', '0000-00-00', 'CABA', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(377, 'FLORES', ' MARIA GABRIELA', 'Nacional', '51965', '2015-08-11 14:54:17', 10, 'HOSPITAL DR CARLOS DURAND', 'HOSPITAL', 'MNAKATSUNO', 'mariagabyflores@gmail.com', '1558423100', '', '5 Diciembre', 'Diaz Velez 5044', '0000-00-00', 'Buenos Aires', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(378, 'FONCUBERTA', ' MARIA CECILIA', 'Nacional', '69815', '2017-04-10 15:56:59', 10, 'ALEXANDER FLEMING', 'INSTITUCION', 'MNAKATSUNO', 'cfoncuberta@fleming.com.ar', '54011 6323 2930', '54011 6323 2930', '9 Septiembre', 'Cramer 1180', '0000-00-00', 'Capital Federal', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(379, 'FREITAS', ' MARIA', 'Nacional', '110503', '2017-01-03 16:43:06', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'AGONZALEZ', 'mjosefinafreitas@hotmail.com', '4469-9300 int. 11114', '', '', 'Marconi e Illia s/n', '0000-00-00', 'Argentina', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(380, 'GAITE', ' ADRIANA', 'Nacional', '71953', '2012-01-26 15:14:02', 5, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', '', '1550451511', '', '9 Febrero', 'Diaz velez 5044', '2008-08-12', 'Buenos aires', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(381, 'GAITE', ' ANA', 'Nacional', '123631', '2017-04-10 15:58:18', 4, 'JUJUY', 'SANATORIO', 'MNAKATSUNO', 'anagaite@tutopia.com', '(0388)154047742', '', '19 Septiembre', 'Pte uriburu 1450', '2018-10-30', 'Jujuy', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-11-05', NULL, '0000-00-00 00:00:00', ''),
	(382, 'GARAY GUY', ' EFRAIN', 'Nacional', '35483', '2011-11-09 09:40:18', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'guygaray@yahoo.com', '5411-4772-9082', '5411-4772-9082', '7 Diciembre', 'Galván 41402', '2008-01-23', 'Capital Federal', 'Medico', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(383, 'GIGLIONE', ' ADRIANA', 'Nacional', '72378', '2012-01-26 15:15:36', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(384, 'GOMEZ', ' MARIELA', 'Nacional', '117429', '2013-03-13 16:44:46', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'AGONZALEZ', 'marielafgomez@gmail.com', '5950-8700 / 1559564531', '', '26 Noviembre', 'Cordoba 2351', '2008-05-08', 'Buenos Aires', 'Residente', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(385, 'GONZALEZ', ' JACQUELINE', 'Nacional', '95207', '2015-08-11 14:57:40', 10, 'hospital dr carlos durand', 'CONSULTORIO', 'MNAKATSUNO', 'gonzalezjacqui@yahoo.com.ar', '1557007279', '', '', 'Condarco 1434', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(386, 'GOTTA', ' DANIEL', 'Nacional', '114223', '2012-09-11 08:18:54', 3, 'CENTRO CEMIC', 'INSTITUCION', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(387, 'FERNANDEZ GRECCO', ' HORACIO', 'Nacional', '84947', '2017-01-23 10:44:16', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'INSTITUCION', 'MARRUZAZABALA', 'horaciogrecco@hotmail.com', '4902-7347', '', '', '', '0000-00-00', '', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(388, 'GUAZZARONI', ' CARLA', 'Nacional', '87693', '2012-09-12 09:49:40', 8, 'CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'guazzaroni@yahoo.com', '1541486839', '', '', 'Pilar 950, hta santojanni', '2017-09-22', 'Capital', 'Hematológa/o', 'Activo', 'jkiprizlian', 19, '2017-11-01', NULL, '0000-00-00 00:00:00', ''),
	(389, 'HUBER', ' MARINA', 'Nacional', '110456', '2011-11-09 09:42:42', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'maruhuber@yahoo.com.ar', '1550405090', '4546-8285', '', 'Galván 4102', '2008-05-02', 'Capital Federal', 'Fellow Hematología', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(390, 'IASTREBNER', ' MARCELO', 'Nacional', '72192', '2017-01-24 10:23:49', 4, 'Sagrado Corazón', 'CONSULTORIO', 'MARRUZAZABALA', 'miastrebner@gmail.com', '5411-1549916300', '5411-4784 4153', '28 Noviembre', 'San Martin de Tours 2980 4°', '0000-00-00', 'Capital Federal', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(391, 'JOZAMI', ' CECILIA', 'Nacional', '119226', '2017-05-19 14:19:37', 10, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'FCASTRO', 'ceciliajozami@hotmail.com', '5950-8769', '59508754', '', 'Cordoba 2351', '2017-05-19', 'Buenos aires ', 'Hematológa/o', 'Activo', 'jkiprizlian', 19, '2018-07-11', NULL, '0000-00-00 00:00:00', ''),
	(392, 'KANTOR', ' GUSTAVO', 'Nacional', '84844', '2017-03-01 14:57:51', 10, 'HOSPITAL DR CARLOS DURAND', 'HOSPITAL', 'AGONZALEZ', 'glkantor@yahoo.com', '1559549029', '', '13 Agosto', 'Diaz velez 5044', '2017-02-10', 'Buenos aires', 'Hematológa/o', 'Activo', 'eala', 19, '2019-01-21', NULL, '2018-10-23 12:24:32', ''),
	(393, 'KIRCHUK', ' RICARDO', 'Nacional', '57991', '2014-06-17 08:37:03', 8, 'CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'rkirchuk@osde.com.ar', '1550503531', '', '22 Enero', 'Capital Federal', '2014-06-03', 'Buenos Aires', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(394, 'KORIN', ' JORGE', 'Nacional', '41891', '2012-07-17 10:18:53', 4, 'CONSULTORIOS CORDOBA', 'CONSULTORIO', 'MNAKATSUNO', 'korin@connmed.com.ar', '49630120', '49630120', '', '', '2009-02-06', '', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(395, 'KORNBLIHTT', ' LAURA', 'Nacional', '74774', '2011-11-07 15:12:27', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'laruko@hotmail.com', '5950-8760', '5950-8754', '3 Mayo', 'Cordoba 2351', '2008-05-08', 'Buenos Aires', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(396, 'LAMAACHIA', ' NORBERTO', 'Nacional', '47063', '2011-10-31 17:20:39', 4, 'HOSPITAL EVA PERON (CASTEX)', 'HOSPITAL', 'YAREVALO', 'norbertohlamacchia@hotmail.com', '4503-5923', '4503-5923', '', '', '2009-12-11', 'Capital Federal', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(397, 'LEONE', ' GRACIELA', 'Nacional', '49602', '2012-01-26 15:21:18', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', 'graceleone@yahoo.com', '4630-5793', '', '', 'Pilar 950', '2010-02-24', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(398, 'LONGONI', ' HECTOR', 'Nacional', '62399', '2017-01-24 10:27:22', 4, 'TRASPLANTE HOSP. CLINICAS', 'HOSPITAL', 'MARRUZAZABALA', 'hlongoni@fibertel.com.ar', '5950-9004', '5950-9002', '25 Marzo', 'Cordoba 2351', '0000-00-00', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(399, 'LONGORDO', ' FLAVIA', 'Nacional', '80159', '2017-04-10 16:02:22', 4, 'HOSP. RIVADAVIA', 'HOSPITAL', 'MNAKATSUNO', 'flongordo@yahoo.com.ar', '46116666', '1545332320', '', 'Aranguren 2701', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(400, 'LOZA', ' OMAR JAVIER', 'Nacional', '95623', '2012-08-08 16:27:36', 4, 'HOSPITAL EVA PERON (CASTEX)', 'HOSPITAL', 'AGONZALEZ', 'osloza@yahoo.com.ar', '1551017310', '', '', 'Balcarce 900', '2009-10-27', '', 'Hematologo ', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(401, 'LUCHETTA', ' GRACIELA', 'Nacional', '63075', '2017-01-09 10:48:30', 8, 'HOSPITAL MUNIC DE ONCE MARIE CURIE', 'HOSPITAL', 'AGONZALEZ', 'patricialuchetta@fibertel.com.ar', '1544149248', '', '18Octubre', 'Newbery 1880 7a', '2018-12-10', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-12-12', NULL, '2018-10-23 12:24:32', ''),
	(402, 'MARIANI', ' LUCIO', 'Provincial', '2899', '2012-05-02 09:23:22', 3, 'Misiones', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'Misiones', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(403, 'MARIN', ' CARLOS', 'Nacional', '44311', '2012-01-03 13:19:23', 5, 'POLICLINICO BANCARIO', 'HOSPITAL', 'MNAKATSUNO', 'sycmarin@yahoo.com.ar', '4586-8888', '', '', 'Gaona 2197', '2008-11-25', 'Capital federal', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(404, 'MARQUEZ', ' MARISA', 'Nacional', '69745', '2015-08-11 15:04:19', 10, 'HOSPITAL MUNIC DE ONC MARIE CURIE', 'CONSULTORIO', 'MNAKATSUNO', 'hemotologia@fibertel.com.ar', '4825-0373', '', '15 Noviembre', '', '0000-00-00', '', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(405, 'MARTINEZ', ' JULIANA', 'Nacional', '71419', '2013-02-06 15:21:26', 5, 'FUNDALEU', 'SANATORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(406, 'MELILLO', ' LUCIANA', 'Provincial', '4219', '2012-05-02 09:57:19', 8, '', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(407, 'MILONE', ' GUSTAVO', 'Nacional', '17974', '2017-04-10 16:04:03', 10, 'CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gmilone@fundaleu.org.ar', '54-11-48771050', '54-11-48771000', '18 Agosto', 'Uriburu 1450 ', '0000-00-00', 'Capital Federal', 'Hematologo ', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(408, 'MINISSALE', ' CLELIA', 'Nacional', '70090', '2011-10-25 13:33:27', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', 'dihematologia@hospitaldeclinicas.uba.ar', '5950-8754', '5950-8754', '', 'Cordoba 2351', '2008-05-08', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(409, 'MURILLO', ' IGNACIO', 'Nacional', '111697', '2013-04-22 09:47:24', 5, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'HOSPITAL', 'AGONZALEZ', 'nachomurillo@speedy.com.ar', '1551251466', '', '8 Diciembre', 'Av. cordoba2351', '2010-01-01', 'Capital federal', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(410, 'MUROLO', ' PATRICIA', 'Nacional', '68146', '2012-09-03 08:52:55', 8, 'HOSPITAL GENERAL RODRIGUEZ', 'CONSULTORIO', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(411, 'OCHOA', ' PAOLA', 'Nacional', '109031', '2017-04-10 16:06:09', 10, 'ALEXANDER FLEMING', 'INSTITUCION', 'MNAKATSUNO', 'ochoa-paola@hotmail.com', '5950-8760//15582765', '5950-8754', '18/01', 'Cordoba 2351', '0000-00-00', 'Buenos Aires ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(412, 'OLIVEIRA', ' NATALIA', 'Nacional', '114774', '2015-08-11 15:07:39', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'nata_oliveira@hotmail.com', '1563780232', '', '', 'Lezcano 3460', '0000-00-00', 'Haedo', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(413, 'OTHACEHE', ' MARCELA', 'Provincial', '61661', '2016-12-21 12:10:07', 4, 'JUNIN CONSULTORIO', 'CONSULTORIO', 'FCASTRO', 'marielaothacehe@yahoo.com.ar', '0236215645583', '', '28 Marzo', 'Lebenshon 31', '2019-06-06', 'Junin', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-06-06', NULL, '2018-11-10 23:50:00', ''),
	(414, 'PANTANO', ' JORGE', 'Nacional', '85946', '2012-01-03 14:49:23', 8, 'HOSPITAL DR TEODORO ALVAREZ', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(415, 'PAVLOVSKY', ' CAROLINA', 'Nacional', '93882', '2015-09-10 10:42:53', 5, 'FUNDALEU', 'SANATORIO', 'FCASTRO', 'cpavlovsky@fundaleu.org.ar', '4877-1000', '5411-4877-1000', '', 'Uriburu 1520', '0000-00-00', 'Capital Federal', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(416, 'PAVLOVSKY', ' MIGUEL', 'Nacional', '82212', '2017-04-10 16:07:26', 3, 'CENTRO PAVLOVSKY', 'SANATORIO', 'MNAKATSUNO', 'mapav@chp.com.ar', '(5411) 4821-4222', '54148212802', '2 Mayo', 'Junin 1284', '2018-11-10', 'Capital federal', 'Hematológa/o', 'Activo', 'gpardo', 19, '2018-12-18', NULL, '0000-00-00 00:00:00', ''),
	(417, 'PIACQUADIO', 'PIALQUADIE EMMA', 'Nacional', '48458', '2015-08-11 15:10:16', 5, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'ecpiac@hotmail.com', '4469-9204', '', '', '', '2008-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(418, 'PICON', ' ARMANDO', 'Nacional', '40466', '2015-08-11 15:10:23', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(419, 'PINTOS', ' NOEMI EDIT', 'Nacional', '101462', '2015-02-26 10:20:12', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'CONSULTORIO', 'AGONZALEZ', 'noemipintos@yahoo.com.ar', '1535706839', '4831-0409', '14 Noviembre', 'Avellaneda 551', '2015-02-20', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(420, 'PIROTTAUCHA', ' ENRIQUE', 'Nacional', '22110', '2011-10-18 09:39:19', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(421, 'PIZARRO', ' CRISTINA', 'Nacional', '41756', '2011-11-04 10:38:30', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'YAREVALO', '', '5950-8754', '', '', '', '2008-05-08', 'Buenos Aires', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(422, 'PUENTE', ' DOLORES', 'Nacional', '80793', '2015-12-04 13:56:48', 10, 'FUNDACION FAVALORO', 'INSTITUCION', 'AGONZALEZ', 'DPPE@HOTMAIL.COM; dpuente@ffavaloro.org', '1551785470', '4378-1200 INT 4952', '', 'Belgrano 1746', '2015-12-04', 'CABA', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(423, 'RAMIREZ', ' MARIO', 'Nacional', '78661', '2015-08-11 15:11:11', 1, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'ramirezmariocesar@hotmail.com', '4586-0969', '', '', 'D. alvarez 936 12g', '2018-09-10', 'Capital federal', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-07-11', NULL, '2018-10-31 23:50:00', ''),
	(424, 'REMAGGI', ' GUILLERMINA', 'Nacional', '99408', '2013-05-16 09:41:40', 3, 'FUNDALEU', 'CONSULTORIO', 'JGALLINA', 'gremaggi@fundaleu.org.ar', '5411-4877-1000', '54114877', '8 Enero', 'Uriburu 1450 ', '2008-04-14', 'Capital federal', 'Onco-hematóloga/o', 'Activo', 'agonzalez', 19, '2018-09-14', NULL, '0000-00-00 00:00:00', ''),
	(425, 'RICHIERI', ' CECILIA', 'Nacional', '75283', '2015-08-11 15:11:58', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'mcricchieri@intramed.net.ar', '1559828104', '', '1 Octubre', 'Puente Illia s/n y Marconi', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(426, 'RIERA', ' LEANDRO', 'Nacional', '48122', '2011-11-09 09:43:05', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'lriera@cemic.edu.ar', '4546-8280', '4546-8280', '19 Noviembre', 'Galvan 4102, Cap.', '2009-12-20', 'Buenos Aires ', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(427, 'RIVEROS', ' DARDO', 'Nacional', '38530', '2012-07-24 15:35:39', 3, 'CENTRO CEMIC', 'INSTITUCION', 'AGONZALEZ', 'driveros@cemic.edu.ar', '4546-8285', '4546-8285', '4 Septiembre', 'Galván 4102', '2008-05-02', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(428, 'ROBINSON', ' ANIBAL', 'Nacional', '42091', '2012-01-26 15:40:54', 5, 'HOSPITAL NAVAL DR PEDRO MALLO', 'HOSPITAL', 'MSADOUET', '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(429, 'ROJAS', ' FRANCISCA', 'Nacional', '90648', '2017-08-07 14:48:42', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'FCASTRO', 'francaroja@hotmail.com', '5950-8760', '5950-8754', '', 'Cordoba 2351', '2017-01-05', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(430, 'ROSALES OSTRIS', ' MARIA', 'Nacional', '110780', '2017-01-24 10:28:05', 4, 'TRASPLANTE HOSP. CLINICAS', 'HOSPITAL', 'MARRUZAZABALA', 'belenortiz@yahoo.com.ar', '5950-8760-5950-9005', '5950-8754', '29 Marzo', 'Cordoba 2351', '0000-00-00', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(431, 'ROSENFELD', ' ESTER', 'Nacional', '55749', '2016-11-17 09:46:31', 5, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'FCASTRO', 'esterrosenfeld@gmail.com', '1549753281', '47879027', '', 'Marconi e illia s/n', '2016-11-03', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(432, 'RUDOY', 'DOBRENKY DE  SILVIA', 'Nacional', '23950', '2017-06-30 08:54:34', 4, 'CONSULTORIO', 'CONSULTORIO', 'GPARDO', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(433, 'SACKMAN MASSA', ' FEDERICO', 'Nacional', '99921', '2017-04-10 16:11:31', 3, 'FUNDALEU', 'INSTITUCION', 'MNAKATSUNO', 'fsackmann@fundaleu.org.ar', '4877-1000', '4877-1000', '22 Julio', 'Uriburu 1450 ', '0000-00-00', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(434, 'SANCHEZ AVALOS', ' JULIO CESAR', 'Nacional', '21593', '2017-04-10 16:12:19', 10, 'ALEXANDER FLEMING', 'INSTITUCION', 'MNAKATSUNO', 'jcsanchezavalos@yahoo.com.ar', '54011 6323 2930', '54011 6323 2930', '', 'Cramer 1180', '0000-00-00', 'Capital Federal', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(435, 'SANGUINETTI', ' ELIZABETH', 'Nacional', '82078', '2014-11-28 08:29:25', 8, 'HOSPITAL DR SANTOJANNI', 'HOSPITAL', 'AGONZALEZ', 'santojanny_hematologia@yahoo.com.ar', '1568089365 o 49694218', '', '', 'Pilar 950', '2014-11-27', '', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(436, 'SARACUT', ' DIANA', 'Nacional', '36948', '2011-10-18 11:01:51', 4, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(437, 'SAVIGNANO', ' RAFAEL', 'Nacional', '82910', '2012-05-02 09:23:55', 2, '', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(438, 'SOLIMANO', ' JORGE', 'Nacional', '85314', '2011-11-09 09:44:23', 3, 'CENTRO CEMIC', 'INSTITUCION', 'YAREVALO', 'jsolimano@hotmail.com', '5411-4546-8230', '5411-4546-8230', '', 'Galvan 4102', '2008-01-18', 'Capital Federal', 'Medico', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(439, 'SPIONE', ' LILIANA', 'Nacional', '61589', '2011-10-18 11:19:26', 4, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(440, 'STAROSTA', ' AIDA', 'Nacional', '44078', '2015-08-11 15:13:55', 10, 'HOSPITAL DR CARLOS DURAND', 'HOSPITAL', 'MNAKATSUNO', 'STAROSTA@FIBERTEL.COM.AR', '4637-6467', '', '', 'Av. San Pedrito 140 2ºB', '0000-00-00', 'Buenos Aires', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(441, 'TAMASHIRO', ' MONICA', 'Nacional', '88812', '2017-01-24 10:24:01', 4, 'Sagrado Corazón', 'CONSULTORIO', 'MARRUZAZABALA', 'monicatomashino@yahoo.com.ar', '4796-7221', '4797-6694', '', 'Hipolito Irigoyen 1757', '0000-00-00', 'Vicente Lopez', 'MD', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(442, 'TARTAS', ' NORMA', 'Nacional', '33039', '2017-04-10 16:16:26', 10, 'ALEXANDER FLEMING', 'INSTITUCION', 'MNAKATSUNO', 'ntartas@fibertel.com.ar', '3221-8900 o 3221-8999', '63232933', '', 'Cramer 1180', '2018-04-04', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-04-04', NULL, '0000-00-00 00:00:00', ''),
	(443, 'VENTRIGLIA', ' VERONICA', 'Nacional', '100855', '2015-08-11 15:14:36', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'veroventrigli@hotmail.com', '4469-9204', '', '', '', '2018-11-23', '', 'Hematológa/o', 'Activo', 'eala', 19, '2018-12-18', NULL, '2018-12-17 23:50:00', ''),
	(444, 'VERON', ' DAVID', 'Nacional', '111856', '2015-08-11 15:14:44', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'davidadveronhem@gmail.com', '1561283834', '', '', 'pringles 878, san miguel', '0000-00-00', 'pcia de bs as', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(445, 'VERRI', ' VERONICA', 'Nacional', '95165', '2017-04-10 16:17:14', 8, 'HOSPITAL DR CARLOS DURAND', 'HOSPITAL', 'MNAKATSUNO', 'veroverri@yahoo.com.ar', '4553-2106', '4958-2134', '', 'Ambrosetti 743', '0000-00-00', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(446, 'VILLALBA', ' DANIEL', 'Provincial', '113455', '2016-07-19 16:20:29', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'AGONZALEZ', 'jdcvillalba@hotmail.com', '4653-1061 int 166', '', '', 'yrigoyen 1702', '2016-07-19', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(447, 'VITRIU', ' ADRIANA', 'Nacional', '110526', '2017-04-10 16:18:42', 10, 'ALEXANDER FLEMING', 'INSTITUCION', 'MNAKATSUNO', 'adrivitriv@gmail.com', '43710341', '', '0000-00-00', 'Pedriel 74', '0000-00-00', 'Buenos Aires', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(448, 'XAVIER', ' DAVID', 'Nacional', '52942', '2017-01-23 10:39:46', 8, 'MONTE GRANDE CONSULTORIO', 'CONSULTORIO', 'MARRUZAZABALA', 'xavierhematol@yahoo.com.ar', '4290-3883', '4290-3883', '21 septiembre', 'Av. Cordoba 2351', '0000-00-00', '', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(449, 'ZERGA', ' MARTA', 'Nacional', '64629', '2012-01-26 15:45:16', 8, 'HOSPITAL DR ANGEL ROFFO', 'CONSULTORIO', 'MSADOUET', 'melizerga@hotmail.com', '5411-4580-2800 int 246', '5411-4432-7452', '25 Septiembre', 'Avda. San Martín 5481', '2008-01-25', 'Capital Federal', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(450, 'AGUIRRE', ' RICARDO M.', 'Provincial', '1621', '2016-03-10 16:09:44', 4, 'CONSULTORIO SALTA', 'CONSULTORIO', 'MNAKATSUNO', 'aguirrericardo@arnet.com.ar', '0387-4392867/4224433', '03874212084', '', 'A. guemes 328', '2008-08-01', 'Salta', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(451, 'AHUALLI', ' JAVIER', 'Provincial', '6544', '2015-08-25 13:31:19', 10, '', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(452, 'AMERIO', ' FRANCISCO MARCOS', 'Provincial', '636', '2012-11-23 10:16:26', 6, '', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(453, 'AMIRI', ' RUBEN', 'Provincial', '978', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(454, 'ANDRADA', ' ANTONIO ALBERTO', 'Provincial', '5827', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(455, 'ANDRADA', ' MARINA', 'Provincial', '1333', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(456, 'ANDRADA', ' SERGIO LEONARDO', 'Provincial', '1252', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(457, 'ANTONI', ' LUIS', 'Provincial', '652', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(458, 'ARANDA', ' DANIEL', 'Provincial', '1083', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(459, 'ARCURI', ' JORGE', 'Provincial', '7239', '2015-09-28 10:01:48', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'jraarcuri@hotmail.com', '', '', '', 'Balcarse 579', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(460, 'ARRIETA LIZONDO', ' JOSE', 'Provincial', '6436', '2011-11-09 10:37:13', 9, '', '', 'YAREVALO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(461, 'ARROYO', 'GERARDO FRANCISCO', 'Provincial', '3370', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', 324, '0000-00-00 00:00:00', ''),
	(462, 'ATTAR', ' JOSE', 'Provincial', '5960', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(463, 'AVIGNONE', ' MARTA', 'Provincial', '2005', '2015-08-11 14:39:04', 10, 'TUCUMAN HOSPITAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(464, 'BACCINO', ' ELIO', 'Provincial', '2721', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(465, 'BALCAZAR REA', ' JOSE FRANCISCO', 'Provincial', '3266', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(466, 'BARBIERI', ' GABRIEL', 'Provincial', '2440', '2015-09-28 10:07:39', 10, 'CONSULTORIO santiago del estero', 'CONSULTORIO', 'AGONZALEZ', 'gabarbieri@yahoo.com', '', '', '', 'salta 278', '0000-00-00', 'santiago del estero', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(467, 'BARRAZA', ' TERESA D.CARMEN', 'Provincial', '5479', '2017-01-09 09:58:29', 10, 'TUCUMAN HOSPITAL ANGEL PADILLA', 'HOSPITAL', 'AGONZALEZ', 'tbarraza@live.com.ar', '0381-156516258', '', '', 'alberdi 550', '0000-00-00', 'TUCUMAN', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(468, 'BASBUS', ' CLAUDIO', 'Provincial', '2290', '2015-09-28 10:10:03', 10, 'CONSULTORIO santiago del estero', 'CONSULTORIO', 'AGONZALEZ', '', '', '', '', 'sata 278', '0000-00-00', 'santiago del estero', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(469, 'BAZANO', ' RICARDO', 'Provincial', '814', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(470, 'BENDEK', ' GEORGINA', 'Provincial', '7765', '2015-09-28 10:12:12', 10, 'hospital italiano', 'HOSPITAL', 'AGONZALEZ', 'gbendek89@yahoo.com.ar', '', '', '', 'gascon 450', '2010-04-26', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(471, 'BERLINGHIERI', 'BERLINGIERI GRACIELA SUSANA', 'Provincial', '2111', '2017-04-11 16:09:42', 5, 'CONSULTORIO jujuy', 'CONSULTORIO', 'GPARDO', 'armandoberese@arnet.com.ar', '0388-6867270', '', '', 'Ramirez de Velazco 447', '0000-00-00', 'S. S. De Jujuy', 'Oncologia clinica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(472, 'BONACINA', ' AMALIA', 'Provincial', '4335', '2016-03-18 15:41:27', 4, 'CONSULTORIO salta', 'CONSULTORIO', 'MNAKATSUNO', 'info@massaltasalud.com.ar', '0387 4311977', '', '', 'Buenos Aires 196', '0000-00-00', 'Salta', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(473, 'BUSTOS', ' MARCELA', 'Provincial', '2026', '2015-08-11 14:45:10', 10, 'TUCUMAN HOSPITAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(474, 'CAMPOS', 'PATRICIA', 'Provincial', '1', '2015-08-11 14:45:55', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'dracampos@arnet', '0381154124802', '038114217570', '', 'Santiago 746', '0000-00-00', 'Tucumán', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', 0, '0000-00-00 00:00:00', ''),
	(475, 'CANCINOS', ' JUAN CARLOS', 'Provincial', '3027', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(476, 'CENICE', ' FERNANDO', 'Provincial', '4017', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(477, 'CHAVANNE', ' JORGE G.', 'Provincial', '2341', '2015-08-11 14:47:41', 10, 'TUCUMANCONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(478, 'CHUCHUY', ' CESAR A.', 'Provincial', '3457', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(479, 'CIMA', ' LUCIANO', 'Provincial', '4557', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(480, 'COHEN', ' IMACH DANIEL', 'Provincial', '2', '2015-08-11 14:48:37', 10, 'CONSULTORIO TUCUMAN', 'CONSULTORIO', 'MNAKATSUNO', 'dcimach@yahoo.com.ar', '54-381-4217570', '543814217570', '6 Octubre', 'Santiago 746', '2010-02-02', 'Tucumán', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(481, 'CONTRERAS', ' OSCAR', 'Provincial', '776', '2016-03-18 15:44:20', 9, 'HOSPITAL CATAMARCA', 'HOSPITAL', 'MNAKATSUNO', 'oacont@yahoo.com.ar', '0383315549940', '', '', 'CaSEROS 220', '0000-00-00', 'CATAMARCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(482, 'CUTRONA CASTRO', ' ANTONIO', 'Provincial', '321', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(483, 'DE GREGORIO', ' LAURA', 'Provincial', '2638', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(484, 'DE LA ARENA', ' HERNAN', 'Provincial', '3332', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(485, 'DIAZ', ' RAUL', 'Provincial', '2313', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(486, 'FERNANDEZ', ' ALBERTO N.', 'Provincial', '3502', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(487, 'FERNANDEZ ROZAS', ' RAFAEL F.', 'Provincial', '2696', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(488, 'FIGUEROA', ' ELIZABETH', 'Provincial', '304', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(489, 'FLORES', ' ALBERTO', 'Provincial', '832', '2015-08-11 14:53:50', 10, '', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(490, 'FLORES', ' DAVID HUGO', 'Provincial', '2963', '2015-08-11 14:54:06', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(491, 'GARAY', ' RENE', 'Provincial', '2227', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(492, 'GIRAUDO', ' NESTOR', 'Provincial', '518', '2015-08-11 14:56:50', 10, 'CONSULTORIO tucuman', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(493, 'GIRAUDO', ' VANINA', 'Provincial', '1906', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(494, 'GODOY', ' JAVIER ALEJANDRO', 'Provincial', '6054', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(495, 'GONZA', ' OSCAR DANIEL', 'Provincial', '5573', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(496, 'GONZALEZ', ' VICTOR HUGO', 'Provincial', '593', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(497, 'GOYA', ' SELYU', 'Provincial', '1892', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(498, 'GUCHEA', ' CARLOS', 'Provincial', '467', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(499, 'GUERRERO', ' MARIA VIRGINIA', 'Provincial', '1455', '2015-08-11 14:58:11', 10, 'CONSULTORIO TUCUMAN', 'CONSULTORIO', 'MNAKATSUNO', 'muguerrero@hotmail.com', '0381-4216045', '', '25 Diciembre', 'EEUU 31 1ºA', '0000-00-00', 'Tucuman', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(500, 'IBAEZ', 'IBAÑEZ MAITE', 'Provincial', '1445', '2017-07-26 11:15:50', 9, 'NUEVO HOSP. SAN JUAN BAUTISTA CATAMARCA', 'HOSPITAL', 'AGONZALEZ', 'maitemi@arnet.com.ar', '03834540942', '', '28 Noviembre', '', '2017-06-06', 'CATAMARCA', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(501, 'ITUARTE', ' ANA CAROLINA', 'Provincial', '2535', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(502, 'JOSE', ' RODOLFO', 'Provincial', '2167', '2011-10-17 12:04:30', 6, 'HOSPITAL PABLO SORIA', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(503, 'JUAREZ AVIGNONE', ' ANA SOLEDAD', 'Provincial', '7566', '2015-09-28 10:02:47', 10, 'TUCUMAN HOSPITAL CTRO SAL ZENON SANTILLAN', 'HOSPITAL', 'AGONZALEZ', 'juarezavignoneana@yahoo.com.ar ', '0381-4235115', '', '', 'Hungria 750', '0000-00-00', 'TUCUMAN', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(504, 'JURE', ' SERGIO', 'Provincial', '1254', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(505, 'KAEN', ' LUIS', 'Provincial', '809', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(506, 'KOLTON', ' BENEDICTO', 'Nacional', '1753', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(507, 'LOPEZ', ' RAUL E', 'Provincial', '3071', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(508, 'LOPEZ', ' ILEANA', 'Nacional', '5213', '2017-04-10 16:02:38', 8, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'CONSULTORIO', 'MNAKATSUNO', 'ileanarlopez@arnet.com.ar', '1537428361', '', '25 Junio', '', '2019-05-21', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-05-21', NULL, '2018-10-23 12:24:32', ''),
	(509, 'LUNA', ' PATRICIA', 'Provincial', '2101', '2015-08-11 15:01:42', 10, 'TUCUMAN HOSPITAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(510, 'MAGNI', ' RAUL ALBERTO', 'Provincial', '3122', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(511, 'MAJEK', ' ELENA', 'Provincial', '1723', '2011-10-17 14:56:45', 6, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(512, 'MALDONADO', ' DANIEL', 'Provincial', '1163', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(513, 'MASSUERO', ' OSCAR', 'Provincial', '1866', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(514, 'MEDICI', ' HUGO ENRIQUE', 'Provincial', '1825', '2015-08-11 15:04:55', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(515, 'MEDICI', ' HUGO ENRIQUE', 'Provincial', '1825', '2015-08-11 15:05:04', 10, 'CONSULTORIO tucuman', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(516, 'MEDINA', ' CARLOS', 'Provincial', '2594', '2015-08-11 15:05:12', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(517, 'MEDINA', ' LUIS', 'Provincial', '4940', '2012-07-18 10:51:55', 6, 'CONSULTORIO tucuman', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(518, 'MEDINA', ' LUISA SUSANA', 'Provincial', '7099', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(519, 'MEDINA AIMALE', ' MARCELO', 'Provincial', '4468', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(520, 'MILITELLO', ' JOSE', 'Provincial', '4230', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(521, 'MILLITELLO', ' ANDRES', 'Provincial', '516', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(522, 'MITRE MUOZ', ' WALTHER', 'Provincial', '1084', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(523, 'MOISES', ' JOSE MIGUEL', 'Provincial', '6290', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(524, 'MOISES', ' MIGUEL (H)', 'Provincial', '3970', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(525, 'NARANJO', ' INDIRA VERONICA', 'Provincial', '3306', '2016-04-29 15:59:42', 4, 'CONSULTORIO salta', 'CONSULTORIO', 'MNAKATSUNO', 'veda@intramed.net', '0387-4399343', '', '', 'puyrredon 1674', '0000-00-00', 'Salta', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(526, 'NAVARRO MIGUES', ' GRACIELA', 'Provincial', '2928', '2017-01-16 15:58:05', 5, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gnavami3@hotmail.com', '0381-4350331', '', '', '', '2011-01-03', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(527, 'NAZAR', ' EDUARDO ENRIQUE', 'Provincial', '805', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(528, 'OJEA', ' FABIOLA MARIA DE LOS ANGE', 'Provincial', '2959', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(529, 'OLIVERO', ' OSCAR', 'Provincial', '1097', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(530, 'PALAZZO', ' CARLOS', 'Provincial', '6221', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(531, 'PALAZZO', ' FELIPE', 'Provincial', '5852', '2017-01-09 09:57:06', 5, '', 'HOSPITAL', 'AGONZALEZ', 'fpalazzo98@hotmail.com', '0381 154018300', '', '', 'Av sarmiento 157', '2016-12-19', 'Tucuman', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(532, 'PALAZZO', ' JORGE', 'Provincial', '6772', '2015-08-11 15:08:38', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(533, 'PEDRUZZI', ' RUBEN', 'Provincial', '5214', '2015-08-11 15:09:27', 10, 'TUCUMAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(534, 'PENIDA', ' ALFREDO', 'Provincial', '2176', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(535, 'PEREGRIN', ' ISABEL', 'Provincial', '476', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(536, 'PERTINE', ' BASILIO', 'Provincial', '3820', '2016-04-29 16:00:00', 4, 'CONSULTORIO salta', 'CONSULTORIO', 'MNAKATSUNO', 'basiolip@swissmedical.com', '0387-4213049', '', '4 Junio', '20 de febrero 474', '0000-00-00', 'SALTA', 'hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(537, 'POLITI', ' HECTOR', 'Provincial', '2151', '2011-10-18 09:43:07', 6, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(538, 'QUINTEROS', ' ROSANA VALERIA DEL S', 'Provincial', '2838', '2015-08-11 15:10:59', 5, 'CONSULTORIO SALTA', 'CONSULTORIO', 'MNAKATSUNO', 'dra_quinteros@hotmail.com', '54-387-155099652', '54-387-4218472', '17 Junio', 'Sarmiento 771', '0000-00-00', 'Salta', 'Medica Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(539, 'RASGIDO', ' RICARDO', 'Provincial', '2853', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(540, 'REICHEL', ' PAOLA', 'Provincial', '2088', '2015-12-22 09:12:46', 10, 'CONSULTORIO SANTIAGO DEL ESTERO', 'CONSULTORIO', 'MNAKATSUNO', 'paoreichel72@hotmail.com', '0385-4211889', '3854211889', '', 'Saenz peña 340', '2019-01-23', 'Santiago del estero', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-01-23', NULL, '0000-00-00 00:00:00', ''),
	(541, 'RISCALA', ' CARLOS', 'Provincial', '5812', '2017-01-09 10:46:05', 10, 'TUCUMAN HOSPITAL CTRO SAL ZENON SANTILLAN', 'HOSPITAL', 'AGONZALEZ', 'carlosriscala@yahoo.com', '0381-5980374', '', '', '', '2016-12-19', 'TUCUMAN', 'oncohematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(542, 'RUIZ', ' ALBA', 'Provincial', '424', '2017-01-16 16:03:57', 10, 'SANTIAGO DEL ESTERO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'ruizalba39@gmail.com', '0385-4227185', '', '7 Mayo', '25 de mayo 425', '2018-01-15', 'Santiago del estero', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-16', NULL, '0000-00-00 00:00:00', ''),
	(543, 'SAENZ', ' JUAN ALBERTO', 'Provincial', '1545', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(544, 'SALAZAR', ' GUSTAVO ENRIQUE', 'Provincial', '2503', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(545, 'SALVATIERRA', ' ALEJANDRO', 'Provincial', '3119', '2011-11-03 15:51:20', 6, '', '', 'YAREVALO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(546, 'SALVATIERRA', ' LINO', 'Provincial', '1623', '2017-04-10 16:12:04', 4, 'JUJUY CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'JUJUY', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(547, 'TABOADA', ' RAMIRO', 'Provincial', '6691', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(548, 'TERRAZAS', ' CARLOS', 'Provincial', '2372', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(549, 'TORINO', ' ADOLFO', 'Provincial', '1045', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(550, 'VACA', ' MARIA VALERIA', 'Provincial', '3427', '2013-04-16 08:38:04', 4, 'SANATORIO NRA SRA ROSARIO', 'SANATORIO', 'AGONZALEZ', 'valeriavaca@hotmail.com', '0388 1558444976 O 0388-4241856', '', '', 'Belgrano 340 , san salvador jujuy', '2018-05-16', 'Jujuy', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-05-16', NULL, '0000-00-00 00:00:00', ''),
	(551, 'VEGA SAUER', ' CRISTIAN', 'Provincial', '3017', '2017-04-10 16:17:00', 4, 'JUJUY', 'INSTITUCION', 'MNAKATSUNO', 'cristianvega@hotmail.com', '0388154100098', '', '4 julio', 'Oscar Orias 56', '0000-00-00', 'JUJUY', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(552, 'VEGLIA', ' FRANCISCO', 'Provincial', '1843', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(553, 'VIANI', ' JOSE NICOLAS', 'Provincial', '3363', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(554, 'VILLAGRA', ' NOEMI', 'Provincial', '572', '2012-11-23 12:04:42', 6, 'CATAMARCA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CATAMARCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(555, 'ZARBA', ' JUAN JOSE', 'Provincial', '4045', '2011-10-17 16:43:49', 6, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(556, 'ZELAYA', ' RICARDO', 'Provincial', '1739', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(557, 'ZENTILLI', ' SANDRA', 'Provincial', '2944', '2011-07-11 14:54:16', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(558, 'ABERASTAIN', ' ANA', 'Provincial', '6078', '2017-08-02 10:58:58', 9, 'HOSPITAL EL CARMEN', 'HOSPITAL', 'GPARDO', 'ana.aberastain@gmail.com', '0261-155949623', '', '', 'Joaquin v gonzalez 209, godoy cruz', '2016-12-15', 'Mendoza', 'Hematológa/o', 'Activo', 'eala', 19, '2019-10-25', NULL, '2018-10-23 12:24:32', ''),
	(559, 'ALBARRACIN', ' FLAVIO', 'Provincial', '7272', '2014-01-02 11:04:59', 9, 'CONSULTORIO MENDOZA', 'CONSULTORIO', 'AGONZALEZ', 'albarracin1974@hotmail.com', '0261-6011894 o 0261-4288140', '', '', 'Rodriguez 280', '2017-03-20', 'Mendoza', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-08-24', NULL, '2018-10-23 12:24:32', ''),
	(560, 'ALONSO', ' MARTIN', 'Provincial', '18999', '2017-02-23 11:01:34', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'GPARDO', 'martinalonso63@hotmail.com', '0351-15-5524748', '', '', 'Naciones unidas 346', '2016-12-19', ' cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-08-24', NULL, '0000-00-00 00:00:00', ''),
	(561, 'ALUME', ' JACOB', 'Provincial', '6749', '2017-01-11 16:50:18', 9, 'MENDOZA HOSPITAL EL CARMEN', 'HOSPITAL', 'MARRUZAZABALA', 'a_recalde@hotmail.com', '0261-153454961', '', '', 'Ayacucho 108 pb depto 7', '2016-01-21', 'Mendoza', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(562, 'ARBESU', ' GUILLERMO', 'Provincial', '1224', '2014-08-25 09:04:12', 9, 'MENDOZA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'garbesu@hotmail.com', '54261-4390268', '54261-4298010', '0000-00-00', 'Napoles 1131', '2014-08-12', 'Mendoza', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(563, 'ARRIETA', ' MARIA E', 'Provincial', '2415', '2011-10-13 11:59:18', 9, 'HOSPITAL GUILLERMO RAWSON', 'HOSPITAL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(564, 'BAENA TERAN', ' ROCIO', 'Provincial', '33756', '2012-11-23 10:23:06', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(565, 'BASQUIERA', ' ANA LISA', 'Provincial', '13509', '2012-11-23 10:25:29', 10, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'MNAKATSUNO', 'abasquiera@hospitalprivadosa.com.ar', '0351-468-8243', '03514688263', '', 'Naciones unidas 346', '2008-05-29', ' cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-10', NULL, '0000-00-00 00:00:00', ''),
	(566, 'BERRETA', ' ADRIANA', 'Provincial', '13385', '2012-11-23 10:29:44', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(567, 'BOVE', ' VICTOR', 'Provincial', '12287', '2012-11-23 10:32:11', 9, 'CORDOBA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'drbove@arnet.com.ar', '3584644755', '3584649189', '', 'Pedernera 50', '2008-12-12', ' Cordoba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(568, 'BRAXS', ' CECILIA', 'Provincial', '16157', '2017-01-11 16:52:11', 9, 'CORDOBA CLINICA REINA FABIOLA', 'CONSULTORIO', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(569, 'CAEIRO', ' GASTON', 'Provincial', '26623', '2016-06-08 08:39:53', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'GPARDO', 'gaston75caeiro@hotmail.com', '0351 4688200', '', '', 'naciones unidas 346 2 piso', '0000-00-00', 'CORDOBA', 'hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(570, 'CALVO', ' KARINA', 'Provincial', '7899', '2012-11-23 10:48:24', 9, 'MENDOZA HOSPITAL PEDIATRICO NOTTI', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MENDOZA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(571, 'CANONICO', ' VIRGINIA', 'Provincial', '2186', '2014-04-25 16:11:49', 9, 'SAN JUAN HOSPITAL GUILLERMO RAWSON', 'HOSPITAL', 'AGONZALEZ', 'virgicanonico@hotmail.com', '0264-156729510', '0264-4229780', '', 'Guemes 170 Sur', '2014-04-07', 'San Juan', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(572, 'CARRIZO BECERRA', ' MARTIN', 'Provincial', '33691', '2015-01-12 15:42:09', 9, 'HOSPITAL RAWSON SAN JUAN', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'SAN JUAN', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(573, 'CASTILLO', ' MARCIA', 'Provincial', '9300', '2012-11-23 10:50:54', 9, 'MENDOZA HOSPITAL PEDIATRICO NOTTI', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MENDOZA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(574, 'CLOSA', ' CECILIA', 'Provincial', '21904', '2012-11-23 10:54:22', 9, 'CORDOBA HOSPITAL NIÑOS SANTISIMA TRINIDAD', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(575, 'COBOS', ' ALEJANDRA DELMA', 'Provincial', '18291', '2012-11-23 10:54:39', 9, 'CORDOBA HOSPITAL NACIONAL DE CLINICAS', 'HOSPITAL', 'MNAKATSUNO', 'alejandradcobos@gmail.com', '156370969', '', '', 'Santa rosa 1564', '2018-05-09', 'Cordoba', 'Médica/o', 'Activo', 'agonzalez', 19, '2018-06-15', NULL, '0000-00-00 00:00:00', ''),
	(576, 'DE GOYCOECHEA', ' DIEGO', 'Provincial', '30555', '2012-11-23 10:58:10', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(577, 'DE LEON', ' ANDRES', 'Provincial', '18230', '2012-11-23 10:58:25', 9, 'CORDOBA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '2010-07-02', ' Cordoba', 'Oncologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(578, 'DUBERSARSKY', ' CLAUDIO', 'Provincial', '26587', '2012-11-23 11:01:26', 9, 'CORDOBA SANATORIO ALLENDE', 'SANATORIO', 'MNAKATSUNO', '', '(0351)4269275', '(0351) 4269275', '', 'H Yrigoyen 284', '2009-01-16', ' Cordoba', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(579, 'ENGROBA', ' ANTONIO', 'Provincial', '22397', '2012-11-23 11:02:03', 9, 'RIO CUARTO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'RIO CUARTO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(580, 'FAROLLCH', ' CARINA', 'Provincial', '24578', '2012-11-23 11:02:35', 9, 'CORDOBA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(581, 'FAUQUE', ' MARIA EUGENIA', 'Provincial', '7900', '2017-01-11 17:42:40', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MARRUZAZABALA', 'maeugeniafauque@yahoo.com.ar', '0261-4490659', '', '', '', '0000-00-00', 'Mendoza', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(582, 'FERRERO', ' MARIA CECILIA', 'Provincial', '34320', '2012-11-23 11:04:48', 9, 'CORDOBA HOSPITAL CORDOBA', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(583, 'FLORES DUTRUS', ' VIVIANA', 'Provincial', '27342', '2012-11-23 11:09:36', 9, 'CORDOBA SANATORIO DEL SALVADOR', 'SANATORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(584, 'FRAGAPANE', ' PATRICIA', 'Provincial', '5627', '2017-01-11 17:41:51', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MARRUZAZABALA', 'patriciafragapane@ciudad.com.ar', '0261-155392291', '', '21 Mayo', 'Juan J Castelli 697', '0000-00-00', 'Mendoza', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(585, 'GALLO', ' MONICA', 'Provincial', '16182', '2011-10-17 10:46:04', 9, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(586, 'GARCIA', ' DE LABANCA ANA', 'Provincial', '3713', '2013-12-13 12:03:41', 9, 'MENDOZA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', '', '0261-4442674', '', '', 'dALVIAN MANZANA 42 CASA 8', '2013-11-30', 'MENDOZA', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(587, 'GARCIA', ' JUAN JOSE', 'Provincial', '13509', '2012-11-23 11:12:28', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'MNAKATSUNO', 'jgarcia@hospitalprivadosa.com.ar', '0351-468-8243', '0351-468-8263', '', 'Naciones Unidas 346', '2008-05-25', ' Cordoba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(588, 'GARCIA', ' PABLO', 'Provincial', '31298', '2017-01-09 09:53:16', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'AGONZALEZ', 'pabloandrea.garcia@hospitalprivado.com.ar', '0351-152336953', '', '', 'Naciones unidas 346', '2016-12-07', 'Cordoba', 'Hematológa/o', 'Activo', 'eala', 19, '2018-12-12', NULL, '2018-10-24 08:42:42', ''),
	(589, 'GIANNINI', ' ELVIRA', 'Provincial', '8100', '2017-01-11 17:43:19', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MARRUZAZABALA', 'megianini@gmail.com', '0261-154603959', '', '2Abril', '', '0000-00-00', 'MENDOZA', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(590, 'GIL', ' MARIANA', 'Provincial', '30460', '2017-03-29 10:32:00', 9, 'CORDOBA HOSPITAL SAN ROQUE', 'HOSPITAL', 'AGONZALEZ', 'MGIL80@HOTMAIL.COM', '0351-152500777', '', '', 'BAJADA PUCCARA 1900', '2017-01-03', 'CORDOBA ', 'hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(591, 'GIORDANO', ' LAURA', 'Provincial', '6776', '2017-01-11 17:04:13', 9, 'MENDOZA HOSP LAGOMAGGIORE', 'CONSULTORIO', 'MARRUZAZABALA', 'azzoni68@arnet.com.ar', '0261-4134668 o 0261-154678555', '', '', 'Timoteo Gordillo s/n', '0000-00-00', 'Mendoza', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(592, 'GOMEZ', ' GUSTAVO', 'Provincial', '17907', '2011-10-17 11:11:50', 9, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(593, 'GOMEZ', ' MARIA SILVINA', 'Provincial', '21359', '2012-11-23 11:16:24', 9, 'CORDOBA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(594, 'GOMEZ', ' MARIA SUSANA', 'Provincial', '2152', '2016-10-25 09:00:01', 9, 'SAN JUAN HOSPITAL GUILLERMO RAWSON', 'HOSPITAL', 'FCASTRO', 'msgomez@infovia.com.ar', '0264-4200013', '', '', 'Colon 1385', '2016-10-03', 'San Juan', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(595, 'GUANCHIALE', ' LUCIANA', 'Provincial', '28383', '2014-01-31 09:22:34', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'AGONZALEZ', '', '0351157405082', '', '', '', '2014-01-14', 'CORDOBA', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(596, 'GUTIERRES', 'GUTIERREZ VIVIANA', 'Provincial', '23807', '2013-07-16 17:04:04', 9, 'CORDOBA SANATORIO DEL SALVADOR', 'SANATORIO', 'AGONZALEZ', 'vbgutierrez@hotmail.com', '0351152 449780', '', '', 'gral deheza 542', '2013-07-08', 'CORDOBA', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(597, 'HELLER', ' VIVIANA', 'Provincial', '14636', '2017-01-11 16:55:36', 9, 'CORDOBA HOSP DE CLINICAS', 'CONSULTORIO', 'MARRUZAZABALA', 'vbheller@hotmail.com', '0351-155913618', '', '', 'Santa Rosa', '0000-00-00', 'CORDOBA', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(598, 'HOLMANN', ' CARLOS', 'Provincial', '26739', '2012-11-23 11:21:09', 9, 'CORDOBA HOSPITAL NIÑOS SANTISIMA TRINIDAD', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(599, 'JARCHUM', ' GUSTAVO', 'Nacional', '9123', '2014-07-17 09:42:04', 9, 'CORDOBA SANATORIO ALLENDE', 'SANATORIO', 'AGONZALEZ', 'gjarchum@sanatorioallende.com', '3514269275', '03514269275', '', 'Hipolito Yrigoyen 384', '2014-07-11', 'Cordoba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(600, 'JURI', ' MARIA LAURA', 'Provincial', '30198', '2013-04-04 10:56:52', 9, 'CORDOBA SANATORIO DEL SALVADOR', 'SANATORIO', 'MSADOUET', 'laurajuri@hotmail.com', '0351-153922393', '', '1979-07-21', 'Curie 1370', '2011-07-01', 'Cordoba Capital', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(601, 'LABANCA', ' VALENTIN', 'Provincial', '2413', '2012-11-23 11:23:59', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MNAKATSUNO', 'vlabanca@nysnet.com.ar', '54 261 4252575', '', '', 'Montecaseros 1020-mendoza 5500', '2008-05-05', 'Mendoza', 'MD', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(602, 'LAPLAGNE', ' ALFREDO', 'Provincial', '29430', '2012-11-28 16:20:27', 9, 'SAN JUAN CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'alfredojlaplagne@yahoo.com.ar', '0264-154460566', '0264-4223300', '', 'Catamarca 457', '2008-05-05', 'San Juan', 'Hematologo ', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(603, 'LAVARDA', ' MARCELO', 'Nacional', '1200', '2014-08-04 14:49:52', 9, 'CORDOBA SANATORIO ALLENDE', 'SANATORIO', 'AGONZALEZ', 'm.lavarda@SINECTIS.com.AR', '154-084512 03514084512', '', '', '', '2014-07-07', 'CORDOBA ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(604, 'LOPEZ', ' MARIA JOSE', 'Provincial', '31802', '2017-01-11 16:54:04', 9, 'CORDOBA CONSULTORIO', 'HOSPITAL', 'MARRUZAZABALA', 'majolo75@hotmail.com', '0351 153489505', '', '', 'pasaje pichincha 65 1 piso dpto c', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(605, 'LOPEZ GALLETTI', ' MARIA LAURA', 'Provincial', '32395', '2011-10-17 14:44:40', 9, 'HOSPITAL CORDOBA', 'HOSPITAL', 'YAREVALO', '', '', '', '', '', '2019-01-25', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-01-28', NULL, '0000-00-00 00:00:00', ''),
	(606, 'MARTIN', ' LAURA', 'Provincial', '8900', '2012-11-23 11:29:27', 9, 'MENDOZA HOSPITAL PEDIATRICO NOTTI', 'HOSPITAL', 'MNAKATSUNO', 'laurimartingil@yahoo.com', '0261-15059925', '', '26 Noviembre', '', '0000-00-00', 'MENDOZA ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(607, 'MASACHESSI', ' NOELIA', 'Provincial', '28712', '2017-01-11 16:57:39', 9, 'SAN LUIS CONSULTORIO', 'CONSULTORIO', 'MARRUZAZABALA', 'noemasa@yahoo.com.ar', '0351 156108715', '', '', 'Caidos en Malvinas 101', '0000-00-00', 'CORDOBA', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(608, 'MINOLDO', ' DANIEL', 'Provincial', '25678', '2016-09-08 11:40:14', 9, 'CORDOBA SANATORIO ALLENDE', 'SANATORIO', 'AGONZALEZ', '', '', '', '', '', '2016-09-07', 'CORDOBA ', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(609, 'MOLNAR', ' SOLEDAD', 'Provincial', '26681', '2017-01-11 16:52:48', 9, 'CORDOBA CLINICA REINA FABIOLA', 'SANATORIO', 'MARRUZAZABALA', 'soledadmolnar_1@hotmail.com', '0351-4269294//156327690', '', '', 'H. Yrigoyen 384', '0000-00-00', 'CORDOBA', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(610, 'MONTIVERO', ' ANA ROMINA', 'Provincial', '29762', '2014-04-08 16:03:03', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'AGONZALEZ', 'monti72003@yahoo.com.ar', '0351 4688200 o 0351 5412262', '', '', 'naciones unidas 346', '2014-04-07', 'CORDOBA', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(611, 'MORENO', ' ADRIANA', 'Provincial', '7624', '2017-04-20 14:12:03', 9, 'MENDOZA HOSP LAGOMAGGIORE', 'HOSPITAL', 'AGONZALEZ', 'adrym_c@yahoo.com.ar', '0261-922002', '', '', 'timometo cordillo sn', '2016-12-13', 'MENDOZA', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(612, 'MOSSO', ' MARCELO', 'Provincial', '8120', '2017-01-11 17:42:10', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MARRUZAZABALA', 'marcemosso@live.com.ar', '0261-155009803', '', '10 Junio', 'Alem 374', '0000-00-00', 'Mendoza', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(613, 'OSAY', ' LILIANA', 'Provincial', '5453', '2017-01-11 17:04:28', 9, 'MENDOZA HOSP LAGOMAGGIORE', 'CONSULTORIO', 'MARRUZAZABALA', 'pefjlgarro@ciudad.com.ar', '0261-154855402', '', '', 'Patricias Mendocinas 2603', '0000-00-00', 'Mendoza', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(614, 'RIBBA', ' FERNANDO', 'Provincial', '28458', '2017-01-11 17:00:51', 9, 'CORDOBA HOSPITAL ITALIANO', 'CONSULTORIO', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', 'CORDOBA ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(615, 'RIZZI', ' MARIA', 'Provincial', '1100', '2012-11-23 11:51:20', 9, 'CORDOBA SANATORIO ALLENDE', 'SANATORIO', 'MNAKATSUNO', 'mlaurarizzi@arnet.com.ar', '54-351-4269294', '54- 3514269277', '7 Octubre', 'Hipólito Irigoyen 384', '2008-03-26', 'Cordoba', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(616, 'ROSSI', ' BLANCA', 'Provincial', '21581', '2017-01-11 17:01:12', 9, 'CORDOBA HOSPITAL ITALIANO', 'HOSPITAL', 'MARRUZAZABALA', 'rossimili@hotmail.com', '0351-156322240', '', '', 'Roma 550', '0000-00-00', 'Cordoba Capital', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(617, 'RYSER', ' JOSE', 'Nacional', '28066', '2012-11-23 11:55:18', 9, 'CORDOBA SANATORIO DEL SALVADOR', 'SANATORIO', 'MNAKATSUNO', 'joseryser@hotmail.com', '0351-4803254', '', '28 Febrero', '27 de Abril 2982', '2008-03-26', ' Cordoba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(618, 'RYSER', ' OSVALDO', 'Provincial', '1773', '2012-11-23 11:55:25', 9, 'CORDOBA SANATORIO DEL SALVADOR', 'SANATORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(619, 'RYSER', ' RICARDO', 'Provincial', '18329', '2012-11-23 11:55:32', 9, 'CORDOBA SANATORIO DEL SALVADOR', 'SANATORIO', 'MNAKATSUNO', 'ricardoryser@hotmail.com', '0351-4803254', '', '', '27 de Abril 2982', '2008-05-29', 'Cordoba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(620, 'SALGUERO', ' MIRIAM', 'Nacional', '18907', '2014-01-08 16:30:18', 9, 'CORDOBA CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'mirisalguero@hotmail.com', '0351-156379419', '03514680700 int 401', '16 Junio', 'Naciones Unidas 984', '2013-12-20', ' Cordoba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(621, 'SALINAS', ' GRACIELA', 'Provincial', '4508', '2017-01-11 17:02:09', 9, 'MENDOZA HOSPITAL CENTRAL', 'CONSULTORIO', 'MARRUZAZABALA', 'gracielasalinas@arlinkbbt.com.ar', '0261-156510685', '0261-423635', '4 Enero', 'Las Heras 75', '0000-00-00', 'Mendoza', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(622, 'SALVANO', ' LUCIANO', 'Provincial', '27660', '2017-01-11 16:51:44', 9, 'CORDOBA CLINICA REINA FABIOLA', '', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', 'CORDOBA ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(623, 'SARKOTIC', ' EMILIO', 'Provincial', '5247', '2017-01-11 17:42:25', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MARRUZAZABALA', 'emiliosarkotic@hotmail.com', '0261-155406343', '', '27 Abril', '', '0000-00-00', 'MENDOZA', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(624, 'SEGGIARO', ' VICTORIA', 'Provincial', '32496', '2012-11-23 12:00:30', 9, 'CORDOBA HOSPITAL CORDOBA', 'HOSPITAL', 'MNAKATSUNO', 'victoriasegg@hotmail.com', '0351-155557237', '', '', '', '2018-05-17', 'Cordoba ', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-05-17', NULL, '0000-00-00 00:00:00', ''),
	(625, 'SENOCIAN', ' LORETO', 'Provincial', '8760', '2012-11-23 12:00:41', 9, 'MENDOZA HOSPITAL PEDIATRICO NOTTI', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MENDOZA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(626, 'STIVEL', ' MIRIAM', 'Provincial', '1259', '2012-11-23 12:01:29', 9, 'SAN JUAN HOSPITAL GUILLERMO RAWSON', 'HOSPITAL', 'MNAKATSUNO', 'mstivel@sinectis.com.ar', '0264-4210294', '02644223571', '4 julio', 'Pedro echague 175', '2008-05-05', 'San juan', 'Hematológa/o', 'Activo', 'eala', 19, '2018-12-04', NULL, '2018-12-03 23:50:00', ''),
	(627, 'STURICH', ' GABRIELA', 'Provincial', '23108', '2014-06-24 11:54:55', 9, 'CORDOBA HOSPITAL PRIVADO', 'HOSPITAL', 'AGONZALEZ', 'gabisturich@hotmail.com', '0351-4688263 o 156765752', '', '', 'naciones unidas 346', '2014-06-24', 'CORDOBA ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(628, 'TAVELLA', ' PATRICIA', 'Provincial', '22405', '2012-11-23 12:02:44', 9, 'CORDOBA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'patriciatavella@gmail.com', '', '', '', 'Naciones unidas 900', '2018-02-28', 'Cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-02-28', NULL, '0000-00-00 00:00:00', ''),
	(629, 'TEJADA MORDINI', ' JIMENA', 'Provincial', '30031', '2013-08-13 11:28:02', 5, 'CORDOBA HOSPITAL NACIONAL DE CLINICAS', 'HOSPITAL', 'AGONZALEZ', 'jimenatejadamordini@gmail.com', '0351155959739', '', '', 'Santa rosa 1564', '2013-08-07', 'Cordoba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(630, 'TORTOSA', ' SUSANA', 'Provincial', '5098', '2017-01-11 17:03:38', 9, 'SAN RAFAEL CONSULTORIO', 'CONSULTORIO', 'MARRUZAZABALA', '', '02627-423551', '', '14 Julio', 'Buenos Aires 54', '0000-00-00', 'Mendoza', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(631, 'UNANUE', ' CAROLINA', 'Provincial', '29051', '2017-01-11 16:57:07', 9, 'CORDOBA HOSPITAL PRIVADO', 'CONSULTORIO', 'MARRUZAZABALA', 'caro_unanue@yahoo.com.ar', '0353-154180927', '03534549030', '', 'La rioja 1212, villa maria', '2019-03-12', ' cordoba', 'Hematológa/o', 'Activo', 'eala', 19, '2019-03-12', NULL, '2018-10-23 12:24:32', ''),
	(632, 'VALLES', ' MARIA LOURDES', 'Provincial', '28225', '2017-01-11 17:01:25', 9, 'CORDOBA HOSPITAL ITALIANO', 'CONSULTORIO', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(633, 'VIANI', ' VIRGINIA', 'Nacional', '2580', '2012-11-23 12:05:04', 9, 'MENDOZA HOSPITAL EL CARMEN', 'HOSPITAL', 'MNAKATSUNO', 'sosa.patricia1@gmail.com', '02322-482000', '02322-482214', '6 Mayo', 'Pte Peron 1500', '2008-07-21', 'MENDOZA', 'Hematologa-oncologa-pediatra', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(634, 'VIUDEZ', ' MARIA LAURA', 'Provincial', '8000', '2017-01-11 17:41:36', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MARRUZAZABALA', 'mlviudez@hotmail.com', '0261-156099921', '', '0000-00-00', 'Mendoza', '0000-00-00', 'Argentina', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(635, 'WILLIAMS', ' MARIA ROSALBA', 'Provincial', '28015', '2013-07-26 10:25:18', 9, 'CORDOBA SANATORIO MAYO', 'CONSULTORIO', 'GPARDO', 'mariarw@hotmail.com', '4256402/155601567', '4256402', '', 'HUMBERTO PRIMO 520', '2013-07-11', 'CORDOBA', 'HEMATÓLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(636, 'SALUM', ' GUSTAVO FAVIAN', 'Provincial', '1644', '2012-11-23 11:56:50', 1, 'BAHIA BLANCA HOSPITAL ASOCIACION MEDICA', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'BAHIA BLANCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(637, 'SANABRIA', ' ALBA LIA.', 'Provincial', '91553', '2017-01-16 16:03:06', 1, 'MAR DEL PLATACONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'albasanabria@gmail.com', '0223-49580942', '', '4 Febrero', '', '0000-00-00', 'Mar del Plata', 'Oncohematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(638, 'SANTINI', ' FERNANDO', 'Provincial', '39875', '2012-11-23 11:57:59', 1, 'MAR DEL PLATA HOSPITAL PRIVADO DE COMUNIDAD', 'HOSPITAL', 'MNAKATSUNO', 'fsantini@hps.org.ar', '0223-155998888', '', '', 'Cordoba 4545', '2009-12-02', 'Mar del Plata', 'Hematologo ', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(639, 'SBDAR', ' CLARA', 'Provincial', '223086', '2012-11-23 11:59:43', 1, 'AZUL HOSPITAL MUNICIPAL ANGEL PINTOS', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'AZUL', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(640, 'SILENZI', ' NESTOR', 'Provincial', '52967', '2014-02-05 10:47:46', 1, 'BAHIA BLANCA HOSPITAL MILITAR', 'HOSPITAL', 'AGONZALEZ', 'dliasilsa@ciudad.com.ar', '02932-15455585', '02932421222', '28 Octubre', 'Quintana 668', '2017-01-10', 'Punta alta', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-18', NULL, '0000-00-00 00:00:00', ''),
	(641, 'SLIBA', ' GABRIELA.SUSANA', 'Provincial', '92728', '2012-11-23 12:01:18', 1, 'MAR DEL PLATA HOSPITAL MATERNO INFANTIL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MAR DEL PLATA ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(642, 'TABORDA', ' GUSTAVO', 'Provincial', '2316', '2014-03-25 11:15:57', 1, 'RIO NEGRO CONSULTORIO', 'CONSULTORIO', 'MCAVAGION', 'gusta@arnet.com.ar', '0299-15044446', '0299 4782606', '', 'Cipolletti, San Martin y Libertad', '2014-02-17', 'RIO NEGRO', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(643, 'VENCHI', ' ROSANA ANDREA', 'Provincial', '3114', '2014-03-11 16:26:43', 1, 'RIO NEGRO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'venchi@live.com.ar', '02941-15500500', '', '', 'Roca 2121 (Gral Roca)', '2014-03-11', 'Rio Negro ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(644, 'TOULIET', ' VALERIA', 'Nacional', '129018', '2015-08-25 13:49:48', 10, '', 'INSTITUCION', 'MNAKATSUNO', 'valerit22@hotmail.com', '1554903046', '', '12/09', '', '2012-01-02', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(645, 'TURDO', ' KARINA', 'Nacional', '91894', '2017-01-24 10:24:56', 10, 'ARGERICH', 'CONSULTORIO', 'MARRUZAZABALA', 'kturdo@yahoo.com.ar', '1567532091', '', '', 'Cordoba 160 ', '2016-11-17', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-24', NULL, '0000-00-00 00:00:00', ''),
	(646, 'VICENTE', ' ANGELES', 'Nacional', '102573', '2017-04-10 16:44:04', 4, 'HOSPITAL ALEMAN', 'HOSPITAL', 'MNAKATSUNO', 'avavicente@hospitaleman.com', '4827-7000', '4827-7014', '', 'Av. Pueyrredon 1640', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(647, 'VILASECA', ' ALICIA', 'Nacional', '70484', '2017-04-10 16:17:27', 8, 'CLINICA SAN CAMILO', 'HOSPITAL', 'MNAKATSUNO', 'pacientesanticoagulados@gmail.com', '49034121/1160993060', '', '31 octubre', 'Mahatma gandi 572', '2020-01-10', '', 'Hematológa/o', 'Activo', 'eala', 19, '2020-01-10', NULL, '2018-10-23 12:24:32', ''),
	(648, 'ZABALJAUREGUI', ' SOLEDAD', 'Nacional', '109615', '2015-08-25 13:50:47', 10, 'ANM', 'INSTITUCION', 'MNAKATSUNO', 'soledadzabaljauregui@ciudad.com.ar', '4805-5759', '4805-0712', '30 octubre', 'Pacheco de Melo3081', '0000-00-00', 'Buenos Aires', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(649, 'ZARATE', ' GRACIELA', 'Nacional', '64628', '2017-01-09 10:03:28', 10, 'HOSPITAL PRIVADO MODELO', 'HOSPITAL', 'AGONZALEZ', 'graciela.zarate@yahoo.com.ar', '1540244899', '', '', 'monroe 3555', '2016-11-17', 'caba', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(650, 'ZORIAN', ' SIRAN', 'Provincial', '451479', '2012-08-21 11:58:09', 8, 'CONSULTORIO', 'CONSULTORIO', 'MSADOUET', 'siranazor@yahoo.com.ar', '1550201708', '', '1-agosto', 'Fleming 590 ', '2009-09-11', 'San isidro', 'Hematológa/o', 'Inactivo', 'Activo', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(651, 'SAKAMOTO', ' FRANCISCO', 'Provincial', '8107', '2015-10-08 16:16:34', 2, 'PARANA CONSULTORIO', 'CONSULTORIO', 'FCASTRO', 'sakajf@hotmail.com', '0343-4310144/0343154064852', '', '', '', '0000-00-00', 'Parana, Entre Rios', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(652, 'SANOCIO', ' LUCRECIA', 'Provincial', '16598', '2017-01-19 11:35:31', 2, 'ICR ROSARIO', 'INSTITUCION', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(653, 'SANTIAGO', ' GRACIELA', 'Provincial', '10617', '2012-11-23 11:57:43', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gracielasantiago2008@hotmail.com', '0341-4486225', '', '', '9 de Julio 1300', '2009-08-18', 'Rosario', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(654, 'SASLAVSKY', ' JORGE', 'Provincial', '3923', '2012-11-23 11:58:24', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'saslasvskyj@arnet.com', '0341-1564346', '', '15 Abril', 'Montevideo 691', '2011-06-01', 'ROSARIO', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(655, 'SASLAVSKY', ' MARTIN', 'Provincial', '13506', '2017-01-19 11:30:33', 2, 'ROSARIO HOSPITAL PROVINCIAL', 'HOSPITAL', 'MARRUZAZABALA', 'marsas147@hotmail.com', '0341-155458226', '0341-4488312', '', 'Montevideo 691', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(656, 'SAUCEDO', ' ALEJANDRA', 'Provincial', '6922', '2012-11-23 11:58:45', 2, 'CONCORDIA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CONCORDIA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(657, 'SAVARINO', ' MARIO', 'Provincial', '2219', '2014-10-28 15:32:20', 8, 'CHACO CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'mesavarino@yahoo.com.ar', '362 444-1414 o 362 454-5898', '', '', 'Monteagudo 471', '2014-10-14', 'Chaco/Resistencia', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(658, 'SICCARDI', ' MARIANA', 'Provincial', '15511', '2012-11-23 12:00:52', 2, 'ROSARIO INSTITUCION', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(659, 'TAUS', ' GUSTAVO', 'Nacional', '5733', '2012-11-23 12:02:31', 2, 'CONCEPCION DEL URUGUAY CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'gustavotaus@arnet.com.ar', '03442-15586333', '03442-426607/5965', '24 Mayo', '14 de julio 378 ', '2008-10-03', 'Entre Rios', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(660, 'VALENTINI', ' ROSANA', 'Provincial', '2614', '2012-11-23 12:06:15', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'fliasavarino@gigared', '0342-45512200', '0342/4551200', '', 'San Martin 3429', '2009-04-22', 'SANTA FE', 'Medica', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(661, 'VENTURINI', ' CLAUDIA', 'Provincial', '6972', '2013-01-11 10:55:19', 2, 'PARANA HOSPITAL GENERAL SAN MARTIN', 'CONSULTORIO', 'AGONZALEZ', 'clauventurini@hotmail.com', '0343-154520448', '', '', 'Peron 450', '2012-12-19', 'PARANA ENTRE RIOS ', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(662, 'VILLARREAL', ' PAOLA', 'Provincial', '3918', '2014-03-27 10:44:48', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'MCAVAGION', 'polivillareal@hotmail.com', '0342-15462279', '', '', 'San Martin 3429', '2009-10-13', 'Santa Fe', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(663, 'WELSH', ' VICTORIA', 'Provincial', '619', '2014-05-07 13:54:46', 8, 'FORMOSA', 'CONSULTORIO', 'AGONZALEZ', 'victoriawelsh245@hotmail.com', '03717-15612897', '', '', 'Patiño 260', '2014-03-10', 'Formosa', 'Hematológa/o', 'Activo', 'eala', 19, '2019-03-13', NULL, '2018-10-23 12:24:32', ''),
	(664, 'WULFSOHN', ' CLAUDIA MARCELA', 'Provincial', '10678', '2012-11-23 12:03:49', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'claudia_hemato@hotmail.com', '03414826056', '', '0000-00-00', 'Ayacucho 2059', '2011-06-02', 'Rosario', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(665, 'ZIRONE', ' SANDRA', 'Provincial', '9005', '2012-11-23 12:03:06', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', 'Alvear 800', '0000-00-00', 'Rosario', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(666, NULL, NULL, 'Nacional', '128750', '2017-01-11 16:56:22', 9, 'SAN JUAN HOSPITAL GUILLERMO RAWSON', 'HOSPITAL', 'MARRUZAZABALA', 'amandaruades@yahoo.com.ar', '0264-155501281', '', '', '', '0000-00-00', 'San Juan', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(667, NULL, NULL, 'Nacional', '66809', '2016-12-19 17:32:45', 8, '', 'INSTITUCION', 'MARRUZAZABALA', 'gpardo@raffo.com.ar', '4509-1943', '45097164', '', '', '2019-02-11', '', 'Médica/o', 'Activo', 'agonzalez', 19, '2019-02-11', NULL, '2018-10-23 12:24:32', ''),
	(668, NULL, NULL, 'Provincial', '3921', '2011-10-18 12:02:20', 0, '', '', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(669, NULL, NULL, 'Nacional', '315', '2017-01-19 10:26:15', 3, 'USHUAIA', '', 'MARRUZAZABALA', 'matiocevichsilvina@hotmail.com', '02901-15515677', '02901-422635', '', '', '0000-00-00', 'Tierra del Fuego', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(670, NULL, NULL, 'Nacional', '2510', '2012-11-23 11:50:00', 9, 'MENDOZA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'doraramos@live.com.ar', '0261-4319407///155154166', '', '20 Julio', 'Federico Moreno 1175', '2011-07-13', 'Mendoza', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(671, NULL, NULL, 'Provincial', '802', '2011-10-18 08:31:38', 9, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(674, NULL, NULL, 'Provincial', '2033', '2012-11-23 11:50:17', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '2017-01-18', 'NEUQUEN', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(675, 'CATALAN', ' MARTA ALICIA', 'Nacional', '35007', '2015-07-17 13:56:21', 8, 'HOSPITAL DE MONTE GRANDE', 'HOSPITAL', 'FCASTRO', 'mariacatalan2002@yahoo.com.ar', '15-61009001 O 4290-2432', '', '', 'Azcuenaga 156', '2017-06-29', 'Monte grande', 'Hematológa/o', 'Inactivo', 'jkiprizlian', 20, '2018-04-11', NULL, '2018-10-23 12:24:32', ''),
	(676, NULL, NULL, 'Nacional', '11111', '2012-09-14 12:00:13', 5, '', 'CONSULTORIO', 'AGONZALEZ', '', '2323422101', '', '', '', '2010-01-01', 'Lujan', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(677, NULL, NULL, 'Nacional', '43599', '2014-07-29 15:49:46', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'AGONZALEZ', '', '1560451219', '', '', 'Uriburu 1145 5 A', '2014-07-21', 'caba', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(678, NULL, NULL, 'Nacional', '54689', '2014-06-10 13:29:37', 4, 'Sanatorio Mater Dei', 'SANATORIO', 'AGONZALEZ', 'gpombo58@hotmail.com', '4771-7039', '', '07-08', 'Maure 1714', '2014-05-29', 'Capital Federal', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(679, NULL, NULL, '', '', '2012-11-23 11:34:46', 9, 'MENDOZA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'horaciomondino@hotmail.com', '02627446927//02627659474', '', '', 'Agustin Alvarez', '2010-06-14', 'San Rafael', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(680, NULL, NULL, '', '', '2011-10-17 11:51:38', 0, '', '', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(681, NULL, NULL, '', '', '2012-11-23 11:19:04', 8, 'FORMOSA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '1968146@arnet.com.ar', '', '', '', 'España 1076', '2011-06-10', 'FORMOSA', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(682, NULL, NULL, 'Nacional', '125804', '2016-05-13 08:35:57', 9, 'HOSPITAL SRA ISABEL DE HUNGRIA', '', 'AGONZALEZ', 'seba_prieto1@hotmail.com', '2012096637', '', '', 'Callao 1230 5ºB', '0000-00-00', 'Buenos Aires ', 'HEMATOLOGA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(684, NULL, NULL, 'Provincial', '1285', '2015-01-06 15:18:06', 1, 'HOSPITAL PENNA', 'HOSPITAL', 'FCASTRO', 'dipaolopidal@cepanet.com.ar', '2932433574/023215611732', '', '', 'Ingeniero luiggi 453', '2013-12-13', 'Bahia blanca', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-02-27', NULL, '2018-10-23 12:24:32', ''),
	(685, NULL, NULL, 'Provincial', '1009', '2012-11-23 11:30:02', 9, 'SAN JUAN CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '0264-154551430', '', '', '', '2011-07-01', 'San Juan', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(686, NULL, NULL, '', '', '2015-08-25 13:48:50', 10, 'HOSPITAL DR CHURRUCA VISCA', '', 'MNAKATSUNO', '', '4909-4100', '4972-4974', '', '', '0000-00-00', 'Capital Federal', 'MD', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(687, NULL, NULL, 'Provincial', '4897', '2014-03-10 16:29:07', 1, 'NEUQUEN CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'sfp25@yahoo.com.ar', '5786-9361', '', '', 'Diaz Velez 5044 ', '2014-02-14', 'NEUQUEN ', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(688, NULL, NULL, 'Nacional', '108570', '2012-11-23 11:37:42', 8, 'PUERTO MADRYN', 'CONSULTORIO', 'MNAKATSUNO', '', '12804456000', '12804456000', '', 'Estivariz 260', '2017-11-05', 'Puerto madryn', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-01-16', NULL, '0000-00-00 00:00:00', ''),
	(690, NULL, NULL, 'Provincial', '112265', '2012-09-14 12:02:30', 5, '', 'HOSPITAL', 'AGONZALEZ', 'venererd@hotmail.com', '0232515688677', '', '22 Febrero', 'Sachetto559', '2010-01-01', 'San andres de giles', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(691, NULL, NULL, '', '', '2012-09-14 09:46:11', 5, '', '', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(692, NULL, NULL, '', '', '2015-08-25 13:42:17', 10, 'Hospital Ramos Mejía', 'HOSPITAL', 'MNAKATSUNO', 'emoiraghu@fibertel.com.ar', '49570182', '49570182', '8 Marzo', 'Avellaneda 1863 9ºG', '0000-00-00', 'Capital Federal', 'Medica de planta', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(693, NULL, NULL, '', '120806', '2015-01-12 15:57:14', 8, 'HOSPITAL Alvarez', 'HOSPITAL', 'MNAKATSUNO', 'ignaledesma@yahoo.com.ar', '41578327', '', '25/04', '', '0000-00-00', 'Capital Federal', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(694, NULL, NULL, 'Provincial', '3839', '2012-09-14 10:49:53', 1, '', '', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(695, NULL, NULL, 'Provincial', '30693', '2015-11-03 09:31:01', 9, 'SANATORIO ALLENDE CORDOBA', 'SANATORIO', 'AGONZALEZ', 'ema6aguilera@hotmail.com', '(0351)  5153946', '', '', 'Hipolito yrigoyen 384', '2016-12-19', 'Cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-08-25', NULL, '0000-00-00 00:00:00', ''),
	(696, NULL, NULL, 'Provincial', '14512', '2012-11-23 10:15:52', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(697, NULL, NULL, 'Nacional', '121383', '2012-01-03 13:22:11', 5, 'HOSPITAL DR SANTOJANNI', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '2008-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(698, NULL, NULL, 'Provincial', '5512', '2012-11-23 10:19:36', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(699, NULL, NULL, 'Nacional', '96947', '2017-04-10 15:36:24', 3, 'FUNDALEU', 'SANATORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(700, NULL, NULL, 'Provincial', '5615', '2012-11-23 10:22:49', 9, 'MENDOZA HOSPITAL EL CARMEN', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MENDOZA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(701, NULL, NULL, 'Nacional', '113141', '2017-04-10 15:44:17', 2, 'SAN NICOLAS CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'beguelino@hotmail.com', '1557434221', '', '', 'Lage 1054,Santos Lugares, 3 de Febrero', '0000-00-00', 'SAN NICOLAS', 'Residente Hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(702, NULL, NULL, 'Provincial', '1728', '2017-01-03 16:40:56', 9, 'CONSULTORIO catamarca', 'CONSULTORIO', 'AGONZALEZ', 'bepre_rodolfo@yahoo.com.ar', '03833-15534926', '', '', 'chacabuco 675', '0000-00-00', 'Capital Federal', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(703, NULL, NULL, 'Provincial', '5040', '2015-07-15 08:40:48', 2, 'SANTA FE CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'florenciabertoia@hotmail.com', '0342 154734961', '', '', 'san martin 3429', '2015-07-14', 'SANTA FE', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(704, NULL, NULL, 'Provincial', '5554', '2015-08-11 14:47:32', 10, 'TUCUMAN HOSPITAL DEL NIÑO JESUS', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(705, NULL, NULL, 'Nacional', '129870', '2017-01-24 10:24:15', 4, 'SAGRADO CORAZóN', 'INSTITUCION', 'MARRUZAZABALA', 'hematofleming@gmail.com', '15-3099-3348', '', '', 'Cramer 1180', '2017-01-09', 'Caba', 'Hematológa/o', 'Activo', 'gpardo', 19, '2019-12-06', NULL, '2018-10-23 12:24:32', ''),
	(706, NULL, NULL, 'Provincial', '8376', '2015-08-11 14:47:54', 10, 'TUCUMAN HOSPITAL DEL NIÑO JESUS', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'TUCUMAN', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(707, NULL, NULL, 'Provincial', '8484', '2012-11-23 10:54:04', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(708, NULL, NULL, 'Provincial', '11723', '2012-11-23 10:55:12', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(709, NULL, NULL, 'Nacional', '78938', '2011-10-14 15:29:50', 5, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', '', '1533615364', '', '', 'Rio de janeiro 1910, lanus', '2017-08-18', 'Pcia de buenos aires', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-09-01', NULL, '0000-00-00 00:00:00', ''),
	(710, NULL, NULL, '', '', '2011-10-14 15:43:43', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(712, NULL, NULL, 'Provincial', '34567', '2012-11-23 10:58:00', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'MENDOZA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(713, NULL, NULL, 'Provincial', '4658', '2013-05-10 09:15:11', 1, 'SANTA CRUZ CLINICA SAN LUCAS', 'HOSPITAL', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', 'SANTA CRUZ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(714, NULL, NULL, 'Provincial', '12970', '2012-11-23 10:59:31', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(715, NULL, NULL, 'Nacional', '61196', '2012-05-04 09:45:09', 4, 'HOSPITAL NIÑOS PEDRO DE ELIZALDE', 'HOSPITAL', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(716, NULL, NULL, 'Nacional', '78447', '2011-10-17 08:56:27', 3, 'HOSPITAL PEDIATRICO DR J GARRAHAN', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(717, NULL, NULL, 'Nacional', '118356', '2017-01-24 10:30:28', 4, 'CONSULTORIO', 'HOSPITAL', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(718, NULL, NULL, 'Nacional', '1010101', '2011-10-17 10:42:46', 3, 'HOSPITAL SOR MARIA LUDOVICA', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(719, NULL, NULL, 'Provincial', '4720', '2016-06-23 08:59:44', 4, 'SALTA CONSULTORIO', 'CONSULTORIO', 'FCASTRO', 'dramgarcia@yahoo.com.ar', '03874502699', '', '', '', '2016-06-23', 'SALTA', 'Hematóloga', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(720, NULL, NULL, 'Provincial', '722', '2016-03-18 15:47:46', 9, 'CATAMARCA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CATAMARCA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(721, NULL, NULL, 'Nacional', '39403', '2014-06-24 11:29:37', 4, 'ERITROFERON', 'CONSULTORIO', 'AGONZALEZ', 'ricardoantoniogiuliani@hotmail.com', '15 4411 9327', '', '', 'Rivadavia 2431', '2014-06-02', 'Caba', 'Hematológa/o', 'Activo', 'eala', 19, '2020-03-10', NULL, '2018-10-23 12:24:32', ''),
	(722, NULL, NULL, 'Nacional', '103741', '2017-01-16 15:54:16', 10, 'HOSPITAL DR CARLOS DURAND', 'HOSPITAL', 'MNAKATSUNO', 'sgolglid@yahoo.com.ar', '1531744233', '', '', 'diaz Velez 5044', '0000-00-00', 'Buenos Aires', 'Medica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(723, NULL, NULL, 'Nacional', '84947', '2012-05-02 09:54:13', 8, 'OBRA SOCILA POLICLINICO JULIO MENDEZ', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(724, NULL, NULL, 'Nacional', '89238', '2017-04-10 16:01:37', 8, 'HOSPITAL DR ENRIQUE TORNU', 'HOSPITAL', 'MNAKATSUNO', 'dianafalce@yahoo.com', '4521-3600 int 116', '', '26 Septiembre', 'Combatientes de Malvinas 3002', '0000-00-00', 'Capital Federal', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(725, NULL, NULL, 'Provincial', '3895', '2012-07-18 10:58:11', 6, 'HOSPITAL CTRO SAL ZENON SANTILLAN TUCUMAN', 'HOSPITAL', 'MNAKATSUNO', 'rmlepera@yahoo.com.ar', '03814253681', '03814253681', '15 Abril', 'Yerba Buena Golf Country Club', '2008-05-09', 'Tucuman', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(726, NULL, NULL, 'Provincial', '21080', '2012-11-23 11:26:35', 9, 'CORDOBA HOSPITAL ITALIANO', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(727, NULL, NULL, 'Nacional', '51829', '2012-05-02 09:54:43', 5, 'POLICLINICO BANCARIO', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(728, NULL, NULL, 'Provincial', '95216', '2015-01-12 16:00:04', 1, 'NECOCHEA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'maradeijuan@hotmail.com', '0226215560908', '', '', 'av 59 y 102', '2014-06-11', 'necochea', 'hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(729, NULL, NULL, 'Provincial', '12327', '2011-10-17 15:04:48', 9, 'HOSPITAL MUNICIPAL INFANTIL', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(730, NULL, NULL, 'Nacional', '110939', '2012-05-04 09:46:04', 4, 'HOSPITAL NIÑOS PEDRO DE ELIZALDE', 'HOSPITAL', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(731, NULL, NULL, 'Provincial', '19533', '2011-10-17 16:59:39', 9, 'HOSPITAL MUNICIPAL INFANTIL', 'HOSPITAL', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(732, NULL, NULL, 'Provincial', '28587', '2012-11-23 11:36:19', 9, 'CORDOBACONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(733, NULL, NULL, 'Provincial', '81427', '2015-01-12 16:03:28', 1, 'TANDIL CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'katiatandil@hotmail.com', '02494-445792', '', '', 'España 799', '2017-01-26', 'Tandil', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-01-18', NULL, '2018-10-23 12:24:32', ''),
	(734, NULL, NULL, 'Provincial', '95072', '2012-11-23 11:41:49', 1, 'MAR DEL PLATA HOSPITAL PRIVADO DE COMUNIDAD', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', 'España 2020', '2018-10-30', 'Mar del plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-01-03', NULL, '0000-00-00 00:00:00', ''),
	(735, NULL, NULL, 'Provincial', '8317', '2012-11-23 11:42:42', 9, 'CORDOBA CLINICA PRIVADA VELEZ SARSFIELD', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(736, NULL, NULL, 'Provincial', '26084', '2011-10-18 08:52:19', 9, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(737, NULL, NULL, 'Nacional', '81025', '2012-01-26 11:17:05', 5, 'SANATORIO MITRE', 'SANATORIO', 'MSADOUET', '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(738, NULL, NULL, 'Provincial', '15667', '2012-11-23 11:49:03', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO ', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(739, NULL, NULL, 'Nacional', '57707', '2017-04-10 16:09:48', 5, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'lrichard@cas.austral.edu.ar', '02322-482430', '02322482214', '', 'Pte peron 1502', '2010-01-01', '', 'Médica/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(740, NULL, NULL, 'Provincial', '13404', '2011-10-18 10:42:51', 2, 'CONSULTORIO', 'CONSULTORIO', 'YAREVALO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(741, NULL, NULL, 'Provincial', '8629', '2017-01-11 16:49:50', 9, 'MENDOZA HOSPITAL EL CARMEN', 'HOSPITAL', 'MARRUZAZABALA', 'drjuansalomon@aol.com', '', '0261-4236335', '', 'Colon 567', '0000-00-00', 'Mendoza', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(742, NULL, NULL, 'Provincial', '11213', '2012-11-23 12:00:16', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(743, NULL, NULL, 'Nacional', '1111', '2017-04-10 16:15:59', 5, 'HOSPITAL UNIVERSITARIO AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'sosa.patricia1@gmail.com', '02322-482000', '02322482214', '', 'Pte peron 1500', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(744, NULL, NULL, 'Provincial', '30788', '2012-11-23 12:01:56', 9, 'CORDOBA HOSPITAL NIÑOS SANTISIMA TRINIDAD', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'CORDOBA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(745, NULL, NULL, 'Provincial', '37385', '2017-01-03 16:44:01', 4, 'CONSULTORIO', 'CONSULTORIO', 'AGONZALEZ', 'eduardo.szwarcer@gmail.com', '1149866477', '', '', 'libertador 774 8E', '0000-00-00', 'caba', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(746, NULL, NULL, 'Provincial', '12671', '2012-11-23 12:06:58', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', 'ROSARIO', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(747, NULL, NULL, 'Nacional', '56673', '2012-05-04 09:46:34', 4, 'HOSPITAL NIÑOS PEDRO DE ELIZALDE', 'HOSPITAL', 'MSADOUET', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(748, NULL, NULL, 'Provincial', '1771', '2017-01-03 16:45:00', 9, 'CLINICA salta', 'CONSULTORIO', 'AGONZALEZ', 'marisolvid@hotmail.com', '0383-154244459', '', '', '', '0000-00-00', '', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(749, NULL, NULL, '', '', '2012-09-14 09:42:59', 9, '', '', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(750, NULL, NULL, '', '', '2013-05-10 09:11:52', 9, '', '', 'AGONZALEZ', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(751, NULL, NULL, '', '', '2011-10-20 16:00:51', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(753, NULL, NULL, 'Provincial', '5484', '2016-08-30 09:38:00', 9, 'MENDOZA HOSPITAL EL CARMEN', 'HOSPITAL', 'FCASTRO', '', '0261-4490338', '', '', 'San Martin 965', '2016-08-30', 'MENDOZA', 'hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(754, NULL, NULL, 'Nacional', '102297', '2011-12-14 08:41:55', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(755, NULL, NULL, '', '51357', '2013-06-18 10:49:29', 8, 'BRAGADO', 'CONSULTORIO', 'AGONZALEZ', '', '', '', '', '', '2012-01-04', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(756, NULL, NULL, 'Provincial', '226009', '2013-10-11 12:21:09', 8, 'SANATORIO JUNCAL', 'SANATORIO', 'AGONZALEZ', '', '', '', '', '', '2013-09-12', 'temperley', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(757, NULL, NULL, '', '', '2012-05-02 09:34:28', 3, 'HOSPITAL FRANCES', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(759, NULL, NULL, 'Nacional', 'MN74733', '2017-01-19 10:11:44', 3, 'HOSPITAL FRANCES', '', 'MARRUZAZABALA', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(760, NULL, NULL, 'Provincial', '939', '2014-01-14 15:08:32', 3, 'CONSULTORIO', '', 'AGONZALEZ', '', '03764435067', '', '', 'bolivar 153', '2013-12-19', 'posadas, musiones', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(761, NULL, NULL, 'Nacional', '128194', '2017-01-19 10:12:03', 3, 'HOSPITAL FRANCES', 'CONSULTORIO', 'MARRUZAZABALA', '', '1531879865', '', '', 'av san juan 3276 5 28', '0000-00-00', 'bs as', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(762, NULL, NULL, 'Nacional', '125332', '2012-03-23 16:37:47', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(763, NULL, NULL, 'Nacional', '127534', '2017-04-11 16:10:20', 5, 'Fundaleu', '', 'GPARDO', 'echevestenoehotmail.com', '011-1541916812', '', '', 'uriburu 1450', '0000-00-00', 'capital federal', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(764, NULL, NULL, 'Provincial', '2188', '2015-08-11 15:12:21', 10, 'SANTIAGO DEL ESTERO Sanatorio Renacer', 'SANATORIO', 'MNAKATSUNO', '', '03854-422145', '', '', '', '0000-00-00', 'SANTIAGO DEL ESTERO', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(765, NULL, NULL, 'Nacional', '133198', '2017-04-10 15:56:08', 3, 'FUNDALEU', 'INSTITUCION', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(766, NULL, NULL, 'Provincial', '0856', '2012-11-23 11:40:38', 2, '', 'HOSPITAL', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(767, NULL, NULL, 'Nacional', '38895', '2015-05-12 08:31:30', 4, 'CONSULTORIO', '', 'FCASTRO', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(768, NULL, NULL, 'Nacional', '39607', '2012-05-02 09:52:42', 8, 'HOSPITAL INTERZONAL AGUDOS EVITA (LANUS)', '', 'MNAKATSUNO', '', '', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(769, NULL, NULL, 'Nacional', '118356', '2017-01-24 10:30:42', 3, 'CONSULTORIO', 'HOSPITAL', 'MARRUZAZABALA', '', '1530198369', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(770, NULL, NULL, 'Provincial', '31491', '2014-10-17 14:50:46', 9, 'CORDOBA SANATORIO ALLENDE', 'SANATORIO', 'AGONZALEZ', 'amealvarezb@hotmail.com', '0351-155917294', '', '23/10/1981', 'Hipolito yrigoyen 384', '2016-12-20', 'Cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-08-25', NULL, '0000-00-00 00:00:00', ''),
	(771, NULL, NULL, 'Nacional', '125170', '2017-01-24 10:26:16', 10, 'ARGERICH', 'HOSPITAL', 'MARRUZAZABALA', 'marianasilviaacevedo25@yahoo.com.ar', '011-15-4089-6816', '', '', 'Urquiza 609', '2012-05-08', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-05-07', NULL, '0000-00-00 00:00:00', ''),
	(772, NULL, NULL, 'Nacional', '92462', '2015-11-13 10:28:07', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'FCASTRO', 'MARIA.CARDENAS@HOSPITALITALIANO.ORG.AR', '15-61576137', '49582463', '', 'Caracas 1985', '2019-04-09', 'Caba', 'Hematológa/o', 'Activo', 'eala', 19, '2019-04-09', NULL, '2018-10-23 12:24:32', ''),
	(773, NULL, NULL, 'Nacional', '46623', '2017-04-10 16:00:43', 4, 'TORRE MEDICUS', 'INSTITUCION', 'MNAKATSUNO', 'ALFREDOKAMINKER@YAHOO.COM', '15-4046-3124', '', '', 'PARAGUAY 2302', '0000-00-00', 'CABA', 'HEMATOLOGO', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(774, NULL, NULL, 'Nacional', '108551', '2017-04-10 15:48:03', 4, 'TORRE MEDICUS', 'INSTITUCION', 'MNAKATSUNO', 'drmartincastro@hotmail.com', '15-5821-9860', '', '', 'Paraguay 2302 piso 14 dpto 3', '2019-02-11', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-02-11', NULL, '2018-10-23 12:24:32', ''),
	(775, NULL, NULL, 'Nacional', '76130', '2012-08-08 14:47:00', 5, '', 'HOSPITAL', 'AGONZALEZ', 'CPESCE@RAFFO.COM.AR', '4509-7100', '45097164', '', 'Amaro avalos 2829, munro', '2012-08-08', 'Vte lopez', 'otro', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(776, NULL, NULL, 'Provincial', '102753', '2016-09-05 09:26:37', 8, 'Hospital Piñero Cons. Ext.', '', 'AGONZALEZ', '', '1559559356', '', '', '', '2016-08-11', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(777, NULL, NULL, 'Nacional', '99432', '2017-01-23 10:39:25', 8, 'HOSP. PIÑERO', 'INSTITUCION', 'MARRUZAZABALA', '', '1564901040', '', '', '', '0000-00-00', 'CAPITAL FEDERAL', 'HEMATOLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(778, NULL, NULL, 'Provincial', '229616', '2017-01-19 10:27:54', 3, 'FINOCHIETTO (PTE PERON)', 'INSTITUCION', 'MARRUZAZABALA', 'fgorini@australia.edu', '0054-11-5801-8614', '4215-2294', '', 'calle 133 N° 5145', '0000-00-00', 'QUILMES', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(779, NULL, NULL, 'Nacional', '45242', '2012-11-23 11:52:08', 4, 'HOSPITAL RIVADAVIA', 'HOSPITAL', 'MNAKATSUNO', 'enriquerobbio@hotmail.com', '15-4066-8888', '', '3 Abril', 'Las Heras 2670', '2012-07-02', 'Capital', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(780, NULL, NULL, 'Provincial', '2624', '2015-08-11 15:06:32', 9, 'LA RIOJA', '', 'MNAKATSUNO', '', '0380-154569462', '', '', '', '0000-00-00', 'La Rioja', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(781, NULL, NULL, 'Nacional', '131644', '2017-06-27 15:36:59', 10, 'CONSULTORIO SANTIAGO DEL ESTERO', 'HOSPITAL', 'MNAKATSUNO', 'roperessin@hotmail.com', '15 51102477', '', '', 'solis 2171 PB', '0000-00-00', 'SANTIAGO DEL ESTERO', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(782, NULL, NULL, 'Nacional', '118049', '2017-05-09 15:18:21', 3, 'SAN MARTIN DE LA PLATA', 'CONSULTORIO', 'FCASTRO', 'lorefiad@hotmail.com', '0221 154385390', '', '', '1 y 70', '2017-05-04', 'La Plata', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(783, NULL, NULL, 'Nacional', '123612', '2017-04-10 16:03:48', 3, 'FUNDALEU', 'CONSULTORIO', 'MNAKATSUNO', 'mjmela@fundaleu.org.ar', '1565556655', '', '', 'Uriburu 1450', '0000-00-00', 'CABA', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(784, NULL, NULL, 'Nacional', '131601', '2017-04-10 16:04:50', 9, 'LA RIOJA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'montesdeocaviviana@hotmail.com', '1536964816', '', '', 'Juan domingo peron 1800', '2019-03-27', 'Derqui', 'Hematológa/o', 'Activo', 'gpardo', 19, '2019-03-27', NULL, '2018-10-23 12:24:32', ''),
	(785, NULL, NULL, 'Nacional', '127347', '2012-11-23 10:23:35', 3, 'HOSPITAL FRANCES', 'CONSULTORIO', 'MNAKATSUNO', 'florencia-baglioni@hotmail.com', '1543992783', '', '', 'La rioja 951', '2012-10-02', 'Caba', 'Hematológa/o', 'Activo', 'eala', 19, '2019-03-06', NULL, '2018-12-12 23:50:00', ''),
	(786, NULL, NULL, 'Provincial', '11100', '2012-11-23 11:22:57', 2, 'ROSARIO CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', '', '03414116661', '', '', 'Paraguay 1331 2C', '2012-11-16', 'Rosario', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(787, NULL, NULL, 'Nacional', '107973', '2017-01-09 10:47:22', 4, 'PAROISSIEN', 'HOSPITAL', 'AGONZALEZ', 'LAURA_MANDRILE@YAHOO.COM.AR', '15-3116-3998 / 4658-8527', '4658-8527', '', 'J M ROSAS 5975', '2016-11-17', 'ISIDRO CASANOVA', 'HEMATOLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(788, NULL, NULL, '', '', '2015-01-12 15:39:52', 8, 'Corrientes consultorio', 'CONSULTORIO', 'MNAKATSUNO', '', '0379-4434128 o 0379-154407812', '', '', '3 de Abril 636', '2013-02-06', 'Corrientes', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(789, NULL, NULL, 'Provincial', '2680', '2015-01-12 16:11:27', 3, 'el dorado consultorio', 'CONSULTORIO', 'MNAKATSUNO', 'yacaratia@arnet.com.ar', '03751 421539int 429', '', '', 'Dr Prieto S/N Km 10, El Dorado', '2012-11-15', 'Misiones - Argentina', 'hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(790, NULL, NULL, 'Provincial', '20343', '2013-01-03 11:53:34', 9, '', 'CONSULTORIO', 'MNAKATSUNO', '', '0358156542077', '', '', 'ITALIA 1384', '2012-12-05', 'RIO CUARTO', 'ONCOLOGÍA CLÍNICA', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(791, NULL, NULL, 'Provincial', '15716', '2016-01-15 09:19:26', 9, 'HOSPITAL T CACERES DE ALLENDE', 'CONSULTORIO', 'MNAKATSUNO', 'NPILNIK@YAHOO.COM', '0351 52364389 Ó 155631517', '', '', 'Av Duarte Quiroz 1948 13°, Alberdi', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(792, NULL, NULL, 'Provincial', '9618', '2013-01-25 08:55:58', 2, '', '', 'MSADOUET', '', '0341-156452386', '', '', 'belgrano 1062', '2013-01-10', '', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(793, NULL, NULL, 'Provincial', '8849', '2015-01-12 15:25:14', 2, 'PARANA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'estebanaguirre@hotmail.com', '0343-432-4333 o 0343-423-4545', '', '', 'Peron 450, entre rios', '2012-12-19', 'Parana, entre rios', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-08-23', NULL, '0000-00-00 00:00:00', ''),
	(794, NULL, NULL, 'Provincial', '1460', '2013-01-21 08:52:17', 8, '', '', 'AGONZALEZ', 'ferni_erdoiz@hotmail.com', '0377715470127', '', '', 'Jose Gomez 923, Goya', '2013-01-14', 'Corrientes', 'Medica Cirujana', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(795, NULL, NULL, 'Provincial', '2863', '2017-01-04 09:09:27', 8, 'Hemocentro Esquel', 'INSTITUCION', 'MARRUZAZABALA', 'hemocentroesquel@yahoo.com.ar', '02945-15527241', '', '', '25 de mayo 125, Esquel', '0000-00-00', 'Chubut', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(796, NULL, NULL, 'Nacional', '136568', '2013-04-05 13:18:37', 3, 'HOSPITAL BRITÁNICO', 'HOSPITAL', 'GPARDO', 'danisuto@hotmail.com', '4309-6400 INT 2560', '', '', 'Solí 2171 P.B', '2013-04-03', 'CABA', 'HEMATOLOGÍA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(797, NULL, NULL, 'Nacional', '125185', '2015-07-17 10:38:58', 3, 'Hospital Rossi', 'HOSPITAL', 'FCASTRO', 'solecruset@hotmail.com', '221 630-8834', '', '', 'calle 37 n°183', '0000-00-00', 'La Plata', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(798, NULL, NULL, 'Provincial', '53145', '2017-01-03 16:41:43', 10, 'Sanatorio General Sarmiento', 'SANATORIO', 'AGONZALEZ', 'adegano@hotmail.com', '44697300 int 2813 o 15-61480544', '', '', '', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(799, NULL, NULL, 'Nacional', '111409', '2017-01-16 15:52:54', 10, 'HOSPITAL DR CARLOS DURAND', 'CONSULTORIO', 'MNAKATSUNO', 'laufischman@yahoo.com', '1552268103', '', '', 'Diaza velez 5044', '0000-00-00', 'CABA', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(800, NULL, NULL, 'Nacional', '12545', '2017-04-10 15:50:36', 10, 'ALEXANDER FLEMING', 'INSTITUCION', 'MNAKATSUNO', 'tagocranco@gmail.com', '1555025878', '', '', 'Cramer 1180', '0000-00-00', 'CABA', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(801, NULL, NULL, 'Nacional', '119430', '2017-01-23 10:59:53', 8, 'HOSPITAL NAVAL DR PEDRO MALLO', 'HOSPITAL', 'MARRUZAZABALA', 'sulilian24@hotmail.com', '1551044109', '', '', 'Av Patricias Argentinas 300', '0000-00-00', '', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(802, NULL, NULL, 'Provincial', '1519', '2014-02-06 10:31:18', 9, 'CONSULTORIO SAN LUIS', 'CONSULTORIO', 'MNAKATSUNO', 'ruben.delia@gmail.com', '2652-15-555377', '', '', '', '2013-05-31', 'San Luis', 'hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(803, 'Canosa', ' VERONICA', 'Provincial', '136011', '2017-01-11 17:04:43', 9, 'MENDOZA HOSP LAGOMAGGIORE', 'CONSULTORIO', 'MARRUZAZABALA', 'veronicacanosa@yahoo.com.ar', '0261-155885665', '', '', 'Patricias mendocinas 248, godoy cruz', '2019-05-07', 'Mendoza', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-05-07', NULL, '2018-10-24 08:42:42', ''),
	(804, NULL, NULL, 'Nacional', '123530', '2017-01-03 16:42:14', 10, 'CHURRUCA', 'HOSPITAL', 'AGONZALEZ', 'drdiegofernandez@gmail.com', '1531668011', '', '', 'Uspallata 3400', '2019-02-04', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-02-04', NULL, '2018-11-15 23:50:00', ''),
	(805, NULL, NULL, 'Nacional', '124664', '2014-02-06 10:39:57', 3, 'HOSPITAL CENTRAL DE SAN ISIDRO', 'HOSPITAL', 'MNAKATSUNO', 'karina-andrade@lna.com', '4512-3720', '', '', 'santa fe 400', '2013-07-01', 'caba', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(806, NULL, NULL, 'Nacional', '80550', '2015-08-11 15:13:48', 10, 'Hospital Italiano', 'HOSPITAL', 'MNAKATSUNO', 'sergio.specterman@hospitalitaliano.org.ar', '49581351', '', '', 'gascon 450', '0000-00-00', 'caba', 'Oncología', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(807, NULL, NULL, 'Provincial', '3880', '2015-01-12 15:57:36', 9, 'MENDOZA CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'elenalinares@gmail.com', '0261-154546457', '', '', 'Granaderos 983', '2013-08-09', 'Mendoza', 'HEMATOLOGÍA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(808, NULL, NULL, 'Provincial', '3132', '2013-10-17 14:44:04', 8, '', 'CONSULTORIO', 'AGONZALEZ', 'mariapresman@yahoo.com.ar', '2804540831', '', '', 'Marconi 374', '2013-09-30', 'Trelew', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-19', NULL, '0000-00-00 00:00:00', ''),
	(809, NULL, NULL, 'Nacional', '124359', '2014-02-06 10:41:22', 3, 'CENTRO CEMIC', 'INSTITUCION', 'MNAKATSUNO', 'PILARVM8@OUTLOOK.COM', '15-4578-2367', '', '', 'AV GALVAN 4102', '2013-10-30', '', 'HEMATOLOGA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(810, NULL, NULL, 'Nacional', '122664', '2017-01-23 10:47:00', 8, 'OBRA SOCIAL POLICLINICO JULIO MENDEZ', 'HOSPITAL', 'MARRUZAZABALA', '', '4611-6666', '', '', 'aranguren 2701, flores', '0000-00-00', 'caba', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(811, NULL, NULL, 'Provincial', '4255', '2013-11-27 11:21:33', 9, '', '', 'AGONZALEZ', 'martincarrizo46@hotmail.com', '0264-755023880 o 0264-4223300', '', '', 'Catamarca 457 ( sur)', '2013-11-26', 'San Juan, Capital', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(812, NULL, NULL, 'Nacional', '141344', '2014-02-06 10:43:52', 9, 'HOSPITAL BRITANICO', 'HOSPITAL', 'MNAKATSUNO', 'MJOR_PARERA@HOTMAIL.COM', '11-3412-5879', '', '', '', '2013-12-02', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-09-20', NULL, '0000-00-00 00:00:00', ''),
	(813, NULL, NULL, 'Nacional', '70775', '2014-05-29 13:48:48', 5, '', '', 'MNAKATSUNO', 'dpardal@omint.com.ar', '48082001 int 2819', '48914935', '', 'uriburu 754 3 piso', '2013-12-12', 'capital', 'Auditor', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(814, NULL, NULL, 'Nacional', '126778', '2015-08-11 15:05:45', 5, 'HOSPITAL ITALIANO', 'HOSPITAL', 'MNAKATSUNO', 'jose.minatta@hospitalitaliano.org.ar', '1538018573', '', '', 'Gascon 450', '2012-01-02', 'Caba', 'Inmuno-hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(815, NULL, NULL, 'Provincial', '4331', '2015-01-12 16:05:13', 9, 'MENDOZA HOSPITAL CENTRAL', 'HOSPITAL', 'MNAKATSUNO', 'rnieto@infovia.com.ar', '0263154510984', '', '', 'Alte brown 130, San Martin', '2014-02-10', 'Mendoza', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(816, NULL, NULL, 'Provincial', '1158087', '2014-02-12 16:35:46', 3, '', 'HOSPITAL', 'AGONZALEZ', 'aliacianavickas@hotmail.com', '0221 1556-97201', '', '', 'Calchaqui 5401', '2014-02-12', 'Bs as florencio varela', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-29', NULL, '0000-00-00 00:00:00', ''),
	(817, NULL, NULL, 'Nacional', '31431', '2015-08-11 14:56:35', 10, 'Hospital Italiano', '', 'MNAKATSUNO', '', '1565189600', '', '', 'gascon 450', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(818, NULL, NULL, 'Nacional', '123461', '2015-08-11 14:53:33', 10, 'TUCUMANCONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'mfla_figuero@hotmail.com', '0381155211763', '', '', 'Av Luna 1780 PA', '0000-00-00', 'TUCUMAN', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(819, NULL, NULL, 'Provincial', '2963', '2017-01-11 16:54:52', 9, 'SAN JUAN HOSPITAL GUILLERMO RAWSON', 'CONSULTORIO', 'MARRUZAZABALA', 'celina74@live.com.ar', '0264 156610362', '', '', '', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(820, NULL, NULL, 'Nacional', '112450', '2015-09-28 10:04:41', 10, 'HOSPITAL RAMOS MEJIA', 'HOSPITAL', 'AGONZALEZ', 'monicagutred@hotmail.com', '15 40862195', '', '', 'Urquiza 609', '2013-11-05', 'Capital federal', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(821, NULL, NULL, 'Nacional', '137079', '2017-07-27 15:47:53', 2, 'RAFAELA SANTA FE', 'CONSULTORIO', 'MNAKATSUNO', 'bgiraudo@hotmail.com', '0341-156802200', '', '', 'Irigoyen 622, rafaela', '2018-09-24', 'Santa fe', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-09-28', NULL, '0000-00-00 00:00:00', ''),
	(822, NULL, NULL, 'Nacional', '128592', '2017-04-10 15:45:06', 3, 'FUNDALEU', 'INSTITUCION', 'MNAKATSUNO', 'gbentolila@fundaleu.org.ar', '1557676640', '48771000', '', 'uriburu 1450', '0000-00-00', 'capital', 'Medico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(823, NULL, NULL, 'Provincial', '27044', '2014-05-19 09:21:02', 0, '', 'CONSULTORIO', 'AGONZALEZ', 'carlosantonietta@hotmail.com', '42514154 o 1554545265', '', '', 'Rivadavia 437', '2014-05-06', 'Quilmes', 'Hematologo', 'Duplicado', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(824, NULL, NULL, 'Nacional', '96460', '2017-05-26 10:17:02', 3, 'CONSULTORIO SAN ISIDRO', 'CONSULTORIO', 'MNAKATSUNO', 'analiapaz@yahoo.com', '4743-2560 o 1544482989', '', '', 'brown 402', '0000-00-00', 'san isidro', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(825, NULL, NULL, 'Nacional', '67361', '2017-06-27 15:40:02', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'MNAKATSUNO', 'estela.vinuales@hospitalitaliano.org.ar', '15-5313-5373 o 4958-2463', '', '', 'Peron 4190', '0000-00-00', 'Capital', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(826, NULL, NULL, 'Nacional', '121697', '2017-03-08 15:33:40', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'AGONZALEZ', '', '1560101588 o 49590200', '', '', 'peron 4272', '2016-12-22', 'caba', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(827, NULL, NULL, 'Provincial', '5118', '2015-01-12 16:10:57', 8, 'chivilcoy consultorio', 'INSTITUCION', 'MNAKATSUNO', '', '02343-410163', '', '', 'Noguera y Sto. Cabral, Norberto de la Riestra', '2014-06-13', 'Buenos Aires', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(828, NULL, NULL, 'Nacional', '137654', '2017-07-27 15:52:55', 3, 'Bernal', 'SANATORIO', 'MNAKATSUNO', 'fleglern@gmail.com', '15-4409-0515', '', '', 'Victorica 381', '0000-00-00', 'Bernal', 'Clínica', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(829, NULL, NULL, 'Nacional', '117580', '2016-01-15 09:16:35', 8, 'Hospital Gandulfo', 'CONSULTORIO', 'MNAKATSUNO', '', '15-5581-5991', '', '', 'BALCARSE 946', '0000-00-00', '', 'HEMATOLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(830, NULL, NULL, 'Provincial', '9518', '2014-08-14 16:35:49', 2, 'San Martin de Parana', 'HOSPITAL', 'AGONZALEZ', 'virgilli1@hotmail.com', '0343156222727', '', '', 'Monte Caseros 342', '2014-08-11', 'Parana, Entrerrios', 'HEMATOLOGA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-12-19 23:50:00', ''),
	(831, NULL, NULL, 'Nacional', '81957', '2017-04-10 16:14:37', 3, 'clinica bazterrica', 'INSTITUCION', 'MNAKATSUNO', 'mesobrero65@hotmail.com', '15-4474-2220', '', '', 'Peron 1739', '0000-00-00', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(832, NULL, NULL, 'Nacional', '107967', '2016-04-29 15:58:54', 8, 'HOSPITAL DR ANGEL ROFFO', 'HOSPITAL', 'MNAKATSUNO', 'marcemiodosky@hotmail.com', '1550501191', '', '', 'san martin 5481', '0000-00-00', 'caba', 'hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(833, NULL, NULL, 'Nacional', '132848', '2014-10-24 10:53:09', 9, 'Centro médico Aconcagua', 'HOSPITAL', 'FCASTRO', 'fribba@hotmail.com', '0351-2219668/4475400', '', '', '', '0000-00-00', '', 'Hematólogo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(834, NULL, NULL, 'Nacional', '119771', '2016-04-29 16:01:05', 3, 'CENTRO CEMIC', 'INSTITUCION', 'MNAKATSUNO', 'jialtuve@hotmail.com', '1558478181 o 52990100 int 2285', '', '', 'Gallan 4102', '2018-03-01', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-04-23', NULL, '0000-00-00 00:00:00', ''),
	(835, NULL, NULL, 'Nacional', '128736', '2017-04-10 16:01:04', 10, 'ALEXANDER FLEMING', 'HOSPITAL', 'MNAKATSUNO', 'laurakorin@hotmail.com', '4809-6400 o 15-5807-4286', '', '', 'pedriel 74', '0000-00-00', 'caba', 'hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(836, NULL, NULL, 'Nacional', '135518', '2017-04-10 16:13:56', 8, 'HOSPITAL POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'sglopresti@hotmail.com.ar', '0111544151879 ', '', '', 'Illia y marconi s/n', '2010-01-01', '', 'Médica/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(837, NULL, NULL, 'Nacional', '135518', '2016-04-29 15:57:59', 8, 'HOSPITAL DR ALEJANDRO POSADAS', 'HOSPITAL', 'MNAKATSUNO', 'sglopresti@hotmail.com.ar', '0111544151879 ', '', '', 'Illia y marconi s/n', '2014-12-03', 'El palomar', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-23', NULL, '0000-00-00 00:00:00', ''),
	(838, NULL, NULL, 'Provincial', '16445', '2014-12-23 11:49:56', 3, 'LA PLATA CONSULTORIO', 'HOSPITAL', 'MNAKATSUNO', 'adrianag2011@hotmail.com', '0221 427119091', '', '', '', '0000-00-00', '', 'Hematólogo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(839, NULL, NULL, 'Provincial', '1048', '2015-08-11 14:52:24', 1, '', 'HOSPITAL', 'MNAKATSUNO', 'HEMATOLOGIALOMAS@HOTMAIL.COM', '02954-15478964/02954 455000', '', '', '', '0000-00-00', '', 'HEMATOLOGIA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(840, NULL, NULL, 'Nacional', '131982', '2015-04-01 14:04:34', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'MNAKATSUNO', 'CIA.AGUSTINA@GMAIL.COM', '1554606500', '', '', '', '2014-10-15', '', 'HEMATOLOGIA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(841, NULL, NULL, 'Nacional', '136215', '2017-01-24 10:29:29', 4, 'CONSULTORIO', '', 'MARRUZAZABALA', 'ludmila_eh@hotmail.com', '1562645580', '', '', 'soler 3485', '0000-00-00', 'capital', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(842, NULL, NULL, 'Nacional', '95705', '2017-01-03 16:40:15', 10, 'AV. ASAMBLEA 1132 - 2º E - CABA', 'HOSPITAL', 'AGONZALEZ', 'danielaantonio@fibertel.com.ar', '1564576963', '', '', 'Av. asamblea 1132 - 2º e - caba', '2020-02-27', 'Caba', 'Hematológa/o', 'Activo', 'eala', 19, '2020-02-27', NULL, '2018-10-23 12:24:32', ''),
	(843, NULL, NULL, 'Provincial', '05114', '2015-02-09 16:20:51', 3, '', '', 'AGONZALEZ', '', '3743-44-7108', '', '', '', '2015-02-09', 'El dorado, Misiones', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(844, NULL, NULL, 'Provincial', '17634', '2017-01-19 11:33:11', 2, 'SANAT DELTA ROSARIO', 'HOSPITAL', 'MARRUZAZABALA', 'gustavobraidot@hotmail.com', '0341-156149225', '', '', 'San Lorenzo 770 1 B', '0000-00-00', 'Rosario', 'Hematólogo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(845, NULL, NULL, 'Provincial', '18002', '2017-01-19 11:33:22', 2, 'SANAT DELTA ROSARIO', '', 'MARRUZAZABALA', 'lau_pussetto@hotmail.com', '0341-156597971', '', '', 'zeballos 2240', '0000-00-00', 'Rosario', 'hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(846, NULL, NULL, 'Nacional', '130448', '2015-06-09 14:43:27', 3, '', '', 'AGONZALEZ', 'drarmocidaivanna@gmail.com', '15-4159-8317', '', '', 'belgrano 2975', '2015-06-08', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(847, NULL, NULL, 'Nacional', '40428', '2016-08-16 09:23:38', 10, 'FUNDACION TIEMPO DE VIVIR', 'HOSPITAL', 'AGONZALEZ', 'maria.pallota@hospitalitaliano.org.ar', '49581351', '', '', 'Gascon 450', '2009-01-01', 'Caba', 'Inmuno-hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(848, NULL, NULL, 'Provincial', '3043', '2015-07-22 11:23:37', 2, '', 'CONSULTORIO', 'AGONZALEZ', 'marmol@hotmail.com', '0349215620806', '', '', 'Moreno 227', '2015-07-21', 'Rafaela, Santa fe', 'Oncologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(849, NULL, NULL, 'Nacional', '122402', '2015-12-04 10:02:38', 1, '', 'HOSPITAL', 'JKIPRIZLIAN', 'roxamica02@hotmail.com', '15-24549666', '', '', '', '2017-01-06', '', 'Onco-hematóloga/o', 'Activo', 'eala', 19, '2019-08-02', NULL, '0000-00-00 00:00:00', ''),
	(850, NULL, NULL, 'Nacional', '129447', '2017-01-04 16:56:45', 2, 'PARANA CONSULTORIO', 'INSTITUCION', 'MNAKATSUNO', 'flornegria@hotmail.com', '4816-4577/15-55697776', '', '', '', '0000-00-00', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(851, NULL, NULL, 'Provincial', '5351', '2015-11-02 13:32:12', 8, 'CORRIENTES', '', 'AGONZALEZ', '', '', '', '', '', '2015-10-06', '', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(852, NULL, NULL, 'Provincial', '36635/7', '2015-11-03 09:28:09', 9, '', '', 'AGONZALEZ', 'daianarodroguez@outlook.com', '(0351) 4529034     (0351) 156106849', '', '', 'Av Libertad 2020', '2015-10-26', '', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(853, NULL, NULL, 'Provincial', '7150', '2015-12-01 12:03:03', 10, 'TUCUMAN', 'CONSULTORIO', 'MNAKATSUNO', 'golubizky@yahoo.com', '0381 5931812', '', '', 'Av Mate de luna 1780', '0000-00-00', '', 'hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(854, NULL, NULL, 'Nacional', '139483', '2016-07-26 09:52:14', 1, 'HOSPITAL CHURRUCA', 'HOSPITAL', 'MNAKATSUNO', 'furqueq@hotmail.com', '11-64998462', '', '', '', '2019-08-14', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-08-14', NULL, '0000-00-00 00:00:00', ''),
	(855, NULL, NULL, 'Nacional', '130364', '2016-06-01 16:51:24', 5, 'CLINICA INDEPENDENCIA', 'SANATORIO', 'MNAKATSUNO', 'mrdgnr@hotmail.com', '15-26455844', '', '', '', '2016-03-15', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(856, NULL, NULL, 'Nacional', '122970', '2015-12-01 12:19:12', 10, 'Hospital Churruca', 'HOSPITAL', 'AGONZALEZ', 'santiagoddv@hotmail.com', '1140257299', '', '', 'Uspallata 3400', '2015-12-01', 'caba', 'hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(857, NULL, NULL, 'Nacional', '77623', '2015-12-04 13:59:06', 10, 'Fundacion Favaloro', 'INSTITUCION', 'AGONZALEZ', 'arossi@ffavaloro.org', '4378-1200 int 4952/54', '', '', 'belgrano 1746', '2015-12-04', 'caba', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-11-09 23:50:00', ''),
	(858, NULL, NULL, 'Nacional', '110624', '2015-12-22 09:13:10', 10, '', '', 'MNAKATSUNO', 'gonzaloferini@yahoo.com.ar', '1558104349', '', '', '', '0000-00-00', '', 'Hematología', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(859, NULL, NULL, 'Nacional', '5397', '2017-01-19 10:20:30', 3, 'CLINICA ESPAÑOLA COMODORO', 'HOSPITAL', 'MARRUZAZABALA', '', '0297-155166917', '', '', 'Consejal martins 846', '2017-11-01', 'Comodoro rivadavia', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-11-06', NULL, '0000-00-00 00:00:00', ''),
	(860, NULL, NULL, 'Provincial', '1297', '2016-01-26 09:32:42', 8, '', 'HOSPITAL', 'MNAKATSUNO', '', '0296515660689/', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(861, NULL, NULL, 'Nacional', '13740', '2017-01-19 10:19:28', 3, 'HOSPITAL CENTRAL DE SAN ISIDRO', 'CONSULTORIO', 'MARRUZAZABALA', '', '1534372790', '', '', '', '2019-07-16', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-07-17', NULL, '2018-10-23 12:24:32', ''),
	(862, NULL, NULL, 'Nacional', '123765', '2017-04-10 16:13:18', 9, 'San Luis', 'HOSPITAL', 'MNAKATSUNO', 'ZAHALILSFEIR@hotnail.com', '1561230019', '', '', '', '0000-00-00', '', 'HEMATOLOGA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(863, NULL, NULL, 'Nacional', '137426', '2016-04-25 14:47:00', 4, 'consultorios cordoba', 'CONSULTORIO', 'MNAKATSUNO', 'sebapastoriza@hotmail.com', '15-6567-7918', '', '', 'ANGEL GALLARDO 899', '0000-00-00', 'CABA', 'HEMATOLOGÍA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(864, NULL, NULL, 'Provincial', '301570', '2017-01-11 16:53:29', 5, 'HOSPITAL T CACERES DE ALLENDE', 'HOSPITAL', 'MARRUZAZABALA', '', '351 662 0942   de 7 a 17 hs', '', '', 'Bouchard 1250', '2011-01-03', 'Cordoba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(865, NULL, NULL, 'Nacional', '17304', '2017-01-19 11:14:57', 2, 'SANAT. PARQUE ROSARIO', '', 'MARRUZAZABALA', 'mavictoriagodoy@hotmail.com', '0341-4200286', '', '', 'Bv. Oroño 860', '0000-00-00', 'Rosario', 'Hematóloga', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(866, NULL, NULL, 'Nacional', '128098', '2017-01-19 10:18:22', 3, 'HOSPITAL DR RODOLFO ROSSI', '', 'MARRUZAZABALA', 'mariacecidacun@hotmail.com', '0221155344216/4257226', '', '', 'CALLE 37. N° 183', '0000-00-00', 'LA PLATA', 'HEMATÓLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(867, NULL, NULL, 'Nacional', '85265', '2017-01-19 10:25:56', 3, 'USHUAIA', 'HOSPITAL', 'MARRUZAZABALA', 'laurametche@yahoo.com.ar', '2964-401375', '', '', '', '2019-11-19', 'Usuahia', 'Hematológa/o', 'Activo', 'eala', 19, '2019-11-19', NULL, '2018-10-23 12:24:32', ''),
	(868, NULL, NULL, 'Nacional', '77506', '2017-01-23 10:46:29', 8, 'CONSULTORIO', 'HOSPITAL', 'MARRUZAZABALA', 'danielfassi@yahoo.com.ar', '49812778', '', '', 'Hidalgo 775', '2019-05-07', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-05-07', NULL, '0000-00-00 00:00:00', ''),
	(870, NULL, NULL, 'Provincial', '4314', '2017-01-16 15:59:01', 4, 'Salta Hospital del milagro', 'HOSPITAL', 'MNAKATSUNO', 'ivananavarrete@gmail.com', '0387-507-4220', '', '', '', '0000-00-00', 'Salta', 'HEMATOLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(871, NULL, NULL, 'Nacional', '126552', '2017-04-10 15:51:17', 10, 'Hospital Pirovano', '', 'MNAKATSUNO', 'azulcuba@hotmail.com', '4991-4491', '', '', 'Cramer 480', '0000-00-00', 'caba', 'HEMATOLOGA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(872, NULL, NULL, 'Nacional', '92178', '2017-05-03 12:12:43', 10, 'Alexander Fleming', '', 'MNAKATSUNO', 'rcustidiano@hotmail.com', '11-4051-0781', '', '', 'cramer 1180', '0000-00-00', 'caba', 'HEMATOLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(873, NULL, NULL, 'Provincial', '0000', '2016-06-09 09:40:04', 9, '', 'HOSPITAL', 'FCASTRO', 'lore.sartori4@hotmail.com', '0351-4686200/157678636', '', '', '', '0000-00-00', '', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(874, NULL, NULL, 'Provincial', '17309', '2017-01-19 11:24:05', 2, 'HOSP. CENTENARIO', 'CONSULTORIO', 'MARRUZAZABALA', 'luis.cinara@gmail.com', '0341-155801116', '', '', '', '0000-00-00', 'ROSARIO', 'Hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(875, NULL, NULL, 'Provincial', '58250', '2017-04-10 16:16:45', 8, 'HOSPITAL AUSTRAL', 'HOSPITAL', 'MNAKATSUNO', 'jtrucco@cas.austral.edu.ar', '02304482430', '', '', '', '0000-00-00', '', 'Hematología', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(876, NULL, NULL, 'Nacional', '116152', '2016-10-03 11:31:12', 9, 'INSTITUTO HOPE', 'INSTITUCION', 'AGONZALEZ', 'gabrielcampregher@yahoo.com.ar', '3804 21 8759', '', '', '', '0000-00-00', '', 'HEMATÓLOGO', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(877, NULL, NULL, 'Provincial', '2441', '2017-01-11 12:53:31', 1, 'BAHIA BLANCA HOSP PENNA', 'HOSPITAL', 'MARRUZAZABALA', 'martinbecca@hotmail.com', '0293215494446', '', '', 'humberto 1 458, punta alta', '0000-00-00', 'BAHIA BLANCA', 'hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(878, NULL, NULL, 'Provincial', '6798', '2016-08-23 11:40:16', 8, 'CORRIENTES', 'CONSULTORIO', 'MNAKATSUNO', 'anaemartin@hotmail.com', '3794399076', '', '', '', '0000-00-00', 'CORRIENTES', 'Hematóloga', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(879, NULL, NULL, 'Nacional', '118785', '2016-07-27 12:27:12', 1, 'CASTRO', 'HOSPITAL', 'AGONZALEZ', 'hematocastro@gmail.com', '0299-4490812', '', '', 'Buenos aires 450', '2017-01-18', 'Neuquen', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-01-18', NULL, '2018-10-24 08:42:42', ''),
	(880, NULL, NULL, 'Nacional', '129701', '2016-08-23 11:38:53', 10, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'MNAKATSUNO', 'juanpa.arriola@gmail.com', '15-5389-3217', '', '', 'Cordoba 2351', '1916-09-11', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-08-14', NULL, '0000-00-00 00:00:00', ''),
	(881, NULL, NULL, 'Provincial', '94938', '2017-01-11 12:45:39', 1, 'HOSP AGUDOS MAR DEL PLATA', 'HOSPITAL', 'MARRUZAZABALA', 'pgiarini@gmail.com', '0223-155419607', '', '', 'españa 1555 piso 4', '0000-00-00', 'mar del plata', 'HEMATOLOGA', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(882, NULL, NULL, 'Provincial', '3192', '2016-09-05 10:38:24', 10, '', '', 'AGONZALEZ', 'andreasbustos@gmail.com', '0351-645-2383', '', '', 'Belgrano y Posadas', '2016-09-05', '', 'HEMATOLOGA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-12-16 23:50:00', ''),
	(883, NULL, NULL, 'Provincial', '16157', '2017-01-11 16:52:30', 9, 'CORDOBA CLINICA REINA FABIOLA', '', 'MARRUZAZABALA', 'cecbraxs@hotmail.com', '0351-5172642', '', '', '', '0000-00-00', '', 'Hematóloga', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(884, NULL, NULL, 'Nacional', '134500', '2017-01-19 10:31:19', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', 'MARRUZAZABALA', 'ceciliasernaque@hotmail.com', '15-55993722', '', '', 'Solis 2171 PB', '0000-00-00', 'CABA', 'Hematóloga', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(885, NULL, NULL, 'Nacional', '141227', '2017-07-27 15:50:51', 10, 'HOSPITAL DR CARLOS DURAND', 'HOSPITAL', 'MNAKATSUNO', 'virginiacourreges@hotmail.com', '1162349352', '', '', 'Cordoba 3515 8b', '2018-11-01', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-11-05', NULL, '0000-00-00 00:00:00', ''),
	(886, NULL, NULL, 'Nacional', '1322', '2017-01-19 10:24:13', 3, 'COMODORO CONSULTORIO', '', 'MARRUZAZABALA', 'ceh_cr@yahoo.com.ar', '02976250408', '', '', '', '0000-00-00', 'Comodoro Rivadavia', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(887, NULL, NULL, 'Nacional', '78009', '2017-05-26 10:15:50', 10, 'ANM', 'INSTITUCION', 'MNAKATSUNO', 'msarmiento@hematologia.anm.edu.ar', '48255759', '', '', 'pacheco de melo 3081 pb', '0000-00-00', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(888, NULL, NULL, 'Nacional', '131405', '2017-01-24 10:28:58', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'MARRUZAZABALA', 'gregoriocordini@gmail.com', '1530212054', '', '', 'cordoba 2351', '0000-00-00', 'caba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(889, NULL, NULL, 'Nacional', '140953', '2017-04-10 16:08:29', 5, 'ROFFO', 'HOSPITAL', 'MNAKATSUNO', 'mavi.pezzolo@live.com', '1551894512', '', '', 'Av libertador 6302', '2010-01-01', 'Caba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(890, NULL, NULL, 'Nacional', '134690', '2017-06-30 15:57:59', 3, '', '', 'JKIPRIZLIAN', 'eciliberti@fundaleu.org.ar', '48771000', '', '', 'uriburu1480', '0000-00-00', 'caba', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(891, NULL, NULL, 'Nacional', '147255', '2017-04-10 16:19:48', 5, 'HOSPITAL TORNU', 'HOSPITAL', 'MNAKATSUNO', 'fresiayabeta@yahoo.es', '1167080099', '', '', 'Plaza 1144', '2010-01-01', 'Caba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(892, NULL, NULL, 'Nacional', '136992', '2017-04-10 15:57:37', 10, 'Alexander Fleming', 'INSTITUCION', 'MNAKATSUNO', 'mluciafuente@gmail.com', '1558526368', '', '', 'Cramer 1180', '0000-00-00', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(893, NULL, NULL, 'Provincial', '2801', '2016-12-19 14:25:47', 8, 'CONSULTORIO', 'CONSULTORIO', 'GPARDO', 'tasaravi@yahoo.com.ar', '02944-692826', '', '', 'LOS NOTROS s/n', '0000-00-00', 'LAGO PUELO', 'CLINICA MEDICA', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(894, NULL, NULL, 'Nacional', '147341', '2017-07-27 15:54:15', 10, 'CENTRO DE SALUD TUCUMAN', 'HOSPITAL', 'MNAKATSUNO', 'gritaanahi@yahoo.com.ar', '0381-155175784', '', '', 'Av mate de luna 1780 1 piso', '2018-07-16', 'Tucuman', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-07-23', NULL, '0000-00-00 00:00:00', ''),
	(895, NULL, NULL, 'Nacional', '133843', '2017-01-09 10:00:00', 10, '', '', 'AGONZALEZ', 'mariasilvia824@gmail.com', '0381-155392402', '', '', 'alberdi 550', '2016-12-19', 'tucuman', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(896, NULL, NULL, 'Provincial', '117327', '2017-01-09 10:05:21', 3, '', 'HOSPITAL', 'AGONZALEZ', 'dav_almada@hotmail.com', '0221- 155856450', '', '', 'Calle 33 nro 298', '2019-01-02', 'La plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-01-02', NULL, '0000-00-00 00:00:00', ''),
	(897, NULL, NULL, 'Provincial', '17181', '2017-01-09 10:07:08', 3, '', 'HOSPITAL', 'AGONZALEZ', 'gabriela.balaguer@hotmail.com', '0221-155619902', '', '', '37 nro 183 4 piso entre 116 y 117', '2016-11-17', 'La plata', 'Inmuno-hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(898, NULL, NULL, 'Provincial', '17783', '2017-01-09 10:09:12', 3, '', '', 'AGONZALEZ', 'noradoymovich@hotmail.com', '0221-4825064', '', '', 'Plaza españa 103', '2016-11-17', 'La Plata', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(899, NULL, NULL, 'Nacional', '138121', '2017-01-09 10:13:16', 5, '', 'HOSPITAL', 'AGONZALEZ', 'fernandoabelairas@yahoo.com.ar', '1134631156', '', '', 'Illia y marconi s/n', '2016-11-17', 'Palomar', 'Médica/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(900, NULL, NULL, 'Nacional', '13A365', '2017-01-09 10:15:15', 8, '', '', 'AGONZALEZ', 'marifbr@gmail.com', '1157179850', '', '', 'marconi e illia s/n', '2016-11-17', 'palomar', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(901, NULL, NULL, 'Nacional', '144938', '2017-01-09 10:26:32', 3, 'Hospital Britanico', 'HOSPITAL', 'AGONZALEZ', 'micaquar@hotmail.com', '0341-156423963', '', '', 'Solis 2171', '2016-11-17', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(902, NULL, NULL, 'Nacional', '334407', '2017-01-09 10:42:19', 4, 'PAROISSIEN', '', 'AGONZALEZ', 'carolinalazzarino@hotmail.com', '1541721626', '', '', 'santa maria 664', '0000-00-00', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(903, NULL, NULL, 'Nacional', '148876', '2017-01-09 10:51:41', 4, '', '', 'AGONZALEZ', 'Juan_lanari@yahoo.com', '0379-4690802', '', '', 'Av la Plata 555', '2016-11-17', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(904, NULL, NULL, 'Nacional', '138306', '2017-01-09 10:53:59', 5, '', 'HOSPITAL', 'AGONZALEZ', 'luciahematologia@hotmail.com', '1163510551', '', '', 'San lorenzo 164 4d, ramos mejia', '2016-11-17', 'Buenos aires', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(905, NULL, NULL, 'Nacional', '139518', '2017-01-09 10:56:45', 4, '', 'HOSPITAL', 'AGONZALEZ', 'lautaroalmeida@hotmail.com', '0343154802132', '', '', 'Acuña de figueroa 1240', '2018-06-12', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-06-28', NULL, '0000-00-00 00:00:00', ''),
	(906, NULL, NULL, 'Nacional', '131987', '2017-01-09 11:00:09', 4, '', 'HOSPITAL', 'AGONZALEZ', 'luciaboedo85@hotmail.com', '1564476182', '', '', 'Cabrera 3380 5b', '2018-08-08', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-08-09', NULL, '0000-00-00 00:00:00', ''),
	(907, NULL, NULL, 'Provincial', '113973', '2017-01-09 11:02:50', 3, '', 'HOSPITAL', 'AGONZALEZ', 'aleale752002@yahoo.com.ar', '1165360947', '', '', 'Calchaqui 5401', '2016-11-17', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(908, NULL, NULL, 'Nacional', '125515', '2017-01-09 11:06:07', 10, 'HOSP DR CHURRUCA VISCA', 'HOSPITAL', 'AGONZALEZ', 'laila_mn33@hotmail.com', '1123805126', '', '', 'Gurruchaga 274 5to 6', '2016-11-17', 'Caba', 'Hematológa/o', 'Activo', 'mnakatsuno', 19, '2019-01-11', NULL, '0000-00-00 00:00:00', ''),
	(909, NULL, NULL, 'Nacional', '138350', '2017-01-09 11:10:21', 8, '', '', 'AGONZALEZ', 'romipenalba@gmail.com', '1534256438', '', '', 'uspallata 3470', '2016-11-17', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(910, NULL, NULL, 'Nacional', '147448', '2017-01-09 11:12:41', 5, '', 'HOSPITAL', 'AGONZALEZ', 'sofia.burgos.a@gmail.com', '1156141396', '', '', 'Don bosco 3755 5d', '2016-11-17', '', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-10-22', NULL, '2018-10-24 08:42:42', ''),
	(911, NULL, NULL, 'Nacional', '143780', '2017-01-09 11:15:00', 5, '', 'HOSPITAL', 'AGONZALEZ', 'veronicavallejom@gmail.com', '1123862153', '', '', 'Rosario 814 7b', '2016-11-17', 'Caba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(912, NULL, NULL, 'Nacional', '133230', '2017-01-09 11:17:23', 8, '', '', 'AGONZALEZ', 'vapaumarcze@hotmail.com', '02323-15549267', '', '', 'Juan B justo 478, Lujan', '2016-11-17', 'Buenos Aires', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(913, NULL, NULL, 'Nacional', '129184', '2017-01-09 11:19:37', 10, 'Italiano', 'HOSPITAL', 'AGONZALEZ', 'alberto.gimenez@hiba.org.ar', '49590200', '', '', 'peron 4190', '2016-11-17', 'caba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(914, NULL, NULL, 'Nacional', '137889', '2017-04-10 16:19:11', 3, 'Fundaleu', 'INSTITUCION', 'MNAKATSUNO', 'bwannesson@fundaleu.org.ar', '1540572414', '', '', 'uriburu 1450', '0000-00-00', 'caba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(915, NULL, NULL, 'Nacional', '149052', '2017-01-09 11:27:40', 5, '', 'HOSPITAL', 'AGONZALEZ', 'riveramariajimena@gmail.com', '1168897708', '', '', 'Urquiza 609', '2016-11-17', 'Ramos mejia', 'Médica/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(916, NULL, NULL, 'Nacional', '126506', '2017-06-27 15:39:43', 8, 'CONSULTORIO', 'CONSULTORIO', 'MNAKATSUNO', 'victoriacaula@gmail.com', '1132364222', '', '', 'coronel diaz 2583', '0000-00-00', 'caba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(917, NULL, NULL, 'Nacional', '73714', '2017-01-09 11:39:30', 4, '', 'HOSPITAL', 'AGONZALEZ', 'umma.moni@gmail.com', '46341438', '', '', 'Avellaneda 2150 2c', '2016-11-17', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-04-03', NULL, '2018-10-24 08:42:42', ''),
	(918, NULL, NULL, 'Nacional', '140374', '2017-01-09 11:41:36', 5, '', 'HOSPITAL', 'AGONZALEZ', 'wchirino@hotmail.com', '', '', '', 'Suipacha 670', '2016-11-17', 'Caba', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-10-22', NULL, '2018-10-24 08:42:42', ''),
	(919, NULL, NULL, 'Nacional', '138225', '2017-01-09 11:43:33', 4, '', 'HOSPITAL', 'AGONZALEZ', 'requenapaula@hotmail.com', '1560394024', '', '', '', '2019-01-28', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-01-28', NULL, '2018-10-24 08:42:42', ''),
	(920, NULL, NULL, 'Nacional', '153788', '2017-01-09 11:47:42', 10, 'Ramos mejia', 'HOSPITAL', 'AGONZALEZ', 'elviraparellada@hotmail.com', '', '', '', 'urquiza 609', '2016-11-17', 'caba', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(921, NULL, NULL, 'Nacional', '106362', '2017-01-09 11:49:48', 8, 'Hospital naval', 'HOSPITAL', 'AGONZALEZ', 'mmagusaenz@gmail.com', '1569638534', '', '', 'patricias argentinas 351', '2016-11-17', 'caba', 'Hematologa', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-11-15 23:50:00', ''),
	(922, NULL, NULL, 'Nacional', '151465', '2017-01-09 11:52:12', 10, '', '', 'AGONZALEZ', 'veronicalingeri@hotmail.com', '1537799106', '', '', 'paris 2954', '2016-11-17', '', 'Hematologo', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(923, NULL, NULL, 'Nacional', '6783', '2017-01-09 11:54:27', 8, '', 'HOSPITAL', 'AGONZALEZ', 'reneecrisp@gmail.com', '1541419144', '', '', 'Fernandez de enciso 4602', '2016-11-17', 'Caba', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-10-22', NULL, '2018-10-24 08:42:42', ''),
	(924, NULL, NULL, 'Nacional', '137547', '2017-01-09 11:58:38', 5, '', 'HOSPITAL', 'AGONZALEZ', 'nancy.cristaldo@hiba.org.ar', '1540952525', '', '', 'Humauaca 3870 8 b', '2016-11-17', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(925, NULL, NULL, 'Nacional', '136270', '2017-01-10 08:56:07', 10, 'Hospital Italiano', 'HOSPITAL', 'AGONZALEZ', 'maria.perusini@hiba.org.ar', '1164364448', '', '', 'dorrego 2682', '2016-11-17', 'caba', '', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(926, NULL, NULL, 'Nacional', '137492', '2017-01-10 08:59:08', 10, 'HOSPITAL ITALIANO', 'HOSPITAL', 'AGONZALEZ', 'erikabrula@hospitalitaliano.org.ar', '1568033428', '', '', 'Sarmiento 2265', '2019-10-10', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-10-10', NULL, '2018-10-24 08:42:42', ''),
	(927, NULL, NULL, 'Nacional', '133435', '2017-01-10 09:01:56', 10, 'Hospital Italiano', 'HOSPITAL', 'AGONZALEZ', 'cristian.seehaus@hospitalitaliano.org.ar', '1567636401', '', '', 'Peron 4190', '2016-11-17', 'caba', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(928, NULL, NULL, 'Nacional', '152090', '2017-01-10 09:07:08', 9, 'HOSPITAL ITALIANO', 'HOSPITAL', 'AGONZALEZ', 'veronica.privitera@hospitalitaliano.org.ar', '0381-155-523276', '', '', 'Saenz peña 157', '2016-11-17', '', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-10-22', NULL, '2018-10-23 12:24:32', ''),
	(929, NULL, NULL, 'Provincial', '334046', '2017-01-19 08:50:17', 1, 'Hospital Penna', '', 'AGONZALEZ', 'cesarjs@hotmail.com', '34679555', '', '', 'Viamonte 143', '2017-01-03', 'Bahia Blanca', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(930, NULL, NULL, 'Provincial', '5646', '2017-01-23 08:33:14', 9, '', 'HOSPITAL', 'AGONZALEZ', 'nicolaslupo@yahoo.com.ar', '0261-3024713', '', '', 'Alem y salta', '2016-12-13', 'Mendoza', 'Hematológa/o', 'Activo', 'eala', 19, '2019-10-17', NULL, '2018-10-23 12:24:32', ''),
	(931, NULL, NULL, 'Nacional', '115696', '2017-02-06 09:58:33', 1, 'Municipal', 'HOSPITAL', 'AGONZALEZ', 'santiagoboughen@hotmail.com', '02915786025', '', '', 'Estomba 962', '2017-01-04', 'bahia Blanca', 'Hematologo', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(932, NULL, NULL, 'Nacional', '84592', '2017-05-26 10:16:19', 4, 'HOSPITAL ARGERICH', 'HOSPITAL', 'MNAKATSUNO', 'salvador_teresa@hotmail.com', '1557286826', '', '', 'magali 750', '0000-00-00', 'caba', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(933, NULL, NULL, 'Nacional', '121112', '2017-05-26 10:16:37', 4, 'HOSPITAL CLINICAS J DE SAN MARTIN', 'HOSPITAL', 'MNAKATSUNO', 'laurabcolin@hotmail.com', '15-6570-8748', '', '', 'codoba 2351', '0000-00-00', 'caba', '', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(934, NULL, NULL, 'Provincial', '58826', '2017-03-08 15:37:25', 8, '', 'HOSPITAL', 'AGONZALEZ', 'mariainespaganini@hotmail.com', '155564841', '', '', 'Peron 1500', '2016-12-19', 'Derqui', 'otro', 'Activo', 'agonzalez', 19, '2018-10-23', NULL, '0000-00-00 00:00:00', ''),
	(935, NULL, NULL, 'Provincial', '94850', '2017-03-27 10:14:31', 1, '', '', 'AGONZALEZ', 'alenndez@yahoo.com.ar', '0223-4994000', '', '', 'españa 1555 piso 4P', '2016-12-21', 'mar del plata', 'hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(936, NULL, NULL, 'Provincial', '32466', '2017-03-27 10:16:28', 4, '', 'HOSPITAL', 'AGONZALEZ', 'luacianarissopatron@gmail.com', '', '', '', 'Naciones unidas 346', '2016-12-07', 'Cordoba', 'Hematológa/o', 'Activo', 'eala', 19, '2019-05-13', NULL, '2018-10-24 08:42:42', ''),
	(937, NULL, NULL, 'Provincial', '91333', '2017-03-28 10:00:46', 9, 'HOSPITAL PRIVADO', 'HOSPITAL', 'AGONZALEZ', 'claudia.martin@hospitalprivado.com.ar', '0351-155590424', '', '', 'Riccieri 2200', '2020-02-03', 'Cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2020-02-03', NULL, '2018-10-24 08:42:42', ''),
	(938, NULL, NULL, 'Provincial', '30564', '2017-07-17 15:57:12', 9, 'cordoba sanatorio allende', 'HOSPITAL', 'MNAKATSUNO', 'soljarchum@hotmail.com', '4269275 o 156657014', '4269275', '', 'Yrigoyen 384', '0000-00-00', 'cordoba', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(939, NULL, NULL, 'Provincial', '34743', '2017-03-29 10:37:32', 9, 'HOSPITAL ONCOLOGICO SAN ROQUE', 'HOSPITAL', 'AGONZALEZ', 'MAGDAMARTINEZ20@HOTMAIL.COM', '0351-153064154', '', '', 'BAJADA PUCCARA 1900', '2017-01-04', 'CORDOBA', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(940, NULL, NULL, 'Provincial', '33198', '2017-03-29 11:15:08', 9, '', '', 'AGONZALEZ', 'giselamaspero@gmail.com', '03515189847', '', '', 'oncativo 1248', '2016-12-22', 'cordoba', 'hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(941, NULL, NULL, 'Nacional', '133891', '2017-04-03 16:09:48', 8, 'HOSPITAL MADARIAGA DE POSADAS', 'HOSPITAL', 'AGONZALEZ', '', '03764603403', '', '', '', '2017-03-22', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-29', NULL, '0000-00-00 00:00:00', ''),
	(942, NULL, NULL, 'Provincial', '10570', '2017-04-07 16:44:02', 9, '', 'HOSPITAL', 'AGONZALEZ', 'juanlopez32@hotmail.com', '0261155580030', '', '', 'J.v.gonzalez 245', '2016-12-15', 'Mendoza', 'Hematológa/o', 'Activo', 'eala', 19, '2019-11-20', NULL, '2018-10-24 08:42:42', ''),
	(943, NULL, NULL, 'Provincial', '5627', '2017-04-19 09:47:44', 9, '', 'HOSPITAL', 'AGONZALEZ', 'frapagne@hotmail.com', '0261-155392291', '', '', 'salta y alem', '2016-12-13', 'mendoza', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-23 12:24:32', ''),
	(944, NULL, NULL, 'Provincial', '10410', '2017-04-19 09:50:00', 9, '', '', 'AGONZALEZ', 'jolabanca@hotmail.com', '0261795908', '', '', 'belgrano 545', '2016-12-13', 'mendoza', 'Clinico', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(945, NULL, NULL, 'Provincial', '4268', '2017-05-02 16:47:22', 4, '', 'HOSPITAL', 'AGONZALEZ', '', '0387156143800', '', '', 'Tobias 69', '2016-12-21', 'Salta', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(946, NULL, NULL, 'Provincial', '12082', '2017-05-02 16:48:54', 9, '', 'HOSPITAL', 'AGONZALEZ', 'virgi411@gmail.com', '', '', '', 'Joaquin v gonzalez 245', '2016-12-15', 'Godoy cruz, mendoza', 'Hematológa/o', 'Activo', 'eala', 19, '2020-01-16', NULL, '2018-10-24 08:42:42', ''),
	(947, NULL, NULL, 'Provincial', '24592', '2017-05-30 16:41:00', 5, '', 'HOSPITAL', 'AGONZALEZ', 'reinaldogg@yahoo.com.ar', '03544424345/0354415403215', '', '', '', '2017-05-14', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(948, NULL, NULL, 'Provincial', '32218', '2017-05-24 09:19:56', 9, '', '', 'AGONZALEZ', 'emiliamas@hotmail.com', '0351155295393', '', '', 'Obispo oro 42', '2016-12-20', 'cordoba', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(949, NULL, NULL, 'Provincial', '30674', '2017-05-24 09:21:46', 4, '', '', 'AGONZALEZ', 'veronicaseifi@hotmail.com', '1564301549', '', '', 'General Deheza 542', '2016-12-19', 'caba', 'medico', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(950, NULL, NULL, 'Nacional', '116516', '2017-05-24 09:23:54', 5, 'ARGERICH', 'HOSPITAL', 'AGONZALEZ', 'hidfe29@hotmail.com', '1541939155', '', '', 'Luis ma campos 726', '2016-12-07', '', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2018-10-22', NULL, '0000-00-00 00:00:00', ''),
	(951, NULL, NULL, 'Provincial', '3275', '2017-05-24 09:25:25', 9, '', 'HOSPITAL', 'AGONZALEZ', 'yaninasuarez1@live.com', '2645885626', '', '', 'Av libertador y r coliver', '2017-02-22', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-11-30', NULL, '0000-00-00 00:00:00', ''),
	(952, NULL, NULL, 'Nacional', '153508', '2017-07-27 15:49:55', 10, '', 'INSTITUCION', 'MNAKATSUNO', 'cecie@hotmail.com', '0221-156428602', '', '', 'Cordoba 3490 5 a', '2012-03-27', 'La plata', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(953, NULL, NULL, 'Provincial', '4085', '2017-05-29 09:53:34', 4, '', 'CONSULTORIO', 'AGONZALEZ', 'drachime@yahoo.com.ar', '155010822 o 4320300 int 239', '', '', 'Hirigoyen 1232', '2016-12-20', 'Salta', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-08-24', NULL, '2018-10-24 08:42:42', ''),
	(954, NULL, NULL, 'Provincial', '9449', '2017-05-29 09:54:59', 9, '', 'HOSPITAL', 'AGONZALEZ', 'roxicapi@hotmail.com', '0261-6574-888', '', '', 'Joaquin v gonzalez 244', '2016-12-15', 'Godoy cruz', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-11-12', NULL, '2018-10-24 08:42:42', ''),
	(955, NULL, NULL, 'Provincial', '33578', '2017-05-29 15:58:58', 9, 'Cordoba', 'HOSPITAL', 'AGONZALEZ', 'labd1776@hotmail.com', '155608008', '', '', 'Patricia 656', '2016-12-19', '', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(956, NULL, NULL, 'Provincial', '10666', '2017-05-29 16:32:09', 9, '', '', 'AGONZALEZ', 'dianacazadora02@hotmail.com', '02613663303', '', '', 'salta y alem', '2016-12-13', '', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(957, NULL, NULL, 'Nacional', '10442', '2017-05-29 16:33:22', 9, '', 'HOSPITAL', 'AGONZALEZ', 'giselainesfusari@gmail.com', '4228800 int 9026', '', '', '', '2019-11-20', 'Mendoza', 'Hematológa/o', 'Activo', 'eala', 19, '2019-11-20', NULL, '0000-00-00 00:00:00', ''),
	(958, NULL, NULL, 'Provincial', '55199', '2017-06-06 09:30:22', 9, '', '', 'AGONZALEZ', 'leandro_castellanos@hotmail.com', '0351153400195', '', '', 'naciones unidas 346', '2017-05-22', 'cordoba', 'medico cirujano', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(959, NULL, NULL, 'Provincial', '6009', '2017-07-27 15:56:55', 1, 'Bariloche', 'CONSULTORIO', 'MNAKATSUNO', 'celia77castello@yahoo.com.ar', '154248280', '', '', '20 de febrero 598', '0000-00-00', 'Bariloche', 'Hematologia', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(960, NULL, NULL, 'Provincial', '35671', '2017-06-19 14:46:01', 9, '', 'HOSPITAL', 'AGONZALEZ', 'evycolombo@gmail.com', '03516374518', '', '', 'Ob oro 42', '2020-03-11', 'Cordoba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2020-03-11', NULL, '2018-10-24 08:42:42', ''),
	(961, NULL, NULL, 'Nacional', '140417', '2017-06-29 15:51:24', 3, 'Hospital Britanico', 'HOSPITAL', 'JKIPRIZLIAN', '', '', '', '', '', '2016-08-01', '', 'Hematologa', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(962, NULL, NULL, 'Nacional', '140598', '2017-06-30 11:02:53', 10, '', 'HOSPITAL', 'AGONZALEZ', 'luciana-galelli@hotmail.com', '1166087468', '', '', 'Luis maria campos 751', '2019-08-16', 'Caba', 'Hematológa/o', 'Activo', 'eala', 19, '2019-08-16', NULL, '2018-10-24 08:42:42', ''),
	(963, NULL, NULL, 'Nacional', '145343', '2017-07-20 14:58:55', 8, '', 'HOSPITAL', 'AGONZALEZ', '', '1530140403', '', '', 'Sanchez de bustamante  1969 1d', '2017-07-18', 'Caba', 'Médica/o', 'Activo', 'eala', 19, '2018-12-17', NULL, '0000-00-00 00:00:00', ''),
	(964, NULL, NULL, 'Provincial', '9015', '2017-07-20 15:00:53', 1, '', 'HOSPITAL', 'AGONZALEZ', '', '02604679122', '', '', 'Comandate torres 150', '2019-01-03', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-01-03', NULL, '2018-10-24 08:42:42', ''),
	(965, NULL, NULL, 'Provincial', '26757', '2017-08-22 09:36:08', 9, '', 'HOSPITAL', NULL, 'JULIETA.OLMEDO@HOSPITALPRIVADOSA.COM.AR', '3228-1563', '', '', 'Naciones unidas 346', '2017-08-10', 'Cordoba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(966, NULL, NULL, 'Nacional', '29294', '2017-08-22 10:13:35', 8, '', 'HOSPITAL', NULL, '', '2804325012', '', '', 'Ameghino 447, trelew', '2017-08-16', 'Chubut', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-09-08', NULL, '2018-10-23 12:24:32', ''),
	(967, NULL, NULL, 'Provincial', '7971', '2017-08-30 15:27:34', 10, '', 'HOSPITAL', NULL, 'diegofajardo@hotmail.com', '0381-155358428', '', '', 'Avellaneda 750', '2017-08-30', '', 'Médica/o', 'Activo', 'agonzalez', 19, '2017-09-13', NULL, '0000-00-00 00:00:00', ''),
	(968, NULL, NULL, 'Provincial', '9519', '2017-09-01 14:03:25', 2, '', 'HOSPITAL', NULL, 'sacinmar@hotmail.com', '0343155070018', '', '', '25 de mayo 890 , libertador san martin', '2017-08-08', 'Entre rios', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-09-01', NULL, '0000-00-00 00:00:00', ''),
	(969, NULL, NULL, 'Provincial', '31480', '2017-09-01 14:27:42', 9, '', 'HOSPITAL', NULL, 'caro.villegas.daros@gmail.com', '03512419399', '', '', 'Naciones unidas 346', '2017-08-22', 'Cordoba', 'Hematológa/o', 'Inactivo', 'agonzalez', 20, '2017-09-01', NULL, '2018-10-24 08:42:42', ''),
	(970, NULL, NULL, 'Provincial', '1925', '2017-09-05 09:50:55', 9, '', 'HOSPITAL', NULL, 'mercedesgomezherrera@gmail.com', '02645048787', '', '', 'Guemes 170 sur', '2017-08-23', 'San juan', 'Hematológa/o', 'Activo', 'pmiranda', 19, '2018-03-02', NULL, '0000-00-00 00:00:00', ''),
	(971, NULL, NULL, 'Nacional', '128594', '2017-09-07 08:15:51', 10, '', 'HOSPITAL', NULL, 'maragagazzoni@gmail.com', '1568918478', '', '', 'Bonpland 2356, pb d', '2017-09-04', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(972, NULL, NULL, 'Provincial', '2644', '2017-09-08 08:43:56', 8, '', 'HOSPITAL', NULL, 'm.cristinasanz@hotmail.com', '280-4384304', '', '', 'Ameghino 447, trelew', '2017-08-16', 'Chubut', 'Médica/o', 'Inactivo', '', 20, '0000-00-00', NULL, '2018-10-24 08:42:42', ''),
	(973, NULL, NULL, 'Provincial', '1134', '2017-09-15 09:03:01', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2017-09-15', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(974, NULL, NULL, 'Nacional', '129813', '2017-09-25 16:02:09', 8, '', 'HOSPITAL', NULL, 'ecarricondo@yahoo.com.ar', '', '', '', 'Aguero 1105 dpto 24', '2017-09-20', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-23', NULL, '0000-00-00 00:00:00', ''),
	(975, NULL, NULL, 'Provincial', '4599', '2017-10-06 16:12:58', 3, '', 'HOSPITAL', NULL, '', '376-429-3477', '', '', '', '2017-10-06', 'Misiones', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(976, NULL, NULL, 'Provincial', '71137', '2017-10-11 15:41:01', 8, '', 'HOSPITAL', NULL, '', '54 9 2396 58 9433', '', '', '', '2017-10-11', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-10-12', NULL, '0000-00-00 00:00:00', ''),
	(977, NULL, NULL, 'Nacional', '137069', '2017-10-31 13:46:35', 10, '', 'HOSPITAL', NULL, 'giselacapri@hotmail.com', '1538268838', '', '', '', '2017-10-31', '', 'Hematológa/o', 'Activo', 'eala', 19, '2018-11-21', NULL, '2018-11-01 23:50:00', ''),
	(978, NULL, NULL, 'Nacional', '140844', '2017-11-03 09:23:46', 8, '', 'HOSPITAL', NULL, 'marcelabarberis@hotmail.com', '2344446341', '', '', 'Alem 3575', '2017-09-21', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(979, NULL, NULL, 'Provincial', '12345', '2017-11-13 14:59:49', 3, '', 'HOSPITAL', NULL, 'avany2006@hotmail.com', '', '', '', '', '2017-08-29', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2017-11-13', NULL, '0000-00-00 00:00:00', ''),
	(980, NULL, NULL, 'Nacional', '133746', '2017-12-22 11:45:18', 4, 'HOSPITAL DE CLÍNICAS', 'HOSPITAL', NULL, 'mariofiorentino@hotmail.com', '1531152012', '', '', 'Av cÓrdoba 2351', '2017-12-21', 'Ciudad de buenos aires', 'hematologia', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(981, NULL, NULL, 'Nacional', '133746', '2018-01-02 15:05:21', 2, '', 'HOSPITAL', NULL, 'mariofiorentino@hotmail.com', '1531152012', '', '', 'Cordoba 2351', '2017-12-21', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-03-07', NULL, '0000-00-00 00:00:00', ''),
	(982, NULL, NULL, 'Provincial', '115352', '2018-01-10 07:30:45', 3, '', 'HOSPITAL', NULL, 'COLOMBIFACUNDO@GMAIL.COM', '0221155551441', '', '', '37 entre 117 y 117 n°183', '2018-01-08', 'La plata', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(983, NULL, NULL, 'Provincial', '8285', '2018-01-10 14:10:26', 10, '', 'HOSPITAL', NULL, 'siliraidinitaboada@gmail.com', '0381156438269', '', '', 'Mendoza 128', '2018-01-10', 'Tucuman', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(984, NULL, NULL, 'Nacional', '114853', '2018-01-15 09:08:22', 8, '', 'HOSPITAL', NULL, 'lealmp@hotmail.com', '46305793', '', '', 'Pilar 950', '2017-12-11', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(985, NULL, NULL, 'Provincial', '94446', '2018-01-18 15:20:23', 1, '', 'HOSPITAL', NULL, '', '2494312682', '', '', 'Chacabuco 45', '2017-01-26', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(986, NULL, NULL, 'Provincial', '2500', '2018-01-18 15:30:56', 1, '', 'HOSPITAL', NULL, '', '0351152242272', '', '', 'Esmeralda 282', '2017-01-12', 'La pampa', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(987, NULL, NULL, 'Nacional', '64085', '2018-01-29 10:22:58', 4, '', 'CONSULTORIO', NULL, 'drmanuelbonder@hotmail.com', '1545637828', '', '', 'Av. pueyrredon 924 - 3° c', '2018-01-26', 'Ciudad de buenos aires', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(988, NULL, NULL, 'Nacional', '133765', '2018-02-09 11:20:39', 10, '', 'HOSPITAL', NULL, 'rominamassone@gmail.com', '1535991810', '', '', 'Diaz velez 5044', '2018-02-07', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(989, NULL, NULL, 'Nacional', '133988', '2018-02-19 10:31:11', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', NULL, 'juanestebangiunta@gmail.com', '1565704747', '', '', 'Solis 2171 pb', '2018-02-07', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(990, NULL, NULL, 'Provincial', '116234', '2018-02-19 10:33:15', 3, '', 'HOSPITAL', NULL, 'federicomaciola@hotmail.com', '0221-5087262', '', '', '1470 la plata', '2018-02-05', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-10-29', NULL, '0000-00-00 00:00:00', ''),
	(991, NULL, NULL, 'Nacional', '122260', '2018-03-01 10:37:00', 4, '', 'HOSPITAL', NULL, '', '1536076100', '', '', 'Cordoba 3933', '2018-03-01', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(992, NULL, NULL, 'Provincial', '35818', '2018-03-06 14:32:08', 9, '', 'HOSPITAL', NULL, '', '', '', '', '', '2016-12-19', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(993, NULL, NULL, 'Nacional', '137164', '2018-03-08 09:29:21', 3, '', 'HOSPITAL', NULL, 'ceciliazanardi@hotmail.com', '', '', '', 'Zapata 159', '2017-10-25', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(994, NULL, NULL, 'Provincial', '5675', '2018-03-08 16:16:38', 8, '', 'HOSPITAL', NULL, '', '362 475-9389', '', '', 'Saavedra 433, resistencia', '2017-12-12', 'Chaco', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-04-06', NULL, '0000-00-00 00:00:00', ''),
	(995, NULL, NULL, 'Nacional', '120125', '2018-03-23 13:56:00', 4, '', 'HOSPITAL', NULL, 'enriquetamartinezar@yahoo.com.ar', '1553836288', '', '', 'Corboba 2351', '2018-03-22', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(996, NULL, NULL, 'Nacional', '122325', '2018-04-04 14:36:20', 3, 'HOSPITAL ITALIANO', 'HOSPITAL', NULL, 'hernandick_29@yahoo.com.ar', '0221-155573025', '', '', '51 ( entre 29 y 30)', '2018-04-04', 'La plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-11-05', NULL, '0000-00-00 00:00:00', ''),
	(997, NULL, NULL, 'Provincial', '95656', '2018-04-17 14:55:37', 1, '', 'HOSPITAL', NULL, 'fuerteslu@gmail.com', '', '', '', '13 nre 631, balcarse', '2018-02-28', 'Buenos aires', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(998, NULL, NULL, 'Provincial', '117213', '2018-05-18 15:53:54', 3, '', 'HOSPITAL', NULL, '', '', '', '', '', '2018-05-18', 'La plata', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(999, NULL, NULL, 'Provincial', '113299', '2018-05-24 10:14:23', 3, 'HOSPITAL ROSSI', 'HOSPITAL', NULL, 'rotaus@hotmail.com', '0221154202245', '', '', '37 entre 116 y 117', '2018-04-05', 'La plata', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-06-11', NULL, '0000-00-00 00:00:00', ''),
	(1000, NULL, NULL, 'Provincial', '4471', '2018-06-11 14:46:56', 3, '', 'HOSPITAL', NULL, 'duranonakaren@gmail.com', '3751-539823', '', '', 'San martin 880, el dorado', '2018-06-11', 'Misiones', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1001, NULL, NULL, 'Provincial', '4950', '2018-06-21 13:58:38', 2, '', 'HOSPITAL', NULL, 'rodriguez-manuela@hotmail.com', '03424770437', '', '', 'San lorenzo 3214', '2018-06-01', 'Santa fe', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1002, NULL, NULL, 'Provincial', '117221', '2018-06-22 09:02:20', 3, '', 'HOSPITAL', NULL, 'lucia.agamennoni@gmail.com', '', '', '', 'Calchaqui 5401', '2018-06-09', 'La plata', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1003, NULL, NULL, 'Provincial', '117059', '2018-07-03 15:53:16', 3, '', 'HOSPITAL', NULL, 'cbergna@live.com.ar', '0221156081905', '', '', 'Calle 54 nro 1072', '2018-06-29', 'La plata', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1004, NULL, NULL, 'Nacional', '20895', '2018-07-20 13:17:32', 2, 'SANATORIO BRITANICO', 'HOSPITAL', NULL, '', '0341156174993', '', '', 'Paraguay 40', '2018-03-01', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1005, NULL, NULL, 'Nacional', '133917', '2018-07-30 10:41:09', 10, '', 'HOSPITAL', NULL, 'mariana.kalmus@hotmail.com', '', '', '', 'Palpa 2484', '2018-07-25', 'Caba', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1006, NULL, NULL, 'Nacional', '117213', '2018-07-30 10:44:35', 10, '', 'HOSPITAL', NULL, 'mariana.kalmus@hotmail.com', '11-55141043', '', '', 'Palpa 2484', '2018-07-25', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1007, NULL, NULL, 'Nacional', '137549', '2018-09-07 13:57:45', 4, '', 'HOSPITAL', NULL, 'ncarnelutto@gmail.com', '15-3774-0207', '', '', 'Cordoba 2351', '2018-09-07', 'Caba', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-09-14', NULL, '0000-00-00 00:00:00', ''),
	(1008, NULL, NULL, 'Nacional', '10363', '2018-09-24 09:00:02', 2, '', 'HOSPITAL', NULL, 'VIRGINIACASTOLDI@HOTMAIL.COM', '155123940', '', '', 'Peron 450', '2018-09-19', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1009, NULL, NULL, 'Nacional', '160798', '2018-09-25 13:14:05', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', NULL, 'oliveros.ma@gmail.com', '15-61357064', '', '', 'Mansilla 3905 5c', '2018-09-25', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1010, NULL, NULL, 'Provincial', '5152', '2018-10-16 10:14:37', 3, '', 'HOSPITAL', NULL, 'elisa_stemberg@hotmail.com', '', '', '', 'Av marconi 3736; posadas', '2018-10-16', 'Misiones', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1011, NULL, NULL, 'Provincial', '42525', '2018-10-17 13:22:37', 9, '', 'HOSPITAL', NULL, 'covando22076@gmail.com', '0351-6583299', '', '', 'Gallo 2666', '2018-10-05', '', 'Médica/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1012, NULL, NULL, 'Nacional', '140695', '2018-10-23 09:01:11', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1013, NULL, NULL, 'Nacional', '143383', '2018-10-23 09:04:34', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1014, NULL, NULL, 'Nacional', '62597', '2018-10-23 09:18:02', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1015, NULL, NULL, 'Nacional', '123901', '2018-10-23 09:28:44', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-04-05', NULL, '0000-00-00 00:00:00', ''),
	(1016, NULL, NULL, 'Nacional', '53701', '2018-10-23 10:02:34', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-02', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1017, NULL, NULL, 'Nacional', '133951', '2018-10-23 10:05:23', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1018, NULL, NULL, 'Nacional', '60555', '2018-10-23 10:41:32', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1019, NULL, NULL, 'Nacional', '140039', '2018-10-23 10:53:21', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1020, NULL, NULL, 'Nacional', '118555', '2018-10-23 13:34:59', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1021, NULL, NULL, 'Nacional', '5832', '2018-10-23 13:39:29', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Inactivo', '', 20, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1022, NULL, NULL, 'Nacional', '16770', '2018-10-23 13:46:49', 8, '', 'HOSPITAL', NULL, '', '', '', '', '', '2010-01-01', '', 'Hematológa/o', 'Activo', 'eala', 19, '2019-04-29', NULL, '0000-00-00 00:00:00', ''),
	(1023, NULL, NULL, 'Nacional', '149249', '2018-10-30 14:54:17', 10, '', 'HOSPITAL', NULL, '', '35140120', '', '', 'Cordoba 2390', '2018-10-30', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1024, NULL, NULL, 'Nacional', '144886', '2018-11-07 08:28:07', 10, '', 'HOSPITAL', NULL, 'anyromeroz@hotmail.com', '1556105117', '', '', 'Junin1622 3 b', '2018-11-05', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1025, NULL, NULL, 'Provincial', '95019', '2018-11-12 13:42:48', 1, '', 'HOSPITAL', NULL, 'antuel-garcia@hotmail.com', '', '', '', '25 de mayo 3542', '2018-11-09', 'Mar de plata', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1026, NULL, NULL, 'Nacional', '165150', '2018-11-15 10:03:31', 3, '', 'HOSPITAL', NULL, '', '', '', '', '', '2018-11-15', '', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2018-11-15', NULL, '0000-00-00 00:00:00', ''),
	(1027, NULL, NULL, 'Provincial', '299237', '2019-01-17 07:40:31', 3, '', 'HOSPITAL', NULL, '', '1550955209', '', '', '', '2019-01-16', 'Quilmes', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1028, NULL, NULL, 'Nacional', '109143', '2019-01-31 16:56:40', 10, '', 'HOSPITAL', NULL, 'hematomalvinas@gmail.com', '4469-9600', '', '', 'Miraflores 123', '1919-03-02', 'Pablo nogues', 'Hematológa/o', 'Activo', 'agonzalez', 19, '2019-05-07', NULL, '0000-00-00 00:00:00', ''),
	(1029, NULL, NULL, 'Provincial', '37417', '2019-02-19 13:34:02', 9, 'AV. NACIONES UNIDAS 346', 'HOSPITAL', NULL, 'mergarcia_89@hotmail.com', '03517646178', '', '', '', '2019-02-19', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1030, NULL, NULL, 'Provincial', '13920', '2019-03-26 14:57:15', 9, '', 'HOSPITAL', NULL, '', '', '', '', '', '2019-03-26', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1031, NULL, NULL, 'Provincial', '5086', '2019-04-01 13:26:51', 3, 'AV. MARCONI 3736', 'HOSPITAL', NULL, 'marianamarull@hotmail.com', '0362-4639806', '', '', '', '2019-03-28', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1032, NULL, NULL, 'Nacional', '145510', '2019-05-06 09:44:58', 3, 'GAWAM 4102', 'HOSPITAL', NULL, 'maymodaniela@hotmail.com', '1164737239', '', '', '', '2019-05-03', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1033, NULL, NULL, 'Nacional', '148336', '2019-05-07 15:50:35', 3, 'HOSPITAL BRITANICO', 'HOSPITAL', NULL, 'sofirivarolacalderon@gmail.com', '', '', '', 'Solis 2171', '2019-04-04', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1034, NULL, NULL, 'Provincial', '64181', '2019-05-09 16:50:21', 4, 'RTA 188 Y ALBERDI', 'HOSPITAL', NULL, '', '', '', '', '', '2018-04-18', 'Junin ', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1035, NULL, NULL, 'Provincial', '64062', '2019-05-09 16:55:49', 4, 'RTA 188 Y ALBERDI', 'HOSPITAL', NULL, 'etelmac@hotmail.com', '02364361031', '', '', '', '2018-04-28', 'Junin ', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1036, NULL, NULL, 'Provincial', '81668', '2019-08-01 11:09:52', 1, '', 'HOSPITAL', NULL, '', '2494 60 6036', '', '', '', '2019-07-02', 'Rauch', 'Hematológa/o', 'Activo', 'eala', 19, '2019-08-01', NULL, '0000-00-00 00:00:00', ''),
	(1037, NULL, NULL, 'Nacional', '153995', '2019-08-08 10:49:32', 3, 'SOLIS 2171 - PB', 'HOSPITAL', NULL, '', '1141879723', '', '', '', '2019-08-07', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1038, NULL, NULL, 'Provincial', '455641', '2019-08-08 15:15:29', 4, '', 'HOSPITAL', NULL, '', '', '', '', 'Fleming 590', '2018-12-18', 'San isidro', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1039, NULL, NULL, 'Provincial', '455641', '2019-08-08 15:43:16', 4, 'FLEMING 590', 'HOSPITAL', NULL, '', '', '', '', 'Fleming 590', '2019-08-08', 'San isidro', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1040, NULL, NULL, 'Provincial', '7358', '2019-09-13 09:37:22', 1, '', 'HOSPITAL', NULL, 'castece@hotmail.com', '299-4340900', '', '', 'Fotheringam 121', '2019-08-14', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1041, NULL, NULL, 'Nacional', '123366', '2019-10-07 11:30:16', 4, '', 'HOSPITAL', NULL, '', '1524068496', '', '', 'Av santa fe 3711 3a', '2019-10-03', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1042, NULL, NULL, 'Nacional', '133771', '2019-10-18 14:24:58', 10, 'LEMBARE 1136 - 6B', 'HOSPITAL', NULL, '', '1164620419', '', '', 'Lembare 1136 - 6b', '2019-10-18', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1043, NULL, NULL, 'Nacional', '110624', '2019-11-11 15:56:29', 10, 'HTAL ITALIANO', 'HOSPITAL', NULL, 'gonzalo.ferini@hospitalitaliano.org.ar', '1122601976', '', '', 'Peron 4190', '2019-10-30', 'Caba', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1044, NULL, NULL, 'Provincial', '6253', '2020-01-10 15:24:31', 10, 'CORDOBA 115 - SAN MIGUEL DE TUCUMAN', 'HOSPITAL', NULL, 'vikilobo@hotmail.com', '0381-5858102', '', '', '', '2020-01-10', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1045, NULL, NULL, 'Provincial', '115757', '2020-02-04 08:22:59', 1, '', 'HOSPITAL', NULL, 'delosangeles_79@hotmail.com', '02287434314', '', '', '', '2020-02-03', 'Gral madariaga', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1046, NULL, NULL, 'Nacional', '455991', '2020-02-19 07:41:55', 3, '', 'HOSPITAL', NULL, 'rodrigovallejo81@hotmail.com', '', '', '', 'Yrigoyen 1757, vte lopez', '2019-08-14', 'Buenos aires', 'Médica/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1047, NULL, NULL, 'Nacional', '166970', '2020-02-20 16:25:54', 3, 'TUCUMAN 2132', 'HOSPITAL', NULL, 'ronizarate@gmail.com', '1132338208', '', '', 'Tucuman 2132', '2020-02-20', '', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1048, NULL, NULL, 'Nacional', '142028', '2020-03-02 15:10:13', 4, 'JUAN MANUEL DE ROSAS 6000 ', 'HOSPITAL', NULL, 'flor_m_86@hotmail.com', '1568127620', '', '', 'Juan manuel de rosas 6000 ', '2020-02-28', 'Isidro casanova ', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1049, NULL, NULL, 'Provincial', '34105', '2020-03-03 14:17:13', 9, 'AV RICHIERI 2200', 'HOSPITAL', NULL, 'mandrile.juliana@hotmail.ccom', '0351-153255975', '', '', 'Av richieri 2200', '2020-03-03', 'Cordoba', 'Onco-hematóloga/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', ''),
	(1050, NULL, NULL, 'Provincial', '63625', '2020-03-04 09:10:43', 8, 'FALUCHO 975', 'HOSPITAL', NULL, '', '2314 471524', '', '', 'Falucho 975', '2020-03-03', 'Henderson - pcia de buenos aires', 'otro', 'Activo', 'eala', 19, '2020-03-04', NULL, '0000-00-00 00:00:00', ''),
	(1051, NULL, NULL, 'Provincial', '19425', '2020-03-06 09:00:03', 2, 'SAN LORENZO 1686 - SANTA FE', 'HOSPITAL', NULL, 'florenciam7@hotmail.com', '0341-155861112', '', '', 'San lorenzo 1686 ', '2020-03-05', 'Santa fe', 'Hematológa/o', 'Activo', '', 19, '0000-00-00', NULL, '0000-00-00 00:00:00', '');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla de Obras Sociales';

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de Pacientes';

-- Volcando datos para la tabla soliris.paciente: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`id`, `apellido`, `nombre`, `nombre_completo`, `fecha_nac`, `sexo`, `telefono`, `ciudad`, `pais_id`, `mail`, `patologia_id`, `sub_patologia_id`, `os_id`, `notas`, `usuario_id`, `c_gestar`, `estado_id`, `sub_estado_id`, `fecha_creacion`, `familia`, `fecha_modificacion`, `usuario_mod_id`, `crm_id`) VALUES
	(1, 'MIRANDA', 'PABLO', 'MIRANDA, PABLO', '1986-10-22', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 17, 4, 4, 'Se aprueba el paciente', 50, NULL, 11, 8, '2020-03-20 12:15:01', 'SOL', '2020-03-25 11:09:50', 50, NULL),
	(2, 'GERMAN', 'LOPEZ', 'GERMAN, LOPEZ', '2001-11-11', 'M', 'NULL', 'TIGRE', 13, 'TEST@AOL.COM', 21, 1, 4, NULL, 50, NULL, 7, 8, '2020-03-20 12:20:47', 'SOL', '2020-03-20 12:20:47', 50, NULL),
	(3, 'PRUEBA ', 'PRUEBA APELLIDO', 'PRUEBA , PRUEBA APELLIDO', '2020-03-25', 'M', 'NULL', 'NULL', 13, 'NULL', 17, 4, 4, NULL, 50, NULL, 7, 8, '2020-03-25 10:11:00', 'SOL', '2020-03-25 10:11:00', 50, NULL),
	(4, 'MIRANDA', 'GASTON', 'MIRANDA, GASTON', '2020-03-03', 'M', '01131218333', 'TIGRE', 13, 'NULL', 17, 4, 4, NULL, 50, NULL, 7, 8, '2020-03-25 10:17:14', 'SOL', '2020-03-25 10:17:14', 50, NULL),
	(5, 'MIRANDA', 'PEPE', 'MIRANDA, PEPE', '2020-03-11', 'M', 'NULL', 'TIGRE', 13, 'NULL', 19, 4, 4, NULL, 50, NULL, 7, 8, '2020-03-25 10:19:09', 'SOL', '2020-03-25 10:19:09', 50, NULL),
	(6, 'MIRANDA', 'DSAD', 'MIRANDA, DSAD', '2020-03-04', 'M', 'NULL', 'NULL', 13, 'NULL', 17, 4, 4, NULL, 50, NULL, 7, 8, '2020-03-25 10:20:05', 'SOL', '2020-03-25 10:20:05', 50, NULL),
	(7, 'TEST', 'TEST NOMBRE', 'TEST, TEST NOMBRE', '2020-05-04', 'M', 'NULL', 'NULL', 13, 'NULL', 17, 4, 4, NULL, 50, NULL, 7, 8, '2020-03-25 10:27:03', 'SOL', '2020-03-25 10:27:03', 50, NULL),
	(8, 'TEST', 'TEST NOMBR', 'TEST, TEST NOMBR', '2020-05-04', 'M', 'NULL', 'NULL', 13, 'NULL', 17, 4, 4, NULL, 50, '', 7, 8, '2020-03-25 10:44:18', 'SOL', '2020-03-25 10:48:28', 50, NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `code` smallint(6) DEFAULT NULL,
  `iso3166a1` char(2) DEFAULT NULL,
  `iso3166a2` char(3) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de patologias';

-- Volcando datos para la tabla soliris.patologia: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `patologia` DISABLE KEYS */;
INSERT INTO `patologia` (`id`, `patologia_nombre`, `estado_id`, `familia`, `usuario_audit`, `fecha_audit`) VALUES
	(17, 'HPN', 5, 'SOL', NULL, '2020-02-10 15:52:49'),
	(18, 'SUHa', 5, 'SOL', NULL, '2020-02-10 15:53:04'),
	(19, 'gMGr', 5, 'SOL', NULL, '2020-02-10 15:53:12'),
	(20, 'NMOSD', 5, 'SOL', NULL, '2020-02-10 15:53:30'),
	(21, 'Glomerulospatias ', 5, 'SOL', NULL, '2020-02-10 15:53:38');
/*!40000 ALTER TABLE `patologia` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.presentacion
CREATE TABLE IF NOT EXISTS `presentacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_np` varchar(255) NOT NULL DEFAULT '0',
  `familia` varchar(3) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_presentacion_estado` (`estado_id`),
  CONSTRAINT `FK_presentacion_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.presentacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` (`id`, `codigo_np`, `familia`, `valor`, `estado_id`) VALUES
	(1, '123', 'sol', 'presentacion prueba', 21);
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.provincias
CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.provincias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion de los documentos de los pacientes en el sistema';

-- Volcando datos para la tabla soliris.rel_paciente_documentos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_paciente_documentos` DISABLE KEYS */;
INSERT INTO `rel_paciente_documentos` (`id`, `paciente_id`, `documento_id`, `fecha_creacion`) VALUES
	(1, 1, 1, '2020-03-20 12:15:13'),
	(2, 2, 2, '2020-03-20 12:21:05'),
	(3, 2, 3, '2020-03-20 12:21:05'),
	(4, 3, 4, '2020-03-25 10:11:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='tabla de relacion entre patologia y subpatologia';

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
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=latin1 COMMENT='Tabla que vincula las paginas y los roles admitidos para esta';

-- Volcando datos para la tabla soliris.rel_seguridad_rol: ~182 rows (aproximadamente)
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
	(235, 125, 4, '2020-03-26 00:36:40');
/*!40000 ALTER TABLE `rel_seguridad_rol` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estado_id` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `FK_rol_estado` (`estado_id`),
  CONSTRAINT `FK_rol_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.soliris_documentacion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_documentacion` DISABLE KEYS */;
INSERT INTO `soliris_documentacion` (`id`, `maestro_id`, `referencia`, `documento`, `tipo`, `fecha`, `fecha_audit`, `usuario_id`) VALUES
	(1963, 1030, 'medicos', 'Capacitacion_1030_2019-12-10_30700743140-01-0045-00100444-ORIGINAL.PDF', 'Capacitacion', '0000-00-00', '2019-12-10 16:18:48', NULL),
	(1964, 59, 'canales', 'Canal_59_2019-12-10_devolucion-mercadopago.png', 'Canal', '2019-12-10', '2019-12-10 16:19:38', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.soliris_seguridad: ~56 rows (aproximadamente)
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
	(125, 'nueva_venta.php', 'Nueva Venta');
/*!40000 ALTER TABLE `soliris_seguridad` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.sub_patologia
CREATE TABLE IF NOT EXISTS `sub_patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_patologia_nombre` varchar(50) NOT NULL DEFAULT '',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL',
  `usuario_audit` varchar(45) NOT NULL DEFAULT '',
  `fecha_audit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tablas de Sub Patoligias';

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

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
	(50, 'pmiranda', 'pmiranda@raffo.com.ar', 1, 4),
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

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_GUARDAR_VENTA`()
    COMMENT 'store que guarda la venta asignada a un paciente'
BEGIN




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

-- Volcando estructura para procedimiento soliris.ST_LIST_ESTADOS_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_ESTADOS_PACIENTE`()
    COMMENT 'LISTA LOS ESTADO DEL PACIENTE'
BEGIN

SELECT id, valor FROM maestro_estado e WHERE e.referencia = 'paciente' AND e.tipo = 'estado';

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
	m.id, CONCAT(m.apellido, ', ',m.nombre) AS nombre
FROM medico m
WHERE m.estado_id IN (19) AND CONCAT(m.apellido, ', ', m.nombre) like CONCAT('%', v_filtro, '%')
ORDER BY nombre ASC; 
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

CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES(
			SELECT
	  		  P.id AS id, 
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
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.estado_id = me.id) AS estado,
	  		  -- vRM.fventa AS uventa, 
	  		  (SELECT 'SIN VENTAS') AS uventa,
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
	  		  P.id AS id, 
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
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.estado_id = me.id) AS estado,
--	  		  vRM.fventa AS uventa, VERIFICAR ULTIMA VENTA
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
			/*LEFT JOIN 
				vw_lastsale_rm AS vRM 
			ON (P.id = vRM.pid)*/
			WHERE
			P.estado_id IN (11) -- Se verifica el estado 11 = Aprobado 
			AND 
				P.sub_estado_id IN (8) -- Se verifica el sub estado 8 = Activo );
			);
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

-- Volcando estructura para procedimiento soliris.ST_LIST_SUB_ESTADOS_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_SUB_ESTADOS_PACIENTE`()
    COMMENT 'Lista los subestados del paciente'
BEGIN

SELECT id, valor FROM maestro_estado e WHERE e.referencia = 'paciente' AND e.tipo = 'sub_estado';

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

-- Volcando estructura para procedimiento soliris.st_set_id_medico
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `st_set_id_medico`()
BEGIN

update soliris_maestro set id_medico=(select m.id from medicos as m where m.nombre=medico);


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

-- Volcando estructura para función soliris.FU_GET_DOCUMENTS
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_GET_DOCUMENTS`(
	`v_id` INT,
	`v_referencia` VARCHAR(50)





) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
    COMMENT 'devuelve un array con los documentos del paciente'
BEGIN

declare s_response varchar(255);

set s_response=(select group_concat(documento SEPARATOR ';') from soliris_documentacion where id_maestro=v_id and referencia=v_referencia);

if s_response is null  then 
	set s_response="Sin Documentación";
end if;
	

return s_response;

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
				concat (rv.id, "|", (SUBSTRING_INDEX((get_paciente(rv.nombre)), '|', 1)), "|", rv.medico, "|", rv.dosis, "|", rv.unidades, "|", rv.estado) as datosVenta
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
	DECLARE devolucion LONGTEXT;
	
UPDATE soliris_maestro SET 
	medico = (SELECT M.Nombre FROM medicos as M WHERE M.id = v_medico),
	dosis = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_dosis),
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
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	v_familia,
	'Activo',
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
	estado,
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
	'Activo',
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

-- Volcando estructura para función soliris.FU_NEW_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_MED`(`v_nombre` VARCHAR(200), `v_matricula_tipo` VARCHAR(45), `v_matricula_numero` VARCHAR(45), `v_lugar` VARCHAR(45), `v_c_atencion` VARCHAR(255), `v_telefono` VARCHAR(45), `v_fax` VARCHAR(45), `v_nacimiento` VARCHAR(45), `v_domicilio` VARCHAR(255), `v_localidad` VARCHAR(255), `v_fecha_cap` DATETIME, `v_especialidad` VARCHAR(255), `v_apm` INT, `v_estado` VARCHAR(45)
, `v_email` VARCHAR(255)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
	INSERT INTO medicos (
        nombre,
        matricula_tipo,
        matricula_numero,
        lugar,
        c_atencion,
        telefono,
        fax,
        nacimiento,
        domicilio,
        localidad,
        fecha_cap,
        especialidad,
        apm,
        estado,
        fecha_alta,
        mail
) 
SELECT 
        v_nombre,
        v_matricula_tipo,
        v_matricula_numero,
        v_lugar,
        v_c_atencion,
        v_telefono,
        v_fax,
        v_nacimiento,
        v_domicilio,
        v_localidad,
        v_fecha_cap,
        v_especialidad,
        v_apm,
        v_estado,
        now(),
        v_email
FROM dual WHERE NOT EXISTS (
  SELECT * FROM medicos WHERE 
        nombre = v_nombre AND
        matricula_tipo = v_matricula_tipo AND
        matricula_numero = v_matricula_numero AND
        lugar = v_lugar AND
        c_atencion = v_c_atencion AND
        telefono = v_telefono AND
        fax = v_fax AND
        nacimiento = v_nacimiento AND
        domicilio = v_domicilio AND
        localidad = v_localidad AND
        fecha_cap = v_fecha_cap AND
        especialidad = v_especialidad AND
        apm = v_apm AND
        estado = v_estado AND
        mail = v_email
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
	
INSERT INTO patologias (
	patologia,
	familia,
	estado,
	usuario_audit
) 
SELECT 
	v_patologia,
	v_familia,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM patologias WHERE 
	patologia = v_patologia AND
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
		UPDATE especialidad SET 
			especialidad = v_nombre, 
			familia = v_familia,
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
		UPDATE patologias SET 
			patologia = v_patologia, 
			familia = v_familia,
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
