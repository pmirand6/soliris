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

-- Volcando estructura para procedimiento soliris.ST_inact_medico
DELIMITER //
CREATE PROCEDURE `ST_inact_medico`()
BEGIN
  DECLARE d_id_med int;
  DECLARE d_fecha date;
  DECLARE d_limite int;
  DECLARE d_const varchar(50);


  SET d_limite = (SELECT
      valor
    FROM configuracion
    WHERE id = 8);
  INSERT INTO soliris_log
  SET usuario = 'sistema',
      fecha = NOW(),
      accion = 'Inactivacion medicos',
      notas = (SELECT
          CONCAT(estado, '=', COUNT(*))
        FROM medicos
        WHERE estado = 'Inactivo');
  UPDATE medicos AS m
  SET m.estado = 'Inactivo',
      m.fecha_inac = NOW()
  WHERE COALESCE((SELECT
      DATEDIFF(NOW(), t.fecha)
    FROM soliris_maestro AS t
    WHERE t.medico = m.nombre
    ORDER BY t.id
    DESC LIMIT 1), DATEDIFF(NOW(), m.fecha_alta)) > d_limite
  AND m.estado = 'Activo'

  ;
  INSERT INTO soliris_log
  SET usuario = 'sistema',
      fecha = NOW(),
      accion = 'Inactivacion medicos',
      notas = (SELECT
          CONCAT(estado, '=', COUNT(*))
        FROM medicos
        WHERE estado = 'Inactivo');
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
