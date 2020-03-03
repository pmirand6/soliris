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

-- Volcando estructura para función soliris.FU_MOD_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_MOD_VENTA`(
	`v_idMst` INT,
	`v_f_venta` DATE,
	`v_patologia` LONGTEXT,
	`v_dosis` VARCHAR(200),
	`v_unidades` INT,
	`v_institucion` LONGTEXT,
	`v_canal` VARCHAR(200),
	`v_medico` VARCHAR(200),
	`v_usuario` VARCHAR(45)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE devolucion LONGTEXT;
	
UPDATE soliris_maestro SET 
	medico = (SELECT M.Nombre FROM medicos as M WHERE M.id = v_medico),
	dosis = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_dosis),
	unidades = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_unidades),
	fecha_venta = now(),
	patologia = v_patologia,
	institucion = (SELECT I.nombre FROM institucion as I WHERE I.id = v_institucion),
	canal = (SELECT C.canal FROM canales as C WHERE C.id = v_canal),
	cargado = v_usuario,
	fecha = now(),
	APM = (SELECT A.nombre FROM medicos AS M LEFT JOIN apm AS A ON (M.apm = A.id) WHERE M.id = v_medico)
WHERE id = v_idMst;

	
	IF (SELECT ROW_COUNT() > 0)  THEN
		SET devolucion = v_idMst;
	ELSE
		SET devolucion = 'ERROR NO_UPDATE';
	END IF;
	
	RETURN devolucion;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
