local function plugins()
  return {"w0rp/ale", "sheerun/vim-polyglot", "vim-scripts/utl.vim", "jiangmiao/auto-pairs", "tpope/vim-surround", "tpope/vim-speeddating", "tpope/vim-commentary", "tpope/vim-unimpaired", "kassio/neoterm", "mattn/emmet-vim", "junegunn/vim-slash", "tpope/vim-fugitive", "tommcdo/vim-fubitive", "junegunn/gv.vim", "airblade/vim-gitgutter", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter", "Olical/aniseed", "Olical/conjure", "omnisharp/omnisharp-vim", "leafOfTree/vim-svelte-plugin", "neoclide/coc.nvim", "kyazdani42/nvim-web-devicons", "junegunn/rainbow_parentheses.vim", "preservim/tagbar"}
end
local function configure()
  vim.opt["backup"] = false
  vim.opt["undofile"] = false
  vim.opt["swapfile"] = false
  vim.opt["hidden"] = true
  vim.opt["number"] = true
  vim.opt["showcmd"] = false
  vim.opt["showmode"] = false
  vim.opt["expandtab"] = true
  vim.opt["tabstop"] = 2
  vim.opt["shiftwidth"] = 2
  vim.opt["autoindent"] = true
  vim.opt["omnifunc"] = "syntaxcomplete#complete"
  do end (vim.opt.path):append("C:/Users/mwebb/AppData/Local/nvim/lua")
  vim.opt["splitbelow"] = true
  vim.opt["splitright"] = true
  vim.opt["ignorecase"] = true
  vim.opt["wildignore"] = "obj/**,bin/**,node_modules/**"
  vim.opt["grepprg"] = "rg --vimgrep --no-heading --smart-case"
  vim.opt["grepformat"] = "%f:%l:%c:%m,%f:%l:%m"
  vim.opt["cmdheight"] = 2
  vim.opt["updatetime"] = 300
  vim.opt["signcolumn"] = "yes"
  vim.opt["completeopt"] = "longest,menuone,preview"
  vim.opt["previewheight"] = 5
  vim.api.nvim_set_keymap("n", "H", "^", {noremap = true})
  vim.api.nvim_set_keymap("n", "L", "$", {noremap = true})
  return vim.api.nvim_set_keymap("i", "jk", "<esc>", {noremap = true})
end
return {configure = configure, plugins = plugins}