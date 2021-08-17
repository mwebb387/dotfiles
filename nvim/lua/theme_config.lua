-- Seed random generator
math.randomseed(os.time())

-- Local methods
local function colorscheme(scheme)
  vim.cmd('colorscheme ' .. scheme)
end

local function setRandomTheme()
  local allThemes = vim.api.nvim_eval([[
      uniq(sort(map(globpath(&runtimepath, "colors/*.vim", 0, 1), 'fnamemodify(v:val, ":t:r")')))
    ]])

  local randThemeIdx = math.random(#allThemes - 1)

  colorscheme(allThemes[randThemeIdx])
end

-- Module definition
local M = {}

function M.getPlugins()
  local plugins = {
    ['tomasiser/vim-code-dark'] = false,
    -- ['ajmwagar/vim-deus'] = false,
    ['theniceboy/nvim-deus'] = false,
    ['whatyouhide/vim-gotham'] = false,
    ['ntk148v/vim-horizon'] = false,
    ['ludokng/vim-odyssey'] = false,
    ['xdg/vim-darkluma'] = false,
    ['nanotech/jellybeans.vim'] = false,
    ['challenger-deep-theme/vim'] = false,
    ['maksimr/Lucius2'] = false,
    ['nightsense/cosmic_latte'] = false,
    ['Nequo/vim-allomancer'] = false,
    ['koirand/tokyo-metro.vim'] = false,
    ['folke/tokyonight.nvim'] = false,
    -- ['hzchirs/vim-material'] = false,
    ['marko-cerovac/material.nvim'] = false,
    ['arcticicestudio/nord-vim'] = false,
    ['nanotech/jellybeans.vim'] = false,
    ['NLKNguyen/papercolor-theme'] = false,
    ['AlessandroYorba/Arcadia'] = false,
    ['crater2150/vim-theme-chroma'] = false,
    ['bcicen/vim-vice'] = false,
    ['dracula/vim'] = false,
    ['sonjapeterson/1989.vim'] = false,
    ['vim-scripts/proton'] = false,
    ['junegunn/seoul256.vim'] = false,
    ['wojciechkepka/bogster'] = false,
  }

  return plugins
end

function M.randomTheme()
  setRandomTheme()
end

function M.configure(scheme)
  -- Theme
  vim.o.termguicolors = true

  if not scheme or scheme == '' then
    setRandomTheme()
  else
    colorscheme(scheme)
  end
end

return M
