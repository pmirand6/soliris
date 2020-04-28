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

-- Volcando estructura para procedimiento soliris.ST_DOC_VIGENCIA
DELIMITER //
CREATE PROCEDURE `ST_DOC_VIGENCIA`()
BEGIN
/*el Store inactiva al paciente o al medico dependiendo de la antiguedad de la documentacion
la vigencia se toma de la tabla de configuracion
luego se verifica que archivos de la tabla de documentacion en estado activo son anteriores y con eso se inactiva la entidad correspondiente*/

/*CASO PACIENTES*/


DECLARE done INT DEFAULT 0;
DECLARE d_tipo_id INT;
DECLARE d_id INT;
DECLARE d_antiguedad DATE;
DECLARE d_id_pac INT;
DECLARE d_id_doc INT;
DECLARE d_origen VARCHAR(15);

DECLARE d_puntero CURSOR For SELECT id FROM configuracion WHERE tipo='Documento_vigencia';
DECLARE CONTINUE handler for SQLSTATE '02000' SET done=1;
	OPEN d_puntero;
		repeat
			fetch d_puntero INTO d_id;
				if NOT done then
					/*obtengo la fecha de corte*/
					set d_antiguedad=(SELECT DATE_ADD(date(NOW()), INTERVAL -(SELECT valor FROM configuracion  WHERE id=d_id) DAY));
					/*el codigo del documento*/
					SET d_tipo_id=(SELECT descripcion FROM configuracion WHERE id=d_id);
					/*el origen del documento*/
					SET d_origen=(SELECT referencia FROM documentos_tipo WHERE id=d_tipo_id);
			
					/*Con la referencia determino las tablas que tengo que consultar*/
					if (d_origen='paciente') then


						SET d_id_pac=(SELECT r.paciente_id FROM rel_paciente_documentos AS r  JOIN documentos AS d ON r.documento_id=d.id where d.documentos_tipo_id=d_tipo_id and  d.fecha_documento<d_antiguedad AND d.estado_id=15);
						SET d_id_doc=(SELECT d.id FROM rel_paciente_documentos AS r  JOIN documentos AS d ON r.documento_id=d.id where d.documentos_tipo_id=d_tipo_id and  d.fecha_documento<d_antiguedad AND d.estado_id=15);

						/*inactivo al paciente*/							
						UPDATE paciente SET estado_id=31 WHERE id=d_id_pac;

						/*inactivo el documento*/
						UPDATE documentos SET estado_id=16 WHERE id=d_id_doc;
						
					END if;

					if (d_origen='medico') then
					
							SET d_id_pac=(SELECT r.medico_id FROM rel_medico_documentos AS r  JOIN documentos AS d ON r.documento_id=d.id where d.documentos_tipo_id=d_tipo_id and  d.fecha_documento<d_antiguedad AND d.estado_id=15);
						SET d_id_doc=(SELECT d.id FROM rel_medico_documentos AS r  JOIN documentos AS d ON r.documento_id=d.id where d.documentos_tipo_id=d_tipo_id and  d.fecha_documento<d_antiguedad AND d.estado_id=15);
						
						/*inactivo al medico*/
						UPDATE medico SET estado_id=32 WHERE id=d_id_pac;
						/*inactivo el documento*/
						
						UPDATE documentos SET estado_id=16 WHERE id=d_id_doc;
					
					END if;

				END if;
			until done END repeat;
			close d_puntero;
			


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
