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

-- Volcando estructura para función soliris.FU_NEW_VENTA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_VENTA`(
	`v_id_paciente` INT,
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
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	DECLARE c_tipo VARCHAR(2);
	DECLARE c_padre INT;
	
	DECLARE devolucion LONGTEXT;
	
	SET c_padre = null;
	SET c_tipo = 'RI';

	SET c_padre = (SELECT RM.id FROM soliris_maestro as RM WHERE RM.nombre = v_id_paciente ORDER BY RM.id DESC LIMIT 1);

	IF (SELECT LENGTH(c_padre) > 0) THEN
		SET c_tipo = 'FU';
	END IF;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO soliris_maestro SET 
	nombre = v_id_paciente, 
	sexo = (SELECT sexo FROM pacientes as P WHERE P.id = v_id_paciente),
	fecha_nac = (SELECT fecha_nac FROM pacientes as P WHERE P.id = v_id_paciente),
/*	edad = (SELECT YEAR(CURDATE())- YEAR(STR_TO_DATE(P.fecha_nac, '%Y-%c-%e')) FROM pacientes as P WHERE P.id = v_id_paciente), PMIRANDA*/
  edad = (SELECT TIMESTAMPDIFF(YEAR,STR_TO_DATE(P.fecha_nac, '%Y-%c-%e'),CURDATE()) FROM pacientes as P WHERE P.id = v_id_paciente),
/* 	edad = (SELECT YEAR(CURDATE())- YEAR(STR_TO_DATE(P.fecha_nac, '%e-%c-%Y')) FROM pacientes as P WHERE P.id = v_id_paciente), */
	medico = (SELECT M.Nombre FROM medicos as M WHERE M.id = v_medico),
	id_medico = (SELECT M.id FROM medicos as M WHERE M.id = v_medico),
	dosis = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_dosis),
	unidades = (SELECT A.valor FROM auxiliar as A WHERE A.id = v_unidades),
	fecha_venta = v_f_venta,
	consentimiento = (SELECT P.Fecha_Con FROM pacientes as P WHERE P.id = v_id_paciente),
	patologia = v_patologia,
	institucion = (SELECT I.nombre FROM institucion as I WHERE I.id = v_institucion),
	canal = (SELECT C.canal FROM canales as C WHERE C.id = v_canal),
	cargado = v_usuario,
	fecha = now(),
	tipo = c_tipo,
	padre = c_padre,
	estado = 'Documentacion',
	APM = (SELECT A.nombre FROM medicos AS M LEFT JOIN apm AS A ON (M.apm = A.id) WHERE M.id = v_medico);

	
	SET id_2 = (SELECT LAST_INSERT_ID());
	
	IF (id_1 <> id_2) THEN
		RETURN id_2;
	END IF;
	
	RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
