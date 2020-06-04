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

-- Volcando estructura para procedimiento soliris.ST_LIST_ALL_DOCS_PAC
DELIMITER //
CREATE PROCEDURE `ST_LIST_ALL_DOCS_PAC`(IN `v_idPac` int)
    COMMENT 'Lista los documentos del paciente'
BEGIN

  SELECT
    dt.tipo,
    d.valor AS documento,
    DATE_FORMAT(d.fecha_documento, '%d/%m/%Y') AS fecha_doc,
    m.valor AS estado
  FROM documentos AS d
    LEFT OUTER JOIN documentos_tipo AS dt
      ON d.documentos_tipo_id = dt.id
    INNER JOIN rel_paciente_documentos rel
      ON d.id = rel.documento_id
    INNER JOIN maestro_estado m
      ON m.id = d.estado_id
  WHERE rel.paciente_id = v_idPac
  GROUP BY d.valor,
           dt.tipo,
           d.id
  ORDER BY d.id DESC;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
