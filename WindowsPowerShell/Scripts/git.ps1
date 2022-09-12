function Git-Stage {
  # TODO: add prune option
  [array] $files = git ls-files -m -o --exclude-standard | fzf -m --layout=reverse --print0 --preview 'git diff --intent-to-add --color=always {}'

  if ($files.Length) {
    # git add -- $files
    $files | % { git add '$_' }
  }
}

function Git-Checkout {
  $branches = git branch --no-contains | % { $_.Trim() } 
  $branch = $branches | fzf --layout=reverse --preview 'git log --color=always --decorate --oneline {}'

  if ($branch -And $branch.Trim()) {
    if ($branches.Contains($branch)) {
      git checkout $branch.Trim()
    } else {
      git checkout -b $branch.Trim()
    }
  }
}

function Git-FastForward {
  $branch = git branch --no-contains | % { $_.Trim() } | fzf --layout=reverse --preview 'git log --color=always --decorate --oneline {}'

  if ($branch -And $branch.Trim()) {
    git fetch origin $($branch.Trim()):$($branch.Trim())
  }
}

function Git-Restore {
  [array] $files = git ls-files -m -o --exclude-standard | fzf -m --layout=reverse --print0 --preview 'git diff --color=always {}'

  if ($files.Length) {
    git restore -- $files
  }
}

function Git-Track {
  $branch = git branch -r | fzf

  if ($branch -And $branch.Trim()) {
    git checkout -t $branch.Trim()
  }
}

function Git-Unstage {
  [array] $files = git diff --name-only --relative --cached | fzf -m --layout=reverse --print0 --preview 'git diff --cached --color=always -- {}'

  if ($files.Length) {
    git restore --staged -- $files
  }
}

Set-Alias -Name gstg -Value Git-Stage
Set-Alias -Name gco -Value Git-Checkout
Set-Alias -Name gff -Value Git-FastForward
Set-Alias -Name gre -Value Git-Restore
Set-Alias -Name gtk -Value Git-Track
Set-Alias -Name guns -Value Git-Unstage

