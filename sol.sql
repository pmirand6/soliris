-- --------------------------------------------------------
-- Host:                         192.168.0.62
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

-- Volcando datos para la tabla soliris.auxiliar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auxiliar` DISABLE KEYS */;
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

-- Volcando datos para la tabla soliris.maestro_estado: ~13 rows (aproximadamente)
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
	(13, 'Rechazado', 'estado', 'paciente');
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

-- Volcando datos para la tabla soliris.os: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` (`id`, `nombre`, `descripcion`, `aux_1`, `aux_2`, `u_modificacion`, `usuario`, `estado`) VALUES
	(1, 'AMEPBA', 'Obra social de empleados del Banco Provincia de Buenos Aires', NULL, NULL, '0000-00-00 00:00:00', '', 'AC'),
	(2, 'OSCHOCA', 'Obra Social de Choferes de Camiones', '', '', '2019-11-13 16:59:53', 'np_dcilveti@arndp.raffo.local', 'AC'),
	(3, 'OSGEGYPE', 'Sindicato de obreros y empleados de estaciones de servicio', '', '', '2019-12-06 10:53:27', 'np_dcilveti@arndp.raffo.local', 'AC');
/*!40000 ALTER TABLE `os` ENABLE KEYS */;

-- Volcando estructura para tabla soliris.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `nombre_completo` varchar(200) NOT NULL,
  `fecha_nac` date NOT NULL DEFAULT '0000-00-00',
  `sexo` varchar(2) NOT NULL DEFAULT '',
  `telefono` varchar(45) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais_id` int(11) NOT NULL COMMENT 'ID de Pais',
  `mail` varchar(100) DEFAULT NULL,
  `patologia_id` int(11) DEFAULT NULL COMMENT 'ID Patologia',
  `sub_patologia_id` int(11) DEFAULT NULL,
  `os_id` int(11) unsigned DEFAULT NULL COMMENT 'ID de la Obra Social',
  `notas` longtext,
  `usuario_id` int(11) unsigned NOT NULL,
  `c_gestar` varchar(2) DEFAULT NULL,
  `estado_id` int(11) DEFAULT '7' COMMENT 'ID de Estado',
  `sub_estado_id` int(11) DEFAULT '8' COMMENT 'ID de Sub Estado',
  `fecha_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL' COMMENT 'rvl/tali/---',
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
  CONSTRAINT `FK_os_pac` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`),
  CONSTRAINT `FK_estado_pac` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_pais_pac` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`ID`),
  CONSTRAINT `FK_patologia_pac` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`),
  CONSTRAINT `FK_sub_estado_paciente` FOREIGN KEY (`sub_estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_sub_patologia_pac` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`),
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

-- Volcando datos para la tabla soliris.soliris_log: ~31 rows (aproximadamente)
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
	(12284, 'pmiranda', '2020-02-14 12:26:10', 'CALL `ST_NEW_PACIENTE`(\n                TEST, \n                TEST, \n                2020-02-14, \n                M, \'\n                45097100\', \n                BUENOS AIRES, \n                13, \n                TEST@TEST.COM, \n                17, \n                , \n                , \n                pmiranda, \n                Activo, \n                TEST@TEST.COM)', 'paciente_form.php', NULL, NULL, NULL);
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
  `canal_id` int(11) DEFAULT NULL,
  `estado_operacion_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estado_venta_id` int(11) DEFAULT NULL,
  `cod_reasignacion` int(10) unsigned DEFAULT NULL,
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

-- Volcando datos para la tabla soliris.sub_patologia: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `sub_patologia` DISABLE KEYS */;
INSERT INTO `sub_patologia` (`id`, `sub_patologia_nombre`, `familia`, `usuario_audit`, `fecha_audit`) VALUES
	(1, 'C3GN', 'SOL', '', '2020-02-10 16:05:32'),
	(2, 'EDD', 'SOL', '', '2020-02-10 16:05:44'),
	(3, 'CFHR5GP', 'SOL', '', '2020-02-10 16:05:54');
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
	(34, 'dcilveti', '0', 1, 1),
	(35, 'gpardo', '0', 1, 1),
	(36, 'mnakatsuno', '0', 1, 1),
	(37, 'lliloia', '0', 1, 1),
	(38, 'msadouet', '0', 1, 1),
	(39, 'agonzalez', '0', 1, 1),
	(40, 'mcavagion', '0', 1, 1),
	(41, 'jkiprizlian', '0', 1, 1),
	(42, 'cburgues', '0', 1, 1),
	(43, 'marruzazabala', '0', 1, 1),
	(44, 'fcastro', '0', 1, 1),
	(45, 'aheredia', '0', 1, 1),
	(46, 'cbento', '0', 1, 1),
	(47, 'splatero', '0', 1, 1),
	(48, 'mnorris', '0', 1, 1),
	(49, 'dmartinez', '0', 1, 1),
	(50, 'pmiranda', '0', 1, 1),
	(51, 'sdiazbancalari', '0', 1, 1),
	(52, 'rjfernandez', '0', 1, 1),
	(53, 'eala', '0', 1, 1),
	(54, 'cpalomeque', '0', 1, 1),
	(55, 'fzapata', '0', 1, 1),
	(56, 'cpenela', '0', 1, 1),
	(57, 'sbisceglia', '0', 1, 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para vista soliris.vw_lastsale_rm
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_lastsale_rm` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_BI_revli_imno
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_BI_revli_imno` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_DataDPG_Admin
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_DataDPG_Admin` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_DataDPG_User
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_DataDPG_User` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_DataGDP
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_DataGDP` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_DataPPA
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_DataPPA` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_extranet
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_extranet` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_facturacion
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_facturacion` (
	`registro` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`nombre` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`medicamento` TEXT NULL COLLATE 'latin1_swedish_ci',
	`nu_canal` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`canal` VARCHAR(100) NULL COLLATE 'latin1_swedish_ci',
	`fecha` DATE NULL,
	`id` INT(11) UNSIGNED NOT NULL,
	`lote` VARCHAR(45) NULL COLLATE 'latin1_swedish_ci',
	`vencimiento` VARCHAR(45) NULL COLLATE 'latin1_swedish_ci',
	`boca` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`documento` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`numero` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`producto` INT(11) UNSIGNED NULL,
	`verif` INT(11) UNSIGNED NOT NULL,
	`operacion` INT(11) UNSIGNED NULL,
	`clase` VARCHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`origen` VARCHAR(11) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_maestro
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_maestro` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_master_institucion
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_master_institucion` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_medicos_mat_nac
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_medicos_mat_nac` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_medicos_mat_prov
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_medicos_mat_prov` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_meses_apm
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_meses_apm` (
	`fecha` VARCHAR(7) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_pacientes
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_pacientes` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(200) NOT NULL COLLATE 'latin1_swedish_ci',
	`sexo` VARCHAR(2) NOT NULL COLLATE 'latin1_swedish_ci',
	`cgestar` VARCHAR(2) NULL COLLATE 'latin1_swedish_ci',
	`fnac` DATE NULL,
	`patologia` VARCHAR(250) NULL COLLATE 'latin1_swedish_ci',
	`fconsen` DATE NULL,
	`email` VARCHAR(100) NULL COLLATE 'latin1_swedish_ci',
	`telefono` VARCHAR(45) NULL COLLATE 'latin1_swedish_ci',
	`notas` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`estado` VARCHAR(45) NULL COLLATE 'latin1_swedish_ci',
	`uventa` DATE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_pacientes_rep
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_pacientes_rep` 
) ENGINE=MyISAM;

-- Volcando estructura para vista soliris.v_rvmaestro
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_rvmaestro` 
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
CREATE PROCEDURE `put_log`(IN `v_usuario` VARCHAR(50), IN `v_id` INT, IN `v_tabla` VARCHAR(50), IN `v_notas` LONGTEXT)
    COMMENT 'Carga informacion al log de la app'
BEGIN

declare d_values longtext;

set d_values=(SELECT group_concat(column_name) FROM information_schema.COLUMNS where TABLE_SCHEMA='soliris' and TABLE_NAME=v_tabla);



insert into soliris_log (usuario,fecha, accion, registro, tabla, notas) (select d_values from v_tabla where id=v_id) ;


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
	IN `v_sub_estado_id` INT,
	IN `v_crm_id` INT
)
    COMMENT 'Creacion del nuevo paciente'
BEGIN

DECLARE c_usuario_id INT;
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
		fecha_stamp, 
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
		v_sub_estado_id, 
		NOW(), 
		'SOL', 
		v_crm_id
		);

SELECT cr_debug.get_LAST_INSERT_ID();


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
	`v_estado` VARCHAR(45),
	`v_usuario` VARCHAR(45)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
 
		UPDATE pacientes SET 
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

-- Volcando estructura para evento soliris.EVE_inact_medicos
DELIMITER //
CREATE EVENT `EVE_inact_medicos` ON SCHEDULE EVERY 1 DAY STARTS '2018-10-23 23:55:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

CALL ST_inact_medico();

END//
DELIMITER ;

-- Volcando estructura para vista soliris.vw_lastsale_rm
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_lastsale_rm`;
CREATE VIEW `vw_lastsale_rm` AS select `RM`.`nombre` AS `nombre`,date_format(`RM`.`fecha_venta`,'%d/%m/%y') AS `fventa`,`RM`.`APM` AS `APM` from `soliris`.`soliris_maestro` `RM` where (`RM`.`estado` <> 'eliminado') group by `RM`.`nombre` order by `RM`.`id` desc ;

-- Volcando estructura para vista soliris.v_BI_revli_imno
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_BI_revli_imno`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_BI_revli_imno` AS select `m`.`id` AS `id`,`m`.`nombre` AS `nombre`,`m`.`sexo` AS `sexo`,`m`.`fecha_nac` AS `fecha_nac`,`m`.`edad` AS `edad`,`m`.`medico` AS `medico`,`m`.`dosis` AS `dosis`,`m`.`unidades` AS `unidades`,`m`.`fecha_venta` AS `fecha_venta`,`m`.`consentimiento` AS `consentimiento`,`m`.`patologia` AS `patologia`,`m`.`institucion` AS `institucion`,`m`.`canal` AS `canal`,`m`.`tipo` AS `tipo`,`m`.`padre` AS `padre`,`m`.`historico` AS `historico`,`m`.`notas` AS `notas`,`m`.`cargado` AS `cargado`,`m`.`fecha` AS `fecha`,`m`.`estado` AS `estado`,`m`.`validacion` AS `validacion`,`m`.`fecha_receta` AS `fecha_receta`,`m`.`fecha_test` AS `fecha_test`,`m`.`APM` AS `APM`,`m`.`autoriza` AS `autoriza`,`m`.`autoriza_fecha` AS `autoriza_fecha`,`m`.`autoriza_nota` AS `autoriza_nota`,`m`.`grupo` AS `grupo`,`m`.`Origen` AS `Origen`,`m`.`aux` AS `aux`,`m`.`convenio` AS `convenio`,`m`.`medicamento` AS `medicamento` from `aplicaciones`.`v_maestro` `m` union select `m`.`id` AS `id`,`m`.`nombre` AS `nombre`,`m`.`sexo` AS `sexo`,`m`.`fecha_nac` AS `fecha_nac`,`m`.`edad` AS `edad`,`m`.`medico` AS `medico`,`m`.`dosis` AS `dosis`,`m`.`unidades` AS `unidades`,`m`.`fecha_venta` AS `fecha_venta`,`m`.`consentimiento` AS `consentimiento`,`m`.`patologia` AS `patologia`,`m`.`institucion` AS `institucion`,`m`.`canal` AS `canal`,`m`.`tipo` AS `tipo`,`m`.`padre` AS `padre`,`m`.`historico` AS `historico`,`m`.`notas` AS `notas`,`m`.`cargado` AS `cargado`,`m`.`fecha` AS `fecha`,`m`.`estado` AS `estado`,`m`.`validacion` AS `validacion`,`m`.`fecha_receta` AS `fecha_receta`,`m`.`fecha_test` AS `fecha_test`,`m`.`APM` AS `APM`,`m`.`autoriza` AS `autoriza`,`m`.`autoriza_fecha` AS `autoriza_fecha`,`m`.`autoriza_nota` AS `autoriza_nota`,`m`.`grupo` AS `grupo`,`m`.`Origen` AS `Origen`,`m`.`aux` AS `aux`,`m`.`convenio` AS `convenio`,`m`.`medicamento` AS `medicamento` from `soliris`.`v_maestro` `m`;

-- Volcando estructura para vista soliris.v_DataDPG_Admin
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_DataDPG_Admin`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_DataDPG_Admin` AS select `RM`.`id` AS `id`,`RM`.`sexo` AS `sexo`,date_format(`RM`.`fecha_nac`,'%d/%m/%Y') AS `f_nac`,`RM`.`edad` AS `edad`,`RM`.`patologia` AS `patologia`,`RM`.`nombre` AS `nombre`,`RM`.`estado` AS `estado`,`P`.`Nombre` AS `nombrePaciente`,(select date_format(`RM`.`fecha_venta`,'%d/%m/%Y') from `soliris_maestro` `RM` where (`RM`.`nombre` = `P`.`id`) order by `RM`.`fecha_venta` desc limit 1,1) AS `uventa`,`P`.`c_gestar` AS `c_gestar`,(select `FU_GET_DOCUMENTS`(`RM`.`id`,'soliris_maestro')) AS `documentos` from (`soliris_maestro` `RM` left join `pacientes` `P` on((`RM`.`nombre` = `P`.`id`))) where ((`RM`.`estado` in ('Pendiente','FV','Postergado')) or isnull(`RM`.`estado`)) order by `RM`.`id` desc;

-- Volcando estructura para vista soliris.v_DataDPG_User
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_DataDPG_User`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_DataDPG_User` AS select `RM`.`id` AS `id`,`RM`.`sexo` AS `sexo`,date_format(`RM`.`fecha_nac`,'%d/%m/%Y') AS `f_nac`,`RM`.`edad` AS `edad`,`RM`.`patologia` AS `patologia`,`RM`.`nombre` AS `nombre`,`RM`.`estado` AS `estado`,`P`.`Nombre` AS `nombrePaciente`,(select date_format(`RM`.`fecha_venta`,'%d/%m/%Y') from `soliris_maestro` `RM` where (`RM`.`nombre` = `P`.`id`) order by `RM`.`fecha_venta` desc limit 1,1) AS `uventa`,`P`.`c_gestar` AS `c_gestar`,(select `FU_GET_DOCUMENTS`(`RM`.`id`,'soliris_maestro')) AS `documentos` from (`soliris_maestro` `RM` left join `pacientes` `P` on((`RM`.`nombre` = `P`.`id`))) where (`RM`.`estado` in ('Autorizado','Rechazado','Documentacion')) order by `RM`.`id` desc;

-- Volcando estructura para vista soliris.v_DataGDP
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_DataGDP`;
CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `v_DataGDP` AS select `RM`.`id` AS `id`,`RM`.`nombre` AS `IDPac`,`RM`.`sexo` AS `sexo`,date_format(`RM`.`fecha_nac`,'%d/%m/%Y') AS `f_nac`,`RM`.`edad` AS `edad`,`RM`.`patologia` AS `patologia`,`RM`.`nombre` AS `nombre`,`RM`.`estado` AS `estado`,`RM`.`aux` AS `aux`,md5(`RM`.`id`) AS `md5`,date_format(`RM`.`fecha_venta`,'%d/%m/%Y') AS `f_venta`,(select date_format(`RM`.`fecha_venta`,'%d/%m/%Y') from `soliris_maestro` `RM` where (`RM`.`nombre` = `P`.`id`) order by `RM`.`fecha_venta` desc limit 1,1) AS `uventa`,`P`.`Nombre` AS `nombrePaciente`,`P`.`c_gestar` AS `c_gestar`,(select `FU_GET_DOCUMENTS`(`RM`.`id`,'soliris_maestro')) AS `documentos` from (`soliris_maestro` `RM` left join `pacientes` `P` on((`RM`.`nombre` = `P`.`id`))) where ((`RM`.`estado` in ('Rechazado','Pendiente','Postergado','Documentacion')) or isnull(`RM`.`estado`)) order by `RM`.`estado`;

-- Volcando estructura para vista soliris.v_DataPPA
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_DataPPA`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_DataPPA` AS select `P`.`id` AS `id`,`P`.`sexo` AS `sexo`,date_format(`P`.`fecha_nac`,'%d/%m/%Y') AS `f_nac`,`P`.`c_gestar` AS `c_gestar`,`P`.`Patologia` AS `patologia`,`P`.`Nombre` AS `nombre`,`P`.`estado` AS `estado`,md5(`P`.`id`) AS `md5`,(select group_concat(`RDD`.`documento` separator ';') from `soliris_documentacion` `RDD` where ((`RDD`.`id_maestro` = `P`.`id`) and (`RDD`.`tipo` in ('Consentimiento','Test Embarazo','Ginecologico','Tarjeta','Otros')))) AS `documentos` from `pacientes` `P` where ((`P`.`estado` not in ('Aprobado','Baja','Error')) and ((to_days(now()) - to_days(`P`.`fecha_stamp`)) < 180)) order by `P`.`fecha_stamp` desc;

-- Volcando estructura para vista soliris.v_extranet
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_extranet`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_extranet` AS select `m`.`id` AS `id`,`p`.`Nombre` AS `nombre`,`m`.`fecha_venta` AS `fecha_venta`,`m`.`dosis` AS `dosis`,`m`.`unidades` AS `unidades`,`m`.`tipo` AS `tipo`,`m`.`medico` AS `medico`,`m`.`estado` AS `estado`,`m`.`patologia` AS `patologia`,`m`.`institucion` AS `institucion`,`m`.`canal` AS `canal`,`m`.`APM` AS `apm`,`med`.`C_Atencion` AS `c_atencion`,`m`.`fecha` AS `fecha` from ((`soliris_maestro` `m` join `pacientes` `p` on((`p`.`id` = `m`.`nombre`))) join `medicos` `med` on((`med`.`Nombre` = convert(`m`.`medico` using utf8mb4))));

-- Volcando estructura para vista soliris.v_facturacion
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_facturacion`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_facturacion` AS select substring_index(`aplicaciones`.`facturacion`.`nombre`,'-',1) AS `registro`,`aplicaciones`.`facturacion`.`nombre` AS `nombre`,`aplicaciones`.`facturacion`.`medicamento` AS `medicamento`,`aplicaciones`.`facturacion`.`Nu_canal` AS `nu_canal`,`aplicaciones`.`facturacion`.`canal` AS `canal`,cast(`aplicaciones`.`facturacion`.`fecha` as date) AS `fecha`,`aplicaciones`.`facturacion`.`id` AS `id`,`aplicaciones`.`facturacion`.`lote` AS `lote`,`aplicaciones`.`facturacion`.`vencimiento` AS `vencimiento`,`aplicaciones`.`facturacion`.`boca` AS `boca`,`aplicaciones`.`facturacion`.`documento` AS `documento`,`aplicaciones`.`facturacion`.`numero` AS `numero`,`aplicaciones`.`facturacion`.`producto` AS `producto`,`aplicaciones`.`facturacion`.`verif` AS `verif`,`aplicaciones`.`facturacion`.`id_revlimid` AS `operacion`,(case `aplicaciones`.`facturacion`.`documento` when '1' then 'A' when '6' then 'B' end) AS `clase`,'facturacion' AS `origen` from `aplicaciones`.`facturacion` union select substring_index(`aplicaciones`.`remitos`.`nombre`,' ',-(1)) AS `registro`,`aplicaciones`.`remitos`.`nombre` AS `nombre`,`aplicaciones`.`remitos`.`codigo` AS `medicamento`,'' AS `nu_canal`,`aplicaciones`.`remitos`.`canal` AS `canal`,str_to_date(`aplicaciones`.`remitos`.`fecha`,'%d/%m/%Y') AS `fecha`,`aplicaciones`.`remitos`.`id` AS `id`,`aplicaciones`.`remitos`.`lote` AS `lote`,'' AS `vencimiento`,'' AS `boca`,'' AS `documento`,'' AS `numero`,`aplicaciones`.`remitos`.`codigo` AS `producto`,`aplicaciones`.`remitos`.`verif` AS `verif`,`aplicaciones`.`remitos`.`id_revlimid` AS `operacion`,'' AS `clase`,'remitos' AS `origen` from `aplicaciones`.`remitos`;

-- Volcando estructura para vista soliris.v_maestro
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_maestro`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_maestro` AS select `m`.`id` AS `id`,`p`.`Nombre` AS `nombre`,`m`.`sexo` AS `sexo`,`m`.`fecha_nac` AS `fecha_nac`,`m`.`edad` AS `edad`,`m`.`medico` AS `medico`,`m`.`dosis` AS `dosis`,`m`.`unidades` AS `unidades`,`m`.`fecha_venta` AS `fecha_venta`,`m`.`consentimiento` AS `consentimiento`,`m`.`patologia` AS `patologia`,`m`.`institucion` AS `institucion`,`m`.`canal` AS `canal`,`m`.`tipo` AS `tipo`,`m`.`padre` AS `padre`,`m`.`historico` AS `historico`,`m`.`notas` AS `notas`,`m`.`cargado` AS `cargado`,`m`.`fecha` AS `fecha`,`m`.`estado` AS `estado`,`m`.`validacion` AS `validacion`,`m`.`fecha_receta` AS `fecha_receta`,`m`.`fecha_test` AS `fecha_test`,`m`.`APM` AS `APM`,`m`.`autoriza` AS `autoriza`,`m`.`autoriza_fecha` AS `autoriza_fecha`,`m`.`autoriza_nota` AS `autoriza_nota`,`m`.`grupo` AS `grupo`,`m`.`Origen` AS `Origen`,`m`.`aux` AS `aux`,`m`.`convenio` AS `convenio`,'soliris' AS `medicamento` from (`soliris_maestro` `m` join `pacientes` `p` on((`p`.`id` = `m`.`nombre`)));

-- Volcando estructura para vista soliris.v_master_institucion
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_master_institucion`;
CREATE VIEW `v_master_institucion` AS select date_format(`m`.`fecha_venta`,'%d/%m/%y') AS `fecha_venta`,`m`.`institucion` AS `institucion`,`m`.`patologia` AS `patologia`,`i`.`tipo` AS `tipo` from (`soliris`.`soliris_maestro` `m` join `soliris`.`institucion` `i` on((convert(`m`.`institucion` using utf8mb4) = convert(`i`.`nombre` using utf8mb4)))) ;

-- Volcando estructura para vista soliris.v_medicos_mat_nac
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_medicos_mat_nac`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_medicos_mat_nac` AS select `t`.`id` AS `id`,`t`.`apellido` AS `apellido`,`t`.`nombre` AS `nombre`,`t`.`m_nac` AS `m_nac`,`t`.`m_prov` AS `m_prov`,`t`.`email` AS `email`,`t`.`esp_id` AS `esp_id`,`t`.`apm_id` AS `apm_id`,`t`.`telefono` AS `telefono`,`t`.`prov_id` AS `prov_id`,`t`.`localidad` AS `localidad`,`t`.`calle` AS `calle`,`t`.`n_dom` AS `n_dom`,`t`.`t_c_ate` AS `t_c_ate`,`t`.`n_c_ate` AS `n_c_ate`,`t`.`m_tipo` AS `m_tipo` from `tmp_med` `t` where (`t`.`m_nac` > 0) group by `t`.`m_nac`;

-- Volcando estructura para vista soliris.v_medicos_mat_prov
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_medicos_mat_prov`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_medicos_mat_prov` AS select `t`.`id` AS `id`,`t`.`apellido` AS `apellido`,`t`.`nombre` AS `nombre`,`t`.`m_nac` AS `m_nac`,`t`.`m_prov` AS `m_prov`,`t`.`email` AS `email`,`t`.`esp_id` AS `esp_id`,`t`.`apm_id` AS `apm_id`,`t`.`telefono` AS `telefono`,`t`.`prov_id` AS `prov_id`,`t`.`localidad` AS `localidad`,`t`.`calle` AS `calle`,`t`.`n_dom` AS `n_dom`,`t`.`t_c_ate` AS `t_c_ate`,`t`.`n_c_ate` AS `n_c_ate`,`t`.`m_tipo` AS `m_tipo` from `tmp_med` `t` where (`t`.`m_nac` = 0);

-- Volcando estructura para vista soliris.v_meses_apm
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_meses_apm`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_meses_apm` AS select distinct concat(month(`soliris_maestro`.`fecha_venta`),'/',year(`soliris_maestro`.`fecha_venta`)) AS `fecha` from `soliris_maestro` where (`soliris_maestro`.`fecha_venta` > (now() + interval -(18) month)) order by `soliris_maestro`.`fecha_venta` desc;

-- Volcando estructura para vista soliris.v_pacientes
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_pacientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_pacientes` AS select `P`.`id` AS `id`,`P`.`Nombre` AS `name`,`P`.`sexo` AS `sexo`,`P`.`c_gestar` AS `cgestar`,(`P`.`fecha_nac` + interval 1 day) AS `fnac`,`P`.`Patologia` AS `patologia`,(`P`.`Fecha_Con` + interval 1 day) AS `fconsen`,`P`.`mail` AS `email`,`P`.`telefono` AS `telefono`,`P`.`notas` AS `notas`,`P`.`estado` AS `estado`,((select `RM`.`fecha_venta` from `aplicaciones`.`revlimid_maestro` `RM` where (`RM`.`nombre` = `P`.`id`) order by `P`.`id` desc limit 1) + interval 1 day) AS `uventa` from `aplicaciones`.`pacientes` `P` where (`P`.`estado` = 'Aprobado');

-- Volcando estructura para vista soliris.v_pacientes_rep
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_pacientes_rep`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_pacientes_rep` AS select `p`.`id` AS `id`,`p`.`Nombre` AS `Nombre`,`p`.`sexo` AS `sexo`,`p`.`fecha_nac` AS `fecha_nac`,`p`.`Patologia` AS `patologia`,`p`.`Fecha_Con` AS `fecha_con`,count(`m`.`id`) AS `cuenta_id`,sum(substring_index(`m`.`dosis`,' ',1)) AS `suma_dosis` from (`pacientes` `p` join `soliris_maestro` `m` on((`m`.`nombre` = `p`.`id`))) where (`m`.`estado` in ('NP','Historico')) group by `p`.`id` order by `p`.`id`;

-- Volcando estructura para vista soliris.v_rvmaestro
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_rvmaestro`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_rvmaestro` AS select `rv`.`id` AS `id`,`p`.`Nombre` AS `nombre`,`rv`.`sexo` AS `sexo`,`rv`.`fecha_nac` AS `fecha_nac`,`rv`.`edad` AS `edad`,`rv`.`medico` AS `medico`,`rv`.`dosis` AS `dosis`,`rv`.`unidades` AS `unidades`,`rv`.`fecha_venta` AS `fecha_venta`,`rv`.`consentimiento` AS `consentimiento`,`rv`.`patologia` AS `patologia`,`rv`.`institucion` AS `institucion`,`rv`.`canal` AS `canal`,`rv`.`tipo` AS `tipo`,`rv`.`padre` AS `padre`,`rv`.`historico` AS `historico`,`rv`.`notas` AS `notas`,`rv`.`cargado` AS `cargado`,`rv`.`fecha` AS `fecha`,`rv`.`estado` AS `estado`,`rv`.`validacion` AS `validacion`,`rv`.`fecha_receta` AS `fecha_receta`,`rv`.`fecha_test` AS `fecha_test`,`rv`.`APM` AS `APM`,`rv`.`autoriza` AS `autoriza`,`rv`.`autoriza_fecha` AS `autoriza_fecha`,`rv`.`autoriza_nota` AS `autoriza_nota`,`rv`.`grupo` AS `grupo`,`rv`.`Origen` AS `Origen`,`rv`.`aux` AS `aux`,`med`.`C_Atencion` AS `c_atencion`,`rv`.`convenio` AS `convenio` from ((`soliris_maestro` `rv` join `pacientes` `p` on((`rv`.`nombre` = `p`.`id`))) join `medicos` `med` on((convert(`rv`.`medico` using utf8mb4) = `med`.`Nombre`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
