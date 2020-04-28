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

-- Volcando estructura para procedimiento soliris.ST_DOC_PAC_MODIFIED
DELIMITER //
CREATE PROCEDURE `ST_DOC_PAC_MODIFIED`(IN `v_id` int,
IN `v_usuario` varchar(50))
    COMMENT 'Actualiza el estado del paciente a Pendiente debido a que su documentacion fue modificada'
BEGIN

  UPDATE paciente
  SET estado_id = 7, -- se setea el usuario en estado Pendiente
      fecha_modificacion = NOW(),
      usuario_mod_id = (SELECT
          u.id
        FROM usuario u
        WHERE u.username = v_usuario)
  WHERE id = v_id;


  SELECT
    "Se registra correctamente el cambio de la documentacion, el paciente quedó en estado pendiente" AS mensaje,
    (SELECT
        me.valor
      FROM maestro_estado me
      WHERE me.id = 7) AS estado;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
