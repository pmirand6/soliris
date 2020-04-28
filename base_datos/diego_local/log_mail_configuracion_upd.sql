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

-- Volcando estructura para disparador soliris.log_mail_configuracion_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_mail_configuracion_upd BEFORE
UPDATE ON mail_configuracion FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='mail_configuracion', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.descripcion<>new.descripcion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='descripcion', tabla='mail_configuracion', id_registro=old.id, valor_anterior=OLD.descripcion, valor_nuevo=NEW.descripcion; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='mail_configuracion', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; if old.familia<>new.familia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='familia', tabla='mail_configuracion', id_registro=old.id, valor_anterior=OLD.familia, valor_nuevo=NEW.familia; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
