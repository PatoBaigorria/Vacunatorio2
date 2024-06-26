-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 19:47:55
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vacunatorio2`
--
CREATE DATABASE IF NOT EXISTS `vacunatorio2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacunatorio2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentedesalud`
--

CREATE TABLE `agentedesalud` (
  `DNI` int(11) NOT NULL,
  `matricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agentedesalud`
--

INSERT INTO `agentedesalud` (`DNI`, `matricula`) VALUES
(12600842, NULL),
(34229421, NULL),
(37716731, 10000000),
(5919535, 10000001),
(27013989, 10000002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idAplicacion` int(11) NOT NULL,
  `DNIPaciente` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `fechaDeAplicacion` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aplicacion`
--

INSERT INTO `aplicacion` (`idAplicacion`, `DNIPaciente`, `DNIAgente`, `numeroDeSerie`, `fechaDeAplicacion`, `activo`) VALUES
(1, 34229421, 37716731, 1, '2024-01-01', 1),
(2, 5919535, 27013989, 1, '2024-01-01', 1),
(3, 5919535, 27013989, 1, '2024-05-01', 0),
(4, 12600842, 27013989, 1, '2024-05-01', 1),
(5, 5919535, 27013989, 1, '2024-06-16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centrodevacunacion`
--

INSERT INTO `centrodevacunacion` (`idCentroDeVacunacion`, `direccion`, `localidad`, `provincia`, `longitud`, `latitud`, `activo`) VALUES
(1, '', '', '', -65.453582, -33.675319, 1),
(2, '', '', '', -66.28365, -33.307057, 1),
(3, '', '', '', -66.306048, -33.275904, 1),
(4, '', '', '', -66.306653, -33.281606, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositonacional`
--

CREATE TABLE `depositonacional` (
  `idDepositoNacional` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `depositonacional`
--

INSERT INTO `depositonacional` (`idDepositoNacional`, `direccion`, `provincia`, `longitud`, `latitud`, `activo`) VALUES
(1, '', '', -66.319155, -33.292288, 1),
(2, '', '', -66.319155, -33.292288, 1),
(3, '', '', -66.294379, -33.277265, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositoprovincial`
--

CREATE TABLE `depositoprovincial` (
  `idDepositoProvincial` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `depositoprovincial`
--

INSERT INTO `depositoprovincial` (`idDepositoProvincial`, `direccion`, `provincia`, `longitud`, `latitud`, `activo`) VALUES
(1, '', '', -66.319155, -33.292288, 1),
(2, '', '', -66.331844, -33.298216, 1),
(3, '', '', -66.307726, -33.271058, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarte`
--

CREATE TABLE `descarte` (
  `idDescarte` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `empresaDescartante` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeDescarte` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descarte`
--

INSERT INTO `descarte` (`idDescarte`, `DNIAgente`, `numeroDeSerie`, `empresaDescartante`, `motivo`, `cantidadDeVacunas`, `fechaDeDescarte`, `activo`) VALUES
(1, 37716731, 1, 'Veolia', 'Vencida', 10, '2024-01-01', 1),
(2, 37716731, 1, 'Veolia', 'Vencida', 10, '2024-01-01', 1),
(3, 37716731, 1, 'Veolia', 'Vencida', 10, '2024-01-01', 1),
(4, 37716731, 9, 'Waste Management', 'Pérdida de frío', 50, '2024-03-04', 1),
(5, 5919535, 11, 'Veolia', 'Rotura', 10, '2024-02-01', 1),
(6, 5919535, 8, 'Veolia', 'Contaminación', 50, '2024-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `idLaboratorio` int(11) NOT NULL,
  `nombreLaboratorio` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`idLaboratorio`, `nombreLaboratorio`, `pais`, `email`, `telefono`, `longitud`, `latitud`, `activo`) VALUES
(1, 'Johnnson', 'Argentina', 'long.eze7773@gmail.com', '0111532184', -66.309325, -33.279181, 1),
(2, 'Bago', 'Argentina', 'bayerargentina@gmail.com', '1159487659', -58.392334, -34.633208, 0),
(3, 'Pampa', 'Argentina', 'pampargentina@gmail.com', '1234445678', -66.319155, -33.292288, 1),
(4, 'Johnnso', 'A', 'a@gm.com', '1234567890', -66.319155, -33.292288, 1),
(5, 'dsadsa', 'asadsa', 'a@gm.com', '1234567890', -66.319155, -33.292288, 0),
(6, 'Pfizer', 'EEUU', 'pfizereeuu@gmail.com', '1123456789', -66.306048, -33.275904, 1),
(7, 'Laboratorios Puntanos', 'Argentina', 'labpuntanosarg@gmail.com', '2657123455', -66.28364, -33.307057, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `numeroDeSerie` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `cantidadDeVacunasTotales` int(11) NOT NULL,
  `cantidadDeVacunasRestantes` int(11) NOT NULL,
  `fechaDeLlegadaDepositoNacional` date DEFAULT NULL,
  `idDepositoNacional` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoNacional` date DEFAULT NULL,
  `fechaDeLlegadaDepositoProvincial` date DEFAULT NULL,
  `idDepositoProvincial` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoProvincial` date DEFAULT NULL,
  `fechaDeLlegadaCentroDeVacunacion` date DEFAULT NULL,
  `idCentroDeVacunacion` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `loteinterno`
--

INSERT INTO `loteinterno` (`numeroDeSerie`, `numeroDeLote`, `idLaboratorio`, `cantidadDeVacunasTotales`, `cantidadDeVacunasRestantes`, `fechaDeLlegadaDepositoNacional`, `idDepositoNacional`, `fechaDeSalidaDepositoNacional`, `fechaDeLlegadaDepositoProvincial`, `idDepositoProvincial`, `fechaDeSalidaDepositoProvincial`, `fechaDeLlegadaCentroDeVacunacion`, `idCentroDeVacunacion`, `activo`) VALUES
(1, 1, 1, 50, 50, '2024-01-01', 1, '2024-02-01', '2024-03-01', 1, '2024-04-01', '2024-05-01', 1, 1),
(2, 1, 1, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 2, 1, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 2, 1, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 4, 3, 50, 50, '2024-01-01', 1, '2024-02-01', '2024-03-01', 1, '2024-04-01', '2024-05-01', 3, 0),
(6, 1, 1, 50, 50, '2024-01-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 4, 3, 50, 50, '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, NULL, NULL, NULL, 1),
(8, 1, 1, 123, 73, '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, 1),
(9, 1, 1, 123, 73, '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, '2024-01-01', '2024-01-01', 2, 1),
(10, 1, 1, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 1, 1, 50, 40, '2024-01-31', 1, '2024-02-01', '2024-02-02', 1, '2024-02-03', '2024-02-04', 1, 1),
(12, 4, 3, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 1, 1, 50, 50, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(14, 4, 3, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 2, 1, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 4, 3, 100, 100, '2024-01-01', 1, NULL, NULL, 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `tipoDeVacuna` varchar(255) NOT NULL,
  `nombreComercial` varchar(255) NOT NULL,
  `cantidadDeLotesInternos` int(11) NOT NULL,
  `fechaDeFabricacion` date NOT NULL,
  `fechaDeCompra` date NOT NULL,
  `fechaDeVencimiento` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `loteproveedor`
--

INSERT INTO `loteproveedor` (`numeroDeLote`, `idLaboratorio`, `tipoDeVacuna`, `nombreComercial`, `cantidadDeLotesInternos`, `fechaDeFabricacion`, `fechaDeCompra`, `fechaDeVencimiento`, `activo`) VALUES
(1, 1, 'Tuberculosis', 'BCG', 8, '2024-01-01', '2024-01-01', '2024-06-01', 1),
(2, 1, 'Tuberculosis', 'BCG', 500, '2024-01-01', '2024-01-01', '2029-02-03', 0),
(3, 2, 'Tuberculosis', 'BCG', 500, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(4, 3, 'Tuberculosis', 'BCG', 500, '2024-01-01', '2024-01-01', '2029-01-02', 1),
(5, 7, 'HPV', 'Virus Papiloma Humano', 10, '2024-01-01', '2024-03-01', '2029-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologiabase`
--

CREATE TABLE `patologiabase` (
  `DNI` int(11) NOT NULL,
  `patologiaBase` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patologiabase`
--

INSERT INTO `patologiabase` (`DNI`, `patologiaBase`) VALUES
(5919535, 'Ninguna'),
(12600842, 'Enfermedad respiratorio cronica'),
(27013989, 'Ninguna'),
(34229421, 'Obesidad'),
(37716731, 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`DNI`, `nombre`, `apellido`, `email`, `fechaDeNacimiento`, `ocupacion`, `genero`, `direccion`, `localidad`, `provincia`, `longitud`, `latitud`, `activo`) VALUES
(5919535, 'Beatriz', 'Hernando', 'beatriz.hernando11@gmail.com', '1948-10-11', 'agente de salud', 'Femenino', 'Pampa 919', '', 'San Luis', -65.006726, -32.363778, 1),
(12600842, 'Dora Nelida', 'Orsomarso', 'doranel50@hotmail.com', '1956-11-03', 'otro', 'Femenino', '', '', '', -58.54022, -34.590983, 1),
(27013989, 'Monica Patricia', 'Baigorria', 'patobaigorria@gmail.com', '1978-12-01', 'agente de salud', 'Femenino', '', '', '', -65.499383, -33.690228, 1),
(34229421, 'Jorge Ezequiel', 'Diaz', 'diazezequiel777@gmail.com', '1988-11-09', 'otro', 'Masculino', '', '', '', -66.31088, -33.26451, 1),
(37716731, 'Federico Ivan', 'Cruceño', 'fedeicru@gmail.com', '1994-03-20', 'agente de salud', 'Masculino', '', '', '', -66.310912, -33.264501, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `idRegistro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idFila` int(11) NOT NULL,
  `nombreDeTabla` varchar(255) NOT NULL,
  `tipoDeAccion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`idRegistro`, `idUsuario`, `idFila`, `nombreDeTabla`, `tipoDeAccion`, `fecha`) VALUES
(142, 1, 1, 'Usuario', 'Modificacion', '2024-06-17 16:00:45'),
(143, 1, 1, 'Descarte', 'Modificacion', '2024-06-17 16:12:28'),
(144, 1, 1, 'Lote interno', 'Modificacion', '2024-06-17 16:13:37'),
(145, 1, 2, 'Aplicacion', 'Creacion', '2024-06-17 16:18:10'),
(146, 1, 2, 'Aplicacion', 'Alta', '2024-06-17 16:18:10'),
(147, 1, 3, 'Aplicacion', 'Creacion', '2024-06-17 16:24:30'),
(148, 1, 3, 'Aplicacion', 'Alta', '2024-06-17 16:24:30'),
(149, 1, 4, 'Aplicacion', 'Creacion', '2024-06-17 16:27:22'),
(150, 1, 4, 'Aplicacion', 'Alta', '2024-06-17 16:27:22'),
(151, 1, 17, 'Lote interno', 'Creacion', '2024-06-17 16:35:22'),
(152, 1, 17, 'Lote interno', 'Alta', '2024-06-17 16:35:22'),
(153, 1, 7, 'Laboratorio', 'Creacion', '2024-06-17 16:39:41'),
(154, 1, 7, 'Laboratorio', 'Alta', '2024-06-17 16:39:41'),
(155, 1, 7, 'Laboratorio', 'Modificacion', '2024-06-17 16:42:46'),
(156, 1, 5, 'Laboratorio', 'Baja', '2024-06-17 16:42:58'),
(157, 1, 5, 'Laboratorio', 'Alta', '2024-06-17 16:43:02'),
(158, 1, 5, 'Laboratorio', 'Baja', '2024-06-17 16:43:04'),
(159, 1, 5, 'Lote proveeedor', 'Creacion', '2024-06-17 16:50:12'),
(160, 1, 5, 'Lote proveeedor', 'Alta', '2024-06-17 16:50:12'),
(161, 1, 5, 'Lote proveedor', 'Modificacion', '2024-06-17 16:53:44'),
(162, 1, 3, 'Lote proveedor', 'Baja', '2024-06-17 16:53:53'),
(163, 1, 2, 'Lote proveedor', 'Baja', '2024-06-17 16:54:09'),
(164, 1, 3, 'Lote proveedor', 'Alta', '2024-06-17 16:54:13'),
(165, 1, 18, 'Lote interno', 'Creacion', '2024-06-17 16:56:47'),
(166, 1, 18, 'Lote interno', 'Alta', '2024-06-17 16:56:47'),
(167, 1, 18, 'Lote interno', 'Modificacion', '2024-06-17 16:59:38'),
(168, 1, 18, 'Lote interno', 'Modificacion', '2024-06-17 17:02:57'),
(169, 1, 3, 'Deposito Provincial', 'Creacion', '2024-06-17 17:04:32'),
(170, 1, 3, 'Deposito Provincial', 'Alta', '2024-06-17 17:04:32'),
(171, 1, 3, 'Deposito Provincial', 'Baja', '2024-06-17 17:04:39'),
(172, 1, 3, 'Deposito Provincial', 'Modificacion', '2024-06-17 17:04:52'),
(173, 1, 3, 'Deposito Provincial', 'Alta', '2024-06-17 17:04:56'),
(174, 1, 3, 'Deposito Provincial', 'Baja', '2024-06-17 17:05:00'),
(175, 1, 3, 'Deposito Nacional', 'Creacion', '2024-06-17 17:05:22'),
(176, 1, 3, 'Deposito Nacional', 'Alta', '2024-06-17 17:05:22'),
(177, 1, 3, 'Deposito Nacional', 'Baja', '2024-06-17 17:05:25'),
(178, 1, 3, 'Deposito Nacional', 'Modificacion', '2024-06-17 17:05:30'),
(179, 1, 4, 'Centro de vacunacion', 'Creacion', '2024-06-17 17:05:53'),
(180, 1, 4, 'Centro de vacunacion', 'Alta', '2024-06-17 17:05:54'),
(181, 1, 4, 'Centro de vacunacion', 'Baja', '2024-06-17 17:05:56'),
(182, 1, 4, 'Centro de vacunacion', 'Modificacion', '2024-06-17 17:06:05'),
(183, 1, 5, 'Lote interno', 'Baja', '2024-06-17 17:07:25'),
(184, 1, 5, 'Lote interno', 'Modificacion', '2024-06-17 17:08:29'),
(185, 1, 6, 'Descarte', 'Creacion', '2024-06-17 17:10:59'),
(186, 1, 6, 'Descarte', 'Alta', '2024-06-17 17:10:59'),
(187, 1, 5, 'Traslado', 'Creacion', '2024-06-17 17:15:53'),
(188, 1, 5, 'Traslado', 'Alta', '2024-06-17 17:15:53'),
(189, 1, 5, 'Aplicacion', 'Creacion', '2024-06-17 17:20:25'),
(190, 1, 5, 'Aplicacion', 'Alta', '2024-06-17 17:20:25'),
(191, 1, 3, 'Aplicacion', 'Baja', '2024-06-17 17:22:26'),
(192, 1, 2, 'Laboratorio', 'Baja', '2024-06-18 21:46:28'),
(193, 1, 2, 'Laboratorio', 'Alta', '2024-06-18 21:46:36'),
(194, 1, 2, 'Laboratorio', 'Baja', '2024-06-18 21:46:47'),
(195, 1, 2, 'Laboratorio', 'Alta', '2024-06-18 21:46:59'),
(196, 1, 2, 'Laboratorio', 'Baja', '2024-06-18 21:47:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `DNI` int(11) NOT NULL,
  `celular1` varchar(255) DEFAULT NULL,
  `celular2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`DNI`, `celular1`, `celular2`) VALUES
(5919535, '1154896435', NULL),
(12600842, '1163213910', NULL),
(27013989, '2657322453', NULL),
(34229421, '1132185230', NULL),
(37716731, '2657312733', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL,
  `fechaDeLlegada` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `traslado`
--

INSERT INTO `traslado` (`idTraslado`, `numeroDeSerie`, `idCentroDeVacunacion`, `fechaDeSalida`, `fechaDeLlegada`, `activo`) VALUES
(1, 1, 1, '2024-01-01', '2024-02-01', 1),
(2, 1, 2, '2024-01-01', '2024-01-03', 1),
(5, 1, 3, '2024-06-17', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `rol`, `nombreUsuario`, `email`, `password`, `localidad`, `provincia`, `activo`) VALUES
(1, 'Super Admin', 'Eze', 'diazezequiel777@gmail.com', '$2b$10$XUt1usrwavl2kLck0B8nfetw90MRoRbHymy8h4uQEORuGh6mQvPBG', '', 'San Luis', 1),
(2, 'Agente de salud', 'Federico', 'fedeicru@gmail.com', '$2b$05$x4NmUn8n9JnNCYfzUpRVTODOX3cuqqSGbWHLShQpfnq7WjwSc./l6', '', 'San Luis', 1),
(3, 'Gestor de compras', 'Patricia', 'patobaigorria@gmail.com', '$2b$05$ifOf6qUi1UnStcHGPd9oruu.H1cVoDgUDrH/jiVW7HS6kcPttTzQu', '', 'San Luis', 1),
(4, 'Operador de logistica', 'Lautaro', 'lauchasaucedo@gmail.com', '$2b$05$6jigAHw3HE6ZiOQWv4WBieOOLE27xfHmsrh/wukTxCXbJcvVUCdDG', '', 'San Luis', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD PRIMARY KEY (`DNI`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idAplicacion`),
  ADD KEY `DNIPaciente` (`DNIPaciente`),
  ADD KEY `DNIAgente` (`DNIAgente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  ADD PRIMARY KEY (`idCentroDeVacunacion`);

--
-- Indices de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD PRIMARY KEY (`idDepositoNacional`);

--
-- Indices de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  ADD PRIMARY KEY (`idDepositoProvincial`);

--
-- Indices de la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD PRIMARY KEY (`idDescarte`),
  ADD KEY `DNIAgente` (`DNIAgente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`idLaboratorio`),
  ADD UNIQUE KEY `nombreLaboratorio` (`nombreLaboratorio`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`numeroDeSerie`),
  ADD KEY `numeroDeLote` (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idDepositoNacional` (`idDepositoNacional`),
  ADD KEY `idDepositoProvincial` (`idDepositoProvincial`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD PRIMARY KEY (`DNI`,`patologiaBase`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idTraslado`),
  ADD UNIQUE KEY `traslado_idCentroDeVacunacion_numeroDeSerie_unique` (`numeroDeSerie`,`idCentroDeVacunacion`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nombreUsuario` (`nombreUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `idAplicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  MODIFY `idCentroDeVacunacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  MODIFY `idDepositoNacional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  MODIFY `idDepositoProvincial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `descarte`
--
ALTER TABLE `descarte`
  MODIFY `idDescarte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `numeroDeSerie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `numeroDeLote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idTraslado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD CONSTRAINT `agentedesalud_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`DNIPaciente`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_2` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD CONSTRAINT `descarte_ibfk_1` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descarte_ibfk_2` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_3` FOREIGN KEY (`idDepositoNacional`) REFERENCES `depositonacional` (`idDepositoNacional`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_4` FOREIGN KEY (`idDepositoProvincial`) REFERENCES `depositoprovincial` (`idDepositoProvincial`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_5` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD CONSTRAINT `patologiabase_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD CONSTRAINT `traslado_ibfk_1` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `traslado_ibfk_2` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
