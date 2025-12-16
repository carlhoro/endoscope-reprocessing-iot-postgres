ALTER TABLE reprocesos
ADD CONSTRAINT chk_reproceso_estado
CHECK (estado IN ('EN_PROCESO', 'FINALIZADO', 'CANCELADO'));

ALTER TABLE reprocesos
ADD CONSTRAINT chk_reproceso_fechas
CHECK (
    fecha_fin IS NULL OR fecha_fin >= fecha_inicio
);

ALTER TABLE reprocesos
ADD CONSTRAINT chk_ph_enzimatico
CHECK (
    ph_enzimatico IS NULL OR (ph_enzimatico BETWEEN 0 AND 14)
);

ALTER TABLE reprocesos
ADD CONSTRAINT chk_ph_desinfectante
CHECK (
    ph_desinfectante IS NULL OR (ph_desinfectante BETWEEN 0 AND 14)
);

ALTER TABLE protocolos
ADD CONSTRAINT chk_tiempos_protocolo
CHECK (
    tiempo_enzimatico_min > 0 AND tiempo_desinfectante_min > 0
);

ALTER TABLE reprocesos
ADD CONSTRAINT chk_estado_vs_fecha_fin
CHECK (
    (estado = 'EN_PROCESO' AND fecha_fin IS NULL) OR (estado <> 'EN_PROCESO' AND fecha_fin IS NOT NULL)
);


