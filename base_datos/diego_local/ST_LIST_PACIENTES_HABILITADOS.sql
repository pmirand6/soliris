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

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_HABILITADOS
DELIMITER //
CREATE PROCEDURE `ST_LIST_PACIENTES_HABILITADOS`(IN `v_filtro` int,
IN `v_ini` varchar(50))
    COMMENT 'Lista los pacientes habilitados para la venta'
BEGIN


  DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
  SET @err = 0;
  SET @table_name = 'TEMPORARY_LIST_PACIENTES_HABILITADOS';
  SET @sql_query = CONCAT('SELECT NULL FROM ', @table_name);
  PREPARE stmt1 FROM @sql_query;
  IF (@err = 0) THEN
    DROP TABLE TEMPORARY_LIST_PACIENTES_HABILITADOS;
    DEALLOCATE PREPARE stmt1;
  END IF;



  CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES_HABILITADOS (SELECT
      (SELECT
          mv.id
        FROM maestro_ventas mv
        WHERE mv.paciente_id = P.id
        AND mv.estado_id IN (22, 23)
        AND mv.venta_tipo_id IN (1, 2)
        ORDER BY mv.id DESC LIMIT 0, 1) AS u_idVenta,
      P.id AS idPac,
      (SELECT
          me.valor
        FROM maestro_estado me
        WHERE me.id = P.estado_id) AS estadoPac,
      CONCAT(P.apellido, ', ', P.nombre) AS name,
      P.sexo AS sexo,
      P.c_gestar AS cgestar,
      DATE_FORMAT(P.fecha_nac, '%d/%m/%Y') AS fnac,
      (SELECT
          pat.patologia_nombre
        FROM patologia pat
        WHERE pat.id = P.patologia_id) AS patologia,
      (SELECT
          spat.sub_patologia_nombre
        FROM sub_patologia spat
        WHERE spat.id = P.sub_patologia_id) AS subPatologia,
      (SELECT
          DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) AS fecha_con,
      IFNULL(P.mail, '-') AS email,
      IFNULL(P.telefono, '-') AS telefono,
      IFNULL(P.notas, 'Sin Notas') AS notas,
      (SELECT
          DATE_FORMAT(mv.fecha_venta, '%d/%m/%Y')
        FROM maestro_ventas mv
        WHERE mv.paciente_id = P.id
        AND mv.estado_id IN (22, 23)
        AND mv.venta_tipo_id IN (1, 2)
        ORDER BY mv.id DESC LIMIT 0, 1) AS u_fecha_venta,
      (SELECT
          me.valor
        FROM maestro_estado me
          LEFT JOIN maestro_ventas mv
            ON mv.estado_id = me.id
        WHERE mv.paciente_id = P.id
        AND mv.estado_id IN (22, 23)
        AND mv.venta_tipo_id IN (1, 2)
        ORDER BY mv.id DESC LIMIT 0, 1) AS u_venta_estado,
      (SELECT
          me.id
        FROM maestro_estado me
          LEFT JOIN maestro_ventas mv
            ON mv.estado_id = me.id
        WHERE mv.paciente_id = P.id
        AND mv.estado_id IN (22, 23)
        AND mv.venta_tipo_id IN (1, 2)
        ORDER BY mv.id DESC LIMIT 0, 1) AS u_venta_estado_id,
      (SELECT
          me.valor
        FROM maestro_estado me
        WHERE P.sub_estado_id = me.id) AS sub_estado
    FROM paciente AS P
    /*	  			LEFT JOIN maestro_ventas mv ON mv.paciente_id = P.id
    	  			LEFT JOIN maestro_estado mev ON mev.id = mv.estado_id
    	  			LEFT JOIN maestro_estado mep ON mep.id = P.estado_id*/
    WHERE P.estado_id IN (11) -- Se verifica el estado 11 = Aprobado 
    AND
    P.sub_estado_id IN (8) -- Se verifica el sub estado 8 = Activo );
    GROUP BY P.id);

  IF (v_filtro = 0) THEN
    SELECT
      *
    FROM TEMPORARY_LIST_PACIENTES_HABILITADOS;
  ELSE
    SELECT
      *
    FROM TEMPORARY_LIST_PACIENTES_HABILITADOS
    WHERE LEFT(name, 1) = v_ini;
  END IF;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
