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

-- Volcando estructura para procedimiento soliris.ST_CANT_TIPO_VENTAS
DELIMITER //
CREATE PROCEDURE `ST_CANT_TIPO_VENTAS`(IN `v_fecha` varchar(50))
    COMMENT 'Devuelve la cantida de ventas RI y FU realizadas en una fecha particular'
BEGIN

  SELECT
    COUNT(m.venta_tipo_id) AS cantTipo,
    mt.valor
  FROM maestro_ventas m
    INNER JOIN maestro_ventas_tipo mt
      ON mt.id = m.venta_tipo_id
  WHERE DATE_FORMAT(m.fecha_venta, '%Y-%m') = v_fecha
  AND m.estado_id IN (23)
  GROUP BY m.venta_tipo_id;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
