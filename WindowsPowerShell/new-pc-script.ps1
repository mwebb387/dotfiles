# Install Git
Write-Host "Installing Git..."
winget install Git.Git
# Install Scoop
Write-Host "Installing Scoop..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
# Install scoop progs
Write-Host "Installing Scoop Apps..."
$scoopApps = $(
7zip,
bat,
dark,
fd,
Flow-Launcher,
fzf,
gcc,
lazygit,
less,
lua,
luarocks,
neovim,
ngrok,
nodejs-lts,
nuget,
oh-my-posh,
omnisharp,
Omnisharp-net6,
powertoys,
python,
ripgrep,
vcredist2022,
via,
vifm,
zoxide,
)
scoop install $scoopApps
# Clone repos
Write-Host "Cloning local repos..."
mkdir ~/source
cd ~/source
git clone https://github.com/mwebb387/dotfiles
git clone https://github.com/mwebb387/nvim-config-bistro
