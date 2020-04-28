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

-- Volcando estructura para procedimiento soliris.ST_CONTROL_MODIFICAR_VENTA
DELIMITER //
CREATE PROCEDURE `ST_CONTROL_MODIFICAR_VENTA`(IN `v_idVenta` int
,
IN `v_userName` varchar(50))
    COMMENT 'DEVUELVE EL ESTADO DE LA VENTA, SI ESTA SIENDO MODIFICADA O TOMADA POR NP'
BEGIN

  -- verificar si es el mismo usuario actualizar fecha y no lockear al usuario

  -- CONTROLA:
  -- SI LA VENTA TIENE UNA NP ASOCIADA
  -- SI LA VENTA ESTA SIENDO MODIFICADA
  -- 	- SI LA VENTA ESTA MODIFICADA DEVUELVE EL USUARIO QUE TIENE BLOQUEADO EL REGISTRO
  SET @countLockeo := (SELECT
      COUNT(*)
    FROM maestro_ventas_lockeo mvl
    WHERE mvl.venta_id = v_idVenta);
  SET @userLockeo := (SELECT
      mvl.usuario_id
    FROM maestro_ventas_lockeo mvl
    WHERE mvl.venta_id = v_idVenta);
  SET @userId := (SELECT
      FU_GET_ID_USUARIO(v_userName));
  /** Verifico que el registro de venta no este en NP **/
  SET @countNp := (SELECT
      COUNT(*)
    FROM maestro_ventas mv
    WHERE mv.id = v_idVenta
    AND mv.estado_id = 23);

  IF (@countNp > 0) THEN
    SELECT
      (SELECT
          'Venta con NP Asociada!') AS title,
      (SELECT
          CONCAT('La venta <b>', v_idVenta, '</b> esta asociado con la NP <b>', mv.nbr, '</b>. <br/> No se podrán realizar modificaciones al registro')) AS text
    FROM maestro_ventas mv
    WHERE mv.id = v_idVenta;
  ELSE
    IF (@userLockeo = @userId) THEN
      DELETE
        FROM maestro_ventas_lockeo
      WHERE venta_id = v_idVenta
        AND usuario_id = @userLockeo;
      INSERT INTO maestro_ventas_lockeo
      SET venta_id = v_idVenta,
          usuario_id = (SELECT
              FU_GET_ID_USUARIO(v_userName));
      SELECT
        TRUE AS mensaje;
    ELSE
      IF (@countLockeo > 0) THEN
        SELECT
          (SELECT
              'Registro Bloqueado!') AS title,
          (SELECT
              CONCAT('El registro esta siendo modificado por el usuario: <b>', UPPER((SELECT
                  FU_GET_USERNAME_USUARIO(m.usuario_id))), '</b>.<br/>  No se podrán realizar modificaciones al registro')) AS text
        FROM maestro_ventas_lockeo m
        WHERE venta_id = v_idVenta;
      END IF;
    END IF;
  END IF;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
