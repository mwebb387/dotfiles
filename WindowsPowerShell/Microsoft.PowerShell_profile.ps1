﻿Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Honukai

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# PowerShell parameter completion shim for the dotnet CLI 
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }

# Zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})

# Load script library
. "~\Documents\WindowsPowerShell\Scripts\choco.ps1"
. "~\Documents\WindowsPowerShell\Scripts\creds.ps1"
. "~\Documents\WindowsPowerShell\Scripts\dotnet.ps1"
. "~\Documents\WindowsPowerShell\Scripts\git.ps1"
. "~\Documents\WindowsPowerShell\Scripts\iis.ps1"
. "~\Documents\WindowsPowerShell\Scripts\jira.ps1"
. "~\Documents\WindowsPowerShell\Scripts\sudo.ps1"
. "~\Documents\WindowsPowerShell\Scripts\touch.ps1"

# Other scripts to load later
function Python-StartServer() {
    python -m http.server
}

function Git-OpenRepo() {
    $RepoUrl = git config --get remote.origin.url
    if ($RepoUrl) {
        C:\Progra~2\Google\Chrome\Application\chrome.exe $RepoUrl
    } else {
        Write-Host "Not a git repo or no origin url"
    }
}

function Generate-CustomBookmarks() {
    $CurPath = pwd 
    $BookmarkToolPath = "C:\Users\mwebb\Documents\Playground\Javascript\Custom Bookmarks\"
    cd $BookmarkToolPath
    node .\index.js
    cd $CurPath
}
