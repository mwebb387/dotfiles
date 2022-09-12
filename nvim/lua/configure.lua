local function _0_(bistro_0_)
  local function _1_(cmd)
    local bistro = require("bistro")
    local _let_0_ = cmd
    local args = _let_0_["args"]
    local _2_ = args
    if (_2_ == "build") then
      return bistro:build()
    elseif (_2_ == "edit") then
      return bistro:editConfig()
    elseif (_2_ == "refresh") then
      return bistro:refresh()
    elseif (_2_ == "plugins") then
      return bistro:loadPlugins(bistro.config.plugins)
    elseif (_2_ == "configure") then
      return bistro:setupRecipes()
    elseif (_2_ == "reconfigure") then
      bistro:refresh()
      return require("bistro"):setup()
    end
  end
  local function _2_(A, L, P)
    return {"build", "edit", "refresh", "plugins", "configure", "reconfigure"}
  end
  local function _3_()
    local root = vim.fn.stdpath("config")
    local lua_root = (root .. "/lua")
    local cmd = ("Explore " .. lua_root)
    return vim.cmd(cmd)
  end
  local function _4_()
    local root = vim.fn.stdpath("config")
    local file = (root .. "/init.vim")
    local cmd = ("edit " .. file)
    return vim.cmd(cmd)
  end
  local function _5_()
    local fterm = require("FTerm")
    return fterm.toggle()
  end
  local function _6_(input)
    local _let_0_ = input
    local args = _let_0_["args"]
    local _let_1_ = require("util")
    local map = _let_1_["map"]
    local cmd = ("edit " .. args)
    return vim.cmd(cmd)
  end
  local function _7_(A, L, P)
    local cmd = ("fd " .. A)
    return vim.fn.systemlist(cmd)
  end
  local function _8_(input)
    local _let_0_ = input
    local args = _let_0_["args"]
    local _let_1_ = require("util")
    local map = _let_1_["map"]
    local cmd = ("fd " .. args)
    local function _9_(path)
      return {filename = path, lnum = 0}
    end
    vim.fn.setqflist(map(vim.fn.systemlist(cmd), _9_))
    return vim.cmd("copen")
  end
  local function _9_(input)
    local _let_0_ = input
    local args = _let_0_["args"]
    local cmd = ("cexpr system('" .. vim.o.makeprg .. " " .. args .. "')")
    vim.cmd(cmd)
    return vim.cmd("cwindow")
  end
  local function _10_()
    vim.cmd("20new")
    local _let_0_ = require("util")
    local filter = _let_0_["filter"]
    local term_bufs
    local function _11_(v)
      return string.find(vim.api.nvim_buf_get_name(v), "term://")
    end
    term_bufs = filter(vim.api.nvim_list_bufs(), _11_)
    local terms = (#term_bufs > 0)
    if terms then
      return vim.api.nvim_win_set_buf(0, term_bufs[1])
    else
      return vim.fn.termopen("powershell")
    end
  end
  local function _11_()
    vim.cmd("enew")
    return vim.fn.termopen("powershell")
  end
  local function _12_()
    return vim.cmd("!npx prettier --check %")
  end
  local function _13_()
    return vim.cmd("!npx prettier --check --write %")
  end
  local function _14_(input)
    local _let_0_ = input
    local args = _let_0_["args"]
    local cmd = ("cexpr system('" .. vim.o.grepprg .. " " .. args .. "')")
    vim.cmd(cmd)
    return vim.cmd("cwindow")
  end
  local function _15_()
    vim.o.spell = not vim.o.spell
    if vim.o.spell then
      return print("Spell ON")
    else
      return print("Spell OFF")
    end
  end
  local function _16_()
    vim.o.relativenumber = not vim.o.relativenumber
    return nil
  end
  local function _17_()
    local wk = require("which-key")
    local surround = require("nvim-surround")
    wk.setup()
    return surround.setup()
  end
  local function _18_()
    local function _19_()
      if (vim.b.gitsigns_head and not (vim.b.gitsigns_head == "")) then
        return ("\238\156\165 " .. vim.b.gitsigns_head)
      else
        return ""
      end
    end
    SLGitBranch = _19_
    local function _20_()
      local clients = vim.lsp.buf_get_clients()
      if (clients and (#clients > 0)) then
        return ("\239\130\133 " .. clients[1].name)
      else
        return ""
      end
    end
    SLLSPServer = _20_
    local sl = require("statusline-util")
    vim.opt["statusline"] = (sl.highlight("String") .. sl.truncate() .. "  " .. sl.filename_tail() .. " " .. sl.highlight_group("Constant", sl.filetype(), sl.flag_preview(), sl.flag_quickfix(), sl.flag_modified(), sl.flag_readonly()) .. sl.separator() .. sl.highlight_group("Identifier", sl.eval_lua("SLGitBranch")) .. " " .. sl.highlight_group("Statement", sl.eval_lua("SLLSPServer")) .. sl.separator() .. sl.highlight("Type") .. "%-14.(" .. sl.current_line() .. ":" .. sl.current_column() .. "%)" .. "%-4.(" .. sl.visible_percent() .. "%)" .. "  ")
    return nil
  end
  local function _19_()
    return vim.cmd(("colorscheme " .. "base16-dracula"))
  end
  local function _20_()
    local fterm = require("FTerm")
    return fterm.setup({cmd = "powershell"})
  end
  local function _21_()
    return (require("neogit")).setup()
  end
  local function _22_()
    return (require("gitsigns")).setup()
  end
  local function configure_telescope()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    return telescope.setup({defaults = {mappings = {i = {["<c-h>"] = actions.move_to_top, ["<c-j>"] = actions.move_selection_next, ["<c-k>"] = actions.move_selection_previous, ["<c-l>"] = actions.move_to_bottom, ["<c-z>"] = actions.delete_buffer, ["<esc>"] = actions.close}}, prompt_prefix = "\239\156\177 ", selection_caret = "\239\129\161 "}})
  end
  local function configure()
    local ts = require("nvim-treesitter.configs")
    return ts.setup({ensure_installed = {"c_sharp", "fennel", "javascript", "typescript", "svelte", "css", "scss", "tsx"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "gnn", node_decremental = "grm", node_incremental = "grn", scope_incremental = "grc"}}, indent = {enable = true}})
  end
  local function _23_()
    do
      local fidget = require("fidget")
      fidget.setup()
    end
    vim.cmd("highlight DiagnosticsError guifg=Red")
    vim.cmd("highlight DiagnosticUnderlineError guisp=Red cterm=underline guifg=Red gui=underline")
    vim.cmd("sign define DiagnosticSignError text=\239\153\150 texthl=DiagnosticSignError")
    vim.cmd("highlight DiagnosticWarning guifg=Orange")
    vim.cmd("highlight DiagnosticUnderlineWarning guisp=Orange cterm=underline guifg=Orange gui=underline")
    vim.cmd("sign define DiagnosticSignWarn text=\239\148\165 texthl=DiagnosticSignWarn")
    vim.cmd("highlight DiagnosticInfomation guifg=LightBlue")
    vim.cmd("highlight DiagnosticUnderlineInformation guisp=LightBlue cterm=underline guifg=LightBlue gui=underline")
    vim.cmd("sign define DiagnosticSignInfo text=\239\159\187 texthl=LspDiagnosticSignInfo")
    vim.cmd("highlight DiagnosticHint guifg=LightGrey")
    vim.cmd("highlight DiagnosticUnderlineHint guisp=LightGrey cterm=underline guifg=LightGrey gui=underline")
    return vim.cmd("sign define DiagnosticSignHint text=\239\180\149 texthl=DiagnosticSignHint")
  end
  local function _24_()
    return (require("dapui")).setup()
  end
  local function _25_()
    local home = vim.fn.expand("~")
    local exe = (home .. "\\scoop\\apps\\netcoredbg\\current\\netcoredbg.exe")
    local dllpath = (vim.fn.getcwd() .. "\\bin\\Debug")
    local dap = require("dap")
    dap["adapters"]["netcoredbg"] = {args = {"--interpreter=vscode"}, command = exe, type = "executable"}
    local function _26_()
      return vim.fn.input("Path to DLL: ", dllpath, "file")
    end
    dap["configurations"]["cs"] = {{name = "launch - netcoredbg", program = _26_, request = "launch", type = "netcoredbg"}}
    return nil
  end
  local function _26_()
    local home = vim.fn.expand("~")
    local scriptPath = (home .. "\\.dap\\vscode-node-debug2\\out\\src\\nodeDebug.js")
    local config = {["sourceMaps:"] = true, args = {"--inspect", "${file}"}, cwd = vim.fn.getcwd(), envFile = (vim.fn.getcwd() .. "\\.env"), name = "Launch", request = "launch", runtimeArgs = {"-r", "ts-node/register"}, runtimeExecutable = "node", skipFiles = {"<node_internals>/**", "node_modules/**"}, type = "node2"}
    local dap = require("dap")
    dap["adapters"]["node2"] = {args = {scriptPath}, command = "node", type = "executable"}
    dap["configurations"]["typescript"] = {config}
    return nil
  end
  local function _27_()
    vim.cmd(("augroup " .. "chsarp-settings"))
    vim.cmd("autocmd!")
    do
      vim.cmd("autocmd filetype cs,cshtml compiler msbuild")
    end
    return vim.cmd("augroup END")
  end
  local function _28_()
    local _let_0_ = require("lsp")
    local on_attach = _let_0_["on-attach"]
    local pid = vim.fn.getpid()
    local home = vim.fn.expand("~")
    local cs_handlers = {["textDocument/definition"] = (require("omnisharp_extended"))[handler], ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})}
    local omnisharp_bin = (home .. "\\scoop\\apps\\omnisharp\\current\\OmniSharp.exe")
    local omnisharp_lsp = require("lspconfig")
    local omnisharp_cmd = {omnisharp_bin}
    return omnisharp_lsp.omnisharp.setup({cmd = {omnisharp_bin}, enable_roslyn_analyzers = true, handlers = cs_handlers, on_attach = on_attach})
  end
  local function configure_lsp()
    local lspconfig = require("lspconfig")
    local _let_0_ = require("lsp")
    local on_attach = _let_0_["on-attach"]
    return lspconfig.tsserver.setup({on_attach = on_attach})
  end
  local function configure_deno()
    local lspconfig = require("lspconfig")
    local _let_0_ = require("lsp")
    local on_attach = _let_0_["on-attach"]
    return lspconfig.denols.setup({autostart = false, on_attach = on_attach, root_dir = lspconfig.util.root_pattern({"deno.json", "deno.jsonp"})})
  end
  bistro_0_["config"] = {commands = {Bistro = {_1_, {complete = _2_, nargs = 1}}, BrowseLua = {_3_, {}}, EditConfig = {_4_, {}}, FTermToggle = {_5_, {}}, Fd = {_6_, {complete = _7_, nargs = 1}}, FdList = {_8_, {nargs = 1}}, Mk = {_9_, {nargs = "?"}}, NextTerminal = {_10_, {}}, Powershell = {_11_, {}}, PrettierCheck = {_12_, {}}, PrettierWrite = {_13_, {}}, Rg = {_14_, {nargs = 1}}}, globals = {user_emmet_leader_key = "<A-y>"}, keymaps = {{{"n"}, "H", "^", {}}, {{"n"}, "L", "$", {}}, {{"i"}, "jk", "<esc>", {}}, {{"n"}, "<c-tab>", ":b#<cr>", {}}, {{"n"}, "g<tab>", ":b#<cr>", {}}, {{"n", "i"}, "<a-h>", "<c-w>h", {}}, {{"n", "i"}, "<a-j>", "<c-w>j", {}}, {{"n", "i"}, "<a-k>", "<c-w>k", {}}, {{"n", "i"}, "<a-l>", "<c-w>l", {}}, {{"n", "i"}, "<a-H>", "<c-w>H", {}}, {{"n", "i"}, "<a-J>", "<c-w>J", {}}, {{"n", "i"}, "<a-K>", "<c-w>K", {}}, {{"n", "i"}, "<a-L>", "<c-w>L", {}}, {{"n", "i"}, "<a-q>", "<c-w>q", {}}, {{"n", "i"}, "<a-w>", "<c-w>w", {}}, {{"n", "i"}, "<a-d>", "<c-w>w<c-d><c-w>w", {}}, {{"n", "i"}, "<a-u>", "<c-w>w<c-u><c-w>w", {}}, {{"t"}, "<a-h>", "<c-\\><c-n><c-w>h", {}}, {{"t"}, "<a-j>", "<c-\\><c-n><c-w>j", {}}, {{"t"}, "<a-k>", "<c-\\><c-n><c-w>k", {}}, {{"t"}, "<a-l>", "<c-\\><c-n><c-w>l", {}}, {{"t"}, "<a-q>", "<c-\\><c-n><c-w>q", {}}, {{"t"}, "<a-w>", "<c-\\><c-n><c-w>w", {}}, {{"t"}, "<a-n>", "<c-\\><c-n>", {}}, {{"n"}, "]b", ":bnext<CR>", {}}, {{"n"}, "[b", ":bprevious<CR>", {}}, {{"n"}, "]t", ":tabnext<CR>", {}}, {{"n"}, "[t", ":tabprevious<CR>", {}}, {{"n"}, "]q", ":cnext<CR>", {}}, {{"n"}, "[q", ":cprevious<CR>", {}}, {{"n"}, "]l", ":lnext<CR>", {}}, {{"n"}, "[l", ":lprevious<CR>", {}}, {{"n"}, "]w", "<c-w>w", {}}, {{"n"}, "[w", "<c-w>W", {}}, {{"n"}, "<leader>s", _15_, {}}, {{"n"}, "<leader>r", _16_, {}}, {{"n"}, "<leader>b", ":buffer ", {}}, {{"n"}, "<leader>p", ":Fd ", {}}, {{"n"}, "<leader>/", ":grep ", {}}, {{"i"}, "<C-j>", "<c-o>j", {}}, {{"i"}, "<C-k>", "<c-o>k", {}}, {{"i"}, "<C-l>", "<c-o>l", {}}, {{"i"}, "<C-h>", "<c-o>h", {}}, {{"n"}, "<leader>Bb", ":Bistro build<CR>", {}}, {{"n"}, "<leader>BB", ":Bistro reconfigure<CR>", {}}, {{"n"}, "<leader>Br", ":Bistro refresh<CR>", {}}, {{"n"}, "<leader>Bp", ":Bistro plugins<CR>", {}}, {{"n"}, "<leader>Bc", ":Bistro configure<CR>", {}}, {{"n"}, "<M-`>", ":FTermToggle<CR>", {}}, {{"t"}, "<M-`>", "<c-\\><c-n>:FTermToggle<CR>", {}}, {{"n"}, "<leader>e", ":Explore<CR>", {}}, {{"n"}, "<leader>v", ":Vifm<CR>", {}}, {{"n"}, "<leader>G", ":GV --all<CR>", {noremap = true, silent = true}}, {{"n"}, "<leader>gp", ":Git pull<CR>", {noremap = true, silent = true}}, {{"n"}, "<leader>ff", "<cmd>Telescope find_files<CR>", {}}, {{"n"}, "<c-p>", "<cmd>Telescope git_files<CR>", {}}, {{"n"}, "<leader>fb", "<cmd>Telescope buffers<CR>", {}}, {{"n"}, "<leader>fg", "<cmd>Telescope live_grep<CR>", {}}, {{"n"}, "<leader>fh", "<cmd>Telescope help_tags<CR>", {}}, {{"n"}, "<leader>fo", "<cmd>Telescope oldfiles<CR>", {}}, {{"n"}, "<leader>fr", "<cmd>Telescope registers<CR>", {}}, {{"n"}, "<leader>fq", "<cmd>Telescope quickfix<CR>", {}}, {{"n"}, "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", {}}, {{"n"}, "<leader>fD", "<cmd>Telescope diagnostics<CR>", {}}, {{"n"}, "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", {}}, {{"n"}, "<leader>gb", "<cmd>Telescope git_branches<CR>", {}}, {{"n"}, "<leader>gc", "<cmd>Telescope git_commits<CR>", {}}, {{"n"}, "<leader>gf", "<cmd>Telescope git_files<CR>", {}}, {{"n"}, "<leader>gs", "<cmd>Telescope git_status<CR>", {}}, {{"n"}, "<leader>gS", "<cmd>Telescope git_stash<CR>", {}}, {{"t"}, "<a-f>", "<c-\\><c-n> <cmd>Telescope find_files<CR>", {}}, {{"t"}, "<a-/>", "<c-\\><c-n> <cmd>Telescope live_grep<CR>", {}}, {{"n", "i"}, "<F5>", ":lua require'dap'.continue()<CR>", {}}, {{"n", "i"}, "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", {}}, {{"n", "i"}, "<F10>", ":lua require'dap'.step_over()<CR>", {}}, {{"n", "i"}, "<F11>", ":lua require'dap'.step_into()<CR>", {}}, {{"n", "i"}, "<F12>", ":lua require'dap'.step_out()<CR>", {}}, {{"n"}, "<F3>", ":lua require'dapui'.toggle()<CR>", {}}}, options = {autoindent = true, cmdheight = 2, completeopt = "menuone,noinsert,noselect", expandtab = true, grepformat = "%f:%l:%c:%m,%f:%l:%m", grepprg = "rg --vimgrep --no-heading --smart-case", hidden = true, ignorecase = true, laststatus = 3, mouse = "a", number = true, omnifunc = "syntaxcomplete#Complete", path = {"C:/Users/mwebb/AppData/Local/nvim/lua", "append"}, previewheight = 5, shiftwidth = 2, showcmd = false, showmode = false, signcolumn = "yes", splitbelow = true, splitright = true, tabstop = 2, termguicolors = true, updatetime = 300, wildignore = "obj/**,bin/**,node_modules/**,CMS/**"}, plugins = {"vim-scripts/utl.vim", "jiangmiao/auto-pairs", "kylechui/nvim-surround", "tpope/vim-commentary", "mattn/emmet-vim", "junegunn/vim-slash", "folke/which-key.nvim", "stevearc/dressing.nvim", "kyazdani42/nvim-web-devicons", "RRethy/nvim-base16", "numToStr/FTerm.nvim", {"vifm/vifm.vim", {on = "Vifm"}}, "tpope/vim-fugitive", "tommcdo/vim-fubitive", {"junegunn/gv.vim", {on = "GV"}}, "TimUntersberger/neogit", "lewis6991/gitsigns.nvim", "sindrets/diffview.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig", "j-hui/fidget.nvim", "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "lifepillar/vim-mucomplete", "jlcrochet/vim-razor", "Hoffs/omnisharp-extended-lsp.nvim", {"bakpakin/fennel.vim", {["for"] = "fennel"}}}, setup = {_17_, _18_, _19_, _20_, _21_, _22_, configure_telescope, configure, _23_, _24_, _25_, _26_, _27_, _28_, configure_lsp, configure_deno}}
  return nil
end
return _0_