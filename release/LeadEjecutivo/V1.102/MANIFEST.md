# LeadEjecutivo V1.102 — Carrera Wildcard Blue

## Status
**PROMOTED BASELINE**

The user explicitly authorized this version to be merged after validating the latest LeadEjecutivo iteration.

## Source package
`LeadEjecutivo_V1.102_CarreraWildcardBlue.zip`

## SHA-256
`c883ae6a3e58a01ae155eeb075fe2ae15c3d81194d027295526858ad07c233c8`

## Main changes included in the promoted line
- Executive 360 principal and pilot/unified pages retained with reconciled monthly Matriculados logic.
- Monthly visuals use the common `DimMes360` axis and show data only through the current month.
- `DimColorGraficas` remains the central chart-color governance table.
- Current governed palette:
  - Carrera: `#003366`
  - Origen / canal: `#336699`
  - Matriculados: `#F28C28`
  - Inscritos: `#3C235F`
  - Meta: `#555555`
- Carrera single-series bar/column charts use a `dataViewWildcard` selector with literal `#003366`, preventing fallback to the Power BI theme/turquoise color.
- Measure cleanup was applied conservatively: only unused/unreachable measures were removed; active production measures were not moved across tables when that could break entity-qualified references.
- `README.md` is the single incremental technical log; standalone release-note `.txt` files are not used.
- `FitToWidth` retained on the main and pilot Validation / Executive 360 pages.

## Validation
- PBIR JSON static validation: passed (`254` JSON files).
- Carrera wildcard checks on Executive 360 principal/pilot: passed.
- `DimColorGraficas[CARRERA] = #003366`: confirmed in model definition.
- No KPI business logic, source, relationship, month criteria, or homologation rule was changed in V1.102 itself.

## Baseline governance
- V1.102 supersedes V1.63 as the current working baseline for subsequent LeadEjecutivo changes.
- Future changes should branch from this promoted state.
- Runtime validation should still be performed after future PBIR/TMDL edits before promoting another baseline.

## Artifact note
The ZIP remains the authoritative binary PBIP package for this release line. The repository records the release metadata and exact SHA-256 integrity hash.
