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

-- Volcando estructura para función soliris.FU_VAL_PAC_EDAD
DELIMITER //
CREATE FUNCTION `FU_VAL_PAC_EDAD`(`v_edad` int,
`v_sexo` varchar(5)) RETURNS text CHARSET latin1
BEGIN

  DECLARE res text;
  DECLARE edad_ped int;
  DECLARE edad_c_g int;

  SET edad_ped = (SELECT
      SUBSTRING_INDEX(GROUP_CONCAT(valor), ',', 1) AS e_ped
    FROM configuracion
    WHERE tipo = 'edad_paciente');
  SET edad_c_g = (SELECT
      SUBSTRING_INDEX(GROUP_CONCAT(valor), ',', -1) AS e_c_ges
    FROM configuracion
    WHERE tipo = 'edad_paciente');

  CASE
    WHEN (v_edad <= edad_ped) THEN SET res = (SELECT
            CONCAT_WS(',', nota, FU_CLE_TAGS(nota))
          FROM configuracion
          WHERE valor = edad_ped);
    WHEN ((v_edad > edad_ped AND
      v_edad <= edad_c_g) AND
      (v_sexo = 'F')) THEN SET res = (SELECT
            CONCAT_WS(',', nota, FU_CLE_TAGS(nota))
          FROM configuracion
          WHERE valor = edad_c_g);
  END CASE;
  RETURN res;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
