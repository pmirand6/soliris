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

-- Volcando estructura para disparador soliris.log_documentos_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_documentos_upd BEFORE
UPDATE ON documentos FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='documentos', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.valor<>new.valor THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='valor', tabla='documentos', id_registro=old.id, valor_anterior=OLD.valor, valor_nuevo=NEW.valor; END If; if old.documentos_tipo_id<>new.documentos_tipo_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='documentos_tipo_id', tabla='documentos', id_registro=old.id, valor_anterior=OLD.documentos_tipo_id, valor_nuevo=NEW.documentos_tipo_id; END If; if old.fecha_creacion<>new.fecha_creacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_creacion', tabla='documentos', id_registro=old.id, valor_anterior=OLD.fecha_creacion, valor_nuevo=NEW.fecha_creacion; END If; if old.fecha_documento<>new.fecha_documento THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_documento', tabla='documentos', id_registro=old.id, valor_anterior=OLD.fecha_documento, valor_nuevo=NEW.fecha_documento; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='documentos', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; if old.usuario_id<>new.usuario_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_id', tabla='documentos', id_registro=old.id, valor_anterior=OLD.usuario_id, valor_nuevo=NEW.usuario_id; END If; if old.familia<>new.familia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='familia', tabla='documentos', id_registro=old.id, valor_anterior=OLD.familia, valor_nuevo=NEW.familia; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
