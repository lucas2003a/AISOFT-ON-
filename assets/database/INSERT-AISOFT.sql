USE AISOFT;

-- constructora
INSERT INTO constructora(razon_social, ruc, partida_elect)
	VALUES
    ("A.I. F CONTRATISTAS GENERALES S.A.C","20494453003","11013804 del Registro de Personas Jurídicas de CHINCHA-ICA"),
    ("XYZ Construcciones S.A.C.", "12345678901", "78901234 del Registro de constructora de Arequipa"),
	("Inversiones TechCorp S.A.", "98765432109", "56789012 del Registro de constructora de Lima");
    
SELECT * FROM constructora;

-- PERSONAS 
INSERT INTO personas(nombres, apellidos, documento_tipo, documento_nro, estado_civil, iddistrito, direccion)
			VALUES
			('ISAIAS LATINEZ','BLAS GUEROVICH','DNI','11122233','Casado', 107,'AV LOS SAUCES'),
			('Juan Carlos', 'González Pérez', 'DNI', '11111111', 'Soltero', 1, 'Calle A 123'),
			('María José', 'Hernández López', 'DNI', '22222222', 'Casada', 2, 'Calle B 456'),
			('Pedro Luis', 'Díaz Martínez', 'DNI', '33333333', 'Divorciado', 3, 'Calle C 789'),	
			('Ana Sofía', 'López Sánchez', 'DNI', '44444444', 'Soltera', 4, 'Calle D 012'),
			('José María', 'Martínez Gómez', 'DNI', '55555555', 'Viuda', 5, 'Calle E 345'),
			('Luisa Elena', 'Gómez Rodríguez', 'DNI', '66666666', 'Casado', 6, 'Calle F 678'),
			('Jorge Pablo', 'Rodríguez García', 'DNI', '77777777', 'Soltera', 7, 'Calle G 901'),
			('Carlos Antonio', 'Fernández Martín', 'DNI', '88888888', 'Casado', 8, 'Calle H 234'),
			('María Carmen', 'Sánchez López', 'DNI', '99999999', 'Soltera', 9, 'Calle I 567'),
			('Francisco Javier', 'Gómez Rodríguez', 'DNI', '10101010', 'Divorciado', 10, 'Calle J 890'),
			('Elena Isabel', 'Díaz García', 'DNI', '11111112', 'Casado', 11, 'Calle K 111'),
			('Pedro Luis', 'Martínez López', 'DNI', '12121212', 'Soltera', 12, 'Calle L 222'),
			('María Isabel', 'García Pérez', 'DNI', '13131313', 'Casado', 13, 'Calle M 333'),
			('Antonio José', 'Hernández Martín', 'DNI', '14141414', 'Soltera', 14, 'Calle N 444'),
			('Juan Carlos', 'Pérez García', 'DNI', '12345678', 'Soltero', 1007, 'Av. Primavera 123'),
			('María Luisa', 'Gómez Fernández', 'DNI', '23456789', 'Casada', 1007, 'Calle Flores 456'),
			('Pedro José', 'Ramírez Sánchez', 'DNI', '34567890', 'Soltero', 1007, 'Jr. Libertad 789');

                
-- REPRESENTANTES
INSERT INTO representantes(idconstructora, nombres, apellidos, documento_tipo, documento_nro, iddistrito, direccion, partida_elect)
			VALUES(1, 'ISAIAS LATINEZ','BLAS GUEROVICH','DNI','11122233',107,'AV LOS SAUCES','PARTIDA ELECTRONICA NRO 1');
            
SELECT * FROM representantes;

-- DIRECCIONES
INSERT INTO direcciones(idconstructora, iddistrito, direccion, referencia)
			VALUES
				(1, 1007, "MZA. A LOTE. 06 URB. JULIO ARBOLEDA","A 1/2 CUADRA DE MAESTRO"),
                (1, 1009, "AV. LOS ALAMOS MZA. C LOTE. 25 URB. EL ROSAL","FRENTE AL PARQUE"),
				(1, 1010, "CALLE LOS GIRASOLES MZA. E LOTE. 10 URB. LAS MARGARITAS","A 200 METROS DE LA AVENIDA PRINCIPAL");
                
INSERT INTO direcciones(idconstructora, iddistrito, direccion, referencia)
			VALUES
				(2, 1008, "MZA. A LOTE. 06 URB. JULIO ARBOLEDA","A 1/2 CUADRA DE MAESTRO"),
                (2, 1010, "AV. LOS ALAMOS MZA. C LOTE. 25 URB. EL ROSAL","FRENTE AL PARQUE"),
				(2, 1011, "CALLE LOS GIRASOLES MZA. E LOTE. 10 URB. LAS MARGARITAS","A 200 METROS DE LA AVENIDA PRINCIPAL");                
                                
                
SELECT * FROM sedes;

-- ROLES
INSERT INTO roles(rol)
			VALUES
				("REPRESENTANTE DE VENTAS 1"),
                ("REPRESENTANTE DE VENTAS 2"),
                ("ADMINISTRADOR PRINCIPAL"),
                ("ADMINISTRADOR AASISTENTE"),
                ("ADMINISTRADOR SECUNDARIO"),
                ("VENDEDOR");

SELECT * FROM roles;

-- PERMISOS
INSERT INTO permisos(idrol, modulo)
			VALUES (1, 'LISTAR-activos'),
					(1, 'EDITAR-CLIENTES'),
					(1, 'CREAR-VENTAS'),
					(1, 'ELIMINAR-PROYECTOS'),

			-- Representante de ventas 2
				(2, 'LISTAR-PROYECTOS'),
				(2, 'EDITAR-activos'),
				(2, 'CREAR-CLIENTES'),
				(2, 'ELIMINAR-VENTAS'),

			-- Administrador principal
				(3, 'LISTAR-CLIENTES'),
				(3, 'EDITAR-VENTAS'),
				(3, 'CREAR-activos'),
				(3, 'ELIMINAR-PROYECTOS'),

			-- Administrador asistente
				(4, 'LISTAR-VENTAS'),
				(4, 'EDITAR-PROYECTOS'),
				(4, 'CREAR-CLIENTES'),
				(4, 'ELIMINAR-activos'),

			-- Administrador secundario
				(5, 'LISTAR-PROYECTOS'),
				(5, 'EDITAR-activos'),
				(5, 'CREAR-VENTAS'),
				(5, 'ELIMINAR-CLIENTES'),

			-- Vendedor
				(6, 'LISTAR-activos'),
				(6, 'EDITAR-CLIENTES'),
				(6, 'CREAR-VENTAS'),
				(6, 'ELIMINAR-PROYECTOS');

SELECT * FROM permisos;

-- USUARIOS
INSERT INTO usuarios (idpersona, correo, contraseña, idrol, idsede)
VALUES
	-- idsede 1 => (1, 1007, "MZA. A LOTE. 06 URB. JULIO ARBOLEDA","A 1/2 CUADRA DE MAESTRO")
	(3,'juancarlos@gmail.com', 'contraseña1', 1, 1),
	(4,'mariajose@gmail.com', 'contraseña2', 2, 1),
	(5,'pedroluis@gmail.com', 'contraseña3', 3, 1),
	(6,'anasofia@gmail.com', 'contraseña4', 4, 1),
	(7,'josemaria@gmail.com', 'contraseña5', 5, 1),
	(8,'luisaelena@gmail.com', 'contraseña6', 6, 1),
	(9,'jorgepablo@gmail.com', 'contraseña7', 6, 1),
	(10,'carlosantonio@gmail.com', 'contraseña8', 1, 2),
	(11,'mariacarmen@gmail.com', 'contraseña9', 2, 2),
	(12,'franciscojavier@gmail.com', 'contraseña10', 3, 2),
	(13,'elenaisabel@gmail.com', 'contraseña11', 4, 2),
	(14,'pedroluis2@gmail.com', 'contraseña12', 5, 2),
	(15,'mariaisabel@gmail.com', 'contraseña13', 6, 2),
	(16,'antoniojose@gmail.com', 'contraseña14', 6, 2);

SELECT * FROM usuarios;

-- PROYECTOS
INSERT INTO proyectos(idsede, codigo, denominacion, iddistrito,direccion, idusuario)
			VALUES
				(1, 'A-12 SAN BLAS', 'RESIDENCIAL SAN BLAS', 1007, 'Dirección A-12 SAN BLAS', 1),
				(1, 'A-17 SAN PEDRO', 'RESIDENCIAL SAN PABLO', 1007, 'Dirección A-17 SAN PEDRO', 2),
				(1, 'A-13 Santo Domingo', 'RESIDENCIAL Santo Domingo', 1007, 'Dirección Santo Domingo', 3),
				(1, 'A-14 Centenario II', 'RESIDENCIAL Centenario II', 1007, 'Dirección Centenario II', 4),
				(1, 'A-15 Kalea Playa', 'Kalea Playa', 1007, 'Dirección Kalea Playa', 5);
                

                
SELECT * FROM PROYECTOS;
SELECT * FROM metricas;

-- CATEGORIA COSTOS
INSERT INTO categoria_costos(categoria_costo)
			VALUES("COSTO DIRECTO"),("COSTO INDIRECTO");
SELECT * FROM categoria_costos;

-- SUBCATEGORIA COSTOS
INSERT INTO subcategoria_costos(idcategoria_costo,subcategoria_costo)
			VALUES(1,"FERRETERIA"),
					(1,"ACCESORIOS"),
                    (1,"LADRILLOS"),
                    (1,"AGREGADOS"),
                    (1,"ACCESORIOS DE LUZ"),
                    (1,"ACCESORIOS DE BAÑO"),
                    (1,"ACCESORIOS DE DESAGUE"),
                    (1,"ACCESORIOS DE AGUA"),
                    (1,"CERÁMICO"),
                    (1,"ACABADOS EN SECOS"),
                    (1,"MANO DE OBRA");
                    
INSERT INTO subcategoria_costos(idcategoria_costo,subcategoria_costo)
			VALUES
					(2,"GASTOS FINANCIEROS"),
                    (2,"COSTOS DE HABILITACION TERRENO - COSTOS DIRECTOS"),
                    (2,"COSTO DE PROYECTO Y EJECUCION DE AGUA DESAGUE Y ELECTRICIDAD"),
                    (2,"COSTOS ADMINISTRATIVOS DIRECTO"),
                    (2,"IMPUESTOS");

-- MARCAS
INSERT INTO marcas (marca) VALUES
('Pavco'),
('APU'),
('Majestad'),
('Bticino'),
('3M'),
('Kars'),
('Humbold'),
('Roca'),
('Helvex'),
('Vainsa'),
('Trébol'),
('Acindar'),
('Duratop'),
('Eternit'),
('Sodimac'),
('Tramontina'),
('Cifial'),
('FV'),
('Rheem'),
('Amanco'),
('Sigma'),
('Nibsa'),
('Urrea'),
('Gris'),
('Vetrolux'),
('Jofel'),
('Tigre');

SELECT * FROM marcas;

INSERT INTO unidades_medida (unidad_medida) VALUES
('unidad'),
('kg'),
('ml'),
('pz'),
('metro'),
('litro'),
('tonelada'),
('metro lineal'),
('metro cuadrado'),
('metro cúbico'),
('pieza'),
('par'),
('juego'),
('paquete'),
('docena'),
('centímetro'),
('milímetro'),
('libra'),
('galón'),
('litro por segundo'),
('barril'),
('tonelada métrica');

SELECT * FROM unidades_medida;
-- MATERIALES
INSERT INTO materiales (idmarca, material, idunidad_medida) VALUES
(1, 'Tubo PVC', 1),
(2, 'Cemento APU', 2),
(3, 'Pintura Látex', 3),
(4, 'Interruptor', 1),
(5, 'Cinta aislante', 1),
(6, 'Bomba de agua', 4),
(7, 'Tanque elevado', 4),
(8, 'Puerta de madera', 1),
(9, 'Grifería', 1),
(10, 'Inodoro', 1),
(11, 'Ladrillo', 5),
(12, 'Arena', 5),
(13, 'Piedra chancada', 5),
(14, 'Alambre', 6),
(15, 'Disco para fierro', 6),
(16, 'Tubo desagüe', 7),
(17, 'Tubo agua', 7),
(18, 'Fragua', 1),
(19, 'Lija', 1),
(20, 'Hoja de Sierra', 1),
(21, 'Tornillos', 6),
(22, 'Clavos', 6),
(23, 'Lámpara LED', 1),
(24, 'Focos', 1),
(25, 'Cable eléctrico', 6),
(26, 'Tapa ciega', 6),
(27, 'Lija esmeril', 1),
(1, 'Caja eléctrica', 1),
(2, 'Registro roscado', 6),
(3, 'Sumidero', 6),
(4, 'Tapa de desagüe', 6),
(5, 'Tubería de agua', 7),
(6, 'Tubo corrugado', 7),
(7, 'Lavabo', 1),
(8, 'Lavadero', 1),
(9, 'Tubería de luz', 7),
(10, 'Caja de empalme', 6),
(11, 'Conector', 6),
(12, 'Enchufe', 6),
(13, 'Revestimiento cerámico', 8),
(14, 'Puertas contraplacadas', 1),
(15, 'Tubo de plástico', 7);

SELECT * FROM materiales;

-- TIPOS DE MATERIALES
INSERT INTO tipos_materiales (idmarca, tipo_material, precio_unitario, idunidad_medida) VALUES
(1, 'Tubo PVC 1"', 25.00, 1),
(1, 'Tubo PVC 2"', 35.00, 1),
(2, 'Bolsa de Cemento APU 50kg', 26.00, 2),
(3, 'Gallón de Pintura Látex', 65.00, 3),
(4, 'Interruptor simple', 7.50, 4),
(5, 'Rollo de Cinta aislante', 5.00, 5),
(6, 'Bomba de agua 1/2 Hp', 159.90, 4),
(7, 'Tanque elevado 250 litros', 390.00, 4),
(8, 'Puerta de madera maciza', 1150.00, 1),
(9, 'Grifería monomando', 180.00, 6),
(10, 'Inodoro con tapa', 381.90, 1),
(11, 'Ladrillo 18 huecos', 0.72, 7),
(12, 'Bolsa de Arena fina', 94.40, 8),
(13, 'Metro cúbico de Piedra chancada', 61.36, 9),
(14, 'Rollo de Alambre N° 16', 6.50, 10),
(15, 'Disco para cortar fierro de 7"', 8.50, 11),
(16, 'Tubo desagüe 4"', 40.50, 12),
(17, 'Tubo agua 3/4"', 6.40, 13),
(18, 'Bolsa de Fragua para cerámica', 9.60, 14),
(19, 'Hoja de Sierra para madera', 7.00, 15),
(20, 'Paquete de Tornillos', 6.50, 16),
(21, 'Paquete de Clavos 2"', 6.50, 16),
(22, 'Lámpara LED 9W', 6.00, 17),
(23, 'Paquete de Focos LED', 6.00, 18),
(24, 'Metro de Cable eléctrico N° 14', 2.00, 19),
(25, 'Tapa ciega rectangular', 1.00, 20),
(26, 'Lija esmeril asa N° 40', 2.50, 21),
(27, 'Caja eléctrica octogonal', 2.50, 22),
(1, 'Registro roscado de 4"', 13.00, 23),
(2, 'Sumidero de 2"', 5.00, 24),
(3, 'Tapa de desagüe roscada', 5.00, 20),
(4, 'Metro de Tubería de agua PVC 1"', 28.50, 25),
(5, 'Tubo corrugado de 3 metros', 1.40, 26),
(6, 'Lavabo ovalado', 205.00, 27),
(7, 'Lavadero de cocina con accesorios', 81.50, 28),
(8, 'Tubería de luz de 3/4"', 6.60, 29),
(9, 'Caja de empalme eléctrico', 2.50, 30),
(10, 'Conector para cables eléctricos', 2.40, 31),
(11, 'Enchufe doble', 7.50, 32),
(12, 'Revestimiento cerámico 60x60', 70.00, 33),
(13, 'Puertas contraplacadas pintadas', 325.00, 34),
(14, 'Tubo de plástico 4"', 40.50, 35);

-- TIPOS DE MATERIALES
INSERT INTO tipos_materiales (idmarca, tipo_material, precio_unitario) VALUES
(1, 'Tubo PVC 1"', 25.00),
(1, 'Tubo PVC 2"', 35.00),
(2, 'Bolsa de Cemento APU 50kg', 26.00),
(3, 'Gallón de Pintura Látex', 65.00),
(4, 'Interruptor simple', 7.50),
(5, 'Rollo de Cinta aislante', 5.00),
(6, 'Bomba de agua 1/2 Hp', 159.90),
(7, 'Tanque elevado 250 litros', 390.00),
(8, 'Puerta de madera maciza', 1150.00),
(9, 'Grifería monomando', 180.00),
(10, 'Inodoro con tapa', 381.90),
(11, 'Ladrillo 18 huecos', 0.72),
(12, 'Bolsa de Arena fina', 94.40),
(13, 'Metro cúbico de Piedra chancada', 61.36),
(14, 'Rollo de Alambre N° 16', 6.50),
(15, 'Disco para cortar fierro de 7"', 8.50),
(16, 'Tubo desagüe 4"', 40.50),
(17, 'Tubo agua 3/4"', 6.40),
(18, 'Bolsa de Fragua para cerámica', 9.60),
(19, 'Hoja de Sierra para madera', 7.00),
(20, 'Paquete de Tornillos', 6.50),
(21, 'Paquete de Clavos 2"', 6.50),
(22, 'Lámpara LED 9W', 6.00),
(23, 'Paquete de Focos LED', 6.00),
(24, 'Metro de Cable eléctrico N° 14', 2.00),
(25, 'Tapa ciega rectangular', 1.00),
(26, 'Lija esmeril asa N° 40', 2.50),
(27, 'Caja eléctrica octogonal', 2.50),
(1, 'Registro roscado de 4"', 13.00),
(2, 'Sumidero de 2"', 5.00),
(3, 'Tapa de desagüe roscada', 5.00),
(4, 'Metro de Tubería de agua PVC 1"', 28.50),
(5, 'Tubo corrugado de 3 metros', 1.40),
(6, 'Lavabo ovalado', 205.00),
(7, 'Lavadero de cocina con accesorios', 81.50),
(8, 'Tubería de luz de 3/4"', 6.60),
(9, 'Caja de empalme eléctrico', 2.50),
(10, 'Conector para cables eléctricos', 2.40),
(11, 'Enchufe doble', 7.50),
(12, 'Revestimiento cerámico 60x60', 70.00),
(13, 'Puertas contraplacadas pintadas', 325.00),
(14, 'Tubo de plástico 4"', 40.50);

-- PRESUPUESTOS
INSERT INTO presupuestos (codigo, modelo, idusuario) VALUES
('PRES-001', 'Casa Moderna', 1),
('PRES-002', 'Oficina Ejecutiva', 2),
('PRES-003', 'Apartamento Minimalista', 3),
('PRES-004', 'Chalet Clásico', 4),
('PRES-005', 'Estudio Contemporáneo', 5);

SELECT * FROM presupuestos;

INSERT INTO detalle_costos (idpresupuesto, idsubcategoria_costo, idtipo_material, detalle, cantidad, precio_unitario, idusuario) VALUES
(1, 1, 1, 'Tubo PVC 1"', 100, 30.00, 1),
(1, 2, 2, 'Tubo PVC 2"', 50, 35.00, 1),
(1, 3, 3, 'Bolsa de Cemento APU 50kg', 20, 26.00, 1),
(1, 4, 4, 'Gallón de Pintura Látex', 10, 65.00, 1),
(1, 5, 5, 'Interruptor simple', 15, 7.50, 1),
(1, 6, 6, 'Bomba de agua 1/2 Hp', 2, 159.90, 1),
(1, 6, 7, 'Tanque elevado 250 litros', 1, 390.00, 1),
(1, 6, 8, 'Puerta de madera maciza', 1, 1150.00, 1),
(1, 6, 9, 'Grifería monomando', 1, 180.00, 1),
(1, 6, 10, 'Inodoro con tapa', 1, 381.90, 1),
(1, 6, 11, 'Ladrillo 18 huecos', 1, 0.72, 1),
(1, 6, 12, 'Bolsa de Arena fina', 1, 94.40, 1),
(1, 6, 13, 'Metro cúbico de Piedra chancada', 1, 61.36, 1),
(1, 6, 14, 'Rollo de Alambre N° 16', 1, 6.50, 1),
(1, 6, 15, 'Disco para cortar fierro de 7"', 1, 8.50, 1),
(1, 6, 16, 'Tubo desagüe 4"', 1, 40.50, 1),
(1, 6, 17, 'Tubo agua 3/4"', 1, 6.40, 1),
(1, 6, 18, 'Bolsa de Fragua para cerámica', 1, 9.60, 1),
(1, 6, 19, 'Hoja de Sierra para madera', 1, 7.00, 1),
(1, 6, 20, 'Paquete de Tornillos', 1, 6.50, 1),
(1, 6, 21, 'Paquete de Clavos 2"', 1, 6.50, 1),
(1, 6, 22, 'Lámpara LED 9W', 1, 6.00, 1),
(1, 6, 23, 'Paquete de Focos LED', 1, 6.00, 1),
(1, 6, 24, 'Metro de Cable eléctrico N° 14', 1, 2.00, 1),
(1, 6, 25, 'Tapa ciega rectangular', 1, 1.00, 1),
(1, 6, 26, 'Lija esmeril asa N° 40', 1, 2.50, 1),
(1, 6, 27, 'Caja eléctrica octogonal', 1, 2.50, 1),
(2, 1, 1, 'Tubo PVC 1"', 80, 30.00, 1),
(2, 2, 2, 'Tubo PVC 2"', 40, 35.00, 1),
(2, 3, 3, 'Bolsa de Cemento APU 50kg', 15, 26.00, 1),
(2, 4, 4, 'Gallón de Pintura Látex', 8, 65.00, 1),
(2, 5, 5, 'Interruptor simple', 10, 7.50, 1),
(2, 6, 6, 'Bomba de agua 1/2 Hp', 1, 159.90, 1),
(2, 6, 7, 'Tanque elevado 250 litros', 1, 390.00, 1),
(2, 6, 8, 'Puerta de madera maciza', 1, 1150.00, 1),
(2, 6, 9, 'Grifería monomando', 1, 180.00, 1),
(2, 6, 10, 'Inodoro con tapa', 1, 381.90, 1),
(2, 6, 11, 'Ladrillo 18 huecos', 1, 0.72, 1),
(2, 6, 12, 'Bolsa de Arena fina', 1, 94.40, 1),
(2, 6, 13, 'Metro cúbico de Piedra chancada', 1, 61.36, 1),
(2, 6, 14, 'Rollo de Alambre N° 16', 1, 6.50, 1),
(2, 6, 15, 'Disco para cortar fierro de 7"', 1, 8.50, 1),
(2, 6, 16, 'Tubo desagüe 4"', 1, 40.50, 1),
(2, 6, 17, 'Tubo agua 3/4"', 1, 6.40, 1),
(2, 6, 18, 'Bolsa de Fragua para cerámica', 1, 9.60, 1),
(2, 6, 19, 'Hoja de Sierra para madera', 1, 7.00, 1),
(2, 6, 20, 'Paquete de Tornillos', 1, 6.50, 1),
(2, 6, 21, 'Paquete de Clavos 2"', 1, 6.50, 1),
(2, 6, 22, 'Lámpara LED 9W', 1, 6.00, 1),
(2, 6, 23, 'Paquete de Focos LED', 1, 6.00, 1),
(2, 6, 24, 'Metro de Cable eléctrico N° 14', 1, 2.00, 1),
(2, 6, 25, 'Tapa ciega rectangular', 1, 1.00, 1),
(2, 6, 26, 'Lija esmeril asa N° 40', 1, 2.50, 1);

INSERT INTO detalle_costos (idpresupuesto, idsubcategoria_costo, idtipo_material, detalle, cantidad, precio_unitario, idusuario) VALUES
(1, 1, 1, 'Tubo PVC 1"', 100, 30.00, 1),
(1, 2, 2, 'Tubo PVC 2"', 50, 35.00, 1),
(1, 3, 3, 'Bolsa de Cemento APU 50kg', 20, 26.00, 1),
(1, 4, 4, 'Gallón de Pintura Látex', 10, 65.00, 1),
(1, 5, 5, 'Interruptor simple', 15, 7.50, 1),
(1, 6, 6, 'Bomba de agua 1/2 Hp', 2, 159.90, 1),
(1, 6, 7, 'Tanque elevado 250 litros', 1, 390.00, 1),
(1, 6, 8, 'Puerta de madera maciza', 1, 1150.00, 1),
(1, 6, 9, 'Grifería monomando', 1, 180.00, 1),
(1, 6, 10, 'Inodoro con tapa', 1, 381.90, 1),
(1, 6, 11, 'Ladrillo 18 huecos', 1, 0.72, 1),
(1, 6, 12, 'Bolsa de Arena fina', 1, 94.40, 1),
(1, 6, 13, 'Metro cúbico de Piedra chancada', 1, 61.36, 1),
(1, 6, 14, 'Rollo de Alambre N° 16', 1, 6.50, 1),
(1, 6, 15, 'Disco para cortar fierro de 7"', 1, 8.50, 1),
(1, 6, 16, 'Tubo desagüe 4"', 1, 40.50, 1),
(1, 6, 17, 'Tubo agua 3/4"', 1, 6.40, 1),
(1, 6, 18, 'Bolsa de Fragua para cerámica', 1, 9.60, 1),
(1, 6, 19, 'Hoja de Sierra para madera', 1, 7.00, 1),
(1, 6, 20, 'Paquete de Tornillos', 1, 6.50, 1),
(1, 6, 21, 'Paquete de Clavos 2"', 1, 6.50, 1),
(1, 6, 22, 'Lámpara LED 9W', 1, 6.00, 1),
(1, 6, 23, 'Paquete de Focos LED', 1, 6.00, 1),
(1, 6, 24, 'Metro de Cable eléctrico N° 14', 1, 2.00, 1),
(1, 6, 25, 'Tapa ciega rectangular', 1, 1.00, 1),
(1, 6, 26, 'Lija esmeril asa N° 40', 1, 2.50, 1),
(1, 6, 27, 'Caja eléctrica octogonal', 1, 2.50, 1),
(2, 1, 1, 'Tubo PVC 1"', 80, 30.00, 1),
(2, 2, 2, 'Tubo PVC 2"', 40, 35.00, 1),
(2, 3, 3, 'Bolsa de Cemento APU 50kg', 15, 26.00, 1),
(2, 4, 4, 'Gallón de Pintura Látex', 8, 65.00, 1),
(2, 5, 5, 'Interruptor simple', 10, 7.50, 1),
(2, 6, 6, 'Bomba de agua 1/2 Hp', 1, 159.90, 1),
(2, 6, 7, 'Tanque elevado 250 litros', 1, 390.00, 1),
(2, 6, 8, 'Puerta de madera maciza', 1, 1150.00, 1),
(2, 6, 9, 'Grifería monomando', 1, 180.00, 1),
(2, 6, 10, 'Inodoro con tapa', 1, 381.90, 1),
(2, 6, 11, 'Ladrillo 18 huecos', 1, 0.72, 1),
(2, 6, 12, 'Bolsa de Arena fina', 1, 94.40, 1),
(2, 6, 13, 'Metro cúbico de Piedra chancada', 1, 61.36, 1),
(2, 6, 14, 'Rollo de Alambre N° 16', 1, 6.50, 1),
(2, 6, 15, 'Disco para cortar fierro de 7"', 1, 8.50, 1),
(2, 6, 16, 'Tubo desagüe 4"', 1, 40.50, 1),
(2, 6, 17, 'Tubo agua 3/4"', 1, 6.40, 1),
(2, 6, 18, 'Bolsa de Fragua para cerámica', 1, 9.60, 1),
(2, 6, 19, 'Hoja de Sierra para madera', 1, 7.00, 1),
(2, 6, 20, 'Paquete de Tornillos', 1, 6.50, 1),
(2, 6, 21, 'Paquete de Clavos 2"', 1, 6.50, 1),
(2, 6, 22, 'Lámpara LED 9W', 1, 6.00, 1),
(2, 6, 23, 'Paquete de Focos LED', 1, 6.00, 1),
(2, 6, 24, 'Metro de Cable eléctrico N° 14', 1, 2.00, 1),
(2, 6, 25, 'Tapa ciega rectangular', 1, 1.00, 1),
(2, 6, 26, 'Lija esmeril asa N° 40', 1, 2.50, 1);

SELECT * FROM detalle_costos;


-- activos
INSERT INTO activos (idproyecto, tipo_activo, sublote, direccion, moneda_venta, area_terreno, partida_elect, propietario_lote, precio_lote, create_at, idusuario)
VALUES
	(1, 'lote', 1, 'Urbanización Alpha', 'USD', 300.00, 'Partida 001','A.I.F', 80000.00, CURDATE(), 1),
	(2, 'lote', 1, 'Urbanización Gamma', 'USD', 250.00, 'Partida 003','A.I.F', 100000.00, CURDATE(), 1),
	(1, 'lote', 3, 'Urbanización Epsilon', 'USD', 350.00, 'Partida 005','A.I.F', 90000.00, CURDATE(), 1),
	(3, 'lote', 2, 'Urbanización Eta', 'USD', 400.00, 'Partida 007','A.I.F', 120000.00, CURDATE(), 3),
	(2, 'lote', 3, 'Urbanización Iota', 'USD', 280.00, 'Partida 009','A.I.F', 110000.00, CURDATE(), 2),
	(3, 'lote', 5, 'Urbanización Lambda', 'USD', 320.00, 'Partida 011','A.I.F', 95000.00, CURDATE(), 2),
	(4, 'lote', 1, 'Urbanización Nu', 'USD', 300.00, 'Partida 013', 'A.I.F',85000.00, CURDATE(), 2),
	(4, 'lote', 3, 'Urbanización Omicron', 'USD', 380.00, 'Partida 015','A.I.F', 110000.00, CURDATE(), 1),
	(1, 'lote', 7, 'Urbanización Rho', 'USD', 420.00, 'Partida 017','A.I.F', 105000.00, CURDATE(), 3),
	(2,	'lote', 9, 'Urbanización Tau', 'USD', 450.00, 'Partida 019','A.I.F', 115000.00, CURDATE(), 3),
	(3, 'lote', 11, 'Urbanización Phi', 'USD', 480.00, 'Partida 021','A.I.F', 100000.00, CURDATE(), 2),
	(4, 'lote', 13, 'Urbanización Psi', 'USD', 500.00, 'Partida 023','A.I.F', 120000.00, CURDATE(), 2),
	(1, 'lote', 15, 'Urbanización Beta', 'USD', 300.00, 'Partida 025','A.I.F', 90000.00, CURDATE(), 2),
    (1, 'lote', 2, 'Urbanización Zeta', 'USD', 280.00, 'Partida 027','A.I.F', 95000.00, CURDATE(), 1),
    (1, 'lote', 4, 'Urbanización Kappa', 'USD', 320.00, 'Partida 029','A.I.F', 110000.00, CURDATE(), 2),
    (1, 'lote', 6, 'Urbanización Sigma', 'USD', 300.00, 'Partida 031','A.I.F', 85000.00, CURDATE(), 2),
    (1, 'lote', 8, 'Urbanización Upsilon', 'USD', 380.00, 'Partida 033','A.I.F', 120000.00, CURDATE(), 1),
    (1, 'lote', 10, 'Urbanización Omega', 'USD', 420.00, 'Partida 035','A.I.F', 105000.00, CURDATE(), 3),
    (1, 'lote', 12, 'Urbanización Delta', 'USD', 450.00, 'Partida 037','A.I.F', 115000.00, CURDATE(), 3),
    (1, 'lote', 14, 'Urbanización Gamma', 'USD', 480.00, 'Partida 039','A.I.F', 100000.00, CURDATE(), 2),
    (1, 'lote', 16, 'Urbanización Epsilon', 'USD', 500.00, 'Partida 041','A.I.F', 120000.00, CURDATE(), 2),
    (1, 'lote', 18, 'Urbanización Zeta', 'USD', 300.00, 'Partida 043','A.I.F', 90000.00, CURDATE(), 2),
    (1, 'lote', 20, 'Urbanización Eta', 'USD', 250.00, 'Partida 045','A.I.F', 95000.00, CURDATE(), 1),
    (1, 'lote', 22, 'Urbanización Theta', 'USD', 280.00, 'Partida 047','A.I.F', 110000.00, CURDATE(), 2),
    (1, 'lote', 24, 'Urbanización Iota', 'USD', 320.00, 'Partida 049','A.I.F', 85000.00, CURDATE(), 2),
    (1, 'lote', 26, 'Urbanización Kappa', 'USD', 380.00, 'Partida 051','A.I.F', 120000.00, CURDATE(), 1),
    (1, 'lote', 28, 'Urbanización Lambda', 'USD', 420.00, 'Partida 053','A.I.F', 105000.00, CURDATE(), 3),
    (1, 'lote', 30, 'Urbanización Mu', 'USD', 450.00, 'Partida 055','A.I.F', 115000.00, CURDATE(), 3),
    (1, 'lote', 32, 'Urbanización Nu', 'USD', 480.00, 'Partida 057','A.I.F', 100000.00, CURDATE(), 2),
    (1, 'lote', 34, 'Urbanización Xi', 'USD', 500.00, 'Partida 059''A.I.F', 120000.00, CURDATE(), 2),
    (1, 'lote', 36, 'Urbanización Omicron', 'USD', 300.00, 'Partida 061','A.I.F', 90000.00, CURDATE(), 2),
    (1, 'lote', 38, 'Urbanización Pi', 'USD', 250.00, 'Partida 063','A.I.F', 95000.00, CURDATE(), 1),
    (1, 'lote', 40, 'Urbanización Rho', 'USD', 280.00, 'Partida 065','A.I.F', 110000.00, CURDATE(), 2),
    (1, 'lote', 42, 'Urbanización Sigma', 'USD', 320.00, 'Partida 067','A.I.F', 85000.00, CURDATE(), 2),
    (1, 'lote', 44, 'Urbanización Tau', 'USD', 380.00, 'Partida 069','A.I.F', 120000.00, CURDATE(), 1),
    (1, 'lote', 46, 'Urbanización Upsilon', 'USD', 420.00, 'Partida 071','A.I.F', 105000.00, CURDATE(), 3),
    (1, 'lote', 48, 'Urbanización Phi', 'USD', 450.00, 'Partida 073','A.I.F', 115000.00, CURDATE(), 3),
    (1, 'lote', 50, 'Urbanización Chi', 'USD', 480.00, 'Partida 075','A.I.F', 100000.00, CURDATE(), 2),
    (1, 'lote', 52, 'Urbanización Psi', 'USD', 500.00, 'Partida 077','A.I.F', 120000.00, CURDATE(), 2),
    (1, 'lote', 54, 'Urbanización Omega', 'USD', 300.00, 'Partida 079','A.I.F', 90000.00, CURDATE(), 2),
    (1, 'lote', 56, 'Urbanización Alpha', 'USD', 250.00, 'Partida 081','A.I.F', 95000.00, CURDATE(), 1),
    (1, 'lote', 58, 'Urbanización Beta', 'USD', 280.00, 'Partida 083','A.I.F', 110000.00, CURDATE(), 2),
    (1, 'lote', 60, 'Urbanización Gamma', 'USD', 320.00, 'Partida 085','A.I.F', 85000.00, CURDATE(), 2),
    (1, 'lote', 62, 'Urbanización Delta', 'USD', 380.00, 'Partida 087','A.I.F', 120000.00, CURDATE(), 1),
    (1, 'lote', 64, 'Urbanización Epsilon', 'USD', 420.00, 'Partida 089','A.I.F', 105000.00, CURDATE(), 3),
    (1, 'lote', 66, 'Urbanización Zeta', 'USD', 450.00, 'Partida 091','A.I.F', 115000.00, CURDATE(), 3),
    (1, 'lote', 68, 'Urbanización Eta', 'USD', 480.00, 'Partida 093','A.I.F', 100000.00, CURDATE(), 2),
    (1, 'lote', 70, 'Urbanización Theta', 'USD', 500.00, 'Partida 095','A.I.F', 120000.00, CURDATE(), 2),
    (1, 'lote', 72, 'Urbanización Iota', 'USD', 300.00, 'Partida 097','A.I.F', 90000.00, CURDATE(), 2),
    (1, 'lote', 74, 'Urbanización Kappa', 'USD', 250.00, 'Partida 099','A.I.F', 95000.00, CURDATE(), 1),
    (1, 'lote', 76, 'Urbanización Lambda', 'USD', 280.00, 'Partida 101','TERCEROS', 110000.00, CURDATE(), 2),
    (1, 'lote', 78, 'Urbanización Mu', 'USD', 320.00, 'Partida 103','TERCEROS', 85000.00, CURDATE(), 2),
    (1, 'lote', 80, 'Urbanización Nu', 'USD', 380.00, 'Partida 105','TERCEROS', 120000.00, CURDATE(), 1),
    (1, 'lote', 82, 'Urbanización Xi', 'USD', 420.00, 'Partida 107','TERCEROS', 105000.00, CURDATE(), 3),
    (1, 'lote', 84, 'Urbanización Omicron', 'USD', 450.00, 'Partida 109','TERCEROS', 115000.00, CURDATE(), 3),
    (1, 'lote', 86, 'Urbanización Pi', 'USD', 480.00, 'Partida 111','TERCEROS', 100000.00, CURDATE(), 2),
    (1, 'lote', 88, 'Urbanización Rho', 'USD', 500.00, 'Partida 113','TERCEROS', 120000.00, CURDATE(), 2),
    (1, 'lote', 90, 'Urbanización Sigma', 'USD', 300.00, 'Partida 115','TERCEROS', 90000.00, CURDATE(), 2),
    (1, 'lote', 92, 'Urbanización Tau', 'USD', 250.00, 'Partida 117','TERCEROS', 95000.00, CURDATE(), 1),
    (1, 'lote', 94, 'Urbanización Upsilon', 'USD', 280.00, 'Partida 119','TERCEROS', 110000.00, CURDATE(), 2),
    (1, 'lote', 96, 'Urbanización Phi', 'USD', 320.00, 'Partida 121','TERCEROS', 85000.00, CURDATE(), 2),
    (1, 'lote', 98, 'Urbanización Chi', 'USD', 380.00, 'Partida 123','TERCEROS', 120000.00, CURDATE(), 1),
    (1, 'lote', 100, 'Urbanización Psi', 'USD', 420.00, 'Partida 125','TERCEROS', 105000.00, CURDATE(), 3),
	
	-- CASAS
	(1, 'casa', 2, 'Urbanización Beta', 'USD', 200.00, 'Partida 002','TERCEROS', 150000.00, CURDATE(), 1),
	(2, 'casa', 2, 'Urbanización Delta', 'USD', 220.00, 'Partida 004','TERCEROS', 180000.00, CURDATE(), 1),
	(1, 'casa', 4, 'Urbanización Zeta', 'USD', 180.00, 'Partida 006','TERCEROS', 120000.00, CURDATE(), 2),
	(3, 'casa', 3, 'Urbanización Theta', 'USD', 250.00, 'Partida 008','TERCEROS', 200000.00, CURDATE(), 2),
	(2, 'casa', 4, 'Urbanización Kappa', 'USD', 230.00, 'Partida 010','TERCEROS', 190000.00, CURDATE(), 2),
	(3, 'casa', 6, 'Urbanización Mu', 'USD', 210.00, 'Partida 012','TERCEROS', 160000.00, CURDATE(), 2),
	(4, 'casa', 2, 'Urbanización Xi', 'USD', 240.00, 'Partida 014', 'A.I.F', 175000.00, CURDATE(), 2),
	(4, 'casa', 4, 'Urbanización Pi', 'USD', 260.00, 'Partida 016','A.I.F', 220000.00, CURDATE(), 3),
	(1, 'casa', 8, 'Urbanización Sigma', 'USD', 280.00, 'Partida 018','A.I.F', 200000.00, CURDATE(), 3),
	(2, 'casa', 10, 'Urbanización Upsilon', 'USD', 300.00, 'Partida 020','A.I.F', 210000.00, CURDATE(), 3),
	(3, 'casa', 12, 'Urbanización Chi', 'USD', 320.00, 'Partida 022','A.I.F', 180000.00, CURDATE(), 2),
	(4, 'casa', 14, 'Urbanización Omega', 'USD', 350.00, 'Partida 024','A.I.F', 190000.00, CURDATE(), 2);

SELECT * FROM activos;

-- CLIENTES
INSERT INTO clientes (nombres, apellidos, documento_tipo, documento_nro, estado_civil, iddistrito, direccion, idusuario)
			VALUES
				('Juan Carlos', 'Pérez García', 'DNI', '12345678', 'Soltero', 1007, 'Av. Primavera 123', 1),
				('María Luisa', 'Gómez Fernández', 'DNI', '23456789', 'Casada', 1007, 'Calle Flores 456', 2),
				('Pedro José', 'Ramírez Sánchez', 'DNI', '34567890', 'Soltero', 1007, 'Jr. Libertad 789', 3);

SELECT * FROM clientes;

-- SEPARACIONES
INSERT INTO separaciones (
    idactivo, idcliente, separacion_monto, fecha_pago,
    estado, create_at, idusuario
	) 
		VALUES (
		1, 1, 150.5, '2024-03-08',
		'Activo', '2024-03-08', 1
		);
        
INSERT INTO separaciones (
    idactivo, idcliente, separacion_monto, fecha_pago,
    estado, create_at, idusuario
	) 
		VALUES (
		5, 1, 150.5, '2024-03-08',
		'Activo', '2024-03-08', 1
		);
INSERT INTO separaciones (
    idactivo, idcliente, separacion_monto, fecha_pago,
    estado, create_at, idusuario
	) 
		VALUES (
		6, 1, 150.5, '2024-03-08',
		'Activo', '2024-03-08', 1
		);
        
INSERT INTO separaciones (
    idactivo, idcliente, separacion_monto, fecha_pago,
    estado, create_at, idusuario
	) 
		VALUES (
		7, 2, 150.5, '2024-03-08',
		'Activo', '2024-03-08', 1
		); 
        
INSERT INTO separaciones (
    idactivo, idcliente, separacion_monto, fecha_pago,
    estado, create_at, idusuario
	) 
		VALUES (
		8, 2, 150.5, '2024-03-08',
		'Activo', '2024-03-08', 1
		); 
        
SELECT * FROM separaciones;

-- CONTRATOS
INSERT INTO contratos (tipo_contrato, idseparacion, idrepresentante_primario, tipo_cambio, estado, fecha_contrato, idusuario)
			VALUES
				("VENTA DE LOTE", 1, 1, 3.500, 'VIGENTE', '2024-03-10', 1),
				("VENTA DE LOTE", 2, 1, 3.500, 'VIGENTE', '2024-03-11', 2),
				("VENTA DE LOTE", 3, 1, 3.500, 'VIGENTE', '2024-03-12', 3);
                
INSERT INTO contratos (tipo_contrato, idseparacion, idrepresentante_primario, tipo_cambio, estado, fecha_contrato, idusuario)
			VALUES
				("VENTA DE LOTE", 6, 1, 3.500, 'VIGENTE', '2024-03-12', 3);                

SELECT * FROM activos;

-- FINANCIERAS
INSERT INTO financieras (ruc, razon_social, direccion)
			VALUES ('12345678901', 'Financiera ABC', 'Calle Principal 123'),
			('98765432109', 'Financiera XYZ', 'Avenida Secundaria 456');
SELECT * FROM financieras;

-- DESEMBOLSOS
INSERT INTO desembolsos (idfinanciera, idactivo, monto_desemb, porcentaje, fecha_desembolso, idusuario)
			VALUES 
				(1, 2, 5000.00, 10, NOW(), 1),
				(2, 5, 7000.00, 15, NOW(), 1);
SELECT * FROM desembolsos;

-- CUOTAS
INSERT INTO cuotas (idcontrato, monto_cuota, fecha_vencimiento, tipo_pago, entidad_bancaria, idusuario)
			VALUES 
				(6, 500.00, '2024-03-10', 'TRANSFERENCIA', 'BCP', 7),
				(6, 500.00, '2024-04-10', 'TRANSFERENCIA', 'BCP', 7);
                
INSERT INTO cuotas (idcontrato, monto_cuota, fecha_vencimiento, tipo_pago, entidad_bancaria, idusuario)
			VALUES 
				(5, 500.00, '2024-03-18','TRANSFERENCIA', 'BCP', 6),
				(5, 500.00, '2024-04-13','TRANSFERENCIA', 'BCP',  6);          
SELECT * FROM cuotas;

-- SUTENTOS CUOTAS
INSERT INTO sustentos_cuotas (idcuota, ruta, idusuario)
			VALUES 
				(1, '/ruta/imagen1.jpg', 1),
				(1, '/ruta/imagen2.jpg', 1),
                (1, '/ruta/imagen1.jpg', 1),
				(1, '/ruta/imagen2.jpg', 1),
                (2, '/ruta/imagen1.jpg', 2),
				(2, '/ruta/imagen2.jpg', 2),
                (2, '/ruta/imagen1.jpg', 2),
				(2, '/ruta/imagen2.jpg', 2);
SELECT * FROM sustentos_cuotas;                

