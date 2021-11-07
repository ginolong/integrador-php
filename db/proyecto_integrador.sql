-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2021 a las 19:50:53
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_integrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'TV'),
(2, 'Tablet'),
(3, 'Notebook'),
(4, 'Smartwatch'),
(5, 'Drone'),
(6, 'Software'),
(7, 'Smartphone'),
(8, 'Parlante'),
(10, 'Microondas'),
(11, 'Lavarropas'),
(12, 'Secarropas'),
(13, 'Lavasecarropas'),
(14, 'Consola'),
(15, 'Juego'),
(16, 'Licuadora'),
(17, 'Multiprocesadora'),
(18, 'Tostadora'),
(19, 'Juguera'),
(20, 'Cafetera'),
(21, 'Aspiradora'),
(22, 'Lustradora'),
(23, 'Joystick'),
(26, 'Sandwichera'),
(27, 'Pava eléctrica'),
(28, 'Fábrica de pastas'),
(29, 'Horno microondas'),
(30, 'Horno a gas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` smallint(5) UNSIGNED NOT NULL,
  `id_sector` tinyint(3) UNSIGNED NOT NULL,
  `id_localidad` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `sexo` enum('femenino','masculino','otro') NOT NULL DEFAULT 'otro',
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `id_sector`, `id_localidad`, `nombre`, `apellido`, `fecha_de_nacimiento`, `sexo`, `direccion`, `telefono`, `email`, `observaciones`) VALUES
(1, 2, 0, 'Verónica', 'López', '1983-02-10', 'femenino', 'Av. Corrientes 4080, 4C', '+54 9 11 3333-2222', 'verolopez@gmail.com', NULL),
(2, 1, 0, 'Santiago', 'Pascual', '1994-04-27', 'masculino', 'Sarandí 190', '+ 54 9 11 5555-7777', 'santi1977@hotmail.com', NULL),
(3, 2, 0, 'Martín', 'Morelli', '1989-10-28', 'otro', 'Av. Santa Fe 3070, 15 A', '+598 2 333-4444', 'mrmorelli1@yahoo.com', 'Cambió de puesto en febrero 2019'),
(4, 4, 0, 'Luciana', 'Morelli', '1984-05-18', 'femenino', 'San Martín 320', '+54 11 5555-7777, int 19', NULL, ''),
(5, 3, 0, 'Martín', 'Moretti', '1987-01-30', '', 'Av. Corrientes 3333, 3ro C', NULL, 'mm1988@gmail.com', 'Compró heladera en cuotas'),
(6, 1, 0, 'Gastón', 'Rodríguez', '1992-12-20', 'masculino', 'Rosario 214', NULL, NULL, NULL),
(7, 5, 0, 'Natalia', 'Paz', '1990-11-04', 'femenino', 'San Martín 214', '+54 221 444-2828', 'paz_nati_11@yahoo.com', NULL),
(13, 4, 0, 'Carlos Luis', 'Alberti', '1978-04-29', 'masculino', 'Formosa 933', '+54 299 5557889', 'clalberti88@yahoo.com', NULL),
(14, 1, 0, 'Camila Sol', 'Ferrer', '1993-06-23', 'femenino', 'Av. Argentina 567', '+54 299 4565785', 'camila.sol.ferrer@gmail.com', NULL),
(15, 1, 0, 'Valentino', 'Ferrero', '1994-09-02', 'masculino', 'Salta 897', '+54 299 6783444', 'ferrerovalentino21@gmail.com', NULL),
(16, 2, 0, 'Camila', 'Vegas Pérez', '1987-09-26', 'otro', 'Río Negro 765', '+54 2995343898', 'camivegasperez@gmail.com', 'Cambió de puesto en octubre 2020.'),
(17, 5, 0, 'Tamara Sofía', 'Beltrame', '1984-01-22', 'femenino', 'General Roca 543', '+54 299 6765545', 'tamara.beltrame@gmail.com', NULL),
(18, 4, 0, 'Lucas', 'Valenti', '1992-08-20', 'masculino', 'Río Colorado 89', '', 'lucas_valenti87@gmail.com', NULL),
(19, 4, 0, 'Blanca', 'Fernández Pino', '1979-07-13', 'femenino', 'San Juan 977', NULL, NULL, NULL),
(20, 4, 0, 'Analía', 'Alberti', '1974-05-29', 'femenino', 'Formosa 933', '+54 299 3334884', 'ani353i88@yahoo.com', NULL),
(21, 2, 1, 'Camila', 'Mendez', '1994-04-07', 'femenino', 'Av. Las Flores 177', '+54 9 11 3333-2222', 'camilamendez@gmail.com', 'Cambió de puesto en 2020'),
(22, 5, 2, 'Santiago', 'Marquez', '1977-08-04', 'masculino', 'Av. Alem 190', '+54 9 11 5555-8888', 'santiamarquez@gmail.com', NULL),
(23, 3, 4, 'Carmela', 'Ibañez', '2000-05-23', 'otro', 'Av. Argentina 1550', '+54 299-5486344', 'carmelaib@yahoo.com', 'Realiza teletrabajo'),
(24, 1, 5, 'Marcelo', 'Fernandez', '1987-09-14', 'otro', 'Sgto. Cabral 495', '+54 9 11 6666-5858', '', NULL),
(25, 6, 3, 'Lucia', 'Fernandez', '1990-10-30', 'femenino', 'Bouquet Roldán 580', '', 'lucianamor@outlook.com', NULL),
(26, 4, 2, 'Patricia', 'Marquez', '2001-06-06', 'femenino', 'Mayor Buratovich 297', '+54 299-6845299', 'patrmarquez@yahoo.com', NULL),
(27, 3, 0, 'Veronica', 'Lopez', '1985-03-21', 'femenino', 'Av.Cordoba 4080', '+54 911 3333-2222', 'verolopez@gmail.com', NULL),
(28, 1, 0, 'Santiago', 'Pascual', '1970-07-13', 'masculino', 'Sarandi 190', '+54 911 5555-7777', 'santi1977@hotmail.com', NULL),
(29, 4, 0, 'Pablo', 'Beltran', '1995-04-25', 'masculino', 'San Juan 123', '+5429-5555-6666', 'pablonqn55@gmail.com', NULL),
(30, 1, 0, 'Ezequiel', 'Beltran', '2003-09-25', 'masculino', 'San Juan 123', '+54 299 8888-9999', 'ezebeltran@gmail.com', NULL),
(31, 2, 0, 'Julieta', 'Requena', '1995-09-23', 'femenino', 'Linares 654', '+54 299 5555-5555', 'mjreq@gmail.com', NULL),
(32, 5, 0, 'Fernando', 'Niembro', '1956-02-05', 'masculino', 'Islas Malvinas 530', '+54 299 6546-5656', 'ferniembro@gmail.com', NULL),
(33, 5, 0, 'Mariano', 'Closs', '1968-11-30', 'masculino', 'Alcorta 900', '+54 299 6588-9999', 'closs@gmail.com', NULL),
(34, 3, 0, 'Fernando', 'Miranda', '1995-05-24', 'otro', 'Lainez 330', '+54 299 6565-6666', 'fermiranda@gmail.com', NULL),
(35, 3, 0, 'Gerardo', 'Gonzalez', '1992-04-10', '', 'Las Lengas 3233', '2944231132', 'gerar_go@gmail.com', 'Premio por atención'),
(36, 2, 0, 'Romina', 'Duarte', '1993-01-22', '', 'Av. Arrayanes', '+54 9 2944567879', 'roduavla@hotmail.com', 'Premio presente'),
(37, 3, 0, 'Lujan', 'Alzamendi', '1968-10-21', '', 'Las Retamas S/N', '+54 9 2944553132', NULL, NULL),
(38, 4, 0, 'Antonio', 'Zoyka', '1979-08-21', '', 'Las Lengas 223', '2944657475', 'anzo1979@gmail.com', 'Falta médica último mes'),
(39, 3, 0, 'Selene', 'Rodas', '1998-07-11', '', 'Del Cipres 442', '2944121314', 'seroar@outlook.com.ar', NULL),
(40, 2, 0, 'Gaston', 'Marin', '1987-05-30', '', 'Las Fucsias', '+54 9 2944211819', 'gamarin@gmail.com', 'pasante'),
(41, 2, 0, 'Rocío', 'López', '1993-02-10', '', 'Sarmiento 214', '+54 9 11 5555-1212', 'dra_lopez11@gmail.com', NULL),
(42, 1, 0, 'celeste', 'escardo', '1987-08-15', 'femenino', 'san martin 4300', '+54 299 5501724', 'celeste_87@gmail.com', NULL),
(43, 1, 0, 'marcelo', 'ferreira', '1985-07-01', 'masculino', 'fhoteringham 43', '+54 299 5501720', 'marceferre21@gmail.com', NULL),
(44, 5, 0, 'jessica', 'gimenez', '1985-01-15', 'femenino', 'candolle 7500', '+54 2994598785 ', 'jessica_gime@gmail.com', NULL),
(45, 4, 0, 'Lucía', 'fernandez', '1992-07-14', 'femenino', 'presinte peron 65', '+54 2994589752 ', 'lucia_fernandez@hotmail.com', NULL),
(46, 4, 0, 'isabel', 'perez', '1978-04-29', 'femenino', 'avda plottier 211', '+54 299 5557889', 'serpienteveloz@yahoo.com', NULL),
(47, 1, 5, 'Mariana', 'Gutiérrez', '1963-04-20', 'femenino', 'Av. Cabildo 500', '+54 11 3333-2222', '', ''),
(48, 2, 3, 'Natalia', 'Pérez', '1999-06-17', 'femenino', 'Av. España 322', '', 'nati_abogada@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `sitio_web` varchar(150) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `observaciones` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre`, `sitio_web`, `telefono`, `observaciones`) VALUES
(1, 'LG', 'https://lg.com.ar', '0800-888-5454', NULL),
(2, 'Samsung', 'https://samsung.com', '011-4109-4000', 'Creador de la línea Galaxy de celulares'),
(3, 'Apple', 'https://apple.com', '1-800-275-2273', 'Tel de Estados Unidos'),
(4, 'DJI', 'https://dji.com', '+86 (0) 755 2665-6677', 'Lider mundial en drones'),
(5, 'JBL', 'https://jbl.com', '(800) 336-4525', ''),
(6, 'Logitech', 'https://logitech.com', '+1 510-795-8500', NULL),
(7, 'Microsoft', 'https://microsoft.com', '(800) 642 7676', 'Creadora de Windows y Office'),
(8, 'Sony', 'https://www.sony.com.ar', '011 4896-5200', NULL),
(90, 'Liliana', 'https://liliana.com.ar', '011 4444-2222', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_pais` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `idioma` char(2) NOT NULL,
  `abreviacion` char(3) NOT NULL,
  `codigo_area` varchar(30) NOT NULL,
  `comidas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre`, `idioma`, `abreviacion`, `codigo_area`, `comidas`) VALUES
(1, 'Argentina', 'es', 'AR', '54', 'pizza, pastas, asado'),
(2, 'Uruguay', 'es', 'UY', '598', 'mate, pizza, chivito'),
(3, 'Italia', 'it', 'IT', '32', 'pizza, pastas, lasagna'),
(4, 'Estados Unidos', 'en', 'US', '1', 'pizza'),
(5, 'Rusia', 'ru', 'RU', '102', 'ensalada, vodka'),
(6, 'Japón', 'jp', 'JP', '94', 'sushi'),
(7, 'Paraguay', 'es', 'PY', '53', 'mate'),
(8, 'Alemania', 'de', 'AL', '27', NULL),
(9, 'Brasil', 'pt', 'BR', '55', 'ensalada, pizza, pastas'),
(10, 'Portugal', 'pt', 'PT', '18', NULL),
(11, 'Bolivia', 'es', 'BO', '57', NULL),
(12, 'Reino Unido', 'en', 'UK', '19', 'pizza, cafe'),
(18, 'China', 'cn', 'CN', '218', 'arroz'),
(19, 'Francia', 'fr', 'FR', '38', 'pastas, ensalada, arroz'),
(22, 'México', 'es', 'MX', '117', 'picante, burritos, quesadillas'),
(30, 'Canadá', 'en', 'CA', '2', ''),
(31, 'Chile', 'es', 'CL', '56', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `id_marca` int(11) NOT NULL,
  `precio` decimal(8,2) UNSIGNED NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `garantia` tinyint(3) UNSIGNED NOT NULL,
  `detalles` varchar(3000) DEFAULT NULL,
  `envio` tinyint(1) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `fecha_de_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `id_categoria`, `id_marca`, `precio`, `stock`, `garantia`, `detalles`, `envio`, `foto`, `fecha_de_alta`) VALUES
(3, 'Galaxy S9 128GB', 7, 2, '146380.00', 3, 12, 'Oferta! Samsung Galaxy S9 con 128GB de RAM', 1, '', '2021-09-03 13:53:39'),
(5, 'Mavic Mini', 5, 4, '77870.00', 50, 24, 'Con tan solo 249 g, Mavic Mini ofrece 30 min de vuelo, transmisión HD de 2 km y un estabilizador en 3 ejes con una cámara 2.7K.', 1, '', '2021-09-03 13:53:39'),
(32, 'Galaxy S10 128GB', 7, 2, '157430.00', 234, 6, 'Pantalla Dynamic AMOLED con bordes minimizados y QuadHQ+ para una vista cinemática. 4 cámaras de nivel profesional. Teleobjetivo para primeros planos, lente ultra gran angular, lente para fotos nocturnas y cámara frontal con enfoque ultra rápido. Carga inalámbrica compartida con Wireless Powershare.', 1, '', '2021-09-03 13:53:39'),
(34, 'Mavic 2 Pro', 5, 4, '501800.00', 100, 6, 'El Mavic 2 Pro viene equipado con la nueva cámara Hasselblad L1D-20c, que posee la tecnología Hasselblad Natural Color Solution (HNCS), exclusiva de Hasselblad, que ayuda a los usuarios a capturar magníficas tomas aéreas de 20 megapíxeles con detalles de color asombrosos.', 1, '', '2021-09-03 13:53:39'),
(35, 'Series 5 Ultra', 3, 2, '110370.00', 90, 24, 'Ultrabook superdelgada y liviana con menos de 1,5kg de peso.', 0, '', '2021-09-03 13:53:39'),
(36, 'Microsoft Windows 10 Pro', 6, 7, '20020.00', 138, 12, 'Sistema operativo Windows 10 Pro', 1, '', '2021-09-03 13:53:39'),
(37, 'SmartTV 42', 1, 1, '58500.00', 0, 12, 'Excelente calidad de imagen. Apps: Netflix, entre otras.', 1, '', '2021-09-03 13:53:39'),
(78, 'Office Professional 2019', 6, 7, '43160.00', 970, 24, 'Incluye Word, Excel, PowerPoint, Outlook, Publisher y Access. Licencia para uso doméstico y comercial del producto estrella de Microsoft.', 1, '', '2021-09-03 13:53:39'),
(79, 'X72F LED 4K Ultra', 1, 8, '108550.00', 15, 24, 'X72F| LED | 4K Ultra HD | Alto rango dinámico (HDR) | Smart TV', 1, '', '2021-09-03 13:53:39'),
(80, 'TV X85F', 1, 8, '180960.00', 0, 24, 'Una imagen más clara y colorida. Un chip increíblemente realista. Con la tecnología Object-based HDR remaster y Super Bit Mapping 4K HDR, nuestro 4K HDR Processor X1™ reproduce una profundidad y unas texturas mejoradas, además de unos colores naturales. Disfruta de colores puros y un mayor nivel de brillo en imágenes ultrarrealistas.', 1, '', '2021-09-03 13:53:39'),
(81, 'Parlante portátil Sony 5', 8, 8, '22490.00', 72, 6, 'Portátil inalámbrico blue con wifi', 1, '', '2021-09-03 13:53:39'),
(82, 'Parlante Bluetooth JBL GO 2 Red', 8, 5, '7930.00', 153, 6, 'El parlante Bluetooth JBL GO 2 cuenta con un diseño ultra compacto de forma cuadrada y viene en llamativos colores. Gracias a sus medidas (7,1 cm de alto x 8,6 cm de ancho x 3,1 cm de profundidad) y a su peso, de tan solo 130 gramos, vas a poder transportarlo fácilmente y llevar tu música favorita a donde vayas. Ademas, es resistente al agua IPX7, lo cual te permitira llevar tu música llevar a la pileta o a la playa.', 1, '', '2021-09-03 13:53:39'),
(84, 'Apple Watch Series 5', 4, 3, '187200.00', 33, 12, 'Un reloj como nunca antes viste. Con la pantalla Retina siempre activa, puedes ver la hora y la carátula todo el tiempo. Monitorea rápidamente tu frecuencia cardiaca y recibe notificaciones si parece estar demasiado alta o baja.', 1, '', '2021-09-03 13:53:39'),
(117, 'Drone XLR40 con cámara con autofoco', 5, 4, '150280.00', 35, 24, 'Drone con cámara con autofoco y estabilizador de 3 ejes de alta calidad', 0, '', '2021-09-03 13:53:39'),
(122, 'Windows 10 pro', 6, 7, '12610.00', 5, 12, 'licencia digital', 1, '', '2021-09-03 13:53:39'),
(123, 'el editado', 2, 4, '390.00', 3, 12, 'tres tres tres', 1, '', '2021-09-03 13:53:39'),
(124, 'Windows 7 oferta', 6, 7, '3250.00', 4, 12, 'Con soporte por 2 años', 1, '', '2021-09-03 13:53:39'),
(125, 'Antivirus Microsoft', 6, 7, '15600.00', 100, 24, 'Antivirus para empresas', 0, '', '2021-09-03 13:53:39'),
(131, 'TV!', 1, 2, '47190.00', 40, 36, 'Smart TV con Botón de Netflix', 0, '', '2021-09-03 13:53:39'),
(137, 'Gaming laptop 3200X', 3, 2, '118560.00', 10, 24, 'Con placa de video de 4gb', 1, '', '2021-09-03 13:53:39'),
(139, 'Galaxy Note 20 Ultra', 7, 2, '262730.00', 10, 12, 'Con 4 cámaras y todos los chiches', 1, NULL, '2021-09-03 13:53:39'),
(144, 'Bravia RT2800', 43, 27, '25610.00', 4, 12, 'con botón de netflix y 6 hdmi', 1, '', '2021-09-03 13:53:39'),
(148, 'Drone Mini 2', 5, 4, '155350.00', 10, 12, 'con memoria microsd de 64gb de regalo', 1, '', '2021-09-03 13:53:39'),
(161, 'Windows 10 Pro OEM', 6, 7, '38090.00', 0, 12, 'Sistema operativo Windows 10 para equipos nuevos', 0, NULL, '2021-09-03 13:53:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `id_sector` tinyint(3) UNSIGNED NOT NULL,
  `nombre_corto` varchar(20) NOT NULL,
  `nombre_largo` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sectores`
--

INSERT INTO `sectores` (`id_sector`, `nombre_corto`, `nombre_largo`) VALUES
(1, 'RR.HH.', 'Recursos Humanos'),
(2, 'Admin', 'Administración'),
(3, 'Tesorería', 'Tesorería'),
(4, 'Contaduría', 'Contaduría'),
(5, 'Ventas', 'Ventas'),
(6, 'IT', 'Sistemas'),
(7, 'Dev', 'Desarrollo'),
(8, 'Cajas', 'Cajas'),
(9, 'Mudanzas', 'Mudanzas'),
(10, 'Maestranza', 'Maestranza'),
(11, 'Backoffice', 'Backoffice'),
(12, 'Operaciones', 'Operaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `username`, `password`) VALUES
(1, 'jromero', 'abc bla bla bla'),
(2, 'tmoretti', 'abc bla bla bla');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`id_sector`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `id_sector` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
