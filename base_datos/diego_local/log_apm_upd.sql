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

-- Volcando estructura para disparador soliris.log_apm_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_apm_upd BEFORE
UPDATE ON apm FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='apm', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.codigo_apm_np<>new.codigo_apm_np THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='codigo_apm_np', tabla='apm', id_registro=old.id, valor_anterior=OLD.codigo_apm_np, valor_nuevo=NEW.codigo_apm_np; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='apm', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; if old.usuario_audit<>new.usuario_audit THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_audit', tabla='apm', id_registro=old.id, valor_anterior=OLD.usuario_audit, valor_nuevo=NEW.usuario_audit; END If; if old.fecha_audit<>new.fecha_audit THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_audit', tabla='apm', id_registro=old.id, valor_anterior=OLD.fecha_audit, valor_nuevo=NEW.fecha_audit; END If; if old.username<>new.username THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='username', tabla='apm', id_registro=old.id, valor_anterior=OLD.username, valor_nuevo=NEW.username; END If; if old.email<>new.email THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='email', tabla='apm', id_registro=old.id, valor_anterior=OLD.email, valor_nuevo=NEW.email; END If; if old.nombre_completo<>new.nombre_completo THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nombre_completo', tabla='apm', id_registro=old.id, valor_anterior=OLD.nombre_completo, valor_nuevo=NEW.nombre_completo; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
