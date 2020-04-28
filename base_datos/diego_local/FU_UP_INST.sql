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

-- Volcando estructura para función soliris.FU_UP_INST
DELIMITER //
CREATE FUNCTION `FU_UP_INST`(`v_nombre` varchar(250),
`v_direccion` varchar(250),
`v_altura` int,
`v_localidad` varchar(100),
`v_provincia` varchar(100),
`v_contacto` varchar(100),
`v_mail` varchar(100),
`v_telefono` varchar(45),
`v_notas` longtext,
`v_tipo` varchar(10),
`v_estado` varchar(45),
`v_familia` varchar(3),
`v_usuario` varchar(45),
`v_id` int) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;
  UPDATE institucion
  SET nombre = v_nombre,
      direccion = v_direccion,
      altura = v_altura,
      localidad = v_localidad,
      provincia = v_provincia,
      contacto = v_contacto,
      mail = v_mail,
      telefono = v_telefono,
      notas = v_notas,
      tipo = v_tipo,
      familia = v_familia,
      estado_id = (SELECT
          m.id
        FROM maestro_estado m
        WHERE m.valor = v_estado
        AND m.referencia = 'institucion'),
      usuario_audit = v_usuario
  WHERE id = v_id;

  IF (SELECT
        ROW_COUNT() > 0) THEN
    SET devolucion = v_id;
  ELSE
    SET devolucion = 'ERROR NO_UPDATE';
  END IF;

  RETURN devolucion;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
