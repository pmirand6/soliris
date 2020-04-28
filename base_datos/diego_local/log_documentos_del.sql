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

-- Volcando estructura para disparador soliris.log_documentos_del
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_documentos_del AFTER
DELETE ON documentos FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='id',tabla='documentos',id_registro=old.id,valor_anterior=old.id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='valor',tabla='documentos',id_registro=old.id,valor_anterior=old.valor;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='documentos_tipo_id',tabla='documentos',id_registro=old.id,valor_anterior=old.documentos_tipo_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_creacion',tabla='documentos',id_registro=old.id,valor_anterior=old.fecha_creacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_documento',tabla='documentos',id_registro=old.id,valor_anterior=old.fecha_documento;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado_id',tabla='documentos',id_registro=old.id,valor_anterior=old.estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_id',tabla='documentos',id_registro=old.id,valor_anterior=old.usuario_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='familia',tabla='documentos',id_registro=old.id,valor_anterior=old.familia; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
