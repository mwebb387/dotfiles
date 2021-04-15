call plug#begin(stdpath('config').'/plugged/')
  " Linting and syntax
  Plug 'w0rp/ale'
  Plug 'sheerun/vim-polyglot'

  " Functionality
  " Plug 'junegunn/fzf'
  " Plug 'junegunn/fzf.vim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " Plug 'kien/ctrlp.vim'
  Plug 'vim-scripts/utl.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-commentary'
  " Plug 'jremmen/vim-ripgrep'
  Plug 'kassio/neoterm'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/vim-slash'

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'tommcdo/vim-fubitive'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'
  " Plug 'mhinz/vim-signify'
  " Plug 'jreybert/vimagit'

  " c#
  Plug 'omnisharp/omnisharp-vim'

  " javascript
  " Plug 'pangloss/vim-javascript'
  " Plug 'mxw/vim-jsx'
  " Plug 'posva/vim-vue'

  " svelte
  Plug 'leafOfTree/vim-svelte-plugin'

  " auto-complete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " look and feel
  Plug 'mhinz/vim-startify'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  " Plug 'junegunn/rainbow_parentheses.vim' 
 
  " themes
  Plug 'tomasiser/vim-code-dark'
  Plug 'ajmwagar/vim-deus'
  Plug 'whatyouhide/vim-gotham'
  Plug 'ntk148v/vim-horizon'
  Plug 'ludokng/vim-odyssey'
  Plug 'xdg/vim-darkluma'
  Plug 'nanotech/jellybeans.vim'
  Plug 'liuchengxu/space-vim-theme'

  " programs / extensions
  " Plug 'tpope/vim-vinegar'
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/tagbar'

  " presentation
  "Plug 'junegunn/goyo.vim'
  "Plug 'junegunn/limelight.vim'
call plug#end()

lua require('default_config').configure()

" if !has('nvim')
"   set nocompatible
"   filetype plugin indent on
"   syntax on
"   set background=dark
"   set termguicolors
"   set encoding=utf-8
"   set t_Co=256
"   set laststatus=2
" endif

" set nobackup
" set noundofile
" set noswapfile
" set hidden
" " set foldmethod=syntax
" set number
" set noshowcmd
" set noshowmode

" set expandtab tabstop=2 shiftwidth=2 autoindent
" " set path+=**
" set ignorecase

" set omnifunc=syntaxcomplete#complete

" " searching
" set wildignore+=obj/**,bin/**,node_modules/**
" set grepprg=rg
" " command -nargs=+ -complete=file -bar ag silent! grep! <args>|cwindow|redraw!

" custom key-maps
nnoremap H ^
nnoremap L $
imap jk <esc>
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
nnoremap <a-q> <c-w>q
inoremap <a-h> <c-w>h
inoremap <a-j> <c-w>j
inoremap <a-k> <c-w>k
inoremap <a-l> <c-w>l
inoremap <a-q> <c-w>q
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
tnoremap <a-q> <c-\><c-n><c-w>q
tnoremap <a-n> <c-\><c-n>
nnoremap <c-tab> :b#<cr>
nnoremap g<tab> :b#<cr>

" Insert mode mappings
imap <C-j> <c-o>j
imap <C-k> <c-o>k
imap <C-l> <c-o>l
imap <C-h> <c-o>h

" nnoremap <silent> <space>sb :Buffers<CR>
" nnoremap <silent> <space>sg :GFiles<CR>
" nnoremap <silent> <c-p> :GFiles<CR>
" nnoremap <silent> <space>sf :Files<CR>
nnoremap <silent> <space>gg :GV --all<CR>
nnoremap <silent> <space>gs :Git<CR>
"nnoremap <silent> <space>/ :call FzfRg()<CR>
nnoremap <silent> <space>n :NERDTreeToggle<CR>
" tnoremap <a-b> <c-\><c-n> :Buffers<CR>
" tnoremap <a-f> <c-\><c-n> :GFiles<CR>
" tnoremap <a-/> <c-\><c-n> :call FzfRg()<CR>

" Telescope mappings
nnoremap <silent> <space>sf <cmd>Telescope find_files<CR>
nnoremap <silent> <c-p> <cmd>Telescope git_files<CR>
nnoremap <silent> <space>sg <cmd>Telescope git_files<CR>
nnoremap <silent> <space>sb <cmd>Telescope buffers<CR>
nnoremap <silent> <space>ss <cmd>Telescope live_grep<CR>
nnoremap <silent> <space>sh <cmd>Telescope help_tags<CR>
nnoremap <silent> <space>so <cmd>Telescope oldfiles<CR>
tnoremap <a-b> <c-\><c-n> <cmd>Telescope buffers<CR>
tnoremap <a-f> <c-\><c-n> <cmd>Telescope find_files<CR>
tnoremap <a-/> <c-\><c-n> <cmd>Telescope live_grep<CR>
lua require('telescope_config')


" " Theme 
" set termguicolors
" colorscheme deus
lua require('theme_config').configure()

if exists('g:fvim_loaded')
  set guifont=Cascadia\ Code:h14
  exe 'FVimCursorSmoothMove v:true'
endif

" Startify
let g:startify_custom_header = [
  \ '   __   _ _______  _____  _    _ _____ _______',
  \ '   | \  | |______ |     |  \  /    |   |  |  |',
  \ '   |  \_| |______ |_____|   \/   __|__ |  |  |',
  \ ]

" Airline Setup
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

"Galaxyline
lua require('eviline')
" function! ConfigStatusLine()
"   lua require('eviline')
" endfunction

" augroup status_line_init
"   autocmd!
"   autocmd vimenter * call ConfigStatusLine()
" augroup end

" Signify
let g:signify_sign_add               = '|'
let g:signify_sign_delete            = '|'
let g:signify_sign_change            = '|'

" Git Gutter
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

" Rainbow Parentheses
" let g:rainbow#pairs = [['{','}']]
" augroup rainbow_parentheses
"   autocmd!
"   autocmd VimEnter * exe 'RainbowParentheses'
" augroup END

" AutoPars
let g:AutoPairsMapCh = 0

" ALE Setup
let g:ale_echo_cursor = 1
let g:ale_virtualtext_cursor = 0
let g:ale_cursor_detail = 0
let g:ale_set_balloons = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {
  \ 'cs': ['OmniSharp'],
  \ }

" FZF Setup
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" let g:fzf_preview_window=''
" function FzfRg()
"   call inputsave()
"   let env = input('Pattern -> ')
"   call inputrestore()
"   execute ':Rg ' . env
" endfunction

" " Ctrl-P Setup
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|node_modules\|public\/images\|public\/system\|data\|log\|tmp$',
"   \ 'file': '\.exe$\|\.so$\|\.dat$'
"   \ }

" NERDTree
let NERDTreeWinPos = 'right'

" JS specific options
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript.jsx setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cs let b:coc_root_patterns = ['*.sln', '.git', '.env']
autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.cshtml set syntax=html

command! EditConfig exe 'edit '.stdpath('config').'/init.vim'
command! Xonsh 20new +call\ termopen("python\ -m\ xonsh")

"================================================================
" COC Setup
" Better display for messages
" set cmdheight=2

" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" " don't give |ins-completion-menu| messages.
" set shortmess+=c

" " always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"================================================================


" OmniSharp config settings
let g:OmniSharp_server_stdio = 1
""let g:OmniSharp_server_stdio_quickload = 1

let g:OmniSharp_timeout = 50

"" Don't autoselect first omnicomplete option, show options even if there is only
"" one (so the preview documentation is accessible). Remove 'preview' if you
"" don't want to see any documentation whatsoever.
" set completeopt=longest,menuone,preview
" set previewheight=5

"" don't give |ins-completion-menu| messages.
"set shortmess+=c

" Update semantic highlighting on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'fzf'

" let g:OmniSharp_popup_options = {'winhl': 'Normal:NormalFloat'}
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ParameterName': 'csNewType',
\ 'LocalName': 'csNewType'
\}

augroup omnisharp_commands
    autocmd!

"    " Show type information automatically when the cursor stops moving
"    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs,cshtml nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs,cshtml nnoremap <buffer> gi :OmniSharpFindImplementations<CR>
    autocmd FileType cs,cshtml nnoremap <buffer> gs :OmniSharpFindSymbol<CR>
    autocmd FileType cs,cshtml nnoremap <buffer> gr :OmniSharpFindUsages<CR>
    autocmd FileType cs,cshtml nnoremap <buffer> K :OmniSharpDocumentation<CR>

"    " Finds members in the current buffer
"    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <c-x># :OmniSharpHighlightEcho<CR>
    autocmd FileType cs nnoremap <buffer> <c-x>u :OmniSharpFixUsings<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <c-x>K :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <c-x>K <C-o>:OmniSharpSignatureHelp<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <c-x>c :OmniSharpGlobalCodeCheck<CR>

    autocmd FileType cs inoremap <silent><expr> <C-Space> <C-x><c-o>

"    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <c-x>a :OmniSharpGetCodeActions<CR>

"    " Run code actions with text selected in visual mode to extract method
"    autocmd FileType cs xnoremap <Leader>ac :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <c-x>e :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <F2> :OmniSharpRename<CR>

"    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
"    autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

"    autocmd FileType cs nnoremap <Leader>f :OmniSharpCodeFormat<CR>

"    " Start the omnisharp server for the current solution
"    autocmd FileType cs nnoremap <Leader>ss :OmniSharpStartServer<CR>
"    autocmd FileType cs nnoremap <Leader>sp :OmniSharpStopServer<CR>
augroup END

function! GetSelection() abort
  return getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]]"'")"'")]"'")
endfunction

function! LuaQuery()
  call inputsave()
  let in = input('Lua -> ')
  call inputrestore()
  execute ':lua print(' . in . ')'
endfunction
autocmd FileType lua nnoremap <leader>q :call LuaQuery()<cr>
