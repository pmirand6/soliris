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

-- Volcando estructura para disparador soliris.log_configuracion_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_configuracion_upd
BEFORE UPDATE
ON configuracion
FOR EACH ROW
BEGIN
  IF old.id <> new.id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'id',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.id,
        valor_nuevo = NEW.id;
  END IF;
  IF old.tipo <> new.tipo THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'tipo',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.tipo,
        valor_nuevo = NEW.tipo;
  END IF;
  IF old.valor <> new.valor THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'valor',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.valor,
        valor_nuevo = NEW.valor;
  END IF;
  IF old.flia <> new.flia THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'flia',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.flia,
        valor_nuevo = NEW.flia;
  END IF;
  IF old.descripcion <> new.descripcion THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'descripcion',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.descripcion,
        valor_nuevo = NEW.descripcion;
  END IF;
  IF old.aux_1 <> new.aux_1 THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'aux_1',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.aux_1,
        valor_nuevo = NEW.aux_1;
  END IF;
  IF old.aux_2 <> new.aux_2 THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'aux_2',
        tabla = 'configuracion',
        id_registro = old.id,
        valor_anterior = OLD.aux_2,
        valor_nuevo = NEW.aux_2;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
