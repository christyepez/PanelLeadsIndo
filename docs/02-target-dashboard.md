# Estrategia objetivo — Lead Intelligence Dashboard

## Propósito

Evolucionar el panel actual desde un reporte descriptivo hacia una herramienta de decisión para Marketing, Admisiones y Dirección.

## Preguntas que debe responder

1. ¿Cuántos Leads estamos generando y cómo cambia el volumen en el tiempo?
2. ¿Qué canales, campañas, carreras, sedes y modalidades generan Leads de mayor calidad?
3. ¿En qué etapa del proceso se pierden los Leads?
4. ¿Cuánto tarda el equipo en atender un Lead?
5. ¿Cómo afecta el tiempo de atención a la conversión?
6. ¿Qué razones explican las pérdidas?
7. ¿Qué cohortes convierten mejor?
8. ¿Qué Leads requieren atención prioritaria?
9. ¿Qué parte del rendimiento se explica por Marketing y cuál por gestión comercial/admisiones?

## Páginas propuestas

### 01 — Executive Overview

KPIs:

- Leads totales
- Leads nuevos
- Leads gestionados
- Leads efectivos
- Leads perdidos
- Tasa de gestión
- Tasa de efectividad
- Tasa de pérdida
- Conversión final a inscripción/matrícula, si existe información suficiente
- Variación MTD / período anterior

Visuales:

- Tendencia de Leads y conversiones
- Embudo resumido
- Top canales/orígenes
- Top carreras
- Alertas principales

### 02 — Funnel & Conversion

Etapas objetivo a validar con Salesforce/modelo:

`Lead → Contactado → Cita → Cita efectiva → Oportunidad → Inscrito → Matriculado`

KPIs:

- Conversión por etapa
- Drop-off por etapa
- Conversión acumulada
- Tiempo promedio/mediano entre etapas

### 03 — Acquisition

Dimensiones:

- LeadSource
- Origen
- Origen2
- Campaña/UTM si existen
- Landing/Formulario si existen

KPIs:

- Leads
- Leads efectivos
- Leads perdidos
- Conversión
- Participación del total
- Calidad del Lead
- CPL / CPA si posteriormente se integra inversión publicitaria

### 04 — Academic Demand

Dimensiones:

- Unidad de negocio
- Carrera
- Sede
- Modalidad
- Período académico

KPIs:

- Demanda
- Conversión
- Tendencia
- Participación
- Pérdidas
- Razones de pérdida

### 05 — Lead Behavior

Análisis:

- Hora del día
- Día de semana
- Semana
- Mes
- Cohortes por fecha de creación
- Aging del Lead
- Tiempo de primera atención
- Tiempo hasta cita efectiva
- Tiempo hasta oportunidad

### 06 — Loss Analysis

KPIs y visuales:

- Leads perdidos
- Tasa de pérdida
- Razones principales
- Razones por canal
- Razones por carrera
- Razones por sede/modalidad
- Tendencia de razones de pérdida

### 07 — Operations / SLA

KPIs:

- Leads sin gestionar
- Leads pendientes > 1h / 4h / 24h
- Tiempo medio y mediano de primera respuesta
- % atendidos dentro del SLA
- Conversión por banda de tiempo de respuesta

### 08 — Lead Explorer

Tabla detallada para análisis operativo con drill-through:

- Lead
- Fecha creación
- Canal
- Origen
- Carrera
- Sede/modalidad
- Estado
- Responsable
- Tiempo de atención
- Última actividad
- Razón de pérdida
- Lead Score

## Modelo semántico objetivo

Preferencia: esquema estrella, evitando que los visuales dependan directamente de muchas tablas operacionales de Salesforce.

### Hechos propuestos

- `FactLead`
- `FactLeadStatusHistory`
- `FactOpportunity`
- `FactLeadActivity` si existe granularidad suficiente
- `FactMarketingSpend` en una fase posterior

### Dimensiones propuestas

- `DimDate`
- `DimLeadSource`
- `DimOrigin`
- `DimAcademicProgram`
- `DimCampus`
- `DimModality`
- `DimStatus`
- `DimLossReason`
- `DimOwner`
- `DimCampaign` si existe

## Medidas base propuestas

No implementar hasta validar granularidad y reglas de negocio:

- `[Leads]`
- `[Leads Gestionados]`
- `[Leads Efectivos]`
- `[Leads Perdidos]`
- `[% Gestionados]`
- `[% Efectividad]`
- `[% Pérdida]`
- `[Oportunidades]`
- `[Inscritos]`
- `[Matriculados]`
- `[% Lead a Oportunidad]`
- `[% Lead a Matrícula]`
- `[Tiempo Primera Atención]`
- `[% Dentro SLA]`
- `[Lead Aging]`

## Lead Quality Score

Fase posterior. Puntaje 0–100 basado en variables verificables, por ejemplo:

- integridad de datos de contacto;
- intención académica definida;
- canal/origen con conversión histórica;
- interacción;
- velocidad de respuesta;
- avance en funnel;
- recurrencia/actividad.

Debe ser explicable y auditable; no se construirá como caja negra.
