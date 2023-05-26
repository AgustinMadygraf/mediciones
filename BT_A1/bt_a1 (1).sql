-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-05-2023 a las 21:29:25
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
-- Base de datos: `acc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bt_a1`
--

CREATE TABLE `bt_a1` (
  `id` int(11) NOT NULL,
  `fecha` datetime GENERATED ALWAYS AS (from_unixtime(`timestamp`)) STORED,
  `timestamp` int(11) NOT NULL,
  `R:ea` float NOT NULL,
  `R:er` float NOT NULL,
  `S:ea` float NOT NULL,
  `S:er` float NOT NULL,
  `T:ea` float NOT NULL,
  `T:er` float NOT NULL,
  `III:ea` float GENERATED ALWAYS AS (((`R:ea` + `S:ea`) + `T:ea`)) STORED,
  `III:er` float GENERATED ALWAYS AS (((`R:er` + `S:er`) + `T:er`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bt_a1`
--
ALTER TABLE `bt_a1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bt_a1`
--
ALTER TABLE `bt_a1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=595417;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
