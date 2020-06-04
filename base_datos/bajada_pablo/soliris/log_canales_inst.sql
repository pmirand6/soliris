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

-- Volcando estructura para disparador soliris.log_canales_inst
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_canales_inst
BEFORE INSERT
ON canales
FOR EACH ROW
BEGIN
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'id',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'canal',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.canal;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'familia',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.familia;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'direccion',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.direccion;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'mail',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.mail;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'dir_tec',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.dir_tec;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'cont_venta',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.cont_venta;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'cont_otro',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.cont_otro;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'puntos_entrega',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.puntos_entrega;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'documentacion',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.documentacion;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'usuario_audit',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.usuario_audit;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'fecha_audit',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.fecha_audit;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'estado',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.estado;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'estado_id',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.estado_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'convenio',
      tabla = 'canales',
      id_registro = new.id,
      valor_nuevo = new.convenio;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
