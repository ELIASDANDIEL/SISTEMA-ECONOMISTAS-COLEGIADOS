-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-10-2020 a las 13:39:40
-- Versión del servidor: 5.6.40-84.0-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cepiura3_economistas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegiado`
--

CREATE TABLE `colegiado` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `universidad_procedencia` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fijo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_civil_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_documento_id` bigint(20) UNSIGNED NOT NULL,
  `estado_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `deuda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sexo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pais_id` bigint(20) UNSIGNED NOT NULL,
  `departamento_id` bigint(20) UNSIGNED NOT NULL,
  `provincia_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `colegiado`
--

INSERT INTO `colegiado` (`id`, `codigo`, `nombres`, `apellidos`, `fecha_nacimiento`, `universidad_procedencia`, `direccion`, `correo`, `celular`, `fijo`, `numero_documento`, `estado_civil_id`, `tipo_documento_id`, `estado_id`, `usuario_id`, `enabled`, `deuda`, `created_at`, `updated_at`, `deleted_at`, `sexo`, `pais_id`, `departamento_id`, `provincia_id`) VALUES
(2, '000000001', 'GAMANIEL', 'RIVERA SAAVEDRA', '1943-11-24', 'UNP', 'Urb. Miraflores   los cipreses mza D lot 11-B Nº 370', 'xxxxxxxxxxxxxxxxx@hotmail.com', '969710418', '342907', '02664547', 2, 1, 1, 4, 1, '0.00', '2020-10-16 03:27:48', '2020-10-17 01:31:36', NULL, 'M', 1, 1, 1),
(3, '000000002', 'CARLOS EDUARDO', 'REYES PEÑA', '1943-11-24', 'UNP', 'Urb. Miraflores   los cipreses mza D lot 11-B Nº 370', 'xxxxxxxx@hotmail.com', '969710418', '342907/341541', '02647332', 2, 1, 3, 5, 1, '0.00', '2020-10-16 04:06:07', '2020-10-16 04:06:07', NULL, 'M', 1, 1, 1),
(4, '000000003', 'EDUARDO JOSE', 'MENDOZA SEMINARIO', '1943-03-24', 'UNP', 'LAS CAMELIAS W - 33 - URB. MIRAFLORES', 'XXXX@hotmail.com', '969935458/969255300', '343607', '2647332', 2, 1, 3, 6, 1, '0.00', '2020-10-16 04:53:51', '2020-10-16 04:53:51', NULL, 'M', 1, 1, 1),
(5, '000000004', 'EFRAIN', 'CHUECAS VELASQUEZ', '1947-11-11', 'UNP', 'Urb. Los Geranios S/N Mz.H-Lt.8- Piura', 'xxxxxxxxxxxxx@gmail.com', '969775749/#956930483', '520131', '02613407', 2, 1, 3, 7, 1, '0.00', '2020-10-16 05:04:38', '2020-10-16 05:04:38', NULL, 'M', 1, 1, 1),
(6, '000000005', 'DAVIES', 'GUAYLUPO ARTURO', '1930-05-05', 'UNP', 'AV. GRAU 257', 'XXXXXXX@hotmail.com', '303698', '303698', '02638878', 2, 1, 3, 8, 1, '0.00', '2020-10-16 05:11:37', '2020-10-16 05:11:37', NULL, 'M', 1, 1, 1),
(7, '000000006', 'GABRIEL ADUARDO', 'CASAVERDE ZAPATA', '1942-03-18', 'UNP', 'Angamos II Etapa Block A13-01 Piura', 'XXXXXXXXXXXXXX@hotmail.com', '327315', '327315', '02645933', 2, 1, 3, 9, 1, '0.00', '2020-10-16 05:21:04', '2020-10-16 05:21:04', NULL, 'M', 1, 1, 1),
(8, '000000007', 'ERNESTO', 'GONZALEZ ROBERTO', '1942-03-20', 'UNP', 'SN', 'fer@hotmail.com', 'SC', 'SF', '07908615', 2, 1, 3, 10, 1, '0.00', '2020-10-16 05:42:12', '2020-10-16 05:42:12', NULL, 'M', 1, 1, 1),
(9, '000000008', 'MIGUEL GLICERIO', 'SALDARRIAGA PACHERRE', '1944-12-21', 'UNP', 'Los Girasoles P-6 Miraflores', 'XXXXXXXXXXX@hotmail.com', '146067', '343051', '2644042', 2, 1, 3, 11, 1, '0.00', '2020-10-16 05:49:41', '2020-10-16 05:49:41', NULL, 'M', 1, 1, 1),
(10, '000000009', 'WALTER EDUARDO', 'CHAVEZ CASTRO', '1947-11-25', 'UNP', 'Banco de la Nación S/N C-17', 'jorge_37@gmail.com', '969521248', '323535/328491', '2628483', 2, 1, 3, 14, 1, '0.00', '2020-10-16 06:07:31', '2020-10-16 06:07:31', NULL, 'M', 1, 1, 1),
(11, '000000010', 'WALTER EDUARDO', 'MERINO CARMEN', '1942-10-12', 'UNP', 'César Vallejo S/N D-43 - URB RESID PIURA', 'dandiel.espinoza@hotmail.com', '953536267', '953536267', '02622503', 2, 1, 3, 15, 1, '0.00', '2020-10-16 06:13:34', '2020-10-16 06:13:34', NULL, 'M', 1, 1, 1),
(12, '000000011', 'LUIS ALFREDO', 'GUEVARA SAAVEDRA', '1942-06-21', 'UNP', 'Elias Aguirre N° 245 Urb. Mercedes.', 'jorge_379@gmail.com', '352335', '352335', '02611945', 2, 1, 4, 16, 1, '0.00', '2020-10-16 06:19:08', '2020-10-16 06:19:08', NULL, 'M', 1, 1, 1),
(13, '000000012', 'PEDRO', 'CHUNGA PUESCAS', '1947-05-21', 'UNP', 'Av. Luis Montero S/N Mz. Z-3-125 Miraf.', 'dandiel.espinozza@hotmail.com', '9913033/343184/96962', '343171', '02657276', 2, 1, 3, 17, 1, '0.00', '2020-10-16 06:27:13', '2020-10-16 06:27:13', NULL, 'M', 1, 1, 1),
(14, '000000013', 'DAVID', 'ORDINOLA BOYER', '1950-12-24', 'UNP', 'Las Casuarinas N° 207 Sta. Isabel', 'dandiel.espinozas@hotmail.com', '969646186/#393130', '304555', '02641489', 2, 1, 3, 18, 1, '0.00', '2020-10-16 06:35:12', '2020-10-16 06:35:12', NULL, 'M', 1, 1, 1),
(15, '000000014', 'NAVARRO  TORRES', 'VICTOR HUGO', '1951-01-31', 'UNP', 'AV. LAS CASUARINAS E 42 - URB SANTA MARIA DEL PINAR  II ETAPA', 'reyde42@hotmail.com', '969040436', '328017', '02603729', 2, 1, 3, 19, 1, '0.00', '2020-10-16 06:41:07', '2020-10-16 06:41:07', NULL, 'M', 1, 1, 1),
(16, '000000015', 'RAUL', 'SALDARRIAGA TABOADA', '1947-09-02', 'UNP', 'AV. GRAU 1665-PIURA', 'vegassf32@gmail.com', '999852017', '073300409', '02671530', 2, 1, 3, 20, 1, '0.00', '2020-10-16 06:55:33', '2020-10-16 06:55:33', NULL, 'M', 1, 1, 1),
(17, '000000016', 'NERIJOB', 'ESCOBAR AVILA', '1951-01-31', 'UNP', 'Resd. Piura S/N Mz. F Lt. 26', 'dandiel_317@hotmail.com', '307862/308519', '307862/308519', '03899475', 2, 1, 3, 21, 1, '0.00', '2020-10-16 07:07:42', '2020-10-16 07:07:42', NULL, 'M', 1, 1, 1),
(18, '000000017', 'Sara', 'Encalada Suárez', '1997-08-08', 'Universidad Nacional de Piura', 'Parque Monteverde p12', 'sarita@gmail.com', '988939877', '435521', '89776678', 2, 1, 2, 22, 0, '0.00', '2020-10-16 07:16:11', '2020-10-16 07:30:37', NULL, 'F', 1, 1, 5),
(19, '000000018', 'JAVIER ENRIQUE', 'CURO GARCIA', '1947-01-11', 'UNP', 'Los Fresnos S/N-EI-11-Arequipa1086', 'MMM@GMAIL.COM', '999999999', '222222', '02616783', 2, 1, 3, 23, 1, '0.00', '2020-10-20 06:11:00', '2020-10-20 06:11:00', NULL, 'M', 1, 1, 1),
(20, '000000019', 'JUAN', 'PEREZ DIAZ', '1948-01-01', 'UNP', 'Ign. Merino K-24 II Etpa.- piura', 'NNN@GMAIL.COM', '991111119', '073329070', '02670542', 2, 1, 3, 24, 1, '0.00', '2020-10-20 06:17:26', '2020-10-20 06:18:16', NULL, 'M', 1, 1, 1),
(21, '000000020', 'CARLOS MIGUEL', 'CARRILLO ESPINOZA', '1948-11-08', 'UNP', 'CONJUNTO HABITACIONAL LOS TALLENES BLOCK 20-A DPTO 101- PIURA', 'GGG@GMAIL.COM', '978380320', '073302231', '02622358', 5, 1, 3, 25, 1, '0.00', '2020-10-20 06:21:20', '2020-10-20 06:21:20', NULL, 'M', 1, 1, 1),
(22, '000000021', 'PORTUGAL', 'MAURIOLA FLORES', '1948-07-08', 'UNP', 'Cusco N° 268 - Piura/Banco Central de Reserva', 'NNNG@GMAIL.COM', '977777777', '329070', '02655376', 2, 1, 3, 26, 1, '0.00', '2020-10-20 06:25:10', '2020-10-20 06:25:10', NULL, 'M', 1, 1, 1),
(23, '000000022', 'ADALBERTO MANUEL', 'BASAURI MARKY', '1948-03-24', 'UNP', 'Los Tulipanes Mz.-W-1 Lt.1 Miraflores.', 'LLL@GMAIL.COM', '966666666', '343823', '02653679', 2, 1, 3, 27, 1, '0.00', '2020-10-20 06:28:36', '2020-10-20 06:28:36', NULL, 'M', 1, 1, 1),
(24, '000000023', 'LORENZO MELQUIADES', 'ALVITES VELEZMORO', '1952-06-11', 'UNP', 'Resid. Grau S/N BL-A 301', 'LMA@GMAIL.COM', '999333333', '300035', '02644156', 2, 1, 3, 28, 1, '0.00', '2020-10-20 06:33:04', '2020-10-20 06:36:55', NULL, 'M', 1, 1, 1),
(25, '000000024', 'RAMON MANUEL', 'CRUZ JIMENEZ', '1942-09-27', 'UNP', 'Ica N° 366', 'RMCJ@GMAIL.COM', '996666555', '322222', '02614251', 2, 1, 3, 29, 1, '0.00', '2020-10-20 06:40:21', '2020-10-20 06:40:21', NULL, 'M', 1, 1, 1),
(26, '000000025', 'EDDIE HUGO', 'AGURTO PLATA', '1942-01-20', 'UNP', 'José María Arellano 140 Urb. Carlos Taym.', 'EHAP@GMAIL.COM', '999666222', '335834', '02622888', 2, 1, 3, 30, 1, '0.00', '2020-10-20 06:42:59', '2020-10-20 06:42:59', NULL, 'M', 1, 1, 1),
(27, '000000026', 'OSCAR MANUEL', 'IBAÑEZ TALLEDO', '1945-09-28', 'UNP', 'Tamarindo N° 133 Piura Urb. 4 de Enero', 'OMIT@GMAIL.COM', '972525424', '306898', '02624002', 2, 1, 3, 31, 1, '0.00', '2020-10-20 06:45:24', '2020-10-20 06:45:24', NULL, 'M', 1, 1, 1),
(28, '000000027', 'LUCIO ALFONSO', 'ARANA SANCHEZ', '1948-12-13', 'UNP', 'Los Robles N° 138 Urb. Miraflores.', 'LAAS@GMAIL.COM', '942121029', '222111', '02603739', 2, 1, 3, 32, 1, '0.00', '2020-10-20 06:51:12', '2020-10-20 06:51:12', NULL, 'M', 1, 1, 1),
(29, '000000028', 'FRANCISCO', 'JUAREZ TIMANA', '1936-09-17', 'UNP', 'Unid. Vec. BL.19 Dpto.200 Piu.', 'FJT@GMAIL.COM', '999999993', '323232', '02786893', 2, 1, 5, 33, 1, '0.00', '2020-10-20 06:54:13', '2020-10-20 06:54:13', NULL, 'M', 1, 1, 1),
(30, '000000029', 'LUDWIND EINSTEIN', 'AGURTO PLATA', '1952-06-04', 'UNP', 'Resid. El Morro B-15 Piura', 'LEAP@GAMIL.COM', '989876543', '327397', '0514728', 2, 1, 3, 34, 1, '0.00', '2020-10-20 06:56:55', '2020-10-20 06:56:55', NULL, 'M', 1, 1, 1),
(31, '000000030', 'PEDRO ENRIQUE', 'GAMARRA TORRECELLI', '1944-03-03', 'UNP', 'Av. Loreto N° 449 - Piu.', 'PEGT@GMAIL.COM', '999111222', '328664', '01339162', 2, 1, 3, 35, 1, '0.00', '2020-10-20 06:59:56', '2020-10-20 06:59:56', NULL, 'M', 1, 1, 1),
(32, '000000031', 'VICTOR HUGO', 'HERNANDEZ CARHUAPOMA', '1950-07-28', 'UNP', 'Urb. San Ramón Mz. A-3-Lt.27', 'VHHC@GMAIL.COM', '991991344', '331435', '02611397', 2, 1, 3, 36, 1, '0.00', '2020-10-20 07:04:01', '2020-10-20 07:04:01', NULL, 'M', 1, 1, 1),
(33, '000000032', 'LUIS ORLANDO', 'LOZADA MIMBELA', '1943-12-11', 'UNP', 'URB SAN EDUARDO CALLE ANTONIO RAYMONDY B 7 INT 104- PISINA VERENSON', 'LOLM@GMAIL.COM', '969670656', '332743', '02628508', 2, 1, 3, 37, 1, '0.00', '2020-10-20 07:07:21', '2020-10-20 07:07:21', NULL, 'M', 1, 1, 1),
(34, '000000033', 'RONALDO', 'LAVALLE CARRASCO', '1942-05-24', 'UNP', 'Av.César Vallejo Mz-M-12 Las Mercedes Piura.', 'RLC@GMAIL.COM', '929394959', '354956', '02638953', 2, 1, 3, 38, 1, '0.00', '2020-10-20 07:09:51', '2020-10-20 07:09:51', NULL, 'M', 1, 1, 1),
(35, '000000034', 'MARCO ANTONIO', 'HERRERA LOZADA', '1949-11-24', 'UNP', 'Los Tallanes S/N Mz. F-12 - II Etapa Piu.', 'MAHL@GMAIL.COM', '969322522', '323232', '02609436', 2, 1, 3, 39, 1, '0.00', '2020-10-20 07:12:05', '2020-10-20 07:12:05', NULL, 'M', 1, 1, 1),
(36, '000000035', 'LUIS ANGEL', 'WONG VALDIVIEZO', '1951-06-30', 'UNP', 'Arequipa N° 1337 - Piura', 'LAWV@GMAIL.COM', '989898989', '345677', '06511875', 2, 1, 3, 40, 1, '0.00', '2020-10-20 07:14:06', '2020-10-20 07:14:06', NULL, 'M', 1, 1, 1),
(37, '000000036', 'JUAN URBANO', 'VARGAS BENITES', '1953-02-13', 'UNP', 'Cayetano Heredia N° 403 Castilla', 'JUVB@GMAIL.COM', '999987653', '333164', '26613591', 1, 1, 3, 41, 1, '0.00', '2020-10-20 07:16:39', '2020-10-20 07:16:39', NULL, 'M', 1, 1, 1),
(38, '000000037', 'HERNAN ENRIQUE', 'SALDARRIAGA GIRON', '1952-09-10', 'UNP', 'Av. Los Diamantes Mz. D1 Lt. 19 Urb. Bello Horiz. I Et.', 'HESG@GMAIL.COM', '999000222', '321330', '02618153', 2, 1, 3, 42, 1, '0.00', '2020-10-20 07:22:33', '2020-10-20 07:22:33', NULL, 'M', 1, 1, 1),
(39, '000000038', 'ENRIQUE LUCIANO', 'ZAPATA REYES', '1947-07-13', 'UNP', 'Av. Circunvalación 1235 - Piura (Es.C.M.)', 'ELZR@GMAIL.COM', '961844030', '618440', '02632829', 2, 1, 3, 43, 1, '0.00', '2020-10-20 07:25:29', '2020-10-20 07:25:29', NULL, 'M', 1, 1, 1),
(40, '000000039', 'WINSTON MADERMO', 'VENCES CORDOVA', '1946-01-12', 'UNP', 'Urb. Sullana L-22 Sullana', 'WMVC@GMAIL.COM', '987508152', '504377', '03596417', 2, 1, 3, 44, 1, '0.00', '2020-10-20 07:27:58', '2020-10-20 07:27:58', NULL, 'M', 1, 1, 1),
(41, '000000040', 'BENJAMIN', 'BAYONA RUIZ', '1950-10-24', 'UNP', 'Fermin Diez Canseco M-1 Urb. Las Mercedes.', 'BBR@GMAIL.COM', '968989558', '618468', '02681333', 2, 1, 5, 45, 1, '0.00', '2020-10-20 07:30:15', '2020-10-20 07:30:15', NULL, 'M', 1, 1, 1),
(42, '000000041', 'GERMAN', 'HERNANDEZ SANCHEZ', '1943-01-23', 'UNP', 'URB SALABERRY Mza O LoT 33- SULLANA', 'GHS@GMAIL.COM', '969142504', '502420', '03568064', 2, 1, 3, 46, 1, '0.00', '2020-10-20 07:33:02', '2020-10-20 07:33:02', NULL, 'M', 1, 1, 6),
(43, '000000042', 'CARLOS ALBERTO', 'CAISAN LLUVIANS', '1946-08-21', 'UNP', 'Av. Luis Montero 316, Urb. Miraflores - Castilla, PIURA', 'CACLL@GMAIL.COM', '985892161', '342311', '02623362', 2, 1, 3, 47, 1, '0.00', '2020-10-20 07:35:42', '2020-10-20 07:35:42', NULL, 'M', 1, 1, 1),
(44, '000000043', 'JESUS', 'CASTILLO MORE', '1946-03-25', 'UNP', 'JR LIBERTAD 168- DPTO 204- MIRAFLORES-LIMA', 'JCM@GMAIL.COM', '979299895', '343434', '02618012', 2, 1, 3, 48, 1, '0.00', '2020-10-20 07:37:44', '2020-10-20 07:37:44', NULL, 'M', 1, 1, 1),
(45, '000000044', 'ARNALDO MARIO', 'OTINIANO ROMERO', '1952-12-03', 'UNP', 'Av. Sánchez Cerro N° 450 Dpto. 401', 'AMOR@GMAIL.COM', '939850688', '311429', '17531097', 2, 1, 3, 49, 1, '0.00', '2020-10-20 07:40:05', '2020-10-20 07:40:05', NULL, 'M', 1, 1, 1),
(46, '000000045', 'ELIAS', 'AGUIRRE MENA', '1946-11-22', 'UNP', 'Bello Horizonte Mz. C-3 Lote 14 Piura', 'EAM@GMAIL.COM', '968768660', '352970', '02612165', 2, 1, 3, 50, 1, '0.00', '2020-10-20 07:42:14', '2020-10-20 07:42:14', NULL, 'M', 1, 1, 1),
(47, '000000046', 'HIPARCO', 'TAFUR BARRERA', '1939-02-16', 'UNP', 'José Maria Arellano N° 180 Urb. Carlos Tayman', 'HTB@GMAIL.COM', '969531415', '306829', '02652112', 2, 1, 3, 51, 1, '0.00', '2020-10-20 07:45:07', '2020-10-20 07:45:07', NULL, 'M', 1, 1, 1),
(48, '000000047', 'TEODORO', 'MARQUEZ TACURE', '1949-04-28', 'UNP', 'Av. Kennedy N° 236 Urb. Piura', 'TMT@GMAIL.COM', '966426593', '353641', '02628568', 2, 1, 3, 52, 1, '0.00', '2020-10-20 07:47:42', '2020-10-20 07:47:42', NULL, 'M', 1, 1, 1),
(49, '000000048', 'JUAN ERNESTO', 'CALDERON DETTLING', '1949-04-28', 'UNP', 'Las Casuarinas N° 285-Sta.Isab.', 'JECD@GMAIL.COM', '969550612', '310432', '02627704', 2, 1, 3, 53, 1, '0.00', '2020-10-20 07:50:03', '2020-10-20 07:50:03', NULL, 'F', 1, 1, 1),
(50, '000000049', 'CESAR AGUSTO', 'JARAMILLO ALEGRE', '1946-02-24', 'UNP', 'Procer Merino N° 131 - Urb. Clark - Piura.', 'CAJA@GMAIL.COM', '999336950', '332029', '02603755', 2, 1, 5, 54, 1, '0.00', '2020-10-20 07:52:14', '2020-10-20 07:52:14', NULL, 'M', 1, 1, 1),
(51, '000000050', 'ALFREDO', 'SEGURA PINO', '1941-01-03', 'UNP', 'Simón Bolivar N° 315 - Tumbes', 'ASP@GMAIL.COM', '952276655', '523970', '00200469', 2, 1, 3, 55, 1, '0.00', '2020-10-20 07:54:41', '2020-10-20 07:54:41', NULL, 'M', 1, 1, 1),
(52, '000000051', 'NOE', 'ALVARADO AGUIRRE', '1941-05-03', 'UNP', 'AV. BELAUNDE 185   3R PISO DPT 302 URB PIURA', 'NAA@GMAIL.COM', '969756269', '830461', '03322799', 1, 1, 3, 56, 1, '0.00', '2020-10-20 08:07:48', '2020-10-20 08:07:48', NULL, 'M', 1, 1, 1),
(53, '000000052', 'MARIANO', 'HUAMANCHUMO VALDERRAMA', '1941-10-13', 'UNP', 'Urb. Piura Mz. D-1-Lt.14 Piu. 4 Etapa', 'MHV@GMAIL.COM', '973982173', '351897', '02820118', 2, 1, 3, 57, 1, '0.00', '2020-10-20 08:10:08', '2020-10-20 08:10:08', NULL, 'M', 1, 1, 1),
(54, '000000053', 'ERASMO CRUZ', 'PAICO  CHERO', '1946-11-24', 'UNP', 'Los Geranios s/n Mz. G lt. 14', 'ECPCH@GMAIL.COM', '999322849', '322849', '02647384', 2, 1, 5, 58, 1, '0.00', '2020-10-20 08:12:17', '2020-10-20 08:12:17', NULL, 'M', 1, 1, 1),
(55, '000000054', 'JAIME', 'CRUZ PERALTA', '1946-12-05', 'UNP', 'Av. Grau N° 1945', 'JCP@GMAIL.COM', '999321958', '321958', '02606009', 2, 1, 3, 59, 1, '0.00', '2020-10-20 08:15:35', '2020-10-20 08:15:35', NULL, 'M', 1, 1, 1),
(56, '000000055', 'CESAR ALBERTO', 'VALDEZ GARCIA', '1951-04-27', 'UNP', 'Huancavelica N° 1377 - Piura', 'CAVG@GMAIL.COM', '934489499', '301364', '02631727', 2, 1, 5, 60, 1, '0.00', '2020-10-20 08:20:09', '2020-10-20 08:20:09', NULL, 'M', 1, 1, 1),
(57, '000000056', 'NOEL ORLANDO', 'ADRIANZEN PALACIOS', '1950-12-29', 'UNP', 'Lambayeque N° 504 - Castilla', 'NOAP@GMAIL.COM', '999341502', '341502', '02666091', 2, 1, 3, 61, 1, '0.00', '2020-10-20 08:23:14', '2020-10-20 08:23:14', NULL, 'M', 1, 1, 1),
(58, '000000057', 'IRMA ROSA', 'PALOMINO RAMIREZ', '1954-11-22', 'UNP', 'Huancavelica N° 1377 - Piura', 'IRPR@GMAIL.COM', '999344894', '301364', '02641161', 2, 1, 3, 62, 1, '0.00', '2020-10-20 08:26:17', '2020-10-20 08:26:17', NULL, 'M', 1, 1, 1),
(59, '000000058', 'HILDA', 'ALBURQUEQUE LABRIN', '1954-04-29', 'UNP', 'URB. LOS COCOS DEL CHIPE PALMA MAJETUOSA  K1-LOT 06-PIURA', 'HAL@GMAIL.COM', '953944863', '608247', '02649543', 2, 1, 3, 63, 1, '0.00', '2020-10-20 08:28:53', '2020-10-20 08:28:53', NULL, 'F', 1, 1, 1),
(60, '000000059', 'BARTOLA ESPERANZA', 'SOSA ATOCHE', '1946-09-26', 'UNP', 'URB LOS TALLANES K`-9 II ETAPA PIURA', 'BESA@GMAIL.COM', '968071447', '315907', '02638753', 2, 1, 3, 64, 1, '0.00', '2020-10-20 08:31:23', '2020-10-20 08:31:23', NULL, 'F', 1, 1, 1),
(61, '000000060', 'CLAUDIO', 'VILELA ALCEDO', '1932-05-19', 'UNP', 'Huancavelica N° 398 Chulucanas', 'CVA@GMAIL.COM', '999333887', '305947', '0492160', 5, 1, 5, 65, 1, '0.00', '2020-10-20 08:33:58', '2020-10-20 08:33:58', NULL, 'M', 1, 1, 4),
(62, '000000061', 'MARIA FANNY', 'BALAREZO ÑOPO', '1955-12-09', 'UNP', 'San Francisco 588 Catacaos', 'MFB@GMAIL.COM', '968762754', '333221', '02695800', 2, 1, 3, 66, 1, '0.00', '2020-10-20 17:44:47', '2020-10-20 17:44:47', NULL, 'F', 1, 1, 1),
(63, '000000062', 'JUAN FRANCISCO', 'ROJAS JULCA', '1943-10-18', 'UNP', 'LAGUNAS DEL CHIPE H39- PIURA', 'JFRJ@GMAIL.COM', '969228579', '311546', '02674195', 2, 1, 3, 67, 1, '0.00', '2020-10-20 17:47:53', '2020-10-20 17:47:53', NULL, 'M', 1, 1, 1),
(64, '000000063', 'JOSE', 'GARCIA MORAN', '1953-05-01', 'UNP', 'LAGUNA DEL CHIPE MZA G LOT 14 1 ETAPA', 'JGM@GMAIL.COM', '999350180', '350180', '02626703', 2, 1, 3, 68, 1, '0.00', '2020-10-20 17:50:49', '2020-10-20 17:50:49', NULL, 'M', 1, 1, 1),
(65, '000000064', 'AURA EVANGELINA', 'CASTILLO CORDOVA', '1955-01-13', 'UNP', 'Av. Independencia O\' 2 Miraflores', 'AECC@GMAIL.COM', '961515150', '341798', '02616951', 2, 1, 3, 69, 1, '0.00', '2020-10-20 17:52:54', '2020-10-20 17:52:54', NULL, 'F', 1, 1, 1),
(66, '000000065', 'MANUEL WILFREDO', 'LOZADA ARRUNATEGUI', '1931-12-27', 'UNP', 'Av. Grau 2483 (frente 1era. cuad. La Albor)', 'MWLA@GMAIL.COM', '999323181', '323181', '7525103', 2, 1, 5, 70, 1, '0.00', '2020-10-20 18:16:10', '2020-10-20 18:16:10', NULL, 'M', 1, 1, 1),
(67, '000000066', 'OSCAR ORLANDO', 'VILLAR VALLADARES', '1955-12-15', 'UNP', 'URB MIRAFLORES LOS ALMENDROS 170- CASTILLA', 'OOVV@GMAIL.COM', '969084547', '340257', '02779769', 2, 1, 3, 71, 1, '0.00', '2020-10-20 18:19:54', '2020-10-20 18:19:54', NULL, 'M', 1, 1, 1),
(68, '000000067', 'JOSE LUIS', 'ORDINOLA BOYER', '1954-08-20', 'UNP', 'Mz. E-3 Lote 37 II Etap.Bell.Horiz.Av. Ram.', 'JLOB@GMAIL.COM', '969680666', '350436', '02645829', 2, 1, 3, 72, 1, '0.00', '2020-10-20 18:37:43', '2020-10-20 18:37:43', NULL, 'M', 1, 1, 1),
(69, '000000068', 'LUIS ANTONIO', 'ROSALES GARCIA', '1956-09-20', 'UNP', 'H.UNANUE 222 DPTO 204 URB MIRAFLOES', 'LARG@GMAIL.COM', '999396666', '396666', '02627093', 2, 1, 3, 73, 1, '0.00', '2020-10-20 18:43:39', '2020-10-20 18:43:39', NULL, 'M', 1, 1, 1),
(70, '000000069', 'SEGUNDO', 'DIOSES ZARATE', '1956-10-29', 'UNP', 'Bell Horizonte Mz. C-4-Lt.7 II Etapa', 'SDZ@GMAIL.COM', '968158770', '350867', '02618198', 2, 1, 3, 74, 1, '0.00', '2020-10-20 18:45:44', '2020-10-20 18:45:44', NULL, 'M', 1, 1, 1),
(71, '000000070', 'CARLOS ALBERTO', 'BULLON ESPINOZA', '1937-10-28', 'UNP', 'UND. Vecinal  Block -12 DPTO 101', 'CABE@GMAIL.COM', '969605036', '310100', '02780582', 2, 1, 3, 75, 1, '0.00', '2020-10-20 18:48:01', '2020-10-20 18:48:01', NULL, 'M', 1, 1, 1),
(72, '000000071', 'MARIO ROBERTO', 'CAÑEDO SALOMON', '1957-05-24', 'UNP', 'Angamos B-7 Piura', 'MRCS@GMAIL.COM', '999321878', '321878', '01833054', 2, 1, 5, 76, 1, '0.00', '2020-10-20 18:51:04', '2020-10-20 18:51:04', NULL, 'M', 1, 1, 1),
(73, '000000072', 'ERNESTO VICTOR MANUEL', 'COSSI  MALDONADO', '1950-04-15', 'UNP', 'Huayna Capac N° 993 - Castilla', 'EVMCM@GMAIL.COM', '999324105', '324105', '02604544', 2, 1, 4, 77, 1, '0.00', '2020-10-20 18:53:44', '2020-10-20 18:53:44', NULL, 'M', 1, 1, 1),
(74, '000000073', 'SANTOS TOMAS', 'NEYRA CARDOZA', '1952-12-23', 'UNP', 'Urb. Ignacio Merino Mz D1 Lote 34  I etapa', 'STNC@GMAIL.COM', '969674528', '328232', '03575208', 2, 1, 5, 78, 1, '0.00', '2020-10-20 18:55:41', '2020-10-20 18:55:41', NULL, 'M', 1, 1, 1),
(75, '000000074', 'MARCO ANTONIO', 'ZAPATA BRICEÑO', '1955-03-07', 'UNP', 'Urb. Los Tallanes B - 11 - Piura I Etapa', 'MABZ@GMAIL.COM', '969022983', '354734', '02630102', 2, 1, 3, 79, 1, '0.00', '2020-10-20 19:04:17', '2020-10-20 19:04:17', NULL, 'M', 1, 1, 1),
(76, '000000075', 'FELIX RAYMUNDO', 'PINGO NOLASCO', '1953-03-15', 'UNP', 'Pachacutec N° 317 Talarita - Castilla', 'FRPN@GMAIL.COM', '942449822', '344644', '02670892', 2, 1, 3, 80, 1, '0.00', '2020-10-20 19:06:24', '2020-10-20 19:06:24', NULL, 'M', 1, 1, 1),
(77, '000000076', 'SANTIAGO PASCACIO', 'JUAREZ PALACIOS', '1940-03-24', 'UNP', 'Av. Gulman N° 487', 'SPJP@GMAIL.COM', '999666554', '323276', '0460740', 2, 1, 5, 81, 1, '0.00', '2020-10-20 19:16:46', '2020-10-20 19:16:46', NULL, 'M', 1, 1, 1),
(78, '000000077', 'UGARTE - QUIROZ', 'CONSUELO', '1956-11-01', 'UNP', 'ANGAMOS H - 4 II ETAPA', 'UQC@GMAIL.COM', '991995555', '301187', '02644832', 2, 1, 3, 82, 1, '0.00', '2020-10-20 19:44:52', '2020-10-20 19:44:52', NULL, 'M', 1, 1, 1),
(79, '000000078', 'JOSE FRANCISCO', 'ESPINOZA CHUNA', '1950-04-18', 'UNP', 'Consuelo de Velasco Mz.E-Lt.10 - Calle Los Geranios', 'JFECH@GMAIL.COM', '969520170', '351253', '02630725', 2, 1, 3, 83, 1, '0.00', '2020-10-20 19:47:03', '2020-10-20 19:47:03', NULL, 'M', 1, 1, 1),
(80, '000000079', 'SANTOS', 'SAUCEDO MOSCOL', '1959-05-28', 'UNP', 'Av. López Albujar Mz. A-2-L7 Los Ficus', 'SSM@GMAIL.COM', '964049552', '352157', '02617474', 2, 1, 3, 84, 1, '0.00', '2020-10-20 19:48:51', '2020-10-20 19:48:51', NULL, 'M', 1, 1, 1),
(81, '000000080', 'FLORO', 'RUMICHE CHUNGA', '1953-12-22', 'UNP', 'LOS ROSALES I 30 URB MIRAFLORES CASTILLA', 'FRUMICH01@YAHOO.COM', '969668777', '366347', '03594302', 2, 1, 3, 85, 1, '0.00', '2020-10-20 19:51:58', '2020-10-20 19:51:58', NULL, 'M', 1, 1, 1),
(82, '000000081', 'LUIS GERARDO', 'CALLE RUIZ', '0948-10-17', 'UNP', 'Av grau 1679 4 to Piso  Piura', 'LGCR@GMAIL.COM', '993025999', '284100', '02608279', 1, 1, 3, 86, 1, '0.00', '2020-10-20 19:54:17', '2020-10-20 19:54:17', NULL, 'M', 1, 1, 1),
(83, '000000082', 'LUIS EDGARDO', 'CASTILLO JUAREZ', '1948-10-17', 'UNP', 'Av. José Lama ° 260 Sullana', 'LECJ@GMAIL.COM', '999503054', '503054', '03587385', 1, 1, 5, 87, 1, '0.00', '2020-10-20 21:02:10', '2020-10-20 21:02:10', NULL, 'M', 1, 1, 1),
(84, '000000083', 'JOSE MATIAS', 'AMAYA CHUNGA', '1948-07-26', 'UNP', 'Bolivar N° 115 Castilla', 'JMACH@GMAIL.COM', '997394821', '284600', '02668166', 2, 1, 3, 88, 1, '0.00', '2020-10-20 21:04:53', '2020-10-20 21:04:53', NULL, 'M', 1, 1, 1),
(85, '000000084', 'CARLOS ENRIQUE', 'NOBLECILLA CALERO', '1954-12-29', 'UNP', 'Av. Tacna N° 381 - Tumbres', 'CENC@GMAIL.COM', '972523699', '523864', '00320692', 1, 1, 3, 89, 1, '0.00', '2020-10-20 21:07:11', '2020-10-20 21:07:11', NULL, 'M', 1, 1, 1),
(86, '000000085', 'RICARDO', 'SAAVEDRA PIZARRO', '1954-02-07', 'UNP', 'Mrcal. Ramón Castilla N° 645 - Tumbes', 'RSP@GMAIL.COM', '952535652', '525356', '02619453', 2, 1, 4, 90, 1, '0.00', '2020-10-20 21:09:11', '2020-10-20 21:09:11', NULL, 'M', 1, 1, 1),
(87, '000000086', 'JAIME GUILLERMO.', 'GONZAGA CORREA', '1954-05-02', 'UNP', 'Ignacio Merino S/N  Mz. D-Lt.26-I Etapa', 'JGGC@GMAIL.COM', '963556073', '635560', '02606074', 2, 1, 3, 91, 1, '0.00', '2020-10-20 21:11:12', '2020-10-20 21:11:12', NULL, 'M', 1, 1, 1),
(88, '000000087', 'BRUNO ALBERTO', 'SALAS MEZA', '1958-10-06', 'UNP', 'Av. Loreto N° 228 - Piura', 'BASM@GMAIL.COM', '992854008', '327627', '02792630', 2, 1, 1, 92, 1, '0.00', '2020-10-20 21:13:26', '2020-10-20 21:13:26', NULL, 'M', 1, 1, 1),
(89, '000000088', 'JOSE MAXIMO', 'GOMEZ NAVARRO', '1953-10-21', 'UNP', 'Calle Roma N° 259 - Pachitea', 'GNJM@GMAIL.COM', '999322601', '322601', '02603255', 1, 1, 3, 93, 1, '0.00', '2020-10-20 21:15:30', '2020-10-20 21:15:30', NULL, 'M', 1, 1, 1),
(90, '000000089', 'CARLOS TERCERO', 'GONZALES CRIOLLO', '1951-11-28', 'UNP', 'Bello Horizonte I Etapa  C5 Lt. 2.', 'CTGC@GMAIL.COM', '990262872', '343181', '02628720', 2, 1, 3, 94, 1, '0.00', '2020-10-20 21:21:29', '2020-10-20 21:21:29', NULL, 'M', 1, 1, 1),
(91, '000000090', 'MARIA ESTHER', 'CESPEDES YARLEQUE', '1955-08-03', 'UNP', 'Ignacio Merino S/N N° 41 II- Etapa', 'MECY@GMAIL.COM', '969349511', '311046', '02615574', 2, 1, 3, 95, 1, '0.00', '2020-10-20 21:23:41', '2020-10-20 21:23:41', NULL, 'F', 1, 1, 1),
(92, '000000091', 'DIEGO TOMAS', 'PURIZAGA ZAPATA', '1952-10-01', 'UNP', 'Ign. Merino S/N N-41 II Etapa', 'DTPZ@GMAIL.COM', '969695943', '354287', '02609763', 2, 1, 3, 96, 1, '0.00', '2020-10-20 21:25:25', '2020-10-20 21:25:25', NULL, 'M', 1, 1, 1),
(93, '000000092', 'PEDRO AUSBERTO', 'GONZALES RIVAS', '1946-01-30', 'UNP', 'Agrup. Vec. Fátima Mz.D-Lt.36 - PIURA', 'PAGR@GMAIL.COM', '969831922', '356517', '02610412', 2, 1, 3, 97, 1, '0.00', '2020-10-20 21:27:48', '2020-10-20 21:27:48', NULL, 'M', 1, 1, 1),
(94, '000000093', 'HELEN BRISEIDA', 'LUNA CORDOVA', '1958-10-13', 'UNP', 'Ayacucho N° 118 - Castilla', 'HELENLUNAC@YAHOO.ES', '964861572', '615720', '02666304', 2, 1, 3, 98, 1, '0.00', '2020-10-20 21:30:22', '2020-10-20 21:30:22', NULL, 'F', 1, 1, 1),
(95, '000000094', 'VICTOR RAUL', 'QUIROGA BELUPU', '1955-04-15', 'UNP', 'URB BELLO HORIZONTE MZ D-2 LOT 5 II ETAPA PIURA', 'VRQB@GMAIL.COM', '999356610', '356610', '02789281', 2, 1, 5, 99, 1, '0.00', '2020-10-20 21:35:04', '2020-10-20 21:35:04', NULL, 'M', 1, 1, 1),
(96, '000000095', 'MARIO DAVID', 'ARRUNATEGUI PRIETO', '1959-10-19', 'UNP', 'Block B - 1 Dpto 101 Resid. Vicús.', 'MDAP@GMAIL.COM', '992021222', '321412', '02647511', 1, 1, 5, 100, 1, '0.00', '2020-10-20 21:37:08', '2020-10-20 21:37:08', NULL, 'M', 1, 1, 1),
(97, '000000096', 'SEGUNDO', 'IPANAQUE ZAPATA', '1954-07-30', 'UNP', 'URB LOS JARDINES MZA E LOT 33 - PIURA( ALDEA LOS ALGARROBADO)', 'SIZ@GMAIL.COM', '949795672', '979567', '02791726', 2, 1, 2, 101, 1, '0.00', '2020-10-20 21:39:14', '2020-10-20 21:39:14', NULL, 'M', 1, 1, 1),
(98, '000000097', 'LUIS ALBERTO', 'LEON CASTILLO', '1950-02-24', 'UNP', 'Unid. Vec.  Block A-4- Piu.', 'LALC@GMAIL.COM', '999329111', '329111', '02641407', 2, 1, 5, 102, 1, '0.00', '2020-10-20 21:41:11', '2020-10-20 21:41:11', NULL, 'M', 1, 1, 1),
(99, '000000098', 'FERNANDO', 'VASQUEZ PACHECO', '1946-05-29', 'UNP', 'Av. Circunvalación N° 1890 -  San José', 'FVP@GMAIL.COM', '944223725', '308799', '02654540', 2, 1, 5, 103, 1, '0.00', '2020-10-20 21:43:07', '2020-10-20 21:43:07', NULL, 'M', 1, 1, 1),
(100, '000000099', 'MARIO', 'ARELLANO RAMIREZ', '1952-08-05', 'UNP', 'Elias Aguirre 246  Las Mercedes. Piu', 'MARELLANO525@HOTMAIL.COM', '969686339', '350391', '02609504', 5, 1, 3, 104, 1, '0.00', '2020-10-20 21:46:35', '2020-10-20 21:46:35', NULL, 'M', 1, 1, 1),
(101, '000000100', 'ANDRES AVELINO', 'QUINTANA BAYONA', '1956-11-10', 'UNP', 'mza P LOT 3 URB EL BOSQUE', 'qbaa@gmail.com', '969048493', '316849', '03652472', 2, 1, 2, 105, 1, '0.00', '2020-10-20 21:50:32', '2020-10-20 21:50:32', NULL, 'M', 1, 1, 1),
(102, '000000101', 'MANUEL ANTONIO', 'POZO GIL', '1944-07-15', 'UNP', 'Urb. Piura P-4-11 - III Etpa.', 'MAPG@GMAIL.COM', '999353587', '353587', '02657814', 2, 1, 3, 106, 1, '0.00', '2020-10-20 21:54:24', '2020-10-20 21:54:24', NULL, 'M', 1, 1, 1),
(103, '000000102', 'FRANCISCO', 'PURIZACA ARAMBULO', '1954-12-02', 'UNP', 'Av. Panam. N° 915 Urb. Sta. Rosa-Sull.', 'FPA@GMAIL.COM', '999490895', '490895', '03584935', 2, 1, 3, 107, 1, '0.00', '2020-10-20 22:05:53', '2020-10-20 22:05:53', NULL, 'M', 1, 1, 1),
(104, '000000103', 'PEDRO', 'LUNA VICTORIA HUASASQUICHE', '1955-06-30', 'UNP', 'Libertad N° 633 Dpto. 404', 'PLVH@GMAIL.COM', '999332026', '332026', '01833029', 1, 1, 5, 108, 1, '0.00', '2020-10-20 22:07:58', '2020-10-20 22:07:58', NULL, 'M', 1, 1, 1),
(105, '000000104', 'FERNANDO', 'QUISPE MELENDEZ', '1953-12-22', 'UNP', 'Urb. Chira Piura Mz. D - Lt. 12', 'FQM@GMAIL.COM', '969488020', '350670', '02604545', 2, 1, 3, 109, 1, '0.00', '2020-10-20 22:11:02', '2020-10-20 22:11:02', NULL, 'M', 1, 1, 1),
(106, '000000105', 'PEDRO', 'MORALES SAMANIEGO', '1957-02-20', 'UNP', 'ENACE III ETAPA MZA F LOT 10- DISTRITO 26 DE OCTUBRE', 'PMS@GMAIL.COM', '961816599', '961816', '02618800', 2, 1, 2, 110, 1, '0.00', '2020-10-20 22:12:40', '2020-10-20 22:12:40', NULL, 'M', 1, 1, 1),
(107, '000000106', 'RAUL', 'VENEGAS CHIROQUE', '1949-07-02', 'UNP', 'mz D 1. lot 04 - LOS FICUS I ETAPA PIURA', 'RVCH@GMAIL.COM', '999350428', '350428', '02603331', 2, 1, 4, 111, 1, '0.00', '2020-10-20 22:14:41', '2020-10-20 22:14:41', NULL, 'M', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `pais_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Piura', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Habilitado', 1, NULL, NULL, NULL),
(2, 'Inhabilitado', 1, NULL, NULL, NULL),
(3, 'Vitalicio', 1, NULL, NULL, NULL),
(4, 'Retirado', 1, NULL, NULL, NULL),
(5, 'Fallecido', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingresa_hijos` tinyint(1) NOT NULL DEFAULT '0',
  `ingresa_pareja` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`id`, `nombre`, `ingresa_hijos`, `ingresa_pareja`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Soltero(a)', 0, 0, NULL, NULL, NULL),
(2, 'Casado(a)', 1, 1, NULL, NULL, NULL),
(3, 'Divorciado(a)', 1, 0, NULL, NULL, NULL),
(4, 'Soltero(a) con hijos', 1, 0, NULL, NULL, NULL),
(5, 'Viudo', 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudio`
--

CREATE TABLE `estudio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `anio_egreso` int(4) NOT NULL,
  `duracion_meses` int(11) NOT NULL,
  `colegiado_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_estudio_id` bigint(20) UNSIGNED NOT NULL,
  `es_culminado` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudio`
--

INSERT INTO `estudio` (`id`, `descripcion`, `anio_egreso`, `duracion_meses`, `colegiado_id`, `tipo_estudio_id`, `es_culminado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'U.N.P', 1979, 72, 2, 7, 1, '2020-10-16 03:43:59', '2020-10-16 03:43:59', NULL),
(2, 'U.N.P', 1979, 72, 3, 7, 1, '2020-10-16 04:41:40', '2020-10-16 04:41:40', NULL),
(3, 'U.N.P', 1979, 72, 4, 7, 1, '2020-10-16 04:54:12', '2020-10-16 04:54:12', NULL),
(4, 'U.N.P', 1979, 72, 5, 7, 1, '2020-10-16 05:05:29', '2020-10-16 05:05:29', NULL),
(5, 'U.N.P', 1973, 1979, 6, 7, 1, '2020-10-16 05:12:03', '2020-10-16 05:12:03', NULL),
(6, 'U.N.P', 1973, 1979, 7, 7, 1, '2020-10-16 05:21:27', '2020-10-16 05:21:27', NULL),
(7, 'U.N.P', 1979, 72, 8, 7, 1, '2020-10-16 05:43:37', '2020-10-16 05:43:37', NULL),
(8, 'U.N.P', 1979, 72, 9, 7, 1, '2020-10-16 05:50:17', '2020-10-16 05:50:17', NULL),
(9, 'U.N.P', 1979, 41, 10, 7, 1, '2020-10-16 06:07:55', '2020-10-16 06:07:55', NULL),
(10, 'U.N.P', 1979, 72, 11, 7, 1, '2020-10-16 06:13:56', '2020-10-16 06:13:56', NULL),
(11, 'U.N.P', 1979, 72, 13, 7, 1, '2020-10-16 06:28:52', '2020-10-16 06:28:52', NULL),
(12, 'U.N.P', 1979, 72, 14, 7, 1, '2020-10-16 06:35:39', '2020-10-16 06:35:39', NULL),
(13, 'U.N.P', 1979, 72, 15, 7, 1, '2020-10-16 06:42:20', '2020-10-16 06:42:20', NULL),
(14, 'U.N.P', 1979, 72, 15, 7, 1, '2020-10-16 06:45:58', '2020-10-16 06:45:58', NULL),
(15, 'U.N.P', 1979, 72, 16, 7, 1, '2020-10-16 06:55:51', '2020-10-16 06:55:51', NULL),
(16, 'U.N.P', 1973, 1979, 17, 7, 0, '2020-10-16 07:08:04', '2020-10-16 07:08:04', NULL),
(17, 'UTP', 2019, 6, 18, 7, 1, '2020-10-16 07:18:42', '2020-10-16 07:18:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia`
--

CREATE TABLE `experiencia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rubro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `anios_experiencia` int(11) NOT NULL,
  `cargo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_vigente` tinyint(1) NOT NULL DEFAULT '0',
  `pais` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anio_ingreso` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anio_salida` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colegiado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `experiencia`
--

INSERT INTO `experiencia` (`id`, `empresa`, `rubro`, `anios_experiencia`, `cargo`, `es_vigente`, `pais`, `anio_ingreso`, `anio_salida`, `colegiado_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'U.N.P', 'INDEPENDIENTE', 41, 'INDEPENDIENTE', 1, 'Perú', '1973', '1979', 2, '2020-10-16 03:54:41', '2020-10-16 03:54:41', NULL),
(2, 'Colegio de Economistas', 'Economia', 41, 'Colegiado', 1, 'Peru', '1973', '1979', 2, '2020-10-16 03:59:59', '2020-10-16 03:59:59', NULL),
(3, 'INDEPENDIENTE', 'ECONOMIA', 41, 'COLEGIADO', 1, 'Peru', '1973', '1979', 3, '2020-10-16 04:46:22', '2020-10-16 04:46:22', NULL),
(4, 'UNP', 'Economia', 41, 'Colegiado', 1, 'Peru', '1973', NULL, 4, '2020-10-16 04:58:11', '2020-10-16 04:58:11', NULL),
(5, 'UNP', 'Economia', 41, 'Cesante UNP', 1, 'Peru', '1973', '1979', 5, '2020-10-16 05:06:39', '2020-10-16 05:06:39', NULL),
(6, 'UNP', 'Economia', 41, 'Colegiado', 1, 'Peru', '1973', '1979', 6, '2020-10-16 05:13:13', '2020-10-16 05:13:13', NULL),
(7, 'INDEPENDIETE-UNP', 'Economia', 41, 'Colegiado', 1, 'Peru', '1973', '1979', 7, '2020-10-16 05:24:54', '2020-10-16 05:24:54', NULL),
(8, 'INDEPENDIENTE UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 7, '2020-10-16 05:31:24', '2020-10-16 05:31:24', NULL),
(9, 'INDEPENDIENTE UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 7, '2020-10-16 05:31:24', '2020-10-16 05:31:24', NULL),
(10, 'SN', 'SN', 41, 'Economista', 1, 'Peru', '1973', '1979', 8, '2020-10-16 05:43:04', '2020-10-16 05:43:04', NULL),
(11, 'SN', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 8, '2020-10-16 05:44:11', '2020-10-16 05:44:11', NULL),
(12, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 9, '2020-10-16 05:51:18', '2020-10-16 05:51:18', NULL),
(13, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 10, '2020-10-16 06:08:54', '2020-10-16 06:08:54', NULL),
(14, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 11, '2020-10-16 06:14:33', '2020-10-16 06:14:33', NULL),
(15, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 13, '2020-10-16 06:29:30', '2020-10-16 06:29:30', NULL),
(16, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 14, '2020-10-16 06:36:19', '2020-10-16 06:36:19', NULL),
(17, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 15, '2020-10-16 06:45:33', '2020-10-16 06:45:33', NULL),
(18, 'UNP', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 15, '2020-10-16 06:46:44', '2020-10-16 06:46:44', NULL),
(19, 'Consultoria Privada', 'Economia', 41, 'Economista', 1, 'Peru', '1973', '1979', 16, '2020-10-16 06:56:32', '2020-10-16 06:56:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentesco_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento_id` bigint(20) UNSIGNED NOT NULL,
  `colegiado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id`, `nombres`, `apellidos`, `parentesco_id`, `fecha_nacimiento`, `numero_documento`, `tipo_documento_id`, `colegiado_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'GRACIELA', 'LARREA LEON DE REYES', 1, '1943-11-24', '2664547', 1, 2, '2020-10-16 04:01:26', '2020-10-16 04:01:26', NULL),
(2, 'GRACIELA', 'LARREA LEON DE REYES', 1, '1943-11-24', '2664547', 1, 3, '2020-10-16 04:48:42', '2020-10-16 04:48:42', NULL),
(3, 'JESUS ANGELICA', 'SANCHEZ DE MENDOZA', 1, '1943-03-24', '2647332', 1, 4, '2020-10-16 05:00:44', '2020-10-16 05:00:44', NULL),
(4, 'LILA WONG', 'CERVERA DE CHUECAS', 1, '1947-11-11', '2613407', 1, 5, '2020-10-16 05:08:42', '2020-10-16 05:08:42', NULL),
(5, 'SN', 'SA', 1, '1930-05-05', '2638878', 1, 6, '2020-10-16 05:16:18', '2020-10-16 05:16:18', NULL),
(6, 'LIDIA CHIRA', 'GUERRERO DE CASAVERDE', 1, '1942-03-18', '2645933', 1, 7, '2020-10-16 05:32:52', '2020-10-16 05:32:52', NULL),
(7, 'SN', 'SA', 1, '1942-03-20', '7908615', 1, 8, '2020-10-16 05:45:46', '2020-10-16 05:45:46', NULL),
(8, 'VIOLETA', 'VALIENTE SORIA DE SALDARRIAGA', 1, '1944-12-21', '2644042', 1, 9, '2020-10-16 05:54:11', '2020-10-16 05:54:11', NULL),
(9, 'RAMIREZ DE CHAVEZ', 'LUZMILA HERRERA', 1, '1947-11-25', '2628483', 1, 10, '2020-10-16 06:10:32', '2020-10-16 06:10:32', NULL),
(10, 'NELLY CHUNGA', 'MICHELOT DE MERINO', 1, '1942-10-12', '2622503', 1, 11, '2020-10-16 06:16:07', '2020-10-16 06:16:07', NULL),
(11, 'CARMEN', 'PADILLA DE CHUNGA', 1, '1947-05-21', '2657276', 1, 13, '2020-10-16 06:31:45', '2020-10-16 06:31:45', NULL),
(12, 'MERCEDES', 'GUEVARA PARDO DE ORDINOLA', 1, '1950-12-24', '2641489', 1, 14, '2020-10-16 06:37:46', '2020-10-16 06:37:46', NULL),
(13, 'PURITA', 'SALDARRIAGA DE NAVARRO', 1, '1948-05-14', '2603729', 1, 15, '2020-10-16 06:48:03', '2020-10-16 06:48:03', NULL),
(14, 'CARMEN ALICIA', 'GARRIDO LOZADA DE SALDARRIAGA', 1, '1947-09-02', '2671530', 1, 16, '2020-10-16 06:58:11', '2020-10-16 06:58:11', NULL),
(15, 'Michel', 'Duarte Encalada', 2, '2018-09-22', '98898098', 1, 18, '2020-10-16 07:17:08', '2020-10-16 07:17:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE `mensualidad` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `anio` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mes` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_referencia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `abonado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `es_pagado` tinyint(1) NOT NULL DEFAULT '0',
  `por_cobrar` tinyint(1) NOT NULL DEFAULT '0',
  `colegiado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_04_20_162422_create_parametro_table', 1),
(2, '2020_09_23_125138_create_rol_table', 1),
(3, '2020_09_23_125157_create_usuario_table', 1),
(4, '2020_09_23_125228_create_tipo_documento_table', 1),
(9, '2020_09_23_125750_create_experiencia_table', 1),
(11, '2020_09_23_125803_create_mensualidad_table', 2),
(12, '2020_09_20_150532_create_estado_table', 3),
(14, '2020_09_23_125411_create_estado_civil_table', 3),
(16, '2020_09_20_150717_create_parentesco_table', 4),
(17, '2020_09_23_125725_create_familia_table', 5),
(18, '2020_10_03_125438_create_pais_table', 6),
(19, '2020_10_03_130015_create_departamento_table', 6),
(20, '2020_10_03_130026_create_provincia_table', 6),
(21, '2020_09_23_125634_create_colegiado_table', 7),
(22, '2020_09_06_205513_create_grado_table', 8),
(23, '2020_09_23_125738_create_estudio_table', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Perú', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isVisible` tinyint(1) NOT NULL DEFAULT '1',
  `isEditable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`id`, `nombre`, `clave`, `valor`, `isVisible`, `isEditable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mensualidad', 'mensualidad', '200', 1, 1, NULL, '2020-09-24 05:17:56', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_hijo` tinyint(1) NOT NULL DEFAULT '0',
  `es_pareja` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`id`, `nombre`, `es_hijo`, `es_pareja`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Esposo(a)', 0, 1, NULL, NULL, NULL),
(2, 'Hijo(a)', 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`, `departamento_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Piura', 1, NULL, NULL, NULL),
(2, 'Ayabaca', 1, NULL, NULL, NULL),
(3, 'Huancabamba', 1, NULL, NULL, NULL),
(4, 'Morropón', 1, NULL, NULL, NULL),
(5, 'Paita', 1, NULL, NULL, NULL),
(6, 'Sullana', 1, NULL, NULL, NULL),
(7, 'Talara', 1, NULL, NULL, NULL),
(8, 'Sechura', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', NULL, NULL, NULL),
(2, 'Colegiado', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DNI', NULL, NULL, NULL),
(2, 'PASAPORTE', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estudio`
--

CREATE TABLE `tipo_estudio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_estudio`
--

INSERT INTO `tipo_estudio` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Doctorado', NULL, NULL, NULL),
(2, 'Maestria', NULL, NULL, NULL),
(3, 'Curso', NULL, NULL, NULL),
(4, 'Seminario', NULL, NULL, NULL),
(5, 'Taller', NULL, NULL, NULL),
(6, 'Congreso', NULL, NULL, NULL),
(7, 'Especialidad', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `clave`, `token`, `rol_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '$2y$10$.2QEjLFsbAcdPdFKEP0eNOIwo8R.T.pg1c81j42nnZk3VQkaWK6Zu', '$2y$10$e7kjHxW4z6hdou9lrSxQp.5rh7NATAYGmKw.4.t.9fg/i7DFcTXti', 1, '2020-09-23 21:25:29', '2020-09-24 08:33:02', NULL),
(4, '000000001', '$2y$10$HLfUCiK78/t43kiC4Ma.3.gDEc763HwFgpYMQT/Yf.cokJnfg8MEO', '$2y$10$zDCPNdKQV5/8Jt1q8rViJOabmyaD/6hNkGBcXjiNeOKy60/5sJus.', 2, '2020-10-16 03:27:48', '2020-10-17 01:26:42', NULL),
(5, '000000002', '$2y$10$fTFxwi6yBkVDBMaIiEVs.OWBQrgWZoaXiRvcuoIDzswXM4SeltK7S', '$2y$10$tF.vv./rE0C304M2bJTXBOgbeSw4ND5Fqzv0WaDykQvFoYLD8wcDG', 2, '2020-10-16 04:06:07', '2020-10-16 04:06:07', NULL),
(6, '000000003', '$2y$10$vEVmVqDfarz2iY.gg4P4KOCKRF48SDheClZh0RCGh.gJpECH5xCfO', '$2y$10$My3NzviW0LOSoFvFPWRT8e.VsRYR7IzYkhgd0UtQ0pGrL4V6.7HCy', 2, '2020-10-16 04:53:51', '2020-10-16 04:53:51', NULL),
(7, '000000004', '$2y$10$.DmAxePjFgRj0wRNnmCBPOBuPwrus.x7bOMC/su5ZyIIZvxSi0OlC', '$2y$10$pGk/Qg8FePr0eXuuwAvqZ.3yddQwbDD7gtcN.z9wIRsh8jLAeRjTK', 2, '2020-10-16 05:04:38', '2020-10-16 07:46:30', NULL),
(8, '000000005', '$2y$10$mQw7FajV4ir36ni1tvkO0.8APsFwMQE/jpT1671l694ChePYV1t5C', '$2y$10$GhsBU2/3MH3uxUzUuMpA4O/MAucMdMGao.yP.k9UP9PmABJ8G/kEu', 2, '2020-10-16 05:11:37', '2020-10-16 05:11:37', NULL),
(9, '000000006', '$2y$10$4sMOmTFdzuxE/7wWCUqu9e7TJjYlUz0oBDmHIJYTG3gMX9jlfWTlK', '$2y$10$iPMO5ljQW5k0cdc1L46CTuaI2/nbrtP275dKDtCE7.tH88/Vkq2Oy', 2, '2020-10-16 05:21:04', '2020-10-16 05:21:04', NULL),
(10, '000000007', '$2y$10$kUk7tHJyplheqLgvqa20yOmf4NXRtgwb.qFXhqwFiXpCchlXD6lLm', '$2y$10$sJYLw7dY.t04U5PE85TmVeZyEZ3ihfkt22gbG1BWYl6itrWGKYWmS', 2, '2020-10-16 05:42:12', '2020-10-16 05:42:12', NULL),
(11, '000000008', '$2y$10$IUbTsRZzGT.XtCWLMsUnCOp7ZoTC1HzzBGWx/CvU6A9z8b0OGFdPS', '$2y$10$X9HhmXSyjksTDGw9rGwi4.XeIQkZQt1NTxv4F3Qfsw.2pN3jB0BEu', 2, '2020-10-16 05:49:41', '2020-10-16 05:49:41', NULL),
(14, '000000009', '$2y$10$3OnppMzuKSsZCtrqode93u1IoWDkq94iUbkIdPvu6WQQ9iFiVDmZC', '$2y$10$xM.HKJZNLua1Q4vuJGbAf.jppH.zaYFT7c/NIbCpPBJ7.Z3uabXfW', 2, '2020-10-16 06:07:31', '2020-10-16 06:07:31', NULL),
(15, '000000010', '$2y$10$idz5mtbpHV0pkARPyatOSuUaj9XCvUo13UD9OnSsuf4WTjpvDYoSW', '$2y$10$LjGSfH9HfcqVYhnr29oNg.2MWgQlwu6M4hEY72fpqfT5E/DKqMAsG', 2, '2020-10-16 06:13:34', '2020-10-16 06:13:34', NULL),
(16, '000000011', '$2y$10$CGcXcv0MNQiT4LDPhKtWUO7RFk4OwnRwKj47xf8056VGWP3EQlL9y', '$2y$10$mdQqvOKLV9sly0IvT4zw3enseBykBjqSAnIF7cGLaAdOcz4Rsy0JW', 2, '2020-10-16 06:19:08', '2020-10-16 06:19:08', NULL),
(17, '000000012', '$2y$10$6aF1JB6DYnSqZLEA.kWcCOvCRsVmh64FdGECwZy8LmYf3BVVGjxNG', '$2y$10$lskyblDZTZ1o0If.riGVp.F4WE3n7oGR0aMLy10ctyG4np8cGuDiW', 2, '2020-10-16 06:27:13', '2020-10-16 06:27:13', NULL),
(18, '000000013', '$2y$10$r.yv3WbocO0lnd7j4PyoB.LbZO/ukNDWMiCmlabXc8WDwqAieEwFy', '$2y$10$qHcJHDCvs4zzN6T4Kx8YU.MUiy8NROkywQ03pWipbk6RZfu0Ifuzq', 2, '2020-10-16 06:35:12', '2020-10-16 06:35:12', NULL),
(19, '000000014', '$2y$10$o57FrkadN4nDRS9455l3.ujxNZf6pgALetclfhUVZckZHJ2kkexaW', '$2y$10$4lQvq1.jAJpjNvcKhHIO9.h2EAJhw6G1vRcmjmFvO/GUH3/ScKrce', 2, '2020-10-16 06:41:07', '2020-10-16 06:41:07', NULL),
(20, '000000015', '$2y$10$6S6/DRuGIFXZOpIWM6BekujLTyGT.8i6ENkR3b7rEibw5rNKgv/Fe', '$2y$10$LwKRQ0nmFZCMqRd3NF8I9eGZSztohySike/H3bTx1d7DqUfq35f8e', 2, '2020-10-16 06:55:33', '2020-10-16 06:55:33', NULL),
(21, '000000016', '$2y$10$mJCBZNaApVBrDDn4S3XMMuK9kZk9qshvzuvwuWCJRfzeX.YYKu4mu', '$2y$10$OR12fqkM49vokAkzhpuhyup9QVBcv5sbhnaYVQka.IbxiBRc77HM2', 2, '2020-10-16 07:07:41', '2020-10-16 07:07:41', NULL),
(22, '000000017', '$2y$10$H0KsztnSaiPpISM1psKiy.1fnWRHFLBGgeHeiOqDFlgQkVLAwaDZK', '$2y$10$NIAbo/L4FtkZS/YcgephYul8Bvxc.53BOpyeIJkSGg0aoLrNbm4ay', 2, '2020-10-16 07:16:11', '2020-10-16 07:16:11', NULL),
(23, '000000018', '$2y$10$p.m7Ke4mSc/N8Fydo9C.ZeckfTC/AnCujxZcRYKAxJPDWutgJrbEu', '$2y$10$zW8KTHq1ANI2j6Gc6FogX.fYHmlQh8CJm34Ot1z3vhhSQvNvBolcO', 2, '2020-10-20 06:11:00', '2020-10-20 06:11:00', NULL),
(24, '000000019', '$2y$10$VgdgoMj93.RKAyI4l1aPAOIwtVgLapDdgI/vTchZx1s1TLxKYfYgK', '$2y$10$NJYH6ko20hbbQ//nQn.2vOzemBBnsjqB0OLyUora2BECox5if3NPm', 2, '2020-10-20 06:17:26', '2020-10-20 06:17:26', NULL),
(25, '000000020', '$2y$10$9WbL/eU/11yJJEzEt69N8Oa8cPm196rIcc5vJ37nWH8q9Nw8qmwa.', '$2y$10$lu9Y294yZ3pJvjdgXHAnc.9eiHsUYmVxkqA6fsVKfCa2.Nyg8.WnO', 2, '2020-10-20 06:21:20', '2020-10-20 06:21:20', NULL),
(26, '000000021', '$2y$10$K6QRMSzAiHeen/jCx86yjOQRKrv6vTu3kWGJYWbnvsMHFLglbXiB.', '$2y$10$lKyqZGs3YIpuu/hDV9pulOEVW5zhbzx5YehEipU6vps4TGUAph/hy', 2, '2020-10-20 06:25:10', '2020-10-20 06:25:10', NULL),
(27, '000000022', '$2y$10$5RdL6XFC8fL5Wf3YCSxtTegiQcfLcrihNO8vWRTZpCCAIDfVl853m', '$2y$10$lBpl5BVopxKzC..9OC8p2.TrR5/911uGPuVGTEUfbWUptwgw53XkO', 2, '2020-10-20 06:28:36', '2020-10-20 06:28:36', NULL),
(28, '000000023', '$2y$10$QarULhL0hVCWP7MtoCTk6ueIUnSu2a3YgDmFQI/umFkwvC9ydUD.q', '$2y$10$ErrxcAeqBazP0A6NGFdjDembO52ov7jIpb8EQqmd.RTfgqYoNThXm', 2, '2020-10-20 06:33:04', '2020-10-20 06:33:04', NULL),
(29, '000000024', '$2y$10$9ZuUtSiKfepbQk/0WD20n.fNwcNGhbBEWzIOiM4BI2UzrqAkd1ca6', '$2y$10$CbZtzv0FaS6FYIzupaiXXui.F42/XJRlnK8Qhq0MxouQ8UXf4WhtC', 2, '2020-10-20 06:40:21', '2020-10-20 06:40:21', NULL),
(30, '000000025', '$2y$10$Y96/Nml4pFDRR38QMBsK3urIsVBk.GZLX/DFF6LUd8s5u/LrypYfC', '$2y$10$2mW46ipErHuv.xPzmaqhC.2SxGCKaSFq2qfP279VKiExYlRzYCDe.', 2, '2020-10-20 06:42:59', '2020-10-20 06:42:59', NULL),
(31, '000000026', '$2y$10$Q6EpqoLCl0oQDuZ4rv5Qou3/pR4tKmcym/ZA6GXzdNMiQPtKDR3xa', '$2y$10$SvCpf3t0niwsy8Fye30jd.2GNaVIdo9GLabwN0.dNNJ871FBmm3Oq', 2, '2020-10-20 06:45:24', '2020-10-20 06:45:24', NULL),
(32, '000000027', '$2y$10$MyqSxmqoHqHXqM5coiBjf.4zaUoxYbN7xoLGtuj1V8Jp5IwLNlK1G', '$2y$10$MiaeQ1qoQLFSIflpTFj3cOP1VpLXw.2ZyNElBCw2bTo8HnmhEWNmS', 2, '2020-10-20 06:51:12', '2020-10-20 06:51:12', NULL),
(33, '000000028', '$2y$10$R5bj8MucmLnh5/cSZPCJdOrOSY20GGqYqxIcNPYpys/f.q9D1UVle', '$2y$10$jMmnPGGF4M1F.ECLjfpm..yJgzsaEQMOm07zvcLTKrfXv8nZLABgu', 2, '2020-10-20 06:54:13', '2020-10-20 06:54:13', NULL),
(34, '000000029', '$2y$10$0jd64EmGZkAaZgw/O5ZfHuJJLuFOB0RSCOCk2aMFgZqzfuDjE9cv2', '$2y$10$R/Mtd0zHsLRIcb5s0i0Nmu.XsX52RyJW933.3rVlzN7GQkZzp7hq.', 2, '2020-10-20 06:56:55', '2020-10-20 06:56:55', NULL),
(35, '000000030', '$2y$10$xQWeQueuyGSSGYUoOpjXR.Lg9KIeCTO06qEq2yaqDGdlk.8gX3aMq', '$2y$10$7FbTwH0KQ04cZZEWUPVRe.6x.05GyW6Sz2Knq0FQa0xSfmVaPjoE.', 2, '2020-10-20 06:59:56', '2020-10-20 06:59:56', NULL),
(36, '000000031', '$2y$10$WJ0Ed9NbMgI/r2WmtZ8h3ua.tJfx3KPt81dwBzNrzw376Ct5QFRIm', '$2y$10$WsS7yGehc0CAARBZ0w9DQO2hi3gOGx4LmKUd5CBToRVg29ZVI4MSS', 2, '2020-10-20 07:04:01', '2020-10-20 07:04:01', NULL),
(37, '000000032', '$2y$10$8G0aE9Fcxn3cFH.LyIbu3..Ptn/z0U6/j8fxuzzDB0tqiOfyCjF6u', '$2y$10$uty.K6UFw9PSkX6z/zlcBeJdqJfY0KJiZvOpm2h2cqN71/3CSAyc6', 2, '2020-10-20 07:07:21', '2020-10-20 07:07:21', NULL),
(38, '000000033', '$2y$10$iiPIsXbpufNPFysnyKMUQO/r3GG3jNlDiO5QFy/JK9eV4bLHjHdVq', '$2y$10$esH5s.2/t98i5F./Ad6XSOPqNjlRzqMq8Vyahg4QajLimfRzqlS8q', 2, '2020-10-20 07:09:51', '2020-10-20 07:09:51', NULL),
(39, '000000034', '$2y$10$XD4vPxrA3Kkr0bnXgBSkmuokB3/qUvPNMhhnD.ffJ2mQGHafGqcW2', '$2y$10$vO2PFn3P1339Pw.11T8YaOTbz5cmb3cGAPxJsgbz1IKAigcejgoIK', 2, '2020-10-20 07:12:05', '2020-10-20 07:12:05', NULL),
(40, '000000035', '$2y$10$oaQoimqXlZdBwwflfHZJ7Oxgj2dVwpRlMk6vlhM3iaE5FkbOtsNX2', '$2y$10$sc06ZrFSAWgNbPMuJ/siSe8SdpeKT4izOWdFhNHDQFoOM0Li0P1Hq', 2, '2020-10-20 07:14:06', '2020-10-20 07:14:06', NULL),
(41, '000000036', '$2y$10$4MhWCkM3nPKklu2DGyTefOi.cED9reQZjNibO1oLxJp3OtXV9T1Qe', '$2y$10$Z7RylbAPc0bV6icZSZxMxeW7Wa.LzHzYTrefmd81poO95mcMS9mKi', 2, '2020-10-20 07:16:39', '2020-10-20 07:16:39', NULL),
(42, '000000037', '$2y$10$LBn5dZv7eCXgZrolU.MY5ebYg4CecuWTtl7xL9RAd8U5.5xHXIjKy', '$2y$10$u1kmm1XRR8oZ48n5Al271.2YM.rPOSM25h1XDyPeFndS.2ElwP/wu', 2, '2020-10-20 07:22:33', '2020-10-20 07:22:33', NULL),
(43, '000000038', '$2y$10$wYaoi1shCAoqy6CiNeozlOLw1HIV6dVGrQ.MnYpPiGI7j.PipOrqC', '$2y$10$WeE91OsgAjrBh/uRC/T1R.UgDXwrWHACzPY0QqvNkPcqXNNiMLLQm', 2, '2020-10-20 07:25:29', '2020-10-20 07:25:29', NULL),
(44, '000000039', '$2y$10$VNBayRg2Aeae4WRG57YAAevTBagWR/Ydv2xcFdr3ZlicXA3cx5i5u', '$2y$10$f3lJMq7J.bk1vBBz1PlQ8erAaW4Abx81t86SMJ/vfZ8DC6XzdUKya', 2, '2020-10-20 07:27:58', '2020-10-20 07:27:58', NULL),
(45, '000000040', '$2y$10$5MkLyZE25X.tkHI104k3s.FD6sLY2rkHh7EycuF.NI5g/CgT.RWjS', '$2y$10$8w4R0PaVvQOOGPFfZo0CVup4.j7DwHxHyrlCBGt84tDuidi8BypAW', 2, '2020-10-20 07:30:15', '2020-10-20 07:30:15', NULL),
(46, '000000041', '$2y$10$imvviiNu9xg7D/C6heN9Lu.Q6UidTdeTgHHCchU5dp6RTb5EL9Nqy', '$2y$10$7g9ax6i.YWKSlJzQjZ1V3.mWS9ZkZN3bYFlqMljxH9tXR6/We2d7y', 2, '2020-10-20 07:33:02', '2020-10-20 07:33:02', NULL),
(47, '000000042', '$2y$10$sNZB9DGfy4cZRwFoASNy1ejp3lXKp222gQHEaRvAX1bNG1sFmDp3u', '$2y$10$LTclQcm0.8/pmmtR4GAt5umeNhcPu3u2swRej8CPauYzfREkHyieO', 2, '2020-10-20 07:35:42', '2020-10-20 07:35:42', NULL),
(48, '000000043', '$2y$10$ieXWD15zSN.lrlFncWv7guM1hxwNdyPZNk7zAF7otjz3l.xTU0rvC', '$2y$10$VFtN4.ARXF/WD.kScbvBTOiMC77Ikab/8GiSqfUWZsyRtHFYmp9UC', 2, '2020-10-20 07:37:44', '2020-10-20 07:37:44', NULL),
(49, '000000044', '$2y$10$MocCzP096Lf8xitnOQL7j.xyu/Dsv.UqxBkzKBgfyXFjE6CnpAmk2', '$2y$10$2hAK.4r7oXcxHxiPvmx9n.eRK3FTdZ4fV.uMyEDOlanzHjlWkluVu', 2, '2020-10-20 07:40:05', '2020-10-20 07:40:05', NULL),
(50, '000000045', '$2y$10$3t3Uo.scFJVQV4xjqejCze/Z93AcBoBa4VK7JXy1qtRulb0KQ0sUe', '$2y$10$XbFF3YnQ2NrGMSjLStEEhOLuOrXta3BR4V9PlczQyG00ROlxLlw.a', 2, '2020-10-20 07:42:14', '2020-10-20 07:42:14', NULL),
(51, '000000046', '$2y$10$96a2NuuDb676bTloEzVyDugnsKiHEhdRz5OrI9Ll7JvqkJ4Sd2GUC', '$2y$10$R/ifuKK4RfV2k2S56/L9le6yyspJe6eMrN8HT5pC/WzSzoClwd0vu', 2, '2020-10-20 07:45:07', '2020-10-20 07:45:07', NULL),
(52, '000000047', '$2y$10$qSgx4eS.FfF3U8gmnAmU.ucd8J4QlLxVCPEg7gGEKeWSXTP2P63qy', '$2y$10$/eIilSGRgMHL9UnLScMS9OP4t8lyY01tJwF0wDKGoK/dAp.vuXI8m', 2, '2020-10-20 07:47:42', '2020-10-20 07:47:42', NULL),
(53, '000000048', '$2y$10$dEg/QUHHT/vzDMdSfpHlpO6WCq1vOTu7TiUNZQxeh0oRuxVP3omB.', '$2y$10$mFss2A1m9j84sn.QRs0.xO4j/jTi/wMv8hWMZ0d9FKKvgCem/X6LW', 2, '2020-10-20 07:50:03', '2020-10-20 07:50:03', NULL),
(54, '000000049', '$2y$10$JPGiq1mQNTvRR1qfjf8h/.2Gmrb5Mg2uXp0dVUuI/OMIPJarxcgR2', '$2y$10$z4Lc0wkeDNC2jzbgKVT5ZulUqgdp9kKaIfghAfXWtMrz4nyOxrxo.', 2, '2020-10-20 07:52:14', '2020-10-20 07:52:14', NULL),
(55, '000000050', '$2y$10$T6BDPBvxpovfl4Czpz43uuAZyZgQETiJeRoOzTDGxSZzcQn7E3HOS', '$2y$10$Ch4ROQa/L9oGG8OBx3u/G.Z3I9EB7jBaYdN3Cq5aCh/SCCZwJxSTi', 2, '2020-10-20 07:54:41', '2020-10-20 07:54:41', NULL),
(56, '000000051', '$2y$10$yWrldmr8dXGCShipzr4Aqe2xP19m168maii0JZiAoOwZMYIvSBHbO', '$2y$10$Z27ibrS6chrzNQaVABfIiuWoix.Osm.tgrJFPR9KGKkluZpGyCyaC', 2, '2020-10-20 08:07:48', '2020-10-20 08:07:48', NULL),
(57, '000000052', '$2y$10$XRUfnG.KrrCMNIbx65szFuqUNR2nhRiyuN2UVLtXFgFNXfiu4un7y', '$2y$10$MBRQ5MFlva2/SPauxwn/Wu6A5LRUOZ4rhrhP8YOQG7mvICpwU8CyO', 2, '2020-10-20 08:10:08', '2020-10-20 08:10:08', NULL),
(58, '000000053', '$2y$10$LKgLWj4q9MPB0TJivB/EYeHUlx8yXWm4vl1eJxR5vMyDLVk7Q4ktC', '$2y$10$QNV6NA1ISh2RGECg4rGcre9gMr/tsad4x.9iV9medI9yJh2PN0O5q', 2, '2020-10-20 08:12:17', '2020-10-20 08:12:17', NULL),
(59, '000000054', '$2y$10$7hShYuRtpk1QfHbAehoO/e0pi/YifjslicJq87.8yWnnt.Trp.iey', '$2y$10$6fd9pQbVgYsMHuqbaixdIeLwiFxIcGWKM29epQSHK5FJmYbmxheGK', 2, '2020-10-20 08:15:35', '2020-10-20 08:15:35', NULL),
(60, '000000055', '$2y$10$pGSyWEnZ6MnTApqRV8Ff5.s00N2eA8LKjRklK7Ac2.qPHb0FyJx5C', '$2y$10$N8nqzvVePdQAmgEAi4KPAeptx.Aec3DRhR6QmXGFfsL2L/qCwxEFO', 2, '2020-10-20 08:20:09', '2020-10-20 08:20:09', NULL),
(61, '000000056', '$2y$10$oVCgMOyNE4HlagZzi5LxA.jQFI03VoUaF1gAiWFTEs970Vr/bMgXi', '$2y$10$x1tWS1jUSkpn6zfl56oc7uBV/xnGLL9SSjmA7jUnhPSZ3Iy1ysPH2', 2, '2020-10-20 08:23:14', '2020-10-20 08:23:14', NULL),
(62, '000000057', '$2y$10$DX9Y6wr.3.dwXQjl6REck.6DoYasIGYRQNdstDc7J9ifoYWdMwdGS', '$2y$10$FsArR00.ePcidwX6GSpEtuGwO/GmoIIyjyPI0Kc2CZOeVaMM/QIRG', 2, '2020-10-20 08:26:17', '2020-10-20 08:26:17', NULL),
(63, '000000058', '$2y$10$wZAZxJ8W5U/hxO7nRquAQe1.ZvJOVDvjEC5ts74HdwwfEcloWQjs.', '$2y$10$RjX8LM8Rh4cY0.i.3HcW/eJISRyLe.RU8Si0vw.1lD6v3CdUdRlrG', 2, '2020-10-20 08:28:53', '2020-10-20 08:28:53', NULL),
(64, '000000059', '$2y$10$9yUHS.ovsJrIv/lsgp0AgelHyGWC38Bo1CohqpcdfEZRcfKHDDSHG', '$2y$10$BSeF1fJZT0CLEoLrixgM7eH8rmZ.zmHN1LR6PCauFCRckHKsUvfa.', 2, '2020-10-20 08:31:23', '2020-10-20 08:31:23', NULL),
(65, '000000060', '$2y$10$kXrhkfuO..X534ZtojBqn.v8xHEHuTFfwFJkwF04l42uAtx9P4lLK', '$2y$10$bPyZYSOY/1lRwif5lmA/6OpK8F2xRql8xCN5nDI6SS5hdlgzVU5Ry', 2, '2020-10-20 08:33:58', '2020-10-20 08:33:58', NULL),
(66, '000000061', '$2y$10$2.LvAYTb7Pz9vfEZHHcnS.L4Zu58Vop2EmCJyDz/tpOi8eKle629u', '$2y$10$UjOjsygcbCdOHWqesNsb7ue20ZwXqAhPujJgDPTC46ufKjHoRUQFC', 2, '2020-10-20 17:44:47', '2020-10-20 17:44:47', NULL),
(67, '000000062', '$2y$10$aJwEp.T0HNByrZpYf9gBm.JaQ.wmt5tB8489O/whRwr4UV5NuzXs2', '$2y$10$bFRx6t9/gS3chcWS0PUjbOULKppUGvq8jFCfYNFpUSDGXfSYwvHw2', 2, '2020-10-20 17:47:53', '2020-10-20 17:47:53', NULL),
(68, '000000063', '$2y$10$HV92dvqgsnl0BwgpGC.2d.V228ITZQU0z1VjSjTitvh/xBvhIJcdW', '$2y$10$ldjYaBZJMwI8Sl8Sva0qZ.MlgWn5jQTPHy1kWG6DiXqWLjnMK.tL6', 2, '2020-10-20 17:50:49', '2020-10-20 17:50:49', NULL),
(69, '000000064', '$2y$10$by1r7.PRXHcvgPQuAw8bxujeCxihmvlwGIM7AVaUOAKYM26xcdnau', '$2y$10$APvmO0.ogfT9unlbg4L61ekHEL8/IPhJh/WmzWzIBXZdu9xxd2PVm', 2, '2020-10-20 17:52:54', '2020-10-20 17:52:54', NULL),
(70, '000000065', '$2y$10$QPyu/GXTeE.ku7/232N3aeko4TICTSJWrQHnDZYWRFW5AyAHwrLbO', '$2y$10$Wa931hzOyxRL.f0huPxb/eFv1HI3RSNBaDIKj6HlnpLX.TgX1mD6a', 2, '2020-10-20 18:16:10', '2020-10-20 18:16:10', NULL),
(71, '000000066', '$2y$10$FUhkSkHRG23eyKJZkEkscu4D1bZ2Ll3b45IUQVVxNNhMkU.RMuKnu', '$2y$10$i9554sbhJq4gsyRhprfeYO88H.e3D9SfgfyNB4XsgLugQb7gmkgtW', 2, '2020-10-20 18:19:54', '2020-10-20 18:19:54', NULL),
(72, '000000067', '$2y$10$p.UsUuRhYEuOTa2h9avnGeiStctT5lpBK23O36nBA7iCie8nTQNGy', '$2y$10$vLvWZBVqPPSnFBtTIXDhfedJHkSLU.qu2wZ3v0ZxaaUStrWuXbX22', 2, '2020-10-20 18:37:43', '2020-10-20 18:37:43', NULL),
(73, '000000068', '$2y$10$QYS9JvZ07/kN1l5a/UzEW.kefbxiBaD.gfrOLQYbccVrFTTCiYY3W', '$2y$10$TIN/PrRsno/CDEqyUbMRQ.5UXbbRyqPxcTTghG3IHEXhqGsiuNMqy', 2, '2020-10-20 18:43:39', '2020-10-20 18:43:39', NULL),
(74, '000000069', '$2y$10$yZFJJ5xIaAR55pvmqmJp7u9KehLE2KwjWXpCLBrlIi6MkzdS9bPnW', '$2y$10$BGAYoPvRM1ihKf/KMNZtp.oHGER.LewOww6KzLTsmxJKB8jtRxYwy', 2, '2020-10-20 18:45:44', '2020-10-20 18:45:44', NULL),
(75, '000000070', '$2y$10$8Mej6t2H/kqbm8yMPHYOPe3QhL6DidctIACFCeeYpFOKsVu04ehFS', '$2y$10$.VONzyvvasELP6k264EAROJIS9icptMvcY3pgblfZ0dzwjYbfoO7.', 2, '2020-10-20 18:48:01', '2020-10-20 18:48:01', NULL),
(76, '000000071', '$2y$10$KH4gFpP5hjtaOT3AMbm5suKn5PoYVE0gecs4vFici7LUgwqI4kGE6', '$2y$10$NaifvoL/bXm8KpJ9IdaE1OkJPMb3f8wf9o9IBxsrkpUQW8Lw1mft.', 2, '2020-10-20 18:51:04', '2020-10-20 18:51:04', NULL),
(77, '000000072', '$2y$10$hpHSJBt3Zp76nd6y1mrG4OJ/KPns7doCT1KqIRmbbFBizTgodqpIO', '$2y$10$vfNYRoG/AHV10I8XSiyqbOX.YnF3zl1E2OeZcIR7O572z1/qOK0Dy', 2, '2020-10-20 18:53:44', '2020-10-20 18:53:44', NULL),
(78, '000000073', '$2y$10$rx5nHAZpUFRDtdDELiZa9eXm6RWoLwHxg7BBoEVYOcRLbQSZbScJu', '$2y$10$VxILqUYjucQpcSUH5cyyt.eFaJ01kMkQFFWqmBcxZspaxpDQvljzW', 2, '2020-10-20 18:55:41', '2020-10-20 18:55:41', NULL),
(79, '000000074', '$2y$10$MwLb0OORGffIo/ZdB7NR..nzlUmnLLalb2O3QyBhbWzF.50NIPd0G', '$2y$10$gD5U5UZYg1DNpX4vt5iGn.WYuAlhMi701r/5QSCOhr3qGL9QKN7vW', 2, '2020-10-20 19:04:17', '2020-10-20 19:04:17', NULL),
(80, '000000075', '$2y$10$xiurplfT7uFn/gHuo6PfiOjWW7h64TrQhnKWNBdBQW9CinRe2j.im', '$2y$10$FmFc0fCNpLdXNqod3DmUGOQQG45uPMfMdyRv8One5cH1HZ20Zy.xi', 2, '2020-10-20 19:06:24', '2020-10-20 19:06:24', NULL),
(81, '000000076', '$2y$10$gixVIKGxCjepOtLTC.6C3uUE11EhCMq5y0crrs/ibCx25XMs5MBiK', '$2y$10$HuacnyiUFZZbd4Xjz5rqBufdhSGXYOG9x6DzsA6lliH/WVB6VVQnu', 2, '2020-10-20 19:16:46', '2020-10-20 19:16:46', NULL),
(82, '000000077', '$2y$10$N3hrakLRIbPb0E.QqiCxV.aDiRO3ec4aX2K4H4ChKuBmwA9wjl9KS', '$2y$10$mqwfnLD3YkPvYH5U73W07eyYS3Vy3AHw.AtJYQuB/ZM06.ySl6/HG', 2, '2020-10-20 19:44:52', '2020-10-20 19:44:52', NULL),
(83, '000000078', '$2y$10$GC5u1SDsz32tSZVFfW2ywu9RHaiJ4pDiWWks/OIRaPSOCgFTciIry', '$2y$10$pnAQHWqpC5S6B/knR03NiuFOXAHGNearBYdgtQo6ke9ksfCq1N3a.', 2, '2020-10-20 19:47:03', '2020-10-20 19:47:03', NULL),
(84, '000000079', '$2y$10$Cd8gcrvsnrA4tGZrtocQ4u6t2bOPYaVyZX0xfU.b3ySTyuGQ5c2Ju', '$2y$10$cKdCXvQUeKtupGepyv4r/O45fZx5m.zP6yRje7I.nHDm1QRlXVbRy', 2, '2020-10-20 19:48:51', '2020-10-20 19:48:51', NULL),
(85, '000000080', '$2y$10$nh9QLEaV.goiMUPYTBVxQuOxnLks/.yZptdAct8Y2wwcQ.XfCasXq', '$2y$10$ExKS36C3i3byHPdXcRKKxO/zntjQa1rRI4vZ3R.VZe2ou3hrAcs2S', 2, '2020-10-20 19:51:58', '2020-10-20 19:51:58', NULL),
(86, '000000081', '$2y$10$bySbAyf.tgGYFegjPNlQTeNz12NkOrr1OfiPrH2bf6HqVAiZWcqUO', '$2y$10$.oLFf30fGhckTyP8dkH1..WjukTt5Jj2edya6qSQ1oEd0gwumQdDK', 2, '2020-10-20 19:54:17', '2020-10-20 19:54:17', NULL),
(87, '000000082', '$2y$10$4KXGx57PWTtM1UzCAhDOi.WJOVxX8UwAEAJAEsKIqRfuhRGZceEZ.', '$2y$10$TZlvILbGHPmaYu65BHne3OLBIWIhekJU4X1gZmT/U8B.qQNNq9YkO', 2, '2020-10-20 21:02:10', '2020-10-20 21:02:10', NULL),
(88, '000000083', '$2y$10$1BYse3PQuNjynTF7vY4zq.0EP.AfHCmU0D0N.CXVIhsxBz0Z2JT1.', '$2y$10$8Wh9YAgwswi3m10sUEXbkudgt2XBnxQbhAYaCMyK/qnIEGF1tJCd2', 2, '2020-10-20 21:04:53', '2020-10-20 21:04:53', NULL),
(89, '000000084', '$2y$10$VVeDtBjCvSuZkxsuba/neu4iMo1s6IR5K/ftG7YbViPhkAoUYLf2K', '$2y$10$1P7RHqekbgwYcq.KIM4bY.wQ5RChsWUIm9X0u5tnEtpjd3499pzRO', 2, '2020-10-20 21:07:11', '2020-10-20 21:07:11', NULL),
(90, '000000085', '$2y$10$dq3rtXB0aolKiN.G6GL3TuMSBAOCfNet9UFCYgNXFkHCKDFnr80V.', '$2y$10$ciQpV/Qjogs0hvKVepTJZ.2u4dxZ0W.U4o6gMaWDVdZEraHkJYFbC', 2, '2020-10-20 21:09:11', '2020-10-20 21:09:11', NULL),
(91, '000000086', '$2y$10$0awXC4b.kZ8F7/SXCj8J/e4omfSJ1fVLVliSJf8knRd//4uwIl2fm', '$2y$10$yaqJQTKp7uHQjmt8hDU3Peib/xz146OwNQ/oTuckuXv7IRZBJ.9ja', 2, '2020-10-20 21:11:12', '2020-10-20 21:11:12', NULL),
(92, '000000087', '$2y$10$JO6XfBS69aQA5g/HHh0VAOnGSC9Xp020NovCcA5cgu9blFtdxfqA6', '$2y$10$/45eD1E6TPbZEX/w16.Qze5j0sbXbIJmDX.teHRA3uW9dWrgwARI6', 2, '2020-10-20 21:13:26', '2020-10-20 21:13:26', NULL),
(93, '000000088', '$2y$10$IBjzyFu9wqKHlLHpxUQJUOw.zfBblektTZQ01e6SlwsurJR2l2nVO', '$2y$10$u1FHLvcBr1/kXniBZyVGgeoCWSbiWfx/8FoPVXNTCbm8ISDWXtO2O', 2, '2020-10-20 21:15:29', '2020-10-20 21:15:29', NULL),
(94, '000000089', '$2y$10$vtt0kr7tWwf2Hdq0FIHFee03vu9akUWkviWa2dTi5CNpBjWAH3lVq', '$2y$10$thb13BI5kH9ovco3bwoM7.onsbw6Gn8YD74cXhGuAemlslE9Io5Ae', 2, '2020-10-20 21:21:29', '2020-10-20 21:21:29', NULL),
(95, '000000090', '$2y$10$UE2/TLsIMi.tzNc.QUu9UuwZ6glbC4Vj5ItFJ12IFFtVisj5G.u.K', '$2y$10$v0fQ./pkIbikCLOyN.BiPeZ91ZrLzwaSXCtrzntYqVuSa2ISDoWkS', 2, '2020-10-20 21:23:41', '2020-10-20 21:23:41', NULL),
(96, '000000091', '$2y$10$DcDERUnrhVhQvPAC7hSV1OyQStGS.9slbauSYYGxHmbBAHXevTbmG', '$2y$10$.KNDI22Cm5pa5ab0t6oZ4OPSXen41GEW2g6FKbIulWww.byLUAvZC', 2, '2020-10-20 21:25:25', '2020-10-20 21:25:25', NULL),
(97, '000000092', '$2y$10$4KwNlAHL5LkSlhbICZl3GesSy9Bg7HCiU6Rv/m5mn.niy.w1eKUKa', '$2y$10$qns.nEMnUzDGI1zM7Zmfjuck8TbB58eyv3PPJB7yJElcM01yridDe', 2, '2020-10-20 21:27:48', '2020-10-20 21:27:48', NULL),
(98, '000000093', '$2y$10$TaaI406VJP2TJ5G/kw5zXuCCq1yWrAV0dlrQDb1K/vaJ4c5bQ9vV6', '$2y$10$wnLhms6oupMTlJyZAGiWzuz2dQ/U3JG7M3bGhWPm5MaDAIgz5JxQG', 2, '2020-10-20 21:30:22', '2020-10-20 21:30:22', NULL),
(99, '000000094', '$2y$10$wt7nC69jQ2b.XHP0pV2ZBee1.ZzuVFrvwbxolkvPqXmbspO.fRjry', '$2y$10$fF8tiJcDYW/21xL4jN8MfeNKHSD9SibF5c3YgMncBKo0b5KjZGkqW', 2, '2020-10-20 21:35:04', '2020-10-20 21:35:04', NULL),
(100, '000000095', '$2y$10$AlaJIHSxq9.z8SZT9AMn8OiPYu2Go0CiPuRIA3Lgv0nDhuEpXgK1i', '$2y$10$75K.RiItrMcra7DJGfWw9.xPLrL/ZNmTOWO8GSbO0JZ9oMVGm9lPq', 2, '2020-10-20 21:37:08', '2020-10-20 21:37:08', NULL),
(101, '000000096', '$2y$10$o1vAFuvam07qonREzxRQP.GAXFyxN3szb3g7x0chZ/cWoaS9rFdY6', '$2y$10$XWV76He5LtJ6jqWBxmD64e1gkWC47h8.PhfKOOBJAnepxQ/e/gl0y', 2, '2020-10-20 21:39:14', '2020-10-20 21:39:14', NULL),
(102, '000000097', '$2y$10$XuMF/2ItdD6we8a8mPH2fOKGnnKEUExIGxEGtXJeStD6jFdOljSY.', '$2y$10$jYsJNe/O/PkyEDLe0q9wzOnIZzn4PRf9GNbO9/J/WBbVrX8n9Zn/m', 2, '2020-10-20 21:41:11', '2020-10-20 21:41:11', NULL),
(103, '000000098', '$2y$10$OU70NYMSlLofmAfmjwiVgeLhmI0v/FUYW1rZCHVjqk.ELDVMBylyq', '$2y$10$HU04sE2K9JtEqdH6/4Kx2.BqjLB6esa9C1qMkLt4M/5n4EOuzYq3q', 2, '2020-10-20 21:43:07', '2020-10-20 21:43:07', NULL),
(104, '000000099', '$2y$10$qDXkVh220EQkW.HDeFxbk.6neO/8ZYIMDjXZxT6IGNdHgNAMKA43i', '$2y$10$a8PjCHG9Mnm43UnOb0Da6e4pG0C0.1n0aY9x.atGG.squ7KMeu0pG', 2, '2020-10-20 21:46:35', '2020-10-20 21:46:35', NULL),
(105, '000000100', '$2y$10$gyCom0BKW.pIcyzC2q93HufTksPQlWo9ZviBv1cuDr/gt7DCvG8zC', '$2y$10$YDS2xVzFP1Huper.RYHnauDIAwj6tQUUPZ/fZUMue7fYjVqkItbeC', 2, '2020-10-20 21:50:32', '2020-10-20 21:50:32', NULL),
(106, '000000101', '$2y$10$ogmi75vySvTPDeyaRIX8oOC8ZSHrBloIF8YkwwPS6x0PvI4HGJFoy', '$2y$10$ieE18PRF1WklGUWWT6hsz.0hVaM4CfJEjAFw8BnwE9306DjeXfIM2', 2, '2020-10-20 21:54:24', '2020-10-20 21:54:24', NULL),
(107, '000000102', '$2y$10$xHQJqawX3aQtR6kay1UoxOdyPXc3X9VJ9imzGLPVMvtygn1.jQG8m', '$2y$10$B4EZ9MimscCqCXtZOgnCLeGWpMH6djslQ9OiSbdrW47r4d2gZ.KHG', 2, '2020-10-20 22:05:53', '2020-10-20 22:05:53', NULL),
(108, '000000103', '$2y$10$3OwOhAmoU2TVXQMHM4GVqu0URNyWsd36N1lWC7aJcRfjWVuL0q/mm', '$2y$10$OHUSkBHxqhq/oVWGl46RYuWk/0.1.vqOHEhlXy4YKmYxwhZ0/GAXK', 2, '2020-10-20 22:07:58', '2020-10-20 22:07:58', NULL),
(109, '000000104', '$2y$10$5fZ5jvW5NymPOgO2QAQxXuhmneuD4sYED5SSPTB0ZhqlivoCe04ca', '$2y$10$MevcFjp7dwlorSrmTwG.3ObYg8GKnFWH75ias.C7UQV9f50HINrMi', 2, '2020-10-20 22:11:02', '2020-10-20 22:11:02', NULL),
(110, '000000105', '$2y$10$41blvhD/FEnz5yYWjSU.l.0uCjfvKLj95WgItYbX2//rqi7Wu6DYi', '$2y$10$kUWDTO/CpTeBwZw7vnMdTuOeztXLMJHLqDwDkjeU5MGtkr25vBrh.', 2, '2020-10-20 22:12:40', '2020-10-20 22:12:40', NULL),
(111, '000000106', '$2y$10$JbPzmQMjBgW/2Nlj4qoc.O1P5PNSpgl8rOk9uorView3qRqya.fsu', '$2y$10$upSjczmtD4SntwPy8G5Ype1ShbFV.CO.m20fpzf1c2KAN808Kl9MG', 2, '2020-10-20 22:14:41', '2020-10-20 22:14:41', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colegiado`
--
ALTER TABLE `colegiado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colegiado_codigo_unique` (`codigo`),
  ADD UNIQUE KEY `colegiado_correo_unique` (`correo`),
  ADD UNIQUE KEY `colegiado_numero_documento_unique` (`numero_documento`),
  ADD KEY `colegiado_estado_civil_id_foreign` (`estado_civil_id`),
  ADD KEY `colegiado_tipo_documento_id_foreign` (`tipo_documento_id`),
  ADD KEY `colegiado_usuario_id_foreign` (`usuario_id`),
  ADD KEY `colegiado_estado_id_foreign` (`estado_id`),
  ADD KEY `colegiado_pais_id_foreign` (`pais_id`),
  ADD KEY `colegiado_departamento_id_foreign` (`departamento_id`),
  ADD KEY `colegiado_provincia_id_foreign` (`provincia_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departamento_nombre_unique` (`nombre`),
  ADD KEY `departamento_pais_id_foreign` (`pais_id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estado_nombre_unique` (`nombre`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estado_civil_nombre_unique` (`nombre`);

--
-- Indices de la tabla `estudio`
--
ALTER TABLE `estudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudio_colegiado_id_foreign` (`colegiado_id`),
  ADD KEY `estudio_grado_id_foreign` (`tipo_estudio_id`);

--
-- Indices de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiencia_colegiado_id_foreign` (`colegiado_id`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `familia_tipo_documento_id_foreign` (`tipo_documento_id`),
  ADD KEY `familia_colegiado_id_foreign` (`colegiado_id`),
  ADD KEY `familia_parentesco_id_foreign` (`parentesco_id`);

--
-- Indices de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensualidad_colegiado_id_foreign` (`colegiado_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pais_nombre_unique` (`nombre`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parametro_nombre_unique` (`nombre`),
  ADD UNIQUE KEY `parametro_clave_unique` (`clave`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parentesco_nombre_unique` (`nombre`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `provincia_nombre_unique` (`nombre`),
  ADD KEY `provincia_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol_nombre_unique` (`nombre`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo_documento_nombre_unique` (`nombre`);

--
-- Indices de la tabla `tipo_estudio`
--
ALTER TABLE `tipo_estudio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grado_nombre_unique` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_nombre_unique` (`nombre`),
  ADD KEY `usuario_rol_id_foreign` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colegiado`
--
ALTER TABLE `colegiado`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estudio`
--
ALTER TABLE `estudio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_estudio`
--
ALTER TABLE `tipo_estudio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `colegiado`
--
ALTER TABLE `colegiado`
  ADD CONSTRAINT `colegiado_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`),
  ADD CONSTRAINT `colegiado_estado_civil_id_foreign` FOREIGN KEY (`estado_civil_id`) REFERENCES `estado_civil` (`id`),
  ADD CONSTRAINT `colegiado_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `colegiado_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `colegiado_provincia_id_foreign` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `colegiado_tipo_documento_id_foreign` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`),
  ADD CONSTRAINT `colegiado_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `estudio`
--
ALTER TABLE `estudio`
  ADD CONSTRAINT `estudio_colegiado_id_foreign` FOREIGN KEY (`colegiado_id`) REFERENCES `colegiado` (`id`),
  ADD CONSTRAINT `estudio_grado_id_foreign` FOREIGN KEY (`tipo_estudio_id`) REFERENCES `tipo_estudio` (`id`);

--
-- Filtros para la tabla `experiencia`
--
ALTER TABLE `experiencia`
  ADD CONSTRAINT `experiencia_colegiado_id_foreign` FOREIGN KEY (`colegiado_id`) REFERENCES `colegiado` (`id`);

--
-- Filtros para la tabla `familia`
--
ALTER TABLE `familia`
  ADD CONSTRAINT `familia_colegiado_id_foreign` FOREIGN KEY (`colegiado_id`) REFERENCES `colegiado` (`id`),
  ADD CONSTRAINT `familia_parentesco_id_foreign` FOREIGN KEY (`parentesco_id`) REFERENCES `parentesco` (`id`),
  ADD CONSTRAINT `familia_tipo_documento_id_foreign` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`);

--
-- Filtros para la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD CONSTRAINT `mensualidad_colegiado_id_foreign` FOREIGN KEY (`colegiado_id`) REFERENCES `colegiado` (`id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
