-- Un endoscopio NO puede tener más de un reproceso activo
CREATE UNIQUE INDEX ux_reproceso_activo
ON reprocesos (endoscopio_uid)
WHERE estado = 'EN_PROCESO';

CREATE INDEX ix_reprocesos_estado
ON reprocesos (estado);

CREATE INDEX ix_reprocesos_endoscopio_fecha
ON reprocesos (endoscopio_uid, fecha_inicio DESC);

CREATE INDEX ix_reprocesos_empleado_fecha
ON reprocesos (empleado_uid, fecha_inicio DESC);

CREATE INDEX ix_reprocesos_equipo_iot
ON reprocesos (equipo_iot_serie);

CREATE INDEX ix_reprocesos_protocolo
ON reprocesos (protocolo_id);

CREATE INDEX ix_tags_endoscopios_institucion
ON tags_endoscopios (institucion_id);

CREATE INDEX ix_empleados_institucion
ON empleados (institucion_id);

CREATE INDEX ix_tags_empleados_equipo
ON tags_empleados (equipo_iot_serie);

