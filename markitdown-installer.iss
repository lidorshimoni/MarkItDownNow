[Setup]
AppName=MarkItDown Now!
AppVersion=1.0.0
AppPublisher=Microsoft Corporation
AppPublisherURL=https://github.com/microsoft/markitdown
AppSupportURL=https://github.com/microsoft/markitdown
AppUpdatesURL=https://github.cosm/microsoft/markitdown
DefaultDirName={autopf}\MarkItDown
DefaultGroupName=MarkItDown Now!
AllowNoIcons=yes
LicenseFile=markitdown_build\markitdown\LICENSE
OutputDir=dist
OutputBaseFilename=markitdown-installer
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "markitdown_build\markitdown.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "markitdown_silent_wrapper.vbs"; DestDir: "{app}"; Flags: ignoreversion
Source: "markitdown_build\markitdown\LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "markitdown_build\markitdown\README.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\MarkItDown Now!"; Filename: "{app}\markitdown.exe"
Name: "{group}\{cm:UninstallProgram,MarkItDown Now!}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\MarkItDown Now!"; Filename: "{app}\markitdown.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "contextmenu"; Description: "Add 'MarkItDown Now!' to context menu for supported files"; GroupDescription: "Context Menu Integration"
Name: "readreadme"; Description: "View README file after installation"; GroupDescription: "Post-Installation Actions"; Flags: unchecked
Name: "restartexplorer"; Description: "Restart Windows Explorer to immediately apply context menu changes"; GroupDescription: "Post-Installation Actions"; Flags: unchecked

[Registry]
; PDF Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.pdf\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.pdf\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Microsoft Office Documents
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.docx\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.docx\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.pptx\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.pptx\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.xlsx\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.xlsx\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.xls\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.xls\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Image Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.jpg\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.jpg\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.jpeg\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.jpeg\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.png\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.png\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Audio Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.wav\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.wav\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.mp3\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.mp3\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.m4a\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.m4a\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.mp4\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.mp4\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Web and Markup Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.html\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.html\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.htm\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.htm\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Text and Data Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.txt\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.txt\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.text\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.text\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.json\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.json\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.jsonl\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.jsonl\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.csv\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.csv\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Archive Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; E-book Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.epub\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.epub\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Notebook Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.ipynb\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.ipynb\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

; Outlook Message Files
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.msg\shell\MarkItDownNow"; ValueType: string; ValueName: ""; ValueData: "MarkItDown Now!"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.msg\shell\MarkItDownNow\command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\markitdown_silent_wrapper.vbs"" ""%1"""; Tasks: contextmenu

[Run]
Filename: "{app}\README.md"; Description: "View the README file"; Flags: postinstall nowait skipifsilent unchecked; Tasks: readreadme

[UninstallRun]
; Note: Explorer restart is handled in the Code section for better reliability

[Code]
function IsExplorerRunning(): Boolean;
var
  ResultCode: Integer;
begin
  Result := Exec('tasklist.exe', '/FI "IMAGENAME eq explorer.exe" /FO CSV | find /I "explorer.exe"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) and (ResultCode = 0);
end;

procedure RestartExplorer();
var
  ResultCode: Integer;
  ExplorerWasRunning: Boolean;
begin
  ExplorerWasRunning := IsExplorerRunning();
  
  if ExplorerWasRunning then
  begin
    // Kill Explorer using full path
    if Exec(ExpandConstant('{sys}\taskkill.exe'), '/f /im explorer.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      // Wait for Explorer to fully terminate
      Sleep(2000);
      
      // Restart Explorer using full path
      Exec(ExpandConstant('{win}\explorer.exe'), '', '', SW_SHOW, ewNoWait, ResultCode);
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Add application to PATH environment variable
    RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'PATH', 
      GetEnv('PATH') + ';' + ExpandConstant('{app}'));
    
    // Restart Explorer to refresh context menu (only if user selected the task)
    if WizardIsTaskSelected('restartexplorer') then
      RestartExplorer();
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Path: string;
  AppPath: string;
begin
  if CurUninstallStep = usPostUninstall then
  begin
    // Remove application from PATH environment variable
    if RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'PATH', Path) then
    begin
      AppPath := ExpandConstant('{app}');
      StringChangeEx(Path, ';' + AppPath, '', True);
      StringChangeEx(Path, AppPath + ';', '', True);
      StringChangeEx(Path, AppPath, '', True);
      RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'PATH', Path);
    end;
    
    // Note: During uninstall, we don't restart Explorer to avoid disrupting the user
    // Context menu entries will be removed when Explorer is next restarted
  end;
end;

[Messages]
WelcomeLabel2=This will install [name/ver] on your computer.%n%nMarkItDown is a utility that converts various file types (PDF, Word, PowerPoint, Excel, images, audio files, and more) to Markdown format for use with text analysis tools and large language models.%n%nClick Next to continue.
