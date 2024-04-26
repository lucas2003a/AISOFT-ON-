select * from activos where codigo = "AC00003";
select * from separaciones;
select distrito from distritos where iddistrito = 1007;
-- Paso 2: Obtener los IDs de los proyectos inactivos y eliminar las métricas asociadas
DELETE FROM proyectos WHERE inactive_at is not null;
DELETE FROM metricas WHERE idproyecto IN (SELECT idproyecto FROM proyectos WHERE inactive_at IS NOT NULL);


UPDATE activos SET det_casa = '{"clave": ["tipo_construccion","materiales","dimensiones","distribucion","instalaciones","acabados","seguridad","paisajismo","mantenimiento"],"valor": ["Una casa de estilo contemporáneo construida con materiales modernos y sostenibles. Esta casa cuenta con un diseño único y funcional, pensado para proporcionar comodidad y estilo de vida moderno a sus residentes. La estructura está hecha principalmente de hormigón armado y acero, lo que garantiza su resistencia y durabilidad a lo largo del tiempo. Además, se han utilizado materiales ecológicos y reciclables en la construcción para minimizar el impacto ambiental.",    "Los materiales utilizados en la construcción de esta casa son de la más alta calidad y durabilidad. El hormigón utilizado para la estructura es de grado superior y se ha reforzado con barras de acero para garantizar su resistencia ante terremotos y otros desastres naturales. Las paredes exteriores están revestidas con un material especial que ayuda a mantener la temperatura interior de la casa constante, reduciendo así el consumo de energía.",    "La casa tiene una superficie total de 250 metros cuadrados, distribuidos en dos plantas. En la planta baja se encuentra el área social, que incluye la sala de estar, el comedor y la cocina, así como un baño de visitas y un área de servicio. En la planta superior se encuentran los dormitorios, cada uno con su propio baño completo y vestidor.",    "La distribución de la casa ha sido cuidadosamente planificada para aprovechar al máximo el espacio disponible y garantizar la funcionalidad de cada área. La planta baja cuenta con espacios abiertos y luminosos, mientras que la planta superior ofrece privacidad y comodidad en cada dormitorio.",    "Las instalaciones de la casa incluyen fontanería y cableado eléctrico nuevos, así como un sistema de calefacción central y aire acondicionado. Además, se ha instalado un sistema de energía solar para reducir el consumo de electricidad y minimizar el impacto ambiental.",    "Los acabados interiores de la casa son de alta calidad y elegancia. Los suelos son de mármol y madera noble, mientras que las paredes están pintadas en colores neutros para crear un ambiente cálido y acogedor. Los baños cuentan con accesorios de última generación y acabados en mármol y granito.",    "La seguridad de la casa ha sido una prioridad en su diseño y construcción. Se han instalado sistemas de alarma y videovigilancia en todas las áreas, así como cerraduras de alta seguridad en todas las puertas y ventanas. Además, la casa cuenta con un sistema de acceso controlado y una cerca perimetral electrificada para garantizar la privacidad y seguridad de sus residentes.",    "El paisajismo exterior de la casa ha sido diseñado para crear un ambiente tranquilo y relajante. Se han plantado árboles y arbustos nativos en el jardín, así como un césped bien cuidado y una variedad de flores y plantas ornamentales. Además, se ha construido una piscina y un área de recreación al aire libre, perfecta para disfrutar del clima cálido y soleado de la región.",    "El mantenimiento de la casa es mínimo gracias a los materiales de alta calidad utilizados en su construcción. La mayoría de los componentes de la casa tienen una vida útil de varios años y requieren poco o ningún mantenimiento. Además, se ha contratado a un equipo de profesionales para realizar inspecciones periódicas y realizar cualquier reparación o mantenimiento necesario."]}' 
where idactivo = 28;

UPDATE activos SET 
	det_casa ='{"clave": ["tipo_construccion","materiales","dimensiones","distribucion","instalaciones","acabados","seguridad","paisajismo","mantenimiento"],"valor": ["Una casa de estilo contemporáneo construida con materiales modernos y sostenibles. Esta casa cuenta con un diseño único y funcional, pensado para proporcionar comodidad y estilo de vida moderno a sus residentes. La estructura está hecha principalmente de hormigón armado y acero, lo que garantiza su resistencia y durabilidad a lo largo del tiempo. Además, se han utilizado materiales ecológicos y reciclables en la construcción para minimizar el impacto ambiental.",    "Los materiales utilizados en la construcción de esta casa son de la más alta calidad y durabilidad. El hormigón utilizado para la estructura es de grado superior y se ha reforzado con barras de acero para garantizar su resistencia ante terremotos y otros desastres naturales. Las paredes exteriores están revestidas con un material especial que ayuda a mantener la temperatura interior de la casa constante, reduciendo así el consumo de energía.",    "La casa tiene una superficie total de 250 metros cuadrados, distribuidos en dos plantas. En la planta baja se encuentra el área social, que incluye la sala de estar, el comedor y la cocina, así como un baño de visitas y un área de servicio. En la planta superior se encuentran los dormitorios, cada uno con su propio baño completo y vestidor.",    "La distribución de la casa ha sido cuidadosamente planificada para aprovechar al máximo el espacio disponible y garantizar la funcionalidad de cada área. La planta baja cuenta con espacios abiertos y luminosos, mientras que la planta superior ofrece privacidad y comodidad en cada dormitorio.",    "Las instalaciones de la casa incluyen fontanería y cableado eléctrico nuevos, así como un sistema de calefacción central y aire acondicionado. Además, se ha instalado un sistema de energía solar para reducir el consumo de electricidad y minimizar el impacto ambiental.",    "Los acabados interiores de la casa son de alta calidad y elegancia. Los suelos son de mármol y madera noble, mientras que las paredes están pintadas en colores neutros para crear un ambiente cálido y acogedor. Los baños cuentan con accesorios de última generación y acabados en mármol y granito.",    "La seguridad de la casa ha sido una prioridad en su diseño y construcción. Se han instalado sistemas de alarma y videovigilancia en todas las áreas, así como cerraduras de alta seguridad en todas las puertas y ventanas. Además, la casa cuenta con un sistema de acceso controlado y una cerca perimetral electrificada para garantizar la privacidad y seguridad de sus residentes.",    "El paisajismo exterior de la casa ha sido diseñado para crear un ambiente tranquilo y relajante. Se han plantado árboles y arbustos nativos en el jardín, así como un césped bien cuidado y una variedad de flores y plantas ornamentales. Además, se ha construido una piscina y un área de recreación al aire libre, perfecta para disfrutar del clima cálido y soleado de la región.",    "El mantenimiento de la casa es mínimo gracias a los materiales de alta calidad utilizados en su construcción. La mayoría de los componentes de la casa tienen una vida útil de varios años y requieren poco o ningún mantenimiento. Además, se ha contratado a un equipo de profesionales para realizar inspecciones periódicas y realizar cualquier reparación o mantenimiento necesario."]}',
	estado ="VENDIDO"
    WHERE idactivo = 1;


update activos set imagen = null;
select * from ACTIVOS where idproyecto = 1;


-- 

select * from metricas;

select 
	sum(l_vendidos) as l_vendidos,
    sum(l_noVendidos) as l_oVendidos,
    sum(l_separados) as l_separados
	from metricas 
	where YEAR(update_at) = YEAR(NOW());
    
select * from activos order by idactivo desc;
select * from activos where idactivo = 27;
select * from proyectos WHERE inactive_at IS NULL ORDER BY idproyecto DESC;
select * from ACTIVOS;

SELECT ACT.ESTADO FROM separaciones SEP INNER JOIN activos ACT ON ACT.idactivo = SEP.idactivo;
UPDATE activos AS ACT
INNER JOIN separaciones AS SEP ON ACT.idactivo = SEP.idactivo
SET ACT.ESTADO = 'SEPARADO';

select * from personas_juridicas;
select * from clientes;

SELECT * FROM representantes_legales_clientes;



INSERT INTO representantes_legales_clientes(idpersona_juridica, representante_legal, documento_tipo, documento_nro,partida_elect)
SELECT idpersona_juridica, representante_legal, documento_t_representante, documento_nro_representante,partida_elect
	FROM personas_juridicas
    WHERE inactive_at IS NULL;

SELECT * FROM representantes_legales_clientes;
