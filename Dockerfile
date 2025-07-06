FROM mcr.microsoft.com/powershell:latest

WORKDIR /app

COPY PowerShell/ ./PowerShell/

ENTRYPOINT ["pwsh", "./PowerShell/day14_cleanup.ps1"]
