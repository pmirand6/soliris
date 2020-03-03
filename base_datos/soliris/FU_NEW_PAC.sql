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

-- Volcando estructura para función soliris.FU_NEW_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_PAC`(`v_nombre` VARCHAR(200), `v_estado` VARCHAR(45), `v_sub_estado` VARCHAR(45), `v_sexo` VARCHAR(2), `v_c_gestar` VARCHAR(2), `v_patologia` VARCHAR(250), `v_fecha_nac` DATE, `v_telefono` VARCHAR(45), `v_ciudad` VARCHAR(100), `v_mail` VARCHAR(100), `v_fecha_con` DATE, `v_usuario` VARCHAR(45), `v_fv` INT) RETURNS longtext CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO pacientes (
	Nombre, 
	estado, 
	sub_estado,
	sexo, 
	c_gestar, 
	Patologia, 
	fecha_nac, 
	telefono, 
	Ciudad, 
	mail, 
	Fecha_Con, 
	usuario, 
	fecha_alta, 
	fv, 
	fecha_stamp) 
SELECT v_nombre, v_estado, v_sub_estado, v_sexo, v_c_gestar, v_Patologia, v_fecha_nac, v_telefono, v_Ciudad, v_mail, v_Fecha_Con, v_usuario, now(), v_fv, now() 
FROM dual WHERE NOT EXISTS (
  SELECT * FROM pacientes WHERE 
  Nombre = v_nombre AND 
  estado = v_estado AND 
  sub_estado = v_sub_estado AND
  sexo = v_sexo AND 
  c_gestar = v_c_gestar AND 
  Patologia = v_patologia AND 
  fecha_nac = v_fecha_nac AND 
  telefono = v_telefono AND 
  Ciudad = v_ciudad AND 
  mail = v_mail AND 
  Fecha_Con = v_fecha_con AND 
  usuario = v_usuario AND 
  fecha_alta = now() AND 
  fv = v_fv AND 
  fecha_stamp = now()
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
