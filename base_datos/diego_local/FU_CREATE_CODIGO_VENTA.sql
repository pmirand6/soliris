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

-- Volcando estructura para función soliris.FU_CREATE_CODIGO_VENTA
DELIMITER //
CREATE FUNCTION `FU_CREATE_CODIGO_VENTA`(
	`v_idVenta` int,
	`v_idProducto` int,
	`v_idPac` int
) RETURNS varchar(50) CHARSET latin1
    COMMENT 'Crea el codigo de la venta compuesto por la familia_idpac_siglasPac_idVenta'
BEGIN

  -- Crea el codigo de la venta compuesto por la familia_idpac_siglasPac_idVenta

  -- consulta del nombre y del apellido
  SET @nombre := (SELECT
      p.nombre
    FROM paciente p
    WHERE id = v_idPac);
  SET @apellido := (SELECT
      p.apellido
    FROM paciente p
    WHERE id = v_idPac);
  -- CONSULTA DE LA FAMILIA DEL PRODUCTO
  SET @familia := (SELECT
      familia
    FROM producto
    WHERE id = v_idProducto);

SET @nom=CONCAT(@apellido, ' ' ,@nombre);

  -- verifico que el nombre no sea compuesto
 /* IF (INSTR(@nombre, ' ') = 0) THEN
    SET @sigla_nombre := (SELECT
        SUBSTRING(SUBSTRING_INDEX(@nombre, ' ', -1), 1, 1));
  ELSE
    SET @sigla_nombre := (SELECT
        CONCAT(SUBSTRING(SUBSTRING_INDEX(@nombre, ' ', 1), 1, 1), SUBSTRING(SUBSTRING_INDEX(@nombre, ' ', -1), 1, 1)));
  END IF;





  -- verifico que el apellido no sea compuesto
  IF (INSTR(@apellido, ' ') = 0) THEN
    SET @sigla_apellido := (SELECT
        SUBSTRING(SUBSTRING_INDEX(@apellido, ' ', -1), 1, 1));
  ELSE
    SET @sigla_apellido := (SELECT
        CONCAT(SUBSTRING(SUBSTRING_INDEX(@apellido, ' ', 1), 1, 1), SUBSTRING(SUBSTRING_INDEX(@apellido, ' ', -1), 1, 1)));
  END IF;

*/



  RETURN CONCAT(@familia, '-', v_idPac, '-', FU_GET_SIGLAS(@nom) , '-', v_idVenta);

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
