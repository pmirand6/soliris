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

-- Volcando estructura para procedimiento soliris.ST_DELETE_CONTROL_MODIFICAR_VENTA
DELIMITER //
CREATE PROCEDURE `ST_DELETE_CONTROL_MODIFICAR_VENTA`(IN `v_idVenta` int,
IN `v_idUsuario` int,
IN `v_idEstado` int)
    COMMENT 'borrar el registro asociado con el lockeo de la modificacion de la venta'
BEGIN

  IF (v_idEstado <> 23) THEN

    DELETE
      FROM maestro_ventas_lockeo
    WHERE venta_id = v_idVenta
      AND usuario_id;

  END IF;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
