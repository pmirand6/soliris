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

-- Volcando estructura para procedimiento soliris.ST_DISABLE_OLD_DOC_PAC
DELIMITER //
CREATE PROCEDURE `ST_DISABLE_OLD_DOC_PAC`(IN `v_idPac` int,
IN `v_idTipoDoc` int)
    COMMENT 'Coloca el estado inactivo a los documentos de un paciente'
BEGIN

  DECLARE counter int;

  SET counter = (SELECT
      COUNT(*)
    FROM rel_paciente_documentos rel
      INNER JOIN documentos d
        ON d.documentos_tipo_id = v_idTipoDoc
    WHERE rel.paciente_id = v_idPac);

  IF (counter > 0) THEN

    UPDATE documentos
    INNER JOIN rel_paciente_documentos
      ON rel_paciente_documentos.documento_id = documentos.id
    INNER JOIN paciente
      ON rel_paciente_documentos.paciente_id = paciente.id
    INNER JOIN documentos_tipo
      ON documentos.documentos_tipo_id = documentos_tipo.id
    SET documentos.estado_id = 16
    WHERE paciente.id = v_idPac
    AND documentos_tipo.id = v_idTipoDoc;

  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
