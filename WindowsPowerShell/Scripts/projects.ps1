$BZSRepoRoot = "C:\repos\bzs\"
$DefaultEditor = "nvim.exe"

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


Set-Alias -Name pjo -Value Open-BZSProject
Set-Alias -Name pje -Value Edit-BZSProject

