USE AISOFT;

-- DEPARTAMENTOS
DELIMITER $$
CREATE PROCEDURE spu_list_departaments()
BEGIN
	SELECT * FROM departamentos
    ORDER BY 2 ASC;
END $$
DELIMITER ;

-- PROVINCIAS
DELIMITER $$
CREATE PROCEDURE spu_list_provinces(IN _iddepartamento INT)
BEGIN
	SELECT * 
    FROM provincias 
    WHERE iddepartamento = _iddepartamento
    ORDER BY 3 ASC;
END $$
DELIMITER ;

-- DISTRITOS
DELIMITER $$
CREATE PROCEDURE spu_list_districts(IN _idprovincia INT)
BEGIN
	SELECT * 
    FROM distritos
    WHERE idprovincia = _idprovincia
    ORDER BY 3 ASC;
END $$
DELIMITER ;

-- UBGEO
DELIMITER $$
CREATE PROCEDURE spu_get_ubigeo(IN _iddistrito INT)
BEGIN
	SELECT 
		dist.iddistrito,
        dist.distrito,
        prov.idprovincia,
        prov.provincia,
        dept.iddepartamento,
        dept.departamento
		FROM distritos AS dist
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE dist.iddistrito = _iddistrito;
END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE spu_get_fullUbigeo(
	IN _distrito VARCHAR(45),
    IN _provincia VARCHAR(45),
    IN _departamento VARCHAR(45)
)
BEGIN
	SELECT 	
		dist.iddistrito,
        dist.distrito,
        prov.idprovincia,
        prov.provincia,
        dept.iddepartamento,
        dept.departamento
		FROM distritos dist 
        INNER JOIN provincias prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos dept ON dept.iddepartamento = prov.iddepartamento
        WHERE 
				dist.distrito = _distrito
            AND prov.provincia = _provincia
            AND dept.departamento = _departamento;
END $$
DELIMITER ;

-- constructora
DELIMITER $$
CREATE PROCEDURE spu_list_companies()
BEGIN
	SELECT * FROM vws_list_companies
    ORDER BY 2;
END $$
DELIMITER ;

-- sedes
DELIMITER $$
CREATE PROCEDURE spu_list_addresses(IN _iddistrito INT)
BEGIN
	SELECT
		sed.idsede,
        emp.ruc,
		emp.razon_social,
        emp.partida_elect,
        sed.referencia,
        sed.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento
		FROM sedes AS sed
        INNER JOIN constructora AS emp ON emp.idconstructora = sed.idconstructora
        INNER JOIN distritos AS dist ON dist.iddistrito = sed.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE sed.iddistrito = _iddistrito;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_addresses_ruc(IN _ruc VARCHAR(11))
BEGIN
	DECLARE _idconstructora INT;

    -- OBTENGO LA EMPRESA
    SET _idconstructora = (
						SELECT idconstructora FROM vws_list_companies
						WHERE ruc LIKE CONCAT(_ruc, "%")
				);
	SELECT
		sed.idsede,
        emp.ruc,
		emp.razon_social,
        emp.partida_elect,
        sed.referencia,
        sed.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento
		FROM sedes AS sed
        INNER JOIN constructora AS emp ON emp.idconstructora = sed.idconstructora
        INNER JOIN distritos AS dist ON dist.iddistrito = sed.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE sed.idconstructora = _idconstructora;
END $$
DELIMITER ;

use aisoft;

-- representates
DELIMITER $$
CREATE PROCEDURE spu_get_represents(IN _idrepresentante INT)
BEGIN
	SELECT 
		rep.idrepresente,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        dist.distrito,
        prov.provincia,
		dept.departamento,
        rep.cargo,
        rep.partida_elect,
        sed.direccion
        FROM representates AS rep
        INNER JOIN personas AS pers ON pers.idpersona = rep.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN sedes AS sed ON sed.idsede = rep.idsede
        WHERE rep.idrepresentante = _idrepresentante
        AND rep.inactive_at IS NULL;
END $$
DELIMITER ;

-- PROYECTOS
DELIMITER $$
CREATE PROCEDURE spu_list_projects()
BEGIN
	SELECT * FROM vws_list_projects;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_projects_id(IN _idproyecto INT)
BEGIN
	SELECT * FROM vws_list_projects
    WHERE idproyecto = _idproyecto;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_projects_by_code(IN _codigo VARCHAR(20)) -- POR CÓDIGO DEL PROYECTO
BEGIN
		SELECT * FROM vws_list_projects
        WHERE codigo LIKE CONCAT("%", _codigo,"%");
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_add_projects
(
	IN _idsede 			INT,
    IN _imagen			VARCHAR(100),
    IN _codigo 			VARCHAR(20),
    IN _denominacion 	VARCHAR(30),
    IN _latitud 		VARCHAR(20),
    IN _longitud 		VARCHAR(20),
    IN _iddistrito		INT,
    IN _direccion		VARCHAR(70),
    IN _idusuario 		INT
)
BEGIN
	INSERT INTO proyectos(idsede, imagen, codigo, denominacion, latitud, longitud, iddistrito, direccion, idusuario)
			VALUES
				(_idsede, NULLIF(_imagen,""), _codigo, _denominacion, NULLIF(_latitud, ""), NULLIF(_longitud, ""), _iddistrito, _direccion, _idusuario);
                
	SELECT ROW_COUNT() AS filasAfect; -- FILAS AFECTADAS
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_projects
(
	IN _idproyecto		INT,
	IN _idsede 			INT,
    IN _imagen 			VARCHAR(100),
    IN _codigo 			VARCHAR(20),
    IN _denominacion 	VARCHAR(30),
    IN _latitud 		VARCHAR(20),
    IN _longitud 		VARCHAR(20),
    IN _iddistrito		INT,
    IN _direccion		VARCHAR(70),
    IN _idusuario 		INT
)
BEGIN
	UPDATE proyectos
		SET
            idsede			= _idsede,
            imagen 			= NULLIF(_imagen,""),
            codigo 			= _codigo,
            denominacion 	= _denominacion,
            latitud 		= NULLIF(_latitud,""),
            longitud		= NULLIF(_longitud,""),
            iddistrito		= _iddistrito,
            direccion		= _direccion,
            idusuario		= _idusuario,
            update_at		= CURDATE()
		WHERE 
			idproyecto = _idproyecto;
            
	SELECT ROW_COUNT() AS filasAfect; -- FILAS AFECTADAS
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_projects(IN _idproyecto INT)
BEGIN

	UPDATE proyectos
		SET
			inactive_at = CURDATE()
		WHERE
			idproyecto = _idproyecto;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;


-- LOTES
DELIMITER $$
CREATE PROCEDURE spu_list_assets_by_id(IN _idactivo INT)
BEGIN
		SELECT 
		act.idactivo,
        act.tipo_activo,
        proy.idproyecto,
        proy.denominacion,
        act.imagen,
        act.estado,
        act.sublote,
        act.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        act.moneda_venta,
        act.area_terreno,
        act.zcomunes_porcent,
        act.partida_elect,
        act.latitud,
        act.longitud,
        act.perimetro,
        act.det_casa,
        pres.idpresupuesto,
        pres.modelo,
        act.propietario_lote,
        act.precio_lote,
        act.precio_construccion,
        act.precio_venta,
        pers.nombres AS usuario
		FROM activos AS act
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        LEFT JOIN presupuestos AS pres ON pres.idpresupuesto = act.idpresupuesto
        INNER JOIN usuarios AS usu ON usu.idusuario = act.idusuario
        INNER JOIN personas AS pers ON pers.idpersona = usu.idpersona
        WHERE act.idactivo = _idactivo
        AND act.inactive_at IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_assets_idProject(IN _idproyecto INT)
BEGIN
	SELECT * FROM vws_list_assets_short
    WHERE idproyecto = _idproyecto;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_assets_short_idpr(IN _idproyecto INT, IN _propietario_lote VARCHAR(10))
BEGIN
	SELECT * FROM vws_list_assets_short
    WHERE idproyecto = _idproyecto
    AND propietario_lote = _propietario_lote;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_assets_by_sublote(IN _idproyecto INT, IN _sublote CHAR(5)) -- => POR CÓDIGO DE LOTE
BEGIN
	SELECT * 
		FROM vws_list_assets_short
        WHERE sublote LIKE CONCAT(_sublote,"%")
        AND idproyecto = _idproyecto;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_add_assets
(
    IN _idproyecto		INT,
	IN _tipo_activo 	VARCHAR(10),
    IN _imagen  		VARCHAR(100),
    IN _estado	 		VARCHAR(10),
    IN _sublote 		VARCHAR(6),
    IN _direccion 		CHAR(70),
    IN _moneda_venta 	VARCHAR(10),
    IN _area_terreno 	DECIMAL(5,2),
    IN _zcomunes_porcent TINYINT,
    IN _partida_elect 	VARCHAR(100),
    IN _latitud			VARCHAR(20),
    IN _longitud 		VARCHAR(20),
    IN _perimetro      	JSON,
    IN _idpresupuesto 	INT,
    IN _propietario_lote varchar(70),
    IN _precio_lote		DECIMAL(8,2),
    IN _precio_construccion		DECIMAL(8,2),
    IN _precio_venta	DECIMAL(8,2),
    IN _idusuario 		INT
)
BEGIN
	INSERT INTO activos (
						idproyecto, 
                        tipo_activo, 
                        imagen, 
                        estado, 
                        sublote, 
                        direccion, 
                        moneda_venta, 
                        area_terreno, 
                        zcomunes_porcent, 
                        partida_elect,
						latitud, 
                        longitud, 
                        perimetro, 
                        idpresupuesto,
                        propietario_lote,
                        precio_lote,
                        precio_construccion,
                        precio_venta,
                        idusuario
                        )
			VALUES
				(
                _idproyecto, 
                _tipo_activo, 
                NULLIF(_imagen,""), 
                _estado, 
                _sublote, 
                _direccion, 
                _moneda_venta, 
                _area_terreno, 
                _zcomunes_porcent, 
                _partida_elect,
				NULLIF(_latitud,""), 
                NULLIF(_longitud, ""), 
                NULLIF(_perimetro,""),
                NULLIF(_idpresupuesto,""),
                _propietario_lote,
                _precio_lote,
                NULLIF(_precio_construccion, ""), 
                _precio_venta,
                _idusuario
                );
                
	SELECT ROW_COUNT() as filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_assets
(
	IN _idactivo  		INT,
    IN _idproyecto		INT,
	IN _tipo_activo 	VARCHAR(10),
    IN _imagen  		VARCHAR(100),
    IN _estado	 		VARCHAR(10),
    IN _sublote 		VARCHAR(6),
    IN _direccion 		CHAR(70),
    IN _moneda_venta 	VARCHAR(10),
    IN _area_terreno 	DECIMAL(5,2),
    IN _zcomunes_porcent TINYINT,
    IN _partida_elect 	VARCHAR(100),
    IN _latitud			VARCHAR(20),
    IN _longitud 		VARCHAR(20),
    IN _perimetro      	JSON,
    IN _idpresupuesto 	INT,
    IN _propietario_lote varchar(70),
    IN _precio_lote		DECIMAL(8,2),
    IN _precio_construccion		DECIMAL(8,2),
    IN _precio_venta	DECIMAL(8,2),
    IN _idusuario 		INT
)
BEGIN
	UPDATE activos
		SET
			idproyecto		= _idproyecto,
            tipo_activo		= _tipo_activo,
            imagen 			= NULLIF(_imagen,""),
            estado			= _estado,
            sublote 		= _sublote,
            direccion 		= _direccion,
            moneda_venta 	= _moneda_venta,
            area_terreno	= _area_terreno,
            zcomunes_porcent = _zcomunes_porcent,
            partida_elect 	= _partida_elect,
            latitud 		= NULLIF(_latitud,""),
            longitud		= NULLIF(_longitud,""),
            perimetro 		= NULLIF(_perimetro, ""),
            idpresupuesto	= NULLIF(_idpresupuesto, ""),
            propietario_lote = _propietario_lote,
            precio_lote		= precio_lote,
            precio_construccion = NULLIF(_precio_construccion,""),
            precio_venta 	= _precio_venta,
            precio_venta	= _precio_venta,
            idusuario		= _idusuario,
            update_at		= CURDATE() 
		WHERE
			idactivo = _idactivo;
            
	SELECT ROW_COUNT() AS filasAfect;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_idpresupuesto
(
	IN _idactivo 		INT,
	IN _idpresupuesto	INT,
    IN _idusuario 		INT
)
BEGIN
	UPDATE activos
		SET
			idpresupuesto 	= NULLIF(_idpresupuesto,""),
            idusuario 		= _idusuario,
            update_at 		= CURDATE()
		WHERE idactivo = _idactivo;
        
	SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_det_build(IN _idactivo INT, IN _det_casa JSON)
BEGIN
	DECLARE oldDetCasa JSON;
    
    SET oldDetCasa = (
		SELECT det_casa FROM activos WHERE idactivo = _idactivo
    );
		
	IF _det_casa != oldDetCasa THEN
		UPDATE activos SET
			det_casa = _det_casa,
			update_at = CURDATE()
		WHERE 
			idactivo = _idactivo;
        
		SELECT ROW_COUNT() AS filasAfect;
	ELSE 
		(SELECT COUNT(*) -2 AS filasAfect FROM activos WHERE idactivo = _idactivo);
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_assets(IN _idactivo INT)
BEGIN
	DECLARE _estadoActivo VARCHAR(10);
    
    -- CONSULTAR SI EL LOTE ESTA VENDIDO O SEPARDAO
    SET _estadoActivo = (
		SELECT estado
			FROM activos 
			WHERE idactivo = _idactivo
    );
    
	IF _estadoActivo = "SIN VENDER" THEN
		UPDATE activos
			SET
				inactive_at = CURDATE()
			WHERE idactivo = _idactivo;
	ELSE
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Error: el lote tiene un cliente";
    END IF;
    
    SELECT ROW_COUNT() AS filasAfect;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_lots_noBudgets()
BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            LEFT JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
			WHERE pres.idpresupuesto IS NULL
			AND act.inactive_at IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_lots_withBudgets()
BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            INNER JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
			WHERE act.inactive_at IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_lots_ByIdBudget(IN _idpresupuesto INT)
BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            INNER JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
			WHERE act.idpresupuesto = _idpresupuesto
            AND act.inactive_at IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_lots_ForBudget(IN _idpresupuesto INT)
BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            LEFT JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
            WHERE act.inactive_at IS NULL
				AND act.idpresupuesto = _idpresupuesto OR act.idpresupuesto IS NULL;
END $$
DELIMITER ;
call spu_list_lots_ForBudget(23);
-- PERSONAS
DELIMITER $$
CREATE PROCEDURE spu_list_person()
BEGIN
	SELECT
		pers.idpersona,
        pers.nombres,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.iddistrito,
        prov.idprovincia,
        dept.iddepartamento
		FROM pesonas AS pers
        INNER JOIN 	distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN 	provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN 	departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE pers.inactive_at IS NULL
        ORDER BY pers.idpersona DESC;
END $$
DELIMTER ;

DELIMITER $$
CREATE PROCEDURE spu_list_person_doc_nro(IN _documento_nro VARCHAR(12))
BEGIN
	SELECT
		pers.idpersona,
        pers.nombres,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.iddistrito,
        prov.idprovincia,
        dept.iddepartamento
		FROM pesonas AS pers
        INNER JOIN 	distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN 	provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN 	departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE pers.inactive_at IS NULL AND pers.documento_nro LIKE CONCAT(_documento_nro,'%')
        ORDER BY pers.idpersona DESC;
END $$
DELIMTER ;

DELIMITER $$
CREATE PROCEDURE spu_add_person
(
	IN _nombres 		VARCHAR(40),
    IN _apellidos 		VARCHAR(40),
    IN _documento_tipo	VARCHAR(20),
    IN _documento_nro	VARCHAR(12),
	IN _estado_civil 	VARCHAR(10),
    IN _iddistrito		INT,
    IN _direccion		VARCHAR(60),
    IN _idusuario		INT
)
BEGIN
	INSERT INTO personas(
						nombres,
                        apellidos,
                        documento_tipo,
                        documento_nro,
                        estado_civil,
                        iddistrito,
                        direccion,
                        idusuario
                        )
					VALUES(
						_nombres,
                        _apellidos,
                        _documento_tipo,
                        _documento_nro,
                        _estado_civil,
                        _iddistrito,
                        _direccion,
                        _idusuario
                    );
                    
	SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMTER ;

DELIMITER $$
CREATE PROCEDURE spu_set_person
(
	IN _idpersona		INT,
	IN _nombres 		VARCHAR(40),
    IN _apellidos 		VARCHAR(40),
    IN _documento_tipo	VARCHAR(20),
    IN _documento_nro	VARCHAR(12),
	IN _estado_civil 	VARCHAR(10),
    IN _iddistrito		INT,
    IN _direccion		VARCHAR(60),
    IN _idusuario		INT
)
BEGIN 
	UPDATE personas
		SET
			nombres 	= _nombres,
            apellidos	= _apellidos,
            documento_tipo 	= _documento_tipo,
            documento_nro 	= _documento_nro,
            estado_civil	= _estado_civil,
            iddistrito		= _iddistrito,
            direccion 		= _direccion,
            idusuario		= _idusuario,
            update_at		= CURDATE()
		WHERE idpersona = _idpersona;
	
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_person(IN _idpersona INT)
BEGIN 
	UPDATE personas
		SET inactive_at = CURDATE()
	WHERE idpersona = _idpersona;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

-- CLIENTES ---------------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_list_clients_tpersona(IN _tipo_persona VARCHAR(10))
BEGIN
	IF _tipo_persona = "NATURAL" THEN
		SELECT
		clien.idcliente,
        clien.tipo_persona,
        pers.apellidos,
        pers.nombres,
		pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        pers.direccion,
        persUsu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
        WHERE clien.inactive_at IS NULL AND clien.tipo_persona = _tipo_persona
        ORDER BY pers.documento_nro ASC;
    ELSE 
		SELECT
			clien.idcliente,
			clien.tipo_persona,
			persj.documento_tipo,
			persj.documento_nro,
			persj.razon_social,
            rep.idrepresentante,
			dist.distrito,
			prov.provincia,
			dept.departamento,
			persj.direccion,
			persUsu.nombres AS usuario
			FROM clientes AS clien
			INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            LEFT JOIN rep_legales_clientes AS rep ON rep.idpersona_juridica = persj.idpersona_juridica
			INNER JOIN distritos AS dist ON dist.iddistrito = persj.iddistrito
			INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
			INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
			INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario	
			INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
			WHERE clien.inactive_at IS NULL AND clien.tipo_persona = _tipo_persona
            GROUP BY persj.razon_social
			ORDER BY persj.documento_nro ASC;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_clients_by_id(IN _idcliente INT)
BEGIN
	DECLARE _tipoPersona VARCHAR(10);
    
    SET _tipoPersona = (
		SELECT tipo_persona FROM clientes WHERE idcliente = _idcliente
    );
    
	IF _tipoPersona = "NATURAL" THEN
		SELECT
		clien.idcliente,
        clien.tipo_persona,
        pers.idpersona,
        pers.apellidos,
        pers.nombres,
		pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.iddistrito,
        pers.nacionalidad,
        pers.direccion,
        persUsu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
        WHERE clien.inactive_at IS NULL 
			AND clien.tipo_persona = _tipoPersona
            AND clien.idcliente = _idcliente
        ORDER BY pers.documento_nro ASC;
    ELSE 
		SELECT
			clien.idcliente,
			clien.tipo_persona,
            persj.idpersona_juridica,
			persj.documento_tipo,
			persj.documento_nro,
			persj.razon_social,
            rep.idrepresentante,
			dist.distrito,
			prov.provincia,
			dept.departamento,
            dist.iddistrito,
			persj.direccion,
			persUsu.nombres AS usuario
			FROM clientes AS clien
			INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            LEFT JOIN rep_legales_clientes AS rep ON rep.idpersona_juridica = persj.idpersona_juridica
			INNER JOIN distritos AS dist ON dist.iddistrito = persj.iddistrito
			INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
			INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
			INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario	
			INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
			WHERE clien.inactive_at IS NULL 
				AND clien.tipo_persona = _tipoPersona
                AND clien.idcliente = _idcliente
			ORDER BY persj.documento_nro ASC;
		END IF;
        
        SELECT ROW_COUNT() AS filasAfect;
        
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_clients_by_docNro(IN _tipo_persona VARCHAR(10), IN _documento_nro VARCHAR(12))
BEGIN
	IF _tipo_persona = "NATURAL" THEN
		SELECT
		clien.idcliente,
        clien.tipo_persona,
        pers.apellidos,
        pers.nombres,
		pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        pers.direccion,
        persUsu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
        WHERE clien.inactive_at IS NULL 
			AND clien.tipo_persona = _tipo_persona
            AND pers.documento_nro LIKE CONCAT(_documento_nro,'%')
        ORDER BY pers.documento_nro ASC;
    ELSE 
		SELECT
			clien.idcliente,
			clien.tipo_persona,
			persj.documento_tipo,
			persj.documento_nro,
			persj.razon_social,
			rep.idrepresentante,
			dist.distrito,
			prov.provincia,
			dept.departamento,
			persj.direccion,
			persUsu.nombres AS usuario
			FROM clientes AS clien
			INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            LEFT JOIN rep_legales_clientes AS rep ON rep.idpersona_juridica = persj.idpersona_juridica
			INNER JOIN distritos AS dist ON dist.iddistrito = persj.iddistrito
			INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
			INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
			INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario	
			INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
			WHERE clien.inactive_at IS NULL 
				AND clien.tipo_persona = _tipo_persona
                AND persj.documento_nro LIKE CONCAT(_documento_nro,'%')
			ORDER BY persj.documento_nro ASC;
		END IF;
END$$
DELIMITER ;

-- PERSONA NATURAL
DELIMITER $$
CREATE PROCEDURE spu_add_clients_personN
(
	IN _tipo_persona	VARCHAR(10),
	IN _nombres 		VARCHAR(40),
    IN _apellidos 		VARCHAR(40),
    IN _documento_tipo 	VARCHAR(30),
    IN _documento_nro 	VARCHAR(12),
    IN _estado_civil 	VARCHAR(20),
    IN _iddistrito 		INT,
    IN _direccion		VARCHAR(70),
    IN _nacionalidad	VARCHAR(20),
    IN _idusuario 		INT
)
BEGIN
	DECLARE _idpersona INT;
    
    -- registro a la persona
    INSERT INTO personas(
							nombres,
                            apellidos,
                            documento_tipo,
                            documento_nro,
                            estado_civil,
                            iddistrito,
                            direccion,
                            nacionalidad
							)
                            
						VALUES(
							_nombres,
                            _apellidos,
                            _documento_tipo,
                            _documento_nro,
                            _estado_civil,
                            _iddistrito,
                            _direccion,
                            NULLIF(_nacionalidad,'')
                        );
                        
		SET _idpersona = (SELECT @@last_insert_id);

	-- registro a la persona como cliente
	INSERT INTO clientes(
						tipo_persona, 
                        idpersona,
                        idusuario
                        )
				VALUES
					(
						_tipo_persona,
                        _idpersona,
                        _idusuario
                    );
	
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_clientN
(
	IN _idcliente		INT,
    IN _tipo_persona	VARCHAR(10),
    IN _idpersona		INT,
	IN _nombres 		VARCHAR(40),
    IN _apellidos 		VARCHAR(40),
    IN _documento_tipo 	VARCHAR(30),
    IN _documento_nro 	VARCHAR(12),
    IN _estado_civil 	VARCHAR(20),
    IN _iddistrito 		INT,
    IN _direccion		VARCHAR(70),
    IN _nacionalidad	VARCHAR(20),
    IN _idusuario 		INT
)
BEGIN    
	UPDATE personas
		SET
			nombres 		= _nombres,
			apellidos		= _apellidos,
			documento_tipo	= _documento_tipo,
			documento_nro	= _documento_nro,
			estado_civil	=  _estado_civil,
			iddistrito		= _iddistrito,
            direccion		= _direccion,
            nacionalidad	= _nacionalidad,
            update_at 		= CURDATE()
		WHERE 
			idpersona = _idpersona;
		
        SELECT ROW_COUNT() AS filasAfect;
		
        UPDATE clientes 
			SET 
				tipo_persona 	= _tipo_persona,
				idpersona 		= _idpersona,
                idusuario		= _idusuario,
                update_at		= CURDATE()
                
			WHERE idcliente = _idcliente;
            
			SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

-- PERSONA JURÍDICA
DELIMITER $$
CREATE PROCEDURE spu_add_clients_personj
(
	IN _tipo_persona	VARCHAR(10),
	IN _razon_social 	VARCHAR(60),
    IN _documento_tipo 	VARCHAR(20),
    IN _documento_nro	VARCHAR(12),
    IN _iddistrito 		INT,
    IN _direccion		VARCHAR(70),	
    IN _idusuario 		INT
)
BEGIN

	DECLARE _idpersona_juridica INT;
    
    -- registro a la persona
    INSERT INTO personas_juridicas(
							razon_social,
                            documento_tipo,                            
                            documento_nro,
                            iddistrito,
                            direccion
							)
                            
						VALUES(
							_razon_social,
                            _documento_tipo,                            
                            _documento_nro,
                            _iddistrito,
                            _direccion
                        );
                        
		SET _idpersona_juridica = (SELECT @@last_insert_id);

	SELECT _idpersona_juridica AS idpersona_juridica;
    
	-- registro a la persona como cliente
	INSERT INTO clientes(
						tipo_persona, 
                        idpersona_juridica,
                        idusuario
                        )
				VALUES
					(
						_tipo_persona,
                        _idpersona_juridica,
                        _idusuario
                    );
END $$
DELIMITER ;

-- REPRESENTANTES
DELIMITER $$
CREATE PROCEDURE spu_list_represents_by_id_pj(IN _idpersona_juridica INT)
BEGIN
	SELECT 
		idrepresentante,
        idpersona_juridica,
        representante_legal,
        documento_tipo,
        documento_nro,
        cargo,
        partida_elect,
        estado
		FROM rep_legales_clientes
        WHERE idpersona_juridica = _idpersona_juridica 
        AND inactive_at IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_represents(IN _idrepresentante INT)
BEGIN
	UPDATE rep_legales_clientes
		SET
			inactive_at = CURDATE()
        WHERE idrepresentante = _idrepresentante;
	
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE spu_set_represents
(
	IN _idrepresentante		INT,
    IN _idpersona_juridica 	INT,
    IN _representante_legal VARCHAR(100),
    IN _documento_tipo		VARCHAR(20),
    IN _documento_nro		VARCHAR(12),
    IN _cargo				VARCHAR(30),
    IN _partida_elect 		VARCHAR(100),
    IN _estado				VARCHAR(20)
)
BEGIN
	UPDATE	rep_legales_clientes 
		SET
			idpersona_juridica 		= _idpersona_juridica,
            representante_legal 	= _representante_legal,
            documento_tipo			= _documento_tipo,
            documento_nro 			= _documento_nro,
            cargo					= _cargo,
            partida_elect 			= _partida_elect,
            estado 					= _estado, 	
            update_at				= CURDATE()
        WHERE idrepresentante = _idrepresentante;
        
	SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_add_represents
(
	IN _idpersona_juridica 		INT,
	IN _representante_legal 	VARCHAR(30),
    IN _documento_tipo 			VARCHAR(20),
    IN _documento_nro	VARCHAR(12),
    IN _cargo			VARCHAR(30),
    IN _partida_elect	VARCHAR(100),
    IN _estado			VARCHAR(20)
)
BEGIN
	INSERT INTO rep_legales_clientes
				(
					idpersona_juridica,
                    representante_legal,
                    documento_tipo,
                    documento_nro,
                    cargo,
                    partida_elect,
                    estado
                )
                
                VALUES(
					_idpersona_juridica,
                    _representante_legal,
                    _documento_tipo,
                    _documento_nro,
                    _cargo,
                    _partida_elect,
                    _estado
                );
                
		SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_clientJ
(
	IN _idcliente			INT,
    IN _tipo_persona 		VARCHAR(10),
    IN _idpersona_juridica 	INT,
	IN _razon_social 		VARCHAR(60),
    IN _documento_tipo 		VARCHAR(20),
    IN _documento_nro		VARCHAR(12),
    IN _iddistrito 			INT,
    IN _direccion			VARCHAR(70),
    IN _idusuario 			INT
)
BEGIN
	UPDATE personas_juridicas
			SET
				razon_social	= _razon_social,
				documento_tipo 	= _documento_tipo,
				documento_nro 	= _documento_nro,
				iddistrito		= _iddistrito,
				direccion 		= _direccion,
				update_at 		= CURDATE()
			WHERE
				idpersona_juridica = _idpersona_juridica;
				
			SELECT ROW_COUNT() AS filasAfect;
		-- ACTUALIZA LOS DATOS DEL CLIENTE
			UPDATE clientes
					SET
						tipo_persona	= _tipo_persona,
						idpersona_juridica 	= _idpersona_juridica,
						update_at 			= CURDATE(),
						idusuario 			= _idusuario
					WHERE 
						idcliente = _idcliente;
        
		SELECT ROW_COUNT() AS filasAfect;
	
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_clients(IN _idcliente INT)
BEGIN
	DECLARE _clienContrato INT;
    DECLARE _clienSeparacion INT;
    
    -- VERFICO QUE SI EXISTE EN UNA SEPARACIÓN O CONTRATO
    SET _clienContrato = (
		SELECT COUNT(*)
			FROM contratos
            WHERE idcliente = _idcliente
            AND inactive_at IS NULL    
            );
            
	SET _clienSeparacion = (
		SELECT COUNT(*)
			FROM separaciones
            WHERE idcliente = _idcliente
            AND inactive_at IS NULL
    );
    
    -- EJECUTO EL PROCEDIMIENTO
    
    IF _clienContrato  = 0 OR _clienSeparacion = 0 THEN
		UPDATE clientes
			SET
				inactive_at = CURDATE()
			WHERE
				idcliente = _idcliente;
	
	END IF;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

-- CATEGORíAS COSTOS /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_cost_category()
BEGIN
	SELECT
		idcategoria_costo,
        categoria_costo
		FROM categoria_costos;
END $$
DELIMITER ;

-- SUBCATEGORIAS COSTOS /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_cost_subcategory(IN  _idcategoria_costo INT)
BEGIN
	SELECT 
		subcat.idsubcategoria_costo,
		cat.idcategoria_costo,
        cat.categoria_costo,
        subcat.subcategoria_costo,
        subcat.requiere_material
		FROM subcategoria_costos subcat
        INNER JOIN categoria_costos cat ON cat.idcategoria_costo  = subcat.idcategoria_costo
        WHERE subcat.idcategoria_costo = _idcategoria_costo 
        ORDER BY subcat.subcategoria_costo ASC;
END $$
DELIMITER ;

-- MARCAS /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_brands()
BEGIN
	SELECT
		idmarca,
        marca
		FROM marcas
        ORDER BY marca ASC;
END $$
DELIMITER ;

-- UNIDADES DE MEDIDA /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_units_measuraments()
BEGIN
	SELECT * FROM unidades_medida
    ORDER BY unidad_medida ASC;
END $$
DELIMITER ;

-- MATERIALES /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_materials(IN _idmarca INT)
BEGIN
	SELECT 
		mat.idmaterial,
        marc.idmarca,
        marc.marca,
        mat.material,
        unimed.unidad_medida,
        mat.precio_unitario
		FROM materiales mat
        INNER JOIN marcas marc ON marc.idmarca = mat.idmarca
        INNER JOIN unidades_medida unimed ON unimed.idunidad_medida = mat.idunidad_medida
        WHERE marc.idmarca = _idmarca
        ORDER BY mat.material ASC;
END $$
DELIMITER ;

-- PRESUPUESTOS /////////////////////////////////////////////////////////////////////////////////////////

DELIMITER $$
CREATE PROCEDURE spu_list_budgets()
BEGIN
	DECLARE _valueDefault DECIMAL(8,2);
    SET _valueDefault = 0.00;
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        CASE
			WHEN detcost.idpresupuesto IS NOT NULL AND detcost.inactive_at IS NULL THEN
				(SUM(detcost.cantidad * detcost.precio_unitario)) 
			ELSE
				_valueDefault
		END AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        LEFT JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
		AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_search_budgets(IN _codigo VARCHAR(8))
BEGIN
	DECLARE _valueDefault DECIMAL(8,2);
    SET _valueDefault = 0.00;
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        CASE
			WHEN detcost.idpresupuesto IS NOT NULL AND detcost.inactive_at IS NULL THEN
				(SUM(detcost.cantidad * detcost.precio_unitario)) 
			ELSE
				_valueDefault
		END AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        LEFT JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
        AND pres.codigo LIKE CONCAT(_codigo,'%')
        AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_get_budget_by_id(IN _idpresupuesto INT)
BEGIN
	DECLARE _valueDefault DECIMAL(8,2);
    SET _valueDefault = 0.00;
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        CASE
			WHEN detcost.idpresupuesto IS NOT NULL AND detcost.inactive_at IS NULL THEN
				(SUM(detcost.cantidad * detcost.precio_unitario)) 
			ELSE
				_valueDefault
		END AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        LEFT JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
        AND pres.idpresupuesto = _idpresupuesto
        AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE spu_list_budgets_assets()
BEGIN
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
		(SUM(detcost.cantidad * detcost.precio_unitario)) AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        INNER JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
        AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END $$
DELIMITER ;
call spu_list_budgets_assets();
DELIMITER $$
CREATE PROCEDURE spu_add_budget
(
	IN _codigo		CHAR(8),
    IN _modelo 		VARCHAR(30),
    IN _idusuario 	INT
)
BEGIN
	INSERT INTO presupuestos(modelo, idusuario, codigo)
					VALUES(_modelo, _idusuario, _codigo);
                    
	SELECT @@last_insert_id AS idpresupuesto,
			codigo,
            modelo
            FROM presupuestos
            WHERE idpresupuesto = @@last_insert_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_count_budgets(IN _idpresuspuesto INT)
BEGIN
	SELECT COUNT(idpresupuesto)
		FROM presupuestos
		WHERE idpresupuesto = _idpresuspuesto;
END $$
DELIMTER ;

DELIMITER $$
CREATE PROCEDURE spu_set_budget
(
	IN _idpresupuesto 		INT,
    IN _codigo 				CHAR(8),
    IN _modelo				VARCHAR(30),
    IN _idusuario			INT
)
BEGIN
	UPDATE presupuestos
		SET
			codigo 		= _codigo,
            modelo		= _modelo,
            idusuario 	= _idusuario,
            update_at 	= CURDATE()
		WHERE idpresupuesto = _idpresupuesto;
        
	SELECT 
		(SELECT ROW_COUNT()) AS filasAfect,
        idpresupuesto,
        codigo,
        modelo
        FROM presupuestos
		WHERE idpresupuesto = _idpresupuesto;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_budget(IN _idpresupuesto INT)
BEGIN
	UPDATE presupuestos
		SET 
			inactive_at = CURDATE()
        WHERE idpresupuesto = _idpresupuesto;
        
	SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_count_budget_idbudget(IN _idpresupuesto INT)
BEGIN
    SELECT EXISTS(SELECT 1 FROM activos WHERE idpresupuesto = _idpresupuesto AND inactive_at IS NULL) AS cantidad;
END
DELIMITER ;
 
-- DETALLE DE COSTOS /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_detail_cost(IN _idpresupuesto INT)
BEGIN
		SELECT
			detcost.iddetalle_costo,
			detcost.idpresupuesto,
			cat.categoria_costo,
            cat.idcategoria_costo,
			subcat.subcategoria_costo,
            subcat.idsubcategoria_costo,
            detcost.idmaterial,
            CASE 
				WHEN detcost.idmaterial IS NOT NULL THEN
				CONCAT(marc.marca, " // ", mat.material, " // ",unimed.unidad_medida)
				ELSE
                detcost.detalle
			END AS detalle,
            detcost.cantidad,
            detcost.precio_unitario,
            (detcost.cantidad * detcost.precio_unitario) AS total,
            pers.nombres AS usuario
			FROM detalle_costos detcost
			INNER JOIN presupuestos pres ON pres.idpresupuesto = detcost.idpresupuesto
			INNER JOIN subcategoria_costos subcat ON subcat.idsubcategoria_costo = detcost.idsubcategoria_costo
			INNER JOIN categoria_costos cat ON cat.idcategoria_costo = subcat.idcategoria_costo
            LEFT JOIN materiales mat ON mat.idmaterial = detcost.idmaterial
            LEFT JOIN marcas marc ON marc.idmarca = mat.idmarca
            LEFT JOIN unidades_medida unimed ON unimed.idunidad_medida = mat.idunidad_medida
			INNER JOIN usuarios usu ON usu.idusuario = detcost.idusuario
			INNER JOIN personas pers ON pers.idpersona = usu.idpersona
			WHERE detcost.idpresupuesto = _idpresupuesto
			AND detcost.inactive_at IS NULL
			ORDER BY cat.categoria_costo, subcat.subcategoria_costo ASC;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_add_detail_cost
(
	IN _idpresupuesto 			INT,
    IN _idsubcategoria_costo	INT,
    IN _idmaterial				INT,
    IN _detalle 				VARCHAR(100),
    IN _cantidad 				TINYINT,
    IN _precio_unitario 		DECIMAL(8,2),
    IN _idusuario 				INT
)
BEGIN
	INSERT INTO detalle_costos(
								idpresupuesto, 
                                idsubcategoria_costo, 
                                idmaterial,
                                detalle,
                                cantidad,
                                precio_unitario,
                                idusuario
                                )
						VALUES(
								_idpresupuesto, 
                                _idsubcategoria_costo, 
                                NULLIF(_idmaterial,""),
                                _detalle,
                                _cantidad,
                                _precio_unitario,
                                _idusuario
							);
                            
	SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_detail_cost
(
	IN _iddetalle_costo	 		INT,
	IN _idpresupuesto 			INT,
    IN _idsubcategoria_costo	INT,
    IN _idmaterial				INT,
    IN _detalle 				VARCHAR(100),
    IN _cantidad 				TINYINT,
    IN _precio_unitario 		DECIMAL(8,2),
    IN _idusuario 				INT	
)
BEGIN
	UPDATE detalle_costos
		SET
			idpresupuesto 			= _idpresupuesto,
            idsubcategoria_costo	= _idsubcategoria_costo,
            idmaterial				= NULLIF(_idmaterial,""),
            detalle					= _detalle,
            cantidad				= _cantidad,
            precio_unitario			= _precio_unitario,
            idusuario 				= _idusuario,
            update_at 				= CURDATE()
        WHERE
			iddetalle_costos = _iddetalle_costo;
            
	SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_cost(IN _iddetalle_costo INT)
BEGIN
	UPDATE detalle_costos
		SET
			inactive_at = CURDATE()
        WHERE iddetalle_costo = _iddetalle_costo;
        
	SELECT ROW_COUNT() AS filasAfect;
    
END $$
DELIMITER ;

-- RESUMEN DE PRESUPUESTO
DELIMITER $$
CREATE PROCEDURE spu_resume_budget_category(IN _idpresupuesto INT)
BEGIN
	SELECT 
		cat.idcategoria_costo,
        cat.categoria_costo,
        SUM(detcost.precio_unitario * detcost.cantidad) AS total
		FROM detalle_costos detcost
        INNER JOIN subcategoria_costos subcat ON subcat.idsubcategoria_costo = detcost.idsubcategoria_costo
        INNER JOIN categoria_costos cat ON cat.idcategoria_costo = subcat.idcategoria_costo
        WHERE detcost.idpresupuesto = _idpresupuesto
        GROUP BY 
			cat.idcategoria_costo;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_resume_budget_subcatgory(IN _idpresupuesto INT)
BEGIN
	SELECT 
		cat.idcategoria_costo,
        cat.categoria_costo,
        subcat.idsubcategoria_costo,
        subcat.subcategoria_costo,
        SUM(detcost.precio_unitario * detcost.cantidad) AS total
		FROM detalle_costos detcost
        INNER JOIN subcategoria_costos subcat ON subcat.idsubcategoria_costo = detcost.idsubcategoria_costo
        INNER JOIN categoria_costos cat ON cat.idcategoria_costo = subcat.idcategoria_costo
		WHERE idpresupuesto = _idpresupuesto
        GROUP BY 
			cat.idcategoria_costo,
            subcat.idsubcategoria_costo;
END $$
DELIMITER ;
call spu_resume_budget_subcatgory(30);

-- SEPARACIONES   ////////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE spu_list_separation_tPersona
(
    IN _tipo_persona VARCHAR(10),
    IN _fechaInicio DATE,
    IN _fechaFin DATE
)
BEGIN

    IF _tipo_persona = "NATURAL" THEN

	SELECT 
		sep.idseparacion,
        sep.n_expediente,
		act.idactivo,
		act.sublote,
		proy.denominacion,
		CONCAT(UPPER(pers.apellidos),", ",LOWER(pers.nombres)) AS cliente,
        clien.tipo_persona,
        pers.documento_tipo,
        pers.documento_nro,
		sep.separacion_monto,
		sep.fecha_pago,
        usuPers.nombres AS usuario
		FROM separaciones AS sep
		INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario 
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
		WHERE sep.inactive_at IS NULL
            AND clien.inactive_at IS NULL
            AND fecha_pago BETWEEN _fechaInicio AND _fechaFin
        ORDER BY sep.idseparacion DESC;

    ELSEIF _tipo_persona = "JURÍDICA" THEN
        SELECT 
		sep.idseparacion,
        sep.n_expediente,
		act.idactivo,
		act.sublote,
		proy.denominacion,
		persj.razon_social AS cliente,
        clien.tipo_persona,
        persj.documento_tipo,
        persj.documento_nro,
		sep.separacion_monto,
		sep.fecha_pago,
        usuPers.nombres AS usuario
		FROM separaciones AS sep
		INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
        INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
        INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario 
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
		WHERE sep.inactive_at IS NULL
            AND clien.inactive_at IS NULL
            AND fecha_pago BETWEEN _fechaInicio AND _fechaFin
        ORDER BY sep.idseparacion DESC;
    END IF;
END $$
SELECT * FROM separaciones;
SELECT * FROM clientes;
DELIMITER ;
call spu_list_separations();
DELIMITER $$
CREATE PROCEDURE spu_list_separation_ByIdAsset(IN _idactivo INT)
BEGIN
	SELECT 
		sep.idseparacion,
        act.sublote,
        proy.denominacion,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        persj.razon_social AS razon_social,
        persj.documento_tipo AS persj_documento_nro,
        persj.documento_nro AS persj_documento_nro,
        conyPers.nombres	AS conyPers_nombres,
        conyPers.apellidos AS conyPers_apellidos,
        conyPers.documento_tipo AS conyPers_documento_tipo,
        conyPers.documento_nro As conyPers_documento_nro,
        sep.separacion_monto,
        sep.fecha_pago,
		sep.imagen,
        usuPers.nombres AS usuario
		FROM separaciones AS sep
        INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        
        INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
        LEFT JOIN personas AS pers ON pers.idpersona = clien.idpersona
        
        LEFT JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
        
		LEFT JOIN clientes AS cony ON cony.idcliente = sep.idconyugue
        LEFT JOIN personas AS conyPers ON conyPers.idpersona = cony.idpersona
        
        INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
        
        WHERE sep.idactivo = _idactivo
        AND sep.inactive_at IS NULL;
END $$
DELIMITER ;

SELECT * FROM clientes;
-- CONTRATOS
DELIMITER $$
CREATE PROCEDURE spu_lits_contracts_full_by_id(IN _idcontrato INT)
BEGIN
	
    SELECT 
		idcontrato,
        tipo_contato,
        idseparacion,
        idrepresentante_primario,
        idrepresentante_secundario,
        idcliente,
        idconyugue,
        idactivo,
        tipo_cambio,
        estado,
        fecha_contrato,
        det_contrato
        FROM contatos
		WHERE idcontrato = _idcontrato;
			
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_add_contracts
(
	IN _tipo_contrato 		VARCHAR(40),
    IN _idseparacion 		INT,
    IN _idrepresentante_primario 	INT,
    IN _idrepresentante_secundario	INT,
	IN _idcliente 			INT,
    IN _idconyugue			INT,
    IN _idactivo			INT,
    IN _tipo_cambio 		DECIMAL(4,3),
    IN _estado 				VARCHAR(10),
    IN _fecha_contrato 		DATE,
    IN _det_contrato		JSON,
    IN _idusuario 			INT
)
BEGIN

	INSERT INTO contratos(
				tipo_contrato, 
                idseparacion, 
                idrepresentante_primario, 
                idrepresentante_secundario,
                idcliente, 
                idconyugue,
                idactivo,  
                tipo_cambio, 
                estado,
                fecha_contrato,
                det_contrato,  
                idusuario
				)
			VALUES(
					tipo_contrato,
                    NULLIF(_idseparacion, ''),
                    idrepresentante_primario,
                    NULLIF(_idrepresentante_secundario,''),
                    NULLIF(_idcliente,''),
					NULLIF(_idconyugue, ''),
                    NULLIF(_idactivo, ''),
					_tipo_cambio, 
                    _estado, 
                    _fecha_contrato,
                    NULLIF(det_contrato,""),  
                    _idusuario
				);
                
	-- RETORNA EL ULTIMO IDCONTRATO
    SELECT @@LAST_INSERT_ID "idusuario";

END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_contracts
(
	IN _idcontrato 			INT,
	IN _tipo_contrato 		VARCHAR(40),
    IN _idseparacion 		INT,
    IN _idrepresentante_primario 	INT,
    IN _idrepresentante_secundario	INT,
	IN _idcliente 			INT,
    IN _idconyugue			INT,
    IN _idactivo			INT,
    IN _tipo_cambio 		DECIMAL(4,3),
    IN _estado 				VARCHAR(10),
    IN _fecha_contrato 		DATE,
    IN _det_contrato		JSON,
    IN _idusuario 			INT
)
BEGIN

	UPDATE contratos
		SET
			tipo_contrato 	= _tipo_contrato, 
			idseparacion	= NULLIF(_idseparacion,''), 
            idrepresentante_primario	= idrepresentante_primario, 
            idrepresentante_secundario	= NULLIF(_idrepresentante_secundario, ''),
			idcliente		= NULLIF(_idcliente,''), 
			idconyugue		= NULLIF(_idconyugue, ''),
			idactivo		= NULLIF(_idactivo, ''),  
			tipo_cambio		= _tipo_cambio, 
			estado			= _estado,
			fecha_contrato 	= _fecha_contrato,
			det_contrato	= NULLIF(_det_contrato, '')  
        WHERE
			idcontrato = _idcontrato;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_inactive_contracts(IN _idcontrato INT)
BEGIN

	UPDATE contratos
		SET
			inactive_at = CURDATE()
		WHERE
			idcontrato = _idcontrato;
            
  SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

-- PRESUPUESTOS
DELIMITER $$
CREATE PROCEDURE spu_list_budgets()
BEGIN
	SELECT
		pres.idpresupuesto,
        pres.modelo,
        pres.medidas,
        pres.descripcion,
        pers.nombres AS usuario
		FROM presupuestos AS pres
        INNER JOIN usuarios AS usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas AS pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL;
END $$
DELIMITER ;

-- PLANTILLA
DELIMITER $$
CREATE PROCEDURE ()
BEGIN
END $$
DELIMITER ;

