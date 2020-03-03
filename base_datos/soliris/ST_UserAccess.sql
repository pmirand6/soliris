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

-- Volcando estructura para procedimiento soliris.ST_UserAccess
DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ST_UserAccess`(
	IN `v_usuario` VARCHAR(50)
)
    COMMENT 'valida el estado y la existencia del usuario en el sistema. Devuelve las propiedades de grupo y la familia'
BEGIN

DECLARE res INT;

SET res = (SELECT COUNT(*) FROM usuario WHERE username = v_usuario AND estado_id = (SELECT id from maestro_estado where tipo = 'Estado' and referencia = 'usuario' and valor = 'Activo'));

if(res > 0) then 
	SELECT u.id, u.username, r.nombre AS 'grupo' FROM usuario u INNER JOIN rol r ON u.rol_id = r.id WHERE username = v_usuario;
ELSE 
	-- Trabajar con la tabla de mensajes
	SELECT "Mensaje de error";
	
END if;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
