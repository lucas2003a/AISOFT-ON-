USE aisoft;

/* -------------------------------------------------------------------------- */
/*                                  REPORTES                                  */
/* -------------------------------------------------------------------------- */

DELIMITER $$

CREATE PROCEDURE spu_reports_projects()
BEGIN
    SELECT 
        py.idproyecto,
        py.codigo,
        py.denominacion,
        mt.l_vendidos AS vendido,
        mt.l_noVendidos AS no_vendido,
        mt.l_separados AS separado,
        (mt.l_vendidos + mt.l_noVendidos + mt.l_separados)AS total
        FROM metricas mt
        INNER JOIN proyectos py ON py.idproyecto = mt.idproyecto;
END$$

DELIMITER;

-- // ! Para que funcione tiene que obenter el idactivo y el idpresupuesto(del lote)
-- // ! El id presupuesto va para call spu_resume_budget_subcatgory(?)
-- // ! El idactivo va para call spu_reports_det_budgets(?)
DELIMITER $$

CREATE PROCEDURE spu_reports_det_budgets
(
    IN _idactivo INT
)
BEGIN
    
    SELECT  
        ps.idpresupuesto,
        ct.idcategoria_costo,
        sc.idsubcategoria_costo,
        sc.subcategoria_costo,
        dtc.detalle,
        dtc.cantidad,
        dtc.precio_unitario,
        dtc.cantidad * dtc.precio_unitario AS total
        FROM detalle_costos dtc
        INNER JOIN presupuestos ps ON ps.idpresupuesto = dtc.idpresupuesto
        INNER JOIN activos a ON a.idpresupuesto = ps.idpresupuesto
        INNER JOIN subcategoria_costos sc ON sc.idsubcategoria_costo = dtc.idsubcategoria_costo
        INNER JOIN categoria_costos ct ON ct.idcategoria_costo = sc.idcategoria_costo
        WHERE a.idactivo = 5
            AND dtc.inactive_at IS NULL
            AND ps.inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE FUNCTION JSON_ARRAYAGG(next_value TEXT) RETURNS TEXT
BEGIN


DELIMITER ;

CREATE PROCEDURE 
call spu_resume_budget_category(12);