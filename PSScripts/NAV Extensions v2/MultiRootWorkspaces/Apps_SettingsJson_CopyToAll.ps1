. (Join-path $PSScriptRoot '_Settings.ps1')

$SettingsJson = get-ChildItem -Path $BaseFolder settings.json -Recurse

if ($SettingsJson) {
    foreach ($Target in $Targets) {
        if ($Target -ne $BaseFolder) {
            $SettingsJson | Copy-Item -Destination (join-path $Target ".vscode") -Force -Verbose
        }
    }
}