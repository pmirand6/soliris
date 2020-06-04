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

-- Volcando estructura para disparador soliris.log_institucion_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_institucion_upd
BEFORE UPDATE
ON institucion
FOR EACH ROW
BEGIN
  IF old.id <> new.id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'id',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.id,
        valor_nuevo = NEW.id;
  END IF;
  IF old.nombre <> new.nombre THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'nombre',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.nombre,
        valor_nuevo = NEW.nombre;
  END IF;
  IF old.direccion <> new.direccion THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'direccion',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.direccion,
        valor_nuevo = NEW.direccion;
  END IF;
  IF old.altura <> new.altura THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'altura',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.altura,
        valor_nuevo = NEW.altura;
  END IF;
  IF old.localidad <> new.localidad THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'localidad',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.localidad,
        valor_nuevo = NEW.localidad;
  END IF;
  IF old.provincia <> new.provincia THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'provincia',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.provincia,
        valor_nuevo = NEW.provincia;
  END IF;
  IF old.contacto <> new.contacto THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'contacto',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.contacto,
        valor_nuevo = NEW.contacto;
  END IF;
  IF old.mail <> new.mail THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'mail',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.mail,
        valor_nuevo = NEW.mail;
  END IF;
  IF old.telefono <> new.telefono THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'telefono',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.telefono,
        valor_nuevo = NEW.telefono;
  END IF;
  IF old.notas <> new.notas THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'notas',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.notas,
        valor_nuevo = NEW.notas;
  END IF;
  IF old.tipo <> new.tipo THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'tipo',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.tipo,
        valor_nuevo = NEW.tipo;
  END IF;
  IF old.familia <> new.familia THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'familia',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.familia,
        valor_nuevo = NEW.familia;
  END IF;
  IF old.usuario_audit <> new.usuario_audit THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'usuario_audit',
        tabla = 'institucion',
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
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.fecha_audit,
        valor_nuevo = NEW.fecha_audit;
  END IF;
  IF old.reporte <> new.reporte THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'reporte',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.reporte,
        valor_nuevo = NEW.reporte;
  END IF;
  IF old.estado_id <> new.estado_id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'estado_id',
        tabla = 'institucion',
        id_registro = old.id,
        valor_anterior = OLD.estado_id,
        valor_nuevo = NEW.estado_id;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
