Import-Module CredentialManager

function Get-Pass {
  param(
    [Parameter(Mandatory=$True)]
    [String] $Target
  )
  $Cred = Get-StoredCredential -Target $Target
  $PSCred = New-Object System.Management.Automation.PSCredential -ArgumentList $Cred.UserName, $Cred.Password
  return $PSCred.GetNetworkCredential().Password
}
