-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2019 a las 09:45:27
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectodestila2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFactura` (`_id` INT(11))  BEGIN
DELETE FROM facturas WHERE id = _id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFactura` (IN `comprador` VARCHAR(40), IN `direccion` VARCHAR(40), IN `telefono` VARCHAR(40), IN `dni` VARCHAR(40))  NO SQL
BEGIN
INSERT into facturas(facturas.fecha_compra, facturas.comprador, facturas.direccion,facturas.telefono, facturas.dni)
VALUES(now(), comprador, direccion ,telefono, dni)

;
SELECT last_insert_id() as idFactura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLineaFactura` (IN `id_factura` INT, IN `id_producto` INT, IN `nombre` VARCHAR(40), IN `cantidad` INT, IN `precio` DOUBLE)  NO SQL
BEGIN
INSERT into productos_facturas (productos_facturas.id_factura, productos_facturas.id_producto, productos_facturas.nombre, productos_facturas.cantidad, productos_facturas.precio)
VALUES(id_factura, id_producto, nombre, cantidad, precio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarPorPrecioAscendente` ()  BEGIN
SELECT * FROM productos ORDER BY precio ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarPorPrecioDescendente` ()  BEGIN
SELECT * FROM productos ORDER BY precio DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarCategoria` (IN `categoria` INT)  BEGIN
SELECT productos.* FROM productos JOIN categorias ON productos.id_categoria = categorias.id WHERE categorias.nombre = categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SellecionarTodosLosProductos` ()  BEGIN 
SELECT * FROM productos;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Vino'),
(2, 'Licor'),
(3, 'Cerveza'),
(4, 'Crema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `comprador` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id`, `fecha_compra`, `comprador`, `direccion`, `telefono`, `dni`) VALUES
(3, '2019-05-20', '0', '0', '0', ''),
(4, '2019-05-20', '0', '0', '0', '12'),
(5, '2019-05-20', '0', '0', '0', '1'),
(6, '2019-05-20', 'a', 'hsgasg, 37 ', '555555559', '56235632v'),
(7, '2019-05-20', 'a', 'hsgasg, 37 ', '555555559', '5555555555a'),
(8, '2019-05-20', 'Adrian Rodriguez', 'Calle de la piruleta, 420', '696969699', '657565765C'),
(9, '2019-05-20', 'Adrian', 'Askatasun', '555555598', '657565765C'),
(10, '2019-05-20', 'Adrian', 'Askatasun', '555555598', '657565765C'),
(11, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(12, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(13, '2019-05-20', 'a', 'hsgasg, 37 ', '555555559', '56235632v'),
(14, '2019-05-20', 'a', 'asah, 37', '555555559', '657565765c'),
(15, '2019-05-20', 'a', 'hsgasg, 37 ', '555555559', '56235632v'),
(16, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(17, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(18, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(19, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(20, '2019-05-20', 'a', 'asah, 37', '555555559', '56235632v'),
(21, '2019-05-20', 'a', 'asah, 37', '555555559', '657565765c'),
(22, '2019-05-20', 'mbmn', 'mnbmn', 'nmbn', 'mnbb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_eliminadas`
--

CREATE TABLE `facturas_eliminadas` (
  `id` int(11) NOT NULL,
  `cantidadTot` int(11) NOT NULL,
  `precioTot` double NOT NULL,
  `productos` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fecha_compra` date NOT NULL,
  `comprador` varchar(50) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `telefono` int(9) NOT NULL,
  `fecha_de_eliminacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_de_eliminacion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas_eliminadas`
--

INSERT INTO `facturas_eliminadas` (`id`, `cantidadTot`, `precioTot`, `productos`, `fecha_compra`, `comprador`, `direccion`, `telefono`, `fecha_de_eliminacion`, `usuario_de_eliminacion`) VALUES
(1, 200, 20.1, 'VARIOS', '2019-04-05', 'YO NO', '', 0, '2019-05-08 11:32:02', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `img`, `precio`, `id_categoria`) VALUES
(1, 'Fuego Valyrio', 'Durante años los mejores alquimistas han trabajado sin descanso para destilar nuestro licor de Fuego Valyrio. Y por fin lo han conseguido.\r\n\r\nEn el proceso de destilación, se crea una base de licor de whisky de 33º, los grados suficientes para encender la noche.\r\n\r\nDespués se especia con canela picante, para darle un icónico gusto final entre lo dulce y lo ardiente en tu garganta.\r\n\r\nEnfríalo hasta que tenga 4º para maximizar su sabor.\r\n\r\nAgitar la botella antes de tomarlo para desatar una nube de colores metalizados, que hipnotizará hasta la mente más fuerte.\r\n\r\nSírvelo en vaso de chupito, y prepárate para experimentar la euforia, la sed de poder y el ansia de éxito que desencadena.\r\n\r\nAhora es tu turno. Ve y reclama tu trono.\r\n\r\nContenido: 70 cl de Licor de Fuego Valyrio\r\n\r\nEl efecto de la botella permanece en el tiempo, solo hace falta agitarla de nuevo para desatarlo.\r\n\r\nFuego Valyrio es apto para celíacos, intolerantes a la lactosa y veganos.', 'img/licorFuegoVal.png', 15.5, 2),
(2, 'Cerveza Duff', '\r\n¡Mosquis, qué cerveza más rica! La bebida favorita de Homer Simpson está aquí directita del bar de Moe.\r\n\r\nDuff beer o cerveza Duff es la auténtica cerveza de la serie LOS SIMPSONS, que toman Homer, Barney, Lenny o Carl… hasta Flanders!\r\n\r\nAdemás como curiosidad, deberías saber que a pesar de ser una serie americana, han prohibido esta cerveza en USA ya que el gobierno americano considera que la serie puede influenciar en los niños incitándoles a beber alcohol. En Europa no tenemos problemas para poder probar la cerveza Duff que además está buenísima, eso sí, siempre con moderación. ¿No tienes ganas de ponerte en la piel de Homer con Duff?\r\n\r\nBodeca es el sitio perfecto para comprar cerveza Duff !!\r\n\r\nAlcohol: 4,7º\r\n\r\nContenido: 33cl', 'img/duff.jpg', 2.7, 3),
(3, 'Buitral Fresa', 'Nuestro licor crema de fresas con tequila se elabora con tequila mexicano, nata fresca de calidad superior y fresas. Su dulce y embriagador sabor proporciona un soplo de aire fresco en las reuniones con amigos y eventos sociales.', 'img/buitral.jpg', 14.5, 4),
(4, 'Irium Gold\r\n', 'Irium Gold es un vino que al agitarse se transforma, adquiriendo efecto Oro gracias a un ingrediente\r\n\r\n«Fruta Micronizada®»  que le da esta característica que lo hace tan distinto visualmente. Solo agite la botella y disfrute de este efecto que permanecerá una vez servido en copa.\r\n\r\nUn vino con un toque de carbónico, frutado y con graduación alcohólica de 9º con un sabor único.', 'img/iriumgold.jpg', 7.95, 1),
(5, 'Calavera Verde', 'Calavera Verde es una absenta de España. Su color verde y el vicioso diablo cornudo en la parte frontal de la botella prometen una experiencia emocionante y peligrosa! \r\n\r\nLa Absenta, simboliza el movimiento bohemio Parisino de finales del siglo 19, tiene una historia compleja y controvertida. El lugar de nacimiento de la absenta moderna, tal como la conocemos hoy en día, es el Val de Travers, un valle justo al oeste del lago de Neuchatel, Suiza occidental. Aunque los orígenes exactos de la bebida son difíciles de precisar, hay evidencia de que Artemisia absinthium se utilizó para hacer bebidas en Egipto y Grecia en el 1500 antes de Cristo.', 'img/absenta.jpg', 18.3, 2),
(6, 'Fuckermaister', 'Eeeeey… ¿cómo va eso…? ?\r\n\r\nTe presento FUCKERMAISTER, el licor más sensual, penetrante y afrodisíaco del mercado.\r\n\r\nAl igual que el “Jägermeister” (traudcción de pene chico) tenemos un licor de hierbas de lo más complejo ya que incluye más de 30 hierbas maceradas en alcohol y además todas son hierbas de las buenas, ninguna “poca-cosa”. Todo es macerado por un maestro destilador de forma especial junto con azúcar y más alcohol cinco veces destilado. Full grain de pureza, ojo, para los paladares más exigentes y exquisitos.\r\n\r\nAFRODISIACO, reiteramos. Para dar a tu noche un giro inesperado… ?\r\n\r\nPerfecta para servir en chupitos muy fríos o mezclado con cola o bebida energética.\r\n\r\nAlcohol: 35º\r\n\r\nFormato: 70cl', 'img/fuckermaister.jpg', 12.25, 2),
(7, 'Libellis Gin', 'Descubre la magia de Libellis Premium Gin, la ginebra premium que te harán cambiar la percepción de la realidad. Siente la exquisitez de su sabor y aroma y deléitate con sus sorprendentes efectos visuales.', 'img/libellis.jpg', 16.95, 2),
(8, 'Bock Damm', 'Nacida en Einbeck, consagrada en Munich.\r\nEn el siglo XIV la ciudad de Einbeck se hizo famosa por sus cervezas de excelente calidad. Munich no conseguía competir con estas hasta que el duque Maximiliano I decidió montar su propia cervecería con el maestro cervecero de Einbeck, Elias Pichler. Él fue el encargado de trasladar todos los conocimientos y acabó consagrando Munich como el gran referente de este estilo.', 'img/bockdamm.jpg', 0.61, 3),
(9, 'Leche De Pantera', 'Leche de Pantera es una sutil y agradable crema de licor de leche condensada elaborada a partir de la destilería artesanal de Martes Santo, originaria de la Legión Española y convertida en bebida tradicional del Tercio. Una de sus principales características es que posee un sabor inigualable, de carácter gourmet para llevar hasta nuestra comodidad un néctar exquisito.', 'img/lechedepantera.jpg', 14, 4),
(10, 'Gin Eco Martes Santo', 'Ginebra Ecológica Martes Santo Gin Excelent 100% Ecológica Certificada.\r\n\r\nSurge tras destilar en alambique centenario de cobre calentado por leña de encina, el mejor alcohol de grano junto con botánicos de muy alta calidad, previamente seleccionados ( enebro, corteza de mandarina, corteza de lima, canela, raíz de angélica, pétalos de jazmín, vainilla, nueces….). Todos ellos ecológicos 100% certificados.\r\n\r\nDando lugar a la primera ginebra española 100% ecológica certificada. Muy fina y equilibrada, con toques mediterráneos y exóticos, completamente distinta a las existentes en el mercado.\r\n\r\nEnvase de 70 cl. 40º', 'img/gineco.jpg', 35, 2);

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `productos_actualizados` AFTER UPDATE ON `productos` FOR EACH ROW INSERT INTO productos_actualizados (nombre_nuevo, descripcion_nuevo, img_nuevo, precio_nuevo, id_categoria_nuevo, nombre_antiguo, descripcion_antiguo, img_antiguo, precio_antiguo, id_categoria_antiguo) VALUES (new.nombre, new.descripcion, new.img, new.precio, new.id_categoria, old.nombre, old.descripcion, old.img, old.precio, old.id_categoria)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_actualizados`
--

CREATE TABLE `productos_actualizados` (
  `id` int(11) NOT NULL,
  `nombre_nuevo` varchar(100) NOT NULL,
  `descripcion_nuevo` text NOT NULL,
  `img_nuevo` varchar(100) NOT NULL,
  `precio_nuevo` double NOT NULL,
  `id_categoria_nuevo` int(11) NOT NULL,
  `nombre_antiguo` varchar(100) NOT NULL,
  `descripcion_antiguo` text NOT NULL,
  `img_antiguo` varchar(100) NOT NULL,
  `precio_antiguo` double NOT NULL,
  `id_categoria_antiguo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_actualizados`
--

INSERT INTO `productos_actualizados` (`id`, `nombre_nuevo`, `descripcion_nuevo`, `img_nuevo`, `precio_nuevo`, `id_categoria_nuevo`, `nombre_antiguo`, `descripcion_antiguo`, `img_antiguo`, `precio_antiguo`, `id_categoria_antiguo`) VALUES
(1, 'Cerveza Duff', '\r\n¡Mosquis, qué cerveza más rica! La bebida favorita de Homer Simpson está aquí directita del bar de Moe.\r\n\r\nDuff beer o cerveza Duff es la auténtica cerveza de la serie LOS SIMPSONS, que toman Homer, Barney, Lenny o Carl… hasta Flanders!\r\n\r\nAdemás como curiosidad, deberías saber que a pesar de ser una serie americana, han prohibido esta cerveza en USA ya que el gobierno americano considera que la serie puede influenciar en los niños incitándoles a beber alcohol. En Europa no tenemos problemas para poder probar la cerveza Duff que además está buenísima, eso sí, siempre con moderación. ¿No tienes ganas de ponerte en la piel de Homer con Duff?\r\n\r\nBodeca es el sitio perfecto para comprar cerveza Duff !!\r\n\r\nAlcohol: 4,7º\r\n\r\nContenido: 33cl', 'img/duff.jpg', 2.7, 3, 'Cerveza Duff', '\r\n¡Mosquis, qué cerveza más rica! La bebida favorita de Homer Simpson está aquí directita del bar de Moe.\r\n\r\nDuff beer o cerveza Duff es la auténtica cerveza de la serie LOS SIMPSONS, que toman Homer, Barney, Lenny o Carl… hasta Flanders!\r\n\r\nAdemás como curiosidad, deberías saber que a pesar de ser una serie americana, han prohibido esta cerveza en USA ya que el gobierno americano considera que la serie puede influenciar en los niños incitándoles a beber alcohol. En Europa no tenemos problemas para poder probar la cerveza Duff que además está buenísima, eso sí, siempre con moderación. ¿No tienes ganas de ponerte en la piel de Homer con Duff?\r\n\r\nBodeca es el sitio perfecto para comprar cerveza Duff !!\r\n\r\nAlcohol: 4,7º\r\n\r\nContenido: 33cl', 'img/duff.jpg', 3, 3),
(2, 'Buitral Fresa', 'Nuestro licor crema de fresas con tequila se elabora con tequila mexicano, nata fresca de calidad superior y fresas. Su dulce y embriagador sabor proporciona un soplo de aire fresco en las reuniones con amigos y eventos sociales.', 'img/buitral.jpg', 14.5, 2, 'Buitral Fresa', 'Nuestro licor crema de fresas con tequila se elabora con tequila mexicano, nata fresca de calidad superior y fresas. Su dulce y embriagador sabor proporciona un soplo de aire fresco en las reuniones con amigos y eventos sociales.', 'img/buitral.jpg', 14.5, 4),
(3, 'Buitral Fresa', 'Nuestro licor crema de fresas con tequila se elabora con tequila mexicano, nata fresca de calidad superior y fresas. Su dulce y embriagador sabor proporciona un soplo de aire fresco en las reuniones con amigos y eventos sociales.', 'img/buitral.jpg', 14.5, 4, 'Buitral Fresa', 'Nuestro licor crema de fresas con tequila se elabora con tequila mexicano, nata fresca de calidad superior y fresas. Su dulce y embriagador sabor proporciona un soplo de aire fresco en las reuniones con amigos y eventos sociales.', 'img/buitral.jpg', 14.5, 2),
(4, 'Fuckermaister', 'Eeeeey… ¿cómo va eso…? ?\r\n\r\nTe presento FUCKERMAISTER, el licor más sensual, penetrante y afrodisíaco del mercado.\r\n\r\nAl igual que el “Jägermeister” (traudcción de pene chico) tenemos un licor de hierbas de lo más complejo ya que incluye más de 30 hierbas maceradas en alcohol y además todas son hierbas de las buenas, ninguna “poca-cosa”. Todo es macerado por un maestro destilador de forma especial junto con azúcar y más alcohol cinco veces destilado. Full grain de pureza, ojo, para los paladares más exigentes y exquisitos.\r\n\r\nAFRODISIACO, reiteramos. Para dar a tu noche un giro inesperado… ?\r\n\r\nPerfecta para servir en chupitos muy fríos o mezclado con cola o bebida energética.\r\n\r\nAlcohol: 35º\r\n\r\nFormato: 70cl', 'img/fuckermaister.jpg', 12.25, 2, 'Fuckermaister', 'Eeeeey… ¿cómo va eso…? ?\r\n\r\nTe presento FUCKERMAISTER, el licor más sensual, penetrante y afrodisíaco del mercado.\r\n\r\nAl igual que el “Jägermeister” (traudcción de pene chico) tenemos un licor de hierbas de lo más complejo ya que incluye más de 30 hierbas maceradas en alcohol y además todas son hierbas de las buenas, ninguna “poca-cosa”. Todo es macerado por un maestro destilador de forma especial junto con azúcar y más alcohol cinco veces destilado. Full grain de pureza, ojo, para los paladares más exigentes y exquisitos.\r\n\r\nAFRODISIACO, reiteramos. Para dar a tu noche un giro inesperado… ?\r\n\r\nPerfecta para servir en chupitos muy fríos o mezclado con cola o bebida energética.\r\n\r\nAlcohol: 35º\r\n\r\nFormato: 70cl', 'img/fuckermaister.jpg', 12, 2),
(5, 'Libellis Gin', 'Descubre la magia de Libellis Premium Gin, la ginebra premium que te harán cambiar la percepción de la realidad. Siente la exquisitez de su sabor y aroma y deléitate con sus sorprendentes efectos visuales.', 'img/libellis.jpg', 16.95, 2, 'Libellis Gin', 'Descubre la magia de Libellis Premium Gin, la ginebra premium que te harán cambiar la percepción de la realidad. Siente la exquisitez de su sabor y aroma y deléitate con sus sorprendentes efectos visuales.', 'img/libellis.jpg', 16, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_facturas`
--

CREATE TABLE `productos_facturas` (
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos_facturas`
--

INSERT INTO `productos_facturas` (`id_factura`, `id_producto`, `nombre`, `cantidad`, `precio`) VALUES
(20, 4, 'Irium Gold\r\n', 1, 7.95),
(21, 4, 'Irium Gold\r\n', 1, 7.95),
(21, 3, 'Buitral Fresa', 1, 14.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `nombre`, `id_categoria`) VALUES
(1, 'Estilo alemán', 3),
(2, 'De trigo', 3),
(3, 'Tinto', 1),
(4, 'Anís', 2),
(5, 'Blanco', 1),
(6, 'Gran Reserva', 1),
(7, 'Vodka', 2),
(8, 'Licor 43', 2),
(9, 'Estilo belga', 3),
(10, 'Aguardiente', 2),
(11, 'Peché', 2),
(12, 'De crianza', 1),
(13, 'Estilo británico', 3),
(14, 'Brandy', 2),
(15, 'Sagardo', 4),
(16, 'Champagne', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `facturas_eliminadas`
--
ALTER TABLE `facturas_eliminadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `productos_actualizados`
--
ALTER TABLE `productos_actualizados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria_antiguo` (`id_categoria_antiguo`);

--
-- Indices de la tabla `productos_facturas`
--
ALTER TABLE `productos_facturas`
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `facturas_eliminadas`
--
ALTER TABLE `facturas_eliminadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos_actualizados`
--
ALTER TABLE `productos_actualizados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `productos_facturas`
--
ALTER TABLE `productos_facturas`
  ADD CONSTRAINT `productos_facturas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `productos_facturas_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
