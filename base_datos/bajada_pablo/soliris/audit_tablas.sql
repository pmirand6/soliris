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

-- Volcando estructura para tabla soliris.audit_tablas
CREATE TABLE IF NOT EXISTS `audit_tablas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tbl` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='Tablas que se auditarán';

-- Volcando datos para la tabla soliris.audit_tablas: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `audit_tablas` DISABLE KEYS */;
INSERT INTO `audit_tablas` (`id`, `tbl`, `descripcion`) VALUES
	(1, 'paciente', 'Mantenimiento de Pacientes'),
	(2, 'maestro_ventas', 'Operaciones de venta'),
	(3, 'apm', 'Mantenimiento de APM'),
	(4, 'canales', 'Mantenimiento de Canales de venta'),
	(5, 'configuracion', 'Configuración del sistema'),
	(6, 'especialidades', 'Mantenimiento de Especialidades'),
	(7, 'documentos', 'Cambios en la relación de documentos'),
	(8, 'institucion', 'Mantenimiento en las instituciones'),
	(9, 'maestro_estado', 'Configuración de estados del sistema'),
	(10, 'mail_configuracion', 'Parametros de notificación por mail'),
	(11, 'medico', 'Mantenimiento de Médicos'),
	(12, 'patologia', 'Mantenimiento de Patologías'),
	(13, 'rel_medico_especialidad', 'Relaciones Médico-Especialidad'),
	(14, 'rel_paciente_documentos', 'Relaciones Paciente-Documentos'),
	(15, 'rel_patologia_sub_patologia', 'Relaciones entre Patologías y Sub-Patologías'),
	(16, 'rel_seguridad_rol', 'Relaciones de seguridad'),
	(17, 'rel_venta_documentos', 'Relaciones de Venta-Documentación'),
	(18, 'usuario', 'Mantenimiento de Usuario');
/*!40000 ALTER TABLE `audit_tablas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
