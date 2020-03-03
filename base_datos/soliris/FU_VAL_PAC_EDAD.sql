-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para función soliris.FU_VAL_PAC_EDAD
DELIMITER //
CREATE DEFINER=`admin`@`%` FUNCTION `FU_VAL_PAC_EDAD`(
	`v_edad` INT,
	`v_sexo` VARCHAR(5)
) RETURNS text CHARSET latin1
BEGIN

DECLARE res TEXT;
DECLARE edad_ped int;
DECLARE edad_c_g int;

set edad_ped = (SELECT SUBSTRING_INDEX(GROUP_CONCAT(valor),',',1) as e_ped FROM configuracion where tipo = 'edad_paciente'); 
set edad_c_g = (SELECT SUBSTRING_INDEX(GROUP_CONCAT(valor),',',-1) as e_c_ges FROM configuracion where tipo = 'edad_paciente');

CASE  
 WHEN (v_edad <= edad_ped) THEN 
    SET res = (SELECT CONCAT_WS(',', nota, FU_CLE_TAGS(nota)) FROM configuracion WHERE valor = edad_ped);
 WHEN ((v_edad > edad_ped AND v_edad <= edad_c_g) AND (v_sexo = 'F')) THEN
    SET res = (SELECT CONCAT_WS(',', nota, FU_CLE_TAGS(nota)) FROM configuracion WHERE valor = edad_c_g);
 END CASE;
return res;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
