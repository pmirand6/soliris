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

-- Volcando estructura para disparador soliris.log_medico_del
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_medico_del AFTER
DELETE ON medico FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='id',tabla='medico',id_registro=old.id,valor_anterior=old.id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='apellido',tabla='medico',id_registro=old.id,valor_anterior=old.apellido;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nombre',tabla='medico',id_registro=old.id,valor_anterior=old.nombre;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='matricula_tipo_id',tabla='medico',id_registro=old.id,valor_anterior=old.matricula_tipo_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='matricula_numero',tabla='medico',id_registro=old.id,valor_anterior=old.matricula_numero;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_alta',tabla='medico',id_registro=old.id,valor_anterior=old.fecha_alta;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='apm_id',tabla='medico',id_registro=old.id,valor_anterior=old.apm_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='c_atencion',tabla='medico',id_registro=old.id,valor_anterior=old.c_atencion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='lugar',tabla='medico',id_registro=old.id,valor_anterior=old.lugar;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='mail',tabla='medico',id_registro=old.id,valor_anterior=old.mail;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='telefono',tabla='medico',id_registro=old.id,valor_anterior=old.telefono;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fax',tabla='medico',id_registro=old.id,valor_anterior=old.fax;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nacimiento',tabla='medico',id_registro=old.id,valor_anterior=old.nacimiento;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='domicilio',tabla='medico',id_registro=old.id,valor_anterior=old.domicilio;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_cap',tabla='medico',id_registro=old.id,valor_anterior=old.fecha_cap;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='localidad',tabla='medico',id_registro=old.id,valor_anterior=old.localidad;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado_id',tabla='medico',id_registro=old.id,valor_anterior=old.estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_aprobado',tabla='medico',id_registro=old.id,valor_anterior=old.fecha_aprobado;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_inac',tabla='medico',id_registro=old.id,valor_anterior=old.fecha_inac;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_creacion',tabla='medico',id_registro=old.id,valor_anterior=old.fecha_creacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_modificacion',tabla='medico',id_registro=old.id,valor_anterior=old.fecha_modificacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='familia',tabla='medico',id_registro=old.id,valor_anterior=old.familia;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_creador',tabla='medico',id_registro=old.id,valor_anterior=old.usuario_creador;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_mod',tabla='medico',id_registro=old.id,valor_anterior=old.usuario_mod;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='notas_mod',tabla='medico',id_registro=old.id,valor_anterior=old.notas_mod; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
