-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5965
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para disparador soliris.log_maestro_ventas_inst
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_maestro_ventas_inst
BEFORE INSERT
ON maestro_ventas
FOR EACH ROW
BEGIN


  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'paciente_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.paciente_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'edad',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.edad;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'presentacion_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.presentacion_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'venta_tipo_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.venta_tipo_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'medico_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.medico_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'producto_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.producto_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'unidades',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.unidades;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'fecha_venta',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.fecha_venta;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'patologia_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.patologia_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'sub_patologia_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.sub_patologia_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'institucion_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.institucion_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'canal_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.canal_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'estado_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.estado_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'usuario_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.usuario_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'cod_reasignacion',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.cod_reasignacion;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'crm_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.crm_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'nota',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.nota;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'nbr',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.nbr;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'fecha_stamp',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.fecha_stamp;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'usuario_mod_id',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.usuario_mod_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'fecha_mod',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.fecha_mod;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'oc',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.oc;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'codigo_venta',
      tabla = 'maestro_ventas',
      id_registro = new.id,
      valor_nuevo = new.codigo_venta;


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
