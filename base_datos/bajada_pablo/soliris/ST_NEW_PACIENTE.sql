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

-- Volcando estructura para procedimiento soliris.ST_NEW_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_NEW_PACIENTE`(IN `v_apellido` varchar(100),
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
IN `v_sub_estado_id` int,
IN `v_crm_id` int)
    COMMENT 'Creacion del nuevo paciente'
BEGIN

  DECLARE c_usuario_id int;
  DECLARE c_sub_estado int;

  -- devolvemos el error que ya existe un paciente con la combinacion de apellido, nombre y fecha de nacimiento
  DECLARE EXIT HANDLER FOR 1062
  BEGIN
    SELECT
      CONCAT('ERROR: Ya existe el paciente ', CONCAT(v_apellido, ', ', v_nombre), ' con fecha de nacimiento: ', v_fecha_nac) AS mensaje;
  END;

  -- SE ESTABLECE QUE EL PRIMER ESTADO QUE TOMA EL PACIENTE ES "SIN DOCUMENTACION" HASTA TANTO NO SE CARGUE LA DOCUMENTACION

  SET @estado_id = (SELECT
      id
    FROM maestro_estado m
    WHERE m.referencia = 'paciente'
    AND m.valor = 'Sin Documentacion');


  -- SET c_sub_estado = (SELECT id FROM `maestro_estado` WHERE `tipo` = 'sub_estado' AND valor = 'v_sub_estado');

  SET c_usuario_id = (SELECT
      u.id
    FROM usuario u
    WHERE v_usuario = u.username);

  INSERT INTO paciente (apellido,
  nombre,
  nombre_completo,
  fecha_nac,
  sexo,
  telefono,
  ciudad,
  pais_id,
  mail,
  patologia_id,
  sub_patologia_id,
  os_id,
  usuario_id,
  usuario_mod_id,
  estado_id,
  sub_estado_id,
  fecha_creacion,
  fecha_modificacion,
  familia,
  crm_id)
    VALUES (v_apellido, v_nombre, CONCAT(v_apellido, ', ', nombre), v_fecha_nac, v_sexo, v_telefono, v_ciudad, v_pais_id, v_mail, v_patologia_id, v_sub_patologia_id, v_os_id, c_usuario_id, c_usuario_id, @estado_id, v_sub_estado_id, NOW(), NOW(), 'SOL', v_crm_id);

  SELECT
    LAST_INSERT_ID() AS mensaje;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
