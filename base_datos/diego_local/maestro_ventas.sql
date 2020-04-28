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
  `fecha_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usuario_mod_id` int(10) unsigned NOT NULL,
  `fecha_mod` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_venta_canal` (`canal_id`),
  KEY `FK_venta_estado` (`estado_id`),
  KEY `FK_venta_institucion` (`institucion_id`),
  KEY `FK_venta_medico` (`medico_id`),
  KEY `FK_venta_paciente` (`paciente_id`),
  KEY `FK_venta_patologia` (`patologia_id`),
  KEY `FK_venta_presentacion` (`presentacion_id`),
  KEY `FK_venta_producto` (`producto_id`),
  KEY `FK_venta_sub_patologia` (`sub_patologia_id`),
  KEY `FK_venta_tipo` (`venta_tipo_id`),
  KEY `FK_venta_usuario` (`usuario_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192 COMMENT='Maestro de las ventas efectuadas al paciente';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
