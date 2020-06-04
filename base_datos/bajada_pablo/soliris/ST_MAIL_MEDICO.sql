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

-- Volcando estructura para procedimiento soliris.ST_MAIL_MEDICO
DELIMITER //
CREATE PROCEDURE `ST_MAIL_MEDICO`(IN `v_idMedico` int,
IN `v_accion` varchar(50))
    COMMENT 'Devuelve los datos para el alta del medico'
BEGIN

  -- OBTENGO LOS EMAILS PARA LA ACCION Y VERIFICO QUE LA NOTIFICACION ESTE ACTIVADA

  SET @emails := (SELECT
      GROUP_CONCAT(CONCAT(u.username, '-', u.email)) AS us
    FROM rel_mail_rol rel
      INNER JOIN mail_configuracion mc
        ON rel.mail_configuracion_id = mc.id
      INNER JOIN rol r
        ON r.id = rel.rol_id
      INNER JOIN usuario u
        ON u.rol_id = r.id
    WHERE mc.descripcion = v_accion
    AND mc.estado_id = 1);

  -- OBTENGO EL ID DE LA ACCIÓN
  SET @idMailConfig = (SELECT
      mc.id
    FROM mail_configuracion mc
    WHERE mc.descripcion = v_accion);

  -- OBTENGO EL NOMBRE DEL MEDICO
  SET @nom_medico := (SELECT
      CONCAT(m.apellido, ', ', m.nombre)
    FROM medico m
    WHERE m.id = v_idMedico);

  -- SI ES UN ALTA DE MEDICO RETORNO SOLO EL NOMBRE Y EL USUARIO QUE CREÓ EL REGISTRO
  IF (@idMailConfig = 3) THEN
    SET @usuario := (SELECT
        FU_GET_USERNAME_USUARIO(m.usuario_creador)
      FROM medico m
      WHERE m.id = v_idMedico);
    SET @notas := (SELECT
        m.notas_mod
      FROM medico m
      WHERE m.id = v_idMedico);
    SELECT
      @emails AS emails,
      @nom_medico AS nom_medico,
      @usuario AS usuario,
      @notas AS notas;
  ELSE
    -- SI ES UNA MODIFICACIÓN O BAJA RETORNO EL USUARIO QUE HIZO LA MODIFICACIÓN Y LAS NOTAS
    IF (@idMailConfig = 4
      OR @idMailConfig = 5) THEN
      SET @usuario := (SELECT
          FU_GET_USERNAME_USUARIO(m.usuario_mod)
        FROM medico m
        WHERE m.id = v_idMedico);
      SET @notas := (SELECT
          m.notas_mod
        FROM medico m
        WHERE m.id = v_idMedico);
      SELECT
        @emails AS emails,
        @nom_medico AS nom_medico,
        @usuario AS usuario,
        @notas AS notas;
    END IF;
  END IF;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
