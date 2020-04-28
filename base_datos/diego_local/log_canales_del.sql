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

-- Volcando estructura para disparador soliris.log_canales_del
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_canales_del AFTER
DELETE ON canales FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='id',tabla='canales',id_registro=old.id,valor_anterior=old.id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='canal',tabla='canales',id_registro=old.id,valor_anterior=old.canal;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='familia',tabla='canales',id_registro=old.id,valor_anterior=old.familia;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='direccion',tabla='canales',id_registro=old.id,valor_anterior=old.direccion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='mail',tabla='canales',id_registro=old.id,valor_anterior=old.mail;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='dir_tec',tabla='canales',id_registro=old.id,valor_anterior=old.dir_tec;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='cont_venta',tabla='canales',id_registro=old.id,valor_anterior=old.cont_venta;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='cont_otro',tabla='canales',id_registro=old.id,valor_anterior=old.cont_otro;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='puntos_entrega',tabla='canales',id_registro=old.id,valor_anterior=old.puntos_entrega;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='documentacion',tabla='canales',id_registro=old.id,valor_anterior=old.documentacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_audit',tabla='canales',id_registro=old.id,valor_anterior=old.usuario_audit;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_audit',tabla='canales',id_registro=old.id,valor_anterior=old.fecha_audit;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado',tabla='canales',id_registro=old.id,valor_anterior=old.estado;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado_id',tabla='canales',id_registro=old.id,valor_anterior=old.estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='convenio',tabla='canales',id_registro=old.id,valor_anterior=old.convenio; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
