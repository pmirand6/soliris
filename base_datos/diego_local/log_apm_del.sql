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

-- Volcando estructura para disparador soliris.log_apm_del
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_apm_del AFTER
DELETE ON apm FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='id',tabla='apm',id_registro=old.id,valor_anterior=old.id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='codigo_apm_np',tabla='apm',id_registro=old.id,valor_anterior=old.codigo_apm_np;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado_id',tabla='apm',id_registro=old.id,valor_anterior=old.estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_audit',tabla='apm',id_registro=old.id,valor_anterior=old.usuario_audit;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_audit',tabla='apm',id_registro=old.id,valor_anterior=old.fecha_audit;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='username',tabla='apm',id_registro=old.id,valor_anterior=old.username;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='email',tabla='apm',id_registro=old.id,valor_anterior=old.email;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nombre_completo',tabla='apm',id_registro=old.id,valor_anterior=old.nombre_completo; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
