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

-- Volcando estructura para función soliris.FU_SHOW_FECHA_CONS_PAC
DELIMITER //
CREATE FUNCTION `FU_SHOW_FECHA_CONS_PAC`(`v_id` int) RETURNS date
    COMMENT 'Devuelve la fecha del consentimiento del paciente'
BEGIN

  RETURN (SELECT
      --	date_format(d.fecha_documento, '%d/%m/%Y') as fconsen
      d.fecha_documento
    FROM rel_paciente_documentos r
      INNER JOIN paciente p
        ON r.paciente_id = v_id
      INNER JOIN documentos d
        ON r.documento_id = d.id
    WHERE d.documentos_tipo_id = 1 -- ID del consentimiento de vacunacion de la tabla documentos_id
    AND
    d.estado_id = 15
    ORDER BY r.id
    DESC LIMIT 0, 1); -- estado activo del documento en el maestro de estados


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
