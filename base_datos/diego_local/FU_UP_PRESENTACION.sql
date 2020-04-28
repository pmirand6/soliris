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

-- Volcando estructura para función soliris.FU_UP_PRESENTACION
DELIMITER //
CREATE FUNCTION `FU_UP_PRESENTACION`(`v_nombre` varchar(45),
`v_familia` varchar(3),
`v_usuario` varchar(45),
`v_id` int) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;
  SET @nombreProducto = (SELECT
      UPPER(prod.valor)
    FROM producto prod
      INNER JOIN presentacion p
        ON p.producto_id = prod.id
    WHERE p.id = v_id);
  SET @usuario_audit = (SELECT
      FU_GET_ID_USUARIO(v_usuario));
  UPDATE presentacion p
  SET p.valor = CONCAT(@nombreProducto, ' ', v_nombre),
      p.usuario_audit = @usuario_audit
  WHERE p.id = v_id;

  IF (SELECT
        ROW_COUNT() > 0) THEN
    SET devolucion = v_id;
  ELSE
    SET devolucion = 'ERROR NO_UPDATE';
  END IF;

  RETURN devolucion;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
