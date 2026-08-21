# Plan de migración PBIX → PBIP

## Objetivo técnico

Convertir `pnl_Leads_MKT.pbix` en una solución donde reporte y modelo semántico sean archivos de texto versionables:

```text
src/
├── pnl_Leads_MKT.pbip
├── pnl_Leads_MKT.Report/
│   ├── definition.pbir
│   ├── definition/
│   ├── StaticResources/
│   └── semanticModelDiagramLayout.json
└── pnl_Leads_MKT.SemanticModel/
    ├── definition.pbism
    └── definition/
        ├── database.tmdl
        ├── model.tmdl
        ├── relationships.tmdl
        ├── expressions.tmdl
        └── tables/
```

La estructura exacta del SemanticModel puede variar según la versión de Power BI Desktop.

## Fase 0 — Respaldo

1. Mantener una copia intacta del PBIX original fuera de la fuente de verdad Git.
2. No modificar el PBIX original durante la migración.
3. Trabajar sobre una copia local.

## Fase 1 — Extraer PBIR ya disponible

El PBIX actual ya incluye `Report/definition/` en PBIR.

Se incluye `tools/extract_pbir_from_pbix.py` para extraer:

- definición del reporte;
- páginas;
- visuales;
- tema;
- layout del modelo;
- `definition.pbir`;
- archivo `.pbip` inicial.

Ejemplo:

```powershell
python .\tools\extract_pbir_from_pbix.py `
  "C:\Users\ChristianYepez\OneDrive - Universidad Tecnologica Indoamerica\Documents\Universidad Indoamerica Doc\Paneles\pnl_Leads_MKT.pbix" `
  --output .\src `
  --name pnl_Leads_MKT
```

Esta fase NO convierte el `DataModel` binario a TMDL.

## Fase 2 — Generar el modelo semántico TMDL

Ruta recomendada y verificable:

1. Abrir una copia de `pnl_Leads_MKT.pbix` en una versión actual de Power BI Desktop.
2. Verificar que la opción de proyecto Power BI/PBIP esté disponible/habilitada.
3. Usar **Guardar como / Power BI Project (.pbip)**.
4. Guardar temporalmente en una carpeta aparte, por ejemplo `migration-output`.
5. Validar que se generó la carpeta `pnl_Leads_MKT.SemanticModel` con definición TMDL.
6. Comparar el `Report/definition` generado por Desktop con el PBIR extraído del PBIX.
7. Copiar al repositorio únicamente los archivos fuente necesarios.
8. Abrir el `.pbip` desde el repositorio y validar que carga modelo y reporte sin errores.

## Fase 3 — Baseline técnico

Antes de rediseñar:

- inventariar tablas;
- inventariar columnas;
- inventariar medidas;
- inventariar relaciones y cardinalidades;
- documentar fuentes y expresiones Power Query/M;
- identificar parámetros;
- identificar columnas calculadas;
- revisar Date Auto/Time;
- identificar campos ocultos;
- identificar RLS;
- ejecutar validaciones básicas del modelo.

Resultado esperado: commit `baseline/pbip` que reproduzca funcionalmente el PBIX original.

## Fase 4 — Refactor del modelo

Orden recomendado:

1. Tabla calendario explícita.
2. Medidas base explícitas en lugar de agregaciones implícitas.
3. Tabla dedicada de medidas si conviene.
4. Convenciones de nombres.
5. Revisar relaciones ambiguas/bidireccionales.
6. Separar hechos y dimensiones analíticas.
7. Incorporar historial de estados y oportunidades.
8. Crear medidas de funnel y tiempos.
9. Optimizar cardinalidad y columnas no utilizadas.

## Fase 5 — Rediseño del reporte

Implementar por páginas y mediante ramas pequeñas:

- Executive Overview
- Funnel & Conversion
- Acquisition
- Academic Demand
- Lead Behavior
- Loss Analysis
- Operations / SLA
- Lead Explorer

## Estrategia Git

Ramas sugeridas:

```text
main
feature/pbip-foundation
feature/semantic-model-baseline
feature/dim-date
feature/core-measures
feature/funnel
feature/acquisition
feature/lead-behavior
feature/loss-analysis
feature/operations-sla
```

Cada cambio debe poder revisarse por diff en PBIR/TMDL antes de fusionarse.

## Regla de oro

No modificar a la vez modelo, reglas de negocio y diseño visual en un commit grande. Separar cambios de:

1. modelo;
2. DAX;
3. visualización;
4. formato/tema;
5. documentación.

Esto hace los PR revisables y permite revertir cambios sin reconstruir el PBIX completo.
