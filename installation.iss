; This is the script file for building the installation setup.exe using Inno Setup Compiler 3.0.7
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Reconstruct
AppVerName=Reconstruct v1.1.0.1
AppPublisher=Fiala Fantoccini
AppPublisherURL=http://fiala-fantoccini.com/
AppSupportURL=http://fiala-fantoccini.com/
AppUpdatesURL=http://fiala-fantoccini.com/
DefaultDirName={pf}\Reconstruct
DefaultGroupName=Reconstruct
AllowNoIcons=yes
LicenseFile=license.txt
OutputDir=build

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"
Name: "quicklaunchicon"; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Files]
Source: "reconstruct.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "gpl.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "readme.txt"; DestDir: "{app}"; Flags: ignoreversion
;Source: "manual.chm"; DestDir: "{app}"; Flags: ignoreversion
Source: "keycmds.chm"; DestDir: "{app}"; Flags: ignoreversion
Source: "mousecmds.chm"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: "{app}\reconstruct.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://synapses.bu.edu/"

[Icons]
Name: "{group}\Reconstruct"; Filename: "{app}\reconstruct.exe"
Name: "{group}\Reconstruct on the Web"; Filename: "{app}\reconstruct.url"
Name: "{group}\Uninstall Reconstruct"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Reconstruct"; Filename: "{app}\reconstruct.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Reconstruct"; Filename: "{app}\reconstruct.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\reconstruct.exe"; Description: "Launch Reconstruct"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\reconstruct.url"

