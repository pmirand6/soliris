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

-- Volcando estructura para procedimiento soliris.ST_GET_PAC_ULTIMA_VENTA
DELIMITER //
CREATE PROCEDURE `ST_GET_PAC_ULTIMA_VENTA`(IN `v_idPac` int
,
OUT `o_fecha_venta` date,
OUT `o_estado_id` int,
OUT `o_venta_id` int)
    COMMENT 'Obtiene la ultima fecha y el estado de la venta con estado NP Generada o Venta Generada'
BEGIN
  -- SE OBTIENE LA FECHA DE VENTA DE LA ULTIMA VENTA EN ESTADO NP O VENTA GENERADA 
  -- ADEMAS SE FILTRA POR EL TIPO DE VENTA EN RI O FU

  SELECT
    m.fecha_venta,
    m.estado_id,
    m.id
  FROM maestro_ventas m
  WHERE m.paciente_id = v_idPac
  AND m.estado_id IN (22, 23)
  AND m.venta_tipo_id IN (1, 2)
  ORDER BY m.id DESC LIMIT 0, 1;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
