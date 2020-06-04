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

-- Volcando estructura para función soliris.FU_NEW_INST
DELIMITER //
CREATE FUNCTION `FU_NEW_INST`(`v_nombre` varchar(250),
`v_direccion` varchar(250),
`v_altura` int,
`v_localidad` varchar(100),
`v_provincia` varchar(100),
`v_contacto` varchar(100),
`v_mail` varchar(100),
`v_telefono` varchar(45),
`v_notas` longtext,
`v_tipo` varchar(10),
`v_familia` varchar(3),
`v_usuario` varchar(45)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE id_1 int;
  DECLARE id_2 int;

  DECLARE devolucion longtext;

  SET id_1 = (SELECT
      LAST_INSERT_ID());

  INSERT INTO institucion (nombre,
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
  estado_id,
  usuario_audit)
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
      26,
      v_usuario
    FROM dual
    WHERE NOT EXISTS (SELECT
        *
      FROM institucion
      WHERE nombre = v_nombre
      AND direccion = v_direccion
      AND altura = v_altura
      AND localidad = v_localidad
      AND provincia = v_provincia
      AND contacto = v_contacto
      AND mail = v_mail
      AND telefono = v_telefono
      AND notas = v_notas
      AND tipo = v_tipo
      AND familia = v_familia
      AND usuario_audit = v_usuario);

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
