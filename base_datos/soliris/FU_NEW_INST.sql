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

-- Volcando estructura para función soliris.FU_NEW_INST
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_INST`(
	`v_nombre` VARCHAR(250),
	`v_direccion` VARCHAR(250),
	`v_altura` INT,
	`v_localidad` VARCHAR(100),
	`v_provincia` VARCHAR(100),
	`v_contacto` VARCHAR(100),
	`v_mail` VARCHAR(100),
	`v_telefono` VARCHAR(45),
	`v_notas` LONGTEXT,
	`v_tipo` VARCHAR(10),
	`v_familia` VARCHAR(3),
	`v_usuario` VARCHAR(45)

) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO institucion (
	nombre,
	direccion,
	altura,
	localidad,
	provincia,
	contacto,
	mail,
	telefono,
	notas,
	tipo,
	familia,
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	v_direccion,
	v_altura,
	v_localidad,
	v_provincia,
	v_contacto,
	v_mail,
	v_telefono,
	v_notas,
	v_tipo,
	v_familia,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM institucion WHERE 
	nombre = v_nombre AND
	direccion = v_direccion AND
	altura = v_altura AND
	localidad = v_localidad AND
	provincia = v_provincia AND
	contacto = v_contacto AND
	mail = v_mail AND
	telefono = v_telefono AND
	notas = v_notas AND
	tipo = v_tipo AND
	familia = v_familia AND
	usuario_audit = v_usuario
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
