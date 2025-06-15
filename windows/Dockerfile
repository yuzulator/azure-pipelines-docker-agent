# escape=`
# Use a base Windows image — you can adjust the tag (e.g., ltsc2022, 2022, etc.)
FROM mcr.microsoft.com/windows/servercore:ltsc2022

SHELL ["powershell", "-Command"]

# Copy the startup script
COPY start.ps1 C:/start.ps1

# Set default working directory (optional)
WORKDIR C:\

# Optional: Set environment variables
ENV AGENT_NAME="windows-docker-agent"
ENV AGENT_WORKDIR="C:\\_work"

# Optional: Add any additional dependencies
# RUN Install-WindowsFeature -Name Web-Server

# Set the entry point
ENTRYPOINT ["powershell.exe", "-ExecutionPolicy", "Bypass", "-File", "C:\\start.ps1"]
