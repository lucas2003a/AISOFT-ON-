USE AISOFT;

-- VISTA LISTA UBIGEO
DELIMITER $$
CREATE VIEW vws_ubigeo AS
	SELECT 
			dist.iddistrito,
            dist.distrito,
            prov.provincia,
            dept.departamento
		FROM distritos AS dist
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        ORDER BY dept.departamento ASC;
$$
DELIMITER ;

SELECT * FROM vws_ubigeo;

-- VISTA constructora
DELIMITER $$
CREATE VIEW vws_list_companies AS
	SELECT
		idconstructora,
        ruc,
        razon_social,
        partida_elect
		FROM constructora;
$$
DELIMITER ;

SELECT * FROM vws_list_companies;

-- VISTA PORYECTOS
DELIMITER $$
CREATE VIEW vws_list_projects AS
		SELECT 
			proy.idproyecto,
            proy.imagen,
			proy.idsede,
            sed.direccion AS sede,
            proy.codigo,            
			proy.denominacion,
            proy.latitud,
            proy.longitud,
			dist.iddistrito,
            dist.distrito,
			prov.idprovincia,
            prov.provincia,
			dept.iddepartamento,
            dept.departamento,
			proy.direccion,
			met.l_vendidos,
            met.l_noVendidos,
            met.l_separados,
            (met.l_vendidos + met.l_noVendidos + met.l_separados) as l_total,
			pers.nombres AS usuario
        FROM proyectos AS proy
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN sedes AS sed ON sed.idsede = proy.idsede
        INNER JOIN usuarios AS usu ON usu.idusuario = proy.idusuario
        INNER JOIN personas AS pers ON pers.idpersona = usu.idpersona
        INNER JOIN metricas AS met ON met.idproyecto = proy.idproyecto
        WHERE proy.inactive_at IS NULL
        ORDER BY proy.codigo ASC;
$$
DELIMITER ;

SELECT * FROM vws_list_projects;

DELIMITER $$
CREATE VIEW vws_list_drop_projects AS
		SELECT 
			proy.idproyecto,
            proy.imagen,
			proy.codigo,
			proy.denominacion,
			dist.distrito,
			prov.provincia,
			dept.departamento,
			proy.direccion,
            usu.nombres AS usuario
        FROM proyectos AS proy
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = proy.idusuario
        WHERE proy.inactive_at IS NOT NULL
        ORDER BY codigo ASC;
$$
DELIMITER ;

SELECT * FROM vws_list_drop_projects;

-- ACTIVOS

-- SOLO SE HARÀ POR ID

DELIMITER $$
CREATE VIEW vws_list_assets_short AS
	SELECT
		act.idactivo,
        proy.idproyecto,
        act.propietario_lote,
        act.estado,
        act.sublote,
        act.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        pers.nombres AS usuario
		FROM activos AS act
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = act.idusuario
        INNER JOIN personas AS pers ON pers.idpersona = usu.idpersona
        AND act.inactive_at IS NULL
        ORDER BY act.sublote ASC;
$$
DELIMITER ;

SELECT * FROM vws_list_assets_short;

DELIMITER $$
CREATE VIEW vws_list_inactive_assets AS
	SELECT
		act.idactivo,
        proy.denominacion,
        act.estado,
        act.sublote,
        act.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        usu.nombres AS usuario
		FROM activos AS act
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = act.idusuario
        WHERE act.tipo_activo = "LOTE" 
        AND act.inactive_at IS NOT NULL
        ORDER BY proy.denominacion
$$
DELIMITER ;

SELECT * FROM vws_list_inactive_assets;

-- CLIENTES
DELIMITER $$
CREATE VIEW vws_list_clients AS
	SELECT
		clien.idcliente,
        clien.tipo_persona,
        clien.apellidos,
        clien.nombres,
		clien.documento_tipo,
        clien.documento_nro,
        clien.estado_civil,
        clien.razon_social,
		clien.representante_legal,
        clien.documento_t_representante,
        clien.documento_nro_representante,
        clien.partida_elect,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        clien.direccion,
        usu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN distritos AS dist ON dist.iddistrito = clien.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        WHERE clien.inactive_at IS NULL
        ORDER BY clien.documento_nro ASC;
$$
DELIMITER ;

SELECT * FROM vws_list_clients;

DELIMITER $$
CREATE VIEW vws_list_inactive_clients AS
	SELECT
		clien.idcliente,
        clien.tipo_persona,
        clien.apellidos,
        clien.nombres,
		clien.documento_tipo,
        clien.documento_nro,
        clien.estado_civil,
        clien.razon_social,
		clien.representante_legal,
        clien.documento_t_representante,
        clien.documento_nro_representante,
        clien.partida_elect,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        clien.direccion,
        usu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN distritos AS dist ON dist.iddistrito = clien.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        WHERE clien.inactive_at IS NOT NULL
        ORDER BY clien.documento_nro ASC;
$$
DELIMITER ;

SELECT * FROM vws_list_inactive_clients;

