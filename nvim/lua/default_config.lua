local defaultModule = {}

function defaultModule.configure()
  local o = vim.o
  local wo = vim.wo

  -- -- set foldmethod=syntax
  o.backup = false
  o.undofile = false
  o.swapfile = false
  o.hidden = true
  wo.number = true
  o.showcmd = false
  o.showmode = false

  o.expandtab = true
  o.tabstop = 2
  o.shiftwidth = 2
  o.autoindent = true
  -- set path+=**
  o.ignorecase = true

  o.omnifunc = 'syntaxcomplete#complete'

  -- searching
  o.wildignore = 'obj/**,bin/**,node_modules/**'
  o.grepprg = 'rg'

  -- Better display for messages
  o.cmdheight = 2

  -- You will have bad experience for diagnostic messages when it's default 4000.
  o.updatetime = 300

  -- don't give |ins-completion-menu| messages.
  -- shortmess+=c

  -- always show signcolumns
  wo.signcolumn = 'yes'

  o.completeopt = 'longest,menuone,preview'
  o.previewheight = 5
  -- command -nargs=+ -complete=file -bar ag silent! grep! <args>|cwindow|redraw!
end

return defaultModule
