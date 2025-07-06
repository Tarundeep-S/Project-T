# Day 13 - PowerShell Script that accepts parameters

param (
    [int]$count = 5,
    [string]$message = "Default log message"
)

$logFile = "ProjectT.log"

for ($i = 1; $i -le $count; $i++) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[${timestamp}] INFO: $message $i"
    
    Add-Content -Path $logFile -Value $logEntry
    Write-Host $logEntry
    Start-Sleep -Seconds 1
}
