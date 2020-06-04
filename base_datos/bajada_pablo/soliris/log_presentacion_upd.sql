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

-- Volcando estructura para disparador soliris.log_presentacion_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_presentacion_upd
BEFORE UPDATE
ON presentacion
FOR EACH ROW
BEGIN
  IF old.id <> new.id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'id',
        tabla = 'presentacion',
        id_registro = old.id,
        valor_anterior = OLD.id,
        valor_nuevo = NEW.id;
  END IF;
  IF old.valor <> new.valor THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'valor',
        tabla = 'presentacion',
        id_registro = old.id,
        valor_anterior = OLD.valor,
        valor_nuevo = NEW.valor;
  END IF;
  IF old.producto_id <> new.producto_id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'producto_id',
        tabla = 'presentacion',
        id_registro = old.id,
        valor_anterior = OLD.producto_id,
        valor_nuevo = NEW.producto_id;
  END IF;
  IF old.codigo_np <> new.codigo_np THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'codigo_np',
        tabla = 'presentacion',
        id_registro = old.id,
        valor_anterior = OLD.codigo_np,
        valor_nuevo = NEW.codigo_np;
  END IF;
  IF old.familia <> new.familia THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'familia',
        tabla = 'presentacion',
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
        tabla = 'presentacion',
        id_registro = old.id,
        valor_anterior = OLD.usuario_audit,
        valor_nuevo = NEW.usuario_audit;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
