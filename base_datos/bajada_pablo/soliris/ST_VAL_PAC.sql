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

-- Volcando estructura para procedimiento soliris.ST_VAL_PAC
DELIMITER //
CREATE PROCEDURE `ST_VAL_PAC`(IN `v_idPac` int,
IN `v_comentario` longtext,
IN `v_estado` int,
IN `v_usuario` varchar(45))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN

  -- SETEO DE VARIABLES UTILIZADAS EN EL STORE PROCEDURED
  SET @p_usuario_id := 0; -- VARIABLE QUE CONTENDRA EL ID DEL USUARIO QUE REALIZA LA ACCION
  SET @p_id_pac = v_idPac;
  SET @p_comentario = v_comentario;
  SET @p_estado = v_estado;

  /*if (SELECT EXISTS( SELECT * FROM usuario AS u WHERE u.id=v_idPac)) then*/
  -- OBTENGO EL ID DEL USUARIO QUE ESTA HACIENDO LA ACCION
  SET @usuario_id = CONCAT("SELECT `FU_GET_ID_USUARIO`(?) INTO @p_usuario_id");
  PREPARE statement_usuario_id FROM @usuario_id;
  SET @p_username = v_usuario;
  EXECUTE statement_usuario_id USING @p_username;
  DEALLOCATE PREPARE statement_usuario_id;

  SET @query_update_paciente = CONCAT("UPDATE paciente p SET p.estado_id = ?, p.notas = ?, p.usuario_mod_id = ?, p.fecha_modificacion = NOW() WHERE p.id = ?");
  PREPARE statement_update_paciente FROM @query_update_paciente;
  EXECUTE statement_update_paciente USING @p_estado, @p_comentario, @p_usuario_id, @p_id_pac;
  DEALLOCATE PREPARE statement_update_paciente;

  -- RETORNO EL MENSAJE AL BACKEND
  SELECT
    "SE ACTUALIZO EL PACIENTE CORRECTAMENTE" AS mensaje;
/*ELSE
	SELECT
	 "EL PACIENTE NO EXISTE" AS mensaje;
	 
END if;
*/
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
