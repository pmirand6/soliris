-- --------------------------------------------------------
-- Host:                         192.168.0.139
-- Versión del servidor:         5.5.52-0ubuntu0.14.04.1 - (Ubuntu)
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             10.3.0.5771
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
  `estado_id` int(11) NOT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.apm: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `apm` DISABLE KEYS */;
INSERT INTO `apm` (`id`, `codigo_apm_np`, `estado_id`, `usuario_audit`, `fecha_audit`, `username`, `email`) VALUES
	(11, 0, 0, 'pmiranda', '2019-12-10 16:18:10', '', '');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.canal: ~1 rows (aproximadamente)
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
  `usuario_id` int(11) unsigned NOT NULL COMMENT 'id del usuario que creó el registro',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL' COMMENT 'familia del sistema',
  PRIMARY KEY (`id`),
  KEY `FK_doc_tipo` (`documentos_tipo_id`),
  KEY `FK_doc_usuario` (`usuario_id`),
  CONSTRAINT `FK_doc_tipo` FOREIGN KEY (`documentos_tipo_id`) REFERENCES `documentos_tipo` (`id`),
  CONSTRAINT `FK_doc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenan las referencias a los documentos del sistema';

-- Volcando datos para la tabla soliris.documentos: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` (`id`, `valor`, `documentos_tipo_id`, `fecha_creacion`, `fecha_documento`, `usuario_id`, `familia`) VALUES
	(2, 'Consentimiento Prueba.jpg', 1, '2020-03-02 20:13:54', '2020-03-02', 50, 'SOL'),
	(10, 'test.jpg', 1, '2020-03-06 16:08:09', '0000-00-00', 50, 'SOL'),
	(21, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:31:32', '0000-00-00', 50, 'SOL'),
	(22, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:31:50', '0000-00-00', 50, 'SOL'),
	(23, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:32:15', '0000-00-00', 50, 'SOL'),
	(24, 'Consentimiento_4_2020-03-06_Sin-título.png', 1, '2020-03-06 17:33:15', '0000-00-00', 50, 'SOL'),
	(25, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:35:53', '0000-00-00', 50, 'SOL'),
	(26, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:37:01', '0000-00-00', 50, 'SOL'),
	(27, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:38:01', '0000-00-00', 50, 'SOL'),
	(28, 'Consentimiento_4_2020-03-06_tali.jpg', 1, '2020-03-06 17:46:17', '2020-03-06', 50, 'SOL'),
	(29, 'Otro_4_2020-03-06_tali.jpg', 2, '2020-03-06 17:49:54', '2020-03-06', 50, 'SOL'),
	(30, 'Consentimiento_4_2020-03-06_IMG_5907.jpg', 1, '2020-03-06 17:49:54', '2020-03-06', 50, 'SOL'),
	(31, 'Consentimiento_4_2020-03-06_tarjeta.pdf', 1, '2020-03-06 18:12:14', '2020-03-06', 50, 'SOL');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.documentos_tipo
CREATE TABLE IF NOT EXISTS `documentos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='referencia de tipos de documentos del sistema';

-- Volcando datos para la tabla soliris.documentos_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos_tipo` DISABLE KEYS */;
INSERT INTO `documentos_tipo` (`id`, `tipo`, `referencia`) VALUES
	(1, 'Consentimiento', 'Paciente'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.institucion: ~1 rows (aproximadamente)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.maestro_estado: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `maestro_estado` DISABLE KEYS */;
INSERT INTO `maestro_estado` (`id`, `valor`, `tipo`, `referencia`) VALUES
	(1, 'Activo', 'estado', 'usuario'),
	(2, 'Inactivo', 'estado', 'usuario'),
	(3, 'Activo', 'estado', 'rol'),
	(4, 'Inactivo', 'estado', 'rol'),
	(5, 'Activo', 'estado', 'patologia'),
	(6, 'Inactivo', 'estado', 'patologia'),
	(7, 'Paciente Pendiente', 'estado', 'paciente'),
	(8, 'Activo', 'sub_estado', 'paciente'),
	(9, 'Discontinuó', 'sub_estado', 'paciente'),
	(10, 'Falleció', 'sub_estado', 'paciente'),
	(11, 'Aprobado', 'estado', 'paciente'),
	(12, 'Baja', 'estado', 'paciente'),
	(13, 'Rechazado', 'estado', 'paciente'),
	(14, 'Eliminado', 'estado', 'venta');
/*!40000 ALTER TABLE `maestro_estado` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `matricula_tipo` varchar(45) DEFAULT NULL,
  `matricula_numero` varchar(45) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `apm_id` int(10) unsigned DEFAULT NULL,
  `C_Atencion` varchar(255) DEFAULT NULL,
  `Lugar` varchar(45) DEFAULT NULL,
  `U_mod` varchar(45) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `nacimiento` varchar(20) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `fecha_cap` date DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `Aprobado` varchar(45) DEFAULT NULL,
  `Fecha_Aprobado` date DEFAULT NULL,
  `id_meditec` int(10) unsigned DEFAULT NULL,
  `prov_id` int(11) DEFAULT NULL,
  `m_nac` int(10) unsigned NOT NULL DEFAULT '0',
  `m_prov` int(10) unsigned NOT NULL DEFAULT '0',
  `ant_nombre` varchar(255) DEFAULT NULL,
  `esp_id` int(11) unsigned DEFAULT NULL,
  `fl` varchar(45) DEFAULT NULL,
  `fecha_inac` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='InnoDB free: 351232 kB';

-- Volcando datos para la tabla soliris.medico: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` (`id`, `apellido`, `nombre`, `matricula_tipo`, `matricula_numero`, `fecha_alta`, `apm_id`, `C_Atencion`, `Lugar`, `U_mod`, `Mail`, `telefono`, `Fax`, `nacimiento`, `domicilio`, `fecha_cap`, `localidad`, `especialidad`, `estado`, `Aprobado`, `Fecha_Aprobado`, `id_meditec`, `prov_id`, `m_nac`, `m_prov`, `ant_nombre`, `esp_id`, `fl`, `fecha_inac`) VALUES
	(1030, NULL, 'Medico test', 'Nacional', '1111111111', '2019-12-10', 11, '', 'HOSPITAL', NULL, '', '', '', '', '', '2019-12-10', '', 'otro', 'Activo', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.obra_social
CREATE TABLE IF NOT EXISTS `obra_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Obras Sociales';

-- Volcando datos para la tabla soliris.obra_social: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `obra_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `obra_social` ENABLE KEYS */;

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

-- Volcando datos para la tabla soliris.paciente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`id`, `apellido`, `nombre`, `nombre_completo`, `fecha_nac`, `sexo`, `telefono`, `ciudad`, `pais_id`, `mail`, `patologia_id`, `sub_patologia_id`, `os_id`, `notas`, `usuario_id`, `c_gestar`, `estado_id`, `sub_estado_id`, `fecha_creacion`, `familia`, `fecha_modificacion`, `usuario_mod_id`, `crm_id`) VALUES
	(4, 'MIRANDAA', 'PABLA', 'MIRANDAA, PABLA', '2020-02-19', 'M', '01131218333', 'TIGRE', 16, 'PMIRAND6@GMAIL.COM', 18, 4, 4, NULL, 50, '', 7, 8, '2020-02-26 16:10:37', 'SOL', '2020-03-06 13:29:28', 50, NULL),
	(5, 'MIRANDA', 'PABLO', 'MIRANDA, PABLO', '2020-02-19', 'M', '01131218333', 'TIGRE', 16, 'PMIRAND6@GMAIL.COM', 21, 1, 4, NULL, 50, NULL, 7, 0, '2020-03-03 09:58:58', 'SOL', '2020-03-05 17:24:07', 50, NULL),
	(6, 'MIRANDA', 'PABLO', 'MIRANDA, PABLO', '2020-03-05', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 17, 4, 4, NULL, 50, NULL, 7, 0, '2020-03-06 10:53:54', 'SOL', '0000-00-00 00:00:00', 0, 1234),
	(34, 'MIRANDA', 'PABLI', 'MIRANDA, PABLI', '2020-03-05', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 17, 4, 4, NULL, 50, NULL, 7, 0, '2020-03-06 12:25:31', 'SOL', '0000-00-00 00:00:00', 0, 1234);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla soliris.presentacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion de los documentos de los pacientes en el sistema';

-- Volcando datos para la tabla soliris.rel_paciente_documentos: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_paciente_documentos` DISABLE KEYS */;
INSERT INTO `rel_paciente_documentos` (`id`, `paciente_id`, `documento_id`, `fecha_creacion`) VALUES
	(1, 4, 2, '2020-03-02 20:15:48'),
	(2, 4, 10, '2020-03-06 16:08:09'),
	(3, 4, 2, '2020-03-06 17:06:53'),
	(6, 4, 21, '2020-03-06 17:31:32'),
	(7, 4, 22, '2020-03-06 17:31:50'),
	(8, 4, 23, '2020-03-06 17:32:15'),
	(9, 4, 24, '2020-03-06 17:33:15'),
	(10, 4, 25, '2020-03-06 17:35:53'),
	(11, 4, 26, '2020-03-06 17:37:01'),
	(12, 4, 27, '2020-03-06 17:38:01'),
	(13, 4, 28, '2020-03-06 17:46:17'),
	(14, 4, 29, '2020-03-06 17:49:54'),
	(15, 4, 30, '2020-03-06 17:49:54'),
	(16, 4, 31, '2020-03-06 18:12:14');
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
	(234, 124, 6, '2020-02-07 14:53:11');
/*!40000 ALTER TABLE `rel_seguridad_rol` ENABLE KEYS */;

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

-- Volcando datos para la tabla soliris.soliris_log: ~215 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_log` DISABLE KEYS */;
INSERT INTO `soliris_log` (`id`, `usuario`, `fecha`, `accion`, `registro`, `notas`, `tabla`, `id_registro`) VALUES
	(12253, 'PMIRANDA', '2019-12-10 15:20:53', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12254, 'PMIRANDA', '2019-12-10 15:20:58', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12255, 'PMIRANDA', '2019-12-10 15:21:05', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12256, 'PMIRANDA', '2019-12-10 15:48:23', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12257, 'PMIRANDA', '2019-12-10 15:52:50', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12258, 'DCILVETI', '2019-12-10 15:53:25', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.15', NULL, NULL),
	(12259, 'pmiranda', '2019-12-10 16:18:10', 'SELECT FU_NEW_APM(\'Cilveti, Diego\', \'pmiranda\') as response', 'apm_form.php', NULL, NULL, NULL),
	(12260, 'pmiranda', '2019-12-10 16:18:37', 'SELECT FU_NEW_MED(\'Medico test\', \'Nacional\', \'1111111111\', \'HOSPITAL\', \'\', \'\', \'\', \'\', \'\', \'\', \'2019-12-10\', \'otro\', \'11\', \'Activo\',\'\') as response', 'medico_form.php', NULL, NULL, NULL),
	(12261, '10.33.9.37', '2019-12-10 16:18:48', 'SELECT FU_ADJ_FILES(\'1030\', \'0\', \'medicos\', \'Capacitacion\', \'2019-12-10\', \'Capacitacion_1030_2019-12-10_30700743140-01-0045-00100444-ORIGINAL.PDF\') as response', '0', NULL, NULL, NULL),
	(12262, 'pmiranda', '2019-12-10 16:18:53', 'UPDATE soliris_documentacion SET fecha = \'\' WHERE referencia = \'medicos\' AND id_maestro = \'1030\' AND tipo = \'Capacitacion\' AND id = \'1963\';', 'Fecha de Capacitación en la Tabla soliris_documentacion', NULL, NULL, NULL),
	(12263, 'pmiranda', '2019-12-10 16:19:17', 'SELECT FU_NEW_INST(\'Institucion Test\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'SOL\', \'pmiranda\') as response', 'institucion_form.php', NULL, NULL, NULL),
	(12264, 'pmiranda', '2019-12-10 16:19:29', 'SELECT FU_NEW_CANAL(\'Canal Test\', \'SOL\', \'\', \'\', \'\', \'\', \'\', \'\', \'pmiranda\') as response', 'canal_form.php', NULL, NULL, NULL),
	(12265, '10.33.9.37', '2019-12-10 16:19:38', 'SELECT FU_ADJ_FILES(\'59\', \'0\', \'canales\', \'Canal\', \'2019-12-10\', \'Canal_59_2019-12-10_devolucion-mercadopago.png\') as response', '0', NULL, NULL, NULL),
	(12266, 'PMIRANDA', '2019-12-10 16:27:16', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.11.71', NULL, NULL),
	(12267, 'PMIRANDA', '2019-12-12 13:34:47', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12268, 'PMIRANDA', '2019-12-12 13:34:53', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12269, 'PMIRANDA', '2019-12-12 14:22:31', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12270, 'PMIRANDA', '2019-12-12 15:06:17', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12271, 'DCILVETI', '2019-12-12 15:08:22', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.15', NULL, NULL),
	(12272, 'PMIRANDA', '2019-12-12 15:28:08', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12273, 'PMIRANDA', '2020-01-08 09:51:19', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12274, 'PMIRANDA', '2020-01-21 14:41:12', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12275, 'PMIRANDA', '2020-01-21 14:43:49', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12276, 'PMIRANDA', '2020-01-21 16:16:54', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12277, 'PMIRANDA', '2020-01-21 16:51:34', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12278, 'PMIRANDA', '2020-01-22 09:07:53', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12279, 'PMIRANDA', '2020-01-22 10:24:45', 'Ingreso al sistema', NULL, 'Desde el Equipo: 10.33.9.37', NULL, NULL),
	(12280, 'PMIRANDA', '2020-02-07 15:10:21', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12281, 'PMIRANDA', '2020-02-07 15:10:27', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12282, 'PMIRANDA', '2020-02-07 15:10:37', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12283, 'PMIRANDA', '2020-02-14 10:23:12', 'Intento Fallido de Login', NULL, 'Desde el Equipo: 10.33.9.37 - ERROR: Verifique el usuario y la contraseña introducidos', NULL, NULL),
	(12284, 'pmiranda', '2020-02-14 12:26:10', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                2020-02-14, \n                M, \'\n                45097100\', \n                BUENOS AIRES, \n                13, \n                TEST@TEST.COM, \n                17, \n                , \n                , \n                pmiranda, \n                Activo, \n                TEST@TEST.COM)', 'paciente_form.php', NULL, NULL, NULL),
	(12285, 'pmiranda', '2020-02-26 14:43:26', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                1999-01-01, \n                M, \'\n                45097100\', \n                CAPITAL FEDERAL, \n                13, \n                , \n                17, \n                , \n                2, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12286, 'pmiranda', '2020-02-26 14:45:39', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                1999-01-01, \n                M, \'\n                45097100\', \n                CAPITAL FEDERAL, \n                13, \n                , \n                17, \n                , \n                2, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12287, 'pmiranda', '2020-02-26 15:09:36', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                1999-01-01, \n                M, \'\n                45097100\', \n                CAPITAL FEDERAL, \n                13, \n                , \n                18, \n                , \n                2, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12288, 'pmiranda', '2020-02-26 15:10:11', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                1999-01-01, \n                M, \'\n                45097100\', \n                CAPITAL FEDERAL, \n                13, \n                , \n                19, \n                , \n                2, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12289, 'pmiranda', '2020-02-26 15:11:23', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                1999-01-01, \n                M, \n                45097100, \n                CAPITAL FEDERAL, \n                13, \n                , \n                17, \n                , \n                2, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12290, '', '2020-02-26 15:30:43', 'Intento Fallido de Login', NULL, 'Desde el Equipo: ::1 - ERROR: No se ha podido realizar la conexión con el servidor LDAP', NULL, NULL),
	(12291, '', '2020-02-26 15:30:46', 'Intento Fallido de Login', NULL, 'Desde el Equipo: ::1 - ERROR: No se ha podido realizar la conexión con el servidor LDAP', NULL, NULL),
	(12292, 'pmiranda', '2020-02-26 15:31:28', 'CALL `ST_NEW_PACIENTE`(\n                MIRANDA, \n                PABLO, \n                2020-02-19, \n                M, \n                01131218333, \n                TIGRE, \n                13, \n                PMIRAND6@GMAIL.COM, \n                17, \n                , \n                4, \n                pmiranda, \n                Activo, \n                PMIRAND6@GMAIL.COM)', 'paciente_form.php', NULL, NULL, NULL),
	(12293, 'pmiranda', '2020-02-26 15:35:04', 'CALL `ST_NEW_PACIENTE`(\n                MIRANDA, \n                PABLO, \n                2020-02-19, \n                M, \n                01131218333, \n                TIGRE, \n                13, \n                PMIRAND6@GMAIL.COM, \n                17, \n                , \n                4, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12294, 'pmiranda', '2020-02-26 15:36:09', 'CALL `ST_NEW_PACIENTE`(\n                MIRANDA, \n                PABLO, \n                2020-02-19, \n                M, \n                , \n                , \n                13, \n                , \n                18, \n                , \n                , \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12295, 'pmiranda', '2020-02-26 15:39:19', 'CALL `ST_NEW_PACIENTE`(\n                MIRANDA, \n                PABLO, \n                2020-02-19, \n                M, \n                01131218333, \n                TIGRE, \n                13, \n                PMIRAND6@GMAIL.COM.AR, \n                18, \n                , \n                4, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12296, 'pmiranda', '2020-02-26 15:48:06', 'CALL `ST_NEW_PACIENTE`(\n                MIRANDA, \n                PABLO, \n                2020-02-19, \n                M, \n                01131218333, \n                TIGRE, \n                13, \n                PMIRAND6@GMAIL.COM.A, \n                18, \n                , \n                4, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12297, 'pmiranda', '2020-02-26 15:48:26', 'CALL `ST_NEW_PACIENTE`(\n                MIRANDA, \n                PABLO, \n                2020-02-19, \n                M, \n                01131218333, \n                TIGRE, \n                13, \n                , \n                18, \n                , \n                4, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12298, 'pmiranda', '2020-02-26 15:50:55', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                PABL, \n                2020-02-19, \n                M, \n                01131218333, \n                TIGRE, \n                13, \n                , \n                18, \n                , \n                4, \n                pmiranda, \n                Activo, \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12299, 'pmiranda', '2020-02-26 15:52:05', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                2020-02-19, \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM\', \n                18, \n                , \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12300, 'pmiranda', '2020-02-26 15:55:30', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                2020-02-19, \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM.AR\', \n                18, \n                NULL, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12301, 'pmiranda', '2020-02-26 15:56:04', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM\', \n                18, \n                NULL, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                )', 'paciente_form.php', NULL, NULL, NULL),
	(12302, 'pmiranda', '2020-02-26 15:57:23', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM.AR\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                \'\')', 'paciente_form.php', NULL, NULL, NULL),
	(12303, 'pmiranda', '2020-02-26 15:59:07', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                \'\')', 'paciente_form.php', NULL, NULL, NULL),
	(12304, 'pmiranda', '2020-02-26 15:59:55', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.CO\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                \'\')', 'paciente_form.php', NULL, NULL, NULL),
	(12305, 'pmiranda', '2020-02-26 16:00:48', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                \'\')', 'paciente_form.php', NULL, NULL, NULL),
	(12306, 'pmiranda', '2020-02-26 16:02:04', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM.AR\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                \'NULL\')', 'paciente_form.php', NULL, NULL, NULL),
	(12307, 'pmiranda', '2020-02-26 16:03:44', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                \'NULL\')', 'paciente_form.php', NULL, NULL, NULL),
	(12308, 'pmiranda', '2020-02-26 16:04:13', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM.AR\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12309, 'pmiranda', '2020-02-26 16:04:52', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM.A\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12310, 'pmiranda', '2020-02-26 16:05:15', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABL\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                13, \n                \'PMIRAND6@GMAIL.COM\', \n                18, \n                0, \n                4, \n                \'pmiranda\', \n                \'Activo\', \n                NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12311, 'pmiranda', '2020-03-03 09:58:58', 'CALL `ST_NEW_PACIENTE`(\n                \'MIRANDA\', \n                \'PABLO\', \n                \'2020-02-19\', \n                \'M\', \n                \'01131218333\', \n                \'TIGRE\', \n                16, \n                \'PMIRAND6@GMAIL.COM\', \n                21, \n                1, \n                4, \n                \'pmiranda\', \n                \'8\', \n                NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12312, 'pmiranda', '2020-03-05 10:50:06', 'SELECT FU_VAL_PAC(\'4\', \'\', \'Pendiente\', \'pmiranda\') as response', 'paciente_form.php', NULL, NULL, NULL),
	(12313, '::1', '2020-03-05 10:50:06', 'SELECT FU_ADJ_FILES(\'4\', \'0\', \'pacientes\', \'Consentimiento\', \'2020-03-05\', \'Consentimiento_4_2020-03-05_tali.jpg\') as response', '0', NULL, NULL, NULL),
	(12314, 'pmiranda', '2020-03-05 10:50:06', 'insert into soliris_log set usuario=\'pmiranda\', fecha=now(), accion=\'Envio de Mail\', notas=\' soliris - Paciente nuevo pendiente de aprobacion Nuevo paciente pendiente de aprobacion: . \'', 'ERROR Envio de mail ', NULL, NULL, NULL),
	(12315, 'pmiranda', '2020-03-05 10:50:06', 'Envio de Mail', NULL, ' soliris - Paciente nuevo pendiente de aprobacion Nuevo paciente pendiente de aprobacion: . ', NULL, NULL),
	(12316, 'pmiranda', '2020-03-05 16:43:23', 'SELECT ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12317, 'pmiranda', '2020-03-05 16:43:52', 'SELECT ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12318, 'pmiranda', '2020-03-05 16:45:40', 'SELECT ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12319, 'pmiranda', '2020-03-05 16:46:29', 'SELECT ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12320, 'pmiranda', '2020-03-05 16:47:02', 'SELECT ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12321, 'pmiranda', '2020-03-05 16:47:18', 'CALL ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12322, 'pmiranda', '2020-03-05 16:47:34', 'CALL ST_DOC_PAC_MODIFIED(5, \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12323, 'pmiranda', '2020-03-05 16:48:33', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\') as response', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12324, 'pmiranda', '2020-03-05 16:48:52', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12325, 'pmiranda', '2020-03-05 16:49:53', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12326, 'pmiranda', '2020-03-05 16:50:32', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12327, 'pmiranda', '2020-03-05 16:51:16', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12328, 'pmiranda', '2020-03-05 16:52:04', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12329, 'pmiranda', '2020-03-05 16:52:36', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12330, 'pmiranda', '2020-03-05 16:54:07', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12331, 'pmiranda', '2020-03-05 16:54:39', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12332, 'pmiranda', '2020-03-05 16:55:05', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12333, 'pmiranda', '2020-03-05 16:55:16', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12334, 'pmiranda', '2020-03-05 16:55:55', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12335, 'pmiranda', '2020-03-05 16:57:09', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12336, 'pmiranda', '2020-03-05 16:57:20', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12337, 'pmiranda', '2020-03-05 16:57:30', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12338, 'pmiranda', '2020-03-05 17:02:27', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12339, 'pmiranda', '2020-03-05 17:02:41', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12340, 'pmiranda', '2020-03-05 17:02:48', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12341, 'pmiranda', '2020-03-05 17:04:17', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12342, 'pmiranda', '2020-03-05 17:04:30', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12343, 'pmiranda', '2020-03-05 17:04:39', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12344, 'pmiranda', '2020-03-05 17:05:29', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12345, 'pmiranda', '2020-03-05 17:05:58', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12346, 'pmiranda', '2020-03-05 17:13:13', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12347, 'pmiranda', '2020-03-05 17:13:13', 'insert into soliris_log set usuario=\'pmiranda\', fecha=now(), accion=\'Envio de Mail\', notas=\'   \'', 'ERROR Envio de mail ', NULL, NULL, NULL),
	(12348, 'pmiranda', '2020-03-05 17:13:13', 'Envio de Mail', NULL, '   ', NULL, NULL),
	(12349, 'pmiranda', '2020-03-05 17:24:07', 'CALL `ST_DOC_PAC_MODIFIED`(\'5\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12350, 'pmiranda', '2020-03-05 17:35:27', 'CALL `ST_NEW_PACIENTE`(\r\n                \'MIRANDA\', \r\n                \'PABLO\', \r\n                \'2020-03-05\', \r\n                \'M\', \r\n                \'01131218333\', \r\n                \'TIGRE\', \r\n                13, \r\n                \'PMIRAND6@GMAIL.COM\', \r\n                17, \r\n                4, \r\n                4, \r\n                \'pmiranda\', \r\n                \'8\', \r\n                1234) as response', 'paciente_form.php', NULL, NULL, NULL),
	(12351, 'pmiranda', '2020-03-05 17:36:37', 'CALL `ST_NEW_PACIENTE`(\r\n                \'MIRANDA\', \r\n                \'PABLO\', \r\n                \'2020-03-05\', \r\n                \'M\', \r\n                \'01131218333\', \r\n                \'TIGRE\', \r\n                13, \r\n                \'PMIRAND6@GMAIL.COM\', \r\n                17, \r\n                4, \r\n                4, \r\n                \'pmiranda\', \r\n                \'8\', \r\n                1234) as response', 'paciente_form.php', NULL, NULL, NULL),
	(12352, 'pmiranda', '2020-03-05 17:38:02', 'CALL `ST_NEW_PACIENTE`(\r\n                \'MIRANDA\', \r\n                \'PABLO\', \r\n                \'2020-03-05\', \r\n                \'M\', \r\n                \'01131218333\', \r\n                \'TIGRE\', \r\n                13, \r\n                \'PMIRAND6@GMAIL.COM\', \r\n                17, \r\n                4, \r\n                4, \r\n                \'pmiranda\', \r\n                \'8\', \r\n                1234) as response', 'paciente_form.php', NULL, NULL, NULL),
	(12353, 'pmiranda', '2020-03-06 10:52:15', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234) as response', 'paciente_form.php', NULL, NULL, NULL),
	(12354, 'pmiranda', '2020-03-06 10:52:27', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12355, 'pmiranda', '2020-03-06 10:56:18', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12356, 'pmiranda', '2020-03-06 10:57:01', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12357, 'pmiranda', '2020-03-06 10:59:21', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            NULL, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12358, 'pmiranda', '2020-03-06 11:01:28', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12359, 'pmiranda', '2020-03-06 11:33:24', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12360, 'pmiranda', '2020-03-06 11:34:58', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12361, 'pmiranda', '2020-03-06 11:36:42', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            NULL, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12362, 'pmiranda', '2020-03-06 11:37:20', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12363, 'pmiranda', '2020-03-06 11:38:55', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12364, 'pmiranda', '2020-03-06 12:14:00', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLA\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12365, 'pmiranda', '2020-03-06 12:14:46', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLQ\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12366, 'pmiranda', '2020-03-06 12:15:33', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLW\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12367, 'pmiranda', '2020-03-06 12:16:48', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLE\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12368, 'pmiranda', '2020-03-06 12:17:18', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLR\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12369, 'pmiranda', '2020-03-06 12:22:37', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLT\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12370, 'pmiranda', '2020-03-06 12:23:45', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLY\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12371, 'pmiranda', '2020-03-06 12:24:25', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLU\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12372, 'pmiranda', '2020-03-06 12:24:45', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLT\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12373, 'pmiranda', '2020-03-06 12:25:12', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLI\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12374, 'pmiranda', '2020-03-06 12:27:48', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLP\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12375, 'pmiranda', '2020-03-06 12:30:30', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLU\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12376, 'pmiranda', '2020-03-06 12:32:08', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLI\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12377, 'pmiranda', '2020-03-06 12:32:19', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLñ\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12378, 'pmiranda', '2020-03-06 12:34:13', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLK\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12379, 'pmiranda', '2020-03-06 12:35:11', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLK\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12380, 'pmiranda', '2020-03-06 12:35:34', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLL\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12381, 'pmiranda', '2020-03-06 12:36:29', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLI\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12382, 'pmiranda', '2020-03-06 12:36:35', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLñ\', \r\n            \'2020-03-05\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            13, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            17, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            1234)', 'paciente_form.php', NULL, NULL, NULL),
	(12383, 'pmiranda', '2020-03-06 12:56:22', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABL\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12384, 'pmiranda', '2020-03-06 12:56:39', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABL\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12385, 'pmiranda', '2020-03-06 13:03:04', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            21, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12386, 'pmiranda', '2020-03-06 13:04:00', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLO\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            21, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12387, 'pmiranda', '2020-03-06 13:04:14', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12388, 'pmiranda', '2020-03-06 13:04:33', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABLA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12389, 'pmiranda', '2020-03-06 13:05:52', 'CALL `ST_NEW_PACIENTE`(\r\n            \'MIRANDA\', \r\n            \'PABL\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12390, 'pmiranda', '2020-03-06 13:06:40', 'CALL ST_UP_PACIENTE(\r\n            ,\r\n            \'MIRANDA\', \r\n            \'PABL\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'\' \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12391, 'pmiranda', '2020-03-06 13:07:12', 'CALL ST_UP_PACIENTE(\r\n            ,\r\n            \'MIRANDA\', \r\n            \'PABL\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'\' \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12392, 'pmiranda', '2020-03-06 13:07:36', 'CALL ST_UP_PACIENTE(\r\n            ,\r\n            \'MIRANDA\', \r\n            \'PABLA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'\' \r\n            A)', 'paciente_form.php', NULL, NULL, NULL),
	(12393, 'pmiranda', '2020-03-06 13:08:27', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABLAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'\' \r\n            A)', 'paciente_form.php', NULL, NULL, NULL),
	(12394, 'pmiranda', '2020-03-06 13:14:42', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABLAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRET\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\' \r\n            A)', 'paciente_form.php', NULL, NULL, NULL),
	(12395, 'pmiranda', '2020-03-06 13:16:09', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABL\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12396, 'pmiranda', '2020-03-06 13:16:41', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12397, 'pmiranda', '2020-03-06 13:19:17', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12398, 'pmiranda', '2020-03-06 13:21:00', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12399, 'pmiranda', '2020-03-06 13:22:36', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12400, 'pmiranda', '2020-03-06 13:23:24', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDAA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12401, 'pmiranda', '2020-03-06 13:27:43', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDAA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12402, 'pmiranda', '2020-03-06 13:28:08', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDAA\', \r\n            \'PABLAAAAA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12403, 'pmiranda', '2020-03-06 13:29:28', 'CALL ST_UP_PACIENTE(\r\n            4,\r\n            \'MIRANDAA\', \r\n            \'PABLA\', \r\n            \'2020-02-19\', \r\n            \'M\', \r\n            \'01131218333\', \r\n            \'TIGRE\', \r\n            16, \r\n            \'PMIRAND6@GMAIL.COM\', \r\n            18, \r\n            4, \r\n            4, \r\n            \'pmiranda\', \r\n            \'8\',\r\n            \'7\', \r\n            NULL)', 'paciente_form.php', NULL, NULL, NULL),
	(12404, '::1', '2020-03-06 13:29:45', 'SELECT FU_ADJ_FILES(\'4\', \'0\', \'pacientes\', \'Consentimiento\', \'2020-03-06\', \'Consentimiento_4_2020-03-06_tali.jpg\') as response', '0', NULL, NULL, NULL),
	(12405, '::1', '2020-03-06 14:49:29', 'SELECT FU_ADJ_FILES(\'4\', \'0\', \'pacientes\', \'Consentimiento\', \'2020-03-06\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\') as response', '0', NULL, NULL, NULL),
	(12406, '::1', '2020-03-06 14:52:51', 'SELECT FU_ADJ_FILES(\'4\', \'0\', \'pacientes\', \'Consentimiento\', \'2020-03-06\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\') as response', '0', NULL, NULL, NULL),
	(12407, '::1', '2020-03-06 16:40:23', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4__76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12408, '::1', '2020-03-06 16:41:18', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4__76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12409, '::1', '2020-03-06 16:42:06', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12410, '::1', '2020-03-06 16:42:48', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12411, '::1', '2020-03-06 16:43:04', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12412, '::1', '2020-03-06 16:46:05', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12413, '::1', '2020-03-06 16:49:57', 'CALL `ST_UP_DOC_PACIENTE`(4, Consentimiento, Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg, )', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12414, '::1', '2020-03-06 17:03:51', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12415, '::1', '2020-03-06 17:07:36', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12416, '::1', '2020-03-06 17:08:28', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12417, '::1', '2020-03-06 17:08:31', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12418, '::1', '2020-03-06 17:08:37', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12419, '::1', '2020-03-06 17:09:04', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_76616478_448167989220350_469734487194861568_n.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12420, '::1', '2020-03-06 17:14:35', 'CALL `ST_UP_DOC_PACIENTE`(\'\', \'Consentimiento\', \'Consentimiento__2020-03-06_tali.jpg\', \'\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12421, 'pmiranda', '2020-03-06 17:16:46', 'CALL `ST_UP_DOC_PACIENTE`(\'\', \'Consentimiento\', \'Consentimiento__2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12422, 'pmiranda', '2020-03-06 17:20:02', 'CALL `ST_UP_DOC_PACIENTE`(\'\', \'Consentimiento\', \'Consentimiento__2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12423, 'pmiranda', '2020-03-06 17:24:50', 'CALL `ST_UP_DOC_PACIENTE`(\'\', \'Consentimiento\', \'Consentimiento__2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12424, 'pmiranda', '2020-03-06 17:26:07', 'CALL `ST_UP_DOC_PACIENTE`(\'\', \'Consentimiento\', \'Consentimiento__2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12425, 'pmiranda', '2020-03-06 17:26:53', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12426, 'pmiranda', '2020-03-06 17:31:50', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12427, 'pmiranda', '2020-03-06 17:32:15', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12428, 'pmiranda', '2020-03-06 17:33:15', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_Sin-título.png\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12429, 'pmiranda', '2020-03-06 17:35:53', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12430, 'pmiranda', '2020-03-06 17:37:01', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12431, 'pmiranda', '2020-03-06 17:38:01', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12432, 'pmiranda', '2020-03-06 17:46:17', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12433, 'pmiranda', '2020-03-06 17:49:54', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Otro\', \'Otro_4_2020-03-06_tali.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12434, 'pmiranda', '2020-03-06 17:49:54', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_IMG_5907.jpg\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL),
	(12435, 'pmiranda', '2020-03-06 18:12:14', 'CALL `ST_UP_DOC_PACIENTE`(\'4\', \'Consentimiento\', \'Consentimiento_4_2020-03-06_tarjeta.pdf\', \'pmiranda\')', 'ajx.docs_paciente.php', NULL, NULL, NULL);
/*!40000 ALTER TABLE `soliris_log` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.soliris_maestro
CREATE TABLE IF NOT EXISTS `soliris_maestro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paciente_id` int(10) unsigned DEFAULT NULL,
  `edad` varchar(10) DEFAULT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `presentacion_id` int(11) DEFAULT NULL,
  `unidades` int(10) unsigned DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `patologia_id` int(11) DEFAULT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `sub_patologia_id` int(11) DEFAULT NULL,
  `canal_id` int(11) DEFAULT NULL,
  `estado_operacion_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estado_venta_id` int(11) DEFAULT NULL,
  `cod_reasignacion` int(10) unsigned DEFAULT NULL,
  `crm_id` int(10) DEFAULT NULL,
  `nota` longtext,
  `nbr` varchar(45) DEFAULT NULL COMMENT 'Numero de NP generada',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soliris.soliris_maestro: 0 rows
/*!40000 ALTER TABLE `soliris_maestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `soliris_maestro` ENABLE KEYS */;

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
	(124, 'diff_med.php', 'Diferencias de Medicos Meditec');
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

-- Volcando estructura para vista soliris.vw_lastsale_rm
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_lastsale_rm` (
	`pid` INT(10) UNSIGNED NULL,
	`nombre` VARCHAR(202) NULL COLLATE 'utf8mb4_general_ci',
	`fventa` VARCHAR(8) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento soliris.FU_SET_MED_VENTA
DELIMITER //
CREATE PROCEDURE `FU_SET_MED_VENTA`(
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
CREATE PROCEDURE `FU_SET_TMP_MED`(
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
CREATE PROCEDURE `put_log`(
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

-- Volcando estructura para procedimiento soliris.ST_DOC_PAC_MODIFIED
DELIMITER //
CREATE PROCEDURE `ST_DOC_PAC_MODIFIED`(
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
CREATE PROCEDURE `ST_GET_ACCESS`(
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
CREATE PROCEDURE `ST_GET_MAESTRO_ESTADO_ACTIVO`(
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
CREATE PROCEDURE `ST_GET_PATOLOGIAS`()
    COMMENT 'Devuelve todas las patologias activas'
BEGIN

SELECT p.id, p.patologia_nombre FROM patologia p WHERE p.estado_id = (SELECT m.id FROM maestro_estado m WHERE m.referencia = 'patologia' AND m.valor = 'Activo');

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_SUB_PATOLOGIA
DELIMITER //
CREATE PROCEDURE `ST_GET_SUB_PATOLOGIA`(
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

-- Volcando estructura para procedimiento soliris.ST_inact_medico
DELIMITER //
CREATE PROCEDURE `ST_inact_medico`()
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

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_PAC
DELIMITER //
CREATE PROCEDURE `ST_LIST_DOCS_PAC`(
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
CREATE PROCEDURE `ST_LIST_ESTADOS_PACIENTE`()
    COMMENT 'LISTA LOS ESTADO DEL PACIENTE'
BEGIN

SELECT id, valor FROM maestro_estado e WHERE e.referencia = 'paciente' AND e.tipo = 'estado';

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES
DELIMITER //
CREATE PROCEDURE `ST_LIST_PACIENTES`(
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
		     P.mail AS email, 
	  		  P.telefono AS telefono, 
	  		  P.notas AS notas, 
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.estado_id = me.id) AS estado,
	  		  vRM.fventa AS uventa, 
	  		  (SELECT me.valor FROM maestro_estado me WHERE P.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
			LEFT JOIN 
				vw_lastsale_rm AS vRM 
			ON (P.id = vRM.pid));
			
if(v_filtro = 0) then
	SELECT * FROM TEMPORARY_LIST_PACIENTES;
else
	SELECT * FROM TEMPORARY_LIST_PACIENTES WHERE LEFT(name,1) = v_ini;
end if;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_LIST_SUB_ESTADOS_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_LIST_SUB_ESTADOS_PACIENTE`()
    COMMENT 'Lista los subestados del paciente'
BEGIN

SELECT id, valor FROM maestro_estado e WHERE e.referencia = 'paciente' AND e.tipo = 'sub_estado';

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_NEW_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_NEW_PACIENTE`(
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
   

SET c_sub_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'sub_estado' AND valor = 'v_sub_estado');

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
		estado_id, 
		sub_estado_id, 
		fecha_creacion, 
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
		7, 
		c_sub_estado, 
		NOW(), 
		'SOL', 
		v_crm_id
		);

SELECT LAST_INSERT_ID() AS mensaje;


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.st_reg_faltante
DELIMITER //
CREATE PROCEDURE `st_reg_faltante`(IN `v_operacion` VARCHAR(50), IN `v_idoperacion` INT, IN `v_iddocumento` INT, IN `v_nombre` VARCHAR(255))
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
CREATE PROCEDURE `st_set_id_medico`()
BEGIN

update soliris_maestro set id_medico=(select m.id from medicos as m where m.nombre=medico);


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_SHOW_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_SHOW_PACIENTE`(
	IN `v_id` INT











)
    COMMENT 'Muestra la informacion del paciente'
BEGIN



SELECT 
	p.id as id, 
	p.apellido as apellido, 
	p.nombre as nombre, 
	(select me.id from maestro_estado me where me.id = p.estado_id) as estado_id,
	(select me.valor from maestro_estado me where me.id = p.estado_id) as estado_valor,
	(select me.id from maestro_estado me where me.id = p.sub_estado_id) as sub_estado_id,
	p.fecha_nac as fecha_nac,
	(select pat.id from patologia pat where pat.id = p.patologia_id) as patologia_id,
	(select sub_pat.id from sub_patologia sub_pat where sub_pat.id = p.sub_patologia_id) as sub_patologia_id,
	(SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(v_id), '%d/%m/%Y')) as fecha_con,
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
CREATE PROCEDURE `ST_UP_DOC_PACIENTE`(
	IN `v_idPac` INT,
	IN `v_tipoDoc` VARCHAR(50),
	IN `v_nombreDoc` VARCHAR(255),
	IN `v_usuario` VARCHAR(50)
)
    COMMENT 'Datos de la documentación subida del paciente'
BEGIN


SET @p_nombre_doc := v_nombreDoc;
SET @p_doc_tipo := 0;
SET @p_usuario_id := 0;
SET @p_id_paciente = v_idPac;


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


-- SELECT @p_nombre_doc, @p_doc_tipo, @p_usuario_id;

SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), NOW(), ?, 'SOL')");
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
CREATE PROCEDURE `ST_UP_PACIENTE`(
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
CREATE PROCEDURE `ST_UserAccess`(
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

-- Volcando estructura para función soliris.FU_ADJ_FILES
DELIMITER //
CREATE FUNCTION `FU_ADJ_FILES`(
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
CREATE FUNCTION `FU_CLE_TAGS`(
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
CREATE FUNCTION `FU_CONVEN_PANEL_MOD`(
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
CREATE FUNCTION `FU_GET_DOCUMENTS`(
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
CREATE FUNCTION `FU_GET_ID_USUARIO`(
	`v_username` VARCHAR(50)
) RETURNS int(11)
    COMMENT 'devuelve el id del usuario'
BEGIN

RETURN (SELECT u.id AS id_usuario FROM usuario u WHERE u.username = v_username ) ;

END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_GET_MED_NAME
DELIMITER //
CREATE FUNCTION `FU_GET_MED_NAME`(
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
CREATE FUNCTION `FU_GET_VENTA_MOD`(
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
CREATE FUNCTION `FU_MOD_VENTA`(
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
CREATE FUNCTION `FU_NEW_APM`(
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
CREATE FUNCTION `FU_NEW_CANAL`(
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
CREATE FUNCTION `FU_NEW_DOSIS`(
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
CREATE FUNCTION `FU_NEW_ESP`(
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
CREATE FUNCTION `FU_NEW_INST`(
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
CREATE FUNCTION `FU_NEW_MED`(`v_nombre` VARCHAR(200), `v_matricula_tipo` VARCHAR(45), `v_matricula_numero` VARCHAR(45), `v_lugar` VARCHAR(45), `v_c_atencion` VARCHAR(255), `v_telefono` VARCHAR(45), `v_fax` VARCHAR(45), `v_nacimiento` VARCHAR(45), `v_domicilio` VARCHAR(255), `v_localidad` VARCHAR(255), `v_fecha_cap` DATETIME, `v_especialidad` VARCHAR(255), `v_apm` INT, `v_estado` VARCHAR(45)
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
CREATE FUNCTION `FU_NEW_PAC`(`v_nombre` VARCHAR(200), `v_estado` VARCHAR(45), `v_sub_estado` VARCHAR(45), `v_sexo` VARCHAR(2), `v_c_gestar` VARCHAR(2), `v_patologia` VARCHAR(250), `v_fecha_nac` DATE, `v_telefono` VARCHAR(45), `v_ciudad` VARCHAR(100), `v_mail` VARCHAR(100), `v_fecha_con` DATE, `v_usuario` VARCHAR(45), `v_fv` INT) RETURNS longtext CHARSET utf8mb4
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
CREATE FUNCTION `FU_NEW_PATOLOGIA`(
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
CREATE FUNCTION `FU_NEW_UNIDADES`(
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
CREATE FUNCTION `FU_NEW_USR`(
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
CREATE FUNCTION `FU_NEW_VENTA`(
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
CREATE FUNCTION `FU_SHOW_FECHA_CONS_PAC`(
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
	d.documentos_tipo_id = 1 -- ID del consentimiento informado de la tabla documentos_id
ORDER BY 
	r.id 
DESC LIMIT 0, 1); -- https://stackoverflow.com/questions/6881424/how-can-i-select-the-row-with-the-highest-id-in-mysql/20904650
				

				
END//
DELIMITER ;

-- Volcando estructura para función soliris.FU_UP_APM
DELIMITER //
CREATE FUNCTION `FU_UP_APM`(
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
CREATE FUNCTION `FU_UP_CANAL`(
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
CREATE FUNCTION `FU_UP_DOSIS`(
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
CREATE FUNCTION `FU_UP_ESP`(
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
CREATE FUNCTION `FU_UP_INST`(
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
CREATE FUNCTION `FU_UP_MED`(`v_nombre` VARCHAR(200), `v_matricula_tipo` VARCHAR(45), `v_matricula_numero` VARCHAR(45), `v_Lugar` VARCHAR(45), `v_C_Atencion` VARCHAR(255), `v_telefono` VARCHAR(45), `v_Fax` VARCHAR(45), `v_nacimiento` VARCHAR(20), `v_domicilio` VARCHAR(255), `v_localidad` VARCHAR(255), `v_fecha_cap` VARCHAR(20), `v_especialidad` VARCHAR(255), `v_apm` INT, `v_estado` VARCHAR(15), `v_usuario` VARCHAR(45), `v_id` INT
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
CREATE FUNCTION `FU_UP_PAC`(
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
CREATE FUNCTION `FU_UP_PANEL_MOD`(
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
CREATE FUNCTION `FU_UP_PATOLOGIA`(
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
CREATE FUNCTION `FU_UP_UNIDADES`(
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
CREATE FUNCTION `FU_UP_USR`(
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
CREATE FUNCTION `FU_VAL_FEC_REC`(
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
CREATE FUNCTION `FU_VAL_MED`(
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
CREATE FUNCTION `FU_VAL_PAC`(
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
CREATE FUNCTION `FU_VAL_PAC_EDAD`(
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
CREATE FUNCTION `FU_VAL_UNI`(
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
CREATE FUNCTION `GET_NOM_PAC`(
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
CREATE FUNCTION `get_paciente`(`v_id` INT) RETURNS longtext CHARSET latin1
    COMMENT 'devuelve el nombre del paciente en base a su id'
BEGIN

declare d_resp longtext;


set d_resp = (select concat(nombre,"|",sexo,"|",patologia,"|",c_gestar) from pacientes where id=v_id);

return d_resp;

END//
DELIMITER ;

-- Volcando estructura para vista soliris.vw_lastsale_rm
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_lastsale_rm`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_lastsale_rm` AS select `RM`.`paciente_id` AS `pid`,(select concat(`p`.`apellido`,' ,',`p`.`nombre`) from `paciente` `p`) AS `nombre`,date_format(`RM`.`fecha_venta`,'%d/%m/%y') AS `fventa` from `soliris_maestro` `RM` where (`RM`.`estado_venta_id` <> 14) group by (select concat(`p`.`apellido`,' ,',`p`.`nombre`) from `paciente` `p`) order by `RM`.`id` desc;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
