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

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_MED
DELIMITER //
CREATE PROCEDURE `ST_LIST_DOCS_MED`(IN `v_idMedico` int)
    COMMENT 'Lista los documentos del medico'
BEGIN

  SELECT
    d.valor AS documento,
    dt.tipo,
    m.valor AS estado,
    DATE_FORMAT(d.fecha_documento, '%d/%m/%Y') AS fecha_documento
  FROM documentos AS d
    LEFT OUTER JOIN documentos_tipo AS dt
      ON d.documentos_tipo_id = dt.id
    INNER JOIN rel_medico_documentos rel
      ON d.id = rel.documento_id
    INNER JOIN maestro_estado m
      ON m.id = d.estado_id
  WHERE rel.medico_id = v_idMedico
  ORDER BY d.id DESC;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
