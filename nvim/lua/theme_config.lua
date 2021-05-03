local function colorscheme(scheme)
  vim.cmd('colorscheme ' .. scheme)
end

local themeModule = {}
-- themeModule.__index = themeModule

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

function themeModule.setRandomTheme()
  local allThemes = vim.api.nvim_eval([[
      uniq(sort(map(globpath(&runtimepath, "colors/*.vim", 0, 1), 'fnamemodify(v:val, ":t:r")')))
    ]])
  
  math.randomseed(os.time())
  local randThemeIdx = math.random(#allThemes - 1)

  colorscheme(allThemes[randThemeIdx])
end

function themeModule:configure()
  -- Theme 
  vim.o.termguicolors = true
  -- colorscheme[[ deus ]]
  self.setRandomTheme()
end

return themeModule
