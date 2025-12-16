CREATE TABLE cargos (
    id_cargo        SERIAL PRIMARY KEY,
    nombre          VARCHAR(50) NOT NULL,
    descripcion     TEXT
);

CREATE TABLE instituciones (
    id_institucion  SERIAL PRIMARY KEY,
    razon_social    VARCHAR(150) NOT NULL,
    pais            VARCHAR(50),
    departamento    VARCHAR(50),
    municipio       VARCHAR(50),
    direccion       VARCHAR(150),
    telefono        VARCHAR(30),
    correo          VARCHAR(100),
    nit             VARCHAR(30),
    estado          VARCHAR(20) DEFAULT 'ACTIVA'
);

CREATE TABLE empleados (
    id_empleado     SERIAL PRIMARY KEY,
    nombre          VARCHAR(120) NOT NULL,
    correo          VARCHAR(100),
    telefono        VARCHAR(30),
    sexo            VARCHAR(15),
    fecha_ingreso   DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_retiro    DATE,
    es_instructor   BOOLEAN DEFAULT FALSE,
    cargo_id        INT NOT NULL,
    institucion_id  INT NOT NULL
);

CREATE TABLE modelos_iot (
    id_modelo       SERIAL PRIMARY KEY,
    nombre          VARCHAR(50) NOT NULL,
    fecha_creacion  DATE DEFAULT CURRENT_DATE
);

CREATE TABLE equipos_iot (
    serie               VARCHAR(50) PRIMARY KEY,
    modelo_id           INT NOT NULL,
    institucion_id      INT NOT NULL,
    fecha_fabricacion   DATE,
    instalado_por       VARCHAR(120)
);

CREATE TABLE tags_endoscopios (
    uid                 VARCHAR(20) PRIMARY KEY,
    institucion_id      INT NOT NULL,
    equipo_iot_serie    VARCHAR(50)
);

CREATE TABLE tags_empleados (
    uid                 VARCHAR(20) PRIMARY KEY,
    empleado_id         INT NOT NULL,
    equipo_iot_serie    VARCHAR(50)
);

CREATE TABLE protocolos (
    id_protocolo                SERIAL PRIMARY KEY,
    tiempo_enzimatico_min       INT NOT NULL,
    tiempo_desinfectante_min    INT NOT NULL,
    ph_enzimatico_min           NUMERIC(4,2),
    ph_desinfectante_min        NUMERIC(4,2),
    observaciones               TEXT
);

CREATE TABLE reprocesos (
    id_reproceso        SERIAL PRIMARY KEY,
    endoscopio_uid      VARCHAR(20) NOT NULL,
    empleado_uid        VARCHAR(20) NOT NULL,
    equipo_iot_serie    VARCHAR(50) NOT NULL,
    protocolo_id        INT NOT NULL,
    fecha_inicio        TIMESTAMP NOT NULL,
    fecha_fin           TIMESTAMP,
    ph_enzimatico       NUMERIC(4,2),
    ph_desinfectante   NUMERIC(4,2),
    estado              VARCHAR(20) NOT NULL DEFAULT 'EN_PROCESO',
    observaciones       TEXT
);