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

-- Volcando estructura para disparador soliris.log_medico_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_medico_upd BEFORE
UPDATE ON medico FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='medico', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.apellido<>new.apellido THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='apellido', tabla='medico', id_registro=old.id, valor_anterior=OLD.apellido, valor_nuevo=NEW.apellido; END If; if old.nombre<>new.nombre THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nombre', tabla='medico', id_registro=old.id, valor_anterior=OLD.nombre, valor_nuevo=NEW.nombre; END If; if old.matricula_tipo_id<>new.matricula_tipo_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='matricula_tipo_id', tabla='medico', id_registro=old.id, valor_anterior=OLD.matricula_tipo_id, valor_nuevo=NEW.matricula_tipo_id; END If; if old.matricula_numero<>new.matricula_numero THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='matricula_numero', tabla='medico', id_registro=old.id, valor_anterior=OLD.matricula_numero, valor_nuevo=NEW.matricula_numero; END If; if old.fecha_alta<>new.fecha_alta THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_alta', tabla='medico', id_registro=old.id, valor_anterior=OLD.fecha_alta, valor_nuevo=NEW.fecha_alta; END If; if old.apm_id<>new.apm_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='apm_id', tabla='medico', id_registro=old.id, valor_anterior=OLD.apm_id, valor_nuevo=NEW.apm_id; END If; if old.c_atencion<>new.c_atencion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='c_atencion', tabla='medico', id_registro=old.id, valor_anterior=OLD.c_atencion, valor_nuevo=NEW.c_atencion; END If; if old.lugar<>new.lugar THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='lugar', tabla='medico', id_registro=old.id, valor_anterior=OLD.lugar, valor_nuevo=NEW.lugar; END If; if old.mail<>new.mail THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='mail', tabla='medico', id_registro=old.id, valor_anterior=OLD.mail, valor_nuevo=NEW.mail; END If; if old.telefono<>new.telefono THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='telefono', tabla='medico', id_registro=old.id, valor_anterior=OLD.telefono, valor_nuevo=NEW.telefono; END If; if old.fax<>new.fax THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fax', tabla='medico', id_registro=old.id, valor_anterior=OLD.fax, valor_nuevo=NEW.fax; END If; if old.nacimiento<>new.nacimiento THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nacimiento', tabla='medico', id_registro=old.id, valor_anterior=OLD.nacimiento, valor_nuevo=NEW.nacimiento; END If; if old.domicilio<>new.domicilio THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='domicilio', tabla='medico', id_registro=old.id, valor_anterior=OLD.domicilio, valor_nuevo=NEW.domicilio; END If; if old.fecha_cap<>new.fecha_cap THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_cap', tabla='medico', id_registro=old.id, valor_anterior=OLD.fecha_cap, valor_nuevo=NEW.fecha_cap; END If; if old.localidad<>new.localidad THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='localidad', tabla='medico', id_registro=old.id, valor_anterior=OLD.localidad, valor_nuevo=NEW.localidad; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='medico', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; if old.fecha_aprobado<>new.fecha_aprobado THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_aprobado', tabla='medico', id_registro=old.id, valor_anterior=OLD.fecha_aprobado, valor_nuevo=NEW.fecha_aprobado; END If; if old.fecha_inac<>new.fecha_inac THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_inac', tabla='medico', id_registro=old.id, valor_anterior=OLD.fecha_inac, valor_nuevo=NEW.fecha_inac; END If; if old.fecha_creacion<>new.fecha_creacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_creacion', tabla='medico', id_registro=old.id, valor_anterior=OLD.fecha_creacion, valor_nuevo=NEW.fecha_creacion; END If; if old.fecha_modificacion<>new.fecha_modificacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_modificacion', tabla='medico', id_registro=old.id, valor_anterior=OLD.fecha_modificacion, valor_nuevo=NEW.fecha_modificacion; END If; if old.familia<>new.familia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='familia', tabla='medico', id_registro=old.id, valor_anterior=OLD.familia, valor_nuevo=NEW.familia; END If; if old.usuario_creador<>new.usuario_creador THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_creador', tabla='medico', id_registro=old.id, valor_anterior=OLD.usuario_creador, valor_nuevo=NEW.usuario_creador; END If; if old.usuario_mod<>new.usuario_mod THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_mod', tabla='medico', id_registro=old.id, valor_anterior=OLD.usuario_mod, valor_nuevo=NEW.usuario_mod; END If; if old.notas_mod<>new.notas_mod THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='notas_mod', tabla='medico', id_registro=old.id, valor_anterior=OLD.notas_mod, valor_nuevo=NEW.notas_mod; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
