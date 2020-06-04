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

-- Volcando estructura para función soliris.FU_VAL_PAC
DELIMITER //
CREATE FUNCTION `FU_VAL_PAC`(`v_id` int,
`v_comentario` longtext,
`v_estado` int,
`v_usuario` varchar(45)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;

  UPDATE paciente
  SET notas = v_comentario,
      estado = v_estado,
      fecha_stamp = NOW()
  WHERE id = v_id;

  IF (SELECT
        ROW_COUNT() > 0) THEN

    IF (v_estado = 'Aprobado') THEN
      UPDATE pacientes
      SET aprobado = v_usuario,
          fecha_aprobado = NOW(),
          fecha_stamp = NOW()
      WHERE id = v_id;
    ELSE
      UPDATE pacientes
      SET aprobado = NULL,
          fecha_aprobado = NULL
      WHERE id = v_id;

    END IF;
    SET devolucion = v_id;
  ELSE
    SET devolucion = 'ERROR NO_UPDATE';
  END IF;


  RETURN devolucion;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
