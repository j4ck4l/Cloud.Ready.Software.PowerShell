param (
    [validateset('Dxsteel', 'Customer')]
    [String] $Type = 'Dxsteel'
)

switch ($Type) {
    'Dxsteel' { . (Join-path $PSScriptRoot '_Settings.ps1') }
    'Customer' { . (Join-path $PSScriptRoot '_SettingsCustomers.ps1') }
}

Write-Host "Stage and commit for $Type"

# $Message = 'References to release-branch'
# $Message = 'Versions in App.json to 6.3'
# $Message = 'After Translation'
$Message = 'Release 19.2.10'

foreach ($Target in $targetRepos) {
    write-host $Target -ForegroundColor Green
    Set-Location "$Target"
    
    & git stage .
    & git commit -m "$Message"
    & git push
}