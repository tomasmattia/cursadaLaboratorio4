-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2018 a las 03:42:25
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpresto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idempleado` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(55) NOT NULL,
  `operaciones` int(11) NOT NULL,
  `suspencion` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idempleado`, `nombre`, `tipo`, `operaciones`, `suspencion`) VALUES
(1, 'jorge', 'mozo', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `fechahora` varchar(55) NOT NULL,
  `idempleado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `idmesa` varchar(55) NOT NULL,
  `estado` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`idmesa`, `estado`) VALUES
('tnkwx', 'ocupada'),
('5ulwx', 'libre'),
('ylrnk', 'libre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` varchar(55) NOT NULL,
  `idmesa` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idpedido`, `idmesa`) VALUES
('76cf8', 'tnkwx'),
('g7pq1', 'tnkwx'),
('o2607', 'tnkwx'),
('wywol', 'tnkwx'),
('yr5jr', 'tnkwx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosproductos`
--

CREATE TABLE `pedidosproductos` (
  `idpedido` varchar(55) NOT NULL,
  `idproducto` int(10) NOT NULL,
  `idempleado` int(10) DEFAULT NULL,
  `tiempo` varchar(55) DEFAULT NULL,
  `estado` varchar(55) NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidosproductos`
--

INSERT INTO `pedidosproductos` (`idpedido`, `idproducto`, `idempleado`, `tiempo`, `estado`, `cantidad`) VALUES
('76cf8', 1, 2, '0', 'entregado', 2),
('g7pq1', 3, 2, '0', 'entregado', 2),
('o2607', 6, 3, '0', 'entregado', 1),
('wywol', 1, 2, '0', 'entregado', 3),
('yr5jr', 2, 2, '0', 'entregado', 2),
('yr5jr', 4, 3, '0', 'entregado', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(10) NOT NULL,
  `descripcion` varchar(55) NOT NULL,
  `precio` float NOT NULL,
  `tipo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `descripcion`, `precio`, `tipo`) VALUES
(1, 'milanesa', 100, 'cocina'),
(2, 'papas', 50, 'cocina'),
(3, 'fideos', 100, 'cocina'),
(4, 'quilmes', 50, 'cerveza'),
(5, 'stella', 70, 'cerveza'),
(6, 'termidor', 50, 'bartender'),
(7, 'whisky', 50, 'bartender');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `fecha` varchar(55) NOT NULL,
  `idmesa` varchar(55) NOT NULL,
  `mesa` int(10) NOT NULL,
  `resto` int(10) NOT NULL,
  `mozo` int(10) NOT NULL,
  `cocinero` int(10) NOT NULL,
  `comentario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`fecha`, `idmesa`, `mesa`, `resto`, `mozo`, `cocinero`, `comentario`) VALUES
('2018-11-29T03:40:27+01:00', 'tnkwx', 5, 5, 5, 5, '5');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`);

--
-- Indices de la tabla `pedidosproductos`
--
ALTER TABLE `pedidosproductos`
  ADD PRIMARY KEY (`idpedido`,`idproducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
