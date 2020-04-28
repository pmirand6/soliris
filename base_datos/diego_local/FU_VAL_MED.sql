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

-- Volcando estructura para función soliris.FU_VAL_MED
DELIMITER //
CREATE FUNCTION `FU_VAL_MED`(`v_ape` varchar(50),
`v_nom` varchar(50),
`v_prov_id` int,
`v_mat_n` int,
`v_mat_p` int) RETURNS varchar(100) CHARSET latin1
    COMMENT 'VALIDACION DEL MEDICO'
BEGIN

  IF (v_mat_n > 0
    AND v_mat_n != "") THEN
    IF (SELECT
          COUNT(*)
        FROM medicos M
        WHERE (M.apellido NOT IN ('v_ape')
        AND M.nombre NOT IN ('v_nom'))
        AND (M.m_nac = v_mat_n)) THEN
      RETURN "ERROR - YA HAY UN MÉDICO CON ESA MATRICULA NACIONAL";
    ELSE
      RETURN "OK";
    END IF;

  ELSE
    IF (v_mat_p > 0
      AND v_mat_p != "") THEN
      IF (SELECT
            COUNT(*)
          FROM medicos M
          WHERE (M.apellido NOT IN ('v_ape')
          AND M.nombre NOT IN ('v_nom'))
          AND (M.m_prov = v_mat_n
          AND M.prov_id = v_prov_id)) THEN
        RETURN "ERROR - YA HAY UN MÉDICO CON ESA MATRICULA PROVINCIAL";
      ELSE
        RETURN "OK";
      END IF;
    END IF;
  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
