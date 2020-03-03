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

-- Volcando estructura para procedimiento soliris.ST_NEW_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_NEW_PACIENTE`(
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
	IN `v_crm_id` INT




)
    COMMENT 'Creacion del nuevo paciente'
BEGIN

DECLARE c_usuario_id INT;
DECLARE c_sub_estado INT;
SET c_sub_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'sub_estado' AND valor = 'v_sub_estado');

SET c_usuario_id = (SELECT u.id FROM usuario u WHERE v_usuario = u.username);

INSERT INTO paciente
	(
		apellido,
		nombre,
		nombre_completo, 
		fecha_nac, 
		sexo, 
		telefono, 
		ciudad, 
		pais_id, 
		mail, 
		patologia_id, 
		sub_patologia_id, 
		os_id, 
		usuario_id, 		
		estado_id, 
		sub_estado_id, 
		fecha_stamp, 
		familia, 
		crm_id
		)
	VALUES 
	(
		v_apellido, 
		v_nombre, 
		CONCAT(v_apellido, ', ', nombre), 
		v_fecha_nac, 
		v_sexo, 
		v_telefono, 
		v_ciudad, 
		v_pais_id, 
		v_mail, 
		v_patologia_id, 
		v_sub_patologia_id, 
		v_os_id, 
		c_usuario_id, 
		7, 
		c_sub_estado, 
		NOW(), 
		'SOL', 
		v_crm_id
		);

SELECT LAST_INSERT_ID();


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
