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

-- Volcando estructura para función soliris.FU_VAL_UNI
DELIMITER //
CREATE FUNCTION `FU_VAL_UNI`(`v_id_pac` int,
`v_diff_u_v` int,
`v_id_mst` int) RETURNS int(11)
BEGIN

  DECLARE cant_hist int;
  DECLARE cant_venta int;
  DECLARE res int;

  SET cant_hist = (SELECT
      IFNULL((SELECT
          SUM(unidades) AS CANT_uni
        FROM soliris_maestro AS RM
        WHERE RM.nombre = v_id_pac
        AND date (RM.fecha_venta) BETWEEN DATE_SUB(date (NOW()), INTERVAL v_diff_u_v DAY) AND date (NOW())
        AND RM.estado IN ('NP', 'FV')
        AND RM.id NOT IN (v_id_mst)), 0));

  SET cant_venta = (SELECT
      unidades
    FROM soliris_maestro
    WHERE id = v_id_mst);

  SET res = (SELECT
      cant_hist + cant_venta);

  RETURN res;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
