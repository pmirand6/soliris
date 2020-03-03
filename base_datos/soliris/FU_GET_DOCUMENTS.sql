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

-- Volcando estructura para función soliris.FU_GET_DOCUMENTS
DELIMITER //
CREATE DEFINER=`admin`@`%` FUNCTION `FU_GET_DOCUMENTS`(
	`v_id` INT,
	`v_referencia` VARCHAR(50)





) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
    COMMENT 'devuelve un array con los documentos del paciente'
BEGIN

declare s_response varchar(255);

set s_response=(select group_concat(documento SEPARATOR ';') from soliris_documentacion where id_maestro=v_id and referencia=v_referencia);

if s_response is null  then 
	set s_response="Sin Documentación";
end if;
	

return s_response;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
