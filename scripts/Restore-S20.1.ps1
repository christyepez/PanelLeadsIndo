param(
    [string]$ProjectRoot = ".",
    [string]$TargetPath = ".\restored-s20.1"
)

$ErrorActionPreference = "Stop"
$partsDir = Join-Path $ProjectRoot "release\S20.1\parts"
$archive = Join-Path $env:TEMP "pnl_Leads_MKT_S20_1.tar.xz"
$expectedHash = "13bdfb7b0599f7759dd2f9eae13381d9a744d8d11a2f44eebf81830a0b658c0a"

$parts = Get-ChildItem $partsDir -File | Sort-Object Name
if ($parts.Count -ne 6) { throw "Expected 6 S20.1 payload parts; found $($parts.Count)." }

$out = [System.IO.File]::Create($archive)
try {
    foreach ($part in $parts) {
        $bytes = [System.IO.File]::ReadAllBytes($part.FullName)
        $out.Write($bytes, 0, $bytes.Length)
    }
}
finally { $out.Dispose() }

$actualHash = (Get-FileHash $archive -Algorithm SHA256).Hash.ToLowerInvariant()
if ($actualHash -ne $expectedHash) { throw "S20.1 payload SHA256 mismatch: $actualHash" }

New-Item -ItemType Directory -Path $TargetPath -Force | Out-Null
tar -xJf $archive -C $TargetPath
if ($LASTEXITCODE -ne 0) { throw "tar extraction failed." }

$required = @(
    "pnl_Leads_MKT.pbip",
    "pnl_Leads_MKT.Report\definition.pbir",
    "pnl_Leads_MKT.SemanticModel\definition.pbism",
    "pnl_Leads_MKT.SemanticModel\definition\model.tmdl"
)
foreach ($relative in $required) {
    if (-not (Test-Path (Join-Path $TargetPath $relative))) { throw "Missing restored artifact: $relative" }
}

$count = (Get-ChildItem $TargetPath -Recurse -File).Count
Write-Host "S20.1 restored successfully. Files: $count" -ForegroundColor Green
Write-Host "Target: $TargetPath"
Remove-Item $archive -Force
