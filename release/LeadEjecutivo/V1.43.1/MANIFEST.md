# LeadEjecutivo V1.43.1 — Baseline

Versión promovida como nueva línea base de LeadEjecutivo.

## Rama de promoción
`release/leadejecutivo-v1.43.1-baseline`

## Paquete de trabajo
`LeadEjecutivo_V1.43.1_AmbiguousPathFix(1).zip`

SHA-256: `fbd7ff99c77a2fa051f51c3835865abf1ea68ffd424e87490097d8f9a7667337`

## Estado de baseline
- El usuario indicó explícitamente usar esta versión como línea base.
- Resumen Ejecutivo 360 separado en Grado y Posgrado.
- 615 filtra Homologacion = NO, excluye Formacion Continua y RetiradoCarrera = NO.
- Histórico 387 permanece fuera del refresh operativo normal.
- Refresh operativo concentrado en 615, archivo de avance y consulta ligera Salesforce.
- Citas Efectivas provienen de Salesforce Lead.
- Origen/canal de análisis de inscritos/matriculados se enriquece desde Salesforce.
- Meta Grado vigente registrada en 1248; Posgrado en 0 mientras no exista dato oficial.
- % cumplimiento usa Inscritos / Meta.
- DimPeriodo contiene FechaInicio y FechaFin según reglas A/B.
- Regla académica: A = 01-Nov a 30-Abr; B = 01-May a 31-Oct.
- Rango B26 vigente parte de 01-May-2026 y llega hasta la fecha actual.
- Funnel usa Captación/Inscripción/Matriculación desde SGA/615 y Gestión desde Salesforce.
- Colores institucionales morado y naranja se mantienen en los visuales principales.
- Se corrigió la ruta ambigua CandidatoSF -> DimPeriodo, dejando inactiva la relación directa y conservando el camino por DimFecha.

## Nota
El repositorio conserva el manifiesto y SHA-256 del paquete PBIP. El artefacto PBIP completo se mantiene fuera del repositorio, siguiendo el esquema de releases ya utilizado en versiones anteriores.
