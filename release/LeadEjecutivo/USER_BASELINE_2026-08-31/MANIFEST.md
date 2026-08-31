# LeadEjecutivo — User-provided baseline 2026-08-31

This baseline is the exact package explicitly designated by the user as the new starting point for subsequent changes.

## Source package
`LeadEjecutivo(1).zip`

## Baseline status
- User explicitly requested this file to become the new baseline.
- Subsequent changes must start from this package.
- The package is expected to include the newly added Salesforce report connections/tables such as `Estado de Aspirantes B26` and `Estado_leads_B26` as shown by the user in Power BI Desktop.
- Existing validated business rules remain subject to re-validation from this baseline before further implementation.

## Integrity note
The attachment was accepted as the authoritative user source for this baseline. The runtime did not expose the uploaded ZIP at the mounted filesystem path during registration, so a SHA-256 value was not fabricated. Capture and append the hash when the package is next available to the build runtime.

## Governance
- Treat this baseline as immutable.
- Implement subsequent changes on feature branches/PRs.
- Do not fall back to V1.49.4 or V1.50.1 unless explicitly requested.
