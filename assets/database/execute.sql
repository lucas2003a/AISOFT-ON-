USE aisoft;

DROP TABLE sustentos_cuotas, cuotas, detalle_gastos, presupuestos, desembolsos, sustentos_sep, separaciones, contratos, viviendas, lotes;

select * from configuraciones;
select * from contratos;
select * from separaciones;
select * from detalle_cuotas;
select * from devoluciones;
set foreign_key_checks = 1;
update usuarios set contrasenia = "$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm";

-- update activos set estado = "SIN VENDER";
TRUNCATE TABLE detalles_contratos;
TRUNCATE TABLE contratos;
TRUNCATE TABLE cuotas;
TRUNCATE TABLE detalle_cuotas;
TRUNCATE TABLE separaciones;
TRUNCATE TABLE devoluciones;
select * from activos;
select * from sedes;
select * from proyectos; */
/* update proyectos 
    SET
        idsede = 
            CASE 
                WHEN idsede = 4 THEN 1
                WHEN idsede = 5 THEN 2  
                WHEN idsede = 6 THEN 3
                else idsede  
            END; */
/* select * from representantes;
select * from constructora;
select * from devoluciones; */
/* delete cn    
    from constructora cn    
    INNER JOIN sedes sd ON sd.idconstructora = cn.idconstructora
    where cn.idconstructora > 1; */