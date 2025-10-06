param(
    [string]$setup = "setup.iss"
)

# PowerShell script to build OneComme Template Utils Plugin Installer
Write-Host "Building OneComme Template Utils Plugin Installer..." -ForegroundColor Green
Write-Host ""

# Create dist directory if it doesn't exist
if (!(Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist"
}
if (!(Test-Path "dist\installer")) {
    New-Item -ItemType Directory -Path "dist\installer"
}

# Build the project first
Write-Host "Building the project..." -ForegroundColor Yellow
# npm run build
# if ($LASTEXITCODE -ne 0) {
#     Write-Host "Build failed! Please check for errors." -ForegroundColor Red
#     Read-Host "Press Enter to exit"
#     exit 1
# }

# Check if Inno Setup is installed
$InnoSetupPaths = @(
    "C:\Program Files (x86)\Inno Setup 6\ISCC.exe",
    "C:\Program Files\Inno Setup 6\ISCC.exe",
    "${env:ProgramFiles(x86)}\Inno Setup 6\ISCC.exe",
    "$env:ProgramFiles\Inno Setup 6\ISCC.exe"
)

$InnoSetupPath = $null
foreach ($path in $InnoSetupPaths) {
    if (Test-Path $path) {
        $InnoSetupPath = $path
        break
    }
}

if (-not $InnoSetupPath) {
    Write-Host "Inno Setup not found at any of the default locations." -ForegroundColor Red
    Write-Host "Please install Inno Setup or update the script with the correct path." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Compile the installer
Write-Host "Creating installer with Inno Setup script: $setup" -ForegroundColor Yellow
& $InnoSetupPath $setup
if ($LASTEXITCODE -ne 0) {
    Write-Host "Installer creation failed!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Installer created successfully!" -ForegroundColor Green
Write-Host "Output: dist\installer\Template-concurrent-plus-Setup-v1.0.0.exe" -ForegroundColor Cyan
Write-Host ""
#Read-Host "Press Enter to exit"
