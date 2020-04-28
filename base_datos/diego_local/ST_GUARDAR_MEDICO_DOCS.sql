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

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_MEDICO_DOCS
DELIMITER //
CREATE PROCEDURE `ST_GUARDAR_MEDICO_DOCS`(IN `v_idMedico` int,
IN `v_tipoDoc` int,
IN `v_nombreDoc` varchar(255),
IN `v_usuario` varchar(50),
IN `v_fecha_doc` date)
    COMMENT 'Store que guarda la documentacion de la capacitacion del médico'
BEGIN


  SET @p_nombre_doc := v_nombreDoc;
  SET @p_doc_tipo := v_tipoDoc;
  SET @p_username := v_usuario;
  SET @fecha_doc := v_fecha_doc;
  SET @p_idMedico := v_idMedico;

  SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
  PREPARE statement_usuario_id FROM @usuario_id;
  EXECUTE statement_usuario_id USING @p_username;
  DEALLOCATE PREPARE statement_usuario_id;

  SET @count_med_docs = CONCAT("SELECT count(*) into @count_med FROM rel_medico_documentos  where medico_id = ?");
  PREPARE stmt_count_med FROM @count_med_docs;
  EXECUTE stmt_count_med USING @p_idMedico;
  DEALLOCATE PREPARE stmt_count_med;

  -- Deshabilito todos los documentos anteriores de capacitación
  IF (@count_med > 0) THEN

    SET @up_med_docs = CONCAT("update rel_medico_documentos set estado_id = 16 where medico_id = ?");
    PREPARE stmt_up_med FROM @up_med_docs;
    EXECUTE stmt_up_med USING @p_idMedico;
    DEALLOCATE PREPARE stmt_up_med;


  END IF;

  -- Inserto los datos del documento

  SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), @fecha_doc, ?, 'SOL')");
  PREPARE statement_query_documentos FROM @query_documentos;
  EXECUTE statement_query_documentos USING @p_nombre_doc, @p_doc_tipo, @p_usuario_id;
  DEALLOCATE PREPARE statement_query_documentos;

  -- Establezco la relación entre el medico y el documento
  SET @query_rel_venta_documentos = CONCAT("INSERT INTO rel_medico_documentos (medico_id, documento_id, fecha_creacion) VALUES (?, LAST_INSERT_ID(), NOW())");
  PREPARE statement_query_rel_venta_documentos FROM @query_rel_venta_documentos;
  EXECUTE statement_query_rel_venta_documentos USING @p_idMedico;
  DEALLOCATE PREPARE statement_query_rel_venta_documentos;

  -- Actualizo la fecha de capacitación en la tabla medico y habilito al medico
  SET @up_med = CONCAT("UPDATE medico SET fecha_cap = @fecha_doc, estado_id = 19 where id = ?");
  PREPARE stmt_up_med FROM @up_med;
  EXECUTE stmt_up_med USING @p_idMedico;
  DEALLOCATE PREPARE stmt_up_med;



  SELECT
    "SE CREO EL REGISTRO CORRECTAMENTE" AS mensaje;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
