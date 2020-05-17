-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-05-2020 a las 16:36:08
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u539108239_laimperial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL,
  `NombreCategoria` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `NombreCategoria`) VALUES
(1, 'aseo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `Nombre1` varchar(60) DEFAULT NULL,
  `Telefono` varchar(11) DEFAULT NULL,
  `Celular` varchar(11) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(60) NOT NULL,
  `TDocumento` varchar(5) DEFAULT NULL,
  `NDocumento` varchar(11) DEFAULT NULL,
  `FechaIngreso` datetime DEFAULT NULL,
  `NFactura` int(11) DEFAULT NULL,
  `IdZona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `Nombre1`, `Telefono`, `Celular`, `Correo`, `Direccion`, `TDocumento`, `NDocumento`, `FechaIngreso`, `NFactura`, `IdZona`) VALUES
(11, 'tienda el cañon', '31313', '1331313', 'frigo@gmail.com', 'san jose  cra 102 av principal', NULL, NULL, NULL, NULL, 1),
(13, 'frigo carnes de colombia', '00000', '3014409236', '00000', 'san jose  cra 102 av principal', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefacturas`
--

CREATE TABLE `detallefacturas` (
  `IdDFactura` int(11) NOT NULL,
  `IdFactura` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallefacturas`
--

INSERT INTO `detallefacturas` (`IdDFactura`, `IdFactura`, `IdProducto`, `Cantidad`) VALUES
(86, 63, 22, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `IdFactura` int(11) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`IdFactura`, `IdCliente`, `Fecha`, `IdUsuario`, `Total`) VALUES
(63, 13, '2020-04-20 05:07:56', 42, '20000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `IdCategoria` int(11) DEFAULT NULL,
  `PorceEmpresa` decimal(10,2) DEFAULT NULL,
  `PorceVendedor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Nombre`, `Precio`, `Cantidad`, `IdCategoria`, `PorceEmpresa`, `PorceVendedor`) VALUES
(1, 'acetaminofen x 100', '5500.00', 0, 1, '0.00', '0.06'),
(2, 'acetaminofen x 300', '15000.00', 20, 1, '0.00', '0.06'),
(3, 'acido muriatico delicia peq x 35', '52500.00', 10, 1, '0.00', '0.06'),
(4, 'acido muriatico delicia peq x uni', '1500.00', 20, 1, '0.00', '0.06'),
(5, 'acido muriatico g delicia 400  ml x 24 ', '67200.00', 10, 1, '0.00', '0.06'),
(6, 'acido muriatico g delicia 400  ml x uni', '2800.00', 16, 1, '0.00', '0.06'),
(7, 'acido muriatico g 400  ml x 24', '57600.00', 20, 1, '0.00', '0.06'),
(8, 'acido muriatico g 400 ml x uni', '2400.00', 20, 1, '0.00', '0.06'),
(9, 'acido muriatico peq economico x 48', '52800.00', 20, 1, '0.00', '0.06'),
(10, 'acido muriatico peq economico x uni', '1100.00', 20, 1, '0.00', '0.06'),
(11, 'algod?n grande  x 12', '10200.00', 20, 1, '0.00', '0.06'),
(12, 'algod?n peq x 50', '8000.00', 20, 1, '0.00', '0.06'),
(13, 'balde grande x 12', '78000.00', 20, 1, '0.00', '0.06'),
(14, 'balde grande x uni', '12000.00', 20, 1, '0.00', '0.06'),
(15, 'balde mediano x 12', '66000.00', 20, 1, '0.00', '0.06'),
(16, 'balde mediano x uni', '8000.00', 20, 1, '0.00', '0.06'),
(17, 'balde sencillo  x 12', '42000.00', 20, 1, '0.00', '0.06'),
(18, 'balde sencillo  x uni', '4000.00', 20, 1, '0.00', '0.06'),
(19, 'bolsa basura extra jumbo bulto x 100', '250000.00', 20, 1, '0.00', '0.03'),
(20, 'bolsa basura extra jumbo bulto x uni', '3000.00', 20, 1, '0.00', '0.06'),
(21, 'bolsa basura kinkon bulto x 250 ', '225000.00', 20, 1, '0.00', '0.03'),
(22, 'bolsa bazura kinkon  x uni', '1000.00', 0, 1, '0.00', '0.06'),
(23, 'bolsa bolis paca x 50 uni', '9000.00', 20, 1, '0.00', '0.06'),
(24, 'bolsa guarapera paca x 50 uni', '25000.00', 20, 1, '0.00', '0.06'),
(25, 'bolsa guaraperax 25 uni', '12500.00', 20, 1, '0.00', '0.06'),
(26, 'bolsa guaraperita paca x 50 uni', '20000.00', 20, 1, '0.00', '0.06'),
(27, 'bolsa guaraperita x 25 uni', '10000.00', 20, 1, '0.00', '0.06'),
(28, 'bolsa hielo  paca x 50', '27000.00', 20, 1, '0.00', '0.06'),
(29, 'bolsa hielo  x 25', '13500.00', 20, 1, '0.00', '0.06'),
(30, 'bolsa hielo g paca x  50', '45000.00', 20, 1, '0.00', '0.06'),
(31, 'bolsa hielo g x 25', '22500.00', 20, 1, '0.00', '0.06'),
(32, 'bolsa kilo paca x 50', '25000.00', 20, 1, '0.00', '0.06'),
(33, 'bolsa kilo x uni', '12500.00', 20, 1, '0.00', '0.06'),
(34, 'bolsa medio kilo paca  x 50', '20000.00', 20, 1, '0.00', '0.06'),
(35, 'bolsa medio kilo x 25 uni', '10000.00', 20, 1, '0.00', '0.06'),
(36, 'bolsa mencha 10kl paca x 10', '28000.00', 20, 1, '0.00', '0.06'),
(37, 'bolsa mencha 10kl uni', '2800.00', 20, 1, '0.00', '0.06'),
(38, 'bolsa mencha 15 kl paca x  10', '35000.00', 20, 1, '0.00', '0.06'),
(39, 'bolsa mencha 15 kl x uni', '3500.00', 20, 1, '0.00', '0.06'),
(40, 'bolsa mencha 2 kl paca x 10', '12000.00', 20, 1, '0.00', '0.06'),
(41, 'bolsa mencha 2 kl x uni', '1200.00', 20, 1, '0.00', '0.06'),
(42, 'bolsa mencha 25 kl paca x 10', '85000.00', 20, 1, '0.00', '0.06'),
(43, 'bolsa mencha 25 kl x uni', '8500.00', 20, 1, '0.00', '0.06'),
(44, 'bolsa mencha 10 pacas 3 kl', '12000.00', 20, 1, '0.00', '0.03'),
(45, 'bolsa mencha 3 kl paca x 10', '14000.00', 20, 1, '0.00', '0.06'),
(46, 'bolsa mencha 3kl x uni', '1400.00', 20, 1, '0.00', '0.06'),
(47, 'bolsa mencha 5 kl paca  x 10', '23000.00', 20, 1, '0.00', '0.06'),
(48, 'bolsa mencha 5 kl x uni', '2300.00', 20, 1, '0.00', '0.06'),
(49, 'brillo brio x 12', '12000.00', 20, 1, '0.00', '0.06'),
(50, 'brillo chino x 12', '5500.00', 20, 1, '0.00', '0.06'),
(51, 'brillo fino x 36', '5500.00', 20, 1, '0.00', '0.06'),
(52, 'brillo grueso x 36', '5500.00', 20, 1, '0.00', '0.06'),
(53, 'brillo santander x 12', '10000.00', 20, 1, '0.00', '0.06'),
(54, 'cepillo carretero x 12', '102000.00', 20, 1, '0.00', '0.06'),
(55, 'cepillo carretero x uni', '8500.00', 20, 1, '0.00', '0.06'),
(56, 'cepillo diente adulto x  12', '9000.00', 20, 1, '0.00', '0.06'),
(57, 'cepillo diente ni?o x  12', '9000.00', 20, 1, '0.00', '0.06'),
(58, 'cepillo piso x 12', '50400.00', 20, 1, '0.00', '0.06'),
(59, 'cepillo piso x uni', '4200.00', 20, 1, '0.00', '0.06'),
(60, 'cepillo ropa caja x 120 ', '156000.00', 20, 1, '0.00', '0.06'),
(61, 'cepillo ropa x uni', '1500.00', 20, 1, '0.00', '0.06'),
(62, 'cepillo sanitario caja x 24 ', '88800.00', 20, 1, '0.00', '0.06'),
(63, 'cepillo sanitario x uni', '3700.00', 20, 1, '0.00', '0.06'),
(64, 'chupas x 12 ', '31800.00', 20, 1, '0.00', '0.06'),
(65, 'chupas x uni ', '2650.00', 20, 1, '0.00', '0.06'),
(66, 'cloro repuesto jp  10 cj x 24', '16000.00', 20, 1, '0.00', '0.03'),
(67, 'cloro repuesto jp x 24', '16800.00', 20, 1, '0.00', '0.06'),
(68, 'cloro tarro poder x 24', '19900.00', 20, 1, '0.00', '0.06'),
(69, 'cloro tarro poder x 3800 ml caj x 3uni', '25500.00', 20, 1, '0.00', '0.06'),
(70, 'cloro tarro poder  x 3800 ml  x uni', '8500.00', 20, 1, '0.00', '0.06'),
(71, 'colgantes', '200.00', 20, 1, '0.00', '0.06'),
(72, 'copitos  x 12', '6000.00', 20, 1, '0.00', '0.06'),
(73, 'coprologico x50', '11000.00', 20, 1, '0.00', '0.06'),
(74, 'coprologico x25', '5500.00', 20, 1, '0.00', '0.06'),
(75, 'creolina gra de 5 cj adelante ', '18720.00', 20, 1, '0.00', '0.06'),
(76, 'creolina gra x 24', '24000.00', 20, 1, '0.00', '0.06'),
(77, 'creolina gra  x uni', '1000.00', 20, 1, '0.00', '0.06'),
(78, 'creolina peq x 24', '60000.00', 20, 1, '0.00', '0.06'),
(79, 'creolina peq x uni', '2500.00', 20, 1, '0.00', '0.06'),
(80, 'cuchilla hoja ', '7500.00', 20, 1, '0.00', '0.06'),
(81, 'desengrasante x 24', '67200.00', 20, 1, '0.00', '0.06'),
(82, 'desengrasante x uni', '2800.00', 20, 1, '0.00', '0.06'),
(83, 'desinfectante lt x 12', '52800.00', 20, 1, '0.00', '0.06'),
(84, 'desinfectante lt x uni', '2400.00', 20, 1, '0.00', '0.06'),
(85, 'desodorante  balan duo x 18', '9600.00', 20, 1, '0.00', '0.04'),
(86, 'desodorante balan clinical hombre x 18 ', '9600.00', 20, 1, '0.00', '0.04'),
(87, 'desodorante balan clinical mujer x 18', '9600.00', 20, 1, '0.00', '0.04'),
(88, 'detergente bulto x 20 kl ', '42000.00', 20, 1, '0.00', '0.06'),
(89, 'detergente gol 50gr paca x 200 uni', '40000.00', 20, 1, '0.00', '0.06'),
(90, 'detergente gol  50gr x 50 uni', '10000.00', 20, 1, '0.00', '0.06'),
(91, 'detergente gol  50 gr x 100 uni ', '20000.00', 20, 1, '0.00', '0.06'),
(92, 'dorco hoja x 60 uni', '9000.00', 20, 1, '0.00', '0.06'),
(93, 'dorco maquina  x 24', '8500.00', 20, 1, '0.00', '0.06'),
(94, 'escoba dalia x 24', '72000.00', 20, 1, '0.00', '0.06'),
(95, 'escoba dalia x uni', '3200.00', 20, 1, '0.00', '0.06'),
(96, 'escoba palito x 12', '24000.00', 20, 1, '0.00', '0.06'),
(97, 'escoba palito x uni', '2000.00', 20, 1, '0.00', '0.06'),
(98, 'escoba reina x 24', '120000.00', 20, 1, '0.00', '0.06'),
(99, 'escoba reina x uni', '5000.00', 20, 1, '0.00', '0.06'),
(100, 'escoba super ob x 24', '120000.00', 20, 1, '0.00', '0.06'),
(101, 'escoba super ob x uni', '5000.00', 20, 1, '0.00', '0.06'),
(102, 'escoba super tr x 24', '132000.00', 20, 1, '0.00', '0.06'),
(103, 'escoba super tr x uni ', '5500.00', 20, 1, '0.00', '0.06'),
(104, 'escoba tr x 72 uni', '266400.00', 20, 1, '0.00', '0.06'),
(105, 'escoba tr x24', '88800.00', 20, 1, '0.00', '0.06'),
(106, 'escoba tr  x uni', '3700.00', 20, 1, '0.00', '0.06'),
(107, 'esencia  kola 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(108, 'esencia kola 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(109, 'esencia banano 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(110, 'esencia banano 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(111, 'esencia chicle 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(112, 'esencia chicle 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(113, 'esencia coco  375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(114, 'esencia coco  375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(115, 'esencia fresa 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(116, 'esencia fresa 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(117, 'esencia limon 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(118, 'esencia limon 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(119, 'esencia mantecado 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(120, 'esencia mantecado 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(121, 'esencia pi?a 375 ml x 24', '19200.00', 20, 1, '0.00', '0.06'),
(122, 'esencia pi?a 375 ml x uni', '800.00', 20, 1, '0.00', '0.06'),
(123, 'esencia vainilla blancax 24', '19200.00', 20, 1, '0.00', '0.06'),
(124, 'esencia vainilla blanca x uni', '800.00', 20, 1, '0.00', '0.06'),
(125, 'esencia vainilla negra x 24', '19200.00', 20, 1, '0.00', '0.06'),
(126, 'esencia vainilla negra x uni', '800.00', 20, 1, '0.00', '0.06'),
(127, 'espaladrapo x 12', '3800.00', 20, 1, '0.00', '0.06'),
(128, 'esponja brillante x 12', '9000.00', 20, 1, '0.00', '0.06'),
(129, 'esponja doble uso x 24', '7200.00', 20, 1, '0.00', '0.06'),
(130, 'esponja malla x 24', '7200.00', 20, 1, '0.00', '0.06'),
(131, 'esponja zabra x 36', '7200.00', 20, 1, '0.00', '0.06'),
(132, 'foco ahorrador espiral ', '4500.00', 20, 1, '0.00', '0.06'),
(133, 'foco economico x 10', '12000.00', 20, 1, '0.00', '0.06'),
(134, 'foco led ', '3800.00', 20, 1, '0.00', '0.06'),
(135, 'fosforo gra madera x 12', '10800.00', 20, 1, '0.00', '0.06'),
(136, 'fosforo peq x 100', '13000.00', 20, 1, '0.00', '0.06'),
(137, 'gancho madera x 24', '1500.00', 20, 1, '0.00', '0.06'),
(138, 'gancho ropa  closet  bulto x 300', '48000.00', 20, 1, '0.00', '0.06'),
(139, 'gancho ropa  closet  x uni', '200.00', 20, 1, '0.00', '0.06'),
(140, 'gasa x 12', '3800.00', 20, 1, '0.00', '0.06'),
(141, 'gel antibacterial 250 ml x 150', '135000.00', 20, 1, '0.00', '0.06'),
(142, 'gel antibacterial 250 ml x uni', '900.00', 20, 1, '0.00', '0.06'),
(143, 'gota magica gra x 12', '135000.00', 20, 1, '0.00', '0.06'),
(144, 'gota magica peq x 12', '900.00', 20, 1, '0.00', '0.06'),
(145, 'guante domestico original x 12', '42000.00', 20, 1, '0.00', '0.06'),
(146, 'guante domestico original x uni', '3500.00', 20, 1, '0.00', '0.06'),
(147, 'guante domestico sencillo x 12', '18000.00', 20, 1, '0.00', '0.06'),
(148, 'guante domestico sencillo x uni', '1500.00', 20, 1, '0.00', '0.06'),
(149, 'guante quirurjico x 50 uni', '50000.00', 20, 1, '0.00', '0.06'),
(150, 'ibuprofeno 400  x10 uni', '10400.00', 20, 1, '0.00', '0.06'),
(151, 'ibuprofeno 800  x 10 uni', '10500.00', 20, 1, '0.00', '0.06'),
(152, 'jabon  pasion x 25', '25000.00', 20, 1, '0.00', '0.06'),
(153, 'jabon pasion x uni', '1000.00', 20, 1, '0.00', '0.06'),
(154, 'jabon big x 20', '18000.00', 20, 1, '0.00', '0.06'),
(155, 'jabon big x uni', '900.00', 20, 1, '0.00', '0.06'),
(156, 'jabon canalita  x 25', '12600.00', 20, 1, '0.00', '0.06'),
(157, 'jabon liquido mano 250 ml x 150 uni', '135000.00', 20, 1, '0.00', '0.06'),
(158, 'jabon liquido mano 250 ml x  uni', '900.00', 20, 1, '0.00', '0.06'),
(159, 'jabon liquido plato 250 ml x 150 uni', '135000.00', 20, 1, '0.00', '0.06'),
(160, 'jabon liquido plato 250 ml x uni', '900.00', 20, 1, '0.00', '0.06'),
(161, 'jeringa 10 cc x 100 uni', '28000.00', 20, 1, '0.00', '0.06'),
(162, 'jeringa 10 cc x 50 uni', '14000.00', 20, 1, '0.00', '0.06'),
(163, 'jeringa 5 cc x 100 uni', '20000.00', 20, 1, '0.00', '0.06'),
(164, 'jeringa 5 cc x 50 uni', '10000.00', 20, 1, '0.00', '0.06'),
(165, 'katory x 50', '15000.00', 20, 1, '0.00', '0.06'),
(166, 'konzil acondicionador x 16', '7600.00', 20, 1, '0.00', '0.04'),
(167, 'konzil crema para peinar  rizos  x 16', '7600.00', 20, 1, '0.00', '0.04'),
(168, 'konzil crema para peinar lizos  x 16', '7600.00', 20, 1, '0.00', '0.04'),
(169, 'konzil shampoo x 16', '7600.00', 20, 1, '0.00', '0.04'),
(170, 'lapicero x 36 uni', '6500.00', 20, 1, '0.00', '0.06'),
(171, 'lapicero x12 uni', '4500.00', 20, 1, '0.00', '0.06'),
(172, 'lapiz corrector caja x 12', '18000.00', 20, 1, '0.00', '0.06'),
(173, 'limpia techo x 12', '50400.00', 20, 1, '0.00', '0.06'),
(174, 'limpiatecho x uni', '4200.00', 20, 1, '0.00', '0.06'),
(175, 'limpia vidrio caja x 24', '67200.00', 20, 1, '0.00', '0.06'),
(176, 'limpia vidrio x  uni', '2800.00', 20, 1, '0.00', '0.06'),
(177, 'marcador caja x 12', '14400.00', 20, 1, '0.00', '0.06'),
(178, 'naproxeno x 10', '3500.00', 20, 1, '0.00', '0.06'),
(179, 'orina x 50', '11000.00', 20, 1, '0.00', '0.06'),
(180, 'orina x 25', '5500.00', 20, 1, '0.00', '0.06'),
(181, 'palillo chuzo x 100', '2200.00', 20, 1, '0.00', '0.06'),
(182, 'palillo diente x 12', '8400.00', 20, 1, '0.00', '0.06'),
(183, 'palillo paleta  x 1000', '9000.00', 20, 1, '0.00', '0.06'),
(184, 'palos de escoba x uni', '1000.00', 20, 1, '0.00', '0.06'),
(185, 'pa?o humedo g x caja  24uni', '96000.00', 20, 1, '0.00', '0.06'),
(186, 'pa?o humedo g x uni', '4000.00', 20, 1, '0.00', '0.06'),
(187, 'pa?o humedo m x84', '142800.00', 20, 1, '0.00', '0.06'),
(188, 'pa?o humedo m x uni', '1700.00', 20, 1, '0.00', '0.06'),
(189, 'pa?o humedo p x72', '72000.00', 20, 1, '0.00', '0.06'),
(190, 'pa?o humedo p x uni ', '1000.00', 20, 1, '0.00', '0.06'),
(191, 'papel aluminio de bolsa  x 50 uni', '1700.00', 20, 1, '0.00', '0.06'),
(192, 'papel aluminio de caja x 50 uni', '95000.00', 20, 1, '0.00', '0.06'),
(193, 'papel aluminio de caja  x uni', '2000.00', 20, 1, '0.00', '0.06'),
(194, 'pitillo fres g paca  x 50', '35000.00', 20, 1, '0.00', '0.06'),
(195, 'pitillo fres x uni', '700.00', 20, 1, '0.00', '0.06'),
(196, 'rastrillo caja x 24 uni', '60000.00', 20, 1, '0.00', '0.06'),
(197, 'rastrillo x uni', '2500.00', 20, 1, '0.00', '0.06'),
(198, 'recojedor caja x 120 uni', '180000.00', 20, 1, '0.00', '0.06'),
(199, 'recojedor x uni', '1700.00', 20, 1, '0.00', '0.06'),
(200, 'resaltadores caja x 12 uni', '14400.00', 20, 1, '0.00', '0.06'),
(201, 'sal refinada x 25', '8500.00', 20, 1, '0.00', '0.06'),
(202, 'salsa negra 2 lt x 6', '21600.00', 20, 1, '0.00', '0.06'),
(203, 'salsa negra 3 lt x 6', '42000.00', 20, 1, '0.00', '0.06'),
(204, 'salsa negra 3 lt x uni', '7000.00', 20, 1, '0.00', '0.06'),
(205, 'salsa negra 4 lt x 4', '32000.00', 20, 1, '0.00', '0.06'),
(206, 'salsa negra 500 x 24', '21600.00', 20, 1, '0.00', '0.06'),
(207, 'salsa negra lt x 12', '21600.00', 20, 1, '0.00', '0.06'),
(208, 'tapa boca  x 50 uni ', '50000.00', 20, 1, '0.00', '0.06'),
(209, 'trapero 120', '3300.00', 20, 1, '0.00', '0.06'),
(210, 'trapero 140', '3800.00', 20, 1, '0.00', '0.06'),
(211, 'trapero 160', '4300.00', 20, 1, '0.00', '0.06'),
(212, 'trapero industrial', '4700.00', 20, 1, '0.00', '0.06'),
(213, 'trapero imperial', '6000.00', 20, 1, '0.00', '0.06'),
(214, 'trapero copa imperial', '6000.00', 20, 1, '0.00', '0.06'),
(215, 'trapero copa G', '4700.00', 20, 1, '0.00', '0.06'),
(216, 'trapero copa p', '3800.00', 20, 1, '0.00', '0.06'),
(217, 'trapero copa M', '4300.00', 20, 1, '0.00', '0.06'),
(218, 'trapero copa XP', '3300.00', 20, 1, '0.00', '0.06'),
(219, 'trapero franela g ', '3800.00', 20, 1, '0.00', '0.06'),
(220, 'varsol aroma  g 400 ml x 24', '84000.00', 20, 1, '0.00', '0.06'),
(221, 'varsol aroma g 400 ml x uni', '3500.00', 20, 1, '0.00', '0.06'),
(222, 'varsol aroma  peq x 35', '42000.00', 20, 1, '0.00', '0.06'),
(223, 'varsol aroma peq x uni', '1200.00', 20, 1, '0.00', '0.06'),
(224, 'varsol ecologico  peq x 35', '42000.00', 20, 1, '0.00', '0.06'),
(225, 'varsol ecologico peq x uni', '1200.00', 20, 1, '0.00', '0.06'),
(226, 'varsol ecologico delicia x 35', '59500.00', 20, 1, '0.00', '0.06'),
(227, 'varsol ecologico delicia x uni', '1700.00', 20, 1, '0.00', '0.06'),
(228, 'varsol ecologico g 400 x 24', '103200.00', 20, 1, '0.00', '0.06'),
(229, 'varsol ecologico g 400 x uni', '4300.00', 20, 1, '0.00', '0.06'),
(230, 'varsol ecologico lt  x 12', '120000.00', 20, 1, '0.00', '0.06'),
(231, 'varsol ecologico lt x uni', '10000.00', 20, 1, '0.00', '0.06'),
(232, 'varsol puro  g 400 ml x 30', '84000.00', 20, 1, '0.00', '0.06'),
(233, 'varsol puro g 400 ml x uni', '2800.00', 20, 1, '0.00', '0.06'),
(234, 'varsol puro peq delicia x 35', '45500.00', 20, 1, '0.00', '0.06'),
(235, 'varsol puro peq delicia x uni', '1300.00', 20, 1, '0.00', '0.06'),
(236, 'varsol puro econpeq x 72', '86400.00', 20, 1, '0.00', '0.06'),
(237, 'varsol puro eco peq x uni', '1200.00', 20, 1, '0.00', '0.06'),
(238, 'varsol puro eco peq x 48', '57600.00', 20, 1, '0.00', '0.06'),
(239, 'varsol sachet ecologico x 12', '13200.00', 20, 1, '0.00', '0.06'),
(240, 'varsol sachet gel  x 12', '13200.00', 20, 1, '0.00', '0.06'),
(241, 'vasos 10 onz caja x 100 paq', '130000.00', 20, 1, '0.00', '0.06'),
(242, 'vasos 10 onz x uni', '1300.00', 20, 1, '0.00', '0.06'),
(243, 'vasos 12 onz caja x  100 paq', '140000.00', 20, 1, '0.00', '0.06'),
(244, 'vasos 12 onz x uni', '1400.00', 20, 1, '0.00', '0.06'),
(245, 'vasos 7  onz caja x 50 paq', '80000.00', 20, 1, '0.00', '0.06'),
(246, 'vasos 7 onz x uni', '1600.00', 20, 1, '0.00', '0.06'),
(247, 'vela gra caja x 40 paq', '152000.00', 20, 1, '0.00', '0.03'),
(248, 'vela gra x uni ', '4000.00', 20, 1, '0.00', '0.06'),
(249, 'velon # 10', '3000.00', 10, 1, '0.00', '0.06'),
(250, 'velon # 3', '1000.00', 20, 1, '0.00', '0.06'),
(251, 'velon # 7', '2400.00', 20, 1, '0.00', '0.06'),
(252, 'velon #5', '1300.00', 20, 1, '0.00', '0.06'),
(253, 'velon #8', '2800.00', 20, 1, '0.00', '0.06'),
(254, 'vinagre   500 ml x24', '15000.00', 20, 1, '0.00', '0.06'),
(255, 'vinagre  4 lt  x 4', '20000.00', 20, 1, '0.00', '0.06'),
(256, 'vinagre  lt x 12', '15000.00', 20, 1, '0.00', '0.06'),
(257, 'vinagre 2 lt x 6', '15000.00', 20, 1, '0.00', '0.06'),
(258, 'vinagre 3 lt x 6', '27000.00', 20, 1, '0.00', '0.06'),
(259, 'wiper bulto x 25kl', '62500.00', 20, 1, '0.00', '0.03'),
(260, 'wiper x kl ', '2800.00', 20, 1, '0.00', '0.06'),
(261, 'yesquero caja x  25 uni', '10000.00', 20, 1, '0.00', '0.06'),
(263, 'esco \"D\" x 24', '67200.00', 20, NULL, NULL, NULL),
(264, 'ejemplo', '10000.00', 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuarios`
--

CREATE TABLE `tusuarios` (
  `IdTUsuario` int(11) NOT NULL,
  `NombreTUsuario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tusuarios`
--

INSERT INTO `tusuarios` (`IdTUsuario`, `NombreTUsuario`) VALUES
(1, 'Administrador'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre1` varchar(13) DEFAULT NULL,
  `Apellido1` varchar(13) DEFAULT NULL,
  `NDocumento` varchar(13) DEFAULT NULL,
  `Celular` varchar(11) DEFAULT NULL,
  `Contrasena` varchar(60) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `FechaIngreso` datetime DEFAULT NULL,
  `Ventas` int(11) DEFAULT NULL,
  `IdTUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Nombre1`, `Apellido1`, `NDocumento`, `Celular`, `Contrasena`, `Correo`, `FechaIngreso`, `Ventas`, `IdTUsuario`) VALUES
(38, 'maria jose', 'roa ', '1050959678', '3014409236', 'ba6e08e498204d471efdad33a93bb57c', 'maroces19@gmail.com', '2020-04-17 04:09:41', NULL, 1),
(39, 'ercinia ', 'lopez', '45477621', '3008498360', '3ca03ba0cd46af39a2d377bba7beccf1', 'ercinia@gmail.com', '2020-04-17 05:52:30', NULL, 2),
(40, 'admin', NULL, NULL, NULL, '67347afb671607e608cd51913fd612fe', 'admin@mail.com', NULL, NULL, 1),
(42, 'andres', 'cortez', '1036673731', '000000', '231badb19b93e44f47da1bd64a8147f2', 'afca@gmail.com', '2020-04-20 11:30:30', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `IdZona` int(11) NOT NULL,
  `NombreZona` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`IdZona`, `NombreZona`) VALUES
(1, 'nelson mandela '),
(2, 'villas de aranjuez #1'),
(3, 'villas de aranjuez #2'),
(4, 'pozon #1'),
(5, 'pozon #2'),
(6, 'olaya '),
(7, 'villas de la candelaria'),
(8, 'san pedro martil '),
(9, 'nazareno '),
(10, 'san fernando'),
(11, 'ala meda  la victoria'),
(12, 'san jose'),
(13, 'villa grande'),
(14, 'bayunca '),
(15, 'fredonia'),
(16, 'turbaco'),
(17, 'alpez'),
(18, 'socorro'),
(19, 'rodeo '),
(20, 'paraguay'),
(21, 'blasde lezo'),
(22, 'milagro'),
(23, 'nuevo bosque '),
(24, 'alto bosque');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`),
  ADD KEY `fk_IdZona` (`IdZona`);

--
-- Indices de la tabla `detallefacturas`
--
ALTER TABLE `detallefacturas`
  ADD PRIMARY KEY (`IdDFactura`),
  ADD KEY `fk_IdFactura` (`IdFactura`),
  ADD KEY `fk_IdProducto` (`IdProducto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`IdFactura`),
  ADD KEY `fk_IdCliente` (`IdCliente`),
  ADD KEY `fk_IdUsuario` (`IdUsuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `fk_IdCategoria` (`IdCategoria`);

--
-- Indices de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  ADD PRIMARY KEY (`IdTUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD KEY `fk_IdTUsuario` (`IdTUsuario`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`IdZona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detallefacturas`
--
ALTER TABLE `detallefacturas`
  MODIFY `IdDFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `IdFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  MODIFY `IdTUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `IdZona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_IdZona` FOREIGN KEY (`IdZona`) REFERENCES `zonas` (`IdZona`);

--
-- Filtros para la tabla `detallefacturas`
--
ALTER TABLE `detallefacturas`
  ADD CONSTRAINT `fk_IdFactura` FOREIGN KEY (`IdFactura`) REFERENCES `facturas` (`IdFactura`),
  ADD CONSTRAINT `fk_IdProducto` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_IdCliente` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  ADD CONSTRAINT `fk_IdUsuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_IdCategoria` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_IdTUsuario` FOREIGN KEY (`IdTUsuario`) REFERENCES `tusuarios` (`IdTUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
