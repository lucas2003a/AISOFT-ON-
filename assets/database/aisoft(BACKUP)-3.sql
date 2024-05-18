-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2024 a las 11:48:46
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
-- Base de datos: `aisoft2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `idactivo` int(11) NOT NULL,
  `idproyecto` int(11) NOT NULL,
  `tipo_activo` varchar(10) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'SIN VENDER',
  `sublote` tinyint(4) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `moneda_venta` varchar(10) NOT NULL,
  `area_terreno` decimal(5,2) NOT NULL,
  `zcomunes_porcent` tinyint(4) DEFAULT NULL,
  `partida_elect` varchar(100) NOT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `perimetro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"clave" :[""], "valor":[""]}' CHECK (json_valid(`perimetro`)),
  `det_casa` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"clave" :[""], "valor":[""]}' CHECK (json_valid(`det_casa`)),
  `precio_venta` decimal(8,2) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `tipo_persona` varchar(10) NOT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `documento_tipo` varchar(20) NOT NULL,
  `documento_nro` varchar(12) NOT NULL,
  `estado_civil` varchar(20) DEFAULT NULL,
  `razon_social` varchar(60) DEFAULT NULL,
  `representante_legal` varchar(80) DEFAULT NULL,
  `documento_t_representante` varchar(20) DEFAULT NULL,
  `documento_nro_representante` varchar(12) DEFAULT NULL,
  `partida_elect` varchar(100) DEFAULT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constructora`
--

CREATE TABLE `constructora` (
  `idconstructora` int(11) NOT NULL,
  `razon_social` varchar(60) NOT NULL,
  `ruc` char(11) NOT NULL,
  `partida_elect` varchar(60) NOT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamento` int(11) NOT NULL,
  `departamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `iddireccion` int(11) NOT NULL,
  `idconstructora` int(11) NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `iddistrito` int(11) NOT NULL,
  `idprovincia` int(11) NOT NULL,
  `distrito` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metricas`
--

CREATE TABLE `metricas` (
  `idmetrica` int(11) NOT NULL,
  `idproyecto` int(11) NOT NULL,
  `l_vendidos` int(11) NOT NULL DEFAULT 0,
  `l_noVendidos` int(11) NOT NULL DEFAULT 0,
  `l_separados` int(11) NOT NULL DEFAULT 0,
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `modulo` varchar(60) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `provincia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `idproyecto` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `iddireccion` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `perimetro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"clave" :[""], "valor":[""]}' CHECK (json_valid(`perimetro`)),
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `idrepresentante` int(11) NOT NULL,
  `idconstructora` int(11) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `documento_tipo` varchar(20) NOT NULL,
  `documento_nro` varchar(12) NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `partida_elect` varchar(60) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `documento_tipo` varchar(20) NOT NULL,
  `documento_nro` varchar(12) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `contraseña` varchar(60) NOT NULL,
  `codigo` char(9) DEFAULT NULL,
  `idrol` int(11) NOT NULL,
  `iddireccion` int(11) NOT NULL,
  `partida_elect` varchar(60) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`idactivo`),
  ADD KEY `fk_idproyecto_lotes` (`idproyecto`),
  ADD KEY `fk_idusuario_lotes` (`idusuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `uk_documento_nro_cli` (`documento_nro`),
  ADD UNIQUE KEY `uk_documento_nro_representante_cli` (`documento_nro_representante`),
  ADD KEY `fk_iddistrito_cli` (`iddistrito`),
  ADD KEY `fk_idusuario_cli` (`idusuario`);

--
-- Indices de la tabla `constructora`
--
ALTER TABLE `constructora`
  ADD PRIMARY KEY (`idconstructora`),
  ADD UNIQUE KEY `uk_ruc_constructora` (`ruc`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamento`),
  ADD UNIQUE KEY `uk_departamento_deps` (`departamento`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`iddireccion`),
  ADD KEY `fk_idconstructora_direccs` (`idconstructora`),
  ADD KEY `fk_iddistrito_direccs` (`iddistrito`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`iddistrito`),
  ADD KEY `fk_idprovincia_distr` (`idprovincia`);

--
-- Indices de la tabla `metricas`
--
ALTER TABLE `metricas`
  ADD PRIMARY KEY (`idmetrica`),
  ADD KEY `fk_idproyecto_metr` (`idproyecto`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `fk_idrol_permis` (`idrol`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincia`),
  ADD KEY `fk_iddepartamento_provin` (`iddepartamento`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`idproyecto`),
  ADD UNIQUE KEY `uk_codigo_proyects` (`codigo`),
  ADD UNIQUE KEY `uk_denominacion_proyects` (`denominacion`),
  ADD KEY `fk_iddireccion_proyects` (`iddireccion`),
  ADD KEY `fk_iddistrito_proyects` (`iddistrito`),
  ADD KEY `fk_idusuario_proyects` (`idusuario`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`idrepresentante`),
  ADD UNIQUE KEY `uk_documento_nro_constructora` (`documento_nro`),
  ADD KEY `fk_idconstructora_rep` (`idconstructora`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `uk_rol_roles` (`rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `uk_documento_nro_usu` (`documento_nro`),
  ADD UNIQUE KEY `uk_correo_us` (`correo`),
  ADD KEY `fk_iddistrito_usu` (`iddistrito`),
  ADD KEY `fk_idrol_usu` (`idrol`),
  ADD KEY `fk_iddireccion_usu` (`iddireccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `idactivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `constructora`
--
ALTER TABLE `constructora`
  MODIFY `idconstructora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `iddireccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `iddistrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metricas`
--
ALTER TABLE `metricas`
  MODIFY `idmetrica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `fk_idproyecto_lotes` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`idproyecto`),
  ADD CONSTRAINT `fk_idusuario_lotes` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_iddistrito_cli` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`),
  ADD CONSTRAINT `fk_idusuario_cli` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `fk_idconstructora_direccs` FOREIGN KEY (`idconstructora`) REFERENCES `constructora` (`idconstructora`),
  ADD CONSTRAINT `fk_iddistrito_direccs` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`);

--
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `fk_idprovincia_distr` FOREIGN KEY (`idprovincia`) REFERENCES `provincias` (`idprovincia`);

--
-- Filtros para la tabla `metricas`
--
ALTER TABLE `metricas`
  ADD CONSTRAINT `fk_idproyecto_metr` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`idproyecto`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_idrol_permis` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`);

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `fk_iddepartamento_provin` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_iddireccion_proyects` FOREIGN KEY (`iddireccion`) REFERENCES `direcciones` (`iddireccion`),
  ADD CONSTRAINT `fk_iddistrito_proyects` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`),
  ADD CONSTRAINT `fk_idusuario_proyects` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `fk_idconstructora_rep` FOREIGN KEY (`idconstructora`) REFERENCES `constructora` (`idconstructora`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_iddireccion_usu` FOREIGN KEY (`iddireccion`) REFERENCES `direcciones` (`iddireccion`),
  ADD CONSTRAINT `fk_iddistrito_usu` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`),
  ADD CONSTRAINT `fk_idrol_usu` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
