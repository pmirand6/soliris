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

-- Volcando estructura para tabla soliris.especialidad
CREATE TABLE IF NOT EXISTS `especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(100) DEFAULT NULL,
  `familia` varchar(3) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `usuario_audit` varchar(45) DEFAULT NULL,
  `fecha_audit` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

-- Volcando datos para la tabla soliris.especialidad: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` (`id`, `especialidad`, `familia`, `estado_id`, `usuario_audit`, `fecha_audit`) VALUES
	(1, 'especialidad prueba', 'SOL', 29, 'pmiranda', '2020-04-27 08:15:48'),
	(2, 'especialidad pruebas', 'SOL', 29, 'pmiranda', '2020-04-27 08:15:51'),
	(3, 'Nefrología', 'SOL', 28, 'dcilveti', '2020-04-27 08:14:12'),
	(4, 'Neurología', 'SOL', 28, 'dcilveti', '2020-04-27 08:14:30'),
	(5, 'Nefrología Pediátrica', 'SOL', 28, 'dcilveti', '2020-04-27 08:14:53'),
	(6, 'Endocrinología', 'SOL', 28, 'dcilveti', '2020-04-27 08:15:21'),
	(7, 'Genetista', 'SOL', 28, 'dcilveti', '2020-04-27 08:15:39'),
	(8, 'Hematólogo', 'SOL', 28, 'dcilveti', '2020-04-27 08:16:11'),
	(9, 'Hepatólogo', 'SOL', 28, 'dcilveti', '2020-04-27 08:16:29'),
	(10, 'Nefrólogo Trasplantista', 'SOL', 28, 'dcilveti', '2020-04-27 08:17:03');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
