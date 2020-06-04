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

-- Volcando estructura para procedimiento soliris.ST_UP_USUARIO
DELIMITER //
CREATE PROCEDURE `ST_UP_USUARIO`(IN `p_id` int(10),
IN `p_username` varchar(45),
IN `p_email` varchar(255),
IN `p_estado` varchar(50),
IN `p_rol_id` int(11))
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
    /** Verifico que el usuario se encuentre en la base **/
    IF (@countUsuario = 1) THEN

      UPDATE usuario
      SET username = p_username,
          email = p_email,
          estado_id = @estado,
          rol_id = p_rol_id
      WHERE id = p_id;

      SELECT
        "Se actualizó el usuario correctamente" AS mensaje;

    ELSE

      SELECT
        "No se encontró el usuario en la base" AS mensaje;

    END IF;

  COMMIT;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
