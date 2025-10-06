[Setup]
; Basic application information
AppId={{ONECOMME-SOMA-00002-TEMPLATE-202510061000}
AppName=OneComme Template - 同接+
AppVersion=1.0.0
AppVerName=Template Template - 同接+ 1.0.0
VersionInfoVersion=1.0.0.0
VersionInfoCompany=Soma
VersionInfoDescription= OneComme Template Customization for 同接+
VersionInfoTextVersion=1.0.0
VersionInfoCopyright=Copyright (C) 2025 Soma
VersionInfoProductName=OneComme Template - 同接・視聴者数
VersionInfoProductVersion=1.0.0
AppPublisher=Soma
AppPublisherURL=https://somacoder.cc/
AppSupportURL=https://somacoder.cc
AppUpdatesURL=https://somacoder.cc
DefaultDirName={userappdata}\onecomme\templates\custom\concurrent-plus
DefaultGroupName=OneComme Template-同接+
AllowNoIcons=yes
LicenseFile=LICENSE
OutputDir=dist\installer
OutputBaseFilename=Template-concurrent-plus-Setup-v1.0.0
SetupIconFile=public\image\icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest

; System requirements
MinVersion=0,6.2
ArchitecturesInstallIn64BitMode=x64

; Uninstall information
UninstallDisplayIcon={app}\images\icon.ico
UninstallDisplayName=Uninstall-Template-concurrent-plus

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"
Name: "chinesetrad"; MessagesFile: "compiler:Languages\ChineseTraditional.isl"

[CustomMessages]
; english
english.AdditionalOptions=Additional Options
english.LaunchPlugin=Launch after installation
english.RunAfterInstall=Run Template Utils after installation

; japanese
japanese.AdditionalOptions=追加オプション
japanese.LaunchPlugin=インストール後に起動する
japanese.RunAfterInstall=インストール後に Template Utils を実行する

; 简体中文
chinesesimp.AdditionalOptions=附加选项
chinesesimp.LaunchPlugin=安装后启动
chinesesimp.RunAfterInstall=安装后运行 Template Utils

; 繁體中文
chinesetrad.AdditionalOptions=附加選項
chinesetrad.LaunchPlugin=安裝後啟動工具
chinesetrad.RunAfterInstall=安裝後執行 Template Utils

[Tasks]
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; OnlyBelowVersion: 6.2
Name: "launchplugin"; Description: "{cm:LaunchPlugin}"; GroupDescription: "{cm:AdditionalOptions}"

[Files]
; Main application files
Source: "*.json"; DestDir: "{app}\"; Flags: ignoreversion
Source: "*.html"; DestDir: "{app}\"; Flags: ignoreversion
Source: "*.css"; DestDir: "{app}\"; Flags: ignoreversion
Source: "thumb.png"; DestDir: "{app}\"; Flags: ignoreversion
Source: "public\image\icon.ico"; DestDir: "{app}\images\"; Flags: ignoreversion
Source: "public\image\TemplateIcon.ico"; DestDir: "{app}\images\"; Flags: ignoreversion
Source: "public\image\UtilsIcon.ico"; DestDir: "{app}\images\"; Flags: ignoreversion
Source: "README-zh-CN.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "README-zh-TW.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "README-ja.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "README-en.md"; DestDir: "{app}\README.md"; Flags: ignoreversion
Source: "LICENSE"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\OneComme 同接+ Folder"; Filename: "{app}"; IconFilename: "{app}\images\TemplateIcon.ico";
Name: "{group}\{cm:UninstallProgram,OneComme 同接+}"; Filename: "{uninstallexe}"

[Run]
Filename: "http://localhost:11180/plugins/onecomme.plugin.template-utils/index.html"; Description: "{cm:RunAfterInstall}"; Flags: nowait postinstall skipifsilent shellexec; Tasks: launchplugin

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Post-installation tasks can be added here
  end;
end;
