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

-- Volcando estructura para procedimiento soliris.FU_SET_TMP_MED
DELIMITER //
CREATE PROCEDURE `FU_SET_TMP_MED`(IN `v_apellido` varchar(100),
IN `v_nombre` varchar(100),
IN `v_m_nac` varchar(50),
IN `v_m_prov` varchar(50),
IN `v_email` varchar(100),
IN `v_especialidad` varchar(50),
IN `v_visitador` varchar(100),
IN `v_telefono` varchar(100),
IN `v_provincia` varchar(100),
IN `v_localidad` varchar(100),
IN `v_calle` varchar(100),
IN `v_n_dom` varchar(50),
IN `v_t_c_ate` varchar(50),
IN `v_n_c_ate` varchar(255))
    COMMENT 'Carga de Medicos desde Excel Meditec'
BEGIN

  DECLARE c_m_tipo varchar(30);
  DECLARE c_esp_id int;
  DECLARE c_apm_id int;
  DECLARE c_prov_id int;
  DECLARE c_id_med int; /* ID DEL MEDICO YA CARGADO EN TMP_MED*/
  DECLARE c_id_med_prod int; /* ID DEL MEDICO YA CARGADO EN MEDICOS*/



  SET @apm_v = v_visitador;
  SET @apm_v = CONCAT('%', @apm_v, '%');

  SET c_apm_id = (SELECT
      a.id
    FROM apm a
    WHERE a.nombre LIKE @apm_v);
  SET c_esp_id = (SELECT
      IFNULL((SELECT
          e.id
        FROM especialidad e
        WHERE e.med_siglas = v_especialidad), 99));
  SET c_prov_id = (SELECT
      p.id
    FROM provincias p
    WHERE p.provincia = v_provincia);



  IF (v_m_nac = 0) THEN
    SET c_m_tipo = 'Provincial';
  ELSE
    IF (v_m_prov = 0) THEN
      SET c_m_tipo = 'Nacional';
    ELSE
      SET c_m_tipo = 'Nacional';
    END IF;
  END IF;

  SET c_id_med = (SELECT
      IFNULL((SELECT
          id
        FROM tmp_med
        WHERE apellido = v_apellido
        AND m_nac = v_m_nac
        AND m_prov = v_m_prov
        AND m_tipo = c_m_tipo), 0));
  SET c_id_med_prod = (SELECT
      COUNT(*)
    FROM medicos m
    WHERE m_nac = v_m_nac
    AND m_prov = v_m_prov
    AND m.matricula_tipo = c_m_tipo);

  IF (c_id_med_prod = 0) THEN

    SELECT
      `FU_NEW_MED`(v_apellido, v_nombre, v_m_nac, v_m_prov, v_t_c_ate, v_n_c_ate, v_telefono, '', '', c_prov_id, CONCAT(v_calle, ' ', v_n_dom), v_localidad, '', '', c_apm_id, 'Inactivo', v_email, c_esp_id);

  END IF;


  IF (c_id_med = 0) THEN

    INSERT INTO tmp_med
    SET apellido = v_apellido,
        nombre = v_nombre,
        m_nac = v_m_nac,
        m_prov = v_m_prov,
        email = v_email,
        esp_id = c_esp_id,
        apm_id = c_apm_id,
        telefono = v_telefono,
        prov_id = c_prov_id,
        localidad = v_localidad,
        calle = v_calle,
        n_dom = v_n_dom,
        t_c_ate = v_t_c_ate,
        n_c_ate = v_n_c_ate,
        m_tipo = c_m_tipo;

  ELSEIF (c_id_med > 0) THEN

    UPDATE tmp_med
    SET apellido = v_apellido,
        nombre = v_nombre,
        m_nac = v_m_nac,
        m_prov = v_m_prov,
        email = v_email,
        esp_id = c_esp_id,
        apm_id = c_apm_id,
        telefono = v_telefono,
        prov_id = c_prov_id,
        localidad = v_localidad,
        calle = v_calle,
        n_dom = v_n_dom,
        t_c_ate = v_t_c_ate,
        n_c_ate = v_n_c_ate,
        m_tipo = c_m_tipo

    WHERE id = c_id_med;

  END IF;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
