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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
