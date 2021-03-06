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

-- Volcando estructura para disparador soliris.log_canales_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_canales_upd
BEFORE UPDATE
ON canales
FOR EACH ROW
BEGIN
  IF old.id <> new.id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'id',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.id,
        valor_nuevo = NEW.id;
  END IF;
  IF old.canal <> new.canal THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'canal',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.canal,
        valor_nuevo = NEW.canal;
  END IF;
  IF old.familia <> new.familia THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'familia',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.familia,
        valor_nuevo = NEW.familia;
  END IF;
  IF old.direccion <> new.direccion THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'direccion',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.direccion,
        valor_nuevo = NEW.direccion;
  END IF;
  IF old.mail <> new.mail THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'mail',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.mail,
        valor_nuevo = NEW.mail;
  END IF;
  IF old.dir_tec <> new.dir_tec THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'dir_tec',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.dir_tec,
        valor_nuevo = NEW.dir_tec;
  END IF;
  IF old.cont_venta <> new.cont_venta THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'cont_venta',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.cont_venta,
        valor_nuevo = NEW.cont_venta;
  END IF;
  IF old.cont_otro <> new.cont_otro THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'cont_otro',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.cont_otro,
        valor_nuevo = NEW.cont_otro;
  END IF;
  IF old.puntos_entrega <> new.puntos_entrega THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'puntos_entrega',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.puntos_entrega,
        valor_nuevo = NEW.puntos_entrega;
  END IF;
  IF old.documentacion <> new.documentacion THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'documentacion',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.documentacion,
        valor_nuevo = NEW.documentacion;
  END IF;
  IF old.usuario_audit <> new.usuario_audit THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'usuario_audit',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.usuario_audit,
        valor_nuevo = NEW.usuario_audit;
  END IF;
  IF old.fecha_audit <> new.fecha_audit THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'fecha_audit',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.fecha_audit,
        valor_nuevo = NEW.fecha_audit;
  END IF;
  IF old.estado <> new.estado THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'estado',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.estado,
        valor_nuevo = NEW.estado;
  END IF;
  IF old.estado_id <> new.estado_id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'estado_id',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.estado_id,
        valor_nuevo = NEW.estado_id;
  END IF;
  IF old.convenio <> new.convenio THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'convenio',
        tabla = 'canales',
        id_registro = old.id,
        valor_anterior = OLD.convenio,
        valor_nuevo = NEW.convenio;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
