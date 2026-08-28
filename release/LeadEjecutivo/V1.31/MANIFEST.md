# LeadEjecutivo V1.31 — Executive Summary 360

Nueva iteración creada sobre la base V1.30 registrada en `main`.

## Rama
`feature/leadejecutivo-v1.31-executive-summary-grade-postgrad`

## Paquete candidato
`LeadEjecutivo_V1.31_NewExecutiveSummary.zip`

SHA-256: `2bbbe8c5dcd816dde3b939eea911d3a4ada2b047f236613dc0d76714fd126150`

## Nueva hoja
`Resumen Ejecutivo 360`

## Filtros por defecto
- Período académico: `B26`.
- Fecha inicio: `2026-05-01`.
- Fecha fin guardada en el candidato: `2026-08-28`.

## Tarjetas
- Leads efectivos.
- Inscritos.
- Matriculados.
- Meta.
- % Cumplimiento Leads / Meta.

## Secciones
### General
- Funnel: Captación → Gestión → Inscripción → Matriculación.
- Inscritos vs Matriculados en línea de tiempo del período seleccionado.
- Matriculados vs Meta por período académico.
- Inscritos y Matriculados por origen / canal.

### Grados
Mismas cuatro visualizaciones con medidas específicas de Grado.

### Posgrados
Mismas cuatro visualizaciones con medidas específicas de Posgrado.

## Notas de implementación
- Se mantienen Power Query, fuentes y relaciones existentes sin cambios.
- `Gestión` usa la métrica estable `Total Proyectados` del 615 como proxy operativo, ya que Salesforce no forma parte del modelo estable actual.
- Los gráficos categóricos priorizan orden descendente por la medida principal; las dimensiones temporales conservan orden cronológico.
- El paquete requiere validación de apertura y refresh en Power BI Desktop antes de mergear esta rama.
