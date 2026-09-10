# Clean requirements.txt by removing ' @ file://...' local paths and produce requirements-fixed.txt
# Usage: run this in the SignAI folder: .\clean_requirements.ps1

$in = Join-Path $PSScriptRoot 'requirements.txt'
$out = Join-Path $PSScriptRoot 'requirements-fixed.txt'

if (-not (Test-Path $in)) {
    Write-Error "Input file not found: $in"
    exit 1
}

Get-Content $in | ForEach-Object {
    # remove windows-style code fences or markdown fences
    if ($_ -match '^```') { return }
    $line = ($_ -replace '\s*@\s*file://[^\s]++', '').Trim()
    if ($line) { $line }
} | Sort-Object -Unique | Set-Content $out

Write-Output "Created $out (cleaned requirements). Review before installing." 
Write-Output "To install: py -3 -m pip install -r $out"