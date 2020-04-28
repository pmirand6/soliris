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

-- Volcando estructura para disparador soliris.log_institucion_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_institucion_upd BEFORE
UPDATE ON institucion FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='institucion', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.nombre<>new.nombre THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nombre', tabla='institucion', id_registro=old.id, valor_anterior=OLD.nombre, valor_nuevo=NEW.nombre; END If; if old.direccion<>new.direccion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='direccion', tabla='institucion', id_registro=old.id, valor_anterior=OLD.direccion, valor_nuevo=NEW.direccion; END If; if old.altura<>new.altura THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='altura', tabla='institucion', id_registro=old.id, valor_anterior=OLD.altura, valor_nuevo=NEW.altura; END If; if old.localidad<>new.localidad THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='localidad', tabla='institucion', id_registro=old.id, valor_anterior=OLD.localidad, valor_nuevo=NEW.localidad; END If; if old.provincia<>new.provincia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='provincia', tabla='institucion', id_registro=old.id, valor_anterior=OLD.provincia, valor_nuevo=NEW.provincia; END If; if old.contacto<>new.contacto THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='contacto', tabla='institucion', id_registro=old.id, valor_anterior=OLD.contacto, valor_nuevo=NEW.contacto; END If; if old.mail<>new.mail THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='mail', tabla='institucion', id_registro=old.id, valor_anterior=OLD.mail, valor_nuevo=NEW.mail; END If; if old.telefono<>new.telefono THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='telefono', tabla='institucion', id_registro=old.id, valor_anterior=OLD.telefono, valor_nuevo=NEW.telefono; END If; if old.notas<>new.notas THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='notas', tabla='institucion', id_registro=old.id, valor_anterior=OLD.notas, valor_nuevo=NEW.notas; END If; if old.tipo<>new.tipo THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='tipo', tabla='institucion', id_registro=old.id, valor_anterior=OLD.tipo, valor_nuevo=NEW.tipo; END If; if old.familia<>new.familia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='familia', tabla='institucion', id_registro=old.id, valor_anterior=OLD.familia, valor_nuevo=NEW.familia; END If; if old.usuario_audit<>new.usuario_audit THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_audit', tabla='institucion', id_registro=old.id, valor_anterior=OLD.usuario_audit, valor_nuevo=NEW.usuario_audit; END If; if old.fecha_audit<>new.fecha_audit THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_audit', tabla='institucion', id_registro=old.id, valor_anterior=OLD.fecha_audit, valor_nuevo=NEW.fecha_audit; END If; if old.reporte<>new.reporte THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='reporte', tabla='institucion', id_registro=old.id, valor_anterior=OLD.reporte, valor_nuevo=NEW.reporte; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='institucion', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
