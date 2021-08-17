local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local fi = require('galaxyline.provider_fileinfo')
local gls = gl.section

gl.short_line_list = {'NvimTree','nerdtree','tagbar','fugitive','vim-plug','vista','dbui','packer', 'qf', 'help'}

-- Set initial bg color based on current theme
local colors = require('galaxyline.theme').default
local slbg = vim.fn.synIDattr(vim.fn.hlID('CursorLine'), 'bg') 
colors.bg = slbg
vim.api.nvim_command('hi StatusLine cterm=NONE gui=NONE guibg=' .. slbg)

local leftCaps = {'', '', '', '', ''}
local rightCaps = {'', '', '', '', ''}

-- Get random end cap chars
local randCapIdx = math.random(#leftCaps - 1)
local leftCap = leftCaps[randCapIdx]
local rightCap = rightCaps[randCapIdx]

local function sectionEndLeft() return '   ' .. leftCap end
local function sectionEndRight() return rightCap .. '   ' end

gls.left = {
  {
    SectionCapLeft = {
      provider = sectionEndLeft,
      highlight = {colors.bg}
    },
  },

  {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                            [''] = colors.blue,V=colors.blue,
                            c = colors.magenta,no = colors.red,s = colors.orange,
                            S=colors.orange,[''] = colors.orange,
                            ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                            cv = colors.red,ce=colors.red, r = colors.cyan,
                            rm = colors.cyan, ['r?'] = colors.cyan,
                            ['!']  = colors.red,t = colors.red}
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
        return '['.. vim.fn.mode() .. ']  '
      end,
      highlight = {colors.red,colors.bg,'bold'},
    },
  },

  {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {fi.get_file_icon_color,colors.bg},
    },
  },

  {
    FileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.magenta,colors.bg,'bold'}
      -- highlight = 'Number'
      -- highlight = {colors.magenta,'bold'}
    }
  },

  {
    FileSize = {
      provider = 'FileSize',
      condition = condition.buffer_not_empty,
      highlight = {colors.fg,colors.bg}
    }
  },

  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = ' ',
      highlight = {colors.red,colors.bg}
    }
  },

  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = ' ',
      highlight = {colors.yellow,colors.bg},
    }
  },

  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = ' ',
      highlight = {colors.cyan,colors.bg},
    }
  },

  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = ' ',
      highlight = {colors.blue,colors.bg},
    }
  },
}


-- local function midCondition()
--   local tbl = {['dashboard'] = true,['']=true}
--   if tbl[vim.bo.filetype] then
--     return false
--   end
--   return true
-- end

gls.mid = {
  {
    ShowLspClient = {
      provider = 'GetLspClient',
      condition = midCondition,
      icon = '  ',
      highlight = {colors.cyan,colors.bg,'bold'}
    }
  },

  {
    GitBranch = {
      -- provider = 'GitBranch',
      provider = function()
        return vim.fn['fugitive#head']()
      end,
      icon = '  ',
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      condition = condition.check_git_workspace,
      highlight = {colors.violet,colors.bg,'bold'},
    }
  },

  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {colors.green,colors.bg},
    }
  },

  {
    DiffModified = {
      provider = 'DiffModified',
      condition = condition.hide_in_width,
      icon = ' 柳',
      highlight = {colors.orange,colors.bg},
    }
  },

  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {colors.red,colors.bg},
    }
  },

  -- {
  --   SectionCapRight = {
  --     provider = sectionEndRight,
  --     condition = condition.check_git_workspace,
  --     highlight = {colors.bg}
  --   },
  -- },
}


gls.right = {
  {
    FileEncode = {
      provider = 'FileEncode',
      condition = condition.hide_in_width,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.green,colors.bg,'bold'}
    }
  },

  {
    FileFormat = {
      provider = 'FileFormat',
      condition = condition.hide_in_width,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.green,colors.bg,'bold'}
    }
  },

  {
    LineInfo = {
      provider = 'LineColumn',
      separator = '  ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.fg,colors.bg},
    },
  },

  {
    PerCent = {
      provider = 'LinePercent',
      separator = '  ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.fg,colors.bg,'bold'},
    }
  },

  {
    SectionCapRight = {
      provider = sectionEndRight,
      highlight = {colors.bg}
    },
  },
}


-- Shortline
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}


--
-- Methods and module def for resetting the highlight based on current theme highlihts
--
local function resetHiForSection(sec, color)
  for _, obj in ipairs(sec) do
    for key, opt in pairs(obj) do

      -- Handle the section caps differently than the normal sections
      if key == 'SectionCapLeft' or key == 'SectionCapRight' then
        opt.highlight[1] = color
      else
        opt.highlight[2] = color

        -- Handle separator highlights
        if opt.separator_highlight then
          opt.separator_highlight[2] = color
        end
      end

    end
  end
end

local function resetHiForStatusLine(gl, color)
  vim.api.nvim_command('hi StatusLine cterm=NONE gui=NONE guibg=' .. color)

  resetHiForSection(gl.left, color)
  resetHiForSection(gl.mid, color)
  resetHiForSection(gl.right, color)

  resetHiForSection(gl.short_line_left, color)
  resetHiForSection(gl.short_line_right, color)
end

local M = {}
function M.resetHighlights()
  local bg = vim.fn.synIDattr(vim.fn.hlID('CursorLine'), 'bg') 
  resetHiForStatusLine(gls, bg)
end

return M
