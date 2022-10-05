function Npm-Run {
  $file = fd package.json | fzf

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
  $file = fd package.json | fzf

  if (-Not $file) {
    return
  }

  # Get parent directory of package file
  $root = (Get-Item $file).Directory.FullName

  # npm run selection
  npm start --prefix $root
}
