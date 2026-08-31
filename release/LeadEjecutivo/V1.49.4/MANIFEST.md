# LeadEjecutivo V1.49.4 — Validated Baseline

Versión promovida como nueva línea base de LeadEjecutivo.

## Rama de promoción
`baseline/leadejecutivo-v1.49.4-clean-validation`

## Paquete de trabajo
`LeadEjecutivo_V1.49.4_CleanValidationPage_NoTMDLChanges.zip`

SHA-256: `cff4ea1eca2d8c8121de025c8022c2330d480b7e6e689c623173b96f31360f47`

## Estado de baseline
- El usuario confirmó explícitamente que esta versión abre correctamente en Power BI Desktop.
- Se toma como nueva línea base funcional para el trabajo posterior.
- La hoja `Validación de Métricas` fue incorporada para revisar KPIs antes de continuar con visuales.
- La página usa únicamente medidas ya existentes en la línea V1.48.2.
- El modelo semántico TMDL se mantiene sin cambios respecto de V1.48.2 en esta versión de recuperación.
- Citas Efectivas provienen de Salesforce.
- Inscritos y Matriculados provienen de SGA/615.
- Meta proviene del archivo de avance, hoja `Meta`, usando `META TOTAL MENSUAL` como regla de negocio validada.
- Período académico continúa siendo el filtro mandatorio de análisis.
- No se eliminaron medidas en esta versión; la limpieza queda diferida hasta terminar la validación runtime de tarjetas.

## Nota de validación
Las versiones V1.49, V1.49.1, V1.49.2 y V1.49.3 presentaron errores TMDL durante el proceso de construcción y no deben usarse como línea base. V1.49.4 fue reconstruida desde V1.48.2 con cambios exclusivamente de reporte y fue confirmada por el usuario como funcional al abrir.
