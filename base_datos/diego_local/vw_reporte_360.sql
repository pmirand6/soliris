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

-- Volcando estructura para vista soliris.vw_reporte_360
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_reporte_360`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_reporte_360` AS SELECT
  `mv`.`id` AS `id`,
  `p`.`nombre_completo` AS `paciente`,
  p.id AS paciente_id,
  `mv`.`edad` AS `edad`,
  `p`.`sexo` AS `sexo`,
  `p2`.`patologia_nombre` AS `patologia_nombre`,
  `p3`.`valor` AS `producto`,
  `p1`.`valor` AS `presentacion`,
  `mv`.`unidades` AS `unidades`,
  `mv`.`fecha_venta` AS `fecha_venta`,
  `mv`.`nbr` AS `nbr`,
  CONCAT(`m`.`apellido`, ' ', `m`.`nombre`) AS `medico`,
  (SELECT
      GROUP_CONCAT(`d`.`valor` SEPARATOR ',')
    FROM (`rel_venta_documentos` `rel`
      LEFT JOIN `documentos` `d`
        ON ((`d`.`id` = `rel`.`documento_id`)))
    WHERE ((`rel`.`venta_id` = `mv`.`id`)
    AND (`d`.`estado_id` = 15))) AS `doc_venta`,
  `mvt`.`valor` AS `tipo_venta`,
  `c`.`canal` AS `canal`
FROM ((((((((`maestro_ventas` `mv`
  LEFT JOIN `paciente` `p`
    ON ((`p`.`id` = `mv`.`paciente_id`)))
  LEFT JOIN `medico` `m`
    ON ((`m`.`id` = `mv`.`medico_id`)))
  LEFT JOIN `maestro_ventas_tipo` `mvt`
    ON ((`mvt`.`id` = `mv`.`venta_tipo_id`)))
  LEFT JOIN `presentacion` `p1`
    ON ((`p1`.`id` = `mv`.`presentacion_id`)))
  LEFT JOIN `patologia` `p2`
    ON ((`p2`.`id` = `p`.`patologia_id`)))
  LEFT JOIN `canales` `c`
    ON ((`c`.`id` = `mv`.`canal_id`)))
  LEFT JOIN `producto` `p3`
    ON ((`p3`.`id` = `mv`.`producto_id`)))
  LEFT JOIN `institucion` `i`
    ON ((`i`.`id` = `mv`.`institucion_id`))) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
