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

-- Volcando estructura para función soliris.FU_NEW_USR
DELIMITER //
CREATE FUNCTION `FU_NEW_USR`(`v_usuario` varchar(45),
`v_grupo` varchar(45),
`v_familia` varchar(3),
`v_mail` varchar(90)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE id_1 int;
  DECLARE id_2 int;

  DECLARE devolucion longtext;

  SET id_1 = (SELECT
      LAST_INSERT_ID());

  INSERT INTO soliris_usuarios (usuario,
  grupo,
  familia,
  mail,
  estado)
    SELECT
      v_usuario,
      v_grupo,
      v_familia,
      v_mail,
      'Activo'
    FROM dual
    WHERE NOT EXISTS (SELECT
        *
      FROM soliris_usuarios
      WHERE usuario = v_usuario
      AND grupo = v_grupo
      AND familia = v_familia
      AND mail = v_mail);

  SET id_2 = (SELECT
      LAST_INSERT_ID());

  IF (id_1 <> id_2) THEN
    RETURN id_2;
  END IF;

  RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
