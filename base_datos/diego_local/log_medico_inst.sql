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

-- Volcando estructura para disparador soliris.log_medico_inst
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_medico_inst BEFORE
INSERT ON medico FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='id', tabla='medico', id_registro=new.id, valor_nuevo=new.id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='apellido', tabla='medico', id_registro=new.id, valor_nuevo=new.apellido;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='nombre', tabla='medico', id_registro=new.id, valor_nuevo=new.nombre;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='matricula_tipo_id', tabla='medico', id_registro=new.id, valor_nuevo=new.matricula_tipo_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='matricula_numero', tabla='medico', id_registro=new.id, valor_nuevo=new.matricula_numero;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_alta', tabla='medico', id_registro=new.id, valor_nuevo=new.fecha_alta;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='apm_id', tabla='medico', id_registro=new.id, valor_nuevo=new.apm_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='c_atencion', tabla='medico', id_registro=new.id, valor_nuevo=new.c_atencion;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='lugar', tabla='medico', id_registro=new.id, valor_nuevo=new.lugar;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='mail', tabla='medico', id_registro=new.id, valor_nuevo=new.mail;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='telefono', tabla='medico', id_registro=new.id, valor_nuevo=new.telefono;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fax', tabla='medico', id_registro=new.id, valor_nuevo=new.fax;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='nacimiento', tabla='medico', id_registro=new.id, valor_nuevo=new.nacimiento;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='domicilio', tabla='medico', id_registro=new.id, valor_nuevo=new.domicilio;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_cap', tabla='medico', id_registro=new.id, valor_nuevo=new.fecha_cap;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='localidad', tabla='medico', id_registro=new.id, valor_nuevo=new.localidad;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='estado_id', tabla='medico', id_registro=new.id, valor_nuevo=new.estado_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_aprobado', tabla='medico', id_registro=new.id, valor_nuevo=new.fecha_aprobado;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_inac', tabla='medico', id_registro=new.id, valor_nuevo=new.fecha_inac;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_creacion', tabla='medico', id_registro=new.id, valor_nuevo=new.fecha_creacion;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_modificacion', tabla='medico', id_registro=new.id, valor_nuevo=new.fecha_modificacion;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='familia', tabla='medico', id_registro=new.id, valor_nuevo=new.familia;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='usuario_creador', tabla='medico', id_registro=new.id, valor_nuevo=new.usuario_creador;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='usuario_mod', tabla='medico', id_registro=new.id, valor_nuevo=new.usuario_mod;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='notas_mod', tabla='medico', id_registro=new.id, valor_nuevo=new.notas_mod; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
