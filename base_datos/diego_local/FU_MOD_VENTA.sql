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

-- Volcando estructura para función soliris.FU_MOD_VENTA
DELIMITER //
CREATE FUNCTION `FU_MOD_VENTA`(`v_idMst` int,
`v_f_venta` date,
`v_patologia` longtext,
`v_presentacion` varchar(200),
`v_unidades` int,
`v_institucion` longtext,
`v_canal` varchar(200),
`v_medico` varchar(200),
`v_usuario` varchar(45)) RETURNS longtext CHARSET utf8mb4
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE devolucion longtext;

  UPDATE soliris_maestro
  SET medico = (SELECT
          M.Nombre
        FROM medicos AS M
        WHERE M.id = v_medico),
      presentacion = (SELECT
          A.valor
        FROM auxiliar AS A
        WHERE A.id = v_presentacion),
      unidades = (SELECT
          A.valor
        FROM auxiliar AS A
        WHERE A.id = v_unidades),
      fecha_venta = NOW(),
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
      APM = (SELECT
          A.nombre
        FROM medicos AS M
          LEFT JOIN apm AS A
            ON (M.apm = A.id)
        WHERE M.id = v_medico)
  WHERE id = v_idMst;


  IF (SELECT
        ROW_COUNT() > 0) THEN
    SET devolucion = v_idMst;
  ELSE
    SET devolucion = 'ERROR NO_UPDATE';
  END IF;

  RETURN devolucion;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
