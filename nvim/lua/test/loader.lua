local h = {
  map = vim.api.nvim_set_keymap,
  command = vim.api.nvim_create_user_command,
  augroup = vim.api.nvim_create_augroup,
  autocmd = vim.api.nvim_create_autocmd,
  -- TODO: actual opt methods...
  set = function(self, key, val)
    vim.opt[key] = val
    return self
  end,
  on = function(self, key)
    vim.opt[key] = true
    return self
  end,
  off = function(self, key)
    vim.opt[key] = false
    return self
  end
}

-- local function get_default_confg()
--   return {
--     globals = {},
--     options = {},
--     keymaps = {},
--     autocmds = {},
--     commands = {},
--     plugins = {},
--     setup = {},
--   }
-- end



local M = {
  config = {
    modules = {}
  },
  current_module = {},

  module = function(self, name)
    for _, mod in ipairs(self.config) do
      if mod.name == name then
        self.current_module = mod
        return self
      end
    end

    self.current_module = { name = name, options = {} }
    table.insert(self.config.modules, self.current_module)
    return self
  end,

  option = function(self, optName)
    table.insert(self.current_module.options, optName)
    return self
  end

  options = function(self, ...)
    for _, opt in ipairs({...}) do
      self:option(opt)
    end

    return self
  end
}

-- Type checking
local fluid_meta = {
  __index = function(self, mod)
    return self:module(mod)
  end

  __mod = function(self, mod)
    return self:module(mod)
  end

  __add = function(self, opt)
    return self:option(opt)
  end
}

-- M.ui = {
--   then_with = M,
--   statusline = function(opts)
--     M.current_module = 'fluid_statusline'
--     M.config[M.current_module] = {
--       opts = opts
--     }
--     return M.ui
--   end
-- }


M.setup = function(self, config)
  for i, v in ipairs(config) do
    -- check type:
    --   string - just load one
    --   list of strings - load many
    --   list with setup member - load, then call setup function
    if (type(v) == 'string') then
      
    elseif (type(v) == 'table') then

    end
  end
end

-- M.package = function(pkg)
--   setmetatable(pkg, config_meta)
-- end

local config_meta = {
  __call = function(self, ...)
    local args = arg or {}
    table.insert(args, h)
    if self and self.setup then
      self.setup(unpack(args or {}))
    end

    return self
  end,
}

local meta = {
  __index = function(self, k)
    vim.cmd.packadd(k)
    local pkg = require(k)

    if not pkg then
      return function ()
        print('No package named ' .. k)
      end
    end

    local config = {
      package = pkg,
      setup = pkg.setup,
      option = function(optName)
        local opt = require(''..optName)

        if opt then
          print('option loaded')
        else
          print('could not load option')
        end
      end
    }

    setmetatable(config, config_meta)

    return config
  end
}

setmetatable(M, meta)


return M
