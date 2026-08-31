# LeadEjecutivo V1.63 — Validated Baseline

## Status
**VALIDATED BASELINE**

The user explicitly validated the values on the **Validacion de metricas** page and authorized this version to be merged and used as the new working baseline.

## Source package
`LeadEjecutivo_V1.63_Remove_EstadoReportVisuals.zip`

## SHA-256
`01f4d63901736a7a4daecee4e8cc00a0146e4cd1059ebdb5026a106fd7c48d03`

## Validation
- Power BI runtime values on `Validacion de metricas`: confirmed OK by the user.
- PBIR JSON static validation: passed.
- Visuals tied to `Estado de Aspirantes B26` and `Estado_leads_B26`: removed from the validation page.
- Salesforce dimensions aligned to the filtered/normalized `CandidatoSF` model lineage.
- `DimOrigenSF` derives from `CandidatoSF[Categoria]`.
- Salesforce category rules include Feria, Walkin, Formulario, Gestion Territorial, with all other values retained from the Salesforce source.
- `CandidatoSF` scope uses Salesforce period code `164` for B26 and excludes Homologado aspirants.
- Meta source is `Metas.xlsx` / `Metas.xlsm`, sheet `Meta`.

## Baseline governance
- V1.63 supersedes the prior working baseline for subsequent LeadEjecutivo changes.
- All future modifications should branch from this validated state.
- Do not fall back to earlier V1.5x/V1.6x experimental packages unless explicitly requested.
- Changes after V1.63 require a new version and runtime validation before being promoted as baseline.

## Artifact note
The validated ZIP is retained as the authoritative binary PBIP package for this baseline. The repository release manifest records its exact integrity hash and validation status.
