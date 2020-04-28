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

-- Volcando estructura para procedimiento soliris.put_log
DELIMITER //
CREATE PROCEDURE `put_log`(IN `v_usuario` varchar(50),
IN `v_id` int,
IN `v_tabla` varchar(50),
IN `v_notas` longtext)
    COMMENT 'Carga informacion al log de la app'
BEGIN

  DECLARE d_values longtext;

  SET d_values = (SELECT
      GROUP_CONCAT(column_name)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = 'soliris'
    AND TABLE_NAME = v_tabla);



  INSERT INTO soliris_log (usuario, fecha, accion, registro, tabla, notas)
    (SELECT
        d_values
      FROM v_tabla
      WHERE id = v_id);


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
