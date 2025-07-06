FROM mcr.microsoft.com/powershell:latest

WORKDIR /app

COPY PowerShell/ ./PowerShell/

ENTRYPOINT ["pwsh", "./PowerShell/day13_dynamic_logger.ps1"]
