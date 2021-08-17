local module_table_0_ = {configs = {}, plugins = {}}
do
  local _0_ = module_table_0_
  do
    local module_0_ = require(("modules." .. "default"))
    for __0_, plugin_0_ in ipairs(module_0_.plugins()) do
      table.insert((_0_).plugins, plugin_0_)
    end
    local function _1_()
      return module_0_.configure()
    end
    table.insert((_0_).configs, _1_)
  end
  local module_0_ = require(("modules." .. "themes"))
  for __0_, plugin_0_ in ipairs(module_0_.plugins("tokyonight")) do
    table.insert((_0_).plugins, plugin_0_)
  end
  local function _1_()
    return module_0_.configure("tokyonight")
  end
  table.insert((_0_).configs, _1_)
end
vim.cmd("call plug#begin(stdpath('config').'/plugged/')")
for __0_, plugin_0_ in ipairs(module_table_0_.plugins) do
  vim.cmd(("Plug '" .. plugin_0_ .. "'"))
end
vim.cmd("call plug#end()")
for __0_, config_0_ in ipairs(module_table_0_.configs) do
  config_0_()
end
return nil