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
  KEY `FK_estado_pac` (`estado_id`),
  KEY `FK_os_pac` (`os_id`),
  KEY `FK_pais_pac` (`pais_id`),
  KEY `FK_patologia_pac` (`patologia_id`),
  KEY `FK_sub_estado_pac` (`sub_patologia_id`),
  KEY `FK_sub_estado_paciente` (`sub_estado_id`),
  KEY `FK_usuario_mod_pac` (`usuario_mod_id`),
  KEY `FK_usuario_pac` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=8192 COMMENT='Tabla de Pacientes';

-- Volcando datos para la tabla soliris.paciente: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`id`, `apellido`, `nombre`, `nombre_completo`, `fecha_nac`, `sexo`, `telefono`, `ciudad`, `pais_id`, `mail`, `patologia_id`, `sub_patologia_id`, `os_id`, `notas`, `usuario_id`, `c_gestar`, `estado_id`, `sub_estado_id`, `fecha_creacion`, `familia`, `fecha_modificacion`, `usuario_mod_id`, `crm_id`) VALUES
	(1, 'APELLIDOUNO', 'NOMBREUNO NOMBREDOS', 'APELLIDOUNO, NOMBREUNO NOMBREDOS', '1990-06-21', 'M', '45097190', 'NULL', 13, 'MAIL@MAIL.COM.AR', 19, 4, 2, 'sdadasd', 34, '', 7, 8, '2020-04-13 15:31:44', 'SOL', '2020-05-11 00:01:36', 50, 30406),
	(2, 'MIRANDA', 'PABLO', 'MIRANDA, PABLO', '2020-04-07', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 17, 4, 4, 'Le voy a cargar la documentaqcion', 50, '', 7, 8, '2020-04-13 15:56:57', 'SOL', '2020-05-11 10:45:56', 50, NULL),
	(3, 'PACIENTE', 'DASDASD', 'PACIENTE, DASDASD', '2020-04-06', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 17, 4, 4, 'Se corrige nuevamente el nombre del paciente', 50, '', 7, 8, '2020-04-15 22:21:32', 'SOL', '2020-05-10 23:28:27', 50, NULL),
	(4, 'paciente2', 'paciente2', 'paciente2, paciente2', '2020-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:21:39', 'SOL', '2020-04-15 22:25:33', 34, 0),
	(5, 'paciente3', 'paciente3', 'paciente3, paciente3', '2020-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:21:44', 'SOL', '2020-04-15 22:25:36', 34, 0),
	(6, 'paciente4', 'paciente4', 'paciente4, paciente4', '1999-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:21:55', 'SOL', '2020-04-15 22:25:38', 34, 0),
	(7, 'paciente5', 'paciente5', 'paciente5, paciente5', '1987-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:22:04', 'SOL', '2020-04-15 22:25:40', 34, 0),
	(8, 'paciente6', 'paciente6', 'paciente6, paciente6', '1987-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:22:11', 'SOL', '2020-04-15 22:25:42', 34, 0),
	(9, 'paciente7', 'paciente7', 'paciente7, paciente7', '1946-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:22:27', 'SOL', '2020-04-15 22:25:44', 34, 0),
	(10, 'paciente8', 'paciente8', 'paciente8, paciente8', '1945-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:22:35', 'SOL', '2020-04-15 22:25:47', 34, 0),
	(11, 'paciente9', 'paciente9', 'paciente9, paciente9', '1978-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok', 50, NULL, 11, 8, '2020-04-15 22:22:42', 'SOL', '2020-04-27 09:32:37', 50, 0),
	(12, 'paciente10', 'paciente10', 'paciente10, paciente10', '1978-04-04', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 17, 4, 4, 'ok se ve bien la documentacion', 50, NULL, 11, 8, '2020-04-15 22:22:48', 'SOL', '2020-04-15 22:25:51', 34, 0),
	(13, 'CILAN', 'MARCEL', 'CILAN, MARCEL', '1973-11-04', 'M', 'NULL', 'NULL', 13, 'NULL', 20, 4, 4, '', 34, '', 11, 8, '2020-04-21 14:32:11', 'SOL', '2020-04-21 15:21:01', 34, NULL),
	(14, 'KUZTNERUK', 'ANTUAN', 'KUZTNERUK, ANTUAN', '1945-07-17', 'M', '', '', 13, '', 20, 4, 4, NULL, 34, NULL, 31, 8, '2020-04-23 21:21:31', 'SOL', '2020-04-23 21:21:31', 34, 0),
	(15, 'ASI', 'ANTUAN', 'ASI, ANTUAN', '1975-06-21', 'M', '', '', 13, '', 18, 4, 4, 'OK', 34, NULL, 11, 8, '2020-04-24 17:37:47', 'SOL', '2020-04-24 17:47:34', 34, 0),
	(16, 'PRUEBA PACIENTE ', 'PRUEBA PCIENTE', 'PRUEBA PACIENTE , PRUEBA PCIENTE', '2020-04-03', 'M', '', '', 13, '', 19, 4, 4, NULL, 50, NULL, 7, 8, '2020-04-27 01:49:50', 'SOL', '2020-04-27 01:49:50', 50, 0),
	(17, 'MORRISON', 'JIM', 'MORRISON, JIM', '1970-01-22', 'M', '', '', 13, '', 20, 4, 4, NULL, 50, NULL, 7, 8, '2020-04-27 01:52:26', 'SOL', '2020-04-27 01:52:26', 50, 0),
	(18, 'MARCELINO', 'MILENA ABIGAIL', 'MARCELINO, MILENA ABIGAIL', '2007-04-24', 'F', '02245 15508769', '', 13, '', 21, 4, 5, NULL, 34, NULL, 7, 8, '2020-04-27 09:24:53', 'SOL', '2020-04-27 09:24:53', 34, 30406),
	(19, 'TESTOCHO', 'NOMBREOCHO', 'TESTOCHO, NOMBREOCHO', '2019-01-08', 'F', '', '', 13, '', 20, 4, 5, 'Se aprueba el paciente', 34, NULL, 11, 8, '2020-04-27 09:52:37', 'SOL', '2020-04-27 09:53:47', 50, 0),
	(20, 'NUñEZ', 'FRANCO IVAN', 'NUñEZ, FRANCO IVAN', '1982-06-26', 'M', '0292 5493555', 'La Plata', 13, '', 17, 4, 5, 'Ok', 34, NULL, 11, 8, '2020-04-27 10:30:56', 'SOL', '2020-04-27 11:14:04', 34, 27726),
	(21, 'LENNON', 'JOHN', 'LENNON, JOHN', '1970-01-01', 'M', '01131218333', 'Tigre', 13, 'pmirand6@gmail.com', 20, 4, 4, 'OK ', 50, NULL, 11, 8, '2020-05-05 11:14:34', 'SOL', '2020-05-05 11:24:36', 34, 0),
	(22, 'CARRIL', 'HUGO', 'CARRIL, HUGO', '1953-08-04', 'M', 'NULL', 'NULL', 13, 'HUGO@GMAIL.COM', 20, 4, 4, 'actualizacion de correo', 34, '', 7, 8, '2020-05-05 14:33:15', 'SOL', '2020-05-12 10:12:20', 50, NULL),
	(23, 'JULIO', 'CESAR', 'JULIO, CESAR', '1964-08-12', 'M', '', '', 13, '', 19, 4, 4, 'OK.-', 34, NULL, 11, 8, '2020-05-07 10:14:26', 'SOL', '2020-05-07 10:39:36', 34, 30406),
	(24, 'MIRANDA', 'PABLO', 'MIRANDA, PABLO', '2020-05-01', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 18, 4, 4, 'Se procede a actualizar la documentación', 50, '', 7, 8, '2020-05-11 00:08:48', 'SOL', '2020-05-11 00:16:54', 50, NULL),
	(25, 'MIRANDA', 'GASTON', 'MIRANDA, GASTON', '2020-05-06', 'M', '01131218333', 'TIGRE', 13, 'PMIRAND6@GMAIL.COM', 19, 4, 4, 'Se procede a actualizar la documentacion', 50, '', 7, 8, '2020-05-11 00:18:16', 'SOL', '2020-05-11 00:21:06', 50, NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
