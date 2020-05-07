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

-- Volcando estructura para procedimiento soliris.ST_LIST_DOCS_ACTIVOS_PAC
DELIMITER //
CREATE PROCEDURE `ST_LIST_DOCS_ACTIVOS_PAC`(
	IN `v_idPac` int
)
BEGIN

  SET lc_time_names ='es_AR';
/*leo la fecha de vencimiento de los documentos*/

  SELECT
    d.valor AS documento,
    dt.tipo,

    DATE_FORMAT(d.fecha_documento, '%d/%b/%Y') AS fecha_documento,
    /*la expiracion se calcula con  (fecha vacuna + dias de vigencia )- (diferencial en dias entre la fecha vacuna y hoy)*/
	concat(
		DATEDIFF(
			DATE_ADD(
				DATE(NOW()), 
				INTERVAL c.valor DAY )
				,d.fecha_documento) - (DATEDIFF(NOW(),d.fecha_documento)),
			' Dias') AS expira
  
  FROM documentos AS d
    LEFT OUTER JOIN documentos_tipo AS dt
      ON d.documentos_tipo_id = dt.id
    INNER JOIN rel_paciente_documentos rel
      ON d.id = rel.documento_id
   INNER JOIN configuracion c 
   	ON  d.documentos_tipo_id=c.descripcion
  WHERE rel.paciente_id = v_idPac
  AND d.estado_id = 15;
-- GROUP BY d.valor, dt.tipo ORDER BY d.id;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
