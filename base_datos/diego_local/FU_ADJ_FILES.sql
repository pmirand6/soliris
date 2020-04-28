-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.11-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para función soliris.FU_ADJ_FILES
DELIMITER //
CREATE FUNCTION `FU_ADJ_FILES`(`v_id_maestro` int,
`v_numero_reg` varchar(50),
`v_referencia` varchar(45),
`v_tipo` varchar(45),
`v_fecha` varchar(45),
`v_documento` varchar(255)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE id_1 int;
  DECLARE id_2 int;

  DECLARE devolucion longtext;

  SET id_1 = (SELECT
      LAST_INSERT_ID());

  IF v_numero_reg = 0 THEN
    INSERT INTO soliris_documentacion
    SET id_maestro = v_id_maestro,
        referencia = v_referencia,
        documento = v_documento,
        tipo = v_tipo,
        fecha = v_fecha;
  ELSE
    UPDATE soliris_documentacion
    SET id_maestro = v_id_maestro,
        referencia = v_referencia,
        documento = v_documento,
        tipo = v_tipo,
        fecha = v_fecha
    WHERE id = v_numero_reg;
  END IF;

  SET id_2 = (SELECT
      LAST_INSERT_ID());

  IF (id_1 <> id_2) THEN
    RETURN id_2;
  END IF;

  RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
