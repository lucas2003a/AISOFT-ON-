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
            update_at = CURDATE()
		WHERE 
			idactivo = NEW.idactivo;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_asset_status_separation AFTER UPDATE ON separaciones
FOR EACH ROW
BEGIN
	
    UPDATE activos
		SET 
			estado = "SEPARADO"
		WHERE 
			idactivo = NEW.idactivo;
	
    IF NEW.inactive_at IS NOT NULL THEN
		UPDATE activos
			SET
				estado = "SIN VENDER"
			WHERE 
				idactivo = NEW.idactivo;
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
                update_at = CURDATE()
			WHERE 
				idactivo = _idactivo;
	ELSE
		UPDATE activos
			SET
				estado = "VENDIDO",
                update_at = CURDATE()
			WHERE 
				idactivo = NEW.idactivo;
	END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trgr_new_represent 
AFTER UPDATE ON representantes_legales_clientes
FOR EACH ROW
BEGIN
	DECLARE _idpersona_juridica INT;
    
    IF NEW.documento_nro != OLD.documento_nro THEN
		UPDATE clientes
				SET
					inactive_at = CURDATE()
				WHERE idpersona_juridica = NEW.idpersona_juridica;
		
        
		INSERT INTO personas_juridicas(
				razon_social,
				documento_tipo,                            
				documento_nro,
				iddistrito,
				direccion
			)						
				VALUES(
						NEW.razon_social,
						NEW.documento_tipo,                            
                        NEW.documento_nro,
                        NEW.iddistrito,
                        NEW.direccion
                        );
                        
		SET _idpersona_juridica = (SELECT @@last_insert_id);
        
        -- REGISTRO AL REPRESETANTE
        INSERT INTO representantes_legales_clientes
					(
						idpersona_juridica,
						representante_legal,
                        documento_tipo,
                        documento_nro,
						partida_elect,
                        cargo
					)
                    VALUES(
						NEW.idpersona_juridica,
						NEW.representante_legal,
						NEW.documento_t_representante,
						NEW.documento_nro_representante,
						NEW.partida_elect,
                        NEW.cargo
                    );

	-- registro a la persona como cliente
	INSERT INTO clientes(
						tipo_persona, 
                        idpersona_juridica,
                        idusuario
                        )
				VALUES
					(
						NEW.tipo_persona,
                        NEW.idpersona_juridica,
                        NEW.idusuario
                    );
    END IF;
END $$
DELIMITER ;