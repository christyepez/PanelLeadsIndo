# LeadEjecutivo V1.28 — Business Metrics / YTD / Goals / Advisors

Release branch de trabajo. **No mergear a `main` hasta validar apertura y refresh en Power BI Desktop.**

## Base
- Punto de partida de trabajo: LeadEjecutivo V1.27.
- Fuentes principales de negocio: reporte 615 + histórico 387.
- Salesforce se usa únicamente como enriquecimiento de origen/canal cuando el 615 no trae fuente.

## Rama
`release/leadejecutivo-v1.28-business-metrics`

## Paquete candidato
`LeadEjecutivo_V1.28_BusinessMetricsYTDGoalsAdvisor.zip`

SHA-256: `c1b824b9f31a8eff277da452399a0424db66e8d2b7b6066b281a6340225f2d5b`

## Ajustes
- Leads del Journey calculados desde admisiones (615), no desde el volumen general de Salesforce.
- Enriquecimiento de origen por Salesforce mediante identificación, email o teléfono cuando Fuente del 615 está vacía.
- Normalización de META / WHATSAPP / TIKTOK / GOOGLE / WEB.
- Proyección de cierre mensual con días hábiles lunes a viernes.
- Journey: comparativos YTD por mes A24/A25/A26 y B24/B25/B26.
- Grados: comparativos mensuales A24/A25/A26 y B24/B25/B26.
- Posgrados: comparativos mensuales A24/A25/A26 y B24/B25/B26.
- Conversión por asesor: matrícula exige FechaMatricula real.
- Barras categóricas ordenadas de mayor a menor.
- Comparativos con paleta institucional morado/naranja.
- Loader de metas B26 reforzado para detectar encabezados y metas separadas Grado/Posgrado.

## Validación estática
- JSON PBIR: 104 archivos parseados correctamente.
- Se validaron bloques TMDL con fences completos.
- Se bloqueó el patrón M inseguro `and` seguido de `let` sin paréntesis.

## Gate
La release permanece en rama hasta confirmar en Power BI Desktop:
1. apertura sin error PBIP/TMDL/M;
2. refresh 615/387/Salesforce/metas;
3. metas Grado/Posgrado con valores;
4. origen META/WHATSAPP/TIKTOK según datos disponibles;
5. YTD mensual visible;
6. conversión de asesores no artificialmente en 100%.
