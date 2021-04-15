local function mergeDict(d1, d2)
  for key in pairs(d2) do
    d1[key] = d2[key]
  end

  return d1
end

theme = require('theme_config')

local M = {}

function M.configure(...)
  local args = {...}
  print('Length: ' .. #args)
  local plugs = {}
  local configMethods = {}
  for i,v in ipairs(args) do
    plugs = mergeDict(plugs, v.getPlugins())
    configMethods[i] = v.configure
  end

  -- TODO: run vimplug cmds
  print('Length plugs: ' .. #plugs)
  if #plugs > 0 then
    print("call plug#begin(stdpath('config').'/plugged/');")
    for p,v in pairs(plugs) do
      print('Plug ' .. p)
    end
    print("call plug#end()")
  end

  -- TODO: run all configure() calls
end

-- return M

local temp = theme.getPlugins()
print('Length getPlugins: ' .. #temp)

M.configure(theme)
