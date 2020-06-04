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

-- Volcando estructura para procedimiento soliris.ST_SET_SEGURIDAD
DELIMITER //
CREATE PROCEDURE `ST_SET_SEGURIDAD`(IN `v_idPagina` int,
IN `v_grupo` varchar(50),
IN `v_estado` int,
IN `v_usuario` varchar(50))
    COMMENT 'Establece el permiso en una pagina'
BEGIN

  -- Consulta del id del rol
  SET @rol_id := (SELECT
      r.id
    FROM rol r
    WHERE r.nombre = v_grupo);

  -- Consulta del id del usuario que esta haciendo la accion
  SET @usuario_id := (SELECT
      FU_GET_ID_USUARIO(v_usuario));

  -- Establezo el id del estado para la tabla de relacion
  IF (v_estado = 1) THEN
    SET @estado_id := (SELECT
        m.id
      FROM maestro_estado m
      WHERE m.referencia = 'rel_seguridad_rol'
      AND m.valor = 'Activo');
  ELSE
    SET @estado_id := (SELECT
        m.id
      FROM maestro_estado m
      WHERE m.referencia = 'rel_seguridad_rol'
      AND m.valor = 'Inactivo');
  END IF;

  -- Cuento si ya existe la relacion entre grupo y la pagina

  SET @COUNT := (SELECT
      COUNT(*)
    FROM rel_seguridad_rol rel
    WHERE rel.seguridad_id = v_idPagina
    AND rel.rol_id = @rol_id);


  IF (@COUNT > 0) THEN
    -- Actualizo el estado del rol en esa pagina	
    UPDATE rel_seguridad_rol rel
    SET rel.seguridad_id = v_idPagina,
        rel.rol_id = @rol_id,
        rel.estado_id = @estado_id
    WHERE rel.rol_id = @rol_id;
  ELSE
    -- Inserto el registro en la base
    INSERT INTO rel_seguridad_rol (seguridad_id, rol_id, estado_id, usuario_stamp_id, fecha)
      VALUES (v_idPagina, @rol_id, @estado_id, @usuario_id, NOW());

  END IF;





END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
