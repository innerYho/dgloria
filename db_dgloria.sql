-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-11-2024 a las 02:53:13
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_dgloria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_agendamiento`
--

CREATE TABLE `tbl_agendamiento` (
  `AGE_ID_AGENDAMIENTO` int(6) NOT NULL,
  `AGE_ID_ASESOR_FK` int(5) NOT NULL,
  `AGE_ID_ASESOR_COLABORADOR` int(5) DEFAULT NULL,
  `AGE_ID_CLIENTE_FK` int(5) NOT NULL,
  `AGE_SEDE` int(2) NOT NULL,
  `AGE_FECHA_AGENDAMIENTO` datetime NOT NULL,
  `AGE_Asistencia` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `FCT_ID_FACTURA` int(9) NOT NULL,
  `FCT_ID_SEDE_PRODUCTO_FK` int(9) NOT NULL,
  `FCT_ID_AGENDAMIENTO_FK` int(9) NOT NULL,
  `FCT_FECHA_CREADO` datetime NOT NULL,
  `FCT_FECHA_ACTUALIZADO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `PRO_ID_PRODUCTO` int(6) NOT NULL,
  `PRO_MARCA` int(2) NOT NULL,
  `PRO_NOMBRE_PRODUCTO` varchar(50) NOT NULL,
  `PRO_PRECIO_UNITARIO` float NOT NULL,
  `PRO_CODIGO_BARRA` varchar(14) DEFAULT NULL,
  `PRO_PRECIO_PROVEEDOR` float NOT NULL,
  `PRO_DESCRIPCION_PRODUCTO` varchar(300) NOT NULL,
  `PRO_PRESENTACION` varchar(10) NOT NULL,
  `PRO_FECHA_CREADO` datetime NOT NULL,
  `PRO_FECHA_ACTUALIZADO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `ROL_ID_ROL` int(1) NOT NULL,
  `ROL_NOMBRE_ROL` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sede`
--

CREATE TABLE `tbl_sede` (
  `SED_ID_SEDE` int(6) NOT NULL,
  `SED_NOMBRE_SEDE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sede_producto`
--

CREATE TABLE `tbl_sede_producto` (
  `SDPR_ID_SEDE_PRODUCTO` int(6) NOT NULL,
  `SDPR_ID_PRODUCTO_FK` int(6) NOT NULL,
  `SDPR_ID_SEDE_FK` int(6) NOT NULL,
  `SDPR_STOCK` int(20) NOT NULL,
  `SDPR_FECHA_CREADO` datetime DEFAULT NULL,
  `SDPR_FECHA_ACTUALIZADO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `USU_ID_USUARIO` int(6) NOT NULL,
  `USU_APODO` varchar(30) DEFAULT NULL,
  `USU_PRIMER_NOMBRE` varchar(30) NOT NULL,
  `USU_SEGUNDO_NOMBRE` varchar(30) DEFAULT NULL,
  `USU_PRIMER_APELLIDO` varchar(30) NOT NULL,
  `USU_SEGUNDO_APELLIDO` varchar(30) DEFAULT NULL,
  `USU_PASSWORD` varchar(30) NOT NULL,
  `USU_EMAIL` varchar(40) NOT NULL,
  `USU_FECHA_NACIMIENTO` date NOT NULL,
  `USU_CELULAR` int(10) DEFAULT NULL,
  `USU_NUMERO_DOCUMENTO` int(10) NOT NULL,
  `USU_SEDE` int(2) NOT NULL,
  `USU_IMG` blob,
  `USU_STATUS` varchar(8) NOT NULL DEFAULT 'INACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usurol`
--

CREATE TABLE `tbl_usurol` (
  `USRL_ID_USUARIOROL` int(5) NOT NULL,
  `USRL_ID_ROL_FK` int(2) NOT NULL,
  `USRL_ID_USUARIO_FK` int(11) NOT NULL,
  `USRL_FECHA_INGRESO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_agendamiento`
--
ALTER TABLE `tbl_agendamiento`
  ADD PRIMARY KEY (`AGE_ID_AGENDAMIENTO`),
  ADD KEY `AGE_ID_ASESOR_FK_idx` (`AGE_ID_ASESOR_FK`);

--
-- Indices de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`FCT_ID_FACTURA`),
  ADD KEY `FCT_FACTURA_idx` (`FCT_ID_SEDE_PRODUCTO_FK`),
  ADD KEY `FCT_ID_AGENDAMIENTO` (`FCT_ID_AGENDAMIENTO_FK`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`PRO_ID_PRODUCTO`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`ROL_ID_ROL`);

--
-- Indices de la tabla `tbl_sede`
--
ALTER TABLE `tbl_sede`
  ADD PRIMARY KEY (`SED_ID_SEDE`);

--
-- Indices de la tabla `tbl_sede_producto`
--
ALTER TABLE `tbl_sede_producto`
  ADD PRIMARY KEY (`SDPR_ID_SEDE_PRODUCTO`),
  ADD KEY `SDPR_SEDE_PRODUCTO_idx` (`SDPR_ID_PRODUCTO_FK`),
  ADD KEY `SDPR_ID_SEDE` (`SDPR_ID_SEDE_FK`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`USU_ID_USUARIO`);

--
-- Indices de la tabla `tbl_usurol`
--
ALTER TABLE `tbl_usurol`
  ADD PRIMARY KEY (`USRL_ID_USUARIOROL`),
  ADD KEY `USRL_USU_ROL_idx` (`USRL_ID_ROL_FK`),
  ADD KEY `USRL_ID_USUARIO` (`USRL_ID_USUARIO_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_agendamiento`
--
ALTER TABLE `tbl_agendamiento`
  MODIFY `AGE_ID_AGENDAMIENTO` int(6) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_agendamiento`
--
ALTER TABLE `tbl_agendamiento`
  ADD CONSTRAINT `AGE_ID_ASESOR` FOREIGN KEY (`AGE_ID_ASESOR_FK`) REFERENCES `tbl_usuario` (`USU_ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD CONSTRAINT `FCT_ID_AGENDAMIENTO` FOREIGN KEY (`FCT_ID_AGENDAMIENTO_FK`) REFERENCES `tbl_agendamiento` (`AGE_ID_AGENDAMIENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FCT_ID_SEDE_PRODUCTO` FOREIGN KEY (`FCT_ID_SEDE_PRODUCTO_FK`) REFERENCES `tbl_sede_producto` (`SDPR_ID_SEDE_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_sede_producto`
--
ALTER TABLE `tbl_sede_producto`
  ADD CONSTRAINT `SDPR_ID_PRODUCTO` FOREIGN KEY (`SDPR_ID_PRODUCTO_FK`) REFERENCES `tbl_producto` (`PRO_ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `SDPR_ID_SEDE` FOREIGN KEY (`SDPR_ID_SEDE_FK`) REFERENCES `tbl_sede` (`SED_ID_SEDE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usurol`
--
ALTER TABLE `tbl_usurol`
  ADD CONSTRAINT `USRL_ID_ROL` FOREIGN KEY (`USRL_ID_ROL_FK`) REFERENCES `tbl_roles` (`ROL_ID_ROL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `USRL_ID_USUARIO` FOREIGN KEY (`USRL_ID_USUARIO_FK`) REFERENCES `tbl_usuario` (`USU_ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
