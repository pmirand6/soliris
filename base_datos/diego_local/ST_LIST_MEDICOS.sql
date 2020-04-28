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

-- Volcando estructura para procedimiento soliris.ST_LIST_MEDICOS
DELIMITER //
CREATE PROCEDURE `ST_LIST_MEDICOS`(IN `v_filtro` varchar(50))
    COMMENT 'Filtro de medicos activos'
BEGIN
  SELECT
    m.id,
    CONCAT(m.apellido, ',', m.nombre) AS nombre,
    mmt.valor AS matricula_tipo,
    m.matricula_numero,
    m.c_atencion,
    me.valor,
    (SELECT
        `FU_GET_ESP_MEDICO`(m.id)) AS especialidad,
    a.nombre_completo AS apm_nombre,
    me.valor AS estado,
    m.telefono,
    m.fax,
    m.mail,
    DATE_FORMAT(m.fecha_cap, '%d/%m/%Y') AS fecha_cap

  FROM medico m
    INNER JOIN medico_matricula mm
      ON mm.id = m.matricula_tipo_id
    INNER JOIN medico_matricula_tipo mmt
      ON mmt.id = mm.tipo_matricula_id
    INNER JOIN maestro_estado me
      ON me.id = m.estado_id
    INNER JOIN apm a
      ON a.id = m.apm_id
  WHERE LEFT(m.apellido, 1) LIKE CONCAT('%', v_filtro, '%')
  ORDER BY nombre ASC;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
