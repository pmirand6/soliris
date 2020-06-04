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

-- Volcando estructura para función soliris.FU_NEW_PRESENTACION
DELIMITER //
CREATE FUNCTION `FU_NEW_PRESENTACION`(`v_nombre` varchar(45),
`v_familia` varchar(3),
`v_usuario` varchar(45)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE id_1 int;
  DECLARE id_2 int;

  DECLARE devolucion longtext;

  SET id_1 = (SELECT
      LAST_INSERT_ID());

  SET @usuario_audit = (SELECT
      FU_GET_ID_USUARIO(v_usuario));
  SET @productoNombre = (SELECT
      UPPER(prod.valor)
    FROM producto prod
    WHERE prod.familia = v_familia);
  SET @productoId = (SELECT
      prod.id
    FROM producto prod
    WHERE prod.familia = v_familia);
  SET @valorNombre = (SELECT
      CONCAT(@productoNombre, ' ', v_nombre));
  SET @countIdentico = (SELECT
      COUNT(*)
    FROM presentacion p
    WHERE p.valor = @productoNombre
    AND p.familia = v_familia);

  IF (@countIdentico = 0) THEN

    INSERT INTO presentacion (valor, familia, usuario_audit, producto_id)
      VALUES (@valorNombre, v_familia, @usuario_audit, @productoId);

    RETURN LAST_INSERT_ID();

  ELSE
    RETURN 'ERROR NO_INSERT';
  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
