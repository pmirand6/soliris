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

-- Volcando estructura para función soliris.FU_VAL_FEC_REC
DELIMITER //
CREATE DEFINER=`admin`@`%` FUNCTION `FU_VAL_FEC_REC`(
	`v_id` INT,
	`v_pac` INT,
	`v_fec_rec` DATE

) RETURNS varchar(50) CHARSET latin1
    COMMENT 'Funcion que valida la fecha de receta'
BEGIN
DECLARE res_receta DATE;

SET res_receta = (SELECT 
	im.fecha_receta
FROM 
	soliris_maestro im 
WHERE 
	im.id NOT IN ('v_id') 
AND 
	im.nombre = 'v_pac '
AND 
	im.fecha_receta = 'v_fec_rec' 
AND 
	im.estado IN('FV', 'Documentacion', 'NP')
LIMIT 1);
	
	RETURN res_receta;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
