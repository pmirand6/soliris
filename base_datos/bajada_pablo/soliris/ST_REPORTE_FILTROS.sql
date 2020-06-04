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

-- Volcando estructura para procedimiento soliris.ST_REPORTE_FILTROS
DELIMITER //
CREATE PROCEDURE `ST_REPORTE_FILTROS`(IN `v_anio_ini` varchar(50),
IN `v_anio_fin` varchar(50))
    COMMENT 'STORE DEDICADO AL REPORTE FILTRO'
BEGIN
  IF (v_anio_ini <> ''
    AND v_anio_fin <> '') THEN
    SET @aoIni = v_anio_ini;
    SET @aoFin = v_anio_fin;
    SET @condicion = CONCAT('m.fecha_venta >= "', @aoIni, '" AND m.fecha_venta <= "', @aoFin, '" and m.estado_id in (23)');
  ELSE
    SET @condicion = CONCAT("year(m.fecha_venta)=year(now()) and m.estado_id in (23)");
  END IF;

  SET @query_select = CONCAT('SELECT ',
  '        m.id as Registro,',
  '        p.nombre_completo as Paciente,',
  '        p.sexo as Sexo,',
  '        date_format(p.fecha_nac, "%d/%m/%Y") as Fecha_Nacimiento,',
  '        p.c_gestar as C_Gestar,',
  '        m.edad,',
  '		  CONCAT(med.apellido, med.nombre) as Medico,',
  '        date_format(m.fecha_venta, "%d/%m/%Y") as Fecha_Venta,',
  '        DATE_FORMAT((SELECT FU_SHOW_FECHA_CONS_PAC(p.id)), "%d/%m/%Y") as Fecha_Cons,',
  '		  pat.patologia_nombre AS  Patologia,',
  '		  i.nombre as Institucion, ',
  '        can.canal as Canal,',
  '        a.nombre_completo as APM,',
  '		  med.c_atencion as C_Atencion,',
  '        mvt.valor as tipo,',
  '        me.valor as Estado,',
  '        pre.valor as Presentacion,',
  '        m.unidades as Unidades',
  '        FROM maestro_ventas as m',
  '         INNER JOIN paciente p ON p.id = m.paciente_id',
  '         INNER JOIN medico med ON med.id = m.medico_id',
  '         INNER JOIN patologia pat ON pat.id = p.patologia_id',
  '         INNER JOIN institucion i ON i.id = m.institucion_id',
  '         INNER JOIN canales can ON can.id = m.canal_id',
  '         INNER JOIN apm a ON a.id = med.apm_id',
  '         INNER JOIN maestro_ventas_tipo mvt ON mvt.id = m.venta_tipo_id',
  '        INNER JOIN maestro_estado me ON me.id = m.estado_id',
  '        INNER JOIN presentacion pre ON pre.id = m.presentacion_id',
  '         WHERE ', @condicion, 'ORDER BY m.id DESC');


  PREPARE stmt
  FROM @query_select;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
