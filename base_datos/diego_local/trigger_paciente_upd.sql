/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */; SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_paciente_upd BEFORE
UPDATE ON paciente FOR EACH ROW BEGIN
	 if old.id<>new.id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.id, valor_nuevo=NEW.id; END If; 
	if old.apellido<>new.apellido THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='apellido', tabla='paciente', id_registro=old.id, valor_anterior=OLD.apellido, valor_nuevo=NEW.apellido; END If;
	if old.nombre<>new.nombre THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nombre', tabla='paciente', id_registro=old.id, valor_anterior=OLD.nombre, valor_nuevo=NEW.nombre; END If;
	if old.nombre_completo<>new.nombre_completo THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='nombre_completo', tabla='paciente', id_registro=old.id, valor_anterior=OLD.nombre_completo, valor_nuevo=NEW.nombre_completo; END If;
	if old.fecha_nac<>new.fecha_nac THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_nac', tabla='paciente', id_registro=old.id, valor_anterior=OLD.fecha_nac, valor_nuevo=NEW.fecha_nac; END If;
	if old.sexo<>new.sexo THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='sexo', tabla='paciente', id_registro=old.id, valor_anterior=OLD.sexo, valor_nuevo=NEW.sexo; END If;
	if old.telefono<>new.telefono THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='telefono', tabla='paciente', id_registro=old.id, valor_anterior=OLD.telefono, valor_nuevo=NEW.telefono; END If;
	if old.ciudad<>new.ciudad THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='ciudad', tabla='paciente', id_registro=old.id, valor_anterior=OLD.ciudad, valor_nuevo=NEW.ciudad; END If;
	if old.pais_id<>new.pais_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='pais_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.pais_id, valor_nuevo=NEW.pais_id; END If;
	if old.mail<>new.mail THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='mail', tabla='paciente', id_registro=old.id, valor_anterior=OLD.mail, valor_nuevo=NEW.mail; END If;
	if old.patologia_id<>new.patologia_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='patologia_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.patologia_id, valor_nuevo=NEW.patologia_id; END If;
	if old.sub_patologia_id<>new.sub_patologia_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='sub_patologia_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.sub_patologia_id, valor_nuevo=NEW.sub_patologia_id; END If;
	if old.os_id<>new.os_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='os_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.os_id, valor_nuevo=NEW.os_id; END If;
	if old.notas<>new.notas THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='notas', tabla='paciente', id_registro=old.id, valor_anterior=OLD.notas, valor_nuevo=NEW.notas; END If;
	if old.usuario_id<>new.usuario_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.usuario_id, valor_nuevo=NEW.usuario_id; END If;
	if old.c_gestar<>new.c_gestar THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='c_gestar', tabla='paciente', id_registro=old.id, valor_anterior=OLD.c_gestar, valor_nuevo=NEW.c_gestar; END If;
	if old.estado_id<>new.estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='estado_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.estado_id, valor_nuevo=NEW.estado_id; END If;
	if old.sub_estado_id<>new.sub_estado_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='sub_estado_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.sub_estado_id, valor_nuevo=NEW.sub_estado_id; END If;
	if old.fecha_creacion<>new.fecha_creacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_creacion', tabla='paciente', id_registro=old.id, valor_anterior=OLD.fecha_creacion, valor_nuevo=NEW.fecha_creacion; END If;
	if old.familia<>new.familia THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='familia', tabla='paciente', id_registro=old.id, valor_anterior=OLD.familia, valor_nuevo=NEW.familia; END If;
	if old.fecha_modificacion<>new.fecha_modificacion THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='fecha_modificacion', tabla='paciente', id_registro=old.id, valor_anterior=OLD.fecha_modificacion, valor_nuevo=NEW.fecha_modificacion; END If;
	if old.usuario_mod_id<>new.usuario_mod_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='usuario_mod_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.usuario_mod_id, valor_nuevo=NEW.usuario_mod_id; END If;
	if old.crm_id<>new.crm_id THEN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='update', registro='crm_id', tabla='paciente', id_registro=old.id, valor_anterior=OLD.crm_id, valor_nuevo=NEW.crm_id; END If; END//
DELIMITER ; SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

