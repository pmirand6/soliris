-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_PAC
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_DOCS_PAC`(
	IN `v_id` INT
)
    COMMENT 'Lista los documentos del paciente'
BEGIN

SELECT d.valor AS documento, dt.tipo FROM rel_paciente_documentos rel 
INNER JOIN paciente p ON rel.paciente_id = p.id
INNER JOIN documentos d ON rel.documento_id = d.id
INNER JOIN documentos_tipo dt ON dt.id = d.tipo_id
WHERE dt.referencia = 'Paciente' and
p.id = v_id
LIMIT 0,1;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
