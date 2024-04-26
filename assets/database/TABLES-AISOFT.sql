CREATE DATABASE AISOFT;
USE AISOFT;

-- CREANDO EL UBIGEO --------------------------------

-- DEPARTAMENTOS
CREATE TABLE departamentos(
	iddepartamento		INT PRIMARY KEY AUTO_INCREMENT,
    departamento		VARCHAR(45) 	NOT NULL,
    CONSTRAINT uk_departamento_deps	UNIQUE(departamento)
)ENGINE = INNODB;

-- PROVINCIAS
CREATE TABLE provincias(
	idprovincia				INT PRIMARY KEY AUTO_INCREMENT,
    iddepartamento			INT 		NOT NULL,
    provincia				VARCHAR(45)	NOT NULL,
    CONSTRAINT fk_iddepartamento_provin FOREIGN KEY(iddepartamento) REFERENCES departamentos(iddepartamento) 
)ENGINE = INNODB;

-- DISTRITOS
CREATE TABLE distritos(
	iddistrito			INT PRIMARY KEY AUTO_INCREMENT,
    idprovincia			INT		NOT NULL,
    distrito			VARCHAR(45),
    CONSTRAINT fk_idprovincia_distr	FOREIGN KEY (idprovincia) REFERENCES provincias(idprovincia)
)ENGINE = INNODB;

-- personas
CREATE TABLE personas
(
	idpersona 			INT PRIMARY KEY AUTO_INCREMENT,
    nombres 			VARCHAR(40) 		NOT NULL,
    apellidos 			VARCHAR(40) 		NOT NULL,
    documento_tipo		VARCHAR(30) 		NOT NULL,
    documento_nro 		VARCHAR(12) 		NOT NULL,
    estado_civil 		VARCHAR(10) 		NOT NULL,
    iddistrito 			INT					NOT NULL,
    direccion			VARCHAR(60) 		NOT NULL,
    nacionalidad 		VARCHAR(20) 		NOT NULL DEFAULT "PERUANA",
    create_at 			DATE 				NOT NULL 	DEFAULT(CURDATE()),
    update_at 			DATE 				NULL,
    inactive_at 		DATE 				NULL,
    CONSTRAINT uk_documento_nro_pers UNIQUE(documento_nro),
    CONSTRAINT fk_iddistrito_pers FOREIGN KEY(iddistrito) REFERENCES distritos(iddistrito)
)ENGINE = INNODB;

ALTER TABLE personas change documento_tipo documento_tipo VARCHAR(30) NOT NULL;
-- constructora
CREATE TABLE constructora(
	idconstructora		INT PRIMARY KEY AUTO_INCREMENT,
    razon_social		VARCHAR(60)	 	NOT NULL,
    ruc					CHAR(11) 		NOT NULL,
    partida_elect		VARCHAR(60) 	NOT NULL,
    latitud				VARCHAR(20) 	NULL,
    longitud			VARCHAR(20) 	NULL,
    create_at 			DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 			NULL,
    inactive_at			DATE 			NULL,
	CONSTRAINT uk_ruc_constructora UNIQUE(ruc)
)ENGINE = INNODB;

-- sedes
CREATE TABLE sedes
(
	idsede				INT PRIMARY KEY AUTO_INCREMENT,
    idconstructora		INT  		NOT NULL,
    iddistrito 			INT 		NOT NULL,
    direccion			VARCHAR(70) NOT NULL,
    referencia			VARCHAR(45) NULL,
	create_at 			DATE 		NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 		NULL,
    inactive_at			DATE 		NULL,
    CONSTRAINT fk_idconstructora_sed FOREIGN KEY(idconstructora) REFERENCES constructora(idconstructora),
    CONSTRAINT fk_iddistrito_sed FOREIGN KEY(iddistrito) REFERENCES distritos(iddistrito)
)ENGINE = INNODB;

-- REPRESENTANTES
CREATE TABLE representantes
(
	idrepresentante		INT PRIMARY KEY AUTO_INCREMENT,
	idpersona			INT 			NOT NULL,
    cargo 				VARCHAR(60)		NOT NULL,
    partida_elect		VARCHAR(60) 	NOT NULL,
    idsede				INT 			NOT NULL,
    create_at 			DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 			NULL,
    inactive_at			DATE 			NULL,
    CONSTRAINT uk_idpersona_rep UNIQUE(idpersona),
	CONSTRAINT fk_idpersona_rep FOREIGN KEY(idpersona) REFERENCES personas(idpersona),
    CONSTRAINT fk_idsede_rep FOREIGN KEY(idsede) REFERENCES sedes(idsede)
)ENGINE = INNODB;

-- ROLES
CREATE TABLE roles(
	idrol				INT PRIMARY KEY AUTO_INCREMENT,
    rol					VARCHAR(30) 	NOT NULL,
    estado				CHAR(1) 		NOT NULL DEFAULT 1,
	create_at 			DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 			NULL,
    inactive_at			DATE 			NULL,
    CONSTRAINT uk_rol_roles UNIQUE(rol)
)ENGINE = INNODB;

-- PERMISOS
CREATE TABLE permisos(
	idpermiso			INT PRIMARY KEY AUTO_INCREMENT,
    idrol				INT   			NOT NULL,
    modulo				VARCHAR(60) 	NOT NULL,
	create_at 			DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 			NULL,
    inactive_at			DATE 			NULL,
    CONSTRAINT fk_idrol_permis FOREIGN KEY(idrol) REFERENCES roles(idrol)
)ENGINE = INNODB;

-- modulo será el nombre de la vista (views en el proyecto = vista.html)
-- el modulo seria "LISTAR-LOTES", "EDITAR-LOTES", etc

-- USUARIOS
CREATE TABLE usuarios
(
	idusuario			INT PRIMARY KEY AUTO_INCREMENT,
    imagen 				VARCHAR(100) 		NULL,
    idpersona			INT 				NOT NULL,
    correo	 			VARCHAR(60) 		NOT NULL,
    contraseña 			VARCHAR(60) 		NOT NULL,
    codigo				CHAR(9) 			NULL,
    idrol				INT 				NOT NULL,
    idsede 				INT 				NOT NULL,
	create_at 			DATE 				NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 				NULL,
    inactive_at			DATE 				NULL,
    CONSTRAINT fk_idpersona FOREIGN KEY(idpersona) REFERENCES personas(idpersona),
    CONSTRAINT uk_correo_us UNIQUE(correo),
    CONSTRAINT fk_idrol_usu FOREIGN KEY(idrol) REFERENCES roles(idrol),
    CONSTRAINT fk_idsede_usu FOREIGN KEY(idsede) REFERENCES sedes(idsede)
)ENGINE = INNODB;
	
-- PROYECTOS
CREATE TABLE proyectos(
	idproyecto 				INT PRIMARY KEY AUTO_INCREMENT,
    idsede					INT				NOT NULL,
    imagen					VARCHAR(100) 	NULL,
    codigo	 				VARCHAR(20) 	NOT NULL, -- "A-12 NOMBRE DEL PROYECTO" => VARIA
    denominacion 			VARCHAR(30) 	NOT NULL,
    latitud					VARCHAR(20) 	NULL,
    longitud 				VARCHAR(20) 	NULL,
    iddistrito 				INT 			NOT NULL,
    direccion 				VARCHAR(70) 	NOT NULL,
    referencia 				VARCHAR(70)		NOT NULL,
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario				INT 			NOT NULL,
    CONSTRAINT fk_idsede_proyects FOREIGN KEY(idsede) REFERENCES sedes(idsede),
    CONSTRAINT uk_codigo_proyects UNIQUE(codigo),
    CONSTRAINT uk_denominacion_proyects UNIQUE(denominacion),
    CONSTRAINT fk_iddistrito_proyects FOREIGN KEY(iddistrito) REFERENCES distritos(iddistrito),
    CONSTRAINT fk_idusuario_proyects FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- METRICAS
CREATE TABLE metricas(
	idmetrica 			INT PRIMARY KEY AUTO_INCREMENT,
    idproyecto			INT 		NOT NULL,
    l_vendidos	 		INT 		NOT NULL DEFAULT 0,
    l_noVendidos 		INT      	NOT NULL DEFAULT 0,
    l_separados			INT 		NOT NULL DEFAULT 0,
    update_at 			DATETIME 	NOT NULL DEFAULT(NOW()),
    CONSTRAINT fk_idproyecto_metr FOREIGN KEY(idproyecto) REFERENCES proyectos(idproyecto)
)ENGINE = INNODB;

-- PRESUPUESTOS
CREATE table presupuestos
(
	idpresupuesto 			INT PRIMARY KEY AUTO_INCREMENT,
    modelo					VARCHAR(30)		NOT NULL,
    medidas 				VARCHAR(20)		NOT NULL,
	descripcion				VARCHAR(70) 	NULL,
    create_at				DATE 			NOT NULL 	DEFAULT(CURDATE()),
    update_at 				DATE        	NULL,
    inactive_at 			DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT uk_modelo_pres UNIQUE(modelo),
    CONSTRAINT fk_idusuario_pres FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)
ENGINE = INNODB;

--  COSTOS 
CREATE TABLE costos
(
	idcosto 		INT PRIMARY KEY AUTO_INCREMENT,
    costo_descript 	VARCHAR(60)			NOT NULL,
    CONSTRAINT uk_costo_descript_costos UNIQUE(costo_descript)
)
ENGINE = INNODB;

-- DETALLE COSTOS
CREATE TABLE detalle_costos
(
	iddetalle_costos		INT PRIMARY KEY AUTO_INCREMENT,
    idpresupuesto 			INT 			NOT NULL,
    idcosto					INT 			NOT NULL,
    tipo_costo 				VARCHAR(20)		NOT NULL, -- COSTO DIRECTO O INDIRECTO
    descripcion 			VARCHAR(100)	NOT NULL,
    cantidad 				TINYINT 		NOT NULL,
    precio_unitario			DECIMAL(8,2)	NOT NULL,
    create_at 				DATE 			NOT NULL 	DEFAULT(CURDATE()),
    update_at				DATE 			NULL,
    inactive_at 			DATE 			NULL,
    CONSTRAINT fk_idpresupuesto_det_costo FOREIGN KEY(idpresupuesto) REFERENCES presupuestos(idpresupuesto),
    CONSTRAINT fk_idcosto_det_costo FOREIGN KEY(idcosto) REFERENCES costos(idcosto)
)
ENGINE = INNODB;

-- PUEDEN SER LOS LOTES O CASAS
CREATE TABLE activos(
	idactivo 			INT PRIMARY KEY AUTO_INCREMENT,
    idproyecto			INT  				NOT  NULL,
    tipo_activo 		VARCHAR(10) 		NOT NULL,
    imagen 				VARCHAR(100) 		NULL,
    estado 				VARCHAR(10) 		NOT NULL DEFAULT "SIN VENDER", 
    sublote 			TINYINT 			NOT NULL,
    direccion			VARCHAR(70) 		NOT NULL,
    moneda_venta 		VARCHAR(10) 		NOT NULL,
    area_terreno   		DECIMAL(5,2) 		NOT NULL,
    zcomunes_porcent	TINYINT		 		NULL,
    partida_elect 		VARCHAR(100) 		NOT NULL,
    latitud 			VARCHAR(20) 		NULL,
    longitud 			VARCHAR(20) 		NULL,
    perimetro			JSON				NOT NULL DEFAULT '{"clave" :[""], "valor":[""]}',
    det_casa 			JSON 				NOT NULL DEFAULT '{"clave" :[""], "valor":[""]}',
    idpresupuesto		INT					NULL,
    propietario_lote 	VARCHAR(70)			NOT NULL,
    precio_lote 		DECIMAL(8,2)		NULL,
    precio_construccion	DECIMAL(8,2)		NULL,
	create_at 			DATE 				NOT NULL	DEFAULT(CURDATE()),
    update_at			DATE 				NULL,
    inactive_at			DATE 				NULL,
    idusuario 			INT 				NOT NULL,
    CONSTRAINT fk_idproyecto_activos FOREIGN KEY(idproyecto)  REFERENCES proyectos(idproyecto),
    CONSTRAINT uk_sublote_activos UNIQUE(idproyecto, sublote),
    CONSTRAINT fk_idpresupuesto_activos FOREIGN KEY(idpresupuesto) REFERENCES presupuestos(idpresupuesto),
    CONSTRAINT fk_idusuario_activos FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- REPRESENTATES LEGALES DE LOS CLIENTES DEL TIPO PERSONA JURÍDICA
CREATE TABLE representantes_legales_clientes
(
	idrepresentante			INT PRIMARY KEY AUTO_INCREMENT,
	idpersona_juridica		INT				NOT NULL,
	representante_legal		VARCHAR(100)	NOT NULL,
	documento_tipo			VARCHAR(20) 	NOT NULL,
	documento_nro			VARCHAR(12) 	NOT NULL,
	cargo					VARCHAR(30)		NULL,
	partida_elect			VARCHAR(100) 	NOT NULL,
    CONSTRAINT fk_idpersona_juridica FOREIGN KEY(idpersona_juridica) REFERENCES personas_juridicas(idpersona_juridica)
)ENGINE = INNODB;

-- persona jurìdicas
CREATE TABLE  personas_juridicas
(
	idpersona_juridica 			INT PRIMARY KEY AUTO_INCREMENT,
    razon_social 				VARCHAR(60)		NOT NULL,
    documento_tipo	 			VARCHAR(20) 	NOT NULL,
    documento_nro				VARCHAR(12) 	NOT NULL,
	idrepresentante 			INT				NOT NULL,
    iddistrito 					INT 			NOT NULL,
    direccion 					VARCHAR(70) 	NOT NULL,
    create_at 					DATE 			NOT NULL DEFAULT(CURDATE()),
    update_at 					DATE 			NULL,
    inactive_at 				DATE 			NULL,
    CONSTRAINT uk_documento_nro_pj UNIQUE(documento_nro),
    CONSTRAINT uk_documento_nro_representante_pj UNIQUE(documento_nro_representante),
    CONSTRAINT fk_idrepresentante_pj FOREIGN KEY(idrepresentante) REFERENCES representantes_legales_clientes(idrepresentante),
    CONSTRAINT fk_iddistrito_pj FOREIGN KEY(iddistrito) REFERENCES distritos(iddistrito)
)ENGINE = INNODB;

-- CLIENTES
CREATE TABLE clientes
(
	idcliente			INT PRIMARY KEY AUTO_INCREMENT,
    tipo_persona		VARCHAR(10) 	NOT NULL,
    idpersona			INT 			NULL,
    idpersona_juridica	INT 			NULL,
	create_at 			DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at			DATE 			NULL,
    inactive_at			DATE 			NULL,
    idusuario 			INT 			NOT NULL,
	CONSTRAINT fk_idpersona_cli FOREIGN KEY(idpersona) REFERENCES personas(idpersona),
    CONSTRAINT fk_idpersona_juridica_cli FOREIGN KEY(idpersona_juridica) REFERENCES personas_juridicas(idpersona_juridica),
    CONSTRAINT fk_idusuario_cli FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- SEPARACIONES
CREATE TABLE separaciones
(
	idseparacion  			INT PRIMARY KEY AUTO_INCREMENT,
    idactivo				INT 			NOT NULL,
    idcliente 				INT  			NOT NULL,
    idconyugue 				INT 			NULL,
    separacion_monto		DECIMAL(4,2) 	NOT NULL,
    fecha_pago				DATE 			NOT NULL,
    imagen					VARCHAR(100) 	NOT NULL,
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT fk_idactivo_sep FOREIGN KEY(idactivo) REFERENCES activos(idactivo),
    CONSTRAINT fk_idcliente_sep FOREIGN KEY(idcliente) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idconyugue_sep FOREIGN KEY(idconyugue) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idusuario_sep FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- deboluciones
CREATE TABLE devoluciones
(
	iddevolucion 		INT PRIMARY KEY AUTO_INCREMENT,
    idseparacion		INT 			NOT NULL,
    fecha_devolucion	DATE 			NOT NULL,
    monto_devolucion 	DECIMAL(4,2)	NOT NULL,
    create_at 				DATE 		NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 		NULL,
    inactive_at				DATE 		NULL,
    idusuario 				INT 		NOT NULL,
    CONSTRAINT fk_idseparacion_dev FOREIGN KEY(idseparacion) REFERENCES separaciones(idseparacion),
    CONSTRAINT fk_idusuario_dev FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE= INNODB;

-- CONTRATOS
CREATE TABLE contratos
(
	idcontrato 				INT PRIMARY KEY AUTO_INCREMENT,
    tipo_contrato 			VARCHAR(40)		NOT NULL,
    idseparacion 					INT 	NULL,
    idrepresentante_primario 		INT 	NOT NULL,	-- REPRESENTANTE DEL VENDEDOR
    idrepresentante_secundario 		INT 	NULL,		-- REPRESENTANTE DEL VENDEDOR 2 (SOLO SI EXISTIERA)
    idcliente						INT		NULL,	-- EL CLIENTE
    idconyugue 						INT		NULL,		-- EL CONYUGUE (SOLO SI ESTÁ CASADO)
    idactivo 						INT 	NULL,
	tipo_cambio 			DECIMAL(4,3) 	NOT NULL,
	estado 					VARCHAR(10)		NOT NULL,
    fecha_contrato			DATE 			NOT NULL,
    det_contrato			JSON 			NOT NULL DEFAULT '{"clave" :[""], "valor":[""]}', -- BONOS, FINACIAMIENTOS, PENALIDAD, PLAZO ENTREGA, CUOTA INICIAL ..    
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT fk_idseparacion_cont FOREIGN KEY(idseparacion) REFERENCES separaciones(idseparacion),
    CONSTRAINT fk_idrepresentante_cont FOREIGN KEY(idrepresentante_primario) REFERENCES representantes(idrepresentante),
    CONSTRAINT fk_idrepresentante2_cont FOREIGN KEY(idrepresentante_secundario) REFERENCES representantes(idrepresentante),
    CONSTRAINT fk_idcliente_cont FOREIGN KEY(idcliente) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idcliente2_cont FOREIGN KEY(idconyugue) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idusuario_cont FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- FINANCIERAS
CREATE TABLE financieras(
	idfinanciera 			INT PRIMARY KEY AUTO_INCREMENT,
    ruc						CHAR(11) 		NOT NULL,
    razon_social 			VARCHAR(60) 	NOT NULL,
    iddistrito 				INT 			NOT NULL,
    direccion 				VARCHAR(70) 	NOT NULL,
    CONSTRAINT fk_iddistrito_finans FOREIGN KEY(iddistrito) REFERENCES distritos(iddistrito),
    CONSTRAINT uk_ruc_finans UNIQUE(ruc)
)ENGINE = INNODB;

-- DESEMBOLSOS
CREATE TABLE desembolsos(
	iddesembolso			INT PRIMARY KEY AUTO_INCREMENT,
    idfinanciera			INT 			NOT NULL,
    idactivo 				INT 			NOT NULL,
    monto_desemb 			DECIMAL(8,2) 	NOT NULL,
    porcentaje				TINYINT			NOT NULL,
    fecha_desembolso 		DATETIME		NOT NULL,
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT fk_idfinanciera_desemb FOREIGN KEY(idfinanciera) REFERENCES financieras(idfinanciera),
    CONSTRAINT fk_idactivo_desemb	FOREIGN KEY(idactivo) REFERENCES activos(idactivo),
    CONSTRAINT fk_idusuario_desemb FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- CUOTAS
CREATE TABLE cuotas(
	idcuota 				INT PRIMARY KEY AUTO_INCREMENT,
    idcontrato		INT  			NOT NULL,
    monto_cuota 			DECIMAL(8,2) 	NOT NULL,
    fecha_vencimiento 		DATE 			NOT NULL,
    fecha_pago 				DATE 			NULL,
    detalles  	 			VARCHAR(100) 	NULL,
    tipo_pago 				VARCHAR(20) 	NOT NULL,
    entidad_bancaria 		VARCHAR(20) 	NOT NULL,
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario				INT 			NOT NULL,
    CONSTRAINT fk_idcontrato_cuotas FOREIGN KEY(idcontrato) REFERENCES contratos(idcontrato),
    CONSTRAINT fk_idusuario_cuotas FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

-- SUSTENTOS CUOTAS
CREATE TABLE sustentos_cuotas(
	idsustento_cuota 		INT PRIMARY KEY AUTO_INCREMENT,
    idcuota					INT 			NOT NULL,
    ruta 					VARCHAR(100) 	NOT NULL,
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT fk_idcuota_sust_cuo FOREIGN KEY(idcuota) REFERENCES cuotas(idcuota),
    CONSTRAINT fk_idusuario_sust_cuo FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;


-- DROP TABLE sustentos_cuotas, cuotas, detalle_gastos, presupuestos, desembolsos, sustentos_sep, separaciones, contratos, viviendas, lotes;