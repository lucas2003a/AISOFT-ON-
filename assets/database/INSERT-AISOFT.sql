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

-- PRESUPUESTOS
INSERT INTO presupuestos (modelo, medidas,idusuario)
			VALUES 
				('casa propia',"5X7 m2", 1),
				('casita mia', "7X5 m2", 1);
                
SELECT * FROM presupuestos;

-- COSTOS
INSERT INTO costos(costo_descript)
			VALUES
				('GASTOS ADMINISTRATIVOS'),
                ('HABIITACIÓN DE TERRENO'),
                ('INSTALACIÓN DE ACCESOSRIOS'),
                ('TRASLADO DE MATERIALES');
                
-- DETALLE GASTOS
INSERT INTO detalle_costos (idpresupuesto, idcosto, tipo_costo, descripcion, cantidad, precio_unitario)
			VALUES 
				(1, 2, 'COSTO DIRECTO', 'Materiales de construcción', 100, 0.50),
				(1, 3,  'COSTO INDIRECTO', 'Gastos administrativos', 1, 300.00),
				(1, 1,  'COSTO DIRECTO', 'Materiales de construcción', 50, 8.00),
				(1, 1,  'COSTO INDIRECTO', 'Gastos administrativos', 1, 150.00);
                
INSERT INTO detalle_costos (idpresupuesto, idcosto, tipo_costo, descripcion, cantidad, precio_unitario)
			VALUES 
				(2, 2, 'COSTO DIRECTO', 'Materiales de construcción', 100, 0.50),
				(2, 3,  'COSTO INDIRECTO', 'Gastos administrativos', 1, 300.00),
				(2, 1,  'COSTO DIRECTO', 'Materiales de construcción', 50, 8.00),
				(2, 1,  'COSTO INDIRECTO', 'Gastos administrativos', 1, 150.00);
                
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

