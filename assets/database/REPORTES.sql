DELIMITER $$
CREATE PROCEDURE spu_get_lots_status()
BEGIN
	SELECT 
		(SUM(l_vendidos)) AS l_vendidos,
        (SUM(l_noVendidos)) AS l_noVendidos,
        (SUM(l_separados)) AS l_separados
	FROM metricas;
END $$
DELIMITER $$
CREATE PROCEDURE spu_get_yearly_sales()
BEGIN
select 
	(COUNT(*)) as "cantidad",
    fecha_contrato
    FROM contratos
    WHERE inactive_at IS NULL
    AND YEAR(fecha_contrato) = YEAR(CURDATE())
    GROUP BY MONTH(fecha_contrato)
    ORDER BY 1 DESC; 
END $$
DELIMITER ;
select * from clientes

DELIMITER $$
CREATE PROCEDURE spu_get_new_clients()
BEGIN
	WITH personasInfo AS(
		SELECT 
        idpersona,
		CONCAT(nombres,'',apellidos) As cliente,
        documento_tipo,
        documento_nro,
        direccion
        FROM personas
    ),
    personasj AS(
		SELECT
			idpersona_juridica,
			razon_social AS cliente,
            documento_tipo,
            documento_nro,
            direccion
            FROM personas_juridicas
    )
    
	SELECT 
		sep.idseparacion,
		cli.idcliente,
        cli.tipo_persona,
        pi.*,
        pj.*,
        act.sublote,
        proy.denominacion
		FROM separaciones AS sep
        INNER JOIN clientes AS cli ON cli.idcliente = sep.idcliente
        INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        LEFT JOIN personasInfo AS pi ON pi.idpersona = cli.idpersona
        LEFT JOIN personasj AS pj ON pj.idpersona_juridica = cli.idpersona_juridica
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        GROUP BY  2
        ORDER BY 2 DESC
        LIMIT 10;
END $$
DELIMITER ;
CALL spu_get_new_clients();
select * from separaciones;
DELIMITER $$
CREATE PROCEDURE spu_get_lot_reports(IN _idproyecto INT)
BEGIN
	SELECT 
		proy.denominacion,
        proy.codigo,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta,
        act.area_terreno,
        met.l_vendidos,
        met.l_noVendidos,
        met.l_separados,
        (l_vendidos + l_noVendidos + l_separados) AS l_total
        FROM activos AS act
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN metricas AS met ON met.idproyecto = proy.idproyecto
        WHERE act.idproyecto = _idproyecto
        ORDER BY act.sublote ASC;
END $$
DELIMITER ;
call spu_get_most_separations();
update proyectos set imagen = null;

SELECT * FROM metricas;

