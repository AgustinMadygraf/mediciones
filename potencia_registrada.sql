-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2023 a las 20:19:08
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `z`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `potencia registrada`
--

CREATE TABLE `potencia registrada` (
  `id` bigint(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `fecha` text NOT NULL,
  `potencia` double NOT NULL,
  `contratada` double NOT NULL DEFAULT '300',
  `pot15` double NOT NULL,
  `potencia15` double NOT NULL,
  `energia` bigint(20) NOT NULL,
  `medidor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `potencia registrada`
--

INSERT INTO `potencia registrada` (`id`, `time`, `fecha`, `potencia`, `contratada`, `pot15`, `potencia15`, `energia`, `medidor`) VALUES
(1, 1625886060000, 'Sat Jul 10 00:00:41 2021', 162.1, 300, 0, 0, 385718503, NULL),
(2, 1625886120000, 'Sat Jul 10 00:01:40 2021', 160.8, 300, 0, 0, 385721176, NULL),
(3, 1625886180000, 'Sat Jul 10 00:02:40 2021', 158, 300, 0, 0, 385723841, NULL),
(4, 1625886240000, 'Sat Jul 10 00:03:39 2021', 158.4, 300, 0, 0, 385726460, NULL),
(5, 1625886300000, 'Sat Jul 10 00:04:40 2021', 157.7, 300, 0, 0, 385729083, NULL),
(6, 1625886360000, 'Sat Jul 10 00:05:39 2021', 158.6, 300, 0, 0, 385731723, NULL),
(7, 1625886420000, 'Sat Jul 10 00:06:40 2021', 159.4, 300, 0, 0, 385734383, NULL),
(8, 1625886480000, 'Sat Jul 10 00:07:39 2021', 161.1, 300, 0, 0, 385737043, NULL),
(9, 1625886540000, 'Sat Jul 10 00:08:40 2021', 162.4, 300, 0, 0, 385739720, NULL),
(10, 1625886600000, 'Sat Jul 10 00:09:41 2021', 159.6, 300, 0, 0, 385742442, NULL),
(11, 1625886660000, 'Sat Jul 10 00:10:39 2021', 161, 300, 0, 0, 385745105, NULL),
(12, 1625886720000, 'Sat Jul 10 00:11:40 2021', 163.4, 300, 0, 0, 385747821, NULL),
(13, 1625886780000, 'Sat Jul 10 00:12:39 2021', 161.3, 300, 0, 0, 385750528, NULL),
(14, 1625886840000, 'Sat Jul 10 00:13:40 2021', 164.2, 300, 0, 0, 385753238, NULL),
(15, 1625886900000, 'Sat Jul 10 00:14:39 2021', 164.1, 300, 0, 0, 385755971, NULL),
(16, 1625886960000, 'Sat Jul 10 00:15:40 2021', 161.3, 300, 0, 0, 385758672, NULL),
(17, 1625887020000, 'Sat Jul 10 00:16:39 2021', 159.2, 300, 0, 0, 385761331, NULL),
(18, 1625887080000, 'Sat Jul 10 00:17:40 2021', 160.2, 300, 0, 0, 385763980, NULL),
(19, 1625887140000, 'Sat Jul 10 00:18:41 2021', 168.3, 300, 0, 0, 385766777, NULL),
(20, 1625887200000, 'Sat Jul 10 00:19:40 2021', 167.5, 300, 0, 0, 385769572, NULL),
(21, 1625887260000, 'Sat Jul 10 00:20:40 2021', 169.3, 300, 0, 0, 385772373, NULL),
(22, 1625887320000, 'Sat Jul 10 00:21:39 2021', 172.7, 300, 0, 0, 385775199, NULL),
(23, 1625887380000, 'Sat Jul 10 00:22:40 2021', 169.8, 300, 0, 0, 385778047, NULL),
(24, 1625887440000, 'Sat Jul 10 00:23:39 2021', 249.4, 300, 0, 0, 385781468, NULL),
(25, 1625887500000, 'Sat Jul 10 00:24:40 2021', 265.6, 300, 0, 0, 385785899, NULL),
(26, 1625887560000, 'Sat Jul 10 00:25:39 2021', 259.3, 300, 0, 0, 385790256, NULL),
(27, 1625887620000, 'Sat Jul 10 00:26:40 2021', 257.7, 300, 0, 0, 385794544, NULL),
(28, 1625887680000, 'Sat Jul 10 00:27:41 2021', 260.6, 300, 0, 0, 385798943, NULL),
(29, 1625887740000, 'Sat Jul 10 00:28:40 2021', 260.6, 300, 0, 0, 385803271, NULL),
(30, 1625887800000, 'Sat Jul 10 00:29:41 2021', 260.9, 300, 0, 0, 385807628, NULL),
(31, 1625887860000, 'Sat Jul 10 00:30:39 2021', 261.4, 300, 0, 0, 385811970, NULL),
(32, 1625887920000, 'Sat Jul 10 00:31:40 2021', 256.8, 300, 0, 0, 385816279, NULL),
(33, 1625887980000, 'Sat Jul 10 00:32:39 2021', 259.1, 300, 0, 0, 385820574, NULL),
(34, 1625888040000, 'Sat Jul 10 00:33:40 2021', 257.3, 300, 0, 0, 385824866, NULL),
(35, 1625888100000, 'Sat Jul 10 00:34:39 2021', 257.3, 300, 0, 0, 385829155, NULL),
(36, 1625888160000, 'Sat Jul 10 00:35:40 2021', 258.1, 300, 0, 0, 385833454, NULL),
(37, 1625888220000, 'Sat Jul 10 00:36:39 2021', 258.3, 300, 0, 0, 385837747, NULL),
(38, 1625888280000, 'Sat Jul 10 00:37:40 2021', 257.9, 300, 0, 0, 385842042, NULL),
(39, 1625888340000, 'Sat Jul 10 00:38:41 2021', 259.5, 300, 0, 0, 385846427, NULL),
(40, 1625888400000, 'Sat Jul 10 00:39:40 2021', 257.3, 300, 0, 0, 385850727, NULL),
(41, 1625888460000, 'Sat Jul 10 00:40:40 2021', 230.2, 300, 0, 0, 385854873, NULL),
(42, 1625888520000, 'Sat Jul 10 00:41:39 2021', 157.4, 300, 0, 0, 385857973, NULL),
(43, 1625888580000, 'Sat Jul 10 00:42:40 2021', 159.6, 300, 0, 0, 385860611, NULL),
(44, 1625888640000, 'Sat Jul 10 00:43:39 2021', 161.6, 300, 0, 0, 385863283, NULL),
(45, 1625888700000, 'Sat Jul 10 00:44:40 2021', 162.2, 300, 0, 0, 385865971, NULL),
(46, 1625888760000, 'Sat Jul 10 00:45:39 2021', 162.3, 300, 0, 0, 385868669, NULL),
(47, 1625888820000, 'Sat Jul 10 00:46:40 2021', 164.2, 300, 0, 0, 385871380, NULL),
(48, 1625888880000, 'Sat Jul 10 00:47:41 2021', 164.5, 300, 0, 0, 385874166, NULL),
(49, 1625888940000, 'Sat Jul 10 00:48:40 2021', 164.1, 300, 0, 0, 385876902, NULL),
(50, 1625889000000, 'Sat Jul 10 00:49:40 2021', 162.7, 300, 0, 0, 385879630, NULL),
(51, 1625889060000, 'Sat Jul 10 00:50:39 2021', 161.6, 300, 0, 0, 385882317, NULL),
(52, 1625889120000, 'Sat Jul 10 00:51:40 2021', 160.8, 300, 0, 0, 385885007, NULL),
(53, 1625889180000, 'Sat Jul 10 00:52:39 2021', 161.2, 300, 0, 0, 385887687, NULL),
(54, 1625889240000, 'Sat Jul 10 00:53:40 2021', 161.6, 300, 0, 0, 385890362, NULL),
(55, 1625889300000, 'Sat Jul 10 00:54:39 2021', 163.9, 300, 0, 0, 385893058, NULL),
(56, 1625889360000, 'Sat Jul 10 00:55:40 2021', 165.1, 300, 0, 0, 385895798, NULL),
(57, 1625889420000, 'Sat Jul 10 00:56:41 2021', 162.9, 300, 0, 0, 385898585, NULL),
(58, 1625889480000, 'Sat Jul 10 00:57:40 2021', 164.3, 300, 0, 0, 385901316, NULL),
(59, 1625889540000, 'Sat Jul 10 00:58:40 2021', 164, 300, 0, 0, 385904037, NULL),
(60, 1625889600000, 'Sat Jul 10 00:59:39 2021', 164.5, 300, 0, 0, 385906758, NULL),
(61, 1625889660000, 'Sat Jul 10 01:00:40 2021', 162.7, 300, 0, 0, 385909488, NULL),
(62, 1625889720000, 'Sat Jul 10 01:01:39 2021', 165.9, 300, 0, 0, 385912198, NULL),
(63, 1625889780000, 'Sat Jul 10 01:02:40 2021', 168.2, 300, 0, 0, 385914972, NULL),
(64, 1625889840000, 'Sat Jul 10 01:03:39 2021', 164, 300, 0, 0, 385917790, NULL),
(65, 1625889900000, 'Sat Jul 10 01:04:40 2021', 171.4, 300, 0, 0, 385920543, NULL),
(66, 1625889960000, 'Sat Jul 10 01:05:41 2021', 164.4, 300, 0, 0, 385923384, NULL),
(67, 1625890020000, 'Sat Jul 10 01:06:39 2021', 194.7, 300, 0, 0, 385926242, NULL),
(68, 1625890080000, 'Sat Jul 10 01:07:40 2021', 199.5, 300, 0, 0, 385929805, NULL),
(69, 1625890140000, 'Sat Jul 10 01:08:39 2021', 165, 300, 0, 0, 385932713, NULL),
(70, 1625890200000, 'Sat Jul 10 01:09:40 2021', 162.9, 300, 0, 0, 385935381, NULL),
(71, 1625890260000, 'Sat Jul 10 01:10:39 2021', 158.5, 300, 0, 0, 385938098, NULL),
(72, 1625890320000, 'Sat Jul 10 01:11:40 2021', 166.3, 300, 0, 0, 385940773, NULL),
(73, 1625890380000, 'Sat Jul 10 01:12:41 2021', 160, 300, 0, 0, 385943526, NULL),
(74, 1625890440000, 'Sat Jul 10 01:13:39 2021', 167.4, 300, 0, 0, 385946287, NULL),
(75, 1625890500000, 'Sat Jul 10 01:14:40 2021', 161.2, 300, 0, 0, 385948979, NULL),
(76, 1625890560000, 'Sat Jul 10 01:15:39 2021', 158.5, 300, 0, 0, 385951681, NULL),
(77, 1625890620000, 'Sat Jul 10 01:16:40 2021', 165.2, 300, 0, 0, 385954324, NULL),
(78, 1625890680000, 'Sat Jul 10 01:17:39 2021', 158, 300, 0, 0, 385957047, NULL),
(79, 1625890740000, 'Sat Jul 10 01:18:40 2021', 168.4, 300, 0, 0, 385959760, NULL),
(80, 1625890800000, 'Sat Jul 10 01:19:39 2021', 165.4, 300, 0, 0, 385962498, NULL),
(81, 1625890860000, 'Sat Jul 10 01:20:40 2021', 169.2, 300, 0, 0, 385965332, NULL),
(82, 1625890920000, 'Sat Jul 10 01:21:41 2021', 197.4, 300, 0, 0, 385968210, NULL),
(83, 1625890980000, 'Sat Jul 10 01:22:39 2021', 256.6, 300, 0, 0, 385972182, NULL),
(84, 1625891040000, 'Sat Jul 10 01:23:40 2021', 262.2, 300, 0, 0, 385976502, NULL),
(85, 1625891100000, 'Sat Jul 10 01:24:39 2021', 262.4, 300, 0, 0, 385980865, NULL),
(86, 1625891160000, 'Sat Jul 10 01:25:40 2021', 262.4, 300, 0, 0, 385985224, NULL),
(87, 1625891220000, 'Sat Jul 10 01:26:39 2021', 254.9, 300, 0, 0, 385989535, NULL),
(88, 1625891280000, 'Sat Jul 10 01:27:40 2021', 261.1, 300, 0, 0, 385993829, NULL),
(89, 1625891340000, 'Sat Jul 10 01:28:39 2021', 261.4, 300, 0, 0, 385998178, NULL),
(90, 1625891400000, 'Sat Jul 10 01:29:40 2021', 255.5, 300, 0, 0, 386002471, NULL),
(91, 1625891460000, 'Sat Jul 10 01:30:39 2021', 261.5, 300, 0, 0, 386006781, NULL),
(92, 1625891520000, 'Sat Jul 10 01:31:40 2021', 260.7, 300, 0, 0, 386011123, NULL),
(93, 1625891580000, 'Sat Jul 10 01:32:40 2021', 257.2, 300, 0, 0, 386015477, NULL),
(94, 1625891640000, 'Sat Jul 10 01:33:39 2021', 262.9, 300, 0, 0, 386019824, NULL),
(95, 1625891700000, 'Sat Jul 10 01:34:40 2021', 258.8, 300, 0, 0, 386024190, NULL),
(96, 1625891760000, 'Sat Jul 10 01:35:39 2021', 258.6, 300, 0, 0, 386028451, NULL),
(97, 1625891820000, 'Sat Jul 10 01:36:40 2021', 262.1, 300, 0, 0, 386032805, NULL),
(98, 1625891880000, 'Sat Jul 10 01:37:39 2021', 256.3, 300, 0, 0, 386037137, NULL),
(99, 1625891940000, 'Sat Jul 10 01:38:40 2021', 262.5, 300, 0, 0, 386041423, NULL),
(100, 1625892000000, 'Sat Jul 10 01:39:41 2021', 263.8, 300, 0, 0, 386045881, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `potencia registrada`
--
ALTER TABLE `potencia registrada`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_2` (`time`,`medidor`),
  ADD KEY `time_3` (`time`,`medidor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `potencia registrada`
--
ALTER TABLE `potencia registrada`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527118;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
