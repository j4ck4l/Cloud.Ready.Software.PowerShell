. (Join-path $PSScriptRoot '_Settings.ps1')

#$MasterBranch = 'release/19.2.8'
$MasterBranch = 'main'
$NewBranch = 'release/20.1.0'

foreach ($Target in $targetRepos) {
    write-host $Target -ForegroundColor Green
    Set-Location $Target
    & git checkout -q "$MasterBranch"
    & git pull
    & git push
    & git checkout -q -b "$NewBranch"
    & git checkout -q "$NewBranch"
    & git push -u origin "$NewBranch"
}
