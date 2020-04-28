-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.11-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla soliris.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `matricula_tipo_id` int(11) NOT NULL,
  `matricula_numero` varchar(45) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT '0000-00-00 00:00:00',
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
  `fecha_aprobado` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_inac` datetime DEFAULT '0000-00-00 00:00:00',
  `fecha_creacion` datetime DEFAULT '0000-00-00 00:00:00',
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00',
  `familia` varchar(4) NOT NULL DEFAULT 'SOL' COMMENT 'familia de medicamento',
  `usuario_creador` int(11) unsigned NOT NULL,
  `usuario_mod` int(11) unsigned NOT NULL,
  `notas_mod` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apellido_nombre_matricula_tipo_id_matricula_numero` (`apellido`,`nombre`,`matricula_tipo_id`,`matricula_numero`),
  KEY `FK_apm_medico` (`apm_id`),
  KEY `FK_estado_medico` (`estado_id`),
  KEY `FK_medico_matricula` (`matricula_tipo_id`),
  KEY `FK_medico_usuario_creador` (`usuario_creador`),
  KEY `FK_medico_usuario_mod` (`usuario_mod`),
  CONSTRAINT `FK_apm_medico` FOREIGN KEY (`apm_id`) REFERENCES `apm` (`id`),
  CONSTRAINT `FK_estado_medico` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_medico_matricula` FOREIGN KEY (`matricula_tipo_id`) REFERENCES `medico_matricula` (`id`),
  CONSTRAINT `FK_medico_usuario_creador` FOREIGN KEY (`usuario_creador`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_medico_usuario_mod` FOREIGN KEY (`usuario_mod`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=16384;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
