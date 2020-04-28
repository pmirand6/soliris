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

-- Volcando estructura para función soliris.FU_UP_CANAL
DELIMITER //
CREATE FUNCTION `FU_UP_CANAL`(`v_nombre` varchar(100),
`v_familia` varchar(45),
`v_direccion` longtext,
`v_mail` varchar(200),
`v_dir_tec` varchar(200),
`v_cont_venta` longtext,
`v_cont_otro` longtext,
`v_puntos_entrega` longtext,
`v_estado` varchar(45),
`v_usuario` varchar(45),
`v_id` int) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;
  UPDATE canales
  SET canal = v_nombre,
      familia = v_familia,
      direccion = v_direccion,
      mail = v_mail,
      dir_tec = v_dir_tec,
      cont_venta = v_cont_venta,
      cont_otro = v_cont_otro,
      puntos_entrega = v_puntos_entrega,
      estado = v_estado,
      usuario_audit = v_usuario
  WHERE id = v_id;

  IF (SELECT
        ROW_COUNT() > 0) THEN
    SET devolucion = v_id;
  ELSE
    SET devolucion = 'ERROR NO_UPDATE';
  END IF;

  RETURN devolucion;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
