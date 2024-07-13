" Leader
nnoremap <Space> <Nop>
let mapleader=" "
let localleader=" "

lua <<EOF
vim.keymap.set('n', '<up>', '<c-w>w')
vim.keymap.set('n', '<down>', '<c-w>W')
vim.keymap.set('n', '<right>', ':bn<CR>')
vim.keymap.set('n', '<left>', ':bp<CR>')

vim.cmd.packadd 'fluid'
require 'fluid'
-- UI
  :theme()
    :option('catppuccin')
  :devicons()
  :dressing()
  :statusline()
  :winbar()

-- Nvim
  :netrw()
  :quickfix()

-- Editor
  -- :asyncrun()
  :autopairs()
  :cmp()
  -- :comment()
  :fluidmotion()
    :options('win')
  :leap()
  :lsp()
    :options('icons', 'server_management')
  :surround()
  :treesitter()
   :options('highlight', 'incremental_selection', 'indent', 'folding')
  -- :nullls()
  :undotree()
  :vimslash()
  :whichkey()

-- Languages
  :csharp()
    :options('treesitter', 'lsp', 'fold')
  :css()
    :options('treesitter', 'lsp')
  :deno()
    :options('lsp')
  :emmet()
  -- :fennel()
  -- :fsharp()
  :graphql()
    :options('treesitter', 'lsp')
  :html()
    :options('lsp')
  :lualang()
    :options('lsp')
  :svelte()
    :options('treesitter', 'lsp')
  :typescript()
    :options('treesitter', 'lsp')
  :neorg()
  :tailwindcss()
  -- :vue()
  --  :options('lsp')

-- Tools
---> Git
  :gitsigns()
  :diffview()
  :rest()
  :syspackman()
    :options('scoop')
  -- :fugitive()
  -- :neogit()
  -- :lazygit()

---> File Browsers
  :oil()
  -- :nvimtree()
  -- :dirbuf()
  -- :dirvish()
  -- :vifm()

---> Fuzzy Finders
  :fzf()
    :options('lua')
  -- :telescope()

---> Terminal
  :fterm()

---> Other
  -- :devdocs()
  -- :images()

  :setup()
EOF

" nnoremap <a-h> <c-w>h
" nnoremap <a-j> <c-w>j
" nnoremap <a-k> <c-w>k
" nnoremap <a-l> <c-w>l

" nnoremap <a-H> <c-w>H
" nnoremap <a-J> <c-w>J
" nnoremap <a-K> <c-w>K
" nnoremap <a-L> <c-w>L

" nnoremap <a-q> <c-w>q

" inoremap <a-h> <c-w>h
" inoremap <a-j> <c-w>j
" inoremap <a-k> <c-w>k
" inoremap <a-l> <c-w>l
" inoremap <a-q> <c-w>q

" tnoremap <a-h> <c-\><c-n><c-w>h
" tnoremap <a-j> <c-\><c-n><c-w>j
" tnoremap <a-k> <c-\><c-n><c-w>k
" tnoremap <a-l> <c-\><c-n><c-w>l
" tnoremap <a-q> <c-\><c-n><c-w>q
" tnoremap <a-n> <c-\><c-n>

" nnoremap <c-tab> :b#<cr>
" nnoremap g<tab> :b#<cr>

" Insert mode mappings
" imap <C-j> <c-o>j
" imap <C-k> <c-o>k
" imap <C-l> <c-o>l
" imap <C-h> <c-o>h

" nnoremap <silent> <leader>sb :Buffers<CR>
" nnoremap <silent> <leader>sg :GFiles<CR>
" nnoremap <silent> <c-p> :GFiles<CR>
" nnoremap <silent> <leader>sf :Files<CR>
" nnoremap <silent> <leader>G :GV --all<CR>
" nnoremap <silent> <leader>gg :Git<CR>
" nnoremap <silent> <leader>gp :Git pull<CR>
" nnoremap <silent> <leader>gP :Git push<CR>
"nnoremap <silent> <leader>/ :call FzfRg()<CR>
" nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" tnoremap <a-b> <c-\><c-n> :Buffers<CR>
" tnoremap <a-f> <c-\><c-n> :GFiles<CR>
" tnoremap <a-/> <c-\><c-n> :call FzfRg()<CR>

" Buffer mappings
" nnoremap <leader>bd :bdelete<CR>
" nnoremap <leader>bl :buffers<CR>
" nnoremap <leader>bn :bnext<CR>
" nnoremap <leader>bp :bprevious<CR>

" Tab Mappings
" nnoremap <leader>tc :tabclose<CR>
" nnoremap <leader>tl :tabs<CR>
" nnoremap <leader>tn :tabnext<CR>
" nnoremap <leader>tp :tabprevious<CR>
" nnoremap <leader>tw :tabnew<CR>

" Telescope mappings
" nnoremap <silent> <leader>sf <cmd>Telescope find_files<CR>
" nnoremap <silent> <c-p> <cmd>Telescope git_files<CR>
" nnoremap <silent> <leader>sb <cmd>Telescope buffers<CR>
" nnoremap <silent> <leader>bs <cmd>Telescope buffers<CR>
" nnoremap <silent> <leader>sg <cmd>Telescope live_grep<CR>
" nnoremap <silent> <leader>sh <cmd>Telescope help_tags<CR>
" nnoremap <silent> <leader>so <cmd>Telescope oldfiles<CR>
" nnoremap <silent> <leader>sr <cmd>Telescope registers<CR>
" nnoremap <silent> <leader>sq <cmd>Telescope quickfix<CR>
" nnoremap <silent> <leader>sa <cmd>Telescope lsp_code_actions<CR>
" nnoremap <silent> <leader>sd <cmd>Telescope lsp_document_diagnostics<CR>
" nnoremap <silent> <leader>sD <cmd>Telescope lsp_workspace_diagnostics<CR>
" nnoremap <silent> <leader>ss <cmd>Telescope lsp_document_symbols<CR>

" nnoremap <silent> <leader>gb <cmd>Telescope git_branches<CR>
" nnoremap <silent> <leader>gc <cmd>Telescope git_commits<CR>
" nnoremap <silent> <leader>gf <cmd>Telescope git_files<CR>
" nnoremap <silent> <leader>gs <cmd>Telescope git_status<CR>
" nnoremap <silent> <leader>gS <cmd>Telescope git_stash<CR>

" tnoremap <a-b> <c-\><c-n> <cmd>Telescope buffers<CR>
" tnoremap <a-f> <c-\><c-n> <cmd>Telescope find_files<CR>
" tnoremap <a-/> <c-\><c-n> <cmd>Telescope live_grep<CR>
" lua require('telescope_config')

" Ultisnips
"let g:UltiSnipsExpandTrigger="<C-CR>"

" LSP Highlights
" highlight LspDiagnosticsDefaultError guifg=Red
" highlight LspDiagnosticsUnderlineError cterm=underline gui=underline guifg=Red guisp=Red
" sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError
" highlight LspDiagnosticsDefaultWarning guifg=Orange
" highlight LspDiagnosticsUnderlineWarning cterm=underline gui=underline guifg=Orange guisp=Orange
" sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning
" highlight LspDiagnosticsDefaultInfomation guifg=LightBlue
" highlight LspDiagnosticsUnderlineInformation cterm=underline gui=underline guifg=LightBlue guisp=LightBlue
" sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation
" highlight LspDiagnosticsDefaultHint guifg=LightGrey
" highlight LspDiagnosticsUnderlineHint cterm=underline gui=underline guifg=LightGrey guisp=LightGrey
" sign define LspDiagnosticsSignHint text=ﴕ texthl=LspDiagnosticsSignHint

" Treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   ensure_installed = {'javascript', 'typescript', 'svelte', 'css', 'scss', 'vue', 'c_sharp', 'tsx', 'python'},
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"   },
" }
" EOF
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" Airline Setup
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'deus'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" " LSP Signature
" lua require'lsp_signature'.on_attach()
" inoremap <silent> <c-K> lua require'lsp_signature'.signature()

"Galaxyline
" lua require('statusline')

" Signify
" let g:signify_sign_add = ''
" let g:signify_sign_delete = ''
" let g:signify_sign_change = ''


" Git Gutter
"let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'


" Rainbow Parentheses
" let g:rainbow#pairs = [['{','}']]
" augroup rainbow_parentheses
"   autocmd!
"   autocmd vimenter * exe 'rainbowparentheses'
" augroup end


" AutoPars
let g:AutoPairsMapCh = 0

" ALE Setup
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {
  \ 'cs': ['OmniSharp'],
  \ }


" Netrw and NvimTree
"
" let g:nvim_tree_disable_netrw = 0
" let g:nvim_tree_hijack_netrw = 1

" nnoremap - :Explore<CR>
"nnoremap <silent> <leader>f :20Lexplore<CR>
" nnoremap <silent> <leader>f :NvimTreeToggle<CR>

" JS specific options
" autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType javascript.jsx setlocal shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
" " autocmd FileType cs let b:coc_root_patterns = ['*.sln', '.git', '.env']
" autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab
" " autocmd BufNewFile,BufRead *.cshtml set syntax=html

" command! BrowseLua exe 'Explore '.stdpath('config').'/lua/'
command! EditConfig exe 'edit '.stdpath('config').'/init.vim'
" command! Xonsh 20new +call\ termopen('C:/Users/mwebb/xonsh/xonsh-env/Scripts/xonsh.exe')
" command! Powershell exe 'enew|call termopen("powershell")'

" function! GetSelection() abort
"   return getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]]"'")"'")]"'")
" endfunction
"
" function! LuaQuery()
"   call inputsave()
"   let in = input('Lua -> ')
"   call inputrestore()
"   execute ':lua print(' . in . ')'
" endfunction
" autocmd FileType lua nnoremap <leader>q :call LuaQuery()<cr>
