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

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_NO_APROBADOS
DELIMITER //
CREATE PROCEDURE `ST_LIST_PACIENTES_NO_APROBADOS`()
BEGIN


  DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;

  SET @err = 0;
  SET @table_name = 'TEMPORARY_LIST_PACIENTES_NO_APROBADOS';
  SET @sql_query = CONCAT('SELECT NULL FROM ', @table_name);
  PREPARE stmt1 FROM @sql_query;

  IF (@err = 0) THEN
    DROP TABLE TEMPORARY_LIST_PACIENTES_NO_APROBADOS;
    DEALLOCATE PREPARE stmt1;
  END IF;

  CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES_NO_APROBADOS (SELECT
      P.id AS id,
      CONCAT(P.apellido, ', ', P.nombre) AS name,
      P.sexo AS sexo,
      P.c_gestar AS cgestar,
      DATE_FORMAT(P.fecha_nac, '%d/%m/%Y') AS fnac,
      P.patologia_id AS patologia,
      (SELECT
          patologia_nombre
        FROM patologia
        WHERE id = P.patologia_id) AS patologia_nombre,
      P.sub_patologia_id AS subPatologia,
      (SELECT
          sub_patologia_nombre
        FROM sub_patologia
        WHERE id = P.sub_patologia_id) AS sub_patologia_nombre,
      (SELECT
          DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(P.id), '%d/%m/%Y')) AS fecha_con,
      P.mail AS email,
      P.telefono AS telefono,
      P.notas AS notas,
      (SELECT
          me.valor
        FROM maestro_estado me
        WHERE P.estado_id = me.id) AS estado,
      P.estado_id AS estado_id,
      (SELECT
          me.valor
        FROM maestro_estado me
        WHERE P.sub_estado_id = me.id) AS sub_estado
    FROM paciente AS P
    WHERE P.estado_id NOT IN (11, 12));

  SELECT
    *
  FROM TEMPORARY_LIST_PACIENTES_NO_APROBADOS;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
