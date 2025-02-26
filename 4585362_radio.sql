-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: fdb1030.awardspace.net
-- Tiempo de generación: 26-02-2025 a las 03:03:27
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `4585362_radio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `nombre` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `generoMusical` varchar(25) COLLATE utf8mb3_spanish_ci NOT NULL,
  `frecuencia` varchar(5) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `estaciones`
--

INSERT INTO `estaciones` (`nombre`, `generoMusical`, `frecuencia`) VALUES
('Amor', 'RM', '92.5'),
('La Mejor', 'MX', '760'),
('La Z', 'RG', '103.5'),
('Magia Digital', 'MX', '100.7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencias`
--

CREATE TABLE `frecuencias` (
  `frecuencia_mhz` varchar(5) COLLATE utf8mb3_spanish_ci NOT NULL,
  `tipo` varchar(2) COLLATE utf8mb3_spanish_ci NOT NULL,
  `ciudad` varchar(40) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `frecuencias`
--

INSERT INTO `frecuencias` (`frecuencia_mhz`, `tipo`, `ciudad`) VALUES
('100.7', 'FM', 'Juarez'),
('103.5', 'FM', 'Juarez'),
('760', 'AM', 'Victoria de Durango'),
('92.5', 'FM', 'Toluca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id_genero` varchar(2) COLLATE utf8mb3_spanish_ci NOT NULL,
  `genero` varchar(25) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id_genero`, `genero`) VALUES
('MX', 'Mexicana'),
('RG', 'Regional'),
('RM', 'Romantica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locutor`
--

CREATE TABLE `locutor` (
  `id_locutor` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_estacion` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `locutor`
--

INSERT INTO `locutor` (`id_locutor`, `nombre`, `apellido`, `id_estacion`) VALUES
(1, 'Jafet', 'Arean', 'Magia Digital'),
(2, 'Mariana', 'Soto', 'Amor'),
(3, 'Ilan', 'Samaniego', 'La Z'),
(4, 'Viridiana', 'Rocha', 'La Mejor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `FkFrecuencia` (`frecuencia`) USING BTREE,
  ADD KEY `FkGenero` (`generoMusical`) USING BTREE;

--
-- Indices de la tabla `frecuencias`
--
ALTER TABLE `frecuencias`
  ADD PRIMARY KEY (`frecuencia_mhz`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `locutor`
--
ALTER TABLE `locutor`
  ADD PRIMARY KEY (`id_locutor`),
  ADD KEY `FkEstacion` (`id_estacion`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `locutor`
--
ALTER TABLE `locutor`
  MODIFY `id_locutor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `locutor`
--
ALTER TABLE `locutor`
  ADD CONSTRAINT `locutor_ibfk_1` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
