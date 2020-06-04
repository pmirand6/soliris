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

-- Volcando estructura para función soliris.FU_GET_PACIENTE_EDAD
DELIMITER //
CREATE FUNCTION `FU_GET_PACIENTE_EDAD`(`v_id_paciente` int) RETURNS int(11)
    COMMENT 'DEVUELVE LA EDAD DEL PACIENTE'
BEGIN

  RETURN (SELECT
      YEAR(CURDATE()) - YEAR(p.fecha_nac) - IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(p.fecha_nac), '-', DAY(p.fecha_nac)), '%Y-%c-%e') > CURDATE(), 1, 0) AS edad
    FROM paciente p
    WHERE p.id = v_id_paciente);


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
