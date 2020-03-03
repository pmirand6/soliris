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

-- Volcando estructura para función soliris.FU_UP_APM
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_UP_APM`(
	`v_nombre` VARCHAR(100),
	`v_estado` VARCHAR(45),
	`v_usuario` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE devolucion LONGTEXT;
		UPDATE apm SET 
			nombre = v_nombre, 
			estado = v_estado, 
			usuario_audit = v_usuario
		WHERE 
			id = v_id;

	IF (SELECT ROW_COUNT() > 0)  THEN
			SET devolucion = v_id;
	ELSE
			SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
