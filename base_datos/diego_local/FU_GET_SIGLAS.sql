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

-- Volcando estructura para función soliris.FU_GET_SIGLAS
DELIMITER //
CREATE FUNCTION `FU_GET_SIGLAS`(
	`input` VARCHAR(255)
) RETURNS varchar(50) CHARSET utf8
    COMMENT 'genera siglas en base a un string'
BEGIN
DECLARE len INT;
	DECLARE i INT;
	declare salida varchar(255);

	SET len   = CHAR_LENGTH(input);
	SET input = LOWER(input);
	SET i = 0;

	WHILE (i < len) DO
		IF (i=0) THEN
			set salida=left(input,1); /*para la primer letra*/
		else
			IF (MID(input,i,1) = ' ') THEN /*encontramos el espacio o la prime letra del string*/
				set salida=concat(salida,mid(input,i+1,1));
			END IF;
		END IF;
		SET i = i + 1;
	END WHILE;

	RETURN upper(salida);
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
