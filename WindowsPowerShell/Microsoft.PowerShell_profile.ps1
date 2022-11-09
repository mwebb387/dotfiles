#Oh my posh init
oh-my-posh init pwsh --config "~\.mytheme.omp.json" | Invoke-Expression

#Zoxide inti
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })

# Load script library
#. "~\Documents\WindowsPowerShell\Scripts\creds.ps1"
. "~\Documents\WindowsPowerShell\Scripts\dotnet.ps1"
. "~\Documents\WindowsPowerShell\Scripts\git.ps1"
#. "~\Documents\WindowsPowerShell\Scripts\iis.ps1"
#. "~\Documents\WindowsPowerShell\Scripts\jira.ps1"
. "~\Documents\WindowsPowerShell\Scripts\node.ps1"
. "~\Documents\WindowsPowerShell\Scripts\packages.ps1"
. "~\Documents\WindowsPowerShell\Scripts\projects.ps1"
. "~\Documents\WindowsPowerShell\Scripts\sudo.ps1"
. "~\Documents\WindowsPowerShell\Scripts\touch.ps1"


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
