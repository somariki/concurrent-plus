@echo off
echo Building OneComme Template Utils Plugin Installer...
echo.

:: Create dist directory if it doesn't exist
if not exist "dist" mkdir dist
if not exist "dist\installer" mkdir dist\installer

:: Build the project first
::echo Building the project...
::npm run build
::if %ERRORLEVEL% neq 0 (
::    echo Build failed! Please check for errors.
::    pause
::    exit /b 1
::)

:: Check if Inno Setup is installed
set "INNO_SETUP_PATH=C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
if not exist "%INNO_SETUP_PATH%" (
    echo Inno Setup not found at the default location.
    echo Please update the INNO_SETUP_PATH variable in this script or install Inno Setup.
    pause
    exit /b 1
)

:: Compile the installer
echo Creating installer with Inno Setup...
"%INNO_SETUP_PATH%" setup.iss
if %ERRORLEVEL% neq 0 (
    echo Installer creation failed!
    pause
    exit /b 1
)

echo.
echo Installer created successfully!
echo Output: dist\installer\Setup.exe
echo.
pause
