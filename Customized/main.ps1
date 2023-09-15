param (
    [Parameter()]
    [string]$LocalRepoURL,
    [Parameter()]
    [string]$RunAsUser
)

if($RunAsUser -eq "true") {
    $CustomizationScriptsDir = "C:\DevBoxCustomizations"
    $RunAsUserScript = "runAsUser.ps1"
    $RunAsUserScriptPath = "$($CustomizationScriptsDir)\$($RunAsUserScript)"
    if(!(Test-Path -Path $CustomizationScriptsDir)){
        New-Item $CustomizationScriptsDir -type directory
    }
    Add-Content -Path $RunAsUserScriptPath -Value "winget source remove -n=winget
    winget source remove -n=msstore
    winget source add --name WinGetRest $LocalRepoURL -t Microsoft.Rest"
    
}else{
    winget source remove -n=winget
    winget source remove -n=msstore
    winget source add --name WinGetRest $LocalRepoURL -t Microsoft.Rest 
}