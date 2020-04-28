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

-- Volcando estructura para disparador soliris.log_maestro_ventas_del
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_maestro_ventas_del AFTER
DELETE ON maestro_ventas FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='paciente_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.paciente_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='edad',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.edad;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='presentacion_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.presentacion_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='venta_tipo_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.venta_tipo_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='medico_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.medico_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='producto_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.producto_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='unidades',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.unidades;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_venta',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.fecha_venta;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='patologia_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.patologia_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='sub_patologia_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.sub_patologia_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='institucion_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.institucion_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='canal_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.canal_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='estado_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.estado_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.usuario_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='cod_reasignacion',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.cod_reasignacion;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='crm_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.crm_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nota',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.nota;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='nbr',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.nbr;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_stamp',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.fecha_stamp;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='usuario_mod_id',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.usuario_mod_id;
INSERT INTO soliris_log SET usuario= USER(),fecha= NOW(),accion='delete',registro='fecha_mod',tabla='maestro_ventas',id_registro=old.id,valor_anterior=old.fecha_mod; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
