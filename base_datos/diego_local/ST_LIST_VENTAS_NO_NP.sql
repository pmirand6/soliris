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

-- Volcando estructura para procedimiento soliris.ST_LIST_VENTAS_NO_NP
DELIMITER //
CREATE PROCEDURE `ST_LIST_VENTAS_NO_NP`()
BEGIN
  SELECT
    m.id AS id_venta,
    P.nombre_completo AS name,
    P.sexo AS sexo,
    IF(P.c_gestar, P.c_gestar, 'NO') AS cgestar,
    m.edad AS edad,

    (SELECT
        pat.patologia_nombre
      FROM patologia pat
      WHERE pat.id = P.patologia_id) AS patologia,


    m.fecha_venta AS venta,
    (SELECT
        valor
      FROM maestro_ventas_tipo
      WHERE id = m.venta_tipo_id) AS tventa,
    (SELECT
        me.valor
      FROM maestro_estado me
      WHERE m.estado_id = me.id) AS estado,
      
      m.codigo_venta AS cod_venta


  FROM paciente AS P
    INNER JOIN maestro_ventas m
      ON m.paciente_id = P.id
  WHERE (m.estado_id = 22 OR DATE(m.fecha_venta) = DATE(NOW()))
  GROUP BY P.id,
           m.id
  HAVING COUNT(*) > 0;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
