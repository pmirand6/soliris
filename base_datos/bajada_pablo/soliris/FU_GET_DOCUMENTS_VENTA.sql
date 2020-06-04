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

-- Volcando estructura para función soliris.FU_GET_DOCUMENTS_VENTA
DELIMITER //
CREATE FUNCTION `FU_GET_DOCUMENTS_VENTA`(`v_id` int) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
    COMMENT 'devuelve un array con los documentos de la venta'
BEGIN

  DECLARE s_response varchar(255);

  SET s_response = (SELECT
      GROUP_CONCAT(d.valor)
    FROM rel_venta_documentos rel
      INNER JOIN documentos d
        ON d.id = rel.documento_id
    WHERE rel.venta_id = v_id);

  IF s_response IS NULL THEN
    SET s_response = "Sin Documentación";
  END IF;


  RETURN s_response;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
