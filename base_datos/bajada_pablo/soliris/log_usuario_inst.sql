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

-- Volcando estructura para disparador soliris.log_usuario_inst
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_usuario_inst
BEFORE INSERT
ON usuario
FOR EACH ROW
BEGIN
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'id',
      tabla = 'usuario',
      id_registro = new.id,
      valor_nuevo = new.id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'username',
      tabla = 'usuario',
      id_registro = new.id,
      valor_nuevo = new.username;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'email',
      tabla = 'usuario',
      id_registro = new.id,
      valor_nuevo = new.email;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'estado_id',
      tabla = 'usuario',
      id_registro = new.id,
      valor_nuevo = new.estado_id;
  INSERT INTO soliris_log
  SET usuario = USER(),
      fecha = NOW(),
      accion = 'insert',
      registro = 'rol_id',
      tabla = 'usuario',
      id_registro = new.id,
      valor_nuevo = new.rol_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
