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

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES_CON_VENTAS
DELIMITER //
CREATE PROCEDURE `ST_LIST_PACIENTES_CON_VENTAS`()
    COMMENT 'Lista los datos de los pacientes con ventas realizadas'
BEGIN


  SELECT
    P.id AS idPac,
    (SELECT
        me.valor
      FROM maestro_estado me
      WHERE me.id = P.estado_id) AS estadoPac,
    P.nombre_completo AS name,
    P.sexo AS sexo,
    P.c_gestar AS cgestar,
    (SELECT
        FU_GET_PACIENTE_EDAD(P.id)) AS edad,
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
        me.valor
      FROM maestro_estado me
      WHERE P.sub_estado_id = me.id) AS sub_estado
  FROM paciente AS P
    INNER JOIN maestro_ventas m
      ON m.paciente_id = P.id
  GROUP BY P.id
  HAVING COUNT(*) > 0;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
