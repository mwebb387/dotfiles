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
    local root = vim.fn.stdpath("config")
    local file = (root .. "/init.vim")
    local cmd = ("edit " .. file)
    return vim.cmd(cmd)
  end
  local function _9_(input)
    local _let_10_ = input
    local args = _let_10_["args"]
    local _let_11_ = require("util")
    local map = _let_11_["map"]
    local cmd = ("edit " .. args)
    return vim.cmd(cmd)
  end
  local function _12_(A, L, P)
    local cmd = ("fd " .. A)
    return vim.fn.systemlist(cmd)
  end
  local function _13_(input)
    local _let_14_ = input
    local args = _let_14_["args"]
    local _let_15_ = require("util")
    local map = _let_15_["map"]
    local cmd = ("fd " .. args)
    local function _16_(path)
      return {filename = path, lnum = 0}
    end
    vim.fn.setqflist(map(vim.fn.systemlist(cmd), _16_))
    return vim.cmd("copen")
  end
  local function _17_()
    return vim.cmd("!npx prettier --check %")
  end
  local function _18_()
    return vim.cmd("!npx prettier --check --write %")
  end
  local function _19_(input)
    local _let_20_ = input
    local args = _let_20_["args"]
    local cmd = ("try | saveas " .. input .. " | call delete(expand('#')) | bd # | endtry")
    return vim.cmd(cmd)
  end
  local function _21_(input)
    local findMaxRep
    local function _22_()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
      local contents = vim.fn.join(lines)
      local max = 1
      while string.find(contents, ("$" .. max)) do
        max = (1 + max)
      end
      return (max - 1)
    end
    findMaxRep = _22_
    local doReps
    local function _23_(maxReps)
      for i = 1, maxReps do
        local replace = vim.fn.input(("$" .. i .. "-> "))
        if (#replace > 0) then
          vim.cmd(("%s/$" .. i .. "/" .. replace))
        else
        end
      end
      return nil
    end
    doReps = _23_
    return doReps(findMaxRep())
  end
  local function _25_(input)
    local _let_26_ = input
    local args = _let_26_["args"]
    local home = vim.fn.expand("~")
    local templateRoot = "/.nvim-templates/"
    local template = (home .. templateRoot .. args)
    return vim.cmd(("r " .. template))
  end
  local function _27_(A, L, P)
    local _let_28_ = require("util")
    local map = _let_28_["map"]
    local home = vim.fn.expand("~")
    local templateRootGlob = "/.nvim-templates/*"
    local filesStr = vim.fn.glob((home .. templateRootGlob))
    local fileLst = vim.fn.split(filesStr, "\n")
    local fileNameLst
    local function _29_(path)
      return vim.fn.fnamemodify(path, ":t")
    end
    fileNameLst = map(fileLst, _29_)
    return fileNameLst
  end
  local function _30_()
    vim.o.spell = not vim.o.spell
    if vim.o.spell then
      return print("Spell ON")
    else
      return print("Spell OFF")
    end
  end
  local function _32_()
    vim.o.relativenumber = not vim.o.relativenumber
    return nil
  end
  local function _33_()
    local get_args
    local function _34_()
      local args = {}
      for i = 0, vim.fn.argc() do
        table.insert(args, vim.fn.argv(i))
      end
      return args
    end
    get_args = _34_
    local fzfOpts
    local function _35_(item)
      return vim.cmd(("argedit " .. item .. " | argdedupe"))
    end
    fzfOpts = {sink = _35_, source = get_args(), options = {"--preview", vim.g.fzf_bat_options, "--bind", "ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up"}}
    return vim.fn["fzf#run"](vim.fn["fzf#wrap"](fzfOpts))
  end
  bistro_12_auto["config"] = {autocmds = {}, commands = {Bistro = {_2_, {complete = _6_, nargs = 1}}, BrowseLua = {_7_, {}}, EditConfig = {_8_, {}}, Fd = {_9_, {complete = _12_, nargs = 1}}, FdList = {_13_, {nargs = 1}}, PrettierCheck = {_17_, {}}, PrettierWrite = {_18_, {}}, Rename = {_19_, {nargs = 1}}, TemplateExpand = {_21_, {}}, TemplateLoad = {_25_, {complete = _27_, nargs = 1}}}, globals = {}, keymaps = {{{"n"}, "H", "^", {}}, {{"n"}, "L", "$", {}}, {{"i"}, "jk", "<esc>", {}}, {{"n"}, "<c-tab>", ":b#<cr>", {}}, {{"n"}, "g<tab>", ":b#<cr>", {}}, {{"n"}, "<c-d>", "<c-d>zz", {}}, {{"n"}, "<c-u>", "<c-u>zz", {}}, {{"t"}, "<a-n>", "<c-\\><c-n>", {}}, {{"n"}, "]b", ":bnext<CR>", {}}, {{"n"}, "[b", ":bprevious<CR>", {}}, {{"n"}, "]t", ":tabnext<CR>", {}}, {{"n"}, "[t", ":tabprevious<CR>", {}}, {{"n"}, "]q", ":cnext<CR>", {}}, {{"n"}, "[q", ":cprevious<CR>", {}}, {{"n"}, "]l", ":lnext<CR>", {}}, {{"n"}, "[l", ":lprevious<CR>", {}}, {{"n"}, "]w", "<c-w>w", {}}, {{"n"}, "[w", "<c-w>W", {}}, {{"n"}, "<leader>s", _30_, {}}, {{"n"}, "<leader>r", _32_, {}}, {{"n"}, "<leader>p", ":Fd ", {}}, {{"n"}, "<leader>q", ":copen<CR>", {}}, {{"n"}, "<leader>Q", ":cclose<CR>", {}}, {{"n"}, "<leader>/", ":Rg ", {}}, {{"n"}, "|", "<c-w>v", {}}, {{"n"}, "-", "<c-w>s", {}}, {{"i"}, "<C-j>", "<c-o>j", {}}, {{"i"}, "<C-k>", "<c-o>k", {}}, {{"i"}, "<C-l>", "<c-o>l", {}}, {{"i"}, "<C-h>", "<c-o>h", {}}, {{"n"}, "<a-t>l", ":TemplateLoad ", {}}, {{"n"}, "<a-t>e", ":TemplateExpand ", {}}, {{"n"}, "<leader>aa", ":argadd | argdedupe<CR>", {silent = true}}, {{"n"}, "<leader>ad", ":argd<CR>", {silent = true}}, {{"n"}, "<leader>aD", ":%argd<CR>", {silent = true}}, {{"n"}, "<leader>al", ":arglocal<CR>", {silent = true}}, {{"n"}, "<leader>ag", ":argglobal", {silent = true}}, {{"n"}, "<leader>A", _33_, {}}, {{"n"}, "<leader>1", ":argument 1<CR>", {}}, {{"n"}, "<leader>2", ":argument 2<CR>", {}}, {{"n"}, "<leader>3", ":argument 3<CR>", {}}, {{"n"}, "<leader>4", ":argument 4<CR>", {}}, {{"n"}, "<leader>5", ":argument 5<CR>", {}}, {{"n"}, "<leader>6", ":argument 6<CR>", {}}, {{"n"}, "<leader>7", ":argument 7<CR>", {}}, {{"n"}, "<leader>8", ":argument 8<CR>", {}}, {{"n"}, "<leader>9", ":argument 9<CR>", {}}, {{"n"}, "<leader>0", ":argument 10<CR>", {}}, {{"n"}, "<leader>Bb", ":Bistro build<CR>", {}}, {{"n"}, "<leader>BB", ":Bistro reconfigure<CR>", {}}, {{"n"}, "<leader>Br", ":Bistro refresh<CR>", {}}, {{"n"}, "<leader>Bp", ":Bistro plugins<CR>", {}}, {{"n"}, "<leader>Bc", ":Bistro configure<CR>", {}}}, options = {}, plugins = {"vim-scripts/utl.vim"}, setup = {}}
  return nil
end
return _1_