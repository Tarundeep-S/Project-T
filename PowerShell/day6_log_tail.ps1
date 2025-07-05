# Day 6 - Real-Time Log Monitoring (Tail-F)

$logFile = Join-Path $PSScriptRoot "ProjectT.log"

if (-not (Test-Path $logFile)) {
    Write-Host "ProjectT.log not found."
    exit
}

Write-Host "Monitoring log file for new entries..."
$lastSize = (Get-Item $logFile).Length

while ($true) {
    Start-Sleep -Seconds 1
    $newSize = (Get-Item $logFile).Length

    if ($newSize -gt $lastSize) {
        $stream = [System.IO.File]::Open($logFile, 'Open', 'Read', 'ReadWrite')
        $stream.Seek($lastSize, 'Begin') | Out-Null

        $reader = New-Object System.IO.StreamReader($stream)
        while (!$reader.EndOfStream) {
            Write-Host $reader.ReadLine()
        }

        $lastSize = $newSize
        $reader.Close()
        $stream.Close()
    }
}
