function Git-ChangeToRoot {
    $curPath = pwd 
    $gitRootPath = Git-ShowRoot
    cd $gitRootPath
    return $curPath
}

function Git-Checkout {
  $branches = git branch --no-contains | % { $_.Trim() } 
  $branch = $branches | fzf --layout=reverse --preview 'git log --color=always --decorate --oneline {}'

  if ($branch -And $branch.Trim()) {
    git checkout $branch.Trim()
  }
}

function Git-Confirm ($Title = 'This is a destructive action') {
  $question = 'Are you sure you want to proceed?'
  $choices  = '&Yes', '&No'

  $decision = $Host.UI.PromptForChoice($Title, $question, $choices, 1)
  return ($decision -eq 0)
}

function Git-FastForward {
  $branch = git branch --no-contains | % { $_.Trim() } | fzf --layout=reverse --preview 'git log --color=always --decorate --oneline {}'

  if ($branch -And $branch.Trim()) {
    git fetch origin $($branch.Trim()):$($branch.Trim())
    git status
  }
}

function Git-NewBranch($Type = 'branch', $Path = '') {
  $branch = Read-Host -Prompt "New $Type name"

  if ($branch -And $branch.Trim()) {
    git checkout -b $($Path + $branch.Trim())
  }
}

function Git-NewBugfix {
  Git-NewBranch -Type 'bugfix' -Path 'bugfix/'
}

function Git-NewFeature {
  Git-NewBranch -Type 'feature' -Path 'feature/'
}

function Git-OpenRepo() {
    $repoUrl = git config --get remote.origin.url
    if ($repoUrl) {
        Start-Process $repoUrl
    } else {
        Write-Host "Not a git repo or no origin url"
    }
}

function Git-Restore {
  if ( -Not (Git-Confirm -Title 'This will discard your changes for the selected files')) {
    return
  }

  $curPath = Git-ChangeToRoot

  [array] $files = git ls-files -m -o --exclude-standard | fzf -m --layout=reverse --preview 'git diff --color=always {}'

  if ($files.Length) {
    git restore -- $files
    git status
  }

  cd $curPath
  
}

function Git-ShowRoot {
  git rev-parse --show-toplevel
}

function Git-Stage {
  $curPath = Git-ChangeToRoot

  # TODO: add prune option
  [array] $files = git ls-files -m -o --exclude-standard | fzf -m --layout=reverse --preview 'git diff --color=always {}'

  if ($files.Length) {
    git add -- $files
    git status
  }

  cd $curPath
}

function Git-Track {
  $branch = git branch -r | fzf

  if ($branch -And $branch.Trim()) {
    git checkout -t $branch.Trim()
  }
}

function Git-Unstage {
  $curPath = Git-ChangeToRoot

  [array] $files = git diff --name-only --relative --cached | fzf -m --layout=reverse --preview 'git diff --cached --color=always -- {}'

  if ($files.Length) {
    git restore --staged -- $files
    git status
  }

  cd $curPath
}

Set-Alias -Name gstg -Value Git-Stage
Set-Alias -Name gco -Value Git-Checkout
Set-Alias -Name gff -Value Git-FastForward
Set-Alias -Name gbug -Value Git-NewBugfix
Set-Alias -Name gft -Value Git-NewFeature
Set-Alias -Name gnew -Value Git-NewBranch
Set-Alias -Name gopen -Value Git-OpenRepo
Set-Alias -Name grm -Value Git-Restore
Set-Alias -Name gtk -Value Git-Track
Set-Alias -Name guns -Value Git-Unstage

