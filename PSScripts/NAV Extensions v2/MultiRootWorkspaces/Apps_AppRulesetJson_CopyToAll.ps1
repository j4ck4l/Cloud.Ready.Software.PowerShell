. (Join-path $PSScriptRoot '_Settings.ps1')

$AppRulesetJson = get-ChildItem -Path $BaseFolder app.ruleset.json -Recurse

if ($AppRulesetJson) {
    foreach ($Target in $Targets) {
        if ($Target -ne $BaseFolder) {
            $AppRulesetJson | Copy-Item -Destination (join-path $Target ".codeAnalysis") -Force -Verbose
        }
    }
}