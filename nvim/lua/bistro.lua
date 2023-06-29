local _local_1_ = require("util")
local concat = _local_1_["concat"]
local function anyMissingPlugins()
  return (vim.fn.len(vim.fn.filter(vim.fn.values(vim.g.plugs), "!isdirectory(v:val.dir)")) > 0)
end
local function pconfigure(config)
  local res, err = pcall(config)
  if not res then
    return print(err)
  else
    return nil
  end
end
local function addPlugins(self, plugins)
  return concat(self.plugins, plugins)
end
local function build(self)
  do
    local cmd = ("!" .. "powershell" .. " " .. "bistro-build.ps1")
    vim.cmd(cmd)
  end
  return self
end
local function editConfig(self)
  if (self.sourceDir == "") then
    print("Please set the Bistro source directory")
  else
    local configFile = (self.sourceDir .. "/configure.fnl")
    local cmd = ("edit " .. configFile)
    vim.cmd(cmd)
  end
  return self
end
local function editRecipe(self, name)
  if (self.sourceDir == "") then
    print("Please set the Bistro source directory")
  else
    local recipeFile = (self.sourceDir .. "/recipes/" .. name .. ".fnl")
    local cmd = ("edit " .. recipeFile)
    vim.cmd(cmd)
  end
  return self
end
local function loadPlugins(self, plugins)
  do
    local plug_path = (vim.fn.stdpath("config") .. "/plugged/")
    vim.fn["plug#begin"](plug_path)
    for _, plugin in ipairs((plugins or self.plugins)) do
      local _5_ = type(plugin)
      if (_5_ == "string") then
        vim.fn["plug#"](plugin)
      elseif (_5_ == "table") then
        local _let_6_ = plugin
        local repo = _let_6_[1]
        local options = _let_6_[2]
        vim.fn["plug#"](repo, options)
      else
      end
    end
    vim.fn["plug#end"]()
  end
  return self
end
local function refresh(self)
  package.loaded["configure"] = nil
  package.loaded["bistro"] = nil
  print("Cache cleared. Please re-require and run 'bistro:setup()'")
  return self
end
local function setupRecipes(self)
  if anyMissingPlugins() then
    print("Not all plugins are installed.")
    print("Run :PlugInstall first, then re-run :lua require'bistro':setupRecipes()")
  else
    for key, value in pairs(self.config.globals) do
      vim["g"][key] = value
    end
    for key, value in pairs(self.config.options) do
      vim["opt"][key] = value
    end
    for _, _8_ in ipairs(self.config.keymaps) do
      local _each_9_ = _8_
      local maps = _each_9_[1]
      local lhs = _each_9_[2]
      local rhs = _each_9_[3]
      local opts = _each_9_[4]
      vim.keymap.set(maps, lhs, rhs, opts)
    end
    do
      local grp = vim.api.nvim_create_augroup("BistroCmds", {clear = true})
      for _, _10_ in ipairs(self.config.autocmds) do
        local _each_11_ = _10_
        local event = _each_11_[1]
        local opts = _each_11_[2]
        opts["group"] = grp
        vim.api.nvim_create_autocmd(event, opts)
      end
    end
    for key, _12_ in pairs(self.config.commands) do
      local _each_13_ = _12_
      local cmd = _each_13_[1]
      local opts = _each_13_[2]
      vim.api.nvim_create_user_command(key, cmd, opts)
    end
    for _, setupFn in ipairs(self.config.setup) do
      pconfigure(setupFn)
    end
  end
  return self
end
local function setup(self)
  self:loadPlugins(self.config.plugins)
  self:setupRecipes()
  return self
end
local bistro = {configs = {}, plugins = {}, sourceDir = "", autoInstallPluginManager = true, syncPlugins = true, addPlugins = addPlugins, build = build, editRecipe = editRecipe, loadPlugins = loadPlugins, refresh = refresh, setup = setup, setupRecipes = setupRecipes}
require("configure")(bistro)
return bistro