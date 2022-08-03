function Git-Add {
  [array] $files = git status --porcelain | fzf -m --layout=reverse | % {$_.Substring($_.LastIndexOf(" ") + 1)}
  if ($files.Length) {
    git add $files
  }
}

function Git-Checkout {
  $branch = git branch -l | fzf

  if ($branch -And $branch.Trim()) {
    git checkout $branch.Trim()
  }
}

function Git-Restore {
  [array] $files = git status --porcelain | fzf -m --layout=reverse | % {$_.Substring($_.LastIndexOf(" ") + 1)}
  if ($files.Length) {
    git restore $files
  }
}

function Git-Track {
  $branch = git branch -r | fzf

  if ($branch -And $branch.Trim()) {
    git checkout -t $branch.Trim()
  }
}

