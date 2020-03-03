-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para procedimiento soliris.put_log
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `put_log`(
	IN `v_usuario` VARCHAR(50),
	IN `v_id` INT,
	IN `v_tabla` VARCHAR(50),
	IN `v_notas` LONGTEXT
)
    COMMENT 'Carga informacion al log de la app'
BEGIN

declare d_values longtext;

set d_values=(SELECT group_concat(column_name) FROM information_schema.COLUMNS where TABLE_SCHEMA='soliris' and TABLE_NAME=v_tabla);



insert into soliris_log (usuario,fecha, accion, registro, tabla, notas) (select d_values from v_tabla where id=v_id) ;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
