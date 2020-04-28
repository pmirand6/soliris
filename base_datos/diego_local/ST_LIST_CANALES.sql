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

-- Volcando estructura para procedimiento soliris.ST_LIST_CANALES
DELIMITER //
CREATE PROCEDURE `ST_LIST_CANALES`()
    COMMENT 'Lista los canales del sistema'
BEGIN

  -- verificar el muestreo de documentacion de los canales

  SELECT
    C.id AS id,
    C.canal AS canal,
    C.familia AS familia,
    C.direccion AS direccion,
    C.mail AS mail,
    C.dir_tec AS dir_tec,
    C.cont_venta AS cont_venta,
    C.cont_otro AS cont_otro,
    C.puntos_entrega AS puntos_entrega,
    m.valor AS estado,
    (SELECT
        'sin documentos') AS documentos /*(
SELECT GROUP_CONCAT(RD.documento)
FROM soliris_documentacion AS RD
WHERE RD.referencia = 'canales' AND RD.id_maestro = C.id
ORDER BY RD.id DESC
LIMIT 1) AS documentos*/
  FROM canales AS C
    INNER JOIN maestro_estado m
      ON m.id = C.estado_id
  ORDER BY C.canal DESC;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
