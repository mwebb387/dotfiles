$BZSRepoRoot = "C:\repos\bzs\"
$DefaultEditor = "nvim.exe"

function Open-Directory {
  $curDir = pwd
  cd C:/

  $dir = fd -td -E 'Windows' -E 'Progra*' -E Drivers -E 'AppData' | fzf --preview 'dir {}'

  if (-Not $dir) {
    cd $curDir
    return
  }

  cd $dir
}

function Select-BZSProject {
  return (Get-Item $BZSRepoRoot).EnumerateDirectories().Name | fzf
}

function Open-BZSProject {
  $proj = Select-BZSProject

  if ($proj) {
    cd "$BZSRepoRoot$proj"
  }
}

function Edit-BZSProject($Editor = $DefaultEditor) {
  $proj = Select-BZSProject

  if ($proj) {
    Start-Process -FilePath $Editor -WorkingDirectory "$BZSRepoRoot$proj" -NoNewWindow -Wait
  }
}


Set-Alias -Name od -Value Open-Directory
Set-Alias -Name pjo -Value Open-BZSProject
Set-Alias -Name pje -Value Edit-BZSProject

