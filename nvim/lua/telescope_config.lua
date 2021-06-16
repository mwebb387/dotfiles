local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-h>"] = actions.move_to_top,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-l>"] = actions.move_to_bottom,
      },
    },
    prompt_position = "bottom",
    prompt_prefix = " ",
    selection_caret = " "
  }
}
