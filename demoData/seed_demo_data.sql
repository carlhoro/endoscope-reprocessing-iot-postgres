-- ===============================
-- Demo seed data (non-production)
-- ===============================

-- Cargos
INSERT INTO cargos (nombre, descripcion) VALUES
('Reprocesador', 'Staff responsible for manual endoscope reprocessing'),
('Director', 'Administrative director of the service'),
('Tecnico IoT', 'Technical staff responsible for IoT equipment');

-- Instituciones
INSERT INTO instituciones (
    razon_social, pais, departamento, municipio, direccion, telefono, correo, nit
) VALUES (
    'Demo Medical Center',
    'Colombia',
    'Antioquia',
    'Medellín',
    'Calle 00 #00-00',
    '000000000',
    'demo@medicalcenter.test',
    'NIT-DEMO-001'
);

-- Empleados
INSERT INTO empleados (
    nombre, correo, telefono, sexo, es_instructor, cargo_id, institucion_id
) VALUES
('Demo Reprocessor', 'reprocess@demo.test', '0000001', 'N/A', true, 1, 1),
('Demo Director', 'director@demo.test', '0000002', 'N/A', false, 2, 1);

-- Modelos IoT
INSERT INTO modelos_iot (nombre) VALUES
('IOT-MODEL-DEMO');

-- Equipos IoT
INSERT INTO equipos_iot (
    serie, modelo_id, institucion_id, instalado_por
) VALUES (
    'IOT-DEMO-001', 1, 1, 'Demo Technician'
);

-- Tags de empleados
INSERT INTO tags_empleados (
    uid, empleado_id, equipo_iot_serie
) VALUES (
    'EMP-TAG-001', 1, 'IOT-DEMO-001'
);

-- Tags de endoscopios
INSERT INTO tags_endoscopios (
    uid, institucion_id, equipo_iot_serie
) VALUES (
    'ENDO-TAG-001', 1, 'IOT-DEMO-001'
);

-- Protocolo demo
INSERT INTO protocolos (
    tiempo_enzimatico_min,
    tiempo_desinfectante_min,
    ph_enzimatico_min,
    ph_desinfectante_min,
    observaciones
) VALUES (
    7, 10, 6.5, 8.0, 'Demo reprocessing protocol'
);
