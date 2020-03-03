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

-- Volcando estructura para procedimiento soliris.ST_UP_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_UP_PACIENTE`(
	IN `v_id` INT,
	IN `v_apellido` VARCHAR(100),
	IN `v_nombre` VARCHAR(100),
	IN `v_fecha_nac` DATE,
	IN `v_sexo` VARCHAR(2),
	IN `v_telefono` VARCHAR(45),
	IN `v_ciudad` VARCHAR(100),
	IN `v_pais_id` INT,
	IN `v_mail` VARCHAR(100),
	IN `v_patologia_id` INT,
	IN `v_sub_patologia_id` INT,
	IN `v_os_id` INT,
	IN `v_usuario` VARCHAR(50),
	IN `v_sub_estado_id` VARCHAR(50),
	IN `v_estado_id` INT,
	IN `v_crm_id` INT








)
    COMMENT 'Actualizacion de paciente'
BEGIN

DECLARE c_usuario_id INT;
DECLARE c_sub_estado INT;
DECLARE c_estado INT;
SET c_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'estado' AND valor = 'v_sub_estado');
SET c_sub_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'sub_estado' AND valor = 'v_sub_estado');

SET c_usuario_id = (SELECT u.id FROM usuario u WHERE v_usuario = u.username);

UPDATE paciente
	SET
		apellido=v_apellido,
		nombre=v_nombre,
		nombre_completo=CONCAT(v_apellido, ', ', v_nombre),
		fecha_nac=v_fecha_nac,
		sexo=v_sexo,
		telefono=v_telefono,
		ciudad=v_ciudad,
		pais_id=v_pais_id,
		mail=v_mail,
		patologia_id=v_patologia_id,
		sub_patologia_id=v_sub_patologia_id,
		os_id=v_os_id,
		notas=v_notas,
		usuario_id=c_usuario_id,
		c_gestar='',
		estado_id=c_estado,
		sub_estado_id=v_sub_estado_id,
		fecha_stamp=NOW(),
		familia='SOL',
		crm_id=v_crm_id
	WHERE 
	  id = v_id;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
