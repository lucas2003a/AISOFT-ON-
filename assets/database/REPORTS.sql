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
        WHERE a.idactivo = _idactivo
            AND dtc.inactive_at IS NULL
            AND ps.inactive_at IS NULL;
END $$

DELIMITER;

DELIMITER $$

CREATE PROCEDURE spu_reports_cuotas
(
    IN _idcontrato INT
)
BEGIN
    SELECT ct.idcuota,
            ct.nro_cuota,
            ct.idcontrato,
            ct.monto_cuota,
            ct.estado,
			ct.fecha_vencimiento,
			COALESCE(rs.fecha_pago,'0000-00-00') AS fecha_pago, -- // ! Inidica la fecha que fué pagada la cuota
            COALESCE(rs.monto,0.00) AS monto_pagado,
            COALESCE((ct.monto_cuota - rs.monto),0.00) AS monto_restante
        FROM cuotas AS ct
        LEFT JOIN (
            SELECT 
				idcuota,
				SUM(monto_pago) AS monto,
                MAX(fecha_pago) AS fecha_pago
				FROM detalle_cuotas
                WHERE inactive_at IS NULL 
                GROUP BY idcuota
                ORDER BY iddetalle_cuota DESC 
        ) AS rs ON rs.idcuota = ct.idcuota
        WHERE ct.idcontrato = _idcontrato
        ORDER BY ct.fecha_vencimiento ASC;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_reports_cuotas_extend
(
	IN _idcontrato INT
)
BEGIN
	SET @before_idcuota := NULL;
    SET @before_iddetalle:= NULL;
    
    
	SELECT 
    
    ct.nro_cuota,
    @before_idcuota AS ultimoid,
    @before_iddetalle AS ultimoiddetalle,
    CASE
		 WHEN @before_idcuota = dt.idcuota THEN
            (
                SELECT @calc := (ct2.monto_cuota - dtc2.monto_pago)
                FROM detalle_cuotas dtc2
                INNER JOIN cuotas ct2 ON ct2.idcuota = dtc2.idcuota
                WHERE dtc2.iddetalle_cuota = @before_iddetalle
                ORDER BY ct2.fecha_vencimiento,dtc2.iddetalle_cuota ASC
            )  
        ELSE
         @calc := ct.monto_cuota  
    END AS monto_cuota,
    @before_iddetalle := dt.iddetalle_cuota AS iddetalle_cuota,
    @before_idcuota := dt.idcuota AS idcuota,
    ct.estado,
    ct.fecha_vencimiento,
    dt.fecha_pago,
    dt.monto_pago,
    dt.modalidad_pago,
    dt.entidad_bancaria,
    dt.nro_operacion,
    dt.detalles,
    ROUND((@calc - dt.monto_pago),2) AS calculo
FROM detalle_cuotas dt
INNER JOIN cuotas ct ON ct.idcuota = dt.idcuota
INNER JOIN contratos cnt ON cnt.idcontrato = ct.idcontrato
WHERE ct.inactive_at IS NULL
    AND dt.inactive_at IS NULL
    AND cnt.idcontrato = _idcontrato
ORDER BY ct.fecha_vencimiento,dt.iddetalle_cuota ASC;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_calculate_debt
(
	IN _idcontrato INT
)
BEGIN
   -- Variables de sesión
    SET @calculate := 0;
    SET @monto := 0;

    -- Ejecución
    SELECT 
        ct.idcuota,
        dtc.iddetalle_cuota,
        ct.nro_cuota,
        ct.monto_cuota,
        CASE 
            WHEN @calculate = 0 THEN 
                CASE WHEN cn.precio_venta = ct.monto_cuota THEN
                    @calculate := cn.precio_venta
                ELSE
                    @calculate := cn.precio_venta - cn.inicial -- SE DESCUENTA EL MONTO DE LA INICIAL
                END
            ELSE @calculate
        END AS precio_venta,
        @monto := dtc.monto_pago AS monto_pago,
        @calculate := CASE 
                        WHEN @calculate = cn.precio_venta THEN cn.precio_venta - dtc.monto_pago
                        ELSE @calculate - (dtc.monto_pago)
                    END AS saldo
    FROM 
        detalle_cuotas dtc
        INNER JOIN cuotas ct ON ct.idcuota = dtc.idcuota
        INNER JOIN contratos cn ON cn.idcontrato = ct.idcontrato
    WHERE 
        cn.idcontrato = _idcontrato
        AND ct.inactive_at IS NULL
        AND dtc.inactive_at IS NULL
    GROUP BY 
        dtc.iddetalle_cuota
    ORDER BY 
        ct.fecha_vencimiento, dtc.iddetalle_cuota;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spu_calculate_clients
(
    IN _idproyecto INT
)
BEGIN
    SELECT DISTINCT
            "CONTRATO" AS tipo,
            cn.idcontrato,
            cn.idactivo,
            cn.idproyecto,
            cn.sublote,
            cn.denominacion,
            cn.cliente,
            cn.tipo_persona,
            cn.documento_tipo,
            cn.documento_nro,
            cn.precio_venta
        FROM vws_list_contracts cn 
        WHERE cn.estado = "VIGENTE"
        AND cn.idproyecto = _idproyecto
        AND cn.inactive_at IS NULL
        AND NOT EXISTS(
            SELECT 1
                FROM separaciones   
                WHERE idactivo = cn.idactivo
                AND  existe_contrato = 0
                AND inactive_at IS  NULL
        )
        GROUP BY cn.idactivo
        UNION
        SELECT DISTINCT
            "SEPARACION" AS tipo,
            sp.idseparacion,
            sp.idactivo,
            ac.idproyecto,
            ac.sublote,
            py.denominacion,
            cl.cliente,
            cl.tipo_persona,
            cl.documento_tipo,
            cl.documento_nro,
            ac.precio_venta
        FROM separaciones sp
        INNER JOIN (
            SELECT 
                cl.idcliente,
                cl.tipo_persona,
                COALESCE(CONCAT(UPPER(ps.apellidos),', ',LOWER(ps.nombres)),pj.razon_social) AS cliente,
                COALESCE(ps.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(ps.documento_nro,pj.documento_nro) AS documento_nro
                FROM clientes cl
                LEFT JOIN personas ps ON ps.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
        )AS cl ON cl.idcliente = sp.idcliente
        INNER JOIN activos ac ON ac.idactivo = sp.idactivo
        INNER JOIN proyectos py ON py.idproyecto = ac.idproyecto
        AND sp.inactive_at IS NULL
        AND ac.idproyecto = _idproyecto
        AND sp.existe_contrato = 0;
END$$

DELIMITER ;