/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */; SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_paciente_del AFTER
DELETE ON paciente FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='id',tabla='paciente',id_registro=old.id,valor_anterior=old.id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='apellido',tabla='paciente',id_registro=old.id,valor_anterior=old.apellido;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nombre',tabla='paciente',id_registro=old.id,valor_anterior=old.nombre;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nombre_completo',tabla='paciente',id_registro=old.id,valor_anterior=old.nombre_completo;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_nac',tabla='paciente',id_registro=old.id,valor_anterior=old.fecha_nac;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='sexo',tabla='paciente',id_registro=old.id,valor_anterior=old.sexo;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='telefono',tabla='paciente',id_registro=old.id,valor_anterior=old.telefono;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='ciudad',tabla='paciente',id_registro=old.id,valor_anterior=old.ciudad;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='pais_id',tabla='paciente',id_registro=old.id,valor_anterior=old.pais_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='mail',tabla='paciente',id_registro=old.id,valor_anterior=old.mail;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='patologia_id',tabla='paciente',id_registro=old.id,valor_anterior=old.patologia_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='sub_patologia_id',tabla='paciente',id_registro=old.id,valor_anterior=old.sub_patologia_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='os_id',tabla='paciente',id_registro=old.id,valor_anterior=old.os_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='notas',tabla='paciente',id_registro=old.id,valor_anterior=old.notas;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_id',tabla='paciente',id_registro=old.id,valor_anterior=old.usuario_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='c_gestar',tabla='paciente',id_registro=old.id,valor_anterior=old.c_gestar;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado_id',tabla='paciente',id_registro=old.id,valor_anterior=old.estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='sub_estado_id',tabla='paciente',id_registro=old.id,valor_anterior=old.sub_estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_creacion',tabla='paciente',id_registro=old.id,valor_anterior=old.fecha_creacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='familia',tabla='paciente',id_registro=old.id,valor_anterior=old.familia;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_modificacion',tabla='paciente',id_registro=old.id,valor_anterior=old.fecha_modificacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_mod_id',tabla='paciente',id_registro=old.id,valor_anterior=old.usuario_mod_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='crm_id',tabla='paciente',id_registro=old.id,valor_anterior=old.crm_id; END//
DELIMITER ; SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

