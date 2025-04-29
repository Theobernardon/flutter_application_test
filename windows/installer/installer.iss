; Script généré par l'assistant de script d'installation Inno.
; VOIR LA DOCUMENTATION POUR PLUS DE DÉTAILS SUR LA CRÉATION DE FICHIERS SCRIPT D'INSTALLATION INNO !

#define MyAppName "Mon app"
#define MyAppVersion "1.5"
#define MyAppPublisher "Bernardon Théo"
#define MyAppExeName "flutter_application_test.exe"
#define MyAppDir "D:\a\flutter_application_test\flutter_application_test"

[Setup]
; NOTE : La valeur de l'AppId identifie de manière unique cette application. N'utilisez pas la même valeur AppId dans les programmes d'installation d'autres applications.
; (Pour générer un nouveau GUID, cliquer sur Outils | Générer GUID dans l'IDE).
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
; "ArchitecturesAllowed=x64compatible" spécifie que le Setup ne peut pas exécuter
; sur autre chose que x64 et Windows 11 sur Arm.
ArchitecturesAllowed=x64compatible
; "ArchitecturesInstallIn64BitMode=x64compatible" demande que l'installation
; l'installation soit effectuée en "mode 64 bits" sur x64 ou sous Windows 11 sur Arm,
; ce qui signifie qu'elle doit utiliser le répertoire natif 64-bit Program Files et le répertoire
; la vue 64 bits du registre.
ArchitecturesInstallIn64BitMode=x64compatible
DisableProgramGroupPage=yes
LicenseFile={MyAppDir}\LICENCE
; Supprimez la ligne suivante pour exécuter l'installation en mode administratif (installation pour tous les utilisateurs).
PrivilegesRequired=lowest
OutputDir=installer/output
OutputBaseFilename=SetupMonApp
Password=pourlespotes
Encryption=yes
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{MyAppDir}\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs
; NOTE : N'utilisez pas "Flags : ignoreversion" sur les fichiers partagés du système.

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent