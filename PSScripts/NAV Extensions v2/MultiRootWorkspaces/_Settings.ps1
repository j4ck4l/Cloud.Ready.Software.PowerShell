$Workspace = "C:\work\repos" 
$BaseFolder = join-path $workspace 'dxsteel\App'
$SymbolFolder = '.alpackages'

$AppJsons = Get-ChildItem $Workspace -Recurse 'app.json'

$targetRepos = (Get-ChildItem $Workspace -Recurse -Hidden -Include '.git').Parent.FullName
$Targets = $AppJsons.directory.fullname

$AppSourceCopPackagesFolder = '.appSourceCopPackages'