USE AISOFT;

-- DEPARTAMENTOS
DELIMITER $$

CREATE PROCEDURE spu_list_departaments()
BEGIN
	SELECT * FROM departamentos
    ORDER BY 2 ASC;
END $$

DELIMITER;

-- PROVINCIAS
DELIMITER $$

CREATE PROCEDURE spu_list_provinces(IN _iddepartamento INT)
BEGIN
	SELECT * 
    FROM provincias 
    WHERE iddepartamento = _iddepartamento
    ORDER BY 3 ASC;
END $$

DELIMITER;

-- DISTRITOS
DELIMITER $$

CREATE PROCEDURE spu_list_districts(IN _idprovincia INT)
BEGIN
	SELECT * 
    FROM distritos
    WHERE idprovincia = _idprovincia
    ORDER BY 3 ASC;
END $$

DELIMITER;

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

DELIMITER;

-- constructora /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_list_companies()
BEGIN
	SELECT * FROM vws_list_companies
    ORDER BY 2;
END $$

DELIMITER;

-- sedes /////////////////////////////////////////////////////////////////////////////////////////////
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

DELIMITER;

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

DELIMITER;

use aisoft;

-- representates DE SEDE ////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_get_represents(IN _idrepresentante INT)
BEGIN
	SELECT 
		rep.idrepresentante,
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
        FROM representantes AS rep
        INNER JOIN personas AS pers ON pers.idpersona = rep.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN sedes AS sed ON sed.idsede = rep.idsede
        WHERE rep.idrepresentante = _idrepresentante
        AND rep.inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_get_represents_idAdress(IN _idsede INT)
BEGIN
	SELECT 
		rep.idrepresentante,
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
        FROM representantes AS rep
        INNER JOIN personas AS pers ON pers.idpersona = rep.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN sedes AS sed ON sed.idsede = rep.idsede
        WHERE rep.idsede = _idsede
        AND rep.inactive_at IS NULL;
END $$

DELIMITER;

-- PROYECTOS //////////////////////////////////////////////////////////////////////////////////

DELIMITER $$
CREATE PROCEDURE spu_list_projects_typeAct
(
    IN _tipo_activo VARCHAR(10)
)
BEGIN
    DECLARE T_act varchar(10);

    SET T_act = _tipo_activo;

    IF _tipo_activo = "CASA" THEN 
        SELECT 
        py.idproyecto,
        py.denominacion,
        T_act as tipo
        FROM proyectos py
        INNER JOIN activos ac ON ac.idproyecto = py.idproyecto
        WHERE py.inactive_at IS NULL
            AND ac.inactive_at IS NULL
            AND ac.tipo_activo = _tipo_activo
            AND ac.estado = "SIN VENDER"
            GROUP BY py.idproyecto
            ORDER BY py.denominacion ASC;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_projects()
BEGIN
	SELECT * FROM vws_list_projects;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_projects_id(IN _idproyecto INT)
BEGIN
	SELECT * FROM vws_list_projects
    WHERE idproyecto = _idproyecto;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_projects_by_code(IN _codigo VARCHAR(20)) -- POR CÓDIGO DEL PROYECTO
BEGIN
		SELECT * FROM vws_list_projects
        WHERE codigo LIKE CONCAT("%", _codigo,"%");
END $$

DELIMITER;

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

DELIMITER;

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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_projects
(
    IN _idproyecto INT,
    IN _idusuario INT
)
BEGIN

	UPDATE proyectos
		SET
			inactive_at = CURDATE(),
            idusuario = _idusuario

		WHERE
			idproyecto = _idproyecto;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

-- LOTES
DELIMITER $$

CREATE PROCEDURE spu_list_assets_by_id
(
    IN _idactivo INT
)
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
        act.area_construccion,
        act.area_techada,
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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_assets_idProject
(
    IN _idproyecto INT
)
BEGIN
	SELECT * FROM vws_list_assets_short
    WHERE idproyecto = _idproyecto;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_assets_short_idpr
(
    IN _idproyecto INT, 
    IN _propietario_lote VARCHAR(10)
)
BEGIN
	SELECT * FROM vws_list_assets_short
    WHERE idproyecto = _idproyecto
    AND propietario_lote = _propietario_lote;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_assets_by_sublote
(
    IN _idproyecto INT, 
    IN _sublote CHAR(5)
) -- => POR SUBLOTE
BEGIN
	SELECT * 
		FROM vws_list_assets_short
        WHERE sublote LIKE CONCAT(_sublote,"%")
        AND idproyecto = _idproyecto;
END $$

DELIMITER;

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
    IN _area_terreno 	DECIMAL(6,2),
    IN _area_construccion 	DECIMAL(6,2),
    IN _area_techada 	DECIMAL(6,2),
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
                        area_construccion,
                        area_techada, 
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
                NULLIF(_area_construccion,""), 
                NULLIF(_area_techada,""), 
                _zcomunes_porcent, 
                _partida_elect,
				NULLIF(_latitud,""), 
                NULLIF(_longitud, ""), 
                NULLIF(_perimetro,""),
                NULLIF(_idpresupuesto,""),
                _propietario_lote,
                nullif(_precio_lote,""),
                NULLIF(_precio_construccion, ""), 
                _precio_venta,
                _idusuario
                );
                
	SELECT ROW_COUNT() as filasAfect;
END $$

DELIMITER;

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
    IN _area_terreno 	DECIMAL(6,2),
    IN _area_construccion 	DECIMAL(6,2),
    IN _area_techada 	DECIMAL(6,2),
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
            area_construccion = _area_construccion,
            area_techada    = _area_techada,
            zcomunes_porcent = _zcomunes_porcent,
            partida_elect 	= _partida_elect,
            latitud 		= NULLIF(_latitud,""),
            longitud		= NULLIF(_longitud,""),
            perimetro 		= NULLIF(_perimetro, ""),
            idpresupuesto	= NULLIF(_idpresupuesto, ""),
            propietario_lote = _propietario_lote,
            precio_lote		= NULLIF(precio_lote,""),
            precio_construccion = NULLIF(_precio_construccion,""),
            precio_venta 	= _precio_venta,
            precio_venta	= _precio_venta,
            idusuario		= _idusuario,
            update_at		= CURDATE() 
		WHERE
			idactivo = _idactivo;
            
	SELECT ROW_COUNT() AS filasAfect;
END$$

DELIMITER;

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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_det_build
(
    IN _idactivo INT, 
    IN _det_casa JSON,
    IN _idusuario INT
)
BEGIN
	DECLARE oldDetCasa JSON;
    
    SET oldDetCasa = (
		SELECT det_casa FROM activos WHERE idactivo = _idactivo
    );
		
	IF _det_casa != oldDetCasa THEN
		UPDATE activos SET
			det_casa = _det_casa,
			update_at = CURDATE(),
            idusuario = _idusuario
		WHERE 
			idactivo = _idactivo;
        
		SELECT ROW_COUNT() AS filasAfect;
	ELSE 
		(SELECT COUNT(*) -2 AS filasAfect FROM activos WHERE idactivo = _idactivo);
    END IF;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_assets
(
    IN _idactivo INT,
    IN _idusuario INT
)
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
				inactive_at = CURDATE(),
                idusuario = _idusuario
			WHERE idactivo = _idactivo;
	ELSE
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Error: el lote tiene un cliente";
    END IF;
    
    SELECT ROW_COUNT() AS filasAfect;
END$$

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_onlyLots
(
    IN _idproyecto INT
)
BEGIN
    SELECT 
        act.idactivo,
        proy.idproyecto,
        proy.denominacion,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta
        FROM activos act
        INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
        WHERE act.tipo_activo = "LOTE"
        AND act.estado = "SIN VENDER"
        AND act.inactive_at IS NULL
        AND proy.idproyecto = _idproyecto
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.clave')) = 0
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.valor')) = 0
        AND act.precio_venta > 0
        ORDER BY act.sublote;
END $$

DELIMITER;
DELIMITER $$

CREATE PROCEDURE spu_list_onlyLots_sep
(
    IN _idproyecto INT
)
BEGIN
    SELECT 
        act.idactivo,
        proy.idproyecto,
        proy.denominacion,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta
        FROM activos act
        INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
        WHERE act.tipo_activo = "LOTE"
        AND act.estado = "SEPARADO"
        AND act.inactive_at IS NULL
        AND proy.idproyecto = _idproyecto
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.clave')) = 0
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.valor')) = 0
        AND act.precio_venta > 0
        ORDER BY act.sublote;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_onlyHouses
(
    IN _idproyecto INT
)
BEGIN
    SELECT 
        act.idactivo,
        proy.idproyecto,
        proy.denominacion,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta
        FROM activos act
        INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
        WHERE act.tipo_activo = "CASA"
        AND act.estado = "SIN VENDER"
        AND act.inactive_at IS NULL
        AND proy.idproyecto = _idproyecto
        AND act.precio_venta > 0
        ORDER BY act.sublote;
END $$

DELIMITER;


-- PERSONAS    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

DELIMTER;

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

DELIMTER;

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

DELIMTER;

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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_person(IN _idpersona INT)
BEGIN 
	UPDATE personas
		SET inactive_at = CURDATE()
	WHERE idpersona = _idpersona;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

-- CLIENTES ---------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE spu_list_clients_contract()
BEGIN
    SELECT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN clientes clien ON clien.idcliente = cont.idcliente 
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = clien.idcliente 
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = clien.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND cont.inactive_at IS NULL
        
    UNION 
    SELECT DISTINCT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN separaciones sep ON sep.idseparacion = cont.idseparacion
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = sep.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = sep.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND cont.inactive_at IS NULL;
    
END $$

DELIMITER $$

CREATE PROCEDURE spu_list_clients_contractID(IN _idcliente INT)
BEGIN
    SELECT 
        cont.idcontrato,
        cont.n_expediente,
        cont.tipo_contrato
        FROM contratos cont
        INNER JOIN clientes clien ON clien.idcliente = cont.idcliente
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = clien.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = clien.idcliente
        WHERE cont.idcliente = _idcliente
        AND cont.estado = 'VIGENTE'
    UNION 
    SELECT  
        cont.idcontrato,
        cont.n_expediente,
        cont.tipo_contrato
        FROM contratos cont
        INNER JOIN separaciones sep ON sep.idseparacion = cont.idseparacion
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = sep.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = sep.idcliente
        WHERE sep.idcliente = _idcliente
        AND cont.estado = "VIGENTE";
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_clients_contractDN(IN _documento_nro VARCHAR(20))
BEGIN
    SELECT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN clientes clien ON clien.idcliente = cont.idcliente
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = clien.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = clien.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND (cl.documento_nro LIKE CONCAT(_documento_nro,'%') OR cn.documento_nro LIKE CONCAT(_documento_nro,'%'))
        AND cont.inactive_at IS NULL
    UNION 
    SELECT DISTINCT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN separaciones sep ON sep.idseparacion = cont.idseparacion
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = sep.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = sep.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND (cl.documento_nro LIKE CONCAT(_documento_nro,'%') OR cn.documento_nro LIKE CONCAT(_documento_nro,'%'))
        AND cont.inactive_at IS NULL;
    
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_clients_onlyNperson()
BEGIN
    SELECT 
        clien.idcliente,
        pers.documento_tipo,
        pers.documento_nro,
        pers.apellidos,
        pers.nombres
        FROM clientes clien
        INNER JOIN personas pers ON pers.idpersona = clien.idpersona
        WHERE clien.inactive_at IS NULL
        AND pers.inactive_at IS NULL
        ORDER BY pers.documento_nro ASC;
END $$

DELIMITER;

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
            persj.idpersona_juridica,
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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

-- PERSONA NATURAL ///////////////////////////////////////////////////////////////////////////////////////////////////////
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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_clients
(
    IN _idcliente INT,
    IN _idusuario INT
)
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
				inactive_at = CURDATE(),
                idusuario = _idusuario
			WHERE
				idcliente = _idcliente;
	
	END IF;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

-- CATEGORíAS COSTOS /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_list_cost_category()
BEGIN
	SELECT
		idcategoria_costo,
        categoria_costo
		FROM categoria_costos;
END $$

DELIMITER;

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

DELIMITER;

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

DELIMITER;

-- UNIDADES DE MEDIDA /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_list_units_measuraments()
BEGIN
	SELECT * FROM unidades_medida
    ORDER BY unidad_medida ASC;
END $$

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_add_budget
(
	IN _codigo		CHAR(8),
    IN _modelo 		VARCHAR(30),
    IN _idusuario 	INT,
    IN _area_construccion DECIMAL(6,2)
)
BEGIN
	INSERT INTO presupuestos(modelo, idusuario, codigo, area_construccion)
					VALUES(_modelo, _idusuario, _codigo, _area_construccion);
                    
	SELECT @@last_insert_id AS idpresupuesto,
			codigo,
            modelo
            FROM presupuestos
            WHERE idpresupuesto = @@last_insert_id;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_count_budgets(IN _idpresuspuesto INT)
BEGIN
	SELECT COUNT(idpresupuesto)
		FROM presupuestos
		WHERE idpresupuesto = _idpresuspuesto;
END $$

DELIMTER;

DELIMITER $$

CREATE PROCEDURE spu_set_budget
(
	IN _idpresupuesto 		INT,
    IN _codigo 				CHAR(8),
    IN _modelo				VARCHAR(30),
    IN _area_construccion   DECIMAL(6,2),
    IN _idusuario			INT
)
BEGIN
	UPDATE presupuestos
		SET
			codigo 		= _codigo,
            modelo		= _modelo,
            area_construccion = _area_construccion,
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

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_budget
(
    IN _idpresupuesto INT,
    IN _idusuario INT
)
BEGIN
	UPDATE presupuestos
		SET 
			inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE idpresupuesto = _idpresupuesto;
        
	SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_count_budget_idbudget
(
    IN _idpresupuesto INT
)
BEGIN
    SELECT EXISTS(SELECT 1 FROM activos WHERE idpresupuesto = _idpresupuesto AND inactive_at IS NULL) AS cantidad;
END

DELIMITER;

-- DETALLE DE COSTOS /////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_list_detail_cost
(
    IN _idpresupuesto INT
)
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

DELIMITER;

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

DELIMITER;

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
			iddetalle_costo = _iddetalle_costo;
            
	SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_cost
(
    IN _iddetalle_costo INT,
    IN _idusuario INT
)
BEGIN
	UPDATE detalle_costos
		SET
			inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE iddetalle_costo = _iddetalle_costo;
        
	SELECT ROW_COUNT() AS filasAfect;
    
END $$

DELIMITER;

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

DELIMITER;

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

DELIMITER;

-- SEPARACIONES   ////////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_list_separations()
BEGIN
    SELECT 
        idseparacion,
        n_expediente,
        idactivo,
        idcliente,
        idconyugue,
        separacion_monto
        FROM separaciones
        ORDER BY n_expediente ASC;

END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_separations_all()
BEGIN

    SELECT 
        sp.idseparacion,
        sp.n_expediente,
        ac.idactivo,
        ac.precio_venta,
        ac.moneda_venta,
        sp.idcliente,
        sp.idconyugue,
        sp.separacion_monto,
        sp.existe_contrato
        FROM separaciones sp
        INNER JOIN activos ac ON ac.idactivo = sp.idactivo 
        WHERE idseparacion NOT IN (
            SELECT cnt.idseparacion
            FROM contratos cnt
            INNER JOIN separaciones sep On sep.idseparacion = cnt.idseparacion
            WHERE cnt.inactive_at IS NULL
            AND sep.inactive_at IS NOT NULL
            AND cnt.idseparacion IS NOT NULL
        )
        AND sp.inactive_at IS NULL
        AND ac.estado = "SEPARADO"
        ORDER BY sp.n_expediente ASC;

END $$

DELIMITER;
DELIMITER $$

CREATE PROCEDURE spu_list_separation_tPersona
(
    IN _tipo_persona VARCHAR(10),
    IN _fechaInicio DATE,
    IN _fechaFin DATE
)
BEGIN

    IF _tipo_persona = "NATURAL" THEN

        SELECT * FROM vws_list_separations_tpersona_natural
		WHERE inactive_at_sep IS NULL
            AND inactive_at_client IS NULL
            AND create_at BETWEEN _fechaInicio AND _fechaFin;

    ELSEIF _tipo_persona = "JURÍDICA" THEN
        SELECT * FROM vws_list_separations_tpersona_juridica
        WHERE inactive_at_sep IS NULL
            AND inactive_at_client IS NULL
            AND create_at BETWEEN _fechaInicio AND _fechaFin;
    END IF;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_separation_ByIdAsset 
(
    IN _idactivo INT
)
BEGIN

    SELECT 
        lcn.idseparacion,
        lcn.idcliente,
        lcn.cliente,
        lcn.documento_nro,
        lcn.tipo_persona,
        lcn.existe_contrato
    FROM
        vws_list_separations_tpersona_natural_full lcn
        LEFT JOIN separaciones sep ON sep.idseparacion = lcn.idseparacion
    WHERE
        sep.idactivo = 6
        AND lcn.inactive_at IS NULL
    UNION
    SELECT 
        lcj.idseparacion,
        lcj.idcliente,
        lcj.cliente,
        lcj.documento_nro,
        lcj.tipo_persona,
        lcj.existe_contrato
    FROM
        vws_list_separations_tpersona_juridica_full lcj
        LEFT JOIN separaciones sep ON sep.idseparacion = lcj.idseparacion
    WHERE
    sep.idactivo = 6
    AND lcj.inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_separation_n_expediente_docNro
(
    IN _tipo_persona VARCHAR(10),
    IN _fechaInicio DATE,
    IN _fechaFin DATE,
    IN _campoCriterio VARCHAR(12)
)
BEGIN

    IF _tipo_persona = "NATURAL" THEN

        SELECT * FROM vws_list_separations_tpersona_natural
            WHERE inactive_at_sep IS NULL
                AND inactive_at_client IS NULL
                AND create_at BETWEEN _fechaInicio AND _fechaFin
                AND n_expediente LIKE CONCAT(_campoCriterio,'%')
                OR documento_nro LIKE CONCAT(_campoCriterio,'%');

    ELSEIF _tipo_persona = "JURÍDICA" THEN
        SELECT * FROM vws_list_separations_tpersona_juridica
        WHERE inactive_at_sep IS NULL
            AND inactive_at_client IS NULL
            AND create_at BETWEEN _fechaInicio AND _fechaFin
           AND n_expediente LIKE CONCAT(_campoCriterio,'%')
           OR documento_nro LIKE CONCAT(_campoCriterio,'%');
    END IF;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_add_separation
(
    IN _n_expediente    VARCHAR(10),
    IN _idactivo        INT,
    IN _idcliente       INT,
    IN _idconyugue      INT,
    IN _separacion_monto DECIMAL(8,2),
    IN _moneda_venta    VARCHAR(10),
    IN _tipo_cambio     DECIMAL(5,4),
    IN _imagen          VARCHAR(200),
    IN _idusuario       INT
)
BEGIN
    INSERT INTO separaciones (
            n_expediente,
            idactivo,
            idcliente,
            idconyugue,
            separacion_monto,
            moneda_venta,
            tipo_cambio,
            imagen,
            idusuario
    ) 
        VALUES(
            _n_expediente,
            _idactivo,
            _idcliente,
            NULLIF(_idconyugue,''),
            _separacion_monto,
            _moneda_venta,
            _tipo_cambio,
            _imagen,
            _idusuario
        );

    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_separation
(
    IN _idseparacion    INT,
    IN _n_expediente    VARCHAR(10),
    IN _idactivo        INT,
    IN _idcliente       INT,
    IN _idconyugue      INT,
    IN _separacion_monto DECIMAL(8,2),
    IN _moneda_venta    VARCHAR(10),
    IN _tipo_cambio     DECIMAL(5,4),
    IN _imagen          VARCHAR(200),
    IN _idusuario       INT
)
BEGIN
    UPDATE separaciones 
        SET
            n_expediente   = _n_expediente,
            idactivo       = _idactivo,
            idcliente      = _idcliente,
            idconyugue     = NULLIF(_idconyugue,''),
            separacion_monto = _separacion_monto,
            moneda_venta     = _moneda_venta,
            tipo_cambio     = _tipo_cambio,
            imagen         = _imagen,
            idusuario      = _idusuario,
            update_at      = CURDATE()
        WHERE idseparacion = _idseparacion;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER $$

CREATE PROCEDURE spu_inactive_separation
(
    IN _idseparacion INT,
    IN _idusuario    INT
)
BEGIN
    UPDATE separaciones
        SET
            inactive_at = CURDATE(),
            idusuario   = _idusuario
        WHERE idseparacion = _idseparacion;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_get_separation_ById
(
    IN _idseparacion INT
)
BEGIN
    DECLARE _tpersona VARCHAR(10);

    SET _tpersona = (
        SELECT tipo_persona
        FROM clientes cli 
        INNER JOIN separaciones sep on sep.idcliente = cli.idcliente
        WHERE sep.idseparacion = _idseparacion
    );

    IF _tpersona = "NATURAL" THEN
        SELECT * FROM vws_list_separations_tpersona_natural_full
            WHERE idseparacion = _idseparacion;

    ELSEIF _tpersona = "JURÍDICA" THEN
        SELECT * FROM vws_list_separations_tpersona_juridica_full
            WHERE idseparacion = _idseparacion;
    END IF;
END $$

DELIMITER;


-- DEVLOUCIONES   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_list_refunds_get()
BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE sup_list_refunds_tRefund
(
    IN _tipo_devolucion    VARCHAR(20),
    IN _fechaInicio     DATE,
    IN _fechaFin        DATE
)
BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE tipo_devolucion = _tipo_devolucion
            AND create_at BETWEEN _fechaInicio AND _fechaFin
            AND inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE sup_list_refunds_n_expedientes
(
    IN _tipo_devolucion    VARCHAR(20),
    IN _fechaInicio     DATE,
    IN _fechaFin        DATE,
    IN _n_expediente    VARCHAR(10)
)
BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE tipo_devolucion = _tipo_devolucion
            AND create_at BETWEEN _fechaInicio AND _fechaFin
            AND inactive_at IS NULL
            AND n_expediente_dev LIKE CONCAT(_n_expediente,'%');
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE sup_list_refunds_ById
(
    IN _iddevolucion INT
)
BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE iddevolucion = _iddevolucion;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_add_refund
(
    IN _n_expediente    VARCHAR(10),
    IN _idseparacion    INT,
    IN _idcontrato        INT,
    IN _tipo_devolucion VARCHAR(20),
    IN _detalle         VARCHAR(200),
    IN _porcentaje_penalidad  TINYINT,
    IN _monto_devolucion DECIMAL(8,2),
    IN _imagen          VARCHAR(100),
    IN _idusuario       INT
)
BEGIN
    INSERT INTO devoluciones(
                    n_expediente,
                    idseparacion,
                    idcontrato,
                    tipo_devolucion,
                    detalle,
                    porcentaje_penalidad,
                    monto_devolucion,
                    imagen,
                    idusuario
                )
                VALUES(
                    _n_expediente,
                    NULLIF(_idseparacion,''),
                    NULLIF(_idcontrato,''),
                    _tipo_devolucion,
                    _detalle,
                    _porcentaje_penalidad,
                    _monto_devolucion,
                    _imagen,
                    _idusuario
                );

    SELECT ROW_COUNT() AS filasAfect;
END

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_refund
(
    IN _iddevolucion    INT,
    IN _n_expediente    VARCHAR(10),
    IN _idseparacion    INT,
    IN _idcontrato    INT,
    IN _tipo_devolucion VARCHAR(20),
    IN _detalle         VARCHAR(200),
    IN _porcentaje_penalidad  TINYINT,
    IN _monto_devolucion DECIMAL(8,2),
    IN _imagen          VARCHAR(100),
    IN _idusuario       INT
)
BEGIN
    UPDATE devoluciones
        SET
            n_expediente   = _n_expediente,
            idseparacion   = NULLIF(_idseparacion,'0'),
            idcontrato    = NULLIF(_idcontrato,'0'),
            tipo_devolucion = _tipo_devolucion,
            detalle        = _detalle,
            porcentaje_penalidad = _porcentaje_penalidad,
            monto_devolucion = _monto_devolucion,
            imagen         = _imagen,
            update_at      = CURDATE(),
            idusuario      = _idusuario
        WHERE
            iddevolucion = _iddevolucion;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_inactive_refund
(
    IN _iddevolucion INT,
    IN _idusuario    INT
)
BEGIN
    UPDATE devoluciones
        SET
            inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE
            iddevolucion = _iddevolucion;

    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;
-- CONTRATOS  ////////////////////////////////////////////////////////////////////////////////////

DELIMITER $$
CREATE PROCEDURE spu_list_contractsAll()
BEGIN
    SELECT 
        idcontrato,
        n_expediente
        FROM contratos;

END $$
DELIMITER ;
DELIMITER $$

CREATE PROCEDURE spu_list_contracts_types
(
    IN _tipo_contrato VARCHAR(40)
)
BEGIN
    SELECT *
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
        ) AS resultado
        ORDER BY idcontrato DESC;
END $$

DELIMITER;

DELIMITER $$
CREATE PROCEDURE spu_list_contracts_types_date
(
    IN _tipo_contrato VARCHAR(40),
    IN _fecha_inicio DATE,
    IN _fecha_fin DATE
)
BEGIN
    SELECT *
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.inactive_at IS NULL
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.inactive_at IS NULL
        ) AS resultado
        WHERE resultado.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
        ORDER BY idcontrato DESC;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_list_contracts_types_date_n_expediente
(
    IN _tipo_contrato VARCHAR(40),
    IN _fecha_inicio DATE,
    IN _fecha_fin DATE,
    IN _n_expediente VARCHAR(40)
)
BEGIN
    SELECT *
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.n_expediente LIKE CONCAT(_n_expediente,'%')
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.n_expediente LIKE CONCAT(_n_expediente,'%')
        ) AS resultado
        WHERE resultado.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
        ORDER BY idcontrato DESC;
END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE spu_existContract_idseparacion
(
    IN _idseparacion INT
)
BEGIN
    SELECT EXISTS(SELECT 1 FROM contratos
    WHERE idseparacion = _idseparacion
    AND inactive_at IS NULL) AS existContract;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_lits_contracts_full_by_id
(
    IN _idcontrato INT
)
BEGIN
	
    SELECT 
        rs.idcontrato,
        rs.n_expediente,
        rs.tipo_contrato,
        rs.idrepresentante_primario,
        CONCAT(per.apellidos,', ',per.nombres) representante_primario,
        per.documento_tipo AS rp_doc_type,
        per.documento_nro AS rp_doc_nro,
        rs.idrepresentante_secundario,
        rs.idcliente,
        CONCAT(pers.apellidos,', ',pers.nombres) AS representante_secundario,
        pers.documento_tipo AS rs_doc_type,
        pers.documento_nro AS rs_doc_nro,
        sd.idsede,
        sd.iddistrito AS sede_distrito,
        rs.cliente,
        rs.tipo_persona,
        rs.documento_tipo,
        rs.documento_nro,
        CONCAT(pery.apellidos,', ',pery.nombres) AS conyugue,
        pery.documento_tipo AS dc_type,
        pery.documento_nro AS dc_nro, 
        rs.idseparacion,
        rs.n_separacion,
        rs.idactivo,
        rs.sublote,
        rs.idproyecto,
        rs.denominacion,
        rs.tipo_cambio,
        rs.estado,
        rs.fecha_contrato,
        rs.det_contrato,
        rs.precio_venta,
        rs.moneda_venta,
        rs.inicial,
        rs.archivo,
        rs.nombres
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.idrepresentante_primario,
                cnt.idrepresentante_secundario,
                sp.idcliente,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.idconyugue,
                sp.idseparacion,
                sp.n_expediente AS n_separacion,
                ac.idactivo, 
                ac.sublote,
                py.idsede,
                py.idproyecto,
                py.denominacion,
                cnt.tipo_cambio,
                cnt.estado,
                cnt.fecha_contrato,
                cnt.det_contrato,
                cnt.precio_venta,
                cnt.moneda_venta,
                cnt.inicial,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN activos ac ON ac.idactivo = sp.idactivo
                INNER JOIN proyectos py ON py.idproyecto = ac.idproyecto
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                AND cnt.inactive_at IS NULL
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.idrepresentante_primario,
                cnt.idrepresentante_secundario,
                cl.idcliente,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.idconyugue,
                sp.idseparacion,
                sp.n_expediente AS n_separacion,
                ac.idactivo,
                ac.sublote,
                py.idsede,
                py.idproyecto,
                py.denominacion,
                cnt.tipo_cambio,
                cnt.estado,
                cnt.fecha_contrato,
                cnt.det_contrato,
                cnt.precio_venta,
                cnt.moneda_venta,
                cnt.inicial,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                LEFT JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN activos ac ON ac.idactivo = cnt.idactivo
                INNER JOIN proyectos py ON py.idproyecto = ac.idproyecto
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.inactive_at IS NULL
        ) AS rs
        INNER JOIN representantes rp ON rp.idrepresentante = rs.idrepresentante_primario
        INNER JOIN personas per ON per.idpersona = rp.idpersona
        INNER JOIN sedes sd ON sd.idsede = rs.idsede

        LEFT JOIN representantes rsec ON rsec.idrepresentante = rs.idrepresentante_secundario
        LEFT JOIN personas pers ON pers.idpersona = rsec.idpersona

        LEFT JOIN clientes cly ON cly.idcliente = rs.idconyugue
        LEFT JOIN personas pery ON pery.idpersona = cly.idpersona
        WHERE rs.idcontrato = _idcontrato;
			
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_add_contract
(
    IN _n_expediente         VARCHAR(10),
	IN _tipo_contrato 		VARCHAR(40),
    IN _idseparacion 		INT,
    IN _idrepresentante_primario 	INT,
    IN _idrepresentante_secundario	INT,
	IN _idcliente 			INT,
    IN _idconyugue			INT,
    IN _idactivo			INT,
    IN _tipo_cambio 		DECIMAL(4,3),
    IN _fecha_contrato 		DATE,
    IN _precio_venta 		DECIMAL(8,2),
    IN _moneda_venta        VARCHAR(10),
    IN _inicial 			DECIMAL(8,2),
    IN _det_contrato		JSON,
    IN _archivo             VARCHAR(100),
    IN _idusuario 			INT
)
BEGIN

	INSERT INTO contratos(
                n_expediente,
				tipo_contrato, 
                idseparacion, 
                idrepresentante_primario, 
                idrepresentante_secundario,
                idcliente, 
                idconyugue,
                idactivo,  
                tipo_cambio, 
                fecha_contrato,
                precio_venta,
                moneda_venta,
                inicial,
                det_contrato,  
                archivo,
                idusuario
				)
			VALUES(
                    _n_expediente,
					_tipo_contrato,
                    NULLIF(_idseparacion, ''),
                    _idrepresentante_primario,
                    NULLIF(_idrepresentante_secundario,''),
                    NULLIF(_idcliente,''),
					NULLIF(_idconyugue, ''),
                    NULLIF(_idactivo, ''),
					_tipo_cambio, 
                    _fecha_contrato,
                    _precio_venta,
                    _moneda_venta,
                    _inicial,
                    NULLIF(_det_contrato,""), 
                    _archivo,
                    _idusuario
				);
                
	SELECT @@last_insert_id AS idcontrato;

END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_contract

(
	IN _idcontrato 			INT,
	IN _n_expediente         VARCHAR(10),
	IN _tipo_contrato 		VARCHAR(40),
    IN _idseparacion 		INT,
    IN _idrepresentante_primario 	INT,
    IN _idrepresentante_secundario	INT,
	IN _idcliente 			INT,
    IN _idconyugue			INT,
    IN _idactivo			INT,
    IN _tipo_cambio 		DECIMAL(4,3),
    IN _fecha_contrato 		DATE,
    IN _precio_venta 		DECIMAL(8,2),
    IN _moneda_venta        VARCHAR(10),
    IN _inicial 			DECIMAL(8,2),
    IN _det_contrato		JSON,
    IN _archivo             VARCHAR(100),
    IN _idusuario 			INT
)
BEGIN

	UPDATE contratos
		SET
            n_expediente   = _n_expediente,
			tipo_contrato 	= _tipo_contrato, 
			idseparacion	= NULLIF(_idseparacion,''), 
            idrepresentante_primario	= idrepresentante_primario, 
            idrepresentante_secundario	= NULLIF(_idrepresentante_secundario, ''),
			idcliente		= NULLIF(_idcliente,''), 
			idconyugue		= NULLIF(_idconyugue, ''),
			idactivo		= NULLIF(_idactivo, ''),  
			tipo_cambio		= _tipo_cambio, 
			fecha_contrato 	= _fecha_contrato,
            precio_venta		= _precio_venta,
			det_contrato	    = NULLIF(_det_contrato, ''),
            moneda_venta        = _moneda_venta,
            inicial 			= _inicial,
            archivo			= _archivo,
            idusuario		= _idusuario,
            update_at		= CURDATE()
        WHERE
			idcontrato = _idcontrato;

    SELECT _idcontrato AS idcontrato;
END $$

DELIMITER;
DELIMITER $$

CREATE PROCEDURE spu_inactive_contracts
(
    IN _idcontrato INT,
    IN _idusuario INT
)
BEGIN

	UPDATE contratos
		SET
			inactive_at = CURDATE(),
            idusuario = _idusuario
		WHERE
			idcontrato = _idcontrato;
            
  SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_existContract
(
    IN _idcontrato INT
)
BEGIN
    SELECT EXISTS(SELECT 1 FROM contratos 
                WHERE idcontrato = _idcontrato AND inactive_at IS NULL
                );
END $$

DELIMITER;
-- DETALLES DE CONTRATOS  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DELIMITER $$
CREATE PROCEDURE spu_list_det_contracts
(
    IN _idcontrato INT
)
BEGIN
    SELECT 
        dtc.iddetalle_contrato,
        cnt.idcontrato,
        cnt.n_expediente,
        cnt.precio_venta,
        cnt.fecha_contrato,
        rp.idrepresentante,
        rp.representante_legal,
        rp.documento_tipo,
        rp.documento_nro,
        rp.cargo,
        rp.partida_elect
        FROM detalles_contratos dtc
        INNER JOIN contratos cnt ON cnt.idcontrato = dtc.idcontrato
        INNER JOIN rep_legales_clientes rp ON rp.idrepresentante = dtc.idrepresentante
        WHERE cnt.idcontrato = _idcontrato
        AND dtc.inactive_at IS NULL
        ORDER BY cnt.n_expediente;
END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE spu_list_det_contract_ById
(
    IN _iddetalle_contrato INT
)
BEGIN
    SELECT 
        dtc.iddetalle_contrato,
        cnt.idcontrato,
        cnt.n_expediente,
        cnt.precio_venta,
        cnt.fecha_contrato,
        rp.representante_legal,
        rp.documento_tipo,
        rp.documento_nro,
        rp.cargo,
        rp.partida_elect
        FROM detalles_contratos dtc
        INNER JOIN contratos cnt ON cnt.idcontrato = dtc.idcontrato
        INNER JOIN rep_legales_clientes rp ON rp.idrepresentante = dtc.idrepresentante
        WHERE dtc.iddetalle_contrato = _iddetalle_contrato
        AND dtc.inactive_at IS NULL
        ORDER BY cnt.n_expediente;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_add_det_contract
(
    IN _idrepresentante INT,
    IN _idcontrato INT
)
BEGIN
    INSERT INTO detalles_contratos(idrepresentante, idcontrato)
                        VALUES (_idrepresentante, _idcontrato);
    
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_set_det_contract
(
    IN _iddetalle_contrato INT,
    IN _idrepresentante INT,
    IN _idcontrato INT
)
BEGIN
    UPDATE detalles_contratos
        SET 
            idrepresentante = _idrepresentante, 
            idcontrato = _idcontrato,
            update_at = CURDATE()
        WHERE
            iddetalle_contrato = _iddetalle_contrato;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_inactive_det_contract
(
    IN _iddetalle_contrato INT
)
BEGIN
    UPDATE detalles_contratos
        SET
            inactive_at = CURDATE()
        WHERE
            iddetalle_contrato = _iddetalle_contrato;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

-- CUOTAS /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DELIMITER $$

CREATE PROCEDURE spu_list_quotas_reprogram
(
    IN _idcontrato INT
)
BEGIN
    SELECT 
        lq.idcontrato,
        ct.idcontrato,
        ct.precio_venta,
        COALESCE(ct.inicial,0) AS inicial,
        (SUM(lq.cancelado)) as monto_cancelado,
        (ct.precio_venta - COALESCE(ct.inicial,0) - (SUM(lq.cancelado))) as saldo
        FROM vws_list_quotas lq
        INNER JOIN contratos ct ON ct.idcontrato = lq.idcontrato
        WHERE ct.idcontrato = _idcontrato;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_quotas_allNoPay
(
    IN _idcontrato INT,
    IN _idusuario INT
)
BEGIN
    UPDATE cuotas
        SET
            inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE inactive_at IS NULL
        AND estado != "CANCELADO"
        AND idcontrato = _idcontrato;

    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_quotas_idcontrato
(
    IN _idcontrato INT
)
BEGIN
    SELECT *
        FROM vws_list_quotas
        WHERE idcontrato = _idcontrato
        AND inactive_at IS NULL
        ORDER BY fecha_vencimiento;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_quotas_ById
(
    IN _idcuota INT
)
BEGIN
    SELECT  
            detc.iddetalle_cuota,
            qt.idcuota,
            ct.idcontrato,
            ct.n_expediente,
            qt.monto_cuota,
            (SUM(detc.monto_pago)) as cancelado,
            (qt.monto_cuota - (COALESCE(SUM(detc.monto_pago),0.00))) as deuda,
            qt.fecha_vencimiento,
            (SELECT fecha_pago 
            FROM detalle_cuotas 
            WHERE idcuota = qt.idcuota
            ORDER BY iddetalle_cuota DESC LIMIT 1) AS fecha_pago,
            qt.estado,
            detc.entidad_bancaria,
            detc.tipo_pago,
            detc.detalles,
            detc.imagen,
            pers.nombres AS usuario,
            qt.inactive_at
        FROM cuotas qt
        LEFT JOIN detalle_cuotas detc ON detc.idcuota = qt.idcuota
        INNER JOIN contratos ct ON ct.idcontrato = qt.idcontrato
        INNER JOIN usuarios usu ON usu.idusuario = qt.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE detc.inactive_at IS NULL
        AND qt.idcuota = _idcuota
        AND qt.inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_list_quotas_estado
(
    IN _idcontrato INT,
    IN _estado VARCHAR(20)
)
BEGIN

    IF _estado = "0" THEN 
        SELECT *
            FROM vws_list_quotas
            WHERE idcontrato = _idcontrato
            AND inactive_at IS NULL
            ORDER BY fecha_vencimiento;
    ELSE
        SELECT *
            FROM vws_list_quotas
            WHERE idcontrato = _idcontrato
            AND estado = _estado
            AND inactive_at IS NULL
            ORDER BY fecha_vencimiento;
    END IF;
END $$

DELIMITER;

DELIMITER $$
CREATE PROCEDURE spu_list_quotas_estado_fven
(
    IN _idcontrato INT,
    IN _estado VARCHAR(20),
    IN _fecha_vencimiento DATE
)
BEGIN

    IF _estado = "0" THEN 
        SELECT *
            FROM vws_list_quotas
            WHERE idcontrato = _idcontrato
            AND fecha_vencimiento <= _fecha_vencimiento
            AND inactive_at IS NULL
            ORDER BY fecha_vencimiento;
    ELSE
        SELECT *
            FROM vws_list_quotas
            WHERE idcontrato = _idcontrato
            AND estado = _estado
            AND fecha_vencimiento <= _fecha_vencimiento
            AND inactive_at IS NULL
            ORDER BY fecha_vencimiento;
    END IF;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_statusQuota_automaticly
(
    IN _idcuota INT,
    IN _estado VARCHAR(20)
)
BEGIN
    UPDATE cuotas
        SET
            estado = _estado
        WHERE
        idcuota = _idcuota;
    
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

-- CUOTAS
DELIMITER $$

CREATE PROCEDURE spu_add_quota
(
    IN _idcontrato INT,
    IN _monto_cuota DECIMAL(8,2),
    IN _fecha_vencimiento DATE,
    IN _idusuario INT
)
BEGIN
    INSERT INTO cuotas(idcontrato, monto_cuota, fecha_vencimiento, idusuario)
                VALUES(_idcontrato, _monto_cuota, _fecha_vencimiento, _idusuario);
                
    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_set_det_quota
(
    IN _idcuota         INT,
    IN _fecha_pago      DATE,
    IN _monto_pago      DECIMAL(8,2),
    IN _detalles        VARCHAR(100),
    IN _tipo_pago       VARCHAR(20),
    IN _entidad_bancaria VARCHAR(20),
    IN _imagen          VARCHAR(100),
    IN _idusuario       INT
)
BEGIN
    DECLARE _countInsert INT;
    DECLARE _countUpdate INT;

    INSERT INTO detalle_cuotas(
        idcuota,
        fecha_pago,
        monto_pago,
        detalles,
        tipo_pago,
        entidad_bancaria,
        imagen
    )
    VALUES (
        _idcuota,
        _fecha_pago,
        _monto_pago,
        _detalles,
        _tipo_pago,
        _entidad_bancaria,
        _imagen
    );

    SET _countInsert =  (SELECT ROW_COUNT());

    UPDATE cuotas
        SET
        estado = "CANCELADO",
        idusuario = _idusuario,
        update_at = CURDATE()
        WHERE idcuota = _idcuota;

    SET _countUpdate = (SELECT ROW_COUNT());

    CASE 
        WHEN _countUpdate = 0 THEN
            SELECT (_countInsert) AS filasAfect;
        
        ELSE
            SELECT (_countUpdate) AS filasAfect;
    END CASE;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_cancel_det_quota
(
    IN _idcuota         INT,
    IN _idusuario         INT
)
BEGIN
    UPDATE detalle_cuotas
        SET
            inactive_at = CURDATE()
        WHERE idcuota = _idcuota
        AND inactive_at IS NULL;

    UPDATE cuotas
        SET
            estado = "POR CANCELAR",
            idusuario = _idusuario,
            update_at = CURDATE()
        WHERE idcuota = _idcuota;


    SELECT ROW_COUNT() AS filasAfect;
END $$

CREATE PROCEDURE spu_inactive_quota
(
    IN _idcuota         INT,
    IN _idusuario         INT
)
BEGIN
    UPDATE cuotas
        SET
        inactive_at = CURDATE(),
        idusuario = _idusuario
        WHERE idcuota = _idcuota;

    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

-- USUARIOS ///////////////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE spu_user_login
(
    IN _correo VARCHAR(60)
)
BEGIN
    SELECT
        usu.idusuario,
        usu.imagen,
        usu.correo,
        usu.contrasenia,
        pr.apellidos,
        pr.nombres,
        pr.documento_tipo,
        pr.documento_nro,
        rl.idrol,
        rl.rol,
        sd.direccion
        FROM usuarios usu
        INNER JOIN personas pr ON pr.idpersona = usu.idpersona
        INNER JOIN roles rl ON rl.idrol = usu.idrol
        INNER JOIN sedes sd ON sd.idsede = usu.idsede
        WHERE usu.inactive_at IS NULL
        AND usu.correo = _correo;
END $$

DELIMITER;

DELIMITER $$
CREATE PROCEDURE spu_set_password
(
    IN _idusuario INT,
    IN _contrasenia VARCHAR(255)
)
BEGIN
    UPDATE usuarios
        SET 
            contrasenia = _contrasenia
        WHERE
            idusuario = _idusuario;

    SELECT ROW_COUNT() AS filasAfect;
END $$
DELIMITER ;

-- ACTTUALIZACIONES
DELIMITER $$
CREATE PROCEDURE spu_list_updates
(
    IN _fechaInicio DATE,
    IN _fechaFin DATE
)
BEGIN 
    SELECT 
        idactualizacion,
        objeto_cambio,
        motivo,
        detalle,
        usuario,
        create_at
        FROM actualizaciones
        WHERE DATE(create_at) BETWEEN _fechaInicio AND _fechaFin
        ORDER BY create_at DESC;
END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE spu_add_update
(
    IN _objeto_cambio   VARCHAR(200),
    IN _motivo          VARCHAR(45),
    IN _detalle         VARCHAR(200),
    IN _usuario         VARCHAR(150)
)
BEGIN
    INSERT INTO actualizaciones(
                    objeto_cambio,
                    motivo,
                    detalle,
                    usuario
                )
                VALUES(
                    _objeto_cambio,
                    _motivo,
                    _detalle,
                    _usuario
                );

    SELECT ROW_COUNT() AS filasAfect;
END $$

DELIMITER;

-- CONFIGURACIONES
DELIMITER $$

CREATE PROCEDURE spu_list_configs
(
    IN _clave VARCHAR(100)
)
BEGIN
    SELECT * 
    FROM configuraciones 
    WHERE clave = _clave;
END $$

DELIMITER;

CALL spu_list_configs("contrasenia_defecto");

insert into configuraciones(clave, valor) values("contrasenia_defecto","peru2024");
-- PLANTILLA
DELIMITER $$

CREATE PROCEDURE ()
BEGIN
END $$

DELIMITER;

