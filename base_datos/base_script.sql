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
  `estado_id` int(11) NOT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.aux_old
CREATE TABLE IF NOT EXISTS `aux_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `familia` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.cp
CREATE TABLE IF NOT EXISTS `cp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CP` double DEFAULT NULL,
  `Localidad` varchar(255) DEFAULT NULL,
  `Provincia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL COMMENT 'Nombre o referencia del documento',
  `tipo_id` int(11) NOT NULL COMMENT 'ID del tipo de documento',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de creacion del registro',
  `fecha_documento` date NOT NULL COMMENT 'fecha del documento',
  `usuario_id` int(11) unsigned NOT NULL COMMENT 'id del usuario que creó el registro',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL' COMMENT 'familia del sistema',
  PRIMARY KEY (`id`),
  KEY `FK_doc_tipo` (`tipo_id`),
  KEY `FK_doc_usuario` (`usuario_id`),
  CONSTRAINT `FK_doc_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `documentos_tipo` (`id`),
  CONSTRAINT `FK_doc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenan las referencias a los documentos del sistema';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.documentos_tipo
CREATE TABLE IF NOT EXISTS `documentos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='referencia de tipos de documentos del sistema';

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.localidades
CREATE TABLE IF NOT EXISTS `localidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provincia` int(11) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.log_accesos
CREATE TABLE IF NOT EXISTS `log_accesos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aplicacion` varchar(100) NOT NULL DEFAULT '',
  `usuario` varchar(100) NOT NULL DEFAULT '',
  `fecha` varchar(50) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.maestro_estado
CREATE TABLE IF NOT EXISTS `maestro_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL COMMENT 'Ejemplos: Activo, Inactivo, Baja',
  `tipo` varchar(255) DEFAULT NULL COMMENT 'Ejemplo: Paciente, Venta, Documento',
  `referencia` varchar(255) DEFAULT NULL COMMENT 'Notas al estado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8mb4 COMMENT='InnoDB free: 351232 kB';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.obra_social
CREATE TABLE IF NOT EXISTS `obra_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Obras Sociales';

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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
  `patologia_id` int(11) DEFAULT NULL COMMENT 'ID Patologia',
  `sub_patologia_id` int(11) DEFAULT NULL,
  `os_id` int(11) unsigned DEFAULT NULL COMMENT 'ID de la Obra Social',
  `notas` longtext,
  `usuario_id` int(11) unsigned NOT NULL,
  `c_gestar` varchar(2) DEFAULT NULL,
  `estado_id` int(11) DEFAULT '7' COMMENT 'ID de Estado',
  `sub_estado_id` int(11) DEFAULT '8' COMMENT 'ID de Sub Estado',
  `fecha_stamp` datetime DEFAULT NULL,
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
  CONSTRAINT `FK_estado_pac` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_os_pac` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`),
  CONSTRAINT `FK_pais_pac` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`ID`),
  CONSTRAINT `FK_patologia_pac` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`),
  CONSTRAINT `FK_sub_estado_paciente` FOREIGN KEY (`sub_estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_sub_patologia_pac` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`),
  CONSTRAINT `FK_usuario_pac` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de Pacientes';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `code` smallint(6) DEFAULT NULL,
  `iso3166a1` char(2) DEFAULT NULL,
  `iso3166a2` char(3) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.presentacion
CREATE TABLE IF NOT EXISTS `presentacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_np` varchar(255) NOT NULL DEFAULT '0',
  `familia` varchar(3) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.provincias
CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla de relacion de los documentos de los pacientes en el sistema';

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1 COMMENT='Tabla que vincula las paginas y los roles admitidos para esta';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estado_id` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `FK_rol_estado` (`estado_id`),
  CONSTRAINT `FK_rol_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.soliris_consultas
CREATE TABLE IF NOT EXISTS `soliris_consultas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(10) NOT NULL DEFAULT '',
  `consulta` longtext NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=12312 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.soliris_seguridad
CREATE TABLE IF NOT EXISTS `soliris_seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pagina` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla soliris.sub_patologia
CREATE TABLE IF NOT EXISTS `sub_patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_patologia_nombre` varchar(50) NOT NULL DEFAULT '',
  `familia` varchar(3) NOT NULL DEFAULT 'SOL',
  `usuario_audit` varchar(45) NOT NULL DEFAULT '',
  `fecha_audit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tablas de Sub Patoligias';

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista soliris.vw_lastsale_rm
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_lastsale_rm` (
	`pid` INT(10) UNSIGNED NULL,
	`nombre` VARCHAR(202) NULL COLLATE 'utf8mb4_general_ci',
	`fventa` VARCHAR(8) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

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

-- Volcando estructura para procedimiento soliris.ST_GET_ACCESS
DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_GET_ACCESS`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_GET_MAESTRO_ESTADO_ACTIVO`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_GET_PATOLOGIAS`()
    COMMENT 'Devuelve todas las patologias activas'
BEGIN

SELECT p.id, p.patologia_nombre FROM patologia p WHERE p.estado_id = (SELECT m.id FROM maestro_estado m WHERE m.referencia = 'patologia' AND m.valor = 'Activo');

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_GET_SUB_PATOLOGIA
DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_GET_SUB_PATOLOGIA`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_inact_medico`()
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_DOCS_PAC`(
	IN `v_id` INT
)
    COMMENT 'Lista los documentos del paciente'
BEGIN

SELECT d.valor AS documento, dt.tipo FROM rel_paciente_documentos rel 
INNER JOIN paciente p ON rel.paciente_id = p.id
INNER JOIN documentos d ON rel.documento_id = d.id
INNER JOIN documentos_tipo dt ON dt.id = d.tipo_id
WHERE dt.referencia = 'Paciente' and
p.id = v_id
LIMIT 0,1;

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
	  		  P.patologia_id AS patologia, 
	  		  P.sub_patologia_id AS subPatologia, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(p.id), '%d/%m/%Y')) as fecha_con,
		     P.mail AS email, 
	  		  P.telefono AS telefono, 
	  		  P.notas AS notas, 
	  		  (SELECT me.valor FROM maestro_estado me where p.estado_id = me.id) AS estado,
	  		  vRM.fventa AS uventa, 
	  		  (SELECT me.valor FROM maestro_estado me INNER JOIN paciente p ON p.sub_estado_id = me.id) AS sub_estado
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
	IN `v_sub_estado_id` VARCHAR(50),
	IN `v_crm_id` INT




)
    COMMENT 'Creacion del nuevo paciente'
BEGIN

DECLARE c_usuario_id INT;
DECLARE c_sub_estado INT;
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
		c_sub_estado, 
		NOW(), 
		'SOL', 
		v_crm_id
		);

SELECT LAST_INSERT_ID();


END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.st_reg_faltante
DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `st_reg_faltante`(IN `v_operacion` VARCHAR(50), IN `v_idoperacion` INT, IN `v_iddocumento` INT, IN `v_nombre` VARCHAR(255))
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
CREATE DEFINER=`admin`@`%` PROCEDURE `st_set_id_medico`()
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

DECLARE c_usuario_id INT;
DECLARE c_sub_estado INT;
DECLARE c_estado INT;
SET c_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'estado' AND valor = 'v_sub_estado');
SET c_sub_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'sub_estado' AND valor = 'v_sub_estado');

SET c_usuario_id = (SELECT u.id FROM usuario u WHERE v_usuario = u.username);

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
		notas=v_notas,
		usuario_id=c_usuario_id,
		c_gestar='',
		estado_id=c_estado,
		sub_estado_id=v_sub_estado_id,
		fecha_stamp=NOW(),
		familia='SOL',
		crm_id=v_crm_id
	WHERE 
	  id = v_id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento soliris.ST_UserAccess
DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_UserAccess`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_CLE_TAGS`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_GET_DOCUMENTS`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_GET_MED_NAME`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_GET_VENTA_MOD`(
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
	d.tipo_id = 1 -- ID del consentimiento informado de la tabla documentos_id
ORDER BY 
	r.id 
DESC LIMIT 0, 1); -- https://stackoverflow.com/questions/6881424/how-can-i-select-the-row-with-the-highest-id-in-mysql/20904650
				

				
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_VAL_FEC_REC`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_VAL_MED`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_VAL_PAC_EDAD`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `FU_VAL_UNI`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `GET_NOM_PAC`(
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
CREATE DEFINER=`admin`@`%` FUNCTION `get_paciente`(`v_id` INT) RETURNS longtext CHARSET latin1
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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_lastsale_rm` AS SELECT 
	RM.paciente_id as pid,
	(SELECT CONCAT(p.apellido, ' ,', p.nombre) FROM paciente p) AS nombre,
	date_format(RM.fecha_venta ,'%d/%m/%y') AS `fventa` 
FROM 
	soliris_maestro RM
where (`RM`.estado_venta_id <> 14) group by nombre order by `RM`.`id` desc ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
