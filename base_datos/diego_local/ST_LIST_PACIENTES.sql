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

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES
DELIMITER //
CREATE PROCEDURE `ST_LIST_PACIENTES`(IN `v_filtro` int,
IN `v_ini` varchar(1))
    COMMENT 'Crea la tabla temporal del listado de pacientes que luego puede ser filtrada'
BEGIN




  DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
  SET @err = 0;
  SET @table_name = 'TEMPORARY_LIST_PACIENTES';
  SET @sql_query = CONCAT('SELECT NULL FROM ', @table_name);
  PREPARE stmt1 FROM @sql_query;
  IF (@err = 0) THEN
    DROP TABLE TEMPORARY_LIST_PACIENTES;
    DEALLOCATE PREPARE stmt1;
  END IF;
  SET @p_u_venta := (SELECT
      DATE_FORMAT(mv.fecha_venta, '%d/%m/%Y') AS uventa
    FROM maestro_ventas mv
    WHERE mv.paciente_id = 1
    ORDER BY mv.id DESC LIMIT 0, 1);
  CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES (SELECT
      P.id AS id,
      CONCAT(P.apellido, ', ', P.nombre) AS name,
      P.sexo AS sexo,
      P.c_gestar AS cgestar,
      DATE_FORMAT(P.fecha_nac, '%d/%m/%Y') AS fnac,
      (SELECT
          FU_GET_PACIENTE_EDAD(P.id)) AS edad,
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
          me.valor
        FROM maestro_estado me
        WHERE P.estado_id = me.id) AS estado,
      (SELECT
          DATE_FORMAT(mv.fecha_venta, '%d/%m/%Y') AS uventa
        FROM maestro_ventas mv
        WHERE mv.paciente_id = P.id
        ORDER BY mv.id DESC LIMIT 0, 1) AS uventa,
      (SELECT
          me.valor
        FROM maestro_estado me
        WHERE P.sub_estado_id = me.id) AS sub_estado
    FROM paciente AS P
  /*LEFT JOIN 
		vw_lastsale_rm AS vRM 
	ON (P.id = vRM.pid)*/);

  IF (v_filtro = 0) THEN
    SELECT
      *
    FROM TEMPORARY_LIST_PACIENTES;
  ELSE
    SELECT
      *
    FROM TEMPORARY_LIST_PACIENTES
    WHERE LEFT(name, 1) = v_ini;
  END IF;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
