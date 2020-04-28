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

-- Volcando estructura para procedimiento soliris.ST_SHOW_VENTAS_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_SHOW_VENTAS_PACIENTE`(IN `v_idPac` int)
    COMMENT 'Devuelve las ventas relacionadas con el paciente'
BEGIN

  SELECT
    mv.id,
    CONCAT(med.apellido, ',', med.nombre) AS medico_nombre,
    (SELECT
        FU_GET_PACIENTE_EDAD(p.id)) AS edad,
    d.valor AS presentacion,
    mv.unidades,
    DATE_FORMAT(mv.fecha_venta, '%d/%m/%Y') AS fecha_venta,
    (SELECT
        DATE_FORMAT(`FU_GET_FECHA_RECETA`(mv.id), '%d/%m/%Y')) AS fecha_receta,
    c.canal AS canal,
    i.nombre AS institucion,
    apm.nombre_completo AS apm,
    me.valor AS estado,
    (SELECT
        `FU_GET_DOCUMENTS_VENTA`(mv.id)) AS documentos
  FROM maestro_ventas mv
    INNER JOIN paciente p
      ON p.id = mv.paciente_id
    INNER JOIN rel_venta_documentos rvd
      ON rvd.venta_id = mv.id
    INNER JOIN documentos doc
      ON doc.id = rvd.documento_id
    INNER JOIN medico med
      ON med.id = mv.medico_id
    LEFT JOIN apm
      ON apm.id = med.apm_id
    INNER JOIN presentacion d
      ON d.id = mv.presentacion_id
    INNER JOIN canales c
      ON c.id = mv.canal_id
    INNER JOIN institucion i
      ON i.id = mv.institucion_id
    INNER JOIN maestro_estado me
      ON me.id = mv.estado_id
  WHERE p.id = v_idPac
  GROUP BY mv.id
  ORDER BY mv.id DESC


  ;




END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
