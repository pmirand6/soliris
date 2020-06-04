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

-- Volcando estructura para tabla soliris.maestro_estado
CREATE TABLE IF NOT EXISTS `maestro_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL COMMENT 'Ejemplos: Activo, Inactivo, Baja',
  `tipo` varchar(255) DEFAULT NULL COMMENT 'Ejemplo: Paciente, Venta, Documento',
  `referencia` varchar(255) DEFAULT NULL COMMENT 'Notas al estado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=546;

-- Volcando datos para la tabla soliris.maestro_estado: ~33 rows (aproximadamente)
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
	(13, 'Rechazado', 'estado', 'paciente'),
	(14, 'Eliminado', 'estado', 'venta'),
	(15, 'Activo', 'estado', 'documento'),
	(16, 'Inactivo', 'estado', 'documento'),
	(17, 'Activo', 'estado', 'apm'),
	(18, 'Inactivo', 'estado', 'apm'),
	(19, 'Activo', 'estado', 'medico'),
	(20, 'Inactivo', 'estado', 'medico'),
	(21, 'Activo', 'estado', 'producto'),
	(22, 'Venta Registrada', 'estado', 'venta'),
	(23, 'NP Generada', 'estado', 'venta'),
	(24, 'Activo', 'estado', 'canales'),
	(25, 'Inactivo', 'estado', 'canales'),
	(26, 'Activo', 'estado', 'institucion'),
	(27, 'Inactivo', 'estado', 'institucion'),
	(28, 'Activo', 'estado', 'especialidad'),
	(29, 'Inactivo', 'estado', 'especialidad'),
	(30, 'Sin Capacitacion', 'estado', 'medico'),
	(31, 'Sin Documentacion', 'estado', 'paciente'),
	(32, 'Activo', 'estado', 'rel_seguridad_rol'),
	(33, 'Inactivo', 'estado', 'rel_seguridad_rol');
/*!40000 ALTER TABLE `maestro_estado` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
