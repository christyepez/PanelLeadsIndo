# Auditoría del modelo semántico PBIP

## Baseline analizado

Archivo fuente: `pnl_Leads_MKT_PBIP.zip`, generado desde Power BI Desktop.

El proyecto contiene:

- `pnl_Leads_MKT.pbip`
- `pnl_Leads_MKT.Report`
- `pnl_Leads_MKT.SemanticModel`
- definición PBIR del reporte
- definición TMDL completa del modelo semántico

## Inventario

- 16 tablas de negocio.
- 68 archivos de tabla TMDL contando tablas automáticas de fecha.
- 52 `LocalDateTable_*` + 1 `DateTableTemplate_*` generadas por Auto Date/Time.
- 56 relaciones totales.
- 1 página de reporte: `Leads`.
- 15 visuales.
- 0 medidas DAX explícitas detectadas en las tablas de negocio.

### Tablas de negocio

1. `Candidato`
2. `Historial de candidatos`
3. `Colaboración de candidato`
4. `Noticias de candidato`
5. `Valor del estado del candidato`
6. `Oportunidad`
7. `Historial de oportunidad`
8. `Historial de campos de oportunidades`
9. `Oportunidad (Histórico)`
10. `Etapa de la oportunidad`
11. `Función del contacto de oportunidades`
12. `Producto de oportunidad`
13. `Noticias de oportunidad`
14. `Colaboración de oportunidad`
15. `Oportunidad Socio`
16. `Oportunidad: Competidor`

## Hallazgos críticos

### H01 — El modelo no tiene un vínculo Lead → Oportunidad utilizable

`Candidato` incluye `IsConverted`, pero el Power Query de esta tabla elimina explícitamente:

- `ConvertedDate`
- `ConvertedAccountId`
- `ConvertedContactId`
- `ConvertedOpportunityId`

Esto elimina la clave más directa para construir el funnel de conversión desde Lead hacia Oportunidad.

**Acción propuesta:** conservar `ConvertedDate` y `ConvertedOpportunityId`, y validar la relación `Candidato[ConvertedOpportunityId]` → `Oportunidad[Id]`.

### H02 — No existen medidas DAX explícitas

Las 16 tablas de negocio no contienen medidas DAX. El reporte actual depende principalmente de agregaciones implícitas y de columnas auxiliares como `conteo = 1`.

**Riesgo:** reglas de negocio dispersas en visuales, difícil control de calidad y baja reutilización.

**Acción propuesta:** crear tabla `_Measures` y convertir todos los KPI a medidas explícitas.

### H03 — Auto Date/Time genera un modelo temporal excesivo

El modelo contiene más de 50 tablas locales automáticas de fecha.

**Acción propuesta:** desactivar Auto Date/Time para el proyecto y crear una sola `DimFecha`, marcada como tabla de fecha. Las distintas fechas de negocio se gestionarán con relaciones activas/inactivas y `USERELATIONSHIP` cuando corresponda.

### H04 — Relaciones de negocio insuficientes y potencialmente incorrectas

De 56 relaciones, la mayoría corresponden a Auto Date/Time. Solo cinco relaciones conectan tablas de negocio y fueron generadas como `AutoDetected`.

Se detectaron relaciones activas basadas en campos como:

- `CreatedById`
- `LastModifiedById`

entre tablas que deberían relacionarse principalmente por `LeadId`, `OpportunityId` o claves de dimensión.

También existe una relación inactiva entre `Historial de oportunidad[OpportunityId]` y `Colaboración de oportunidad[OpportunityId]`, en lugar de una relación centralizada contra `Oportunidad[Id]`.

**Acción propuesta:** eliminar/autoevaluar relaciones espurias y reconstruir el modelo usando claves de negocio.

## Información disponible para Lead Intelligence

`Candidato` contiene 113 columnas. Entre las más relevantes:

- `Id`
- `CreatedDate`
- `LastModifiedDate`
- `LastActivityDate`
- `LeadSource`
- `Status`
- `OwnerId`
- `IsConverted`
- `UI_Periodo__c`
- `UI_Sede__c`
- `UI_UnidadNegocio__c`
- `UI_CarreraCursar__c`
- `UI_CarreraPrimeraOpcionWeb__c`
- `UI_CarreraSegundaOpcionWeb__c`
- `UI_Modalidad__c`
- `UI_Origen__c`
- `UI_Campana__c`
- `UI_RazonPerdido__c`
- `UI_SubrazonPerdido__c`
- `UI_CitasAspirante__c`
- `UI_LlamadasAspirante__c`
- `UI_TareasAspirante__c`
- `UI_Num_Solicitudes_individuales_ganadas__c`
- `UI_Numero_de_Solicitudes_individuales__c`

`Historial de candidatos` dispone de:

- `LeadId`
- `CreatedDate`
- `Field`
- `OldValue`
- `NewValue`

Esto permite reconstruir transiciones de estado del Lead si Salesforce conserva los cambios relevantes.

`Oportunidad` contiene, entre otros:

- `Id`
- `StageName`
- `CreatedDate`
- `CloseDate`
- `LeadSource`
- `IsClosed`
- `IsWon`
- `Probability`
- `CampaignId`
- `OwnerId`
- `ContactId`

`Historial de campos de oportunidades` ofrece `OpportunityId`, fecha, campo, valor anterior y nuevo valor, por lo que puede usarse para reconstruir cambios de etapa.

## Modelo objetivo inicial

```text
DimFecha
DimPeriodo
DimSede
DimCarrera
DimModalidad
DimOrigen
DimCampania
DimEstadoLead
DimEtapaOportunidad
DimOwner

FactLead
  ├── FactLeadStatusHistory
  └── FactOpportunity
        └── FactOpportunityStageHistory
```

En la primera iteración no es obligatorio materializar físicamente todas estas dimensiones. Se deberá priorizar un modelo estrella pragmático que no rompa el PBIP actual.

## Funnel propuesto

El funnel definitivo deberá validarse contra los valores reales de `Status`, `StageName` y los históricos. Conceptualmente:

```text
Lead creado
  ↓
Lead gestionado/contactado
  ↓
Cita
  ↓
Cita efectiva
  ↓
Lead convertido
  ↓
Oportunidad
  ↓
Oportunidad ganada / solicitud / inscripción
  ↓
Matrícula (si existe campo o fuente que permita identificarla)
```

No se asumirán etapas académicas que el modelo no pueda demostrar.

## Orden técnico recomendado

1. Conservar `ConvertedDate` y `ConvertedOpportunityId` en `Candidato`.
2. Validar Lead → Oportunidad.
3. Crear `DimFecha` y retirar gradualmente LocalDateTables.
4. Corregir relaciones de negocio.
5. Crear `_Measures`.
6. Crear medidas base de Leads.
7. Crear medidas de conversión.
8. Construir historial de estados.
9. Crear tiempos entre etapas/SLA.
10. Rediseñar páginas PBIR.

## Primera batería de medidas

- Leads
- Leads nuevos
- Leads gestionados
- Leads perdidos
- Leads convertidos
- % Leads convertidos
- Oportunidades
- Oportunidades ganadas
- % Lead → Oportunidad
- % Oportunidad ganada
- Leads por origen
- Leads por campaña
- Leads por carrera
- Leads por sede
- Leads por modalidad
- Tiempo promedio hasta primera gestión (si el historial permite identificarla)
- Tiempo promedio Lead → Oportunidad
- Edad del Lead abierto

## Regla de implementación

La migración y el rediseño deben separarse en commits/PR pequeños:

1. baseline PBIP;
2. corrección de modelo;
3. medidas DAX;
4. funnel;
5. comportamiento;
6. rediseño visual;
7. optimización y QA.
