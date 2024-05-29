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

-- CATEGORIA COSTOS
CREATE TABLE categoria_costos
(
	idcategoria_costo		INT PRIMARY KEY AUTO_INCREMENT,
    categoria_costo			VARCHAR(60)			NOT NULL,
    CONSTRAINT uk_categoria_costo_cat_cost 	UNIQUE(categoria_costo)
)ENGINE = INNODb;

-- SUBCATEOGORIAS COSTOS
CREATE TABLE subcategoria_costos
(
	idsubcategoria_costo 			INT PRIMARY KEY AUTO_INCREMENT,
    idcategoria_costo				INT 			NOT NULL,
    subcategoria_costo				VARCHAR(100)  	NOT NULL,
    CONSTRAINT fk_idcategoria_costo_subcat_costo FOREIGN KEY(idcategoria_costo) REFERENCES categoria_costos(idcategoria_costo),
    CONSTRAINT fk_subactegoria_costo_subcat_costo UNIQUE(subactegoria_costo)
)ENGINE = INNODB;

-- MARCAS
CREATE TABLE marcas
(
	idmarca			INT PRIMARY KEY AUTO_INCREMENT,
    marca			VARCHAR(100)		NOT NULL,
    CONSTRAINT uk_marca_marca UNIQUE(marca)
)ENGINE = INNODB;

-- UNIDADES DE MEDIDA
CREATE TABLE unidades_medida
(
	idunidad_medida			INT PRIMARY KEY AUTO_INCREMENT,
    unidad_medida			VARCHAR(45),
    CONSTRAINT uk_unidad_medida_u_media UNIQUE(unidad_medida)
)ENGINE = INNODB;

-- MATERIALES
CREATE TABLE materiales
(
	idmaterial			INT PRIMARY KEY AUTO_INCREMENT,
	idmarca				INT 			NOT NULL,
    material			VARCHAR(45) 	NOT NULL,
    idunidad_medida		INT 			NOT NULL,
    precio_unitario		DECIMAL(8,2)	NOT NULL,
    create_at			DATE 			NOT NULL DEFAULT(CURDATE()),
    update_at			DATE			NULL,
    inactive_at			DATE 			NULL,
    CONSTRAINT fk_idmarca_materiales FOREIGN KEY (idmarca) REFERENCES marcas(idmarca),
    CONSTRAINT uk_material UNIQUE(material),
    CONSTRAINT fk_unidad_medida_materiales FOREIGN KEY(idunidad_medida) REFERENCES unidades_medida(idunidad_medida)
)ENGINE = INNODB;

-- PRESUPUESTOS
CREATE TABLE presupuestos
(
	idpresupuesto 			INT PRIMARY KEY AUTO_INCREMENT,
    codigo 					CHAR(8) NOT NULL,
    modelo					VARCHAR(30)		NOT NULL,
    create_at				DATE 			NOT NULL 	DEFAULT(CURDATE()),
    update_at 				DATE        	NULL,
    inactive_at 			DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT uk_codigo_presupuesto UNIQUE(codigo),
    CONSTRAINT chk_codigo_pres CHECK(codigo LIKE 'PRES-%'),
    CONSTRAINT uk_modelo_pres UNIQUE(modelo),
    CONSTRAINT fk_idusuario_pres FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)
ENGINE = INNODB;

-- DETALLE COSTOS
CREATE TABLE detalle_costos
(
	iddetalle_costo		INT PRIMARY KEY AUTO_INCREMENT,
    idpresupuesto 			INT 			NOT NULL,
    idsubcategoria_costo	INT 			NOT NULL,
    idmaterial				INT 			NULL,
    detalle 				VARCHAR(100)	NOT NULL,
    cantidad 				TINYINT 		NOT NULL,
    precio_unitario			DECIMAL(8,2)	NOT NULL,
    create_at 				DATE 			NOT NULL 	DEFAULT(CURDATE()),
    update_at				DATE 			NULL,
    inactive_at 			DATE 			NULL,
    idusuario				INT 			NOT NULL,
    CONSTRAINT fk_idpresupuesto_det_costo FOREIGN KEY(idpresupuesto) REFERENCES presupuestos(idpresupuesto),
    CONSTRAINT fk_idsubcategoria_costo_det_costo FOREIGN KEY(idsubcategoria_costo) REFERENCES subcategoria_costos(idsubcategoria_costo),
    CONSTRAINT fk_idmaterial_det_costo	FOREIGN KEY(idmaterial) REFERENCES materiales(idmaterial),
    CONSTRAINT fk_idusuario_det_costo FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

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
    perimetro			JSON				NOT NULL DEFAULT '{"clave" :[], "valor":[]}',
    det_casa 			JSON 				NOT NULL DEFAULT '{"clave" :[], "valor":[]}',
    idpresupuesto		INT					NULL,
    propietario_lote 	VARCHAR(70)			NOT NULL,
    precio_lote 		DECIMAL(8,2)		NULL,
    precio_construccion	DECIMAL(8,2)		NULL,
    precio_venta 		DECIMAL(8,2) 		NOT NULL,
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
CREATE TABLE rep_legales_clientes
(
	idrepresentante 					INT PRIMARY KEY AUTO_INCREMENT,
    idpersona_juridica					INT 			NOT NULL,
    representante_legal					VARCHAR(100)	NOT NULL,
	documento_tipo						VARCHAR(20) 	NOT NULL,
	documento_nro						VARCHAR(12) 	NOT NULL,
	cargo								VARCHAR(30)		NOT NULL,
	partida_elect						VARCHAR(100) 	NOT NULL,
    estado								VARCHAR(20) 	NOT NULL DEFAULT "DESHABILITADO",
    create_at 							DATE 			NOT NULL DEFAULT(CURDATE()),
    update_at 							DATE 			NULL,
    inactive_at 						DATE 			NULL,
    CONSTRAINT uk_documento_nro_rep UNIQUE(documento_nro)
)ENGINE= INNODB;

-- persona jurìdicas
CREATE TABLE  personas_juridicas
(
	idpersona_juridica 			INT PRIMARY KEY AUTO_INCREMENT,
    razon_social 				VARCHAR(60)		NOT NULL,
    documento_tipo	 			VARCHAR(20) 	NOT NULL,
    documento_nro				VARCHAR(12) 	NOT NULL,
    iddistrito 					INT 			NOT NULL,
    direccion 					VARCHAR(70) 	NOT NULL,
    create_at 					DATE 			NOT NULL DEFAULT(CURDATE()),
    update_at 					DATE 			NULL,
    inactive_at 				DATE 			NULL,
    CONSTRAINT uk_documento_nro_pj UNIQUE(documento_nro),
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
    n_expediente            VARCHAR(10) 	NOT NULL,
    idactivo				INT 			NOT NULL,
    idcliente 				INT  			NOT NULL,
    idconyugue 				INT 			NULL,
    tipo_cambio 			DECIMAL(5,4) 	NOT NULL,
    moneda_venta 			VARCHAR(10) 	NOT NULL,
    separacion_monto		DECIMAL(8,2) 	NOT NULL,
    fecha_pago				DATE 			NOT NULL,
    imagen					VARCHAR(100) 	NOT NULL,
    detalle                 VARCHAR(200)    NOT NULL,
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT chk_n_expediente_sep CHECK(n_expediente LIKE 'SEC-%'),
    CONSTRAINT uk_n_expediente UNIQUE(n_expediente),
    CONSTRAINT fk_idactivo_sep FOREIGN KEY(idactivo) REFERENCES activos(idactivo),
    CONSTRAINT fk_idcliente_sep FOREIGN KEY(idcliente) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idconyugue_sep FOREIGN KEY(idconyugue) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idusuario_sep FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;
SELECT * from separaciones;
-- deboluciones
CREATE TABLE devoluciones
(
	iddevolucion 		INT PRIMARY KEY AUTO_INCREMENT,
    n_expediente        VARCHAR(10)     NOT NULL,
    tipo_devolucion     VARCHAR(20)     NOT NULL,
    idseparacion		INT 			NOT NULL,
    detalle             VARCHAR(200)    NOT NULL,
    porcentaje_penalidad TINYINT        NOT NULL,
    monto_devolucion 	DECIMAL(8,2)	NOT NULL,
    imagen                  VARCHAR(100) NOT NULL,
    create_at 				DATE 		NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 		NULL,
    inactive_at				DATE 		NULL,
    idusuario 				INT 		NOT NULL,
    CONSTRAINT chk_n_expediente_dev CHECK(n_expediente LIKE 'DEC-%'),
    CONSTRAINT fk_idseparacion_dev FOREIGN KEY(idseparacion) REFERENCES separaciones(idseparacion),
    CONSTRAINT fk_idusuario_dev FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE= INNODB;

-- CONTRATOS
CREATE TABLE contratos
(
	idcontrato 				INT PRIMARY KEY AUTO_INCREMENT,
    n_expediente            VARCHAR(10) NOT NULL
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
    det_contrato			JSON 			NOT NULL DEFAULT '{"clave" :[], "valor":[]}', -- BONOS, FINACIAMIENTOS, PENALIDAD, PLAZO ENTREGA, CUOTA INICIAL ..    
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario 				INT 			NOT NULL,
    CONSTRAINT chk_n_epediente_cont CHECK(n_expediente LIKE 'CONT-%'),
    CONSTRAINT fk_idseparacion_cont FOREIGN KEY(idseparacion) REFERENCES separaciones(idseparacion),
    CONSTRAINT fk_idrepresentante_cont FOREIGN KEY(idrepresentante_primario) REFERENCES representantes(idrepresentante),
    CONSTRAINT fk_idrepresentante2_cont FOREIGN KEY(idrepresentante_secundario) REFERENCES representantes(idrepresentante),
    CONSTRAINT fk_idcliente_cont FOREIGN KEY(idcliente) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idcliente2_cont FOREIGN KEY(idconyugue) REFERENCES clientes(idcliente),
    CONSTRAINT fk_idusuario_cont FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

ALTER TABLE contratos ADD COLUMN precio_venta DECIMAL(8,2) NOT NULL;
ALTER TABLE contratos ADD ;
-- DETALLE DE CONTRATOS
CREATE TABLE detalles_contratos
(
	iddetalle_contrato 			INT PRIMARY KEY AUTO_INCREMENT,
	idrepresentante				INT NOT NULL,
    idcontrato					INT NOT NULL,
    create_at					DATE NOT NULL DEFAULT(CURDATE()),
    update_at					DATE NULL,
    inactive_at	 				DATE NULL,
    CONSTRAINT fk_idrepresentante_dtc FOREIGN KEY(idrepresentante) REFERENCES rep_legales_clientes(idrepresentante),
    CONSTRAINT fk_idcontrato_dtc FOREIGN KEY(idcontrato) REFERENCES contratos(idcontrato)
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
    idcontrato		        INT  			NOT NULL,
    monto_cuota 			DECIMAL(8,2) 	NOT NULL,
    fecha_vencimiento 		DATE 			NOT NULL,
    fecha_pago 				DATE 			NULL,
    detalles  	 			VARCHAR(100) 	NULL,
    tipo_pago 				VARCHAR(20) 	NULL,
    entidad_bancaria 		VARCHAR(20) 	NULL,
    imagen                  VARCHAR(100)    NULL,
    estado                  VARCHAR(20) NOT NULL DEFAULT "POR CANCELAR"
	create_at 				DATE 			NOT NULL	DEFAULT (CURDATE()),
    update_at				DATE 			NULL,
    inactive_at				DATE 			NULL,
    idusuario				INT 			NOT NULL,
    CONSTRAINT fk_idcontrato_cuotas FOREIGN KEY(idcontrato) REFERENCES contratos(idcontrato),
    CONSTRAINT fk_idusuario_cuotas FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
)ENGINE = INNODB;

select *from cuotas;
SELECT * FROM contratos;
select * from separaciones;
select * from activos where idactivo in (10,13);

-- DROP TABLE sustentos_cuotas, cuotas, detalle_gastos, presupuestos, desembolsos, sustentos_sep, separaciones, contratos, viviendas, lotes;