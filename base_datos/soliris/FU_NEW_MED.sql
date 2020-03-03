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

-- Volcando estructura para función soliris.FU_NEW_MED
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_MED`(`v_nombre` VARCHAR(200), `v_matricula_tipo` VARCHAR(45), `v_matricula_numero` VARCHAR(45), `v_lugar` VARCHAR(45), `v_c_atencion` VARCHAR(255), `v_telefono` VARCHAR(45), `v_fax` VARCHAR(45), `v_nacimiento` VARCHAR(45), `v_domicilio` VARCHAR(255), `v_localidad` VARCHAR(255), `v_fecha_cap` DATETIME, `v_especialidad` VARCHAR(255), `v_apm` INT, `v_estado` VARCHAR(45)
, `v_email` VARCHAR(255)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
	INSERT INTO medicos (
        nombre,
        matricula_tipo,
        matricula_numero,
        lugar,
        c_atencion,
        telefono,
        fax,
        nacimiento,
        domicilio,
        localidad,
        fecha_cap,
        especialidad,
        apm,
        estado,
        fecha_alta,
        mail
) 
SELECT 
        v_nombre,
        v_matricula_tipo,
        v_matricula_numero,
        v_lugar,
        v_c_atencion,
        v_telefono,
        v_fax,
        v_nacimiento,
        v_domicilio,
        v_localidad,
        v_fecha_cap,
        v_especialidad,
        v_apm,
        v_estado,
        now(),
        v_email
FROM dual WHERE NOT EXISTS (
  SELECT * FROM medicos WHERE 
        nombre = v_nombre AND
        matricula_tipo = v_matricula_tipo AND
        matricula_numero = v_matricula_numero AND
        lugar = v_lugar AND
        c_atencion = v_c_atencion AND
        telefono = v_telefono AND
        fax = v_fax AND
        nacimiento = v_nacimiento AND
        domicilio = v_domicilio AND
        localidad = v_localidad AND
        fecha_cap = v_fecha_cap AND
        especialidad = v_especialidad AND
        apm = v_apm AND
        estado = v_estado AND
        mail = v_email
);
	
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
