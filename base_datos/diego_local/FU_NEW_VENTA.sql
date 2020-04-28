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

-- Volcando estructura para función soliris.FU_NEW_VENTA
DELIMITER //
CREATE FUNCTION `FU_NEW_VENTA`(`v_id_paciente` int,
`v_f_venta` date,
`v_patologia` longtext,
`v_dosis` varchar(200),
`v_unidades` int,
`v_institucion` longtext,
`v_canal` varchar(200),
`v_medico` varchar(200),
`v_usuario` varchar(45)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE id_1 int;
  DECLARE id_2 int;
  DECLARE c_tipo varchar(2);
  DECLARE c_padre int;

  DECLARE devolucion longtext;

  SET c_padre = NULL;
  SET c_tipo = 'RI';

  SET c_padre = (SELECT
      RM.id
    FROM soliris_maestro AS RM
    WHERE RM.nombre = v_id_paciente
    ORDER BY RM.id DESC LIMIT 1);

  IF (SELECT
        LENGTH(c_padre) > 0) THEN
    SET c_tipo = 'FU';
  END IF;

  SET id_1 = (SELECT
      LAST_INSERT_ID());

  INSERT INTO soliris_maestro
  SET nombre = v_id_paciente,
      sexo = (SELECT
          sexo
        FROM pacientes AS P
        WHERE P.id = v_id_paciente),
      fecha_nac = (SELECT
          fecha_nac
        FROM pacientes AS P
        WHERE P.id = v_id_paciente),
      /*	edad = (SELECT YEAR(CURDATE())- YEAR(STR_TO_DATE(P.fecha_nac, '%Y-%c-%e')) FROM pacientes as P WHERE P.id = v_id_paciente), PMIRANDA*/
      edad = (SELECT
          TIMESTAMPDIFF(year, STR_TO_DATE(P.fecha_nac, '%Y-%c-%e'), CURDATE())
        FROM pacientes AS P
        WHERE P.id = v_id_paciente),
      /* 	edad = (SELECT YEAR(CURDATE())- YEAR(STR_TO_DATE(P.fecha_nac, '%e-%c-%Y')) FROM pacientes as P WHERE P.id = v_id_paciente), */
      medico = (SELECT
          M.Nombre
        FROM medicos AS M
        WHERE M.id = v_medico),
      id_medico = (SELECT
          M.id
        FROM medicos AS M
        WHERE M.id = v_medico),
      dosis = (SELECT
          A.valor
        FROM auxiliar AS A
        WHERE A.id = v_dosis),
      unidades = (SELECT
          A.valor
        FROM auxiliar AS A
        WHERE A.id = v_unidades),
      fecha_venta = v_f_venta,
      consentimiento = (SELECT
          P.Fecha_Con
        FROM pacientes AS P
        WHERE P.id = v_id_paciente),
      patologia = v_patologia,
      institucion = (SELECT
          I.nombre
        FROM institucion AS I
        WHERE I.id = v_institucion),
      canal = (SELECT
          C.canal
        FROM canales AS C
        WHERE C.id = v_canal),
      cargado = v_usuario,
      fecha = NOW(),
      tipo = c_tipo,
      padre = c_padre,
      estado = 'Documentacion',
      APM = (SELECT
          A.nombre
        FROM medicos AS M
          LEFT JOIN apm AS A
            ON (M.apm = A.id)
        WHERE M.id = v_medico);


  SET id_2 = (SELECT
      LAST_INSERT_ID());

  IF (id_1 <> id_2) THEN
    RETURN id_2;
  END IF;

  RETURN 'ERROR NO_INSERT';
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
