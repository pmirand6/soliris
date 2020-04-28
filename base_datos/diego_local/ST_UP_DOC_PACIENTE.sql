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

-- Volcando estructura para procedimiento soliris.ST_UP_DOC_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_UP_DOC_PACIENTE`(IN `v_idPac` int,
IN `v_tipoDoc` varchar(50),
IN `v_nombreDoc` varchar(255),
IN `v_usuario` varchar(50)
,
IN `v_fecha_doc` date)
    COMMENT 'Datos de la documentación subida del paciente'
BEGIN


  SET @p_nombre_doc := v_nombreDoc;
  SET @p_doc_tipo := 0;
  SET @p_usuario_id := 0;
  SET @p_id_paciente = v_idPac;
  SET @fecha_doc = v_fecha_doc;


  SET @documento_tipo_id = CONCAT("SELECT dt.id INTO @p_doc_tipo FROM documentos_tipo dt WHERE dt.tipo = ? AND dt.referencia = 'Paciente'");
  PREPARE statement_documento_tipo_id FROM @documento_tipo_id;
  SET @p_tipo = v_tipoDoc;
  EXECUTE statement_documento_tipo_id USING @p_tipo;
  DEALLOCATE PREPARE statement_documento_tipo_id;

  SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
  PREPARE statement_usuario_id FROM @usuario_id;
  SET @p_username = v_usuario;
  EXECUTE statement_usuario_id USING @p_username;
  DEALLOCATE PREPARE statement_usuario_id;


  SET @query_disable_docs = CONCAT("CALL `ST_DISABLE_OLD_DOC_PAC`(?, ?)");
  PREPARE statement_query_disable_docs FROM @query_disable_docs;
  EXECUTE statement_query_disable_docs USING @p_id_paciente, @p_doc_tipo;
  DEALLOCATE PREPARE statement_query_disable_docs;


  SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), @fecha_doc, ?, 'SOL')");
  PREPARE statement_query_documentos FROM @query_documentos;
  EXECUTE statement_query_documentos USING @p_nombre_doc, @p_doc_tipo, @p_usuario_id;
  DEALLOCATE PREPARE statement_query_documentos;

  SET @query_rel_paciente_documentos = CONCAT("INSERT INTO rel_paciente_documentos (paciente_id, documento_id, fecha_creacion) VALUES (?, LAST_INSERT_ID(), NOW())");
  PREPARE statement_query_rel_paciente_documentos FROM @query_rel_paciente_documentos;
  EXECUTE statement_query_rel_paciente_documentos USING @p_id_paciente;
  DEALLOCATE PREPARE statement_query_rel_paciente_documentos;

  SELECT
    "SE CREO EL REGISTRO CORRECTAMENTE" AS mensaje;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
