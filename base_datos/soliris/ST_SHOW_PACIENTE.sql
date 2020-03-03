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

-- Volcando estructura para procedimiento soliris.ST_SHOW_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_SHOW_PACIENTE`(
	IN `v_id` INT











)
    COMMENT 'Muestra la informacion del paciente'
BEGIN



SELECT 
	p.id as id, 
	p.apellido as apellido, 
	p.nombre as nombre, 
	(select me.id from maestro_estado me where me.id = p.estado_id) as estado_id,
	(select me.valor from maestro_estado me where me.id = p.estado_id) as estado_valor,
	(select me.id from maestro_estado me where me.id = p.sub_estado_id) as sub_estado_id,
	p.fecha_nac as fecha_nac,
	(select pat.id from patologia pat where pat.id = p.patologia_id) as patologia_id,
	(select sub_pat.id from sub_patologia sub_pat where sub_pat.id = p.sub_patologia_id) as sub_patologia_id,
	(SELECT DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(v_id), '%d/%m/%Y')) as fecha_con,
	p.telefono as telefono,
	p.ciudad as ciudad,
	p.pais_id as pais_id,
	(select pai.nombre from paises pai where pai.id = p.pais_id) as pais_nombre,
	p.mail as mail,
	p.sexo as sexo,
	p.os_id as os_id,
	(select os.nombre from os where os.id = p.os_id) as os_nombre,
	p.notas as notas,
	p.crm_id as crm_id,
	p.c_gestar as c_gestar
FROM 
	paciente p
WHERE 
	p.id = v_id;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
