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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
