# LeadEjecutivo V1.28.4 — Release validada

Release validada manualmente en Power BI Desktop el 2026-08-27: el panel abrió correctamente y actualizó datos.

## Rama
`release/leadejecutivo-v1.28-business-metrics`

## Paquete validado
`LeadEjecutivo_V1.28.4_TMDLIndentationClean.zip`

SHA-256: `c4a159976b82aa0ae2d6a3e3c5f37dbda14e2c7a1a15cdf95c97319c3b6c72f5`

## Estado final validado
- Apertura PBIP: OK.
- Refresh de datos: OK.
- 615 y 387 se mantienen como fuentes principales de negocio.
- Salesforce fue retirado de la carga en la variante estable para evitar dependencia y bloqueo de apertura.
- Funnel Journey se alimenta desde FactAdmision615.
- Tablas legacy/no usadas de Salesforce retiradas del modelo estable.
- Correcciones TMDL aplicadas en expressions.tmdl y FactAdmision615.tmdl.
- Barrido de indentación TMDL completado sin secuencias `\\t` literales.

## Decisión de release
GO para merge a `main`.

Esta versión pasa a ser el punto validado de continuidad para los siguientes ajustes del panel.