# Day 4 - PowerShell Log Generator

# Trigger GitHub Actions again

$logFile = "../ProjectT.log"

for ($i = 1; $i -le 5; $i++) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $message = "[${timestamp}] INFO: Log entry $i added."

    # Append to log file
    Add-Content -Path $logFile -Value $message

    Write-Host $message
    Start-Sleep -Seconds 2
}
