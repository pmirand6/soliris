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

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_VENTA_DOCUMENTACION
DELIMITER //
CREATE PROCEDURE `ST_GUARDAR_VENTA_DOCUMENTACION`(IN `v_idVenta` int,
IN `v_tipoDoc` int,
IN `v_nombreDoc` varchar(255),
IN `v_usuario` varchar(50),
IN `v_fecha_doc` date)
    COMMENT 'Store que guarda la documentacion de la venta y la asocia al registro de venta'
BEGIN


  SET @p_nombre_doc := v_nombreDoc;
  SET @p_doc_tipo := v_tipoDoc;
  SET @p_username := v_usuario;
  SET @fecha_doc := v_fecha_doc;
  SET @p_idVenta := v_idVenta;



  SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
  PREPARE statement_usuario_id FROM @usuario_id;
  EXECUTE statement_usuario_id USING @p_username;
  DEALLOCATE PREPARE statement_usuario_id;


  SET @disable_doc = CONCAT("call ST_DISABLE_OLD_DOC_VENTAS(?,?)");
  PREPARE statement_st FROM @disable_doc;
  EXECUTE statement_st USING @p_idVenta, @p_doc_tipo;
  DEALLOCATE PREPARE statement_st;



  SET @query_documentos = CONCAT("INSERT INTO documentos (valor, documentos_tipo_id, fecha_creacion, fecha_documento, usuario_id, familia) VALUES (?, ?, NOW(), @fecha_doc, ?, 'SOL')");
  PREPARE statement_query_documentos FROM @query_documentos;
  EXECUTE statement_query_documentos USING @p_nombre_doc, @p_doc_tipo, @p_usuario_id;
  DEALLOCATE PREPARE statement_query_documentos;

  SET @query_rel_venta_documentos = CONCAT("INSERT INTO rel_venta_documentos (venta_id, documento_id, fecha_creacion) VALUES (?, LAST_INSERT_ID(), NOW())");
  PREPARE statement_query_rel_venta_documentos FROM @query_rel_venta_documentos;
  EXECUTE statement_query_rel_venta_documentos USING @p_idVenta;
  DEALLOCATE PREPARE statement_query_rel_venta_documentos;

  SELECT
    "SE CREO EL REGISTRO CORRECTAMENTE" AS mensaje;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
