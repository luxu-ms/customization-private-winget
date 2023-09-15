param (
    [Parameter()]
    [string]$LocalRepoURL
)

winget source remove -n=winget
winget source remove -n=msstore
winget source add --name WinGetRest $LocalRepoURL -t Microsoft.Rest