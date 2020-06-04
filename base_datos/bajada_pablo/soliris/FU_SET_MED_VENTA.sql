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

-- Volcando estructura para procedimiento soliris.FU_SET_MED_VENTA
DELIMITER //
CREATE PROCEDURE `FU_SET_MED_VENTA`(IN `v_idVenta` int)
    COMMENT 'Actualiza el registro de venta con el nombre del medico correcto de meditec'
BEGIN


  UPDATE soliris_maestro im
  SET medico = (SELECT
      a.id
    FROM soliris_maestro AS imn
      INNER JOIN medicos AS m
        ON m.id = imn.id_medico
      INNER JOIN (SELECT
          tm.id,
          tm.nombre,
          tm.apellido
        FROM tmp_med tm) AS a
        ON m.id_meditec = a.id)
  WHERE im.id = v_idVenta;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
