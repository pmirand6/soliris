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

-- Volcando estructura para tabla soliris.cp
CREATE TABLE IF NOT EXISTS `cp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CP` double DEFAULT NULL,
  `Localidad` varchar(255) DEFAULT NULL,
  `provincia_id` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_cp_prov` (`provincia_id`),
  CONSTRAINT `FK_cp_prov` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=98;

-- Volcando datos para la tabla soliris.cp: ~1.000 rows (aproximadamente)
/*!40000 ALTER TABLE `cp` DISABLE KEYS */;
INSERT INTO `cp` (`ID`, `CP`, `Localidad`, `provincia_id`) VALUES
	(1, 62039, 'Alba del Sur', 21),
	(2, 39243, 'Victoria del Sur', 6),
	(3, 2943, 'Villa Valery', 7),
	(4, 99553, 'Ayala del Oeste', 20),
	(5, 5674, 'Gral. Michelle', 6),
	(6, 82144, 'Gral. Valery del Mar', 7),
	(7, 2956, 'Villa Gabriela del Este', 1),
	(8, 5373, 'Chavarría del Mar', 5),
	(9, 65072, 'Jesús del Norte', 22),
	(10, 5721, 'Abeyta del Mar', 9),
	(11, 87838, 'San Juana del Este', 18),
	(12, 2094, 'San Eduardo del Sur', 5),
	(13, 17941, 'Don Guadalupe', 9),
	(14, 2930, 'Gral. Emilio', 5),
	(15, 3106, 'San Abril', 8),
	(16, 1052, 'Rebeca del Mar', 14),
	(17, 7497, 'Martín del Este', 17),
	(18, 7099, 'Leiva del Norte', 12),
	(19, 7951, 'Lorenzo del Oeste', 6),
	(20, 48278, 'Puerto Mariana', 9),
	(21, 2304, 'Villa Abril del Este', 13),
	(22, 72048, 'San Alonso del Oeste', 23),
	(23, 45101, 'Guadalupe del Sur', 8),
	(24, 8107, 'Llamas del Mirador', 8),
	(25, 574, 'Don Andrés del Oeste', 20),
	(26, 48498, 'San Daniela del Este', 11),
	(27, 58088, 'Gral. Ian', 22),
	(28, 2081, 'Villa Mateo del Mar', 12),
	(29, 993, 'Longoria del Este', 16),
	(30, 8871, 'Sergio del Sur', 8),
	(31, 3564, 'Montez del Mirador', 6),
	(32, 74573, 'Puerto Alejandro', 20),
	(33, 428, 'Puerto Leonardo del Sur', 14),
	(34, 17639, 'Gral. Agustín del Oeste', 1),
	(35, 6683, 'Esquivel del Mar', 10),
	(36, 15433, 'Rascón del Mirador', 8),
	(37, 7544, 'Santiago del Mar', 19),
	(38, 10820, 'Valentina del Oeste', 22),
	(39, 6468, 'Gral. Matthew', 21),
	(40, 6223, 'Nicole del Este', 10),
	(41, 5273, 'San Nicole', 6),
	(42, 1240, 'Hugo del Mar', 6),
	(43, 7192, 'Gálvez del Mar', 15),
	(44, 840, 'Nicole del Oeste', 7),
	(45, 7247, 'Hipólito del Mar', 22),
	(46, 3126, 'Emily del Norte', 19),
	(47, 52176, 'Vaca del Mar', 19),
	(48, 7447, 'Gabriela del Sur', 1),
	(49, 53325, 'Puerto Emiliano del Este', 17),
	(50, 67705, 'Don Antonia', 19),
	(51, 59676, 'Villa Micaela', 20),
	(52, 4035, 'Paula del Este', 6),
	(53, 57406, 'Urrutia del Sur', 1),
	(54, 58582, 'Puerto María Camila', 10),
	(55, 7819, 'Alexander del Mar', 2),
	(56, 5461, 'Puerto Damián del Oeste', 9),
	(57, 85707, 'Miguel del Este', 7),
	(58, 5294, 'Don Lola', 10),
	(59, 8136, 'Puerto Juliana', 12),
	(60, 99820, 'Salinas del Oeste', 9),
	(61, 3672, 'Ignacio del Mar', 23),
	(62, 12932, 'Puerto Jacobo', 20),
	(63, 68808, 'Paulina del Mirador', 12),
	(64, 64677, 'Villa Christian', 2),
	(65, 62609, 'Ríos del Mirador', 11),
	(66, 9480, 'Gral. Esteban del Este', 10),
	(67, 86013, 'Hipólito del Oeste', 7),
	(68, 4636, 'Damián del Norte', 6),
	(69, 33508, 'San Martina', 19),
	(70, 20624, 'Altamirano del Mar', 5),
	(71, 8709, 'María Camila del Mar', 23),
	(72, 1399, 'Villa Emily', 11),
	(73, 96317, 'Gral. Ana', 7),
	(74, 39634, 'Adriana del Sur', 17),
	(75, 44303, 'Villa Daniela', 17),
	(76, 41315, 'Don Fabiana del Este', 20),
	(77, 24963, 'Arguello del Mirador', 12),
	(78, 32907, 'Gabriela del Mar', 2),
	(79, 3140, 'Puerto María Camila', 23),
	(80, 7330, 'Leal del Oeste', 8),
	(81, 447, 'Rafael del Este', 16),
	(82, 4351, 'Villa Lola del Oeste', 2),
	(83, 3164, 'Delatorre del Este', 16),
	(84, 6398, 'Don Samuel', 14),
	(85, 3595, 'Puerto Benjamín', 9),
	(86, 5638, 'Puerto Ignacio del Este', 20),
	(87, 9247, 'Romero del Sur', 22),
	(88, 11152, 'Villa Magdalena del Sur', 21),
	(89, 8142, 'Villa Alonso del Sur', 23),
	(90, 2161, 'Villa Lorenzo', 7),
	(91, 1020, 'Camila del Oeste', 4),
	(92, 3192, 'Rosado del Sur', 11),
	(93, 27592, 'Bianca del Norte', 21),
	(94, 1152, 'Villa Nahuel del Mirador', 23),
	(95, 9606, 'Gral. Sara', 18),
	(96, 955, 'San Emilio', 3),
	(97, 66353, 'Padrón del Mirador', 6),
	(98, 76350, 'Julia del Mar', 9),
	(99, 89037, 'Villa Isabella', 15),
	(100, 60588, 'Quintero del Este', 22),
	(101, 9541, 'Gral. Mía del Mirador', 22),
	(102, 1369, 'Jerónimo del Sur', 3),
	(103, 8561, 'Berríos del Norte', 12),
	(104, 30559, 'Don Alejandra', 23),
	(105, 67442, 'Don Camila', 20),
	(106, 9377, 'Villa Luciana', 20),
	(107, 5125, 'Rodrigo del Mar', 3),
	(108, 4114, 'San Facundo del Mar', 9),
	(109, 47314, 'Violeta del Este', 9),
	(110, 3461, 'Espinal del Norte', 9),
	(111, 2600, 'Adriana del Mirador', 5),
	(112, 72440, 'Carla del Este', 5),
	(113, 3364, 'Don Silvana del Mirador', 1),
	(114, 11505, 'Gral. Romina del Mirador', 11),
	(115, 88829, 'Cano del Oeste', 10),
	(116, 87725, 'Aponte del Mirador', 14),
	(117, 2436, 'Villa Andrés', 17),
	(118, 35143, 'Gómez del Este', 13),
	(119, 62064, 'Villa Gabriela', 3),
	(120, 45862, 'Saldaña del Sur', 23),
	(121, 7874, 'Espinosa del Mar', 11),
	(122, 4007, 'Alonso del Sur', 10),
	(123, 37882, 'San Ashley del Norte', 3),
	(124, 4118, 'Villa Camilo', 1),
	(125, 4959, 'Puerto Fátima del Este', 19),
	(126, 1966, 'Venegas del Oeste', 17),
	(127, 8273, 'Agustina del Oeste', 23),
	(128, 60707, 'Olivares del Norte', 16),
	(129, 91018, 'Munguía del Sur', 21),
	(130, 2861, 'Puerto Alex', 9),
	(131, 2545, 'Herrera del Este', 14),
	(132, 8160, 'Aguirre del Sur', 17),
	(133, 7404, 'Horacio del Mar', 5),
	(134, 721, 'Emilio del Sur', 23),
	(135, 3708, 'Gral. María Alejandra', 19),
	(136, 4357, 'San Ashley del Norte', 4),
	(137, 6032, 'Irizarry del Norte', 12),
	(138, 1383, 'Acosta del Oeste', 22),
	(139, 34254, 'Rodríguez del Norte', 3),
	(140, 71803, 'Serna del Norte', 8),
	(141, 84783, 'Rivero del Sur', 10),
	(142, 86252, 'Carlos del Mar', 18),
	(143, 820, 'Don Montserrat', 17),
	(144, 278, 'Villa Julieta', 9),
	(145, 7716, 'Florencia del Sur', 12),
	(146, 447, 'San Valentina', 19),
	(147, 27372, 'Villa Juan Diego del Sur', 23),
	(148, 2925, 'Montalvo del Oeste', 5),
	(149, 5774, 'Ramos del Norte', 9),
	(150, 68790, 'Rodarte del Este', 7),
	(151, 3258, 'Mota del Mirador', 15),
	(152, 76715, 'Felipe del Oeste', 8),
	(153, 9489, 'Gral. Vicente del Mirador', 18),
	(154, 57224, 'Sauceda del Oeste', 7),
	(155, 948, 'Ricardo del Oeste', 7),
	(156, 8106, 'Puerto Ivan', 18),
	(157, 63010, 'Páez del Norte', 12),
	(158, 4423, 'Mateo del Mar', 6),
	(159, 57881, 'Gral. María José del Sur', 4),
	(160, 44977, 'Don Juan José del Oeste', 3),
	(161, 8645, 'Lola del Oeste', 13),
	(162, 3405, 'Gral. Micaela del Norte', 10),
	(163, 84396, 'Briones del Mirador', 2),
	(164, 11183, 'Irene del Sur', 19),
	(165, 60666, 'Rodarte del Norte', 16),
	(166, 47780, 'Puerto Camilo', 16),
	(167, 6770, 'Don Joshua del Mar', 3),
	(168, 5381, 'Puerto Camila del Mirador', 14),
	(169, 43748, 'San Allison del Este', 19),
	(170, 3830, 'Romina del Este', 7),
	(171, 20909, 'San Joaquín', 23),
	(172, 7221, 'Villa Samuel del Oeste', 1),
	(173, 87198, 'Josué del Este', 3),
	(174, 2262, 'Adame del Mar', 16),
	(175, 9040, 'Juliana del Mirador', 12),
	(176, 65086, 'Fátima del Este', 23),
	(177, 6992, 'Don Abigail', 3),
	(178, 9132, 'Álvarez del Sur', 2),
	(179, 45237, 'Fernando del Mirador', 8),
	(180, 3350, 'Villa María Camila', 7),
	(181, 3559, 'Sergio del Mar', 18),
	(182, 90986, 'Rebeca del Oeste', 12),
	(183, 8948, 'Gral. Hugo', 3),
	(184, 8709, 'Palomino del Este', 8),
	(185, 4137, 'Gral. Magdalena del Oeste', 14),
	(186, 5539, 'Gómez del Oeste', 9),
	(187, 47656, 'Sánchez del Mirador', 12),
	(188, 3544, 'Arellano del Mirador', 16),
	(189, 55421, 'San Sara Sofía del Sur', 9),
	(190, 11482, 'Delarosa del Mirador', 14),
	(191, 2752, 'Domínquez del Mirador', 17),
	(192, 441, 'Guadalupe del Oeste', 7),
	(193, 85666, 'San Agustín del Mirador', 12),
	(194, 7517, 'Gral. Gabriel del Norte', 6),
	(195, 17984, 'Don Emilio', 5),
	(196, 4669, 'Villa Juan Manuel del Sur', 17),
	(197, 77848, 'Natalia del Mar', 21),
	(198, 35285, 'Don Oliva', 21),
	(199, 4875, 'Villa Pedro del Norte', 9),
	(200, 9717, 'Don Elizabeth del Mirador', 3),
	(201, 7636, 'Aguilera del Sur', 2),
	(202, 1947, 'Villa Manuela', 19),
	(203, 9348, 'Don Julia', 6),
	(204, 10805, 'Don Miguel Ángel', 5),
	(205, 544, 'Don Camila del Mar', 7),
	(206, 8748, 'Serrato del Mirador', 5),
	(207, 90414, 'Pizarro del Sur', 18),
	(208, 95273, 'Trejo del Este', 13),
	(209, 19457, 'Samantha del Oeste', 13),
	(210, 6512, 'Ivan del Este', 23),
	(211, 7517, 'Don Ana Paula', 16),
	(212, 94200, 'Don Adriana del Norte', 12),
	(213, 93142, 'Puerto Emiliano del Sur', 9),
	(214, 39273, 'Puerto Mario', 11),
	(215, 8599, 'Gral. Cristóbal', 15),
	(216, 6106, 'Juan del Sur', 15),
	(217, 4722, 'Don Luciana', 15),
	(218, 6852, 'Menéndez del Mirador', 17),
	(219, 88633, 'Carmona del Este', 19),
	(220, 41682, 'Ariadna del Oeste', 13),
	(221, 2369, 'Villa Dante', 3),
	(222, 4395, 'Villa Ximena', 5),
	(223, 26880, 'Alcántar del Mirador', 17),
	(224, 6406, 'Tórrez del Este', 16),
	(225, 5578, 'Abeyta del Mirador', 12),
	(226, 3070, 'Gral. Paula del Mar', 19),
	(227, 5291, 'Don Lola del Este', 9),
	(228, 88123, 'Hugo del Norte', 22),
	(229, 64164, 'Madrid del Sur', 19),
	(230, 7761, 'Nava del Norte', 8),
	(231, 76081, 'Puerto Juan José del Este', 5),
	(232, 8190, 'Gral. Josefina del Norte', 8),
	(233, 3951, 'Dante del Oeste', 17),
	(234, 4365, 'Amanda del Norte', 5),
	(235, 9411, 'Ordóñez del Oeste', 15),
	(236, 1300, 'José del Mirador', 9),
	(237, 88171, 'Mariangel del Sur', 21),
	(238, 4227, 'Don Axel', 2),
	(239, 62458, 'Don Felipe del Oeste', 2),
	(240, 1320, 'San Juan', 3),
	(241, 4458, 'Puerto Rodrigo', 20),
	(242, 35635, 'Don Jesús del Oeste', 14),
	(243, 98317, 'Gral. Aarón del Sur', 16),
	(244, 2583, 'Jacobo del Sur', 21),
	(245, 1259, 'Gral. Sofía del Mar', 3),
	(246, 92290, 'Gral. Renata del Norte', 2),
	(247, 7447, 'Don Adriana del Norte', 23),
	(248, 1117, 'San Jorge del Oeste', 22),
	(249, 68602, 'Villa María', 11),
	(250, 6161, 'Cotto del Norte', 11),
	(251, 6936, 'Don Andrés del Este', 20),
	(252, 9313, 'Don Abril', 19),
	(253, 39855, 'Mota del Oeste', 12),
	(254, 2054, 'Don Olivia', 21),
	(255, 86373, 'San Aitana', 22),
	(256, 1110, 'Bañuelos del Norte', 3),
	(257, 841, 'Alonso del Mirador', 2),
	(258, 71545, 'Alessandra del Sur', 3),
	(259, 5583, 'Arellano del Oeste', 19),
	(260, 3887, 'Villalpando del Sur', 1),
	(261, 5562, 'Don Zoe del Mar', 22),
	(262, 2295, 'Don Isabel del Este', 22),
	(263, 96875, 'San Josefa', 16),
	(264, 9260, 'Carrero del Este', 7),
	(265, 3150, 'Manuela del Norte', 10),
	(266, 42355, 'Don Silvana', 7),
	(267, 58365, 'Gral. Juan', 5),
	(268, 37211, 'Puerto Juana del Sur', 12),
	(269, 74927, 'Gral. Clara', 7),
	(270, 3099, 'Ivan del Norte', 8),
	(271, 6455, 'Puerto Julia', 20),
	(272, 2510, 'Puerto Damián del Oeste', 5),
	(273, 81366, 'San Fabiana', 23),
	(274, 84884, 'Don María Alejandra del Este', 2),
	(275, 8943, 'Arteaga del Sur', 18),
	(276, 14185, 'Josefina del Mirador', 2),
	(277, 3775, 'Gral. Violeta del Oeste', 23),
	(278, 2359, 'Don Gael del Norte', 22),
	(279, 18022, 'Amanda del Oeste', 13),
	(280, 62528, 'Matías del Oeste', 7),
	(281, 9033, 'Velázquez del Este', 17),
	(282, 21880, 'Gral. Antonia del Mar', 13),
	(283, 40910, 'Don Montserrat del Este', 13),
	(284, 4709, 'San Pedro', 11),
	(285, 48375, 'Padilla del Mirador', 5),
	(286, 39637, 'María Fernanda del Mar', 9),
	(287, 4191, 'Villa del Sur', 3),
	(288, 2730, 'Gral. María del Mar', 3),
	(289, 666, 'Bianca del Oeste', 20),
	(290, 22785, 'Luna del Norte', 16),
	(291, 35603, 'Solorio del Mirador', 22),
	(292, 2731, 'Holguín del Norte', 7),
	(293, 47464, 'Puerto Alexa', 10),
	(294, 6506, 'Delacrúz del Norte', 23),
	(295, 56892, 'Don Agustín del Sur', 21),
	(296, 2083, 'Josefa del Oeste', 7),
	(297, 9244, 'Don Elena', 5),
	(298, 14121, 'Lucas del Este', 18),
	(299, 76511, 'Catalina del Sur', 5),
	(300, 7377, 'Bueno del Mirador', 6),
	(301, 1934, 'Santillán del Sur', 21),
	(302, 4709, 'Villa José', 6),
	(303, 39888, 'Razo del Norte', 15),
	(304, 2754, 'Gral. Jerónimo', 9),
	(305, 8748, 'Gral. Fernando', 13),
	(306, 3121, 'Gral. Zoe del Norte', 20),
	(307, 5369, 'Regina del Mirador', 8),
	(308, 47460, 'Don Javier', 14),
	(309, 32556, 'Don Andrea del Sur', 18),
	(310, 95034, 'Villa David', 8),
	(311, 9004, 'Vargas del Mar', 6),
	(312, 6557, 'Renata del Mirador', 22),
	(313, 67929, 'Montez del Mar', 11),
	(314, 6115, 'Villa Natalia', 13),
	(315, 42188, 'Catalina del Este', 17),
	(316, 88288, 'Villa Alonso', 4),
	(317, 5517, 'Sara del Norte', 14),
	(318, 10690, 'Gral. Manuela del Este', 10),
	(319, 39184, 'Ureña del Mirador', 3),
	(320, 33018, 'Guzmán del Mar', 21),
	(321, 96705, 'Candelaria del Norte', 15),
	(322, 8903, 'Don Agustín', 5),
	(323, 8772, 'Villagómez del Mar', 12),
	(324, 3736, 'Trejo del Norte', 20),
	(325, 93346, 'Don Nahuel del Este', 21),
	(326, 74216, 'San Samantha', 14),
	(327, 6385, 'Quezada del Norte', 20),
	(328, 6496, 'Jorge del Mirador', 4),
	(329, 1116, 'Lucía del Mirador', 20),
	(330, 28394, 'Enríquez del Sur', 5),
	(331, 3414, 'San Ariana', 16),
	(332, 127, 'Villa Amanda del Oeste', 1),
	(333, 7457, 'Don Renata del Oeste', 18),
	(334, 9591, 'Villa Bruno', 21),
	(335, 1801, 'Gral. Camila', 15),
	(336, 399, 'Aarón del Oeste', 6),
	(337, 8429, 'Solorio del Mirador', 18),
	(338, 2088, 'Páez del Este', 10),
	(339, 80269, 'Don Sebastián del Mirador', 1),
	(340, 8152, 'San Thiago del Mirador', 20),
	(341, 14699, 'Villa Montserrat', 1),
	(342, 78155, 'Catalina del Sur', 15),
	(343, 5534, 'Sedillo del Oeste', 16),
	(344, 2827, 'Silvana del Sur', 13),
	(345, 6551, 'Valery del Norte', 16),
	(346, 5270, 'Rincón del Mirador', 23),
	(347, 49327, 'Villa Paula del Oeste', 9),
	(348, 35744, 'Tamayo del Este', 15),
	(349, 4005, 'Gabriel del Norte', 6),
	(350, 864, 'Gral. Camila del Norte', 22),
	(351, 2694, 'Villa Silvana', 13),
	(352, 7395, 'Juárez del Oeste', 6),
	(353, 6737, 'Villa Matías', 12),
	(354, 13185, 'Puerto Emma del Este', 5),
	(355, 2610, 'Garrido del Norte', 20),
	(356, 16150, 'Puerto Luana del Norte', 22),
	(357, 4012, 'Constanza del Oeste', 2),
	(358, 77660, 'San Carolina del Mar', 16),
	(359, 50, 'San María Paula', 6),
	(360, 1965, 'Sophie del Sur', 19),
	(361, 23404, 'Don Sofía del Norte', 10),
	(362, 86664, 'Julieta del Sur', 14),
	(363, 1929, 'Villa Ivanna', 10),
	(364, 6005, 'Gral. Amelia', 18),
	(365, 59972, 'Gral. Delfina', 5),
	(366, 74679, 'Don Francisco', 10),
	(367, 35776, 'Daniel del Mirador', 14),
	(368, 24986, 'Don Martina del Este', 17),
	(369, 36328, 'Puerto Michelle', 18),
	(370, 3604, 'Centeno del Mar', 13),
	(371, 1828, 'Don Luis del Mar', 23),
	(372, 9790, 'Violeta del Norte', 6),
	(373, 50085, 'Peña del Oeste', 16),
	(374, 9473, 'Gral. Bautista', 15),
	(375, 7434, 'San Antonia', 13),
	(376, 8972, 'Martina del Este', 14),
	(377, 20426, 'Pablo del Mirador', 11),
	(378, 2546, 'Don Manuel del Mirador', 18),
	(379, 6505, 'Delfina del Mirador', 4),
	(380, 6858, 'Allison del Mar', 13),
	(381, 31564, 'Gral. Rafael del Este', 14),
	(382, 15362, 'Bautista del Mirador', 3),
	(383, 4933, 'Gral. Paulina del Norte', 12),
	(384, 76872, 'Don Isabel', 5),
	(385, 5329, 'Villa Juan Manuel', 18),
	(386, 31636, 'Puerto Juan David', 18),
	(387, 7939, 'Abreu del Este', 14),
	(388, 16684, 'Quintana del Oeste', 19),
	(389, 9863, 'San Florencia del Sur', 16),
	(390, 473, 'Puerto Sophie', 12),
	(391, 6036, 'Lola del Mirador', 1),
	(392, 4157, 'Villa Antonia', 1),
	(393, 9419, 'Ortega del Norte', 16),
	(394, 4614, 'San Joaquín', 3),
	(395, 1083, 'Don Agustina del Este', 2),
	(396, 4138, 'Don Antonella', 13),
	(397, 9734, 'Piña del Este', 22),
	(398, 1762, 'Villa Christopher del Mirador', 15),
	(399, 1854, 'Don Alan', 8),
	(400, 46904, 'Gral. Kevin', 3),
	(401, 84965, 'Vargas del Mar', 18),
	(402, 73378, 'Antonio del Oeste', 22),
	(403, 44650, 'Pichardo del Sur', 1),
	(404, 98442, 'Andrés del Norte', 22),
	(405, 8786, 'Martina del Norte', 3),
	(406, 63456, 'Villa Florencia del Sur', 11),
	(407, 2025, 'San Bautista del Oeste', 15),
	(408, 38104, 'Chavarría del Mirador', 11),
	(409, 9455, 'Gral. Axel del Mirador', 15),
	(410, 3666, 'Sánchez del Este', 4),
	(411, 42860, 'Villa Mariana del Este', 10),
	(412, 2580, 'Ochoa del Mirador', 17),
	(413, 5697, 'Gral. Florencia', 13),
	(414, 98461, 'Puerto Ariana del Sur', 2),
	(415, 7334, 'Gral. Isidora del Mirador', 5),
	(416, 23243, 'Villa María Alejandra', 14),
	(417, 64466, 'Mía del Este', 23),
	(418, 91447, 'Vargas del Mirador', 9),
	(419, 76140, 'San Emmanuel del Este', 1),
	(420, 5324, 'Anguiano del Norte', 11),
	(421, 55805, 'Montserrat del Oeste', 17),
	(422, 9540, 'Gral. Christian del Sur', 14),
	(423, 4889, 'Gral. Cristóbal del Mar', 22),
	(424, 16160, 'Abigail del Mirador', 15),
	(425, 18312, 'Juan José del Sur', 2),
	(426, 86945, 'Fernández del Este', 10),
	(427, 6217, 'Leyva del Mar', 11),
	(428, 36681, 'Don Carlos del Este', 3),
	(429, 59816, 'Flórez del Mar', 12),
	(430, 13537, 'Hidalgo del Mirador', 1),
	(431, 588, 'Gral. Luana', 16),
	(432, 65, 'Silvana del Este', 5),
	(433, 54456, 'Alaniz del Oeste', 23),
	(434, 3762, 'Gral. Antonia del Oeste', 19),
	(435, 5509, 'Munguía del Mar', 19),
	(436, 8944, 'Mondragón del Mirador', 8),
	(437, 58411, 'Don Salomé del Este', 7),
	(438, 84015, 'Pichardo del Mar', 2),
	(439, 33609, 'Alejandro del Mar', 7),
	(440, 5911, 'Gral. Regina del Mirador', 23),
	(441, 52468, 'Villa Simón del Norte', 19),
	(442, 3578, 'Rosales del Este', 3),
	(443, 30917, 'San Andrés', 17),
	(444, 88017, 'Silvana del Sur', 3),
	(445, 10008, 'Sergio del Oeste', 9),
	(446, 1693, 'San Daniela del Sur', 9),
	(447, 4030, 'Villa Mateo', 5),
	(448, 9898, 'Puerto Juan José', 6),
	(449, 2267, 'Don Franco', 16),
	(450, 3525, 'Arroyo del Mar', 3),
	(451, 58541, 'Centeno del Este', 4),
	(452, 986, 'Villa Julieta del Oeste', 6),
	(453, 5514, 'Puerto Santino del Norte', 12),
	(454, 7846, 'Puerto Alejandro', 6),
	(455, 59578, 'Micaela del Mirador', 11),
	(456, 10129, 'Roldán del Este', 15),
	(457, 83526, 'Villa Agustín del Sur', 17),
	(458, 46701, 'Gral. Alma del Mar', 13),
	(459, 9365, 'Sebastián del Norte', 21),
	(460, 121, 'Cabrera del Sur', 23),
	(461, 9467, 'Alonso del Oeste', 22),
	(462, 26673, 'Sara Sofía del Mar', 21),
	(463, 12404, 'Villa Julia del Este', 6),
	(464, 9884, 'Diego Alejandro del Mirador', 23),
	(465, 37632, 'Tello del Oeste', 20),
	(466, 6793, 'Andrés del Este', 16),
	(467, 90685, 'Montserrat del Sur', 11),
	(468, 28458, 'Javier del Este', 2),
	(469, 27199, 'Puerto Oliva del Mar', 3),
	(470, 16937, 'Gral. Fátima', 2),
	(471, 92600, 'María Paula del Oeste', 22),
	(472, 94993, 'Narváez del Norte', 20),
	(473, 6528, 'Macías del Este', 20),
	(474, 2833, 'Gral. Ana del Norte', 9),
	(475, 46042, 'Villarreal del Mar', 20),
	(476, 59645, 'Juan David del Oeste', 17),
	(477, 41766, 'Santino del Norte', 17),
	(478, 7730, 'Gral. Gabriela del Este', 8),
	(479, 52241, 'Benítez del Oeste', 15),
	(480, 70893, 'San Ornela del Mar', 11),
	(481, 40808, 'Ashley del Oeste', 9),
	(482, 4435, 'Villa Natalia del Este', 13),
	(483, 4002, 'Puerto Fátima', 2),
	(484, 7762, 'Gral. Alejandro', 2),
	(485, 561, 'Franco del Oeste', 4),
	(486, 57401, 'Villa Gabriela', 12),
	(487, 93223, 'Don Christian del Este', 13),
	(488, 407, 'Gral. Florencia', 3),
	(489, 5456, 'Antonio del Mirador', 10),
	(490, 7930, 'Puerto Clara del Norte', 10),
	(491, 9429, 'Torres del Este', 20),
	(492, 52065, 'Don Juana', 18),
	(493, 2934, 'Puerto Sebastián', 8),
	(494, 195, 'Elena del Mirador', 15),
	(495, 5859, 'Pérez del Oeste', 4),
	(496, 2801, 'Villa Franco del Sur', 20),
	(497, 2009, 'Sara del Mar', 18),
	(498, 98038, 'Guajardo del Oeste', 4),
	(499, 7245, 'Gral. Alessandra del Este', 12),
	(500, 3113, 'Mateo del Sur', 1),
	(501, 15540, 'Samuel del Mar', 17),
	(502, 3335, 'Romero del Mirador', 22),
	(503, 53412, 'Lautaro del Oeste', 10),
	(504, 535, 'San Jazmín del Este', 3),
	(505, 93438, 'Rodrigo del Este', 13),
	(506, 6421, 'Rebeca del Sur', 17),
	(507, 952, 'José del Norte', 17),
	(508, 202, 'Osorio del Oeste', 20),
	(509, 543, 'Jorge del Este', 11),
	(510, 9531, 'Puerto Christian', 13),
	(511, 94656, 'Juan Manuel del Mirador', 9),
	(512, 6599, 'San Hidalgo del Mar', 13),
	(513, 2910, 'Don Agustín', 20),
	(514, 7471, 'Altamirano del Oeste', 2),
	(515, 34540, 'Elizabeth del Oeste', 15),
	(516, 5598, 'Montalvo del Mirador', 17),
	(517, 7329, 'Cervántez del Este', 5),
	(518, 80039, 'Constanza del Este', 22),
	(519, 8934, 'Valdés del Sur', 17),
	(520, 9561, 'Villa Damián del Oeste', 1),
	(521, 30201, 'Villa Anthony del Sur', 16),
	(522, 1131, 'Jazmín del Norte', 22),
	(523, 82510, 'San Ximena', 12),
	(524, 92909, 'Camacho del Oeste', 17),
	(525, 96087, 'Julieta del Mirador', 2),
	(526, 4934, 'Madera del Este', 15),
	(527, 7728, 'Matías del Norte', 17),
	(528, 62, 'Paula del Sur', 18),
	(529, 21242, 'Don Emily del Mar', 20),
	(530, 32212, 'Oquendo del Oeste', 20),
	(531, 9029, 'Gral. Mía del Sur', 2),
	(532, 5168, 'Don María Paula del Este', 19),
	(533, 1661, 'Chapa del Mar', 12),
	(534, 243, 'Esteban del Mar', 19),
	(535, 2258, 'Puerto Ian', 16),
	(536, 25376, 'Lorenzo del Sur', 18),
	(537, 35902, 'Don Michelle', 18),
	(538, 62040, 'Villa Javier', 18),
	(539, 6804, 'Puerto Alexa', 11),
	(540, 1595, 'Villa José del Sur', 18),
	(541, 34051, 'Colón del Este', 17),
	(542, 3644, 'San Mateo', 21),
	(543, 32551, 'Puerto Daniel', 3),
	(544, 103, 'Don María Camila del Mirador', 8),
	(545, 772, 'Irizarry del Mirador', 4),
	(546, 8693, 'San Mateo del Mar', 10),
	(547, 84915, 'Juan Pablo del Este', 6),
	(548, 78909, 'Girón del Norte', 18),
	(549, 5518, 'San Mateo del Sur', 21),
	(550, 55640, 'Gral. Christian del Mar', 6),
	(551, 3659, 'Villa Juan Pablo', 8),
	(552, 38035, 'Villa Alessandra del Norte', 23),
	(553, 80340, 'Duarte del Mirador', 23),
	(554, 70369, 'Lovato del Sur', 11),
	(555, 4335, 'Puerto Constanza', 18),
	(556, 5212, 'San Miranda del Norte', 14),
	(557, 339, 'Don Josefa del Mirador', 13),
	(558, 6520, 'San Jerónimo del Mar', 16),
	(559, 59651, 'Ibarra del Norte', 5),
	(560, 1714, 'Gral. Miranda del Este', 5),
	(561, 82309, 'Bravo del Sur', 18),
	(562, 9496, 'Juan Manuel del Mar', 8),
	(563, 81157, 'Puerto Elena del Oeste', 2),
	(564, 70677, 'Villa Mateo', 14),
	(565, 23004, 'San Sebastián', 21),
	(566, 59520, 'Laura del Mirador', 23),
	(567, 28628, 'Jorge del Norte', 23),
	(568, 3007, 'Paredes del Mirador', 10),
	(569, 8253, 'Leonardo del Mar', 3),
	(570, 7004, 'Montserrat del Mar', 11),
	(571, 25065, 'Guevara del Este', 7),
	(572, 33989, 'San Antonella del Mirador', 16),
	(573, 333, 'San Ashley del Mirador', 22),
	(574, 36354, 'Luis del Norte', 6),
	(575, 1833, 'Villegas del Mar', 10),
	(576, 4945, 'Puerto Samantha del Oeste', 9),
	(577, 11827, 'Juan Sebastián del Norte', 17),
	(578, 5308, 'Villa Victoria', 6),
	(579, 5589, 'Lautaro del Mar', 21),
	(580, 16208, 'Puerto Nicole del Sur', 22),
	(581, 3268, 'Villa María Paula', 19),
	(582, 78200, 'Maestas del Sur', 13),
	(583, 1811, 'Mía del Norte', 12),
	(584, 8876, 'Juan Sebastián del Este', 21),
	(585, 78314, 'Adame del Oeste', 12),
	(586, 2498, 'Kevin del Este', 17),
	(587, 38261, 'Gral. María José del Norte', 8),
	(588, 16339, 'Don Rodrigo del Oeste', 23),
	(589, 86282, 'Julián del Oeste', 1),
	(590, 79030, 'Felipe del Sur', 22),
	(591, 6872, 'Renata del Mirador', 10),
	(592, 7363, 'Don Dylan del Mirador', 3),
	(593, 32968, 'Esparza del Sur', 19),
	(594, 95077, 'San Hipólito', 23),
	(595, 79372, 'Don Sophie', 7),
	(596, 46625, 'Gral. Micaela', 19),
	(597, 77090, 'Villa Bautista', 17),
	(598, 1859, 'Hidalgo del Mirador', 7),
	(599, 66405, 'Solís del Sur', 20),
	(600, 74399, 'Samantha del Sur', 18),
	(601, 5628, 'Domínquez del Norte', 23),
	(602, 12304, 'Don Abril del Este', 20),
	(603, 98437, 'Abrego del Mar', 5),
	(604, 7863, 'Don Thiago del Oeste', 22),
	(605, 82431, 'Herrera del Mirador', 20),
	(606, 86240, 'Juan José del Norte', 5),
	(607, 5319, 'Cotto del Norte', 21),
	(608, 3079, 'Benavides del Mar', 22),
	(609, 27527, 'Gral. Oliva', 10),
	(610, 4035, 'Alex del Norte', 14),
	(611, 30801, 'Tafoya del Sur', 23),
	(612, 3803, 'Villa Mario del Sur', 1),
	(613, 3350, 'Mario del Mar', 13),
	(614, 6438, 'Mondragón del Mar', 19),
	(615, 9331, 'Don Camila', 19),
	(616, 2665, 'Delarosa del Norte', 2),
	(617, 1979, 'Carla del Este', 7),
	(618, 5334, 'San Samantha', 23),
	(619, 36390, 'Adrián del Sur', 10),
	(620, 147, 'Don Alma', 18),
	(621, 8441, 'Villa Allison', 23),
	(622, 2221, 'Luciano del Norte', 20),
	(623, 53468, 'Puerto Andrea del Mirador', 20),
	(624, 84315, 'Renata del Este', 8),
	(625, 49458, 'Escamilla del Este', 13),
	(626, 27841, 'Reynoso del Mirador', 16),
	(627, 97304, 'Don Sophie del Norte', 15),
	(628, 3933, 'Puerto Dylan', 18),
	(629, 8571, 'Gral. María Alejandra', 16),
	(630, 6487, 'Pulido del Mirador', 10),
	(631, 6967, 'Miranda del Este', 10),
	(632, 98322, 'Alexander del Oeste', 7),
	(633, 5130, 'San Jesús del Mar', 14),
	(634, 799, 'Puerto Amelia', 16),
	(635, 82976, 'Lugo del Sur', 11),
	(636, 6057, 'Villa Fabiana del Norte', 9),
	(637, 4164, 'Juliana del Norte', 4),
	(638, 6798, 'Don Valentino', 17),
	(639, 36886, 'Valentino del Mirador', 10),
	(640, 58208, 'Villa Matthew', 16),
	(641, 34017, 'Granados del Mar', 5),
	(642, 2947, 'Florencia del Oeste', 11),
	(643, 64439, 'Villa Clara del Mirador', 7),
	(644, 65719, 'Don Ana', 13),
	(645, 4067, 'Solorzano del Oeste', 13),
	(646, 3476, 'Pedro del Mar', 22),
	(647, 24023, 'Gral. Ariana del Mar', 2),
	(648, 33714, 'Anthony del Mar', 11),
	(649, 9216, 'Santiago del Norte', 2),
	(650, 1533, 'Miguel Ángel del Norte', 14),
	(651, 9624, 'Gral. Ana', 12),
	(652, 14260, 'Villa Mariangel', 1),
	(653, 5837, 'Josefina del Este', 11),
	(654, 5251, 'Puerto Juan José del Este', 18),
	(655, 71376, 'Laura del Mirador', 4),
	(656, 9853, 'Gral. Delfina', 7),
	(657, 93080, 'Montserrat del Mar', 6),
	(658, 2504, 'San Nahuel del Oeste', 11),
	(659, 1856, 'Puerto Adriana del Sur', 7),
	(660, 3128, 'Puerto Aitana del Oeste', 20),
	(661, 3012, 'Villa Luciana', 13),
	(662, 4681, 'Villa Benjamín', 18),
	(663, 50409, 'Chávez del Norte', 8),
	(664, 1509, 'Villa Hidalgo del Mirador', 23),
	(665, 9202, 'San Adriana del Mirador', 2),
	(666, 4847, 'Puerto Alejandro', 3),
	(667, 25638, 'Mireles del Norte', 5),
	(668, 3474, 'Mariana del Mirador', 9),
	(669, 44993, 'Don Paula', 3),
	(670, 48725, 'Puerto Florencia', 8),
	(671, 41607, 'Don Miranda del Oeste', 11),
	(672, 8724, 'Villa Sara del Este', 5),
	(673, 25857, 'Gabriel del Mirador', 18),
	(674, 30581, 'Gael del Mirador', 20),
	(675, 3892, 'Guerra del Sur', 5),
	(676, 4327, 'Gálvez del Mirador', 16),
	(677, 2154, 'Puerto Bruno del Sur', 18),
	(678, 8856, 'Don Paulina', 23),
	(679, 28188, 'San Daniel', 3),
	(680, 147, 'Alaniz del Mar', 16),
	(681, 3005, 'Estrada del Este', 12),
	(682, 5999, 'Olmos del Mar', 5),
	(683, 7005, 'Palomino del Norte', 2),
	(684, 8188, 'María Paula del Mar', 12),
	(685, 43895, 'San Irene', 12),
	(686, 4170, 'Reynoso del Oeste', 8),
	(687, 6524, 'Villa Dylan', 3),
	(688, 68819, 'Antonio del Mar', 14),
	(689, 345, 'Gral. Anthony del Mirador', 4),
	(690, 8620, 'Portillo del Mirador', 13),
	(691, 9039, 'Carrasquillo del Mirador', 9),
	(692, 3174, 'Almanza del Oeste', 13),
	(693, 4540, 'Puerto Valeria', 5),
	(694, 94674, 'Victoria del Sur', 12),
	(695, 87084, 'Gaytán del Sur', 6),
	(696, 9093, 'Medrano del Norte', 12),
	(697, 603, 'Gral. Mía', 14),
	(698, 5267, 'Villa Clara', 18),
	(699, 3026, 'San María Camila del Sur', 17),
	(700, 7257, 'Montserrat del Norte', 16),
	(701, 529, 'Gral. Bruno', 11),
	(702, 787, 'Adame del Oeste', 13),
	(703, 39760, 'Alex del Mirador', 13),
	(704, 43654, 'Villa Vicente', 20),
	(705, 5084, 'Sierra del Oeste', 16),
	(706, 7177, 'Puerto Ashley', 13),
	(707, 6996, 'Ignacio del Mar', 23),
	(708, 15879, 'Villa Emilia del Sur', 10),
	(709, 3084, 'Villa Lorenzo del Sur', 12),
	(710, 32162, 'Puerto Franco', 14),
	(711, 65262, 'Puerto Amelia', 23),
	(712, 8953, 'Gral. Hipólito', 12),
	(713, 43912, 'José del Mar', 19),
	(714, 93178, 'Delfina del Oeste', 15),
	(715, 3588, 'San José', 11),
	(716, 1502, 'San Lola del Mirador', 6),
	(717, 3758, 'Gral. Facundo', 7),
	(718, 5928, 'Prieto del Mirador', 22),
	(719, 60681, 'Sara Sofía del Norte', 20),
	(720, 15910, 'Antonio del Mar', 19),
	(721, 12234, 'Don Rafaela del Sur', 15),
	(722, 8601, 'Gral. Agustina', 2),
	(723, 64350, 'Cervantes del Mirador', 13),
	(724, 3373, 'Puerto Olivia del Sur', 5),
	(725, 59264, 'Valentino del Sur', 18),
	(726, 28574, 'Don Daniela del Norte', 13),
	(727, 1458, 'Christian del Mar', 4),
	(728, 2103, 'Miranda del Este', 2),
	(729, 63605, 'Villa Julia', 4),
	(730, 88960, 'Sophie del Mar', 1),
	(731, 76045, 'Don Gabriel del Sur', 23),
	(732, 2553, 'Ana Sofía del Sur', 23),
	(733, 92313, 'Don Pablo', 21),
	(734, 92452, 'Fabiana del Norte', 21),
	(735, 38805, 'Villa Adriana', 8),
	(736, 5578, 'Santana del Sur', 18),
	(737, 7254, 'Esteban del Mar', 12),
	(738, 75673, 'María José del Mar', 11),
	(739, 3351, 'Gral. Emilia del Norte', 16),
	(740, 8514, 'Puerto Alan', 9),
	(741, 86008, 'San Miguel Ángel', 2),
	(742, 4022, 'Amanda del Mirador', 5),
	(743, 3929, 'Puerto María Alejandra', 22),
	(744, 4002, 'Gral. Axel', 19),
	(745, 96931, 'Olivia del Este', 3),
	(746, 40895, 'Ivan del Mirador', 20),
	(747, 76589, 'Vélez del Norte', 22),
	(748, 74189, 'Gral. Delfina', 6),
	(749, 8094, 'Gral. Juan José', 6),
	(750, 9308, 'Valle del Este', 11),
	(751, 79073, 'Villa Juan', 21),
	(752, 9609, 'Gastélum del Mirador', 7),
	(753, 69024, 'Montoya del Sur', 17),
	(754, 10663, 'Don Jerónimo', 11),
	(755, 7790, 'Gral. Constanza del Sur', 20),
	(756, 89455, 'Reynoso del Mar', 5),
	(757, 21898, 'San Gabriela del Oeste', 1),
	(758, 8274, 'Puerto Luis', 4),
	(759, 88791, 'Juan del Este', 5),
	(760, 47386, 'Villa Alexander', 18),
	(761, 13810, 'Catalina del Este', 16),
	(762, 63950, 'Don Gabriel', 16),
	(763, 1941, 'Aranda del Sur', 3),
	(764, 9381, 'Ivan del Mar', 1),
	(765, 6315, 'Ocampo del Este', 13),
	(766, 7256, 'Araña del Este', 22),
	(767, 3129, 'Puerto Pedro', 7),
	(768, 2617, 'Horacio del Sur', 16),
	(769, 93660, 'San Magdalena', 12),
	(770, 93537, 'Villa Abril del Este', 4),
	(771, 69556, 'Arevalo del Norte', 2),
	(772, 9594, 'San Carolina del Mar', 5),
	(773, 3193, 'Alonso del Mirador', 6),
	(774, 4197, 'Hidalgo del Mar', 7),
	(775, 1753, 'Puerto Miranda del Este', 5),
	(776, 93612, 'Rubio del Oeste', 10),
	(777, 7690, 'Linares del Este', 19),
	(778, 7256, 'Villa Alejandra del Mirador', 14),
	(779, 9999, 'Marroquín del Este', 4),
	(780, 73375, 'San Axel del Mirador', 4),
	(781, 65290, 'San Isaac', 2),
	(782, 3754, 'Villa Regina del Oeste', 21),
	(783, 16037, 'Avilés del Sur', 14),
	(784, 7241, 'Isabel del Mirador', 21),
	(785, 4613, 'Puerto Sebastián del Oeste', 16),
	(786, 7333, 'Barreto del Norte', 3),
	(787, 8221, 'Villa Eduardo', 7),
	(788, 54068, 'Puerto Santiago', 7),
	(789, 6815, 'Juan Sebastián del Oeste', 19),
	(790, 56853, 'Gral. Mariana', 1),
	(791, 3653, 'Camarillo del Este', 8),
	(792, 49315, 'Adrián del Mar', 10),
	(793, 44817, 'Puerto Violeta del Sur', 10),
	(794, 4611, 'Villa Victoria del Este', 11),
	(795, 3910, 'Rosado del Mirador', 3),
	(796, 79441, 'Montañez del Sur', 9),
	(797, 71516, 'Puerto Ariana del Sur', 21),
	(798, 23706, 'Mateo del Este', 20),
	(799, 29808, 'Valentino del Norte', 7),
	(800, 2497, 'Anthony del Este', 7),
	(801, 20139, 'Puerto Bruno', 14),
	(802, 85408, 'Don Emma', 22),
	(803, 6672, 'Gral. Ximena del Mirador', 6),
	(804, 95481, 'Carlos del Mar', 23),
	(805, 89951, 'San Valeria del Norte', 17),
	(806, 7977, 'Daniela del Norte', 19),
	(807, 50962, 'Puerto Kevin', 7),
	(808, 7610, 'Anthony del Sur', 17),
	(809, 1591, 'Don Jorge', 17),
	(810, 2339, 'Daniel del Sur', 9),
	(811, 2863, 'Ferrer del Mar', 4),
	(812, 15850, 'Gral. Emmanuel', 23),
	(813, 2878, 'Don Bautista del Mirador', 17),
	(814, 41112, 'Puerto Ana Paula', 14),
	(815, 42962, 'Juan Manuel del Este', 21),
	(816, 8697, 'Marín del Mirador', 11),
	(817, 9535, 'Don Paula del Este', 19),
	(818, 97170, 'Calderón del Mirador', 15),
	(819, 3516, 'Mía del Este', 12),
	(820, 29807, 'Villa Dante', 19),
	(821, 17528, 'San Julián del Norte', 21),
	(822, 7108, 'Villa Montserrat del Sur', 6),
	(823, 2143, 'Sophie del Oeste', 22),
	(824, 489, 'Jesús del Sur', 8),
	(825, 165, 'Alejandra del Mar', 18),
	(826, 3959, 'Antonia del Sur', 9),
	(827, 73442, 'San Olivia del Mirador', 20),
	(828, 70775, 'Puerto Felipe del Oeste', 9),
	(829, 50089, 'Ruelas del Oeste', 12),
	(830, 23911, 'Puerto Francisco del Sur', 15),
	(831, 6266, 'Zarate del Oeste', 23),
	(832, 64686, 'Soria del Oeste', 10),
	(833, 12251, 'Samantha del Sur', 22),
	(834, 18258, 'Magdalena del Oeste', 6),
	(835, 47608, 'Gral. Luciana', 2),
	(836, 45133, 'Bruno del Este', 16),
	(837, 28102, 'Gral. Elena', 6),
	(838, 36185, 'Ornela del Mar', 14),
	(839, 6825, 'Don Emiliano del Oeste', 13),
	(840, 6580, 'Josué del Oeste', 10),
	(841, 3900, 'Bueno del Sur', 19),
	(842, 41285, 'Vélez del Mirador', 13),
	(843, 60274, 'Gallardo del Mirador', 21),
	(844, 8105, 'Angulo del Este', 15),
	(845, 55491, 'Fonseca del Mirador', 9),
	(846, 25390, 'León del Oeste', 4),
	(847, 3630, 'María José del Mirador', 9),
	(848, 67226, 'Hurtado del Oeste', 3),
	(849, 54091, 'San Ana Sofía', 14),
	(850, 2054, 'Villa Hipólito del Sur', 7),
	(851, 5311, 'Ignacio del Mirador', 10),
	(852, 7608, 'Javier del Mar', 17),
	(853, 41894, 'Josué del Este', 15),
	(854, 8032, 'Puerto Máximo del Oeste', 20),
	(855, 17178, 'Valery del Sur', 1),
	(856, 2900, 'Puerto Ivanna del Este', 20),
	(857, 85221, 'Guajardo del Oeste', 14),
	(858, 19623, 'Gral. Christian del Sur', 1),
	(859, 3377, 'Gral. Sebastián', 21),
	(860, 5675, 'Gral. Valery', 16),
	(861, 75063, 'Adriana del Norte', 4),
	(862, 4380, 'Gral. Axel', 12),
	(863, 21668, 'Olivia del Oeste', 8),
	(864, 5688, 'San Valentino', 4),
	(865, 72062, 'Serrano del Este', 10),
	(866, 6021, 'Puerto Carlos', 9),
	(867, 3028, 'Villa María Camila del Mirador', 11),
	(868, 8457, 'Don Sergio del Sur', 16),
	(869, 5293, 'Villa Máximo del Oeste', 19),
	(870, 7215, 'Hipólito del Sur', 13),
	(871, 2132, 'San Santino del Sur', 19),
	(872, 8411, 'San Valeria', 4),
	(873, 79023, 'Villa Juan Esteban del Norte', 9),
	(874, 67842, 'Don Alan', 12),
	(875, 32501, 'San Valeria del Oeste', 19),
	(876, 57204, 'Vaca del Sur', 16),
	(877, 1447, 'Padrón del Oeste', 18),
	(878, 6303, 'Don Ana Sofía', 6),
	(879, 3489, 'José del Este', 18),
	(880, 8230, 'Laura del Mar', 6),
	(881, 3510, 'Villa Adrián', 12),
	(882, 3717, 'Godínez del Mirador', 11),
	(883, 69536, 'Gral. Fabiana del Este', 12),
	(884, 7905, 'Abril del Oeste', 8),
	(885, 2922, 'San Máximo del Este', 5),
	(886, 3916, 'María Fernanda del Mirador', 19),
	(887, 47870, 'Isabella del Oeste', 1),
	(888, 6504, 'San Michelle', 9),
	(889, 94044, 'Márquez del Norte', 18),
	(890, 9482, 'Urías del Este', 12),
	(891, 3205, 'San Samantha del Norte', 13),
	(892, 95938, 'Puerto Amelia del Este', 1),
	(893, 56300, 'Vélez del Norte', 14),
	(894, 45893, 'Gral. Fernando', 16),
	(895, 13444, 'Apodaca del Mirador', 2),
	(896, 54185, 'Ramón del Norte', 2),
	(897, 357, 'Gral. Nahuel del Norte', 5),
	(898, 23324, 'Mascareñas del Mar', 9),
	(899, 87484, 'San Valery', 15),
	(900, 31269, 'Puerto Isabella del Mirador', 4),
	(901, 32097, 'Valencia del Este', 5),
	(902, 75518, 'Cardona del Este', 16),
	(903, 1556, 'Don Bautista del Este', 5),
	(904, 40703, 'Villa Alonso', 4),
	(905, 1600, 'Violeta del Mirador', 5),
	(906, 34039, 'Gral. Eduardo', 17),
	(907, 5820, 'Cristóbal del Este', 10),
	(908, 5123, 'Don Adriana', 14),
	(909, 7440, 'San Ignacio del Sur', 10),
	(910, 67108, 'Don Pablo del Oeste', 23),
	(911, 38265, 'San Emiliano del Sur', 8),
	(912, 4932, 'Herrera del Este', 13),
	(913, 89529, 'Don Mario', 5),
	(914, 9768, 'Don Daniela', 18),
	(915, 613, 'Puerto Michelle del Este', 16),
	(916, 2292, 'Gral. José del Este', 6),
	(917, 73920, 'Rincón del Mar', 20),
	(918, 4561, 'Natalia del Oeste', 21),
	(919, 95573, 'Don Alexander', 4),
	(920, 85198, 'Don Ivan', 8),
	(921, 84414, 'Josefina del Norte', 8),
	(922, 6340, 'Magdalena del Norte', 23),
	(923, 82846, 'San Victoria del Mar', 16),
	(924, 95215, 'San Sofía', 8),
	(925, 22413, 'Villa Juan Pablo del Sur', 21),
	(926, 5892, 'Cuellar del Mirador', 11),
	(927, 63442, 'San Gabriel del Oeste', 16),
	(928, 48797, 'Villa Ivan', 10),
	(929, 7615, 'San Josué', 22),
	(930, 3383, 'Simón del Mar', 1),
	(931, 47048, 'Villa Oliva', 7),
	(932, 7631, 'Puerto Rafaela del Norte', 10),
	(933, 79421, 'San Santino del Mar', 13),
	(934, 84726, 'Villa Axel', 18),
	(935, 7178, 'San Ian del Mar', 8),
	(936, 22428, 'Fabiana del Norte', 22),
	(937, 37845, 'Zelaya del Norte', 18),
	(938, 5731, 'Gral. Maite del Norte', 16),
	(939, 59503, 'Puerto Delfina del Mirador', 17),
	(940, 4683, 'Olivia del Oeste', 10),
	(941, 77564, 'Montaño del Norte', 1),
	(942, 3211, 'Lucía del Mirador', 8),
	(943, 9698, 'Don Michelle', 20),
	(944, 3576, 'Romo del Mirador', 10),
	(945, 41922, 'Villa Dante', 2),
	(946, 7012, 'Irizarry del Mirador', 15),
	(947, 3346, 'Puerto Julián del Oeste', 1),
	(948, 9005, 'San Sophie', 22),
	(949, 7876, 'San Rafael', 16),
	(950, 91459, 'Ashley del Mirador', 2),
	(951, 1821, 'Don Gael', 21),
	(952, 3392, 'San Samuel', 2),
	(953, 75773, 'Puerto Santino del Sur', 12),
	(954, 7341, 'Clara del Mirador', 5),
	(955, 825, 'San Cristóbal', 4),
	(956, 22245, 'Lovato del Este', 5),
	(957, 48545, 'Villa Catalina del Este', 9),
	(958, 98351, 'Gral. Ana Paula', 22),
	(959, 40983, 'Pedro del Oeste', 19),
	(960, 74513, 'Puerto Victoria', 8),
	(961, 91704, 'Christopher del Este', 6),
	(962, 20952, 'Mesa del Mar', 14),
	(963, 18337, 'Villa Juan Diego del Mirador', 7),
	(964, 25801, 'Matthew del Mar', 22),
	(965, 2534, 'Don Abril', 22),
	(966, 1419, 'Miranda del Mirador', 19),
	(967, 84287, 'Don Renata', 3),
	(968, 77299, 'Ivanna del Mar', 23),
	(969, 98454, 'Manuel del Oeste', 11),
	(970, 71926, 'Godoy del Sur', 12),
	(971, 7439, 'Fernando del Este', 8),
	(972, 3341, 'San Agustín', 8),
	(973, 17492, 'Miguel del Este', 9),
	(974, 93442, 'Puerto Bruno del Oeste', 4),
	(975, 6050, 'San Sebastián', 15),
	(976, 49207, 'Puerto Manuela', 22),
	(977, 69121, 'Villa Silvana', 2),
	(978, 4447, 'Melgar del Sur', 17),
	(979, 76957, 'Villa Juan José', 14),
	(980, 7028, 'Valeria del Sur', 10),
	(981, 1591, 'Segovia del Oeste', 14),
	(982, 29493, 'Aragón del Sur', 7),
	(983, 9817, 'Villa Máximo del Mirador', 22),
	(984, 7411, 'San Damián', 12),
	(985, 6300, 'San Paula del Norte', 2),
	(986, 5711, 'Fernández del Norte', 12),
	(987, 4475, 'Urías del Oeste', 4),
	(988, 8484, 'Pedro del Norte', 16),
	(989, 1024, 'San Delfina', 23),
	(990, 32190, 'Ivanna del Norte', 8),
	(991, 4562, 'Villa Emily del Oeste', 1),
	(992, 8104, 'Gral. Julián del Este', 13),
	(993, 7016, 'Adriana del Norte', 14),
	(994, 7669, 'Puerto Anthony del Sur', 13),
	(995, 61442, 'Leyva del Mar', 2),
	(996, 88114, 'Villa Oliva del Oeste', 21),
	(997, 97162, 'Martín del Mar', 2),
	(998, 9848, 'Sara del Este', 21),
	(999, 63740, 'Nevárez del Sur', 6),
	(1000, 18149, 'Villa Manuela del Norte', 7);
/*!40000 ALTER TABLE `cp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;