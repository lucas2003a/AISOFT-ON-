-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2024 a las 11:24:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aisoft`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_assets` (IN `_idproyecto` INT, IN `_tipo_activo` VARCHAR(10), IN `_imagen` VARCHAR(100), IN `_estado` VARCHAR(10), IN `_sublote` VARCHAR(6), IN `_direccion` CHAR(70), IN `_moneda_venta` VARCHAR(10), IN `_area_terreno` DECIMAL(6,2), IN `_area_construccion` DECIMAL(6,2), IN `_area_techada` DECIMAL(6,2), IN `_zcomunes_porcent` TINYINT, IN `_partida_elect` VARCHAR(100), IN `_latitud` VARCHAR(20), IN `_longitud` VARCHAR(20), IN `_perimetro` JSON, IN `_idpresupuesto` INT, IN `_propietario_lote` VARCHAR(70), IN `_precio_lote` DECIMAL(8,2), IN `_precio_construccion` DECIMAL(8,2), IN `_precio_venta` DECIMAL(8,2), IN `_idusuario` INT)   BEGIN
	INSERT INTO activos (
						idproyecto, 
                        tipo_activo, 
                        imagen, 
                        estado, 
                        sublote, 
                        direccion, 
                        moneda_venta, 
                        area_terreno,
                        area_construccion,
                        area_techada, 
                        zcomunes_porcent, 
                        partida_elect,
						latitud, 
                        longitud, 
                        perimetro, 
                        idpresupuesto,
                        propietario_lote,
                        precio_lote,
                        precio_construccion,
                        precio_venta,
                        idusuario
                        )
			VALUES
				(
                _idproyecto, 
                _tipo_activo, 
                NULLIF(_imagen,""), 
                _estado, 
                _sublote, 
                _direccion, 
                _moneda_venta, 
                _area_terreno,
                NULLIF(_area_construccion,""), 
                NULLIF(_area_techada,""), 
                _zcomunes_porcent, 
                _partida_elect,
				NULLIF(_latitud,""), 
                NULLIF(_longitud, ""), 
                NULLIF(_perimetro,""),
                NULLIF(_idpresupuesto,""),
                _propietario_lote,
                nullif(_precio_lote,""),
                NULLIF(_precio_construccion, ""), 
                _precio_venta,
                _idusuario
                );
	SELECT ROW_COUNT() as filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_budget` (IN `_codigo` CHAR(8), IN `_modelo` VARCHAR(30), IN `_idusuario` INT, IN `_area_construccion` DECIMAL(6,2))   BEGIN
	INSERT INTO presupuestos(modelo, idusuario, codigo, area_construccion)
					VALUES(_modelo, _idusuario, _codigo, _area_construccion);
	SELECT @@last_insert_id AS idpresupuesto,
			codigo,
            modelo
            FROM presupuestos
            WHERE idpresupuesto = @@last_insert_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_clients_personj` (IN `_tipo_persona` VARCHAR(10), IN `_razon_social` VARCHAR(60), IN `_documento_tipo` VARCHAR(20), IN `_documento_nro` VARCHAR(12), IN `_iddistrito` INT, IN `_direccion` VARCHAR(70), IN `_idusuario` INT)   BEGIN

	DECLARE _idpersona_juridica INT;
    -- registro a la persona
    INSERT INTO personas_juridicas(
							razon_social,
                            documento_tipo,                            
                            documento_nro,
                            iddistrito,
                            direccion
							)
                            
						VALUES(
							_razon_social,
                            _documento_tipo,                            
                            _documento_nro,
                            _iddistrito,
                            _direccion
                        );
		SET _idpersona_juridica = (SELECT @@last_insert_id);
	SELECT _idpersona_juridica AS idpersona_juridica;
	-- registro a la persona como cliente
	INSERT INTO clientes(
						tipo_persona, 
                        idpersona_juridica,
                        idusuario
                        )
				VALUES
					(
						_tipo_persona,
                        _idpersona_juridica,
                        _idusuario
                    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_clients_personN` (IN `_tipo_persona` VARCHAR(10), IN `_nombres` VARCHAR(40), IN `_apellidos` VARCHAR(40), IN `_documento_tipo` VARCHAR(30), IN `_documento_nro` VARCHAR(12), IN `_estado_civil` VARCHAR(20), IN `_iddistrito` INT, IN `_direccion` VARCHAR(70), IN `_nacionalidad` VARCHAR(20), IN `_idusuario` INT)   BEGIN
	DECLARE _idpersona INT;
    -- registro a la persona
    INSERT INTO personas(
							nombres,
                            apellidos,
                            documento_tipo,
                            documento_nro,
                            estado_civil,
                            iddistrito,
                            direccion,
                            nacionalidad
							)
                            
						VALUES(
							_nombres,
                            _apellidos,
                            _documento_tipo,
                            _documento_nro,
                            _estado_civil,
                            _iddistrito,
                            _direccion,
                            NULLIF(_nacionalidad,'')
                        );
		SET _idpersona = (SELECT @@last_insert_id);
	-- registro a la persona como cliente
	INSERT INTO clientes(
						tipo_persona, 
                        idpersona,
                        idusuario
                        )
				VALUES
					(
						_tipo_persona,
                        _idpersona,
                        _idusuario
                    );
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_contract` (IN `_n_expediente` VARCHAR(10), IN `_tipo_contrato` VARCHAR(40), IN `_idseparacion` INT, IN `_idrepresentante_primario` INT, IN `_idrepresentante_secundario` INT, IN `_idcliente` INT, IN `_idconyugue` INT, IN `_idactivo` INT, IN `_tipo_cambio` DECIMAL(4,3), IN `_fecha_contrato` DATE, IN `_precio_venta` DECIMAL(8,2), IN `_moneda_venta` VARCHAR(10), IN `_inicial` DECIMAL(8,2), IN `_det_contrato` JSON, IN `_archivo` VARCHAR(100), IN `_idusuario` INT)   BEGIN

	INSERT INTO contratos(
                n_expediente,
				tipo_contrato, 
                idseparacion, 
                idrepresentante_primario, 
                idrepresentante_secundario,
                idcliente, 
                idconyugue,
                idactivo,  
                tipo_cambio, 
                fecha_contrato,
                precio_venta,
                moneda_venta,
                inicial,
                det_contrato,  
                archivo,
                idusuario
				)
			VALUES(
                    _n_expediente,
					_tipo_contrato,
                    NULLIF(_idseparacion, ''),
                    _idrepresentante_primario,
                    NULLIF(_idrepresentante_secundario,''),
                    NULLIF(_idcliente,''),
					NULLIF(_idconyugue, ''),
                    NULLIF(_idactivo, ''),
					_tipo_cambio, 
                    _fecha_contrato,
                    _precio_venta,
                    _moneda_venta,
                    _inicial,
                    NULLIF(_det_contrato,""), 
                    _archivo,
                    _idusuario
				);
	SELECT @@last_insert_id AS idcontrato;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_detail_cost` (IN `_idpresupuesto` INT, IN `_idsubcategoria_costo` INT, IN `_idmaterial` INT, IN `_detalle` VARCHAR(100), IN `_cantidad` TINYINT, IN `_precio_unitario` DECIMAL(8,2), IN `_idusuario` INT)   BEGIN
	INSERT INTO detalle_costos(
								idpresupuesto, 
                                idsubcategoria_costo, 
                                idmaterial,
                                detalle,
                                cantidad,
                                precio_unitario,
                                idusuario
                                )
						VALUES(
								_idpresupuesto, 
                                _idsubcategoria_costo, 
                                NULLIF(_idmaterial,""),
                                _detalle,
                                _cantidad,
                                _precio_unitario,
                                _idusuario
							);
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_det_contract` (IN `_idrepresentante` INT, IN `_idcontrato` INT)   BEGIN
    INSERT INTO detalles_contratos(idrepresentante, idcontrato)
                        VALUES (_idrepresentante, _idcontrato);
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_person` (IN `_nombres` VARCHAR(40), IN `_apellidos` VARCHAR(40), IN `_documento_tipo` VARCHAR(20), IN `_documento_nro` VARCHAR(12), IN `_estado_civil` VARCHAR(10), IN `_iddistrito` INT, IN `_direccion` VARCHAR(60), IN `_idusuario` INT)   BEGIN
	INSERT INTO personas(
						nombres,
                        apellidos,
                        documento_tipo,
                        documento_nro,
                        estado_civil,
                        iddistrito,
                        direccion,
                        idusuario
                        )
					VALUES(
						_nombres,
                        _apellidos,
                        _documento_tipo,
                        _documento_nro,
                        _estado_civil,
                        _iddistrito,
                        _direccion,
                        _idusuario
                    );
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_projects` (IN `_idsede` INT, IN `_imagen` VARCHAR(100), IN `_codigo` VARCHAR(20), IN `_denominacion` VARCHAR(30), IN `_latitud` VARCHAR(20), IN `_longitud` VARCHAR(20), IN `_iddistrito` INT, IN `_direccion` VARCHAR(70), IN `_idusuario` INT)   BEGIN
	INSERT INTO proyectos(idsede, imagen, codigo, denominacion, latitud, longitud, iddistrito, direccion, idusuario)
			VALUES
				(_idsede, NULLIF(_imagen,""), _codigo, _denominacion, NULLIF(_latitud, ""), NULLIF(_longitud, ""), _iddistrito, _direccion, _idusuario);
	SELECT ROW_COUNT() AS filasAfect; -- FILAS AFECTADAS
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_quota` (IN `_idcontrato` INT, IN `_monto_cuota` DECIMAL(8,2), IN `_fecha_vencimiento` DATE, IN `_idusuario` INT)   BEGIN
    INSERT INTO cuotas(idcontrato, monto_cuota, fecha_vencimiento, idusuario)
                VALUES(_idcontrato, _monto_cuota, _fecha_vencimiento, _idusuario);
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_refund` (IN `_n_expediente` VARCHAR(10), IN `_idseparacion` INT, IN `_idcontrato` INT, IN `_tipo_devolucion` VARCHAR(20), IN `_detalle` VARCHAR(200), IN `_porcentaje_penalidad` TINYINT, IN `_monto_devolucion` DECIMAL(8,2), IN `_imagen` VARCHAR(100), IN `_idusuario` INT)   BEGIN
    INSERT INTO devoluciones(
                    n_expediente,
                    idseparacion,
                    idcontrato,
                    tipo_devolucion,
                    detalle,
                    porcentaje_penalidad,
                    monto_devolucion,
                    imagen,
                    idusuario
                )
                VALUES(
                    _n_expediente,
                    NULLIF(_idseparacion,''),
                    NULLIF(_idcontrato,''),
                    _tipo_devolucion,
                    _detalle,
                    _porcentaje_penalidad,
                    _monto_devolucion,
                    _imagen,
                    _idusuario
                );
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_represents` (IN `_idpersona_juridica` INT, IN `_representante_legal` VARCHAR(30), IN `_documento_tipo` VARCHAR(20), IN `_documento_nro` VARCHAR(12), IN `_cargo` VARCHAR(30), IN `_partida_elect` VARCHAR(100), IN `_estado` VARCHAR(20))   BEGIN
	INSERT INTO rep_legales_clientes
				(
					idpersona_juridica,
                    representante_legal,
                    documento_tipo,
                    documento_nro,
                    cargo,
                    partida_elect,
                    estado
                )
                
                VALUES(
					_idpersona_juridica,
                    _representante_legal,
                    _documento_tipo,
                    _documento_nro,
                    _cargo,
                    _partida_elect,
                    _estado
                );
		SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_separation` (IN `_n_expediente` VARCHAR(10), IN `_idactivo` INT, IN `_idcliente` INT, IN `_idconyugue` INT, IN `_separacion_monto` DECIMAL(8,2), IN `_moneda_venta` VARCHAR(10), IN `_tipo_cambio` DECIMAL(5,4), IN `_imagen` VARCHAR(200), IN `_idusuario` INT)   BEGIN
    INSERT INTO separaciones (
            n_expediente,
            idactivo,
            idcliente,
            idconyugue,
            separacion_monto,
            moneda_venta,
            tipo_cambio,
            imagen,
            idusuario
    ) 
        VALUES(
            _n_expediente,
            _idactivo,
            _idcliente,
            NULLIF(_idconyugue,''),
            _separacion_monto,
            _moneda_venta,
            _tipo_cambio,
            _imagen,
            _idusuario
        );
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_update` (IN `_objeto_cambio` VARCHAR(200), IN `_motivo` VARCHAR(45), IN `_detalle` VARCHAR(200), IN `_usuario` VARCHAR(150))   BEGIN
    INSERT INTO actualizaciones(
                    objeto_cambio,
                    motivo,
                    detalle,
                    usuario
                )
                VALUES(
                    _objeto_cambio,
                    _motivo,
                    _detalle,
                    _usuario
                );
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cancel_det_quota` (IN `_idcuota` INT, IN `_idusuario` INT)   BEGIN
    UPDATE detalle_cuotas
        SET
            inactive_at = CURDATE()
        WHERE idcuota = _idcuota
        AND inactive_at IS NULL;
    UPDATE cuotas
        SET
            estado = "POR CANCELAR",
            idusuario = _idusuario,
            update_at = CURDATE()
        WHERE idcuota = _idcuota;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_count_budgets` (IN `_idpresuspuesto` INT)   BEGIN
	SELECT COUNT(idpresupuesto)
		FROM presupuestos
		WHERE idpresupuesto = _idpresuspuesto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_count_budget_idbudget` (IN `_idpresupuesto` INT)   BEGIN
    SELECT EXISTS(SELECT 1 FROM activos WHERE idpresupuesto = _idpresupuesto AND inactive_at IS NULL) AS cantidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_existContract` (IN `_idcontrato` INT)   BEGIN
    SELECT EXISTS(SELECT 1 FROM contratos 
                WHERE idcontrato = _idcontrato AND inactive_at IS NULL
                );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_existContract_idseparacion` (IN `_idseparacion` INT)   BEGIN
    SELECT EXISTS(SELECT 1 FROM contratos
    WHERE idseparacion = _idseparacion
    AND inactive_at IS NULL) AS existContract;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_get_budget_by_id` (IN `_idpresupuesto` INT)   BEGIN
	DECLARE _valueDefault DECIMAL(8,2);
    SET _valueDefault = 0.00;
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        pres.area_construccion,
        CASE
			WHEN detcost.idpresupuesto IS NOT NULL AND detcost.inactive_at IS NULL THEN
				(SUM(detcost.cantidad * detcost.precio_unitario)) 
			ELSE
				_valueDefault
		END AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        LEFT JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
        AND pres.idpresupuesto = _idpresupuesto
        AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_get_fullUbigeo` (IN `_distrito` VARCHAR(45), IN `_provincia` VARCHAR(45), IN `_departamento` VARCHAR(45))   BEGIN
	SELECT 	
		dist.iddistrito,
        dist.distrito,
        prov.idprovincia,
        prov.provincia,
        dept.iddepartamento,
        dept.departamento
		FROM distritos dist 
        INNER JOIN provincias prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos dept ON dept.iddepartamento = prov.iddepartamento
        WHERE 
				dist.distrito = _distrito
            AND prov.provincia = _provincia
            AND dept.departamento = _departamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_get_represents` (IN `_idrepresentante` INT)   BEGIN
	SELECT 
		rep.idrepresentante,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        dist.distrito,
        prov.provincia,
		dept.departamento,
        rep.cargo,
        rep.partida_elect,
        sed.direccion
        FROM representantes AS rep
        INNER JOIN personas AS pers ON pers.idpersona = rep.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN sedes AS sed ON sed.idsede = rep.idsede
        WHERE rep.idrepresentante = _idrepresentante
        AND rep.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_get_represents_idAdress` (IN `_idsede` INT)   BEGIN
	SELECT 
		rep.idrepresentante,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        dist.distrito,
        prov.provincia,
		dept.departamento,
        rep.cargo,
        rep.partida_elect,
        sed.direccion
        FROM representantes AS rep
        INNER JOIN personas AS pers ON pers.idpersona = rep.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN sedes AS sed ON sed.idsede = rep.idsede
        WHERE rep.idsede = _idsede
        AND rep.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_get_separation_ById` (IN `_idseparacion` INT)   BEGIN
    DECLARE _tpersona VARCHAR(10);
    SET _tpersona = (
        SELECT tipo_persona
        FROM clientes cli 
        INNER JOIN separaciones sep on sep.idcliente = cli.idcliente
        WHERE sep.idseparacion = _idseparacion
    );
    IF _tpersona = "NATURAL" THEN
        SELECT * FROM vws_list_separations_tpersona_natural_full
            WHERE idseparacion = _idseparacion;
    ELSEIF _tpersona = "JURÍDICA" THEN
        SELECT * FROM vws_list_separations_tpersona_juridica_full
            WHERE idseparacion = _idseparacion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_get_ubigeo` (IN `_iddistrito` INT)   BEGIN
	SELECT 
		dist.iddistrito,
        dist.distrito,
        prov.idprovincia,
        prov.provincia,
        dept.iddepartamento,
        dept.departamento
		FROM distritos AS dist
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE dist.iddistrito = _iddistrito;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_assets` (IN `_idactivo` INT, IN `_idusuario` INT)   BEGIN
	DECLARE _estadoActivo VARCHAR(10);
    -- CONSULTAR SI EL LOTE ESTA VENDIDO O SEPARDAO
    SET _estadoActivo = (
		SELECT estado
			FROM activos 
			WHERE idactivo = _idactivo
    );
	IF _estadoActivo = "SIN VENDER" THEN
		UPDATE activos
			SET
				inactive_at = CURDATE(),
                idusuario = _idusuario
			WHERE idactivo = _idactivo;
	ELSE
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Error: el lote tiene un cliente";
    END IF;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_budget` (IN `_idpresupuesto` INT, IN `_idusuario` INT)   BEGIN
	UPDATE presupuestos
		SET 
			inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE idpresupuesto = _idpresupuesto;
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_clients` (IN `_idcliente` INT, IN `_idusuario` INT)   BEGIN
	DECLARE _clienContrato INT;
    DECLARE _clienSeparacion INT;
    -- VERFICO QUE SI EXISTE EN UNA SEPARACIÓN O CONTRATO
    SET _clienContrato = (
		SELECT COUNT(*)
			FROM contratos
            WHERE idcliente = _idcliente
            AND inactive_at IS NULL    
            );
	SET _clienSeparacion = (
		SELECT COUNT(*)
			FROM separaciones
            WHERE idcliente = _idcliente
            AND inactive_at IS NULL
    );
    -- EJECUTO EL PROCEDIMIENTO
    
    IF _clienContrato  = 0 OR _clienSeparacion = 0 THEN
		UPDATE clientes
			SET
				inactive_at = CURDATE(),
                idusuario = _idusuario
			WHERE
				idcliente = _idcliente;
	END IF;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_contracts` (IN `_idcontrato` INT, IN `_idusuario` INT)   BEGIN

	UPDATE contratos
		SET
			inactive_at = CURDATE(),
            idusuario = _idusuario
		WHERE
			idcontrato = _idcontrato;
  SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_cost` (IN `_iddetalle_costo` INT, IN `_idusuario` INT)   BEGIN
	UPDATE detalle_costos
		SET
			inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE iddetalle_costo = _iddetalle_costo;
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_det_contract` (IN `_iddetalle_contrato` INT)   BEGIN
    UPDATE detalles_contratos
        SET
            inactive_at = CURDATE()
        WHERE
            iddetalle_contrato = _iddetalle_contrato;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_person` (IN `_idpersona` INT)   BEGIN 
	UPDATE personas
		SET inactive_at = CURDATE()
	WHERE idpersona = _idpersona;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_projects` (IN `_idproyecto` INT, IN `_idusuario` INT)   BEGIN

	UPDATE proyectos
		SET
			inactive_at = CURDATE(),
            idusuario = _idusuario

		WHERE
			idproyecto = _idproyecto;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_quota` (IN `_idcuota` INT, IN `_idusuario` INT)   BEGIN
    UPDATE cuotas
        SET
        inactive_at = CURDATE(),
        idusuario = _idusuario
        WHERE idcuota = _idcuota;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_refund` (IN `_iddevolucion` INT, IN `_idusuario` INT)   BEGIN
    UPDATE devoluciones
        SET
            inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE
            iddevolucion = _iddevolucion;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_represents` (IN `_idrepresentante` INT)   BEGIN
	UPDATE rep_legales_clientes
		SET
			inactive_at = CURDATE()
        WHERE idrepresentante = _idrepresentante;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactive_separation` (IN `_idseparacion` INT, IN `_idusuario` INT)   BEGIN
    UPDATE separaciones
        SET
            inactive_at = CURDATE(),
            idusuario   = _idusuario
        WHERE idseparacion = _idseparacion;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_addresses` (IN `_iddistrito` INT)   BEGIN
	SELECT
		sed.idsede,
        emp.ruc,
		emp.razon_social,
        emp.partida_elect,
        sed.referencia,
        sed.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento
		FROM sedes AS sed
        INNER JOIN constructora AS emp ON emp.idconstructora = sed.idconstructora
        INNER JOIN distritos AS dist ON dist.iddistrito = sed.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE sed.iddistrito = _iddistrito;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_addresses_ruc` (IN `_ruc` VARCHAR(11))   BEGIN
	DECLARE _idconstructora INT;
    -- OBTENGO LA EMPRESA
    SET _idconstructora = (
						SELECT idconstructora FROM vws_list_companies
						WHERE ruc LIKE CONCAT(_ruc, "%")
				);
	SELECT
		sed.idsede,
        emp.ruc,
		emp.razon_social,
        emp.partida_elect,
        sed.referencia,
        sed.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento
		FROM sedes AS sed
        INNER JOIN constructora AS emp ON emp.idconstructora = sed.idconstructora
        INNER JOIN distritos AS dist ON dist.iddistrito = sed.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE sed.idconstructora = _idconstructora;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_assets_by_id` (IN `_idactivo` INT)   BEGIN
		SELECT 
		act.idactivo,
        act.tipo_activo,
        proy.idproyecto,
        proy.denominacion,
        act.imagen,
        act.estado,
        act.sublote,
        act.direccion,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        act.moneda_venta,
        act.area_terreno,
        act.area_construccion,
        act.area_techada,
        act.zcomunes_porcent,
        act.partida_elect,
        act.latitud,
        act.longitud,
        act.perimetro,
        act.det_casa,
        pres.idpresupuesto,
        pres.modelo,
        act.propietario_lote,
        act.precio_lote,
        act.precio_construccion,
        act.precio_venta,
        pers.nombres AS usuario
		FROM activos AS act
        INNER JOIN proyectos AS proy ON proy.idproyecto = act.idproyecto
        INNER JOIN distritos AS dist ON dist.iddistrito = proy.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        LEFT JOIN presupuestos AS pres ON pres.idpresupuesto = act.idpresupuesto
        INNER JOIN usuarios AS usu ON usu.idusuario = act.idusuario
        INNER JOIN personas AS pers ON pers.idpersona = usu.idpersona
        WHERE act.idactivo = _idactivo
        AND act.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_assets_by_sublote` (IN `_idproyecto` INT, IN `_sublote` CHAR(5))   BEGIN
	SELECT * 
		FROM vws_list_assets_short
        WHERE sublote LIKE CONCAT(_sublote,"%")
        AND idproyecto = _idproyecto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_assets_idProject` (IN `_idproyecto` INT)   BEGIN
	SELECT * FROM vws_list_assets_short
    WHERE idproyecto = _idproyecto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_assets_short_idpr` (IN `_idproyecto` INT, IN `_propietario_lote` VARCHAR(10))   BEGIN
	SELECT * FROM vws_list_assets_short
    WHERE idproyecto = _idproyecto
    AND propietario_lote = _propietario_lote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_brands` ()   BEGIN
	SELECT
		idmarca,
        marca
		FROM marcas
        ORDER BY marca ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_budgets` ()   BEGIN
	DECLARE _valueDefault DECIMAL(8,2);
    SET _valueDefault = 0.00;
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        pres.area_construccion,
        CASE
			WHEN detcost.idpresupuesto IS NOT NULL AND detcost.inactive_at IS NULL THEN
				(SUM(detcost.cantidad * detcost.precio_unitario)) 
			ELSE
				_valueDefault
		END AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        LEFT JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
		AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_budgets_assets` (IN `_area_construida` DECIMAL(6,2))   BEGIN
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        pres.area_construccion,
		(SUM(detcost.cantidad * detcost.precio_unitario)) AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        INNER JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
        AND detcost.inactive_at IS NULL
        AND pres.area_construida = _area_construida
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_by_docNro` (IN `_tipo_persona` VARCHAR(10), IN `_documento_nro` VARCHAR(12))   BEGIN
	IF _tipo_persona = "NATURAL" THEN
		SELECT
		clien.idcliente,
        clien.tipo_persona,
        pers.apellidos,
        pers.nombres,
		pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        pers.direccion,
        persUsu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
        WHERE clien.inactive_at IS NULL 
			AND clien.tipo_persona = _tipo_persona
            AND pers.documento_nro LIKE CONCAT(_documento_nro,'%')
        ORDER BY pers.documento_nro ASC;
    ELSE 
		SELECT
			clien.idcliente,
			clien.tipo_persona,
			persj.documento_tipo,
			persj.documento_nro,
			persj.razon_social,
			rep.idrepresentante,
			dist.distrito,
			prov.provincia,
			dept.departamento,
			persj.direccion,
			persUsu.nombres AS usuario
			FROM clientes AS clien
			INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            LEFT JOIN rep_legales_clientes AS rep ON rep.idpersona_juridica = persj.idpersona_juridica
			INNER JOIN distritos AS dist ON dist.iddistrito = persj.iddistrito
			INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
			INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
			INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario	
			INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
			WHERE clien.inactive_at IS NULL 
				AND clien.tipo_persona = _tipo_persona
                AND persj.documento_nro LIKE CONCAT(_documento_nro,'%')
			ORDER BY persj.documento_nro ASC;
		END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_by_id` (IN `_idcliente` INT)   BEGIN
	DECLARE _tipoPersona VARCHAR(10);
    SET _tipoPersona = (
		SELECT tipo_persona FROM clientes WHERE idcliente = _idcliente
    );
	IF _tipoPersona = "NATURAL" THEN
		SELECT
		clien.idcliente,
        clien.tipo_persona,
        pers.idpersona,
        pers.apellidos,
        pers.nombres,
		pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.iddistrito,
        pers.nacionalidad,
        pers.direccion,
        persUsu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
        WHERE clien.inactive_at IS NULL 
			AND clien.tipo_persona = _tipoPersona
            AND clien.idcliente = _idcliente
        ORDER BY pers.documento_nro ASC;
    ELSE 
		SELECT
			clien.idcliente,
			clien.tipo_persona,
            persj.idpersona_juridica,
			persj.documento_tipo,
			persj.documento_nro,
			persj.razon_social,
            rep.idrepresentante,
			dist.distrito,
			prov.provincia,
			dept.departamento,
            dist.iddistrito,
			persj.direccion,
			persUsu.nombres AS usuario
			FROM clientes AS clien
			INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            LEFT JOIN rep_legales_clientes AS rep ON rep.idpersona_juridica = persj.idpersona_juridica
			INNER JOIN distritos AS dist ON dist.iddistrito = persj.iddistrito
			INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
			INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
			INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario	
			INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
			WHERE clien.inactive_at IS NULL 
				AND clien.tipo_persona = _tipoPersona
                AND clien.idcliente = _idcliente
			ORDER BY persj.documento_nro ASC;
		END IF;
        SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_contract` ()   BEGIN
    SELECT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN clientes clien ON clien.idcliente = cont.idcliente 
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = clien.idcliente 
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = clien.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND cont.inactive_at IS NULL
        
    UNION 
    SELECT DISTINCT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN separaciones sep ON sep.idseparacion = cont.idseparacion
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = sep.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = sep.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND cont.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_contractDN` (IN `_documento_nro` VARCHAR(20))   BEGIN
    SELECT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN clientes clien ON clien.idcliente = cont.idcliente
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = clien.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = clien.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND (cl.documento_nro LIKE CONCAT(_documento_nro,'%') OR cn.documento_nro LIKE CONCAT(_documento_nro,'%'))
        AND cont.inactive_at IS NULL
    UNION 
    SELECT DISTINCT 
        COALESCE(cl.idcliente, cn.idcliente) AS idcliente,
        COALESCE(cl.cliente, cn.cliente) AS cliente,
        COALESCE(cl.documento_tipo, cn.documento_tipo) AS documento_tipo,
        COALESCE(cl.documento_nro, cn.documento_nro) AS documento_nro
        FROM contratos cont
        INNER JOIN separaciones sep ON sep.idseparacion = cont.idseparacion
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = sep.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = sep.idcliente
        WHERE cont.estado = 'VIGENTE'
        AND (cl.documento_nro LIKE CONCAT(_documento_nro,'%') OR cn.documento_nro LIKE CONCAT(_documento_nro,'%'))
        AND cont.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_onlyNperson` ()   BEGIN
    SELECT 
        clien.idcliente,
        pers.documento_tipo,
        pers.documento_nro,
        pers.apellidos,
        pers.nombres
        FROM clientes clien
        INNER JOIN personas pers ON pers.idpersona = clien.idpersona
        WHERE clien.inactive_at IS NULL
        AND pers.inactive_at IS NULL
        ORDER BY pers.documento_nro ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_tpersona` (IN `_tipo_persona` VARCHAR(10))   BEGIN
	IF _tipo_persona = "NATURAL" THEN
		SELECT
		clien.idcliente,
        clien.tipo_persona,
        pers.apellidos,
        pers.nombres,
		pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.distrito,
        prov.provincia,
        dept.departamento,
        pers.direccion,
        persUsu.nombres AS usuario
		FROM clientes AS clien
        INNER JOIN personas AS pers ON pers.idpersona = clien.idpersona
        INNER JOIN distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario
        INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
        WHERE clien.inactive_at IS NULL AND clien.tipo_persona = _tipo_persona
        ORDER BY pers.documento_nro ASC;
    ELSE 
		SELECT
			clien.idcliente,
			clien.tipo_persona,
            persj.idpersona_juridica,
			persj.documento_tipo,
			persj.documento_nro,
			persj.razon_social,
            rep.idrepresentante,
			dist.distrito,
			prov.provincia,
			dept.departamento,
			persj.direccion,
			persUsu.nombres AS usuario
			FROM clientes AS clien
			INNER JOIN personas_juridicas AS persj ON persj.idpersona_juridica = clien.idpersona_juridica
            LEFT JOIN rep_legales_clientes AS rep ON rep.idpersona_juridica = persj.idpersona_juridica
			INNER JOIN distritos AS dist ON dist.iddistrito = persj.iddistrito
			INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
			INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
			INNER JOIN usuarios AS usu ON usu.idusuario = clien.idusuario	
			INNER JOIN personas AS persUsu ON persUsu.idpersona = usu.idpersona
			WHERE clien.inactive_at IS NULL AND clien.tipo_persona = _tipo_persona
            GROUP BY persj.razon_social
			ORDER BY persj.documento_nro ASC;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_companies` ()   BEGIN
	SELECT * FROM vws_list_companies
    ORDER BY 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_configs` (IN `_clave` VARCHAR(100))   BEGIN
    SELECT * 
    FROM configuraciones 
    WHERE clave = _clave;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_contractsAll` ()   BEGIN
    SELECT 
        idcontrato,
        n_expediente
        FROM contratos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_contracts_types` (IN `_tipo_contrato` VARCHAR(40))   BEGIN
    SELECT *
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
        ) AS resultado
        ORDER BY idcontrato DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_contracts_types_date` (IN `_tipo_contrato` VARCHAR(40), IN `_fecha_inicio` DATE, IN `_fecha_fin` DATE)   BEGIN
    SELECT *
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.inactive_at IS NULL
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.inactive_at IS NULL
        ) AS resultado
        WHERE resultado.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
        ORDER BY idcontrato DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_contracts_types_date_n_expediente` (IN `_tipo_contrato` VARCHAR(40), IN `_fecha_inicio` DATE, IN `_fecha_fin` DATE, IN `_n_expediente` VARCHAR(40))   BEGIN
    SELECT *
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.n_expediente LIKE CONCAT(_n_expediente,'%')
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.estado,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.fecha_contrato,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.tipo_contrato = _tipo_contrato
                AND cnt.inactive_at IS NULL
                AND cnt.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
                AND cnt.n_expediente LIKE CONCAT(_n_expediente,'%')
        ) AS resultado
        WHERE resultado.fecha_contrato BETWEEN _fecha_inicio AND _fecha_fin
        ORDER BY idcontrato DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_cost_category` ()   BEGIN
	SELECT
		idcategoria_costo,
        categoria_costo
		FROM categoria_costos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_cost_subcategory` (IN `_idcategoria_costo` INT)   BEGIN
	SELECT 
		subcat.idsubcategoria_costo,
		cat.idcategoria_costo,
        cat.categoria_costo,
        subcat.subcategoria_costo,
        subcat.requiere_material
		FROM subcategoria_costos subcat
        INNER JOIN categoria_costos cat ON cat.idcategoria_costo  = subcat.idcategoria_costo
        WHERE subcat.idcategoria_costo = _idcategoria_costo 
        ORDER BY subcat.subcategoria_costo ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_departaments` ()   BEGIN
	SELECT * FROM departamentos
    ORDER BY 2 ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_detail_cost` (IN `_idpresupuesto` INT)   BEGIN
		SELECT
			detcost.iddetalle_costo,
			detcost.idpresupuesto,
			cat.categoria_costo,
            cat.idcategoria_costo,
			subcat.subcategoria_costo,
            subcat.idsubcategoria_costo,
            detcost.idmaterial,
            CASE 
				WHEN detcost.idmaterial IS NOT NULL THEN
				CONCAT(marc.marca, " // ", mat.material, " // ",unimed.unidad_medida)
				ELSE
                detcost.detalle
			END AS detalle,
            detcost.cantidad,
            detcost.precio_unitario,
            (detcost.cantidad * detcost.precio_unitario) AS total,
            pers.nombres AS usuario
			FROM detalle_costos detcost
			INNER JOIN presupuestos pres ON pres.idpresupuesto = detcost.idpresupuesto
			INNER JOIN subcategoria_costos subcat ON subcat.idsubcategoria_costo = detcost.idsubcategoria_costo
			INNER JOIN categoria_costos cat ON cat.idcategoria_costo = subcat.idcategoria_costo
            LEFT JOIN materiales mat ON mat.idmaterial = detcost.idmaterial
            LEFT JOIN marcas marc ON marc.idmarca = mat.idmarca
            LEFT JOIN unidades_medida unimed ON unimed.idunidad_medida = mat.idunidad_medida
			INNER JOIN usuarios usu ON usu.idusuario = detcost.idusuario
			INNER JOIN personas pers ON pers.idpersona = usu.idpersona
			WHERE detcost.idpresupuesto = _idpresupuesto
			AND detcost.inactive_at IS NULL
			ORDER BY cat.categoria_costo, subcat.subcategoria_costo ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_det_contracts` (IN `_idcontrato` INT)   BEGIN
    SELECT 
        dtc.iddetalle_contrato,
        cnt.idcontrato,
        cnt.n_expediente,
        cnt.precio_venta,
        cnt.fecha_contrato,
        rp.idrepresentante,
        rp.representante_legal,
        rp.documento_tipo,
        rp.documento_nro,
        rp.cargo,
        rp.partida_elect
        FROM detalles_contratos dtc
        INNER JOIN contratos cnt ON cnt.idcontrato = dtc.idcontrato
        INNER JOIN rep_legales_clientes rp ON rp.idrepresentante = dtc.idrepresentante
        WHERE cnt.idcontrato = _idcontrato
        AND dtc.inactive_at IS NULL
        ORDER BY cnt.n_expediente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_det_contract_ById` (IN `_iddetalle_contrato` INT)   BEGIN
    SELECT 
        dtc.iddetalle_contrato,
        cnt.idcontrato,
        cnt.n_expediente,
        cnt.precio_venta,
        cnt.fecha_contrato,
        rp.representante_legal,
        rp.documento_tipo,
        rp.documento_nro,
        rp.cargo,
        rp.partida_elect
        FROM detalles_contratos dtc
        INNER JOIN contratos cnt ON cnt.idcontrato = dtc.idcontrato
        INNER JOIN rep_legales_clientes rp ON rp.idrepresentante = dtc.idrepresentante
        WHERE dtc.iddetalle_contrato = _iddetalle_contrato
        AND dtc.inactive_at IS NULL
        ORDER BY cnt.n_expediente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_districts` (IN `_idprovincia` INT)   BEGIN
	SELECT * 
    FROM distritos
    WHERE idprovincia = _idprovincia
    ORDER BY 3 ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_lots_ByIdBudget` (IN `_idpresupuesto` INT)   BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            INNER JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
			WHERE act.idpresupuesto = _idpresupuesto
            AND act.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_lots_ForBudget` (IN `_idpresupuesto` INT)   BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            LEFT JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
            WHERE act.inactive_at IS NULL
				AND act.idpresupuesto = _idpresupuesto OR act.idpresupuesto IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_lots_noBudgets` ()   BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            LEFT JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
			WHERE pres.idpresupuesto IS NULL
			AND act.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_lots_withBudgets` ()   BEGIN
	SELECT 	
			act.idactivo,
			act.idproyecto, 
            proy.denominacion,
			act.sublote, 
            act.idpresupuesto 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            INNER JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
			WHERE act.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_materials` (IN `_idmarca` INT)   BEGIN
	SELECT 
		mat.idmaterial,
        marc.idmarca,
        marc.marca,
        mat.material,
        unimed.unidad_medida,
        mat.precio_unitario
		FROM materiales mat
        INNER JOIN marcas marc ON marc.idmarca = mat.idmarca
        INNER JOIN unidades_medida unimed ON unimed.idunidad_medida = mat.idunidad_medida
        WHERE marc.idmarca = _idmarca
        ORDER BY mat.material ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_onlyHouses` (IN `_idproyecto` INT)   BEGIN
    SELECT 
        act.idactivo,
        proy.idproyecto,
        proy.denominacion,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta
        FROM activos act
        INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
        WHERE act.tipo_activo = "CASA"
        AND act.estado = "SIN VENDER"
        AND act.inactive_at IS NULL
        AND proy.idproyecto = _idproyecto
        AND act.precio_venta > 0
        ORDER BY act.sublote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_onlyLots` (IN `_idproyecto` INT)   BEGIN
    SELECT 
        act.idactivo,
        proy.idproyecto,
        proy.denominacion,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta
        FROM activos act
        INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
        WHERE act.tipo_activo = "LOTE"
        AND act.estado = "SIN VENDER"
        AND act.inactive_at IS NULL
        AND proy.idproyecto = _idproyecto
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.clave')) = 0
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.valor')) = 0
        AND act.precio_venta > 0
        ORDER BY act.sublote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_onlyLots_sep` (IN `_idproyecto` INT)   BEGIN
    SELECT 
        act.idactivo,
        proy.idproyecto,
        proy.denominacion,
        act.sublote,
        act.estado,
        act.moneda_venta,
        act.precio_venta
        FROM activos act
        INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
        WHERE act.tipo_activo = "LOTE"
        AND act.estado = "SEPARADO"
        AND act.inactive_at IS NULL
        AND proy.idproyecto = _idproyecto
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.clave')) = 0
        AND JSON_ARRAY(JSON_EXTRACT(det_casa,'$.valor')) = 0
        AND act.precio_venta > 0
        ORDER BY act.sublote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_person` ()   BEGIN
	SELECT
		pers.idpersona,
        pers.nombres,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.iddistrito,
        prov.idprovincia,
        dept.iddepartamento
		FROM pesonas AS pers
        INNER JOIN 	distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN 	provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN 	departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE pers.inactive_at IS NULL
        ORDER BY pers.idpersona DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_person_doc_nro` (IN `_documento_nro` VARCHAR(12))   BEGIN
	SELECT
		pers.idpersona,
        pers.nombres,
        pers.nombres,
        pers.apellidos,
        pers.documento_tipo,
        pers.documento_nro,
        pers.estado_civil,
        dist.iddistrito,
        prov.idprovincia,
        dept.iddepartamento
		FROM pesonas AS pers
        INNER JOIN 	distritos AS dist ON dist.iddistrito = pers.iddistrito
        INNER JOIN 	provincias AS prov ON prov.idprovincia = dist.idprovincia
        INNER JOIN 	departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
        WHERE pers.inactive_at IS NULL AND pers.documento_nro LIKE CONCAT(_documento_nro,'%')
        ORDER BY pers.idpersona DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_projects` ()   BEGIN
	SELECT * FROM vws_list_projects;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_projects_by_code` (IN `_codigo` VARCHAR(20))   BEGIN
		SELECT * FROM vws_list_projects
        WHERE codigo LIKE CONCAT("%", _codigo,"%");
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_projects_id` (IN `_idproyecto` INT)   BEGIN
	SELECT * FROM vws_list_projects
    WHERE idproyecto = _idproyecto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_projects_typeAct` (IN `_tipo_activo` VARCHAR(10))   BEGIN
    DECLARE T_act varchar(10);
    SET T_act = _tipo_activo;
    IF _tipo_activo = "CASA" THEN 
        SELECT 
        py.idproyecto,
        py.denominacion,
        T_act as tipo
        FROM proyectos py
        INNER JOIN activos ac ON ac.idproyecto = py.idproyecto
        WHERE py.inactive_at IS NULL
            AND ac.inactive_at IS NULL
            AND ac.tipo_activo = _tipo_activo
            AND ac.estado = "SIN VENDER"
            GROUP BY py.idproyecto
            ORDER BY py.denominacion ASC;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_provinces` (IN `_iddepartamento` INT)   BEGIN
	SELECT * 
    FROM provincias 
    WHERE iddepartamento = _iddepartamento
    ORDER BY 3 ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_quotas_ById` (IN `_idcuota` INT)   BEGIN
    SELECT  
            detc.iddetalle_cuota,
            qt.idcuota,
            ct.idcontrato,
            ct.n_expediente,
            qt.monto_cuota,
            (SUM(detc.monto_pago)) as cancelado,
            (qt.monto_cuota - (COALESCE(SUM(detc.monto_pago),0.00))) as deuda,
            qt.fecha_vencimiento,
            (SELECT fecha_pago 
            FROM detalle_cuotas 
            WHERE idcuota = qt.idcuota
            ORDER BY iddetalle_cuota DESC LIMIT 1) AS fecha_pago,
            qt.estado,
            detc.entidad_bancaria,
            detc.tipo_pago,
            detc.detalles,
            detc.imagen,
            pers.nombres AS usuario,
            qt.inactive_at
        FROM cuotas qt
        LEFT JOIN detalle_cuotas detc ON detc.idcuota = qt.idcuota
        INNER JOIN contratos ct ON ct.idcontrato = qt.idcontrato
        INNER JOIN usuarios usu ON usu.idusuario = qt.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE detc.inactive_at IS NULL
        AND qt.idcuota = _idcuota
        AND qt.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_quotas_estado_fven` (IN `_idcontrato` INT, IN `_estado` VARCHAR(20), IN `_fecha_vencimiento` DATE)   BEGIN

    IF _estado = "0" THEN 
        SELECT *
            FROM vws_list_quotas
            WHERE idcontrato = _idcontrato
            AND fecha_vencimiento <= _fecha_vencimiento
            AND inactive_at IS NULL
            ORDER BY fecha_vencimiento;
    ELSE
        SELECT *
            FROM vws_list_quotas
            WHERE idcontrato = _idcontrato
            AND estado = _estado
            AND fecha_vencimiento <= _fecha_vencimiento
            AND inactive_at IS NULL
            ORDER BY fecha_vencimiento;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_quotas_idcontrato` (IN `_idcontrato` INT)   BEGIN
    SELECT *
        FROM vws_list_quotas
        WHERE idcontrato = _idcontrato
        AND inactive_at IS NULL
        ORDER BY fecha_vencimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_quotas_reprogram` (IN `_idcontrato` INT)   BEGIN
    SELECT 
        lq.idcontrato,
        ct.idcontrato,
        ct.precio_venta,
        COALESCE(ct.inicial,0) AS inicial,
        (SUM(lq.cancelado)) as monto_cancelado,
        (ct.precio_venta - COALESCE(ct.inicial,0) - (SUM(lq.cancelado))) as saldo
        FROM vws_list_quotas lq
        INNER JOIN contratos ct ON ct.idcontrato = lq.idcontrato
        WHERE ct.idcontrato = _idcontrato;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_refunds_get` ()   BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_represents_by_id_pj` (IN `_idpersona_juridica` INT)   BEGIN
	SELECT 
		idrepresentante,
        idpersona_juridica,
        representante_legal,
        documento_tipo,
        documento_nro,
        cargo,
        partida_elect,
        estado
		FROM rep_legales_clientes
        WHERE idpersona_juridica = _idpersona_juridica 
        AND inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_separations` ()   BEGIN
    SELECT 
        idseparacion,
        n_expediente,
        idactivo,
        idcliente,
        idconyugue,
        separacion_monto
        FROM separaciones
        ORDER BY n_expediente ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_separations_all` ()   BEGIN

    SELECT 
        sp.idseparacion,
        sp.n_expediente,
        ac.idactivo,
        ac.precio_venta,
        ac.moneda_venta,
        sp.idcliente,
        sp.idconyugue,
        sp.separacion_monto,
        sp.existe_contrato
        FROM separaciones sp
        INNER JOIN activos ac ON ac.idactivo = sp.idactivo 
        WHERE idseparacion NOT IN (
            SELECT cnt.idseparacion
            FROM contratos cnt
            INNER JOIN separaciones sep On sep.idseparacion = cnt.idseparacion
            WHERE cnt.inactive_at IS NULL
            AND sep.inactive_at IS NOT NULL
            AND cnt.idseparacion IS NOT NULL
        )
        AND sp.inactive_at IS NULL
        AND ac.estado = "SEPARADO"
        ORDER BY sp.n_expediente ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_separation_ByIdAsset` (IN `_idactivo` INT)   BEGIN

    SELECT 
        lcn.idseparacion,
        lcn.idcliente,
        lcn.cliente,
        lcn.documento_nro,
        lcn.tipo_persona,
        lcn.existe_contrato
    FROM
        vws_list_separations_tpersona_natural_full lcn
        LEFT JOIN separaciones sep ON sep.idseparacion = lcn.idseparacion
    WHERE
        sep.idactivo = 6
        AND lcn.inactive_at IS NULL
    UNION
    SELECT 
        lcj.idseparacion,
        lcj.idcliente,
        lcj.cliente,
        lcj.documento_nro,
        lcj.tipo_persona,
        lcj.existe_contrato
    FROM
        vws_list_separations_tpersona_juridica_full lcj
        LEFT JOIN separaciones sep ON sep.idseparacion = lcj.idseparacion
    WHERE
    sep.idactivo = 6
    AND lcj.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_separation_n_expediente_docNro` (IN `_tipo_persona` VARCHAR(10), IN `_fechaInicio` DATE, IN `_fechaFin` DATE, IN `_campoCriterio` VARCHAR(12))   BEGIN

    IF _tipo_persona = "NATURAL" THEN

        SELECT * FROM vws_list_separations_tpersona_natural
            WHERE inactive_at_sep IS NULL
                AND inactive_at_client IS NULL
                AND create_at BETWEEN _fechaInicio AND _fechaFin
                AND n_expediente LIKE CONCAT(_campoCriterio,'%')
                OR documento_nro LIKE CONCAT(_campoCriterio,'%');
    ELSEIF _tipo_persona = "JURÍDICA" THEN
        SELECT * FROM vws_list_separations_tpersona_juridica
        WHERE inactive_at_sep IS NULL
            AND inactive_at_client IS NULL
            AND create_at BETWEEN _fechaInicio AND _fechaFin
           AND n_expediente LIKE CONCAT(_campoCriterio,'%')
           OR documento_nro LIKE CONCAT(_campoCriterio,'%');
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_separation_tPersona` (IN `_tipo_persona` VARCHAR(10), IN `_fechaInicio` DATE, IN `_fechaFin` DATE)   BEGIN

    IF _tipo_persona = "NATURAL" THEN

        SELECT * FROM vws_list_separations_tpersona_natural
		WHERE inactive_at_sep IS NULL
            AND inactive_at_client IS NULL
            AND create_at BETWEEN _fechaInicio AND _fechaFin;
    ELSEIF _tipo_persona = "JURÍDICA" THEN
        SELECT * FROM vws_list_separations_tpersona_juridica
        WHERE inactive_at_sep IS NULL
            AND inactive_at_client IS NULL
            AND create_at BETWEEN _fechaInicio AND _fechaFin;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_units_measuraments` ()   BEGIN
	SELECT * FROM unidades_medida
    ORDER BY unidad_medida ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_updates` (IN `_fechaInicio` DATE, IN `_fechaFin` DATE)   BEGIN 
    SELECT 
        idactualizacion,
        objeto_cambio,
        motivo,
        detalle,
        usuario,
        create_at
        FROM actualizaciones
        WHERE DATE(create_at) BETWEEN _fechaInicio AND _fechaFin
        ORDER BY create_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_lits_contracts_full_by_id` (IN `_idcontrato` INT)   BEGIN
	
    SELECT 
        rs.idcontrato,
        rs.n_expediente,
        rs.tipo_contrato,
        rs.idrepresentante_primario,
        CONCAT(per.apellidos,', ',per.nombres) representante_primario,
        per.documento_tipo AS rp_doc_type,
        per.documento_nro AS rp_doc_nro,
        rs.idrepresentante_secundario,
        rs.idcliente,
        CONCAT(pers.apellidos,', ',pers.nombres) AS representante_secundario,
        pers.documento_tipo AS rs_doc_type,
        pers.documento_nro AS rs_doc_nro,
        sd.idsede,
        sd.iddistrito AS sede_distrito,
        rs.cliente,
        rs.tipo_persona,
        rs.documento_tipo,
        rs.documento_nro,
        CONCAT(pery.apellidos,', ',pery.nombres) AS conyugue,
        pery.documento_tipo AS dc_type,
        pery.documento_nro AS dc_nro, 
        rs.idseparacion,
        rs.n_separacion,
        rs.idactivo,
        rs.sublote,
        rs.idproyecto,
        rs.denominacion,
        rs.tipo_cambio,
        rs.estado,
        rs.fecha_contrato,
        rs.det_contrato,
        rs.precio_venta,
        rs.moneda_venta,
        rs.inicial,
        rs.archivo,
        rs.nombres
        FROM (
            SELECT  
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.idrepresentante_primario,
                cnt.idrepresentante_secundario,
                sp.idcliente,
                COALESCE(persj.cliente,persn.cliente) as cliente,
                COALESCE(persj.tipo_persona,persn.tipo_persona) as tipo_persona,
                COALESCE(persj.documento_tipo,persn.documento_tipo) as documento_tipo,
                COALESCE(persj.documento_nro,persn.documento_nro) as documento_nro,
                cnt.idconyugue,
                sp.idseparacion,
                sp.n_expediente AS n_separacion,
                ac.idactivo, 
                ac.sublote,
                py.idsede,
                py.idproyecto,
                py.denominacion,
                cnt.tipo_cambio,
                cnt.estado,
                cnt.fecha_contrato,
                cnt.det_contrato,
                cnt.precio_venta,
                cnt.moneda_venta,
                cnt.inicial,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                INNER JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                LEFT JOIN vws_list_separations_tpersona_juridica persj ON persj.idseparacion = sp.idseparacion
                LEFT JOIN vws_list_separations_tpersona_natural persn ON persn.idseparacion = sp.idseparacion
                INNER JOIN activos ac ON ac.idactivo = sp.idactivo
                INNER JOIN proyectos py ON py.idproyecto = ac.idproyecto
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                AND cnt.inactive_at IS NULL
            UNION 
            SELECT
                cnt.idcontrato,
                cnt.n_expediente,
                cnt.tipo_contrato,
                cnt.idrepresentante_primario,
                cnt.idrepresentante_secundario,
                cl.idcliente,
                COALESCE(CONCAT(pr.apellidos,', ',pr.nombres),pj.razon_social) AS cliente,
                cl.tipo_persona,
                COALESCE(pr.documento_tipo,pj.documento_tipo) AS documento_tipo,
                COALESCE(pr.documento_nro,pj.documento_nro) AS documento_nro,
                cnt.idconyugue,
                sp.idseparacion,
                sp.n_expediente AS n_separacion,
                ac.idactivo,
                ac.sublote,
                py.idsede,
                py.idproyecto,
                py.denominacion,
                cnt.tipo_cambio,
                cnt.estado,
                cnt.fecha_contrato,
                cnt.det_contrato,
                cnt.precio_venta,
                cnt.moneda_venta,
                cnt.inicial,
                cnt.archivo,
                per.nombres
                FROM contratos cnt
                LEFT JOIN separaciones sp ON sp.idseparacion = cnt.idseparacion
                INNER JOIN clientes cl ON cl.idcliente = cnt.idcliente
                LEFT JOIN personas pr ON pr.idpersona = cl.idpersona
                LEFT JOIN personas_juridicas pj ON pj.idpersona_juridica = cl.idpersona_juridica
                INNER JOIN activos ac ON ac.idactivo = cnt.idactivo
                INNER JOIN proyectos py ON py.idproyecto = ac.idproyecto
                INNER JOIN usuarios usu ON usu.idusuario = cnt.idusuario
                INNER JOIN personas per ON per.idpersona = usu.idpersona
                WHERE cnt.inactive_at IS NULL
        ) AS rs
        INNER JOIN representantes rp ON rp.idrepresentante = rs.idrepresentante_primario
        INNER JOIN personas per ON per.idpersona = rp.idpersona
        INNER JOIN sedes sd ON sd.idsede = rs.idsede

        LEFT JOIN representantes rsec ON rsec.idrepresentante = rs.idrepresentante_secundario
        LEFT JOIN personas pers ON pers.idpersona = rsec.idpersona

        LEFT JOIN clientes cly ON cly.idcliente = rs.idconyugue
        LEFT JOIN personas pery ON pery.idpersona = cly.idpersona
        WHERE rs.idcontrato = _idcontrato;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_resume_budget_category` (IN `_idpresupuesto` INT)   BEGIN
	SELECT 
		cat.idcategoria_costo,
        cat.categoria_costo,
        SUM(detcost.precio_unitario * detcost.cantidad) AS total
		FROM detalle_costos detcost
        INNER JOIN subcategoria_costos subcat ON subcat.idsubcategoria_costo = detcost.idsubcategoria_costo
        INNER JOIN categoria_costos cat ON cat.idcategoria_costo = subcat.idcategoria_costo
        WHERE detcost.idpresupuesto = _idpresupuesto
        GROUP BY 
			cat.idcategoria_costo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_resume_budget_subcatgory` (IN `_idpresupuesto` INT)   BEGIN
	SELECT 
		cat.idcategoria_costo,
        cat.categoria_costo,
        subcat.idsubcategoria_costo,
        subcat.subcategoria_costo,
        SUM(detcost.precio_unitario * detcost.cantidad) AS total
		FROM detalle_costos detcost
        INNER JOIN subcategoria_costos subcat ON subcat.idsubcategoria_costo = detcost.idsubcategoria_costo
        INNER JOIN categoria_costos cat ON cat.idcategoria_costo = subcat.idcategoria_costo
		WHERE idpresupuesto = _idpresupuesto
        GROUP BY 
			cat.idcategoria_costo,
            subcat.idsubcategoria_costo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_search_budgets` (IN `_codigo` VARCHAR(8))   BEGIN
	DECLARE _valueDefault DECIMAL(8,2);
    SET _valueDefault = 0.00;
	SELECT
		pres.idpresupuesto,
        pres.codigo,
        pres.modelo,
        pres.area_construccion,
        CASE
			WHEN detcost.idpresupuesto IS NOT NULL AND detcost.inactive_at IS NULL THEN
				(SUM(detcost.cantidad * detcost.precio_unitario)) 
			ELSE
				_valueDefault
		END AS total,
        pers.nombres AS usuario
		FROM presupuestos pres
        LEFT JOIN detalle_costos detcost ON detcost.idpresupuesto = pres.idpresupuesto
        INNER JOIN usuarios usu ON usu.idusuario = pres.idusuario
        INNER JOIN personas pers ON pers.idpersona = usu.idpersona
        WHERE pres.inactive_at IS NULL
        AND pres.codigo LIKE CONCAT(_codigo,'%')
        AND detcost.inactive_at IS NULL
        GROUP BY pres.idpresupuesto
        ORDER BY pres.codigo ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_assets` (IN `_idactivo` INT, IN `_idproyecto` INT, IN `_tipo_activo` VARCHAR(10), IN `_imagen` VARCHAR(100), IN `_estado` VARCHAR(10), IN `_sublote` VARCHAR(6), IN `_direccion` CHAR(70), IN `_moneda_venta` VARCHAR(10), IN `_area_terreno` DECIMAL(6,2), IN `_area_construccion` DECIMAL(6,2), IN `_area_techada` DECIMAL(6,2), IN `_zcomunes_porcent` TINYINT, IN `_partida_elect` VARCHAR(100), IN `_latitud` VARCHAR(20), IN `_longitud` VARCHAR(20), IN `_perimetro` JSON, IN `_idpresupuesto` INT, IN `_propietario_lote` VARCHAR(70), IN `_precio_lote` DECIMAL(8,2), IN `_precio_construccion` DECIMAL(8,2), IN `_precio_venta` DECIMAL(8,2), IN `_idusuario` INT)   BEGIN
	UPDATE activos
		SET
			idproyecto		= _idproyecto,
            tipo_activo		= _tipo_activo,
            imagen 			= NULLIF(_imagen,""),
            estado			= _estado,
            sublote 		= _sublote,
            direccion 		= _direccion,
            moneda_venta 	= _moneda_venta,
            area_terreno	= _area_terreno,
            area_construccion = _area_construccion,
            area_techada    = _area_techada,
            zcomunes_porcent = _zcomunes_porcent,
            partida_elect 	= _partida_elect,
            latitud 		= NULLIF(_latitud,""),
            longitud		= NULLIF(_longitud,""),
            perimetro 		= NULLIF(_perimetro, ""),
            idpresupuesto	= NULLIF(_idpresupuesto, ""),
            propietario_lote = _propietario_lote,
            precio_lote		= NULLIF(precio_lote,""),
            precio_construccion = NULLIF(_precio_construccion,""),
            precio_venta 	= _precio_venta,
            precio_venta	= _precio_venta,
            idusuario		= _idusuario,
            update_at		= CURDATE() 
		WHERE
			idactivo = _idactivo;
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_budget` (IN `_idpresupuesto` INT, IN `_codigo` CHAR(8), IN `_modelo` VARCHAR(30), IN `_area_construccion` DECIMAL(6,2), IN `_idusuario` INT)   BEGIN
	UPDATE presupuestos
		SET
			codigo 		= _codigo,
            modelo		= _modelo,
            area_construccion = _area_construccion,
            idusuario 	= _idusuario,
            update_at 	= CURDATE()
		WHERE idpresupuesto = _idpresupuesto;
	SELECT 
		(SELECT ROW_COUNT()) AS filasAfect,
        idpresupuesto,
        codigo,
        modelo
        FROM presupuestos
		WHERE idpresupuesto = _idpresupuesto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_clientJ` (IN `_idcliente` INT, IN `_tipo_persona` VARCHAR(10), IN `_idpersona_juridica` INT, IN `_razon_social` VARCHAR(60), IN `_documento_tipo` VARCHAR(20), IN `_documento_nro` VARCHAR(12), IN `_iddistrito` INT, IN `_direccion` VARCHAR(70), IN `_idusuario` INT)   BEGIN
	UPDATE personas_juridicas
			SET
				razon_social	= _razon_social,
				documento_tipo 	= _documento_tipo,
				documento_nro 	= _documento_nro,
				iddistrito		= _iddistrito,
				direccion 		= _direccion,
				update_at 		= CURDATE()
			WHERE
				idpersona_juridica = _idpersona_juridica;
			SELECT ROW_COUNT() AS filasAfect;
		-- ACTUALIZA LOS DATOS DEL CLIENTE
			UPDATE clientes
					SET
						tipo_persona	= _tipo_persona,
						idpersona_juridica 	= _idpersona_juridica,
						update_at 			= CURDATE(),
						idusuario 			= _idusuario
					WHERE 
						idcliente = _idcliente;
		SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_clientN` (IN `_idcliente` INT, IN `_tipo_persona` VARCHAR(10), IN `_idpersona` INT, IN `_nombres` VARCHAR(40), IN `_apellidos` VARCHAR(40), IN `_documento_tipo` VARCHAR(30), IN `_documento_nro` VARCHAR(12), IN `_estado_civil` VARCHAR(20), IN `_iddistrito` INT, IN `_direccion` VARCHAR(70), IN `_nacionalidad` VARCHAR(20), IN `_idusuario` INT)   BEGIN    
	UPDATE personas
		SET
			nombres 		= _nombres,
			apellidos		= _apellidos,
			documento_tipo	= _documento_tipo,
			documento_nro	= _documento_nro,
			estado_civil	=  _estado_civil,
			iddistrito		= _iddistrito,
            direccion		= _direccion,
            nacionalidad	= _nacionalidad,
            update_at 		= CURDATE()
		WHERE 
			idpersona = _idpersona;
        SELECT ROW_COUNT() AS filasAfect;
        UPDATE clientes 
			SET 
				tipo_persona 	= _tipo_persona,
				idpersona 		= _idpersona,
                idusuario		= _idusuario,
                update_at		= CURDATE()
                
			WHERE idcliente = _idcliente;
			SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_contract` (IN `_idcontrato` INT, IN `_n_expediente` VARCHAR(10), IN `_tipo_contrato` VARCHAR(40), IN `_idseparacion` INT, IN `_idrepresentante_primario` INT, IN `_idrepresentante_secundario` INT, IN `_idcliente` INT, IN `_idconyugue` INT, IN `_idactivo` INT, IN `_tipo_cambio` DECIMAL(4,3), IN `_fecha_contrato` DATE, IN `_precio_venta` DECIMAL(8,2), IN `_moneda_venta` VARCHAR(10), IN `_inicial` DECIMAL(8,2), IN `_det_contrato` JSON, IN `_archivo` VARCHAR(100), IN `_idusuario` INT)   BEGIN

	UPDATE contratos
		SET
            n_expediente   = _n_expediente,
			tipo_contrato 	= _tipo_contrato, 
			idseparacion	= NULLIF(_idseparacion,''), 
            idrepresentante_primario	= idrepresentante_primario, 
            idrepresentante_secundario	= NULLIF(_idrepresentante_secundario, ''),
			idcliente		= NULLIF(_idcliente,''), 
			idconyugue		= NULLIF(_idconyugue, ''),
			idactivo		= NULLIF(_idactivo, ''),  
			tipo_cambio		= _tipo_cambio, 
			fecha_contrato 	= _fecha_contrato,
            precio_venta		= _precio_venta,
			det_contrato	    = NULLIF(_det_contrato, ''),
            moneda_venta        = _moneda_venta,
            inicial 			= _inicial,
            archivo			= _archivo,
            idusuario		= _idusuario,
            update_at		= CURDATE()
        WHERE
			idcontrato = _idcontrato;
    SELECT _idcontrato AS idcontrato;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_detail_cost` (IN `_iddetalle_costo` INT, IN `_idpresupuesto` INT, IN `_idsubcategoria_costo` INT, IN `_idmaterial` INT, IN `_detalle` VARCHAR(100), IN `_cantidad` TINYINT, IN `_precio_unitario` DECIMAL(8,2), IN `_idusuario` INT)   BEGIN
	UPDATE detalle_costos
		SET
			idpresupuesto 			= _idpresupuesto,
            idsubcategoria_costo	= _idsubcategoria_costo,
            idmaterial				= NULLIF(_idmaterial,""),
            detalle					= _detalle,
            cantidad				= _cantidad,
            precio_unitario			= _precio_unitario,
            idusuario 				= _idusuario,
            update_at 				= CURDATE()
        WHERE
			iddetalle_costo = _iddetalle_costo;
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_det_build` (IN `_idactivo` INT, IN `_det_casa` JSON, IN `_idusuario` INT)   BEGIN
	DECLARE oldDetCasa JSON;
    SET oldDetCasa = (
		SELECT det_casa FROM activos WHERE idactivo = _idactivo
    );
	IF _det_casa != oldDetCasa THEN
		UPDATE activos SET
			det_casa = _det_casa,
			update_at = CURDATE(),
            idusuario = _idusuario
		WHERE 
			idactivo = _idactivo;
		SELECT ROW_COUNT() AS filasAfect;
	ELSE 
		(SELECT COUNT(*) -2 AS filasAfect FROM activos WHERE idactivo = _idactivo);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_det_contract` (IN `_iddetalle_contrato` INT, IN `_idrepresentante` INT, IN `_idcontrato` INT)   BEGIN
    UPDATE detalles_contratos
        SET 
            idrepresentante = _idrepresentante, 
            idcontrato = _idcontrato,
            update_at = CURDATE()
        WHERE
            iddetalle_contrato = _iddetalle_contrato;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_det_quota` (IN `_idcuota` INT, IN `_fecha_pago` DATE, IN `_monto_pago` DECIMAL(8,2), IN `_detalles` VARCHAR(100), IN `_tipo_pago` VARCHAR(20), IN `_entidad_bancaria` VARCHAR(20), IN `_imagen` VARCHAR(100), IN `_idusuario` INT)   BEGIN
    DECLARE _countInsert INT;
    DECLARE _countUpdate INT;
    INSERT INTO detalle_cuotas(
        idcuota,
        fecha_pago,
        monto_pago,
        detalles,
        tipo_pago,
        entidad_bancaria,
        imagen
    )
    VALUES (
        _idcuota,
        _fecha_pago,
        _monto_pago,
        _detalles,
        _tipo_pago,
        _entidad_bancaria,
        _imagen
    );
    SET _countInsert =  (SELECT ROW_COUNT());
    UPDATE cuotas
        SET
        estado = "CANCELADO",
        idusuario = _idusuario,
        update_at = CURDATE()
        WHERE idcuota = _idcuota;
    SET _countUpdate = (SELECT ROW_COUNT());
    CASE 
        WHEN _countUpdate = 0 THEN
            SELECT (_countInsert) AS filasAfect;
        ELSE
            SELECT (_countUpdate) AS filasAfect;
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_idpresupuesto` (IN `_idactivo` INT, IN `_idpresupuesto` INT, IN `_idusuario` INT)   BEGIN
	UPDATE activos
		SET
			idpresupuesto 	= NULLIF(_idpresupuesto,""),
            idusuario 		= _idusuario,
            update_at 		= CURDATE()
		WHERE idactivo = _idactivo;
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_password` (IN `_idusuario` INT, IN `_contrasenia` VARCHAR(255))   BEGIN
    UPDATE usuarios
        SET 
            contrasenia = _contrasenia
        WHERE
            idusuario = _idusuario;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_person` (IN `_idpersona` INT, IN `_nombres` VARCHAR(40), IN `_apellidos` VARCHAR(40), IN `_documento_tipo` VARCHAR(20), IN `_documento_nro` VARCHAR(12), IN `_estado_civil` VARCHAR(10), IN `_iddistrito` INT, IN `_direccion` VARCHAR(60), IN `_idusuario` INT)   BEGIN 
	UPDATE personas
		SET
			nombres 	= _nombres,
            apellidos	= _apellidos,
            documento_tipo 	= _documento_tipo,
            documento_nro 	= _documento_nro,
            estado_civil	= _estado_civil,
            iddistrito		= _iddistrito,
            direccion 		= _direccion,
            idusuario		= _idusuario,
            update_at		= CURDATE()
		WHERE idpersona = _idpersona;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_projects` (IN `_idproyecto` INT, IN `_idsede` INT, IN `_imagen` VARCHAR(100), IN `_codigo` VARCHAR(20), IN `_denominacion` VARCHAR(30), IN `_latitud` VARCHAR(20), IN `_longitud` VARCHAR(20), IN `_iddistrito` INT, IN `_direccion` VARCHAR(70), IN `_idusuario` INT)   BEGIN
	UPDATE proyectos
		SET
            idsede			= _idsede,
            imagen 			= NULLIF(_imagen,""),
            codigo 			= _codigo,
            denominacion 	= _denominacion,
            latitud 		= NULLIF(_latitud,""),
            longitud		= NULLIF(_longitud,""),
            iddistrito		= _iddistrito,
            direccion		= _direccion,
            idusuario		= _idusuario,
            update_at		= CURDATE()
		WHERE 
			idproyecto = _idproyecto;
	SELECT ROW_COUNT() AS filasAfect; -- FILAS AFECTADAS
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_quotas_allNoPay` (IN `_idcontrato` INT, IN `_idusuario` INT)   BEGIN
    UPDATE cuotas
        SET
            inactive_at = CURDATE(),
            idusuario = _idusuario
        WHERE inactive_at IS NULL
        AND estado != "CANCELADO"
        AND idcontrato = _idcontrato;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_refund` (IN `_iddevolucion` INT, IN `_n_expediente` VARCHAR(10), IN `_idseparacion` INT, IN `_idcontrato` INT, IN `_tipo_devolucion` VARCHAR(20), IN `_detalle` VARCHAR(200), IN `_porcentaje_penalidad` TINYINT, IN `_monto_devolucion` DECIMAL(8,2), IN `_imagen` VARCHAR(100), IN `_idusuario` INT)   BEGIN
    UPDATE devoluciones
        SET
            n_expediente   = _n_expediente,
            idseparacion   = NULLIF(_idseparacion,'0'),
            idcontrato    = NULLIF(_idcontrato,'0'),
            tipo_devolucion = _tipo_devolucion,
            detalle        = _detalle,
            porcentaje_penalidad = _porcentaje_penalidad,
            monto_devolucion = _monto_devolucion,
            imagen         = _imagen,
            update_at      = CURDATE(),
            idusuario      = _idusuario
        WHERE
            iddevolucion = _iddevolucion;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_represents` (IN `_idrepresentante` INT, IN `_idpersona_juridica` INT, IN `_representante_legal` VARCHAR(100), IN `_documento_tipo` VARCHAR(20), IN `_documento_nro` VARCHAR(12), IN `_cargo` VARCHAR(30), IN `_partida_elect` VARCHAR(100), IN `_estado` VARCHAR(20))   BEGIN
	UPDATE	rep_legales_clientes 
		SET
			idpersona_juridica 		= _idpersona_juridica,
            representante_legal 	= _representante_legal,
            documento_tipo			= _documento_tipo,
            documento_nro 			= _documento_nro,
            cargo					= _cargo,
            partida_elect 			= _partida_elect,
            estado 					= _estado, 	
            update_at				= CURDATE()
        WHERE idrepresentante = _idrepresentante;
	SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_separation` (IN `_idseparacion` INT, IN `_n_expediente` VARCHAR(10), IN `_idactivo` INT, IN `_idcliente` INT, IN `_idconyugue` INT, IN `_separacion_monto` DECIMAL(8,2), IN `_moneda_venta` VARCHAR(10), IN `_tipo_cambio` DECIMAL(5,4), IN `_imagen` VARCHAR(200), IN `_idusuario` INT)   BEGIN
    UPDATE separaciones 
        SET
            n_expediente   = _n_expediente,
            idactivo       = _idactivo,
            idcliente      = _idcliente,
            idconyugue     = NULLIF(_idconyugue,''),
            separacion_monto = _separacion_monto,
            moneda_venta     = _moneda_venta,
            tipo_cambio     = _tipo_cambio,
            imagen         = _imagen,
            idusuario      = _idusuario,
            update_at      = CURDATE()
        WHERE idseparacion = _idseparacion;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_statusQuota_automaticly` (IN `_idcuota` INT, IN `_estado` VARCHAR(20))   BEGIN
    UPDATE cuotas
        SET
            estado = _estado
        WHERE
        idcuota = _idcuota;
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_user_login` (IN `_correo` VARCHAR(60))   BEGIN
    SELECT
        usu.idusuario,
        usu.imagen,
        usu.correo,
        usu.contrasenia,
        pr.apellidos,
        pr.nombres,
        pr.documento_tipo,
        pr.documento_nro,
        rl.idrol,
        rl.rol,
        sd.direccion
        FROM usuarios usu
        INNER JOIN personas pr ON pr.idpersona = usu.idpersona
        INNER JOIN roles rl ON rl.idrol = usu.idrol
        INNER JOIN sedes sd ON sd.idsede = usu.idsede
        WHERE usu.inactive_at IS NULL
        AND usu.correo = _correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sup_list_refunds_ById` (IN `_iddevolucion` INT)   BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE iddevolucion = _iddevolucion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sup_list_refunds_n_expedientes` (IN `_tipo_devolucion` VARCHAR(20), IN `_fechaInicio` DATE, IN `_fechaFin` DATE, IN `_n_expediente` VARCHAR(10))   BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE tipo_devolucion = _tipo_devolucion
            AND create_at BETWEEN _fechaInicio AND _fechaFin
            AND inactive_at IS NULL
            AND n_expediente_dev LIKE CONCAT(_n_expediente,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sup_list_refunds_tRefund` (IN `_tipo_devolucion` VARCHAR(20), IN `_fechaInicio` DATE, IN `_fechaFin` DATE)   BEGIN
    SELECT * 
        FROM vws_list_refunds
        WHERE tipo_devolucion = _tipo_devolucion
            AND create_at BETWEEN _fechaInicio AND _fechaFin
            AND inactive_at IS NULL;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `idactivo` int(11) NOT NULL,
  `idproyecto` int(11) NOT NULL,
  `tipo_activo` varchar(10) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'SIN VENDER',
  `sublote` tinyint(4) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `moneda_venta` varchar(10) NOT NULL,
  `area_terreno` decimal(6,2) NOT NULL,
  `area_construccion` decimal(6,2) DEFAULT NULL,
  `area_techada` decimal(6,2) DEFAULT NULL,
  `zcomunes_porcent` tinyint(4) DEFAULT NULL,
  `partida_elect` varchar(100) NOT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `perimetro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"clave" :[], "valor":[]}' CHECK (json_valid(`perimetro`)),
  `det_casa` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"clave" :[], "valor":[]}' CHECK (json_valid(`det_casa`)),
  `idpresupuesto` int(11) DEFAULT NULL,
  `propietario_lote` varchar(70) NOT NULL,
  `precio_lote` decimal(8,2) DEFAULT NULL,
  `precio_construccion` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `activos`
--
DELIMITER $$
CREATE TRIGGER `trgr_set_metrics` AFTER INSERT ON `activos` FOR EACH ROW BEGIN
	CASE NEW.estado 
		WHEN "VENDIDO" THEN
			UPDATE metricas
				SET
					l_vendidos = l_vendidos + 1, 
                    update_at = NOW()
                WHERE idproyecto = NEW.idproyecto;
        WHEN "SIN VENDER" THEN
			UPDATE metricas
				SET
					l_noVendidos = l_noVendidos + 1,
                    update_at = NOW()
                WHERE idproyecto = NEW.idproyecto;
        WHEN "SEPARADO" THEN
			UPDATE metricas
				SET
					l_separados = l_separados + 1,
                    update_at = NOW()
                WHERE idproyecto = NEW.idproyecto;
	END CASE;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trgr_setmetrics_update` AFTER UPDATE ON `activos` FOR EACH ROW BEGIN
	
    DECLARE proyecto_id INT;
    SET proyecto_id = (
		SELECT idproyecto FROM activos
        WHERE idactivo = OLD.idactivo
    );
	-- SI EL ESTADO ANTIGUO ES DISTINTO AL NUEVO ESTADO
	IF OLD.estado != NEW.estado THEN
    
		-- AL ESTADO ANTERIOR SE LE RESTA 1
		CASE OLD.estado 
			WHEN "VENDIDO" THEN
				UPDATE metricas
					SET 
						l_vendidos = l_vendidos - 1,
                        update_at = NOW()
					WHERE idproyecto = proyecto_id;
            WHEN "SIN VENDER" THEN
            UPDATE metricas
					SET 
						l_noVendidos = l_noVendidos - 1,
                        update_at = NOW()
					WHERE idproyecto = proyecto_id;
            WHEN "SEPARADO" THEN
            UPDATE metricas
					SET 
						l_separados = l_separados - 1,
                        update_at = NOW()
					WHERE idproyecto = proyecto_id;
		END CASE;
        -- AL NUEVO ESTADO SE LE AUMENTA UNO
		CASE NEW.estado 
			WHEN "VENDIDO" THEN
				UPDATE metricas
					SET 
						l_vendidos = l_vendidos + 1,
                        update_at = NOW()
					WHERE idproyecto = proyecto_id;
            WHEN "SIN VENDER" THEN
            UPDATE metricas
					SET 
						l_noVendidos = l_noVendidos + 1,
                        update_at = NOW()
					WHERE idproyecto = proyecto_id;
            WHEN "SEPARADO" THEN
            UPDATE metricas
					SET 
						l_separados = l_separados + 1,
                        update_at = NOW()
					WHERE idproyecto = proyecto_id;
		END CASE;
    END IF;
	IF NEW.inactive_at IS NOT NULL THEN
		UPDATE metricas
			SET l_noVendidos = l_noVendidos -1,	
				update_at = NOW()
		WHERE idproyecto = proyecto_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actualizaciones`
--

CREATE TABLE `actualizaciones` (
  `idactualizacion` int(11) NOT NULL,
  `objeto_cambio` varchar(200) NOT NULL,
  `motivo` varchar(45) NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_costos`
--

CREATE TABLE `categoria_costos` (
  `idcategoria_costo` int(11) NOT NULL,
  `categoria_costo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `tipo_persona` varchar(10) NOT NULL,
  `idpersona` int(11) DEFAULT NULL,
  `idpersona_juridica` int(11) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `idconfiguracion` int(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` varchar(200) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`idconfiguracion`, `clave`, `valor`, `create_at`, `update_at`) VALUES
(1, 'numero_defecto', '0', '2024-06-16 17:57:43', NULL),
(2, 'contrasenia_defecto', 'peru2024', '2024-06-16 17:58:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constructora`
--

CREATE TABLE `constructora` (
  `idconstructora` int(11) NOT NULL,
  `razon_social` varchar(60) NOT NULL,
  `ruc` char(11) NOT NULL,
  `partida_elect` varchar(60) NOT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `idcontrato` int(11) NOT NULL,
  `n_expediente` varchar(10) NOT NULL,
  `tipo_contrato` varchar(40) NOT NULL,
  `idseparacion` int(11) DEFAULT NULL,
  `idrepresentante_primario` int(11) NOT NULL,
  `idrepresentante_secundario` int(11) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idconyugue` int(11) DEFAULT NULL,
  `idactivo` int(11) DEFAULT NULL,
  `tipo_cambio` decimal(4,3) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'VIGENTE',
  `fecha_contrato` date NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `moneda_venta` varchar(10) NOT NULL,
  `inicial` decimal(8,2) NOT NULL,
  `det_contrato` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"clave" :[], "valor":[]}' CHECK (json_valid(`det_contrato`)),
  `archivo` varchar(100) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

--
-- Disparadores `contratos`
--
DELIMITER $$
CREATE TRIGGER `trgr_contracts_add` AFTER INSERT ON `contratos` FOR EACH ROW BEGIN
	DECLARE _idactivo INT;
	IF NEW.idseparacion IS NOT NULL THEN
    
		SET _idactivo = (
			SELECT idactivo FROM separaciones
            WHERE idseparacion = NEW.idseparacion
        );
        UPDATE activos
			SET
				estado = "VENDIDO",
				existe_contrato = 1,
                update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE 
				idactivo = _idactivo;
        UPDATE separaciones
			SET
				existe_contrato = 1,
				update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE
				idseparacion = NEW.idseparacion;
	ELSE
		UPDATE activos
			SET
				estado = "VENDIDO",
                update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE 
				idactivo = NEW.idactivo;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trgr_contracts_update` AFTER UPDATE ON `contratos` FOR EACH ROW BEGIN
	DECLARE _oldIdactivo INT;
	DECLARE _newIdactivo INT;
	-- SI EL CAMPO INACTIVO ESTÁ VACÍO
	IF NEW.inactive_at IS NULL THEN

		IF NEW.idseparacion IS NOT NULL AND NEW.idseparacion != OLD.idseparacion THEN

			SET _oldIdactivo = (
				SELECT idactivo FROM separaciones
				WHERE idseparacion = OLD.idseparacion
			);
			SET _newIdactivo = (
				SELECT idactivo FROM separaciones
				WHERE idseparacion = NEW.idseparacion
			);
			UPDATE activos
				SET
					estado = "VENDIDO",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = _newIdactivo;
			UPDATE activos
				SET
					estado = "SIN VENDER",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = _oldIdactivo;
			UPDATE separaciones
				SET
					update_at = CURDATE(),
					existe_contrato = 1,
					idusuario = NEW.idusuario
				WHERE
					idseparacion = NEW.idseparacion;
			UPDATE separaciones
				SET
					update_at = CURDATE(),
					existe_contrato = 0,
					idusuario = NEW.idusuario
				WHERE
					idseparacion = OLD.idseparacion;
		END IF;
		IF NEW.idactivo IS NOT NULL AND NEW.idactivo != OLD.idactivo THEN

			UPDATE activos
				SET
					estado = "VENDIDO",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = NEW.idactivo;
			UPDATE activos
				SET
					estado = "SIN VENDER",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = OLD.idactivo;
		END IF;
	-- SI EL CAMPO INACTIVO NO ESTÁ VACÍO
	ELSE

		IF NEW.idseparacion IS NOT NULL THEN

			SET _newIdactivo = (
				SELECT idactivo FROM separaciones
				WHERE idseparacion = NEW.idseparacion
			);
			UPDATE activos
				SET
					estado = "SIN VENDER",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = _newIdactivo;
			UPDATE separaciones
				SET
					update_at = CURDATE(),
					existe_contrato = 0,
					idusuario = NEW.idusuario
				WHERE
					idseparacion = NEW.idseparacion;
		END IF;
		IF NEW.idactivo IS NOT NULL THEN
			
			UPDATE activos
				SET
					estado = "SIN VENDER",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = NEW.idactivo;
		END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas`
--

CREATE TABLE `cuotas` (
  `idcuota` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  `monto_cuota` decimal(8,2) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'POR CANCELAR',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamento` int(11) NOT NULL,
  `departamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_contratos`
--

CREATE TABLE `detalles_contratos` (
  `iddetalle_contrato` int(11) NOT NULL,
  `idrepresentante` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_costos`
--

CREATE TABLE `detalle_costos` (
  `iddetalle_costo` int(11) NOT NULL,
  `idpresupuesto` int(11) NOT NULL,
  `idsubcategoria_costo` int(11) NOT NULL,
  `idmaterial` int(11) DEFAULT NULL,
  `detalle` varchar(100) NOT NULL,
  `cantidad` tinyint(4) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cuotas`
--

CREATE TABLE `detalle_cuotas` (
  `iddetalle_cuota` int(11) NOT NULL,
  `idcuota` int(11) NOT NULL,
  `monto_pago` decimal(8,2) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `detalles` varchar(100) DEFAULT NULL,
  `tipo_pago` varchar(20) DEFAULT NULL,
  `entidad_bancaria` varchar(20) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `iddevolucion` int(11) NOT NULL,
  `n_expediente` varchar(10) NOT NULL,
  `tipo_devolucion` varchar(20) NOT NULL,
  `idseparacion` int(11) DEFAULT NULL,
  `idcontrato` int(11) DEFAULT NULL,
  `detalle` varchar(200) NOT NULL,
  `porcentaje_penalidad` tinyint(4) NOT NULL,
  `monto_devolucion` decimal(8,2) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

--
-- Disparadores `devoluciones`
--
DELIMITER $$
CREATE TRIGGER `trgr_asset_status_refund` AFTER INSERT ON `devoluciones` FOR EACH ROW BEGIN
	DECLARE _idactivo INT;
	DECLARE _idseparacion_contrato INT;
	-- SI EL ID SEPARACIÓN NO ESTÁ VACÍO
	IF NEW.idseparacion IS NOT NULL THEN
		SET _idactivo = (
			SELECT idactivo FROM separaciones
			WHERE idseparacion = NEW.idseparacion
		);
		UPDATE activos
			SET
				estado = "SIN VENDER",
				update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE
				idactivo = _idactivo;
		UPDATE separaciones
			SET
				inactive_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE
				idseparacion = NEW.idseparacion;
	-- SI EL ID CONTRATO NO ESTÁ VACÍO
	ELSEIF NEW.idcontrato IS NOT NULL THEN


		SET _idseparacion_contrato = (
			SELECT idseparacion FROM contratos
			WHERE idcontrato = NEW.idcontrato
		);
		-- SI EL IDSEPARACIÒN DEL CONTRATO NO ESTÁ VACÍO
		IF _idseparacion_contrato IS NOT NULL THEN

			SET _idactivo = (
				SELECT idactivo FROM separaciones
				WHERE idseparacion = _idseparacion_contrato
			);
			UPDATE activos
				SET
					estado = "SIN VENDER",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE 
					idactivo = _idactivo;
		ELSE

			SET _idactivo = (
				SELECT idactivo FROM contratos
				WHERE idcontrato = NEW.idcontrato
			);
			UPDATE activos
				SET
					estado = "SIN VENDER",
					update_at = CURDATE(),
					idusuario = NEW.idusuario
				WHERE
					idactivo = _idactivo;
		END IF;
		-- ACTUALIZA EL CONTRATO
		UPDATE contratos
			SET
				estado = "INACTIVO",
				inactive_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE
				idcontrato = NEW.idcontrato;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trgr_new_asset_status_refund` AFTER UPDATE ON `devoluciones` FOR EACH ROW BEGIN

	IF NEW.idseparacion != OLD.idseparacion THEN
		UPDATE separaciones
			SET
				inactive_at = CURDATE(),
				idusuario = NEW.idusuario
		WHERE
			idseparacion = NEW.idseparacion;
		UPDATE separaciones
			SET
				inactive_at = NULL,
				idusuario = NEW.idusuario
		WHERE
			idseparacion = OLD.idseparacion;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `iddistrito` int(11) NOT NULL,
  `idprovincia` int(11) NOT NULL,
  `distrito` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `idmaterial` int(11) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `material` varchar(45) NOT NULL,
  `idunidad_medida` int(11) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metricas`
--

CREATE TABLE `metricas` (
  `idmetrica` int(11) NOT NULL,
  `idproyecto` int(11) NOT NULL,
  `l_vendidos` int(11) NOT NULL DEFAULT 0,
  `l_noVendidos` int(11) NOT NULL DEFAULT 0,
  `l_separados` int(11) NOT NULL DEFAULT 0,
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `modulo` varchar(60) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `documento_tipo` varchar(30) NOT NULL,
  `documento_nro` varchar(12) NOT NULL,
  `estado_civil` varchar(10) NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `nacionalidad` varchar(20) NOT NULL DEFAULT 'PERUANA',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_juridicas`
--

CREATE TABLE `personas_juridicas` (
  `idpersona_juridica` int(11) NOT NULL,
  `razon_social` varchar(60) NOT NULL,
  `documento_tipo` varchar(20) NOT NULL,
  `documento_nro` varchar(12) NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

CREATE TABLE `presupuestos` (
  `idpresupuesto` int(11) NOT NULL,
  `codigo` char(8) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `area_construccion` decimal(6,2) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `provincia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `idproyecto` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `referencia` varchar(70) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `proyectos`
--
DELIMITER $$
CREATE TRIGGER `trgr_add_project` AFTER INSERT ON `proyectos` FOR EACH ROW BEGIN
	INSERT INTO metricas(idproyecto) VALUES(NEW.idproyecto);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `idrepresentante` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `cargo` varchar(60) NOT NULL,
  `partida_elect` varchar(60) NOT NULL,
  `idsede` int(11) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rep_legales_clientes`
--

CREATE TABLE `rep_legales_clientes` (
  `idrepresentante` int(11) NOT NULL,
  `idpersona_juridica` int(11) NOT NULL,
  `representante_legal` varchar(100) NOT NULL,
  `documento_tipo` varchar(20) NOT NULL,
  `documento_nro` varchar(12) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `partida_elect` varchar(100) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'DESHABILITADO',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `idsede` int(11) NOT NULL,
  `idconstructora` int(11) NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `separaciones`
--

CREATE TABLE `separaciones` (
  `idseparacion` int(11) NOT NULL,
  `n_expediente` varchar(10) NOT NULL,
  `idactivo` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idconyugue` int(11) DEFAULT NULL,
  `tipo_cambio` decimal(5,4) NOT NULL,
  `moneda_venta` varchar(10) NOT NULL,
  `separacion_monto` decimal(8,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `existe_contrato` bit(1) NOT NULL DEFAULT b'0',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

--
-- Disparadores `separaciones`
--
DELIMITER $$
CREATE TRIGGER `trgr_asset_status_separation` AFTER UPDATE ON `separaciones` FOR EACH ROW BEGIN
	
	IF NEW.idactivo != OLD.idactivo THEN

		UPDATE activos
			SET 
				estado = "SEPARADO",
				update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE 
				idactivo = NEW.idactivo;
		UPDATE activos
			SET 
				estado = "SIN VENDER",
				update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE 
				idactivo = OLD.idactivo;
	END IF;
    IF NEW.inactive_at IS NOT NULL THEN
		UPDATE activos
			SET
				estado = "SIN VENDER",
				update_at = NOW(),
				idusuario = NEW.idusuario
			WHERE 
				idactivo = NEW.idactivo;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trgr_asset_status_separation_insert` AFTER INSERT ON `separaciones` FOR EACH ROW BEGIN
	UPDATE activos
		SET
			estado = "SEPARADO",
            update_at = CURDATE(),
			idusuario = NEW.idusuario
		WHERE 
			idactivo = NEW.idactivo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria_costos`
--

CREATE TABLE `subcategoria_costos` (
  `idsubcategoria_costo` int(11) NOT NULL,
  `idcategoria_costo` int(11) NOT NULL,
  `subcategoria_costo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `idunidad_medida` int(11) NOT NULL,
  `unidad_medida` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `idpersona` int(11) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `contrasenia` varchar(60) NOT NULL,
  `codigo` char(9) DEFAULT NULL,
  `idrol` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_clientes_legal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_clientes_legal` (
`idcliente` int(11)
,`tipo_persona` varchar(10)
,`documento_tipo` varchar(20)
,`documento_nro` varchar(12)
,`cliente` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_clients_natural`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_clients_natural` (
`idcliente` int(11)
,`tipo_persona` varchar(10)
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`cliente` varchar(82)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_assets_short`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_assets_short` (
`idactivo` int(11)
,`idproyecto` int(11)
,`propietario_lote` varchar(70)
,`estado` varchar(10)
,`sublote` tinyint(4)
,`direccion` varchar(70)
,`distrito` varchar(45)
,`provincia` varchar(45)
,`departamento` varchar(45)
,`usuario` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_companies`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_companies` (
`idconstructora` int(11)
,`ruc` char(11)
,`razon_social` varchar(60)
,`partida_elect` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_projects`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_projects` (
`idproyecto` int(11)
,`imagen` varchar(100)
,`idsede` int(11)
,`sede` varchar(70)
,`codigo` varchar(20)
,`denominacion` varchar(30)
,`latitud` varchar(20)
,`longitud` varchar(20)
,`iddistrito` int(11)
,`distrito` varchar(45)
,`idprovincia` int(11)
,`provincia` varchar(45)
,`iddepartamento` int(11)
,`departamento` varchar(45)
,`direccion` varchar(70)
,`l_vendidos` int(11)
,`l_noVendidos` int(11)
,`l_separados` int(11)
,`l_total` bigint(13)
,`usuario` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_quotas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_quotas` (
`idcuota` int(11)
,`idcontrato` int(11)
,`n_expediente` varchar(10)
,`monto_cuota` decimal(8,2)
,`cancelado` decimal(30,2)
,`deuda` decimal(31,2)
,`fecha_vencimiento` date
,`fecha_pago` date
,`estado` varchar(20)
,`usuario` varchar(40)
,`inactive_at` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_refunds`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_refunds` (
`iddevolucion` int(11)
,`tipo_devolucion` varchar(20)
,`n_expediente_dev` varchar(10)
,`idseparacion` int(11)
,`idcontrato` int(11)
,`n_expediente_cont` varchar(10)
,`n_expediente_sep` varchar(10)
,`detalle` varchar(200)
,`monto_devolucion` decimal(8,2)
,`porcentaje_penalidad` tinyint(4)
,`separacion_monto` decimal(8,2)
,`sublote` tinyint(4)
,`idsede` int(11)
,`denominacion` varchar(30)
,`tipo_persona` varchar(10)
,`cliente` varchar(82)
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`imagen` varchar(100)
,`create_at` date
,`inactive_at` date
,`nombres` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_separations_tpersona_juridica`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_separations_tpersona_juridica` (
`idseparacion` int(11)
,`n_expediente` varchar(10)
,`idactivo` int(11)
,`sublote` tinyint(4)
,`denominacion` varchar(30)
,`cliente` varchar(60)
,`tipo_persona` varchar(10)
,`inactive_at_client` date
,`documento_tipo` varchar(20)
,`documento_nro` varchar(12)
,`separacion_monto` decimal(8,2)
,`create_at` date
,`existe_contrato` bit(1)
,`inactive_at_sep` date
,`usuario` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_separations_tpersona_juridica_full`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_separations_tpersona_juridica_full` (
`idseparacion` int(11)
,`n_expediente` varchar(10)
,`idproyecto` int(11)
,`idsede` int(11)
,`idactivo` int(11)
,`sublote` tinyint(4)
,`precio_venta` decimal(8,2)
,`denominacion` varchar(30)
,`distrito` varchar(45)
,`iddistrito` int(11)
,`provincia` varchar(45)
,`departamento` varchar(45)
,`tipo_persona` varchar(10)
,`idcliente` int(11)
,`cliente` varchar(60)
,`documento_tipo` varchar(20)
,`documento_nro` varchar(12)
,`moneda_venta` varchar(10)
,`tipo_cambio` decimal(5,4)
,`separacion_monto` decimal(8,2)
,`create_at` date
,`inactive_at` date
,`imagen` varchar(100)
,`existe_contrato` bit(1)
,`usuario` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_separations_tpersona_natural`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_separations_tpersona_natural` (
`idseparacion` int(11)
,`n_expediente` varchar(10)
,`idactivo` int(11)
,`sublote` tinyint(4)
,`denominacion` varchar(30)
,`cliente` varchar(82)
,`tipo_persona` varchar(10)
,`inactive_at_client` date
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`separacion_monto` decimal(8,2)
,`existe_contrato` bit(1)
,`inactive_at_sep` date
,`usuario` varchar(40)
,`create_at` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_list_separations_tpersona_natural_full`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_separations_tpersona_natural_full` (
`idseparacion` int(11)
,`n_expediente` varchar(10)
,`idsede` int(11)
,`idproyecto` int(11)
,`idactivo` int(11)
,`sublote` tinyint(4)
,`precio_venta` decimal(8,2)
,`denominacion` varchar(30)
,`distrito` varchar(45)
,`iddistrito` int(11)
,`provincia` varchar(45)
,`departamento` varchar(45)
,`tipo_persona` varchar(10)
,`idcliente` int(11)
,`cliente` varchar(82)
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`idconyugue` int(11)
,`conyugue` varchar(82)
,`conyPers_documento_tipo` varchar(30)
,`conyPers_documento_nro` varchar(12)
,`tipo_cambio` decimal(5,4)
,`moneda_venta` varchar(10)
,`separacion_monto` decimal(8,2)
,`create_at` date
,`inactive_at` date
,`imagen` varchar(100)
,`existe_contrato` bit(1)
,`usuario` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vws_ubigeo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_ubigeo` (
`iddistrito` int(11)
,`distrito` varchar(45)
,`provincia` varchar(45)
,`departamento` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_clientes_legal`
--
DROP TABLE IF EXISTS `vws_clientes_legal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_clientes_legal`  AS SELECT `cli`.`idcliente` AS `idcliente`, `cli`.`tipo_persona` AS `tipo_persona`, `persj`.`documento_tipo` AS `documento_tipo`, `persj`.`documento_nro` AS `documento_nro`, `persj`.`razon_social` AS `cliente` FROM ((`clientes` `cli` join `personas_juridicas` `persj` on(`persj`.`idpersona_juridica` = `cli`.`idcliente`)) join `rep_legales_clientes` `rep` on(`rep`.`idpersona_juridica` = `persj`.`idpersona_juridica`)) WHERE `cli`.`inactive_at` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_clients_natural`
--
DROP TABLE IF EXISTS `vws_clients_natural`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_clients_natural`  AS SELECT `cli`.`idcliente` AS `idcliente`, `cli`.`tipo_persona` AS `tipo_persona`, `pers`.`documento_tipo` AS `documento_tipo`, `pers`.`documento_nro` AS `documento_nro`, concat(`pers`.`apellidos`,', ',`pers`.`nombres`) AS `cliente` FROM (`clientes` `cli` join `personas` `pers` on(`pers`.`idpersona` = `cli`.`idpersona`)) WHERE `cli`.`inactive_at` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_assets_short`
--
DROP TABLE IF EXISTS `vws_list_assets_short`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_assets_short`  AS SELECT `act`.`idactivo` AS `idactivo`, `proy`.`idproyecto` AS `idproyecto`, `act`.`propietario_lote` AS `propietario_lote`, `act`.`estado` AS `estado`, `act`.`sublote` AS `sublote`, `act`.`direccion` AS `direccion`, `dist`.`distrito` AS `distrito`, `prov`.`provincia` AS `provincia`, `dept`.`departamento` AS `departamento`, `pers`.`nombres` AS `usuario` FROM ((((((`activos` `act` join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `distritos` `dist` on(`dist`.`iddistrito` = `proy`.`iddistrito`)) join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) join `usuarios` `usu` on(`usu`.`idusuario` = `act`.`idusuario`)) join `personas` `pers` on(`pers`.`idpersona` = `usu`.`idpersona` and `act`.`inactive_at` is null)) ORDER BY `act`.`sublote` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_companies`
--
DROP TABLE IF EXISTS `vws_list_companies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_companies`  AS SELECT `constructora`.`idconstructora` AS `idconstructora`, `constructora`.`ruc` AS `ruc`, `constructora`.`razon_social` AS `razon_social`, `constructora`.`partida_elect` AS `partida_elect` FROM `constructora` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_projects`
--
DROP TABLE IF EXISTS `vws_list_projects`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_projects`  AS SELECT `proy`.`idproyecto` AS `idproyecto`, `proy`.`imagen` AS `imagen`, `proy`.`idsede` AS `idsede`, `sed`.`direccion` AS `sede`, `proy`.`codigo` AS `codigo`, `proy`.`denominacion` AS `denominacion`, `proy`.`latitud` AS `latitud`, `proy`.`longitud` AS `longitud`, `dist`.`iddistrito` AS `iddistrito`, `dist`.`distrito` AS `distrito`, `prov`.`idprovincia` AS `idprovincia`, `prov`.`provincia` AS `provincia`, `dept`.`iddepartamento` AS `iddepartamento`, `dept`.`departamento` AS `departamento`, `proy`.`direccion` AS `direccion`, `met`.`l_vendidos` AS `l_vendidos`, `met`.`l_noVendidos` AS `l_noVendidos`, `met`.`l_separados` AS `l_separados`, `met`.`l_vendidos`+ `met`.`l_noVendidos` + `met`.`l_separados` AS `l_total`, `pers`.`nombres` AS `usuario` FROM (((((((`proyectos` `proy` join `distritos` `dist` on(`dist`.`iddistrito` = `proy`.`iddistrito`)) join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) join `sedes` `sed` on(`sed`.`idsede` = `proy`.`idsede`)) join `usuarios` `usu` on(`usu`.`idusuario` = `proy`.`idusuario`)) join `personas` `pers` on(`pers`.`idpersona` = `usu`.`idpersona`)) join `metricas` `met` on(`met`.`idproyecto` = `proy`.`idproyecto`)) WHERE `proy`.`inactive_at` is null ORDER BY `proy`.`codigo` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_quotas`
--
DROP TABLE IF EXISTS `vws_list_quotas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_quotas`  AS SELECT `qt`.`idcuota` AS `idcuota`, `ct`.`idcontrato` AS `idcontrato`, `ct`.`n_expediente` AS `n_expediente`, `qt`.`monto_cuota` AS `monto_cuota`, sum(`detc`.`monto_pago`) AS `cancelado`, `qt`.`monto_cuota`- coalesce(sum(`detc`.`monto_pago`),0.00) AS `deuda`, `qt`.`fecha_vencimiento` AS `fecha_vencimiento`, (select `detalle_cuotas`.`fecha_pago` from `detalle_cuotas` where `detalle_cuotas`.`idcuota` = `qt`.`idcuota` order by `detalle_cuotas`.`iddetalle_cuota` desc limit 1) AS `fecha_pago`, `qt`.`estado` AS `estado`, `pers`.`nombres` AS `usuario`, `qt`.`inactive_at` AS `inactive_at` FROM ((((`cuotas` `qt` left join `detalle_cuotas` `detc` on(`detc`.`idcuota` = `qt`.`idcuota`)) join `contratos` `ct` on(`ct`.`idcontrato` = `qt`.`idcontrato`)) join `usuarios` `usu` on(`usu`.`idusuario` = `qt`.`idusuario`)) join `personas` `pers` on(`pers`.`idpersona` = `usu`.`idpersona`)) WHERE `detc`.`inactive_at` is null GROUP BY `qt`.`idcuota` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_refunds`
--
DROP TABLE IF EXISTS `vws_list_refunds`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_refunds`  AS SELECT `dev`.`iddevolucion` AS `iddevolucion`, `dev`.`tipo_devolucion` AS `tipo_devolucion`, `dev`.`n_expediente` AS `n_expediente_dev`, `sep`.`idseparacion` AS `idseparacion`, `cnt`.`idcontrato` AS `idcontrato`, `cnt`.`n_expediente` AS `n_expediente_cont`, `sep`.`n_expediente` AS `n_expediente_sep`, `dev`.`detalle` AS `detalle`, `dev`.`monto_devolucion` AS `monto_devolucion`, `dev`.`porcentaje_penalidad` AS `porcentaje_penalidad`, `sep`.`separacion_monto` AS `separacion_monto`, `act`.`sublote` AS `sublote`, `proy`.`idsede` AS `idsede`, `proy`.`denominacion` AS `denominacion`, coalesce(`persj`.`tipo_persona`,`persn`.`tipo_persona`) AS `tipo_persona`, coalesce(`persj`.`cliente`,`persn`.`cliente`) AS `cliente`, coalesce(`persj`.`documento_tipo`,`persn`.`documento_tipo`) AS `documento_tipo`, coalesce(`persj`.`documento_nro`,`persn`.`documento_nro`) AS `documento_nro`, `dev`.`imagen` AS `imagen`, `dev`.`create_at` AS `create_at`, `dev`.`inactive_at` AS `inactive_at`, `usupers`.`nombres` AS `nombres` FROM ((((((((`devoluciones` `dev` left join `separaciones` `sep` on(`sep`.`idseparacion` = `dev`.`idseparacion`)) left join `vws_list_separations_tpersona_juridica` `persj` on(`persj`.`idseparacion` = `dev`.`idseparacion`)) left join `vws_list_separations_tpersona_natural` `persn` on(`persn`.`idseparacion` = `dev`.`idseparacion`)) join `usuarios` `usu` on(`usu`.`idusuario` = `dev`.`idusuario`)) join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) left join `contratos` `cnt` on(`cnt`.`idcontrato` = `dev`.`idcontrato`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ORDER BY `dev`.`iddevolucion` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_juridica`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_juridica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_juridica`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `proy`.`denominacion` AS `denominacion`, `persj`.`razon_social` AS `cliente`, `clien`.`tipo_persona` AS `tipo_persona`, `clien`.`inactive_at` AS `inactive_at_client`, `persj`.`documento_tipo` AS `documento_tipo`, `persj`.`documento_nro` AS `documento_nro`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`create_at` AS `create_at`, `sep`.`existe_contrato` AS `existe_contrato`, `sep`.`inactive_at` AS `inactive_at_sep`, `usupers`.`nombres` AS `usuario` FROM ((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas_juridicas` `persj` on(`persj`.`idpersona_juridica` = `clien`.`idpersona_juridica`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ORDER BY `sep`.`idseparacion` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_juridica_full`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_juridica_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_juridica_full`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `proy`.`idproyecto` AS `idproyecto`, `proy`.`idsede` AS `idsede`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `act`.`precio_venta` AS `precio_venta`, `proy`.`denominacion` AS `denominacion`, `dist`.`distrito` AS `distrito`, `sd`.`iddistrito` AS `iddistrito`, `prov`.`provincia` AS `provincia`, `dept`.`departamento` AS `departamento`, `clien`.`tipo_persona` AS `tipo_persona`, `sep`.`idcliente` AS `idcliente`, `persj`.`razon_social` AS `cliente`, `persj`.`documento_tipo` AS `documento_tipo`, `persj`.`documento_nro` AS `documento_nro`, `sep`.`moneda_venta` AS `moneda_venta`, `sep`.`tipo_cambio` AS `tipo_cambio`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`create_at` AS `create_at`, `sep`.`inactive_at` AS `inactive_at`, `sep`.`imagen` AS `imagen`, `sep`.`existe_contrato` AS `existe_contrato`, `usupers`.`nombres` AS `usuario` FROM ((((((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `sedes` `sd` on(`sd`.`idsede` = `proy`.`idsede`)) join `distritos` `dist` on(`dist`.`iddistrito` = `proy`.`iddistrito`)) join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas_juridicas` `persj` on(`persj`.`idpersona_juridica` = `clien`.`idpersona_juridica`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_natural`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_natural`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_natural`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `proy`.`denominacion` AS `denominacion`, concat(ucase(`pers`.`apellidos`),', ',lcase(`pers`.`nombres`)) AS `cliente`, `clien`.`tipo_persona` AS `tipo_persona`, `clien`.`inactive_at` AS `inactive_at_client`, `pers`.`documento_tipo` AS `documento_tipo`, `pers`.`documento_nro` AS `documento_nro`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`existe_contrato` AS `existe_contrato`, `sep`.`inactive_at` AS `inactive_at_sep`, `usupers`.`nombres` AS `usuario`, `sep`.`create_at` AS `create_at` FROM ((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas` `pers` on(`pers`.`idpersona` = `clien`.`idpersona`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ORDER BY `sep`.`idseparacion` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_natural_full`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_natural_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_natural_full`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `proy`.`idsede` AS `idsede`, `proy`.`idproyecto` AS `idproyecto`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `act`.`precio_venta` AS `precio_venta`, `proy`.`denominacion` AS `denominacion`, `dist`.`distrito` AS `distrito`, `sd`.`iddistrito` AS `iddistrito`, `prov`.`provincia` AS `provincia`, `dept`.`departamento` AS `departamento`, `clien`.`tipo_persona` AS `tipo_persona`, `sep`.`idcliente` AS `idcliente`, concat(ucase(`pers`.`apellidos`),', ',lcase(`pers`.`nombres`)) AS `cliente`, `pers`.`documento_tipo` AS `documento_tipo`, `pers`.`documento_nro` AS `documento_nro`, `sep`.`idconyugue` AS `idconyugue`, concat(ucase(`conypers`.`apellidos`),', ',lcase(`conypers`.`nombres`)) AS `conyugue`, `conypers`.`documento_tipo` AS `conyPers_documento_tipo`, `conypers`.`documento_nro` AS `conyPers_documento_nro`, `sep`.`tipo_cambio` AS `tipo_cambio`, `sep`.`moneda_venta` AS `moneda_venta`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`create_at` AS `create_at`, `sep`.`inactive_at` AS `inactive_at`, `sep`.`imagen` AS `imagen`, `sep`.`existe_contrato` AS `existe_contrato`, `usupers`.`nombres` AS `usuario` FROM ((((((((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `distritos` `dist` on(`dist`.`iddistrito` = `proy`.`iddistrito`)) join `sedes` `sd` on(`sd`.`idsede` = `proy`.`idsede`)) join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas` `pers` on(`pers`.`idpersona` = `clien`.`idpersona`)) left join `clientes` `cony` on(`cony`.`idcliente` = `sep`.`idconyugue`)) left join `personas` `conypers` on(`conypers`.`idpersona` = `cony`.`idpersona`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_ubigeo`
--
DROP TABLE IF EXISTS `vws_ubigeo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_ubigeo`  AS SELECT `dist`.`iddistrito` AS `iddistrito`, `dist`.`distrito` AS `distrito`, `prov`.`provincia` AS `provincia`, `dept`.`departamento` AS `departamento` FROM ((`distritos` `dist` join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) ORDER BY `dept`.`departamento` ASC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`idactivo`),
  ADD UNIQUE KEY `uk_sublote_activos` (`idproyecto`,`sublote`),
  ADD KEY `fk_idpresupuesto_activos` (`idpresupuesto`),
  ADD KEY `fk_idusuario_activos` (`idusuario`);

--
-- Indices de la tabla `actualizaciones`
--
ALTER TABLE `actualizaciones`
  ADD PRIMARY KEY (`idactualizacion`);

--
-- Indices de la tabla `categoria_costos`
--
ALTER TABLE `categoria_costos`
  ADD PRIMARY KEY (`idcategoria_costo`),
  ADD UNIQUE KEY `uk_categoria_costo_cat_cost` (`categoria_costo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `fk_idpersona_cli` (`idpersona`),
  ADD KEY `fk_idpersona_juridica_cli` (`idpersona_juridica`),
  ADD KEY `fk_idusuario_cli` (`idusuario`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`idconfiguracion`);

--
-- Indices de la tabla `constructora`
--
ALTER TABLE `constructora`
  ADD PRIMARY KEY (`idconstructora`),
  ADD UNIQUE KEY `uk_ruc_constructora` (`ruc`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`idcontrato`),
  ADD KEY `fk_idseparacion_cont` (`idseparacion`),
  ADD KEY `fk_idrepresentante_cont` (`idrepresentante_primario`),
  ADD KEY `fk_idrepresentante2_cont` (`idrepresentante_secundario`),
  ADD KEY `fk_idcliente_cont` (`idcliente`),
  ADD KEY `fk_idcliente2_cont` (`idconyugue`),
  ADD KEY `fk_idusuario_cont` (`idusuario`);

--
-- Indices de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD PRIMARY KEY (`idcuota`),
  ADD KEY `fk_idcontrato_cuotas` (`idcontrato`),
  ADD KEY `fk_idusuario_cuotas` (`idusuario`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamento`),
  ADD UNIQUE KEY `uk_departamento_deps` (`departamento`);

--
-- Indices de la tabla `detalles_contratos`
--
ALTER TABLE `detalles_contratos`
  ADD PRIMARY KEY (`iddetalle_contrato`),
  ADD KEY `fk_idrepresentante_dtc` (`idrepresentante`),
  ADD KEY `fk_idcontrato_dtc` (`idcontrato`);

--
-- Indices de la tabla `detalle_costos`
--
ALTER TABLE `detalle_costos`
  ADD PRIMARY KEY (`iddetalle_costo`),
  ADD KEY `fk_idpresupuesto_det_costo` (`idpresupuesto`),
  ADD KEY `fk_idsubcategoria_costo_det_costo` (`idsubcategoria_costo`),
  ADD KEY `fk_idmaterial_det_costo` (`idmaterial`),
  ADD KEY `fk_idusuario_det_costo` (`idusuario`);

--
-- Indices de la tabla `detalle_cuotas`
--
ALTER TABLE `detalle_cuotas`
  ADD PRIMARY KEY (`iddetalle_cuota`),
  ADD KEY `fk_idcuota_detalle_cuotas` (`idcuota`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`iddevolucion`),
  ADD KEY `fk_idseparacion_dev` (`idseparacion`),
  ADD KEY `fk_idcontrato_dev` (`idcontrato`),
  ADD KEY `fk_idusuario_dev` (`idusuario`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`iddistrito`),
  ADD KEY `fk_idprovincia_distr` (`idprovincia`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`idmarca`),
  ADD UNIQUE KEY `uk_marca_marca` (`marca`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`idmaterial`),
  ADD UNIQUE KEY `uk_material` (`material`),
  ADD KEY `fk_idmarca_materiales` (`idmarca`),
  ADD KEY `fk_unidad_medida_materiales` (`idunidad_medida`);

--
-- Indices de la tabla `metricas`
--
ALTER TABLE `metricas`
  ADD PRIMARY KEY (`idmetrica`),
  ADD KEY `fk_idproyecto_metr` (`idproyecto`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `fk_idrol_permis` (`idrol`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `uk_documento_nro_pers` (`documento_nro`),
  ADD KEY `fk_iddistrito_pers` (`iddistrito`);

--
-- Indices de la tabla `personas_juridicas`
--
ALTER TABLE `personas_juridicas`
  ADD PRIMARY KEY (`idpersona_juridica`),
  ADD UNIQUE KEY `uk_documento_nro_pj` (`documento_nro`),
  ADD KEY `fk_iddistrito_pj` (`iddistrito`);

--
-- Indices de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD PRIMARY KEY (`idpresupuesto`),
  ADD UNIQUE KEY `uk_codigo_presupuesto` (`codigo`),
  ADD UNIQUE KEY `uk_modelo_pres` (`modelo`),
  ADD KEY `fk_idusuario_pres` (`idusuario`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincia`),
  ADD KEY `fk_iddepartamento_provin` (`iddepartamento`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`idproyecto`),
  ADD UNIQUE KEY `uk_codigo_proyects` (`codigo`),
  ADD UNIQUE KEY `uk_denominacion_proyects` (`denominacion`),
  ADD KEY `fk_idsede_proyects` (`idsede`),
  ADD KEY `fk_iddistrito_proyects` (`iddistrito`),
  ADD KEY `fk_idusuario_proyects` (`idusuario`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`idrepresentante`),
  ADD UNIQUE KEY `uk_idpersona_rep` (`idpersona`),
  ADD KEY `fk_idsede_rep` (`idsede`);

--
-- Indices de la tabla `rep_legales_clientes`
--
ALTER TABLE `rep_legales_clientes`
  ADD PRIMARY KEY (`idrepresentante`),
  ADD UNIQUE KEY `uk_documento_nro_rep` (`documento_nro`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `uk_rol_roles` (`rol`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`idsede`),
  ADD KEY `fk_idconstructora_sed` (`idconstructora`),
  ADD KEY `fk_iddistrito_sed` (`iddistrito`);

--
-- Indices de la tabla `separaciones`
--
ALTER TABLE `separaciones`
  ADD PRIMARY KEY (`idseparacion`),
  ADD UNIQUE KEY `uk_n_expediente` (`n_expediente`),
  ADD KEY `fk_idactivo_sep` (`idactivo`),
  ADD KEY `fk_idcliente_sep` (`idcliente`),
  ADD KEY `fk_idconyugue_sep` (`idconyugue`),
  ADD KEY `fk_idusuario_sep` (`idusuario`);

--
-- Indices de la tabla `subcategoria_costos`
--
ALTER TABLE `subcategoria_costos`
  ADD PRIMARY KEY (`idsubcategoria_costo`),
  ADD UNIQUE KEY `fk_subactegoria_costo_subcat_costo` (`subcategoria_costo`),
  ADD KEY `fk_idcategoria_costo_subcat_costo` (`idcategoria_costo`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`idunidad_medida`),
  ADD UNIQUE KEY `uk_unidad_medida_u_media` (`unidad_medida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `uk_correo_us` (`correo`),
  ADD KEY `fk_idpersona` (`idpersona`),
  ADD KEY `fk_idrol_usu` (`idrol`),
  ADD KEY `fk_idsede_usu` (`idsede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `idactivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `actualizaciones`
--
ALTER TABLE `actualizaciones`
  MODIFY `idactualizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_costos`
--
ALTER TABLE `categoria_costos`
  MODIFY `idcategoria_costo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `idconfiguracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `constructora`
--
ALTER TABLE `constructora`
  MODIFY `idconstructora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  MODIFY `idcuota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_contratos`
--
ALTER TABLE `detalles_contratos`
  MODIFY `iddetalle_contrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_costos`
--
ALTER TABLE `detalle_costos`
  MODIFY `iddetalle_costo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_cuotas`
--
ALTER TABLE `detalle_cuotas`
  MODIFY `iddetalle_cuota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `iddevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `iddistrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `idmaterial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metricas`
--
ALTER TABLE `metricas`
  MODIFY `idmetrica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas_juridicas`
--
ALTER TABLE `personas_juridicas`
  MODIFY `idpersona_juridica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `idpresupuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rep_legales_clientes`
--
ALTER TABLE `rep_legales_clientes`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `idsede` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `separaciones`
--
ALTER TABLE `separaciones`
  MODIFY `idseparacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategoria_costos`
--
ALTER TABLE `subcategoria_costos`
  MODIFY `idsubcategoria_costo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `idunidad_medida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `fk_idpresupuesto_activos` FOREIGN KEY (`idpresupuesto`) REFERENCES `presupuestos` (`idpresupuesto`),
  ADD CONSTRAINT `fk_idproyecto_activos` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`idproyecto`),
  ADD CONSTRAINT `fk_idusuario_activos` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_idpersona_cli` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  ADD CONSTRAINT `fk_idpersona_juridica_cli` FOREIGN KEY (`idpersona_juridica`) REFERENCES `personas_juridicas` (`idpersona_juridica`),
  ADD CONSTRAINT `fk_idusuario_cli` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_idcliente2_cont` FOREIGN KEY (`idconyugue`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_idcliente_cont` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_idrepresentante2_cont` FOREIGN KEY (`idrepresentante_secundario`) REFERENCES `representantes` (`idrepresentante`),
  ADD CONSTRAINT `fk_idrepresentante_cont` FOREIGN KEY (`idrepresentante_primario`) REFERENCES `representantes` (`idrepresentante`),
  ADD CONSTRAINT `fk_idseparacion_cont` FOREIGN KEY (`idseparacion`) REFERENCES `separaciones` (`idseparacion`),
  ADD CONSTRAINT `fk_idusuario_cont` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD CONSTRAINT `fk_idcontrato_cuotas` FOREIGN KEY (`idcontrato`) REFERENCES `contratos` (`idcontrato`),
  ADD CONSTRAINT `fk_idusuario_cuotas` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `detalles_contratos`
--
ALTER TABLE `detalles_contratos`
  ADD CONSTRAINT `fk_idcontrato_dtc` FOREIGN KEY (`idcontrato`) REFERENCES `contratos` (`idcontrato`),
  ADD CONSTRAINT `fk_idrepresentante_dtc` FOREIGN KEY (`idrepresentante`) REFERENCES `rep_legales_clientes` (`idrepresentante`);

--
-- Filtros para la tabla `detalle_costos`
--
ALTER TABLE `detalle_costos`
  ADD CONSTRAINT `fk_idmaterial_det_costo` FOREIGN KEY (`idmaterial`) REFERENCES `materiales` (`idmaterial`),
  ADD CONSTRAINT `fk_idpresupuesto_det_costo` FOREIGN KEY (`idpresupuesto`) REFERENCES `presupuestos` (`idpresupuesto`),
  ADD CONSTRAINT `fk_idsubcategoria_costo_det_costo` FOREIGN KEY (`idsubcategoria_costo`) REFERENCES `subcategoria_costos` (`idsubcategoria_costo`),
  ADD CONSTRAINT `fk_idusuario_det_costo` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `detalle_cuotas`
--
ALTER TABLE `detalle_cuotas`
  ADD CONSTRAINT `fk_idcuota_detalle_cuotas` FOREIGN KEY (`idcuota`) REFERENCES `cuotas` (`idcuota`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `fk_idcontrato_dev` FOREIGN KEY (`idcontrato`) REFERENCES `contratos` (`idcontrato`),
  ADD CONSTRAINT `fk_idseparacion_dev` FOREIGN KEY (`idseparacion`) REFERENCES `separaciones` (`idseparacion`),
  ADD CONSTRAINT `fk_idusuario_dev` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `fk_idprovincia_distr` FOREIGN KEY (`idprovincia`) REFERENCES `provincias` (`idprovincia`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `fk_idmarca_materiales` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`),
  ADD CONSTRAINT `fk_unidad_medida_materiales` FOREIGN KEY (`idunidad_medida`) REFERENCES `unidades_medida` (`idunidad_medida`);

--
-- Filtros para la tabla `metricas`
--
ALTER TABLE `metricas`
  ADD CONSTRAINT `fk_idproyecto_metr` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`idproyecto`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_idrol_permis` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `fk_iddistrito_pers` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`);

--
-- Filtros para la tabla `personas_juridicas`
--
ALTER TABLE `personas_juridicas`
  ADD CONSTRAINT `fk_iddistrito_pj` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`);

--
-- Filtros para la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD CONSTRAINT `fk_idusuario_pres` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `fk_iddepartamento_provin` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_iddistrito_proyects` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`),
  ADD CONSTRAINT `fk_idsede_proyects` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`),
  ADD CONSTRAINT `fk_idusuario_proyects` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `fk_idpersona_rep` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  ADD CONSTRAINT `fk_idsede_rep` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`);

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `fk_idconstructora_sed` FOREIGN KEY (`idconstructora`) REFERENCES `constructora` (`idconstructora`),
  ADD CONSTRAINT `fk_iddistrito_sed` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`);

--
-- Filtros para la tabla `separaciones`
--
ALTER TABLE `separaciones`
  ADD CONSTRAINT `fk_idactivo_sep` FOREIGN KEY (`idactivo`) REFERENCES `activos` (`idactivo`),
  ADD CONSTRAINT `fk_idcliente_sep` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_idconyugue_sep` FOREIGN KEY (`idconyugue`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_idusuario_sep` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `subcategoria_costos`
--
ALTER TABLE `subcategoria_costos`
  ADD CONSTRAINT `fk_idcategoria_costo_subcat_costo` FOREIGN KEY (`idcategoria_costo`) REFERENCES `categoria_costos` (`idcategoria_costo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_idpersona` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  ADD CONSTRAINT `fk_idrol_usu` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`),
  ADD CONSTRAINT `fk_idsede_usu` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
