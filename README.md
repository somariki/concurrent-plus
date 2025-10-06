# concurrent-plus

# OneComme Templates Inno Setup

This repository contains the Inno Setup script (`setup.iss`) and a PowerShell helper (`build-installer.ps1`) to build and package the OneComme Template Utils plugin as a Windows installer.

## Prerequisites

- Node.js (v12+)
- npm (v6+)
- Inno Setup 6 (ISCC.exe on PATH or at one of the default install locations)

## Folder Structure

```
├── build-installer.ps1    # PowerShell script to orchestrate build and installer compilation
├── setup.iss             # Inno Setup script definition
├── package.json          # npm scripts and metadata
├── dist/installer        # Output folder for the generated .exe
├── public/               # Plugin assets (icons, images)
└── templates/            # Optional templates shipped by installer
```

## Installation

1. Clone this repository:
   ```powershell
   git clone https://github.com/somariki/OneComme-templates-innoSetup.git
   cd OneComme-templates-innoSetup
   ```
2. Install any Node.js dependencies (none by default):
   ```powershell
   npm install
   ```
3. Build and create the installer:
   ```powershell
   npm run build-installer
   ```

The final installer `.exe` will be placed under `dist/installer`.

## Usage and Customization

- To pass a custom Inno Setup script or override the default filename, use the `-fileName` parameter:
  ```powershell
  npm run build-installer -- -fileName custom-setup.iss
  ```
- You can also run the PowerShell script directly:
  ```powershell
  powershell -ExecutionPolicy Bypass -File build-installer.ps1 -fileName setup.iss
  ```

## npm Scripts

- `npm run build-installer` — Builds the plugin (if applicable) and compiles the installer using Inno Setup.
- `npm run help` — Prints usage instructions.

## License

This project is licensed under the [ISC License](LICENSE).