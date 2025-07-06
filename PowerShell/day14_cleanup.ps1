# Day 14 - Log Cleanup Script

$logFile = "ProjectT.log"

if (Test-Path $logFile) {
    $fileInfo = Get-Item $logFile
    $lastWrite = $fileInfo.LastWriteTime

    if ((Get-Date) - $lastWrite.Days -ge 7) {
        Remove-Item $logFile -Force
        Write-Host "🧹 Old log file deleted: $logFile"
    }
    else {
        Write-Host "✅ Log file is fresh. No cleanup needed."
    }
}
else {
    Write-Host "ℹ️ No log file found to clean."
}
