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

-- Volcando estructura para procedimiento soliris.ST_EXISTE_MEDICO
DELIMITER //
CREATE PROCEDURE `ST_EXISTE_MEDICO`(
	IN `v_apellido` VARCHAR(100),
	IN `v_nombre` VARCHAR(100),
	IN `v_tMatricula` INT,
	IN `v_Matricula` INT
)
BEGIN
/*la funcion devuelve un booleano 
true si existe
false si no existe
*/



SELECT exists (
	SELECT 
		id	
	FROM 
		medico 
	WHERE 
		apellido = v_apellido and
		nombre = v_nombre and
		matricula_tipo_id = v_tMatricula and
		matricula_numero= v_Matricula
		);
		


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
