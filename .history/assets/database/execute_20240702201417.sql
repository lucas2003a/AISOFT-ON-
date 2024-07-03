USE aisoft;

DROP TABLE sustentos_cuotas, cuotas, detalle_gastos, presupuestos, desembolsos, sustentos_sep, separaciones, contratos, viviendas, lotes;

select * from configuraciones;
select * from contratos;
select * from separaciones;
select * from detalle_cuotas;
select * from devoluciones;
select * from roles;
select * from permisos;
select * from usuarios;
set foreign_key_checks = 0;
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
    where cn.idconstructora  1; */
    
    # STAKEHOLDERS

/* **IDROL** - **ROL**
INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'GERENTE GENERA');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'ASISTENTE TESORERIA');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'ADMINISTRADOR');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'TESORERO');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'ASESOR DE VENTAS');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'VENDEDOR');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'PRACTICANTE');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'TRAMITES Y DESEMBOLSOS');

 */

## PERMISOS

/* -------------------------------------------------------------------------- */
/*                          **IDROL** - **MODULO**                          */
/* -------------------------------------------------------------------------- */
/* --------------------------- *GERENTE GENERAL* -------------------------- */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/delete_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/edit_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/add_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/add_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/edit_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/delete_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/delete_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/edit_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/add_contract_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/add_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/detail_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/edit_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_admin/dashboard_admin');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'monitoring/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/add_project');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/delete_project');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/edit_project');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/add_quotas_credit');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/pay_quota_cont');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/pay_quota');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/reprogram_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/add_refund_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/add_refund');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/edit_refund');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/add_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/delete_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/edit_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/add_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/edit_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/delete_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/index_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/change_password_user');



/* ---------------------------- *ADMINISTRADOR* --------------------------- */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/delete_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/edit_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/add_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/add_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/edit_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/delete_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/delete_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/edit_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/add_contract_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/add_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/detail_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/edit_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_admin/dashboard_admin');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'monitoring/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/add_project');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/delete_project');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/edit_project');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/add_quotas_credit');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/pay_quota_cont');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/pay_quota');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/reprogram_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/add_refund_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/add_refund');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/edit_refund');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/add_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/delete_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/edit_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/add_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/edit_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/delete_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/index_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'users/change_password_user');


/* ------------------------- *ASISTENTE TESORERIA* ------------------------ */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/add_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_user/dashboard_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


/* ------------------------------ *TESORERO* ------------------------------ */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/add_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/edit_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/delete_budget');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_user/dashboard_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


/* -------------------------- *ASESOR DE VENTAS* -------------------------- */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_user/dashboard_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/delete_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/edit_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


/* ------------------------------ *VENDEDOR* ------------------------------ */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_user/dashboard_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/delete_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/edit_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


/* ----------------------------- *PRACTICANTE* ---------------------------- */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_user/dashboard_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');


/* ----------------------- *TRAMITES Y DESEMBOLSOS* ----------------------- */

INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/detail_asset');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'assets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'budgets/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'dashboard_user/dashboard_user');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/add_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/delete_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/edit_client');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'clients/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/add_contract_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/add_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/detail_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/edit_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'contracts/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'profile/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/list_clients');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'projects/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/add_quotas_credit');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/detail_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/pay_quota_cont');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/pay_quota');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'quotas/reprogram_quotas');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/add_refund_contract');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/add_refund');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/edit_refund');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'refunds/index');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/add_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/delete_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/edit_separation');


INSERT INTO nombre_de_la_tabla (id, modulo) VALUES
(\1, 'separations/index');

