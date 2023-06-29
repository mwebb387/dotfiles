function Npm-Run {
  $file = fd package.json | fzf -1

  if (-Not $file) {
    return
  }

  # Read Json
  $json = Get-Content $file | ConvertFrom-Json

  # Feed Scripts to FZF
  $script = $json.scripts.psobject.Properties.Name | fzf

  if (-Not $script) {
    return
  }

  # Get parent directory of package file
  $root = (Get-Item $file).Directory.FullName

  # npm run selection
  npm run $script --prefix $root
}

function Npm-Start {
  $file = fd package.json | fzf -1

  if (-Not $file) {
    return
  }

  # Get parent directory of package file
  $root = (Get-Item $file).Directory.FullName

  # npm run selection
  npm start --prefix $root
}

function Npm-Install {
  $file = fd package.json | fzf -1

  if (-Not $file) {
    return
  }

  # Get parent directory of package file
  $root = (Get-Item $file).Directory.FullName

  # npm install at root
  npm i --prefix $root
}

function Npm-Do ($Cmd) {
  if (-Not $Cmd) {
    $Cmd = Read-Host -Prompt "NPM command:"
  }

  $file = fd package.json | fzf -1

  if (-Not $file) {
    return
  }

  # Get parent directory of package file
  $root = (Get-Item $file).Directory.FullName

  # npm run selection
  $curDir = pwd
  cd $root
  npm $Cmd
  cd $curDir
}
