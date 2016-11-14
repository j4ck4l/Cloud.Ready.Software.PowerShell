﻿$Name = 'NAV2017_W1_CTP26'
$isofile = "C:\_Installs\$Name.iso"
$ConfigFile     = join-path $PSScriptRoot 'FullInstallNAV2017_ReplaceDB.xml'
$Licensefile    = 'C:\Users\Administrator\Dropbox\Dynamics NAV\Licenses\5230132_003 and 004 IFACTO_NAV2016_BELGIUM_2016 08 03.flf'
$Objectlibrary  = 'C:\Users\Administrator\Dropbox\Dynamics NAV\ObjectLibrary'
$Exportfile = Join-Path $Objectlibrary "$Name.zip"
$Log = 'c:\Temp\Log.txt'

$InstallationResult =
        -Licensefile $Licensefile `
        -Log $Log `

#Export Objects
if (-not (Test-Path $Exportfile)){
    

    write-host -foregroundcolor Green -Object "Exporting all objects to $Objectlibrary"
    
    $TempFile = "$env:TEMP\$name.txt"
        
    Export-NAVApplicationObject -DatabaseName $InstallationResult.Databasename -Path $TempFile -ExportTxtSkipUnlicensed -ErrorAction Stop

    Get-Item $TempFile | Create-ZipFileFromPipedItems -zipfilename $Exportfile
    Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
    
}