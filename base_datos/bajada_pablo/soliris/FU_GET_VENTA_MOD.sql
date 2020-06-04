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

-- Volcando estructura para función soliris.FU_GET_VENTA_MOD
DELIMITER //
CREATE FUNCTION `FU_GET_VENTA_MOD`(`v_idMstr` int,
`v_fechas` int) RETURNS varchar(100) CHARSET latin1
    COMMENT 'Funcion para obternet los datos de la venta'
BEGIN

  DECLARE dev varchar(100);

  IF (v_fechas = 0) THEN
    SET dev = (SELECT
        CONCAT(rv.id, "|", (SUBSTRING_INDEX((get_paciente(rv.nombre)), '|', 1)), "|", rv.medico, "|", rv.presentacion, "|", rv.unidades, "|", rv.estado) AS datosVenta
      FROM soliris_maestro rv
      WHERE rv.id = v_idMstr);
  ELSE
    SET dev = (SELECT
        CONCAT(IFNULL(rv.fecha_venta, "Sin Fecha de Venta"), "|", (IFNULL(rv.fecha_receta, "Sin Fecha Receta")), "|", IFNULL(rv.fecha_test, "Sin Fecha de Test"), "|", IFNULL(rv.fecha_otro, "Sin Fecha")) AS datosFechas
      FROM soliris_maestro rv
      WHERE rv.id = v_idMstr);

  END IF;

  IF (FOUND_ROWS() = 0) THEN
    RETURN FOUND_ROWS();
  ELSE
    RETURN dev;
  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
