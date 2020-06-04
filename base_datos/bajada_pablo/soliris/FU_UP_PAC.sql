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

-- Volcando estructura para función soliris.FU_UP_PAC
DELIMITER //
CREATE FUNCTION `FU_UP_PAC`(`v_nombre` varchar(200),
`v_estado` varchar(45),
`v_sub_estado` varchar(45),
`v_sexo` varchar(2),
`v_c_gestar` varchar(2),
`v_patologia` varchar(250),
`v_fecha_nac` date,
`v_telefono` varchar(45),
`v_ciudad` varchar(100),
`v_mail` varchar(100),
`v_fecha_con` date,
`v_usuario` varchar(45),
`v_fv` int,
`v_aprobado` varchar(45),
`v_id` int) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;
  IF v_aprobado <> '' THEN
    UPDATE pacientes
    SET aprobado = v_aprobado,
        fecha_aprobado = NOW()
    WHERE id = v_id;
  END IF;

  UPDATE pacientes
  SET Nombre = v_nombre,
      estado = v_estado,
      sub_estado = v_sub_estado,
      sexo = v_sexo,
      c_gestar = v_c_gestar,
      Patologia = v_patologia,
      fecha_nac = v_fecha_nac,
      telefono = v_telefono,
      Ciudad = v_ciudad,
      mail = v_mail,
      Fecha_Con = v_fecha_con,
      usuario = v_usuario,
      fv = v_fv,
      fecha_stamp = NOW()
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
