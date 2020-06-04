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

-- Volcando estructura para procedimiento soliris.ST_CONTROL_RECETA_VENTA
DELIMITER //
CREATE PROCEDURE `ST_CONTROL_RECETA_VENTA`(IN `v_fecha_receta` date,
IN `v_idPaciente` int)
    COMMENT 'Controla que la fecha de la receta no exista'
BEGIN


  SET @cuenta_fecha = (SELECT
      COUNT(mv.id)
    FROM documentos d
      LEFT JOIN rel_venta_documentos rvd
        ON rvd.documento_id = d.id
      LEFT JOIN maestro_ventas mv
        ON mv.id = rvd.venta_id
    WHERE d.documentos_tipo_id = 3
    AND d.estado_id = 15
    AND mv.paciente_id = v_idPaciente
    AND d.fecha_documento = v_fecha_receta
    AND mv.estado_id = 23);

  IF (@cuenta_fecha <> 0) THEN

    SELECT
      mv.id,
      d.fecha_documento,
      d.valor INTO @id_venta, @fecha_doc_venta, @nombre_doc
    FROM documentos d
      LEFT JOIN rel_venta_documentos rvd
        ON rvd.documento_id = d.id
      LEFT JOIN maestro_ventas mv
        ON mv.id = rvd.venta_id
    WHERE d.documentos_tipo_id = 3
    AND d.estado_id = 15
    AND mv.paciente_id = v_idPaciente
    AND d.fecha_documento = v_fecha_receta
    AND mv.estado_id = 23;


    SELECT
      @fecha_doc_venta AS fecha_doc,
      @nombre_doc AS nombre_doc,
      CONCAT('/documentacion/venta/', v_idPaciente, '/', @id_venta, '/', @nombre_doc) AS url_doc,
      TRUE AS mensaje;
  ELSE
    SELECT
      FALSE AS mensaje;
  END IF;









END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
