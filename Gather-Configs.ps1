$git = @{ src = '~/.gitconfig'; dest = './.gitconfig'; exclude = $null }
$nvim = @{ src = '~/AppData/Local/nvim'; dest = './nvim'; exclude = '~/AppData/Local/nvim/plugged/*', '~/AppData/Local/nvim/rplugin/*' }
$psOld = @{ src = '~/Documents/WindowsPowerShell'; dest = './WindowsPowerShell'; exclude = @('~/Documents/WindowsPowerShell/Modules/*') }
$ps = @{ src = '~/Documents/PowerShell'; dest = './PowerShell'; exclude = @('~/Documents/PowerShell/Modules/*') }

$paths = $git, $nvim, $psOld, $ps

function CopyFilesToFolder ($fromFolder, $toFolder, $exclude) {
  $childItems = Get-ChildItem $fromFolder
  $childItems | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $toFolder -Recurse -Force -Exclude $exclude
  }
}

function Gather-Configs {
  $paths | ForEach-Object -Process {
    Copy-Item -Path $_.src -Destination $_.dest -Recurse -Force -Exclude $exclude
  }
}

function Distribute-Configs {
  $paths | ForEach-Object -Process {
    if ((Get-Item $_.dest) -is [System.IO.DirectoryInfo]) {
      CopyFilesToFolder $_.dest $_.src $_.exclude
    } else {
      Copy-Item -Path $_.dest -Destination $_.src -Force
    }
  }
}

Gather-Configs
