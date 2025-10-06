# PowerShell script to create a zip file with template files
Write-Host "Creating OneComme Template ZIP package..." -ForegroundColor Green
Write-Host ""

# Create dist directory if it doesn't exist
if (!(Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist"
    Write-Host "Created dist directory" -ForegroundColor Yellow
}

# Remove existing zip if it exists
$zipPath = "dist\concurrent-plus-v1.0.0.zip"
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
    Write-Host "Removed existing zip file" -ForegroundColor Yellow
}

# Create temporary directory for organizing files
$tempDir = "temp_zip_staging"
if (Test-Path $tempDir) {
    Remove-Item $tempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $tempDir
New-Item -ItemType Directory -Path "$tempDir\concurrent-plus"
New-Item -ItemType Directory -Path "$tempDir\concurrent-plus\images"

Write-Host "Copying files..." -ForegroundColor Yellow

# Copy JSON files
Get-ChildItem -Path "*.json" | ForEach-Object {
    Copy-Item $_.FullName -Destination "$tempDir\concurrent-plus\"
    Write-Host "  Copied: $($_.Name)" -ForegroundColor Gray
}

# Copy HTML files
Get-ChildItem -Path "*.html" | ForEach-Object {
    Copy-Item $_.FullName -Destination "$tempDir\concurrent-plus\"
    Write-Host "  Copied: $($_.Name)" -ForegroundColor Gray
}

# Copy CSS files
Get-ChildItem -Path "*.css" | ForEach-Object {
    Copy-Item $_.FullName -Destination "$tempDir\concurrent-plus\"
    Write-Host "  Copied: $($_.Name)" -ForegroundColor Gray
}

# Copy thumb.png
if (Test-Path "thumb.png") {
    Copy-Item "thumb.png" -Destination "$tempDir\concurrent-plus\"
    Write-Host "  Copied: thumb.png" -ForegroundColor Gray
}

# Copy icon files to images subfolder
if (Test-Path "public\image\icon.ico") {
    Copy-Item "public\image\icon.ico" -Destination "$tempDir\concurrent-plus\images\"
    Write-Host "  Copied: public\image\icon.ico" -ForegroundColor Gray
}

if (Test-Path "public\image\TemplateIcon.ico") {
    Copy-Item "public\image\TemplateIcon.ico" -Destination "$tempDir\concurrent-plus\images\"
    Write-Host "  Copied: public\image\TemplateIcon.ico" -ForegroundColor Gray
}

if (Test-Path "public\image\UtilsIcon.ico") {
    Copy-Item "public\image\UtilsIcon.ico" -Destination "$tempDir\concurrent-plus\images\"
    Write-Host "  Copied: public\image\UtilsIcon.ico" -ForegroundColor Gray
}

# Copy README files
$readmeFiles = @("README-zh-CN.md", "README-zh-TW.md", "README-ja.md", "README-en.md")
foreach ($readme in $readmeFiles) {
    if (Test-Path $readme) {
        if ($readme -eq "README-en.md") {
            # Copy README-en.md as README.md (as specified in setup.iss)
            Copy-Item $readme -Destination "$tempDir\concurrent-plus\README.md"
            Write-Host "  Copied: $readme -> README.md" -ForegroundColor Gray
        } else {
            Copy-Item $readme -Destination "$tempDir\concurrent-plus\"
            Write-Host "  Copied: $readme" -ForegroundColor Gray
        }
    }
}

# Copy LICENSE if it exists
if (Test-Path "LICENSE") {
    Copy-Item "LICENSE" -Destination "$tempDir\concurrent-plus\"
    Write-Host "  Copied: LICENSE" -ForegroundColor Gray
}

Write-Host ""
Write-Host "Creating ZIP file..." -ForegroundColor Yellow

# Create the ZIP file
try {
    Compress-Archive -Path "$tempDir\*" -DestinationPath $zipPath -Force
    Write-Host ""
    Write-Host "ZIP package created successfully!" -ForegroundColor Green
    Write-Host "Output: $zipPath" -ForegroundColor Cyan
    
    # Get file size
    $fileSize = (Get-Item $zipPath).Length
    $fileSizeMB = [math]::Round($fileSize / 1MB, 2)
    Write-Host "File size: $fileSizeMB MB" -ForegroundColor Cyan
} catch {
    Write-Host "Error creating ZIP file: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Clean up temporary directory
Remove-Item $tempDir -Recurse -Force
Write-Host "Cleaned up temporary files" -ForegroundColor Yellow

Write-Host ""
Write-Host "Package contents:" -ForegroundColor Green
Write-Host "- All JSON configuration files" -ForegroundColor Gray
Write-Host "- All HTML template files" -ForegroundColor Gray
Write-Host "- All CSS style files" -ForegroundColor Gray
Write-Host "- Thumbnail image" -ForegroundColor Gray
Write-Host "- Icon files (in images/ folder)" -ForegroundColor Gray
Write-Host "- Multi-language README files" -ForegroundColor Gray
Write-Host "- LICENSE file" -ForegroundColor Gray
Write-Host ""