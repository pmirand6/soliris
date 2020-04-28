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

-- Volcando estructura para procedimiento soliris.ST_MODIFICAR_VENTA
DELIMITER //
CREATE PROCEDURE `ST_MODIFICAR_VENTA`(IN `v_idVenta` int,
IN `v_idMedico` int,
IN `v_idProducto` int,
IN `v_idPresentacion` int,
IN `v_cantUnidades` int,
IN `v_idInstitucion` int,
IN `v_idCanal` int,
IN `v_usuario` varchar(255))
    COMMENT 'Modifica una venta que no este en estado NP'
BEGIN

  SET @p_idVenta = v_idVenta;

  SET @user_mod_id := (SELECT
      FU_GET_ID_USUARIO(v_usuario));
  SET @estado_venta := (SELECT
      mv.estado_id
    FROM maestro_ventas mv
    WHERE mv.id = v_idVenta);

  IF (@estado_venta = 23) THEN
    SELECT
      "La venta no puede ser modificada porque esta asociada con una NP" AS mensaje;
  ELSE
    UPDATE maestro_ventas mv
    SET mv.medico_id = v_idMedico,
        mv.producto_id = v_idProducto,
        mv.presentacion_id = v_idPresentacion,
        mv.unidades = v_cantUnidades,
        mv.institucion_id = v_idInstitucion,
        mv.canal_id = v_idCanal,
        mv.fecha_mod = NOW(),
        mv.usuario_mod_id = @user_mod_id
    WHERE mv.id = v_idVenta;
    SELECT
      TRUE AS mensaje;

    -- Libero el lockeo de la venta
    SET @release_lockeo = CONCAT("CALL ST_DELETE_CONTROL_MODIFICAR_VENTA(?,?,?)");
    PREPARE stmt_lockeo FROM @release_lockeo;
    EXECUTE stmt_lockeo USING @p_idVenta, @user_mod_id, @estado_venta;
    DEALLOCATE PREPARE stmt_lockeo;

  END IF;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
