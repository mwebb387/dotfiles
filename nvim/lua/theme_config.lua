local function colorscheme(scheme)
  vim.cmd('colorscheme ' .. scheme)
end

local themeModule = {}

function themeModule.getPlugins()
  local plugins = {
    ['tomasiser/vim-code-dark'] = false,
    ['ajmwagar/vim-deus'] = false,
    ['whatyouhide/vim-gotham'] = false,
    ['ntk148v/vim-horizon'] = false,
    ['ludokng/vim-odyssey'] = false,
    ['xdg/vim-darkluma'] = false,
    ['nanotech/jellybeans.vim'] = false 
  }

  return plugins
end

function themeModule.configure()
  -- Theme 
  vim.o.termguicolors = true
  colorscheme[[ deus ]]
end

return themeModule
