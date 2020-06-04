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

-- Volcando estructura para procedimiento soliris.ST_LIST_SEGURIDAD
DELIMITER //
CREATE PROCEDURE `ST_LIST_SEGURIDAD`()
    COMMENT 'LISTA LAS PAGINAS Y SU RELACION CON LOS ROLES'
BEGIN

  SELECT
    s.id,
    s.pagina,
    s.descripcion,
    GROUP_CONCAT(r.nombre SEPARATOR ',') roles,
    GROUP_CONCAT(r.id SEPARATOR ',') roles_id
  FROM soliris_seguridad s
    LEFT JOIN rel_seguridad_rol rel
      ON s.id = rel.seguridad_id
    LEFT JOIN rol r
      ON rel.rol_id = r.id
  -- WHERE rel.estado_id = 32 -- Verifico que este activa la relacion con la pagina
  GROUP BY s.id,
           s.pagina;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
