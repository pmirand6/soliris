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
    mvt.valor AS tipo_venta,
    mv.codigo_venta AS cod_venta,
    mv.nbr AS nbr,
    (SELECT
        FU_GET_USERNAME_USUARIO(mv.usuario_id)) AS usuario_creador,
    me.valor AS estado

  FROM maestro_ventas mv
    LEFT JOIN paciente p
      ON p.id = mv.paciente_id
    INNER JOIN maestro_ventas_tipo mvt
      ON mvt.id = mv.venta_tipo_id
    LEFT JOIN rel_venta_documentos rvd
      ON rvd.venta_id = mv.id
    LEFT JOIN documentos doc
      ON doc.id = rvd.documento_id
    LEFT JOIN medico med
      ON med.id = mv.medico_id
    LEFT JOIN apm
      ON apm.id = med.apm_id
    LEFT JOIN presentacion d
      ON d.id = mv.presentacion_id
    LEFT JOIN canales c
      ON c.id = mv.canal_id
    LEFT JOIN institucion i
      ON i.id = mv.institucion_id
    LEFT JOIN maestro_estado me
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
