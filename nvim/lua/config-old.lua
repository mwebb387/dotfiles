local function mergeDict(d1, d2)
  for key in pairs(d2) do
    d1[key] = d2[key]
  end

  return d1
end

local function mapLength(m)
  local len = 0
  for key in pairs(m) do
    len = len + 1
  end

  return len
end

local theme = require('theme_config')

local M = {}

function M.configure(modules)
  local plugs = {}
  local configMethods = {}

  for i,v in ipairs(modules) do
    plugs = mergeDict(plugs, v.getPlugins())
    print('Length module plugs: ' .. mapLength(v.getPlugins()))
    configMethods[i] = v.configure
  end

  print('Length config methods: ' .. #configMethods)

  -- TODO: run vimplug cmds
  print('Length plugs: ' .. mapLength(plugs))
  if mapLength(plugs) > 0 then
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

M.configure{theme}
