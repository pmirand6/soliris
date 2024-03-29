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

-- Volcando estructura para disparador soliris.log_documentos_inst
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_documentos_inst
BEFORE INSERT
ON documentos
FOR EACH ROW
BEGIN
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'id',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'valor',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.valor;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'documentos_tipo_id',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.documentos_tipo_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'fecha_creacion',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.fecha_creacion;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'fecha_documento',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.fecha_documento;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'estado_id',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.estado_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'usuario_id',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.usuario_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'familia',
      tabla = 'documentos',
      id_registro = new.id,
      valor_nuevo = new.familia;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
