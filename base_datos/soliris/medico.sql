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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
