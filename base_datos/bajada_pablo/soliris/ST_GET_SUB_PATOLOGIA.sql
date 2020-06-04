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

-- Volcando estructura para procedimiento soliris.ST_GET_SUB_PATOLOGIA
DELIMITER //
CREATE PROCEDURE `ST_GET_SUB_PATOLOGIA`(IN `v_patologia_id` int)
    COMMENT 'Obtiene las subpatologias en base a la patologia pasada por parametro'
BEGIN

  CALL `ST_GET_MAESTRO_ESTADO_ACTIVO`('patologia', @id_estado);

  SELECT
    sp.id,
    sp.sub_patologia_nombre
  FROM sub_patologia sp
    INNER JOIN rel_patologia_sub_patologia rp
      ON sp.id = rp.sub_patologia_id
    INNER JOIN patologia p
      ON rp.patologia_id = p.id
  WHERE p.id = v_patologia_id
  AND p.estado_id = (SELECT
      @id_estado);



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
