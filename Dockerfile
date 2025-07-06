# Day 10 - Dockerfile to run PowerShell Log Writer using Linux base image

FROM mcr.microsoft.com/powershell:latest

# Set working directory inside container
WORKDIR /app

# Copy PowerShell scripts from your local to container
COPY PowerShell/ ./PowerShell/

# Run the PowerShell script on container start
CMD ["pwsh", "./PowerShell/day4_log_writer.ps1"]
 