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

-- Volcando estructura para tabla soliris.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `estado_id` int(11) DEFAULT NULL,
  `rol_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_rol` (`rol_id`),
  KEY `FK_usuario_estado` (`estado_id`),
  CONSTRAINT `FK_usuario_estado` FOREIGN KEY (`estado_id`) REFERENCES `maestro_estado` (`id`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=682;

-- Volcando datos para la tabla soliris.usuario: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `username`, `email`, `estado_id`, `rol_id`) VALUES
	(34, 'dcilveti', 'dcilveti@raffo.com.ar', 1, 1),
	(35, 'gpardo', 'pmiranda@raffo.com.ar', 1, 1),
	(36, 'mnakatsuno', 'pmiranda@raffo.com.ar', 2, 1),
	(37, 'lliloia', 'pmiranda@raffo.com.ar', 1, 4),
	(38, 'msadouet', 'pmiranda@raffo.com.ar', 1, 1),
	(39, 'agonzalez', 'pmiranda@raffo.com.ar', 1, 2),
	(40, 'mcavagion', 'pmiranda@raffo.com.ar', 1, 1),
	(41, 'jkiprizlian', 'pmiranda@raffo.com.ar', 1, 1),
	(42, 'cburgues', 'pmiranda@raffo.com.ar', 1, 1),
	(43, 'marruzazabala', 'pmiranda@raffo.com.ar', 1, 1),
	(44, 'fcastro', 'pmiranda@raffo.com.ar', 1, 1),
	(45, 'aheredia', 'pmiranda@raffo.com.ar', 1, 1),
	(46, 'cbento', 'pmiranda@raffo.com.ar', 1, 5),
	(47, 'splatero', 'pmiranda@raffo.com.ar', 1, 1),
	(48, 'mnorris', 'pmiranda@raffo.com.ar', 1, 1),
	(49, 'dmartinez', 'pmiranda@raffo.com.ar', 1, 1),
	(50, 'pmiranda', 'pmiranda@raffo.com.ar', 1, 5),
	(51, 'sdiazbancalari', 'pmiranda@raffo.com.ar', 1, 1),
	(52, 'rjfernandez', 'pmiranda@raffo.com.ar', 1, 1),
	(53, 'eala', 'pmiranda@raffo.com.ar', 1, 1),
	(54, 'cpalomeque', 'pmiranda@raffo.com.ar', 1, 1),
	(55, 'fzapata', 'pmiranda@raffo.com.ar', 1, 1),
	(56, 'cpenela', 'pmiranda@raffo.com.ar', 1, 1),
	(57, 'sbisceglia', 'pmiranda@raffo.com.ar', 1, 1),
	(58, '', 'pepe@oeoe.com.ar', 1, 3),
	(59, 'cron', 'cron@raffo.com.ar', 1, 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
