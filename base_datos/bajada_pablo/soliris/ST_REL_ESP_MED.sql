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

-- Volcando estructura para procedimiento soliris.ST_REL_ESP_MED
DELIMITER //
CREATE PROCEDURE `ST_REL_ESP_MED`(IN `v_medico_id` int,
IN `v_especialidad` varchar(255))
    COMMENT 'Establece la relacion entre medico y especialidad/es'
BEGIN

  SET @esp_id := (SELECT
      e.id
    FROM especialidad e
    WHERE e.especialidad = v_especialidad);
  SET @count_medico := (SELECT
      COUNT(*)
    FROM rel_medico_especialidad rme
    WHERE rme.medico_id = v_medico_id);

  IF (@count_medico > 0) THEN
    DELETE
      FROM rel_medico_especialidad
    WHERE medico_id = v_medico_id
      AND especialidad_id = @esp_id;

  END IF;
  INSERT INTO rel_medico_especialidad (medico_id, especialidad_id)
    VALUES (v_medico_id, @esp_id);



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
