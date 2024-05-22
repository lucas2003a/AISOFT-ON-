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

-- SEPARACIONES
DELIMITER $$
CREATE VIEW vws_list_separations_tpersona_natural AS
    SELECT 
		sep.idseparacion,
        sep.n_expediente,
		act.idactivo,
		act.sublote,
		proy.denominacion,
		CONCAT(UPPER(pers.apellidos),", ",LOWER(pers.nombres)) AS cliente,
        clien.tipo_persona,
        clien.inactive_at AS inactive_at_client,
        pers.documento_tipo,
        pers.documento_nro,
		sep.separacion_monto,
        sep.inactive_at AS inactive_at_sep,
        usuPers.nombres AS usuario,
        sep.CREATE_at
		FROM separaciones AS sep
		INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario 
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
        ORDER BY sep.idseparacion DESC;
DELIMITER ;

DELIMITER $$
CREATE VIEW vws_list_separations_tpersona_juridica AS
    SELECT 
		sep.idseparacion,
        sep.n_expediente,
		act.idactivo,
		act.sublote,
		proy.denominacion,
		persj.razon_social AS cliente,
        clien.tipo_persona,
        clien.inactive_at AS inactive_at_client,
        persj.documento_tipo,
        persj.documento_nro,
		sep.separacion_monto,
		sep.CREATE_at,
        sep.inactive_at AS inactive_at_sep,
        usuPers.nombres AS usuario
		FROM separaciones AS sep
		INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
        INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
        INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario 
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
        ORDER BY sep.idseparacion DESC;
DELIMITER ;

DELIMITER $$
CREATE VIEW vws_list_separations_tpersona_natural_full AS
SELECT 
		sep.idseparacion,
        act.sublote,
        proy.denominacion,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        CONCAT(UPPER(pers.apellidos),", ",LOWER(pers.nombres)) AS cliente,
        pers.documento_tipo,
        pers.documento_nro,
        CONCAT(UPPER(conyPers.apellidos)," ,",LOWER(conyPers.nombres)) AS conyugue,
        conyPers.documento_tipo AS conyPers_documento_tipo,
        conyPers.documento_nro As conyPers_documento_nro,
        sep.separacion_monto,
        sep.CREATE_at,
		sep.imagen,
        sep.inactive_at,
        usuPers.nombres AS usuario
		FROM separaciones AS sep
        INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        
        INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        
		LEFT JOIN clientes AS cony ON cony.idcliente = sep.idconyugue
        LEFT JOIN personas AS conyPers ON conyPers.idpersona = cony.idpersona
        
        INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona;
DELIMITER ;

DELIMITER $$
CREATE VIEW vws_list_separations_tpersona_juridica_full AS
        SELECT
            sep.idseparacion,
            act.sublote,
            proy.denominacion,
            dist.distrito,
            prov.provincia,
            dept.departamento,
            persj.razon_social AS cliente,
            persj.documento_tipo,
            persj.documento_nro,
            sep.separacion_monto,
            sep.CREATE_at,
            sep.imagen,
            usuPers.nombres AS usuario
            FROM separaciones AS sep
            INNER JOIN activos AS act ON act.idactivo = sep.idactivo
            INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
            INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
            INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
            INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
            
            INNER JOIN clientes AS clien ON clien.idcliente = sep.idcliente
            INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            
            INNER JOIN usuarios AS usu ON usu.idusuario = sep.idusuario
            INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
DELIMITER ;

-- DEVOLUCIONES ///////////////////////////////////////////////////////
DELIMITER $$
CREATE VIEW vws_list_refunds AS
    SELECT
        dev.iddevolucion,
        dev.n_expediente AS n_expediente_dev,
        sep.idseparacion,
        sep.n_expediente AS n_expediente_sep,
        dev.detalle,
        dev.monto_devolucion,
        COALESCE(persj.tipo_persona,persn.tipo_persona) AS tipo_persona,
        COALESCE(persj.cliente,persn.cliente) AS cliente,
        COALESCE(persj.documento_tipo,persn.documento_tipo) AS documento_tipo,
        COALESCE(persj.documento_nro,persn.documento_nro) AS documento_nro,
        dev.imagen,
        dev.CREATE_at,
        dev.inactive_at,
        usuPers.nombres
        FROM devoluciones dev
        INNER JOIN separaciones sep ON sep.idseparacion = dev.idseparacion
        LEFT JOIN vws_list_separations_tpersona_juridica AS persj ON persj.idseparacion = dev.idseparacion
        LEFT JOIN vws_list_separations_tpersona_natural AS persn ON persn.idseparacion = dev.idseparacion
        INNER JOIN usuarios usu ON usu.idusuario = dev.idusuario
        INNER JOIN personas AS usuPers ON usuPers.idpersona = usu.idpersona
        ORDER BY dev.iddevolucion DESC;
DELIMITER ;



