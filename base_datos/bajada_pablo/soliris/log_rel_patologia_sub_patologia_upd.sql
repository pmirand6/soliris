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

-- Volcando estructura para disparador soliris.log_rel_patologia_sub_patologia_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_rel_patologia_sub_patologia_upd
BEFORE UPDATE
ON rel_patologia_sub_patologia
FOR EACH ROW
BEGIN
  IF old.id <> new.id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'id',
        tabla = 'rel_patologia_sub_patologia',
        id_registro = old.id,
        valor_anterior = OLD.id,
        valor_nuevo = NEW.id;
  END IF;
  IF old.patologia_id <> new.patologia_id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'patologia_id',
        tabla = 'rel_patologia_sub_patologia',
        id_registro = old.id,
        valor_anterior = OLD.patologia_id,
        valor_nuevo = NEW.patologia_id;
  END IF;
  IF old.sub_patologia_id <> new.sub_patologia_id THEN
    INSERT INTO soliris_log
    SET usuario = USER(),
        fecha = NOW(),
        accion = 'update',
        registro = 'sub_patologia_id',
        tabla = 'rel_patologia_sub_patologia',
        id_registro = old.id,
        valor_anterior = OLD.sub_patologia_id,
        valor_nuevo = NEW.sub_patologia_id;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
