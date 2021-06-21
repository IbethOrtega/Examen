-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2021 a las 17:28:01
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `articles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `p_claves` varchar(100) NOT NULL,
  `resumen` text NOT NULL,
  `autores` varchar(100) NOT NULL,
  `topico` varchar(100) NOT NULL,
  `archivo` varchar(150) NOT NULL,
  `f_envio` date NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `titulo`, `p_claves`, `resumen`, `autores`, `topico`, `archivo`, `f_envio`, `estado`) VALUES
(8, 'titulo modificado', 'palabra1,palabra2', 'laskdmlkamsldakm', 'autor1, autor2', 'topico1', 'SEGUNDO PARCIAL DE PROGRAMACIÓN WEB.pdf', '2021-06-15', 4),
(9, 'titulo2', 'palabra1,palabra2,palabra3', 'resumen añlsdñals,mdñl', 'autor1, autor2', 'topico1', 'calendario_Primeros_previos_2021 - Copy 1.pdf', '2021-06-17', 2),
(10, 'titulo del articulo 1', 'palabras clave', 'Resumen', 'autor1, autor2', 'topico1', 'calendario_Primeros_previos_2021 - Copy 1.pdf', '2021-06-17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_articulo`
--

CREATE TABLE `autor_articulo` (
  `autor` int(11) NOT NULL,
  `articulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor_articulo`
--

INSERT INTO `autor_articulo` (`autor`, `articulo`) VALUES
(1, 8),
(3, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `descripcion`) VALUES
(1, 'pendiente'),
(2, 'evaluando'),
(3, 'aceptado'),
(4, 'rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `articulo` int(11) NOT NULL,
  `evaluador` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` varchar(300) NOT NULL,
  `aprobacion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`articulo`, `evaluador`, `fecha`, `observaciones`, `aprobacion`) VALUES
(8, 3, '0000-00-00', '', ''),
(8, 4, '0000-00-00', '', ''),
(9, 4, '2021-06-17', 'observaciones de aceptacion', 'aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacion`
--

CREATE TABLE `observacion` (
  `id` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `articulo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `observacion`
--

INSERT INTO `observacion` (`id`, `admin`, `articulo`, `fecha`, `observaciones`) VALUES
(6, 2, 8, '2021-06-17', 'observacion asdkajlsklmkxlckzmlxkmlkamslkd laksmdla l kalms ldkmals alksmdlaksdlmamsd alksmdlakmsdlka laksldamlskdmalskmd lakmsdlakmsdlkm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`) VALUES
(1, 'autor'),
(2, 'evaluador'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `orcid` varchar(15) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `password`, `email`, `orcid`, `rol`) VALUES
(1, 'nombre1', 'apellido1', '123123', 'example@mail.com', '32135654', 1),
(2, 'admin', 'nistrador', 'admin', 'admin@mail.com', '123456789', 3),
(3, 'evaluador 1', '...', 'eva', 'evaluador@mail.com', '25354253', 2),
(4, 'evaluador 2', 'apellido1', 'eva', 'evaluador2@mail.com', '25354253561', 2),
(5, 'Fredy', 'Vera', '123123', 'fredyvera@mail.com', '25354253', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `autor_articulo`
--
ALTER TABLE `autor_articulo`
  ADD PRIMARY KEY (`autor`,`articulo`),
  ADD UNIQUE KEY `articulo` (`articulo`),
  ADD KEY `autor` (`autor`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`articulo`,`evaluador`),
  ADD KEY `evaluador` (`evaluador`);

--
-- Indices de la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin` (`admin`),
  ADD KEY `articulo` (`articulo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `observacion`
--
ALTER TABLE `observacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `autor_articulo`
--
ALTER TABLE `autor_articulo`
  ADD CONSTRAINT `autor_articulo_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `autor_articulo_ibfk_2` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`id`);

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`id`),
  ADD CONSTRAINT `evaluacion_ibfk_2` FOREIGN KEY (`evaluador`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `observacion_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `observacion_ibfk_2` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
