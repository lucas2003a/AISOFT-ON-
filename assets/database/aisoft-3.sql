-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2024 a las 12:51:47
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_budget` (IN `_codigo` CHAR(10), IN `_modelo` VARCHAR(30), IN `_area_construccion` DECIMAL(6,2), IN `_idusuario` INT)   BEGIN
	INSERT INTO presupuestos(modelo, idusuario, codigo, area_construccion)
					VALUES(_modelo, _idusuario, _codigo, _area_construccion);
                    
	SELECT @@last_insert_id AS idpresupuesto,
			codigo,
            modelo,
            area_construccion
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
				(_idsede, _imagen, _codigo, _denominacion, NULLIF(_latitud,""), NULLIF(_longitud, ""), _iddistrito, _direccion, _idusuario);
	SELECT ROW_COUNT() AS filasAfect; -- FILAS AFECTADAS
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_quota` (IN `_idcontrato` INT, IN `_monto_cuota` DECIMAL(8,2), IN `_fecha_vencimiento` DATE, IN `_idusuario` INT)   BEGIN
    INSERT INTO cuotas(idcontrato, monto_cuota, fecha_vencimiento, idusuario)
                VALUES(_idcontrato, _monto_cuota, _fecha_vencimiento, _idusuario);
    SELECT ROW_COUNT() AS filasAfect;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_refund` (IN `_n_expediente` VARCHAR(10), IN `_idseparacion` INT, IN `_idcontrato` INT, IN `_tipo_devolucion` VARCHAR(20), IN `_detalle` VARCHAR(200), IN `_porcentaje_penalidad` TINYINT, IN `_monto_devolucion` DECIMAL(8,2), IN `_tipo_cambio` DECIMAL(5,4), IN `_modalidad_pago` VARCHAR(20), IN `_entidad_bancaria` VARCHAR(30), IN `_nro_operacion` CHAR(10), IN `_imagen` VARCHAR(100), IN `_idusuario` INT)   BEGIN
    INSERT INTO devoluciones(
                    n_expediente,
                    idseparacion,
                    idcontrato,
                    tipo_devolucion,
                    detalle,
                    porcentaje_penalidad,
                    monto_devolucion,
                    tipo_cambio,
                    modalidad_pago,
                    entidad_bancaria,
                    nro_operacion,
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
                    _tipo_cambio,
                    _modalidad_pago,
                    NULLIF(_entidad_bancaria,''),
                    NULLIF(_nro_operacion,''),
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_add_separation` (IN `_n_expediente` VARCHAR(10), IN `_idactivo` INT, IN `_idcliente` INT, IN `_idconyugue` INT, IN `_tipo_cambio` DECIMAL(5,4), IN `_moneda_venta` VARCHAR(10), IN `_separacion_monto` DECIMAL(8,2), IN `_fecha_pago` DATE, IN `_imagen` VARCHAR(200), IN `_detalle` VARCHAR(200), IN `_modalidad_pago` VARCHAR(20), IN `_entidad_bancaria` VARCHAR(30), IN `_nro_operacion` CHAR(10), IN `_idusuario` INT)   BEGIN
    INSERT INTO separaciones (
            n_expediente,
            idactivo,
            idcliente,
            idconyugue,
            tipo_cambio,
            moneda_venta,
            separacion_monto,
            fecha_pago,
            imagen,
            detalle,
            modalidad_pago,
            entidad_bancaria,
            nro_operacion,
            idusuario
    ) 
        VALUES(
            _n_expediente,
            _idactivo,
            _idcliente, 
            NULLIF(_idconyugue,''),
            _tipo_cambio,
            _moneda_venta,
            _separacion_monto,
            _fecha_pago, 
            _imagen,
            _detalle,
            _modalidad_pago,
            NULLIF(_entidad_bancaria,''),
            NULLIF(_nro_operacion,''),
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

    DECLARE _existSede BIT;
    DECLARE _idprovincia INT;
    SET _existSede = (
        SELECT EXISTS(
            SELECT 1
            FROM sedes
            WHERE iddistrito = _iddistrito
            LIMIT 1
        )
    );
    SET _idprovincia = (
        SELECT idprovincia
        FROM distritos
        WHERE iddistrito = _iddistrito
    );
    IF _existSede = 1 THEN

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
    ELSE

        SELECT
            sed.idsede,
            emp.ruc,
            emp.razon_social,
            emp.partida_elect,
            sed.referencia,
            CONCAT(sed.direccion,' - ',dist.distrito) AS direccion,
            dist.distrito,
            prov.provincia,
            dept.departamento
            FROM sedes AS sed
            INNER JOIN constructora AS emp ON emp.idconstructora = sed.idconstructora
            INNER JOIN distritos AS dist ON dist.iddistrito = sed.iddistrito
            INNER JOIN provincias AS prov ON prov.idprovincia = dist.idprovincia
            INNER JOIN departamentos AS dept ON dept.iddepartamento = prov.iddepartamento
            WHERE prov.idprovincia = _idprovincia;
    END IF;
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
        AND pres.area_construccion = _area_construida
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_clients_contractID` (IN `_idcliente` INT)   BEGIN
    SELECT 
        cont.idcontrato,
        cont.n_expediente,
        cont.tipo_contrato
        FROM contratos cont
        INNER JOIN clientes clien ON clien.idcliente = cont.idcliente
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = clien.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = clien.idcliente
        WHERE cont.idcliente = _idcliente
        AND cont.estado = 'VIGENTE'
    UNION 
    SELECT  
        cont.idcontrato,
        cont.n_expediente,
        cont.tipo_contrato
        FROM contratos cont
        INNER JOIN separaciones sep ON sep.idseparacion = cont.idseparacion
        LEFT JOIN vws_clientes_legal cl ON cl.idcliente = sep.idcliente
        LEFT JOIN vws_clients_natural cn ON cn.idcliente = sep.idcliente
        WHERE sep.idcliente = _idcliente
        AND cont.estado = "VIGENTE";
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

    DECLARE _existKey BIT;

    SET _existKey = (
        SELECT EXISTS(
            SELECT 1 
            FROM configuraciones
            WHERE clave = _clave
            )
        );

    IF _existKey  = 1 THEN

        SELECT *
            FROM configuraciones
            WHERE clave = _clave;
    ELSE
        
        SELECT 0 AS valor;
    END IF;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_houses_noBudgets` ()   BEGIN
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
			AND act.inactive_at IS NULL
            AND act.tipo_activo = "CASA";

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
            act.idpresupuesto,
            act.tipo_activo 
            FROM activos act 
            INNER JOIN proyectos proy ON proy.idproyecto = act.idproyecto
            LEFT JOIN presupuestos pres ON pres.idpresupuesto = act.idpresupuesto
            WHERE act.inactive_at IS NULL
            AND (
                
			act.idpresupuesto = _idpresupuesto OR act.idpresupuesto IS NULL
            )
            AND act.tipo_activo = "CASA";
            
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
			AND act.inactive_at IS NULL
            AND act.estao = "CASA";
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
        SELECT 
        py.idproyecto,
        py.denominacion,
        py.iddistrito,
        py.idsede,
        _tipo_activo as tipo
        FROM proyectos py
        INNER JOIN activos ac ON ac.idproyecto = py.idproyecto
        WHERE py.inactive_at IS NULL
            AND ac.inactive_at IS NULL
            AND ac.tipo_activo = _tipo_activo
            AND ac.estado = "SIN VENDER"
            GROUP BY py.idproyecto
            ORDER BY py.denominacion ASC;
    
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
            detc.modalidad_pago,
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
        sep.idactivo = _idactivo
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
    sep.idactivo = _idactivo
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_search_budgets` (IN `_codigo` VARCHAR(10))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_budget` (IN `_idpresupuesto` INT, IN `_codigo` CHAR(10), IN `_modelo` VARCHAR(30), IN `_area_construccion` DECIMAL(6,2), IN `_idusuario` INT)   BEGIN
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
        modelo,
        area_construccion
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_det_quota` (IN `_idcuota` INT, IN `_fecha_pago` DATE, IN `_monto_pago` DECIMAL(8,2), IN `_detalles` VARCHAR(100), IN `_modalidad_pago` VARCHAR(20), IN `_entidad_bancaria` VARCHAR(20), IN `_nro_operacion` CHAR(10), IN `_imagen` VARCHAR(100), IN `_idusuario` INT)   BEGIN
    DECLARE _countInsert INT;
    DECLARE _countUpdate INT;
    DECLARE _monto_cuota DECIMAL(8,2);
    DECLARE _monto_pagado DECIMAL(8,2);

    INSERT INTO detalle_cuotas(
        idcuota,
        fecha_pago,
        monto_pago,
        detalles,
        modalidad_pago,
        entidad_bancaria,
        nro_operacion,
        imagen
    )
    VALUES (
        _idcuota,
        _fecha_pago,
        _monto_pago,
        _detalles,
        _modalidad_pago,
        NULLIF(_entidad_bancaria,''),
        NULLIF(_nro_operacion,''),
        _imagen
    );

    SET _countInsert =  (SELECT ROW_COUNT());

    SET _monto_cuota = (
        SELECT monto_cuota 
        FROM cuotas
        WHERE idcuota = _idcuota
    );

    SET _monto_pagado = (
        SELECT SUM(monto_pago) AS monto_pago
        FROM detalle_cuotas
        WHERE idcuota = _idcuota
    );

    UPDATE cuotas
        SET
        estado = CASE 
                    WHEN _monto_cuota = _monto_pagado THEN "CANCELADO"
                    ELSE "EN PROCESO"
                END,
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
            imagen 			= _imagen,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_refund` (IN `_iddevolucion` INT, IN `_n_expediente` VARCHAR(10), IN `_idseparacion` INT, IN `_idcontrato` INT, IN `_tipo_devolucion` VARCHAR(20), IN `_detalle` VARCHAR(200), IN `_porcentaje_penalidad` TINYINT, IN `_monto_devolucion` DECIMAL(8,2), IN `_tipo_cambio` DECIMAL(5,4), IN `_modalidad_pago` VARCHAR(20), IN `_entidad_bancaria` VARCHAR(30), IN `_nro_operacion` CHAR(10), IN `_imagen` VARCHAR(100), IN `_idusuario` INT)   BEGIN
    UPDATE devoluciones
        SET
            n_expediente    = _n_expediente,
            idseparacion    = NULLIF(_idseparacion,'0'),
            idcontrato      = NULLIF(_idcontrato,'0'),
            tipo_devolucion = _tipo_devolucion,
            detalle         = _detalle,
            porcentaje_penalidad    = _porcentaje_penalidad,
            monto_devolucion        = _monto_devolucion,
            tipo_cambio     = _tipo_cambio,
            modalidad_pago  = _modalidad_pago,
            entidad_bancaria        = NULLIF(_entidad_bancaria,''),
            nro_operacion   = NULLIF(_nro_operacion,''),
            imagen          = _imagen,
            update_at       = CURDATE(),
            idusuario       = _idusuario
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_set_separation` (IN `_idseparacion` INT, IN `_n_expediente` VARCHAR(10), IN `_idactivo` INT, IN `_idcliente` INT, IN `_idconyugue` INT, IN `_tipo_cambio` DECIMAL(5,4), IN `_moneda_venta` VARCHAR(10), IN `_separacion_monto` DECIMAL(8,2), IN `_fecha_pago` DATE, IN `_imagen` VARCHAR(200), IN `_detalle` VARCHAR(200), IN `_modalidad_pago` VARCHAR(20), IN `_entidad_bancaria` VARCHAR(30), IN `_nro_operacion` CHAR(10), IN `_idusuario` INT)   BEGIN
    UPDATE separaciones 
        SET
            n_expediente   = _n_expediente,
            idactivo       = _idactivo,
            idcliente      = _idcliente,
            idconyugue     = NULLIF(_idconyugue,''),
            tipo_cambio         = _tipo_cambio,
            moneda_venta        = _moneda_venta,
            separacion_monto    = _separacion_monto,
            fecha_pago          = _fecha_pago,
            imagen              = _imagen,
            detalle             = _detalle,
            modalidad_pago      = _modalidad_pago,
            entidad_bancaria    = _entidad_bancaria,
            nro_operacion       = _nro_operacion,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_upset_config` (IN `_clave` VARCHAR(100), IN `_valor` VARCHAR(200))   BEGIN
    DECLARE _existKey BIT;

    SET _existKey = (
        SELECT EXISTS(
            SELECT 1 
            FROM configuraciones
            WHERE clave = _clave
            )
        );

    IF _existKey  = 1 THEN

        UPDATE configuraciones
            SET valor       = _valor,
                update_at   = CURDATE()
            WHERE clave = _clave;
    ELSE
        
        INSERT INTO configuraciones(clave, valor)
                    VALUES(_clave, _valor);
    END IF;
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
-- Volcado de datos para la tabla `activos`
--

INSERT INTO `activos` (`idactivo`, `idproyecto`, `tipo_activo`, `imagen`, `estado`, `sublote`, `direccion`, `moneda_venta`, `area_terreno`, `area_construccion`, `area_techada`, `zcomunes_porcent`, `partida_elect`, `latitud`, `longitud`, `perimetro`, `det_casa`, `idpresupuesto`, `propietario_lote`, `precio_lote`, `precio_construccion`, `precio_venta`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 5, 'LOTE', 'cac10d67f7877a2085c6625203e7f62c88538d2ajpg', 'VENDIDO', 1, 'aav san juan', 'SOL', 50.00, NULL, NULL, 50, 'partida electronica nro 4', NULL, NULL, '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', NULL, 'TERCEROS', 20000.00, NULL, 20000.00, '2024-06-18', '2024-06-27', NULL, 1),
(2, 5, 'LOTE', '1aa4959315c6c15dcf073415f5f5a93f7df4d7cajpg', 'VENDIDO', 2, 'aav san juan tijuana', 'SOL', 60.00, 0.00, 0.00, 30, 'partida nro 5', NULL, NULL, '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', NULL, 'A.I.F', 25000.00, NULL, 25000.00, '2024-06-18', '2024-06-28', NULL, 1),
(3, 5, 'CASA', '61307ab9cb5e52725e2f126ad3021c06ab1dc0e4jpg', 'VENDIDO', 3, 'av san juan', 'SOL', 50.00, 50.00, 50.00, 10, 'partida nro 4', NULL, NULL, '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', NULL, 'TERCEROS', 50000.00, NULL, 50000.00, '2024-06-19', '2024-06-28', NULL, 1),
(4, 5, 'CASA', '61307ab9cb5e52725e2f126ad3021c06ab1dc0e4jpg', 'VENDIDO', 4, 'av san juan', 'SOL', 50.00, NULL, NULL, 10, 'partida nro 4', 'null', 'null', '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', 13, 'TERCEROS', 50000.00, 700.00, 50700.00, '2024-06-19', '2024-06-28', NULL, 1),
(5, 5, 'CASA', '61307ab9cb5e52725e2f126ad3021c06ab1dc0e4jpg', 'SIN VENDER', 5, 'av san juan', 'SOL', 50.00, NULL, NULL, 10, 'partida nro 4', 'null', 'null', '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', 12, 'TERCEROS', 50000.00, 464.40, 50464.40, '2024-06-19', '2024-06-29', NULL, 1),
(6, 4, 'LOTE', '098bbe58ee841ed912574df7176763b6a52861f9jpg', 'VENDIDO', 1, 'san juan', 'USD', 60.00, NULL, NULL, 50, 'partida nro 345', NULL, NULL, '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', NULL, 'A.I.F', 5000.00, NULL, 5000.00, '2024-06-28', '2024-06-28', NULL, 1),
(7, 5, 'LOTE', '83284b48e3fe4b4eef323f8e48b6a29fcebdc973jpg', 'SEPARADO', 6, 'san juan', 'SOL', 50.00, NULL, NULL, 10, 'PARTIDA NR 4', NULL, NULL, '{\"clave\":[\"\"],\"valor\":[\"\"]}', '{\"clave\" :[], \"valor\":[]}', NULL, 'A.I.F', 50000.00, NULL, 50000.00, '2024-06-29', '2024-06-29', NULL, 1);

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

--
-- Volcado de datos para la tabla `categoria_costos`
--

INSERT INTO `categoria_costos` (`idcategoria_costo`, `categoria_costo`) VALUES
(1, 'COSTO DIRECTO'),
(2, 'COSTO INDIRECTO');

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

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `tipo_persona`, `idpersona`, `idpersona_juridica`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 'NATURAL', 19, NULL, '2024-06-19', NULL, NULL, 1),
(2, 'JURÍDICA', NULL, 1, '2024-06-19', NULL, NULL, 1),
(3, 'JURÍDICA', NULL, 2, '2024-06-19', NULL, NULL, 1),
(4, 'JURÍDICA', NULL, 3, '2024-06-19', NULL, NULL, 1),
(5, 'JURÍDICA', NULL, 4, '2024-06-20', NULL, NULL, 1),
(6, 'JURÍDICA', NULL, 5, '2024-06-20', NULL, NULL, 1);

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
(1, 'contrasenia', 'peru2024', '2024-06-18 20:00:47', NULL),
(8, 'serie-presupuesto', '4', '2024-06-19 15:51:10', '2024-06-29 00:00:00'),
(9, 'serie-separacion', '7', '2024-06-20 08:13:59', '2024-06-29 00:00:00'),
(10, 'serie-contrato', '9', '2024-06-20 08:13:59', '2024-06-28 00:00:00');

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

--
-- Volcado de datos para la tabla `constructora`
--

INSERT INTO `constructora` (`idconstructora`, `razon_social`, `ruc`, `partida_elect`, `latitud`, `longitud`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'A.I. F CONTRATISTAS GENERALES S.A.C', '20494453003', '11013804 del Registro de Personas Jurídicas de CHINCHA-ICA', NULL, NULL, '2024-06-17', NULL, NULL);

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
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`idcontrato`, `n_expediente`, `tipo_contrato`, `idseparacion`, `idrepresentante_primario`, `idrepresentante_secundario`, `idcliente`, `idconyugue`, `idactivo`, `tipo_cambio`, `estado`, `fecha_contrato`, `precio_venta`, `moneda_venta`, `inicial`, `det_contrato`, `archivo`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 'CONT-00004', 'VENTA DE LOTE', 1, 1, NULL, 1, NULL, NULL, 3.870, 'VIGENTE', '2024-06-27', 20000.00, 'SOL', 500.00, '{\"clave\":[\"1\"],\"valor\":[\"1\"]}', '9590e2cb47dcd69d6d8cf1f80df2899714b1535f.pdf', '2024-06-27', NULL, NULL, 1),
(2, 'CONT-00005', 'VENTA DE LOTE', 2, 1, NULL, 1, NULL, NULL, 3.800, 'VIGENTE', '2024-06-28', 25000.00, 'SOL', 500.00, '{\"clave\":[\"1\"],\"valor\":[\"2\"]}', '00a925ae7a499407ce38a08e8fb00dbec84f3ee9.pdf', '2024-06-28', NULL, NULL, 1),
(3, 'CONT-00006', 'VENTA DE CASA', NULL, 1, NULL, 1, NULL, 3, 3.500, 'VIGENTE', '2024-06-28', 50000.00, 'SOL', 500.00, '{\"clave\":[\"1\"],\"valor\":[\"1\"]}', '4aae50989f4a013eb07e774bb3665ec74015d86f.pdf', '2024-06-28', NULL, NULL, 1),
(4, 'CONT-00007', 'VENTA DE CASA', NULL, 1, NULL, 1, NULL, 4, 3.900, 'VIGENTE', '2024-06-28', 50700.00, 'SOL', 600.00, '{\"clave\":[\"1\"],\"valor\":[\"1\"]}', '4ffd99ced216ab0e5faf44b57f2e35757a9192ec.pdf', '2024-06-28', NULL, NULL, 1),
(5, 'CONT-00008', 'VENTA DE LOTE', 3, 1, NULL, 6, NULL, NULL, 3.830, 'VIGENTE', '2024-06-28', 5000.00, 'USD', 590.00, '{\"clave\":[\"1\"],\"valor\":[\"1\"]}', 'f177fa693ccfcbe7d206af5bac84ca3079aeb795.pdf', '2024-06-28', NULL, NULL, 1),
(6, 'CONT-00009', 'VENTA DE CASA', NULL, 1, NULL, 1, NULL, 5, 3.500, 'INACTIVO', '2024-06-28', 50464.40, 'SOL', 600.00, '{\"clave\":[\"1\"],\"valor\":[\"1\"]}', 'df0065c11ffa9ab5c58581f941cb3e473e3f6b96.pdf', '2024-06-28', NULL, '2024-06-29', 1);

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

--
-- Volcado de datos para la tabla `cuotas`
--

INSERT INTO `cuotas` (`idcuota`, `idcontrato`, `monto_cuota`, `fecha_vencimiento`, `estado`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 1, 20000.00, '2024-06-27', 'CANCELADO', '2024-06-27', '2024-06-27', NULL, 1),
(2, 2, 25000.00, '2024-06-28', 'CANCELADO', '2024-06-28', '2024-06-28', NULL, 1),
(3, 3, 50000.00, '2024-06-28', 'CANCELADO', '2024-06-28', '2024-06-28', NULL, 1),
(4, 4, 50700.00, '2024-06-28', 'CANCELADO', '2024-06-28', '2024-06-28', NULL, 1),
(5, 5, 5000.00, '2024-06-28', 'CANCELADO', '2024-06-28', '2024-06-28', NULL, 1),
(6, 6, 50464.40, '2024-06-28', 'CANCELADO', '2024-06-28', '2024-06-28', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamento` int(11) NOT NULL,
  `departamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`iddepartamento`, `departamento`) VALUES
(1, 'Amazonas'),
(2, 'Áncash'),
(3, 'Apurímac'),
(4, 'Arequipa'),
(5, 'Ayacucho'),
(6, 'Cajamarca'),
(7, 'Callao'),
(8, 'Cusco'),
(9, 'Huancavelica'),
(10, 'Huánuco'),
(11, 'Ica'),
(12, 'Junín'),
(13, 'La Libertad'),
(14, 'Lambayeque'),
(15, 'Lima'),
(16, 'Loreto'),
(17, 'Madre de Dios'),
(18, 'Moquegua'),
(19, 'Pasco'),
(20, 'Piura'),
(21, 'Puno'),
(22, 'San Martín'),
(23, 'Tacna'),
(24, 'Tumbes'),
(25, 'Ucayali');

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

--
-- Volcado de datos para la tabla `detalles_contratos`
--

INSERT INTO `detalles_contratos` (`iddetalle_contrato`, `idrepresentante`, `idcontrato`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 8, 5, '2024-06-28', NULL, NULL);

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

--
-- Volcado de datos para la tabla `detalle_costos`
--

INSERT INTO `detalle_costos` (`iddetalle_costo`, `idpresupuesto`, `idsubcategoria_costo`, `idmaterial`, `detalle`, `cantidad`, `precio_unitario`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 12, 10, NULL, 'TARRAJEO', 1, 360.00, '2024-06-19', NULL, NULL, 1),
(2, 12, 2, 6, '3M // Rollo de Cinta aislante // unidad', 2, 5.00, '2024-06-19', NULL, NULL, 1),
(3, 12, 2, 13, 'Acindar // Bolsa de Arena fina // metro lineal', 1, 94.40, '2024-06-19', NULL, NULL, 1),
(4, 13, 10, NULL, 'TARRAJEO', 1, 350.00, '2024-06-19', NULL, NULL, 1),
(5, 13, 10, NULL, 'TARRAJEO', 1, 350.00, '2024-06-19', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cuotas`
--

CREATE TABLE `detalle_cuotas` (
  `iddetalle_cuota` int(11) NOT NULL,
  `idcuota` int(11) NOT NULL,
  `monto_pago` decimal(8,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `detalles` varchar(100) NOT NULL,
  `modalidad_pago` varchar(20) NOT NULL,
  `entidad_bancaria` varchar(20) DEFAULT NULL,
  `nro_operacion` char(10) DEFAULT NULL,
  `imagen` varchar(100) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_cuotas`
--

INSERT INTO `detalle_cuotas` (`iddetalle_cuota`, `idcuota`, `monto_pago`, `fecha_pago`, `detalles`, `modalidad_pago`, `entidad_bancaria`, `nro_operacion`, `imagen`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 20000.00, '2024-06-27', 'DETALLES POR EL PAGO', 'TRANFERENCIA', 'BCP', '', '201c9f489b3bd6d73fa7604dddb56632f8b956fc.jpg', '2024-06-27', NULL, NULL),
(2, 2, 25000.00, '2024-06-28', 'pago por el contrato', 'EFECTIVO', 'BCP', '', '6a87eac11c709755d4ed2b2f9b57931cd8334247.jpg', '2024-06-28', NULL, NULL),
(3, 3, 50000.00, '2024-06-28', 'pgago por la casa', 'TRANFERENCIA', 'INTERBANCK', '', '6a87eac11c709755d4ed2b2f9b57931cd8334247.jpg', '2024-06-28', NULL, NULL),
(4, 4, 50700.00, '2024-06-28', 'pago por el contrato', 'TRANFERENCIA', 'BCP', '', '6a87eac11c709755d4ed2b2f9b57931cd8334247.jpg', '2024-06-28', NULL, NULL),
(5, 5, 5000.00, '2024-06-28', 'pago del contrato', 'TRANFERENCIA', 'BCP', '', '6a87eac11c709755d4ed2b2f9b57931cd8334247.jpg', '2024-06-28', NULL, NULL),
(8, 6, 50464.40, '2024-06-28', 'PAGO POR EL CONTRATO', 'TRANSFERENCIA', 'BCP', '0000000596', '6a87eac11c709755d4ed2b2f9b57931cd8334247.jpg', '2024-06-28', NULL, NULL);

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
  `modalidad_pago` varchar(20) NOT NULL,
  `tipo_cambio` decimal(5,4) NOT NULL,
  `entidad_bancaria` varchar(30) DEFAULT NULL,
  `nro_operacion` char(10) DEFAULT NULL,
  `imagen` varchar(100) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`iddevolucion`, `n_expediente`, `tipo_devolucion`, `idseparacion`, `idcontrato`, `detalle`, `porcentaje_penalidad`, `monto_devolucion`, `modalidad_pago`, `tipo_cambio`, `entidad_bancaria`, `nro_operacion`, `imagen`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 'DEVC-00004', 'POR CONTRATO', NULL, 6, 'DESISTIÓ DE LA COMPRA', 20, 40371.52, 'EFECTIVO', 3.7500, NULL, NULL, '322079bee345b6bb90dd78891210a3081143dcde.jpg', '2024-06-29', NULL, NULL, 1);

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

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`iddistrito`, `idprovincia`, `distrito`) VALUES
(1, 1, 'Chachapoyas'),
(2, 1, 'Asunción'),
(3, 1, 'Balsas'),
(4, 1, 'Cheto'),
(5, 1, 'Chiliquin'),
(6, 1, 'Chuquibamba'),
(7, 1, 'Granada'),
(8, 1, 'Huancas'),
(9, 1, 'La Jalca'),
(10, 1, 'Leimebamba'),
(11, 1, 'Levanto'),
(12, 1, 'Magdalena'),
(13, 1, 'Mariscal Castilla'),
(14, 1, 'Molinopampa'),
(15, 1, 'Montevideo'),
(16, 1, 'Olleros'),
(17, 1, 'Quinjalca'),
(18, 1, 'San Francisco de Daguas'),
(19, 1, 'San Isidro de Maino'),
(20, 1, 'Soloco'),
(21, 1, 'Sonche'),
(22, 2, 'Bagua'),
(23, 2, 'Aramango'),
(24, 2, 'Copallin'),
(25, 2, 'El Parco'),
(26, 2, 'Imaza'),
(27, 2, 'La Peca'),
(28, 3, 'Jumbilla'),
(29, 3, 'Chisquilla'),
(30, 3, 'Churuja'),
(31, 3, 'Corosha'),
(32, 3, 'Cuispes'),
(33, 3, 'Florida'),
(34, 3, 'Jazan'),
(35, 3, 'Recta'),
(36, 3, 'San Carlos'),
(37, 3, 'Shipasbamba'),
(38, 3, 'Valera'),
(39, 3, 'Yambrasbamba'),
(40, 4, 'Nieva'),
(41, 4, 'El Cenepa'),
(42, 4, 'Río Santiago'),
(43, 5, 'Lamud'),
(44, 5, 'Camporredondo'),
(45, 5, 'Cocabamba'),
(46, 5, 'Colcamar'),
(47, 5, 'Conila'),
(48, 5, 'Inguilpata'),
(49, 5, 'Longuita'),
(50, 5, 'Lonya Chico'),
(51, 5, 'Luya'),
(52, 5, 'Luya Viejo'),
(53, 5, 'María'),
(54, 5, 'Ocalli'),
(55, 5, 'Ocumal'),
(56, 5, 'Pisuquia'),
(57, 5, 'Providencia'),
(58, 5, 'San Cristóbal'),
(59, 5, 'San Francisco de Yeso'),
(60, 5, 'San Jerónimo'),
(61, 5, 'San Juan de Lopecancha'),
(62, 5, 'Santa Catalina'),
(63, 5, 'Santo Tomas'),
(64, 5, 'Tingo'),
(65, 5, 'Trita'),
(66, 6, 'San Nicolás'),
(67, 6, 'Chirimoto'),
(68, 6, 'Cochamal'),
(69, 6, 'Huambo'),
(70, 6, 'Limabamba'),
(71, 6, 'Longar'),
(72, 6, 'Mariscal Benavides'),
(73, 6, 'Milpuc'),
(74, 6, 'Omia'),
(75, 6, 'Santa Rosa'),
(76, 6, 'Totora'),
(77, 6, 'Vista Alegre'),
(78, 7, 'Bagua Grande'),
(79, 7, 'Cajaruro'),
(80, 7, 'Cumba'),
(81, 7, 'El Milagro'),
(82, 7, 'Jamalca'),
(83, 7, 'Lonya Grande'),
(84, 7, 'Yamon'),
(85, 8, 'Huaraz'),
(86, 8, 'Cochabamba'),
(87, 8, 'Colcabamba'),
(88, 8, 'Huanchay'),
(89, 8, 'Independencia'),
(90, 8, 'Jangas'),
(91, 8, 'La Libertad'),
(92, 8, 'Olleros'),
(93, 8, 'Pampas Grande'),
(94, 8, 'Pariacoto'),
(95, 8, 'Pira'),
(96, 8, 'Tarica'),
(97, 9, 'Aija'),
(98, 9, 'Coris'),
(99, 9, 'Huacllan'),
(100, 9, 'La Merced'),
(101, 9, 'Succha'),
(102, 10, 'Llamellin'),
(103, 10, 'Aczo'),
(104, 10, 'Chaccho'),
(105, 10, 'Chingas'),
(106, 10, 'Mirgas'),
(107, 10, 'San Juan de Rontoy'),
(108, 11, 'Chacas'),
(109, 11, 'Acochaca'),
(110, 12, 'Chiquian'),
(111, 12, 'Abelardo Pardo Lezameta'),
(112, 12, 'Antonio Raymondi'),
(113, 12, 'Aquia'),
(114, 12, 'Cajacay'),
(115, 12, 'Canis'),
(116, 12, 'Colquioc'),
(117, 12, 'Huallanca'),
(118, 12, 'Huasta'),
(119, 12, 'Huayllacayan'),
(120, 12, 'La Primavera'),
(121, 12, 'Mangas'),
(122, 12, 'Pacllon'),
(123, 12, 'San Miguel de Corpanqui'),
(124, 12, 'Ticllos'),
(125, 13, 'Carhuaz'),
(126, 13, 'Acopampa'),
(127, 13, 'Amashca'),
(128, 13, 'Anta'),
(129, 13, 'Ataquero'),
(130, 13, 'Marcara'),
(131, 13, 'Pariahuanca'),
(132, 13, 'San Miguel de Aco'),
(133, 13, 'Shilla'),
(134, 13, 'Tinco'),
(135, 13, 'Yungar'),
(136, 14, 'San Luis'),
(137, 14, 'San Nicolás'),
(138, 14, 'Yauya'),
(139, 15, 'Casma'),
(140, 15, 'Buena Vista Alta'),
(141, 15, 'Comandante Noel'),
(142, 15, 'Yautan'),
(143, 16, 'Corongo'),
(144, 16, 'Aco'),
(145, 16, 'Bambas'),
(146, 16, 'Cusca'),
(147, 16, 'La Pampa'),
(148, 16, 'Yanac'),
(149, 16, 'Yupan'),
(150, 17, 'Huari'),
(151, 17, 'Anra'),
(152, 17, 'Cajay'),
(153, 17, 'Chavin de Huantar'),
(154, 17, 'Huacachi'),
(155, 17, 'Huacchis'),
(156, 17, 'Huachis'),
(157, 17, 'Huantar'),
(158, 17, 'Masin'),
(159, 17, 'Paucas'),
(160, 17, 'Ponto'),
(161, 17, 'Rahuapampa'),
(162, 17, 'Rapayan'),
(163, 17, 'San Marcos'),
(164, 17, 'San Pedro de Chana'),
(165, 17, 'Uco'),
(166, 18, 'Huarmey'),
(167, 18, 'Cochapeti'),
(168, 18, 'Culebras'),
(169, 18, 'Huayan'),
(170, 18, 'Malvas'),
(171, 19, 'Caraz'),
(172, 19, 'Huallanca'),
(173, 19, 'Huata'),
(174, 19, 'Huaylas'),
(175, 19, 'Mato'),
(176, 19, 'Pamparomas'),
(177, 19, 'Pueblo Libre'),
(178, 19, 'Santa Cruz'),
(179, 19, 'Santo Toribio'),
(180, 19, 'Yuracmarca'),
(181, 20, 'Piscobamba'),
(182, 20, 'Casca'),
(183, 20, 'Eleazar Guzmán Barron'),
(184, 20, 'Fidel Olivas Escudero'),
(185, 20, 'Llama'),
(186, 20, 'Llumpa'),
(187, 20, 'Lucma'),
(188, 20, 'Musga'),
(189, 21, 'Ocros'),
(190, 21, 'Acas'),
(191, 21, 'Cajamarquilla'),
(192, 21, 'Carhuapampa'),
(193, 21, 'Cochas'),
(194, 21, 'Congas'),
(195, 21, 'Llipa'),
(196, 21, 'San Cristóbal de Rajan'),
(197, 21, 'San Pedro'),
(198, 21, 'Santiago de Chilcas'),
(199, 22, 'Cabana'),
(200, 22, 'Bolognesi'),
(201, 22, 'Conchucos'),
(202, 22, 'Huacaschuque'),
(203, 22, 'Huandoval'),
(204, 22, 'Lacabamba'),
(205, 22, 'Llapo'),
(206, 22, 'Pallasca'),
(207, 22, 'Pampas'),
(208, 22, 'Santa Rosa'),
(209, 22, 'Tauca'),
(210, 23, 'Pomabamba'),
(211, 23, 'Huayllan'),
(212, 23, 'Parobamba'),
(213, 23, 'Quinuabamba'),
(214, 24, 'Recuay'),
(215, 24, 'Catac'),
(216, 24, 'Cotaparaco'),
(217, 24, 'Huayllapampa'),
(218, 24, 'Llacllin'),
(219, 24, 'Marca'),
(220, 24, 'Pampas Chico'),
(221, 24, 'Pararin'),
(222, 24, 'Tapacocha'),
(223, 24, 'Ticapampa'),
(224, 25, 'Chimbote'),
(225, 25, 'Cáceres del Perú'),
(226, 25, 'Coishco'),
(227, 25, 'Macate'),
(228, 25, 'Moro'),
(229, 25, 'Nepeña'),
(230, 25, 'Samanco'),
(231, 25, 'Santa'),
(232, 25, 'Nuevo Chimbote'),
(233, 26, 'Sihuas'),
(234, 26, 'Acobamba'),
(235, 26, 'Alfonso Ugarte'),
(236, 26, 'Cashapampa'),
(237, 26, 'Chingalpo'),
(238, 26, 'Huayllabamba'),
(239, 26, 'Quiches'),
(240, 26, 'Ragash'),
(241, 26, 'San Juan'),
(242, 26, 'Sicsibamba'),
(243, 27, 'Yungay'),
(244, 27, 'Cascapara'),
(245, 27, 'Mancos'),
(246, 27, 'Matacoto'),
(247, 27, 'Quillo'),
(248, 27, 'Ranrahirca'),
(249, 27, 'Shupluy'),
(250, 27, 'Yanama'),
(251, 28, 'Abancay'),
(252, 28, 'Chacoche'),
(253, 28, 'Circa'),
(254, 28, 'Curahuasi'),
(255, 28, 'Huanipaca'),
(256, 28, 'Lambrama'),
(257, 28, 'Pichirhua'),
(258, 28, 'San Pedro de Cachora'),
(259, 28, 'Tamburco'),
(260, 29, 'Andahuaylas'),
(261, 29, 'Andarapa'),
(262, 29, 'Chiara'),
(263, 29, 'Huancarama'),
(264, 29, 'Huancaray'),
(265, 29, 'Huayana'),
(266, 29, 'Kishuara'),
(267, 29, 'Pacobamba'),
(268, 29, 'Pacucha'),
(269, 29, 'Pampachiri'),
(270, 29, 'Pomacocha'),
(271, 29, 'San Antonio de Cachi'),
(272, 29, 'San Jerónimo'),
(273, 29, 'San Miguel de Chaccrampa'),
(274, 29, 'Santa María de Chicmo'),
(275, 29, 'Talavera'),
(276, 29, 'Tumay Huaraca'),
(277, 29, 'Turpo'),
(278, 29, 'Kaquiabamba'),
(279, 29, 'José María Arguedas'),
(280, 30, 'Antabamba'),
(281, 30, 'El Oro'),
(282, 30, 'Huaquirca'),
(283, 30, 'Juan Espinoza Medrano'),
(284, 30, 'Oropesa'),
(285, 30, 'Pachaconas'),
(286, 30, 'Sabaino'),
(287, 31, 'Chalhuanca'),
(288, 31, 'Capaya'),
(289, 31, 'Caraybamba'),
(290, 31, 'Chapimarca'),
(291, 31, 'Colcabamba'),
(292, 31, 'Cotaruse'),
(293, 31, 'Ihuayllo'),
(294, 31, 'Justo Apu Sahuaraura'),
(295, 31, 'Lucre'),
(296, 31, 'Pocohuanca'),
(297, 31, 'San Juan de Chacña'),
(298, 31, 'Sañayca'),
(299, 31, 'Soraya'),
(300, 31, 'Tapairihua'),
(301, 31, 'Tintay'),
(302, 31, 'Toraya'),
(303, 31, 'Yanaca'),
(304, 32, 'Tambobamba'),
(305, 32, 'Cotabambas'),
(306, 32, 'Coyllurqui'),
(307, 32, 'Haquira'),
(308, 32, 'Mara'),
(309, 32, 'Challhuahuacho'),
(310, 33, 'Chincheros'),
(311, 33, 'Anco_Huallo'),
(312, 33, 'Cocharcas'),
(313, 33, 'Huaccana'),
(314, 33, 'Ocobamba'),
(315, 33, 'Ongoy'),
(316, 33, 'Uranmarca'),
(317, 33, 'Ranracancha'),
(318, 33, 'Rocchacc'),
(319, 33, 'El Porvenir'),
(320, 33, 'Los Chankas'),
(321, 34, 'Chuquibambilla'),
(322, 34, 'Curpahuasi'),
(323, 34, 'Gamarra'),
(324, 34, 'Huayllati'),
(325, 34, 'Mamara'),
(326, 34, 'Micaela Bastidas'),
(327, 34, 'Pataypampa'),
(328, 34, 'Progreso'),
(329, 34, 'San Antonio'),
(330, 34, 'Santa Rosa'),
(331, 34, 'Turpay'),
(332, 34, 'Vilcabamba'),
(333, 34, 'Virundo'),
(334, 34, 'Curasco'),
(335, 35, 'Arequipa'),
(336, 35, 'Alto Selva Alegre'),
(337, 35, 'Cayma'),
(338, 35, 'Cerro Colorado'),
(339, 35, 'Characato'),
(340, 35, 'Chiguata'),
(341, 35, 'Jacobo Hunter'),
(342, 35, 'La Joya'),
(343, 35, 'Mariano Melgar'),
(344, 35, 'Miraflores'),
(345, 35, 'Mollebaya'),
(346, 35, 'Paucarpata'),
(347, 35, 'Pocsi'),
(348, 35, 'Polobaya'),
(349, 35, 'Quequeña'),
(350, 35, 'Sabandia'),
(351, 35, 'Sachaca'),
(352, 35, 'San Juan de Siguas'),
(353, 35, 'San Juan de Tarucani'),
(354, 35, 'Santa Isabel de Siguas'),
(355, 35, 'Santa Rita de Siguas'),
(356, 35, 'Socabaya'),
(357, 35, 'Tiabaya'),
(358, 35, 'Uchumayo'),
(359, 35, 'Vitor'),
(360, 35, 'Yanahuara'),
(361, 35, 'Yarabamba'),
(362, 35, 'Yura'),
(363, 35, 'José Luis Bustamante Y Rivero'),
(364, 36, 'Camaná'),
(365, 36, 'José María Quimper'),
(366, 36, 'Mariano Nicolás Valcárcel'),
(367, 36, 'Mariscal Cáceres'),
(368, 36, 'Nicolás de Pierola'),
(369, 36, 'Ocoña'),
(370, 36, 'Quilca'),
(371, 36, 'Samuel Pastor'),
(372, 37, 'Caravelí'),
(373, 37, 'Acarí'),
(374, 37, 'Atico'),
(375, 37, 'Atiquipa'),
(376, 37, 'Bella Unión'),
(377, 37, 'Cahuacho'),
(378, 37, 'Chala'),
(379, 37, 'Chaparra'),
(380, 37, 'Huanuhuanu'),
(381, 37, 'Jaqui'),
(382, 37, 'Lomas'),
(383, 37, 'Quicacha'),
(384, 37, 'Yauca'),
(385, 38, 'Aplao'),
(386, 38, 'Andagua'),
(387, 38, 'Ayo'),
(388, 38, 'Chachas'),
(389, 38, 'Chilcaymarca'),
(390, 38, 'Choco'),
(391, 38, 'Huancarqui'),
(392, 38, 'Machaguay'),
(393, 38, 'Orcopampa'),
(394, 38, 'Pampacolca'),
(395, 38, 'Tipan'),
(396, 38, 'Uñon'),
(397, 38, 'Uraca'),
(398, 38, 'Viraco'),
(399, 39, 'Chivay'),
(400, 39, 'Achoma'),
(401, 39, 'Cabanaconde'),
(402, 39, 'Callalli'),
(403, 39, 'Caylloma'),
(404, 39, 'Coporaque'),
(405, 39, 'Huambo'),
(406, 39, 'Huanca'),
(407, 39, 'Ichupampa'),
(408, 39, 'Lari'),
(409, 39, 'Lluta'),
(410, 39, 'Maca'),
(411, 39, 'Madrigal'),
(412, 39, 'San Antonio de Chuca'),
(413, 39, 'Sibayo'),
(414, 39, 'Tapay'),
(415, 39, 'Tisco'),
(416, 39, 'Tuti'),
(417, 39, 'Yanque'),
(418, 39, 'Majes'),
(419, 40, 'Chuquibamba'),
(420, 40, 'Andaray'),
(421, 40, 'Cayarani'),
(422, 40, 'Chichas'),
(423, 40, 'Iray'),
(424, 40, 'Río Grande'),
(425, 40, 'Salamanca'),
(426, 40, 'Yanaquihua'),
(427, 41, 'Mollendo'),
(428, 41, 'Cocachacra'),
(429, 41, 'Dean Valdivia'),
(430, 41, 'Islay'),
(431, 41, 'Mejia'),
(432, 41, 'Punta de Bombón'),
(433, 42, 'Cotahuasi'),
(434, 42, 'Alca'),
(435, 42, 'Charcana'),
(436, 42, 'Huaynacotas'),
(437, 42, 'Pampamarca'),
(438, 42, 'Puyca'),
(439, 42, 'Quechualla'),
(440, 42, 'Sayla'),
(441, 42, 'Tauria'),
(442, 42, 'Tomepampa'),
(443, 42, 'Toro'),
(444, 43, 'Ayacucho'),
(445, 43, 'Acocro'),
(446, 43, 'Acos Vinchos'),
(447, 43, 'Carmen Alto'),
(448, 43, 'Chiara'),
(449, 43, 'Ocros'),
(450, 43, 'Pacaycasa'),
(451, 43, 'Quinua'),
(452, 43, 'San José de Ticllas'),
(453, 43, 'San Juan Bautista'),
(454, 43, 'Santiago de Pischa'),
(455, 43, 'Socos'),
(456, 43, 'Tambillo'),
(457, 43, 'Vinchos'),
(458, 43, 'Jesús Nazareno'),
(459, 43, 'Andrés Avelino Cáceres Dorregaray'),
(460, 44, 'Cangallo'),
(461, 44, 'Chuschi'),
(462, 44, 'Los Morochucos'),
(463, 44, 'María Parado de Bellido'),
(464, 44, 'Paras'),
(465, 44, 'Totos'),
(466, 45, 'Sancos'),
(467, 45, 'Carapo'),
(468, 45, 'Sacsamarca'),
(469, 45, 'Santiago de Lucanamarca'),
(470, 46, 'Huanta'),
(471, 46, 'Ayahuanco'),
(472, 46, 'Huamanguilla'),
(473, 46, 'Iguain'),
(474, 46, 'Luricocha'),
(475, 46, 'Santillana'),
(476, 46, 'Sivia'),
(477, 46, 'Llochegua'),
(478, 46, 'Canayre'),
(479, 46, 'Uchuraccay'),
(480, 46, 'Pucacolpa'),
(481, 46, 'Chaca'),
(482, 47, 'San Miguel'),
(483, 47, 'Anco'),
(484, 47, 'Ayna'),
(485, 47, 'Chilcas'),
(486, 47, 'Chungui'),
(487, 47, 'Luis Carranza'),
(488, 47, 'Santa Rosa'),
(489, 47, 'Tambo'),
(490, 47, 'Samugari'),
(491, 47, 'Anchihuay'),
(492, 47, 'Oronccoy'),
(493, 48, 'Puquio'),
(494, 48, 'Aucara'),
(495, 48, 'Cabana'),
(496, 48, 'Carmen Salcedo'),
(497, 48, 'Chaviña'),
(498, 48, 'Chipao'),
(499, 48, 'Huac-Huas'),
(500, 48, 'Laramate'),
(501, 48, 'Leoncio Prado'),
(502, 48, 'Llauta'),
(503, 48, 'Lucanas'),
(504, 48, 'Ocaña'),
(505, 48, 'Otoca'),
(506, 48, 'Saisa'),
(507, 48, 'San Cristóbal'),
(508, 48, 'San Juan'),
(509, 48, 'San Pedro'),
(510, 48, 'San Pedro de Palco'),
(511, 48, 'Sancos'),
(512, 48, 'Santa Ana de Huaycahuacho'),
(513, 48, 'Santa Lucia'),
(514, 49, 'Coracora'),
(515, 49, 'Chumpi'),
(516, 49, 'Coronel Castañeda'),
(517, 49, 'Pacapausa'),
(518, 49, 'Pullo'),
(519, 49, 'Puyusca'),
(520, 49, 'San Francisco de Ravacayco'),
(521, 49, 'Upahuacho'),
(522, 50, 'Pausa'),
(523, 50, 'Colta'),
(524, 50, 'Corculla'),
(525, 50, 'Lampa'),
(526, 50, 'Marcabamba'),
(527, 50, 'Oyolo'),
(528, 50, 'Pararca'),
(529, 50, 'San Javier de Alpabamba'),
(530, 50, 'San José de Ushua'),
(531, 50, 'Sara Sara'),
(532, 51, 'Querobamba'),
(533, 51, 'Belén'),
(534, 51, 'Chalcos'),
(535, 51, 'Chilcayoc'),
(536, 51, 'Huacaña'),
(537, 51, 'Morcolla'),
(538, 51, 'Paico'),
(539, 51, 'San Pedro de Larcay'),
(540, 51, 'San Salvador de Quije'),
(541, 51, 'Santiago de Paucaray'),
(542, 51, 'Soras'),
(543, 52, 'Huancapi'),
(544, 52, 'Alcamenca'),
(545, 52, 'Apongo'),
(546, 52, 'Asquipata'),
(547, 52, 'Canaria'),
(548, 52, 'Cayara'),
(549, 52, 'Colca'),
(550, 52, 'Huamanquiquia'),
(551, 52, 'Huancaraylla'),
(552, 52, 'Hualla'),
(553, 52, 'Sarhua'),
(554, 52, 'Vilcanchos'),
(555, 53, 'Vilcas Huaman'),
(556, 53, 'Accomarca'),
(557, 53, 'Carhuanca'),
(558, 53, 'Concepción'),
(559, 53, 'Huambalpa'),
(560, 53, 'Independencia'),
(561, 53, 'Saurama'),
(562, 53, 'Vischongo'),
(563, 54, 'Cajamarca'),
(564, 54, 'Asunción'),
(565, 54, 'Chetilla'),
(566, 54, 'Cospan'),
(567, 54, 'Encañada'),
(568, 54, 'Jesús'),
(569, 54, 'Llacanora'),
(570, 54, 'Los Baños del Inca'),
(571, 54, 'Magdalena'),
(572, 54, 'Matara'),
(573, 54, 'Namora'),
(574, 54, 'San Juan'),
(575, 55, 'Cajabamba'),
(576, 55, 'Cachachi'),
(577, 55, 'Condebamba'),
(578, 55, 'Sitacocha'),
(579, 56, 'Celendín'),
(580, 56, 'Chumuch'),
(581, 56, 'Cortegana'),
(582, 56, 'Huasmin'),
(583, 56, 'Jorge Chávez'),
(584, 56, 'José Gálvez'),
(585, 56, 'Miguel Iglesias'),
(586, 56, 'Oxamarca'),
(587, 56, 'Sorochuco'),
(588, 56, 'Sucre'),
(589, 56, 'Utco'),
(590, 56, 'La Libertad de Pallan'),
(591, 57, 'Chota'),
(592, 57, 'Anguia'),
(593, 57, 'Chadin'),
(594, 57, 'Chiguirip'),
(595, 57, 'Chimban'),
(596, 57, 'Choropampa'),
(597, 57, 'Cochabamba'),
(598, 57, 'Conchan'),
(599, 57, 'Huambos'),
(600, 57, 'Lajas'),
(601, 57, 'Llama'),
(602, 57, 'Miracosta'),
(603, 57, 'Paccha'),
(604, 57, 'Pion'),
(605, 57, 'Querocoto'),
(606, 57, 'San Juan de Licupis'),
(607, 57, 'Tacabamba'),
(608, 57, 'Tocmoche'),
(609, 57, 'Chalamarca'),
(610, 58, 'Contumaza'),
(611, 58, 'Chilete'),
(612, 58, 'Cupisnique'),
(613, 58, 'Guzmango'),
(614, 58, 'San Benito'),
(615, 58, 'Santa Cruz de Toledo'),
(616, 58, 'Tantarica'),
(617, 58, 'Yonan'),
(618, 59, 'Cutervo'),
(619, 59, 'Callayuc'),
(620, 59, 'Choros'),
(621, 59, 'Cujillo'),
(622, 59, 'La Ramada'),
(623, 59, 'Pimpingos'),
(624, 59, 'Querocotillo'),
(625, 59, 'San Andrés de Cutervo'),
(626, 59, 'San Juan de Cutervo'),
(627, 59, 'San Luis de Lucma'),
(628, 59, 'Santa Cruz'),
(629, 59, 'Santo Domingo de la Capilla'),
(630, 59, 'Santo Tomas'),
(631, 59, 'Socota'),
(632, 59, 'Toribio Casanova'),
(633, 60, 'Bambamarca'),
(634, 60, 'Chugur'),
(635, 60, 'Hualgayoc'),
(636, 61, 'Jaén'),
(637, 61, 'Bellavista'),
(638, 61, 'Chontali'),
(639, 61, 'Colasay'),
(640, 61, 'Huabal'),
(641, 61, 'Las Pirias'),
(642, 61, 'Pomahuaca'),
(643, 61, 'Pucara'),
(644, 61, 'Sallique'),
(645, 61, 'San Felipe'),
(646, 61, 'San José del Alto'),
(647, 61, 'Santa Rosa'),
(648, 62, 'San Ignacio'),
(649, 62, 'Chirinos'),
(650, 62, 'Huarango'),
(651, 62, 'La Coipa'),
(652, 62, 'Namballe'),
(653, 62, 'San José de Lourdes'),
(654, 62, 'Tabaconas'),
(655, 63, 'Pedro Gálvez'),
(656, 63, 'Chancay'),
(657, 63, 'Eduardo Villanueva'),
(658, 63, 'Gregorio Pita'),
(659, 63, 'Ichocan'),
(660, 63, 'José Manuel Quiroz'),
(661, 63, 'José Sabogal'),
(662, 64, 'San Miguel'),
(663, 64, 'Bolívar'),
(664, 64, 'Calquis'),
(665, 64, 'Catilluc'),
(666, 64, 'El Prado'),
(667, 64, 'La Florida'),
(668, 64, 'Llapa'),
(669, 64, 'Nanchoc'),
(670, 64, 'Niepos'),
(671, 64, 'San Gregorio'),
(672, 64, 'San Silvestre de Cochan'),
(673, 64, 'Tongod'),
(674, 64, 'Unión Agua Blanca'),
(675, 65, 'San Pablo'),
(676, 65, 'San Bernardino'),
(677, 65, 'San Luis'),
(678, 65, 'Tumbaden'),
(679, 66, 'Santa Cruz'),
(680, 66, 'Andabamba'),
(681, 66, 'Catache'),
(682, 66, 'Chancaybaños'),
(683, 66, 'La Esperanza'),
(684, 66, 'Ninabamba'),
(685, 66, 'Pulan'),
(686, 66, 'Saucepampa'),
(687, 66, 'Sexi'),
(688, 66, 'Uticyacu'),
(689, 66, 'Yauyucan'),
(690, 67, 'Callao'),
(691, 67, 'Bellavista'),
(692, 67, 'Carmen de la Legua Reynoso'),
(693, 67, 'La Perla'),
(694, 67, 'La Punta'),
(695, 67, 'Ventanilla'),
(696, 67, 'Mi Perú'),
(697, 68, 'Cusco'),
(698, 68, 'Ccorca'),
(699, 68, 'Poroy'),
(700, 68, 'San Jerónimo'),
(701, 68, 'San Sebastian'),
(702, 68, 'Santiago'),
(703, 68, 'Saylla'),
(704, 68, 'Wanchaq'),
(705, 69, 'Acomayo'),
(706, 69, 'Acopia'),
(707, 69, 'Acos'),
(708, 69, 'Mosoc Llacta'),
(709, 69, 'Pomacanchi'),
(710, 69, 'Rondocan'),
(711, 69, 'Sangarara'),
(712, 70, 'Anta'),
(713, 70, 'Ancahuasi'),
(714, 70, 'Cachimayo'),
(715, 70, 'Chinchaypujio'),
(716, 70, 'Huarocondo'),
(717, 70, 'Limatambo'),
(718, 70, 'Mollepata'),
(719, 70, 'Pucyura'),
(720, 70, 'Zurite'),
(721, 71, 'Calca'),
(722, 71, 'Coya'),
(723, 71, 'Lamay'),
(724, 71, 'Lares'),
(725, 71, 'Pisac'),
(726, 71, 'San Salvador'),
(727, 71, 'Taray'),
(728, 71, 'Yanatile'),
(729, 72, 'Yanaoca'),
(730, 72, 'Checca'),
(731, 72, 'Kunturkanki'),
(732, 72, 'Langui'),
(733, 72, 'Layo'),
(734, 72, 'Pampamarca'),
(735, 72, 'Quehue'),
(736, 72, 'Tupac Amaru'),
(737, 73, 'Sicuani'),
(738, 73, 'Checacupe'),
(739, 73, 'Combapata'),
(740, 73, 'Marangani'),
(741, 73, 'Pitumarca'),
(742, 73, 'San Pablo'),
(743, 73, 'San Pedro'),
(744, 73, 'Tinta'),
(745, 74, 'Santo Tomas'),
(746, 74, 'Capacmarca'),
(747, 74, 'Chamaca'),
(748, 74, 'Colquemarca'),
(749, 74, 'Livitaca'),
(750, 74, 'Llusco'),
(751, 74, 'Quiñota'),
(752, 74, 'Velille'),
(753, 75, 'Espinar'),
(754, 75, 'Condoroma'),
(755, 75, 'Coporaque'),
(756, 75, 'Ocoruro'),
(757, 75, 'Pallpata'),
(758, 75, 'Pichigua'),
(759, 75, 'Suyckutambo'),
(760, 75, 'Alto Pichigua'),
(761, 76, 'Santa Ana'),
(762, 76, 'Echarate'),
(763, 76, 'Huayopata'),
(764, 76, 'Maranura'),
(765, 76, 'Ocobamba'),
(766, 76, 'Quellouno'),
(767, 76, 'Kimbiri'),
(768, 76, 'Santa Teresa'),
(769, 76, 'Vilcabamba'),
(770, 76, 'Pichari'),
(771, 76, 'Inkawasi'),
(772, 76, 'Villa Virgen'),
(773, 76, 'Villa Kintiarina'),
(774, 76, 'Megantoni'),
(775, 77, 'Paruro'),
(776, 77, 'Accha'),
(777, 77, 'Ccapi'),
(778, 77, 'Colcha'),
(779, 77, 'Huanoquite'),
(780, 77, 'Omachaç'),
(781, 77, 'Paccaritambo'),
(782, 77, 'Pillpinto'),
(783, 77, 'Yaurisque'),
(784, 78, 'Paucartambo'),
(785, 78, 'Caicay'),
(786, 78, 'Challabamba'),
(787, 78, 'Colquepata'),
(788, 78, 'Huancarani'),
(789, 78, 'Kosñipata'),
(790, 79, 'Urcos'),
(791, 79, 'Andahuaylillas'),
(792, 79, 'Camanti'),
(793, 79, 'Ccarhuayo'),
(794, 79, 'Ccatca'),
(795, 79, 'Cusipata'),
(796, 79, 'Huaro'),
(797, 79, 'Lucre'),
(798, 79, 'Marcapata'),
(799, 79, 'Ocongate'),
(800, 79, 'Oropesa'),
(801, 79, 'Quiquijana'),
(802, 80, 'Urubamba'),
(803, 80, 'Chinchero'),
(804, 80, 'Huayllabamba'),
(805, 80, 'Machupicchu'),
(806, 80, 'Maras'),
(807, 80, 'Ollantaytambo'),
(808, 80, 'Yucay'),
(809, 81, 'Huancavelica'),
(810, 81, 'Acobambilla'),
(811, 81, 'Acoria'),
(812, 81, 'Conayca'),
(813, 81, 'Cuenca'),
(814, 81, 'Huachocolpa'),
(815, 81, 'Huayllahuara'),
(816, 81, 'Izcuchaca'),
(817, 81, 'Laria'),
(818, 81, 'Manta'),
(819, 81, 'Mariscal Cáceres'),
(820, 81, 'Moya'),
(821, 81, 'Nuevo Occoro'),
(822, 81, 'Palca'),
(823, 81, 'Pilchaca'),
(824, 81, 'Vilca'),
(825, 81, 'Yauli'),
(826, 81, 'Ascensión'),
(827, 81, 'Huando'),
(828, 82, 'Acobamba'),
(829, 82, 'Andabamba'),
(830, 82, 'Anta'),
(831, 82, 'Caja'),
(832, 82, 'Marcas'),
(833, 82, 'Paucara'),
(834, 82, 'Pomacocha'),
(835, 82, 'Rosario'),
(836, 83, 'Lircay'),
(837, 83, 'Anchonga'),
(838, 83, 'Callanmarca'),
(839, 83, 'Ccochaccasa'),
(840, 83, 'Chincho'),
(841, 83, 'Congalla'),
(842, 83, 'Huanca-Huanca'),
(843, 83, 'Huayllay Grande'),
(844, 83, 'Julcamarca'),
(845, 83, 'San Antonio de Antaparco'),
(846, 83, 'Santo Tomas de Pata'),
(847, 83, 'Secclla'),
(848, 84, 'Castrovirreyna'),
(849, 84, 'Arma'),
(850, 84, 'Aurahua'),
(851, 84, 'Capillas'),
(852, 84, 'Chupamarca'),
(853, 84, 'Cocas'),
(854, 84, 'Huachos'),
(855, 84, 'Huamatambo'),
(856, 84, 'Mollepampa'),
(857, 84, 'San Juan'),
(858, 84, 'Santa Ana'),
(859, 84, 'Tantara'),
(860, 84, 'Ticrapo'),
(861, 85, 'Churcampa'),
(862, 85, 'Anco'),
(863, 85, 'Chinchihuasi'),
(864, 85, 'El Carmen'),
(865, 85, 'La Merced'),
(866, 85, 'Locroja'),
(867, 85, 'Paucarbamba'),
(868, 85, 'San Miguel de Mayocc'),
(869, 85, 'San Pedro de Coris'),
(870, 85, 'Pachamarca'),
(871, 85, 'Cosme'),
(872, 86, 'Huaytara'),
(873, 86, 'Ayavi'),
(874, 86, 'Córdova'),
(875, 86, 'Huayacundo Arma'),
(876, 86, 'Laramarca'),
(877, 86, 'Ocoyo'),
(878, 86, 'Pilpichaca'),
(879, 86, 'Querco'),
(880, 86, 'Quito-Arma'),
(881, 86, 'San Antonio de Cusicancha'),
(882, 86, 'San Francisco de Sangayaico'),
(883, 86, 'San Isidro'),
(884, 86, 'Santiago de Chocorvos'),
(885, 86, 'Santiago de Quirahuara'),
(886, 86, 'Santo Domingo de Capillas'),
(887, 86, 'Tambo'),
(888, 87, 'Pampas'),
(889, 87, 'Acostambo'),
(890, 87, 'Acraquia'),
(891, 87, 'Ahuaycha'),
(892, 87, 'Colcabamba'),
(893, 87, 'Daniel Hernández'),
(894, 87, 'Huachocolpa'),
(895, 87, 'Huaribamba'),
(896, 87, 'Ñahuimpuquio'),
(897, 87, 'Pazos'),
(898, 87, 'Quishuar'),
(899, 87, 'Salcabamba'),
(900, 87, 'Salcahuasi'),
(901, 87, 'San Marcos de Rocchac'),
(902, 87, 'Surcubamba'),
(903, 87, 'Tintay Puncu'),
(904, 87, 'Quichuas'),
(905, 87, 'Andaymarca'),
(906, 87, 'Roble'),
(907, 87, 'Pichos'),
(908, 87, 'Santiago de Tucuma'),
(909, 88, 'Huanuco'),
(910, 88, 'Amarilis'),
(911, 88, 'Chinchao'),
(912, 88, 'Churubamba'),
(913, 88, 'Margos'),
(914, 88, 'Quisqui (Kichki)'),
(915, 88, 'San Francisco de Cayran'),
(916, 88, 'San Pedro de Chaulan'),
(917, 88, 'Santa María del Valle'),
(918, 88, 'Yarumayo'),
(919, 88, 'Pillco Marca'),
(920, 88, 'Yacus'),
(921, 88, 'San Pablo de Pillao'),
(922, 89, 'Ambo'),
(923, 89, 'Cayna'),
(924, 89, 'Colpas'),
(925, 89, 'Conchamarca'),
(926, 89, 'Huacar'),
(927, 89, 'San Francisco'),
(928, 89, 'San Rafael'),
(929, 89, 'Tomay Kichwa'),
(930, 90, 'La Unión'),
(931, 90, 'Chuquis'),
(932, 90, 'Marías'),
(933, 90, 'Pachas'),
(934, 90, 'Quivilla'),
(935, 90, 'Ripan'),
(936, 90, 'Shunqui'),
(937, 90, 'Sillapata'),
(938, 90, 'Yanas'),
(939, 91, 'Huacaybamba'),
(940, 91, 'Canchabamba'),
(941, 91, 'Cochabamba'),
(942, 91, 'Pinra'),
(943, 92, 'Llata'),
(944, 92, 'Arancay'),
(945, 92, 'Chavín de Pariarca'),
(946, 92, 'Jacas Grande'),
(947, 92, 'Jircan'),
(948, 92, 'Miraflores'),
(949, 92, 'Monzón'),
(950, 92, 'Punchao'),
(951, 92, 'Puños'),
(952, 92, 'Singa'),
(953, 92, 'Tantamayo'),
(954, 93, 'Rupa-Rupa'),
(955, 93, 'Daniel Alomía Robles'),
(956, 93, 'Hermílio Valdizan'),
(957, 93, 'José Crespo y Castillo'),
(958, 93, 'Luyando'),
(959, 93, 'Mariano Damaso Beraun'),
(960, 93, 'Pucayacu'),
(961, 93, 'Castillo Grande'),
(962, 93, 'Pueblo Nuevo'),
(963, 93, 'Santo Domingo de Anda'),
(964, 94, 'Huacrachuco'),
(965, 94, 'Cholon'),
(966, 94, 'San Buenaventura'),
(967, 94, 'La Morada'),
(968, 94, 'Santa Rosa de Alto Yanajanca'),
(969, 95, 'Panao'),
(970, 95, 'Chaglla'),
(971, 95, 'Molino'),
(972, 95, 'Umari'),
(973, 96, 'Puerto Inca'),
(974, 96, 'Codo del Pozuzo'),
(975, 96, 'Honoria'),
(976, 96, 'Tournavista'),
(977, 96, 'Yuyapichis'),
(978, 97, 'Jesús'),
(979, 97, 'Baños'),
(980, 97, 'Jivia'),
(981, 97, 'Queropalca'),
(982, 97, 'Rondos'),
(983, 97, 'San Francisco de Asís'),
(984, 97, 'San Miguel de Cauri'),
(985, 98, 'Chavinillo'),
(986, 98, 'Cahuac'),
(987, 98, 'Chacabamba'),
(988, 98, 'Aparicio Pomares'),
(989, 98, 'Jacas Chico'),
(990, 98, 'Obas'),
(991, 98, 'Pampamarca'),
(992, 98, 'Choras'),
(993, 99, 'Ica'),
(994, 99, 'La Tinguiña'),
(995, 99, 'Los Aquijes'),
(996, 99, 'Ocucaje'),
(997, 99, 'Pachacutec'),
(998, 99, 'Parcona'),
(999, 99, 'Pueblo Nuevo'),
(1000, 99, 'Salas'),
(1001, 99, 'San José de Los Molinos'),
(1002, 99, 'San Juan Bautista'),
(1003, 99, 'Santiago'),
(1004, 99, 'Subtanjalla'),
(1005, 99, 'Tate'),
(1006, 99, 'Yauca del Rosario'),
(1007, 100, 'Chincha Alta'),
(1008, 100, 'Alto Laran'),
(1009, 100, 'Chavin'),
(1010, 100, 'Chincha Baja'),
(1011, 100, 'El Carmen'),
(1012, 100, 'Grocio Prado'),
(1013, 100, 'Pueblo Nuevo'),
(1014, 100, 'San Juan de Yanac'),
(1015, 100, 'San Pedro de Huacarpana'),
(1016, 100, 'Sunampe'),
(1017, 100, 'Tambo de Mora'),
(1018, 101, 'Nasca'),
(1019, 101, 'Changuillo'),
(1020, 101, 'El Ingenio'),
(1021, 101, 'Marcona'),
(1022, 101, 'Vista Alegre'),
(1023, 102, 'Palpa'),
(1024, 102, 'Llipata'),
(1025, 102, 'Río Grande'),
(1026, 102, 'Santa Cruz'),
(1027, 102, 'Tibillo'),
(1028, 103, 'Pisco'),
(1029, 103, 'Huancano'),
(1030, 103, 'Humay'),
(1031, 103, 'Independencia'),
(1032, 103, 'Paracas'),
(1033, 103, 'San Andrés'),
(1034, 103, 'San Clemente'),
(1035, 103, 'Tupac Amaru Inca'),
(1036, 104, 'Huancayo'),
(1037, 104, 'Carhuacallanga'),
(1038, 104, 'Chacapampa'),
(1039, 104, 'Chicche'),
(1040, 104, 'Chilca'),
(1041, 104, 'Chongos Alto'),
(1042, 104, 'Chupuro'),
(1043, 104, 'Colca'),
(1044, 104, 'Cullhuas'),
(1045, 104, 'El Tambo'),
(1046, 104, 'Huacrapuquio'),
(1047, 104, 'Hualhuas'),
(1048, 104, 'Huancan'),
(1049, 104, 'Huasicancha'),
(1050, 104, 'Huayucachi'),
(1051, 104, 'Ingenio'),
(1052, 104, 'Pariahuanca'),
(1053, 104, 'Pilcomayo'),
(1054, 104, 'Pucara'),
(1055, 104, 'Quichuay'),
(1056, 104, 'Quilcas'),
(1057, 104, 'San Agustín'),
(1058, 104, 'San Jerónimo de Tunan'),
(1059, 104, 'Saño'),
(1060, 104, 'Sapallanga'),
(1061, 104, 'Sicaya'),
(1062, 104, 'Santo Domingo de Acobamba'),
(1063, 104, 'Viques'),
(1064, 105, 'Concepción'),
(1065, 105, 'Aco'),
(1066, 105, 'Andamarca'),
(1067, 105, 'Chambara'),
(1068, 105, 'Cochas'),
(1069, 105, 'Comas'),
(1070, 105, 'Heroínas Toledo'),
(1071, 105, 'Manzanares'),
(1072, 105, 'Mariscal Castilla'),
(1073, 105, 'Matahuasi'),
(1074, 105, 'Mito'),
(1075, 105, 'Nueve de Julio'),
(1076, 105, 'Orcotuna'),
(1077, 105, 'San José de Quero'),
(1078, 105, 'Santa Rosa de Ocopa'),
(1079, 106, 'Chanchamayo'),
(1080, 106, 'Perene'),
(1081, 106, 'Pichanaqui'),
(1082, 106, 'San Luis de Shuaro'),
(1083, 106, 'San Ramón'),
(1084, 106, 'Vitoc'),
(1085, 107, 'Jauja'),
(1086, 107, 'Acolla'),
(1087, 107, 'Apata'),
(1088, 107, 'Ataura'),
(1089, 107, 'Canchayllo'),
(1090, 107, 'Curicaca'),
(1091, 107, 'El Mantaro'),
(1092, 107, 'Huamali'),
(1093, 107, 'Huaripampa'),
(1094, 107, 'Huertas'),
(1095, 107, 'Janjaillo'),
(1096, 107, 'Julcán'),
(1097, 107, 'Leonor Ordóñez'),
(1098, 107, 'Llocllapampa'),
(1099, 107, 'Marco'),
(1100, 107, 'Masma'),
(1101, 107, 'Masma Chicche'),
(1102, 107, 'Molinos'),
(1103, 107, 'Monobamba'),
(1104, 107, 'Muqui'),
(1105, 107, 'Muquiyauyo'),
(1106, 107, 'Paca'),
(1107, 107, 'Paccha'),
(1108, 107, 'Pancan'),
(1109, 107, 'Parco'),
(1110, 107, 'Pomacancha'),
(1111, 107, 'Ricran'),
(1112, 107, 'San Lorenzo'),
(1113, 107, 'San Pedro de Chunan'),
(1114, 107, 'Sausa'),
(1115, 107, 'Sincos'),
(1116, 107, 'Tunan Marca'),
(1117, 107, 'Yauli'),
(1118, 107, 'Yauyos'),
(1119, 108, 'Junin'),
(1120, 108, 'Carhuamayo'),
(1121, 108, 'Ondores'),
(1122, 108, 'Ulcumayo'),
(1123, 109, 'Satipo'),
(1124, 109, 'Coviriali'),
(1125, 109, 'Llaylla'),
(1126, 109, 'Mazamari'),
(1127, 109, 'Pampa Hermosa'),
(1128, 109, 'Pangoa'),
(1129, 109, 'Río Negro'),
(1130, 109, 'Río Tambo'),
(1131, 109, 'Vizcatan del Ene'),
(1132, 110, 'Tarma'),
(1133, 110, 'Acobamba'),
(1134, 110, 'Huaricolca'),
(1135, 110, 'Huasahuasi'),
(1136, 110, 'La Unión'),
(1137, 110, 'Palca'),
(1138, 110, 'Palcamayo'),
(1139, 110, 'San Pedro de Cajas'),
(1140, 110, 'Tapo'),
(1141, 111, 'La Oroya'),
(1142, 111, 'Chacapalpa'),
(1143, 111, 'Huay-Huay'),
(1144, 111, 'Marcapomacocha'),
(1145, 111, 'Morococha'),
(1146, 111, 'Paccha'),
(1147, 111, 'Santa Bárbara de Carhuacayan'),
(1148, 111, 'Santa Rosa de Sacco'),
(1149, 111, 'Suitucancha'),
(1150, 111, 'Yauli'),
(1151, 112, 'Chupaca'),
(1152, 112, 'Ahuac'),
(1153, 112, 'Chongos Bajo'),
(1154, 112, 'Huachac'),
(1155, 112, 'Huamancaca Chico'),
(1156, 112, 'San Juan de Iscos'),
(1157, 112, 'San Juan de Jarpa'),
(1158, 112, 'Tres de Diciembre'),
(1159, 112, 'Yanacancha'),
(1160, 113, 'Trujillo'),
(1161, 113, 'El Porvenir'),
(1162, 113, 'Florencia de Mora'),
(1163, 113, 'Huanchaco'),
(1164, 113, 'La Esperanza'),
(1165, 113, 'Laredo'),
(1166, 113, 'Moche'),
(1167, 113, 'Poroto'),
(1168, 113, 'Salaverry'),
(1169, 113, 'Simbal'),
(1170, 113, 'Victor Larco Herrera'),
(1171, 114, 'Ascope'),
(1172, 114, 'Chicama'),
(1173, 114, 'Chocope'),
(1174, 114, 'Magdalena de Cao'),
(1175, 114, 'Paijan'),
(1176, 114, 'Rázuri'),
(1177, 114, 'Santiago de Cao'),
(1178, 114, 'Casa Grande'),
(1179, 115, 'Bolívar'),
(1180, 115, 'Bambamarca'),
(1181, 115, 'Condormarca'),
(1182, 115, 'Longotea'),
(1183, 115, 'Uchumarca'),
(1184, 115, 'Ucuncha'),
(1185, 116, 'Chepen'),
(1186, 116, 'Pacanga'),
(1187, 116, 'Pueblo Nuevo'),
(1188, 117, 'Julcan'),
(1189, 117, 'Calamarca'),
(1190, 117, 'Carabamba'),
(1191, 117, 'Huaso'),
(1192, 118, 'Otuzco'),
(1193, 118, 'Agallpampa'),
(1194, 118, 'Charat'),
(1195, 118, 'Huaranchal'),
(1196, 118, 'La Cuesta'),
(1197, 118, 'Mache'),
(1198, 118, 'Paranday'),
(1199, 118, 'Salpo'),
(1200, 118, 'Sinsicap'),
(1201, 118, 'Usquil'),
(1202, 119, 'San Pedro de Lloc'),
(1203, 119, 'Guadalupe'),
(1204, 119, 'Jequetepeque'),
(1205, 119, 'Pacasmayo'),
(1206, 119, 'San José'),
(1207, 120, 'Tayabamba'),
(1208, 120, 'Buldibuyo'),
(1209, 120, 'Chillia'),
(1210, 120, 'Huancaspata'),
(1211, 120, 'Huaylillas'),
(1212, 120, 'Huayo'),
(1213, 120, 'Ongon'),
(1214, 120, 'Parcoy'),
(1215, 120, 'Pataz'),
(1216, 120, 'Pias'),
(1217, 120, 'Santiago de Challas'),
(1218, 120, 'Taurija'),
(1219, 120, 'Urpay'),
(1220, 121, 'Huamachuco'),
(1221, 121, 'Chugay'),
(1222, 121, 'Cochorco'),
(1223, 121, 'Curgos'),
(1224, 121, 'Marcabal'),
(1225, 121, 'Sanagoran'),
(1226, 121, 'Sarin'),
(1227, 121, 'Sartimbamba'),
(1228, 122, 'Santiago de Chuco'),
(1229, 122, 'Angasmarca'),
(1230, 122, 'Cachicadan'),
(1231, 122, 'Mollebamba'),
(1232, 122, 'Mollepata'),
(1233, 122, 'Quiruvilca'),
(1234, 122, 'Santa Cruz de Chuca'),
(1235, 122, 'Sitabamba'),
(1236, 123, 'Cascas'),
(1237, 123, 'Lucma'),
(1238, 123, 'Marmot'),
(1239, 123, 'Sayapullo'),
(1240, 124, 'Viru'),
(1241, 124, 'Chao'),
(1242, 124, 'Guadalupito'),
(1243, 125, 'Chiclayo'),
(1244, 125, 'Chongoyape'),
(1245, 125, 'Eten'),
(1246, 125, 'Eten Puerto'),
(1247, 125, 'José Leonardo Ortiz'),
(1248, 125, 'La Victoria'),
(1249, 125, 'Lagunas'),
(1250, 125, 'Monsefu'),
(1251, 125, 'Nueva Arica'),
(1252, 125, 'Oyotun'),
(1253, 125, 'Picsi'),
(1254, 125, 'Pimentel'),
(1255, 125, 'Reque'),
(1256, 125, 'Santa Rosa'),
(1257, 125, 'Saña'),
(1258, 125, 'Cayalti'),
(1259, 125, 'Patapo'),
(1260, 125, 'Pomalca'),
(1261, 125, 'Pucala'),
(1262, 125, 'Tuman'),
(1263, 126, 'Ferreñafe'),
(1264, 126, 'Cañaris'),
(1265, 126, 'Incahuasi'),
(1266, 126, 'Manuel Antonio Mesones Muro'),
(1267, 126, 'Pitipo'),
(1268, 126, 'Pueblo Nuevo'),
(1269, 127, 'Lambayeque'),
(1270, 127, 'Chochope'),
(1271, 127, 'Illimo'),
(1272, 127, 'Jayanca'),
(1273, 127, 'Mochumi'),
(1274, 127, 'Morrope'),
(1275, 127, 'Motupe'),
(1276, 127, 'Olmos'),
(1277, 127, 'Pacora'),
(1278, 127, 'Salas'),
(1279, 127, 'San José'),
(1280, 127, 'Tucume'),
(1281, 128, 'Lima'),
(1282, 128, 'Ancón'),
(1283, 128, 'Ate'),
(1284, 128, 'Barranco'),
(1285, 128, 'Breña'),
(1286, 128, 'Carabayllo'),
(1287, 128, 'Chaclacayo'),
(1288, 128, 'Chorrillos'),
(1289, 128, 'Cieneguilla'),
(1290, 128, 'Comas'),
(1291, 128, 'El Agustino'),
(1292, 128, 'Independencia'),
(1293, 128, 'Jesús María'),
(1294, 128, 'La Molina'),
(1295, 128, 'La Victoria'),
(1296, 128, 'Lince'),
(1297, 128, 'Los Olivos'),
(1298, 128, 'Lurigancho'),
(1299, 128, 'Lurin'),
(1300, 128, 'Magdalena del Mar'),
(1301, 128, 'Pueblo Libre'),
(1302, 128, 'Miraflores'),
(1303, 128, 'Pachacamac'),
(1304, 128, 'Pucusana'),
(1305, 128, 'Puente Piedra'),
(1306, 128, 'Punta Hermosa'),
(1307, 128, 'Punta Negra'),
(1308, 128, 'Rímac'),
(1309, 128, 'San Bartolo'),
(1310, 128, 'San Borja'),
(1311, 128, 'San Isidro'),
(1312, 128, 'San Juan de Lurigancho'),
(1313, 128, 'San Juan de Miraflores'),
(1314, 128, 'San Luis'),
(1315, 128, 'San Martín de Porres'),
(1316, 128, 'San Miguel'),
(1317, 128, 'Santa Anita'),
(1318, 128, 'Santa María del Mar'),
(1319, 128, 'Santa Rosa'),
(1320, 128, 'Santiago de Surco'),
(1321, 128, 'Surquillo'),
(1322, 128, 'Villa El Salvador'),
(1323, 128, 'Villa María del Triunfo'),
(1324, 129, 'Barranca'),
(1325, 129, 'Paramonga'),
(1326, 129, 'Pativilca'),
(1327, 129, 'Supe'),
(1328, 129, 'Supe Puerto'),
(1329, 130, 'Cajatambo'),
(1330, 130, 'Copa'),
(1331, 130, 'Gorgor'),
(1332, 130, 'Huancapon'),
(1333, 130, 'Manas'),
(1334, 131, 'Canta'),
(1335, 131, 'Arahuay'),
(1336, 131, 'Huamantanga'),
(1337, 131, 'Huaros'),
(1338, 131, 'Lachaqui'),
(1339, 131, 'San Buenaventura'),
(1340, 131, 'Santa Rosa de Quives'),
(1341, 132, 'San Vicente de Cañete'),
(1342, 132, 'Asia'),
(1343, 132, 'Calango'),
(1344, 132, 'Cerro Azul'),
(1345, 132, 'Chilca'),
(1346, 132, 'Coayllo'),
(1347, 132, 'Imperial'),
(1348, 132, 'Lunahuana'),
(1349, 132, 'Mala'),
(1350, 132, 'Nuevo Imperial'),
(1351, 132, 'Pacaran'),
(1352, 132, 'Quilmana'),
(1353, 132, 'San Antonio'),
(1354, 132, 'San Luis'),
(1355, 132, 'Santa Cruz de Flores'),
(1356, 132, 'Zúñiga'),
(1357, 133, 'Huaral'),
(1358, 133, 'Atavillos Alto'),
(1359, 133, 'Atavillos Bajo'),
(1360, 133, 'Aucallama'),
(1361, 133, 'Chancay'),
(1362, 133, 'Ihuari'),
(1363, 133, 'Lampian'),
(1364, 133, 'Pacaraos'),
(1365, 133, 'San Miguel de Acos'),
(1366, 133, 'Santa Cruz de Andamarca'),
(1367, 133, 'Sumbilca'),
(1368, 133, 'Veintisiete de Noviembre'),
(1369, 134, 'Matucana'),
(1370, 134, 'Antioquia'),
(1371, 134, 'Callahuanca'),
(1372, 134, 'Carampoma'),
(1373, 134, 'Chicla'),
(1374, 134, 'Cuenca'),
(1375, 134, 'Huachupampa'),
(1376, 134, 'Huanza'),
(1377, 134, 'Huarochiri'),
(1378, 134, 'Lahuaytambo'),
(1379, 134, 'Langa'),
(1380, 134, 'Laraos'),
(1381, 134, 'Mariatana'),
(1382, 134, 'Ricardo Palma'),
(1383, 134, 'San Andrés de Tupicocha'),
(1384, 134, 'San Antonio'),
(1385, 134, 'San Bartolomé'),
(1386, 134, 'San Damian'),
(1387, 134, 'San Juan de Iris'),
(1388, 134, 'San Juan de Tantaranche'),
(1389, 134, 'San Lorenzo de Quinti'),
(1390, 134, 'San Mateo'),
(1391, 134, 'San Mateo de Otao'),
(1392, 134, 'San Pedro de Casta'),
(1393, 134, 'San Pedro de Huancayre'),
(1394, 134, 'Sangallaya'),
(1395, 134, 'Santa Cruz de Cocachacra'),
(1396, 134, 'Santa Eulalia'),
(1397, 134, 'Santiago de Anchucaya'),
(1398, 134, 'Santiago de Tuna'),
(1399, 134, 'Santo Domingo de Los Olleros'),
(1400, 134, 'Surco'),
(1401, 135, 'Huacho'),
(1402, 135, 'Ambar'),
(1403, 135, 'Caleta de Carquin'),
(1404, 135, 'Checras'),
(1405, 135, 'Hualmay'),
(1406, 135, 'Huaura'),
(1407, 135, 'Leoncio Prado'),
(1408, 135, 'Paccho'),
(1409, 135, 'Santa Leonor'),
(1410, 135, 'Santa María'),
(1411, 135, 'Sayan'),
(1412, 135, 'Vegueta'),
(1413, 136, 'Oyon'),
(1414, 136, 'Andajes'),
(1415, 136, 'Caujul'),
(1416, 136, 'Cochamarca'),
(1417, 136, 'Navan'),
(1418, 136, 'Pachangara'),
(1419, 137, 'Yauyos'),
(1420, 137, 'Alis'),
(1421, 137, 'Allauca'),
(1422, 137, 'Ayaviri'),
(1423, 137, 'Azángaro'),
(1424, 137, 'Cacra'),
(1425, 137, 'Carania'),
(1426, 137, 'Catahuasi'),
(1427, 137, 'Chocos'),
(1428, 137, 'Cochas'),
(1429, 137, 'Colonia'),
(1430, 137, 'Hongos'),
(1431, 137, 'Huampara'),
(1432, 137, 'Huancaya'),
(1433, 137, 'Huangascar'),
(1434, 137, 'Huantan'),
(1435, 137, 'Huañec'),
(1436, 137, 'Laraos'),
(1437, 137, 'Lincha'),
(1438, 137, 'Madean'),
(1439, 137, 'Miraflores'),
(1440, 137, 'Omas'),
(1441, 137, 'Putinza'),
(1442, 137, 'Quinches'),
(1443, 137, 'Quinocay'),
(1444, 137, 'San Joaquín'),
(1445, 137, 'San Pedro de Pilas'),
(1446, 137, 'Tanta'),
(1447, 137, 'Tauripampa'),
(1448, 137, 'Tomas'),
(1449, 137, 'Tupe'),
(1450, 137, 'Viñac'),
(1451, 137, 'Vitis'),
(1452, 138, 'Iquitos'),
(1453, 138, 'Alto Nanay'),
(1454, 138, 'Fernando Lores'),
(1455, 138, 'Indiana'),
(1456, 138, 'Las Amazonas'),
(1457, 138, 'Mazan'),
(1458, 138, 'Napo'),
(1459, 138, 'Punchana'),
(1460, 138, 'Torres Causana'),
(1461, 138, 'Belén'),
(1462, 138, 'San Juan Bautista'),
(1463, 139, 'Yurimaguas'),
(1464, 139, 'Balsapuerto'),
(1465, 139, 'Jeberos'),
(1466, 139, 'Lagunas'),
(1467, 139, 'Santa Cruz'),
(1468, 139, 'Teniente Cesar López Rojas'),
(1469, 140, 'Nauta'),
(1470, 140, 'Parinari'),
(1471, 140, 'Tigre'),
(1472, 140, 'Trompeteros'),
(1473, 140, 'Urarinas'),
(1474, 141, 'Ramón Castilla'),
(1475, 141, 'Pebas'),
(1476, 141, 'Yavari'),
(1477, 141, 'San Pablo'),
(1478, 142, 'Requena'),
(1479, 142, 'Alto Tapiche'),
(1480, 142, 'Capelo'),
(1481, 142, 'Emilio San Martín'),
(1482, 142, 'Maquia'),
(1483, 142, 'Puinahua'),
(1484, 142, 'Saquena'),
(1485, 142, 'Soplin'),
(1486, 142, 'Tapiche'),
(1487, 142, 'Jenaro Herrera'),
(1488, 142, 'Yaquerana'),
(1489, 143, 'Contamana'),
(1490, 143, 'Inahuaya'),
(1491, 143, 'Padre Márquez'),
(1492, 143, 'Pampa Hermosa'),
(1493, 143, 'Sarayacu'),
(1494, 143, 'Vargas Guerra'),
(1495, 144, 'Barranca'),
(1496, 144, 'Cahuapanas'),
(1497, 144, 'Manseriche'),
(1498, 144, 'Morona'),
(1499, 144, 'Pastaza'),
(1500, 144, 'Andoas'),
(1501, 145, 'Putumayo'),
(1502, 145, 'Rosa Panduro'),
(1503, 145, 'Teniente Manuel Clavero'),
(1504, 145, 'Yaguas'),
(1505, 146, 'Tambopata'),
(1506, 146, 'Inambari'),
(1507, 146, 'Las Piedras'),
(1508, 146, 'Laberinto'),
(1509, 147, 'Manu'),
(1510, 147, 'Fitzcarrald'),
(1511, 147, 'Madre de Dios'),
(1512, 147, 'Huepetuhe'),
(1513, 148, 'Iñapari'),
(1514, 148, 'Iberia'),
(1515, 148, 'Tahuamanu'),
(1516, 149, 'Moquegua'),
(1517, 149, 'Carumas'),
(1518, 149, 'Cuchumbaya'),
(1519, 149, 'Samegua'),
(1520, 149, 'San Cristóbal'),
(1521, 149, 'Torata'),
(1522, 150, 'Omate'),
(1523, 150, 'Chojata'),
(1524, 150, 'Coalaque'),
(1525, 150, 'Ichuña'),
(1526, 150, 'La Capilla'),
(1527, 150, 'Lloque'),
(1528, 150, 'Matalaque'),
(1529, 150, 'Puquina'),
(1530, 150, 'Quinistaquillas'),
(1531, 150, 'Ubinas'),
(1532, 150, 'Yunga'),
(1533, 151, 'Ilo'),
(1534, 151, 'El Algarrobal'),
(1535, 151, 'Pacocha'),
(1536, 152, 'Chaupimarca'),
(1537, 152, 'Huachon'),
(1538, 152, 'Huariaca'),
(1539, 152, 'Huayllay'),
(1540, 152, 'Ninacaca'),
(1541, 152, 'Pallanchacra'),
(1542, 152, 'Paucartambo'),
(1543, 152, 'San Francisco de Asís de Yarusyacan'),
(1544, 152, 'Simon Bolívar'),
(1545, 152, 'Ticlacayan'),
(1546, 152, 'Tinyahuarco'),
(1547, 152, 'Vicco'),
(1548, 152, 'Yanacancha'),
(1549, 153, 'Yanahuanca'),
(1550, 153, 'Chacayan'),
(1551, 153, 'Goyllarisquizga'),
(1552, 153, 'Paucar'),
(1553, 153, 'San Pedro de Pillao'),
(1554, 153, 'Santa Ana de Tusi'),
(1555, 153, 'Tapuc'),
(1556, 153, 'Vilcabamba'),
(1557, 154, 'Oxapampa'),
(1558, 154, 'Chontabamba'),
(1559, 154, 'Huancabamba'),
(1560, 154, 'Palcazu'),
(1561, 154, 'Pozuzo'),
(1562, 154, 'Puerto Bermúdez'),
(1563, 154, 'Villa Rica'),
(1564, 154, 'Constitución'),
(1565, 155, 'Piura'),
(1566, 155, 'Castilla'),
(1567, 155, 'Catacaos'),
(1568, 155, 'Cura Mori'),
(1569, 155, 'El Tallan'),
(1570, 155, 'La Arena'),
(1571, 155, 'La Unión'),
(1572, 155, 'Las Lomas'),
(1573, 155, 'Tambo Grande'),
(1574, 155, 'Veintiseis de Octubre'),
(1575, 156, 'Ayabaca'),
(1576, 156, 'Frias'),
(1577, 156, 'Jilili'),
(1578, 156, 'Lagunas'),
(1579, 156, 'Montero'),
(1580, 156, 'Pacaipampa'),
(1581, 156, 'Paimas'),
(1582, 156, 'Sapillica'),
(1583, 156, 'Sicchez'),
(1584, 156, 'Suyo'),
(1585, 157, 'Huancabamba'),
(1586, 157, 'Canchaque'),
(1587, 157, 'El Carmen de la Frontera'),
(1588, 157, 'Huarmaca'),
(1589, 157, 'Lalaquiz'),
(1590, 157, 'San Miguel de El Faique'),
(1591, 157, 'Sondor'),
(1592, 157, 'Sondorillo'),
(1593, 158, 'Chulucanas'),
(1594, 158, 'Buenos Aires'),
(1595, 158, 'Chalaco'),
(1596, 158, 'La Matanza'),
(1597, 158, 'Morropon'),
(1598, 158, 'Salitral'),
(1599, 158, 'San Juan de Bigote'),
(1600, 158, 'Santa Catalina de Mossa'),
(1601, 158, 'Santo Domingo'),
(1602, 158, 'Yamango'),
(1603, 159, 'Paita'),
(1604, 159, 'Amotape'),
(1605, 159, 'Arenal'),
(1606, 159, 'Colan'),
(1607, 159, 'La Huaca'),
(1608, 159, 'Tamarindo'),
(1609, 159, 'Vichayal'),
(1610, 160, 'Sullana'),
(1611, 160, 'Bellavista'),
(1612, 160, 'Ignacio Escudero'),
(1613, 160, 'Lancones'),
(1614, 160, 'Marcavelica'),
(1615, 160, 'Miguel Checa'),
(1616, 160, 'Querecotillo'),
(1617, 160, 'Salitral'),
(1618, 161, 'Pariñas'),
(1619, 161, 'El Alto'),
(1620, 161, 'La Brea'),
(1621, 161, 'Lobitos'),
(1622, 161, 'Los Organos'),
(1623, 161, 'Mancora'),
(1624, 162, 'Sechura'),
(1625, 162, 'Bellavista de la Unión'),
(1626, 162, 'Bernal'),
(1627, 162, 'Cristo Nos Valga'),
(1628, 162, 'Vice'),
(1629, 162, 'Rinconada Llicuar'),
(1630, 163, 'Puno'),
(1631, 163, 'Acora'),
(1632, 163, 'Amantani'),
(1633, 163, 'Atuncolla'),
(1634, 163, 'Capachica'),
(1635, 163, 'Chucuito'),
(1636, 163, 'Coata'),
(1637, 163, 'Huata'),
(1638, 163, 'Mañazo'),
(1639, 163, 'Paucarcolla'),
(1640, 163, 'Pichacani'),
(1641, 163, 'Plateria'),
(1642, 163, 'San Antonio'),
(1643, 163, 'Tiquillaca'),
(1644, 163, 'Vilque'),
(1645, 164, 'Azángaro'),
(1646, 164, 'Achaya'),
(1647, 164, 'Arapa'),
(1648, 164, 'Asillo'),
(1649, 164, 'Caminaca'),
(1650, 164, 'Chupa'),
(1651, 164, 'José Domingo Choquehuanca'),
(1652, 164, 'Muñani'),
(1653, 164, 'Potoni'),
(1654, 164, 'Saman'),
(1655, 164, 'San Anton'),
(1656, 164, 'San José'),
(1657, 164, 'San Juan de Salinas'),
(1658, 164, 'Santiago de Pupuja'),
(1659, 164, 'Tirapata'),
(1660, 165, 'Macusani'),
(1661, 165, 'Ajoyani'),
(1662, 165, 'Ayapata'),
(1663, 165, 'Coasa'),
(1664, 165, 'Corani'),
(1665, 165, 'Crucero'),
(1666, 165, 'Ituata'),
(1667, 165, 'Ollachea'),
(1668, 165, 'San Gaban'),
(1669, 165, 'Usicayos'),
(1670, 166, 'Juli'),
(1671, 166, 'Desaguadero'),
(1672, 166, 'Huacullani'),
(1673, 166, 'Kelluyo'),
(1674, 166, 'Pisacoma'),
(1675, 166, 'Pomata'),
(1676, 166, 'Zepita'),
(1677, 167, 'Ilave'),
(1678, 167, 'Capazo'),
(1679, 167, 'Pilcuyo'),
(1680, 167, 'Santa Rosa'),
(1681, 167, 'Conduriri'),
(1682, 168, 'Huancane'),
(1683, 168, 'Cojata'),
(1684, 168, 'Huatasani'),
(1685, 168, 'Inchupalla'),
(1686, 168, 'Pusi'),
(1687, 168, 'Rosaspata'),
(1688, 168, 'Taraco'),
(1689, 168, 'Vilque Chico'),
(1690, 169, 'Lampa'),
(1691, 169, 'Cabanilla'),
(1692, 169, 'Calapuja'),
(1693, 169, 'Nicasio'),
(1694, 169, 'Ocuviri'),
(1695, 169, 'Palca'),
(1696, 169, 'Paratia'),
(1697, 169, 'Pucara'),
(1698, 169, 'Santa Lucia'),
(1699, 169, 'Vilavila'),
(1700, 170, 'Ayaviri'),
(1701, 170, 'Antauta'),
(1702, 170, 'Cupi'),
(1703, 170, 'Llalli'),
(1704, 170, 'Macari'),
(1705, 170, 'Nuñoa'),
(1706, 170, 'Orurillo'),
(1707, 170, 'Santa Rosa'),
(1708, 170, 'Umachiri'),
(1709, 171, 'Moho'),
(1710, 171, 'Conima'),
(1711, 171, 'Huayrapata'),
(1712, 171, 'Tilali'),
(1713, 172, 'Putina'),
(1714, 172, 'Ananea'),
(1715, 172, 'Pedro Vilca Apaza'),
(1716, 172, 'Quilcapuncu'),
(1717, 172, 'Sina'),
(1718, 173, 'Juliaca'),
(1719, 173, 'Cabana'),
(1720, 173, 'Cabanillas'),
(1721, 173, 'Caracoto'),
(1722, 173, 'San Miguel'),
(1723, 174, 'Sandia'),
(1724, 174, 'Cuyocuyo'),
(1725, 174, 'Limbani'),
(1726, 174, 'Patambuco'),
(1727, 174, 'Phara'),
(1728, 174, 'Quiaca'),
(1729, 174, 'San Juan del Oro'),
(1730, 174, 'Yanahuaya'),
(1731, 174, 'Alto Inambari'),
(1732, 174, 'San Pedro de Putina Punco'),
(1733, 175, 'Yunguyo'),
(1734, 175, 'Anapia'),
(1735, 175, 'Copani'),
(1736, 175, 'Cuturapi'),
(1737, 175, 'Ollaraya'),
(1738, 175, 'Tinicachi'),
(1739, 175, 'Unicachi'),
(1740, 176, 'Moyobamba'),
(1741, 176, 'Calzada'),
(1742, 176, 'Habana'),
(1743, 176, 'Jepelacio'),
(1744, 176, 'Soritor'),
(1745, 176, 'Yantalo'),
(1746, 177, 'Bellavista'),
(1747, 177, 'Alto Biavo'),
(1748, 177, 'Bajo Biavo'),
(1749, 177, 'Huallaga'),
(1750, 177, 'San Pablo'),
(1751, 177, 'San Rafael'),
(1752, 178, 'San José de Sisa'),
(1753, 178, 'Agua Blanca'),
(1754, 178, 'San Martín'),
(1755, 178, 'Santa Rosa'),
(1756, 178, 'Shatoja'),
(1757, 179, 'Saposoa'),
(1758, 179, 'Alto Saposoa'),
(1759, 179, 'El Eslabón'),
(1760, 179, 'Piscoyacu'),
(1761, 179, 'Sacanche'),
(1762, 179, 'Tingo de Saposoa'),
(1763, 180, 'Lamas'),
(1764, 180, 'Alonso de Alvarado'),
(1765, 180, 'Barranquita'),
(1766, 180, 'Caynarachi'),
(1767, 180, 'Cuñumbuqui'),
(1768, 180, 'Pinto Recodo'),
(1769, 180, 'Rumisapa'),
(1770, 180, 'San Roque de Cumbaza'),
(1771, 180, 'Shanao'),
(1772, 180, 'Tabalosos'),
(1773, 180, 'Zapatero'),
(1774, 181, 'Juanjuí'),
(1775, 181, 'Campanilla'),
(1776, 181, 'Huicungo'),
(1777, 181, 'Pachiza'),
(1778, 181, 'Pajarillo'),
(1779, 182, 'Picota'),
(1780, 182, 'Buenos Aires'),
(1781, 182, 'Caspisapa'),
(1782, 182, 'Pilluana'),
(1783, 182, 'Pucacaca'),
(1784, 182, 'San Cristóbal'),
(1785, 182, 'San Hilarión'),
(1786, 182, 'Shamboyacu'),
(1787, 182, 'Tingo de Ponasa'),
(1788, 182, 'Tres Unidos'),
(1789, 183, 'Rioja'),
(1790, 183, 'Awajun'),
(1791, 183, 'Elías Soplin Vargas'),
(1792, 183, 'Nueva Cajamarca'),
(1793, 183, 'Pardo Miguel'),
(1794, 183, 'Posic'),
(1795, 183, 'San Fernando'),
(1796, 183, 'Yorongos'),
(1797, 183, 'Yuracyacu'),
(1798, 184, 'Tarapoto'),
(1799, 184, 'Alberto Leveau'),
(1800, 184, 'Cacatachi'),
(1801, 184, 'Chazuta'),
(1802, 184, 'Chipurana'),
(1803, 184, 'El Porvenir'),
(1804, 184, 'Huimbayoc'),
(1805, 184, 'Juan Guerra'),
(1806, 184, 'La Banda de Shilcayo'),
(1807, 184, 'Morales'),
(1808, 184, 'Papaplaya'),
(1809, 184, 'San Antonio'),
(1810, 184, 'Sauce'),
(1811, 184, 'Shapaja'),
(1812, 185, 'Tocache'),
(1813, 185, 'Nuevo Progreso'),
(1814, 185, 'Polvora'),
(1815, 185, 'Shunte'),
(1816, 185, 'Uchiza'),
(1817, 186, 'Tacna'),
(1818, 186, 'Alto de la Alianza'),
(1819, 186, 'Calana'),
(1820, 186, 'Ciudad Nueva'),
(1821, 186, 'Inclan'),
(1822, 186, 'Pachia'),
(1823, 186, 'Palca'),
(1824, 186, 'Pocollay'),
(1825, 186, 'Sama'),
(1826, 186, 'Coronel Gregorio Albarracín Lanchipa'),
(1827, 186, 'La Yarada los Palos'),
(1828, 187, 'Candarave'),
(1829, 187, 'Cairani'),
(1830, 187, 'Camilaca'),
(1831, 187, 'Curibaya'),
(1832, 187, 'Huanuara'),
(1833, 187, 'Quilahuani'),
(1834, 188, 'Locumba'),
(1835, 188, 'Ilabaya'),
(1836, 188, 'Ite'),
(1837, 189, 'Tarata'),
(1838, 189, 'Héroes Albarracín'),
(1839, 189, 'Estique'),
(1840, 189, 'Estique-Pampa'),
(1841, 189, 'Sitajara'),
(1842, 189, 'Susapaya'),
(1843, 189, 'Tarucachi'),
(1844, 189, 'Ticaco'),
(1845, 190, 'Tumbes'),
(1846, 190, 'Corrales'),
(1847, 190, 'La Cruz'),
(1848, 190, 'Pampas de Hospital'),
(1849, 190, 'San Jacinto'),
(1850, 190, 'San Juan de la Virgen'),
(1851, 191, 'Zorritos'),
(1852, 191, 'Casitas'),
(1853, 191, 'Canoas de Punta Sal'),
(1854, 192, 'Zarumilla'),
(1855, 192, 'Aguas Verdes'),
(1856, 192, 'Matapalo'),
(1857, 192, 'Papayal'),
(1858, 193, 'Calleria'),
(1859, 193, 'Campoverde'),
(1860, 193, 'Iparia'),
(1861, 193, 'Masisea'),
(1862, 193, 'Yarinacocha'),
(1863, 193, 'Nueva Requena'),
(1864, 193, 'Manantay'),
(1865, 194, 'Raymondi'),
(1866, 194, 'Sepahua'),
(1867, 194, 'Tahuania'),
(1868, 194, 'Yurua'),
(1869, 195, 'Padre Abad'),
(1870, 195, 'Irazola'),
(1871, 195, 'Curimana'),
(1872, 195, 'Neshuya'),
(1873, 195, 'Alexander Von Humboldt'),
(1874, 196, 'Purus');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idmarca`, `marca`) VALUES
(5, '3M'),
(12, 'Acindar'),
(20, 'Amanco'),
(2, 'APU'),
(4, 'Bticino'),
(17, 'Cifial'),
(13, 'Duratop'),
(14, 'Eternit'),
(18, 'FV'),
(24, 'Gris'),
(9, 'Helvex'),
(7, 'Humbold'),
(26, 'Jofel'),
(6, 'Kars'),
(3, 'Majestad'),
(22, 'Nibsa'),
(1, 'Pavco'),
(19, 'Rheem'),
(8, 'Roca'),
(21, 'Sigma'),
(15, 'Sodimac'),
(27, 'Tigre'),
(16, 'Tramontina'),
(11, 'Trébol'),
(23, 'Urrea'),
(10, 'Vainsa'),
(25, 'Vetrolux');

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

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`idmaterial`, `idmarca`, `material`, `idunidad_medida`, `precio_unitario`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'Tubo PVC 1\"', 1, 25.00, '2024-06-17', NULL, NULL),
(2, 1, 'Tubo PVC 2\"', 1, 35.00, '2024-06-17', NULL, NULL),
(3, 2, 'Bolsa de Cemento APU 50kg', 2, 26.00, '2024-06-17', NULL, NULL),
(4, 3, 'Gallón de Pintura Látex', 3, 65.00, '2024-06-17', NULL, NULL),
(5, 4, 'Interruptor simple', 1, 7.50, '2024-06-17', NULL, NULL),
(6, 5, 'Rollo de Cinta aislante', 1, 5.00, '2024-06-17', NULL, NULL),
(7, 6, 'Bomba de agua 1/2 Hp', 4, 159.90, '2024-06-17', NULL, NULL),
(8, 7, 'Tanque elevado 250 litros', 4, 390.00, '2024-06-17', NULL, NULL),
(9, 8, 'Puerta de madera maciza', 1, 1150.00, '2024-06-17', NULL, NULL),
(10, 9, 'Grifería monomando', 1, 180.00, '2024-06-17', NULL, NULL),
(11, 10, 'Inodoro con tapa', 1, 381.90, '2024-06-17', NULL, NULL),
(12, 11, 'Ladrillo 18 huecos', 5, 0.72, '2024-06-17', NULL, NULL),
(13, 12, 'Bolsa de Arena fina', 8, 94.40, '2024-06-17', NULL, NULL),
(14, 13, 'Metro cúbico de Piedra chancada', 9, 61.36, '2024-06-17', NULL, NULL),
(15, 14, 'Rollo de Alambre N° 16', 10, 6.50, '2024-06-17', NULL, NULL),
(16, 15, 'Disco para cortar fierro de 7\"', 11, 8.50, '2024-06-17', NULL, NULL),
(17, 16, 'Tubo desagüe 4\"', 12, 40.50, '2024-06-17', NULL, NULL),
(18, 17, 'Tubo agua 3/4\"', 13, 6.40, '2024-06-17', NULL, NULL),
(19, 18, 'Bolsa de Fragua para cerámica', 14, 9.60, '2024-06-17', NULL, NULL),
(20, 19, 'Hoja de Sierra para madera', 15, 7.00, '2024-06-17', NULL, NULL),
(21, 20, 'Paquete de Tornillos', 16, 6.50, '2024-06-17', NULL, NULL),
(22, 21, 'Paquete de Clavos 2\"', 16, 6.50, '2024-06-17', NULL, NULL),
(23, 22, 'Lámpara LED 9W', 17, 6.00, '2024-06-17', NULL, NULL),
(24, 23, 'Paquete de Focos LED', 18, 6.00, '2024-06-17', NULL, NULL),
(25, 24, 'Metro de Cable eléctrico N° 14', 19, 2.00, '2024-06-17', NULL, NULL),
(26, 25, 'Tapa ciega rectangular', 20, 1.00, '2024-06-17', NULL, NULL),
(27, 26, 'Lija esmeril asa N° 40', 21, 2.50, '2024-06-17', NULL, NULL),
(28, 27, 'Caja eléctrica octogonal', 22, 2.50, '2024-06-17', NULL, NULL),
(29, 1, 'Registro roscado de 4\"', 22, 13.00, '2024-06-17', NULL, NULL),
(30, 2, 'Sumidero de 2\"', 22, 5.00, '2024-06-17', NULL, NULL),
(31, 3, 'Tapa de desagüe roscada', 22, 5.00, '2024-06-17', NULL, NULL),
(32, 4, 'Metro de Tubería de agua PVC 1\"', 22, 28.50, '2024-06-17', NULL, NULL),
(33, 5, 'Tubo corrugado de 3 metros', 22, 1.40, '2024-06-17', NULL, NULL),
(34, 6, 'Lavabo ovalado', 22, 205.00, '2024-06-17', NULL, NULL),
(35, 7, 'Lavadero de cocina con accesorios', 22, 81.50, '2024-06-17', NULL, NULL),
(36, 8, 'Tubería de luz de 3/4\"', 22, 6.60, '2024-06-17', NULL, NULL),
(37, 9, 'Caja de empalme eléctrico', 22, 2.50, '2024-06-17', NULL, NULL),
(38, 10, 'Conector para cables eléctricos', 22, 2.40, '2024-06-17', NULL, NULL),
(39, 11, 'Enchufe doble', 22, 7.50, '2024-06-17', NULL, NULL),
(40, 12, 'Revestimiento cerámico 60x60', 22, 70.00, '2024-06-17', NULL, NULL),
(41, 13, 'Puertas contraplacadas pintadas', 22, 325.00, '2024-06-17', NULL, NULL),
(42, 14, 'Tubo de plástico 4\"', 22, 40.50, '2024-06-17', NULL, NULL);

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

--
-- Volcado de datos para la tabla `metricas`
--

INSERT INTO `metricas` (`idmetrica`, `idproyecto`, `l_vendidos`, `l_noVendidos`, `l_separados`, `update_at`) VALUES
(1, 1, 0, 0, 0, '2024-06-17 20:50:23'),
(2, 2, 0, 0, 0, '2024-06-17 21:05:15'),
(3, 3, 0, 0, 0, '2024-06-17 21:22:22'),
(4, 4, 1, 0, 0, '2024-06-28 18:23:12'),
(5, 5, 4, 1, 1, '2024-06-29 05:20:40');

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

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `idrol`, `modulo`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'LISTAR-activos', '2024-06-17', NULL, NULL),
(2, 1, 'EDITAR-CLIENTES', '2024-06-17', NULL, NULL),
(3, 1, 'CREAR-VENTAS', '2024-06-17', NULL, NULL),
(4, 1, 'ELIMINAR-PROYECTOS', '2024-06-17', NULL, NULL),
(5, 2, 'LISTAR-PROYECTOS', '2024-06-17', NULL, NULL),
(6, 2, 'EDITAR-activos', '2024-06-17', NULL, NULL),
(7, 2, 'CREAR-CLIENTES', '2024-06-17', NULL, NULL),
(8, 2, 'ELIMINAR-VENTAS', '2024-06-17', NULL, NULL),
(9, 3, 'LISTAR-CLIENTES', '2024-06-17', NULL, NULL),
(10, 3, 'EDITAR-VENTAS', '2024-06-17', NULL, NULL),
(11, 3, 'CREAR-activos', '2024-06-17', NULL, NULL),
(12, 3, 'ELIMINAR-PROYECTOS', '2024-06-17', NULL, NULL),
(13, 4, 'LISTAR-VENTAS', '2024-06-17', NULL, NULL),
(14, 4, 'EDITAR-PROYECTOS', '2024-06-17', NULL, NULL),
(15, 4, 'CREAR-CLIENTES', '2024-06-17', NULL, NULL),
(16, 4, 'ELIMINAR-activos', '2024-06-17', NULL, NULL),
(17, 5, 'LISTAR-PROYECTOS', '2024-06-17', NULL, NULL),
(18, 5, 'EDITAR-activos', '2024-06-17', NULL, NULL),
(19, 5, 'CREAR-VENTAS', '2024-06-17', NULL, NULL),
(20, 5, 'ELIMINAR-CLIENTES', '2024-06-17', NULL, NULL),
(21, 6, 'LISTAR-activos', '2024-06-17', NULL, NULL),
(22, 6, 'EDITAR-CLIENTES', '2024-06-17', NULL, NULL),
(23, 6, 'CREAR-VENTAS', '2024-06-17', NULL, NULL),
(24, 6, 'ELIMINAR-PROYECTOS', '2024-06-17', NULL, NULL);

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

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idpersona`, `nombres`, `apellidos`, `documento_tipo`, `documento_nro`, `estado_civil`, `iddistrito`, `direccion`, `nacionalidad`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'ISAIAS LATINEZ', 'BLAS GUEROVICH', 'DNI', '11122233', 'Casado', 107, 'AV LOS SAUCES', 'PERUANA', '2024-06-17', NULL, NULL),
(2, 'Juan Carlos', 'González Pérez', 'DNI', '11111111', 'Soltero', 1, 'Calle A 123', 'PERUANA', '2024-06-17', NULL, NULL),
(3, 'María José', 'Hernández López', 'DNI', '22222222', 'Casada', 2, 'Calle B 456', 'PERUANA', '2024-06-17', NULL, NULL),
(4, 'Pedro Luis', 'Díaz Martínez', 'DNI', '33333333', 'Divorciado', 3, 'Calle C 789', 'PERUANA', '2024-06-17', NULL, NULL),
(5, 'Ana Sofía', 'López Sánchez', 'DNI', '44444444', 'Soltera', 4, 'Calle D 012', 'PERUANA', '2024-06-17', NULL, NULL),
(6, 'José María', 'Martínez Gómez', 'DNI', '55555555', 'Viuda', 5, 'Calle E 345', 'PERUANA', '2024-06-17', NULL, NULL),
(7, 'Luisa Elena', 'Gómez Rodríguez', 'DNI', '66666666', 'Casado', 6, 'Calle F 678', 'PERUANA', '2024-06-17', NULL, NULL),
(8, 'Jorge Pablo', 'Rodríguez García', 'DNI', '77777777', 'Soltera', 7, 'Calle G 901', 'PERUANA', '2024-06-17', NULL, NULL),
(9, 'Carlos Antonio', 'Fernández Martín', 'DNI', '88888888', 'Casado', 8, 'Calle H 234', 'PERUANA', '2024-06-17', NULL, NULL),
(10, 'María Carmen', 'Sánchez López', 'DNI', '99999999', 'Soltera', 9, 'Calle I 567', 'PERUANA', '2024-06-17', NULL, NULL),
(11, 'Francisco Javier', 'Gómez Rodríguez', 'DNI', '10101010', 'Divorciado', 10, 'Calle J 890', 'PERUANA', '2024-06-17', NULL, NULL),
(12, 'Elena Isabel', 'Díaz García', 'DNI', '11111112', 'Casado', 11, 'Calle K 111', 'PERUANA', '2024-06-17', NULL, NULL),
(13, 'Pedro Luis', 'Martínez López', 'DNI', '12121212', 'Soltera', 12, 'Calle L 222', 'PERUANA', '2024-06-17', NULL, NULL),
(14, 'María Isabel', 'García Pérez', 'DNI', '13131313', 'Casado', 13, 'Calle M 333', 'PERUANA', '2024-06-17', NULL, NULL),
(15, 'Antonio José', 'Hernández Martín', 'DNI', '14141414', 'Soltera', 14, 'Calle N 444', 'PERUANA', '2024-06-17', NULL, NULL),
(16, 'Juan Carlos', 'Pérez García', 'DNI', '12345678', 'Soltero', 1007, 'Av. Primavera 123', 'PERUANA', '2024-06-17', NULL, NULL),
(17, 'María Luisa', 'Gómez Fernández', 'DNI', '23456789', 'Casada', 1007, 'Calle Flores 456', 'PERUANA', '2024-06-17', NULL, NULL),
(18, 'Pedro José', 'Ramírez Sánchez', 'DNI', '34567890', 'Soltero', 1007, 'Jr. Libertad 789', 'PERUANA', '2024-06-17', NULL, NULL),
(19, 'LUCAS ALFREDO', 'ATUNCAR VALERIO', 'DNI', '77068570', 'soltero', 1007, 'av snta rosa #541', 'peruana', '2024-06-19', NULL, NULL);

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

--
-- Volcado de datos para la tabla `personas_juridicas`
--

INSERT INTO `personas_juridicas` (`idpersona_juridica`, `razon_social`, `documento_tipo`, `documento_nro`, `iddistrito`, `direccion`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'SERVIC NAC DE ADIESTRAM EN TRABAJ INDUST', 'RUC', '20131376503', 1292, 'AV. ALFREDO MENDIOLA NRO. 3520, LIMA - LIMA - INDEPENDENCIA', '2024-06-19', NULL, NULL),
(2, '\" ESTUDIO CONTABLE O & RM S.A.C.\"', 'RUC', '20603049684', 1789, 'JR. JUAN SIMONS NRO. SN, SAN MARTIN - RIOJA - RIOJA', '2024-06-19', NULL, NULL),
(3, '\" SELVA INDUSTRIAS MELITA E.I.R.L. \"', 'RUC', '20542245671', 1789, 'JR. SAN MARTIN NRO. 821, SAN MARTIN - RIOJA - RIOJA', '2024-06-19', NULL, NULL),
(4, '\" IMPORTACIONES FVC EIRL \"', 'RUC', '20494100186', 1740, 'JR. CORONEL SECADA NRO. 281 URB. MOYOBAMBA, SAN MARTIN - MOYOBAMBA - M', '2024-06-20', NULL, NULL),
(5, '\" NEGOCIO Y ALOJAMIENTO QUINTA GUZMAN E.I.R.L. \"', 'RUC', '20542259117', 1740, 'JR. DAMIAN NAJAR NRO. 295, SAN MARTIN - MOYOBAMBA - MOYOBAMBA', '2024-06-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

CREATE TABLE `presupuestos` (
  `idpresupuesto` int(11) NOT NULL,
  `codigo` char(10) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `area_construccion` decimal(6,2) NOT NULL,
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `presupuestos`
--

INSERT INTO `presupuestos` (`idpresupuesto`, `codigo`, `modelo`, `area_construccion`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(12, 'PRES-00001', 'casa propia', 50.00, '2024-06-19', '2024-06-19', NULL, 1),
(13, 'PRES-00002', 'casa andina', 50.00, '2024-06-19', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `provincia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`idprovincia`, `iddepartamento`, `provincia`) VALUES
(1, 1, 'Chachapoyas'),
(2, 1, 'Bagua'),
(3, 1, 'Bongará'),
(4, 1, 'Condorcanqui'),
(5, 1, 'Luya'),
(6, 1, 'Rodríguez de Mendoza'),
(7, 1, 'Utcubamba'),
(8, 2, 'Huaraz'),
(9, 2, 'Aija'),
(10, 2, 'Antonio Raymondi'),
(11, 2, 'Asunción'),
(12, 2, 'Bolognesi'),
(13, 2, 'Carhuaz'),
(14, 2, 'Carlos Fermín Fitzcarrald'),
(15, 2, 'Casma'),
(16, 2, 'Corongo'),
(17, 2, 'Huari'),
(18, 2, 'Huarmey'),
(19, 2, 'Huaylas'),
(20, 2, 'Mariscal Luzuriaga'),
(21, 2, 'Ocros'),
(22, 2, 'Pallasca'),
(23, 2, 'Pomabamba'),
(24, 2, 'Recuay'),
(25, 2, 'Santa'),
(26, 2, 'Sihuas'),
(27, 2, 'Yungay'),
(28, 3, 'Abancay'),
(29, 3, 'Andahuaylas'),
(30, 3, 'Antabamba'),
(31, 3, 'Aymaraes'),
(32, 3, 'Cotabambas'),
(33, 3, 'Chincheros'),
(34, 3, 'Grau'),
(35, 4, 'Arequipa'),
(36, 4, 'Camaná'),
(37, 4, 'Caravelí'),
(38, 4, 'Castilla'),
(39, 4, 'Caylloma'),
(40, 4, 'Condesuyos'),
(41, 4, 'Islay'),
(42, 4, 'La Uniòn'),
(43, 5, 'Huamanga'),
(44, 5, 'Cangallo'),
(45, 5, 'Huanca Sancos'),
(46, 5, 'Huanta'),
(47, 5, 'La Mar'),
(48, 5, 'Lucanas'),
(49, 5, 'Parinacochas'),
(50, 5, 'Pàucar del Sara Sara'),
(51, 5, 'Sucre'),
(52, 5, 'Víctor Fajardo'),
(53, 5, 'Vilcas Huamán'),
(54, 6, 'Cajamarca'),
(55, 6, 'Cajabamba'),
(56, 6, 'Celendín'),
(57, 6, 'Chota'),
(58, 6, 'Contumazá'),
(59, 6, 'Cutervo'),
(60, 6, 'Hualgayoc'),
(61, 6, 'Jaén'),
(62, 6, 'San Ignacio'),
(63, 6, 'San Marcos'),
(64, 6, 'San Miguel'),
(65, 6, 'San Pablo'),
(66, 6, 'Santa Cruz'),
(67, 7, 'Prov. Const. del Callao'),
(68, 8, 'Cusco'),
(69, 8, 'Acomayo'),
(70, 8, 'Anta'),
(71, 8, 'Calca'),
(72, 8, 'Canas'),
(73, 8, 'Canchis'),
(74, 8, 'Chumbivilcas'),
(75, 8, 'Espinar'),
(76, 8, 'La Convención'),
(77, 8, 'Paruro'),
(78, 8, 'Paucartambo'),
(79, 8, 'Quispicanchi'),
(80, 8, 'Urubamba'),
(81, 9, 'Huancavelica'),
(82, 9, 'Acobamba'),
(83, 9, 'Angaraes'),
(84, 9, 'Castrovirreyna'),
(85, 9, 'Churcampa'),
(86, 9, 'Huaytará'),
(87, 9, 'Tayacaja'),
(88, 10, 'Huánuco'),
(89, 10, 'Ambo'),
(90, 10, 'Dos de Mayo'),
(91, 10, 'Huacaybamba'),
(92, 10, 'Huamalíes'),
(93, 10, 'Leoncio Prado'),
(94, 10, 'Marañón'),
(95, 10, 'Pachitea'),
(96, 10, 'Puerto Inca'),
(97, 10, 'Lauricocha '),
(98, 10, 'Yarowilca '),
(99, 11, 'Ica '),
(100, 11, 'Chincha '),
(101, 11, 'Nasca '),
(102, 11, 'Palpa '),
(103, 11, 'Pisco '),
(104, 12, 'Huancayo '),
(105, 12, 'Concepción '),
(106, 12, 'Chanchamayo '),
(107, 12, 'Jauja '),
(108, 12, 'Junín '),
(109, 12, 'Satipo '),
(110, 12, 'Tarma '),
(111, 12, 'Yauli '),
(112, 12, 'Chupaca '),
(113, 13, 'Trujillo '),
(114, 13, 'Ascope '),
(115, 13, 'Bolívar '),
(116, 13, 'Chepén '),
(117, 13, 'Julcán '),
(118, 13, 'Otuzco '),
(119, 13, 'Pacasmayo '),
(120, 13, 'Pataz '),
(121, 13, 'Sánchez Carrión '),
(122, 13, 'Santiago de Chuco '),
(123, 13, 'Gran Chimú '),
(124, 13, 'Virú '),
(125, 14, 'Chiclayo '),
(126, 14, 'Ferreñafe '),
(127, 14, 'Lambayeque '),
(128, 15, 'Lima '),
(129, 15, 'Barranca '),
(130, 15, 'Cajatambo '),
(131, 15, 'Canta '),
(132, 15, 'Cañete '),
(133, 15, 'Huaral '),
(134, 15, 'Huarochirí '),
(135, 15, 'Huaura '),
(136, 15, 'Oyón '),
(137, 15, 'Yauyos '),
(138, 16, 'Maynas '),
(139, 16, 'Alto Amazonas '),
(140, 16, 'Loreto '),
(141, 16, 'Mariscal Ramón Castilla '),
(142, 16, 'Requena '),
(143, 16, 'Ucayali '),
(144, 16, 'Datem del Marañón '),
(145, 16, 'Putumayo'),
(146, 17, 'Tambopata '),
(147, 17, 'Manu '),
(148, 17, 'Tahuamanu '),
(149, 18, 'Mariscal Nieto '),
(150, 18, 'General Sánchez Cerro '),
(151, 18, 'Ilo '),
(152, 19, 'Pasco '),
(153, 19, 'Daniel Alcides Carrión '),
(154, 19, 'Oxapampa '),
(155, 20, 'Piura '),
(156, 20, 'Ayabaca '),
(157, 20, 'Huancabamba '),
(158, 20, 'Morropón '),
(159, 20, 'Paita '),
(160, 20, 'Sullana '),
(161, 20, 'Talara '),
(162, 20, 'Sechura '),
(163, 21, 'Puno '),
(164, 21, 'Azángaro '),
(165, 21, 'Carabaya '),
(166, 21, 'Chucuito '),
(167, 21, 'El Collao '),
(168, 21, 'Huancané '),
(169, 21, 'Lampa '),
(170, 21, 'Melgar '),
(171, 21, 'Moho '),
(172, 21, 'San Antonio de Putina '),
(173, 21, 'San Román '),
(174, 21, 'Sandia '),
(175, 21, 'Yunguyo '),
(176, 22, 'Moyobamba '),
(177, 22, 'Bellavista '),
(178, 22, 'El Dorado '),
(179, 22, 'Huallaga '),
(180, 22, 'Lamas '),
(181, 22, 'Mariscal Cáceres '),
(182, 22, 'Picota '),
(183, 22, 'Rioja '),
(184, 22, 'San Martín '),
(185, 22, 'Tocache '),
(186, 23, 'Tacna '),
(187, 23, 'Candarave '),
(188, 23, 'Jorge Basadre '),
(189, 23, 'Tarata '),
(190, 24, 'Tumbes '),
(191, 24, 'Contralmirante Villar '),
(192, 24, 'Zarumilla '),
(193, 25, 'Coronel Portillo '),
(194, 25, 'Atalaya '),
(195, 25, 'Padre Abad '),
(196, 25, 'Purús');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `idproyecto` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
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
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`idproyecto`, `idsede`, `imagen`, `codigo`, `denominacion`, `latitud`, `longitud`, `iddistrito`, `direccion`, `referencia`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 1, 'e845353202ff0abafaa90c8dec67837d7125f02e.jpg', 'SAN BLAS', 'RESIDENCIAL SAN BLAS', NULL, NULL, 1007, 'AV SNA IDELFONSO #329', '', '2024-06-17', '2024-06-17', NULL, 1),
(2, 1, 'a8143ff0fbcfa21705f7cbffa478f0ead4b32956.jpg', 'SANTO DOMINGO', 'RESIDENCIAL SANTO DOMINGO', NULL, NULL, 1007, 'AV SNA IDELFONSO #316', '', '2024-06-17', NULL, NULL, 1),
(3, 3, '95f8af3c4ca566667f35309cfa4f3d79aa742ca0.jpg', 'KALEA PLAYA', 'RESIDENCIAL KALEA PLAYA', NULL, NULL, 1011, 'AV SNA IDELFONSO #390', '', '2024-06-17', '2024-06-17', NULL, 1),
(4, 1, '030e38e57dad28dbdd1904f172e26c97d557d826.jpg', 'KALEA CAMPO', 'RESIDENCIAL KALEA CAMPO', NULL, NULL, 1008, 'AV SNA IDELFONSO #395', '', '2024-06-17', '2024-06-17', NULL, 1),
(5, 1, '4a2e95caaef61799fdd1cafea371ca66321d4979.jpg', 'CENTENARIO', 'RESIDENCIAL CENTENARIO', NULL, NULL, 1012, 'AV SNA IDELFONSO #3500', '', '2024-06-17', '2024-06-17', NULL, 1);

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
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`idrepresentante`, `idpersona`, `cargo`, `partida_elect`, `idsede`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 1, 'GERENTE GENERAL', '0001', 1, '2024-06-17', NULL, NULL, 1);

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

--
-- Volcado de datos para la tabla `rep_legales_clientes`
--

INSERT INTO `rep_legales_clientes` (`idrepresentante`, `idpersona_juridica`, `representante_legal`, `documento_tipo`, `documento_nro`, `cargo`, `partida_elect`, `estado`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'OTOYA TERRONES FRANCISCO JAVIE', 'DNI', '07248131', 'GERENTE', '', 'HABILITADO', '2024-06-19', NULL, NULL),
(2, 1, 'ANGULO LEON RICARDO RUBEN', 'DNI', '07902859', 'GERENTE', '', 'HABILITADO', '2024-06-19', NULL, NULL),
(3, 1, 'ALVA GUSTAVSON GUSTAVO ADOLFO', 'DNI', '08720663', 'DIRECTOR GENERAL', '', 'HABILITADO', '2024-06-19', NULL, NULL),
(4, 1, 'BASUALDO HILARIO ARTURO FRANCI', 'DNI', '40772483', 'APODERADO', '', 'HABILITADO', '2024-06-19', NULL, NULL),
(5, 1, 'CAMOGLIANO PAZOS RAUL ERNESTO', 'DNI', '43318456', 'DIRECTOR', '', 'HABILITADO', '2024-06-19', NULL, NULL),
(6, 3, 'MELENDEZ SAAVEDRA ROSA ERMELA', 'DNI', '01046486', 'TITULAR-GERENTE', '', 'HABILITADO', '2024-06-19', NULL, NULL),
(7, 4, 'VERA CABRERA VICTOR FILIBERTO', 'DNI', '33782586', 'TITULAR-GERENTE', '', 'HABILITADO', '2024-06-20', NULL, NULL),
(8, 5, 'GUZMAN GUZMAN ANTONIA DE JESUS', 'DNI', '00800210', 'TITULAR-GERENTE', 'partida nro 4', 'HABILITADO', '2024-06-20', NULL, NULL),
(9, 2, 'PINEDO GOÑAS ORFA', 'DNI', '42679291', 'GERENTE GENERAL', 'partida nro 5', 'HABILITADO', '2024-06-20', NULL, NULL);

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

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `rol`, `estado`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'REPRESENTANTE DE VENTAS 1', '1', '2024-06-17', NULL, NULL),
(2, 'REPRESENTANTE DE VENTAS 2', '1', '2024-06-17', NULL, NULL),
(3, 'ADMINISTRADOR PRINCIPAL', '1', '2024-06-17', NULL, NULL),
(4, 'ADMINISTRADOR AASISTENTE', '1', '2024-06-17', NULL, NULL),
(5, 'ADMINISTRADOR SECUNDARIO', '1', '2024-06-17', NULL, NULL),
(6, 'VENDEDOR', '1', '2024-06-17', NULL, NULL);

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

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`idsede`, `idconstructora`, `iddistrito`, `direccion`, `referencia`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 1007, 'MZA. A LOTE. 06 URB. JULIO ARBOLEDA', 'A 1/2 CUADRA DE MAESTRO', '2024-06-17', NULL, NULL),
(2, 1, 1009, 'AV. LOS ALAMOS MZA. C LOTE. 25 URB. EL ROSAL', 'FRENTE AL PARQUE', '2024-06-17', NULL, NULL),
(3, 1, 1010, 'CALLE LOS GIRASOLES MZA. E LOTE. 10 URB. LAS MARGARITAS', 'A 200 METROS DE LA AVENIDA PRINCIPAL', '2024-06-17', NULL, NULL);

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
  `modalidad_pago` varchar(20) NOT NULL,
  `entidad_bancaria` varchar(30) DEFAULT NULL,
  `nro_operacion` char(10) DEFAULT NULL,
  `existe_contrato` bit(1) NOT NULL DEFAULT b'0',
  `create_at` date NOT NULL DEFAULT curdate(),
  `update_at` date DEFAULT NULL,
  `inactive_at` date DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `separaciones`
--

INSERT INTO `separaciones` (`idseparacion`, `n_expediente`, `idactivo`, `idcliente`, `idconyugue`, `tipo_cambio`, `moneda_venta`, `separacion_monto`, `fecha_pago`, `imagen`, `detalle`, `modalidad_pago`, `entidad_bancaria`, `nro_operacion`, `existe_contrato`, `create_at`, `update_at`, `inactive_at`, `idusuario`) VALUES
(1, 'SEPC-00004', 1, 1, NULL, 3.8200, 'SOL', 500.00, '2024-06-26', '54e1c995d861af82ace01d68bf599447e58bbe79.jpg', 'SEPARACION DEL LOTE EN BUEN ESTADO', 'EFECTIVO', '', '', b'1', '2024-06-26', '2024-06-27', NULL, 1),
(2, 'SEPC-00005', 2, 1, NULL, 3.8200, 'SOL', 600.00, '2024-06-27', 'd926fdf5f208901775425bbda3f93eea8363c896.jpg', 'DETALLES POR LA SEPARCION', 'TRANSFERENCIA', 'INTERBANCK', '0000000136', b'1', '2024-06-27', '2024-06-28', NULL, 1),
(3, 'SEPC-00006', 6, 6, NULL, 3.8300, 'USD', 600.00, '2024-06-28', '28757805ee0e52025b57c1553fa50efe77d5e6b3.jpg', 'separacion de lote', 'TRANSFERENCIA', 'INTERBANCK', '0000000365', b'1', '2024-06-28', '2024-06-28', NULL, 1),
(4, 'SEPC-00007', 7, 3, NULL, 3.8400, 'SOL', 600.00, '2024-06-29', '2367cdeb92298e8154826191191387a79b070e9c.jpg', 'QUIERO UN LOTE', 'TRANSFERENCIA', 'BCP', '0000000965', b'0', '2024-06-29', NULL, NULL, 1);

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
  `subcategoria_costo` varchar(100) NOT NULL,
  `requiere_material` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategoria_costos`
--

INSERT INTO `subcategoria_costos` (`idsubcategoria_costo`, `idcategoria_costo`, `subcategoria_costo`, `requiere_material`) VALUES
(1, 1, 'FERRETERIA', 'SI'),
(2, 1, 'ACCESORIOS', 'SI'),
(3, 1, 'LADRILLOS', 'SI'),
(4, 1, 'AGREGADOS', 'NO'),
(5, 1, 'ACCESORIOS DE LUZ', 'SI'),
(6, 1, 'ACCESORIOS DE BAÑO', 'SI'),
(7, 1, 'ACCESORIOS DE DESAGUE', 'SI'),
(8, 1, 'ACCESORIOS DE AGUA', 'SI'),
(9, 1, 'CERÁMICO', 'SI'),
(10, 1, 'ACABADOS EN SECOS', 'NO'),
(11, 1, 'MANO DE OBRA', 'NO'),
(12, 2, 'GASTOS FINANCIEROS', 'NO'),
(13, 2, 'COSTOS DE HABILITACION TERRENO - COSTOS DIRECTOS', 'NO'),
(14, 2, 'COSTO DE PROYECTO Y EJECUCION DE AGUA DESAGUE Y ELECTRICIDAD', 'NO'),
(15, 2, 'COSTOS ADMINISTRATIVOS DIRECTO', 'NO'),
(16, 2, 'IMPUESTOS', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `idunidad_medida` int(11) NOT NULL,
  `unidad_medida` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`idunidad_medida`, `unidad_medida`) VALUES
(21, 'barril'),
(16, 'centímetro'),
(15, 'docena'),
(19, 'galón'),
(13, 'juego'),
(2, 'kg'),
(18, 'libra'),
(6, 'litro'),
(20, 'litro por segundo'),
(5, 'metro'),
(9, 'metro cuadrado'),
(10, 'metro cúbico'),
(8, 'metro lineal'),
(17, 'milímetro'),
(3, 'ml'),
(14, 'paquete'),
(12, 'par'),
(11, 'pieza'),
(4, 'pz'),
(7, 'tonelada'),
(22, 'tonelada métrica'),
(1, 'unidad');

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

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `imagen`, `idpersona`, `correo`, `contrasenia`, `codigo`, `idrol`, `idsede`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, NULL, 3, 'juancarlos@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 1, 1, '2024-06-17', NULL, NULL),
(2, NULL, 4, 'mariajose@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 2, 1, '2024-06-17', NULL, NULL),
(3, NULL, 5, 'pedroluis@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 3, 1, '2024-06-17', NULL, NULL),
(4, NULL, 6, 'anasofia@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 4, 1, '2024-06-17', NULL, NULL),
(5, NULL, 7, 'josemaria@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 5, 1, '2024-06-17', NULL, NULL),
(6, NULL, 8, 'luisaelena@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 6, 1, '2024-06-17', NULL, NULL),
(7, NULL, 9, 'jorgepablo@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 6, 1, '2024-06-17', NULL, NULL),
(8, NULL, 10, 'carlosantonio@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 1, 2, '2024-06-17', NULL, NULL),
(9, NULL, 11, 'mariacarmen@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 2, 2, '2024-06-17', NULL, NULL),
(10, NULL, 12, 'franciscojavier@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 3, 2, '2024-06-17', NULL, NULL),
(11, NULL, 13, 'elenaisabel@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 4, 2, '2024-06-17', NULL, NULL),
(12, NULL, 14, 'pedroluis2@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 5, 2, '2024-06-17', NULL, NULL),
(13, NULL, 15, 'mariaisabel@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 6, 2, '2024-06-17', NULL, NULL),
(14, NULL, 16, 'antoniojose@gmail.com', '$2y$10$6LJpKa/E0MPdYF.z.xJRNu0kaqXDBLesKMUET4a6IsFUShOYJ8zwm', NULL, 6, 2, '2024-06-17', NULL, NULL);

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
-- Estructura Stand-in para la vista `vws_list_clients`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_clients` (
`idcliente` int(11)
,`tipo_persona` varchar(10)
,`cliente` varchar(82)
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`create_at` date
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
-- Estructura Stand-in para la vista `vws_list_contracts`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vws_list_contracts` (
`idcontrato` int(11)
,`n_expediente` varchar(10)
,`idcliente` int(11)
,`idconyugue` int(11)
,`tipo_persona` varchar(10)
,`sublote` tinyint(4)
,`cliente` varchar(82)
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`conyugue` varchar(82)
,`documento_tipo_cn` varchar(30)
,`documento_nro_cn` varchar(12)
,`precio_venta` decimal(8,2)
,`moneda_venta` varchar(10)
,`inicial` decimal(8,2)
,`tipo_cambio` decimal(4,3)
,`fecha_contrato` date
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
,`n_expediente` varchar(10)
,`expediente_contrato` varchar(10)
,`tipo_devolucion` varchar(20)
,`idcontrato` int(11)
,`idseparacion` int(11)
,`idcliente` int(11)
,`cliente` varchar(82)
,`documento_tipo` varchar(30)
,`documento_nro` varchar(12)
,`moneda_venta` varchar(10)
,`monto_devolucion` decimal(8,2)
,`create_at` date
,`inactive_at` date
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
,`nro_operacion` char(10)
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
,`fecha_pago` date
,`detalle` varchar(200)
,`modalidad_pago` varchar(20)
,`entidad_bancaria` varchar(30)
,`nro_operacion` char(10)
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
,`nro_operacion` char(10)
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
,`fecha_pago` date
,`detalle` varchar(200)
,`modalidad_pago` varchar(20)
,`entidad_bancaria` varchar(30)
,`nro_operacion` char(10)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_clientes_legal`  AS SELECT `cli`.`idcliente` AS `idcliente`, `cli`.`tipo_persona` AS `tipo_persona`, `persj`.`documento_tipo` AS `documento_tipo`, `persj`.`documento_nro` AS `documento_nro`, `persj`.`razon_social` AS `cliente` FROM ((`clientes` `cli` join `personas_juridicas` `persj` on(`persj`.`idpersona_juridica` = `cli`.`idpersona_juridica`)) join `rep_legales_clientes` `rep` on(`rep`.`idpersona_juridica` = `persj`.`idpersona_juridica`)) WHERE `cli`.`inactive_at` is null ;

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
-- Estructura para la vista `vws_list_clients`
--
DROP TABLE IF EXISTS `vws_list_clients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_clients`  AS SELECT `cl`.`idcliente` AS `idcliente`, `cl`.`tipo_persona` AS `tipo_persona`, coalesce(concat(ucase(`ps`.`apellidos`),', ',lcase(`ps`.`nombres`)),`pj`.`razon_social`) AS `cliente`, coalesce(`ps`.`documento_tipo`,`pj`.`documento_tipo`) AS `documento_tipo`, coalesce(`ps`.`documento_nro`,`pj`.`documento_nro`) AS `documento_nro`, `cl`.`create_at` AS `create_at` FROM ((`clientes` `cl` left join `personas_juridicas` `pj` on(`pj`.`idpersona_juridica` = `cl`.`idpersona_juridica`)) left join `personas` `ps` on(`ps`.`idpersona` = `cl`.`idpersona`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_companies`
--
DROP TABLE IF EXISTS `vws_list_companies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_companies`  AS SELECT `constructora`.`idconstructora` AS `idconstructora`, `constructora`.`ruc` AS `ruc`, `constructora`.`razon_social` AS `razon_social`, `constructora`.`partida_elect` AS `partida_elect` FROM `constructora` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_contracts`
--
DROP TABLE IF EXISTS `vws_list_contracts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_contracts`  AS SELECT `ct`.`idcontrato` AS `idcontrato`, `ct`.`n_expediente` AS `n_expediente`, `ct`.`idcliente` AS `idcliente`, `ct`.`idconyugue` AS `idconyugue`, `cl`.`tipo_persona` AS `tipo_persona`, `ac`.`sublote` AS `sublote`, coalesce(concat(ucase(`ps`.`apellidos`),', ',lcase(`ps`.`nombres`)),`pj`.`razon_social`) AS `cliente`, coalesce(`ps`.`documento_tipo`,`pj`.`documento_tipo`) AS `documento_tipo`, coalesce(`ps`.`documento_nro`,`pj`.`documento_nro`) AS `documento_nro`, concat(ucase(`psc`.`apellidos`),', ',lcase(`psc`.`nombres`)) AS `conyugue`, `psc`.`documento_tipo` AS `documento_tipo_cn`, `psc`.`documento_nro` AS `documento_nro_cn`, `ct`.`precio_venta` AS `precio_venta`, `ct`.`moneda_venta` AS `moneda_venta`, `ct`.`inicial` AS `inicial`, `ct`.`tipo_cambio` AS `tipo_cambio`, `ct`.`fecha_contrato` AS `fecha_contrato` FROM (((((((`contratos` `ct` left join `separaciones` `sp` on(`sp`.`idseparacion` = `ct`.`idseparacion`)) left join `clientes` `cl` on(`ct`.`idseparacion` is null and `cl`.`idcliente` = `ct`.`idcliente` or `ct`.`idseparacion` is not null and `cl`.`idcliente` = `sp`.`idcliente`)) left join `personas_juridicas` `pj` on(`pj`.`idpersona_juridica` = `cl`.`idpersona_juridica`)) left join `personas` `ps` on(`ps`.`idpersona` = `cl`.`idpersona`)) left join `clientes` `cn` on(`cn`.`idcliente` = `ct`.`idconyugue`)) left join `personas` `psc` on(`psc`.`idpersona` = `cn`.`idpersona`)) left join `activos` `ac` on(`ct`.`idactivo` is null and `ac`.`idactivo` = `sp`.`idactivo` or `ct`.`idactivo` is not null and `ac`.`idactivo` = `ct`.`idactivo`)) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_refunds`  AS SELECT `dv`.`iddevolucion` AS `iddevolucion`, `dv`.`n_expediente` AS `n_expediente`, `ct`.`n_expediente` AS `expediente_contrato`, `dv`.`tipo_devolucion` AS `tipo_devolucion`, `dv`.`idcontrato` AS `idcontrato`, `dv`.`idseparacion` AS `idseparacion`, coalesce(`ct`.`idcliente`,`lc`.`idcliente`) AS `idcliente`, coalesce(`ct`.`cliente`,`lc`.`cliente`) AS `cliente`, coalesce(`ct`.`documento_tipo`,`lc`.`documento_tipo`) AS `documento_tipo`, coalesce(`ct`.`documento_nro`,`lc`.`documento_nro`) AS `documento_nro`, `ct`.`moneda_venta` AS `moneda_venta`, `dv`.`monto_devolucion` AS `monto_devolucion`, `dv`.`create_at` AS `create_at`, `dv`.`inactive_at` AS `inactive_at` FROM ((((`devoluciones` `dv` left join `vws_list_contracts` `ct` on(`ct`.`idcontrato` = `dv`.`idcontrato`)) left join `separaciones` `sp` on(`sp`.`idseparacion` = `dv`.`idseparacion`)) join `clientes` `cl` on(`dv`.`idcontrato` is null and `cl`.`idcliente` = `sp`.`idcliente` or `dv`.`idseparacion` is null and `cl`.`idcliente` = `ct`.`idcliente`)) join `vws_list_clients` `lc` on(`lc`.`idcliente` = `cl`.`idcliente`)) ORDER BY `dv`.`iddevolucion` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_juridica`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_juridica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_juridica`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `proy`.`denominacion` AS `denominacion`, `persj`.`razon_social` AS `cliente`, `clien`.`tipo_persona` AS `tipo_persona`, `clien`.`inactive_at` AS `inactive_at_client`, `persj`.`documento_tipo` AS `documento_tipo`, `persj`.`documento_nro` AS `documento_nro`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`nro_operacion` AS `nro_operacion`, `sep`.`create_at` AS `create_at`, `sep`.`existe_contrato` AS `existe_contrato`, `sep`.`inactive_at` AS `inactive_at_sep`, `usupers`.`nombres` AS `usuario` FROM ((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas_juridicas` `persj` on(`persj`.`idpersona_juridica` = `clien`.`idpersona_juridica`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ORDER BY `sep`.`idseparacion` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_juridica_full`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_juridica_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_juridica_full`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `proy`.`idproyecto` AS `idproyecto`, `proy`.`idsede` AS `idsede`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `act`.`precio_venta` AS `precio_venta`, `proy`.`denominacion` AS `denominacion`, `dist`.`distrito` AS `distrito`, `sd`.`iddistrito` AS `iddistrito`, `prov`.`provincia` AS `provincia`, `dept`.`departamento` AS `departamento`, `clien`.`tipo_persona` AS `tipo_persona`, `sep`.`idcliente` AS `idcliente`, `persj`.`razon_social` AS `cliente`, `persj`.`documento_tipo` AS `documento_tipo`, `persj`.`documento_nro` AS `documento_nro`, `sep`.`moneda_venta` AS `moneda_venta`, `sep`.`tipo_cambio` AS `tipo_cambio`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`fecha_pago` AS `fecha_pago`, `sep`.`detalle` AS `detalle`, `sep`.`modalidad_pago` AS `modalidad_pago`, `sep`.`entidad_bancaria` AS `entidad_bancaria`, `sep`.`nro_operacion` AS `nro_operacion`, `sep`.`create_at` AS `create_at`, `sep`.`inactive_at` AS `inactive_at`, `sep`.`imagen` AS `imagen`, `sep`.`existe_contrato` AS `existe_contrato`, `usupers`.`nombres` AS `usuario` FROM ((((((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `sedes` `sd` on(`sd`.`idsede` = `proy`.`idsede`)) join `distritos` `dist` on(`dist`.`iddistrito` = `proy`.`iddistrito`)) join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas_juridicas` `persj` on(`persj`.`idpersona_juridica` = `clien`.`idpersona_juridica`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_natural`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_natural`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_natural`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `proy`.`denominacion` AS `denominacion`, concat(ucase(`pers`.`apellidos`),', ',lcase(`pers`.`nombres`)) AS `cliente`, `clien`.`tipo_persona` AS `tipo_persona`, `clien`.`inactive_at` AS `inactive_at_client`, `pers`.`documento_tipo` AS `documento_tipo`, `pers`.`documento_nro` AS `documento_nro`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`nro_operacion` AS `nro_operacion`, `sep`.`existe_contrato` AS `existe_contrato`, `sep`.`inactive_at` AS `inactive_at_sep`, `usupers`.`nombres` AS `usuario`, `sep`.`create_at` AS `create_at` FROM ((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas` `pers` on(`pers`.`idpersona` = `clien`.`idpersona`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ORDER BY `sep`.`idseparacion` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vws_list_separations_tpersona_natural_full`
--
DROP TABLE IF EXISTS `vws_list_separations_tpersona_natural_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vws_list_separations_tpersona_natural_full`  AS SELECT `sep`.`idseparacion` AS `idseparacion`, `sep`.`n_expediente` AS `n_expediente`, `proy`.`idsede` AS `idsede`, `proy`.`idproyecto` AS `idproyecto`, `act`.`idactivo` AS `idactivo`, `act`.`sublote` AS `sublote`, `act`.`precio_venta` AS `precio_venta`, `proy`.`denominacion` AS `denominacion`, `dist`.`distrito` AS `distrito`, `sd`.`iddistrito` AS `iddistrito`, `prov`.`provincia` AS `provincia`, `dept`.`departamento` AS `departamento`, `clien`.`tipo_persona` AS `tipo_persona`, `sep`.`idcliente` AS `idcliente`, concat(ucase(`pers`.`apellidos`),', ',lcase(`pers`.`nombres`)) AS `cliente`, `pers`.`documento_tipo` AS `documento_tipo`, `pers`.`documento_nro` AS `documento_nro`, `sep`.`idconyugue` AS `idconyugue`, concat(ucase(`conypers`.`apellidos`),', ',lcase(`conypers`.`nombres`)) AS `conyugue`, `conypers`.`documento_tipo` AS `conyPers_documento_tipo`, `conypers`.`documento_nro` AS `conyPers_documento_nro`, `sep`.`tipo_cambio` AS `tipo_cambio`, `sep`.`moneda_venta` AS `moneda_venta`, `sep`.`separacion_monto` AS `separacion_monto`, `sep`.`fecha_pago` AS `fecha_pago`, `sep`.`detalle` AS `detalle`, `sep`.`modalidad_pago` AS `modalidad_pago`, `sep`.`entidad_bancaria` AS `entidad_bancaria`, `sep`.`nro_operacion` AS `nro_operacion`, `sep`.`create_at` AS `create_at`, `sep`.`inactive_at` AS `inactive_at`, `sep`.`imagen` AS `imagen`, `sep`.`existe_contrato` AS `existe_contrato`, `usupers`.`nombres` AS `usuario` FROM ((((((((((((`separaciones` `sep` join `activos` `act` on(`act`.`idactivo` = `sep`.`idactivo`)) join `proyectos` `proy` on(`proy`.`idproyecto` = `act`.`idproyecto`)) join `distritos` `dist` on(`dist`.`iddistrito` = `proy`.`iddistrito`)) join `sedes` `sd` on(`sd`.`idsede` = `proy`.`idsede`)) join `provincias` `prov` on(`prov`.`idprovincia` = `dist`.`idprovincia`)) join `departamentos` `dept` on(`dept`.`iddepartamento` = `prov`.`iddepartamento`)) join `clientes` `clien` on(`clien`.`idcliente` = `sep`.`idcliente`)) join `personas` `pers` on(`pers`.`idpersona` = `clien`.`idpersona`)) left join `clientes` `cony` on(`cony`.`idcliente` = `sep`.`idconyugue`)) left join `personas` `conypers` on(`conypers`.`idpersona` = `cony`.`idpersona`)) join `usuarios` `usu` on(`usu`.`idusuario` = `sep`.`idusuario`)) join `personas` `usupers` on(`usupers`.`idpersona` = `usu`.`idpersona`)) ;

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
  ADD PRIMARY KEY (`idconfiguracion`),
  ADD UNIQUE KEY `uk_clave_config` (`clave`);

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
  ADD KEY `fk_idsede_rep` (`idsede`),
  ADD KEY `fk_idusuario_rep` (`idusuario`);

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
  MODIFY `idactivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `actualizaciones`
--
ALTER TABLE `actualizaciones`
  MODIFY `idactualizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_costos`
--
ALTER TABLE `categoria_costos`
  MODIFY `idcategoria_costo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `idconfiguracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `constructora`
--
ALTER TABLE `constructora`
  MODIFY `idconstructora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  MODIFY `idcuota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `detalles_contratos`
--
ALTER TABLE `detalles_contratos`
  MODIFY `iddetalle_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_costos`
--
ALTER TABLE `detalle_costos`
  MODIFY `iddetalle_costo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_cuotas`
--
ALTER TABLE `detalle_cuotas`
  MODIFY `iddetalle_cuota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `iddevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `iddistrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1875;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `idmaterial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `metricas`
--
ALTER TABLE `metricas`
  MODIFY `idmetrica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `personas_juridicas`
--
ALTER TABLE `personas_juridicas`
  MODIFY `idpersona_juridica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `idpresupuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rep_legales_clientes`
--
ALTER TABLE `rep_legales_clientes`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `idsede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `separaciones`
--
ALTER TABLE `separaciones`
  MODIFY `idseparacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategoria_costos`
--
ALTER TABLE `subcategoria_costos`
  MODIFY `idsubcategoria_costo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `idunidad_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  ADD CONSTRAINT `fk_idsede_rep` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`),
  ADD CONSTRAINT `fk_idusuario_rep` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

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
