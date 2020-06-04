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

-- Volcando estructura para procedimiento soliris.ST_GUARDAR_VENTA
DELIMITER //
CREATE PROCEDURE `ST_GUARDAR_VENTA`(IN `v_id_paciente` int,
IN `v_medico_id` int,
IN `v_producto_id` int,
IN `v_presentacion_id` int,
IN `v_unidades` int,
IN `v_institucion_id` int,
IN `v_canal_id` int,
IN `v_usuario` varchar(50),
IN `v_oc` varchar(50))
    COMMENT 'store que guarda la venta asignada a un paciente'
BEGIN

  SET @p_username := v_usuario;
  SET @id_paciente := v_id_paciente;
  SET @v_medico_id := v_medico_id;
  SET @v_producto_id := v_producto_id;
  SET @v_unidades := v_unidades;
  SET @v_institucion_id := v_institucion_id;
  SET @v_canal_id := v_canal_id;
  SET @v_presentacion_id := v_presentacion_id;
  SET @v_oc := v_oc;

  SET @paciente_venta_ri = CONCAT("SELECT COUNT(*) AS ri INTO @p_venta_ri FROM maestro_ventas m WHERE m.paciente_id = ? AND m.venta_tipo_id = 1");
  PREPARE statement_paciente_venta_ri FROM @paciente_venta_ri;
  EXECUTE statement_paciente_venta_ri USING @id_paciente;
  DEALLOCATE PREPARE statement_paciente_venta_ri;

  IF (@p_venta_ri > 0) THEN
    SET @p_tipo_venta_id = 2;
  ELSE
    SET @p_tipo_venta_id = 1;
  END IF;


  SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
  PREPARE statement_usuario_id FROM @usuario_id;
  EXECUTE statement_usuario_id USING @p_username;
  DEALLOCATE PREPARE statement_usuario_id;

  SET @query_edad = CONCAT("SELECT `FU_GET_PACIENTE_EDAD`(?) INTO @edad_paciente");
  PREPARE statement_edad_pac FROM @query_edad;
  EXECUTE statement_edad_pac USING @id_paciente;
  DEALLOCATE PREPARE statement_edad_pac;


  SET @paciente_patologia = CONCAT("SELECT p.patologia_id, p.sub_patologia_id INTO @patologia_id, @sub_patologia_id FROM paciente p WHERE p.id =?");
  PREPARE statement_paciente_patologia FROM @paciente_patologia;
  EXECUTE statement_paciente_patologia USING @id_paciente;
  DEALLOCATE PREPARE statement_paciente_patologia;

  -- BuildMyString.com generated SQL. Please enjoy your string responsibly.

  SET @query_insert_venta = CONCAT('INSERT INTO maestro_ventas',
  '	(paciente_id,',
  '	 edad, ',
  '	 medico_id, ',
  '	 producto_id, ',
  '	 presentacion_id, ',
  '	 venta_tipo_id, ',
  '	 unidades, ',
  '	 patologia_id, ',
  '	 sub_patologia_id, ',
  '	 institucion_id, ',
  '	 canal_id, ',
  '	 usuario_id, ',
  '	 usuario_mod_id, ',
  '	 oc, ',
  '	 fecha_stamp) ',
  '	 VALUES ',
  '	 (',
  '	 @id_paciente,',
  '	  @edad_paciente,',
  '	  @v_medico_id, ',
  '	  @v_producto_id, ',
  '	  @v_presentacion_id, ',
  '	  @p_tipo_venta_id, ',
  '	  @v_unidades, ',
  '	 	@patologia_id,',
  '	 @sub_patologia_id,',
  '	 @v_institucion_id, ',
  '	 @v_canal_id, ',
  '	 @p_usuario_id,',
  '	 @p_usuario_id,',
  '	 @v_oc,',
  '	 NOW())',
  ';');


  PREPARE statement_documento_tipo_id FROM @query_insert_venta;
  EXECUTE statement_documento_tipo_id;
  DEALLOCATE PREPARE statement_documento_tipo_id;

  -- OBTENGO EL CODIGO DE VENTA --

  -- HAGO LA CONSULTA PARA OBTENER EL ID DE LA VENTA
  SET @idVenta := (SELECT
      LAST_INSERT_ID());

  -- HAGO LA CONSULTA PARA OBTENER EL CODIGO DE LA VENTA
  SET @stmt_codigo_venta = CONCAT("SELECT FU_CREATE_CODIGO_VENTA(?, ?, ?) INTO @codigo_venta");
  PREPARE stmt FROM @stmt_codigo_venta;
  EXECUTE stmt USING @idVenta, @v_producto_id, @id_paciente;
  DEALLOCATE PREPARE stmt;

  -- HAGO EL UPDATE DE LA VENTA CON EL CODIGO DE LA VENTA AL CAMPO CODIGO_VENTA

  SET @up_cod_venta = CONCAT("UPDATE maestro_ventas set codigo_venta = ? where id = ?");
  PREPARE stmt FROM @up_cod_venta;
  EXECUTE stmt USING @codigo_venta, @idVenta;
  DEALLOCATE PREPARE stmt;


  -- RETORNO EL ID DE LA VENTA Y EL CODIGO DE LA VENTA
  -- EL ID DE LA VENTA ES NECESARIO YA QUE EL PROGRAMA (GENERAR_VENTA) NECESITA SABER SI ES NUMERICO

  SELECT
    @idVenta AS mensaje,
    @codigo_venta AS codigo_venta;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
