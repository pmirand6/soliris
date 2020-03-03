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

-- Volcando estructura para función soliris.FU_SHOW_FECHA_CONS_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_SHOW_FECHA_CONS_PAC`(
	`v_id` INT





) RETURNS date
    COMMENT 'Devuelve la fecha del consentimiento del paciente'
BEGIN

return (
SELECT 
--	date_format(d.fecha_documento, '%d/%m/%Y') as fconsen
	d.fecha_documento
FROM 
	rel_paciente_documentos r 
INNER JOIN 
	paciente p 
ON 
	r.paciente_id = v_id
INNER JOIN 
	documentos d 
ON 
	r.documento_id = d.id
WHERE 
	d.tipo_id = 1 -- ID del consentimiento informado de la tabla documentos_id
ORDER BY 
	r.id 
DESC LIMIT 0, 1); -- https://stackoverflow.com/questions/6881424/how-can-i-select-the-row-with-the-highest-id-in-mysql/20904650
				

				
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
