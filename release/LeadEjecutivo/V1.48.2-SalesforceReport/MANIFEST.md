# LeadEjecutivo V1.48.2 — Salesforce Report Baseline

Nueva línea base solicitada para el trabajo de validación de métricas del Resumen Ejecutivo 360.

## Rama de baseline
`baseline/leadejecutivo-v1.48.2-salesforce-report`

## Paquete de trabajo
`LeadEjecutivo_V1.48.2_TreatasAndEmptyMonthsFix(1).zip`

## Decisión de baseline
- Este paquete adjunto se toma como línea base para las siguientes iteraciones.
- No se deben reutilizar como base versiones posteriores generadas durante las pruebas de sliders/metas si no son explícitamente promovidas.
- Antes de volver a modificar visuales, se validarán primero las métricas de tarjetas: valor, fuente y cálculo.

## Regla mandatoria de período
- `DimPeriodo[Periodo]` es el criterio principal del panel.
- Regla A: 01-Nov del año anterior hasta 30-Abr del año del período.
- Regla B: 01-May hasta 31-Oct del año del período.
- Los filtros de fecha son subfiltros dentro del/los períodos seleccionados.

## Métricas validadas
### SGA / 615
- Inscritos: fuente SGA/615, universo del período seleccionado y reglas de negocio vigentes.
- Matriculados: fuente SGA/615.
- Filtros de negocio del 615: Homologacion = NO, Carrera <> FORMACION CONTINUA y RetiradoCarrera = NO.

### Meta
- Archivo: `AVANCE B26 GRADO POSGRADO...xlsx`.
- Hoja oficial para metas: `Meta`.
- Campo oficial: `META TOTAL MENSUAL`.
- B26 Grado: Mayo 240, Junio 288, Julio 336, Agosto 384, Septiembre 576, Octubre 576.
- B26 Posgrado: Mayo 10, Junio 12, Julio 14, Agosto 16, Septiembre 18, Octubre 20.
- Meta acumulada al cierre de agosto: Grado 1248; Posgrado 52.
- % Cumplimiento = Inscritos / Meta acumulada.

## Citas Efectivas — Salesforce
- Definición acordada: `Lead.Status = "Cita efectiva"`.
- La línea base debe reutilizar la conexión/reporting Salesforce ya existente en el panel adjunto.
- El panel Salesforce de referencia contiene las consultas/tablas `Estado_leads_B26` y `Estado de Aspirantes B26` según la evidencia proporcionada por el usuario.
- Para el cálculo de Citas Efectivas se debe obtener el dato desde esa fuente Salesforce ya conectada, no desde SGA/615.
- Los valores anteriores 1363 Grado / 69 Posgrado / 1432 Total son únicamente referencias hasta su conciliación contra la fuente Salesforce del panel.

## Gobierno
- No cambiar visuales hasta cerrar la conciliación de las tarjetas.
- No inventar valores ni equivalencias de Salesforce.
- No mezclar fechas SGA con fechas Salesforce para Citas Efectivas.
- Todo cambio posterior debe partir de esta baseline o de una promoción explícita posterior.

## Nota de artefacto
El repositorio registra el manifiesto de la línea base. El paquete PBIP completo permanece fuera del repositorio, siguiendo el esquema utilizado en releases anteriores.
