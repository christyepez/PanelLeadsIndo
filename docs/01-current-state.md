# Estado actual — pnl_Leads_MKT.pbix

## Archivo analizado

- Archivo: `pnl_Leads_MKT.pbix`
- Tamaño aproximado: 42.5 MB
- Formato: PBIX moderno basado en ZIP/OPC.
- El archivo ya contiene definición de reporte en formato PBIR JSON dentro de `Report/definition/`.
- Página actual: `Leads`.
- Tamaño de página: 1280 x 1720.
- Visuales detectados: 15.

## Modelo visible desde el diagrama

El PBIX contiene al menos estas tablas visibles en el diagrama del modelo:

1. Candidato
2. Colaboración de candidato
3. Colaboración de oportunidad
4. Etapa de la oportunidad
5. Función del contacto de oportunidades
6. Historial de campos de oportunidades
7. Historial de candidatos
8. Historial de oportunidad
9. Noticias de candidato
10. Noticias de oportunidad
11. Oportunidad
12. Oportunidad (Histórico)
13. Oportunidad Socio
14. Oportunidad: Competidor
15. Producto de oportunidad
16. Valor del estado del candidato

## Campos actualmente utilizados por el reporte

La página actual utiliza principalmente la tabla `Candidato`:

- `CreatedDate`
- `LeadSource`
- `Status`
- `UI_UnidadNegocio__c`
- `UI_CarreraCursar__c`
- `UI_Origen__c`
- `Origen2`
- `UI_RazonPerdido__c`
- `conteo`

## Visuales actuales

### Filtros

- Fecha de creación: `Candidato.CreatedDate`
- Canal: `Candidato.LeadSource`
- Estado: `Candidato.Status`
- Unidad de negocio: `Candidato.UI_UnidadNegocio__c`
- Carrera: `Candidato.UI_CarreraCursar__c`
- Origen: `Candidato.UI_Origen__c`

### KPIs

- Total de Leads: suma de `Candidato.conteo`
- Leads perdidos: `Status = 'Perdido'`
- Leads gestionados: `Status <> 'Perdido'`
- Leads efectivos: `Status = 'Cita efectiva'`

### Gráficos

- Leads por origen: `Origen2` vs `conteo`
- Estado de Leads: `Status` vs `conteo`
- Leads perdidos por razón: `UI_RazonPerdido__c` vs `conteo`
- Leads perdidos por origen y razón.
- Evolución temporal diaria de Leads usando la jerarquía automática de `CreatedDate`.

## Hallazgos iniciales

1. El reporte actual es principalmente descriptivo: volumen, estado, origen y razones de pérdida.
2. Se utiliza `SUM(conteo)` como métrica base; conviene validar si `conteo` siempre vale 1 y reemplazarlo por una medida explícita de Leads cuando corresponda.
3. El análisis temporal usa la jerarquía automática de fecha. Se recomienda crear una `DimFecha` formal.
4. No se observa todavía un embudo completo Lead → Contacto → Oportunidad → Inscripción/Matriculación en la página actual.
5. No se observan KPIs de tiempo de primera atención, aging, conversión entre etapas, cohortes o calidad del Lead.
6. Las tablas de Oportunidad e Históricos existentes en el modelo son una oportunidad clara para reconstruir comportamiento y conversión, pero deben validarse relaciones, granularidad y campos antes de diseñar las medidas definitivas.
7. Los visuales actuales contienen algunos títulos con errores tipográficos (`Leasds`), que se corregirán durante el rediseño.

## Restricción técnica actual

El reporte PBIR puede extraerse directamente del PBIX. El modelo semántico interno está almacenado en el componente binario `DataModel` con compresión de Analysis Services. No se debe inventar un TMDL a partir de información parcial. La conversión final del modelo a TMDL se realizará mediante Power BI Desktop al guardar el PBIX como PBIP, o mediante una herramienta de extracción validada.
