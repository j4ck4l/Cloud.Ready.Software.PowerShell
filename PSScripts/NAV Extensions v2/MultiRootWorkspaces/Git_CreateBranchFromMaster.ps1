param (
    [validateset('Dxstee;', 'Customer')]
    [String] $Type = 'Customer'
)

Write-Host "Discard all changes for $Type"

switch ($Type) {
    'Dxsteel' { . (Join-path $PSScriptRoot '_Settings.ps1') }
    'Customer' { . (Join-path $PSScriptRoot '_SettingsCustomers.ps1') }
}

#$MasterBranch = 'release/19.2.8'
$MasterBranch = 'main'
$NewBranch = 'brandpe/19.2.10'

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
