local function _1_(bistro_12_auto)
  local function _2_(cmd)
    local bistro = require("bistro")
    local _let_3_ = cmd
    local args = _let_3_["args"]
    local _4_ = args
    if (_4_ == "build") then
      return bistro:build()
    elseif (_4_ == "edit") then
      return bistro:editConfig()
    elseif (_4_ == "refresh") then
      return bistro:refresh()
    elseif (_4_ == "plugins") then
      return bistro:loadPlugins(bistro.config.plugins)
    elseif (_4_ == "configure") then
      return bistro:setupRecipes()
    elseif (_4_ == "reconfigure") then
      bistro:refresh()
      return require("bistro"):setup()
    else
      return nil
    end
  end
  local function _6_(A, L, P)
    return {"build", "edit", "refresh", "plugins", "configure", "reconfigure"}
  end
  local function _7_()
    local root = vim.fn.stdpath("config")
    local lua_root = (root .. "/lua")
    local cmd = ("Explore " .. lua_root)
    return vim.cmd(cmd)
  end
  local function _8_()
    vim.cmd("enew")
    return vim.fn.termopen("powershell Dotnet-Watch-Dev")
  end
  local function _9_()
    local root = vim.fn.stdpath("config")
    local file = (root .. "/init.vim")
    local cmd = ("edit " .. file)
    return vim.cmd(cmd)
  end
  local function _10_()
    local fterm = require("FTerm")
    return fterm.toggle()
  end
  local function _11_(input)
    local _let_12_ = input
    local args = _let_12_["args"]
    local _let_13_ = require("util")
    local map = _let_13_["map"]
    local cmd = ("edit " .. args)
    return vim.cmd(cmd)
  end
  local function _14_(A, L, P)
    local cmd = ("fd " .. A)
    return vim.fn.systemlist(cmd)
  end
  local function _15_(input)
    local _let_16_ = input
    local args = _let_16_["args"]
    local _let_17_ = require("util")
    local map = _let_17_["map"]
    local cmd = ("fd " .. args)
    local function _18_(path)
      return {filename = path, lnum = 0}
    end
    vim.fn.setqflist(map(vim.fn.systemlist(cmd), _18_))
    return vim.cmd("copen")
  end
  local function _19_(input)
    local _let_20_ = input
    local args = _let_20_["args"]
    local cmd = ("cexpr system('" .. vim.o.makeprg .. " " .. args .. "')")
    vim.cmd(cmd)
    return vim.cmd("cwindow")
  end
  local function _21_()
    vim.cmd("20new")
    local _let_22_ = require("util")
    local filter = _let_22_["filter"]
    local term_bufs
    local function _23_(v)
      return string.find(vim.api.nvim_buf_get_name(v), "term://")
    end
    term_bufs = filter(vim.api.nvim_list_bufs(), _23_)
    local terms = (#term_bufs > 0)
    if terms then
      return vim.api.nvim_win_set_buf(0, term_bufs[1])
    else
      return vim.fn.termopen("powershell")
    end
  end
  local function _25_()
    vim.cmd("enew")
    return vim.fn.termopen("powershell Npm-Run")
  end
  local function _26_()
    vim.cmd("enew")
    return vim.fn.termopen("powershell Npm-Start")
  end
  local function _27_()
    vim.cmd("enew")
    return vim.fn.termopen("powershell")
  end
  local function _28_()
    return vim.cmd("!npx prettier --check %")
  end
  local function _29_()
    return vim.cmd("!npx prettier --check --write %")
  end
  local function _30_(input)
    local _let_31_ = input
    local args = _let_31_["args"]
    local cmd = ("cexpr system('" .. vim.o.grepprg .. " " .. args .. "')")
    vim.cmd(cmd)
    return vim.cmd("cwindow")
  end
  local function _32_()
    vim.o.spell = not vim.o.spell
    if vim.o.spell then
      return print("Spell ON")
    else
      return print("Spell OFF")
    end
  end
  local function _34_()
    vim.o.relativenumber = not vim.o.relativenumber
    return nil
  end
  local function _35_()
    local wk = require("which-key")
    local surround = require("nvim-surround")
    wk.setup()
    return surround.setup()
  end
  local function _36_()
    local function _37_()
      if (vim.b.gitsigns_head and not (vim.b.gitsigns_head == "")) then
        return ("\238\156\165 " .. vim.b.gitsigns_head)
      else
        return ""
      end
    end
    SLGitBranch = _37_
    local function _39_()
      local clients = vim.lsp.buf_get_clients()
      if (clients and (#clients > 0)) then
        return ("\239\130\133 " .. clients[1].name)
      else
        return ""
      end
    end
    SLLSPServer = _39_
    local sl = require("statusline-util")
    do end (vim.opt)["statusline"] = (sl.highlight("String") .. sl.truncate() .. "  " .. sl.filename_tail() .. " " .. sl.highlight_group("Constant", sl.filetype(), sl.flag_preview(), sl.flag_quickfix(), sl.flag_modified(), sl.flag_readonly()) .. sl.separator() .. sl.highlight_group("Identifier", sl.eval_lua("SLGitBranch")) .. " " .. sl.highlight_group("Statement", sl.eval_lua("SLLSPServer")) .. sl.separator() .. sl.highlight("Type") .. "%-14.(" .. sl.current_line() .. ":" .. sl.current_column() .. "%)" .. "%-4.(" .. sl.visible_percent() .. "%)" .. "  ")
    return nil
  end
  local function _41_()
    local sl = require("statusline-util")
    do end (vim.opt)["winbar"] = sl.highlight_group("User2", sl.filename_relative(), " [", sl.buffer_number(), "] ")
    return nil
  end
  local function _42_()
    return vim.cmd(("colorscheme " .. "base16-catppuccin"))
  end
  local function _43_()
    local fterm = require("FTerm")
    return fterm.setup({cmd = "powershell"})
  end
  local function _44_()
    return (require("gitsigns")).setup()
  end
  local function configure_telescope()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    return telescope.setup({defaults = {mappings = {i = {["<esc>"] = actions.close, ["<c-h>"] = actions.move_to_top, ["<c-j>"] = actions.move_selection_next, ["<c-k>"] = actions.move_selection_previous, ["<c-l>"] = actions.move_to_bottom, ["<c-z>"] = actions.delete_buffer}}, prompt_prefix = "\239\156\177 ", selection_caret = "\239\129\161 "}})
  end
  local function configure()
    local ts = require("nvim-treesitter.configs")
    return ts.setup({ensure_installed = {"c_sharp", "fennel", "javascript", "typescript", "svelte", "css", "scss", "tsx"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}}, indent = {enable = true}})
  end
  local function _45_()
    do
      local fidget = require("fidget")
      fidget.setup()
    end
    vim.cmd("highlight DiagnosticsError guifg=Red")
    vim.cmd("highlight DiagnosticUnderlineError gui=underline guifg=Red guisp=Red cterm=underline")
    vim.cmd("sign define DiagnosticSignError texthl=DiagnosticSignError text=\239\153\150")
    vim.cmd("highlight DiagnosticWarning guifg=Orange")
    vim.cmd("highlight DiagnosticUnderlineWarning gui=underline guifg=Orange guisp=Orange cterm=underline")
    vim.cmd("sign define DiagnosticSignWarn texthl=DiagnosticSignWarn text=\239\148\165")
    vim.cmd("highlight DiagnosticInfomation guifg=LightBlue")
    vim.cmd("highlight DiagnosticUnderlineInformation gui=underline guifg=LightBlue guisp=LightBlue cterm=underline")
    vim.cmd("sign define DiagnosticSignInfo texthl=LspDiagnosticSignInfo text=\239\159\187")
    vim.cmd("highlight DiagnosticHint guifg=LightGrey")
    vim.cmd("highlight DiagnosticUnderlineHint gui=underline guifg=LightGrey guisp=LightGrey cterm=underline")
    return vim.cmd("sign define DiagnosticSignHint texthl=DiagnosticSignHint text=\239\180\149")
  end
  local function _46_()
    return (require("dapui")).setup()
  end
  local function _47_()
    local home = vim.fn.expand("~")
    local exe = (home .. "\\scoop\\apps\\netcoredbg\\current\\netcoredbg.exe")
    local dllpath = (vim.fn.getcwd() .. "\\bin\\Debug")
    local dap = require("dap")
    do end (dap)["adapters"]["netcoredbg"] = {type = "executable", command = exe, args = {"--interpreter=vscode"}}
    local function _48_()
      return vim.fn.input("Path to DLL: ", dllpath, "file")
    end
    dap["configurations"]["cs"] = {{type = "netcoredbg", name = "launch - netcoredbg", request = "launch", program = _48_}}
    return nil
  end
  local function _49_()
    local home = vim.fn.expand("~")
    local scriptPath = (home .. "\\.dap\\vscode-node-debug2\\out\\src\\nodeDebug.js")
    local config = {type = "node2", name = "Launch", request = "launch", args = {"--inspect", "${file}"}, cwd = vim.fn.getcwd(), envFile = (vim.fn.getcwd() .. "\\.env"), runtimeArgs = {"-r", "ts-node/register"}, runtimeExecutable = "node", skipFiles = {"<node_internals>/**", "node_modules/**"}, ["sourceMaps:"] = true}
    local dap = require("dap")
    do end (dap)["adapters"]["node2"] = {type = "executable", command = "node", args = {scriptPath}}
    dap["configurations"]["typescript"] = {config}
    return nil
  end
  local function _50_()
    vim.cmd(("augroup " .. "chsarp-settings"))
    vim.cmd("autocmd!")
    do
      vim.cmd("autocmd filetype cs,cshtml compiler msbuild")
    end
    return vim.cmd("augroup END")
  end
  local function _51_()
    local _let_52_ = require("lsp")
    local on_attach = _let_52_["on-attach"]
    local pid = vim.fn.getpid()
    local home = vim.fn.expand("~")
    local cs_handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false}), ["textDocument/definition"] = (require("omnisharp_extended"))[handler]}
    local omnisharp_bin = "omnisharp.exe"
    local omnisharp_lsp = require("lspconfig")
    local omnisharp_cmd = {omnisharp_bin}
    return omnisharp_lsp.omnisharp.setup({cmd = {omnisharp_bin}, enable_roslyn_analyzers = true, on_attach = on_attach, handlers = cs_handlers})
  end
  local function configure_lsp()
    local lspconfig = require("lspconfig")
    local _let_53_ = require("lsp")
    local on_attach = _let_53_["on-attach"]
    return lspconfig.tsserver.setup({on_attach = on_attach})
  end
  local function configure_deno()
    local lspconfig = require("lspconfig")
    local _let_54_ = require("lsp")
    local on_attach = _let_54_["on-attach"]
    return lspconfig.denols.setup({on_attach = on_attach, root_dir = lspconfig.util.root_pattern({"deno.json", "deno.jsonp"}), autostart = false})
  end
  bistro_12_auto["config"] = {commands = {Bistro = {_2_, {complete = _6_, nargs = 1}}, BrowseLua = {_7_, {}}, DotnetWatchDev = {_8_, {}}, EditConfig = {_9_, {}}, FTermToggle = {_10_, {}}, Fd = {_11_, {complete = _14_, nargs = 1}}, FdList = {_15_, {nargs = 1}}, Mk = {_19_, {nargs = "?"}}, NextTerminal = {_21_, {}}, NpmRun = {_25_, {}}, NpmStart = {_26_, {}}, Powershell = {_27_, {}}, PrettierCheck = {_28_, {}}, PrettierWrite = {_29_, {}}, Rg = {_30_, {nargs = 1}}}, globals = {user_emmet_leader_key = "<A-y>"}, keymaps = {{{"n"}, "H", "^", {}}, {{"n"}, "L", "$", {}}, {{"i"}, "jk", "<esc>", {}}, {{"n"}, "<c-tab>", ":b#<cr>", {}}, {{"n"}, "g<tab>", ":b#<cr>", {}}, {{"n", "i"}, "<a-h>", "<c-w>h", {}}, {{"n", "i"}, "<a-j>", "<c-w>j", {}}, {{"n", "i"}, "<a-k>", "<c-w>k", {}}, {{"n", "i"}, "<a-l>", "<c-w>l", {}}, {{"n", "i"}, "<a-H>", "<c-w>H", {}}, {{"n", "i"}, "<a-J>", "<c-w>J", {}}, {{"n", "i"}, "<a-K>", "<c-w>K", {}}, {{"n", "i"}, "<a-L>", "<c-w>L", {}}, {{"n", "i"}, "<a-q>", "<c-w>q", {}}, {{"n", "i"}, "<a-w>", "<c-w>w", {}}, {{"n", "i"}, "<a-d>", "<c-w>w<c-d><c-w>w", {}}, {{"n", "i"}, "<a-u>", "<c-w>w<c-u><c-w>w", {}}, {{"t"}, "<a-h>", "<c-\\><c-n><c-w>h", {}}, {{"t"}, "<a-j>", "<c-\\><c-n><c-w>j", {}}, {{"t"}, "<a-k>", "<c-\\><c-n><c-w>k", {}}, {{"t"}, "<a-l>", "<c-\\><c-n><c-w>l", {}}, {{"t"}, "<a-q>", "<c-\\><c-n><c-w>q", {}}, {{"t"}, "<a-w>", "<c-\\><c-n><c-w>w", {}}, {{"t"}, "<a-n>", "<c-\\><c-n>", {}}, {{"n"}, "]b", ":bnext<CR>", {}}, {{"n"}, "[b", ":bprevious<CR>", {}}, {{"n"}, "]t", ":tabnext<CR>", {}}, {{"n"}, "[t", ":tabprevious<CR>", {}}, {{"n"}, "]q", ":cnext<CR>", {}}, {{"n"}, "[q", ":cprevious<CR>", {}}, {{"n"}, "]l", ":lnext<CR>", {}}, {{"n"}, "[l", ":lprevious<CR>", {}}, {{"n"}, "]w", "<c-w>w", {}}, {{"n"}, "[w", "<c-w>W", {}}, {{"n"}, "<leader>s", _32_, {}}, {{"n"}, "<leader>r", _34_, {}}, {{"n"}, "<leader>b", ":buffer ", {}}, {{"n"}, "<leader>p", ":Fd ", {}}, {{"n"}, "<leader>/", ":grep ", {}}, {{"i"}, "<C-j>", "<c-o>j", {}}, {{"i"}, "<C-k>", "<c-o>k", {}}, {{"i"}, "<C-l>", "<c-o>l", {}}, {{"i"}, "<C-h>", "<c-o>h", {}}, {{"n"}, "<leader>Bb", ":Bistro build<CR>", {}}, {{"n"}, "<leader>BB", ":Bistro reconfigure<CR>", {}}, {{"n"}, "<leader>Br", ":Bistro refresh<CR>", {}}, {{"n"}, "<leader>Bp", ":Bistro plugins<CR>", {}}, {{"n"}, "<leader>Bc", ":Bistro configure<CR>", {}}, {{"n"}, "<M-`>", ":FTermToggle<CR>", {}}, {{"t"}, "<M-`>", "<c-\\><c-n>:FTermToggle<CR>", {}}, {{"n"}, "<leader>e", ":Explore<CR>", {}}, {{"n"}, "<leader>v", ":Vifm<CR>", {}}, {{"n"}, "<leader>G", ":GV --all<CR>", {noremap = true, silent = true}}, {{"n"}, "<leader>ff", "<cmd>Telescope find_files<CR>", {}}, {{"n"}, "<c-p>", "<cmd>Telescope git_files<CR>", {}}, {{"n"}, "<leader>fb", "<cmd>Telescope buffers<CR>", {}}, {{"n"}, "<leader>fg", "<cmd>Telescope live_grep<CR>", {}}, {{"n"}, "<leader>fh", "<cmd>Telescope help_tags<CR>", {}}, {{"n"}, "<leader>fo", "<cmd>Telescope oldfiles<CR>", {}}, {{"n"}, "<leader>fr", "<cmd>Telescope registers<CR>", {}}, {{"n"}, "<leader>fq", "<cmd>Telescope quickfix<CR>", {}}, {{"n"}, "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", {}}, {{"n"}, "<leader>fD", "<cmd>Telescope diagnostics<CR>", {}}, {{"n"}, "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", {}}, {{"n"}, "<leader>gb", "<cmd>Telescope git_branches<CR>", {}}, {{"n"}, "<leader>gc", "<cmd>Telescope git_commits<CR>", {}}, {{"n"}, "<leader>gf", "<cmd>Telescope git_files<CR>", {}}, {{"n"}, "<leader>gs", "<cmd>Telescope git_status<CR>", {}}, {{"n"}, "<leader>gS", "<cmd>Telescope git_stash<CR>", {}}, {{"t"}, "<a-f>", "<c-\\><c-n> <cmd>Telescope find_files<CR>", {}}, {{"t"}, "<a-/>", "<c-\\><c-n> <cmd>Telescope live_grep<CR>", {}}, {{"n", "i"}, "<F5>", ":lua require'dap'.continue()<CR>", {}}, {{"n", "i"}, "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", {}}, {{"n", "i"}, "<F10>", ":lua require'dap'.step_over()<CR>", {}}, {{"n", "i"}, "<F11>", ":lua require'dap'.step_into()<CR>", {}}, {{"n", "i"}, "<F12>", ":lua require'dap'.step_out()<CR>", {}}, {{"n"}, "<F3>", ":lua require'dapui'.toggle()<CR>", {}}}, options = {autoindent = true, cmdheight = 2, completeopt = "menuone,noinsert,noselect", expandtab = true, grepformat = "%f:%l:%c:%m,%f:%l:%m", grepprg = "rg --vimgrep --no-heading --smart-case", hidden = true, ignorecase = true, laststatus = 3, mouse = "a", number = true, omnifunc = "syntaxcomplete#Complete", path = {"C:/Users/mwebb/AppData/Local/nvim/lua", "append"}, previewheight = 5, shiftwidth = 2, showcmd = false, showmode = false, signcolumn = "yes", splitbelow = true, splitright = true, tabstop = 2, termguicolors = true, updatetime = 300, wildignore = "obj/**,bin/**,node_modules/**,CMS/**"}, plugins = {"vim-scripts/utl.vim", "jiangmiao/auto-pairs", "kylechui/nvim-surround", "tpope/vim-commentary", "mattn/emmet-vim", "junegunn/vim-slash", "folke/which-key.nvim", "stevearc/dressing.nvim", "kyazdani42/nvim-web-devicons", "RRethy/nvim-base16", "numToStr/FTerm.nvim", {"vifm/vifm.vim", {on = "Vifm"}}, "junegunn/gv.vim", {on = "GV"}, "lewis6991/gitsigns.nvim", "sindrets/diffview.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig", "j-hui/fidget.nvim", "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "lifepillar/vim-mucomplete", "jlcrochet/vim-razor", "Hoffs/omnisharp-extended-lsp.nvim", {"bakpakin/fennel.vim", {["for"] = "fennel"}}}, setup = {_35_, _36_, _41_, _42_, _43_, _44_, configure_telescope, configure, _45_, _46_, _47_, _49_, _50_, _51_, configure_lsp, configure_deno}}
  return nil
end
return _1_