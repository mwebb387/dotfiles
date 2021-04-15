$paths = @{ git = '~/.gitconfig', '.gitconfig'; nvim = '~/AppData/Local/nvim', 'nvim' }

function Gather-Configs {
  $paths.GetEnumerator() | ForEach-Object -Process {
    Copy-Item $_.value[0] -Destination $_.value[1] -Recurse
  }
}

function Distribute-Configs {
  $paths.GetEnumerator() | ForEach-Object -Process {
    Copy-Item $_.value[1] -Destination $_.value[0] -Recurse
  }
}
