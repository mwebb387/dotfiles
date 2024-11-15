function IIS {
  Get-IISSite
}

function IIS-Start {
  $args | ForEach-Object {
    Start-WebAppPool -Name $_
    Start-WebSite -Name $_
  }
}

function IIS-Stop {
  $args | ForEach-Object {
    Stop-WebSite -Name $_
    Stop-WebAppPool -Name $_
  }
}

function IIS-StartAll {
  Get-IISSite | ForEach-Object { iis-start $_ }
}

function IIS-StopAll {
  Get-IISSite | ForEach-Object { iis-stop $_ }
}

function IIS-StartOnly {
  IIS-StopAll
  IIS-Start $args
}
