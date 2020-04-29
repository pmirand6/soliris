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

-- Volcando estructura para procedimiento soliris.ST_SHOW_MEDICO
DELIMITER //
CREATE PROCEDURE `ST_SHOW_MEDICO`(
	IN `v_idMedico` int
)
    COMMENT 'Muestra los datos de un medico'
BEGIN

  SELECT
    m.id,
    m.nombre,
    m.apellido,
    m.lugar,
    m.c_atencion,
    m.telefono,
    m.fax,
    m.mail,
    m.domicilio,
    m.localidad,
    m.provincia_id,
    m.fecha_cap,
    m.notas_mod,
    me.valor AS estado,
    m.matricula_numero,
    (SELECT
        DATE_FORMAT(m.fecha_venta, '%d/%m/%Y')
      FROM maestro_ventas m
      WHERE m.medico_id = v_idMedico
      ORDER BY m.id DESC LIMIT 0, 1) AS u_venta,
    GROUP_CONCAT(e.especialidad) AS especialidad_nombre,
    a.id AS apm_id,
    mmat.id AS matricula_tipo
  FROM medico m
    INNER JOIN rel_medico_especialidad rme
      ON rme.medico_id = m.id
    INNER JOIN especialidad e
      ON e.id = rme.especialidad_id
    INNER JOIN apm a
      ON a.id = m.apm_id
    INNER JOIN medico_matricula mmat
      ON mmat.id = m.matricula_tipo_id
    INNER JOIN medico_matricula_tipo mmt
      ON mmt.id = mmat.tipo_matricula_id
    INNER JOIN maestro_estado me
      ON me.id = m.estado_id
  WHERE m.id = v_idMedico;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
