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

-- Volcando estructura para función soliris.FU_UP_MED
DELIMITER //
CREATE FUNCTION `FU_UP_MED`(`v_nombre` varchar(200), `v_matricula_tipo` varchar(45), `v_matricula_numero` varchar(45), `v_Lugar` varchar(45), `v_C_Atencion` varchar(255), `v_telefono` varchar(45), `v_Fax` varchar(45), `v_nacimiento` varchar(20), `v_domicilio` varchar(255), `v_localidad` varchar(255), `v_fecha_cap` varchar(20), `v_especialidad` varchar(255), `v_apm` int, `v_estado` varchar(15), `v_usuario` varchar(45), `v_id` int
, `v_email` varchar(255)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;
  IF v_estado = 'Activo' THEN
    UPDATE medicos
    SET Aprobado = v_usuario,
        Fecha_Aprobado = NOW()
    WHERE id = v_id;
  END IF;

  UPDATE medicos
  SET Nombre = v_nombre,
      matricula_tipo = v_matricula_tipo,
      matricula_numero = v_matricula_numero,
      Lugar = v_Lugar,
      C_Atencion = v_C_Atencion,
      telefono = v_telefono,
      Fax = v_Fax,
      nacimiento = v_nacimiento,
      domicilio = v_domicilio,
      localidad = v_localidad,
      fecha_cap = v_fecha_cap,
      especialidad = v_especialidad,
      apm = v_apm,
      estado = v_estado,
      mail = v_email
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
