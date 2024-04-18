DELIMITER $$
CREATE PROCEDURE spu_get_lots_status()
BEGIN
select 
	sum(l_vendidos) as l_vendidos,
    sum(l_noVendidos) as l_noVendidos,
    sum(l_separados) as l_separados
	from metricas 
	where YEAR(update_at) = YEAR(NOW());
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_get_least_sould()
BEGIN
select 
    l_noVendidos,
    proy.idproyecto,
    proy.denominacion,
    proy.imagen
	from metricas AS met
    INNER JOIN proyectos AS proy ON proy.idproyecto = met.idproyecto
	WHERE YEAR(met.update_at) = YEAR(NOW())
    ORDER BY 1 DESC
    LIMIT 1;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_get_most_separations()
BEGIN
select 
    l_separados,
    proy.idproyecto,
    proy.denominacion,
    proy.imagen
	from metricas AS met
    INNER JOIN proyectos AS proy ON proy.idproyecto = met.idproyecto
	WHERE YEAR(met.update_at) = YEAR(NOW())
    ORDER BY 1 DESC
    LIMIT 1;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_get_most_sould()
BEGIN
select 
    l_vendidos,
    proy.idproyecto,
    proy.denominacion,
    proy.imagen
	from metricas AS met
    INNER JOIN proyectos AS proy ON proy.idproyecto = met.idproyecto
	WHERE YEAR(met.update_at) = YEAR(NOW())
    ORDER BY 1 DESC
    LIMIT 1;
END $$
DELIMITER ;

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

DELIMITER $$
CREATE PROCEDURE spu_get_new_clients()
BEGIN
	SELECT 
		sep.idseparacion,
		cli.idcliente,
        cli.apellidos,
        cli.nombres,
        cli.documento_tipo,
        cli.documento_nro,
        act.sublote,
        proy.denominacion
		FROM separaciones AS sep
        INNER JOIN clientes AS cli ON cli.idcliente = sep.idcliente
        INNER JOIN activos AS act ON act.idactivo = sep.idactivo
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        GROUP BY  2
        ORDER BY 2 DESC
        LIMIT 10;
END $$
DELIMITER ;
select * from contratos;
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

