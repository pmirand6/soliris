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

-- Volcando estructura para disparador soliris.log_canales_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_canales_upd BEFORE
UPDATE ON canales FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='canales', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.canal<>new.canal THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='canal', tabla='canales', id_registro=old.id, valor_anterior=OLD.canal, valor_nuevo=NEW.canal; END If; if old.familia<>new.familia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='familia', tabla='canales', id_registro=old.id, valor_anterior=OLD.familia, valor_nuevo=NEW.familia; END If; if old.direccion<>new.direccion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='direccion', tabla='canales', id_registro=old.id, valor_anterior=OLD.direccion, valor_nuevo=NEW.direccion; END If; if old.mail<>new.mail THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='mail', tabla='canales', id_registro=old.id, valor_anterior=OLD.mail, valor_nuevo=NEW.mail; END If; if old.dir_tec<>new.dir_tec THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='dir_tec', tabla='canales', id_registro=old.id, valor_anterior=OLD.dir_tec, valor_nuevo=NEW.dir_tec; END If; if old.cont_venta<>new.cont_venta THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='cont_venta', tabla='canales', id_registro=old.id, valor_anterior=OLD.cont_venta, valor_nuevo=NEW.cont_venta; END If; if old.cont_otro<>new.cont_otro THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='cont_otro', tabla='canales', id_registro=old.id, valor_anterior=OLD.cont_otro, valor_nuevo=NEW.cont_otro; END If; if old.puntos_entrega<>new.puntos_entrega THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='puntos_entrega', tabla='canales', id_registro=old.id, valor_anterior=OLD.puntos_entrega, valor_nuevo=NEW.puntos_entrega; END If; if old.documentacion<>new.documentacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='documentacion', tabla='canales', id_registro=old.id, valor_anterior=OLD.documentacion, valor_nuevo=NEW.documentacion; END If; if old.usuario_audit<>new.usuario_audit THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_audit', tabla='canales', id_registro=old.id, valor_anterior=OLD.usuario_audit, valor_nuevo=NEW.usuario_audit; END If; if old.fecha_audit<>new.fecha_audit THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_audit', tabla='canales', id_registro=old.id, valor_anterior=OLD.fecha_audit, valor_nuevo=NEW.fecha_audit; END If; if old.estado<>new.estado THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado', tabla='canales', id_registro=old.id, valor_anterior=OLD.estado, valor_nuevo=NEW.estado; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='canales', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; if old.convenio<>new.convenio THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='convenio', tabla='canales', id_registro=old.id, valor_anterior=OLD.convenio, valor_nuevo=NEW.convenio; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
