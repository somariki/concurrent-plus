# OneComme Template - Concurrent+

A real-time viewer data display template for OneComme, supporting multi-platform data monitoring and custom styling.

## Features

- **Multi-platform Support**:
  - **YouTube**: Real-time viewers, likes
  - **Twitch**: Real-time viewers, followers
  - **Bilibili**: Real-time viewers, total views

- **Highly Customizable**:
  - Custom size, color, font size
  - Adjustable box size and background transparency
  - Support for saving multiple preset configurations

- **Easy to Use**:
  - Graphical configuration interface
  - Real-time preview
  - One-click preset switching

## Installation

### Method 1: Windows Installer (Recommended)

1. Download the latest installer
2. Run `Template-同接-Setup-v1.0.0.exe`
3. Follow the installation wizard to complete setup
4. Configuration page will open automatically after installation

### Method 2: Manual Installation

1. Download and extract the zip file
2. Copy the extracted `concurrent-plus` folder to OneComme's template directory:
   ```
   %AppData%\onecomme\templates\custom\
   ```
3. The complete path should be:
   ```
   %AppData%\onecomme\templates\custom\concurrent-plus\
   ```

## Usage

### Prerequisites

- OneComme software installed
- OneComme Template Utils plugin installed

### Quick Start

1. **Launch OneComme Template Utils**
   - Via Start Menu or access: `http://localhost:11180/plugins/onecomme.plugin.template-utils/index.html`

2. **Select Template**
   - Find the "Concurrent+" template in the template list
   - Click to select

3. **Configure Style**
   - Adjust font size and color
   - Set box size and background transparency
   - Choose data types to display

4. **Save Preset**
   - Save as preset after configuration
   - Convenient for quick switching between different display styles

5. **Apply to OneComme**
   - Add browser source in OneComme
   - Set URL to template address

## Detailed Tutorial

### 1. Basic Configuration

#### Font Settings
- **Font Size**: Adjust the size of number display
- **Font Color**: Set text color, supports hexadecimal color codes
- **Font Style**: Choose font family (Arial, Microsoft YaHei, etc.)

#### Layout Settings
- **Box Width/Height**: Adjust the size of the entire display area
- **Background Transparency**: 0-100%, control background transparency
- **Margin Settings**: Adjust distance between content and borders

### 2. Data Source Configuration

#### YouTube Settings
1. Ensure OneComme is connected to YouTube
2. Select data to display:
   - Current View (current viewers)
   - Like (likes)

#### Twitch Settings
1. Ensure OneComme is connected to Twitch
2. Select data to display:
   - Current View (current viewers)
   - Follower (followers)

#### Bilibili Settings
1. Ensure OneComme is connected to Bilibili
2. Select data to display:
   - Current View (current viewers)
   - Total View (total views)

### 3. Preset Management

#### Creating Presets
1. Configure all parameters
2. Click "Save Preset" button
3. Enter preset name
4. Confirm save

#### Using Presets
1. Select preset to use from preset list
2. Click "Apply Preset"
3. Settings will load automatically

#### Managing Presets
- **Edit Preset**: Select preset, modify parameters, and resave
- **Delete Preset**: Select and delete unwanted presets from the list
- **Export Preset**: Export preset files for use on other devices

### 4. Using in OneComme

1. **Add Browser Source**
   - Click "Add Source" in OneComme
   - Select "Browser" type

2. **Set Template URL**
   - URL Address: [Get from Template Utils]
   - Width/Height: Set according to preset box size

3. **Adjust Position**
   - Drag to adjust position in OBS preview
   - Set appropriate layer order

## Troubleshooting

### Common Issues

**Q: Data not displaying or showing 0?**
A: 
- Check if OneComme is properly connected to streaming platform
- Confirm streaming status is "Live"
- Check network connection

**Q: Style settings not taking effect?**
A: 
- Refresh browser source
- Check if preset is properly applied
- Clear browser cache

**Q: Template won't load?**
A: 
- Confirm OneComme Template Utils plugin is running
- Check if template files are in correct directory
- Restart OneComme Template Utils

**Q: Presets lost?**
A: 
- Check `%AppData%\onecomme\templates\custom\concurrent-plus\` directory
- Confirm preset files exist
- Recreate presets

## Technical Support

- **Official Website**: https://somacoder.cc/
- **Tutorial Videos**: [To be added]
- **Issue Reports**: X (https://x.com/soma_desune)

## Changelog

### v1.0.0
- Initial release
- Support for YouTube, Twitch, Bilibili platforms
- Basic style customization features
- Preset saving and management

## License

Copyright (C) 2025 Soma. All rights reserved.

## Contributing

Issues and improvement suggestions are welcome!