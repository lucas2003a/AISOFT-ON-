USE aisoft;

DROP TABLE sustentos_cuotas, cuotas, detalle_gastos, presupuestos, desembolsos, sustentos_sep, separaciones, contratos, viviendas, lotes;

select * from configuraciones;
select * from contratos;
select * from separaciones;
select * from detalle_cuotas;
select * from devoluciones;
select * from roles;
select * from permisos order by modulo;
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
INSERT INTO permisos(idrol, modulo) VALUES
(1, 'GERENTE GENERA');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'ASISTENTE TESORERIA');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'ADMINISTRADOR');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'TESORERO');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'ASESOR DE VENTAS');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'VENDEDOR');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'PRACTICANTE');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'TRAMITES Y DESEMBOLSOS');

 */

## PERMISOS

/* -------------------------------------------------------------------------- */
/*                          **IDROL** - **MODULO**                          */
/* -------------------------------------------------------------------------- */
/* --------------------------- *GERENTE GENERAL* -------------------------- */

INSERT INTO permisos(idrol, modulo) VALUES
(1, 'assets/delete_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'assets/edit_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'assets/add_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'budgets/add_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'budgets/edit_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'budgets/delete_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'clients/delete_client');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'clients/edit_client');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'contracts/add_contract_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'contracts/add_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'contracts/detail_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'contracts/edit_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'dashboard_admin/dashboard_admin');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'monitoring/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'projects/add_project');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'projects/delete_project');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'projects/edit_project');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'quotas/add_quotas_credit');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'quotas/pay_quota_cont');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'quotas/pay_quota');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'quotas/reprogram_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'refunds/add_refund_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'refunds/add_refund');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'refunds/edit_refund');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'separations/add_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'separations/delete_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'separations/edit_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'separations/index');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'users/add_user');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'users/edit_user');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'users/delete_user');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'users/index_user');


INSERT INTO permisos(idrol, modulo) VALUES
(1, 'users/change_password_user');

select * from permisos where modulo like concat('users/','%');


/* ---------------------------- *ADMINISTRADOR* --------------------------- */

INSERT INTO permisos(idrol, modulo) VALUES
(3, 'assets/delete_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'assets/edit_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'assets/add_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'budgets/add_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'budgets/edit_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'budgets/delete_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'clients/delete_client');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'clients/edit_client');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'contracts/add_contract_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'contracts/add_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'contracts/detail_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'contracts/edit_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'dashboard_admin/dashboard_admin');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'monitoring/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'projects/add_project');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'projects/delete_project');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'projects/edit_project');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'quotas/add_quotas_credit');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'quotas/pay_quota_cont');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'quotas/pay_quota');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'quotas/reprogram_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'refunds/add_refund_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'refunds/add_refund');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'refunds/edit_refund');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'separations/add_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'separations/delete_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'separations/edit_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'separations/index');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'users/add_user');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'users/edit_user');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'users/delete_user');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'users/index_user');


INSERT INTO permisos(idrol, modulo) VALUES
(3, 'users/change_password_user');


/* ------------------------- *ASISTENTE TESORERIA* ------------------------ */

INSERT INTO permisos(idrol, modulo) VALUES
(2, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'budgets/add_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'dashboard_user/dashboard_user');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(2, 'separations/index');


/* ------------------------------ *TESORERO* ------------------------------ */

INSERT INTO permisos(idrol, modulo) VALUES
(4, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'budgets/add_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'budgets/edit_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'budgets/delete_budget');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'dashboard_user/dashboard_user');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(4, 'separations/index');


/* -------------------------- *ASESOR DE VENTAS* -------------------------- */

INSERT INTO permisos(idrol, modulo) VALUES
(5, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'dashboard_user/dashboard_user');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'clients/delete_client');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'clients/edit_client');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(5, 'separations/index');


/* ------------------------------ *VENDEDOR* ------------------------------ */

INSERT INTO permisos(idrol, modulo) VALUES
(6, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'dashboard_user/dashboard_user');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'clients/delete_client');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'clients/edit_client');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(6, 'separations/index');


/* ----------------------------- *PRACTICANTE* ---------------------------- */

INSERT INTO permisos(idrol, modulo) VALUES
(7, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'dashboard_user/dashboard_user');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(7, 'separations/index');


/* ----------------------- *TRAMITES Y DESEMBOLSOS* ----------------------- */

INSERT INTO permisos(idrol, modulo) VALUES
(8, 'assets/detail_asset');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'assets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'budgets/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'dashboard_user/dashboard_user');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'clients/add_client');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'clients/delete_client');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'clients/edit_client');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'clients/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'contracts/add_contract_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'contracts/add_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'contracts/detail_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'contracts/edit_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'contracts/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'profile/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'projects/list_clients');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'projects/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'quotas/add_quotas_credit');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'quotas/detail_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'quotas/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'quotas/pay_quota_cont');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'quotas/pay_quota');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'quotas/reprogram_quotas');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'refunds/add_refund_contract');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'refunds/add_refund');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'refunds/edit_refund');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'refunds/index');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'separations/add_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'separations/delete_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'separations/edit_separation');


INSERT INTO permisos(idrol, modulo) VALUES
(8, 'separations/index');

select * from permisos;

INSERT INTO permisos(idrol, modulo) VALUES
(1, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(2, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(3, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(4, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(5, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(6, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(7, 'assets/list_clients');
INSERT INTO permisos(idrol, modulo) VALUES
(8, 'assets/list_clients');