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

-- Volcando estructura para función soliris.FU_GET_FECHA_RECETA
DELIMITER //
CREATE FUNCTION `FU_GET_FECHA_RECETA`(`v_id` int) RETURNS date
    COMMENT 'Obtiene la fecha de la receta de la venta'
BEGIN

  RETURN (SELECT
      doc.fecha_documento
    FROM documentos doc
      INNER JOIN rel_venta_documentos rvd
        ON rvd.documento_id = doc.id
      INNER JOIN maestro_ventas m
        ON m.id = rvd.venta_id
    WHERE doc.documentos_tipo_id = 3
    AND m.id = v_id
    AND doc.estado_id = 15);

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
