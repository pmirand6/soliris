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

-- Volcando estructura para función soliris.FU_NEW_CANAL
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FU_NEW_CANAL`(
	`v_nombre` VARCHAR(100),
	`v_familia` VARCHAR(45),
	`v_direccion` LONGTEXT,
	`v_mail` VARCHAR(200),
	`v_dir_tec` VARCHAR(200),
	`v_cont_venta` LONGTEXT,
	`v_cont_otro` LONGTEXT,
	`v_puntos_entrega` LONGTEXT,
	`v_usuario` VARCHAR(45)
) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE id_1 INT;
	DECLARE id_2 INT;
	
	DECLARE devolucion LONGTEXT;
		
	SET id_1 = (SELECT LAST_INSERT_ID());
	
INSERT INTO canales (
	canal,
	familia,
	direccion,
	mail,
	dir_tec,
	cont_venta,
	cont_otro,
	puntos_entrega,
	estado,
	usuario_audit
) 
SELECT 
	v_nombre,
	v_familia,
	v_direccion,
	v_mail,
	v_dir_tec,
	v_cont_venta,
	v_cont_otro,
	v_puntos_entrega,
	'Activo',
	v_usuario
FROM dual WHERE NOT EXISTS (
  SELECT * FROM canales WHERE 
	canal = v_nombre AND
	familia = v_familia AND
	direccion = v_direccion AND
	mail = v_mail AND
	dir_tec = v_dir_tec AND
	cont_venta = v_cont_venta AND
	cont_otro = v_cont_otro AND
	puntos_entrega = v_puntos_entrega
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
