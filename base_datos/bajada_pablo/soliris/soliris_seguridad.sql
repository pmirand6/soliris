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

-- Volcando estructura para tabla soliris.soliris_seguridad
CREATE TABLE IF NOT EXISTS `soliris_seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pagina` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=277;

-- Volcando datos para la tabla soliris.soliris_seguridad: ~62 rows (aproximadamente)
/*!40000 ALTER TABLE `soliris_seguridad` DISABLE KEYS */;
INSERT INTO `soliris_seguridad` (`id`, `pagina`, `descripcion`) VALUES
	(70, 'pacientes.php', 'Listado de Pacientes'),
	(71, 'canal.php', 'ABM Canal'),
	(72, 'canales.php', 'Listado de Canales'),
	(73, 'docs_hist_medico.php', 'ABM Documentación Cap Medicos'),
	(74, 'docs_medico.php', 'ABM Documentación Medicos'),
	(75, 'docs_pacientes.php', 'ABM Documentación Paciente'),
	(76, 'institucion.php', 'ABM Institución'),
	(77, 'instituciones.php', 'Listado de Instituciones'),
	(78, 'medico.php', 'ABM Medico'),
	(79, 'medicos.php', 'Listado de Medicos'),
	(80, 'seguridad.php', 'Listado y ABM de Seguridad'),
	(81, 'usuario.php', 'ABM Usuarios'),
	(82, 'usuarios.php', 'Listado de Usuarios'),
	(83, 'paciente.php', 'ABM Paciente'),
	(84, 'dosis.php', 'Listado de Dosis'),
	(85, 'a_dosis.php', 'ABM Dosis'),
	(86, 'adm_regs.php', 'Administrador de Registros'),
	(87, 'adm_regs_edit.php', 'Administrador de Registros - Editor de Registros'),
	(88, 'adm_regs_docsedit.php', 'Administrador de Registros - Editor de Documentos'),
	(89, 'log.php', 'Visor de Log'),
	(90, 'reporte_ventas_apm.php', 'Reportes - Ventas por APM'),
	(91, 'reporte_ventas_paciente.php', 'Reporte de Ventas a Pacientes'),
	(92, 'reporte_docs_paciente.php', 'Reporte de Ventas (Documentación)'),
	(93, 'reporte_ventas.php', 'Reporte de Ventas por periodo'),
	(94, 'reporte_anmat.php', 'Reporte Semestral de ANMAT'),
	(95, 'reporte_ventas_convenios.php', 'Reporte de Ventas por Convenios'),
	(96, 'reportes_panel.php', 'Reporte Panel General'),
	(97, 'reporte_grilla.php', 'Reporte Grilla'),
	(98, 'reporte_filtros.php', 'Reporte por Filtros'),
	(99, 'reporte_panel.php', 'Reporte Panel'),
	(100, 'docs_paciente.php', 'Documentación del Paciente'),
	(101, 'patologias.php', 'Listado de Patologías'),
	(102, 'patologia.php', 'ABM Patologías'),
	(103, 'listado.php', 'Listado de Historial de Ventas'),
	(104, 'listado_details.php', 'Detalle del Historial de Ventas'),
	(105, 'panel.php', 'Principal'),
	(106, 'panel_mod.php', 'Administrador de Registros FV'),
	(107, 'informes.php', 'Alta de Venta'),
	(108, 'docs_nueva_venta.php', 'Docs Nueva Venta'),
	(109, 'apms.php', 'Listado de APMs'),
	(110, 'apm.php', 'ABM de APMs'),
	(111, 'especialidades.php', 'Listado de Especialidades'),
	(112, 'a_esp.php', 'ABM de Especialidades'),
	(113, 'docs_canales.php', 'Documentación de los Canales'),
	(114, 'reporte_productos.php', 'Reporte por dosis'),
	(115, 'unidades.php', 'Listado de Unidades'),
	(116, 'a_unidad.php', 'ABM de Unidad'),
	(117, 'adm_reasignar.php', 'Reasignación de Venta'),
	(118, 'reasignar.php', 'Listado de Ventas con posible reasignación'),
	(119, 'reasignados.php', 'Listado de Venta para vincular'),
	(120, 'reporte_reasignaciones.php', 'Reporte de Reasignaciones'),
	(121, 'prueba.php', 'prueba'),
	(122, 'prueba2.php', ''),
	(123, 'docs_hist_paciente.php', 'Historico Documentacion Paciente'),
	(124, 'diff_med.php', 'Diferencias de Medicos Meditec'),
	(125, 'nueva_venta.php', 'Nueva Venta'),
	(126, 'generar_venta.php', 'Generación de Venta'),
	(127, 'modificar_venta.php', 'Modificación de Venta'),
	(128, 'historial_ventas.php', 'Historial de Ventas'),
	(129, 'form_vista_venta.php', 'Form de la vista de modificar venta'),
	(130, 'form_modificar_venta.php', 'Vista de modificacion de la venta'),
	(131, 'clientes.php', 'Pagina de Clientes');
/*!40000 ALTER TABLE `soliris_seguridad` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
