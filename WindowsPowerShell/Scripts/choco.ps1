function Choco-InteractiveUpdate {
  [array]$progs = choco outdated | rg "(\S+\|)+\S+" | fzf -m | % {$_.SubString(0, $_.IndexOf("|"))}

  if ($progs.Length) {
    choco upgrade $progs -y
  }
}

# function Scoop-InteractiveUpdate {
#   scoop update
#   [array]$progs = scoop status | rg "(\S+\|)+\S+" | fzf -m | % {$_.SubString(0, $_.IndexOf("|"))}

#   if ($progs.Length) {
#     scoop update $progs
#   }
# }
