CREATE OR REPLACE FUNCTION fn_is_endoscope_busy (
    p_endoscopio_uid VARCHAR
)
RETURNS BOOLEAN
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1
        FROM reprocesos
        WHERE endoscopio_uid = p_endoscopio_uid
          AND estado = 'EN_PROCESO'
    );
END;
$$;
/*SELECT fn_is_endoscope_busy('da44e31e');*/
