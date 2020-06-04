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

-- Volcando estructura para procedimiento soliris.ST_SHOW_VENTA
DELIMITER //
CREATE PROCEDURE `ST_SHOW_VENTA`(IN `v_idVenta` int)
    COMMENT 'Muestra los datos de la venta'
BEGIN

  SET @fecha_otro := (SELECT
      DATE_FORMAT(doc.fecha_documento, '%d-%m-%Y')
    FROM documentos doc
      INNER JOIN rel_venta_documentos rvd
        ON rvd.documento_id = doc.id
      INNER JOIN maestro_ventas m
        ON m.id = rvd.venta_id
    WHERE doc.documentos_tipo_id = 4
    AND m.id = v_idVenta);

  SET @doc_receta = (SELECT
      d.valor
    FROM rel_venta_documentos rel
      INNER JOIN documentos d
        ON d.id = rel.documento_id
    WHERE rel.venta_id = v_idVenta
    AND d.documentos_tipo_id = 3
    AND d.estado_id = 15);

  SET @doc_otro = (SELECT
      d.valor
    FROM rel_venta_documentos rel
      INNER JOIN documentos d
        ON d.id = rel.documento_id
    WHERE rel.venta_id = v_idVenta
    AND d.documentos_tipo_id = 4
    AND d.estado_id = 15);



  SELECT
    mv.id,
    mv.codigo_venta,
    p.id AS paciente_id,
    p.nombre_completo AS paciente_nombre,
    prod.valor AS producto,
    med.id AS medico_id,
    CONCAT(med.apellido, ',', med.nombre) AS medico_nombre,
    (SELECT
        FU_GET_PACIENTE_EDAD(p.id)) AS edad,
    d.valor AS presentacion,
    d.id AS presentacion_id,
    mv.unidades,
    DATE_FORMAT(mv.fecha_venta, '%d-%m-%Y') AS fecha_venta,
    mv.fecha_venta AS f_venta,
    mv.fecha_mod AS f_mod,
    (SELECT
        FU_GET_USERNAME_USUARIO(mv.usuario_id)) AS usuario_creador,
    (SELECT
        FU_GET_USERNAME_USUARIO(mv.usuario_mod_id)) AS usuario_mod,
    DATE_FORMAT(mv.fecha_mod, '%d-%m-%Y') AS fecha_mod,
    @doc_receta AS doc_receta,
    (SELECT
        DATE_FORMAT(`FU_GET_FECHA_RECETA`(mv.id), '%d-%m-%Y')) AS fecha_receta,
    @doc_otro AS doc_otro,
    @fecha_otro AS fecha_otro,
    c.id AS canal_id,
    c.canal AS canal,
    i.id AS institucion_id,
    i.nombre AS institucion,
    me.valor AS estado,
    mv.nbr AS nbr,
    mv.oc AS orden_compra
  FROM maestro_ventas mv
    INNER JOIN paciente p
      ON p.id = mv.paciente_id
    INNER JOIN producto prod
      ON prod.id = mv.producto_id
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
  WHERE mv.id = v_idVenta;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
