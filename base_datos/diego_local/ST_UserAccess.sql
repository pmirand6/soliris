-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.11-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para procedimiento soliris.ST_UserAccess
DELIMITER //
CREATE PROCEDURE `ST_UserAccess`(IN `v_usuario` varchar(50))
    COMMENT 'valida el estado y la existencia del usuario en el sistema. Devuelve las propiedades de grupo y la familia'
BEGIN

  DECLARE res int;

  SET res = (SELECT
      COUNT(*)
    FROM usuario
    WHERE username = v_usuario
    AND estado_id = (SELECT
        id
      FROM maestro_estado
      WHERE tipo = 'Estado'
      AND referencia = 'usuario'
      AND valor = 'Activo'));

  IF (res > 0) THEN
    SELECT
      u.id,
      u.username,
      r.nombre AS 'grupo'
    FROM usuario u
      INNER JOIN rol r
        ON u.rol_id = r.id
    WHERE username = v_usuario;
  ELSE
    -- Trabajar con la tabla de mensajes
    SELECT
      "Mensaje de error";

  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
