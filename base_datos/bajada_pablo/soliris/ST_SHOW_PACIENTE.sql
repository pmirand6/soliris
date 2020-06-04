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

-- Volcando estructura para procedimiento soliris.ST_SHOW_PACIENTE
DELIMITER //
CREATE PROCEDURE `ST_SHOW_PACIENTE`(IN `v_id` int)
    COMMENT 'Muestra la informacion del paciente'
BEGIN



  SELECT
    p.id AS id,
    p.apellido AS apellido,
    p.nombre AS nombre,
    p.nombre_completo,
    p.usuario_id AS usuario_creador_id,
    (SELECT
        u.username
      FROM usuario u
      WHERE u.id = p.usuario_id) AS usuario_creador,
    p.usuario_mod_id AS usuario_mod_id,
    (SELECT
        FU_GET_PACIENTE_EDAD(v_id)) AS edad,
    (SELECT
        u.username
      FROM usuario u
      WHERE u.id = p.usuario_mod_id) AS usuario_mod,
    (SELECT
        me.id
      FROM maestro_estado me
      WHERE me.id = p.estado_id) AS estado_id,
    (SELECT
        me.valor
      FROM maestro_estado me
      WHERE me.id = p.estado_id) AS estado_valor,
    (SELECT
        me.id
      FROM maestro_estado me
      WHERE me.id = p.sub_estado_id) AS sub_estado_id,
    (SELECT
        me.valor
      FROM maestro_estado me
      WHERE me.id = p.estado_id) AS sub_estado_valor,
    p.fecha_nac AS fecha_nac,
    DATE_FORMAT(p.fecha_nac, '%d-%m-%Y') AS fecha_nac_formateada,
    (SELECT
        pat.id
      FROM patologia pat
      WHERE pat.id = p.patologia_id) AS patologia_id,
    (SELECT
        pat.patologia_nombre
      FROM patologia pat
      WHERE pat.id = p.patologia_id) AS patologiaNombre,
    (SELECT
        sub_pat.id
      FROM sub_patologia sub_pat
      WHERE sub_pat.id = p.sub_patologia_id) AS sub_patologia_id,
    (SELECT
        sub_pat.sub_patologia_nombre
      FROM sub_patologia sub_pat
      WHERE sub_pat.id = p.sub_patologia_id) AS subPatologiaNombre,
    (SELECT
        DATE_FORMAT(`FU_SHOW_FECHA_CONS_PAC`(v_id), '%d/%m/%Y')) AS fecha_con,
    (SELECT
        DATE_FORMAT(p.fecha_creacion, '%d/%m/%Y %H:%i:%s')) AS fecha_creacion,
    (SELECT
        DATE_FORMAT(p.fecha_modificacion, '%d/%m/%Y %H:%i:%s')) AS fecha_modificacion,
    p.telefono AS telefono,
    p.ciudad AS ciudad,
    p.pais_id AS pais_id,
    (SELECT
        pai.nombre
      FROM paises pai
      WHERE pai.id = p.pais_id) AS pais_nombre,
    p.mail AS mail,
    p.sexo AS sexo,
    p.os_id AS os_id,
    (SELECT
        os.nombre
      FROM os
      WHERE os.id = p.os_id) AS os_nombre,
    p.notas AS notas,
    p.crm_id AS crm_id,
    p.c_gestar AS c_gestar
  FROM paciente p
  WHERE p.id = v_id;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
