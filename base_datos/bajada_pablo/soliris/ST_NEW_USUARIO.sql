-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5965
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para procedimiento soliris.ST_NEW_USUARIO
DELIMITER //
CREATE PROCEDURE `ST_NEW_USUARIO`(IN `p_username` varchar(45),
IN `p_email` varchar(255),
IN `p_estado` varchar(50),
IN `p_rol_id` int(11))
    COMMENT 'Creacion de nuevo usuario'
BEGIN
  START TRANSACTION;

    SET @estado = (SELECT
        id
      FROM maestro_estado m
      WHERE m.referencia = 'Usuario'
      AND m.valor = p_estado);
    SET @countUsuario = (SELECT
        COUNT(*)
      FROM usuario u
      WHERE u.username = p_username);

    IF (@countUsuario = 0) THEN

      INSERT INTO usuario (username, email, estado_id, rol_id)
        VALUES (p_username, p_email, @estado, p_rol_id);

      SELECT
        LAST_INSERT_ID() AS mensaje;
    ELSE
      SELECT
        "EL USUARIO QUE INTENTA CREAR YA SE ENCUENTRA EN LA BASE DE USUARIOS" AS mensaje;
    END IF;

  /*
  -- Begin Return row code block

  SELECT username, email, estado_id, rol_id
  FROM   usuario
  WHERE  id = LAST_INSERT_ID();

  -- End Return row code block

  */
  COMMIT;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
