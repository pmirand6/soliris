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

-- Volcando estructura para disparador soliris.log_institucion_inst
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER log_institucion_inst BEFORE
INSERT ON institucion FOR EACH ROW BEGIN
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='id', tabla='institucion', id_registro=new.id, valor_nuevo=new.id;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='nombre', tabla='institucion', id_registro=new.id, valor_nuevo=new.nombre;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='direccion', tabla='institucion', id_registro=new.id, valor_nuevo=new.direccion;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='altura', tabla='institucion', id_registro=new.id, valor_nuevo=new.altura;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='localidad', tabla='institucion', id_registro=new.id, valor_nuevo=new.localidad;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='provincia', tabla='institucion', id_registro=new.id, valor_nuevo=new.provincia;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='contacto', tabla='institucion', id_registro=new.id, valor_nuevo=new.contacto;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='mail', tabla='institucion', id_registro=new.id, valor_nuevo=new.mail;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='telefono', tabla='institucion', id_registro=new.id, valor_nuevo=new.telefono;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='notas', tabla='institucion', id_registro=new.id, valor_nuevo=new.notas;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='tipo', tabla='institucion', id_registro=new.id, valor_nuevo=new.tipo;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='familia', tabla='institucion', id_registro=new.id, valor_nuevo=new.familia;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='usuario_audit', tabla='institucion', id_registro=new.id, valor_nuevo=new.usuario_audit;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='fecha_audit', tabla='institucion', id_registro=new.id, valor_nuevo=new.fecha_audit;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='reporte', tabla='institucion', id_registro=new.id, valor_nuevo=new.reporte;
INSERT INTO soliris_log SET usuario= USER(), fecha= NOW(), accion='insert', registro='estado_id', tabla='institucion', id_registro=new.id, valor_nuevo=new.estado_id; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
