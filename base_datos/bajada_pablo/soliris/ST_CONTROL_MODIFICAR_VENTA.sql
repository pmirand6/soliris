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

-- Volcando estructura para procedimiento soliris.ST_CONTROL_MODIFICAR_VENTA
DELIMITER //
CREATE PROCEDURE `ST_CONTROL_MODIFICAR_VENTA`(IN `v_idVenta` int,
IN `v_userName` varchar(50))
    COMMENT 'DEVUELVE EL ESTADO DE LA VENTA, SI ESTA SIENDO MODIFICADA O TOMADA POR NP'
sp:
  BEGIN

    -- verificar si es el mismo usuario actualizar fecha y no lockear al usuario

    -- CONTROLA:
    -- SI LA VENTA TIENE UNA NP ASOCIADA
    -- SI LA VENTA ESTA SIENDO MODIFICADA
    -- 	- SI LA VENTA ESTA MODIFICADA DEVUELVE EL USUARIO QUE TIENE BLOQUEADO EL REGISTRO

    /** SETEO DE VARIABLES **/

    -- CUENTO SI LA VENTA ESTA BLOQUEADA
    SET @countLockeo := (SELECT
        COUNT(*)
      FROM maestro_ventas_lockeo mvl
      WHERE mvl.venta_id = v_idVenta);

    -- SI LA VENTA ESTA LOCKEADA, SELECCIONO EL USUARIO QUE ESTA BLOQUEANDO LA VENTA 
    IF (@countLockeo > 0) THEN
      SET @userLockeo := (SELECT
          mvl.usuario_id
        FROM maestro_ventas_lockeo mvl
        WHERE mvl.venta_id = v_idVenta);
    END IF;

    -- OBTENGO EL ID DEL USUARIO QUE INTENTA MODIFICAR LA VENTA  
    SET @userId := (SELECT
        FU_GET_ID_USUARIO(v_userName));


    /** VERIFICO EL ESTADO DE LA VENTA **/

    /** Verifico que el registro de venta no este en NP **/
    SET @estado_venta_id := (SELECT
        mv.estado_id
      FROM maestro_ventas mv
      WHERE mv.id = v_idVenta);

    /** FIN SETEO DE VARIABLES **/



    -- PRIMERO FILTRO DE VENTA EN NP
    IF (@estado_venta_id = 23) THEN
      SELECT
        (SELECT
            'Venta con NP Asociada!') AS title,
        (SELECT
            CONCAT('La venta <b>', v_idVenta, '</b> esta asociado con la NP <b>', mv.nbr, '</b>. <br/> No se podrán realizar modificaciones al registro')) AS text,
        (SELECT @estado_venta_id) AS mensaje
      FROM maestro_ventas mv
      WHERE mv.id = v_idVenta;
      -- SE SALE DEL STORE
      LEAVE sp;
    END IF;


    -- SEGUNDO FILTRO DE VENTA ELIMINADA
    IF (@estado_venta_id = 14) THEN
      SELECT
        (SELECT
            'Venta Cancelada!') AS title,
        (SELECT
            CONCAT('La venta <b>', v_idVenta, '</b> esta cancelada. <br> No se podrán realizar modificaciones al registro')) AS text,
        (SELECT @estado_venta_id) AS mensaje
      FROM maestro_ventas mv
      WHERE mv.id = v_idVenta;
      -- SE SALE DEL STORE
      LEAVE sp;
    END IF;

    -- SI LA VENTA ESTA BLOQUEADO COMIENZO 
    -- LOS FILTROS
    IF (@countLockeo > 0) THEN

      -- SI LA VENTA ESTA BLOQUEADA PERO 
      -- EL USUARIO QUE ESTA INTENTANDO MODIFICARLA
      -- ES EL MISMO, BORRO EL LOCKEO Y LO ACTUALIZO

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
        -- SE SALE DEL STORE
        LEAVE sp;
      ELSE
        -- SI EL USUARIO ES DIFERENTE 
        -- INDICO QUE LA VENTA ESTA BLOQUEADA PARA 
        -- LA EDICIÓN
        SELECT
          (SELECT
              'Registro Bloqueado!') AS title,
          (SELECT
              CONCAT('El registro esta siendo modificado por el usuario: <b>', UPPER((SELECT
                  FU_GET_USERNAME_USUARIO(m.usuario_id))), '</b>.<br/>  No se podrán realizar modificaciones al registro')) AS text,
          (SELECT @estado_venta_id) AS mensaje
        FROM maestro_ventas_lockeo m
        WHERE venta_id = v_idVenta;
        -- SE SALE DEL STORE
        LEAVE sp;
      END IF;
    END IF;

    -- SINO SE CUMPLE NINGUNA DE LAS CONDICIONES SE INSERTA EL BLOQUEO Y SE DEVUELVE EL MENSAJE
    INSERT INTO maestro_ventas_lockeo
    SET venta_id = v_idVenta,
        usuario_id = (SELECT
            FU_GET_ID_USUARIO(v_userName));
    SELECT
      TRUE AS mensaje;


  END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
