USE aisoft;

TRUNCATE TABLE detalles_contratos;
TRUNCATE TABLE detalle_cuotas;
TRUNCATE TABLE cuotas;
TRUNCATE TABLE contratos;
TRUNCATE TABLE separaciones;
TRUNCATE TABLE clientes;
TRUNCATE TABLE activos;
TRUNCATE TABLE personas_juridicas;

TRUNCATE TABLE personas;
TRUNCATE TABLE devoluciones;

TRUNCATE TABLE metricas;

SET foreign_key_checks = 0;

select * from proyectos;