param(
  $LocalRepoPath = "~/source",
  $InstallGit = $True
)

# TODO: get local repo location

Write-Host "Composing new PC install script..."

# Repositories
$repoRoot = "https://github.com/mwebb387/"
$dotfilesRepo = "dotfiles"
$bistroRepo = "nvim-config-bistro"

$script = ''

if ($InstallGit) {
  $script += 
@'
# Install Git
Write-Host "Installing Git..."
winget install Git.Git

'@
}

$script += 
@'
# Install Scoop
Write-Host "Installing Scoop..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

'@

$script += @'
# Install scoop progs
Write-Host "Installing Scoop Apps..."
$scoopApps = $(

'@
$scoopApps = scoop list | ForEach-Object { $script += $_.Name + ",`r`n" }
$script += ")`r`n"
$script += 'scoop install $scoopApps' + "`r`n"

$script += @"
# Clone repos
Write-Host "Cloning local repos..."
mkdir $LocalRepoPath
cd $LocalRepoPath
git clone $($repoRoot + $dotfilesRepo)
git clone $($repoRoot + $bistroRepo)
"@

# TODO: setup neovim

$script | Out-File -FilePath .\new-pc-script.ps1
Write-Host "New PC install script written"
