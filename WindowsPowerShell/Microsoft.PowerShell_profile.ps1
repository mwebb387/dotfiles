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

. "~\Documents\WindowsPowerShell\Scripts\dotnet.ps1"
. "~\Documents\WindowsPowerShell\Scripts\iis.ps1"
. "~\Documents\WindowsPowerShell\Scripts\jira.ps1"
. "~\Documents\WindowsPowerShell\Scripts\sudo.ps1"
. "~\Documents\WindowsPowerShell\Scripts\touch.ps1"