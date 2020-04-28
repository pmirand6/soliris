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

-- Volcando estructura para procedimiento soliris.ST_UP_MEDICO
DELIMITER //
CREATE PROCEDURE `ST_UP_MEDICO`(IN `v_idMedico` int,
IN `v_estado_id` int,
IN `v_nombre` varchar(200),
IN `v_apellido` varchar(50),
IN `v_matricula_tipo_id` int,
IN `v_matricula_numero` varchar(45),
IN `v_lugar` varchar(45),
IN `v_c_atencion` varchar(255),
IN `v_telefono` varchar(45),
IN `v_fax` varchar(45),
IN `v_domicilio` varchar(255),
IN `v_localidad` varchar(255),
IN `v_apm_id` int,
IN `v_email` varchar(255)

,
IN `v_usuario` varchar(50))
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Creacion de un nuevo medico'
BEGIN

  SET @count_med = (SELECT
      COUNT(*)
    FROM medico m
    WHERE m.id = v_idMedico);

  SET @usuario_mod_id := (SELECT
      u.id
    FROM usuario u
    WHERE v_usuario = u.username);

  IF (@count_med <> 0) THEN
    UPDATE medico
    SET apellido = v_nombre -- apellido - VARCHAR(50)
        ,
        nombre = v_apellido -- nombre - VARCHAR(200)
        ,
        matricula_tipo_id = v_matricula_tipo_id -- matricula_tipo_id - INT(11) NOT NULL
        ,
        matricula_numero = v_matricula_numero -- matricula_numero - VARCHAR(45)
        ,
        apm_id = v_apm_id -- apm_id - INT(10) NOT NULL
        ,
        c_atencion = v_c_atencion -- c_atencion - VARCHAR(255)
        ,
        lugar = v_lugar -- lugar - VARCHAR(45)
        ,
        mail = v_email -- mail - VARCHAR(100)
        ,
        telefono = v_telefono -- telefono - VARCHAR(45)
        ,
        fax = v_fax -- fax - VARCHAR(45)
        ,
        domicilio = v_domicilio -- domicilio - VARCHAR(255)
        ,
        localidad = v_localidad -- localidad - VARCHAR(255)
        ,
        estado_id = v_estado_id -- estado_id - INT(11) NOT NULL
        ,
        fecha_modificacion = NOW() -- fecha_modificacion - DATETIME
        ,
        usuario_mod = @usuario_mod_id -- usuario_mod - INT(11) NOT NULL
    WHERE id = v_idMedico -- id - INT(10) NOT NULL
    ;

    IF (v_estado_id = 19) THEN
      -- se activa el medico
      UPDATE medico
      SET fecha_aprobado = NOW(),
          fecha_modificacion = NOW();
    ELSEIF (v_estado_id = 20) THEN
      -- se deshabilita el medico
      UPDATE medico m
      SET m.fecha_inac = NOW(),
          m.fecha_modificacion = NOW();
    END IF;

    SELECT
      TRUE AS mensaje;

  ELSE

    SELECT
      'ERROR NO_INSERT' AS mensaje;

  END IF;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
