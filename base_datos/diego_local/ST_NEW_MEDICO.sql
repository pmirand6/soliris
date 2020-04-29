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

-- Volcando estructura para procedimiento soliris.ST_NEW_MEDICO
DELIMITER //
CREATE PROCEDURE `ST_NEW_MEDICO`(
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
	IN `v_provincia` INT,
	IN `v_apm_id` int,
	IN `v_email` varchar(255),
	IN `v_usuario` varchar(50)
)
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Creacion de un nuevo medico'
BEGIN
  DECLARE id_1 int;
  DECLARE id_2 int;


  -- devolvemos el error que ya existe un medico con la combinacion de apellido, nombre, matricula_tipo y numero de matricula
  DECLARE EXIT HANDLER FOR 1062
  BEGIN

    SELECT
      CONCAT('ERROR: Ya existe el medico ', CONCAT(v_apellido, ', ', v_nombre), ' con el numero de matricula: ', v_matricula_numero) AS mensaje;
  END;

  SET @count_med = (SELECT
      COUNT(*)
    FROM medico m
    WHERE m.apellido = v_apellido
    AND m.nombre = v_nombre
    AND m.matricula_numero = v_matricula_numero);

  SET id_1 := (SELECT
      LAST_INSERT_ID());
  SET @usuario_id := (SELECT
      u.id
    FROM usuario u
    WHERE v_usuario = u.username);


  INSERT INTO medico (apellido,
  nombre,
  matricula_tipo_id,
  matricula_numero,
  fecha_alta,
  apm_id,
  c_atencion,
  lugar,
  mail,
  telefono,
  fax,
  domicilio,
  localidad,
  provincia_id,
  fecha_aprobado,
  usuario_creador,
  usuario_mod,
  estado_id)
    VALUES (v_apellido, v_nombre, v_matricula_tipo_id, v_matricula_numero, NOW(), v_apm_id, v_c_atencion, v_lugar, v_email, v_telefono, v_fax, v_domicilio, v_localidad,v_provincia, NOW(), @usuario_id, @usuario_id, 30);


  SET id_2 := (SELECT
      LAST_INSERT_ID());

  IF (id_1 <> id_2) THEN
    SELECT
      id_2 AS mensaje;
  END IF;

  SELECT
    'ERROR NO_INSERT' AS mensaje;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
