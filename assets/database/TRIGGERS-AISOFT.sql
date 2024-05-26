USE aisoft;

DELIMITER $$
CREATE TRIGGER trgr_add_project AFTER INSERT ON proyectos
FOR EACH ROW
BEGIN
	INSERT INTO metricas(idproyecto) VALUES(NEW.idproyecto);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_set_metrics AFTER INSERT ON	activos
FOR EACH ROW
BEGIN
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
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_setmetrics_update AFTER UPDATE ON activos
FOR EACH ROW
BEGIN
	
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
END $$
DELIMITER ;		

DELIMITER $$
CREATE TRIGGER trgr_asset_status_separation_insert AFTER INSERT ON separaciones
FOR EACH ROW
BEGIN
	UPDATE activos
		SET
			estado = "SEPARADO",
            update_at = CURDATE(),
			idusuario = NEW.idusuario
		WHERE 
			idactivo = NEW.idactivo;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_asset_status_separation AFTER UPDATE ON separaciones
FOR EACH ROW
BEGIN
	
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
    
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_asset_status_refund AFTER INSERT ON devoluciones
FOR EACH ROW
BEGIN
	DECLARE _idactivo INT;
	DECLARE _existContract TINYINT;

	SET _idactivo = (
		SELECT idactivo FROM separaciones
		WHERE idseparacion = NEW.idseparacion
	);

	SET _existContract = (
		SELECT EXISTS(SELECT idactivo FROM contratos
		WHERE idactivo = _idactivo
		AND inactive_at IS NULL)
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

	IF _existContract = 1 THEN
		UPDATE contratos
			SET
				inactive_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE
				idactivo = _idactivo;
	END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_new_asset_status_refund AFTER UPDATE ON devoluciones
FOR EACH ROW
BEGIN

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
END $$
DELIMITER ;

DELIMITER $$
CREATE  TRIGGER trgr_contracts_add AFTER INSERT ON contratos
FOR EACH ROW
BEGIN
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
	ELSE
		UPDATE activos
			SET
				estado = "VENDIDO",
                update_at = CURDATE(),
				idusuario = NEW.idusuario
			WHERE 
				idactivo = NEW.idactivo;
	END IF;
END $$
DELIMITER ;
