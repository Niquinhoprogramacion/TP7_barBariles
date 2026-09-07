-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2026 a las 22:26:17
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
-- Base de datos: `barbariles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbero`
--

CREATE TABLE `barbero` (
  `ID_Barbero` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Teléfono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `G-Mail` varchar(90) NOT NULL,
  `Teléfono` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `ID_Horario` int(10) UNSIGNED NOT NULL,
  `Minuto` int(10) UNSIGNED NOT NULL,
  `Hora` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `met_pago`
--

CREATE TABLE `met_pago` (
  `ID_Metodo` int(10) UNSIGNED NOT NULL,
  `nombre_met_pago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_Pago` int(10) UNSIGNED NOT NULL,
  `ID_Turno` int(10) UNSIGNED NOT NULL,
  `ID_Metodo` int(10) UNSIGNED NOT NULL,
  `monto` decimal(10,0) UNSIGNED NOT NULL,
  `ID_Horario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_Servicio` int(11) UNSIGNED NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Precio` decimal(10,0) UNSIGNED NOT NULL DEFAULT 30,
  `Duracion` int(10) UNSIGNED NOT NULL DEFAULT 30 COMMENT 'valor en minutos'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `ID_Sucursal` int(10) UNSIGNED NOT NULL,
  `ID_HorarioApertura` int(10) UNSIGNED NOT NULL,
  `ID_HorarioClausura` int(10) UNSIGNED NOT NULL,
  `Calle` varchar(5) NOT NULL,
  `Altura` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `ID_Turno` int(10) UNSIGNED NOT NULL,
  `ID_Barbero` int(10) UNSIGNED NOT NULL,
  `ID_Cliente` int(10) UNSIGNED NOT NULL,
  `ID_Servicio` int(10) UNSIGNED NOT NULL,
  `ID_Horario` int(10) UNSIGNED NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barbero`
--
ALTER TABLE `barbero`
  ADD PRIMARY KEY (`ID_Barbero`),
  ADD UNIQUE KEY `idx_unq_tel` (`Teléfono`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`ID_Horario`);

--
-- Indices de la tabla `met_pago`
--
ALTER TABLE `met_pago`
  ADD PRIMARY KEY (`ID_Metodo`),
  ADD UNIQUE KEY `idx_unq_mnb_met_pago` (`nombre_met_pago`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Pago`),
  ADD UNIQUE KEY `idx_unq_nmb_id_turno` (`ID_Turno`),
  ADD KEY `ID_Horario` (`ID_Horario`),
  ADD KEY `ID_Metodo` (`ID_Metodo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_Servicio`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`ID_Sucursal`),
  ADD KEY `sucursal_ibfk_1` (`ID_HorarioApertura`),
  ADD KEY `ID_HorarioClausura` (`ID_HorarioClausura`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`ID_Turno`),
  ADD UNIQUE KEY `idx_unq_id_barbero` (`ID_Barbero`,`ID_Cliente`,`ID_Horario`,`Fecha`),
  ADD KEY `ID_Servicio` (`ID_Servicio`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Horario` (`ID_Horario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barbero`
--
ALTER TABLE `barbero`
  MODIFY `ID_Barbero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `ID_Horario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `met_pago`
--
ALTER TABLE `met_pago`
  MODIFY `ID_Metodo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_Pago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_Servicio` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `ID_Sucursal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `ID_Turno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_Turno`) REFERENCES `turno` (`ID_Turno`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`ID_Horario`) REFERENCES `horario` (`ID_Horario`),
  ADD CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`ID_Metodo`) REFERENCES `met_pago` (`ID_Metodo`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`ID_HorarioApertura`) REFERENCES `horario` (`ID_Horario`),
  ADD CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`ID_HorarioClausura`) REFERENCES `horario` (`ID_Horario`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`ID_Barbero`) REFERENCES `barbero` (`ID_Barbero`),
  ADD CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicio` (`ID_Servicio`),
  ADD CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  ADD CONSTRAINT `turno_ibfk_4` FOREIGN KEY (`ID_Horario`) REFERENCES `horario` (`ID_Horario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
