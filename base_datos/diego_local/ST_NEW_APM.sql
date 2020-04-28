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

-- Volcando estructura para procedimiento soliris.ST_NEW_APM
DELIMITER //
CREATE PROCEDURE `ST_NEW_APM`(
	IN `v_estado` VARCHAR(50),
	IN `v_usuario_audit` VARCHAR(50),
	IN `v_username` VARCHAR(50),
	IN `v_email` VARCHAR(50),
	IN `v_nombre_completo` VARCHAR(50)
)
    COMMENT 'Crea un Apm'
BEGIN

SET @estado_id = (SELECT m.id FROM maestro_estado m WHERE m.referencia = 'apm' and m.valor = v_estado);
SET @user_id = (SELECT FU_GET_ID_USUARIO(v_usuario_audit));

INSERT INTO apm
(
 estado_id
 ,usuario_audit
 ,fecha_audit
 ,username
 ,email
 ,nombre_completo
)
VALUES
(
 @estado_id -- estado_id - INT(11) NOT NULL
 ,@user_id -- usuario_audit - VARCHAR(45)
 ,NOW() -- fecha_audit - TIMESTAMP
 ,v_username -- username - VARCHAR(45)
 ,v_email -- email - VARCHAR(50)
 ,v_nombre_completo -- nombre_completo - VARCHAR(50)
);

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
