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

-- Volcando estructura para disparador soliris.log_maestro_ventas_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_maestro_ventas_upd BEFORE
UPDATE ON maestro_ventas FOR EACH ROW BEGIN
 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; if old.paciente_id<>new.paciente_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='paciente_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.paciente_id, valor_nuevo=NEW.paciente_id; END If; if old.edad<>new.edad THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='edad', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.edad, valor_nuevo=NEW.edad; END If; if old.presentacion_id<>new.presentacion_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='presentacion_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.presentacion_id, valor_nuevo=NEW.presentacion_id; END If; if old.venta_tipo_id<>new.venta_tipo_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='venta_tipo_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.venta_tipo_id, valor_nuevo=NEW.venta_tipo_id; END If; if old.medico_id<>new.medico_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='medico_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.medico_id, valor_nuevo=NEW.medico_id; END If; if old.producto_id<>new.producto_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='producto_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.producto_id, valor_nuevo=NEW.producto_id; END If; if old.unidades<>new.unidades THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='unidades', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.unidades, valor_nuevo=NEW.unidades; END If; if old.fecha_venta<>new.fecha_venta THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_venta', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.fecha_venta, valor_nuevo=NEW.fecha_venta; END If; if old.patologia_id<>new.patologia_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='patologia_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.patologia_id, valor_nuevo=NEW.patologia_id; END If; if old.sub_patologia_id<>new.sub_patologia_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='sub_patologia_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.sub_patologia_id, valor_nuevo=NEW.sub_patologia_id; END If; if old.institucion_id<>new.institucion_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='institucion_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.institucion_id, valor_nuevo=NEW.institucion_id; END If; if old.canal_id<>new.canal_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='canal_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.canal_id, valor_nuevo=NEW.canal_id; END If; if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If; if old.usuario_id<>new.usuario_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.usuario_id, valor_nuevo=NEW.usuario_id; END If; if old.cod_reasignacion<>new.cod_reasignacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='cod_reasignacion', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.cod_reasignacion, valor_nuevo=NEW.cod_reasignacion; END If; if old.crm_id<>new.crm_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='crm_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.crm_id, valor_nuevo=NEW.crm_id; END If; if old.nota<>new.nota THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nota', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.nota, valor_nuevo=NEW.nota; END If; if old.nbr<>new.nbr THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nbr', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.nbr, valor_nuevo=NEW.nbr; END If; if old.fecha_stamp<>new.fecha_stamp THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_stamp', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.fecha_stamp, valor_nuevo=NEW.fecha_stamp; END If; if old.usuario_mod_id<>new.usuario_mod_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_mod_id', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.usuario_mod_id, valor_nuevo=NEW.usuario_mod_id; END If; if old.fecha_mod<>new.fecha_mod THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_mod', tabla='maestro_ventas', id_registro=old.id, valor_anterior=OLD.fecha_mod, valor_nuevo=NEW.fecha_mod; END If; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
