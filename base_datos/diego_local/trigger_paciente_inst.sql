/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */; SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_paciente_inst BEFORE
INSERT ON paciente FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='id', tabla='paciente', id_registro=new.id, valor_nuevo=new.id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='apellido', tabla='paciente', id_registro=new.id, valor_nuevo=new.apellido;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='nombre', tabla='paciente', id_registro=new.id, valor_nuevo=new.nombre;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='nombre_completo', tabla='paciente', id_registro=new.id, valor_nuevo=new.nombre_completo;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_nac', tabla='paciente', id_registro=new.id, valor_nuevo=new.fecha_nac;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='sexo', tabla='paciente', id_registro=new.id, valor_nuevo=new.sexo;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='telefono', tabla='paciente', id_registro=new.id, valor_nuevo=new.telefono;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='ciudad', tabla='paciente', id_registro=new.id, valor_nuevo=new.ciudad;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='pais_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.pais_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='mail', tabla='paciente', id_registro=new.id, valor_nuevo=new.mail;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='patologia_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.patologia_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='sub_patologia_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.sub_patologia_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='os_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.os_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='notas', tabla='paciente', id_registro=new.id, valor_nuevo=new.notas;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='usuario_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.usuario_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='c_gestar', tabla='paciente', id_registro=new.id, valor_nuevo=new.c_gestar;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='estado_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.estado_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='sub_estado_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.sub_estado_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_creacion', tabla='paciente', id_registro=new.id, valor_nuevo=new.fecha_creacion;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='familia', tabla='paciente', id_registro=new.id, valor_nuevo=new.familia;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_modificacion', tabla='paciente', id_registro=new.id, valor_nuevo=new.fecha_modificacion;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='usuario_mod_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.usuario_mod_id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='crm_id', tabla='paciente', id_registro=new.id, valor_nuevo=new.crm_id; END//
DELIMITER ; SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

