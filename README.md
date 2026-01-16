## Hey 👋, I'm Carlos Hoyos

Hi there, I'm **Carlos Hoyos**, a **biomedical enginner and pasionate dev**.

I love programming and create.

### Talking about Personal Stuffs:

- 👨🏽‍💻 I’m currently a biomedical enginner and MSc student in management in digital transformation; 
- 🤔 My interests are IoT, management and a couple more.;
- 💼 At work i’m pursuing knowledge;
- 💬 Ask me about digital transformation and tech, I am happy to help;
- 📫 Please email me if you have any questions carlos.hoyos@raniot.tech.

### project 

## Endoscope Reprocessing IoT – PostgreSQL

### Languages and Tools:

![Git](https://img.shields.io/badge/Git-F05032?style=flat-square&logo=Git&logoColor=white)
![arduino](https://img.shields.io/badge/Arduino-3776AB?style=flat-square&logo=arduino&logoColor=white)
![C++](https://img.shields.io/badge/C++-F7DF1E?style=flat-square&logo=cplusplus&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual_Studio_Code-007ACC?style=flat-square&logo=Visual-Studio-Code&logoColor=white)

### Descripción general

Este repositorio contiene el diseño de una base de datos en PostgreSQL y la lógica en PL/pgSQL para gestionar el reprocesado de endoscopios en salas de reprocesamiento que complementa el repositorio https://github.com/carlhoro/PMV-IoT.

El objetivo principal del sistema es garantizar trazabilidad, control y auditabilidad de cada ciclo de reprocesado, asegurando que los procesos se realicen de forma consistente, segura y conforme a protocolos definidos.

El proyecto está diseñado como una base de datos autocontenida, donde las reglas críticas del negocio se aplican directamente a nivel del motor de base de datos.

### Objetivo del sistema

El sistema permite:
    Registrar eventos de reprocesado de endoscopios en tiempo real
    Identificar de forma inequívoca:
        el endoscopio reprocesado
        el personal responsable
        el equipo IoT utilizado
    Controlar que un endoscopio no tenga reprocesos simultáneos
    Asociar cada reproceso a un protocolo definido
    Mantener un historial completo para auditoría y análisis

Este enfoque es adecuado para entornos clínicos o técnicos donde la trazabilidad y la calidad del proceso son críticas.

Alcance del repositorio
Incluye
    Esquema relacional normalizado en PostgreSQL
    Claves foráneas, índices y restricciones de negocio
    Procedimientos almacenados para manejo del reprocesado
    Funciones auxiliares de validación
    Datos de ejemplo (seed) no productivos
    Estructura clara y reproducible

No incluye
    Código de aplicaciones (backend o frontend)
    Firmware o lógica del dispositivo IoT pero se puede usar este repo de mi autoria "https://github.com/carlhoro/PMV-IoT"
    Datos reales de pacientes o personal
    Integraciones externas

Estructura del repositorio
    /schema
    00_timezone.sql
    01_core_tables.sql
    02_relationships.sql
    03_indexes.sql
    04_constraints.sql

    /functions
    fn_is_endoscope_busy.sql

    /procedures
    pr_register_reprocess.sql

    /seeds
    seed_demo_data.sql

    README.md
    LICENSE

Principios de diseño de la base de datos

Este proyecto sigue un enfoque database-first, donde las reglas del negocio se refuerzan directamente en PostgreSQL.

Decisiones clave:
    Separación explícita entre:
        estructura (DDL)
        lógica (funciones y procedimientos)
        datos de ejemplo (seed)
    Uso de índices únicos parciales para evitar reprocesos simultáneos
    Uso de CHECK constraints para garantizar coherencia de datos
    Procedimientos almacenados como único punto de entrada para eventos IoT
    Funciones de solo lectura para validación y monitoreo
    Evitar lógica innecesaria en la capa de aplicación

Flujo conceptual de reprocesado

El dispositivo IoT identifica:
    el endoscopio (tag RFID)
    el empleado responsable
El IoT invoca un procedimiento en la base de datos
El sistema:
    inicia un reproceso si no existe uno activo
    finaliza el reproceso si ya estaba en curso
Las reglas de negocio se validan automáticamente
El evento queda registrado para trazabilidad y auditoría

Procedimiento principal
    pr_register_reprocess
        Este procedimiento es el núcleo del sistema.
        Si el endoscopio no tiene reproceso activo → inicia uno nuevo
        Si el endoscopio ya tiene reproceso activo → lo finaliza
        Nunca permite más de un reproceso activo por endoscopio

Funciones auxiliares
    fn_is_endoscope_busy
        Permite verificar si un endoscopio tiene un reproceso activo. Retorna: true → el endoscopio está en reproceso, false → el endoscopio está disponible

Índices y reglas de negocio

El sistema utiliza:
    Índice único parcial para garantizar un solo reproceso activo por endoscopio
    Índices para trazabilidad por:
        endoscopio
        empleado
        equipo IoT
        protocolo

    Restricciones CHECK para:
        estados válidos
        coherencia temporal
        rangos físicos de pH

Estas reglas protegen la integridad del sistema incluso ante errores de aplicación o concurrencia.

Ejecución recomendada

Orden sugerido de ejecución:
    /schema/00_timezone.sql
    /schema/01_core_tables.sql
    /schema/02_relationships.sql
    /schema/03_indexes.sql
    /schema/04_constraints.sql
    /functions/*.sql
    /procedures/*.sql
    /seeds/seed_demo_data.sql

Este proyecto se distribuye bajo la Licencia MIT.

### Contact me:

- Personal website: [![website](https://img.shields.io/badge/https://raniot.tech-3693F3?style=flat-square&logo=icloud&logoColor=white)](https://raniot.tech/)
- Email: [![Email](https://img.shields.io/badge/albert.abdilim@foxmail.com-D14836?style=flat-square&logo=gmail&logoColor=white)](mailto:albert.abdilim@foxmail.com)
