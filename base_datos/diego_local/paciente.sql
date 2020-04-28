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
  KEY `FK_sub_estado_pac` (`sub_patologia_id`),
  KEY `FK_estado_pac` (`estado_id`),
  KEY `FK_os_pac` (`os_id`),
  KEY `FK_pais_pac` (`pais_id`),
  KEY `FK_patologia_pac` (`patologia_id`),
  KEY `FK_sub_estado_paciente` (`sub_estado_id`),
  KEY `FK_usuario_mod_pac` (`usuario_mod_id`),
  KEY `FK_usuario_pac` (`usuario_id`),
  CONSTRAINT `FK_estado_pac` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_os_pac` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`),
  CONSTRAINT `FK_pais_pac` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`ID`),
  CONSTRAINT `FK_patologia_pac` FOREIGN KEY (`patologia_id`) REFERENCES `patologia` (`id`),
  CONSTRAINT `FK_sub_estado_paciente` FOREIGN KEY (`sub_estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_sub_patologia_pac` FOREIGN KEY (`sub_patologia_id`) REFERENCES `sub_patologia` (`id`),
  CONSTRAINT `FK_usuario_mod_pac` FOREIGN KEY (`usuario_mod_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_usuario_pac` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=8192 COMMENT='Tabla de Pacientes';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
