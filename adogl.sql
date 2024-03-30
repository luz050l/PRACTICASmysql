-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-03-2024 a las 09:31:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adogl`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camion`
--

CREATE TABLE `camion` (
  `matricula` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `potencia` varchar(50) NOT NULL,
  `camionero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camion`
--

INSERT INTO `camion` (`matricula`, `modelo`, `tipo`, `potencia`, `camionero_id`) VALUES
(1, 'J7KA200', 'A', '10hp', 1),
(2, 'J8KA300', 'E', '11hp', 2),
(3, 'J9Kb400', 'A', '9hp', 3),
(4, 'M7KA100', 'A', '10hp', 4),
(5, 'J7LB500', 'E', '12hp', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camionero`
--

CREATE TABLE `camionero` (
  `idcamionero` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `salario` int(4) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camionero`
--

INSERT INTO `camionero` (`idcamionero`, `nombre`, `telefono`, `direccion`, `salario`, `ciudad`) VALUES
(1, 'juan', 2147483647, 'lomas 4', 2500, 'veracruz'),
(2, 'francisco', 2147483647, 'zapopan', 3100, 'guadalajara'),
(3, 'gael', 2147483647, 'florida', 4000, 'boca del rio'),
(4, 'fabian', 2147483647, 'las antillas', 1900, 'veracruz'),
(5, 'javier', 2147483647, 'lomas 4', 5000, 'veracruz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `direcdestino` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`codigo`, `descripcion`, `destino`, `direcdestino`) VALUES
(1, 'producto fragil', 'boca del rio', 'atras de chedraui'),
(2, 'producto pesado', 'costa dorada', 'hay un oxxo pasando la rotonda'),
(3, 'producto fragil', 'punta tiburon', 'fracc. las orquideas #100'),
(4, 'producto exportado', ' cdmx', 'a un lado del palacio'),
(5, 'producdo fragil', 'boca del rio', 'pasando puente de ejercito mexicano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `codigopro` int(11) NOT NULL,
  `nombrepro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`codigopro`, `nombrepro`) VALUES
(1, 'sonora'),
(2, 'guerrero'),
(3, 'monterrey'),
(4, 'guadalajara'),
(5, 'CDMX');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camion`
--
ALTER TABLE `camion`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `camionero`
--
ALTER TABLE `camionero`
  ADD PRIMARY KEY (`idcamionero`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`codigopro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `camion`
--
ALTER TABLE `camion`
  ADD CONSTRAINT `camion_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `camionero` (`idcamionero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `camionero` (`idcamionero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`codigopro`) REFERENCES `paquete` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
