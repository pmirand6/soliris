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

-- Volcando estructura para procedimiento soliris.ST_CANCELAR_VENTA
DELIMITER //
CREATE PROCEDURE `ST_CANCELAR_VENTA`(IN `v_id` int,
IN `v_usuario` varchar(50))
    COMMENT 'Cancela la venta '
BEGIN


  SET @usuario_id = (SELECT
      FU_GET_ID_USUARIO(v_usuario));

  -- CUENTO SI LA VENTA QUE SE ESTA INTENTANDO ELIMINAR SE ENCUENTRA EN NP
  SET @count_venta_np = (SELECT
      COUNT(*)
    FROM maestro_ventas m
    WHERE m.id = v_id
    AND m.estado_id = 23);


  IF (@count_venta_np = 0) THEN

    -- ACTUALIZO EL ESTADO DE LA VENTA A ELIMINADA Y EL TIPO DE VENTA SE LE COLOCA "CA" PARA LAS FUTURAS VENTAS NO TENER PROBLEMAS
    -- CON EL ESTABLECIMIENTO DEL ESTADO RI o FU
    UPDATE maestro_ventas m
    SET m.estado_id = 14,
        m.venta_tipo_id = 3,
        m.usuario_mod_id = @usuario_id,
        m.fecha_mod = NOW()
    WHERE m.id = v_id;

    -- ESTO SERA UTILIZADO POR EL AJX.MODIFICAR_VENTA.PHP PARA LA DEVOLUCION AL PLUGIN SWEETEALERT2
    SELECT
      'Venta Cancelada' AS title,
      'success' AS icon,
      'Se modificó el estado de la venta a Cancelada' AS text,
      TRUE AS mensaje;
    -- LIBERO LOS BLOQUEOS DE LA VENTA EN LA TABLA DE BLOQUEOS
    DELETE
      FROM maestro_ventas_lockeo
    WHERE venta_id = v_id;
  ELSE

    SELECT
      'Error' AS title,
      'error' AS icon,
      'La venta se encuentra con una NP asociada y no puede ser cancelada' AS text,

      FALSE AS mensaje;

  END IF;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
