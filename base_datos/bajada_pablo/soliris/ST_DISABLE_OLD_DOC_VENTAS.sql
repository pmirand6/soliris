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

-- Volcando estructura para procedimiento soliris.ST_DISABLE_OLD_DOC_VENTAS
DELIMITER //
CREATE PROCEDURE `ST_DISABLE_OLD_DOC_VENTAS`(IN v_idVta int, IN v_idTipoDoc int)
    COMMENT 'Coloca el estado inactivo a los documentos de un paciente'
BEGIN

  DECLARE counter int;

  SET counter = (SELECT
      COUNT(*)
    FROM rel_venta_documentos rel
      INNER JOIN documentos d
        ON rel.documento_id = d.id
    WHERE rel.venta_id = v_idVta
    AND d.documentos_tipo_id = v_idTipoDoc
    AND d.estado_id = 15);

  IF (counter > 0) THEN

    UPDATE documentos
    INNER JOIN rel_venta_documentos
      ON rel_venta_documentos.documento_id = documentos.id
    INNER JOIN maestro_ventas
      ON rel_venta_documentos.venta_id = maestro_ventas.id
    INNER JOIN documentos_tipo
      ON documentos.documentos_tipo_id = documentos_tipo.id
    SET documentos.estado_id = 16
    WHERE maestro_ventas.id = v_idVta
    AND documentos_tipo.id = v_idTipoDoc
    AND documentos.estado_id = 15;

  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
