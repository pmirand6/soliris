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

-- Volcando estructura para procedimiento soliris.ST_UP_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_UP_PACIENTE`(IN `v_id` int,
IN `v_apellido` varchar(100),
IN `v_nombre` varchar(100),
IN `v_fecha_nac` date,
IN `v_sexo` varchar(2),
IN `v_telefono` varchar(45),
IN `v_ciudad` varchar(100),
IN `v_pais_id` int,
IN `v_mail` varchar(100),
IN `v_patologia_id` int,
IN `v_sub_patologia_id` int,
IN `v_os_id` int,
IN `v_usuario` varchar(50),
IN `v_sub_estado_id` varchar(50),
IN `v_estado_id` int,
IN `v_crm_id` int,
IN `v_notas` varchar(50))
    COMMENT 'Actualizacion de paciente'
BEGIN

  DECLARE c_usuario_mod_id int;

  DECLARE EXIT HANDLER FOR SQLWARNING
  BEGIN
    SELECT
      'ERROR: HA OCURRIDO UN ERROR AL ACTUALIZAR EL PACIENTE' AS mensaje;
  END;

  SET c_usuario_mod_id = (SELECT
      u.id
    FROM usuario u
    WHERE v_usuario = u.username);

  -- Cada actualización del paciente debe volver a un estado Pendiente para que sea aprobado por FV
  SET @estado_id_pendiente = (SELECT
      id
    FROM maestro_estado m
    WHERE m.referencia = 'paciente'
    AND m.valor = 'Pendiente');





  UPDATE paciente
  SET apellido = v_apellido,
      nombre = v_nombre,
      nombre_completo = CONCAT(v_apellido, ', ', v_nombre),
      fecha_nac = v_fecha_nac,
      sexo = v_sexo,
      telefono = v_telefono,
      ciudad = v_ciudad,
      pais_id = v_pais_id,
      mail = v_mail,
      patologia_id = v_patologia_id,
      sub_patologia_id = v_sub_patologia_id,
      os_id = v_os_id,
      c_gestar = '',
      estado_id = @estado_id_pendiente,
      sub_estado_id = v_sub_estado_id,
      familia = 'SOL',
      fecha_modificacion = NOW(),
      usuario_mod_id = c_usuario_mod_id,
      crm_id = v_crm_id,
      notas = v_notas
  WHERE id = v_id;

  SELECT
    'ACTUALIZACION CORRECTA' AS mensaje;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
