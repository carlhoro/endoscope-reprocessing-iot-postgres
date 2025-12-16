CREATE OR REPLACE PROCEDURE pr_register_reprocess (
    IN p_endoscopio_uid     VARCHAR,
    IN p_empleado_uid       VARCHAR,
    IN p_equipo_iot_serie   VARCHAR,
    IN p_protocolo_id       INT,
    IN p_ph_enzimatico      NUMERIC(4,2),
    IN p_ph_desinfectante  NUMERIC(4,2),
    IN p_observaciones      TEXT DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_reproceso_activo_id INT;
BEGIN
    -- Buscar reproceso activo para el endoscopio
    SELECT id_reproceso
    INTO v_reproceso_activo_id
    FROM reprocesos
    WHERE endoscopio_uid = p_endoscopio_uid
      AND estado = 'EN_PROCESO'
    FOR UPDATE;

    -- Si existe reproceso activo, se finaliza
    IF v_reproceso_activo_id IS NOT NULL THEN
        UPDATE reprocesos
        SET fecha_fin = NOW(),
            ph_enzimatico = p_ph_enzimatico,
            ph_desinfectante = p_ph_desinfectante,
            estado = 'FINALIZADO',
            observaciones = p_observaciones
        WHERE id_reproceso = v_reproceso_activo_id;

    -- Si no existe, se crea un nuevo reproceso
    ELSE
        INSERT INTO reprocesos (
            endoscopio_uid,
            empleado_uid,
            equipo_iot_serie,
            protocolo_id,
            fecha_inicio,
            estado,
            observaciones
        ) VALUES (
            p_endoscopio_uid,
            p_empleado_uid,
            p_equipo_iot_serie,
            p_protocolo_id,
            NOW(),
            'EN_PROCESO',
            p_observaciones
        );
    END IF;

EXCEPTION
    WHEN foreign_key_violation THEN
        RAISE EXCEPTION
            'Invalid reference: check endoscope tag, employee tag, IoT device or protocol';
    WHEN OTHERS THEN
        RAISE EXCEPTION
            'Unexpected error while registering reprocessing event';
END;
$$;
/*
CALL pr_register_reprocess(
    'da44e31e',
    '06845754',
    'IOT-001',
    1,
    7.20,
    8.10,
    'Proceso normal'
);
*/