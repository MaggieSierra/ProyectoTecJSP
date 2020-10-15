-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2020 a las 01:37:19
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_tec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id_carrera` int(11) NOT NULL,
  `clave_carrera` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `turno` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id_carrera`, `clave_carrera`, `nombre`, `turno`) VALUES
(1, 'ISX', 'INGENIERÍA EN SISTEMAS COMPUTACIONALES', 'MATUTINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `clave_horario` int(11) NOT NULL,
  `periodo` varchar(255) NOT NULL,
  `grupo` varchar(255) NOT NULL,
  `num_alumnos` int(11) NOT NULL,
  `aula` varchar(255) DEFAULT NULL,
  `lunes` varchar(255) DEFAULT NULL,
  `martes` varchar(255) DEFAULT NULL,
  `miercoles` varchar(255) DEFAULT NULL,
  `jueves` varchar(255) DEFAULT NULL,
  `viernes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_horario`, `id_usuario`, `id_materia`, `id_carrera`, `clave_horario`, `periodo`, `grupo`, `num_alumnos`, `aula`, `lunes`, `martes`, `miercoles`, `jueves`, `viernes`) VALUES
(1, 1, 1, 1, 4008, 'AGOSTO-DICIEMBRE/2020', 'B', 34, 'C-D2', NULL, '08:45-10:25', NULL, '08:45-10:25', '09:35-10:25'),
(2, 3, 1, 1, 4007, 'AGOSTO- DICIEMBRE/2020', 'A', 30, 'C-D1', '', '08:45-10:25', '', '08:45-10:25', '09:35-10:25'),
(3, 1, 1, 1, 4012, 'AGOSTO-DICIEMBRE/2020', 'F', 7, 'C-X3', '12:13-13:55', '', '12:13-13:55', '', '12:15-13:05'),
(5, 4, 1, 1, 4009, 'AGOSTO-DICIEMBRE/2020', 'C', 35, 'C-D3', '', '12:15-13:55', '', '12:15-13:55', '13:05-13:55'),
(6, 4, 1, 1, 4010, 'AGOSTO-DICIEMBRE/2020', 'D', 30, 'C-D4', '', '10:30-12:10', '', '10:30-12:10', '11:20-12:10'),
(8, 2, 1, 1, 4011, 'AGOSTO-DICIEMBRE/2020', 'E', 31, 'C-D5', '10:30-12:10', '', '10:30-12:10', '', '10:30-11:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `clave_materia` varchar(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `semestre` int(11) NOT NULL,
  `hrs_teoria` int(11) NOT NULL,
  `hrs_practica` int(11) NOT NULL,
  `creditos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `clave_materia`, `nombre`, `semestre`, `hrs_teoria`, `hrs_practica`, `creditos`) VALUES
(1, 'ACF0901', 'CÁLCULO DIFERENCIAL', 1, 3, 2, 5),
(2, 'AED1285', 'FUNDAMENTOS DE PROGRAMACIÓN', 1, 2, 3, 5),
(3, 'AEF1041', 'MATEMÁTICAS DISCRETAS', 1, 3, 2, 5),
(4, 'SCH1024', 'TALLER DE ADMINISTRACIÓN', 1, 1, 3, 4),
(5, 'ACA0907', 'TALLER DE ÉTICA', 1, 0, 4, 4),
(6, 'ACC0906', 'FUNDAMENTOS DE INVESTIGACIÓN', 1, 2, 2, 4),
(7, 'ACF0902', 'CÁLCULO INTEGRAL', 2, 3, 2, 5),
(8, 'AEC1058', 'QUÍMICA', 2, 2, 2, 4),
(9, 'AEC1008', 'CONTABILIDAD FINANCIERA', 2, 2, 2, 4),
(10, 'AEF1052', 'PROBABILIDAD Y ESTADISTICA', 2, 3, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Jefe'),
(2, 'Profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `clave_usuario` varchar(20) NOT NULL,
  `prefijo` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `primer_apellido` varchar(255) NOT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `hrs_trabajo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `clave_usuario`, `prefijo`, `nombre`, `primer_apellido`, `segundo_apellido`, `usuario`, `contraseña`, `hrs_trabajo`) VALUES
(1, 2, 'A1', 'ING.', 'JOSÉ FERNANDO', 'HERNÁNDEZ', 'RODRÍGUEZ', 'A01', '123', 10),
(2, 1, 'A25', 'ING.', 'ANTONIO', 'AGUILA', 'REYES', 'A25', '1234', 5),
(3, 2, 'A02', 'ING.', 'GUADALUPE EFRAIN', 'BERMUDEZ', '', 'A02', '123', 5),
(4, 2, 'A03', 'ING.', 'MARÍA MINERVA', 'SAUCEDO', 'TORRES', 'A03', '123', 10),
(5, 2, 'A04', 'ING.', 'JOSE GERARDO', 'CARPIO', 'FLORES', 'A04', '123', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_usuarios` (`id_usuario`),
  ADD KEY `id_materias` (`id_materia`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
