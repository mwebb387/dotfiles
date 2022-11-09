"call plug#begin(stdpath('config').'/plugged/')
"  " Linting and syntax
"  Plug 'w0rp/ale'
"  Plug 'sheerun/vim-polyglot'
"
"  " Functionality
"  " Plug 'junegunn/fzf'
"  " Plug 'junegunn/fzf.vim'
"  Plug 'vim-scripts/utl.vim'
"  Plug 'jiangmiao/auto-pairs'
"  Plug 'tpope/vim-surround'
"  Plug 'tpope/vim-speeddating'
"  Plug 'tpope/vim-commentary'
"  Plug 'tpope/vim-unimpaired'
"  Plug 'kassio/neoterm'
"  Plug 'mattn/emmet-vim'
"  Plug 'junegunn/vim-slash'
"
"  " git
"  Plug 'tpope/vim-fugitive'
"  Plug 'tommcdo/vim-fubitive'
"  Plug 'junegunn/gv.vim'
"  Plug 'airblade/vim-gitgutter'
"
"  if has('nvim')
"    " LSP, Telescope and Treesitter
"    Plug 'nvim-lua/popup.nvim'
"    Plug 'nvim-lua/plenary.nvim'
"    Plug 'nvim-telescope/telescope.nvim'
"    Plug 'neovim/nvim-lspconfig'
"    "Plug 'ray-x/lsp_signature.nvim'
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"    "Plug 'hrsh7th/nvim-compe'
"    "Plug 'hrsh7th/vim-vsnip'
"    "Plug 'rafamadriz/friendly-snippets'
"
"    "Aniseed and Conjure
"    Plug 'Olical/aniseed', { 'tag': 'v3.20.0' }
"    Plug 'Olical/conjure', { 'tag': 'v4.22.1' }
"  endif
"
"  " c#
"  Plug 'omnisharp/omnisharp-vim'
"
"  " javascript
"  " Plug 'pangloss/vim-javascript'
"  " Plug 'mxw/vim-jsx'
"  " Plug 'posva/vim-vue'
"
"  " svelte
"  Plug 'leafOfTree/vim-svelte-plugin'
"
"  " auto-complete
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"  " look and feel
"  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
"  "Plug 'ryanoasis/vim-devicons'
"  Plug 'kyazdani42/nvim-web-devicons'
"  Plug 'junegunn/rainbow_parentheses.vim' 
"
"  " themes
"  Plug 'tomasiser/vim-code-dark'
"  "Plug 'ajmwagar/vim-deus'
"  Plug 'theniceboy/nvim-deus'
"  Plug 'whatyouhide/vim-gotham'
"  Plug 'ntk148v/vim-horizon'
"  Plug 'ludokng/vim-odyssey'
"  Plug 'xdg/vim-darkluma'
"  "Plug 'challenger-deep-theme/vim'
"  Plug 'maksimr/Lucius2'
"  Plug 'nightsense/cosmic_latte'
"  Plug 'Nequo/vim-allomancer'
"  "Plug 'koirand/tokyo-metro.vim'
"  Plug 'folke/tokyonight.nvim'
"  "Plug 'hzchirs/vim-material'
"  Plug 'marko-cerovac/material.nvim'
"  Plug 'arcticicestudio/nord-vim'
"  Plug 'nanotech/jellybeans.vim'
"  Plug 'NLKNguyen/papercolor-theme'
"  Plug 'AlessandroYorba/Arcadia'
"  Plug 'crater2150/vim-theme-chroma'
"  Plug 'bcicen/vim-vice'
"  Plug 'dracula/vim'
"  Plug 'vim-scripts/proton'
"  Plug 'junegunn/seoul256.vim'
"  Plug 'wojciechkepka/bogster'
"
"  " programs / extensions
"  " Plug 'tpope/vim-vinegar'
"  " Plug 'scrooloose/nerdtree'
"  Plug 'preservim/tagbar'
"
"  " Snippets
"  "Plug 'SirVer/ultisnips'
"  "Plug 'honza/vim-snippets'
"
"  " presentation
"  "Plug 'junegunn/goyo.vim'
"  "Plug 'junegunn/limelight.vim'
"call plug#end()

"lua require('default_config').configure()

" Temp disable OmniSharp Vim
"if has('nvim')
"  "lua require('lsp/omnisharp')
"  "lua require('lsp/tsserver')
"  "lua require('lsp/css-langserver')

"  "lua vim.lsp.set_log_level("debug")
"  "command! LspLog lua vim.cmd('e '..vim.lsp.get_log_path())

"  let g:conjure#filetype#fennel = "conjure.client.fennel.stdio"
"endif



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
" set path+=C:/Users/mwebb/AppData/Local/nvim/lua/
" set ignorecase

" set omnifunc=syntaxcomplete#complete

" " searching
" set wildignore+=obj/**,bin/**,node_modules/**
" set grepprg=rg
" " command -nargs=+ -complete=file -bar ag silent! grep! <args>|cwindow|redraw!

" Leader
nnoremap <Space> <Nop>
let mapleader=" "
let localleader=" "


lua <<EOF
require'bistro':setup()
EOF

" custom key-maps
"nnoremap H ^
"nnoremap L $
"imap jk <esc>

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

" Theme 
"lua require('theme_config').configure[[tokyonight]]

" TODO: random theme stuff
"
" Theme randomization
" function! RandomTheme()
"   lua require('theme_config').randomTheme()
"   colorscheme
" endfunction
" command! RandTheme exe 'call RandomTheme()'
" nnoremap <F12> :RandTheme<CR>

" Reset highlights on theme change
" augroup Theme
"   autocmd!
"   autocmd ColorScheme * lua require('statusline').resetHighlights()
" augroup END

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

" " Compe
" lua <<EOF
" require'compe'.setup {
"   enabled = true;
"   autocomplete = true;
"   debug = false;
"   min_length = 1;
"   preselect = 'enable';
"   throttle_time = 80;
"   source_timeout = 200;
"   resolve_timeout = 800;
"   incomplete_delay = 400;
"   max_abbr_width = 100;
"   max_kind_width = 100;
"   max_menu_width = 100;
"   documentation = true;

"   source = {
"     path = true;
"     buffer = true;
"     calc = true;
"     nvim_lsp = true;
"     nvim_lua = false;
"     vsnip = true;
"     ultisnips = false;
"   };
" }
" EOF

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

" FZF Setup
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" let g:fzf_preview_window=''
" function FzfRg()
"   call inputsave()
"   let env = input('Pattern -> ')
"   call inputrestore()
"   execute ':Rg ' . env
" endfunction

" Netrw and NvimTree
"
" let g:nvim_tree_disable_netrw = 0
" let g:nvim_tree_hijack_netrw = 1

" nnoremap - :Explore<CR>
"nnoremap <silent> <leader>f :20Lexplore<CR>
" nnoremap <silent> <leader>f :NvimTreeToggle<CR>

" JS specific options
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript.jsx setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType cs let b:coc_root_patterns = ['*.sln', '.git', '.env']
autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab
" autocmd BufNewFile,BufRead *.cshtml set syntax=html

" command! BrowseLua exe 'Explore '.stdpath('config').'/lua/'
" command! EditConfig exe 'edit '.stdpath('config').'/init.vim'
" command! Xonsh 20new +call\ termopen('C:/Users/mwebb/xonsh/xonsh-env/Scripts/xonsh.exe')
" command! Powershell exe 'enew|call termopen("powershell")'

" function! TerminalTest()
"   exe "20new|call termopen('powershell')"
" endfunction

" nnoremap <M-`> :call TerminalTest()<cr>
" tnoremap <M-`> <C-\><C-n><C-w><C-q> 

" Custom tabline
" function MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " select the highlighting
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif

"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (i + 1) . 'T'

"     " the label is made by MyTabLabel()
"     let s .= '  %{MyTabLabel(' . (i + 1) . ')}  '
"   endfor

"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'

"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999XClose'
"   endif

"   return s
" endfunction

" function MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   let fname = bufname(buflist[winnr - 1])
"   return fnamemodify(fname, ":t")
" endfunction

" set tabline=%!MyTabLine()

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
" --- inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ compe#complete()
" --- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" --- function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <c-space> compe#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? compe#confirm('<CR>') : "\<C-g>u\<CR>"
" --- inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Navigate diagnostics
"nmap <silent> <leader>lcn <Plug>(coc-diagnostic-prev)
"nmap <silent> <leader>lcp <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" --- nmap <silent> gd <Plug>(coc-definition)
" --- nmap <silent> gy <Plug>(coc-type-definition)
" --- nmap <silent> gi <Plug>(coc-implementation)
" --- nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" --- nnoremap <silent> K :call <SID>show_documentation()<CR>

" ---function! s:show_documentation()
" ---  if (index(['vim','help'], &filetype) >= 0)
" ---    execute 'h '.expand('<cword>')
" ---  else
" ---    call CocAction('doHover')
" ---    " lua vim.lsp.buf.hover()
" ---  endif
" ---endfunction

" Highlight symbol under cursor on CursorHold
" --- autocmd CursorHold * silent call CocActionAsync('highlight')
"autocmd CursorHold * silent lua vim.lsp.buf.document_highlight()

" Remap for rename current word
" --- nmap <leader>lcrn <Plug>(coc-rename)
"nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
" --- xmap <leader>lcf  <Plug>(coc-format-selected)
" --- nmap <leader>lcf  <Plug>(coc-format-selected)

" --- augroup mygroup
" ---   autocmd!
" ---   " Setup formatexpr specified filetype(s).
" ---   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" ---   " Update signature help on jump placeholder
" ---   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" --- augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" --- xmap <leader>lca  <Plug>(coc-codeaction-selected)
" --- nmap <leader>lca  <Plug>(coc-codeaction-selected)
" --- nnoremap <leader>. <Plug>(coc-codeaction)
 

" Remap for do codeAction of current line
"nmap <leader>lcac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
"nmap <leader>lcqf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <leader>lcd  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <leader>lce  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <leader>lcc  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <leader>lco  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <leader>lcs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
"================================================================


" OmniSharp config settings
" let g:OmniSharp_server_stdio = 1
""let g:OmniSharp_server_stdio_quickload = 1

"let g:OmniSharp_timeout = 50

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
" set completeopt=longest,menuone,preview
"set completeopt=longest,menuone,noselect,preview
"set previewheight=5

"" don't give |ins-completion-menu| messages.
"set shortmess+=c

" Update semantic highlighting on BufEnter and InsertLeave
"let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'fzf'

" let g:OmniSharp_popup_options = {'winhl': 'Normal:NormalFloat'}
" let g:OmniSharp_popup_mappings = {
" \ 'sigNext': '<C-n>',
" \ 'sigPrev': '<C-p>',
" \ 'pageDown': ['<C-f>', '<PageDown>'],
" \ 'pageUp': ['<C-b>', '<PageUp>']
" \}

" let g:OmniSharp_highlight_groups = {
" \ 'ParameterName': 'csNewType',
" \ 'LocalName': 'csNewType'
" \}

" function! SetMSBuild()
"   set errorformat=\ %#%f(%l\\\,%c):\ %m
"   set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ $*
" endfunction
" command! SetMSBuild call SetMSBuild()

" function! SetDotnet()
"   set errorformat=\ %#%f(%l\\\,%c):\ %m
"   set makeprg=dotnet\ build\ /property:GenerateFullPaths=true
" endfunction
" command! SetDotnet call SetDotnet()


" augroup omnisharp_commands
"     autocmd!

" "    " show type information automatically when the cursor stops moving
" "    autocmd cursorhold *.cs call omnisharp#typelookupwithoutdocumentation()

"     " the following commands are contextual, based on the cursor position.
"     " autocmd filetype cs,cshtml nnoremap <buffer> gd :OmniSharpGotoDefinition<cr>
"     autocmd filetype cs,cshtml nnoremap <buffer> gi :OmniSharpFindImplementations<cr>
"     autocmd filetype cs,cshtml nnoremap <buffer> gs :OmniSharpFindSymbol<cr>
"     autocmd filetype cs,cshtml nnoremap <buffer> gr :OmniSharpFindUsages<cr>
"     autocmd filetype cs,cshtml nnoremap <buffer> K :OmniSharpDocumentation<cr>

" "    " finds members in the current buffer
" "    autocmd filetype cs nnoremap <buffer> <leader>fm :OmniSharpFindMembers<cr>

"     autocmd filetype cs nnoremap <buffer> <leader>lh :OmniSharpHighlightEcho<cr>
"     autocmd filetype cs nnoremap <buffer> <leader>lx :OmniSharpFixUsings<cr>
"     autocmd filetype cs nnoremap <buffer> <leader>lt :OmniSharpTypeLookup<cr>
"     autocmd filetype cs nnoremap <buffer> <leader>k :OmniSharpSignatureHelp<cr>
"     autocmd filetype cs inoremap <buffer> <c-k> <c-o>:OmniSharpSignatureHelp<cr>

"     " find all code errors/warnings for the current solution and populate the quickfix window
"     autocmd filetype cs nnoremap <buffer> <leader>lc :OmniSharpGlobalCodeCheck<cr>

"     " autocmd filetype cs inoremap <silent><expr> <c-space> <c-x><c-o>

" "    " contextual code actions (uses fzf, ctrlp or unite.vim when available)
"     autocmd filetype cs nnoremap <leader>la :OmniSharpGetCodeActions<cr>
"     " autocmd filetype cs nnoremap <C-.> :OmniSharpGetCodeActions<cr>

" "    " run code actions with text selected in visual mode to extract method
" "    autocmd filetype cs xnoremap <leader>ac :call omnisharp#getcodeactions('visual')<cr>

"     " rename with dialog
"     autocmd filetype cs nnoremap <leader>le :OmniSharpRename<cr>
"     autocmd filetype cs nnoremap <f2> :OmniSharpRename<cr>

" "    " rename without dialog - with cursor on the symbol to rename: `:rename newname`
" "    autocmd filetype cs command! -nargs=1 rename :call omnisharp#renameto("<args>")

"     autocmd filetype cs nnoremap <leader>l= :OmniSharpCodeFormat<cr>

"     " start the omnisharp server for the current solution
"     autocmd filetype cs nnoremap <leader>loss :OmniSharpStartServer<cr>
"     autocmd filetype cs nnoremap <leader>losr :OmniSharpRestartServer<cr>
"     autocmd filetype cs nnoremap <leader>losp :OmniSharpStopServer<cr>
" augroup end

" Redefine Fzf commands

let s:batOpts = 'bat --color always --style changes --theme Coldark-Dark -m *.fnl:Lisp {}'
" let s:fzfOpts = {'options': ['--preview', s:batOpts, '--bind', 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up']}
let s:fzfOpts = {'options': ['--preview', 'powershell -noprofile fzf-preview.ps1 "files" {}', '--bind', 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up']}
let s:fzfGitOpts = {'options': ['--preview', 'git diff {}', '--bind', 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up']}
" let s:OmniSharp_highlight_groups = {
" \ 'ParameterName': 'csNewType',
" \ 'LocalName': 'csNewType'
" \}
" command!      -bang -nargs=? -complete=dir Files       call fzf#vim#files(<q-args>, s:fzfOpts, <bang>0)
" command!      -bang -nargs=? GitFiles                  call fzf#vim#gitfiles(<q-args>, s:fzfOpts, <bang>0)
" command!      -bang -nargs=? GFiles                    call fzf#vim#gitfiles(<q-args>, s:fzfOpts, <bang>0)
" command! -bar -bang -nargs=? -complete=buffer Buffers  call fzf#vim#buffers(<q-args>, s:fzfOpts, <bang>0)
" command!      -bang -nargs=* Lines                     call fzf#vim#lines(<q-args>, <bang>0)
" command!      -bang -nargs=* BLines                    call fzf#vim#buffer_lines(<q-args>, <bang>0)
" command! -bar -bang Colors                             call fzf#vim#colors(<bang>0)
" command!      -bang -nargs=+ -complete=dir Locate      call fzf#vim#locate(<q-args>, s:fzfOpts, <bang>0)
" command!      -bang -nargs=* Ag                        call fzf#vim#ag(<q-args>, s:fzfOpts, <bang>0)
" command!      -bang -nargs=* Rg                        call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, s:fzfOpts, <bang>0)
" command!      -bang -nargs=* Tags                      call fzf#vim#tags(<q-args>, s:fzfOpts, <bang>0)
" command!      -bang -nargs=* BTags                     call fzf#vim#buffer_tags(<q-args>, s:fzfOpts, <bang>0)
" command! -bar -bang Snippets                           call fzf#vim#snippets(<bang>0)
" command! -bar -bang Commands                           call fzf#vim#commands(<bang>0)
" command! -bar -bang Marks                              call fzf#vim#marks(<bang>0)
" command! -bar -bang Helptags                           call fzf#vim#helptags(s:fzfOpts, <bang>0)
" command! -bar -bang Windows                            call fzf#vim#windows(<bang>0)
" command! -bar -bang -range=% Commits                   let b:fzf_winview = winsaveview() | <line1>,<line2>call fzf#vim#commits(s:fzfOpts, <bang>0)
" command! -bar -bang -range=% BCommits                  let b:fzf_winview = winsaveview() | <line1>,<line2>call fzf#vim#buffer_commits(s:fzfOpts, <bang>0)
" command! -bar -bang Maps                               call fzf#vim#maps("n", <bang>0)
" command! -bar -bang Filetypes                          call fzf#vim#filetypes(<bang>0)
" command!      -bang -nargs=* History                   call s:history(<q-args>, s:fzfOpts, <bang>0)

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
