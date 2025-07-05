# Day 5 - Log Rotation Script

$logFile = Join-Path $PSScriptRoot "ProjectT.log"
$archiveFolder = Join-Path $PSScriptRoot "logs_archive"

# Create archive folder if it doesn't exist
if (-not (Test-Path $archiveFolder)) {
    New-Item -ItemType Directory -Path $archiveFolder | Out-Null
}

# Check if log file exists and size > 1KB
if (Test-Path $logFile) {
    $fileSizeKB = (Get-Item $logFile).Length / 1KB

    if ($fileSizeKB -gt 1) {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $archivedFile = Join-Path $archiveFolder "ProjectT_$timestamp.log"

        Move-Item -Path $logFile -Destination $archivedFile
        Write-Host "Log file archived as $archivedFile"

        # Create new empty log file
        New-Item -ItemType File -Path $logFile | Out-Null
        Write-Host "New ProjectT.log created."
    }
    else {
        Write-Host "Log file is under 1KB. No action taken."
    }
}
else {
    Write-Host "Log file not found."
}
