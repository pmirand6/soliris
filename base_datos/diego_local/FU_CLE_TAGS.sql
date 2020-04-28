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

-- Volcando estructura para función soliris.FU_CLE_TAGS
DELIMITER //
CREATE FUNCTION `FU_CLE_TAGS`(`$str` text) RETURNS text CHARSET latin1
    COMMENT 'Limpia los tags HTML'
BEGIN

  DECLARE $start,
          $end int DEFAULT 1;
  LOOP
    SET $start = LOCATE("<", $str, $start);
    IF (!$start) THEN
      RETURN $str;
    END IF;
    SET $end = LOCATE(">", $str, $start);
    IF (!$end) THEN
      SET $end = $start;
    END IF;
    SET $str = INSERT($str, $start, $end - $start + 1, "");
  END LOOP;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
