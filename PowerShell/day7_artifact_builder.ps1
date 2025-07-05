# Day 7 - CI/CD Style Artifact Generator (ZIP log archiver)

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$archiveName = "logs_backup_$timestamp.zip"
$sourceFolder = Join-Path $PSScriptRoot "logs_archive"
$outputPath = Join-Path $PSScriptRoot $archiveName

if (-not (Test-Path $sourceFolder)) {
    Write-Host "No logs_archive folder found. Run log rotation first."
    exit
}

Compress-Archive -Path "$sourceFolder\*" -DestinationPath $outputPath -Force
Write-Host "Logs archived to: $archiveName"
