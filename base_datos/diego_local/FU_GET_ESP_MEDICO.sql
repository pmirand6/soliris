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

-- Volcando estructura para función soliris.FU_GET_ESP_MEDICO
DELIMITER //
CREATE FUNCTION `FU_GET_ESP_MEDICO`(`v_idMedico` int) RETURNS varchar(50) CHARSET latin1
    COMMENT 'Obtiene las especialidades de un medico'
BEGIN

  RETURN (SELECT
      GROUP_CONCAT(e.especialidad)
    FROM especialidad e
      INNER JOIN rel_medico_especialidad r
        ON r.especialidad_id = e.id
      INNER JOIN medico m
        ON m.id = r.medico_id
    WHERE m.id = v_idMedico);

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
