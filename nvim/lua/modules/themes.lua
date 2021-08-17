math.randomseed(os.time())
local all_themes = vim.api.nvim_eval("uniq(sort(map(globpath(&runtimepath, \"colors/*.vim\", 0, 1), 'fnamemodify(v:val, \":t:r\")')))")
local function colorscheme(theme)
  print(tostring(theme))
  return vim.cmd(("colorscheme " .. theme))
end
local function set_random_theme()
  local rand_theme_idx = math.random((#all_themes - 1))
  return colorscheme(all_themes[rand_theme_idx])
end
local function plugins()
  return {"tomasiser/vim-code-dark", "theniceboy/nvim-deus", "whatyouhide/vim-gotham", "ntk148v/vim-horizon", "ludokng/vim-odyssey", "xdg/vim-darkluma", "maksimr/Lucius2", "nightsense/cosmic_latte", "Nequo/vim-allomancer", "folke/tokyonight.nvim", "marko-cerovac/material.nvim", "arcticicestudio/nord-vim", "nanotech/jellybeans.vim", "NLKNguyen/papercolor-theme", "AlessandroYorba/Arcadia", "crater2150/vim-theme-chroma", "bcicen/vim-vice", "dracula/vim", "vim-scripts/proton", "junegunn/seoul256.vim", "wojciechkepka/bogster"}
end
local function configure(theme)
  vim.opt["termguicolors"] = true
  if not theme then
    return set_random_theme()
  else
    return colorscheme(theme)
  end
end
return {configure = configure, plugins = plugins}