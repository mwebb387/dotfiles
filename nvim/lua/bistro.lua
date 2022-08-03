local _local_0_ = require("util")
local concat = _local_0_["concat"]
local function anyMissingPlugins()
  return (vim.fn.len(vim.fn.filter(vim.fn.values(vim.g.plugs), "!isdirectory(v:val.dir)")) > 0)
end
local function pconfigure(config)
  local res, err = pcall(config)
  if not res then
    return print(err)
  end
end
local function addPlugins(self, plugins)
  return concat(self.plugins, plugins)
end
local function build(self)
  if (self.sourceDir == "") then
    print("Please set the Bistro source directory")
  else
    local buildScript = (self.sourceDir .. "../build.fnl")
    local buildDir = (vim.fn.stdpath("config") .. "/" .. "lua" .. "/")
    local cmd = ("!" .. "fennel" .. " " .. buildScript .. " " .. self.sourceDir .. " " .. buildDir)
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
      local _0_ = type(plugin)
      if (_0_ == "string") then
        vim.fn["plug#"](plugin)
      elseif (_0_ == "table") then
        local _let_0_ = plugin
        local repo = _let_0_[1]
        local options = _let_0_[2]
        vim.fn["plug#"](repo, options)
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
    for _, _0_ in ipairs(self.config.keymaps) do
      local _each_0_ = _0_
      local maps = _each_0_[1]
      local lhs = _each_0_[2]
      local rhs = _each_0_[3]
      local opts = _each_0_[4]
      vim.keymap.set(maps, lhs, rhs, opts)
    end
    for key, _0_ in pairs(self.config.commands) do
      local _each_0_ = _0_
      local cmd = _each_0_[1]
      local opts = _each_0_[2]
      vim.api.nvim_create_user_command(key, cmd, opts)
    end
    for _, setupFn in ipairs(self.config.setup) do
      setupFn()
    end
  end
  return self
end
local function setup(self)
  self:loadPlugins(self.config.plugins)
  self:setupRecipes()
  return self
end
local bistro = {addPlugins = addPlugins, autoInstallPluginManager = true, build = build, configs = {}, editRecipe = editRecipe, loadPlugins = loadPlugins, plugins = {}, refresh = refresh, setup = setup, setupRecipes = setupRecipes, sourceDir = "C:\\Users\\mwebb\\fennel\\src\\", syncPlugins = true}
require("configure")(bistro)
return bistro