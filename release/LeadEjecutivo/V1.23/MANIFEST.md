# LeadEjecutivo V1.23 — Baseline funcional

Baseline aprobada por validación manual del usuario el 2026-08-26.

Estado funcional validado:
- El proyecto abre correctamente en Power BI Desktop.
- Se parte de V1.22 Rango de Fechas + Metas.
- Se incorporan períodos de 15 días sin modificar conexiones ni relaciones existentes.
- V1.23 queda congelada como punto de retorno antes de los siguientes cambios funcionales.

Paquete determinístico:
- Formato: tar.xz
- Archivo lógico: LeadEjecutivo_V1.23_baseline.tar.xz
- Tamaño: 32240 bytes
- Archivos extraídos esperados: 150
- SHA-256: ace0635c43d04ba4f2ce14b76127568f760e28920e8433606965ccd75aba37a6

Reconstrucción Linux/macOS:
```bash
cat release/LeadEjecutivo/V1.23/parts/part* > LeadEjecutivo_V1.23_baseline.tar.xz
sha256sum LeadEjecutivo_V1.23_baseline.tar.xz
tar -xJf LeadEjecutivo_V1.23_baseline.tar.xz
```

Reconstrucción PowerShell:
```powershell
$parts = Get-ChildItem .\release\LeadEjecutivo\V1.23\parts\part* | Sort-Object Name
$out = [System.IO.File]::Create(".\LeadEjecutivo_V1.23_baseline.tar.xz")
try {
  foreach ($part in $parts) {
    $bytes = [System.IO.File]::ReadAllBytes($part.FullName)
    $out.Write($bytes, 0, $bytes.Length)
  }
} finally { $out.Dispose() }
(Get-FileHash .\LeadEjecutivo_V1.23_baseline.tar.xz -Algorithm SHA256).Hash
```

No sustituir esta baseline con los cambios de V1.24 hasta que estos sean validados en Power BI Desktop.