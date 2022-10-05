function Choco-InteractiveUpdate {
  [array]$progs = choco outdated | rg "(\S+\|)+\S+" | fzf -m --layout=reverse | % {$_.SubString(0, $_.IndexOf("|"))}

  if ($progs.Length) {
    choco upgrade $progs -y
  }
}

function Scoop-InteractiveCleanup {
  $progs = scoop list | ForEach-Object { $_.Name } | fzf -m --layout=reverse

  if ($progs.Length) {
    scoop cleanup $progs
  }
}

function Scoop-InteractiveUpdate {
  scoop update
  $progs = scoop status | ForEach-Object { $_.Name } | fzf -m --layout=reverse

  if ($progs.Length) {
    scoop update $progs
  }
}

function Omnisharp-SetVersion {
  scoop shim alter omnisharp
}
