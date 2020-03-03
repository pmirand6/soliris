-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para procedimiento soliris.ST_LIST_PACIENTES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_LIST_PACIENTES`(
	IN `v_filtro` INT,
	IN `v_ini` VARCHAR(1)


)
    COMMENT 'Crea la tabla temporal del listado de pacientes que luego puede ser filtrada'
BEGIN


DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = 'TEMPORARY_LIST_PACIENTES';
    SET @sql_query = CONCAT('SELECT NULL FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 0) THEN
        DROP TABLE TEMPORARY_LIST_PACIENTES;
        DEALLOCATE PREPARE stmt1;
    END IF;

CREATE TEMPORARY TABLE TEMPORARY_LIST_PACIENTES(
			SELECT
	  		  P.id AS id, 
			  concat(P.apellido, ', ', P.nombre) AS name, 
	  		  P.sexo AS sexo, 
	  		  P.c_gestar AS cgestar, 
			  date_format(P.fecha_nac, '%d/%m/%Y') AS fnac, 
	  		  P.patologia_id AS patologia, 
	  		  P.sub_patologia_id AS subPatologia, 
   		  (SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(p.id), '%d/%m/%Y')) as fecha_con,
		     P.mail AS email, 
	  		  P.telefono AS telefono, 
	  		  P.notas AS notas, 
	  		  (SELECT me.valor FROM maestro_estado me where p.estado_id = me.id) AS estado,
	  		  vRM.fventa AS uventa, 
	  		  (SELECT me.valor FROM maestro_estado me INNER JOIN paciente p ON p.sub_estado_id = me.id) AS sub_estado
			FROM
	  			paciente AS P 
			LEFT JOIN 
				vw_lastsale_rm AS vRM 
			ON (P.id = vRM.pid));
			
if(v_filtro = 0) then
	SELECT * FROM TEMPORARY_LIST_PACIENTES;
else
	SELECT * FROM TEMPORARY_LIST_PACIENTES WHERE LEFT(name,1) = v_ini;
end if;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
