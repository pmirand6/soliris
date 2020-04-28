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

-- Volcando estructura para procedimiento soliris.st_reg_faltante
DELIMITER //
CREATE PROCEDURE `st_reg_faltante`(IN `v_operacion` varchar(50), IN `v_idoperacion` int, IN `v_iddocumento` int, IN `v_nombre` varchar(255))
BEGIN

  DECLARE d_count int;


  SET d_count = (SELECT
      COUNT(id)
    FROM doc_error
    WHERE id_documento = v_iddocumento);


  IF (d_count = 0) THEN

    INSERT INTO doc_error
    SET operacion = v_operacion,
        id_operacion = v_idoperacion,
        id_documento = v_iddocumento,
        nombre_doc = v_nombre,
        estado = 0,
        fe_actualizacion = NOW();

  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
