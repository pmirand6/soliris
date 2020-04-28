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

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_PAC
DELIMITER //
CREATE PROCEDURE `ST_LIST_DOCS_PAC`(IN `v_id` int)
    COMMENT 'Lista los documentos del paciente'
BEGIN

  -- SELECT d.valor AS documento, dt.tipo FROM rel_paciente_documentos rel
  -- INNER JOIN paciente p ON rel.paciente_id = p.id
  -- INNER JOIN documentos d ON rel.documento_id = d.id
  -- INNER JOIN documentos_tipo dt ON dt.id = d.documentos_tipo_id
  -- WHERE dt.referencia = 'Paciente' and
  -- p.id = 4
  -- GROUP BY dt.tipo ORDER BY rel.id DESC LIMIT 0,2;


  SELECT
    d.valor AS documento,
    dt.tipo,
    MAX(d.id)
  FROM documentos AS d
    LEFT OUTER JOIN documentos_tipo AS dt
      ON d.documentos_tipo_id = dt.id
    INNER JOIN rel_paciente_documentos rel
      ON d.id = rel.documento_id
  WHERE rel.paciente_id = v_id
  GROUP BY d.valor,
           dt.tipo
  ORDER BY d.id DESC LIMIT 0, 2;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
