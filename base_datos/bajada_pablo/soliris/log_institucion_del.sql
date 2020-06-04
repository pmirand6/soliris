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

-- Volcando estructura para disparador soliris.log_institucion_del
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_institucion_del
AFTER DELETE
ON institucion
FOR EACH ROW
BEGIN
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'id',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'nombre',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.nombre;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'direccion',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.direccion;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'altura',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.altura;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'localidad',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.localidad;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'provincia',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.provincia;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'contacto',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.contacto;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'mail',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.mail;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'telefono',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.telefono;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'notas',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.notas;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'tipo',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.tipo;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'familia',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.familia;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'usuario_audit',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.usuario_audit;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'fecha_audit',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.fecha_audit;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'reporte',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.reporte;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'delete',
      registro = 'estado_id',
      tabla = 'institucion',
      id_registro = old.id,
      valor_anterior = old.estado_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
