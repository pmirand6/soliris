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

-- Volcando estructura para procedimiento soliris.ST_GET_ACCESS
DELIMITER //
CREATE PROCEDURE `ST_GET_ACCESS`(IN `v_pagina` varchar(50),
IN `v_grupo` varchar(50))
    COMMENT 'Detecta si el rol del usuario tiene permisos a la pagina solicitada'
BEGIN

  DECLARE pagina_id int;
  DECLARE grupo_id int;


  SET pagina_id = (SELECT
      id
    FROM soliris_seguridad s
    WHERE s.pagina = v_pagina);
  SET grupo_id = (SELECT
      id
    FROM rol r
    WHERE r.nombre = v_grupo);

  SELECT
    COUNT(*)
  FROM rel_seguridad_rol rsr
  WHERE rsr.seguridad_id = pagina_id
  AND rsr.rol_id = grupo_id;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
