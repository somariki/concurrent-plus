# PowerShell script to create a zip file with the installer executable
Write-Host "Creating OneComme Template Installer ZIP package..." -ForegroundColor Green
Write-Host ""

# Check if installer exists
$installerName = "Template-concurrent-plus-Setup-v1.0.0.exe"
$installerPath = "dist\installer\$installerName"

# Try to find the installer file even with encoding issues
$installerFiles = Get-ChildItem "dist\installer\" -Filter "Template-*-Setup-v1.0.0.exe" -ErrorAction SilentlyContinue
if ($installerFiles.Count -eq 0) {
    $installerFiles = Get-ChildItem "dist\installer\" -Filter "*Setup*.exe" -ErrorAction SilentlyContinue
}

if ($installerFiles.Count -eq 0) {
    Write-Host "No installer found in dist\installer\" -ForegroundColor Red
    Write-Host "Please run 'npm run build-installer' first to create the installer." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

$actualInstallerPath = $installerFiles[0].FullName
$actualInstallerName = $installerFiles[0].Name
Write-Host "Found installer: $actualInstallerName" -ForegroundColor Green

# Create dist directory if it doesn't exist
if (!(Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist"
    Write-Host "Created dist directory" -ForegroundColor Yellow
}

# Remove existing zip if it exists
$zipPath = "dist\concurrent-plus-installer-v1.0.0.zip"
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
    Write-Host "Removed existing zip file" -ForegroundColor Yellow
}

Write-Host "Copying installer file..." -ForegroundColor Yellow

# Copy the installer to a temporary location with a simpler name
$tempInstallerName = "concurrent-plus-Setup-v1.0.0.exe"
Copy-Item $actualInstallerPath -Destination "dist\$tempInstallerName"
Write-Host "  Copied: $actualInstallerName -> $tempInstallerName" -ForegroundColor Gray

Write-Host ""
Write-Host "Creating ZIP file..." -ForegroundColor Yellow

# Create the ZIP file containing the installer
try {
    Compress-Archive -Path "dist\$tempInstallerName" -DestinationPath $zipPath -Force
    Write-Host ""
    Write-Host "Installer ZIP package created successfully!" -ForegroundColor Green
    Write-Host "Output: $zipPath" -ForegroundColor Cyan
    
    # Get file size
    $fileSize = (Get-Item $zipPath).Length
    $fileSizeMB = [math]::Round($fileSize / 1MB, 2)
    Write-Host "File size: $fileSizeMB MB" -ForegroundColor Cyan
} catch {
    Write-Host "Error creating ZIP file: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Clean up temporary installer copy
Remove-Item "dist\$tempInstallerName" -Force
Write-Host "Cleaned up temporary files" -ForegroundColor Yellow

Write-Host ""
Write-Host "Package contents:" -ForegroundColor Green
Write-Host "- OneComme Template Installer (Windows executable)" -ForegroundColor Gray
Write-Host "- Ready for distribution and download" -ForegroundColor Gray
Write-Host ""
Write-Host "Users can extract and run the installer directly." -ForegroundColor Green
Write-Host ""