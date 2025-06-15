# Enable verbose logging
$VerbosePreference = "Continue"

Write-Host "Starting Windows Docker agent..."

# Print basic environment info
Write-Host "Hostname: $env:COMPUTERNAME"
Write-Host "Agent Name: $env:AGENT_NAME"
Write-Host "Work Dir: $env:AGENT_WORKDIR"

# Optional: Download and run the Azure DevOps agent inside container
# This section is *only* if you want to auto-bootstrap an agent from inside the container

$AgentUrl = "https://vstsagentpackage.azureedge.net/agent/3.236.1/vsts-agent-win-x64-3.236.1.zip"
$AgentDir = "C:\azagent"

if (-Not (Test-Path $AgentDir)) {
    New-Item -ItemType Directory -Path $AgentDir | Out-Null
}

Write-Host "Downloading Azure DevOps agent..."
Invoke-WebRequest -Uri $AgentUrl -OutFile "$AgentDir\agent.zip"

Write-Host "Extracting agent..."
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("$AgentDir\agent.zip", "$AgentDir")

Write-Host "Running config..."
Set-Location $AgentDir

# NOTE: You must mount a volume with the following secrets, or override this block:
# ./config.cmd --unattended --url ... --auth pat --token ... --pool ...

Write-Host "Configuration placeholder - replace this section to auto-configure agent."

# Keep container running
Write-Host "Container is now running. Press Ctrl+C to stop."
while ($true) {
    Start-Sleep -Seconds 3600
}
