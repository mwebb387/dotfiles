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
  local function _32_(input)
    local findMaxRep
    local function _33_()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
      local contents = vim.fn.join(lines)
      local max = 1
      while string.find(contents, ("$" .. max)) do
        max = (1 + max)
      end
      return (max - 1)
    end
    findMaxRep = _33_
    local doReps
    local function _34_(maxReps)
      for i = 1, maxReps do
        local replace = vim.fn.input(("$" .. i .. "-> "))
        if (#replace > 0) then
          vim.cmd(("%s/$" .. i .. "/" .. replace))
        else
        end
      end
      return nil
    end
    doReps = _34_
    return doReps(findMaxRep())
  end
  local function _36_(input)
    local _let_37_ = input
    local args = _let_37_["args"]
    local home = vim.fn.expand("~")
    local templateRoot = "/.nvim-templates/"
    local template = (home .. templateRoot .. args)
    return vim.cmd(("r " .. template))
  end
  local function _38_(A, L, P)
    local _let_39_ = require("util")
    local map = _let_39_["map"]
    local home = vim.fn.expand("~")
    local templateRootGlob = "/.nvim-templates/*"
    local filesStr = vim.fn.glob((home .. templateRootGlob))
    local fileLst = vim.fn.split(filesStr, "\n")
    local fileNameLst
    local function _40_(path)
      return vim.fn.fnamemodify(path, ":t")
    end
    fileNameLst = map(fileLst, _40_)
    return fileNameLst
  end
  local function _41_()
    vim.o.spell = not vim.o.spell
    if vim.o.spell then
      return print("Spell ON")
    else
      return print("Spell OFF")
    end
  end
  local function _43_()
    vim.o.relativenumber = not vim.o.relativenumber
    return nil
  end
  local function _44_()
    local get_args
    local function _45_()
      local args = {}
      for i = 0, vim.fn.argc() do
        table.insert(args, vim.fn.argv(i))
      end
      return args
    end
    get_args = _45_
    local fzfOpts
    local function _46_(item)
      return vim.cmd(("argedit " .. item .. " | argdedupe"))
    end
    fzfOpts = {sink = _46_, source = get_args(), options = {"--preview", vim.g.fzf_bat_options, "--bind", "ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up"}}
    return vim.fn["fzf#run"](vim.fn["fzf#wrap"](fzfOpts))
  end
  local function _47_()
    local fzfOpts = {sink = "e", options = {"--preview", vim.g.fzf_bat_options, "--bind", "ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up"}}
    return vim.fn["fzf#run"](vim.fn["fzf#wrap"](fzfOpts))
  end
  local function _48_()
    local wk = require("which-key")
    local hop = require("hop")
    local surround = require("nvim-surround")
    wk.setup()
    hop.setup()
    return surround.setup()
  end
  local function _49_()
    local function _50_()
      if (vim.b.gitsigns_head and not (vim.b.gitsigns_head == "")) then
        return ("\238\156\165 " .. vim.b.gitsigns_head)
      else
        return ""
      end
    end
    SLGitBranch = _50_
    local function _52_()
      local clients = vim.lsp.buf_get_clients()
      if (clients and (#clients > 0)) then
        local disp = "\239\130\133 "
        for k, c in pairs(clients) do
          disp = (disp .. c.name)
        end
        return disp
      else
        return ""
      end
    end
    SLLSPServer = _52_
    local sl = require("statusline-util")
    do end (vim.opt)["statusline"] = (sl.highlight("String") .. sl.truncate() .. "  " .. sl.filename_tail() .. " " .. sl.highlight_group("Constant", sl.filetype(), sl.flag_preview(), sl.flag_quickfix(), sl.flag_modified(), sl.flag_readonly()) .. sl.separator() .. sl.highlight_group("Identifier", sl.eval_lua("SLGitBranch")) .. " " .. sl.highlight_group("Statement", sl.eval_lua("SLLSPServer")) .. sl.separator() .. sl.highlight("Type") .. "%-14.(" .. sl.current_line() .. ":" .. sl.current_column() .. "%)" .. "%-4.(" .. sl.visible_percent() .. "%)" .. "  ")
    return nil
  end
  local function _54_()
    local sl = require("statusline-util")
    do end (vim.opt)["winbar"] = sl.highlight_group("User2", sl.filename_relative(), " [", sl.buffer_number(), "] ")
    return nil
  end
  local function _55_()
    return vim.cmd(("colorscheme " .. "base16-catppuccin"))
  end
  local function _56_()
    local fterm = require("FTerm")
    return fterm.setup({cmd = "powershell"})
  end
  local function _57_()
    return (require("image")).setup()
  end
  local function _58_()
    return (require("gitsigns")).setup()
  end
  local function configure()
    local ts = require("nvim-treesitter.configs")
    return ts.setup({ensure_installed = {"c_sharp", "fennel", "javascript", "typescript", "svelte", "css", "scss", "tsx"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}}, indent = {enable = true}})
  end
  local function _59_()
    vim.cmd("highlight DiagnosticsError guifg=Red")
    vim.cmd("highlight DiagnosticUnderlineError guisp=Red cterm=underline gui=underline guifg=Red")
    vim.cmd("sign define DiagnosticSignError text=\239\153\150 texthl=DiagnosticSignError")
    vim.cmd("highlight DiagnosticWarning guifg=Orange")
    vim.cmd("highlight DiagnosticUnderlineWarning guisp=Orange cterm=underline gui=underline guifg=Orange")
    vim.cmd("sign define DiagnosticSignWarn text=\239\148\165 texthl=DiagnosticSignWarn")
    vim.cmd("highlight DiagnosticInfomation guifg=LightBlue")
    vim.cmd("highlight DiagnosticUnderlineInformation guisp=LightBlue cterm=underline gui=underline guifg=LightBlue")
    vim.cmd("sign define DiagnosticSignInfo text=\239\159\187 texthl=LspDiagnosticSignInfo")
    vim.cmd("highlight DiagnosticHint guifg=LightGrey")
    vim.cmd("highlight DiagnosticUnderlineHint guisp=LightGrey cterm=underline gui=underline guifg=LightGrey")
    return vim.cmd("sign define DiagnosticSignHint text=\239\180\149 texthl=DiagnosticSignHint")
  end
  local function _60_()
    return (require("aerial")).setup()
  end
  local function _61_()
    return (require("dapui")).setup()
  end
  local function _62_()
    local home = vim.fn.expand("~")
    local exe = (home .. "\\scoop\\apps\\netcoredbg\\current\\netcoredbg.exe")
    local dllpath = (vim.fn.getcwd() .. "\\bin\\Debug")
    local dap = require("dap")
    do end (dap)["adapters"]["netcoredbg"] = {type = "executable", command = exe, args = {"--interpreter=vscode"}}
    local function _63_()
      return vim.fn.input("Path to DLL: ", dllpath, "file")
    end
    dap["configurations"]["cs"] = {{type = "netcoredbg", name = "launch - netcoredbg", request = "launch", program = _63_}}
    return nil
  end
  local function _64_()
    local home = vim.fn.expand("~")
    local scriptPath = (home .. "\\.dap\\vscode-node-debug2\\out\\src\\nodeDebug.js")
    local config = {type = "node2", name = "Launch", request = "launch", args = {"--inspect", "${file}"}, cwd = vim.fn.getcwd(), envFile = (vim.fn.getcwd() .. "\\.env"), runtimeArgs = {"-r", "ts-node/register"}, runtimeExecutable = "node", skipFiles = {"<node_internals>/**", "node_modules/**"}, ["sourceMaps:"] = true}
    local dap = require("dap")
    do end (dap)["adapters"]["node2"] = {type = "executable", command = "node", args = {scriptPath}}
    dap["configurations"]["typescript"] = {config}
    return nil
  end
  local function configure_cmp()
    local cmp = require("cmp")
    local mapping = cmp.mapping.preset.insert({["<C-u>"] = cmp.mapping.scroll_docs(-4), ["<C-d>"] = cmp.mapping.scroll_docs(4), ["<A-o>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = true})})
    local sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "vsnip"}, {name = "path"}}, {{name = "buffer"}})
    local function _65_(args)
      return vim.fn["vsnip#anonymous"](args.body)
    end
    return cmp.setup({snippet = {expand = _65_}, mapping = mapping, sources = sources})
  end
  local function _66_()
    vim.cmd(("augroup " .. "chsarp-settings"))
    vim.cmd("autocmd!")
    do
      vim.cmd("autocmd filetype cs,cshtml compiler msbuild")
    end
    return vim.cmd("augroup END")
  end
  local function _67_()
    local _let_68_ = require("lsp")
    local on_attach = _let_68_["on-attach"]
    local pid = vim.fn.getpid()
    local home = vim.fn.expand("~")
    local cs_handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false}), ["textDocument/definition"] = (require("omnisharp_extended")).handler}
    local omnisharp_bin = "omnisharp.exe"
    local omnisharp_lsp = require("lspconfig")
    local cmp = require("cmp_nvim_lsp")
    local omnisharp_cmd = {omnisharp_bin}
    return omnisharp_lsp.omnisharp.setup({cmd = {omnisharp_bin}, capabilities = cmp.default_capabilities(), enable_roslyn_analyzers = true, on_attach = on_attach, handlers = cs_handlers})
  end
  local function configure_lsp()
    local lspconfig = require("lspconfig")
    local _let_69_ = require("lsp")
    local on_attach = _let_69_["on-attach"]
    return lspconfig.tsserver.setup({on_attach = on_attach})
  end
  local function configure_deno()
    local lspconfig = require("lspconfig")
    local _let_70_ = require("lsp")
    local on_attach = _let_70_["on-attach"]
    return lspconfig.denols.setup({on_attach = on_attach, root_dir = lspconfig.util.root_pattern({"deno.json", "deno.jsonp"}), autostart = false})
  end
  bistro_12_auto["config"] = {autocmds = {}, commands = {Bistro = {_2_, {complete = _6_, nargs = 1}}, BrowseLua = {_7_, {}}, DotnetWatchDev = {_8_, {}}, EditConfig = {_9_, {}}, FTermToggle = {_10_, {}}, Fd = {_11_, {complete = _14_, nargs = 1}}, FdList = {_15_, {nargs = 1}}, Mk = {_19_, {nargs = "?"}}, NextTerminal = {_21_, {}}, NpmRun = {_25_, {}}, NpmStart = {_26_, {}}, Powershell = {_27_, {}}, PrettierCheck = {_28_, {}}, PrettierWrite = {_29_, {}}, Rg = {_30_, {nargs = 1}}, TemplateExpand = {_32_, {}}, TemplateLoad = {_36_, {complete = _38_, nargs = 1}}}, globals = {fzf_bat_options = "bat --color always --style changes --theme Coldark-Dark -m *.fnl:Lisp {}", user_emmet_leader_key = "<A-y>"}, keymaps = {{{"n"}, "H", "^", {}}, {{"n"}, "L", "$", {}}, {{"i"}, "jk", "<esc>", {}}, {{"n"}, "<c-tab>", ":b#<cr>", {}}, {{"n"}, "g<tab>", ":b#<cr>", {}}, {{"t"}, "<a-n>", "<c-\\><c-n>", {}}, {{"n"}, "]b", ":bnext<CR>", {}}, {{"n"}, "[b", ":bprevious<CR>", {}}, {{"n"}, "]t", ":tabnext<CR>", {}}, {{"n"}, "[t", ":tabprevious<CR>", {}}, {{"n"}, "]q", ":cnext<CR>", {}}, {{"n"}, "[q", ":cprevious<CR>", {}}, {{"n"}, "]l", ":lnext<CR>", {}}, {{"n"}, "[l", ":lprevious<CR>", {}}, {{"n"}, "]w", "<c-w>w", {}}, {{"n"}, "[w", "<c-w>W", {}}, {{"n"}, "<leader>s", _41_, {}}, {{"n"}, "<leader>r", _43_, {}}, {{"n"}, "<leader>b", ":buffer ", {}}, {{"n"}, "<leader>p", ":Fd ", {}}, {{"n"}, "<leader>q", ":copen<CR>", {}}, {{"n"}, "<c-p>", ":FdList ", {}}, {{"n"}, "<c-h>", ":HopChar1MW<CR>", {}}, {{"n"}, "<leader>/", ":Rg ", {}}, {{"i"}, "<C-j>", "<c-o>j", {}}, {{"i"}, "<C-k>", "<c-o>k", {}}, {{"i"}, "<C-l>", "<c-o>l", {}}, {{"i"}, "<C-h>", "<c-o>h", {}}, {{"i"}, "<C-@>", "<c-x><c-o>", {}}, {{"n"}, "<a-t>l", ":TemplateLoad ", {}}, {{"n"}, "<a-t>e", ":TemplateExpand ", {}}, {{"n"}, "<leader>aa", ":argadd | argdedupe<CR>", {silent = true}}, {{"n"}, "<leader>ad", ":argd<CR>", {silent = true}}, {{"n"}, "<leader>aD", ":%argd<CR>", {silent = true}}, {{"n"}, "<leader>al", ":arglocal<CR>", {silent = true}}, {{"n"}, "<leader>ag", ":argglobal", {silent = true}}, {{"n"}, "<leader>A", _44_, {}}, {{"n"}, "<leader>1", ":argument 1<CR>", {}}, {{"n"}, "<leader>2", ":argument 2<CR>", {}}, {{"n"}, "<leader>3", ":argument 3<CR>", {}}, {{"n"}, "<leader>4", ":argument 4<CR>", {}}, {{"n"}, "<leader>5", ":argument 5<CR>", {}}, {{"n"}, "<leader>6", ":argument 6<CR>", {}}, {{"n"}, "<leader>7", ":argument 7<CR>", {}}, {{"n"}, "<leader>8", ":argument 8<CR>", {}}, {{"n"}, "<leader>9", ":argument 9<CR>", {}}, {{"n"}, "<leader>0", ":argument 10<CR>", {}}, {{"n"}, "<leader>Bb", ":Bistro build<CR>", {}}, {{"n"}, "<leader>BB", ":Bistro reconfigure<CR>", {}}, {{"n"}, "<leader>Br", ":Bistro refresh<CR>", {}}, {{"n"}, "<leader>Bp", ":Bistro plugins<CR>", {}}, {{"n"}, "<leader>Bc", ":Bistro configure<CR>", {}}, {{"n"}, "<M-`>", ":FTermToggle<CR>", {}}, {{"t"}, "<M-`>", "<c-\\><c-n>:FTermToggle<CR>", {}}, {{"n"}, "<leader>e", ":Explore<CR>", {}}, {{"n"}, "<c-p>", _47_, {}}, {{"n", "i"}, "<F5>", ":lua require'dap'.continue()<CR>", {}}, {{"n", "i"}, "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", {}}, {{"n", "i"}, "<F10>", ":lua require'dap'.step_over()<CR>", {}}, {{"n", "i"}, "<F11>", ":lua require'dap'.step_into()<CR>", {}}, {{"n", "i"}, "<F12>", ":lua require'dap'.step_out()<CR>", {}}, {{"n"}, "<F3>", ":lua require'dapui'.toggle()<CR>", {}}}, options = {autoindent = true, cmdheight = 2, completeopt = "menuone,noinsert,noselect", expandtab = true, grepformat = "%f:%l:%c:%m,%f:%l:%m", grepprg = "rg --vimgrep --no-heading --smart-case", hidden = true, ignorecase = true, laststatus = 3, mouse = "a", number = true, omnifunc = "syntaxcomplete#Complete", path = {"C:/Users/mwebb/AppData/Local/nvim/lua", "append"}, previewheight = 5, shiftwidth = 2, showcmd = false, showmode = false, signcolumn = "yes", splitbelow = true, splitright = true, tabstop = 2, termguicolors = true, updatetime = 300, wildignore = "obj/**,bin/**,node_modules/**,CMS/**"}, plugins = {"vim-scripts/utl.vim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "jiangmiao/auto-pairs", "mbbill/undotree", "kylechui/nvim-surround", "tpope/vim-commentary", "mattn/emmet-vim", "junegunn/vim-slash", "folke/which-key.nvim", "stevearc/dressing.nvim", "kyazdani42/nvim-web-devicons", "kevinhwang91/nvim-bqf", "phaazon/hop.nvim", "RRethy/nvim-base16", "numToStr/FTerm.nvim", "samodostal/image.nvim", "lewis6991/gitsigns.nvim", "sindrets/diffview.nvim", "junegunn/fzf", "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig", "stevearc/aerial.nvim", "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/nvim-cmp", "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip", "rafamadriz/friendly-snippets", "jlcrochet/vim-razor", "Hoffs/omnisharp-extended-lsp.nvim", {"bakpakin/fennel.vim", {["for"] = "fennel"}}}, setup = {_48_, _49_, _54_, _55_, _56_, _57_, _58_, configure, _59_, _60_, _61_, _62_, _64_, configure_cmp, _66_, _67_, configure_lsp, configure_deno}}
  return nil
end
return _1_